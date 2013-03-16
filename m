Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UGuep-0006Hd-Di
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Mar 2013 18:12:39 +0100
Received: by mail-wi0-f169.google.com with SMTP id l13so1630337wie.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2013 09:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=k/Ze87wda1T3naZCg90xrZWu5L0172P95W+cLO4NPXQ=;
	b=rna52YLNMphpUBkyJhw05XdeXeKZkNu/SpCsSvgoD+aXLdCR112vOTEYwM2SeWD7Lh
	A4nQrwbhCBaRPFr+kvMbnzNcFVRGANavpPbngrsJy3Z2EaiX2M9ut6kFieQ4OWYm0npE
	qZuLzNbXHg5qi9ya8M2bfPzGaQ7YupssENpMlI3mtvT5g3WdQraE+yZOZQHqSAotOd3r
	9I7L03Y6jXredPaDINL/lGDdZahfrnj3q6lh+nPbsVD6zUUafY3iiL4IrhBeKV7rDPOf
	hPjh6qrU+W0Q+SiH4pPHhXWSVhVbbR+m9FgJ7zSnguiEqUPx6mDYVGhCmojPoXsN2HXl
	e2BQ==
X-Received: by 10.180.72.148 with SMTP id d20mr8223076wiv.31.1363452949006;
	Sat, 16 Mar 2013 09:55:49 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id dm9sm4181975wib.3.2013.03.16.09.55.47
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 16 Mar 2013 09:55:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Mar 2013 17:55:50 +0100
Message-Id: <1363452950-20010-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-oe][PATCH] xf86-video-glamo: adapt to xserver 1.14 API
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Mar 2013 17:12:49 -0000

---
 ...lamo-driver-remove-references-to-mibstore.patch | 48 ++++++++++++++++++++++
 .../xorg-driver/xf86-video-glamo_git.bb            |  3 +-
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo/0001-glamo-driver-remove-references-to-mibstore.patch

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo/0001-glamo-driver-remove-references-to-mibstore.patch b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo/0001-glamo-driver-remove-references-to-mibstore.patch
new file mode 100644
index 0000000..fab0b23
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo/0001-glamo-driver-remove-references-to-mibstore.patch
@@ -0,0 +1,48 @@
+From 040ade8bb86a771fa4e71b41d2080254830ca9f3 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 16 Mar 2013 17:44:37 +0100
+Subject: [PATCH] glamo*driver: remove references to mibstore
+
+* fix build with xserver-1.14
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/glamo-driver.c     | 2 --
+ src/glamo-kms-driver.c | 1 -
+ 2 files changed, 3 deletions(-)
+
+diff --git a/src/glamo-driver.c b/src/glamo-driver.c
+index 10b7762..22f57d7 100644
+--- a/src/glamo-driver.c
++++ b/src/glamo-driver.c
+@@ -14,7 +14,6 @@
+ #include "xf86_OSproc.h"
+ 
+ #include "mipointer.h"
+-#include "mibstore.h"
+ #include "micmap.h"
+ #include "colormapst.h"
+ #include "xf86cmap.h"
+@@ -612,7 +611,6 @@ GlamoScreenInit(SCREEN_INIT_ARGS_DECL)
+     }
+ 
+     xf86SetBlackWhitePixels(pScreen);
+-    miInitializeBackingStore(pScreen);
+     xf86SetBackingStore(pScreen);
+ 
+     /* software cursor */
+diff --git a/src/glamo-kms-driver.c b/src/glamo-kms-driver.c
+index c5c7a00..f192398 100644
+--- a/src/glamo-kms-driver.c
++++ b/src/glamo-kms-driver.c
+@@ -415,7 +415,6 @@ Bool GlamoKMSScreenInit(int scrnIndex, ScreenPtr pScreen, int argc,
+ 
+ 	GlamoKMSExaInit(pScrn);
+ 
+-	miInitializeBackingStore(pScreen);
+ 	xf86SetBackingStore(pScreen);
+ 	xf86SetSilkenMouse(pScreen);
+ 	miDCInitialize(pScreen, xf86GetPointerScreenFuncs());
+-- 
+1.8.1.5
+
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
index b56b995..f9eb3ce 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
@@ -7,12 +7,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8cbd99fff773f92e844948f74ef0df8"
 
 PE = "2"
 PV = "1.0.0+gitr${SRCPV}"
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 SRC_URI = "git://git.openmoko.org/git/xf86-video-glamo.git;protocol=git;branch=master \
            file://0001-glamo-kms-driver-drop-unused-xf86_config.patch \
            file://0001-fix-build-with-KMS-disabled.patch \
            file://0003-glamo-driver-adapt-to-xserver-0.13-video-API.patch \
+           file://0001-glamo-driver-remove-references-to-mibstore.patch \   
           "
 
 S = "${WORKDIR}/git"
-- 
1.8.1.5



