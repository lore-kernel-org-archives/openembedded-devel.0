Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B8D6E9E31B
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 01:08:21 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34508.1770858493627497035
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Feb 2026 17:08:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RNNfPD3x;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48039fdc8aeso16729055e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Feb 2026 17:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770858492; x=1771463292; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QaNR1JlF5A6zJL4i2Jl9u+/IlhtiK/IUKB57H1NXiok=;
        b=RNNfPD3xUlmJ+/6aDAX0VheQUb5DQ6KZPoMwY81/oHthiI3WUSV8UTjXzvo6Da+vVK
         YS5tM0C7OW7y8Zb+VctE4+TwGvvjMPkalfMI/cIef0BAR+2kRwQDlzC20z1j/IeeryXO
         IYX1PHJThkB9pIzn3KdKp6jpg7egl0/CJWz50oZypr7lc6FaOyuPaPDi17kdn6+1KkSz
         wjxNcbWn9g8ue2oUL35xzWaXGShpufcrkV0P15b6Wvm25WVS0mss0LN3irN1qdzdOo4O
         YLcZO1c8MGbP/FjA35U0ADHjRYW0xy+UumQWg17B5k9PDNnZ16+fM57a3Z9XtN9VEZz3
         ofbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770858492; x=1771463292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QaNR1JlF5A6zJL4i2Jl9u+/IlhtiK/IUKB57H1NXiok=;
        b=v74ftH73ehzcegZHgrcmS2JkekkmxujR1BwW8SgmCB+L3fTAyPRi+w8L3BcRyhCcH+
         CLDea7GSMp0MayzgxvDCREC4ml5EBPQimk1Jjcs15t8GboH8/mWn9InwrWxzXuOOomRO
         kYaWopNMWvXwGj1spe7TJgAVVu0udmGSF56q1YB5HT5Mil3vOpp1FLLGXkKISwoCrlxW
         sC0wtF0pc6V2KgTpyNg1yHGhNP9NsaezQ1wE/UGCeTf/wQIErWpCA9xpuGM5alRUwc8I
         zx4tcHDKF6/9fBqrplJqmyZF1H3QMCUrLWErI94DA++S3kSI7LZOPptZQUEXN2zScVkB
         HLjQ==
X-Gm-Message-State: AOJu0YyuRKlrypb50BpOk1hY9j/DXexU0xDhKduOaY1gDQY7VdnsRIer
	2xQOvQm6p4ltBBh1+L7sAactavScrTb5/YuycwUOD+zh5EzP5fJ5+mBr+18nYw==
X-Gm-Gg: AZuq6aI2VrsrU4l8FiTpqeV41KsLiu75vKW/tjUC1lYESkudpt1sYMjMF44glOGtznb
	c7wgzYGkJsRK2R4nUiJyPrvz9VwePW3FKIeqXRujdTmK6Im51DJi0Y+vVHZ/aEVAUfDziCcVLSg
	UZXCSVSIv8b5cggRH3NFNBbvUUdgXVSM70FQrVBxkX9aHw+v+LoWgYNwQ9JHlOV3NX3P6Ux9D4g
	+3AVuyk7s5Ce3U2fmDKuRggJMQECeGKtjB/SFXCp2Bpk/aUhWEZN5XguwI6hjJb74xv/xvDxhGB
	6hBfi5Cx1AoFKTA1w5vK9cdEhOQcuBRCS+vxyy/wqKTJb/Xl3eGA19sOxk8T4iPYxFX468C1uhB
	MgY6zENt4i52KF7WoUwIEhC7v0QNEI3gMhEFAF0JkL+0AYtx1lacHbsTRdhbhSBzMch1o802+rs
	+t68IxHqJ0CemUQSCl94AA
X-Received: by 2002:a05:600c:818c:b0:483:2c98:435e with SMTP id 5b1f17b1804b1-4836717eb60mr5719635e9.34.1770858491425;
        Wed, 11 Feb 2026 17:08:11 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d82a4c4sm291954905e9.10.2026.02.11.17.08.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 17:08:10 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] webkitgtk3: upgrade 2.48.7 -> 2.50.5
Date: Thu, 12 Feb 2026 02:08:09 +0100
Message-ID: <20260212010809.1597122-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 01:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124341

Includes fixes for CVE-2025-13502, CVE-2025-13947, CVE-2025-43421,
CVE-2025-43458 and CVE-2025-66287.

Drop libsoup2 support. Even though this particular version still supports
it, this is the last major version that is not libsoup3-only. Starting
with version 2.52 (which is only 3-4 weeks away at the time of writing this
message) upstream is dropping libsoup2 support completely[1].

This is a proactive removal of this feature, the sooner users start the
migration, the better.

Made opengl a mandatory DISTRO_FEATURE: libepoxy requires it, which is
an indirect dependency, from gtk3.

Changelogs:
https://webkitgtk.org/2026/02/09/webkitgtk2.50.5-released.html
https://webkitgtk.org/2025/12/16/webkitgtk2.50.4-released.html
https://webkitgtk.org/2025/12/04/webkitgtk2.50.3-released.html
https://webkitgtk.org/2025/11/19/webkitgtk2.50.2-released.html
https://webkitgtk.org/2025/10/10/webkitgtk2.50.1-released.html
https://webkitgtk.org/2025/09/17/webkitgtk2.50.0-released.html

[1]: https://webkitgtk.org/2025/10/07/webkitgtk-soup2-deprecation.html

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../webkitgtk/webkitgtk3/no-musttail-arm.patch   | 12 ++++++------
 ...webkitgtk3_2.48.7.bb => webkitgtk3_2.50.5.bb} | 16 ++++++++--------
 2 files changed, 14 insertions(+), 14 deletions(-)
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.48.7.bb => webkitgtk3_2.50.5.bb} (94%)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/no-musttail-arm.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/no-musttail-arm.patch
index 367e6b8342..411164433a 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/no-musttail-arm.patch
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/no-musttail-arm.patch
@@ -23,12 +23,12 @@ diff --git a/Source/WTF/wtf/Compiler.h b/Source/WTF/wtf/Compiler.h
 index 16e416d..68dd9a0 100644
 --- a/Source/WTF/wtf/Compiler.h
 +++ b/Source/WTF/wtf/Compiler.h
-@@ -293,7 +293,7 @@
- #if COMPILER(CLANG)
- #if __SIZEOF_POINTER__ == 8
- #if !defined(MUST_TAIL_CALL) && defined(__cplusplus) && defined(__has_cpp_attribute)
--#if __has_cpp_attribute(clang::musttail) && !defined(__powerpc__) && !defined(_WIN32)
-+#if __has_cpp_attribute(clang::musttail) && !defined(__powerpc__) && !defined(_WIN32) && !defined(__arm__)
+@@ -290,7 +290,7 @@
+ // written for 64-bit may fail to tail call on 32-bit.
+ // It also doesn't work on ppc64le: https://github.com/llvm/llvm-project/issues/98859
+ // and on Windows: https://github.com/llvm/llvm-project/issues/116568
+-#if !defined(MUST_TAIL_CALL) && COMPILER(CLANG) && __SIZEOF_POINTER__ == 8 && defined(__cplusplus) && COMPILER_HAS_CPP_ATTRIBUTE(clang::musttail) && !defined(__powerpc__) && !defined(_WIN32)
++#if !defined(MUST_TAIL_CALL) && COMPILER(CLANG) && __SIZEOF_POINTER__ == 8 && defined(__cplusplus) && COMPILER_HAS_CPP_ATTRIBUTE(clang::musttail) && !defined(__powerpc__) && !defined(_WIN32) && !defined(__arm__)
  #define MUST_TAIL_CALL [[clang::musttail]]
  #define HAVE_MUST_TAIL_CALL 1
  #endif
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.7.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.50.5.bb
similarity index 94%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.7.bb
rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.50.5.bb
index 118592d42b..0ab9782d6a 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.7.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.50.5.bb
@@ -23,14 +23,14 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch \
            file://0001-Fix-32bit-arm.patch \
            "
-SRC_URI[sha256sum] = "2c62aebb608e09f930a539f3623a5cc8023b5068029f42a208f45f9124da6e30"
+SRC_URI[sha256sum] = "8737631bac3e9c7ad3e5208f9370e076c09d9c45b39980021ce54edadcc6f94f"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
 S = "${UNPACKDIR}/webkitgtk-${PV}"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
-REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'opengl', '', d)}"
+REQUIRED_DISTRO_FEATURES = "opengl"
 
 CVE_PRODUCT = "webkitgtk webkitgtk\+"
 
@@ -51,11 +51,9 @@ DEPENDS += " \
           gstreamer1.0-plugins-base \
           glib-2.0-native \
           gettext-native \
+          libsoup \
           "
 
-# using soup2 builds (JavaScript) API version 4.0
-# using soup3 builds (JavaScript) API version 4.1
-PACKAGECONFIG_SOUP ?= "soup3"
 PACKAGECONFIG ??= " \
 	   ${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
 	   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'webgl opengl', '', d)} \
@@ -63,7 +61,6 @@ PACKAGECONFIG ??= " \
 	   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl-or-es', '', d)} \
 	   enchant \
 	   libsecret \
-	   ${PACKAGECONFIG_SOUP} \
 	   "
 
 PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland libwpe wpebackend-fdo wayland-native"
@@ -83,8 +80,6 @@ PACKAGECONFIG[openjpeg] = "-DUSE_OPENJPEG=ON,-DUSE_OPENJPEG=OFF,openjpeg"
 PACKAGECONFIG[systemd] = "-DUSE_SYSTEMD=ON,-DUSE_SYSTEMD=off,systemd"
 PACKAGECONFIG[reduce-size] = "-DCMAKE_BUILD_TYPE=MinSizeRel,-DCMAKE_BUILD_TYPE=Release,,"
 PACKAGECONFIG[lcms] = "-DUSE_LCMS=ON,-DUSE_LCMS=OFF,lcms"
-PACKAGECONFIG[soup2] = "-DUSE_SOUP2=ON,-DUSE_SOUP2=OFF,libsoup-2.4,,,soup3"
-PACKAGECONFIG[soup3] = ",,libsoup,,,soup2"
 PACKAGECONFIG[journald] = "-DENABLE_JOURNALD_LOG=ON,-DENABLE_JOURNALD_LOG=OFF,systemd"
 PACKAGECONFIG[avif] = "-DUSE_AVIF_LOG=ON,-DUSE_AVIF=OFF,libavif"
 PACKAGECONFIG[media-recorder] = "-DENABLE_MEDIA_RECORDER=ON,-DENABLE_MEDIA_RECORDER=OFF,gstreamer1.0-plugins-bad"
@@ -103,6 +98,7 @@ EXTRA_OECMAKE = " \
         ${@oe.utils.vartrue('DEBUG_BUILD', '-DWEBKIT_NO_INLINE_HINTS=ON', '-DWEBKIT_NO_INLINE_HINTS=OFF', d)} \
 	-DENABLE_MINIBROWSER=ON \
 	-DCMAKE_EXPORT_COMPILE_COMMANDS=OFF \
+        -DUSE_SOUP2=OFF \
 		"
 # pass -g1 to massively reduce the size of the debug symbols (4.3GB to 700M at time of writing)
 DEBUG_LEVELFLAG = "-g1"
@@ -181,3 +177,7 @@ src_package_preprocess () {
             ${B}/WebKitGTK/DerivedSources/webkit/*.cpp
 }
 
+
+# complation fails with Clang-21 issue - https://github.com/llvm/llvm-project/issues/132322
+# Can be removed when clang is updated to v22
+TOOLCHAIN:arm = "gcc"

