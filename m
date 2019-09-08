Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 605FB7E26B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Sep 2019 13:10:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46RBVc2NWXzT3
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Sep 2019 15:10:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567948232;
	bh=wtQUt1Q/OX0Def4MB709y/DqmoKtbDFfZAPOoEmjfy8=;
	h=From:To:Subject:Date:From;
	b=doL5e7MkyOSYmvp74iXuf+c/DqZaVecepvC/zeqUwsOoMPRkBfdMjLVsvB0jMoR5f
	sSuLEI/fnd/Lv0BLe36D7IWGPvHUGfBXdFVzRk+2cRGQXXvkV6B8z6MTkCpGT8eKS6
	xvulMZq7M552vg18AkqTSSQggLSZtt0G/EICF/KiRAKn3vLVV3W8EyWRwzYLTPZo4s
	J4yvCSoJnSJ+zRDoLBGSXTXxESQDWAWZnVpnlNJNjrftIn187y37rbzTAdQElyZiHC
	chTHn5mqQHdbGZjtLxohZ9NJo85qssbqxAuykXsqsEehh8CZGFfNkMHw6ajwIONLXa
	gm+w17lxyXNKGSd4APtRypJca1/WHl8dPGD9F7bwCLNHRIprRn2iR0KvJ9Qz+UOZqQ
	og73n9lIz6IqWGR/oa1cFhVwdOmsNJLoRS6jRuJJj2DqqE7hGTsrAgMnIHfsHczPlI
	Wf4QIBDskh9hJAISYGwFycsUsRioqxs9KsWfWs88gOAMZ1VL5wPr40Q/iC5wXzDaXI
	78/19vtE/sTmrW9khP2tXBkAT648lIY6GveT/1gxf4+USFMRJkbZJ+EKaxx46Uiazl
	dAZcLapvGmilcbDikNtc+feDSOg7zxNwM6ytKNYd3puC+aJF6Ilpu5ibpRXPxmP5DM
	+x3n22G2P+vd13mIaZjYUA/k=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 Sep 2019 16:10:31 +0300
Message-Id: <20190908131031.6432-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] librcf: Remove, PNBLACKLIST since April 2018
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 08 Sep 2019 13:10:33 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../librcf/0001-Add-CMake-build-files.patch   | 302 ------------------
 .../0001-Check-for-__powerpc__-define.patch   |  28 --
 ...Stub.hpp-fix-a-clang-compiling-issue.patch |  35 --
 .../librcf/librcf/aarch64-support.patch       |  13 -
 .../librcf/librcf/mips-support.patch          |  19 --
 .../recipes-devtools/librcf/librcf_2.2.0.0.bb |  53 ---
 6 files changed, 450 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/librcf/librcf/0001-Add-CMake-build-files.patch
 delete mode 100644 meta-oe/recipes-devtools/librcf/librcf/0001-Check-for-__powerpc__-define.patch
 delete mode 100644 meta-oe/recipes-devtools/librcf/librcf/0001-ClientStub.hpp-fix-a-clang-compiling-issue.patch
 delete mode 100644 meta-oe/recipes-devtools/librcf/librcf/aarch64-support.patch
 delete mode 100644 meta-oe/recipes-devtools/librcf/librcf/mips-support.patch
 delete mode 100644 meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb

diff --git a/meta-oe/recipes-devtools/librcf/librcf/0001-Add-CMake-build-files.patch b/meta-oe/recipes-devtools/librcf/librcf/0001-Add-CMake-build-files.patch
deleted file mode 100644
index 560c3a6d7..000000000
--- a/meta-oe/recipes-devtools/librcf/librcf/0001-Add-CMake-build-files.patch
+++ /dev/null
@@ -1,302 +0,0 @@
-From 613297214d78ee10111e74e90e025166ebbcad9f Mon Sep 17 00:00:00 2001
-From: Peter Liu <peter.x.liu@external.atlascopco.com>
-Date: Sun, 5 Mar 2017 16:15:40 +0100
-Subject: [PATCH] Add CMake build files
-
-Upstream-Status: Pending
-
-Signed-off-by: Peter Liu <peter.x.liu@external.atlascopco.com>
----
- CMakeLists.txt     | 147 +++++++++++++++++++++++++++++++++++++++++++++++++++++
- FindLibRcf.cmake   |  63 +++++++++++++++++++++++
- VERSION.cmake      |  21 ++++++++
- src/CMakeLists.txt |  25 +++++++++
- 4 files changed, 256 insertions(+)
- create mode 100644 CMakeLists.txt
- create mode 100644 FindLibRcf.cmake
- create mode 100644 VERSION.cmake
- create mode 100755 src/CMakeLists.txt
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-new file mode 100644
-index 0000000..f6e24be
---- /dev/null
-+++ b/CMakeLists.txt
-@@ -0,0 +1,147 @@
-+PROJECT (librcf)
-+
-+CMAKE_MINIMUM_REQUIRED (VERSION 2.6)
-+
-+####################################################################
-+# OPTION                                                           #
-+####################################################################
-+OPTION (LIBRCF_USE_OPENSSL "Build with OpenSSL support?" OFF)
-+OPTION (LIBRCF_OPENSSL_STATIC "Enable static linking to OpenSSL?" OFF)
-+OPTION (LIBRCF_USE_ZLIB "Build with zlib support?" OFF)
-+OPTION (LIBRCF_ZLIB_STATIC "Enable static linking to zlib?" OFF)
-+OPTION (LIBRCF_USE_SF_SERIALIZATION "Build with SF serialization support?" ON)
-+OPTION (LIBRCF_USE_BOOST_SERIALIZATION "Build with Boost.Serialization support?" OFF)
-+OPTION (LIBRCF_USE_BOOST_FILESYSTEM "Build with Boost.Filesystem support (required for file transfer support)?" OFF)
-+OPTION (LIBRCF_USE_BOOST_ASIO "Build with Boost asio support?" ON)
-+OPTION (LIBRCF_USE_PROTOBUF "Build with Protocol Buffer support?" OFF)
-+OPTION (LIBRCF_USE_JSON "Build with JSON Spirit (required for JSON-RPC support)?" OFF)
-+OPTION (LIBRCF_USE_IPV6 "Build with IPv6 support?" OFF)
-+OPTION (LIBRCF_USE_CUSTOM_ALLOCATOR "Build with custom allocator support?" OFF)
-+OPTION (LIBRCF_BUILD_DLL "Build a DLL exporting RCF?" OFF)
-+OPTION (LIBRCF_AUTO_INIT_DEINIT "Enable automatic RCF initialization and deinitialization?" OFF)
-+OPTION (LIBRCF_BUILD_STATIC_LIBS "Build the static library?" ON)
-+OPTION (LIBRCF_BUILD_SHARED_LIBS "Build the shared library?" ON)
-+OPTION (LIBRCF_BUILD_DEMOS "Build demo programs?" ON)
-+
-+####################################################################
-+# CONFIGURATION                                                    #
-+####################################################################
-+INCLUDE (${CMAKE_SOURCE_DIR}/VERSION.cmake)
-+
-+SET (LIBRCF_LIBRARIES "-lpthread -ldl -latomic")
-+INCLUDE_DIRECTORIES (${CMAKE_SOURCE_DIR}/include)
-+
-+IF (LIBRCF_USE_OPENSSL)
-+  IF (NOT OPENSSL_FOUND)
-+    FIND_PACKAGE (OpenSSL REQUIRED)
-+  ENDIF (NOT OPENSSL_FOUND)
-+  INCLUDE_DIRECTORIES (${OPENSSL_INCLUDE_DIR})
-+  ADD_DEFINITIONS (-DRCF_USE_OPENSSL)
-+ENDIF (LIBRCF_USE_OPENSSL)
-+
-+IF (LIBRCF_OPENSSL_STATIC)
-+  LIST (APPEND LIBRCF_LIBRARIES ${OPENSSL_LIBRARIES})
-+  ADD_DEFINITIONS (-DRCF_OPENSSL_STATIC)
-+ENDIF (LIBRCF_OPENSSL_STATIC)
-+
-+IF (LIBRCF_USE_ZLIB)
-+  IF (NOT ZLIB_FOUND)
-+    FIND_PACKAGE (ZLIB REQUIRED)
-+  ENDIF (NOT ZLIB_FOUND)
-+  INCLUDE_DIRECTORIES (${ZLIB_INCLUDE_DIR})
-+  ADD_DEFINITIONS (-DRCF_USE_ZLIB)
-+ENDIF (LIBRCF_USE_ZLIB)
-+
-+IF (LIBRCF_ZLIB_STATIC)
-+  LIST (APPEND LIBRCF_LIBRARIES ${ZLIB_LIBRARIES})
-+  ADD_DEFINITIONS (-DRCF_ZLIB_STATIC)
-+ENDIF (LIBRCF_ZLIB_STATIC)
-+
-+IF (LIBRCF_USE_SF_SERIALIZATION)
-+  IF (NOT Boost_SYSTEM_FOUND)
-+    FIND_PACKAGE (Boost REQUIRED COMPONENTS system)
-+  ENDIF (NOT Boost_SYSTEM_FOUND)
-+  INCLUDE_DIRECTORIES (${Boost_INCLUDE_DIR})
-+  LIST (APPEND LIBRCF_LIBRARIES ${Boost_SYSTEM_LIBRARY})
-+  ADD_DEFINITIONS (-DRCF_USE_SF_SERIALIZATION)
-+ENDIF (LIBRCF_USE_SF_SERIALIZATION)
-+
-+IF (LIBRCF_USE_BOOST_SERIALIZATION)
-+  IF (NOT Boost_SERIALIZATION_FOUND)
-+    FIND_PACKAGE (Boost REQUIRED COMPONENTS serialization)
-+  ENDIF (NOT Boost_SERIALIZATION_FOUND)
-+  INCLUDE_DIRECTORIES (${Boost_INCLUDE_DIR})
-+  LIST (APPEND LIBRCF_LIBRARIES ${Boost_SERIALIZATION_LIBRARY})
-+  ADD_DEFINITIONS (-DRCF_USE_BOOST_SERIALIZATION)
-+ENDIF (LIBRCF_USE_BOOST_SERIALIZATION)
-+
-+IF (LIBRCF_USE_BOOST_FILESYSTEM)
-+  IF (NOT Boost_FILESYSTEM_FOUND)
-+    FIND_PACKAGE (Boost REQUIRED COMPONENTS filesystem system)
-+  ENDIF (NOT Boost_FILESYSTEM_FOUND)
-+  INCLUDE_DIRECTORIES (${Boost_INCLUDE_DIR})
-+  LIST (APPEND LIBRCF_LIBRARIES ${Boost_FILESYSTEM_LIBRARY})
-+  LIST (APPEND LIBRCF_LIBRARIES ${Boost_SYSTEM_LIBRARY})
-+  ADD_DEFINITIONS (-DRCF_USE_BOOST_FILESYSTEM)
-+ENDIF (LIBRCF_USE_BOOST_FILESYSTEM)
-+
-+IF (LIBRCF_USE_BOOST_ASIO)
-+  IF (NOT Boost_FOUND)
-+    FIND_PACKAGE (Boost REQUIRED)
-+  ENDIF (NOT Boost_FOUND)
-+  INCLUDE_DIRECTORIES (${Boost_INCLUDE_DIR})
-+  ADD_DEFINITIONS (-DRCF_USE_BOOST_ASIO)
-+ENDIF (LIBRCF_USE_BOOST_ASIO)
-+
-+IF (LIBRCF_USE_PROTOBUF)
-+  IF(NOT Protobuf_FOUND)
-+    FIND_PACKAGE (Protobuf REQUIRED)
-+  ENDIF (NOT Protobuf_FOUND)
-+  INCLUDE_DIRECTORIES (${Protobuf_INCLUDE_DIR})
-+  LIST (APPEND LIBRCF_LIBRARIES ${Protobuf_LIBRARIES})
-+  ADD_DEFINITIONS (-DRCF_USE_PROTOBUF)
-+ENDIF (LIBRCF_USE_PROTOBUF)
-+
-+IF (LIBRCF_USE_JSON)
-+  IF (NOT LibJsonSpirit_FOUND)
-+    FIND_PACKAGE (LibJsonSpirit REQUIRED)
-+  ENDIF (NOT LibJsonSpirit_FOUND)
-+  INCLUDE_DIRECTORIES (${LibJsonSpirit_INCLUDE_DIR})
-+  LIST (APPEND LIBRCF_LIBRARIES ${LibJsonSpirit_LIBRARIES})
-+  ADD_DEFINITIONS (-DRCF_USE_JSON)
-+ENDIF (LIBRCF_USE_JSON)
-+
-+IF (LIBRCF_USE_IPV6)
-+  ADD_DEFINITIONS (-DRCF_USE_IPV6)
-+ENDIF (LIBRCF_USE_IPV6)
-+
-+IF (LIBRCF_USE_CUSTOM_ALLOCATOR)
-+  ADD_DEFINITIONS (-DRCF_USE_CUSTOM_ALLOCATOR)
-+ENDIF (LIBRCF_USE_CUSTOM_ALLOCATOR)
-+
-+IF (LIBRCF_BUILD_DLL)
-+  ADD_DEFINITIONS (-DRCF_BUILD_DLL)
-+ENDIF (LIBRCF_BUILD_DLL)
-+
-+IF (LIBRCF_AUTO_INIT_DEINIT)
-+  ADD_DEFINITIONS (-DRCF_AUTO_INIT_DEINIT)
-+ENDIF (LIBRCF_AUTO_INIT_DEINIT)
-+
-+####################################################################
-+# SUBDIRECTORY                                                     #
-+####################################################################
-+ADD_SUBDIRECTORY (src)
-+
-+IF (LIBRCF_BUILD_DEMOS)
-+  # Server
-+  ADD_EXECUTABLE (RcfServer demo/Server.cpp)
-+  TARGET_LINK_LIBRARIES (RcfServer rcf ${LIBRCF_LIBRARIES})
-+  INSTALL (TARGETS RcfServer DESTINATION ${CMAKE_INSTALL_BINDIR})
-+
-+  # Client
-+  ADD_EXECUTABLE (RcfClient demo/Client.cpp)
-+  TARGET_LINK_LIBRARIES (RcfClient rcf ${LIBRCF_LIBRARIES})
-+  INSTALL (TARGETS RcfClient DESTINATION ${CMAKE_INSTALL_BINDIR})
-+ENDIF (LIBRCF_BUILD_DEMOS)
-+
-+INSTALL (FILES ${CMAKE_SOURCE_DIR}/FindLibRcf.cmake DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/cmake/Modules)
-diff --git a/FindLibRcf.cmake b/FindLibRcf.cmake
-new file mode 100644
-index 0000000..9d7d8cd
---- /dev/null
-+++ b/FindLibRcf.cmake
-@@ -0,0 +1,63 @@
-+# FindLibRcf - Find librcf headers and libraries.
-+#
-+# Sample:
-+#
-+#   SET( LibRcf_USE_STATIC_LIBS OFF )
-+#   FIND_PACKAGE( LibRcf REQUIRED )
-+#   IF( LibRcf_FOUND )
-+#      INCLUDE_DIRECTORIES( ${LibRcf_INCLUDE_DIRS} )
-+#      TARGET_LINK_LIBRARIES( ... ${LibRcf_LIBRARIES} )
-+#   ENDIF()
-+#
-+# Variables used by this module need to be set before calling find_package
-+#
-+#   LibRcf_USE_STATIC_LIBS	Can be set to ON to force the use of the static
-+#				librcf libraries. Defaults to OFF.
-+#
-+# Variables provided by this module:
-+#
-+#   LibRcf_FOUND		Include dir, librcf libraries.
-+#
-+#   LibRcf_LIBRARIES		Link to these to use all the libraries you specified.
-+#
-+#   LibRcf_INCLUDE_DIRS		Include directories.
-+#
-+# For each component you specify in find_package(), the following (UPPER-CASE)
-+# variables are set to pick and choose components instead of just using LibRcf_LIBRARIES:
-+#
-+#   LIBRCF_FOUND			TRUE if librcf was found
-+#   LIBRCF_LIBRARY			librcf libraries
-+#
-+
-+# Support preference of static libs by adjusting CMAKE_FIND_LIBRARY_SUFFIXES
-+IF(LibRcf_USE_STATIC_LIBS)
-+    SET( _ORIG_CMAKE_FIND_LIBRARY_SUFFIXES ${CMAKE_FIND_LIBRARY_SUFFIXES})
-+    SET(CMAKE_FIND_LIBRARY_SUFFIXES .a )
-+ENDIF()
-+
-+# Look for the header files
-+UNSET(LibRcf_INCLUDE_DIRS CACHE)
-+FIND_PATH(LibRcf_INCLUDE_DIRS NAMES RCF/RcfClient.hpp)
-+
-+# Look for the core library
-+UNSET(LIBRCF_LIBRARY CACHE)
-+FIND_LIBRARY(LIBRCF_LIBRARY NAMES rcf)
-+FIND_PACKAGE_HANDLE_STANDARD_ARGS(LibRcf DEFAULT_MSG LIBRCF_LIBRARY LibRcf_INCLUDE_DIRS)
-+MARK_AS_ADVANCED(
-+    LIBRCF_FOUND
-+    LIBRCF_LIBRARY
-+)
-+
-+# Prepare return values and collectiong more components
-+SET(LibRcf_FOUND ${LIBRCF_FOUND})
-+SET(LibRcf_LIBRARIES ${LIBRCF_LIBRARY})
-+MARK_AS_ADVANCED(
-+    LibRcf_FOUND
-+    LibRcf_LIBRARIES
-+    LibRcf_INCLUDE_DIRS
-+)
-+
-+# Restore CMAKE_FIND_LIBRARY_SUFFIXES
-+IF(LibRcf_USE_STATIC_LIBS)
-+    SET(CMAKE_FIND_LIBRARY_SUFFIXES ${_ORIG_CMAKE_FIND_LIBRARY_SUFFIXES} )
-+ENDIF()
-diff --git a/VERSION.cmake b/VERSION.cmake
-new file mode 100644
-index 0000000..8b4bcdc
---- /dev/null
-+++ b/VERSION.cmake
-@@ -0,0 +1,21 @@
-+# ==================================================
-+# Versioning
-+# ==========
-+#
-+# MAJOR Major number for this branch.
-+#
-+# MINOR The most recent interface number this
-+#     library implements.
-+#
-+# COMPATMINOR The latest binary compatible minor number
-+#     this library implements.
-+#
-+# PATCH The implementation number of the current interface.
-+#
-+#
-+# - The package VERSION will be MAJOR.MINOR.PATCH.
-+#
-+
-+SET (LIBRCF_SOVERSION_MAJOR "2")
-+SET (LIBRCF_SOVERSION_MINOR "2")
-+SET (LIBRCF_SOVERSION_PATCH "0")
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-new file mode 100755
-index 0000000..c227901
---- /dev/null
-+++ b/src/CMakeLists.txt
-@@ -0,0 +1,25 @@
-+IF (NOT LIBRCF_BUILD_SHARED_LIBS)
-+  ADD_LIBRARY (rcf STATIC RCF/RCF.cpp)
-+ELSE (NOT LIBRCF_BUILD_SHARED_LIBS)
-+  ADD_LIBRARY (rcf SHARED RCF/RCF.cpp)
-+  TARGET_LINK_LIBRARIES (rcf ${LIBRCF_LIBRARIES})
-+  SET_TARGET_PROPERTIES (rcf PROPERTIES COMPILE_FLAGS ${CMAKE_SHARED_LIBRARY_C_FLAGS})
-+  SET_TARGET_PROPERTIES (rcf PROPERTIES VERSION ${LIBRCF_SOVERSION_MAJOR}.${LIBRCF_SOVERSION_MINOR}.${LIBRCF_SOVERSION_PATCH})
-+ENDIF (NOT LIBRCF_BUILD_SHARED_LIBS)
-+
-+SET_TARGET_PROPERTIES (rcf PROPERTIES PROJECT_LABEL "RCF Library")
-+SET_TARGET_PROPERTIES (rcf PROPERTIES OUTPUT_NAME "rcf")
-+SET_TARGET_PROPERTIES (rcf PROPERTIES SOVERSION ${LIBRCF_SOVERSION_MAJOR})
-+SET_TARGET_PROPERTIES (rcf PROPERTIES INSTALL_NAME_DIR ${CMAKE_INSTALL_LIBDIR})
-+
-+INSTALL (DIRECTORY "${CMAKE_SOURCE_DIR}/include/RCF" DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
-+INSTALL (DIRECTORY "${CMAKE_SOURCE_DIR}/include/SF" DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
-+INSTALL (TARGETS rcf LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
-+
-+IF (LIBRCF_BUILD_STATIC_LIBS AND LIBRCF_BUILD_SHARED_LIBS)
-+  ADD_LIBRARY (rcf_static STATIC RCF/RCF.cpp)
-+  SET_TARGET_PROPERTIES (rcf_static PROPERTIES PROJECT_LABEL "RCF Static Library")
-+  SET_TARGET_PROPERTIES (rcf_static PROPERTIES OUTPUT_NAME "rcf")
-+  SET_TARGET_PROPERTIES (rcf_static PROPERTIES SOVERSION ${LIBRCF_SOVERSION_MAJOR})
-+  INSTALL (TARGETS rcf_static LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
-+ENDIF (LIBRCF_BUILD_STATIC_LIBS AND LIBRCF_BUILD_SHARED_LIBS)
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-devtools/librcf/librcf/0001-Check-for-__powerpc__-define.patch b/meta-oe/recipes-devtools/librcf/librcf/0001-Check-for-__powerpc__-define.patch
deleted file mode 100644
index d91accf1d..000000000
--- a/meta-oe/recipes-devtools/librcf/librcf/0001-Check-for-__powerpc__-define.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From ac7316679e30f7013604b19aa0949a0744e91d2f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 1 Jul 2017 13:06:30 -0700
-Subject: [PATCH] Check for __powerpc__ define
-
-Also check for gcc's internal define for ppc platform
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/RCF/ByteOrdering.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/RCF/ByteOrdering.cpp b/src/RCF/ByteOrdering.cpp
-index 278ca80..9f9c446 100755
---- a/src/RCF/ByteOrdering.cpp
-+++ b/src/RCF/ByteOrdering.cpp
-@@ -36,7 +36,7 @@ namespace RCF {
- 
-     const ByteOrder MachineByteOrder = BigEndian;
- 
--#elif defined( __ppc__ )
-+#elif defined( __ppc__ ) || defined( __powerpc__ )
- 
-     const ByteOrder MachineByteOrder = BigEndian;
- 
--- 
-2.13.2
-
diff --git a/meta-oe/recipes-devtools/librcf/librcf/0001-ClientStub.hpp-fix-a-clang-compiling-issue.patch b/meta-oe/recipes-devtools/librcf/librcf/0001-ClientStub.hpp-fix-a-clang-compiling-issue.patch
deleted file mode 100644
index e949dee40..000000000
--- a/meta-oe/recipes-devtools/librcf/librcf/0001-ClientStub.hpp-fix-a-clang-compiling-issue.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From d78851b6f87f2472f041102d7b3726ffc009bfad Mon Sep 17 00:00:00 2001
-From: Ming Liu <peter.x.liu@external.atlascopco.com>
-Date: Tue, 6 Jun 2017 05:54:20 +0200
-Subject: [PATCH] ClientStub.hpp: fix a clang compiling issue
-
-A error was observed with clang compiler, as follows:
-| src/RCF/RCF.cpp:49:
-| src/RCF/ClientStub.cpp:28:
-| include/RCF/Future.hpp:49:26: error: 'enrol' is a private member of 'RCF::ClientStub'
-
-it can be fixed by declaring Future as a friend class of ClientStub.
-
-Upstream-Status: Pending
-
-Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
----
- include/RCF/ClientStub.hpp | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/include/RCF/ClientStub.hpp b/include/RCF/ClientStub.hpp
-index 9882cf4..8465625 100755
---- a/include/RCF/ClientStub.hpp
-+++ b/include/RCF/ClientStub.hpp
-@@ -372,6 +372,8 @@ namespace RCF {
- 
-     private:
- 
-+        template<typename U>
-+        friend class Future;
-         friend class FutureImplBase;
- 
-         template<
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-devtools/librcf/librcf/aarch64-support.patch b/meta-oe/recipes-devtools/librcf/librcf/aarch64-support.patch
deleted file mode 100644
index e08efb92f..000000000
--- a/meta-oe/recipes-devtools/librcf/librcf/aarch64-support.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: RCF-2.2.0.0/src/RCF/ByteOrdering.cpp
-===================================================================
---- RCF-2.2.0.0.orig/src/RCF/ByteOrdering.cpp
-+++ RCF-2.2.0.0/src/RCF/ByteOrdering.cpp
-@@ -60,7 +60,7 @@ namespace RCF {
- 
-     const ByteOrder MachineByteOrder = LittleEndian;
- 
--#elif defined(__arm__)
-+#elif defined(__arm__) || defined(__aarch64__)
- 
-     const ByteOrder MachineByteOrder = LittleEndian;
- 
diff --git a/meta-oe/recipes-devtools/librcf/librcf/mips-support.patch b/meta-oe/recipes-devtools/librcf/librcf/mips-support.patch
deleted file mode 100644
index 4a327f78e..000000000
--- a/meta-oe/recipes-devtools/librcf/librcf/mips-support.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Index: RCF-2.2.0.0/src/RCF/ByteOrdering.cpp
-===================================================================
---- RCF-2.2.0.0.orig/src/RCF/ByteOrdering.cpp
-+++ RCF-2.2.0.0/src/RCF/ByteOrdering.cpp
-@@ -64,6 +64,14 @@ namespace RCF {
- 
-     const ByteOrder MachineByteOrder = LittleEndian;
- 
-+#elif defined(__mipsel__) || defined(__mips64el__)
-+
-+    const ByteOrder MachineByteOrder = LittleEndian;
-+
-+#elif defined( __mips__ ) || defined(__mips64__)
-+
-+    const ByteOrder MachineByteOrder = BigEndian;
-+
- #elif defined(__bfin__)
- 
-     const ByteOrder MachineByteOrder = LittleEndian;
diff --git a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
deleted file mode 100644
index dcd47a4e6..000000000
--- a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
+++ /dev/null
@@ -1,53 +0,0 @@
-SUMMARY = "RCF (Remote Call Framework) is a cross-platform interprocess communication framework for C++"
-DESCRIPTION = "Unlike other communication frameworks, RCF doesn't use a separate \
-IDL (Interface Definition Language). RCF interfaces are defined directly in C++, \
-and serialization for user-defined data types likewise is implemented in C++. \
-Instead of a separate IDL compiler tool, RCF uses the C++ compiler to generate \
-client and server stubs."
-HOMEPAGE = "http://www.deltavsoft.com/"
-SECTION = "libs"
-PRIORITY = "optional"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://license.txt;md5=7586a312b9e978f9d6fac9a5780d1f84"
-
-SRC_URI = "http://www.deltavsoft.com/downloads/RCF-${PV}.tar.gz \
-           file://0001-Add-CMake-build-files.patch \
-           file://aarch64-support.patch \
-           file://0001-ClientStub.hpp-fix-a-clang-compiling-issue.patch \
-           file://mips-support.patch \
-           file://0001-Check-for-__powerpc__-define.patch \
-           "
-
-SRC_URI[md5sum] = "7ecb3c73f7eb66dba8790b659374f690"
-SRC_URI[sha256sum] = "bbfcc88de502c39604878c395f516b03fff4eac63eb4f7f44c07d433839712dd"
-
-S = "${WORKDIR}/RCF-${PV}"
-
-inherit cmake dos2unix
-
-PACKAGECONFIG ?= "zlib openssl sf-serialization boost-filesystem boost-asio protobuf json dll static shared demos"
-PACKAGECONFIG[zlib] = "-DLIBRCF_USE_ZLIB=ON,-DLIBRCF_USE_ZLIB=OFF,zlib,zlib"
-PACKAGECONFIG[zlib-static] = "-DLIBRCF_USE_ZLIB=ON -DLIBRCF_ZLIB_STATIC=ON,-DLIBRCF_ZLIB_STATIC=OFF,zlib,"
-PACKAGECONFIG[openssl] = "-DLIBRCF_USE_OPENSSL=ON,-DLIBRCF_USE_OPENSSL=OFF,openssl,libssl libcrypto"
-PACKAGECONFIG[openssl-static] = "-DLIBRCF_USE_OPENSSL=ON -DLIBRCF_OPENSSL_STATIC=ON,-DLIBRCF_OPENSSL_STATIC=OFF,openssl,"
-PACKAGECONFIG[sf-serialization] = "-DLIBRCF_USE_SF_SERIALIZATION=ON,-DLIBRCF_USE_SF_SERIALIZATION=OFF,boost,"
-PACKAGECONFIG[boost-serialization] = "-DLIBRCF_USE_BOOST_SERIALIZATION=ON,-DLIBRCF_USE_BOOST_SERIALIZATION=OFF,boost,"
-PACKAGECONFIG[boost-filesystem] = "-DLIBRCF_USE_BOOST_FILESYSTEM=ON,-DLIBRCF_USE_BOOST_FILESYSTEM=OFF,boost,"
-PACKAGECONFIG[boost-asio] = "-DLIBRCF_USE_BOOST_ASIO=ON,-DLIBRCF_USE_BOOST_ASIO=OFF,boost,"
-PACKAGECONFIG[protobuf] = "-DLIBRCF_USE_PROTOBUF=ON,-DLIBRCF_USE_PROTOBUF=OFF,protobuf,protobuf"
-PACKAGECONFIG[json] = "-DLIBRCF_USE_JSON=ON,-DLIBRCF_USE_JSON=OFF,json-spirit,json-spirit"
-PACKAGECONFIG[ipv6] = "-DLIBRCF_USE_IPV6=ON,-DLIBRCF_USE_IPV6=OFF,"
-PACKAGECONFIG[custom-allocator] = "-DLIBRCF_USE_CUSTOM_ALLOCATOR=ON,-DLIBRCF_USE_CUSTOM_ALLOCATOR=OFF,"
-PACKAGECONFIG[dll] = "-DLIBRCF_BUILD_DLL=ON,-DLIBRCF_BUILD_DLL=OFF,"
-PACKAGECONFIG[auto-init-deinit] = "-DLIBRCF_AUTO_INIT_DEINIT=ON,-DLIBRCF_AUTO_INIT_DEINIT=OFF,"
-PACKAGECONFIG[static] = "-DLIBRCF_BUILD_STATIC_LIBS=ON,-DLIBRCF_BUILD_STATIC_LIBS=OFF,"
-PACKAGECONFIG[shared] = "-DLIBRCF_BUILD_SHARED_LIBS=ON,-DLIBRCF_BUILD_SHARED_LIBS=OFF,"
-PACKAGECONFIG[demos] = "-DLIBRCF_BUILD_DEMOS=ON,-DLIBRCF_BUILD_DEMOS=OFF,"
-
-PACKAGES =+ "${@bb.utils.contains('PACKAGECONFIG', 'demos', '${PN}-demos', '', d)}"
-
-FILES_${PN}-demos = "${bindir}/*"
-
-BBCLASSEXTEND = "nativesdk"
-
-PNBLACKLIST[librcf] = " error: invalid use of incomplete type 'RCF::AsioIoService {aka class boost::asio::io_service}; among others?" 
-- 
2.17.1


