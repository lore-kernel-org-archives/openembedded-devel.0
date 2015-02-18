Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id B33E872DE2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Feb 2015 19:36:38 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id D9B213C0; Wed, 18 Feb 2015 20:27:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 9A22A79;
	Wed, 18 Feb 2015 20:27:02 +0100 (CET)
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Feb 2015 20:26:56 +0100
Message-Id: <1424287616-637-2-git-send-email-alexandre.belloni@free-electrons.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1424287616-637-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1424287616-637-1-git-send-email-alexandre.belloni@free-electrons.com>
Subject: [meta-qt5][dizzy][PATCH 2/2] qtbase: update comments
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Feb 2015 19:36:41 -0000

Comments regarding the dependencies were outdated, update them.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 recipes-qt/qt5/qtbase.inc | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 1d2efa020b3b..2d2bc07c6148 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -30,8 +30,6 @@ RDEPENDS_${PN}-tools += "perl"
 # PACKAGECONFIG is kept rather minimal for people who don't need
 # stuff like webkit (and it's easier to add options than remove)
 
-# gl or gles needs to be enabled in order to build qtdeclarative
-# http://qt.gitorious.org/qt/qtdeclarative/commit/e988998a08b1420ed10bd02d9d4b3b8ed2289df9
 PACKAGECONFIG_GL ?= "${@base_contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)}"
 PACKAGECONFIG_FB ?= "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
 PACKAGECONFIG_X11 ?= "${@base_contains('DISTRO_FEATURES', 'x11', 'xcb xvideo xsync xshape xrender xrandr xfixes xinput2 xinput xinerama xcursor gtkstyle xkb', '', d)}"
@@ -77,7 +75,6 @@ PACKAGECONFIG[jpeg] = "-system-libjpeg,-no-libjpeg,jpeg"
 PACKAGECONFIG[libpng] = "-system-libpng,-no-libpng,libpng"
 PACKAGECONFIG[zlib] = "-system-zlib,-qt-zlib,zlib"
 PACKAGECONFIG[pcre] = "-system-pcre,-qt-pcre,pcre"
-# gl or gles2 is needed in order to build qtdeclarative (qtdeclarative.do_configure fails to find quick module without)
 PACKAGECONFIG[gl] = "-opengl desktop -no-eglfs,,virtual/libgl"
 PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl"
 PACKAGECONFIG[tslib] = "-tslib,-no-tslib,tslib"
@@ -115,7 +112,7 @@ PACKAGECONFIG[directfb] = "-directfb,-no-directfb,directfb"
 PACKAGECONFIG[linuxfb] = "-linuxfb,-no-linuxfb"
 PACKAGECONFIG[mitshm] = "-mitshm,-no-mitshm,mitshm"
 PACKAGECONFIG[kms] = "-kms,-no-kms,virtual/mesa virtual/egl"
-# needed for qtdeclarative (qtdeclarative.do_configure fails to find quick module without)
+# needed for qtwebkit
 PACKAGECONFIG[icu] = "-icu,-no-icu,icu"
 PACKAGECONFIG[udev] = "-libudev,-no-libudev,udev"
 # use -openssl-linked here to ensure that RDEPENDS for libcrypto and libssl are detected
-- 
2.1.0


