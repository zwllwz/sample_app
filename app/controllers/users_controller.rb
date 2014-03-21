class UsersController < ApplicationController
  def new
    @user = User.new
  end
  

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample app!"
      #Rails knows that @user is an active record object, 
      #so it interprets that as knowing you want to go to 
      #the show page for the object.
      redirect_to @user 
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, 
                                    :password_confirmation)
    end
end
