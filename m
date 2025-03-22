Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF43C36001
	for <webhook@archiver.kernel.org>; Sat, 22 Mar 2025 02:59:31 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.3039.1742612370142065651
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Mar 2025 19:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RBp93ppb;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ff615a114bso5738932a91.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 19:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742612369; x=1743217169; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2nCbRpbFbmeJ2jCaQg93xN/t9UHtVuxVQ0aIovNmU4=;
        b=RBp93ppbHRAdc1XO/iIeIlst9w9v3/RGLeFCvJcB5/KxVNqiJjrW6SJg5ZocHqeEc4
         FnSHGV1NtuTlbRmZ2/libQu2NcdP0vwouR5lm7EIVKoExZERzsp6kdZ4V/DBKWRYXoCn
         YDZGpONXhNrB2Jt3ju2wLs7WTGiSyI2er5PNTVIDtBPgtmCmuQxwhTWLih4QbxLaYbP8
         nbKjBqyPJouIsyHEjlZ/T2K4ZUOZ1HaVfqQxm8dEMSlVHySax+Fa2OC2HPRdyJU0N1h8
         1a52QuoRmbu3gCc2MBYzjKDGdvx0igL83cAYJyedogad93+/LHaxzSiEKYk/yJSXHYeZ
         stFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742612369; x=1743217169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y2nCbRpbFbmeJ2jCaQg93xN/t9UHtVuxVQ0aIovNmU4=;
        b=Nf7T4XXGbL7i8O8ZJ4MhfLgd6L31Fm3yo3lyLJKHOllCR0SEjklZb9O1JCOHguMT5F
         jatexkAhfPeWcC850unHXpzsL2eIPM8qmYMNORAO+q8By6Ee8k/9p0vkiE0YTdXFs2j2
         N945v+g5Sq0R5rPSt2dT7z+bvJ1LCxUz5jv2RLClYklNL7KX8G388TCqeawAYU5Op7a1
         WbWS0DJRny0DN2Vt3x8420ky2Gi2QC8tdPtG59NWNwuYG8Wlr409kCdZ3pJzELpqBguI
         V+uPnRdbgs1i+LE6zTT+RIyciFUj8eR2KRlb8JuSrD4vKAye0IcCKpPtiINBymlFB/nL
         UIRA==
X-Gm-Message-State: AOJu0Yygm11cL0Y+dsj4cybro7Ww2VKOGPACeP+v4i1nh6SmsjQhh2nD
	AHtk5iwELgpUscoZOkdI16ojxNF4PdKWzzMonL2B1Qfpf8iEFxVX3pXxDCDQ
X-Gm-Gg: ASbGnctr53v3uHSmXb1SPjc6zxYcZ09miwzs3ksJyKWCPEufGRJrySJJXWCY8osMZrX
	/7znJUGfqJrE9iOrvYdiwVx9FgtzY4hg5r4rl9kXmos91siC0zcaXweIDWyk/tovupMqwUR9Iv3
	GMQ1BmYEVfqLkEXggL4WO7VDu9neHx3LXjFxbjlKxPdGkLhfWvvNRq9sD5oz95tgkM8Ev7oVy8x
	P+5B6k1X9uHiIVUsWQxQmitzp9d97skvXXZ1ueZxPVytq7SztsL4Tt548+kiOGr3wqvkUSZkawg
	gwnBFSUkwpaMnv4B/WdApGYXBbsiCgBZ6Lee
X-Google-Smtp-Source: AGHT+IFhZrj2UN9PBZYUH4Xfw5v9OXCAuXGYzagdnd5NmLRD6OWrnsB7KivAWQsXI5ng5rAEYRUb6w==
X-Received: by 2002:a05:6a21:33a2:b0:1f3:383e:7739 with SMTP id adf61e73a8af0-1fd08c3695emr14606085637.7.1742612369152;
        Fri, 21 Mar 2025 19:59:29 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2843af9sm2632849a12.38.2025.03.21.19.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 19:59:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Jaeyoon Jung <jaeyoon.jung@lge.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] lvgl: Upgrade to 9.2.2 release
Date: Fri, 21 Mar 2025 19:59:25 -0700
Message-ID: <20250322025925.1070828-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Mar 2025 02:59:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116193

Drop backported patches
Enable thorvg packageconfig, build fails without it now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Jaeyoon Jung <jaeyoon.jung@lge.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
---
 .../0001-thorvg-fix-build-with-gcc-15.patch   |  8 +--
 ...oth-LV_IMAGE_SRC_FILE-and-LV_IMAGE_S.patch | 63 -----------------
 ...e-node-runtime-configurable-via-envi.patch | 45 ------------
 ...Factor-out-fbdev-initialization-code.patch | 52 --------------
 .../0005-Add-DRM-KMS-example-support.patch    | 59 ----------------
 .../files/0006-Add-SDL2-example-support.patch | 69 -------------------
 ...-generate-versioned-shared-libraries.patch | 68 ------------------
 ...fbdev-set-resolution-prior-to-buffer.patch | 29 --------
 meta-oe/recipes-graphics/lvgl/lv-conf.inc     |  9 +++
 ...demo-fb_9.1.0.bb => lvgl-demo-fb_9.2.2.bb} | 16 ++---
 .../lvgl/{lvgl_9.1.0.bb => lvgl_9.2.2.bb}     |  9 +--
 11 files changed, 20 insertions(+), 407 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/lvgl/files/0002-fix-sdl-handle-both-LV_IMAGE_SRC_FILE-and-LV_IMAGE_S.patch
 delete mode 100644 meta-oe/recipes-graphics/lvgl/files/0003-Make-fbdev-device-node-runtime-configurable-via-envi.patch
 delete mode 100644 meta-oe/recipes-graphics/lvgl/files/0004-Factor-out-fbdev-initialization-code.patch
 delete mode 100644 meta-oe/recipes-graphics/lvgl/files/0005-Add-DRM-KMS-example-support.patch
 delete mode 100644 meta-oe/recipes-graphics/lvgl/files/0006-Add-SDL2-example-support.patch
 delete mode 100644 meta-oe/recipes-graphics/lvgl/files/0007-fix-cmake-generate-versioned-shared-libraries.patch
 delete mode 100644 meta-oe/recipes-graphics/lvgl/files/0008-fix-fbdev-set-resolution-prior-to-buffer.patch
 rename meta-oe/recipes-graphics/lvgl/{lvgl-demo-fb_9.1.0.bb => lvgl-demo-fb_9.2.2.bb} (58%)
 rename meta-oe/recipes-graphics/lvgl/{lvgl_9.1.0.bb => lvgl_9.2.2.bb} (60%)

diff --git a/meta-oe/recipes-graphics/lvgl/files/0001-thorvg-fix-build-with-gcc-15.patch b/meta-oe/recipes-graphics/lvgl/files/0001-thorvg-fix-build-with-gcc-15.patch
index eefcbe5b9c..e61b5224aa 100644
--- a/meta-oe/recipes-graphics/lvgl/files/0001-thorvg-fix-build-with-gcc-15.patch
+++ b/meta-oe/recipes-graphics/lvgl/files/0001-thorvg-fix-build-with-gcc-15.patch
@@ -20,13 +20,11 @@ Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
  src/libs/thorvg/thorvg.h | 1 +
  1 file changed, 1 insertion(+)
 
-diff --git a/src/libs/thorvg/thorvg.h b/src/libs/thorvg/thorvg.h
-index 7f5a84b94..0c84ec66e 100644
 --- a/src/libs/thorvg/thorvg.h
 +++ b/src/libs/thorvg/thorvg.h
-@@ -18,6 +18,7 @@
- #ifndef _THORVG_H_
- #define _THORVG_H_
+@@ -12,6 +12,7 @@
+ #define TVG_BUILD 1
+ 
  
 +#include <cstdint>
  #include <functional>
diff --git a/meta-oe/recipes-graphics/lvgl/files/0002-fix-sdl-handle-both-LV_IMAGE_SRC_FILE-and-LV_IMAGE_S.patch b/meta-oe/recipes-graphics/lvgl/files/0002-fix-sdl-handle-both-LV_IMAGE_SRC_FILE-and-LV_IMAGE_S.patch
deleted file mode 100644
index 0bfc3f3e79..0000000000
--- a/meta-oe/recipes-graphics/lvgl/files/0002-fix-sdl-handle-both-LV_IMAGE_SRC_FILE-and-LV_IMAGE_S.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 5b7f657e8ad656e0854f2252b3bd482b966d650c Mon Sep 17 00:00:00 2001
-From: Marek Vasut <marex@denx.de>
-Date: Wed, 13 Mar 2024 02:12:30 +0100
-Subject: [PATCH 2/2] fix(sdl): handle both LV_IMAGE_SRC_FILE and
- LV_IMAGE_SRC_VARIABLE
-
-The SDL image draw code currently assumes that the image source is a
-filename and attempts to open that filename. This is not necessarily
-the case, e.g. the lv_demo_fb uses encoded images which are of type
-LV_IMAGE_SRC_VARIABLE and instead of filename, come with a buffer of
-pixels. Handle the later using SDL_CreateRGBSurfaceFrom().
-
-Upstream-Status: Backport [b339e67581864b2fb6bb8897735a1e110c324ddc]
-Signed-off-by: Marek Vasut <marex@denx.de>
----
- src/draw/sdl/lv_draw_sdl.c | 30 +++++++++++++++++++++++++++---
- 1 file changed, 27 insertions(+), 3 deletions(-)
-
-diff --git a/src/draw/sdl/lv_draw_sdl.c b/src/draw/sdl/lv_draw_sdl.c
-index cbb555d94..5eee5b725 100644
---- a/src/draw/sdl/lv_draw_sdl.c
-+++ b/src/draw/sdl/lv_draw_sdl.c
-@@ -224,10 +224,34 @@ static bool draw_to_texture(lv_draw_sdl_unit_t * u, cache_data_t * data)
-             break;
-         case LV_DRAW_TASK_TYPE_IMAGE: {
-                 lv_draw_image_dsc_t * image_dsc = task->draw_dsc;
--                const char * path = image_dsc->src;
--                SDL_Surface * surface = IMG_Load(&path[2]);
-+                lv_image_src_t type = lv_image_src_get_type(image_dsc->src);
-+                SDL_Surface * surface = NULL;
-+                if(type == LV_IMAGE_SRC_FILE) {
-+                    const char * path = image_dsc->src;
-+                    surface = IMG_Load(&path[2]);
-+                }
-+                else if(type == LV_IMAGE_SRC_VARIABLE) {
-+                    lv_image_dsc_t * lvd = image_dsc->src;
-+                    surface = SDL_CreateRGBSurfaceFrom(lvd->data,
-+                                                       lvd->header.w, lvd->header.h,
-+                                                       LV_COLOR_FORMAT_GET_BPP(lvd->header.cf),
-+                                                       lvd->header.stride,
-+#if SDL_BYTEORDER == SDL_LIL_ENDIAN
-+                                                       0x00FF0000,
-+                                                       0x0000FF00,
-+                                                       0x000000FF,
-+                                                       0xFF000000
-+#else
-+                                                       0x0000FF00,
-+                                                       0x00FF0000,
-+                                                       0xFF000000,
-+                                                       0x000000FF
-+#endif
-+                                                      );
-+                }
-+
-                 if(surface == NULL) {
--                    fprintf(stderr, "could not load image: %s\n", IMG_GetError());
-+                    fprintf(stderr, "could not load image\n");
-                     return false;
-                 }
- 
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-graphics/lvgl/files/0003-Make-fbdev-device-node-runtime-configurable-via-envi.patch b/meta-oe/recipes-graphics/lvgl/files/0003-Make-fbdev-device-node-runtime-configurable-via-envi.patch
deleted file mode 100644
index 7e542bcfbc..0000000000
--- a/meta-oe/recipes-graphics/lvgl/files/0003-Make-fbdev-device-node-runtime-configurable-via-envi.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 85d90749a10b5f91741d37b75825935bf7cc4fb3 Mon Sep 17 00:00:00 2001
-From: Marek Vasut <marex@denx.de>
-Date: Tue, 12 Mar 2024 03:00:37 +0100
-Subject: [PATCH 3/6] Make fbdev device node runtime configurable via
- environment variable
-
-Test whether $LV_VIDEO_CARD environment variable is non-NULL and in
-case it is, use it as the video card file in lv_linux_fbdev_set_file().
-Otherwise fall back to /dev/fb0, i.e. the current behavior. This way,
-it is possible to test LVGL on systems with multiple fbdev devices.
-
-Upstream-Status: Backport [a0f03515bd7417a0d100058b133c3e8d69be9451]
-Signed-off-by: Marek Vasut <marex@denx.de>
----
- main.c | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/main.c b/main.c
-index 9775b9c..b64a098 100644
---- a/main.c
-+++ b/main.c
-@@ -4,13 +4,19 @@
- #include <pthread.h>
- #include <time.h>
- 
-+static const char *lv_linux_get_video_card_node(const char *videocard_default)
-+{
-+    return getenv("LV_VIDEO_CARD") ? : videocard_default;
-+}
-+
- int main(void)
- {
-+    const char *videocard = lv_linux_get_video_card_node("/dev/fb0");
-     lv_init();
- 
-     /*Linux frame buffer device init*/
-     lv_display_t * disp = lv_linux_fbdev_create();
--    lv_linux_fbdev_set_file(disp, "/dev/fb0");
-+    lv_linux_fbdev_set_file(disp, videocard);
- 
-     /*Create a Demo*/
-     lv_demo_widgets();
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-graphics/lvgl/files/0004-Factor-out-fbdev-initialization-code.patch b/meta-oe/recipes-graphics/lvgl/files/0004-Factor-out-fbdev-initialization-code.patch
deleted file mode 100644
index 6843af0aab..0000000000
--- a/meta-oe/recipes-graphics/lvgl/files/0004-Factor-out-fbdev-initialization-code.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 593da8e11cc5029773ad330b5d7633ee9f2fba95 Mon Sep 17 00:00:00 2001
-From: Marek Vasut <marex@denx.de>
-Date: Tue, 12 Mar 2024 18:09:42 +0100
-Subject: [PATCH 4/6] Factor out fbdev initialization code
-
-Pull fbdev initialization code into separate function and add ifdef
-around it, so it can be conditionally compiled in. This is done in
-preparation for addition of other backend initialization example
-code.
-
-Upstream-Status: Backport [a0f03515bd7417a0d100058b133c3e8d69be9451]
-Signed-off-by: Marek Vasut <marex@denx.de>
----
- main.c | 18 ++++++++++++++----
- 1 file changed, 14 insertions(+), 4 deletions(-)
-
-diff --git a/main.c b/main.c
-index b64a098..288519c 100644
---- a/main.c
-+++ b/main.c
-@@ -9,14 +9,24 @@ static const char *lv_linux_get_video_card_node(const char *videocard_default)
-     return getenv("LV_VIDEO_CARD") ? : videocard_default;
- }
- 
--int main(void)
-+#if LV_USE_LINUX_FBDEV
-+static void lv_linux_disp_init(void)
- {
-     const char *videocard = lv_linux_get_video_card_node("/dev/fb0");
--    lv_init();
--
--    /*Linux frame buffer device init*/
-     lv_display_t * disp = lv_linux_fbdev_create();
-+
-     lv_linux_fbdev_set_file(disp, videocard);
-+}
-+#else
-+#error Unsupported configuration
-+#endif
-+
-+int main(void)
-+{
-+    lv_init();
-+
-+    /*Linux display device init*/
-+    lv_linux_disp_init();
- 
-     /*Create a Demo*/
-     lv_demo_widgets();
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-graphics/lvgl/files/0005-Add-DRM-KMS-example-support.patch b/meta-oe/recipes-graphics/lvgl/files/0005-Add-DRM-KMS-example-support.patch
deleted file mode 100644
index 2d2c4c60f1..0000000000
--- a/meta-oe/recipes-graphics/lvgl/files/0005-Add-DRM-KMS-example-support.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From dabf40559428733413432afa29598bc145aa6636 Mon Sep 17 00:00:00 2001
-From: Marek Vasut <marex@denx.de>
-Date: Tue, 12 Mar 2024 03:08:13 +0100
-Subject: [PATCH 5/6] Add DRM/KMS example support
-
-Extend the main.c to support both legacy fbdev and DRM/KMS initialization.
-
-To use legacy fbdev support, adjust lv_conf.h as follows:
-LV_USE_LINUX_FBDEV=1
-LV_USE_LINUX_DRM=0
-
-To use DRM/KMS support, adjust lv_conf.h as follows:
-LV_USE_LINUX_FBDEV=0
-LV_USE_LINUX_DRM=1
-
-Upstream-Status: Backport [a0f03515bd7417a0d100058b133c3e8d69be9451]
-Signed-off-by: Marek Vasut <marex@denx.de>
----
- CMakeLists.txt | 5 ++++-
- main.c         | 8 ++++++++
- 2 files changed, 12 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index d91b196..c1cfb7f 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -12,6 +12,9 @@ target_include_directories(lvgl PUBLIC ${PROJECT_SOURCE_DIR})
- 
- add_executable(main main.c mouse_cursor_icon.c)
- 
--target_link_libraries(main lvgl lvgl::examples lvgl::demos lvgl::thorvg ${SDL2_LIBRARIES} m pthread)
-+include(${CMAKE_CURRENT_LIST_DIR}/lvgl/tests/FindLibDRM.cmake)
-+include_directories(${Libdrm_INCLUDE_DIRS})
-+
-+target_link_libraries(main lvgl lvgl::examples lvgl::demos lvgl::thorvg ${SDL2_LIBRARIES} ${Libdrm_LIBRARIES} m pthread)
- add_custom_target (run COMMAND ${EXECUTABLE_OUTPUT_PATH}/main DEPENDS main)
- 
-diff --git a/main.c b/main.c
-index 288519c..ab4e936 100644
---- a/main.c
-+++ b/main.c
-@@ -17,6 +17,14 @@ static void lv_linux_disp_init(void)
- 
-     lv_linux_fbdev_set_file(disp, videocard);
- }
-+#elif LV_USE_LINUX_DRM
-+static void lv_linux_disp_init(void)
-+{
-+    const char *videocard = lv_linux_get_video_card_node("/dev/dri/card0");
-+    lv_display_t * disp = lv_linux_drm_create();
-+
-+    lv_linux_drm_set_file(disp, videocard, -1);
-+}
- #else
- #error Unsupported configuration
- #endif
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-graphics/lvgl/files/0006-Add-SDL2-example-support.patch b/meta-oe/recipes-graphics/lvgl/files/0006-Add-SDL2-example-support.patch
deleted file mode 100644
index cfb6c6e817..0000000000
--- a/meta-oe/recipes-graphics/lvgl/files/0006-Add-SDL2-example-support.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From b202ce51f7b68c460fcd1b6d9c3ffa8aaf2baaf6 Mon Sep 17 00:00:00 2001
-From: Marek Vasut <marex@denx.de>
-Date: Tue, 12 Mar 2024 19:05:38 +0100
-Subject: [PATCH 6/6] Add SDL2 example support
-
-Extend the main.c to support both legacy fbdev, DRM/KMS, SDL2 initialization.
-The SDL2 window resolution can be configured using environment variables
-LV_VIDEO_WIDTH and LV_VIDEO_HEIGHT and defaults to 800 x 480 .
-
-To use legacy fbdev support, adjust lv_conf.h as follows:
-LV_USE_LINUX_FBDEV=1
-LV_USE_LINUX_DRM=0
-LV_USE_SDL=0
-
-To use DRM/KMS support, adjust lv_conf.h as follows:
-LV_USE_LINUX_FBDEV=0
-LV_USE_LINUX_DRM=1
-LV_USE_SDL=0
-
-To use SDL2 support, adjust lv_conf.h as follows:
-LV_USE_LINUX_FBDEV=0
-LV_USE_LINUX_DRM=0
-LV_USE_SDL=1
-
-Upstream-Status: Backport [a0f03515bd7417a0d100058b133c3e8d69be9451]
-Signed-off-by: Marek Vasut <marex@denx.de>
----
- CMakeLists.txt | 6 +++++-
- main.c         | 8 ++++++++
- 2 files changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index c1cfb7f..658193f 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -15,6 +15,10 @@ add_executable(main main.c mouse_cursor_icon.c)
- include(${CMAKE_CURRENT_LIST_DIR}/lvgl/tests/FindLibDRM.cmake)
- include_directories(${Libdrm_INCLUDE_DIRS})
- 
--target_link_libraries(main lvgl lvgl::examples lvgl::demos lvgl::thorvg ${SDL2_LIBRARIES} ${Libdrm_LIBRARIES} m pthread)
-+find_package(SDL2)
-+find_package(SDL2_image)
-+include_directories(${SDL2_INCLUDE_DIRS} ${SDL2_IMAGE_INCLUDE_DIRS})
-+
-+target_link_libraries(main lvgl lvgl::examples lvgl::demos lvgl::thorvg ${SDL2_LIBRARIES} ${SDL2_IMAGE_LIBRARIES} ${Libdrm_LIBRARIES} m pthread)
- add_custom_target (run COMMAND ${EXECUTABLE_OUTPUT_PATH}/main DEPENDS main)
- 
-diff --git a/main.c b/main.c
-index ab4e936..4b66ebc 100644
---- a/main.c
-+++ b/main.c
-@@ -25,6 +25,14 @@ static void lv_linux_disp_init(void)
- 
-     lv_linux_drm_set_file(disp, videocard, -1);
- }
-+#elif LV_USE_SDL
-+static void lv_linux_disp_init(void)
-+{
-+    const int width = atoi(getenv("LV_VIDEO_WIDTH") ? : "800");
-+    const int height = atoi(getenv("LV_VIDEO_HEIGHT") ? : "480");
-+
-+    lv_sdl_window_create(width, height);
-+}
- #else
- #error Unsupported configuration
- #endif
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-graphics/lvgl/files/0007-fix-cmake-generate-versioned-shared-libraries.patch b/meta-oe/recipes-graphics/lvgl/files/0007-fix-cmake-generate-versioned-shared-libraries.patch
deleted file mode 100644
index f5d39396fc..0000000000
--- a/meta-oe/recipes-graphics/lvgl/files/0007-fix-cmake-generate-versioned-shared-libraries.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 40657a770baadfff30abfecf7638e7b1c340db4d Mon Sep 17 00:00:00 2001
-From: Marek Vasut <marex@denx.de>
-Date: Thu, 14 Mar 2024 03:23:10 +0100
-Subject: [PATCH] fix(cmake): generate versioned shared libraries
-
-Add missing version suffix to shared libraries. Currently the filename of
-generated shared libraries is only liblvgl.so, which prevents coexistence
-of different versions of LVGL on the same system. Set VERSION and SOVERSION
-to make cmake add the version suffix to generated shared libraries. That
-changes the filename to liblvgl.so.9.1.0 and includes symlink with major
-ABI version, i.e. liblvgl.so.9 .
-
-Upstream-Status: Backport [2c469279f53f9dee63d71295c6058749bc87ce73]
-Signed-off-by: Marek Vasut <marex@denx.de>
----
- env_support/cmake/custom.cmake | 11 +++++++++++
- 1 file changed, 11 insertions(+)
-
-diff --git a/env_support/cmake/custom.cmake b/env_support/cmake/custom.cmake
-index 9800468eb..6f33f1cc8 100644
---- a/env_support/cmake/custom.cmake
-+++ b/env_support/cmake/custom.cmake
-@@ -1,3 +1,6 @@
-+set(LVGL_VERSION "9.1.0")
-+set(LVGL_SOVERSION "9")
-+
- # Option to define LV_LVGL_H_INCLUDE_SIMPLE, default: ON
- option(LV_LVGL_H_INCLUDE_SIMPLE
-        "Use #include \"lvgl.h\" instead of #include \"../../lvgl.h\"" ON)
-@@ -119,6 +122,8 @@ install(
- set_target_properties(
-   lvgl
-   PROPERTIES OUTPUT_NAME lvgl
-+             VERSION ${LVGL_VERSION}
-+             SOVERSION ${LVGL_SOVERSION}
-              ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
-              LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
-              RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
-@@ -137,6 +142,8 @@ if(NOT LV_CONF_BUILD_DISABLE_THORVG_INTERNAL)
-   set_target_properties(
-     lvgl_thorvg
-     PROPERTIES OUTPUT_NAME lvgl_thorvg
-+               VERSION ${LVGL_VERSION}
-+               SOVERSION ${LVGL_SOVERSION}
-                ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
-                LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
-                RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
-@@ -155,6 +162,8 @@ if(NOT LV_CONF_BUILD_DISABLE_DEMOS)
-   set_target_properties(
-     lvgl_demos
-     PROPERTIES OUTPUT_NAME lvgl_demos
-+               VERSION ${LVGL_VERSION}
-+               SOVERSION ${LVGL_SOVERSION}
-                ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
-                LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
-                RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
-@@ -173,6 +182,8 @@ if(NOT LV_CONF_BUILD_DISABLE_EXAMPLES)
-   set_target_properties(
-     lvgl_examples
-     PROPERTIES OUTPUT_NAME lvgl_examples
-+               VERSION ${LVGL_VERSION}
-+               SOVERSION ${LVGL_SOVERSION}
-                ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
-                LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
-                RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-graphics/lvgl/files/0008-fix-fbdev-set-resolution-prior-to-buffer.patch b/meta-oe/recipes-graphics/lvgl/files/0008-fix-fbdev-set-resolution-prior-to-buffer.patch
deleted file mode 100644
index 5cafb41d56..0000000000
--- a/meta-oe/recipes-graphics/lvgl/files/0008-fix-fbdev-set-resolution-prior-to-buffer.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From a6f822f75b3ba01b00c028608c93160d09a6ffd1 Mon Sep 17 00:00:00 2001
-From: Jaeyoon Jung <jaeyoon.jung@lge.com>
-Date: Mon, 1 Apr 2024 18:00:39 +0900
-Subject: [PATCH] fix(fbdev): set resolution prior to buffer
-
-Otherwise it ends up with using the default value 800x480 and may fail
-at lv_display_set_buffers due to incorrect resolution.
-
-Upstream-Status: Backport [29662d1c357c15135d076a2a924b9ef056c82120]
-Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
----
-
- src/drivers/display/fb/lv_linux_fbdev.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/drivers/display/fb/lv_linux_fbdev.c b/src/drivers/display/fb/lv_linux_fbdev.c
-index b3cc89199..5fb4c5c9f 100644
---- a/src/drivers/display/fb/lv_linux_fbdev.c
-+++ b/src/drivers/display/fb/lv_linux_fbdev.c
-@@ -233,8 +233,8 @@ void lv_linux_fbdev_set_file(lv_display_t * disp, const char * file)
-         draw_buf_2 = malloc(draw_buf_size);
-     }
- 
--    lv_display_set_buffers(disp, draw_buf, draw_buf_2, draw_buf_size, LV_LINUX_FBDEV_RENDER_MODE);
-     lv_display_set_resolution(disp, hor_res, ver_res);
-+    lv_display_set_buffers(disp, draw_buf, draw_buf_2, draw_buf_size, LV_LINUX_FBDEV_RENDER_MODE);
- 
-     if(width > 0) {
-         lv_display_set_dpi(disp, DIV_ROUND_UP(hor_res * 254, width * 10));
diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
index 41133f3438..69e42af922 100644
--- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
+++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
@@ -33,10 +33,16 @@ LVGL_CONFIG_LV_USE_GRIDNAV = "${@bb.utils.contains('PACKAGECONFIG', 'gridnav', '
 
 LVGL_CONFIG_LV_THEME_DEFAULT_DARK ?= "0"
 
+LVGL_CONFIG_USE_LOTTIE = "${@bb.utils.contains('PACKAGECONFIG', 'thorvg', '1', '0', d)}"
+
 LVGL_CONFIG_USE_VECTOR_GRAPHICS = "${@bb.utils.contains('PACKAGECONFIG', 'thorvg', '1', '0', d)}"
 
 LVGL_CONFIG_USE_THORVG_INTERNAL = "${@bb.utils.contains('PACKAGECONFIG', 'thorvg', '1', '0', d)}"
 
+LVGL_CONFIG_USE_MATRIX = "${@bb.utils.contains('PACKAGECONFIG', 'thorvg', '1', '0', d)}"
+
+LVGL_CONFIG_USE_FLOAT = "${@bb.utils.contains('PACKAGECONFIG', 'thorvg', '1', '0', d)}"
+
 DEBUG_BUILD ??= "0"
 
 ALLOW_EMPTY:${PN} = "1"
@@ -84,6 +90,9 @@ do_configure:append() {
         \
         -e "s|^([[:space:]]*#define LV_USE_VECTOR_GRAPHIC[[:space:]]).*|\1${LVGL_CONFIG_USE_VECTOR_GRAPHICS}|" \
         -e "s|^([[:space:]]*#define LV_USE_THORVG_INTERNAL[[:space:]]).*|\1${LVGL_CONFIG_USE_THORVG_INTERNAL}|" \
+        -e "s|^([[:space:]]*#define LV_USE_MATRIX[[:space:]]).*|\1${LVGL_CONFIG_USE_MATRIX}|" \
+        -e "s|^([[:space:]]*#define LV_USE_FLOAT[[:space:]]).*|\1${LVGL_CONFIG_USE_FLOAT}|" \
         \
+        -e "s|^([[:space:]]*#define LV_USE_LOTTIE[[:space:]]).*|\1${LVGL_CONFIG_USE_LOTTIE}|" \
         -i "${S}/lv_conf.h"
 }
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.1.0.bb b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.2.2.bb
similarity index 58%
rename from meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.1.0.bb
rename to meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.2.2.bb
index 6e8371baad..1228748701 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.1.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.2.2.bb
@@ -5,18 +5,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=802d3d83ae80ef5f343050bf96cce3a4 \
                     file://lvgl/LICENCE.txt;md5=bf1198c89ae87f043108cea62460b03a"
 
 SRC_URI = "\
-	git://github.com/lvgl/lv_port_linux_frame_buffer.git;protocol=https;branch=master;name=demo \
-	git://github.com/lvgl/lvgl;protocol=https;branch=master;name=lvgl;subdir=git/lvgl \
-	file://0002-fix-sdl-handle-both-LV_IMAGE_SRC_FILE-and-LV_IMAGE_S.patch;patchdir=lvgl \
-	file://0003-Make-fbdev-device-node-runtime-configurable-via-envi.patch \
-	file://0004-Factor-out-fbdev-initialization-code.patch \
-	file://0005-Add-DRM-KMS-example-support.patch \
-	file://0006-Add-SDL2-example-support.patch \
-	file://0007-fix-cmake-generate-versioned-shared-libraries.patch;patchdir=lvgl \
-	file://0008-fix-fbdev-set-resolution-prior-to-buffer.patch;patchdir=lvgl \
+	git://github.com/lvgl/lv_port_linux_frame_buffer.git;protocol=https;branch=release/v9.2;name=demo \
+	git://github.com/lvgl/lvgl;protocol=https;branch=release/v9.2;name=lvgl;subdir=git/lvgl \
+	file://0001-thorvg-fix-build-with-gcc-15.patch;patchdir=lvgl \
 	"
-SRCREV_demo = "dccc6a1ca48372aa993dbea7a8e17dec6f42df6a"
-SRCREV_lvgl = "e1c0b21b2723d391b885de4b2ee5cc997eccca91"
+SRCREV_demo = "c924e24c7aa55317521bcd9dd75ce9337508f5a5"
+SRCREV_lvgl = "7f07a129e8d77f4984fff8e623fd5be18ff42e74"
 SRCREV_FORMAT = "demo_lvgl"
 
 EXTRA_OEMAKE = "DESTDIR=${D}"
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_9.1.0.bb b/meta-oe/recipes-graphics/lvgl/lvgl_9.2.2.bb
similarity index 60%
rename from meta-oe/recipes-graphics/lvgl/lvgl_9.1.0.bb
rename to meta-oe/recipes-graphics/lvgl/lvgl_9.2.2.bb
index b07cdfc8f6..935e84ad23 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_9.1.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_9.2.2.bb
@@ -9,13 +9,10 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE.txt;md5=bf1198c89ae87f043108cea62460b03a"
 
 SRC_URI = "\
-	git://github.com/lvgl/lvgl;protocol=https;branch=master \
-	file://0002-fix-sdl-handle-both-LV_IMAGE_SRC_FILE-and-LV_IMAGE_S.patch \
-	file://0007-fix-cmake-generate-versioned-shared-libraries.patch \
-	file://0008-fix-fbdev-set-resolution-prior-to-buffer.patch \
-        file://0001-thorvg-fix-build-with-gcc-15.patch \
+	git://github.com/lvgl/lvgl;protocol=https;branch=release/v9.2 \
+    file://0001-thorvg-fix-build-with-gcc-15.patch \
 	"
-SRCREV = "e1c0b21b2723d391b885de4b2ee5cc997eccca91"
+SRCREV = "7f07a129e8d77f4984fff8e623fd5be18ff42e74"
 
 inherit cmake
 

