Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R4Z7V-0003tf-1m
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Sep 2011 16:10:21 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so1795735fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2011 07:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=3QkeCtfIv+BpOoObrUp0nHb1OuC12pkTWJ7D501aXMU=;
	b=C8D2lUhv7yXNmtPAco8GHWQUIZ4sMZoVDIG6i1kHWlm+46VYactLVBdUkfzwa8KMpN
	FUCln5jD4KzL+R197nQ+J3XGddQcK9UVCx9chSY/C/S9omjLOdXWLrclBJcE76SoHZVo
	ENT01EebTdemokaawzKFyjgYYynVMEes2/KXI=
Received: by 10.223.5.139 with SMTP id 11mr779739fav.138.1316181441407;
	Fri, 16 Sep 2011 06:57:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o16sm10618114fag.21.2011.09.16.06.57.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Sep 2011 06:57:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Sep 2011 15:56:13 +0200
Message-Id: <90b178208e91b8226cb276ce4df257fd5b78a580.1316181283.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <6b5477acbb0bbaf15b13f6dbc2121ba0e2fe7100.1316181283.git.Martin.Jansa@gmail.com>
References: <6b5477acbb0bbaf15b13f6dbc2121ba0e2fe7100.1316181283.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1316181282.git.Martin.Jansa@gmail.com>
References: <cover.1316181282.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 08/10] xorg-driver: use .inc files from oe-core
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
X-List-Received-Date: Fri, 16 Sep 2011 14:10:21 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-driver/xf86-input-tslib_0.0.6.bb          |    4 +-
 .../xorg-driver/xf86-input-void_1.4.0.bb           |    4 +-
 .../xorg-driver/xf86-video-fbdev_0.4.2.bb          |    5 +-
 .../xorg-driver/xf86-video-geode_2.11.12.bb        |    4 +-
 .../xorg-driver/xf86-video-glamo_git.bb            |    4 +-
 .../xorg-driver/xf86-video-omapfb_git.bb           |    5 +--
 .../xorg-driver/xorg-driver-common.inc             |   40 --------------------
 .../xorg-driver/xorg-driver-input.inc              |    4 --
 .../xorg-driver/xorg-driver-video.inc              |    4 --
 9 files changed, 11 insertions(+), 63 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xorg-driver-common.inc
 delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xorg-driver-input.inc
 delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xorg-driver-video.inc

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
index d5d11ce..fa59036 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
@@ -1,4 +1,4 @@
-require xorg-driver-input.inc
+require recipes-graphics/xorg-driver/xf86-input-common.inc
 DESCRIPTION = "X.Org X server -- tslib input driver"
 DEPENDS += "tslib"
 RRECOMMENDS_${PN} += "tslib-calibrate"
@@ -8,7 +8,7 @@ RSUGGESTS_${PN} += "hal"
 LIC_FILES_CHKSUM = "file://src/tslib.c;endline=28;md5=bd62eaef222dcf5cd59e490a12bd795e \
                     file://COPYING;md5=4641deddaa80fe7ca88e944e1fd94a94"
 
-PR = "${INC_PR}.1"
+PR = "r16"
 
 SRC_URI = "http://www.pengutronix.de/software/xf86-input-tslib/download/xf86-input-tslib-${PV}.tar.bz2;name=archive \
            file://double-free-crash.patch \
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.0.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.0.bb
index 32ebbeb..71b7cbc 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.0.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.0.bb
@@ -1,6 +1,6 @@
-require xorg-driver-input.inc
+require recipes-graphics/xorg-driver/xf86-input-common.inc
 DESCRIPTION = "X.Org X server -- void input driver"
-PR = "${INC_PR}.0"
+PR = "r16"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=4be6a915bfbf111cd88706fc6a6f141b"
 
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.2.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.2.bb
index d555fbc..4c85704 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.2.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.2.bb
@@ -1,9 +1,8 @@
-require xorg-driver-video.inc
+require recipes-graphics/xorg-driver/xf86-video-common.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8cbd99fff773f92e844948f74ef0df8"
 
 DESCRIPTION = "X.Org X server -- fbdev display driver"
-PE = "1"
-PR = "${INC_PR}.1"
+PR = "r16"
 
 SRC_URI[md5sum] = "53a533d9e0c2da50962282526bace074"
 SRC_URI[sha256sum] = "93b271b4b41d7e5ca108849a583b9523e96c51813d046282285355b7001f82d5"
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.12.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.12.bb
index 595ebee..e44cf49 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.12.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.12.bb
@@ -1,8 +1,8 @@
-require xorg-driver-video.inc
+require recipes-graphics/xorg-driver/xf86-video-common.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=f8ad89d9d9a024f19d7dcc5acb044a42"
 
 DESCRIPTION = "X.org server -- Geode GX2/LX display driver"
-PR = "${INC_PR}.0"
+PR = "r16"
 
 SRC_URI[md5sum] = "a99c521db731c2f1df309057a8465e4c"
 SRC_URI[sha256sum] = "28d845d727d99bfa4d4b93c5486ec01b72eb222e0910a766089db1103b1c2d92"
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
index b1030d9..3608fb2 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
@@ -1,4 +1,4 @@
-require xorg-driver-video.inc
+require recipes-graphics/xorg-driver/xf86-video-common.inc
 DESCRIPTION = "X.Org X server -- Glamo display driver with KMS support"
 DEPENDS += "libdrm"
 
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8cbd99fff773f92e844948f74ef0df8"
 RDEPENDS_${PN} = "xserver-xorg-extension-dri xserver-xorg-extension-dri2 xserver-xorg-extension-glx"
 PE = "2"
 PV = "1.0.0+gitr${SRCPV}"
-PR = "${INC_PR}.6"
+PR = "r16"
 
 SRC_URI = "git://git.openmoko.org/git/xf86-video-glamo.git;protocol=git;branch=master \
            file://0001-glamo-kms-driver-drop-unused-xf86_config.patch \
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
index 2cc744f..e30972c 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
@@ -1,11 +1,8 @@
 require recipes-graphics/xorg-driver/xf86-driver-common.inc
 
-INC_PR ?= "r15"
-
 DESCRIPTION = "X.Org X server -- OMAP display driver"
-PE = "1"
 PV = "0.1.1+${PR}+gitr${SRCREV}"
-PR = "${INC_PR}.4"
+PR = "r16"
 
 LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://src/omapfb-driver.c;beginline=1;endline=30;md5=a44c2a37e04d1c2c5f0313afb493f833"
diff --git a/meta-oe/recipes-graphics/xorg-driver/xorg-driver-common.inc b/meta-oe/recipes-graphics/xorg-driver/xorg-driver-common.inc
deleted file mode 100644
index c0f4a15..0000000
--- a/meta-oe/recipes-graphics/xorg-driver/xorg-driver-common.inc
+++ /dev/null
@@ -1,40 +0,0 @@
-DESCRIPTION = "X driver"
-HOMEPAGE = "http://www.x.org"
-SECTION = "x11/drivers"
-LICENSE = "MIT-X"
-INC_PR = "r15"
-
-DEPENDS = "randrproto virtual/xserver-xf86 xproto"
-
-SRC_URI = "${XORG_MIRROR}/individual/driver/${BPN}-${PV}.tar.bz2"
-
-S = "${WORKDIR}/${BPN}-${PV}"
-
-FILES_${PN} += " ${libdir}/xorg/modules"
-FILES_${PN}-dbg +=  "${libdir}/xorg/modules/*/.debug"
-
-inherit autotools pkgconfig
-
-TARGET_CPPFLAGS += "-I${STAGING_DIR_HOST}/usr/include/xorg"
-
-# Another sucky behavor from Xorg configure scripts.
-# They use AC_CHECK_FILE to check for DRI headers. Yuck!
-# Of course this will blow up when cross compiling.
-
-do_configure_prepend() {
-	incdir=${layout_includedir}/xorg
-	for f in dri.h sarea.h dristruct.h exa.h damage.h xf86Module.h; do
-		path="$incdir/$f"
-		if [ -f "${STAGING_DIR_HOST}/$path" ]; then
-			p=`echo "$path" | sed 'y%*+%pp%;s%[^_[:alnum:]]%_%g'`
-			eval "export ac_cv_file_$p=yes"
-		fi
-	done
-}
-
-# FIXME: We don't want to include the libtool archives (*.la) from modules
-# directory, as they serve no useful purpose. Upstream should fix Makefile.am
-do_install_append() {
-	find ${D}${libdir}/xorg/modules -regex ".*\.la$" | xargs rm -f --
-}
-
diff --git a/meta-oe/recipes-graphics/xorg-driver/xorg-driver-input.inc b/meta-oe/recipes-graphics/xorg-driver/xorg-driver-input.inc
deleted file mode 100644
index e44dbd5..0000000
--- a/meta-oe/recipes-graphics/xorg-driver/xorg-driver-input.inc
+++ /dev/null
@@ -1,4 +0,0 @@
-include xorg-driver-common.inc
-
-DEPENDS = "randrproto inputproto xserver-xorg xproto"
-
diff --git a/meta-oe/recipes-graphics/xorg-driver/xorg-driver-video.inc b/meta-oe/recipes-graphics/xorg-driver/xorg-driver-video.inc
deleted file mode 100644
index 36b5b75..0000000
--- a/meta-oe/recipes-graphics/xorg-driver/xorg-driver-video.inc
+++ /dev/null
@@ -1,4 +0,0 @@
-include xorg-driver-common.inc
-
-DEPENDS = "randrproto renderproto videoproto xextproto fontsproto xserver-xorg xproto"
-
-- 
1.7.6.1



