Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAids-0003wM-2a
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Oct 2011 15:33:12 +0200
Received: by gyg8 with SMTP id 8so3333732gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=c6Oe1D6WxVGKH8elcs0gB/L2YlbGk/G6w0ye/E3V5Dc=;
	b=q/D4uKgh9ivitUF/e5fdsNEHq2e6JZ0rOtvCZ/4a1RqbkxWKlG6E7d2eZdJAtXDC0S
	AvSPUA7M4ZFI2R52nCG+Nk77V+FbL9AZKk02P08tccbW+1XBVYPOSWEWIaKPkBdBd6rF
	25pZs/MNnI/XUHCzRu9S5d/GwaDVeiOvjNJ5A=
Received: by 10.223.4.133 with SMTP id 5mr205839far.81.1317648450829;
	Mon, 03 Oct 2011 06:27:30 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id g19sm21282504fai.8.2011.10.03.06.27.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:27:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:26:59 +0200
Message-Id: <ebe115dd156cf69f5e7fb7076816c5faa3748ce6.1317648011.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1317648011.git.Martin.Jansa@gmail.com>
References: <cover.1317648011.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCHv2 01/25] xorg-driver: use renamed .inc from oe-core
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
X-List-Received-Date: Mon, 03 Oct 2011 13:33:12 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-driver/xf86-input-tslib_0.0.6.bb          |    4 ++--
 .../xorg-driver/xf86-input-void_1.4.0.bb           |    4 ++--
 .../xorg-driver/xf86-video-fbdev_0.4.2.bb          |    4 ++--
 .../xorg-driver/xf86-video-geode_2.11.12.bb        |    4 ++--
 .../xorg-driver/xf86-video-glamo_git.bb            |    4 ++--
 .../xorg-driver/xf86-video-omapfb_git.bb           |    2 +-
 6 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
index fa59036..9ce5093 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
@@ -1,4 +1,4 @@
-require recipes-graphics/xorg-driver/xf86-input-common.inc
+require recipes-graphics/xorg-driver/xorg-driver-input.inc
 DESCRIPTION = "X.Org X server -- tslib input driver"
 DEPENDS += "tslib"
 RRECOMMENDS_${PN} += "tslib-calibrate"
@@ -8,7 +8,7 @@ RSUGGESTS_${PN} += "hal"
 LIC_FILES_CHKSUM = "file://src/tslib.c;endline=28;md5=bd62eaef222dcf5cd59e490a12bd795e \
                     file://COPYING;md5=4641deddaa80fe7ca88e944e1fd94a94"
 
-PR = "r16"
+PR = "${INC_PR}.0"
 
 SRC_URI = "http://www.pengutronix.de/software/xf86-input-tslib/download/xf86-input-tslib-${PV}.tar.bz2;name=archive \
            file://double-free-crash.patch \
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.0.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.0.bb
index 71b7cbc..a6e49a5 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.0.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.0.bb
@@ -1,6 +1,6 @@
-require recipes-graphics/xorg-driver/xf86-input-common.inc
+require recipes-graphics/xorg-driver/xorg-driver-input.inc
 DESCRIPTION = "X.Org X server -- void input driver"
-PR = "r16"
+PR = "${INC_PR}.0"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=4be6a915bfbf111cd88706fc6a6f141b"
 
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.2.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.2.bb
index 4c85704..23da386 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.2.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.2.bb
@@ -1,8 +1,8 @@
-require recipes-graphics/xorg-driver/xf86-video-common.inc
+require recipes-graphics/xorg-driver/xorg-driver-video.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8cbd99fff773f92e844948f74ef0df8"
 
 DESCRIPTION = "X.Org X server -- fbdev display driver"
-PR = "r16"
+PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "53a533d9e0c2da50962282526bace074"
 SRC_URI[sha256sum] = "93b271b4b41d7e5ca108849a583b9523e96c51813d046282285355b7001f82d5"
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.12.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.12.bb
index e44cf49..2327054 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.12.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.12.bb
@@ -1,8 +1,8 @@
-require recipes-graphics/xorg-driver/xf86-video-common.inc
+require recipes-graphics/xorg-driver/xorg-driver-video.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=f8ad89d9d9a024f19d7dcc5acb044a42"
 
 DESCRIPTION = "X.org server -- Geode GX2/LX display driver"
-PR = "r16"
+PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "a99c521db731c2f1df309057a8465e4c"
 SRC_URI[sha256sum] = "28d845d727d99bfa4d4b93c5486ec01b72eb222e0910a766089db1103b1c2d92"
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
index 3608fb2..5d752db 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
@@ -1,4 +1,4 @@
-require recipes-graphics/xorg-driver/xf86-video-common.inc
+require recipes-graphics/xorg-driver/xorg-driver-video.inc
 DESCRIPTION = "X.Org X server -- Glamo display driver with KMS support"
 DEPENDS += "libdrm"
 
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8cbd99fff773f92e844948f74ef0df8"
 RDEPENDS_${PN} = "xserver-xorg-extension-dri xserver-xorg-extension-dri2 xserver-xorg-extension-glx"
 PE = "2"
 PV = "1.0.0+gitr${SRCPV}"
-PR = "r16"
+PR = "${INC_PR}.0"
 
 SRC_URI = "git://git.openmoko.org/git/xf86-video-glamo.git;protocol=git;branch=master \
            file://0001-glamo-kms-driver-drop-unused-xf86_config.patch \
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
index e30972c..a73b5e6 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
@@ -1,4 +1,4 @@
-require recipes-graphics/xorg-driver/xf86-driver-common.inc
+require recipes-graphics/xorg-driver/xorg-driver-common.inc
 
 DESCRIPTION = "X.Org X server -- OMAP display driver"
 PV = "0.1.1+${PR}+gitr${SRCREV}"
-- 
1.7.7



