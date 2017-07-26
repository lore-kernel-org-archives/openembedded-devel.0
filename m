Return-Path: <Alexey_Firago@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 4949E77E24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jul 2017 21:08:39 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1daTXt-00043N-7t from Alexey_Firago@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jul 2017 14:08:41 -0700
Received: from localhost.localdomain (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.224.2; Wed, 26 Jul 2017 22:08:38 +0100
From: Alexey Firago <alexey_firago@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 27 Jul 2017 00:08:32 +0300
Message-ID: <1501103312-8843-1-git-send-email-alexey_firago@mentor.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH V2] c-ares: update 1.12.0 -> 1.13.0
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
X-List-Received-Date: Wed, 26 Jul 2017 21:08:40 -0000
Content-Type: text/plain

Update to c-ares version 1.13.0 from June 20 2017

Recipe updates:
 * Change SRC_URI to github, because tarball at
   https://c-ares.haxx.se/download/c-ares-1.13.0.tar.gz
   does not include all required files (cmake related).
 * Change build method to cmake. Library now supports cmake
   build system and installs *.cmake config files. These files can
   be used by several libraries/packages, such as gRPC, curl.
 * Add patch to generate and install libcares.pc during cmake build.
 * Add -utils package for the utilities installed during cmake build
   (acountry, adig, ahost).

Highlights of library changes and bug fixes:
 * cmake build system support added
 * Add virtual function set for socket IO: ares_set_socket_functions
 * CVE-2017-1000381: c-ares NAPTR parser out of bounds access

Full changelog - https://c-ares.haxx.se/changelog.html

Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
---
V1->V2
- Add patch to generate and install libcares.pc during cmake build
- Add -utils package for utility binaries
---
 ...configure.ac-don-t-override-passed-cflags.patch |  26 -----
 .../c-ares/c-ares/cmake-install-libcares.pc.patch  | 105 +++++++++++++++++++++
 .../recipes-support/c-ares/c-ares_1.12.0.bb        |  15 ---
 .../recipes-support/c-ares/c-ares_1.13.0.bb        |  22 +++++
 4 files changed, 127 insertions(+), 41 deletions(-)
 delete mode 100644 meta-networking/recipes-support/c-ares/c-ares/0001-configure.ac-don-t-override-passed-cflags.patch
 create mode 100644 meta-networking/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
 delete mode 100644 meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
 create mode 100644 meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb

diff --git a/meta-networking/recipes-support/c-ares/c-ares/0001-configure.ac-don-t-override-passed-cflags.patch b/meta-networking/recipes-support/c-ares/c-ares/0001-configure.ac-don-t-override-passed-cflags.patch
deleted file mode 100644
index 10fad4e..0000000
--- a/meta-networking/recipes-support/c-ares/c-ares/0001-configure.ac-don-t-override-passed-cflags.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 2a7236d2a7bb9c3d3c3f44ebf59404bf7134fcb3 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@tycoint.com>
-Date: Tue, 12 Apr 2016 11:37:28 +0100
-Subject: [PATCH] configure.ac: don't override passed cflags
-
-We are controlling debug and optimiser flags from OE
----
- configure.ac | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 5c02450..3cf9fcd 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -147,8 +147,6 @@ dnl **********************************************************************
- 
- CARES_CHECK_COMPILER
- CARES_SET_COMPILER_BASIC_OPTS
--CARES_SET_COMPILER_DEBUG_OPTS
--CARES_SET_COMPILER_OPTIMIZE_OPTS
- CARES_SET_COMPILER_WARNING_OPTS
- 
- if test "$compiler_id" = "INTEL_UNIX_C"; then
--- 
-2.8.0.rc3
-
diff --git a/meta-networking/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch b/meta-networking/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
new file mode 100644
index 0000000..5dd4c7d
--- /dev/null
+++ b/meta-networking/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
@@ -0,0 +1,105 @@
+From 7e1ae687916fd5878ee755afbdea6b10494e0b92 Mon Sep 17 00:00:00 2001
+From: Alexey Firago <alexey_firago@mentor.com>
+Date: Wed, 26 Jul 2017 23:21:25 +0300
+Subject: [PATCH] cmake: Install libcares.pc
+
+Prepare and install libcares.pc file during cmake build, so libraries
+using pkg-config to find libcares will not fail.
+
+Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
+---
+ CMakeLists.txt      | 21 +++++++++++++++++++++
+ libcares.pc.cmakein | 20 ++++++++++++++++++++
+ 2 files changed, 41 insertions(+)
+ create mode 100644 libcares.pc.cmakein
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 364b6c7..0016b67 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -173,21 +173,29 @@ ADD_DEFINITIONS(${SYSFLAGS})
+ 
+ 
+ # Tell C-Ares about libraries to depend on
++# Also pass these libraries to pkg-config file
++SET(CARES_PRIVATE_LIBS_LIST)
+ IF (HAVE_LIBRESOLV)
+ 	LIST (APPEND CARES_DEPENDENT_LIBS resolv)
++	LIST (APPEND CARES_PRIVATE_LIBS_LIST "-lresolv")
+ ENDIF ()
+ IF (HAVE_LIBNSL)
+ 	LIST (APPEND CARES_DEPENDENT_LIBS nsl)
++	LIST (APPEND CARES_PRIVATE_LIBS_LIST "-lnsl")
+ ENDIF ()
+ IF (HAVE_LIBSOCKET)
+ 	LIST (APPEND CARES_DEPENDENT_LIBS socket)
++	LIST (APPEND CARES_PRIVATE_LIBS_LIST "-lsocket")
+ ENDIF ()
+ IF (HAVE_LIBRT)
+ 	LIST (APPEND CARES_DEPENDENT_LIBS rt)
++	LIST (APPEND CARES_PRIVATE_LIBS_LIST "-lrt")
+ ENDIF ()
+ IF (WIN32)
+ 	LIST (APPEND CARES_DEPENDENT_LIBS ws2_32)
++	LIST (APPEND CARES_PRIVATE_LIBS_LIST "-lws2_32")
+ ENDIF ()
++string (REPLACE ";" " " CARES_PRIVATE_LIBS "${CARES_PRIVATE_LIBS_LIST}")
+ 
+ 
+ # When checking for symbols, we need to make sure we set the proper
+@@ -489,6 +497,13 @@ CONFIGURE_FILE (ares_build.h.cmake ${PROJECT_BINARY_DIR}/ares_build.h)
+ # Write ares_config.h configuration file.  This is used only for the build.
+ CONFIGURE_FILE (ares_config.h.cmake ${PROJECT_BINARY_DIR}/ares_config.h)
+ 
++# Pass required CFLAGS to pkg-config in case of static library
++IF (CARES_STATIC)
++	SET (CPPFLAG_CARES_STATICLIB "-DCARES_STATICLIB")
++ENDIF()
++
++# Write ares_config.h configuration file.  This is used only for the build.
++CONFIGURE_FILE (libcares.pc.cmakein ${PROJECT_BINARY_DIR}/libcares.pc @ONLY)
+ 
+ # TRANSFORM_MAKEFILE_INC
+ #
+@@ -625,6 +640,12 @@ IF (CARES_INSTALL)
+ 	INSTALL (FILES "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}-config.cmake" DESTINATION ${CMAKECONFIG_INSTALL_DIR})
+ ENDIF ()
+ 
++# pkg-config file
++IF (CARES_INSTALL)
++	SET (PKGCONFIG_INSTALL_DIR "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
++	INSTALL (FILES "${CMAKE_CURRENT_BINARY_DIR}/libcares.pc" DESTINATION ${PKGCONFIG_INSTALL_DIR})
++ENDIF ()
++
+ # Legacy chain-building variables (provided for compatibility with old code).
+ # Don't use these, external code should be updated to refer to the aliases directly (e.g., Cares::cares).
+ SET (CARES_FOUND 1 CACHE INTERNAL "CARES LIBRARY FOUND")
+diff --git a/libcares.pc.cmakein b/libcares.pc.cmakein
+new file mode 100644
+index 0000000..f29fede
+--- /dev/null
++++ b/libcares.pc.cmakein
+@@ -0,0 +1,20 @@
++#***************************************************************************
++# Project        ___       __ _ _ __ ___  ___ 
++#               / __|____ / _` | '__/ _ \/ __|
++#              | (_|_____| (_| | | |  __/\__ \
++#               \___|     \__,_|_|  \___||___/
++#
++prefix=@CMAKE_INSTALL_PREFIX@
++exec_prefix=@CMAKE_INSTALL_PREFIX@
++libdir=@CMAKE_INSTALL_FULL_LIBDIR@
++includedir=@CMAKE_INSTALL_FULL_INCLUDEDIR@
++
++Name: c-ares
++URL: http://daniel.haxx.se/projects/c-ares/
++Description: asynchronous DNS lookup library
++Version: @VERSION@
++Requires: 
++Requires.private: 
++Cflags: -I${includedir} @CPPFLAG_CARES_STATICLIB@
++Libs: -L${libdir} -lcares
++Libs.private: @CARES_PRIVATE_LIBS@
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb b/meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
deleted file mode 100644
index 4e28d6a..0000000
--- a/meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-# Copyright (c) 2012-2014 LG Electronics, Inc.
-
-SUMMARY = "c-ares is a C library that resolves names asynchronously."
-HOMEPAGE = "http://daniel.haxx.se/projects/c-ares/"
-SECTION = "libs"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=f4b026880834eb01c035c5e5cb47ccac"
-
-SRC_URI = "http://c-ares.haxx.se/download/${BP}.tar.gz \
-           file://0001-configure.ac-don-t-override-passed-cflags.patch \
-"
-SRC_URI[md5sum] = "2ca44be1715cd2c5666a165d35788424"
-SRC_URI[sha256sum] = "8692f9403cdcdf936130e045c84021665118ee9bfea905d1a76f04d4e6f365fb"
-
-inherit autotools pkgconfig
diff --git a/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb b/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb
new file mode 100644
index 0000000..8d297aa
--- /dev/null
+++ b/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb
@@ -0,0 +1,22 @@
+# Copyright (c) 2012-2014 LG Electronics, Inc.
+SUMMARY = "c-ares is a C library that resolves names asynchronously."
+HOMEPAGE = "http://daniel.haxx.se/projects/c-ares/"
+SECTION = "libs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=f4b026880834eb01c035c5e5cb47ccac"
+SRCREV = "3be1924221e1326df520f8498d704a5c4c8d0cce"
+PV = "1.13.0+gitr${SRCPV}"
+
+SRC_URI = "\
+    git://github.com/c-ares/c-ares.git \
+    file://cmake-install-libcares.pc.patch \
+"
+
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig
+
+PACKAGES =+ "${PN}-utils"
+
+FILES_${PN}-dev += "${libdir}/cmake"
+FILES_${PN}-utils = "${bindir}"
-- 
2.7.4


