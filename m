Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C691FE7BD95
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 11:19:51 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17618.1771240789003010101
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Feb 2026 03:19:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iCF6lDPU;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-436263e31abso2950101f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 03:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771240787; x=1771845587; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ddLITrcWV379oaOqTisd3A5vVaJcIoZIk4v7eVHaEQs=;
        b=iCF6lDPU4jFR+mkccdOA2imnCsW/nFPTFUF2RWsjOtJwAlWsa3bt98TADVjGjHXvbn
         OJdANac71iZ4+U9bbEkrnauNYmI1H1h3SbTnkcRJ6RpHivEn9FMklrpIWPir6LPQcDcJ
         C+542/woYLjCuQ0xlOpku2maFuhe4TiFTE7C1gFPrZdhSSqaagTDEJRT7y2hiD+cITGX
         7WYJ4IYucWnyQ7/x+CLI2sohL2ZrIyfjbHGoQsCouUoHds8f6Bt6eoPKqDJJP9qXsBgQ
         Yed1AFcHtWm4EC/JB6jOs370Sa3s0vwhdzAr4Dz93eklPPs2Q3a4GIpdFQ914GwqyoU9
         FvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771240787; x=1771845587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ddLITrcWV379oaOqTisd3A5vVaJcIoZIk4v7eVHaEQs=;
        b=bwcB4VfPHElJSgLIGWJumQLdO70pixlvNKW0RaCo4Jy7GJMItylY1WjeSQscRTuD2i
         rNuF1dSho8wv6Ai4rUdP/mdfjKVWazAgpLI1wJ9iw9n/Z+LgyFxidaZLPWSQY1ffvRo3
         LPXifCxyXsY6NAfVdRyKpwh4USqcvkdlZne0u5skqQpITg8CI9lifVgFP/DrlSdssRDe
         r0J2aX3LLQq7J/82zrf+bpHacCNfpfnTocoi4xhjYYv2j8qm8qwRR9p83+5RWsPKhAqQ
         hK+3TpikCYJ4w1yM5UzDyzOf7tsTQmFGrd5NZ+j0Q6AIgJj4Z/u3EqXtagHran7m7J3/
         v+Ew==
X-Gm-Message-State: AOJu0YwZZWG0hjvgfkaiN4EHEhIGVXIWJq77cAfFGOxYvG4KZgILjiab
	5dzR2g7r+L6P9M5Fkh/E6XXcyPxmHsSHzJjU25uz+w0SOONEQaQDK4+E4EUNTw==
X-Gm-Gg: AZuq6aKk8YkwOinuqEJhijXImOnWEKdpbfZYbQ5YBGBZGzIX6LzhWQHI02X7llTNeyY
	4gAdD4IIdRaKrgux8X85ci/iF0zpN2vqfMfUYAzjZ2Y670TSVmFmRPWL9eMGxDaBLTd2pFGqcWl
	dKUV5TwKErBnPLfjHstbZUlm5+JRnI8HiMd0O66Cl0pVz4vtaXW1dggOZJGdJRNsyPg7h0gEwof
	bx1Wat25aTgP81gmNMj7iBenChKGFGDHjKqIdFzsFUmdA+rEse3oIzLaHtChjxUdWq8b8d/69qX
	CbtFteek6jvVpFETLO1+UxKlYu30AjE6MRC5O0GG2gQhBP1gn0mJuXx8zIiKHaU9eKVy3EiWlKZ
	2LMGcRzJEsSe6rHo75Wc5ZI71MLjSYzed3epGP/MWyY/753Susu09LOQmz21Ka8OOD/Zcc1jZ2n
	Vlr3u6zyQCPvIjRHoSJPva
X-Received: by 2002:a5d:5917:0:b0:437:99d2:c115 with SMTP id ffacd0b85a97d-43799d2c495mr14060268f8f.26.1771240785558;
        Mon, 16 Feb 2026 03:19:45 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8209sm28145166f8f.30.2026.02.16.03.19.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 03:19:45 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] webkitgtk3: upgrade 2.48.7 -> 2.50.5
Date: Mon, 16 Feb 2026 12:19:44 +0100
Message-ID: <20260216111944.2318445-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 11:19:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124416

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

v2: add libepoxy as an explicit build dependency (it was a dependency
    previously also, but it was pulled in by gtk+3 usually). This makes it
    clear that the recipe depends on it directly.

 .../webkitgtk/webkitgtk3/no-musttail-arm.patch  | 12 ++++++------
 ...ebkitgtk3_2.48.7.bb => webkitgtk3_2.50.5.bb} | 17 +++++++++--------
 2 files changed, 15 insertions(+), 14 deletions(-)
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
index 118592d42b..9be30506d6 100644
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
 
@@ -51,11 +51,10 @@ DEPENDS += " \
           gstreamer1.0-plugins-base \
           glib-2.0-native \
           gettext-native \
+          libsoup \
+          libepoxy \
           "
 
-# using soup2 builds (JavaScript) API version 4.0
-# using soup3 builds (JavaScript) API version 4.1
-PACKAGECONFIG_SOUP ?= "soup3"
 PACKAGECONFIG ??= " \
 	   ${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
 	   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'webgl opengl', '', d)} \
@@ -63,7 +62,6 @@ PACKAGECONFIG ??= " \
 	   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl-or-es', '', d)} \
 	   enchant \
 	   libsecret \
-	   ${PACKAGECONFIG_SOUP} \
 	   "
 
 PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland libwpe wpebackend-fdo wayland-native"
@@ -83,8 +81,6 @@ PACKAGECONFIG[openjpeg] = "-DUSE_OPENJPEG=ON,-DUSE_OPENJPEG=OFF,openjpeg"
 PACKAGECONFIG[systemd] = "-DUSE_SYSTEMD=ON,-DUSE_SYSTEMD=off,systemd"
 PACKAGECONFIG[reduce-size] = "-DCMAKE_BUILD_TYPE=MinSizeRel,-DCMAKE_BUILD_TYPE=Release,,"
 PACKAGECONFIG[lcms] = "-DUSE_LCMS=ON,-DUSE_LCMS=OFF,lcms"
-PACKAGECONFIG[soup2] = "-DUSE_SOUP2=ON,-DUSE_SOUP2=OFF,libsoup-2.4,,,soup3"
-PACKAGECONFIG[soup3] = ",,libsoup,,,soup2"
 PACKAGECONFIG[journald] = "-DENABLE_JOURNALD_LOG=ON,-DENABLE_JOURNALD_LOG=OFF,systemd"
 PACKAGECONFIG[avif] = "-DUSE_AVIF_LOG=ON,-DUSE_AVIF=OFF,libavif"
 PACKAGECONFIG[media-recorder] = "-DENABLE_MEDIA_RECORDER=ON,-DENABLE_MEDIA_RECORDER=OFF,gstreamer1.0-plugins-bad"
@@ -103,6 +99,7 @@ EXTRA_OECMAKE = " \
         ${@oe.utils.vartrue('DEBUG_BUILD', '-DWEBKIT_NO_INLINE_HINTS=ON', '-DWEBKIT_NO_INLINE_HINTS=OFF', d)} \
 	-DENABLE_MINIBROWSER=ON \
 	-DCMAKE_EXPORT_COMPILE_COMMANDS=OFF \
+        -DUSE_SOUP2=OFF \
 		"
 # pass -g1 to massively reduce the size of the debug symbols (4.3GB to 700M at time of writing)
 DEBUG_LEVELFLAG = "-g1"
@@ -181,3 +178,7 @@ src_package_preprocess () {
             ${B}/WebKitGTK/DerivedSources/webkit/*.cpp
 }
 
+
+# complation fails with Clang-21 issue - https://github.com/llvm/llvm-project/issues/132322
+# Can be removed when clang is updated to v22
+TOOLCHAIN:arm = "gcc"

