Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RwyPD-0007sg-KS
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Feb 2012 17:05:31 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so1518703eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2012 07:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=JxkyswRdL31cBfNvIFBIWV1rkNj6Wuvu4KBm35p41FQ=;
	b=af5NLnGRicfeXrAgWXrb9QLqiyATLtfel/oN3VbnOPHOnXWnlJhwBe4YIxH49t/7EA
	ku57qY4nU9XPwQ/AdffkuqDTCg5f6zZxrnGeDkFknGSKEzDytPuj9rq0sT847unC8u4L
	RWI6ATDP3pWl9r7CGtM3EaCFzDN3LEL0sRsgg=
Received: by 10.213.19.83 with SMTP id z19mr2819185eba.33.1329148644001;
	Mon, 13 Feb 2012 07:57:24 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w60sm44092185eeb.4.2012.02.13.07.57.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Feb 2012 07:57:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Feb 2012 16:56:57 +0100
Message-Id: <24fc5603d863dbfa4b282db71acb91ae190b8c4e.1329148318.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <2d1d85b8c16b655a71085d45c54bf7df8f84bbee.1329148318.git.Martin.Jansa@gmail.com>
References: <2d1d85b8c16b655a71085d45c54bf7df8f84bbee.1329148318.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1329148318.git.Martin.Jansa@gmail.com>
References: <cover.1329148318.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][meta-gnome][PATCH 3/4] recipes: bump PR to rebuild .la files without libz.la
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
X-List-Received-Date: Mon, 13 Feb 2012 16:05:31 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-devtools/python/python-ecore_svn.bb    |    2 +-
 .../recipes-devtools/python/python-edje_svn.bb     |    2 +-
 .../python/python-elementary_svn.bb                |    2 +-
 .../recipes-devtools/python/python-evas_svn.bb     |    2 +-
 meta-efl/recipes-efl/e17/elfe_svn.bb               |    2 +-
 meta-efl/recipes-efl/e17/screenshot_svn.bb         |    2 +-
 meta-efl/recipes-efl/efl/ecore_svn.bb              |    2 +-
 meta-efl/recipes-efl/efl/edbus_svn.bb              |    2 +-
 meta-efl/recipes-efl/efl/edje_svn.bb               |    2 +-
 meta-efl/recipes-efl/efl/eet_svn.bb                |    2 +-
 meta-efl/recipes-efl/efl/eeze_svn.bb               |    2 +-
 meta-efl/recipes-efl/efl/efreet_svn.bb             |    2 +-
 meta-efl/recipes-efl/efl/elementary_svn.bb         |    1 +
 meta-efl/recipes-efl/efl/emotion_svn.bb            |    1 +
 meta-efl/recipes-efl/efl/epdf_svn.bb               |    2 +-
 meta-efl/recipes-efl/efl/ethumb_svn.bb             |    2 +-
 meta-efl/recipes-efl/efl/evas_svn.bb               |    2 +-
 meta-efl/recipes-efl/efl/imlib2_svn.bb             |    2 +-
 meta-efl/recipes-efl/efl/libeflvala_svn.bb         |    2 +-
 .../lightmediascanner/lightmediascanner_0.4.4.bb   |    2 ++
 .../recipes-support/libsoup/libsoup-2.4_2.37.2.bb  |    2 ++
 meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb  |    2 +-
 .../gnome-desktop/gnome-desktop_2.32.1.bb          |    2 +-
 .../gobject-introspection_git.bb                   |    1 +
 meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.2.bb       |    2 ++
 meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb  |    2 +-
 meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb  |    1 +
 meta-gnome/recipes-gnome/wv/wv_1.2.0.bb            |    2 +-
 .../libgpewidget/libgpewidget_0.117.bb             |    2 +-
 meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb     |    2 ++
 meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb  |    2 ++
 .../mml-widget/gtkmathview_0.8.0.bb                |    2 ++
 meta-oe/recipes-gnome/gtk+/gtkmm_2.20.0.bb         |    2 +-
 meta-oe/recipes-graphics/cairo/cairomm_1.10.0.bb   |    2 ++
 meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb |    2 ++
 meta-oe/recipes-graphics/pango/pango_1.29.4.bb     |    2 +-
 meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb   |    2 ++
 .../recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb  |    2 +-
 meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb  |    2 ++
 .../libsdl-image/libsdl-image_1.2.10.bb            |    2 +-
 .../recipes-support/farsight/farsight2_0.0.22.bb   |    2 ++
 meta-oe/recipes-support/farsight/libnice_0.0.13.bb |    2 ++
 meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb  |    2 +-
 .../imagemagick/imagemagick_6.4.4.bb               |    2 +-
 .../recipes-support/mysql/mysql5-native_5.1.40.bb  |    2 +-
 meta-oe/recipes-support/mysql/mysql5_5.1.40.inc    |    2 +-
 meta-oe/recipes-support/pidgin/pidgin_2.7.9.bb     |    2 +-
 meta-oe/recipes-support/poppler/poppler_0.18.0.bb  |    2 ++
 48 files changed, 61 insertions(+), 31 deletions(-)

diff --git a/meta-efl/recipes-devtools/python/python-ecore_svn.bb b/meta-efl/recipes-devtools/python/python-ecore_svn.bb
index 1300e24..2edf864 100644
--- a/meta-efl/recipes-devtools/python/python-ecore_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-ecore_svn.bb
@@ -1,7 +1,7 @@
 require python-efl.inc
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 SRCREV = "${EFL_SRCREV}"
 DEPENDS += "python-evas ecore"
 RDEPENDS_${PN} += "python-evas"
diff --git a/meta-efl/recipes-devtools/python/python-edje_svn.bb b/meta-efl/recipes-devtools/python/python-edje_svn.bb
index ee974d4..1607d87 100644
--- a/meta-efl/recipes-devtools/python/python-edje_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-edje_svn.bb
@@ -1,7 +1,7 @@
 require python-efl.inc
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 SRCREV = "${EFL_SRCREV}"
 DEPENDS += "edje python-evas"
 RDEPENDS_${PN} += "python-evas"
diff --git a/meta-efl/recipes-devtools/python/python-elementary_svn.bb b/meta-efl/recipes-devtools/python/python-elementary_svn.bb
index 6d8b0b8..102ca07 100644
--- a/meta-efl/recipes-devtools/python/python-elementary_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-elementary_svn.bb
@@ -1,7 +1,7 @@
 require python-efl.inc
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 SRCREV = "${EFL_SRCREV}"
 DEPENDS += "elementary python-evas"
 RDEPENDS_${PN} += "python-evas python-ecore python-edje" 
diff --git a/meta-efl/recipes-devtools/python/python-evas_svn.bb b/meta-efl/recipes-devtools/python/python-evas_svn.bb
index aa4d52f..8d719ce 100644
--- a/meta-efl/recipes-devtools/python/python-evas_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-evas_svn.bb
@@ -1,6 +1,6 @@
 require python-efl.inc
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 SRCREV = "${EFL_SRCREV}"
 DEPENDS += "evas"
diff --git a/meta-efl/recipes-efl/e17/elfe_svn.bb b/meta-efl/recipes-efl/e17/elfe_svn.bb
index f6d6fdb..5a482e4 100644
--- a/meta-efl/recipes-efl/e17/elfe_svn.bb
+++ b/meta-efl/recipes-efl/e17/elfe_svn.bb
@@ -1,7 +1,7 @@
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
 PV = "0.0.1+svnr${SRCPV}"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 require e-module.inc
 
diff --git a/meta-efl/recipes-efl/e17/screenshot_svn.bb b/meta-efl/recipes-efl/e17/screenshot_svn.bb
index 465ffcf..0d096fe 100644
--- a/meta-efl/recipes-efl/e17/screenshot_svn.bb
+++ b/meta-efl/recipes-efl/e17/screenshot_svn.bb
@@ -1,6 +1,6 @@
 LICENSE = "MIT"
 PV = "0.3.0+svnr${SRCREV}"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
 SRC_URI += "file://screenshot-fix-mkinstalldirs.patch"
 
diff --git a/meta-efl/recipes-efl/efl/ecore_svn.bb b/meta-efl/recipes-efl/efl/ecore_svn.bb
index 1d3706f..078310a 100644
--- a/meta-efl/recipes-efl/efl/ecore_svn.bb
+++ b/meta-efl/recipes-efl/efl/ecore_svn.bb
@@ -2,7 +2,7 @@ require ecore.inc
 
 SRCREV = "${EFL_SRCREV}"
 PV = "1.1.0+svnr${SRCPV}"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "\
diff --git a/meta-efl/recipes-efl/efl/edbus_svn.bb b/meta-efl/recipes-efl/efl/edbus_svn.bb
index be1c6cc..b5469ed 100644
--- a/meta-efl/recipes-efl/efl/edbus_svn.bb
+++ b/meta-efl/recipes-efl/efl/edbus_svn.bb
@@ -2,7 +2,7 @@ require edbus.inc
 
 SRCREV = "${EFL_SRCREV}"
 PV = "1.1.0+svnr${SRCPV}"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "\
diff --git a/meta-efl/recipes-efl/efl/edje_svn.bb b/meta-efl/recipes-efl/efl/edje_svn.bb
index 1fedfbc..7cd2f10 100644
--- a/meta-efl/recipes-efl/efl/edje_svn.bb
+++ b/meta-efl/recipes-efl/efl/edje_svn.bb
@@ -2,7 +2,7 @@ require edje.inc
 
 SRCREV = "${EFL_SRCREV}"
 PV = "1.1.0+svnr${SRCPV}"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "\
diff --git a/meta-efl/recipes-efl/efl/eet_svn.bb b/meta-efl/recipes-efl/efl/eet_svn.bb
index 42439cb..41f354d 100644
--- a/meta-efl/recipes-efl/efl/eet_svn.bb
+++ b/meta-efl/recipes-efl/efl/eet_svn.bb
@@ -2,7 +2,7 @@ require eet.inc
 
 SRCREV = "${EFL_SRCREV}"
 PV = "1.5.0+svnr${SRCPV}"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "\
diff --git a/meta-efl/recipes-efl/efl/eeze_svn.bb b/meta-efl/recipes-efl/efl/eeze_svn.bb
index 9016348..20b06d7 100644
--- a/meta-efl/recipes-efl/efl/eeze_svn.bb
+++ b/meta-efl/recipes-efl/efl/eeze_svn.bb
@@ -2,7 +2,7 @@ require eeze.inc
 
 SRCREV = "${EFL_SRCREV}"
 PV = "1.1.0+svnr${SRCPV}"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "\
diff --git a/meta-efl/recipes-efl/efl/efreet_svn.bb b/meta-efl/recipes-efl/efl/efreet_svn.bb
index a711770..ca4d117 100644
--- a/meta-efl/recipes-efl/efl/efreet_svn.bb
+++ b/meta-efl/recipes-efl/efl/efreet_svn.bb
@@ -2,7 +2,7 @@ require efreet.inc
 
 SRCREV = "${EFL_SRCREV}"
 PV = "1.1.0+svnr${SRCPV}"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "\
diff --git a/meta-efl/recipes-efl/efl/elementary_svn.bb b/meta-efl/recipes-efl/efl/elementary_svn.bb
index adca217..a0673ae 100644
--- a/meta-efl/recipes-efl/efl/elementary_svn.bb
+++ b/meta-efl/recipes-efl/efl/elementary_svn.bb
@@ -3,6 +3,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10a051c72424b80bc784a3903651b43b"
 DEPENDS = "eet-native efreet evas ecore edje eet edbus ethumb"
 PV = "0.8.0+svnr${SRCPV}"
+PR = "r1"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl gettext
diff --git a/meta-efl/recipes-efl/efl/emotion_svn.bb b/meta-efl/recipes-efl/efl/emotion_svn.bb
index dd0adf2..2588256 100644
--- a/meta-efl/recipes-efl/efl/emotion_svn.bb
+++ b/meta-efl/recipes-efl/efl/emotion_svn.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69f44058245ce5c596d56bb622d5dabd"
 # we no longer build the libxine backend, since the gstreamer backend seems more promising
 DEPENDS = "eet eeze evas ecore edje gstreamer gst-plugins-base"
 PV = "0.2.0+svnr${SRCPV}"
+PR = "r1"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl
diff --git a/meta-efl/recipes-efl/efl/epdf_svn.bb b/meta-efl/recipes-efl/efl/epdf_svn.bb
index 28da32b..102342f 100644
--- a/meta-efl/recipes-efl/efl/epdf_svn.bb
+++ b/meta-efl/recipes-efl/efl/epdf_svn.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Epdf is the glue between EFL and libpoppler"
 
 DEPENDS = "poppler evas ecore"
 PV = "0.1.0+svnr${SRCPV}"
-PR = "r5"
+PR = "r6"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl
diff --git a/meta-efl/recipes-efl/efl/ethumb_svn.bb b/meta-efl/recipes-efl/efl/ethumb_svn.bb
index e9087ce..e309de0 100644
--- a/meta-efl/recipes-efl/efl/ethumb_svn.bb
+++ b/meta-efl/recipes-efl/efl/ethumb_svn.bb
@@ -3,7 +3,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a6db9e80255adbafa16e817d9a4d8c"
 DEPENDS = "libexif eet-native evas ecore edje eet edbus emotion epdf"
 PV = "0.1.0+svnr${SRCPV}"
-PR = "r1"
+PR = "r2"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl
diff --git a/meta-efl/recipes-efl/efl/evas_svn.bb b/meta-efl/recipes-efl/efl/evas_svn.bb
index a2641b9..618f595 100644
--- a/meta-efl/recipes-efl/efl/evas_svn.bb
+++ b/meta-efl/recipes-efl/efl/evas_svn.bb
@@ -2,7 +2,7 @@ require evas.inc
 
 SRCREV = "${EFL_SRCREV}"
 PV = "1.1.0+svnr${SRCPV}"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "\
diff --git a/meta-efl/recipes-efl/efl/imlib2_svn.bb b/meta-efl/recipes-efl/efl/imlib2_svn.bb
index 58fed9e..e131bcb 100644
--- a/meta-efl/recipes-efl/efl/imlib2_svn.bb
+++ b/meta-efl/recipes-efl/efl/imlib2_svn.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
 DEPENDS = "freetype libpng jpeg virtual/libx11 libxext"
 PROVIDES = "virtual/imlib2"
 PV = "1.4.2.001+svnr${SRCPV}"
-PR = "r2"
+PR = "r3"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl
diff --git a/meta-efl/recipes-efl/efl/libeflvala_svn.bb b/meta-efl/recipes-efl/efl/libeflvala_svn.bb
index c18c8c9..35dae38 100644
--- a/meta-efl/recipes-efl/efl/libeflvala_svn.bb
+++ b/meta-efl/recipes-efl/efl/libeflvala_svn.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 SECTION = "devel"
 DEPENDS = "vala-native glib-2.0 dbus dbus-glib eina eet evas ecore edje elementary"
 PV = "2011.01.13.1+svnr${SRCPV}"
-PR = "r1"
+PR = "r2"
 PE = "1"
 SRCREV = "${EFL_SRCREV}"
 SRCNAME = "vala"
diff --git a/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb b/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb
index 91ac0b3..905f39e 100644
--- a/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb
+++ b/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb
@@ -6,6 +6,8 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 DEPENDS = "sqlite3 flac virtual/libiconv"
 
+PR = "r1"
+
 SRC_URI = "http://git.profusion.mobi/cgit.cgi/lightmediascanner.git/snapshot/release_${PV}.tar.bz2 \
 "
 SRC_URI[md5sum] = "f423376a70f8f321af69b12563b176fe"
diff --git a/meta-efl/recipes-support/libsoup/libsoup-2.4_2.37.2.bb b/meta-efl/recipes-support/libsoup/libsoup-2.4_2.37.2.bb
index 5d9b2b7..4810b3a 100644
--- a/meta-efl/recipes-support/libsoup/libsoup-2.4_2.37.2.bb
+++ b/meta-efl/recipes-support/libsoup/libsoup-2.4_2.37.2.bb
@@ -5,6 +5,8 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
+PR = "r1"
+
 # unstable version
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb b/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
index 07fd989..9c7b19f 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
@@ -2,7 +2,7 @@ require abiword-2.5.inc
 DEPENDS += " librsvg loudmouth libwmf-native gtkmathview asio"
 RCONFLICTS_${PN} = "abiword-embedded"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.abisource.com/downloads/abiword/${PV}/source/abiword-${PV}.tar.gz;name=abiword \
            file://autogen-common.sh \
diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
index b60c0c7..4aad4a8 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
-PR = "r3"
+PR = "r4"
 
 inherit gnome pkgconfig
 
diff --git a/meta-gnome/recipes-gnome/gobject-introspection/gobject-introspection_git.bb b/meta-gnome/recipes-gnome/gobject-introspection/gobject-introspection_git.bb
index 8352384..f7e8907 100644
--- a/meta-gnome/recipes-gnome/gobject-introspection/gobject-introspection_git.bb
+++ b/meta-gnome/recipes-gnome/gobject-introspection/gobject-introspection_git.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING.tools;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SRCREV = "8d64bc23d2b837421ecf9c7b0e4b8d5d95ca0d21"
 PV = "1.29.0+gitr${SRCPV}"
+PR = "r1"
 DEFAULT_PREFERENCE = "-1"
 
 S = "${WORKDIR}/git"
diff --git a/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.2.bb b/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.2.bb
index 9a5f40d..0f1ec69 100644
--- a/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.2.bb
+++ b/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.2.bb
@@ -5,6 +5,8 @@ HOMEPAGE = "http://www.gtk.org"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 SECTION = "libs"
 
+PR = "r1"
+
 DEPENDS = "glib-2.0 pango atk jpeg libpng libxext libxcursor \
            gtk-doc-native docbook-utils-native libxrandr libgcrypt \
            libxdamage libxrender libxcomposite cairo gdk-pixbuf gtk+-native"
diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb
index 6119f86..bd770ae 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dc7371b50816c96e145fa0f8ade8e24d \
                     file://COPYING.LIB;md5=61464cfe342798eeced82efe9ae55f63"
 
-PR = "r1"
+PR = "r2"
 
 SECTION = "libs"
 
diff --git a/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb b/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb
index 47f6327..8709cc0 100644
--- a/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb
+++ b/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb
@@ -1,5 +1,6 @@
 require orbit2.inc
 
+PR = "r1"
 
 SRC_URI[md5sum] = "10bfb957fa4a8935a0b4afaee7d71df7"
 SRC_URI[sha256sum] = "62bfce3f678f9347a19c766944e8aef7b89bc32b25ac23eb3e4c25929ce8974c"
diff --git a/meta-gnome/recipes-gnome/wv/wv_1.2.0.bb b/meta-gnome/recipes-gnome/wv/wv_1.2.0.bb
index b20a556..58fdbfa 100644
--- a/meta-gnome/recipes-gnome/wv/wv_1.2.0.bb
+++ b/meta-gnome/recipes-gnome/wv/wv_1.2.0.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6cbca01f1c9178aca280e8ff64d85b2f"
 
 DEPENDS = "libgsf glib-2.0"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/wvware/wv-${PV}.tar.gz \
            file://pkgconfig.patch"
diff --git a/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb b/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb
index cacf28b..c4497de 100644
--- a/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb
+++ b/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
 DEPENDS = "gtk+ cairo libxinerama libxcomposite libxrender gtk-doc"
-PR = "r0"
+PR = "r1"
 
 SRC_URI += "file://pkgconfig.patch;striplevel=0"
 SRC_URI[md5sum] = "b85a839264a35d0faf9a1a38c486e189"
diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb
index af9cd61..7e77a1c 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb
@@ -1,5 +1,7 @@
 require glibmm.inc
 
+PR = "r1"
+
 SRC_URI[archive.md5sum] = "cf33d1861d09fb2952a6a1d69e0502e3"
 SRC_URI[archive.sha256sum] = "7b67178363f8494c94f8b3dd704a4c8db7ad75a253fc84a4ad229e5e179ec192"
 
diff --git a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
index 05ddc04..fed33a4 100644
--- a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
+++ b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
@@ -5,6 +5,8 @@ SECTION = "libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
+PR = "r1"
+
 DEPENDS_virtclass-native = "libpng jpeg"
 DEPENDS = "libpng jpeg expat gtk+"
 
diff --git a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
index 725b1c8..c8e611a 100644
--- a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
+++ b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
@@ -4,6 +4,8 @@ DEPENDS = "t1lib gtk+ popt libxslt libxml2"
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
 
+PR = "r1"
+
 SRC_URI = "http://helm.cs.unibo.it/mml-widget/sources/${P}.tar.gz \
            file://mathview-gcc43x.diff \
 	  "
diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm_2.20.0.bb b/meta-oe/recipes-gnome/gtk+/gtkmm_2.20.0.bb
index ee3bdaf..69fa95f 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm_2.20.0.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm_2.20.0.bb
@@ -1,6 +1,6 @@
 require gtkmm.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI[archive.md5sum] = "c0cb0ea5bc1ab511d9b2461083f0445f"
 SRC_URI[archive.sha256sum] = "c1199bbee423d6f0ef9b5e88973c5620a1e1c52f9f1298dffcfa36284a7fd91a"
diff --git a/meta-oe/recipes-graphics/cairo/cairomm_1.10.0.bb b/meta-oe/recipes-graphics/cairo/cairomm_1.10.0.bb
index dbde458..8615d76 100644
--- a/meta-oe/recipes-graphics/cairo/cairomm_1.10.0.bb
+++ b/meta-oe/recipes-graphics/cairo/cairomm_1.10.0.bb
@@ -5,6 +5,8 @@ DESCRIPTION = "C++ bindings for Cairo graphics library"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c46bda00ffbb0ba1dac22f8d087f54d9"
 
+PR = "r1"
+
 DEPENDS = "cairo libsigc++-2.0"
 
 SRC_URI = "http://cairographics.org/releases/cairomm-${PV}.tar.gz;name=archive"
diff --git a/meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb b/meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb
index 39057e7..6ae391f 100644
--- a/meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb
+++ b/meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb
@@ -1,4 +1,6 @@
 require libsexy.inc
 
+PR = "r1"
+
 SRC_URI[md5sum] = "33c079a253270ec8bfb9508e4bb30754"
 SRC_URI[sha256sum] = "8c4101a8cda5fccbba85ba1a15f46f2cf75deaa8b3c525ce5b135b9e1a8fe49e"
diff --git a/meta-oe/recipes-graphics/pango/pango_1.29.4.bb b/meta-oe/recipes-graphics/pango/pango_1.29.4.bb
index 0642bea..70f8815 100644
--- a/meta-oe/recipes-graphics/pango/pango_1.29.4.bb
+++ b/meta-oe/recipes-graphics/pango/pango_1.29.4.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 SRC_URI[archive.md5sum] = "a5ee785f4f31d6bdd8625a09ea3f8b4b"
 SRC_URI[archive.sha256sum] = "f15deecaecf1e9dcb7db0e4947d12b5bcff112586434f8d30a5afd750747ff2b"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb b/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb
index e581ded..44dcbd3 100644
--- a/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb
@@ -4,6 +4,8 @@ LICENSE = "LGPLv2.1 & GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
                     file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
 
+PR = "r1"
+
 DEPENDS = "mm-common cairomm glibmm"
 
 SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
diff --git a/meta-oe/recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb b/meta-oe/recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb
index 2b70453..e8b74f9 100644
--- a/meta-oe/recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb
+++ b/meta-oe/recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b0d5bdc98f7ebab3b6c3791d9bf40907"
 DESCRIPTION = "XFIXES Extension"
 DEPENDS += " xextproto xproto zlib"
 PE = "1"
-PR = "r10"
+PR = "r11"
 
 SRC_URI += "file://mkg3states-1.1.patch"
 SRC_URI[md5sum] = "273329a78c2e9ea189ac416c7fde94a1"
diff --git a/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb b/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
index f743755..a5cf51c 100644
--- a/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
+++ b/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
@@ -4,6 +4,8 @@ LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "files://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 DEPENDS = "zlib"
 
+PR = "r1"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/id3lib/id3lib-${PV}.tar.gz;name=archive \
            http://ftp.de.debian.org/debian/pool/main/i/id3lib3.8.3/id3lib3.8.3_3.8.3-7.2.diff.gz;name=patch \
           "
diff --git a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.10.bb b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.10.bb
index 25e2030..29234ab 100644
--- a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.10.bb
+++ b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.10.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "tiff zlib libpng jpeg virtual/libsdl"
 
diff --git a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
index 0f158ca..8b92ec3 100644
--- a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
+++ b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
@@ -5,6 +5,8 @@ SRC_URI = "http://farsight.freedesktop.org/releases/farsight2/${P}.tar.gz"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
+PR = "r1"
+
 DEPENDS = "libnice glib-2.0 libxml2 zlib dbus gstreamer gst-plugins-base"
 
 inherit autotools
diff --git a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
index 3cac198..42ab297 100644
--- a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
+++ b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9c42325015702feda4f4d2f19a55b767 \
                     file://COPYING.MPL;md5=3c617710e51cdbe0fc00716f056dfb1a \
 "
 
+PR = "r1"
+
 DEPENDS = "glib-2.0 gstreamer"
 
 inherit autotools
diff --git a/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb b/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb
index 7660ad9..9615371 100644
--- a/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb
+++ b/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb
@@ -3,7 +3,7 @@ LICENSE = "GD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c97638cafd3581eb87abd37332137669"
 DESCRIPTION = "gd is a library used to create PNG, JPEG, or WBMP images."
 DEPENDS = "freetype libpng jpeg zlib"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://www.libgd.org/releases/gd-2.0.36RC1.tar.gz"
 SRC_URI[md5sum] = "39ac48e6d5e0012a3bd2248a0102f209"
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.4.4.bb b/meta-oe/recipes-support/imagemagick/imagemagick_6.4.4.bb
index dd84cb2..d5f95c9 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_6.4.4.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.4.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e1ebcc1358b9f81eba64255fc5da6892"
 # FIXME: There is much more checked libraries. All should be added or explicitly disabled to get consistent results.
 DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib"
 
-PR = "r9"
+PR = "r10"
 
 PATCHSET = "1"
 SRC_URI = "ftp://ftp.nluug.nl/pub/ImageMagick/ImageMagick-${PV}-${PATCHSET}.tar.bz2 \
diff --git a/meta-oe/recipes-support/mysql/mysql5-native_5.1.40.bb b/meta-oe/recipes-support/mysql/mysql5-native_5.1.40.bb
index 8001783..13a3489 100644
--- a/meta-oe/recipes-support/mysql/mysql5-native_5.1.40.bb
+++ b/meta-oe/recipes-support/mysql/mysql5-native_5.1.40.bb
@@ -1,6 +1,6 @@
 require mysql5_${PV}.inc
 inherit native
-PR ="r2"
+PR ="r3"
 
 SRC_URI = "http://downloads.mysql.com/archives/mysql-5.1/mysql-${PV}.tar.gz \
            file://fix-abi-check-gcc45.patch"
diff --git a/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc b/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc
index 348f4e3..ae1cf00 100644
--- a/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc
+++ b/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=477ab0a4c8ca64b482b3f2a365d0fdfa"
 
 DEPENDS = "ncurses"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://downloads.mysql.com/archives/mysql-5.1/mysql-${PV}.tar.gz \
            file://configure.in.patch \
diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.7.9.bb b/meta-oe/recipes-support/pidgin/pidgin_2.7.9.bb
index d5527ea..dee1465 100644
--- a/meta-oe/recipes-support/pidgin/pidgin_2.7.9.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin_2.7.9.bb
@@ -1,5 +1,5 @@
 require pidgin.inc
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 DEPENDS += "farsight2 libidn"
 
diff --git a/meta-oe/recipes-support/poppler/poppler_0.18.0.bb b/meta-oe/recipes-support/poppler/poppler_0.18.0.bb
index 463b544..c6c4ec9 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.18.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.18.0.bb
@@ -1,5 +1,7 @@
 require poppler.inc
 
+PR = "r1"
+
 DEPENDS += "lcms"
 
 EXTRA_OECONF_append = " --disable-abiword-output "
-- 
1.7.8.4



