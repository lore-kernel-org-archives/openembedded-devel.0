Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7C43C77579
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Mar 2017 11:11:18 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id g10so136386624wrg.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Mar 2017 03:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=pP9g0rIR/vHJckTpKsa/hLydIvjOTQLh7bG5htWsLbw=;
	b=M/eIcjlf9hxbyXYD+OHZ5RShPqsVbbAv8djGO6iTORTqrhzazaCOgasHgPWSR02SO4
	gStQX1DRylbigBzYp5fRYyDOIWxEtf0p3iNVAdmQdD42mMiIPKgFwyOTVV6ZkFWHaz6e
	TFTu0IjJtrQ/P0mhVazl3zSppYjBqAn4DufpmRsK4yT208hr41IZJIPTNfc9SCNY+OqQ
	6cfewIV9Lw+2SuPm2Of6FYI7yHMGmh5gJ4L5ZcmsYNtYODzSVAJX4rarphQgSqsGkrl1
	c37U2dcKtmQIzZuZehuda5HmHSdHLEYU68ypvpYoT13KhAHTHZjHFOG9kKUfpYB4g+6w
	HSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pP9g0rIR/vHJckTpKsa/hLydIvjOTQLh7bG5htWsLbw=;
	b=YHxAY++9hb9PqjD0Wb6SOFzXa8OtW+svDNIdHfyUOFSkD5UFgw/eXastqTpNQKXQM3
	3TQMZuFDVh4Ln4ObbX2hBi4IfPxDfAESSyPiGUJ+WR0kPIdPtkZEUdJKgbTori69z8CO
	BFfr0amHlwDlptvyXUBONiSCUKpiZZnhLonXH+pdNilCQUpSD+iubKhysLFuMgwWcuKJ
	pkDCxgxKm+ufJD71gp3gu492wKVcpMUbHdNUa90AcoeouSSrZGjbtqfEsZgn214Qk8C9
	2tQU6ppJs0xtALIFQIV9BWqqHdUaiOXejhpS+58lzLPqZsO44XYyc31TpQbiHMmZ3JTV
	/Wyw==
X-Gm-Message-State: AMke39kUl6v50vxZ1E5f3HRvRQNmad0qHqv7mpIWtrkALMgeTy4Ht0xO0XLTwrmjj+LZXw==
X-Received: by 10.223.147.162 with SMTP id 31mr18065986wrp.133.1488885079306; 
	Tue, 07 Mar 2017 03:11:19 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([117.136.0.138]) by smtp.gmail.com with ESMTPSA id
	60sm14674155wrg.60.2017.03.07.03.11.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 07 Mar 2017 03:11:18 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Mar 2017 12:11:07 +0100
Message-Id: <1488885067-31857-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-oe] [PATCH] librcf: add new recipe
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
X-List-Received-Date: Tue, 07 Mar 2017 11:11:20 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

RCF (Remote Call Framework) is a cross-platform interprocess
communication framework for C++, which is widely used by some
industrial companies.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 .../librcf/librcf/0001-Add-CMake-build-files.patch | 301 +++++++++++++++++++++
 meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb  |  48 ++++
 2 files changed, 349 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/librcf/librcf/0001-Add-CMake-build-files.patch
 create mode 100644 meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb

diff --git a/meta-oe/recipes-devtools/librcf/librcf/0001-Add-CMake-build-files.patch b/meta-oe/recipes-devtools/librcf/librcf/0001-Add-CMake-build-files.patch
new file mode 100644
index 0000000..34d0f62
--- /dev/null
+++ b/meta-oe/recipes-devtools/librcf/librcf/0001-Add-CMake-build-files.patch
@@ -0,0 +1,301 @@
+From 613297214d78ee10111e74e90e025166ebbcad9f Mon Sep 17 00:00:00 2001
+From: Peter Liu <peter.x.liu@external.atlascopco.com>
+Date: Sun, 5 Mar 2017 16:15:40 +0100
+Subject: [PATCH] Add CMake build files
+
+Upstream-Status: Pending
+
+Signed-off-by: Peter Liu <peter.x.liu@external.atlascopco.com>
+---
+ CMakeLists.txt     | 147 +++++++++++++++++++++++++++++++++++++++++++++++++++++
+ FindLibRcf.cmake   |  63 +++++++++++++++++++++++
+ VERSION.cmake      |  21 ++++++++
+ src/CMakeLists.txt |  24 +++++++++
+ 4 files changed, 255 insertions(+)
+ create mode 100644 CMakeLists.txt
+ create mode 100644 FindLibRcf.cmake
+ create mode 100644 VERSION.cmake
+ create mode 100755 src/CMakeLists.txt
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+new file mode 100644
+index 0000000..f6e24be
+--- /dev/null
++++ b/CMakeLists.txt
+@@ -0,0 +1,147 @@
++PROJECT (librcf)
++
++CMAKE_MINIMUM_REQUIRED (VERSION 2.6)
++
++####################################################################
++# OPTION                                                           #
++####################################################################
++OPTION (LIBRCF_USE_OPENSSL "Build with OpenSSL support?" OFF)
++OPTION (LIBRCF_OPENSSL_STATIC "Enable static linking to OpenSSL?" OFF)
++OPTION (LIBRCF_USE_ZLIB "Build with zlib support?" OFF)
++OPTION (LIBRCF_ZLIB_STATIC "Enable static linking to zlib?" OFF)
++OPTION (LIBRCF_USE_SF_SERIALIZATION "Build with SF serialization support?" ON)
++OPTION (LIBRCF_USE_BOOST_SERIALIZATION "Build with Boost.Serialization support?" OFF)
++OPTION (LIBRCF_USE_BOOST_FILESYSTEM "Build with Boost.Filesystem support (required for file transfer support)?" OFF)
++OPTION (LIBRCF_USE_BOOST_ASIO "Build with Boost asio support?" ON)
++OPTION (LIBRCF_USE_PROTOBUF "Build with Protocol Buffer support?" OFF)
++OPTION (LIBRCF_USE_JSON "Build with JSON Spirit (required for JSON-RPC support)?" OFF)
++OPTION (LIBRCF_USE_IPV6 "Build with IPv6 support?" OFF)
++OPTION (LIBRCF_USE_CUSTOM_ALLOCATOR "Build with custom allocator support?" OFF)
++OPTION (LIBRCF_BUILD_DLL "Build a DLL exporting RCF?" OFF)
++OPTION (LIBRCF_AUTO_INIT_DEINIT "Enable automatic RCF initialization and deinitialization?" OFF)
++OPTION (LIBRCF_BUILD_STATIC_LIBS "Build the static library?" ON)
++OPTION (LIBRCF_BUILD_SHARED_LIBS "Build the shared library?" ON)
++OPTION (LIBRCF_BUILD_DEMOS "Build demo programs?" ON)
++
++####################################################################
++# CONFIGURATION                                                    #
++####################################################################
++INCLUDE (${CMAKE_SOURCE_DIR}/VERSION.cmake)
++
++SET (LIBRCF_LIBRARIES "-lpthread -ldl")
++INCLUDE_DIRECTORIES (${CMAKE_SOURCE_DIR}/include)
++
++IF (LIBRCF_USE_OPENSSL)
++  IF (NOT OPENSSL_FOUND)
++    FIND_PACKAGE (OpenSSL REQUIRED)
++  ENDIF (NOT OPENSSL_FOUND)
++  INCLUDE_DIRECTORIES (${OPENSSL_INCLUDE_DIR})
++  ADD_DEFINITIONS (-DRCF_USE_OPENSSL)
++ENDIF (LIBRCF_USE_OPENSSL)
++
++IF (LIBRCF_OPENSSL_STATIC)
++  LIST (APPEND LIBRCF_LIBRARIES ${OPENSSL_LIBRARIES})
++  ADD_DEFINITIONS (-DRCF_OPENSSL_STATIC)
++ENDIF (LIBRCF_OPENSSL_STATIC)
++
++IF (LIBRCF_USE_ZLIB)
++  IF (NOT ZLIB_FOUND)
++    FIND_PACKAGE (ZLIB REQUIRED)
++  ENDIF (NOT ZLIB_FOUND)
++  INCLUDE_DIRECTORIES (${ZLIB_INCLUDE_DIR})
++  ADD_DEFINITIONS (-DRCF_USE_ZLIB)
++ENDIF (LIBRCF_USE_ZLIB)
++
++IF (LIBRCF_ZLIB_STATIC)
++  LIST (APPEND LIBRCF_LIBRARIES ${ZLIB_LIBRARIES})
++  ADD_DEFINITIONS (-DRCF_ZLIB_STATIC)
++ENDIF (LIBRCF_ZLIB_STATIC)
++
++IF (LIBRCF_USE_SF_SERIALIZATION)
++  IF (NOT Boost_SYSTEM_FOUND)
++    FIND_PACKAGE (Boost REQUIRED COMPONENTS system)
++  ENDIF (NOT Boost_SYSTEM_FOUND)
++  INCLUDE_DIRECTORIES (${Boost_INCLUDE_DIR})
++  LIST (APPEND LIBRCF_LIBRARIES ${Boost_SYSTEM_LIBRARY})
++  ADD_DEFINITIONS (-DRCF_USE_SF_SERIALIZATION)
++ENDIF (LIBRCF_USE_SF_SERIALIZATION)
++
++IF (LIBRCF_USE_BOOST_SERIALIZATION)
++  IF (NOT Boost_SERIALIZATION_FOUND)
++    FIND_PACKAGE (Boost REQUIRED COMPONENTS serialization)
++  ENDIF (NOT Boost_SERIALIZATION_FOUND)
++  INCLUDE_DIRECTORIES (${Boost_INCLUDE_DIR})
++  LIST (APPEND LIBRCF_LIBRARIES ${Boost_SERIALIZATION_LIBRARY})
++  ADD_DEFINITIONS (-DRCF_USE_BOOST_SERIALIZATION)
++ENDIF (LIBRCF_USE_BOOST_SERIALIZATION)
++
++IF (LIBRCF_USE_BOOST_FILESYSTEM)
++  IF (NOT Boost_FILESYSTEM_FOUND)
++    FIND_PACKAGE (Boost REQUIRED COMPONENTS filesystem system)
++  ENDIF (NOT Boost_FILESYSTEM_FOUND)
++  INCLUDE_DIRECTORIES (${Boost_INCLUDE_DIR})
++  LIST (APPEND LIBRCF_LIBRARIES ${Boost_FILESYSTEM_LIBRARY})
++  LIST (APPEND LIBRCF_LIBRARIES ${Boost_SYSTEM_LIBRARY})
++  ADD_DEFINITIONS (-DRCF_USE_BOOST_FILESYSTEM)
++ENDIF (LIBRCF_USE_BOOST_FILESYSTEM)
++
++IF (LIBRCF_USE_BOOST_ASIO)
++  IF (NOT Boost_FOUND)
++    FIND_PACKAGE (Boost REQUIRED)
++  ENDIF (NOT Boost_FOUND)
++  INCLUDE_DIRECTORIES (${Boost_INCLUDE_DIR})
++  ADD_DEFINITIONS (-DRCF_USE_BOOST_ASIO)
++ENDIF (LIBRCF_USE_BOOST_ASIO)
++
++IF (LIBRCF_USE_PROTOBUF)
++  IF(NOT Protobuf_FOUND)
++    FIND_PACKAGE (Protobuf REQUIRED)
++  ENDIF (NOT Protobuf_FOUND)
++  INCLUDE_DIRECTORIES (${Protobuf_INCLUDE_DIR})
++  LIST (APPEND LIBRCF_LIBRARIES ${Protobuf_LIBRARIES})
++  ADD_DEFINITIONS (-DRCF_USE_PROTOBUF)
++ENDIF (LIBRCF_USE_PROTOBUF)
++
++IF (LIBRCF_USE_JSON)
++  IF (NOT LibJsonSpirit_FOUND)
++    FIND_PACKAGE (LibJsonSpirit REQUIRED)
++  ENDIF (NOT LibJsonSpirit_FOUND)
++  INCLUDE_DIRECTORIES (${LibJsonSpirit_INCLUDE_DIR})
++  LIST (APPEND LIBRCF_LIBRARIES ${LibJsonSpirit_LIBRARIES})
++  ADD_DEFINITIONS (-DRCF_USE_JSON)
++ENDIF (LIBRCF_USE_JSON)
++
++IF (LIBRCF_USE_IPV6)
++  ADD_DEFINITIONS (-DRCF_USE_IPV6)
++ENDIF (LIBRCF_USE_IPV6)
++
++IF (LIBRCF_USE_CUSTOM_ALLOCATOR)
++  ADD_DEFINITIONS (-DRCF_USE_CUSTOM_ALLOCATOR)
++ENDIF (LIBRCF_USE_CUSTOM_ALLOCATOR)
++
++IF (LIBRCF_BUILD_DLL)
++  ADD_DEFINITIONS (-DRCF_BUILD_DLL)
++ENDIF (LIBRCF_BUILD_DLL)
++
++IF (LIBRCF_AUTO_INIT_DEINIT)
++  ADD_DEFINITIONS (-DRCF_AUTO_INIT_DEINIT)
++ENDIF (LIBRCF_AUTO_INIT_DEINIT)
++
++####################################################################
++# SUBDIRECTORY                                                     #
++####################################################################
++ADD_SUBDIRECTORY (src)
++
++IF (LIBRCF_BUILD_DEMOS)
++  # Server
++  ADD_EXECUTABLE (RcfServer demo/Server.cpp)
++  TARGET_LINK_LIBRARIES (RcfServer rcf ${LIBRCF_LIBRARIES})
++  INSTALL (TARGETS RcfServer DESTINATION ${CMAKE_INSTALL_BINDIR})
++
++  # Client
++  ADD_EXECUTABLE (RcfClient demo/Client.cpp)
++  TARGET_LINK_LIBRARIES (RcfClient rcf ${LIBRCF_LIBRARIES})
++  INSTALL (TARGETS RcfClient DESTINATION ${CMAKE_INSTALL_BINDIR})
++ENDIF (LIBRCF_BUILD_DEMOS)
++
++INSTALL (FILES ${CMAKE_SOURCE_DIR}/FindLibRcf.cmake DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/cmake/Modules)
+diff --git a/FindLibRcf.cmake b/FindLibRcf.cmake
+new file mode 100644
+index 0000000..9d7d8cd
+--- /dev/null
++++ b/FindLibRcf.cmake
+@@ -0,0 +1,63 @@
++# FindLibRcf - Find librcf headers and libraries.
++#
++# Sample:
++#
++#   SET( LibRcf_USE_STATIC_LIBS OFF )
++#   FIND_PACKAGE( LibRcf REQUIRED )
++#   IF( LibRcf_FOUND )
++#      INCLUDE_DIRECTORIES( ${LibRcf_INCLUDE_DIRS} )
++#      TARGET_LINK_LIBRARIES( ... ${LibRcf_LIBRARIES} )
++#   ENDIF()
++#
++# Variables used by this module need to be set before calling find_package
++#
++#   LibRcf_USE_STATIC_LIBS	Can be set to ON to force the use of the static
++#				librcf libraries. Defaults to OFF.
++#
++# Variables provided by this module:
++#
++#   LibRcf_FOUND		Include dir, librcf libraries.
++#
++#   LibRcf_LIBRARIES		Link to these to use all the libraries you specified.
++#
++#   LibRcf_INCLUDE_DIRS		Include directories.
++#
++# For each component you specify in find_package(), the following (UPPER-CASE)
++# variables are set to pick and choose components instead of just using LibRcf_LIBRARIES:
++#
++#   LIBRCF_FOUND			TRUE if librcf was found
++#   LIBRCF_LIBRARY			librcf libraries
++#
++
++# Support preference of static libs by adjusting CMAKE_FIND_LIBRARY_SUFFIXES
++IF(LibRcf_USE_STATIC_LIBS)
++    SET( _ORIG_CMAKE_FIND_LIBRARY_SUFFIXES ${CMAKE_FIND_LIBRARY_SUFFIXES})
++    SET(CMAKE_FIND_LIBRARY_SUFFIXES .a )
++ENDIF()
++
++# Look for the header files
++UNSET(LibRcf_INCLUDE_DIRS CACHE)
++FIND_PATH(LibRcf_INCLUDE_DIRS NAMES RCF/RcfClient.hpp)
++
++# Look for the core library
++UNSET(LIBRCF_LIBRARY CACHE)
++FIND_LIBRARY(LIBRCF_LIBRARY NAMES rcf)
++FIND_PACKAGE_HANDLE_STANDARD_ARGS(LibRcf DEFAULT_MSG LIBRCF_LIBRARY LibRcf_INCLUDE_DIRS)
++MARK_AS_ADVANCED(
++    LIBRCF_FOUND
++    LIBRCF_LIBRARY
++)
++
++# Prepare return values and collectiong more components
++SET(LibRcf_FOUND ${LIBRCF_FOUND})
++SET(LibRcf_LIBRARIES ${LIBRCF_LIBRARY})
++MARK_AS_ADVANCED(
++    LibRcf_FOUND
++    LibRcf_LIBRARIES
++    LibRcf_INCLUDE_DIRS
++)
++
++# Restore CMAKE_FIND_LIBRARY_SUFFIXES
++IF(LibRcf_USE_STATIC_LIBS)
++    SET(CMAKE_FIND_LIBRARY_SUFFIXES ${_ORIG_CMAKE_FIND_LIBRARY_SUFFIXES} )
++ENDIF()
+diff --git a/VERSION.cmake b/VERSION.cmake
+new file mode 100644
+index 0000000..8b4bcdc
+--- /dev/null
++++ b/VERSION.cmake
+@@ -0,0 +1,21 @@
++# ==================================================
++# Versioning
++# ==========
++#
++# MAJOR Major number for this branch.
++#
++# MINOR The most recent interface number this
++#     library implements.
++#
++# COMPATMINOR The latest binary compatible minor number
++#     this library implements.
++#
++# PATCH The implementation number of the current interface.
++#
++#
++# - The package VERSION will be MAJOR.MINOR.PATCH.
++#
++
++SET (LIBRCF_SOVERSION_MAJOR "2")
++SET (LIBRCF_SOVERSION_MINOR "2")
++SET (LIBRCF_SOVERSION_PATCH "0")
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+new file mode 100755
+index 0000000..c227901
+--- /dev/null
++++ b/src/CMakeLists.txt
+@@ -0,0 +1,24 @@
++IF (NOT LIBRCF_BUILD_SHARED_LIBS)
++  ADD_LIBRARY (rcf STATIC RCF/RCF.cpp)
++ELSE (NOT LIBRCF_BUILD_SHARED_LIBS)
++  ADD_LIBRARY (rcf SHARED RCF/RCF.cpp)
++  TARGET_LINK_LIBRARIES (rcf ${LIBRCF_LIBRARIES})
++  SET_TARGET_PROPERTIES (rcf PROPERTIES COMPILE_FLAGS ${CMAKE_SHARED_LIBRARY_C_FLAGS})
++  SET_TARGET_PROPERTIES (rcf PROPERTIES VERSION ${LIBRCF_SOVERSION_MAJOR}.${LIBRCF_SOVERSION_MINOR}.${LIBRCF_SOVERSION_PATCH})
++ENDIF (NOT LIBRCF_BUILD_SHARED_LIBS)
++
++SET_TARGET_PROPERTIES (rcf PROPERTIES PROJECT_LABEL "RCF Library")
++SET_TARGET_PROPERTIES (rcf PROPERTIES OUTPUT_NAME "rcf")
++SET_TARGET_PROPERTIES (rcf PROPERTIES SOVERSION ${LIBRCF_SOVERSION_MAJOR})
++SET_TARGET_PROPERTIES (rcf PROPERTIES INSTALL_NAME_DIR ${CMAKE_INSTALL_LIBDIR})
++
++INSTALL (DIRECTORY "${CMAKE_SOURCE_DIR}/include/RCF" DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
++INSTALL (TARGETS rcf LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
++
++IF (LIBRCF_BUILD_STATIC_LIBS AND LIBRCF_BUILD_SHARED_LIBS)
++  ADD_LIBRARY (rcf_static STATIC RCF/RCF.cpp)
++  SET_TARGET_PROPERTIES (rcf_static PROPERTIES PROJECT_LABEL "RCF Static Library")
++  SET_TARGET_PROPERTIES (rcf_static PROPERTIES OUTPUT_NAME "rcf")
++  SET_TARGET_PROPERTIES (rcf_static PROPERTIES SOVERSION ${LIBRCF_SOVERSION_MAJOR})
++  INSTALL (TARGETS rcf_static LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
++ENDIF (LIBRCF_BUILD_STATIC_LIBS AND LIBRCF_BUILD_SHARED_LIBS)
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
new file mode 100644
index 0000000..3105f65
--- /dev/null
+++ b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
@@ -0,0 +1,48 @@
+SUMMARY = "RCF (Remote Call Framework) is a cross-platform interprocess communication framework for C++"
+DESCRIPTION = "Unlike other communication frameworks, RCF doesn't use a separate \
+IDL (Interface Definition Language). RCF interfaces are defined directly in C++, \
+and serialization for user-defined data types likewise is implemented in C++. \
+Instead of a separate IDL compiler tool, RCF uses the C++ compiler to generate \
+client and server stubs."
+HOMEPAGE = "http://www.deltavsoft.com/"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://license.txt;md5=137c2935b51c95068a8b1bbd434ffe2d"
+
+SRC_URI = "http://www.deltavsoft.com/downloads/RCF-${PV}.tar.gz \
+           file://0001-Add-CMake-build-files.patch \
+          "
+
+SRC_URI[md5sum] = "7ecb3c73f7eb66dba8790b659374f690"
+SRC_URI[sha256sum] = "bbfcc88de502c39604878c395f516b03fff4eac63eb4f7f44c07d433839712dd"
+
+S = "${WORKDIR}/RCF-${PV}"
+
+inherit cmake
+
+PACKAGECONFIG ?= "zlib openssl sf-serialization boost-filesystem boost-asio protobuf json dll static shared demos"
+PACKAGECONFIG[zlib] = "-DLIBRCF_USE_ZLIB=ON,-DLIBRCF_USE_ZLIB=OFF,zlib,zlib"
+PACKAGECONFIG[zlib-static] = "-DLIBRCF_USE_ZLIB=ON -DLIBRCF_ZLIB_STATIC=ON,-DLIBRCF_ZLIB_STATIC=OFF,zlib,"
+PACKAGECONFIG[openssl] = "-DLIBRCF_USE_OPENSSL=ON,-DLIBRCF_USE_OPENSSL=OFF,openssl,libssl libcrypto"
+PACKAGECONFIG[openssl-static] = "-DLIBRCF_USE_OPENSSL=ON -DLIBRCF_OPENSSL_STATIC=ON,-DLIBRCF_OPENSSL_STATIC=OFF,openssl,"
+PACKAGECONFIG[sf-serialization] = "-DLIBRCF_USE_SF_SERIALIZATION=ON,-DLIBRCF_USE_SF_SERIALIZATION=OFF,boost,"
+PACKAGECONFIG[boost-serialization] = "-DLIBRCF_USE_BOOST_SERIALIZATION=ON,-DLIBRCF_USE_BOOST_SERIALIZATION=OFF,boost,"
+PACKAGECONFIG[boost-filesystem] = "-DLIBRCF_USE_BOOST_FILESYSTEM=ON,-DLIBRCF_USE_BOOST_FILESYSTEM=OFF,boost,"
+PACKAGECONFIG[boost-asio] = "-DLIBRCF_USE_BOOST_ASIO=ON,-DLIBRCF_USE_BOOST_ASIO=OFF,boost,"
+PACKAGECONFIG[protobuf] = "-DLIBRCF_USE_PROTOBUF=ON,-DLIBRCF_USE_PROTOBUF=OFF,protobuf,"
+PACKAGECONFIG[json] = "-DLIBRCF_USE_JSON=ON,-DLIBRCF_USE_JSON=OFF,json-spirit,"
+PACKAGECONFIG[ipv6] = "-DLIBRCF_USE_IPV6=ON,-DLIBRCF_USE_IPV6=OFF,"
+PACKAGECONFIG[custom-allocator] = "-DLIBRCF_USE_CUSTOM_ALLOCATOR=ON,-DLIBRCF_USE_CUSTOM_ALLOCATOR=OFF,"
+PACKAGECONFIG[dll] = "-DLIBRCF_BUILD_DLL=ON,-DLIBRCF_BUILD_DLL=OFF,"
+PACKAGECONFIG[auto-init-deinit] = "-DLIBRCF_AUTO_INIT_DEINIT=ON,-DLIBRCF_AUTO_INIT_DEINIT=OFF,"
+PACKAGECONFIG[static] = "-DLIBRCF_BUILD_STATIC_LIBS=ON,-DLIBRCF_BUILD_STATIC_LIBS=OFF,"
+PACKAGECONFIG[shared] = "-DLIBRCF_BUILD_SHARED_LIBS=ON,-DLIBRCF_BUILD_SHARED_LIBS=OFF,"
+PACKAGECONFIG[demos] = "-DLIBRCF_BUILD_DEMOS=ON,-DLIBRCF_BUILD_DEMOS=OFF,"
+
+PACKAGES =+ "${@bb.utils.contains('PACKAGECONFIG', 'demos', '${PN}-demos', '', d)}"
+
+FILES_${PN}-demos = "${bindir}/*"
+FILES_${PN}-dev += "${datadir}/cmake/Modules/FindLibRcf.cmake"
+
+BBCLASSEXTEND += "nativesdk"
-- 
1.9.1


