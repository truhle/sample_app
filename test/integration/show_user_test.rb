require 'test_helper'

class ShowUserTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @other_user = users(:archer)
  end

  test "shows a user who is activated" do
    log_in_as @user
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'h1', text: 'Michael Example'
  end

  test "does not show a user who is not activated" do
    log_in_as @user
    @other_user.toggle!(:activated)
    get user_path(@other_user)
    assert_redirected_to root_url
  end
end
