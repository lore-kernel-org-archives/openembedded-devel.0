Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id B8AC971AB8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 00:54:35 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id e9so14533614pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 16:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=UU+nvIFLyhCxR53P8E517IlrTFDd7EHImdmrZOVLCkg=;
	b=Rp5FNuVg0rT7/dIicPDJ/VhSpy/C/n/i3iGEyzJDHSh6QM97c82hT+a6Tt3IuxWayp
	SAuEOo5ZlA8jk1u6maAuh3PjB6J2GGNJLHKKqIEEaC2P9FONj4gVTXKJPBabltYFcm6U
	Eqh4jSG15PQ4/7fkzlVwdX5eMr0ya6O1gjbE9Nw6jTPgIzQSDQTinsDXruSte0f13TDO
	PuKNIk9dGQoAnCl23tqMVG9NDImQ6L0zpzW0tqX0lyl7DFUvmG8ok8X6PeaNWaAa8AZi
	8g4RBq/aNS435YHOctXPJ5TCrYHJRMHnzCautjdFuG/nxqP3PwlRG29Yvz77SJhlNu5A
	2nWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UU+nvIFLyhCxR53P8E517IlrTFDd7EHImdmrZOVLCkg=;
	b=LA9LrybylulGzIoDc2Hkbe/5W4dfWaDxuDNYv9MRVju6Eisb0jvd7xLiUy2utsD6BU
	HknGm0e6jqoMP5oJrdRaQD3ON0pyaJRWYk4i7m0ovSf0xlX4vK608hJ6i6dGN5UCNyWH
	f4myFegKF9x+mMoHDoNI0mbHRTtqo4OTWIjjcnpsxHXr5Vh5WUW7wAg73FIcGEeLhmlk
	2Rq1JMqSnZMGqhOGVoDl8AoRs6HpLjk94r/rAeEw1dMo0n/dFzy8//w7jll67kvvy+oe
	ykI/5iHM+cSAOM4qzQ0waoYDtwUWSdYtJOzkV94sBtLLZnNP4YddERnimb+F3Y8EYqgk
	78uw==
X-Gm-Message-State: AKaTC03OFByeR7Erve+wc/eeEgLhJaI8//3qEBoq46avaMi4rgaQGtNQcU1Cjb9G0QMvAg==
X-Received: by 10.84.211.7 with SMTP id b7mr55274221pli.83.1480380876972;
	Mon, 28 Nov 2016 16:54:36 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	b71sm89857215pfj.62.2016.11.28.16.54.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Nov 2016 16:54:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Nov 2016 16:54:30 -0800
Message-Id: <20161129005430.15004-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-multimedia][PATCH] kodi-17: Fix build for qemuarm and update to latest
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
X-List-Received-Date: Tue, 29 Nov 2016 00:54:36 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...re-pass-on-unknown-architectures-setting-.patch | 54 ++++++++++++++
 ...Revert-droid-fix-builds-with-AML-disabled.patch | 87 ++++++++++++++++++++++
 .../recipes-mediacenter/kodi/kodi_17.bb            |  4 +-
 3 files changed, 144 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-17/0011-Let-configure-pass-on-unknown-architectures-setting-.patch
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-17/0012-Revert-droid-fix-builds-with-AML-disabled.patch

diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0011-Let-configure-pass-on-unknown-architectures-setting-.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0011-Let-configure-pass-on-unknown-architectures-setting-.patch
new file mode 100644
index 0000000..7ee44f1
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0011-Let-configure-pass-on-unknown-architectures-setting-.patch
@@ -0,0 +1,54 @@
+From 19a1ffc1450bd3ecfb7419d74c733b2e16bf47f3 Mon Sep 17 00:00:00 2001
+From: Balint Reczey <balint@balintreczey.hu>
+Date: Wed, 26 Aug 2015 08:14:41 +0200
+Subject: [PATCH 11/12] Let configure pass on unknown architectures setting
+ sane defaults
+
+This helps porting Kodi to new architectures while emitting warnings about
+entering uncharted territory.
+---
+ configure.ac    | 3 ++-
+ m4/xbmc_arch.m4 | 6 ++++--
+ 2 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 925466a..8369615 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -658,7 +658,8 @@ case $host in
+      USE_STATIC_FFMPEG=1
+      ;;
+   *)
+-     AC_MSG_ERROR(unsupported host ($host))
++    ARCH=$host_cpu"-"$host_os
++    AC_MSG_WARN([unsupported host ($host), guessing ARCH as $ARCH.])
+ esac
+ AC_SUBST([ARCH])
+ 
+diff --git a/m4/xbmc_arch.m4 b/m4/xbmc_arch.m4
+index ff5dc20..dfb45fd 100644
+--- a/m4/xbmc_arch.m4
++++ b/m4/xbmc_arch.m4
+@@ -27,7 +27,8 @@ case $build in
+      AC_SUBST(NATIVE_ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX")
+      ;;
+   *)
+-     AC_MSG_ERROR(unsupported native build platform: $build)
++     AC_MSG_WARN([unsupported native build platform: $build])
++     AC_SUBST(NATIVE_ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX")
+ esac
+ 
+ 
+@@ -70,7 +71,8 @@ case $host in
+      AC_SUBST(ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX -DTARGET_ANDROID")
+      ;;
+   *)
+-     AC_MSG_ERROR(unsupported build target: $host)
++     AC_MSG_WARN([unsupported native build platform: $build])
++     AC_SUBST(ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX")
+ esac
+ 
+ if test "$target_platform" = "target_android" ; then
+-- 
+2.10.2
+
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0012-Revert-droid-fix-builds-with-AML-disabled.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0012-Revert-droid-fix-builds-with-AML-disabled.patch
new file mode 100644
index 0000000..8d70b3f
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0012-Revert-droid-fix-builds-with-AML-disabled.patch
@@ -0,0 +1,87 @@
+From 9e88aa086083b80c05b2bf057b92682186c4e6dc Mon Sep 17 00:00:00 2001
+From: Balint Reczey <balint@balintreczey.hu>
+Date: Thu, 6 Oct 2016 18:12:18 +0200
+Subject: [PATCH 12/12] Revert "[droid] fix builds with AML disabled"
+
+This reverts commit 4733383b8f1c1dd0b95e9e5358425d8a0b7ba8fc.
+---
+ xbmc/utils/SystemInfo.cpp         |  4 ----
+ xbmc/windowing/egl/EGLWrapper.cpp | 16 ++++++----------
+ 2 files changed, 6 insertions(+), 14 deletions(-)
+
+diff --git a/xbmc/utils/SystemInfo.cpp b/xbmc/utils/SystemInfo.cpp
+index fcc6733..52e7fa3 100644
+--- a/xbmc/utils/SystemInfo.cpp
++++ b/xbmc/utils/SystemInfo.cpp
+@@ -57,10 +57,8 @@
+ #include "utils/XMLUtils.h"
+ #if defined(TARGET_ANDROID)
+ #include "platform/android/jni/Build.h"
+-#if defined(HAS_LIBAMCODEC)
+ #include "utils/AMLUtils.h"
+ #endif
+-#endif
+ 
+ /* Platform identification */
+ #if defined(TARGET_DARWIN)
+@@ -873,11 +871,9 @@ bool CSysInfo::IsAeroDisabled()
+ bool CSysInfo::HasHW3DInterlaced()
+ {
+ #if defined(TARGET_ANDROID)
+-#if defined(HAS_LIBAMCODEC)
+   if (aml_hw3d_present())
+     return true;
+ #endif
+-#endif
+   return false;
+ }
+ 
+diff --git a/xbmc/windowing/egl/EGLWrapper.cpp b/xbmc/windowing/egl/EGLWrapper.cpp
+index 30f5757..583d43a 100644
+--- a/xbmc/windowing/egl/EGLWrapper.cpp
++++ b/xbmc/windowing/egl/EGLWrapper.cpp
+@@ -24,19 +24,15 @@
+ #include <assert.h>
+ #if defined(TARGET_ANDROID)
+   #include "EGLNativeTypeAndroid.h"
+-#if defined(HAS_LIBAMCODEC)
+   #include "EGLNativeTypeAmlAndroid.h"
+ #endif
+-#endif
+ #if defined(TARGET_RASPBERRY_PI)
+   #include "EGLNativeTypeRaspberryPI.h"
+ #endif
+ #if defined(HAS_IMXVPU)
+   #include "EGLNativeTypeIMX.h"
+ #endif
+-#if defined(TARGET_LINUX) && defined(HAS_LIBAMCODEC)
+ #include "EGLNativeTypeAmlogic.h"
+-#endif
+ #include "EGLWrapper.h"
+ 
+ #define CheckError() m_result = eglGetError(); if(m_result != EGL_SUCCESS) CLog::Log(LOGERROR, "EGL error in %s: %x",__FUNCTION__, m_result);
+@@ -91,15 +87,15 @@ bool CEGLWrapper::Initialize(const std::string &implementation)
+   // Try to create each backend in sequence and go with the first one
+   // that we know will work
+   if (
+-#if defined(TARGET_ANDROID) && defined(HAS_LIBAMCODEC)
+-      (nativeGuess = CreateEGLNativeType<CEGLNativeTypeAmlAndroid>(implementation))
+-#elif defined(TARGET_ANDROID)
+-      (nativeGuess = CreateEGLNativeType<CEGLNativeTypeAndroid>(implementation))
+-#elif defined(TARGET_RASPBERRY_PI)
++#if defined(TARGET_ANDROID)
++      (nativeGuess = CreateEGLNativeType<CEGLNativeTypeAmlAndroid>(implementation)) ||
++      (nativeGuess = CreateEGLNativeType<CEGLNativeTypeAndroid>(implementation)) ||
++#endif
++#if defined(TARGET_RASPBERRY_PI)
+       (nativeGuess = CreateEGLNativeType<CEGLNativeTypeRaspberryPI>(implementation))
+ #elif defined(HAS_IMXVPU)
+       (nativeGuess = CreateEGLNativeType<CEGLNativeTypeIMX>(implementation))
+-#elif defined(TARGET_LINUX) && defined(HAS_LIBAMCODEC)
++#else
+       (nativeGuess = CreateEGLNativeType<CEGLNativeTypeAmlogic>(implementation))
+ #endif
+       )
+-- 
+2.10.2
+
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
index 4ba0d9e..79b4b85 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
@@ -63,7 +63,7 @@ DEPENDS = " \
 
 PROVIDES = "xbmc"
 
-SRCREV = "59579457e5fa56baae3b3fb2521518ad6fadd14e"
+SRCREV = "c5d944c116e637d0e2f83bb7a9753e7c11a788d8"
 PV = "17.0+gitr${SRCPV}"
 SRC_URI = "git://github.com/xbmc/xbmc.git;branch=master \
            file://0003-configure-don-t-try-to-run-stuff-to-find-tinyxml.patch \
@@ -74,6 +74,8 @@ SRC_URI = "git://github.com/xbmc/xbmc.git;branch=master \
            file://0008-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch \
            file://0009-build-Add-support-for-musl-triplets.patch \
            file://0010-RssReader-Fix-compiler-warning-comparing-pointer-to-.patch \
+           file://0011-Let-configure-pass-on-unknown-architectures-setting-.patch \
+           file://0012-Revert-droid-fix-builds-with-AML-disabled.patch \
 "
 
 SRC_URI_append_libc-musl = " \
-- 
2.10.2


