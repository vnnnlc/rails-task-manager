class TasksController < ApplicationController
  # before_action :set_restaurant, only: [:edit, :update, :destroy, :show]

  # def set_restaurant
  #   @restaurant = Restaurant.find(params[:id])
  # end

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params_permitted)
    @task.save

    redirect_to @task # ???
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params_permitted)

    redirect_to @task
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  def task_params_permitted
    params.require(:task).permit(:title, :description, :deadline, :status)
  end
end



