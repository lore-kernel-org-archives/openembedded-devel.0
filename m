Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3130A605FE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jan 2016 13:17:24 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id f206so22681533wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jan 2016 05:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ntmAT/PMUSUTzAnNjPeu5aVcTrF5jrD+U/pIkTnJKTo=;
	b=sJwlQmEeeWrgZ8v3k8ZKjwqr0Kyo4iot/6iJfBNs3mMl1JbTKuXfGQFceDo5zRHxrq
	U26lS8P8j/OHny5XYuubKKClJrxFRZbM0VxPBJ3HKPl1dbLxL4hYcn+dl8ACR2dq3mXI
	ibG4GQ63eBodWzDV0MiA00QBk/Ba8Phvy7T2Q13tLbkmbRsF9gkLwNag8Bz/2g193s0e
	sE756MHSkl8GgnLDVMxWvRLquxEoxq/By8vY27F0SgM36jqpbCae1X6L6qoYQ2zeKYmV
	qZELIF4PZ+yLD1OjSapmz5AVQkxYXuLrHY2HP10iflT5NjeGkVN6uHxWqKQk/EFNTqRH
	0pnA==
X-Received: by 10.194.95.199 with SMTP id dm7mr101320254wjb.15.1451999845193; 
	Tue, 05 Jan 2016 05:17:25 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	193sm3514983wmg.16.2016.01.05.05.17.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Jan 2016 05:17:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Jan 2016 14:17:33 +0100
Message-Id: <1451999853-6848-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH][meta-oe] freerdp: backport patch to fix build with newer gstreamer
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
X-List-Received-Date: Tue, 05 Jan 2016 13:17:25 -0000

* otherwise the include path will miss sysroots/qemux86/usr/lib/gstreamer-1.0/include
* and build will fail like this:
  In file included from /OE/build/oe-core/tmp-glibc/sysroots/qemux86/usr/include/gstreamer-1.0/gst/gstbin.h:27:0,
                 from /OE/build/oe-core/tmp-glibc/sysroots/qemux86/usr/include/gstreamer-1.0/gst/gst.h:35,
                 from /OE/build/oe-core/tmp-glibc/work/i586-oe-linux/freerdp/1.2.5+gitrAUTOINC+62da9d28c6-r0/git/channels/tsmf/client/gstreamer/tsmf_gstreamer.c:36:
  /OE/build/oe-core/tmp-glibc/sysroots/qemux86/usr/include/gstreamer-1.0/gst/gstelement.h:55:27: fatal error: gst/gstconfig.h: No such file or directory
  compilation terminated.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...er_1_0-fix-build-failure-for-new-gstreame.patch | 71 ++++++++++++++++++++++
 meta-oe/recipes-support/freerdp/freerdp_git.bb     |  5 +-
 2 files changed, 74 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/0001-FindGStreamer_1_0-fix-build-failure-for-new-gstreame.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp/0001-FindGStreamer_1_0-fix-build-failure-for-new-gstreame.patch b/meta-oe/recipes-support/freerdp/freerdp/0001-FindGStreamer_1_0-fix-build-failure-for-new-gstreame.patch
new file mode 100644
index 0000000..d5f6485
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/0001-FindGStreamer_1_0-fix-build-failure-for-new-gstreame.patch
@@ -0,0 +1,71 @@
+From bea27fd919b64ee8d97996409e279e1e83d13594 Mon Sep 17 00:00:00 2001
+From: Jean-Louis Dupond <jean-louis@dupond.be>
+Date: Sun, 4 Oct 2015 18:17:33 +0200
+Subject: [PATCH] FindGStreamer_1_0: fix build failure for new gstreamer
+ versions
+
+---
+ cmake/FindGStreamer_1_0.cmake | 30 +++++++++++++++---------------
+ 1 file changed, 15 insertions(+), 15 deletions(-)
+
+diff --git a/cmake/FindGStreamer_1_0.cmake b/cmake/FindGStreamer_1_0.cmake
+index f7bf990..3aa8fc6 100644
+--- a/cmake/FindGStreamer_1_0.cmake
++++ b/cmake/FindGStreamer_1_0.cmake
+@@ -53,17 +53,17 @@ set(GSTREAMER_1_0_MINIMUM_VERSION 1.0.5)
+ # Helper macro to find a Gstreamer plugin (or Gstreamer itself)
+ #   _component_prefix is prepended to the _INCLUDE_DIRS and _LIBRARIES variables (eg. "GSTREAMER_1_0_AUDIO")
+ #   _pkgconfig_name is the component's pkg-config name (eg. "gstreamer-1.0", or "gstreamer-video-1.0").
+-#   _header is the component's header, relative to the gstreamer-1.0 directory (eg. "gst/gst.h").
+ #   _library is the component's library name (eg. "gstreamer-1.0" or "gstvideo-1.0")
+-macro(FIND_GSTREAMER_COMPONENT _component_prefix _pkgconfig_name _header _library)
++macro(FIND_GSTREAMER_COMPONENT _component_prefix _pkgconfig_name _library)
+     # FIXME: The QUIET keyword can be used once we require CMake 2.8.2.
+-    pkg_check_modules(PC_${_component_prefix} ${_pkgconfig_name})
+ 
+-    find_path(${_component_prefix}_INCLUDE_DIRS
+-        NAMES ${_header}
+-        HINTS ${PC_${_component_prefix}_INCLUDE_DIRS} ${PC_${_component_prefix}_INCLUDEDIR}
+-        PATH_SUFFIXES gstreamer-1.0
+-    )
++    string(REGEX MATCH "(.*)>=(.*)" _dummy "${_pkgconfig_name}")
++    if ("${CMAKE_MATCH_2}" STREQUAL "")
++        pkg_check_modules(PC_${_component_prefix} "${_pkgconfig_name} >= ${GStreamer_FIND_VERSION}")
++    else ()
++        pkg_check_modules(PC_${_component_prefix} ${_pkgconfig_name})
++    endif ()
++    set(${_component_prefix}_INCLUDE_DIRS ${PC_${_component_prefix}_INCLUDE_DIRS})
+ 
+     find_library(${_component_prefix}_LIBRARIES
+         NAMES ${_library} gstreamer_android
+@@ -78,8 +78,8 @@ endmacro()
+ # 1.1. Find headers and libraries
+ set(GLIB_ROOT_DIR ${GSTREAMER_1_0_ROOT_DIR})
+ find_package(Glib REQUIRED)
+-FIND_GSTREAMER_COMPONENT(GSTREAMER_1_0 gstreamer-1.0 gst/gst.h gstreamer-1.0)
+-FIND_GSTREAMER_COMPONENT(GSTREAMER_1_0_BASE gstreamer-base-1.0 gst/gst.h gstbase-1.0)
++FIND_GSTREAMER_COMPONENT(GSTREAMER_1_0 gstreamer-1.0 gstreamer-1.0)
++FIND_GSTREAMER_COMPONENT(GSTREAMER_1_0_BASE gstreamer-base-1.0 gstbase-1.0)
+ 
+ # 1.2. Check Gstreamer version
+ if (GSTREAMER_1_0_INCLUDE_DIRS)
+@@ -110,11 +110,11 @@ endif ()
+ # 2. Find Gstreamer plugins
+ # -------------------------
+ 
+-FIND_GSTREAMER_COMPONENT(GSTREAMER_1_0_APP gstreamer-app-1.0 gst/app/gstappsink.h gstapp-1.0)
+-FIND_GSTREAMER_COMPONENT(GSTREAMER_1_0_AUDIO gstreamer-audio-1.0 gst/audio/audio.h gstaudio-1.0)
+-FIND_GSTREAMER_COMPONENT(GSTREAMER_1_0_FFT gstreamer-fft-1.0 gst/fft/gstfft.h gstfft-1.0)
+-FIND_GSTREAMER_COMPONENT(GSTREAMER_1_0_PBUTILS gstreamer-pbutils-1.0 gst/pbutils/pbutils.h gstpbutils-1.0)
+-FIND_GSTREAMER_COMPONENT(GSTREAMER_1_0_VIDEO gstreamer-video-1.0 gst/video/video.h gstvideo-1.0)
++FIND_GSTREAMER_COMPONENT(GSTREAMER_1_0_APP gstreamer-app-1.0 gstapp-1.0)
++FIND_GSTREAMER_COMPONENT(GSTREAMER_1_0_AUDIO gstreamer-audio-1.0 gstaudio-1.0)
++FIND_GSTREAMER_COMPONENT(GSTREAMER_1_0_FFT gstreamer-fft-1.0 gstfft-1.0)
++FIND_GSTREAMER_COMPONENT(GSTREAMER_1_0_PBUTILS gstreamer-pbutils-1.0 gstpbutils-1.0)
++FIND_GSTREAMER_COMPONENT(GSTREAMER_1_0_VIDEO gstreamer-video-1.0 gstvideo-1.0)
+ 
+ # ------------------------------------------------
+ # 3. Process the COMPONENTS passed to FIND_PACKAGE
+-- 
+2.6.4
+
diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/recipes-support/freerdp/freerdp_git.bb
index f9cb9a6..13dff6e 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
@@ -15,7 +15,8 @@ EXTRA_OECMAKE += "-DBUILD_STATIC_LIBS=OFF \
 
 SRCREV = "62da9d28c674814c81c245c1c7882eb0da7be76b"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git \
-           file://winpr-makecert-Build-with-install-RPATH.patch \
-          "
+    file://winpr-makecert-Build-with-install-RPATH.patch \
+    file://0001-FindGStreamer_1_0-fix-build-failure-for-new-gstreame.patch \
+"
 
 S = "${WORKDIR}/git"
-- 
2.6.4


