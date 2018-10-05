Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 34271745BA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Oct 2018 13:40:52 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w95Derht011901
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 5 Oct 2018 15:40:53 +0200
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.77.245])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w95Deq28027294;
	Fri, 5 Oct 2018 15:40:52 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id AE279101B038;
	Fri,  5 Oct 2018 15:40:55 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Oct 2018 15:40:51 +0200
Message-Id: <20181005134051.28649-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH] p8platform: update to 2.1.0.1
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
X-List-Received-Date: Fri, 05 Oct 2018 13:40:53 -0000

This also adds a patch that makes the resulting p8-platform-config.cmake
relocatable. Before it contained a hardcoded path to /usr/include.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 ...1-Make-resulting-cmake-config-relocatable.patch | 64 ++++++++++++++++++++++
 .../recipes-extended/p8platform/p8platform_git.bb  |  7 ++-
 2 files changed, 68 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-extended/p8platform/files/0001-Make-resulting-cmake-config-relocatable.patch

diff --git a/meta-oe/recipes-extended/p8platform/files/0001-Make-resulting-cmake-config-relocatable.patch b/meta-oe/recipes-extended/p8platform/files/0001-Make-resulting-cmake-config-relocatable.patch
new file mode 100644
index 000000000..9ff85b12a
--- /dev/null
+++ b/meta-oe/recipes-extended/p8platform/files/0001-Make-resulting-cmake-config-relocatable.patch
@@ -0,0 +1,64 @@
+From 2650bb3bd3644784359be373252b0436873ca8cb Mon Sep 17 00:00:00 2001
+From: Pascal Bach <pascal.bach@siemens.com>
+Date: Fri, 28 Sep 2018 16:44:37 +0200
+Subject: [PATCH] Make resulting cmake config relocatable
+
+This change avoids hardcoded install prefix in the p8-platform-config.cmake.
+Especially important when doing cross compilation with Yocto for example.
+
+Upstream-Status: Submitted [https://github.com/Pulse-Eight/platform/pull/38]
+
+---
+ CMakeLists.txt              |  4 ----
+ p8-platform-config.cmake.in | 13 +++++++++----
+ 2 files changed, 9 insertions(+), 8 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 7144b0b..f2db66e 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -22,10 +22,6 @@ if(WIN32)
+                    src/windows/os-threads.cpp)
+ endif()
+ 
+-set(p8-platform_INCLUDE_DIRS "${CMAKE_INSTALL_PREFIX}/include/p8-platform")
+-IF(WIN32)
+-  LIST(APPEND p8-platform_INCLUDE_DIRS "${CMAKE_INSTALL_PREFIX}/include/p8-platform/windows")
+-ENDIF(WIN32)
+ set(p8-platform_LIBRARIES ${CMAKE_THREAD_LIBS_INIT})
+ 
+ if(NOT ${CORE_SYSTEM_NAME} STREQUAL "")
+diff --git a/p8-platform-config.cmake.in b/p8-platform-config.cmake.in
+index 47f30f1..b08e96c 100644
+--- a/p8-platform-config.cmake.in
++++ b/p8-platform-config.cmake.in
+@@ -9,17 +9,22 @@
+ #  p8-platform_LIBRARY_DIRS - directories in which the libraries are situated
+ #
+ # propagate these properties from one build system to the other
++get_filename_component(_p8-platform_rootdir ${CMAKE_CURRENT_LIST_DIR}/../ ABSOLUTE)
++
+ set (p8-platform_VERSION "@p8-platform_VERSION_MAJOR@.@p8-platform_VERSION_MINOR@")
+-set (p8-platform_INCLUDE_DIRS @p8-platform_INCLUDE_DIRS@ @CMAKE_INSTALL_PREFIX@/include)
+-set (p8-platform_LIBRARY_DIRS "@CMAKE_LIBRARY_OUTPUT_DIRECTORY@")
++set (p8-platform_INCLUDE_DIRS "${_p8-platform_rootdir}/include" "${_p8-platform_rootdir}/include/p8-platform")
++if(WIN32)
++  list(APPEND p8-platform_INCLUDE_DIRS "${_p8-platform_rootdir}/include/p8-platform/windows")
++endif(WIN32)
++set (p8-platform_LIBRARY_DIRS "${_p8-platform_rootdir}")
+ set (p8-platform_LINKER_FLAGS "@p8-platform_LINKER_FLAGS@")
+ set (p8-platform_CONFIG_VARS "@p8-platform_CONFIG_VARS@")
+ 
+ # libraries come from the build tree where this file was generated
+ if(WIN32)
+-  set (p8-platform_LIBRARY "@CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@/p8-platform.lib")
++  set (p8-platform_LIBRARY "${_p8-platform_rootdir}/p8-platform.lib")
+ else(WIN32)
+-  set (p8-platform_LIBRARY "-L@CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@ -lp8-platform")
++  set (p8-platform_LIBRARY "-L${_p8-platform_rootdir} -lp8-platform")
+ endif(WIN32)
+ set (p8-platform_LIBRARIES ${p8-platform_LIBRARY} "@p8-platform_LIBRARIES@")
+ mark_as_advanced (p8-platform_LIBRARY)
+-- 
+2.11.0
+
diff --git a/meta-oe/recipes-extended/p8platform/p8platform_git.bb b/meta-oe/recipes-extended/p8platform/p8platform_git.bb
index f6347c2a4..0690d4ba3 100644
--- a/meta-oe/recipes-extended/p8platform/p8platform_git.bb
+++ b/meta-oe/recipes-extended/p8platform/p8platform_git.bb
@@ -4,10 +4,11 @@ HOMEPAGE = "http://libcec.pulse-eight.com/"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://src/os.h;md5=752555fa94e82005d45fd201fee5bd33"
 
-PV = "2.1.0"
+PV = "2.1.0.1"
 
-SRC_URI = "git://github.com/Pulse-Eight/platform.git"
-SRCREV = "d7bceb64541cb046421cbcd4c98d91e9bf24822f"
+SRC_URI = "git://github.com/Pulse-Eight/platform.git \
+           file://0001-Make-resulting-cmake-config-relocatable.patch"
+SRCREV = "2d90f98620e25f47702c9e848380c0d93f29462b"
 
 S = "${WORKDIR}/git"
 
-- 
2.11.0


