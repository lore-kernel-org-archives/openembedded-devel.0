Return-Path: <zhengrq.fnst@cn.fujitsu.com>
X-Greylist: delayed 595 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 15 Nov 2017 10:35:37 UTC
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E3FB37852C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Nov 2017 10:35:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="30198053"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Nov 2017 18:25:42 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 1A8F841860D8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Nov 2017 18:25:38 +0800 (CST)
Received: from localhost.localdomain (10.167.225.116) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 15 Nov 2017 18:25:37 +0800
From: zhengrq <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Nov 2017 00:29:09 +0800
Message-ID: <1510763349-48288-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.116]
X-yoursite-MailScanner-ID: 1A8F841860D8.A8C38
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] freerdp: Update to 2.0.0
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
X-List-Received-Date: Wed, 15 Nov 2017 10:35:38 -0000
Content-Type: text/plain

1) Upgrade freerdp from 1.2.5 to 2.0.0.

2) Delete two patches for they are included in 2.0.0.
   0001-FindGStreamer_1_0-fix-build-failure-for-new-gstreame.patch
   0003-add-missing-define.patch

3) Add one patch 0001-Fix-gstreamer-1.0-detection.patch to fix the do_configure problem:
   | -- Finding required feature XRandR for X11 randr (X11 randr extension)
   | -- Found XRANDR: /yocto/work001/fnst/zrq/community/build_master/tmp/work/i586-poky-linux/freerdp/2.0.0+gitrAUTOINC+1648deb435-r0/recipe-sysroot/usr/lib/libXrandr.so
   | CMake Error at channels/tsmf/client/gstreamer/CMakeLists.txt:21 (message):
   |   GStreamer library not found, but required for TSMF module.

4) Modify the do_install directory from winpr/tools/makecert/cli/ to winpr/tools/makecert-cli/

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...er_1_0-fix-build-failure-for-new-gstreame.patch | 71 ----------------------
 .../freerdp/0001-Fix-gstreamer-1.0-detection.patch | 27 ++++++++
 .../freerdp/freerdp/0003-add-missing-define.patch  | 45 --------------
 .../winpr-makecert-Build-with-install-RPATH.patch  | 28 ++++-----
 meta-oe/recipes-support/freerdp/freerdp_git.bb     |  9 ++-
 5 files changed, 45 insertions(+), 135 deletions(-)
 delete mode 100644 meta-oe/recipes-support/freerdp/freerdp/0001-FindGStreamer_1_0-fix-build-failure-for-new-gstreame.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/0001-Fix-gstreamer-1.0-detection.patch
 delete mode 100644 meta-oe/recipes-support/freerdp/freerdp/0003-add-missing-define.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp/0001-FindGStreamer_1_0-fix-build-failure-for-new-gstreame.patch b/meta-oe/recipes-support/freerdp/freerdp/0001-FindGStreamer_1_0-fix-build-failure-for-new-gstreame.patch
deleted file mode 100644
index d5f6485..0000000
--- a/meta-oe/recipes-support/freerdp/freerdp/0001-FindGStreamer_1_0-fix-build-failure-for-new-gstreame.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From bea27fd919b64ee8d97996409e279e1e83d13594 Mon Sep 17 00:00:00 2001
-From: Jean-Louis Dupond <jean-louis@dupond.be>
-Date: Sun, 4 Oct 2015 18:17:33 +0200
-Subject: [PATCH] FindGStreamer_1_0: fix build failure for new gstreamer
- versions
-
----
- cmake/FindGStreamer_1_0.cmake | 30 +++++++++++++++---------------
- 1 file changed, 15 insertions(+), 15 deletions(-)
-
-diff --git a/cmake/FindGStreamer_1_0.cmake b/cmake/FindGStreamer_1_0.cmake
-index f7bf990..3aa8fc6 100644
---- a/cmake/FindGStreamer_1_0.cmake
-+++ b/cmake/FindGStreamer_1_0.cmake
-@@ -53,17 +53,17 @@ set(GSTREAMER_1_0_MINIMUM_VERSION 1.0.5)
- # Helper macro to find a Gstreamer plugin (or Gstreamer itself)
- #   _component_prefix is prepended to the _INCLUDE_DIRS and _LIBRARIES variables (eg. "GSTREAMER_1_0_AUDIO")
- #   _pkgconfig_name is the component's pkg-config name (eg. "gstreamer-1.0", or "gstreamer-video-1.0").
--#   _header is the component's header, relative to the gstreamer-1.0 directory (eg. "gst/gst.h").
- #   _library is the component's library name (eg. "gstreamer-1.0" or "gstvideo-1.0")
--macro(FIND_GSTREAMER_COMPONENT _component_prefix _pkgconfig_name _header _library)
-+macro(FIND_GSTREAMER_COMPONENT _component_prefix _pkgconfig_name _library)
-     # FIXME: The QUIET keyword can be used once we require CMake 2.8.2.
--    pkg_check_modules(PC_${_component_prefix} ${_pkgconfig_name})
- 
--    find_path(${_component_prefix}_INCLUDE_DIRS
--        NAMES ${_header}
--        HINTS ${PC_${_component_prefix}_INCLUDE_DIRS} ${PC_${_component_prefix}_INCLUDEDIR}
--        PATH_SUFFIXES gstreamer-1.0
--    )
-+    string(REGEX MATCH "(.*)>=(.*)" _dummy "${_pkgconfig_name}")
-+    if ("${CMAKE_MATCH_2}" STREQUAL "")
-+        pkg_check_modules(PC_${_component_prefix} "${_pkgconfig_name} >= ${GStreamer_FIND_VERSION}")
-+    else ()
-+        pkg_check_modules(PC_${_component_prefix} ${_pkgconfig_name})
-+    endif ()
-+    set(${_component_prefix}_INCLUDE_DIRS ${PC_${_component_prefix}_INCLUDE_DIRS})
- 
-     find_library(${_component_prefix}_LIBRARIES
-         NAMES ${_library} gstreamer_android
-@@ -78,8 +78,8 @@ endmacro()
- # 1.1. Find headers and libraries
- set(GLIB_ROOT_DIR ${GSTREAMER_1_0_ROOT_DIR})
- find_package(Glib REQUIRED)
--FIND_GSTREAMER_COMPONENT(GSTREAMER_1_0 gstreamer-1.0 gst/gst.h gstreamer-1.0)
--FIND_GSTREAMER_COMPONENT(GSTREAMER_1_0_BASE gstreamer-base-1.0 gst/gst.h gstbase-1.0)
-+FIND_GSTREAMER_COMPONENT(GSTREAMER_1_0 gstreamer-1.0 gstreamer-1.0)
-+FIND_GSTREAMER_COMPONENT(GSTREAMER_1_0_BASE gstreamer-base-1.0 gstbase-1.0)
- 
- # 1.2. Check Gstreamer version
- if (GSTREAMER_1_0_INCLUDE_DIRS)
-@@ -110,11 +110,11 @@ endif ()
- # 2. Find Gstreamer plugins
- # -------------------------
- 
--FIND_GSTREAMER_COMPONENT(GSTREAMER_1_0_APP gstreamer-app-1.0 gst/app/gstappsink.h gstapp-1.0)
--FIND_GSTREAMER_COMPONENT(GSTREAMER_1_0_AUDIO gstreamer-audio-1.0 gst/audio/audio.h gstaudio-1.0)
--FIND_GSTREAMER_COMPONENT(GSTREAMER_1_0_FFT gstreamer-fft-1.0 gst/fft/gstfft.h gstfft-1.0)
--FIND_GSTREAMER_COMPONENT(GSTREAMER_1_0_PBUTILS gstreamer-pbutils-1.0 gst/pbutils/pbutils.h gstpbutils-1.0)
--FIND_GSTREAMER_COMPONENT(GSTREAMER_1_0_VIDEO gstreamer-video-1.0 gst/video/video.h gstvideo-1.0)
-+FIND_GSTREAMER_COMPONENT(GSTREAMER_1_0_APP gstreamer-app-1.0 gstapp-1.0)
-+FIND_GSTREAMER_COMPONENT(GSTREAMER_1_0_AUDIO gstreamer-audio-1.0 gstaudio-1.0)
-+FIND_GSTREAMER_COMPONENT(GSTREAMER_1_0_FFT gstreamer-fft-1.0 gstfft-1.0)
-+FIND_GSTREAMER_COMPONENT(GSTREAMER_1_0_PBUTILS gstreamer-pbutils-1.0 gstpbutils-1.0)
-+FIND_GSTREAMER_COMPONENT(GSTREAMER_1_0_VIDEO gstreamer-video-1.0 gstvideo-1.0)
- 
- # ------------------------------------------------
- # 3. Process the COMPONENTS passed to FIND_PACKAGE
--- 
-2.6.4
-
diff --git a/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-gstreamer-1.0-detection.patch b/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-gstreamer-1.0-detection.patch
new file mode 100644
index 0000000..a567cba
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-gstreamer-1.0-detection.patch
@@ -0,0 +1,27 @@
+From 368989526c32cdf9d680a397fede3cb773fa2609 Mon Sep 17 00:00:00 2001
+From: Mike Gilbert <floppym@gentoo.org>
+Date: Fri, 28 Jul 2017 16:31:41 -0400
+Subject: [PATCH] Fix gstreamer-1.0 detection
+
+Upstream State: Backport
+
+---
+ cmake/FindGStreamer_1_0.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cmake/FindGStreamer_1_0.cmake b/cmake/FindGStreamer_1_0.cmake
+index 3aa8fc6..6fbc0ec 100644
+--- a/cmake/FindGStreamer_1_0.cmake
++++ b/cmake/FindGStreamer_1_0.cmake
+@@ -59,7 +59,7 @@ macro(FIND_GSTREAMER_COMPONENT _component_prefix _pkgconfig_name _library)
+ 
+     string(REGEX MATCH "(.*)>=(.*)" _dummy "${_pkgconfig_name}")
+     if ("${CMAKE_MATCH_2}" STREQUAL "")
+-        pkg_check_modules(PC_${_component_prefix} "${_pkgconfig_name} >= ${GStreamer_FIND_VERSION}")
++        pkg_check_modules(PC_${_component_prefix} "${_pkgconfig_name} >= ${GSTREAMER_1_0_MINIMUM_VERSION}")
+     else ()
+         pkg_check_modules(PC_${_component_prefix} ${_pkgconfig_name})
+     endif ()
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/freerdp/freerdp/0003-add-missing-define.patch b/meta-oe/recipes-support/freerdp/freerdp/0003-add-missing-define.patch
deleted file mode 100644
index 220edef..0000000
--- a/meta-oe/recipes-support/freerdp/freerdp/0003-add-missing-define.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-libwinpr/comm_seria: fix missing define
-
-FreeRDP uses CMSPAR, which is defined by glibc in bits/termios.h .
-
-glibc has two flavours of bits/termios.h: a genmeric one and an
-architecture-specific one. When installing, glibc will install the
-architecture-specific file if it exists, otherwise it installs the
-generic file. Only Alpha, MIPS, PPC and Sparc have their own
-bits/termios.h.
-
-The generic bits/termios.h, as well as the Alpha, PPC and Sparc flavours
-do define CMSPAR. However, the MIPS flavour does not define it.
-
-Define CMSPAR to the value from the generic value, which is also the
-value known to the Linux kernel for MIPS.
-
-Fixes:
-    http://autobuild.buildroot.org/results/0b4/0b4793f0bf9f4c57933897f3480054a4e06528ad/
-    http://autobuild.buildroot.org/results/7a2/7a2284d0a2987158fa2e78f789b07c8c6fcdb974/
-    http://autobuild.buildroot.org/results/387/3874088c3ccd4bbf76ea0c911ca1ef64c7dc9d1c/
-    ...
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Cc: Peter Korsgaard <jacmet@uclibc.org>
-Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-diff -durN freerdp-17834af7bb378f85a3b3cc4dcadaa5125a337e16.orig/winpr/libwinpr/comm/comm_serial_sys.c freerdp-17834af7bb378f85a3b3cc4dcadaa5125a337e16/winpr/libwinpr/comm/comm_serial_sys.c
---- freerdp-17834af7bb378f85a3b3cc4dcadaa5125a337e16.orig/winpr/libwinpr/comm/comm_serial_sys.c	2015-09-04 16:20:17.000000000 +0100
-+++ freerdp-17834af7bb378f85a3b3cc4dcadaa5125a337e16/winpr/libwinpr/comm/comm_serial_sys.c	2015-10-04 11:07:41.868513726 +0100
-@@ -27,6 +27,14 @@
- #include <fcntl.h>
- #include <sys/ioctl.h>
- #include <termios.h>
-+
-+/* glibc for MIPS has its own bits/termios.h which does not define
-+ * CMSPAR, so we vampirise the value from the generic bits/termios.h
-+ */
-+#ifndef CMSPAR
-+#define CMSPAR 010000000000
-+#endif
-+
- #include <unistd.h>
- 
- #include "comm_serial_sys.h"
-
diff --git a/meta-oe/recipes-support/freerdp/freerdp/winpr-makecert-Build-with-install-RPATH.patch b/meta-oe/recipes-support/freerdp/freerdp/winpr-makecert-Build-with-install-RPATH.patch
index d279d6d..0d7dcc2 100644
--- a/meta-oe/recipes-support/freerdp/freerdp/winpr-makecert-Build-with-install-RPATH.patch
+++ b/meta-oe/recipes-support/freerdp/freerdp/winpr-makecert-Build-with-install-RPATH.patch
@@ -1,31 +1,31 @@
-From 253eafc8c8da83fc2b1a99a9e43824efc6105c7a Mon Sep 17 00:00:00 2001
-From: Manuel Bachmann <manuel.bachmann@iot.bzh>
-Date: Sun, 4 Oct 2015 10:44:49 +0200
 Subject: [PATCH] winpr-makecert: Build with install RPATH
 
 As we are installing "winpr-makecert" manually, we do want
 to refer to the library in DESTDIR, not the one resting in
 the build tree.
 
+Update it for 2.0.0.
+
 Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 ---
- winpr/tools/makecert/cli/CMakeLists.txt | 4 ++++
- 1 file changed, 4 insertions(+)
+ winpr/tools/makecert-cli/CMakeLists.txt | 3 +++
+ 1 file changed, 3 insertions(+)
 
-diff --git a/winpr/tools/makecert/cli/CMakeLists.txt b/winpr/tools/makecert/cli/CMakeLists.txt
-index 17954c4..90c446b 100644
---- a/winpr/tools/makecert/cli/CMakeLists.txt
-+++ b/winpr/tools/makecert/cli/CMakeLists.txt
-@@ -45,5 +45,9 @@ set(${MODULE_PREFIX}_LIBS winpr-makecert-tool)
+diff --git a/winpr/tools/makecert-cli/CMakeLists.txt b/winpr/tools/makecert-cli/CMakeLists.txt
+index 74afa09..8d00ef1 100644
+--- a/winpr/tools/makecert-cli/CMakeLists.txt
++++ b/winpr/tools/makecert-cli/CMakeLists.txt
+@@ -44,6 +44,9 @@ set(${MODULE_PREFIX}_LIBS winpr-tools)
  
  target_link_libraries(${MODULE_NAME} ${${MODULE_PREFIX}_LIBS})
  
-+set_target_properties(${MODULE_NAME} PROPERTIES 
-+	BUILD_WITH_INSTALL_RPATH 1)
++set_target_properties(${MODULE_NAME} PROPERTIES
++       BUILD_WITH_INSTALL_RPATH 1)
 +
  set_property(TARGET ${MODULE_NAME} PROPERTY FOLDER "WinPR/Tools")
  
-+
+ install(TARGETS ${MODULE_NAME} DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT tools EXPORT WinPRTargets)
 -- 
-1.8.3.1
+2.7.4
 
diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/recipes-support/freerdp/freerdp_git.bb
index f0aa1b6..88aec9c 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
@@ -10,14 +10,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pkgconfig cmake gitpkgv
 
-PV = "1.2.5+gitr${SRCPV}"
+PV = "2.0.0+gitr${SRCPV}"
 PKGV = "${GITPKGVTAG}"
 
-SRCREV = "62da9d28c674814c81c245c1c7882eb0da7be76b"
+SRCREV = "1648deb435ad52206f7aa2afe4b4dff71d9329bc"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git \
     file://winpr-makecert-Build-with-install-RPATH.patch \
-    file://0001-FindGStreamer_1_0-fix-build-failure-for-new-gstreame.patch \
-    file://0003-add-missing-define.patch \
+    file://0001-Fix-gstreamer-1.0-detection.patch \
 "
 
 S = "${WORKDIR}/git"
@@ -57,7 +56,7 @@ PACKAGES_DYNAMIC += "^libfreerdp-plugin-.*"
 # we will need winpr-makecert to generate TLS certificates
 do_install_append () {
     install -d ${D}${bindir}
-    install -m755 winpr/tools/makecert/cli/winpr-makecert ${D}${bindir}
+    install -m755 winpr/tools/makecert-cli/winpr-makecert ${D}${bindir}
     rm -rf ${D}${libdir}/cmake
     rm -rf ${D}${libdir}/freerdp
 }
-- 
2.7.4




