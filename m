Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qjyuc-0006T9-Af
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jul 2011 21:27:58 +0200
Received: by mail-fx0-f51.google.com with SMTP id 10so4073274fxh.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2011 12:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=D/EV3A6Z4faN0AIrn5VxePlkN3OLXw1r+E67IyKTbjM=;
	b=xVw7rh52etuIQk2aLNW02iEuy5FYBD+mxXtY/PlOj5o2tt2vZ24HoCr51ws3xpmNRa
	tFwBggN2Y6ZCaE1171m3J6Mo6tAbDdOxcKmjm+mEDv94aT3riF7WNWNnvx3R7QnNFR2K
	HfPFoFLcCNiDuPlWRLdHU3TncVRyONnrthNr4=
Received: by 10.223.94.78 with SMTP id y14mr780350fam.24.1311276232871;
	Thu, 21 Jul 2011 12:23:52 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 12sm1085431fad.40.2011.07.21.12.23.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jul 2011 12:23:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Jul 2011 21:23:17 +0200
Message-Id: <d0b66b5a1cc23e5054528c46fa640f1dc69cd346.1311276122.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <6d30a1f529038189a2f6e228066050d6b203baac.1311276122.git.Martin.Jansa@gmail.com>
References: <6d30a1f529038189a2f6e228066050d6b203baac.1311276122.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1311276122.git.Martin.Jansa@gmail.com>
References: <cover.1311276122.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/4] xf86-video-glamo: bump SRCREV, remove upstream applied patch
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
X-List-Received-Date: Thu, 21 Jul 2011 19:27:58 -0000

* remove mese-dri from RDEPENDS as we're now using kernel without DRM patch and it can fallback to sw rendering just fine

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...efine-GLAMO_CMDQ_MAX_COUNT-instead-of-mag.patch |   66 --------------------
 .../xorg-driver/xf86-video-glamo_git.bb            |    5 +-
 2 files changed, 2 insertions(+), 69 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo/0001-glamo-drm-define-GLAMO_CMDQ_MAX_COUNT-instead-of-mag.patch

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo/0001-glamo-drm-define-GLAMO_CMDQ_MAX_COUNT-instead-of-mag.patch b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo/0001-glamo-drm-define-GLAMO_CMDQ_MAX_COUNT-instead-of-mag.patch
deleted file mode 100644
index 0c7350f..0000000
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo/0001-glamo-drm-define-GLAMO_CMDQ_MAX_COUNT-instead-of-mag.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From e2d0f9a3ba7f36b0b8ac8d736dd76da6e5e07f38 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Fri, 29 Oct 2010 11:19:08 +0200
-Subject: [PATCH] glamo-drm: define GLAMO_CMDQ_MAX_COUNT instead of magic constant 1024
-
-* fix check for full queue, because size != count here
-* make sure we have enough space in queue for 2 resp. 4 more commands in
-  GlamoDRMAddCommand resp. GlamoDRMAddCommandBO
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/glamo-drm.c |   16 +++++++++++-----
- 1 files changed, 11 insertions(+), 5 deletions(-)
-
-diff --git a/src/glamo-drm.c b/src/glamo-drm.c
-index aac93bb..01e8510 100644
---- a/src/glamo-drm.c
-+++ b/src/glamo-drm.c
-@@ -32,6 +32,8 @@
- 
- #include "glamo.h"
- 
-+/* How many commands can be stored before forced dispatch */
-+#define GLAMO_CMDQ_MAX_COUNT 1024
- 
- /* Submit the prepared command sequence to the kernel */
- void GlamoDRMDispatch(GlamoPtr pGlamo)
-@@ -60,7 +62,7 @@ void GlamoDRMDispatch(GlamoPtr pGlamo)
- 
- void GlamoDRMAddCommand(GlamoPtr pGlamo, uint16_t reg, uint16_t val)
- {
--	if ( pGlamo->cmdq_drm_used == pGlamo->cmdq_drm_size ) {
-+	if ( pGlamo->cmdq_drm_used >= GLAMO_CMDQ_MAX_COUNT - 2 ) {
- 		xf86DrvMsg(pGlamo->pScreen->myNum, X_INFO,
- 		           "Forced command cache flush.\n");
- 		GlamoDRMDispatch(pGlamo);
-@@ -74,7 +76,8 @@ void GlamoDRMAddCommand(GlamoPtr pGlamo, uint16_t reg, uint16_t val)
- 
- void GlamoDRMAddCommandBO(GlamoPtr pGlamo, uint16_t reg, struct glamo_bo *bo)
- {
--	if ( pGlamo->cmdq_drm_used == pGlamo->cmdq_drm_size ) {
-+	if ( pGlamo->cmdq_drm_used >= GLAMO_CMDQ_MAX_COUNT - 4 ||
-+	       pGlamo->cmdq_obj_used >= GLAMO_CMDQ_MAX_COUNT) {
- 		xf86DrvMsg(pGlamo->pScreen->myNum, X_INFO,
- 		           "Forced command cache flush.\n");
- 		GlamoDRMDispatch(pGlamo);
-@@ -98,10 +101,13 @@ void GlamoDRMAddCommandBO(GlamoPtr pGlamo, uint16_t reg, struct glamo_bo *bo)
- 
- void GlamoDRMInit(GlamoPtr pGlamo)
- {
--	pGlamo->cmdq_objs = malloc(1024);
--	pGlamo->cmdq_obj_pos = malloc(1024);
-+	pGlamo->cmdq_objs = malloc(GLAMO_CMDQ_MAX_COUNT);
-+	pGlamo->cmdq_obj_pos = malloc(GLAMO_CMDQ_MAX_COUNT);
- 	pGlamo->cmdq_obj_used = 0;
- 	pGlamo->cmdq_drm_used = 0;
--	pGlamo->cmdq_drm_size = 4 * 1024;
-+	/* we're using 2bytes per entry (uint16_t) that's why we need to allocate
-+	 * GLAMO_CMDQ_MAX_COUNT * 2 bytes
-+	 */
-+	pGlamo->cmdq_drm_size = 2 * GLAMO_CMDQ_MAX_COUNT;
- 	pGlamo->cmdq_drm = malloc(pGlamo->cmdq_drm_size);
- }
--- 
-1.7.3.2
-
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
index 82263f2..b1030d9 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
@@ -4,17 +4,16 @@ DEPENDS += "libdrm"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8cbd99fff773f92e844948f74ef0df8"
 
-RDEPENDS_${PN} = "xserver-xorg-extension-dri xserver-xorg-extension-dri2 xserver-xorg-extension-glx mesa-dri"
+RDEPENDS_${PN} = "xserver-xorg-extension-dri xserver-xorg-extension-dri2 xserver-xorg-extension-glx"
 PE = "2"
 PV = "1.0.0+gitr${SRCPV}"
 PR = "${INC_PR}.6"
 
 SRC_URI = "git://git.openmoko.org/git/xf86-video-glamo.git;protocol=git;branch=master \
-           file://0001-glamo-drm-define-GLAMO_CMDQ_MAX_COUNT-instead-of-mag.patch \
            file://0001-glamo-kms-driver-drop-unused-xf86_config.patch \
           "
 
 S = "${WORKDIR}/git"
-SRCREV = "16af3c00195adc68cbd508e3613be4b2349260b3"
+SRCREV = "cb9ed17035a79e49dde26a1e7e2bc5f10fd8144b"
 
 EXTRA_OECONF = " --enable-kms "
-- 
1.7.6



