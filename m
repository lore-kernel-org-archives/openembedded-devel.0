Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web09.10619.1607005459788603765
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Dec 2020 06:24:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Kdnx05AW;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: twoerner@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id g1so2046816ilk.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Dec 2020 06:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3MWQnc498Qq35+OuaYSIJ9/tgSdJLYZEncfqB10aO+w=;
        b=Kdnx05AWOpA/MosXSjnx5HGRijlNh+qbtYFmOBCtNS1IUXFo8gByhOE1v1QvHRtMfZ
         fflzoApMG/F0FvCAt2NKHSKuqdbz5TSw04jjWEZulgie7L142oR/OeKBO1b0TkJAp/j9
         Zy5+lsnbFqaSD77J0iwUyKRTigxv66kvVouOkndH9AAjcCJrbveoUPZzc1VFV+1DODfG
         QFEUKvf0eVEPDCXv7UUl9swDAn5cMF6YSc6SpJsn18Y4e29PjztRlr2+681ak0aZ+OTM
         SB35vZnn2V/bcYPhgA7Q0KzgvqBmq9JP4xQER0lOzRf6aYZHpde6C5hCcBG4IamMX9a5
         DoWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3MWQnc498Qq35+OuaYSIJ9/tgSdJLYZEncfqB10aO+w=;
        b=mV/pCa/vn0DuItnMl4agB1G302OK9rIdLTtW+ArPYYD0yy6tThyMKmWcIsEHKY9xIZ
         CvJcm6khJ4JiwElQhm0XbeicNUw+5h88bIgmPDb6xWb4aLned5fd7HOdAnMilXuT/D70
         2WrjQI230zVw41R9ML7ki+BbUq4Ko3sfodmAAlQrAdeW06EM1LA2IeL3msLyxznT+XV6
         xfgJ+IxIvFJ4OfA4knntm+KF2c8yvPgRAsOcqOylEkLdOUqhfwU0LuAEjFD74Fw9vElA
         Nrk+hl9FXI4JkbmRUk/hN9LeJ+rYbRdm2JLsDCCU5H5hpp433YcmFhEZ2VDUTjPaJZFo
         Ed5A==
X-Gm-Message-State: AOAM53010TvWuOPpl7q96QLqnaFrOdUmKPiFPjkYsJlLgrHXM34UPozD
	grDi9CStJPtugHCkBeK+RA/8sn/cJEN3+w==
X-Google-Smtp-Source: ABdhPJwg2YhyQ0sR2VDRGRO1CC4uBeXdwiuYFCDSJYVJO5TXg9DOsWYLYdpcLvuCjfKZny0pSOM0vw==
X-Received: by 2002:a92:c7ae:: with SMTP id f14mr3137798ilk.202.1607005458817;
        Thu, 03 Dec 2020 06:24:18 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id g1sm744722ioh.39.2020.12.03.06.24.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 06:24:17 -0800 (PST)
From: "Trevor Woerner" <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 3/3] glmark2: add support for dispmanx
Date: Thu,  3 Dec 2020 09:24:07 -0500
Message-Id: <20201203142407.4865-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.28.0.497.g54e85e7af1
In-Reply-To: <20201203142407.4865-1-twoerner@gmail.com>
References: <20201203142407.4865-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upstream glmark2 includes support for running glmark2 on a RaspberryPi via the
dispmanx interface, as is provided by "userland".

The build depends on x11, but this is a quirk of the upstream sources. One
can easily build a minimal image without any x11/wayland on which to run
dispmanx applications directly (including glmark2).

NOTE: unlike with other flavours, one can only build the dispmanx-eglv2
      flavour on its own (this is a constraint of the glmark2 build)

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../files/0001-fix-dispmanx-build.patch       | 125 ++++++++++++++++++
 .../files/0002-run-dispmanx-fullscreen.patch  |  30 +++++
 .../recipes-benchmark/glmark2/glmark2_git.bb  |  20 ++-
 3 files changed, 168 insertions(+), 7 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/glmark2/files/0001-fix-dispmanx-build.patch
 create mode 100644 meta-oe/recipes-benchmark/glmark2/files/0002-run-dispmanx-fullscreen.patch

diff --git a/meta-oe/recipes-benchmark/glmark2/files/0001-fix-dispmanx-build.patch b/meta-oe/recipes-benchmark/glmark2/files/0001-fix-dispmanx-build.patch
new file mode 100644
index 000000000..e9b880c26
--- /dev/null
+++ b/meta-oe/recipes-benchmark/glmark2/files/0001-fix-dispmanx-build.patch
@@ -0,0 +1,125 @@
+From 56e4959f0bc3e442c813d78e8ab6b3bf64b4ac66 Mon Sep 17 00:00:00 2001
+From: OpenEmbedded <oe.patch@oe>
+Date: Wed, 2 Dec 2020 20:27:42 +0000
+Subject: [PATCH] fix dispmanx build
+
+For when the user is building "--with-flavors dispmanx-glesv2", fixes a bunch
+of "redeclared as different kind of symbol" problems.
+
+This patch is almost entirely from:
+	https://github.com/glmark2/glmark2/commit/3b1a0f78d03ae126b78ee52a7c434809115e5993
+
+Which was created by: Alexandros Frantzis <alexandros.frantzis@collabora.com>
+
+See:
+	https://github.com/glmark2/glmark2/issues/80
+
+My contribution is to tweak the wscript to link all the required libraries.
+
+Upstream-status: submitted [https://github.com/glmark2/glmark2/pull/135]
+Signed-off-by: Trevor Woerner <twoerner@gmail.com>
+---
+ src/native-state-dispmanx.cpp | 22 +++++++++++++++++-----
+ src/native-state-dispmanx.h   |  7 +++----
+ wscript                       |  2 +-
+ 3 files changed, 21 insertions(+), 10 deletions(-)
+
+diff --git a/src/native-state-dispmanx.cpp b/src/native-state-dispmanx.cpp
+index 2117386..49f74e7 100644
+--- a/src/native-state-dispmanx.cpp
++++ b/src/native-state-dispmanx.cpp
+@@ -23,13 +23,25 @@
+ #include "native-state-dispmanx.h"
+ #include "log.h"
+ 
++#include "EGL/egl.h"
++
+ #include <cstring>
+ #include <csignal>
+ 
++struct NativeStateDispmanx::Private
++{
++    Private()
++    {
++	memset(&egl_dispmanx_window, 0, sizeof(egl_dispmanx_window));
++    }
++
++    EGL_DISPMANX_WINDOW_T egl_dispmanx_window;
++};
++
+ NativeStateDispmanx::NativeStateDispmanx()
++    : priv{std::make_unique<Private>()}
+ {
+     memset(&properties_, 0, sizeof(properties_));
+-    memset(&egl_dispmanx_window, 0, sizeof(egl_dispmanx_window));
+ }
+ 
+ NativeStateDispmanx::~NativeStateDispmanx()
+@@ -99,9 +111,9 @@ NativeStateDispmanx::create_window(WindowProperties const& properties)
+ 					       0 /*clamp*/,
+ 					       DISPMANX_NO_ROTATE);
+ 
+-    egl_dispmanx_window.element = dispmanx_element;
+-    egl_dispmanx_window.width = dst_rect.width;
+-    egl_dispmanx_window.height = dst_rect.height;
++    priv->egl_dispmanx_window.element = dispmanx_element;
++    priv->egl_dispmanx_window.width = dst_rect.width;
++    priv->egl_dispmanx_window.height = dst_rect.height;
+     vc_dispmanx_update_submit_sync(dispmanx_update);
+ 
+     return true;
+@@ -111,7 +123,7 @@ void*
+ NativeStateDispmanx::window(WindowProperties &properties)
+ {
+     properties = properties_;
+-    return &egl_dispmanx_window;
++    return &priv->egl_dispmanx_window;
+ }
+ 
+ void
+diff --git a/src/native-state-dispmanx.h b/src/native-state-dispmanx.h
+index a6ed3d4..794b2d3 100644
+--- a/src/native-state-dispmanx.h
++++ b/src/native-state-dispmanx.h
+@@ -24,10 +24,8 @@
+ #define GLMARK2_NATIVE_STATE_DISPMANX_H_
+ 
+ #include <vector>
++#include <memory>
+ #include "bcm_host.h"
+-#include "GLES/gl.h"
+-#include "EGL/egl.h"
+-#include "EGL/eglext.h"
+ 
+ #include "native-state.h"
+ 
+@@ -46,11 +44,12 @@ public:
+     void flip();
+ 
+ private:
++    struct Private;
+     DISPMANX_DISPLAY_HANDLE_T dispmanx_display;
+     DISPMANX_UPDATE_HANDLE_T dispmanx_update;
+     DISPMANX_ELEMENT_HANDLE_T dispmanx_element;
+-    EGL_DISPMANX_WINDOW_T egl_dispmanx_window;
+     WindowProperties properties_;
++    std::unique_ptr<Private> priv;
+ };
+ 
+ #endif /* GLMARK2_NATIVE_STATE_DISPMANX_H_ */
+diff --git a/wscript b/wscript
+index e09fa78..6c3869c 100644
+--- a/wscript
++++ b/wscript
+@@ -205,7 +205,7 @@ def configure_linux(ctx):
+ 
+         ctx.check_cxx(lib = 'brcmGLESv2', uselib_store = 'glesv2', libpath='/opt/vc/lib')
+         ctx.check_cxx(lib = ['brcmEGL', 'brcmGLESv2'], uselib_store = 'egl', libpath='/opt/vc/lib')
+-        ctx.check_cxx(lib = ['bcm_host', 'vcos', 'vchiq_arm'], uselib_store = 'dispmanx', libpath='/opt/vc/lib')
++        ctx.check_cxx(lib = ['brcmEGL', 'brcmGLESv2', 'vchostif', 'bcm_host', 'vcos', 'vchiq_arm'], uselib_store = 'dispmanx', libpath='/opt/vc/lib')
+ 
+     # Check optional packages
+     opt_pkgs = [('x11', 'x11', None, list_contains(ctx.options.flavors, 'x11')),
+-- 
+2.28.0.497.g54e85e7af1
+
diff --git a/meta-oe/recipes-benchmark/glmark2/files/0002-run-dispmanx-fullscreen.patch b/meta-oe/recipes-benchmark/glmark2/files/0002-run-dispmanx-fullscreen.patch
new file mode 100644
index 000000000..27bd62edb
--- /dev/null
+++ b/meta-oe/recipes-benchmark/glmark2/files/0002-run-dispmanx-fullscreen.patch
@@ -0,0 +1,30 @@
+From 110ef8357ebaf24bc3995e631ec809a2f84c3b87 Mon Sep 17 00:00:00 2001
+From: Trevor Woerner <twoerner@gmail.com>
+Date: Thu, 3 Dec 2020 07:16:58 -0500
+Subject: [PATCH] run dispmanx fullscreen
+
+The dispmanx flavour can only run fullscreen, therefore set the size to
+fullscreen when glmark2-es2-dispmanx is run.
+
+Upstream-status: submitted [https://github.com/glmark2/glmark2/pull/135]
+Signed-off-by: Trevor Woerner <twoerner@gmail.com>
+---
+ src/main.cpp | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/main.cpp b/src/main.cpp
+index 677962e..273a217 100644
+--- a/src/main.cpp
++++ b/src/main.cpp
+@@ -164,6 +164,11 @@ main(int argc, char *argv[])
+         Options::size = std::pair<int,int>(800, 600);
+     }
+ 
++#if GLMARK2_USE_DISPMANX
++    /* dispmanx can only run fullscreen */
++    Options::size = std::pair<int,int>(-1, -1);
++#endif
++
+     // Create the canvas
+ #if GLMARK2_USE_X11
+     NativeStateX11 native_state;
diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index da8ca9e2b..1c1fb5ed0 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -12,20 +12,23 @@ DEPENDS = "libpng jpeg udev"
 
 PV = "2020.11+${SRCPV}"
 
-COMPATIBLE_HOST_rpi  = "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '.*-linux*', 'null', d)}"
-
-SRC_URI = "git://github.com/glmark2/glmark2.git;protocol=https"
+SRC_URI = " \
+    git://github.com/glmark2/glmark2.git;protocol=https \
+    file://0001-fix-dispmanx-build.patch \
+    file://0002-run-dispmanx-fullscreen.patch \
+    "
 SRCREV = "784aca755a469b144acf3cae180b6e613b7b057a"
 
 S = "${WORKDIR}/git"
 
 inherit waf pkgconfig features_check
 
-REQUIRED_DISTRO_FEATURES += "opengl"
+ANY_OF_DISTRO_FEATURES = "opengl dispmanx"
 
-PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11-gles2', '', d)} \
-                  ${@bb.utils.contains('DISTRO_FEATURES', 'wayland opengl', 'wayland-gles2', '', d)} \
-                  drm-gles2"
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11-gles2 drm-gles2', '', d)} \
+                  ${@bb.utils.contains('DISTRO_FEATURES', 'wayland opengl', 'wayland-gles2 drm-gles2', '', d)} \
+                  ${@bb.utils.contains('DISTRO_FEATURES', 'dispmanx', 'dispmanx', '', d)} \
+                 "
 
 PACKAGECONFIG[x11-gl] = ",,virtual/libgl virtual/libx11"
 PACKAGECONFIG[x11-gles2] = ",,virtual/libgles2 virtual/libx11"
@@ -33,6 +36,7 @@ PACKAGECONFIG[drm-gl] = ",,virtual/libgl libdrm virtual/libgbm"
 PACKAGECONFIG[drm-gles2] = ",,virtual/libgles2 libdrm virtual/libgbm"
 PACKAGECONFIG[wayland-gl] = ",,virtual/libgl wayland"
 PACKAGECONFIG[wayland-gles2] = ",,virtual/libgles2 wayland"
+PACKAGECONFIG[dispmanx] = ",,virtual/libgles2 virtual/libx11"
 
 python __anonymous() {
     packageconfig = (d.getVar("PACKAGECONFIG") or "").split()
@@ -49,6 +53,8 @@ python __anonymous() {
         flavors.append("drm-glesv2")
     if "drm-gl" in packageconfig:
         flavors.append("drm-gl")
+    if "dispmanx" in packageconfig:
+        flavors = ["dispmanx-glesv2"]
     if flavors:
         d.appendVar("EXTRA_OECONF", " --with-flavors=%s" % ",".join(flavors))
 }
-- 
2.28.0.497.g54e85e7af1

