# - Check for the presence of IGRAPH
#
# The following variables are set when IGRAPH is found:
#  HAVE_IGRAPH       = Set to true, if all components of IGRAPH
#                          have been found.
#  IGRAPH_INCLUDES   = Include path for the header files of IGRAPH
#  IGRAPH_LIBRARIES  = Link these to use IGRAPH

## -----------------------------------------------------------------------------
## Check for the header files

find_path (IGRAPH_INCLUDES igraph.h
  PATHS ${CMAKE_EXTRA_INCLUDES} PATH_SUFFIXES igraph/ igraph/include NO_DEFAULT_PATH
  )
if(NOT IGRAPH_INCLUDES)
    find_path (IGRAPH_INCLUDES igraph.h
      PATHS /usr/local/include /usr/include /include /sw/include /usr/lib /usr/lib64 /usr/lib/x86_64-linux-gnu/ ${CMAKE_EXTRA_INCLUDES} PATH_SUFFIXES igraph/ igraph/include
      )
endif(NOT IGRAPH_INCLUDES)

## -----------------------------------------------------------------------------
## Check for the library

find_library (IGRAPH_LIBRARIES NAMES igraph
  PATHS ${CMAKE_EXTRA_LIBRARIES} PATH_SUFFIXES igraph/ NO_DEFAULT_PATH
  )
if(NOT IGRAPH_LIBRARIES)
    find_library (IGRAPH_LIBRARIES NAMES igraph
      PATHS /usr/local/lib /usr/lib /lib /sw/lib ${CMAKE_EXTRA_LIBRARIES} PATH_SUFFIXES igraph/
      )
endif(NOT IGRAPH_LIBRARIES)

## -----------------------------------------------------------------------------
## Actions taken when all components have been found

if (IGRAPH_INCLUDES AND IGRAPH_LIBRARIES)
  set (HAVE_IGRAPH TRUE)
else (IGRAPH_INCLUDES AND IGRAPH_LIBRARIES)
  if (NOT IGRAPH_FIND_QUIETLY)
    if (NOT IGRAPH_INCLUDES)
      message (STATUS "Unable to find IGRAPH header files!")
    endif (NOT IGRAPH_INCLUDES)
    if (NOT IGRAPH_LIBRARIES)
      message (STATUS "Unable to find IGRAPH library files!")
    endif (NOT IGRAPH_LIBRARIES)
  endif (NOT IGRAPH_FIND_QUIETLY)
endif (IGRAPH_INCLUDES AND IGRAPH_LIBRARIES)

if (HAVE_IGRAPH)
  if (NOT IGRAPH_FIND_QUIETLY)
    message (STATUS "Found components for IGRAPH")
    message (STATUS "IGRAPH_INCLUDES = ${IGRAPH_INCLUDES}")
    message (STATUS "IGRAPH_LIBRARIES = ${IGRAPH_LIBRARIES}")
  endif (NOT IGRAPH_FIND_QUIETLY)
else (HAVE_IGRAPH)
  if (IGRAPH_FIND_REQUIRED)
    message (FATAL_ERROR "Could not find IGRAPH!")
  endif (IGRAPH_FIND_REQUIRED)
endif (HAVE_IGRAPH)

mark_as_advanced (
  HAVE_IGRAPH
  IGRAPH_LIBRARIES
  IGRAPH_INCLUDES
  )
