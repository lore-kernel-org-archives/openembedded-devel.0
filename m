Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48045.1795411878920021450
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Zuspc2yb;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a2761c69fbso1324248c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411878; x=1796016678; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y0Y/y9ymNZuOvh1F4uHRMUFXizOF5Ez87+PGUEtl8JI=;
        b=Zuspc2ybL+22cP6cryCT36D03tJBXIrqxiBQ+YpOn5sKVDeQeygzzflEW4pf38fN9+
         8qEaQKmt/noxY+m2eUkmmz4TotFp0kXbT0K3NBvqGuTDqNIG3LBWFU7MH2zWUGBkMIM0
         DD+rPuGiOy9glda7kgP5X8kybmJRl+cmxzdWktPxObdOZD3DCSyak3SxQhgXWzc4M80j
         ddJD6jhH3mSro5K8hi2sLqmbvoBtT88V/JAbVHXy0rv2ePDmlGEukrUwaZ3ePtxWDRbg
         GdvDxvNTxctxeDrzkL5xfHoCzPAJF662fv+8PROB4SZxwQ2JaWkMJGoZZksufQ0Z2+2w
         0JHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411878; x=1796016678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y0Y/y9ymNZuOvh1F4uHRMUFXizOF5Ez87+PGUEtl8JI=;
        b=vdwduKC0+eDSukR9yDV6D0paMVcxP2Vl6vZOhbB6wkaeyV7FBU3jbi5C2YLLDLaWTo
         zVrzuG1dEfKc9tM87HYj04UXUGoO5LvE2oo0i6NyelgIQQORiMzfRGWwmUk3+7IKBZV8
         PQ8nGL0xAJWRHSwXaZoZMVx3qtQz7NF6CcL96VasNKxA9wja9B3TkDdv9IC7eHnJ4ihB
         SklzENLjo2mCkWeEsIPMHbH0/fvxwwbpP8TCLKzLZHboqSrxbG+l6mcjYGHxCW92swas
         jnfJZLtSMfwF+MnCk5AybBWyXvJmnqHPK3u4qwcPlcwCcskfBorfJHzvzC+MLLKo13kp
         ylgQ==
X-Gm-Message-State: APuU4Z8VkOXZt9ZSkZVCGqZ71Z7cBh+QR9YvoJHDeqFzaTGWF5fD5X8G
	msNqUOG0vHn7eq/VAiAxoAMH3Jd793q7HSTZ6pBg4qVMZwUhboZ4LY7YpzgaDJVq+mk=
X-Gm-Gg: AZFdTZdI/FENOecXYxaPCXm3ctqnD5Wka5dFZA1G7KBCQe3Ev//ParBs9bXEGuRsj0c
	Rrx4oUIPGBySnTXiNsuzRxzKhxxG+UePiks2WgFKaQ/KGMTO5kYUbcSDoboxmn5zZcWKc4v3xV3
	S+73Te4b9Nfydn/YtCRHEoVu7EgYmi17YS6rlrm/2wMt2+4bAwVn+uxhjVqhVxGdqJIKp291jXS
	m7bdSd9aGsA1Y8CYzJqGUbvCm0PV1OiRoVgLVgeh9vReRKbSb5yWPIRjE4AAgZiUWRvpgzew6xZ
	ELlJ+mGEi0M+UEXsDnqpo7/6WlfKGvAcprc5NY4KUA5qiobXcmrACbZ/0SWTyqtL1iEqOQvtxT+
	ej8rVCuejQazF2MeWjl2AVqVOTQytm0EuV667fpP1u+cNrKBMhOlSKcz5WSBXDxW6GflTcKxNHn
	Qud1rFzOLby3K9OMnoauZj6Hen4iM5Zn5NNGiR9C3AO6bNl8EF1xiMkqnCn0yDc/ayYEQrIEdp6
	1f3hD/zRMzVNYioGk2OPnFan6VIvJh8bODweX5yFlLE6SSSIuGmrOVnU/TwyS18vMuGErHuk/yK
	LKfa0zha7CME6ZCuR10ylVbDHM0Xe61T7EJdLhiJjOaIr/uyw1BT8I/we+hs7Zac3cnlPWDI8OB
	iev8WXheyDnAGMasWvKTLCE+QJB+w12kcN+eT7+syN2fXI/IvC+r7iHPmsXnYVenZrdcCH/uUmF
	NmWlVSbQWqw0LrM+0UakaJuzyC6nGY8dO9mhneXrbXrFcKopz6FYNR388VdklCNfskwvzkrnj4a
	Fx/YZxThMgb2ApYGm9IorLiZ9Kh76mS5+jetvvQNDX0rk8qvP4//f0Si0n5yYw6Y4VTracA5TcO
	2bbljbfpgUbqNdkiXv6BVVhq4A==
X-Received: by 2002:a05:693c:87cc:20b0:358:3426:d601 with SMTP id 5a478bee46e88-3856c0d0961mr11516087eec.2.1795411878184;
        Sun, 22 Nov 2026 21:31:18 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 39/42] webkitgtk3: upgrade 2.52.6 -> 2.54.3
Date: Sun, 22 Nov 2026 21:29:23 -0800
Message-ID: <20261123052953.3658549-67-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132854
Content-Type: text/plain; charset="utf-8"

New stable series 2.54:
- Web process compositor switched from TextureMapper to Skia, with
  batched painting; cairo 2D rendering option removed
- New API: favicons, webkit_feature_list_find(), view magnification,
  per-navigation User-Agent in WebKitWebsitePolicies
- Many input method, rendering, media and gamepad fixes, GStreamer
  1.28 and GCC 16 build support
- Security fixes listed in WSA-2026-0006 and WSA-2026-0007

2.54 requires gstreamer-mpegts from gst-plugins-bad whenever video is
enabled. Refresh the FindGI and __PAS_ALWAYS_INLINE patches.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-variable-to-control-macro-__PAS_ALWAYS_I.patch | 14 +++++---------
 ...-bare-system-include-dirs-from-g-ir-scann.patch | 10 +++++-----
 .../{webkitgtk3_2.52.6.bb => webkitgtk3_2.54.3.bb} |  3 ++-
 3 files changed, 12 insertions(+), 15 deletions(-)
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.52.6.bb => webkitgtk3_2.54.3.bb} (98%)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
index b1139b857e..87f6608592 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
@@ -44,11 +44,9 @@ Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
  Source/cmake/WebKitCompilerFlags.cmake              | 7 +++++++
  2 files changed, 8 insertions(+), 1 deletion(-)
 
-diff --git a/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h b/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
-index 5d5fb38c..a554f700 100644
 --- a/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
 +++ b/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
-@@ -44,7 +44,7 @@ __PAS_BEGIN_EXTERN_C;
+@@ -45,7 +45,7 @@
  #define __SUSPICIOUS__
  #define __BROKEN__
  
@@ -57,14 +55,12 @@ index 5d5fb38c..a554f700 100644
  #define __PAS_ALWAYS_INLINE_BUT_NOT_INLINE __attribute__((__always_inline__))
  #else
  #define __PAS_ALWAYS_INLINE_BUT_NOT_INLINE
-diff --git a/Source/cmake/WebKitCompilerFlags.cmake b/Source/cmake/WebKitCompilerFlags.cmake
-index f5ec0a55..dfd741e7 100644
 --- a/Source/cmake/WebKitCompilerFlags.cmake
 +++ b/Source/cmake/WebKitCompilerFlags.cmake
-@@ -503,3 +503,10 @@ endif ()
- 
- # FIXME: Enable pre-compiled headers for all ports <https://webkit.org/b/139438>
- set(CMAKE_DISABLE_PRECOMPILE_HEADERS ON)
+@@ -635,3 +635,10 @@
+     # (see comment #28 in the link above).
+     WEBKIT_PREPEND_GLOBAL_COMPILER_FLAGS(-mno-lxc1-sxc1)
+ endif ()
 +
 +# It fails to compile with `gcc -Og`
 +set(WEBKIT_NO_INLINE_HINTS OFF CACHE BOOL "Disable funtion attribute always_inline for WebKit")
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-FindGI-drop-bare-system-include-dirs-from-g-ir-scann.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-FindGI-drop-bare-system-include-dirs-from-g-ir-scann.patch
index e9e58c26d0..65a3371852 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-FindGI-drop-bare-system-include-dirs-from-g-ir-scann.patch
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-FindGI-drop-bare-system-include-dirs-from-g-ir-scann.patch
@@ -40,7 +40,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 --- a/Source/cmake/FindGI.cmake
 +++ b/Source/cmake/FindGI.cmake
-@@ -297,6 +297,15 @@ function(GI_INTROSPECT namespace nsversion header)
+@@ -297,6 +297,15 @@
          if (NOT IS_ABSOLUTE "${incdir}")
              get_filename_component(incdir "${incdir}" REALPATH BASE_DIR "${target_srcdir}")
          endif ()
@@ -56,7 +56,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
          list(APPEND scanner_flags "-I${incdir}")
      endforeach ()
  
-@@ -337,6 +346,13 @@ function(GI_INTROSPECT namespace nsversion header)
+@@ -337,6 +346,13 @@
      # Generate .gir
      set(target_def "$<TARGET_PROPERTY:${opt_TARGET},COMPILE_DEFINITIONS>")
      set(target_inc "$<TARGET_PROPERTY:${opt_TARGET},INTERFACE_INCLUDE_DIRECTORIES>")
@@ -67,6 +67,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +    # compiler. The sysroot include path is added automatically, so dropping
 +    # them is safe.
 +    set(target_inc "$<FILTER:${target_inc},EXCLUDE,^/usr/(local/)?include$>")
-     add_custom_command(
-         OUTPUT "${gir_path}"
-         COMMENT "Generating ${gir_name}.gir"
+     set(scanner_env "CC=${CMAKE_C_COMPILER}" "CFLAGS=${CMAKE_C_FLAGS}")
+     if (ENABLED_COMPILER_SANITIZERS)
+         string(JOIN " " sanitizer_flags ${ENABLED_COMPILER_SANITIZERS})
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.6.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.54.3.bb
similarity index 98%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.6.bb
rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.54.3.bb
index a192f89b64..96bfd7754d 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.6.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.54.3.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://fix-ftbfs-riscv64.patch \
            file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch \
            "
-SRC_URI[sha256sum] = "179a2ea3f8f6edd4be7f31fdc55afc57bd0729f1fba648c61d4181539ac116fc"
+SRC_URI[sha256sum] = "2779c1b46f88762e8400650271ba14452dc4e30b37059981552d8b562b7d0862"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
@@ -48,6 +48,7 @@ DEPENDS += " \
           libnotify \
           gstreamer1.0 \
           gstreamer1.0-plugins-base \
+          gstreamer1.0-plugins-bad \
           glib-2.0-native \
           gettext-native \
           libsoup \
