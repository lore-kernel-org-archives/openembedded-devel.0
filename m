Return-Path: <liu.ming50@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id E834F77553
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Mar 2017 11:12:02 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id v125so13235872qkh.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Mar 2017 03:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9ouQEII8uwa6z4PqUzYQqDbjUkLw9Dshkw6BFd4xk+o=;
	b=B7uy+Y3OUemKlxWP+WZUd9ZYLN60oOYK/X4deU+TP35bFZ5mOklazZMpDKAbZSZ+IM
	A+gW/2HLmitHF2sKSwgw0iyBatwUfkFgJugTIUAecVUU9F8QYm1nRTi1bILsh2EymSsW
	YpPGsGqvMN8nYuMh2bNbGsldiq2ZveXG2Q+a7AIzEaAkRmawO7H0MdXJWlBpo2kDcODy
	FJs01pIDMtoQMp8CAwycnncUYkwZ1YSaN4dPqgWO7M39W5F3Mqs1lTCLz5rUyUwxFV8u
	q8HojVKP/aeqYPGD/64c2w5/ac/LF+koQ5a+BL1TXHH8ZQVcRigMIU5Yu6ze2OOa47y6
	dcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9ouQEII8uwa6z4PqUzYQqDbjUkLw9Dshkw6BFd4xk+o=;
	b=R+MTnsgckO3jWopceKHFUm16Ueu8dNb3Gizxn6zydLG95fX4acx3Gd5Z9OOnaPTq44
	IKNenCrRgr+ssxX44ivGj4QeQvXFGc4Atm2oeBffva3KZne/wRh5IfpE86ya2GN2VNsh
	59cBKVUcKGKGYJapq4ia3AbEmQr/Xjcu5qPldf3F8LGEwpfRU9yGZwvyl244cEWjECgL
	eArae9z/02ZEQ4Y1xg3uh1p0Ie+8DvGm7BIYj94CmZqXTCqWracvX3GwgsbEeODki0JL
	6S4VKj0M/4MITfs2O15ubCu4GNOc0Z4jH80Yxs5dJa6Hv81eZf3KDl/SrZIqJ/mTHkAK
	Hbag==
X-Gm-Message-State: AMke39lqOueGM3WDeT0b5+nhk94J+Rs4TN2JrnetMUd0f56iFbmWNahBPs0NMJQ0C7U9bQ==
X-Received: by 10.129.109.139 with SMTP id i133mr16509700ywc.230.1488885118891;
	Tue, 07 Mar 2017 03:11:58 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([117.136.0.138]) by smtp.gmail.com with ESMTPSA id
	w137sm8907902yww.41.2017.03.07.03.11.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 07 Mar 2017 03:11:58 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Mar 2017 12:11:41 +0100
Message-Id: <1488885101-32112-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-oe] [PATCH] json-spirit: add new recipe
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
X-List-Received-Date: Tue, 07 Mar 2017 11:12:03 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Json Spirit is a C++ JSON parser/generator implemented with Boost Spirit.

It's being required by another newly added recipe librcf.

The source json_spirit_v4.08.zip is derived from:
https://www.codeproject.com/KB/recipes/JSON_Spirit/json_spirit_v4.08.zip

The reason for getting it from a zip file instead of fetching it from
the above site is that it needs logging in firstly before you can
download anything.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 .../json-spirit/0001-Adjust-the-cmake-files.patch  | 145 +++++++++++++++++++++
 .../json-spirit/json-spirit/json_spirit_v4.08.zip  | Bin 0 -> 56299 bytes
 .../json-spirit/json-spirit_4.08.bb                |  24 ++++
 3 files changed, 169 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/json-spirit/json-spirit/0001-Adjust-the-cmake-files.patch
 create mode 100644 meta-oe/recipes-devtools/json-spirit/json-spirit/json_spirit_v4.08.zip
 create mode 100644 meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb

diff --git a/meta-oe/recipes-devtools/json-spirit/json-spirit/0001-Adjust-the-cmake-files.patch b/meta-oe/recipes-devtools/json-spirit/json-spirit/0001-Adjust-the-cmake-files.patch
new file mode 100644
index 0000000..f7030c5
--- /dev/null
+++ b/meta-oe/recipes-devtools/json-spirit/json-spirit/0001-Adjust-the-cmake-files.patch
@@ -0,0 +1,145 @@
+From d8986cb065e770017ee1622fb7324387ead60203 Mon Sep 17 00:00:00 2001
+From: Ming Liu <peter.x.liu@external.atlascopco.com>
+Date: Tue, 7 Mar 2017 11:46:52 +0100
+Subject: [PATCH] Adjust the cmake files
+
+- Remove json_test which can not build with boost 1.61.0.
+- Build shared library as well with the original static library.
+- Add FindLibJsonSpirit.cmake to be able to be found by the dependers.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
+---
+ CMakeLists.txt             |  8 +++---
+ FindLibJsonSpirit.cmake    | 64 ++++++++++++++++++++++++++++++++++++++++++++++
+ json_spirit/CMakeLists.txt | 16 +++++++++++-
+ 3 files changed, 83 insertions(+), 5 deletions(-)
+ create mode 100644 FindLibJsonSpirit.cmake
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 4637a6c..b292f0f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ CMAKE_MINIMUM_REQUIRED(VERSION 2.6)
+ 
+ PROJECT(json_spirit)
+-SUBDIRS(json_spirit json_demo json_headers_only_demo json_map_demo json_test)
++SUBDIRS(json_spirit json_demo json_headers_only_demo json_map_demo)
+ INCLUDE_DIRECTORIES(json_spirit)
+ 
+ INSTALL(
+@@ -16,11 +16,11 @@ INSTALL(
+   ${CMAKE_SOURCE_DIR}/json_spirit/json_spirit_writer.h
+   ${CMAKE_SOURCE_DIR}/json_spirit/json_spirit_writer_template.h
+   ${CMAKE_SOURCE_DIR}/json_spirit/json_spirit_writer_options.h
+-  DESTINATION include)
++  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
+ 
+ INSTALL(
+   FILES
+-  ${CMAKE_BINARY_DIR}/json_spirit/libjson_spirit.a
+-  DESTINATION lib)
++  ${CMAKE_SOURCE_DIR}/FindLibJsonSpirit.cmake
++  DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/cmake/Modules)
+ 
+ INCLUDE(CPack)
+diff --git a/FindLibJsonSpirit.cmake b/FindLibJsonSpirit.cmake
+new file mode 100644
+index 0000000..7ee7687
+--- /dev/null
++++ b/FindLibJsonSpirit.cmake
+@@ -0,0 +1,64 @@
++# FindLibJsonSpirit - Find libjson_spirit headers and libraries.
++#
++# Sample:
++#
++#   SET( LibJsonSpirit_USE_STATIC_LIBS OFF )
++#   FIND_PACKAGE( LibJsonSpirit REQUIRED )
++#   IF( LibJsonSpirit_FOUND )
++#      INCLUDE_DIRECTORIES( ${LibJsonSpirit_INCLUDE_DIRS} )
++#      TARGET_LINK_LIBRARIES( ... ${LibJsonSpirit_LIBRARIES} )
++#   ENDIF()
++#
++# Variables used by this module need to be set before calling find_package
++#
++#   LibJsonSpirit_USE_STATIC_LIBS	Can be set to ON to force the use of the static
++#					libjson_spirit libraries. Defaults to OFF.
++#
++# Variables provided by this module:
++#
++#   LibJsonSpirit_FOUND		Include dir, libjson_spirit libraries.
++#
++#   LibJsonSpirit_LIBRARIES	Link to these to use all the libraries you specified.
++#
++#   LibJsonSpirit_INCLUDE_DIRS	Include directories.
++#
++# For each component you specify in find_package(), the following (UPPER-CASE)
++# variables are set to pick and choose components instead of just using
++# LibJsonSpirit_LIBRARIES:
++#
++#   LIBJSONSPIRIT_FOUND			TRUE if libjson_spirit was found
++#   LIBJSONSPIRIT_LIBRARY		libjson_spirit library
++#
++
++# Support preference of static libs by adjusting CMAKE_FIND_LIBRARY_SUFFIXES
++IF(LibJsonSpirit_USE_STATIC_LIBS)
++    SET( _ORIG_CMAKE_FIND_LIBRARY_SUFFIXES ${CMAKE_FIND_LIBRARY_SUFFIXES})
++    SET(CMAKE_FIND_LIBRARY_SUFFIXES .a )
++ENDIF()
++
++# Look for the header files
++UNSET(LibJsonSpirit_INCLUDE_DIRS CACHE)
++FIND_PATH(LibJsonSpirit_INCLUDE_DIRS NAMES json_spirit.h)
++
++# Look for the core library
++UNSET(LIBJSONSPIRIT_LIBRARY CACHE)
++FIND_LIBRARY(LIBJSONSPIRIT_LIBRARY NAMES json_spirit)
++FIND_PACKAGE_HANDLE_STANDARD_ARGS(LibJsonSpirit DEFAULT_MSG LIBJSONSPIRIT_LIBRARY LibJsonSpirit_INCLUDE_DIRS)
++MARK_AS_ADVANCED(
++    LIBJSONSPIRIT_FOUND
++    LIBJSONSPIRIT_LIBRARY
++)
++
++# Prepare return values and collectiong more components
++SET(LibJsonSpirit_FOUND ${LIBJSONSPIRIT_FOUND})
++SET(LibJsonSpirit_LIBRARIES ${LIBJSONSPIRIT_LIBRARY})
++MARK_AS_ADVANCED(
++    LibJsonSpirit_FOUND
++    LibJsonSpirit_LIBRARIES
++    LibJsonSpirit_INCLUDE_DIRS
++)
++
++# Restore CMAKE_FIND_LIBRARY_SUFFIXES
++IF(LibJsonSpirit_USE_STATIC_LIBS)
++    SET(CMAKE_FIND_LIBRARY_SUFFIXES ${_ORIG_CMAKE_FIND_LIBRARY_SUFFIXES} )
++ENDIF()
+diff --git a/json_spirit/CMakeLists.txt b/json_spirit/CMakeLists.txt
+index fb52818..c1613b2 100644
+--- a/json_spirit/CMakeLists.txt
++++ b/json_spirit/CMakeLists.txt
+@@ -13,5 +13,19 @@ json_spirit_writer_template.h )
+ FIND_PACKAGE(Boost 1.34 REQUIRED)
+ INCLUDE_DIRECTORIES(${Boost_INCLUDE_DIR})
+ 
+-ADD_LIBRARY(json_spirit STATIC ${JSON_SPIRIT_SRCS})
++SET(JSONSPIRIT_SOVERSION_MAJOR "4")
++SET(JSONSPIRIT_SOVERSION_MINOR "0")
++SET(JSONSPIRIT_SOVERSION_PATCH "8")
+ 
++ADD_LIBRARY(json_spirit SHARED ${JSON_SPIRIT_SRCS})
++SET_TARGET_PROPERTIES(json_spirit PROPERTIES PROJECT_LABEL "Json Spirit Library")
++SET_TARGET_PROPERTIES(json_spirit PROPERTIES COMPILE_FLAGS ${CMAKE_SHARED_LIBRARY_C_FLAGS})
++SET_TARGET_PROPERTIES(json_spirit PROPERTIES VERSION ${JSONSPIRIT_SOVERSION_MAJOR}.${JSONSPIRIT_SOVERSION_MINOR}.${JSONSPIRIT_SOVERSION_PATCH})
++SET_TARGET_PROPERTIES(json_spirit PROPERTIES SOVERSION ${JSONSPIRIT_SOVERSION_MAJOR})
++INSTALL(TARGETS json_spirit DESTINATION ${CMAKE_INSTALL_LIBDIR})
++
++ADD_LIBRARY(json_spirit_static STATIC ${JSON_SPIRIT_SRCS})
++SET_TARGET_PROPERTIES(json_spirit_static PROPERTIES PROJECT_LABEL "Json Spirit Static Library")
++SET_TARGET_PROPERTIES(json_spirit_static PROPERTIES OUTPUT_NAME "json_spirit")
++SET_TARGET_PROPERTIES(json_spirit_static PROPERTIES SOVERSION ${JSONSPIRIT_SOVERSION_MAJOR})
++INSTALL(TARGETS json_spirit_static DESTINATION ${CMAKE_INSTALL_LIBDIR})
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-devtools/json-spirit/json-spirit/json_spirit_v4.08.zip b/meta-oe/recipes-devtools/json-spirit/json-spirit/json_spirit_v4.08.zip
new file mode 100644
index 0000000000000000000000000000000000000000..27d46b15a3fc8131dbc4a078a1bc022a00e18d0b
GIT binary patch
literal 56299
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
E08Lf8O8@`>

literal 0
HcmV?d00001

diff --git a/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb b/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
new file mode 100644
index 0000000..dff6cc1
--- /dev/null
+++ b/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
@@ -0,0 +1,24 @@
+SUMMARY = "A C++ JSON Parser/Generator Implemented with Boost Spirit."
+DESCRIPTION = "JSON Spirit, a C++ library that reads and writes JSON files or streams. \
+It is written using the Boost Spirit parser generator. If you are \
+already using Boost, you can use JSON Spirit without any additional \
+dependencies."
+HOMEPAGE = "https://www.codeproject.com/kb/recipes/json_spirit.aspx"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=278ef6183dec4aae1524fccc4b0113c9"
+
+SRC_URI = "file://json_spirit_v${PV}.zip \
+           file://0001-Adjust-the-cmake-files.patch \
+"
+
+S = "${WORKDIR}/json_spirit_v${PV}"
+
+DEPENDS = "boost"
+
+inherit cmake
+
+FILES_${PN}-dev += "${datadir}/cmake/Modules/FindLibJsonSpirit.cmake"
+
+BBCLASSEXTEND += "nativesdk"
-- 
1.9.1


