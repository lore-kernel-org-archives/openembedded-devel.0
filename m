Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8EF387487E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 03:27:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6P3RasX010302
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 20:27:36 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Tue, 24 Jul 2018 20:27:35 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Jul 2018 11:27:23 +0800
Message-ID: <1532489252-246963-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1532489252-246963-1-git-send-email-changqing.li@windriver.com>
References: <1532489252-246963-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH][meta-networking] c-ares: upgrade 1.13.0 -> 1.14.0
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
X-List-Received-Date: Wed, 25 Jul 2018 03:27:35 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

License-Update: copyright year updated 

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../c-ares/c-ares/cmake-install-libcares.pc.patch  | 37 +++++++++++++---------
 .../c-ares/{c-ares_1.13.0.bb => c-ares_1.14.0.bb}  |  6 ++--
 2 files changed, 25 insertions(+), 18 deletions(-)
 rename meta-networking/recipes-support/c-ares/{c-ares_1.13.0.bb => c-ares_1.14.0.bb} (76%)

diff --git a/meta-networking/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch b/meta-networking/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
index 5dd4c7d..8cadb2b 100644
--- a/meta-networking/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
+++ b/meta-networking/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
@@ -1,23 +1,27 @@
-From 7e1ae687916fd5878ee755afbdea6b10494e0b92 Mon Sep 17 00:00:00 2001
-From: Alexey Firago <alexey_firago@mentor.com>
-Date: Wed, 26 Jul 2017 23:21:25 +0300
+From 12414304245cce6ef0e8b9547949be5109845353 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 24 Jul 2018 13:33:33 +0800
 Subject: [PATCH] cmake: Install libcares.pc
 
 Prepare and install libcares.pc file during cmake build, so libraries
 using pkg-config to find libcares will not fail.
 
 Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
+
+update to 1.14.0, fix patch warning
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- CMakeLists.txt      | 21 +++++++++++++++++++++
+ CMakeLists.txt      | 23 +++++++++++++++++++++++
  libcares.pc.cmakein | 20 ++++++++++++++++++++
- 2 files changed, 41 insertions(+)
+ 2 files changed, 43 insertions(+)
  create mode 100644 libcares.pc.cmakein
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 364b6c7..0016b67 100644
+index 60a880c..71eaa53 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -173,21 +173,29 @@ ADD_DEFINITIONS(${SYSFLAGS})
+@@ -193,22 +193,30 @@ ADD_DEFINITIONS(${SYSFLAGS})
  
  
  # Tell C-Ares about libraries to depend on
@@ -43,32 +47,35 @@ index 364b6c7..0016b67 100644
  	LIST (APPEND CARES_DEPENDENT_LIBS ws2_32)
 +	LIST (APPEND CARES_PRIVATE_LIBS_LIST "-lws2_32")
  ENDIF ()
-+string (REPLACE ";" " " CARES_PRIVATE_LIBS "${CARES_PRIVATE_LIBS_LIST}")
  
++string (REPLACE ";" " " CARES_PRIVATE_LIBS "${CARES_PRIVATE_LIBS_LIST}")
  
  # When checking for symbols, we need to make sure we set the proper
-@@ -489,6 +497,13 @@ CONFIGURE_FILE (ares_build.h.cmake ${PROJECT_BINARY_DIR}/ares_build.h)
+ # headers, libraries, and definitions for the detection to work properly
+@@ -514,6 +522,15 @@ CONFIGURE_FILE (ares_build.h.cmake ${PROJECT_BINARY_DIR}/ares_build.h)
  # Write ares_config.h configuration file.  This is used only for the build.
  CONFIGURE_FILE (ares_config.h.cmake ${PROJECT_BINARY_DIR}/ares_config.h)
  
 +# Pass required CFLAGS to pkg-config in case of static library
 +IF (CARES_STATIC)
-+	SET (CPPFLAG_CARES_STATICLIB "-DCARES_STATICLIB")
++       SET (CPPFLAG_CARES_STATICLIB "-DCARES_STATICLIB")
 +ENDIF()
 +
 +# Write ares_config.h configuration file.  This is used only for the build.
 +CONFIGURE_FILE (libcares.pc.cmakein ${PROJECT_BINARY_DIR}/libcares.pc @ONLY)
++
++
  
  # TRANSFORM_MAKEFILE_INC
  #
-@@ -625,6 +640,12 @@ IF (CARES_INSTALL)
- 	INSTALL (FILES "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}-config.cmake" DESTINATION ${CMAKECONFIG_INSTALL_DIR})
+@@ -664,6 +681,12 @@ IF (CARES_INSTALL)
+ 	INSTALL (FILES "${CMAKE_CURRENT_BINARY_DIR}/libcares.pc" DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
  ENDIF ()
  
 +# pkg-config file
 +IF (CARES_INSTALL)
-+	SET (PKGCONFIG_INSTALL_DIR "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
-+	INSTALL (FILES "${CMAKE_CURRENT_BINARY_DIR}/libcares.pc" DESTINATION ${PKGCONFIG_INSTALL_DIR})
++       SET (PKGCONFIG_INSTALL_DIR "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
++       INSTALL (FILES "${CMAKE_CURRENT_BINARY_DIR}/libcares.pc" DESTINATION ${PKGCONFIG_INSTALL_DIR})
 +ENDIF ()
 +
  # Legacy chain-building variables (provided for compatibility with old code).
@@ -76,7 +83,7 @@ index 364b6c7..0016b67 100644
  SET (CARES_FOUND 1 CACHE INTERNAL "CARES LIBRARY FOUND")
 diff --git a/libcares.pc.cmakein b/libcares.pc.cmakein
 new file mode 100644
-index 0000000..f29fede
+index 0000000..3579256
 --- /dev/null
 +++ b/libcares.pc.cmakein
 @@ -0,0 +1,20 @@
diff --git a/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb b/meta-networking/recipes-support/c-ares/c-ares_1.14.0.bb
similarity index 76%
rename from meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb
rename to meta-networking/recipes-support/c-ares/c-ares_1.14.0.bb
index 3c0ce16..09083d3 100644
--- a/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb
+++ b/meta-networking/recipes-support/c-ares/c-ares_1.14.0.bb
@@ -3,15 +3,15 @@ SUMMARY = "c-ares is a C library that resolves names asynchronously."
 HOMEPAGE = "http://daniel.haxx.se/projects/c-ares/"
 SECTION = "libs"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=f4b026880834eb01c035c5e5cb47ccac"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb997454c8d62aa6a47f07a8cd48b006"
 
-PV = "1.13.0+gitr${SRCPV}"
+PV = "1.14.0+gitr${SRCPV}"
 
 SRC_URI = "\
     git://github.com/c-ares/c-ares.git \
     file://cmake-install-libcares.pc.patch \
 "
-SRCREV = "3be1924221e1326df520f8498d704a5c4c8d0cce"
+SRCREV = "17dc1b3102e0dfc3e7e31369989013154ee17893"
 
 UPSTREAM_CHECK_GITTAGREGEX = "cares-(?P<pver>\d+_(\d_?)+)"
 
-- 
2.7.4


