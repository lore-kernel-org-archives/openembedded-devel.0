Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1773C369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 08:10:32 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.web11.10310.1745482230650746520
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Apr 2025 01:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.51 with ESMTP; 24 Apr 2025 17:10:28 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.122.205)
	by 156.147.1.127 with ESMTP; 24 Apr 2025 17:10:28 +0900
X-Original-SENDERIP: 10.177.122.205
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-initramfs][PATCH v2] kexecboot: fix build error with gcc-15
Date: Thu, 24 Apr 2025 17:10:25 +0900
Message-Id: <20250424081025.2393088-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 08:10:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117089

From: "mark.yang" <mark.yang@lge.com>

* fix following errors:
../../git/src/fb.c: In function 'fb_new':
../../git/src/fb.c:646:17: error: too many arguments to function 'fb_destroy'; expected 0, have 1
  646 |                 fb_destroy(fb);
      |                 ^~~~~~~~~~ ~~
../../git/src/fb.c:391:6: note: declared here
  391 | void fb_destroy()
      |      ^~~~~~~~~~
../../git/src/tui.c:102:9: error: conflicting types for 'tui_init'; have 'kx_tui *(FILE *)'
  102 | kx_tui *tui_init(FILE *ts)
      |         ^~~~~~~~
In file included from ../../git/src/tui.c:40:
../../git/src/tui.h:36:9: note: previous declaration of 'tui_init' with type 'kx_tui *(void)'
   36 | kx_tui *tui_init();
...

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 .../0001-Fix-argument-errors-in-gcc-15.patch  | 90 +++++++++++++++++++
 .../recipes-bsp/kexecboot/kexecboot_git.bb    |  5 +-
 2 files changed, 94 insertions(+), 1 deletion(-)
 create mode 100644 meta-initramfs/recipes-bsp/kexecboot/files/0001-Fix-argument-errors-in-gcc-15.patch

diff --git a/meta-initramfs/recipes-bsp/kexecboot/files/0001-Fix-argument-errors-in-gcc-15.patch b/meta-initramfs/recipes-bsp/kexecboot/files/0001-Fix-argument-errors-in-gcc-15.patch
new file mode 100644
index 0000000000..3f2aac9469
--- /dev/null
+++ b/meta-initramfs/recipes-bsp/kexecboot/files/0001-Fix-argument-errors-in-gcc-15.patch
@@ -0,0 +1,90 @@
+From d18d3fb700540646f4b79f6c6788614ffff735f6 Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Thu, 24 Apr 2025 16:17:49 +0900
+Subject: [PATCH] Fix argument errors in gcc 15
+
+* fix following errors:
+../../git/src/fb.c: In function 'fb_new':
+../../git/src/fb.c:646:17: error: too many arguments to function 'fb_destroy'; expected 0, have 1
+  646 |                 fb_destroy(fb);
+      |                 ^~~~~~~~~~ ~~
+../../git/src/fb.c:391:6: note: declared here
+  391 | void fb_destroy()
+      |      ^~~~~~~~~~
+../../git/src/tui.c:102:9: error: conflicting types for 'tui_init'; have 'kx_tui *(FILE *)'
+  102 | kx_tui *tui_init(FILE *ts)
+      |         ^~~~~~~~
+In file included from ../../git/src/tui.c:40:
+../../git/src/tui.h:36:9: note: previous declaration of 'tui_init' with type 'kx_tui *(void)'
+   36 | kx_tui *tui_init();
+...
+Upstream-Status: Submitted [https://github.com/kexecboot/kexecboot/pull/30]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ src/fb.c  | 4 ++--
+ src/fb.h  | 2 +-
+ src/gui.c | 2 +-
+ src/tui.h | 2 +-
+ 4 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/fb.c b/src/fb.c
+index c68009f..6acd9f2 100644
+--- a/src/fb.c
++++ b/src/fb.c
+@@ -388,7 +388,7 @@ void fb_restore(char *dump)
+ }
+ 
+ 
+-void fb_destroy()
++void fb_destroy(FB fb)
+ {
+ 	if (fb.fd >= 0)
+ 		close(fb.fd);
+@@ -651,7 +651,7 @@ int fb_new(int angle)
+ 	return 0;
+ 
+ fail:
+-	fb_destroy();
++	fb_destroy(fb);
+ 	return -1;
+ }
+ 
+diff --git a/src/fb.h b/src/fb.h
+index 4a1e0d7..9e0af18 100644
+--- a/src/fb.h
++++ b/src/fb.h
+@@ -88,7 +88,7 @@ typedef struct {
+ } kx_picture;
+ 
+ 
+-void fb_destroy();
++void fb_destroy(FB fb);
+ 
+ int fb_new(int angle);
+ 
+diff --git a/src/gui.c b/src/gui.c
+index bf4230a..a140c9b 100644
+--- a/src/gui.c
++++ b/src/gui.c
+@@ -157,7 +157,7 @@ void gui_destroy(struct gui_t *gui)
+ 	free(gui->icons);
+ #endif
+ 
+-	fb_destroy();
++	fb_destroy(fb);
+ 	free(gui);
+ }
+ 
+diff --git a/src/tui.h b/src/tui.h
+index feed233..79faac0 100644
+--- a/src/tui.h
++++ b/src/tui.h
+@@ -33,7 +33,7 @@ typedef struct {
+ } kx_tui;
+ 
+ 
+-kx_tui *tui_init();
++kx_tui *tui_init(FILE *ts);
+ 
+ void tui_show_menu(kx_tui *tui, kx_menu *menu);
+ 
diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
index a92c0e8966..2be9076726 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
@@ -5,7 +5,10 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 PV = "0.6+git"
 S = "${WORKDIR}/git"
-SRC_URI = "git://github.com/kexecboot/kexecboot.git;branch=master;protocol=https"
+SRC_URI = " \
+    git://github.com/kexecboot/kexecboot.git;branch=master;protocol=https \
+    file://0001-Fix-argument-errors-in-gcc-15.patch \
+"
 SRC_URI:append:libc-klibc = "\
     file://0001-kexecboot-Use-new-reboot-API-with-klibc.patch \
     file://0001-make-Add-compiler-includes-in-cflags.patch \

