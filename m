Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web11.10331.1607003456884355421
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Dec 2020 05:50:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Zzu4gt2d;
 spf=pass (domain: gmail.com, ip: 209.85.166.68, mailfrom: twoerner@gmail.com)
Received: by mail-io1-f68.google.com with SMTP id t8so2092954iov.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Dec 2020 05:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3MWQnc498Qq35+OuaYSIJ9/tgSdJLYZEncfqB10aO+w=;
        b=Zzu4gt2dCk47EJ3XUePC9EKMoUNUv6rH8bYLuy4YJcqBlfXETXfU/nuQ2yDD1l4fFJ
         GyhywfGOaQsSFWZBKhKI0zzaBuDq/T4I4DtgpgBNEMB3KC/bvsF8SN/rcBSYEe/yK+8P
         xIRx1nBtSV4qtp2/knjLX252X1WBn/iopXAR1ntEOE4LX0wijIsM8EfdOnqlm/jm53yI
         mDKk3Z18GSOfzpua7QHu/1hAhv3bte/gPddDczSdGg8VyhwQBNWsgFsxn0JuMhmNovd+
         88Qjy4qJqkhiXzcSw14JWoYjbwsMTVZYpLPNNOuCPgBBSByCONWHuMPEfDZXZfFRlPAN
         TY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3MWQnc498Qq35+OuaYSIJ9/tgSdJLYZEncfqB10aO+w=;
        b=FscgL6q3+CVcjYE/hGKAIiLpf6wOHhtlnPJKX2OoC5a+b9Z/oQy9Gp2k5S0NfEwtlN
         DzDYjBi4jqFw5l7fENQOk6z3jsrHoXRoG9h9JxRprKGce1+ayuaUM/wIkdrB5+/15WaI
         5n9rNzKOPMPcClLb0qF6ZEjxCr01CCZ+cQmJYFf5ZNfbeP3IOeMufA2A1uY1iwG+xwYT
         MTCg2EcchD86435qwAUFTcSiN4CJ7HhsxKbvNrfcO/lT8M6B2PI/njaE3b01nxzVrE/k
         5QVc8I0VW2drAIWlAuiQ6T1Jw3giLM673XDPnEbSdOcUmNkSmJuazGgBO8Q70TrwLR9X
         DWpw==
X-Gm-Message-State: AOAM530ibF7RGPoR1gsNZ330BdxbeL74+FxKrcB3DQy4XF2czjhsaedv
	gaFoqO5gohzH4+3VxElRTZZZZe+Rl4Sf+w==
X-Google-Smtp-Source: ABdhPJyQrWP8Vwq/AhLFceX7Tqho7HELG1um5B5zxtbJEM4zbx18ogB35EHo5A8c0/OnwYGIWAXB2w==
X-Received: by 2002:a02:a419:: with SMTP id c25mr3442659jal.91.1607003455638;
        Thu, 03 Dec 2020 05:50:55 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id 143sm908053ila.4.2020.12.03.05.50.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 05:50:54 -0800 (PST)
From: "Trevor Woerner" <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] glmark2: add support for dispmanx
Date: Thu,  3 Dec 2020 08:50:49 -0500
Message-Id: <20201203135049.3409-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.28.0.497.g54e85e7af1
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

