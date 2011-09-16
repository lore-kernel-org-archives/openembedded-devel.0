Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R4Z7G-0003tf-Th
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Sep 2011 16:10:07 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so1795735fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2011 07:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=rcgo1+YiBPWeyytnmLKftbnT2X2nwliR5OnBSRm7mZk=;
	b=weLd1Y8W1U6nNdWCAzMaC8DDFt69tmMfZ7q9z6+r6NbQLFYF/A090O0ZlK8NSQZ4jG
	bvlIHvGaztlXaepIaWqZnIfCp2plKCEx0FppVIh8dB7T8sZP2QGvtF1nRKb2p8cztrQS
	yCLMXTU7ayjLPJEepuK4tncoTvvNJB2qb9Y84=
Received: by 10.223.31.151 with SMTP id y23mr319163fac.48.1316181433365;
	Fri, 16 Sep 2011 06:57:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l8sm3186699fai.16.2011.09.16.06.57.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Sep 2011 06:57:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Sep 2011 15:56:12 +0200
Message-Id: <0315221416911d8f1465515703dcabdf9ed831bb.1316181283.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <6b5477acbb0bbaf15b13f6dbc2121ba0e2fe7100.1316181283.git.Martin.Jansa@gmail.com>
References: <6b5477acbb0bbaf15b13f6dbc2121ba0e2fe7100.1316181283.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1316181282.git.Martin.Jansa@gmail.com>
References: <cover.1316181282.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 07/10] xorg-app: use xorg-app-common.inc from oe-core
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
X-List-Received-Date: Fri, 16 Sep 2011 14:10:07 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb |    4 ++--
 meta-oe/recipes-graphics/xorg-app/rgb_1.0.4.bb     |    4 ++--
 meta-oe/recipes-graphics/xorg-app/sessreg_1.0.6.bb |    4 ++--
 .../recipes-graphics/xorg-app/setxkbmap_1.2.0.bb   |    4 ++--
 meta-oe/recipes-graphics/xorg-app/xinput_1.5.3.bb  |    4 ++--
 .../recipes-graphics/xorg-app/xorg-app-common.inc  |   15 ---------------
 meta-oe/recipes-graphics/xorg-app/xrdb_1.0.9.bb    |    4 ++--
 meta-oe/recipes-graphics/xorg-app/xterm_266.bb     |    4 ++--
 8 files changed, 14 insertions(+), 29 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-app/xorg-app-common.inc

diff --git a/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb b/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb
index bf3ecba..d3fbd13 100644
--- a/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb
+++ b/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb
@@ -1,8 +1,8 @@
-require xorg-app-common.inc
+require recipes-graphics/xorg-app/xorg-app-common.inc
 DESCRIPTION = "Tool for manipulating ICE protocol authorization records"
 LIC_FILES_CHKSUM = "file://COPYING;md5=13f70acf3c27f5f834bbc954df775f8e"
 DEPENDS += "libice"
-PR = "${INC_PR}.0"
+PR = "r6"
 
 SRC_URI[md5sum] = "bb2e4d2611047f7c5a1a82ec956a9de4"
 SRC_URI[sha256sum] = "0ee6fd4554f0131b1ed526ee00b9cf643e7dc97eb70fb51448848ef2f349938d"
diff --git a/meta-oe/recipes-graphics/xorg-app/rgb_1.0.4.bb b/meta-oe/recipes-graphics/xorg-app/rgb_1.0.4.bb
index 59dca2a..d51e1e8 100644
--- a/meta-oe/recipes-graphics/xorg-app/rgb_1.0.4.bb
+++ b/meta-oe/recipes-graphics/xorg-app/rgb_1.0.4.bb
@@ -1,8 +1,8 @@
-require xorg-app-common.inc
+require recipes-graphics/xorg-app/xorg-app-common.inc
 DEPENDS += " xproto util-macros"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ef598adbe241bd0b0b9113831f6e249a"
 PE = "1"
-PR = "${INC_PR}.0"
+PR = "r6"
 
 SRC_URI[md5sum] = "35c6cccbf25a872bdd62bfcb1a73d951"
 SRC_URI[sha256sum] = "80887da011ad086fff88bfd16c6d9d5ac7da45ef1bc9d0c192a6f370423370f1"
diff --git a/meta-oe/recipes-graphics/xorg-app/sessreg_1.0.6.bb b/meta-oe/recipes-graphics/xorg-app/sessreg_1.0.6.bb
index c919462..05d701d 100644
--- a/meta-oe/recipes-graphics/xorg-app/sessreg_1.0.6.bb
+++ b/meta-oe/recipes-graphics/xorg-app/sessreg_1.0.6.bb
@@ -1,10 +1,10 @@
-require xorg-app-common.inc
+require recipes-graphics/xorg-app/xorg-app-common.inc
 
 DESCRIPTION = "a simple program for managing utmp/wtmp entries"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=07e6423e8815e6b372cd45da76faacd0"
 
-PR = "${INC_PR}.0"
+PR = "r6"
 
 SRC_URI[archive.md5sum] = "8c8fcda19f4cffe573d43ec9b8255f8e"
 SRC_URI[archive.sha256sum] = "73f31670842b7d969504a61f3c694bf1911f844831c390396971ae2b74de7190"
diff --git a/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb b/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb
index 592a95d..22df1f1 100644
--- a/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb
+++ b/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb
@@ -1,8 +1,8 @@
-require xorg-app-common.inc
+require recipes-graphics/xorg-app/xorg-app-common.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=5feafdbe6dfe9e2bd32325be0cfc86f8"
 DEPENDS += " libxkbfile"
 PE = "1"
-PR = "${INC_PR}.0"
+PR = "r6"
 
 SRC_URI[archive.md5sum] = "2f6df89201eb9a2cbfb905d6b82a191e"
 SRC_URI[archive.sha256sum] = "999591bf1ba8ca2a7d480b2c01702396e6c349d499fb583c0de136ec00dbae39"
diff --git a/meta-oe/recipes-graphics/xorg-app/xinput_1.5.3.bb b/meta-oe/recipes-graphics/xorg-app/xinput_1.5.3.bb
index c1acc98..3480185 100644
--- a/meta-oe/recipes-graphics/xorg-app/xinput_1.5.3.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xinput_1.5.3.bb
@@ -1,8 +1,8 @@
-require xorg-app-common.inc
+require recipes-graphics/xorg-app/xorg-app-common.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=22c34ea36136407a77702a8b784f9bd0"
 DESCRIPTION = "a utility to configure and test XInput devices"
 DEPENDS += " libxi"
-PR = "${INC_PR}.0"
+PR = "r6"
 
 SRC_URI[md5sum] = "1e2f0ad4f3fa833b65c568907f171d28"
 SRC_URI[sha256sum] = "6aade131cecddaeefc39ddce1dd5e8473f6039c2e4efbfd9fbb5ee2a75885c76"
diff --git a/meta-oe/recipes-graphics/xorg-app/xorg-app-common.inc b/meta-oe/recipes-graphics/xorg-app/xorg-app-common.inc
deleted file mode 100644
index 8358af4..0000000
--- a/meta-oe/recipes-graphics/xorg-app/xorg-app-common.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "X application"
-HOMEPAGE = "http://www.x.org/"
-SECTION = "x11/apps"
-LICENSE = "MIT-X"
-DEPENDS = "util-macros-native virtual/libx11"
-
-INC_PR = "r5"
-
-SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.bz2"
-
-S = "${WORKDIR}/${BPN}-${PV}"
-
-inherit autotools pkgconfig
-
-FILES_${PN} += "  /usr/lib/X11/${BPN} /usr/share/X11/app-defaults/"
diff --git a/meta-oe/recipes-graphics/xorg-app/xrdb_1.0.9.bb b/meta-oe/recipes-graphics/xorg-app/xrdb_1.0.9.bb
index 96d15c8..82b530e 100644
--- a/meta-oe/recipes-graphics/xorg-app/xrdb_1.0.9.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xrdb_1.0.9.bb
@@ -1,10 +1,10 @@
-require xorg-app-common.inc
+require recipes-graphics/xorg-app/xorg-app-common.inc
 DESCRIPTION = "X server resource database utility"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d1167c4f586bd41f0c62166db4384a69"
 
 DEPENDS += "libxmu"
-PR = "${INC_PR}.0"
+PR = "r6"
 
 SRC_URI[archive.md5sum] = "ed2e48cf33584455d74615ad4bbe4246"
 SRC_URI[archive.sha256sum] = "642401e12996efe3e5e5307a245e24c282b94a44c1f147e177c8484b862aeab7"
diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_266.bb b/meta-oe/recipes-graphics/xorg-app/xterm_266.bb
index d826c27..35f5403 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_266.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_266.bb
@@ -1,7 +1,7 @@
-require xorg-app-common.inc
+require recipes-graphics/xorg-app/xorg-app-common.inc
 DESCRIPTION = "xterm is the standard terminal emulator for the X Window System."
 DEPENDS = "libxaw xproto xextproto libxext libxau libxpm ncurses"
-PR = "${INC_PR}.0"
+PR = "r6"
 
 LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=33;md5=4791b08be94de2e6315ddd158659997d"
 
-- 
1.7.6.1



