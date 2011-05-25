Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QPDcH-0002ov-GR
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 May 2011 14:55:13 +0200
Received: by fxm19 with SMTP id 19so6072454fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 May 2011 05:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=nNGsQH2hyx0W/w2u6/TIyNSkEi5D9qts+bEYPggL6qk=;
	b=H+0XYSw+anCb5d42KJ/jEhfew7ripK7vFbtgNVws6c19yMlDtMAQv0JERu0ezOiVyp
	Q4e69/8vqFDTG4q9/f1Z3uz+j/DHuV02ZGjq2rEesDdUPV8/ztydLxSxkG8HacGma5NB
	u+4TX9VRi1/f/RNxMofG60GNR9i2hlBwJYyCs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=GKrnO8fUvEqYlTjC+RWvOP3z71I19buC2WZSU5yJxc19duYd8UZq9eUZs1/5WMvOfV
	kQYrGcyk2xYxY9ZBLnAikfE+i0uYhD1Ti+1S0r4oU1dU6oQqlc/QZFlG34yHBBkODKgn
	CUS0Ya40NawCHThssxHAkDGZ9o99IPHncBSMw=
Received: by 10.223.33.80 with SMTP id g16mr381205fad.125.1306327815483;
	Wed, 25 May 2011 05:50:15 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id x15sm221238fah.23.2011.05.25.05.50.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 May 2011 05:50:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 May 2011 14:50:08 +0200
Message-Id: <50cd038ec0ad2b57f969f1647339ec01448720c2.1306327689.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <cover.1306327689.git.Martin.Jansa@gmail.com>
References: <cover.1306327689.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] xf86-video-glamo: fix build with gcc-4.6
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
X-List-Received-Date: Wed, 25 May 2011 12:55:13 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...-glamo-kms-driver-drop-unused-xf86_config.patch |   35 ++++++++++++++++++++
 .../xorg-driver/xf86-video-glamo_git.bb            |    3 +-
 2 files changed, 37 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo/0001-glamo-kms-driver-drop-unused-xf86_config.patch

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo/0001-glamo-kms-driver-drop-unused-xf86_config.patch b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo/0001-glamo-kms-driver-drop-unused-xf86_config.patch
new file mode 100644
index 0000000..0d63743
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo/0001-glamo-kms-driver-drop-unused-xf86_config.patch
@@ -0,0 +1,35 @@
+From 963c221aa01be2ea99d39578d91e4aa08ec3ab0a Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Mon, 23 May 2011 14:29:38 +0200
+Subject: [PATCH] glamo-kms-driver: drop unused xf86_config
+
+* gcc-4.6 doesn't like unused variables which are only set and never read
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/glamo-kms-driver.c |    2 --
+ 1 files changed, 0 insertions(+), 2 deletions(-)
+
+diff --git a/src/glamo-kms-driver.c b/src/glamo-kms-driver.c
+index ce87caa..c5c7a00 100644
+--- a/src/glamo-kms-driver.c
++++ b/src/glamo-kms-driver.c
+@@ -208,7 +208,6 @@ static const xf86CrtcConfigFuncsRec crtc_config_funcs = {
+ 
+ Bool GlamoKMSPreInit(ScrnInfoPtr pScrn, int flags)
+ {
+-	xf86CrtcConfigPtr xf86_config;
+ 	GlamoPtr pGlamo;
+ 	rgb defaultWeight = { 0, 0, 0 };
+ 	int max_width, max_height;
+@@ -254,7 +253,6 @@ Bool GlamoKMSPreInit(ScrnInfoPtr pScrn, int flags)
+ 
+ 	/* Allocate an xf86CrtcConfig */
+ 	xf86CrtcConfigInit(pScrn, &crtc_config_funcs);
+-	xf86_config = XF86_CRTC_CONFIG_PTR(pScrn);
+ 
+ 	max_width = 480;
+ 	max_height = 640;
+-- 
+1.7.5.rc3
+
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
index c9e1d56..82263f2 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
@@ -7,10 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8cbd99fff773f92e844948f74ef0df8"
 RDEPENDS_${PN} = "xserver-xorg-extension-dri xserver-xorg-extension-dri2 xserver-xorg-extension-glx mesa-dri"
 PE = "2"
 PV = "1.0.0+gitr${SRCPV}"
-PR = "${INC_PR}.5"
+PR = "${INC_PR}.6"
 
 SRC_URI = "git://git.openmoko.org/git/xf86-video-glamo.git;protocol=git;branch=master \
            file://0001-glamo-drm-define-GLAMO_CMDQ_MAX_COUNT-instead-of-mag.patch \
+           file://0001-glamo-kms-driver-drop-unused-xf86_config.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
1.7.5.rc3



