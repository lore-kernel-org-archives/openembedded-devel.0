Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9488DC54E72
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 04:51:28 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.9068.1710305480573809718
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Mar 2024 21:51:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=uSkjEdmE;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 810B587DF1;
	Wed, 13 Mar 2024 05:51:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710305478;
	bh=fUZf4yF27XW3kuGF1HsvpPFDdzslVRMxtHx/utWxCQE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uSkjEdmEehZsI0YyLEYQtYgd/UuEAqiRhzi8wBVG1oC6mrYCGVQ6US0s47rNKSOqT
	 8IwNcm9GORAHZyVfkXC9UyU/1beaDj5R8Ud2EEv+IvMqYJx3U2KOLka1qQvlG+YBgR
	 EQ6W7xgvrwkCQk3W4D1xghHDmMpO1LbpT7+EhUM2K/HJtmwv/yciAHJK/K5iMXQftz
	 1j2v28uexOtP9Ti3zWUkUtPAhnNsrAsftgrzi11DUHLC8SjKC64pGC4kzNECmnsD1H
	 Bv6r6IAXemQKZXjxxrWd12+6GNazmkgR0d7hFRudYd0pfktulJjJ7dnWJOUvMNyInY
	 QrYC3FBEuhqbw==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Fabio Estevam <festevam@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 8/8] lvgl: Replace sed patching with real patches
Date: Wed, 13 Mar 2024 05:40:11 +0100
Message-ID: <20240313045038.90500-9-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240313045038.90500-1-marex@denx.de>
References: <20240313045038.90500-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 04:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109288

Replace the current awful sed hacking with real patches bound for upstrea=
m.
The sed hacking was simply not maintainable anymore.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Fabio Estevam <festevam@denx.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
---
 ...-drm-Default-to-XRGB8888-framebuffer.patch | 36 ++++++++++
 ...oth-LV_IMAGE_SRC_FILE-and-LV_IMAGE_S.patch | 63 +++++++++++++++++
 ...e-node-runtime-configurable-via-envi.patch | 45 ++++++++++++
 ...Factor-out-fbdev-initialization-code.patch | 52 ++++++++++++++
 .../0005-Add-DRM-KMS-example-support.patch    | 59 ++++++++++++++++
 .../files/0006-Add-SDL2-example-support.patch | 69 +++++++++++++++++++
 .../lvgl/lvgl-demo-fb_9.0.0.bb                | 24 +++----
 meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb   | 11 ++-
 8 files changed, 337 insertions(+), 22 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/lvgl/files/0001-fix-drm-Defa=
ult-to-XRGB8888-framebuffer.patch
 create mode 100644 meta-oe/recipes-graphics/lvgl/files/0002-fix-sdl-hand=
le-both-LV_IMAGE_SRC_FILE-and-LV_IMAGE_S.patch
 create mode 100644 meta-oe/recipes-graphics/lvgl/files/0003-Make-fbdev-d=
evice-node-runtime-configurable-via-envi.patch
 create mode 100644 meta-oe/recipes-graphics/lvgl/files/0004-Factor-out-f=
bdev-initialization-code.patch
 create mode 100644 meta-oe/recipes-graphics/lvgl/files/0005-Add-DRM-KMS-=
example-support.patch
 create mode 100644 meta-oe/recipes-graphics/lvgl/files/0006-Add-SDL2-exa=
mple-support.patch

diff --git a/meta-oe/recipes-graphics/lvgl/files/0001-fix-drm-Default-to-=
XRGB8888-framebuffer.patch b/meta-oe/recipes-graphics/lvgl/files/0001-fix=
-drm-Default-to-XRGB8888-framebuffer.patch
new file mode 100644
index 000000000..9d758cb08
--- /dev/null
+++ b/meta-oe/recipes-graphics/lvgl/files/0001-fix-drm-Default-to-XRGB888=
8-framebuffer.patch
@@ -0,0 +1,36 @@
+From 7b89e18c2f21e4b91b461007368df724198ac904 Mon Sep 17 00:00:00 2001
+From: Marek Vasut <marex@denx.de>
+Date: Tue, 12 Mar 2024 03:13:33 +0100
+Subject: [PATCH 1/2] fix(drm): Default to XRGB8888 framebuffer
+
+The ARGB8888 framebuffer format for base canvas makes little sense
+as the base canvas is unlikely to be transparent and require alpha.
+Use XRGB8888 framebuffer format which is more widely supported by
+DRM drivers as base plane pixel format.
+
+This makes e.g. i.MX8M Nano work by default.
+
+Upstream-Status: Submitted [https://github.com/lvgl/lvgl/pull/5851]
+Signed-off-by: Marek Vasut <marex@denx.de>
+---
+This is identical fix to lv_drivers https://github.com/lvgl/lv_drivers/p=
ull/282
+---
+ src/drivers/display/drm/lv_linux_drm.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/drivers/display/drm/lv_linux_drm.c b/src/drivers/displa=
y/drm/lv_linux_drm.c
+index c706f9cb2..faa2212bf 100644
+--- a/src/drivers/display/drm/lv_linux_drm.c
++++ b/src/drivers/display/drm/lv_linux_drm.c
+@@ -24,7 +24,7 @@
+  *      DEFINES
+  *********************/
+ #if LV_COLOR_DEPTH =3D=3D 32
+-    #define DRM_FOURCC DRM_FORMAT_ARGB8888
++    #define DRM_FOURCC DRM_FORMAT_XRGB8888
+ #elif LV_COLOR_DEPTH =3D=3D 16
+     #define DRM_FOURCC DRM_FORMAT_RGB565
+ #else
+--=20
+2.43.0
+
diff --git a/meta-oe/recipes-graphics/lvgl/files/0002-fix-sdl-handle-both=
-LV_IMAGE_SRC_FILE-and-LV_IMAGE_S.patch b/meta-oe/recipes-graphics/lvgl/f=
iles/0002-fix-sdl-handle-both-LV_IMAGE_SRC_FILE-and-LV_IMAGE_S.patch
new file mode 100644
index 000000000..bd619b157
--- /dev/null
+++ b/meta-oe/recipes-graphics/lvgl/files/0002-fix-sdl-handle-both-LV_IMA=
GE_SRC_FILE-and-LV_IMAGE_S.patch
@@ -0,0 +1,63 @@
+From 5b7f657e8ad656e0854f2252b3bd482b966d650c Mon Sep 17 00:00:00 2001
+From: Marek Vasut <marex@denx.de>
+Date: Wed, 13 Mar 2024 02:12:30 +0100
+Subject: [PATCH 2/2] fix(sdl): handle both LV_IMAGE_SRC_FILE and
+ LV_IMAGE_SRC_VARIABLE
+
+The SDL image draw code currently assumes that the image source is a
+filename and attempts to open that filename. This is not necessarily
+the case, e.g. the lv_demo_fb uses encoded images which are of type
+LV_IMAGE_SRC_VARIABLE and instead of filename, come with a buffer of
+pixels. Handle the later using SDL_CreateRGBSurfaceFrom().
+
+Upstream-Status: Submitted [https://github.com/lvgl/lvgl/pull/5852]
+Signed-off-by: Marek Vasut <marex@denx.de>
+---
+ src/draw/sdl/lv_draw_sdl.c | 30 +++++++++++++++++++++++++++---
+ 1 file changed, 27 insertions(+), 3 deletions(-)
+
+diff --git a/src/draw/sdl/lv_draw_sdl.c b/src/draw/sdl/lv_draw_sdl.c
+index cbb555d94..5eee5b725 100644
+--- a/src/draw/sdl/lv_draw_sdl.c
++++ b/src/draw/sdl/lv_draw_sdl.c
+@@ -224,10 +224,34 @@ static bool draw_to_texture(lv_draw_sdl_unit_t * u=
, cache_data_t * data)
+             break;
+         case LV_DRAW_TASK_TYPE_IMAGE: {
+                 lv_draw_image_dsc_t * image_dsc =3D task->draw_dsc;
+-                const char * path =3D image_dsc->src;
+-                SDL_Surface * surface =3D IMG_Load(&path[2]);
++                lv_image_src_t type =3D lv_image_src_get_type(image_dsc=
->src);
++                SDL_Surface * surface =3D NULL;
++                if(type =3D=3D LV_IMAGE_SRC_FILE) {
++                    const char * path =3D image_dsc->src;
++                    surface =3D IMG_Load(&path[2]);
++                }
++                else if(type =3D=3D LV_IMAGE_SRC_VARIABLE) {
++                    lv_image_dsc_t * lvd =3D image_dsc->src;
++                    surface =3D SDL_CreateRGBSurfaceFrom(lvd->data,
++                                                       lvd->header.w, l=
vd->header.h,
++                                                       LV_COLOR_FORMAT_=
GET_BPP(lvd->header.cf),
++                                                       lvd->header.stri=
de,
++#if SDL_BYTEORDER =3D=3D SDL_LIL_ENDIAN
++                                                       0x00FF0000,
++                                                       0x0000FF00,
++                                                       0x000000FF,
++                                                       0xFF000000
++#else
++                                                       0x0000FF00,
++                                                       0x00FF0000,
++                                                       0xFF000000,
++                                                       0x000000FF
++#endif
++                                                      );
++                }
++
+                 if(surface =3D=3D NULL) {
+-                    fprintf(stderr, "could not load image: %s\n", IMG_G=
etError());
++                    fprintf(stderr, "could not load image\n");
+                     return false;
+                 }
+=20
+--=20
+2.43.0
+
diff --git a/meta-oe/recipes-graphics/lvgl/files/0003-Make-fbdev-device-n=
ode-runtime-configurable-via-envi.patch b/meta-oe/recipes-graphics/lvgl/f=
iles/0003-Make-fbdev-device-node-runtime-configurable-via-envi.patch
new file mode 100644
index 000000000..73c01cb59
--- /dev/null
+++ b/meta-oe/recipes-graphics/lvgl/files/0003-Make-fbdev-device-node-run=
time-configurable-via-envi.patch
@@ -0,0 +1,45 @@
+From 85d90749a10b5f91741d37b75825935bf7cc4fb3 Mon Sep 17 00:00:00 2001
+From: Marek Vasut <marex@denx.de>
+Date: Tue, 12 Mar 2024 03:00:37 +0100
+Subject: [PATCH 3/6] Make fbdev device node runtime configurable via
+ environment variable
+
+Test whether $LV_VIDEO_CARD environment variable is non-NULL and in
+case it is, use it as the video card file in lv_linux_fbdev_set_file().
+Otherwise fall back to /dev/fb0, i.e. the current behavior. This way,
+it is possible to test LVGL on systems with multiple fbdev devices.
+
+Upstream-Status: Submitted [https://github.com/lvgl/lv_port_linux_frame_=
buffer/pull/47]
+Signed-off-by: Marek Vasut <marex@denx.de>
+---
+ main.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/main.c b/main.c
+index 9775b9c..b64a098 100644
+--- a/main.c
++++ b/main.c
+@@ -4,13 +4,19 @@
+ #include <pthread.h>
+ #include <time.h>
+=20
++static const char *lv_linux_get_video_card_node(const char *videocard_d=
efault)
++{
++    return getenv("LV_VIDEO_CARD") ? : videocard_default;
++}
++
+ int main(void)
+ {
++    const char *videocard =3D lv_linux_get_video_card_node("/dev/fb0");
+     lv_init();
+=20
+     /*Linux frame buffer device init*/
+     lv_display_t * disp =3D lv_linux_fbdev_create();
+-    lv_linux_fbdev_set_file(disp, "/dev/fb0");
++    lv_linux_fbdev_set_file(disp, videocard);
+=20
+     /*Create a Demo*/
+     lv_demo_widgets();
+--=20
+2.43.0
+
diff --git a/meta-oe/recipes-graphics/lvgl/files/0004-Factor-out-fbdev-in=
itialization-code.patch b/meta-oe/recipes-graphics/lvgl/files/0004-Factor=
-out-fbdev-initialization-code.patch
new file mode 100644
index 000000000..d24d150c0
--- /dev/null
+++ b/meta-oe/recipes-graphics/lvgl/files/0004-Factor-out-fbdev-initializ=
ation-code.patch
@@ -0,0 +1,52 @@
+From 593da8e11cc5029773ad330b5d7633ee9f2fba95 Mon Sep 17 00:00:00 2001
+From: Marek Vasut <marex@denx.de>
+Date: Tue, 12 Mar 2024 18:09:42 +0100
+Subject: [PATCH 4/6] Factor out fbdev initialization code
+
+Pull fbdev initialization code into separate function and add ifdef
+around it, so it can be conditionally compiled in. This is done in
+preparation for addition of other backend initialization example
+code.
+
+Upstream-Status: Submitted [https://github.com/lvgl/lv_port_linux_frame_=
buffer/pull/47]
+Signed-off-by: Marek Vasut <marex@denx.de>
+---
+ main.c | 18 ++++++++++++++----
+ 1 file changed, 14 insertions(+), 4 deletions(-)
+
+diff --git a/main.c b/main.c
+index b64a098..288519c 100644
+--- a/main.c
++++ b/main.c
+@@ -9,14 +9,24 @@ static const char *lv_linux_get_video_card_node(const =
char *videocard_default)
+     return getenv("LV_VIDEO_CARD") ? : videocard_default;
+ }
+=20
+-int main(void)
++#if LV_USE_LINUX_FBDEV
++static void lv_linux_disp_init(void)
+ {
+     const char *videocard =3D lv_linux_get_video_card_node("/dev/fb0");
+-    lv_init();
+-
+-    /*Linux frame buffer device init*/
+     lv_display_t * disp =3D lv_linux_fbdev_create();
++
+     lv_linux_fbdev_set_file(disp, videocard);
++}
++#else
++#error Unsupported configuration
++#endif
++
++int main(void)
++{
++    lv_init();
++
++    /*Linux display device init*/
++    lv_linux_disp_init();
+=20
+     /*Create a Demo*/
+     lv_demo_widgets();
+--=20
+2.43.0
+
diff --git a/meta-oe/recipes-graphics/lvgl/files/0005-Add-DRM-KMS-example=
-support.patch b/meta-oe/recipes-graphics/lvgl/files/0005-Add-DRM-KMS-exa=
mple-support.patch
new file mode 100644
index 000000000..9ee7a7f19
--- /dev/null
+++ b/meta-oe/recipes-graphics/lvgl/files/0005-Add-DRM-KMS-example-suppor=
t.patch
@@ -0,0 +1,59 @@
+From dabf40559428733413432afa29598bc145aa6636 Mon Sep 17 00:00:00 2001
+From: Marek Vasut <marex@denx.de>
+Date: Tue, 12 Mar 2024 03:08:13 +0100
+Subject: [PATCH 5/6] Add DRM/KMS example support
+
+Extend the main.c to support both legacy fbdev and DRM/KMS initializatio=
n.
+
+To use legacy fbdev support, adjust lv_conf.h as follows:
+LV_USE_LINUX_FBDEV=3D1
+LV_USE_LINUX_DRM=3D0
+
+To use DRM/KMS support, adjust lv_conf.h as follows:
+LV_USE_LINUX_FBDEV=3D0
+LV_USE_LINUX_DRM=3D1
+
+Upstream-Status: Submitted [https://github.com/lvgl/lv_port_linux_frame_=
buffer/pull/47]
+Signed-off-by: Marek Vasut <marex@denx.de>
+---
+ CMakeLists.txt | 5 ++++-
+ main.c         | 8 ++++++++
+ 2 files changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d91b196..c1cfb7f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -12,6 +12,9 @@ target_include_directories(lvgl PUBLIC ${PROJECT_SOURC=
E_DIR})
+=20
+ add_executable(main main.c mouse_cursor_icon.c)
+=20
+-target_link_libraries(main lvgl lvgl::examples lvgl::demos lvgl::thorvg=
 ${SDL2_LIBRARIES} m pthread)
++include(${CMAKE_CURRENT_LIST_DIR}/lvgl/tests/FindLibDRM.cmake)
++include_directories(${Libdrm_INCLUDE_DIRS})
++
++target_link_libraries(main lvgl lvgl::examples lvgl::demos lvgl::thorvg=
 ${SDL2_LIBRARIES} ${Libdrm_LIBRARIES} m pthread)
+ add_custom_target (run COMMAND ${EXECUTABLE_OUTPUT_PATH}/main DEPENDS m=
ain)
+=20
+diff --git a/main.c b/main.c
+index 288519c..ab4e936 100644
+--- a/main.c
++++ b/main.c
+@@ -17,6 +17,14 @@ static void lv_linux_disp_init(void)
+=20
+     lv_linux_fbdev_set_file(disp, videocard);
+ }
++#elif LV_USE_LINUX_DRM
++static void lv_linux_disp_init(void)
++{
++    const char *videocard =3D lv_linux_get_video_card_node("/dev/dri/ca=
rd0");
++    lv_display_t * disp =3D lv_linux_drm_create();
++
++    lv_linux_drm_set_file(disp, videocard, -1);
++}
+ #else
+ #error Unsupported configuration
+ #endif
+--=20
+2.43.0
+
diff --git a/meta-oe/recipes-graphics/lvgl/files/0006-Add-SDL2-example-su=
pport.patch b/meta-oe/recipes-graphics/lvgl/files/0006-Add-SDL2-example-s=
upport.patch
new file mode 100644
index 000000000..691ee80b5
--- /dev/null
+++ b/meta-oe/recipes-graphics/lvgl/files/0006-Add-SDL2-example-support.p=
atch
@@ -0,0 +1,69 @@
+From b202ce51f7b68c460fcd1b6d9c3ffa8aaf2baaf6 Mon Sep 17 00:00:00 2001
+From: Marek Vasut <marex@denx.de>
+Date: Tue, 12 Mar 2024 19:05:38 +0100
+Subject: [PATCH 6/6] Add SDL2 example support
+
+Extend the main.c to support both legacy fbdev, DRM/KMS, SDL2 initializa=
tion.
+The SDL2 window resolution can be configured using environment variables
+LV_VIDEO_WIDTH and LV_VIDEO_HEIGHT and defaults to 800 x 480 .
+
+To use legacy fbdev support, adjust lv_conf.h as follows:
+LV_USE_LINUX_FBDEV=3D1
+LV_USE_LINUX_DRM=3D0
+LV_USE_SDL=3D0
+
+To use DRM/KMS support, adjust lv_conf.h as follows:
+LV_USE_LINUX_FBDEV=3D0
+LV_USE_LINUX_DRM=3D1
+LV_USE_SDL=3D0
+
+To use SDL2 support, adjust lv_conf.h as follows:
+LV_USE_LINUX_FBDEV=3D0
+LV_USE_LINUX_DRM=3D0
+LV_USE_SDL=3D1
+
+Upstream-Status: Submitted [https://github.com/lvgl/lv_port_linux_frame_=
buffer/pull/47]
+Signed-off-by: Marek Vasut <marex@denx.de>
+---
+ CMakeLists.txt | 6 +++++-
+ main.c         | 8 ++++++++
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index c1cfb7f..658193f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -15,6 +15,10 @@ add_executable(main main.c mouse_cursor_icon.c)
+ include(${CMAKE_CURRENT_LIST_DIR}/lvgl/tests/FindLibDRM.cmake)
+ include_directories(${Libdrm_INCLUDE_DIRS})
+=20
+-target_link_libraries(main lvgl lvgl::examples lvgl::demos lvgl::thorvg=
 ${SDL2_LIBRARIES} ${Libdrm_LIBRARIES} m pthread)
++find_package(SDL2)
++find_package(SDL2_image)
++include_directories(${SDL2_INCLUDE_DIRS} ${SDL2_IMAGE_INCLUDE_DIRS})
++
++target_link_libraries(main lvgl lvgl::examples lvgl::demos lvgl::thorvg=
 ${SDL2_LIBRARIES} ${SDL2_IMAGE_LIBRARIES} ${Libdrm_LIBRARIES} m pthread)
+ add_custom_target (run COMMAND ${EXECUTABLE_OUTPUT_PATH}/main DEPENDS m=
ain)
+=20
+diff --git a/main.c b/main.c
+index ab4e936..4b66ebc 100644
+--- a/main.c
++++ b/main.c
+@@ -25,6 +25,14 @@ static void lv_linux_disp_init(void)
+=20
+     lv_linux_drm_set_file(disp, videocard, -1);
+ }
++#elif LV_USE_SDL
++static void lv_linux_disp_init(void)
++{
++    const int width =3D atoi(getenv("LV_VIDEO_WIDTH") ? : "800");
++    const int height =3D atoi(getenv("LV_VIDEO_HEIGHT") ? : "480");
++
++    lv_sdl_window_create(width, height);
++}
+ #else
+ #error Unsupported configuration
+ #endif
+--=20
+2.43.0
+
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb b/meta-o=
e/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb
index ee3d5ab20..70df822cc 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb
@@ -7,6 +7,12 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D802d3d83ae80e=
f5f343050bf96cce3a4 \
 SRC_URI =3D "\
 	git://github.com/lvgl/lv_port_linux_frame_buffer.git;protocol=3Dhttps;b=
ranch=3Dmaster;name=3Ddemo \
 	git://github.com/lvgl/lvgl;protocol=3Dhttps;branch=3Dmaster;name=3Dlvgl=
;subdir=3Dgit/lvgl \
+	file://0001-fix-drm-Default-to-XRGB8888-framebuffer.patch;patchdir=3Dlv=
gl \
+	file://0002-fix-sdl-handle-both-LV_IMAGE_SRC_FILE-and-LV_IMAGE_S.patch;=
patchdir=3Dlvgl \
+	file://0003-Make-fbdev-device-node-runtime-configurable-via-envi.patch =
\
+	file://0004-Factor-out-fbdev-initialization-code.patch \
+	file://0005-Add-DRM-KMS-example-support.patch \
+	file://0006-Add-SDL2-example-support.patch \
 	"
 SRCREV_demo =3D "dccc6a1ca48372aa993dbea7a8e17dec6f42df6a"
 SRCREV_lvgl =3D "e29d35b43c509b6d7189f5dac87139441669ae66"
@@ -26,23 +32,9 @@ S =3D "${WORKDIR}/git"
 TARGET_CFLAGS +=3D "-I${STAGING_INCDIR}/libdrm"
=20
 do_configure:prepend() {
-	# Fix ARGB8888 base plane format misuse again
-	sed -i 's@ARGB8888@XRGB8888@g' "${S}/lvgl/src/drivers/display/drm/lv_li=
nux_drm.c"
-
-	if [ "${LVGL_CONFIG_USE_DRM}" -eq 1 ] ; then
-		# Add libdrm build dependency
-		sed -i '/^target_link_libraries/ s@pthread@& drm@' "${S}/CMakeLists.tx=
t"
-		# Switch from fbdev to drm usage
-		sed -i "s@lv_linux_fbdev_set_file.*@lv_linux_drm_set_file(disp, \"${LV=
GL_CONFIG_DRM_CARD}\", -1);@g" "${S}/main.c"
-		sed -i 's@fbdev@drm@g' "${S}/main.c"
-	fi
-
 	if [ "${LVGL_CONFIG_USE_SDL}" -eq 1 ] ; then
-		# Add libsdl build dependency
-		sed -i '/^target_link_libraries/ s@pthread@& SDL2 SDL2_image@' "${S}/C=
MakeLists.txt"
-		# Switch from fbdev to sdl usage
-		sed -i 's@lv_linux_fbdev_create()@lv_sdl_window_create(atoi(getenv("LV=
_VIDEO_WIDTH") ? : "800"), atoi(getenv("LV_VIDEO_HEIGHT") ? : "480"))@g' =
"${S}/main.c"
-		sed -i '/lv_linux_fbdev_set_file/ d' "${S}/main.c"
+		# Add libsdl build dependency, SDL2_image has no cmake file
+		sed -i '/^target_link_libraries/ s@pthread@& SDL2_image@' "${S}/CMakeL=
ists.txt"
 	fi
 }
=20
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb b/meta-oe/recipe=
s-graphics/lvgl/lvgl_9.0.0.bb
index d147e8920..7f1f57a2b 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
@@ -8,7 +8,11 @@ SUMMARY =3D "Light and Versatile Graphics Library"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENCE.txt;md5=3Dbf1198c89ae87f043108cea62=
460b03a"
=20
-SRC_URI =3D "git://github.com/lvgl/lvgl;protocol=3Dhttps;branch=3Dmaster=
"
+SRC_URI =3D "\
+	git://github.com/lvgl/lvgl;protocol=3Dhttps;branch=3Dmaster \
+	file://0001-fix-drm-Default-to-XRGB8888-framebuffer.patch \
+	file://0002-fix-sdl-handle-both-LV_IMAGE_SRC_FILE-and-LV_IMAGE_S.patch =
\
+	"
 SRCREV =3D "e29d35b43c509b6d7189f5dac87139441669ae66"
 PV .=3D "+git${SRCPV}"
=20
@@ -22,11 +26,6 @@ ALLOW_EMPTY:${PN} =3D "1"
 PACKAGECONFIG ??=3D "drm"
 require lv-conf.inc
=20
-do_configure:prepend() {
-    # Fix ARGB8888 base plane format misuse again
-    sed -i 's@ARGB8888@XRGB8888@g' "${S}/src/drivers/display/drm/lv_linu=
x_drm.c"
-}
-
 FILES:${PN}-dev +=3D "\
     ${includedir}/${PN}/ \
     ${includedir}/${PN}/lvgl/ \
--=20
2.43.0


