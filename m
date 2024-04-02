Return-Path: <jaeyoon.jung@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A32CC6FD1F
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 21:30:54 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.web10.204.1712093445197462960
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Apr 2024 14:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: jaeyoon.jung@lge.com)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.51 with ESMTP; 3 Apr 2024 06:30:43 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO magneto.lge.net) (10.177.227.48)
	by 156.147.1.125 with ESMTP; 3 Apr 2024 06:30:43 +0900
X-Original-SENDERIP: 10.177.227.48
X-Original-MAILFROM: jaeyoon.jung@lge.com
From: jaeyoon.jung@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: Jaeyoon Jung <jaeyoon.jung@lge.com>
Subject: [meta-oe][PATCH] lvgl: Set resolution prior to buffer
Date: Wed,  3 Apr 2024 06:30:57 +0900
Message-ID: <20240402213057.15641-1-jaeyoon.jung@lge.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Apr 2024 21:30:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109789

From: Jaeyoon Jung <jaeyoon.jung@lge.com>

It fixes an issue where the fbdev driver fails to set up a buffer due to
buffer size mismatch. It happens when the actual screen resolution is
smaller than the default one 800x480 because the actual resolution was
being set after lv_display_set_buffers.

Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
---
 ...fbdev-set-resolution-prior-to-buffer.patch | 29 +++++++++++++++++++
 .../lvgl/lvgl-demo-fb_9.1.0.bb                |  1 +
 meta-oe/recipes-graphics/lvgl/lvgl_9.1.0.bb   |  1 +
 3 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/lvgl/files/0008-fix-fbdev-set-resolution-prior-to-buffer.patch

diff --git a/meta-oe/recipes-graphics/lvgl/files/0008-fix-fbdev-set-resolution-prior-to-buffer.patch b/meta-oe/recipes-graphics/lvgl/files/0008-fix-fbdev-set-resolution-prior-to-buffer.patch
new file mode 100644
index 000000000..449db53df
--- /dev/null
+++ b/meta-oe/recipes-graphics/lvgl/files/0008-fix-fbdev-set-resolution-prior-to-buffer.patch
@@ -0,0 +1,29 @@
+From a6f822f75b3ba01b00c028608c93160d09a6ffd1 Mon Sep 17 00:00:00 2001
+From: Jaeyoon Jung <jaeyoon.jung@lge.com>
+Date: Mon, 1 Apr 2024 18:00:39 +0900
+Subject: [PATCH] fix(fbdev): set resolution prior to buffer
+
+Otherwise it ends up with using the default value 800x480 and may fail
+at lv_display_set_buffers due to incorrect resolution.
+
+Upstream-Status: Submitted [https://github.com/lvgl/lvgl/pull/6004]
+Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
+---
+
+ src/drivers/display/fb/lv_linux_fbdev.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/drivers/display/fb/lv_linux_fbdev.c b/src/drivers/display/fb/lv_linux_fbdev.c
+index b3cc89199..5fb4c5c9f 100644
+--- a/src/drivers/display/fb/lv_linux_fbdev.c
++++ b/src/drivers/display/fb/lv_linux_fbdev.c
+@@ -233,8 +233,8 @@ void lv_linux_fbdev_set_file(lv_display_t * disp, const char * file)
+         draw_buf_2 = malloc(draw_buf_size);
+     }
+ 
+-    lv_display_set_buffers(disp, draw_buf, draw_buf_2, draw_buf_size, LV_LINUX_FBDEV_RENDER_MODE);
+     lv_display_set_resolution(disp, hor_res, ver_res);
++    lv_display_set_buffers(disp, draw_buf, draw_buf_2, draw_buf_size, LV_LINUX_FBDEV_RENDER_MODE);
+ 
+     if(width > 0) {
+         lv_display_set_dpi(disp, DIV_ROUND_UP(hor_res * 254, width * 10));
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.1.0.bb b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.1.0.bb
index 3fc3f9286..6e8371baa 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.1.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.1.0.bb
@@ -13,6 +13,7 @@ SRC_URI = "\
 	file://0005-Add-DRM-KMS-example-support.patch \
 	file://0006-Add-SDL2-example-support.patch \
 	file://0007-fix-cmake-generate-versioned-shared-libraries.patch;patchdir=lvgl \
+	file://0008-fix-fbdev-set-resolution-prior-to-buffer.patch;patchdir=lvgl \
 	"
 SRCREV_demo = "dccc6a1ca48372aa993dbea7a8e17dec6f42df6a"
 SRCREV_lvgl = "e1c0b21b2723d391b885de4b2ee5cc997eccca91"
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_9.1.0.bb b/meta-oe/recipes-graphics/lvgl/lvgl_9.1.0.bb
index 0ebd6ec42..4435c4077 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_9.1.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_9.1.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "\
 	git://github.com/lvgl/lvgl;protocol=https;branch=master \
 	file://0002-fix-sdl-handle-both-LV_IMAGE_SRC_FILE-and-LV_IMAGE_S.patch \
 	file://0007-fix-cmake-generate-versioned-shared-libraries.patch \
+	file://0008-fix-fbdev-set-resolution-prior-to-buffer.patch \
 	"
 SRCREV = "e1c0b21b2723d391b885de4b2ee5cc997eccca91"
 
-- 
2.43.0


