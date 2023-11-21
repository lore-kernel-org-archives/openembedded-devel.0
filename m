Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1D1DC61D92
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 13:02:49 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.39297.1700571766156219361
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Nov 2023 05:02:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kw9kOCkx;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9fa45e75ed9so426086966b.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Nov 2023 05:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700571764; x=1701176564; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CLZRW5xWbF7Rvt3CHejg0IKx6r2S5tQIt0D2l0yJLfo=;
        b=kw9kOCkxlAQiGY9Z6+ZmRS8WV0QlVAU21158JpItFryjNEJ0vDKWqhJDbVr+FxgOvI
         cWSqon+XI7BG3tINjruz9YECTTsUKsfKiNhW7SvFWxLUl5tsZ6k5vOk3yK3ny7plf9K0
         BATvMx+kFaAC/iy6CR+4al2e8p3NPQ/aL5Wcm9H1RwQqcy7qpa6PHLkcKdH4drD8CLZG
         PV2eMQ1qUSlFsHKitNosM/ibZVPgmziN7BzJbNpEzT/B8JcEl5tch4Sv0kn7UWrzocRv
         vsXttADoQQMzEX8iZt38PXAZBkmGWicAo60nacCEwZgFbGVYpmwbOIUe4PsBsvJOOcfK
         EI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700571764; x=1701176564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CLZRW5xWbF7Rvt3CHejg0IKx6r2S5tQIt0D2l0yJLfo=;
        b=wmmO8WYnY5mQ8Ye3pPI+77mQrXm9CjNaa7i07y/GCFwFHWFrXvkTdltmb2SpiT2Swo
         XYD+Yd4tbh0gmac3drRK3BcvbSHBRuMg7bZps27sQGyAAJRU1h1IKIBPd85auiG3cHzd
         Ykvsh6lX4pnGuY7lIRWAAj8NLbG1QtyTCI3AKsW1NM+sIWu6RHF3t2B5Js14D8nzuWZZ
         kzZK3px1pYRBWmgSd1ZD3q572S/wgMuyOu1Jp4khZIZEzdwmsxn8du+c+u0Z85M19bFx
         fsqHMXZC+Zdzt5AcjUURIoepPMEnA13Vp3pvVuniWaEuT0qW13cvgtEMSoIsS9SQx018
         TbnA==
X-Gm-Message-State: AOJu0YyteAzzupU0OUbbbjPzeYqRpsNtxKmv1SsbUnXYVf9nU3ssmQNl
	CzwzmWCpY3kx9Y5nyDPYyXcsxCk0L14=
X-Google-Smtp-Source: AGHT+IH0k8PxlYxLQ1tKLILfqm5htlW1G5sS4VJM8V4r+84xKCU9BPmaY6hzPHdzoBFMWDdfX4UfOw==
X-Received: by 2002:a17:906:409b:b0:a01:dd2e:53df with SMTP id u27-20020a170906409b00b00a01dd2e53dfmr1436116ejj.55.1700571763907;
        Tue, 21 Nov 2023 05:02:43 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id me23-20020a170906aed700b009e5c644e34dsm5139044ejb.82.2023.11.21.05.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 05:02:43 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH 1/2] webkitgtk3: Prepare adding webkitgtk4
Date: Tue, 21 Nov 2023 14:02:32 +0100
Message-ID: <20231121130233.1381225-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Nov 2023 13:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106976

Split the recipe into an include file and a minimal recipe.
Rename the patch directory to "files".
Move do_install:append() and the gtk+3 dependency into the recipe file.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 ...spection.cmake-prefix-variables-obta.patch |   0
 ...44e17d258106617b0e6d783d073b188a2548.patch |   0
 .../check-GST_GL_HAVE_PLATFORM_GLX.patch      |   0
 .../no-musttail-arm.patch                     |   0
 .../reproducibility.patch                     |   0
 .../{webkitgtk3_2.42.2.bb => webkitgtk.inc}   |  11 +-
 .../webkitgtk/webkitgtk3_2.42.2.bb            | 184 +-----------------
 7 files changed, 9 insertions(+), 186 deletions(-)
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3 => files}/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch (100%)
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3 => files}/0d3344e17d258106617b0e6d783d073b188a2548.patch (100%)
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3 => files}/check-GST_GL_HAVE_PLATFORM_GLX.patch (100%)
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3 => files}/no-musttail-arm.patch (100%)
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3 => files}/reproducibility.patch (100%)
 copy meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.42.2.bb => webkitgtk.inc} (97%)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch b/meta-oe/recipes-support/webkitgtk/files/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
similarity index 100%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
rename to meta-oe/recipes-support/webkitgtk/files/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch b/meta-oe/recipes-support/webkitgtk/files/0d3344e17d258106617b0e6d783d073b188a2548.patch
similarity index 100%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch
rename to meta-oe/recipes-support/webkitgtk/files/0d3344e17d258106617b0e6d783d073b188a2548.patch
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/check-GST_GL_HAVE_PLATFORM_GLX.patch b/meta-oe/recipes-support/webkitgtk/files/check-GST_GL_HAVE_PLATFORM_GLX.patch
similarity index 100%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3/check-GST_GL_HAVE_PLATFORM_GLX.patch
rename to meta-oe/recipes-support/webkitgtk/files/check-GST_GL_HAVE_PLATFORM_GLX.patch
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/no-musttail-arm.patch b/meta-oe/recipes-support/webkitgtk/files/no-musttail-arm.patch
similarity index 100%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3/no-musttail-arm.patch
rename to meta-oe/recipes-support/webkitgtk/files/no-musttail-arm.patch
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/reproducibility.patch b/meta-oe/recipes-support/webkitgtk/files/reproducibility.patch
similarity index 100%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3/reproducibility.patch
rename to meta-oe/recipes-support/webkitgtk/files/reproducibility.patch
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.2.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk.inc
similarity index 97%
copy from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.2.bb
copy to meta-oe/recipes-support/webkitgtk/webkitgtk.inc
index ac75afb90..8e7fb4eac 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.2.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk.inc
@@ -35,7 +35,6 @@ DEPENDS += " \
           jpeg \
           atk \
           libwebp \
-          gtk+3 \
           libxslt \
           libtasn1 \
           libnotify \
@@ -53,6 +52,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11',
                    enchant \
                    libsecret \
                    ${PACKAGECONFIG_SOUP} \
+                   minibrowser webdriver \
                   "
 
 PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland libwpe wpebackend-fdo wayland-native"
@@ -80,12 +80,13 @@ PACKAGECONFIG[media-recorder] = "-DENABLE_MEDIA_RECORDER=ON,-DENABLE_MEDIA_RECOR
 PACKAGECONFIG[gamepad] = "-DENABLE_GAMEPAD=ON,-DENABLE_GAMEPAD=OFF,libmanette"
 PACKAGECONFIG[webrtc] = "-DENABLE_WEB_RTC=ON,-DENABLE_WEB_RTC=OFF"
 PACKAGECONFIG[bubblewrap] = "-DENABLE_BUBBLEWRAP_SANDBOX=ON -DBWRAP_EXECUTABLE=${bindir}/bwrap -DDBUS_PROXY_EXECUTABLE=${bindir}/xdg-dbus-proxy,-DENABLE_BUBBLEWRAP_SANDBOX=OFF,,bubblewrap xdg-dbus-proxy"
+PACKAGECONFIG[minibrowser] = "-DENABLE_MINIBROWSER=ON,-DENABLE_MINIBROWSER=OFF"
+PACKAGECONFIG[webdriver] = "-DENABLE_WEBDRIVER=ON,-DENABLE_WEBDRIVER=OFF"
 
 EXTRA_OECMAKE = " \
 		-DPORT=GTK \
 		${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
 		${@bb.utils.contains('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=ON', '-DENABLE_DOCUMENTATION=OFF', d)} \
-		-DENABLE_MINIBROWSER=ON \
 		"
 # Unless DEBUG_BUILD is enabled, pass -g1 to massively reduce the size of the
 # debug symbols (4.3GB to 700M at time of writing)
@@ -141,7 +142,7 @@ EXTRA_OECMAKE:append:x86-x32 = " -DENABLE_JIT=OFF "
 SECURITY_CFLAGS:remove:aarch64 = "-fpie"
 SECURITY_CFLAGS:append:aarch64 = " -fPIE"
 
-FILES:${PN} += "${libdir}/webkit2gtk-4.*/injected-bundle/libwebkit2gtkinjectedbundle.so"
+FILES:${PN} += "${libdir}/webkitgtk-*/injected-bundle/*.so"
 
 RRECOMMENDS:${PN} += "ca-certificates shared-mime-info"
 
@@ -166,10 +167,6 @@ COMPATIBLE_HOST:x86 = "${@bb.utils.contains_any('TUNE_FEATURES', 'core2 corei7',
 GI_DATA_ENABLED:libc-musl:armv7a = "False"
 GI_DATA_ENABLED:libc-musl:armv7ve = "False"
 
-do_install:append() {
-	mv ${D}${bindir}/WebKitWebDriver ${D}${bindir}/WebKitWebDriver3
-}
-
 PACKAGE_PREPROCESS_FUNCS += "src_package_preprocess"
 src_package_preprocess () {
         # Trim build paths from comments in generated sources to ensure reproducibility
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.2.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.2.bb
index ac75afb90..6d0684f6f 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.2.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.2.bb
@@ -1,183 +1,9 @@
-SUMMARY = "WebKit web rendering engine for the GTK+ platform"
-HOMEPAGE = "https://www.webkitgtk.org/"
-BUGTRACKER = "https://bugs.webkit.org/"
+require webkitgtk.inc
 
-LICENSE = "BSD-2-Clause & LGPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d84286dda758da57bd691 \
-                    file://Source/WebCore/LICENSE-APPLE;md5=4646f90082c40bcf298c285f8bab0b12 \
-                    file://Source/WebCore/LICENSE-LGPL-2;md5=36357ffde2b64ae177b2494445b79d21 \
-                    file://Source/WebCore/LICENSE-LGPL-2.1;md5=a778a33ef338abbaf8b8a7c36b6eec80 \
-                    "
-
-SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
-           file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
-           file://reproducibility.patch \
-           file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
-           file://no-musttail-arm.patch \
-           "
-SRC_URI[sha256sum] = "5720aa3e8627f1b9f63252187d4df0f8233ae71d697b1796ebfbe5ca750bd118"
-
-inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
-
-S = "${WORKDIR}/webkitgtk-${PV}"
-
-ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
-REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'opengl', '', d)}"
-
-CVE_PRODUCT = "webkitgtk webkitgtk\+"
-
-DEPENDS += " \
-          ruby-native \
-          gperf-native \
-          unifdef-native \
-          cairo \
-          harfbuzz \
-          jpeg \
-          atk \
-          libwebp \
-          gtk+3 \
-          libxslt \
-          libtasn1 \
-          libnotify \
-          gstreamer1.0 \
-          gstreamer1.0-plugins-base \
-          glib-2.0-native \
-          gettext-native \
-          "
-
-PACKAGECONFIG_SOUP ?= "soup3"
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'webgl opengl', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'webgl gles2', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl-or-es', '', d)} \
-                   enchant \
-                   libsecret \
-                   ${PACKAGECONFIG_SOUP} \
-                  "
-
-PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland libwpe wpebackend-fdo wayland-native"
-PACKAGECONFIG[angle] = "-DUSE_ANGLE_WEBGL=ON,-DUSE_ANGLE_WEBGL=OFF"
-PACKAGECONFIG[x11] = "-DENABLE_X11_TARGET=ON,-DENABLE_X11_TARGET=OFF,virtual/libx11 libxcomposite libxdamage libxrender libxt"
-PACKAGECONFIG[geoclue] = "-DENABLE_GEOLOCATION=ON,-DENABLE_GEOLOCATION=OFF,geoclue"
-PACKAGECONFIG[enchant] = "-DENABLE_SPELLCHECK=ON,-DENABLE_SPELLCHECK=OFF,enchant2"
-PACKAGECONFIG[gles2] = "-DENABLE_GLES2=ON,-DENABLE_GLES2=OFF,virtual/libgles2"
-PACKAGECONFIG[jpegxl] = " -DUSE_JPEGXL=ON,-DUSE_JPEGXL=OFF,libjxl"
-PACKAGECONFIG[webgl] = "-DENABLE_WEBGL=ON,-DENABLE_WEBGL=OFF,virtual/egl"
-PACKAGECONFIG[opengl] = "-DENABLE_GRAPHICS_CONTEXT_GL=ON,-DENABLE_GRAPHICS_CONTEXT_GL=OFF,virtual/egl"
-PACKAGECONFIG[opengl-or-es] = "-DUSE_OPENGL_OR_ES=ON,-DUSE_OPENGL_OR_ES=OFF"
-PACKAGECONFIG[libsecret] = "-DUSE_LIBSECRET=ON,-DUSE_LIBSECRET=OFF,libsecret"
-PACKAGECONFIG[libhyphen] = "-DUSE_LIBHYPHEN=ON,-DUSE_LIBHYPHEN=OFF,libhyphen"
-PACKAGECONFIG[woff2] = "-DUSE_WOFF2=ON,-DUSE_WOFF2=OFF,woff2"
-PACKAGECONFIG[openjpeg] = "-DUSE_OPENJPEG=ON,-DUSE_OPENJPEG=OFF,openjpeg"
-PACKAGECONFIG[systemd] = "-DUSE_SYSTEMD=ON,-DUSE_SYSTEMD=off,systemd"
-PACKAGECONFIG[reduce-size] = "-DCMAKE_BUILD_TYPE=MinSizeRel,-DCMAKE_BUILD_TYPE=Release,,"
-PACKAGECONFIG[lcms] = "-DUSE_LCMS=ON,-DUSE_LCMS=OFF,lcms"
-PACKAGECONFIG[soup2] = "-DUSE_SOUP2=ON,-DUSE_SOUP2=OFF,libsoup-2.4,,,soup3"
-PACKAGECONFIG[soup3] = ",,libsoup,,,soup2"
-PACKAGECONFIG[journald] = "-DENABLE_JOURNALD_LOG=ON,-DENABLE_JOURNALD_LOG=OFF,systemd"
-PACKAGECONFIG[avif] = "-DUSE_AVIF_LOG=ON,-DUSE_AVIF=OFF,libavif"
-PACKAGECONFIG[media-recorder] = "-DENABLE_MEDIA_RECORDER=ON,-DENABLE_MEDIA_RECORDER=OFF,gstreamer1.0-plugins-bad"
-PACKAGECONFIG[gamepad] = "-DENABLE_GAMEPAD=ON,-DENABLE_GAMEPAD=OFF,libmanette"
-PACKAGECONFIG[webrtc] = "-DENABLE_WEB_RTC=ON,-DENABLE_WEB_RTC=OFF"
-PACKAGECONFIG[bubblewrap] = "-DENABLE_BUBBLEWRAP_SANDBOX=ON -DBWRAP_EXECUTABLE=${bindir}/bwrap -DDBUS_PROXY_EXECUTABLE=${bindir}/xdg-dbus-proxy,-DENABLE_BUBBLEWRAP_SANDBOX=OFF,,bubblewrap xdg-dbus-proxy"
-
-EXTRA_OECMAKE = " \
-		-DPORT=GTK \
-		${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
-		${@bb.utils.contains('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=ON', '-DENABLE_DOCUMENTATION=OFF', d)} \
-		-DENABLE_MINIBROWSER=ON \
-		"
-# Unless DEBUG_BUILD is enabled, pass -g1 to massively reduce the size of the
-# debug symbols (4.3GB to 700M at time of writing)
-DEBUG_FLAGS:append = "${@oe.utils.vartrue('DEBUG_BUILD', '', ' -g1', d)}"
-
-# Javascript JIT is not supported on ARC
-EXTRA_OECMAKE:append:arc = " -DENABLE_JIT=OFF "
-# By default 25-bit "medium" calls are used on ARC
-# which is not enough for binaries larger than 32 MiB
-CFLAGS:append:arc = " -mlong-calls"
-CXXFLAGS:append:arc = " -mlong-calls"
-
-# Needed for non-mesa graphics stacks when x11 is disabled
-CXXFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_NO_X11=1', d)}"
-
-# Javascript JIT is not supported on powerpc
-EXTRA_OECMAKE:append:powerpc = " -DENABLE_JIT=OFF "
-EXTRA_OECMAKE:append:powerpc64 = " -DENABLE_JIT=OFF "
-
-# ARM JIT code does not build on ARMv4/5/6 anymore
-EXTRA_OECMAKE:append:armv4 = " -DENABLE_JIT=OFF "
-EXTRA_OECMAKE:append:armv5 = " -DENABLE_JIT=OFF "
-EXTRA_OECMAKE:append:armv6 = " -DENABLE_JIT=OFF "
-
-# And for armv7* don't enable it for softfp, because after:
-# https://github.com/WebKit/WebKit/commit/a2ec4ef1997d6fafa6ffc607bffb54e76168a918
-# https://bugs.webkit.org/show_bug.cgi?id=242172
-# softfp armv7* fails because WEBASSEMBLY is left enabled by default and JIT gets
-# explicitly disabled causing:
-# http://errors.yoctoproject.org/Errors/Details/734587/
-# PR was sent upstream, but the end result is the same both JIT and WEBASSEMBLY disabled
-# https://github.com/WebKit/WebKit/pull/17447
-EXTRA_OECMAKE:append:armv7a = " -DENABLE_JIT=${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'ON', 'OFF', d)}"
-EXTRA_OECMAKE:append:armv7r = " -DENABLE_JIT=${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'ON', 'OFF', d)}"
-EXTRA_OECMAKE:append:armv7ve = " -DENABLE_JIT=${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'ON', 'OFF', d)}"
-
-EXTRA_OECMAKE:append:mipsarch = " -DUSE_LD_GOLD=OFF "
-EXTRA_OECMAKE:append:powerpc = " -DUSE_LD_GOLD=OFF "
-
-# JIT and gold linker does not work on RISCV
-EXTRA_OECMAKE:append:riscv32 = " -DUSE_LD_GOLD=OFF -DENABLE_JIT=OFF"
-EXTRA_OECMAKE:append:riscv64 = " -DUSE_LD_GOLD=OFF"
-
-# JIT not supported on MIPS either
-EXTRA_OECMAKE:append:mipsarch = " -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON "
-
-# JIT not supported on X32
-# An attempt was made to upstream JIT support for x32 in
-# https://bugs.webkit.org/show_bug.cgi?id=100450, but this was closed as
-# unresolved due to limited X32 adoption.
-EXTRA_OECMAKE:append:x86-x32 = " -DENABLE_JIT=OFF "
-
-SECURITY_CFLAGS:remove:aarch64 = "-fpie"
-SECURITY_CFLAGS:append:aarch64 = " -fPIE"
-
-FILES:${PN} += "${libdir}/webkit2gtk-4.*/injected-bundle/libwebkit2gtkinjectedbundle.so"
-
-RRECOMMENDS:${PN} += "ca-certificates shared-mime-info"
-
-# http://errors.yoctoproject.org/Errors/Details/20370/
-ARM_INSTRUCTION_SET:armv4 = "arm"
-ARM_INSTRUCTION_SET:armv5 = "arm"
-ARM_INSTRUCTION_SET:armv6 = "arm"
-
-# https://bugzilla.yoctoproject.org/show_bug.cgi?id=9474
-# https://bugs.webkit.org/show_bug.cgi?id=159880
-# JSC JIT can build on ARMv7 with -marm, but doesn't work on runtime.
-# Upstream only tests regularly the JSC JIT on ARMv7 with Thumb2 (-mthumb).
-ARM_INSTRUCTION_SET:armv7a = "thumb"
-ARM_INSTRUCTION_SET:armv7r = "thumb"
-ARM_INSTRUCTION_SET:armv7ve = "thumb"
-
-# ANGLE requires SSE support as of webkit 2.40.x on 32 bit x86
-COMPATIBLE_HOST:x86 = "${@bb.utils.contains_any('TUNE_FEATURES', 'core2 corei7', '.*', 'null', d)}"
-
-# introspection inside qemu-arm hangs forever on musl/arm builds
-# therefore disable GI_DATA
-GI_DATA_ENABLED:libc-musl:armv7a = "False"
-GI_DATA_ENABLED:libc-musl:armv7ve = "False"
+DEPENDS += "gtk+3"
 
 do_install:append() {
-	mv ${D}${bindir}/WebKitWebDriver ${D}${bindir}/WebKitWebDriver3
+	if [ -f ${D}${bindir}/WebKitWebDriver ]; then
+		mv ${D}${bindir}/WebKitWebDriver ${D}${bindir}/WebKitWebDriver3
+	fi
 }
-
-PACKAGE_PREPROCESS_FUNCS += "src_package_preprocess"
-src_package_preprocess () {
-        # Trim build paths from comments in generated sources to ensure reproducibility
-        sed -i -e "s,${WORKDIR},,g" \
-            ${B}/JavaScriptCore/DerivedSources/*.h \
-            ${B}/JavaScriptCore/DerivedSources/yarr/*.h \
-            ${B}/JavaScriptCore/PrivateHeaders/JavaScriptCore/*.h \
-            ${B}/WebCore/DerivedSources/*.cpp \
-            ${B}/WebKitGTK/DerivedSources/webkit/*.cpp
-}
-
-- 
2.42.0


