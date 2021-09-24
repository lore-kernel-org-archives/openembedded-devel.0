Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.2817.1632449447441003572
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Sep 2021 19:10:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PCCvU3vi;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id a9so5508102qvf.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Sep 2021 19:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AAnc8XTVkL4QUsM38OfWD/Wjg+43F5Hj8dCdoASyCKA=;
        b=PCCvU3vizHGv15tqSl2UqV0kitVJk9LSI6IoOzfiEI4vjgpUHf68BGaawWyOIL45EV
         9ZbZGO4Gr+JHFJs3Hn0jVmQoU5d0XHhepbUrg2yWn4LGs1Bv1OPno8KDAcpdgyM8l5x7
         /IOeNAsfslIUdzKHJMcvcF833Ma2WtIrVb3YZEi2iBhGeGQDjZaMv+YicJWPWy3uNeHL
         bKlCB7NYhwvSzgn8Fh19bVjYxWFBjeAO8Jn1cxNStBjVdPyYfFY+Ap/pwPcKvyAtr6/+
         pfNwwRaf68EHmJPc4amSb/JKCg03kTSfeZR10xfFiZfeMuvGsZMgXvML90IrnrJLmzIi
         fjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AAnc8XTVkL4QUsM38OfWD/Wjg+43F5Hj8dCdoASyCKA=;
        b=lbqD/l91WNlbe7J9LFQdah0Hvs1jC//P10Jxu0F2OagMBuTcDZDQCkgDhGUIZf7vCg
         5QuQweJCSVen6Vm0GGkLFLp5uLUDGUFnfiPm+Qcl3uTRT5QayrwHQEweFsNveF+26KrD
         0RFUrjG5zjk9rsqhTvSx/fINvSl+v5T9AHQCesb40q5bFVe6jBHfVouRZUoe+23Cr4GF
         ILiOZyEHI9R1L9D2+RXVx9Qs6t+stkCQ4tYc9/SAyWZZtAyXX5DAUKBdvqtQ+i5ZvjSm
         uRcKKJJglPhpAHVPvsxEQquLqbOombzLoOZVhkKyK7W7iakLY/QF7qp2LE2nsKY8zaga
         1pOg==
X-Gm-Message-State: AOAM530IeNiTAmrTgGgwzdu6Rxc/1ep5qSrzU+2oBMfxvrjvat7lXPyd
	esOr8LkX2ZZeVp4peg9oa7IX9wO6Zng=
X-Google-Smtp-Source: ABdhPJzn1CgS+9bLksoKBA4ekYeRqLjVAUdmqFlwDY3KBgl0/N+aQ5hy824oCabO7s312SgH83enVA==
X-Received: by 2002:a0c:80e4:: with SMTP id 91mr7499415qvb.57.1632449445930;
        Thu, 23 Sep 2021 19:10:45 -0700 (PDT)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d23sm4591871qto.91.2021.09.23.19.10.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 19:10:45 -0700 (PDT)
From: "Trevor Woerner" <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] vk-gl-cts: fix soname linking
Date: Thu, 23 Sep 2021 22:10:40 -0400
Message-Id: <20210924021040.40271-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.30.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code/build explicitly links to the GL library names instead of their
sonames. Update the names that are used for linking so the libraries are
found at runtime.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 ...0001-use-library-sonames-for-linking.patch | 126 ++++++++++++++++++
 .../vk-gl-cts/khronos-cts.inc                 |   1 +
 2 files changed, 127 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-use-library-sonames-for-linking.patch

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-use-library-sonames-for-linking.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-use-library-sonames-for-linking.patch
new file mode 100644
index 000000000..cb396c37d
--- /dev/null
+++ b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-use-library-sonames-for-linking.patch
@@ -0,0 +1,126 @@
+From acd25c4b8d5b7e420a7a89bdfd6551c70de828b3 Mon Sep 17 00:00:00 2001
+From: Trevor Woerner <twoerner@gmail.com>
+Date: Thu, 23 Sep 2021 19:36:43 -0400
+Subject: [PATCH] use library sonames for linking
+
+The recommended "best practices" for applications is to link to library
+sonames (e.g. libGL.so.1) instead of library names (e.g. libGL.so). This
+ensures that applications don't try to use libraries if an incompatible ABI
+change occurs.
+
+Upstream-Status: Submitted [https://github.com/KhronosGroup/VK-GL-CTS/pull/288]
+Signed-off-by: Trevor Woerner <twoerner@gmail.com>
+---
+ framework/egl/egluGLContextFactory.cpp                      | 4 ++--
+ framework/egl/wrapper/eglwLibrary.cpp                       | 2 +-
+ framework/platform/android/tcuAndroidPlatform.cpp           | 2 +-
+ framework/platform/lnx/X11/tcuLnxX11EglDisplayFactory.cpp   | 2 +-
+ .../platform/lnx/wayland/tcuLnxWaylandEglDisplayFactory.cpp | 2 +-
+ framework/platform/surfaceless/tcuSurfacelessPlatform.cpp   | 6 +++---
+ 6 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/framework/egl/egluGLContextFactory.cpp b/framework/egl/egluGLContextFactory.cpp
+index 8fbea2af1..8d42f19eb 100644
+--- a/framework/egl/egluGLContextFactory.cpp
++++ b/framework/egl/egluGLContextFactory.cpp
+@@ -63,7 +63,7 @@ using std::vector;
+ #	if (DE_OS == DE_OS_WIN32)
+ #		define DEQP_GLES2_LIBRARY_PATH "libGLESv2.dll"
+ #	else
+-#		define DEQP_GLES2_LIBRARY_PATH "libGLESv2.so"
++#		define DEQP_GLES2_LIBRARY_PATH "libGLESv2.so.2"
+ #	endif
+ #endif
+ 
+@@ -75,7 +75,7 @@ using std::vector;
+ #	if (DE_OS == DE_OS_WIN32)
+ #		define DEQP_OPENGL_LIBRARY_PATH "opengl32.dll"
+ #	else
+-#		define DEQP_OPENGL_LIBRARY_PATH "libGL.so"
++#		define DEQP_OPENGL_LIBRARY_PATH "libGL.so.1"
+ #	endif
+ #endif
+ 
+diff --git a/framework/egl/wrapper/eglwLibrary.cpp b/framework/egl/wrapper/eglwLibrary.cpp
+index d7e07fe18..ebdf68b14 100644
+--- a/framework/egl/wrapper/eglwLibrary.cpp
++++ b/framework/egl/wrapper/eglwLibrary.cpp
+@@ -148,7 +148,7 @@ DefaultLibrary::~DefaultLibrary (void)
+ const char* DefaultLibrary::getLibraryFileName (void)
+ {
+ #if (DE_OS == DE_OS_ANDROID) || (DE_OS == DE_OS_UNIX)
+-	return "libEGL.so";
++	return "libEGL.so.1";
+ #elif (DE_OS == DE_OS_WIN32)
+ 	return "libEGL.dll";
+ #else
+diff --git a/framework/platform/android/tcuAndroidPlatform.cpp b/framework/platform/android/tcuAndroidPlatform.cpp
+index b9a4c716f..05cec0b49 100644
+--- a/framework/platform/android/tcuAndroidPlatform.cpp
++++ b/framework/platform/android/tcuAndroidPlatform.cpp
+@@ -57,7 +57,7 @@ static const eglu::NativeWindow::Capability		WINDOW_CAPABILITIES		= (eglu::Nativ
+ class NativeDisplay : public eglu::NativeDisplay
+ {
+ public:
+-									NativeDisplay			(void) : eglu::NativeDisplay(DISPLAY_CAPABILITIES), m_library("libEGL.so") {}
++									NativeDisplay			(void) : eglu::NativeDisplay(DISPLAY_CAPABILITIES), m_library("libEGL.so.1") {}
+ 	virtual							~NativeDisplay			(void) {}
+ 
+ 	virtual EGLNativeDisplayType	getLegacyNative			(void)			{ return EGL_DEFAULT_DISPLAY;	}
+diff --git a/framework/platform/lnx/X11/tcuLnxX11EglDisplayFactory.cpp b/framework/platform/lnx/X11/tcuLnxX11EglDisplayFactory.cpp
+index 009c05e18..237c5e16f 100644
+--- a/framework/platform/lnx/X11/tcuLnxX11EglDisplayFactory.cpp
++++ b/framework/platform/lnx/X11/tcuLnxX11EglDisplayFactory.cpp
+@@ -75,7 +75,7 @@ class Library : public eglw::DefaultLibrary
+ {
+ public:
+ 	Library (void)
+-		: eglw::DefaultLibrary("libEGL.so")
++		: eglw::DefaultLibrary("libEGL.so.1")
+ 	{
+ 	}
+ 
+diff --git a/framework/platform/lnx/wayland/tcuLnxWaylandEglDisplayFactory.cpp b/framework/platform/lnx/wayland/tcuLnxWaylandEglDisplayFactory.cpp
+index 97bc3a0ed..3a20d63d3 100644
+--- a/framework/platform/lnx/wayland/tcuLnxWaylandEglDisplayFactory.cpp
++++ b/framework/platform/lnx/wayland/tcuLnxWaylandEglDisplayFactory.cpp
+@@ -66,7 +66,7 @@ public:
+ 													 EGL_PLATFORM_WAYLAND_KHR,
+ 													 "EGL_KHR_platform_wayland")
+ 									, m_display		(waylandDisplay)
+-									, m_library		("libEGL.so") {}
++									, m_library		("libEGL.so.1") {}
+ 
+ 	~Display(void) {}
+ 	wayland::Display&			getWaylandDisplay	(void)	{ return *m_display; }
+diff --git a/framework/platform/surfaceless/tcuSurfacelessPlatform.cpp b/framework/platform/surfaceless/tcuSurfacelessPlatform.cpp
+index 9783eaeab..a1d8ac667 100644
+--- a/framework/platform/surfaceless/tcuSurfacelessPlatform.cpp
++++ b/framework/platform/surfaceless/tcuSurfacelessPlatform.cpp
+@@ -69,7 +69,7 @@ using std::vector;
+ 
+ // Default library names
+ #if !defined(DEQP_GLES2_LIBRARY_PATH)
+-#	define DEQP_GLES2_LIBRARY_PATH "libGLESv2.so"
++#	define DEQP_GLES2_LIBRARY_PATH "libGLESv2.so.2"
+ #endif
+ 
+ #if !defined(DEQP_GLES3_LIBRARY_PATH)
+@@ -77,7 +77,7 @@ using std::vector;
+ #endif
+ 
+ #if !defined(DEQP_OPENGL_LIBRARY_PATH)
+-#	define DEQP_OPENGL_LIBRARY_PATH "libGL.so"
++#	define DEQP_OPENGL_LIBRARY_PATH "libGL.so.1"
+ #endif
+ 
+ namespace tcu
+@@ -238,7 +238,7 @@ glu::RenderContext* ContextFactory::createContext(const glu::RenderConfig& confi
+ }
+ 
+ EglRenderContext::EglRenderContext(const glu::RenderConfig& config, const tcu::CommandLine& cmdLine)
+-	: m_egl("libEGL.so")
++	: m_egl("libEGL.so.1")
+ 	, m_contextType(config.type)
+ 	, m_eglDisplay(EGL_NO_DISPLAY)
+ 	, m_eglContext(EGL_NO_CONTEXT)
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
index 881d6ca82..1faee4d3a 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
@@ -25,6 +25,7 @@ DEPENDS += "libpng zlib virtual/libgles2"
 SRC_URI += "file://0001-Workaround-for-GCC-11-uninit-variable-warnings-946.patch;patchdir=external/amber/src \
             file://0001-Include-limits-header-for-numeric_limits.patch;patchdir=external/vulkancts \
             file://0001-vulkancts.patch \
+            file://0001-use-library-sonames-for-linking.patch \
 "
 
 SRC_URI:append:libc-musl = "\
-- 
2.30.0.rc0

