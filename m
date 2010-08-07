Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OhogA-00016p-83
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Aug 2010 21:03:36 +0200
Received: by fxm12 with SMTP id 12so4629863fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Aug 2010 12:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=vIN/MhXzgnUzDi9sKsOkkGOrmXD3R7V4nSTN8cqXhm4=;
	b=fgWprCxokZ4SlulHa7h+vPDPFnzHYpU7E7oI4R40b6n7eMI1xYI6j8tBNNS1QzZQ4y
	zXEdzArdyLBscconIZl6kwqOPfLd0lm0eWB82GrunpK3OxRLTQc7XHNZpyP1Jhxe/w+W
	125N4TlLHas9G4CDRUSCSZDk4Rf/pVpzYOoNk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=qhRPndy0qKr1aWhRmhKRR56wgORdCN72XhcNklznf1g/Y2HPNBWJ5FEaJbwcy0WfUF
	czHiT8n4vtqQ3U+NDWm+rc0AO3xoP1AyO1SiWix96TgOkpuFvtHY89T/3ypXmNn8FNFS
	CrvlHcBDmRS4LtnzMClnlsqQm976MnmZ0X8Zw=
Received: by 10.223.119.198 with SMTP id a6mr14545889far.66.1281207804041;
	Sat, 07 Aug 2010 12:03:24 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b11sm1134380faq.6.2010.08.07.12.03.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 07 Aug 2010 12:03:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Aug 2010 21:04:08 +0200
Message-Id: <1281207848-15367-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.2
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] recipes: bump PR for packages depending on jpeg which changed .so name with 6b -> 8b upgrade
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
X-List-Received-Date: Sat, 07 Aug 2010 19:03:36 -0000

* distro maintainers: please consider upgrading jpeg first to bump PR just once
* this list is incomplete for sure, only recipes-versions I had built in my tmpdir, feel free to add more
---
 recipes/cups/cups_1.4.3.bb                         |    2 +-
 recipes/dillo/dillo2_2.1.1.bb                      |    2 +-
 recipes/directfb/directfb_1.4.2.bb                 |    1 +
 recipes/e17/e-wm_svn.bb                            |    2 +-
 recipes/efl1/ecore_svn.bb                          |    2 +-
 recipes/efl1/edbus_svn.bb                          |    2 +-
 recipes/efl1/edje-native_svn.bb                    |    2 +-
 recipes/efl1/edje_svn.bb                           |    2 +-
 recipes/efl1/eet_svn.bb                            |    1 +
 recipes/efl1/efreet_svn.bb                         |    2 +-
 recipes/efl1/elementary_svn.bb                     |    2 +-
 recipes/efl1/evas-native_svn.bb                    |    2 +-
 recipes/efl1/evas_svn.bb                           |    2 +-
 recipes/efl1/libeflvala_svn.bb                     |    2 +-
 recipes/gd/gd_2.0.35+2.0.36rc1.bb                  |    2 +-
 recipes/gstreamer/gst-plugins-bad_0.10.9.bb        |    2 +-
 recipes/gstreamer/gst-plugins-good_0.10.23.bb      |    2 ++
 recipes/gtk+/gtk+_2.20.1.bb                        |    2 +-
 recipes/imagemagick/imagemagick_6.4.4-1.bb         |    2 +-
 recipes/jpeg/jasper_1.900.1.bb                     |    1 +
 recipes/libmatchbox/libmatchbox_1.9.bb             |    2 +-
 recipes/libsdl/libsdl-image_1.2.10.bb              |    2 +-
 recipes/libtiff/tiff_3.9.2.bb                      |    2 +-
 recipes/matchbox-desktop/matchbox-desktop_0.9.1.bb |    2 +-
 recipes/navit/navit_svn.bb                         |    2 +-
 recipes/shr/libphone-ui-shr_git.bb                 |    2 +-
 recipes/shr/shr-e-gadgets_git.bb                   |    2 +-
 recipes/shr/shr-wizard_git.bb                      |    2 +-
 recipes/webkit/webkit-efl_git.bb                   |    2 +-
 recipes/webkit/webkit-gtk_svn.bb                   |    2 +-
 30 files changed, 31 insertions(+), 26 deletions(-)

diff --git a/recipes/cups/cups_1.4.3.bb b/recipes/cups/cups_1.4.3.bb
index c65cbb7..5cc0518 100644
--- a/recipes/cups/cups_1.4.3.bb
+++ b/recipes/cups/cups_1.4.3.bb
@@ -8,7 +8,7 @@ SRC_URI += "file://use_echo_only_in_init.patch \
 SRC_URI[archive.md5sum] = "e70b1c3f60143d7310c1d74c111a21ab"
 SRC_URI[archive.sha256sum] = "47a559b1c50192b94479ae7dab132ea0008727045d4993501cf0a6df0c64db97"
 
-PR = "r2"
+PR = "r3"
 
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/recipes/dillo/dillo2_2.1.1.bb b/recipes/dillo/dillo2_2.1.1.bb
index 45eb35b..e4d319c 100644
--- a/recipes/dillo/dillo2_2.1.1.bb
+++ b/recipes/dillo/dillo2_2.1.1.bb
@@ -8,7 +8,7 @@ RDEPENDS_${PN} = "fltk2-images"
 SRC_URI="http://www.dillo.org/download/dillo-${PV}.tar.bz2 \
          file://dillo.desktop \
          file://dillo.png"
-PR = "r4"
+PR = "r5"
 
 S = "${WORKDIR}/dillo-${PV}/"
 
diff --git a/recipes/directfb/directfb_1.4.2.bb b/recipes/directfb/directfb_1.4.2.bb
index d56bce5..5f5a214 100644
--- a/recipes/directfb/directfb_1.4.2.bb
+++ b/recipes/directfb/directfb_1.4.2.bb
@@ -1,6 +1,7 @@
 require directfb.inc
 
 RV = "1.4-0"
+PR = "r1"
 
 DEPENDS += "sysfsutils"
 
diff --git a/recipes/e17/e-wm_svn.bb b/recipes/e17/e-wm_svn.bb
index 97724a0..e87cd64 100644
--- a/recipes/e17/e-wm_svn.bb
+++ b/recipes/e17/e-wm_svn.bb
@@ -3,7 +3,7 @@ DEPENDS = "eet evas ecore edje efreet edbus"
 LICENSE = "MIT BSD"
 SRCNAME = "e"
 PV = "0.16.999.060+svnr${SRCPV}"
-PR = "r13"
+PR = "r14"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e update-alternatives
diff --git a/recipes/efl1/ecore_svn.bb b/recipes/efl1/ecore_svn.bb
index 928ab0d..9022b70 100644
--- a/recipes/efl1/ecore_svn.bb
+++ b/recipes/efl1/ecore_svn.bb
@@ -1,6 +1,6 @@
 require ecore.inc
 SRCREV = "${EFL_SRCREV}"
-PR = "r11"
+PR = "r12"
 
 SRC_URI += "\
   file://iconv.patch;maxrev=43996 \
diff --git a/recipes/efl1/edbus_svn.bb b/recipes/efl1/edbus_svn.bb
index 087bfe7..1ef1f16 100644
--- a/recipes/efl1/edbus_svn.bb
+++ b/recipes/efl1/edbus_svn.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "DBus and HAL convenience wrappers for EFL"
 DEPENDS = "dbus ecore"
 LICENSE = "MIT BSD"
 PV = "0.5.0.060+svnr${SRCPV}"
-PR = "r1"
+PR = "r2"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl
diff --git a/recipes/efl1/edje-native_svn.bb b/recipes/efl1/edje-native_svn.bb
index 33fe06f..420d8c1 100644
--- a/recipes/efl1/edje-native_svn.bb
+++ b/recipes/efl1/edje-native_svn.bb
@@ -1,6 +1,6 @@
 require edje_${PV}.bb
 inherit native
-PR = "r4"
+PR = "r5"
 
 DEPENDS = "lua5.1-native evas-native ecore-native eet-native embryo-native"
 
diff --git a/recipes/efl1/edje_svn.bb b/recipes/efl1/edje_svn.bb
index 1fd67cd..fd41028 100644
--- a/recipes/efl1/edje_svn.bb
+++ b/recipes/efl1/edje_svn.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Edje is the Enlightenment graphical design & layout library"
 DEPENDS = "lua5.1 eet evas ecore embryo edje-native"
 LICENSE = "MIT BSD"
 PV = "0.9.92.060+svnr${SRCPV}"
-PR = "r6"
+PR = "r7"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl
diff --git a/recipes/efl1/eet_svn.bb b/recipes/efl1/eet_svn.bb
index 73417fc..afb6db6 100644
--- a/recipes/efl1/eet_svn.bb
+++ b/recipes/efl1/eet_svn.bb
@@ -3,6 +3,7 @@ DEPENDS = "pkgconfig zlib jpeg openssl eina"
 LICENSE = "MIT BSD"
 SRCREV = "${EFL_SRCREV}"
 PV = "1.3.2+svnr${SRCPV}"
+PR = "r1"
 
 inherit efl
 
diff --git a/recipes/efl1/efreet_svn.bb b/recipes/efl1/efreet_svn.bb
index 555016d..d988f52 100644
--- a/recipes/efl1/efreet_svn.bb
+++ b/recipes/efl1/efreet_svn.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "The Enlightenment freedesktop.org library"
 DEPENDS = "ecore"
 LICENSE = "MIT BSD"
 PV = "0.5.0.060+svnr${SRCPV}"
-PR = "r3"
+PR = "r4"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl
diff --git a/recipes/efl1/elementary_svn.bb b/recipes/efl1/elementary_svn.bb
index 82302b9..29e8919 100644
--- a/recipes/efl1/elementary_svn.bb
+++ b/recipes/efl1/elementary_svn.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "EFL based widget set for mobile devices"
 LICENSE = "LGPL"
 DEPENDS = "eet-native efreet evas ecore edje eet edbus"
 PV = "0.7.0+svnr${SRCPV}"
-PR = "r10"
+PR = "r11"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl
diff --git a/recipes/efl1/evas-native_svn.bb b/recipes/efl1/evas-native_svn.bb
index 5a599ec..c587c12 100644
--- a/recipes/efl1/evas-native_svn.bb
+++ b/recipes/efl1/evas-native_svn.bb
@@ -2,7 +2,7 @@ require evas.inc
 inherit native
 DEPENDS = "freetype-native libxext-native libpng-native jpeg-native eet-native eina-native libfribidi-native"
 PACKAGES_DYNAMIC = ""
-PR = "r3"
+PR = "r4"
 
 EXTRA_OECONF = "\
 		--x-includes=${STAGING_INCDIR}/X11  \
diff --git a/recipes/efl1/evas_svn.bb b/recipes/efl1/evas_svn.bb
index c50ecb8..805e64b 100644
--- a/recipes/efl1/evas_svn.bb
+++ b/recipes/efl1/evas_svn.bb
@@ -1,5 +1,5 @@
 require evas.inc
-PR = "r7"
+PR = "r8"
 
 EVAS_CPU_TWEAKS = ""
 # Disabled for now, see http://thread.gmane.org/gmane.comp.window-managers.enlightenment.devel/25194
diff --git a/recipes/efl1/libeflvala_svn.bb b/recipes/efl1/libeflvala_svn.bb
index 5abb265..22159e6 100644
--- a/recipes/efl1/libeflvala_svn.bb
+++ b/recipes/efl1/libeflvala_svn.bb
@@ -4,7 +4,7 @@ LICENSE = "LGPL"
 SECTION = "devel"
 DEPENDS = "vala-native glib-2.0 dbus dbus-glib eina eet evas ecore edje elementary"
 PV = "0.5.0+svnr${SRCPV}"
-PR = "r0"
+PR = "r1"
 PE = "1"
 SRCREV = "${EFL_SRCREV}"
 
diff --git a/recipes/gd/gd_2.0.35+2.0.36rc1.bb b/recipes/gd/gd_2.0.35+2.0.36rc1.bb
index d1ea7f6..1aa753e 100644
--- a/recipes/gd/gd_2.0.35+2.0.36rc1.bb
+++ b/recipes/gd/gd_2.0.35+2.0.36rc1.bb
@@ -2,7 +2,7 @@ SECTION = "libs"
 LICENSE = "GD"
 DESCRIPTION = "gd is a library used to create PNG, JPEG, or WBMP images."
 DEPENDS = "freetype libpng jpeg zlib"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://www.libgd.org/releases/gd-2.0.36RC1.tar.gz;name=src"
 SRC_URI[src.md5sum] = "39ac48e6d5e0012a3bd2248a0102f209"
diff --git a/recipes/gstreamer/gst-plugins-bad_0.10.9.bb b/recipes/gstreamer/gst-plugins-bad_0.10.9.bb
index e69002d..038fbd9 100644
--- a/recipes/gstreamer/gst-plugins-bad_0.10.9.bb
+++ b/recipes/gstreamer/gst-plugins-bad_0.10.9.bb
@@ -1,5 +1,5 @@
 require gst-plugins.inc
-PR = "r2"
+PR = "${INC_PR}.1"
 
 SRC_URI += "file://vorbisenc.h file://vorbisdec.h \
             file://gst-plugins-directfb-fix.patch;striplevel=2 \
diff --git a/recipes/gstreamer/gst-plugins-good_0.10.23.bb b/recipes/gstreamer/gst-plugins-good_0.10.23.bb
index c686994..ebd978f 100644
--- a/recipes/gstreamer/gst-plugins-good_0.10.23.bb
+++ b/recipes/gstreamer/gst-plugins-good_0.10.23.bb
@@ -1,5 +1,7 @@
 require gst-plugins.inc
 
+PR = "${INC_PR}.1"
+
 SRC_URI[archive.md5sum] = "9cddbb0e7e90677f0cc05c23feffef5c"
 SRC_URI[archive.sha256sum] = "2e7771a611cedb1e8208601cb26744fbf33109598e222afee1be8811ba4babcf"
 
diff --git a/recipes/gtk+/gtk+_2.20.1.bb b/recipes/gtk+/gtk+_2.20.1.bb
index 3013331..c8d10b3 100644
--- a/recipes/gtk+/gtk+_2.20.1.bb
+++ b/recipes/gtk+/gtk+_2.20.1.bb
@@ -9,7 +9,7 @@ SRC_URI_append = "file://gtk-dnd-grab-deadlock-fix.patch \
 SRC_URI[gtk.md5sum] = "53e6f3a93bd22934878fc4a4a34c68aa"
 SRC_URI[gtk.sha256sum] = "0e081731d21e34ff45c82199490c2889504fa8b3c7e117c043e82ababaec0f65"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 BBCLASSEXTEND = "native"
 
diff --git a/recipes/imagemagick/imagemagick_6.4.4-1.bb b/recipes/imagemagick/imagemagick_6.4.4-1.bb
index 5ad235c..b443406 100644
--- a/recipes/imagemagick/imagemagick_6.4.4-1.bb
+++ b/recipes/imagemagick/imagemagick_6.4.4-1.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL"
 # FIXME: There is much more checked libraries. All should be added or explicitly disabled to get consistent results.
 DEPENDS = "bzip2 jpeg libpng librsvg tiff zlib"
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "ftp://ftp.nluug.nl/pub/ImageMagick/ImageMagick-${PV}.tar.bz2 \
            file://PerlMagic_MakePatch;apply=yes \
diff --git a/recipes/jpeg/jasper_1.900.1.bb b/recipes/jpeg/jasper_1.900.1.bb
index 8d76e99..0e0bc97 100644
--- a/recipes/jpeg/jasper_1.900.1.bb
+++ b/recipes/jpeg/jasper_1.900.1.bb
@@ -1,5 +1,6 @@
 DESCRIPTION = "Jpeg 2000 implementation"
 LICENSE = "MIT"
+PR = "r1"
 do_unpack[depends] += "unzip-native:do_populate_sysroot"
 
 SRC_URI = "http://www.ece.uvic.ca/~mdadams/jasper/software/jasper-${PV}.zip"
diff --git a/recipes/libmatchbox/libmatchbox_1.9.bb b/recipes/libmatchbox/libmatchbox_1.9.bb
index b49aabc..7a4e055 100644
--- a/recipes/libmatchbox/libmatchbox_1.9.bb
+++ b/recipes/libmatchbox/libmatchbox_1.9.bb
@@ -1,5 +1,5 @@
 require libmatchbox.inc
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "\
   http://projects.o-hand.com/matchbox/sources/${PN}/${PV}/${PN}-${PV}.tar.gz \
diff --git a/recipes/libsdl/libsdl-image_1.2.10.bb b/recipes/libsdl/libsdl-image_1.2.10.bb
index b9ffa32..98a4e83 100644
--- a/recipes/libsdl/libsdl-image_1.2.10.bb
+++ b/recipes/libsdl/libsdl-image_1.2.10.bb
@@ -1,6 +1,6 @@
 require libsdl-image.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 DEPENDS += "tiff"
 
diff --git a/recipes/libtiff/tiff_3.9.2.bb b/recipes/libtiff/tiff_3.9.2.bb
index d6a7765..dd2d80e 100644
--- a/recipes/libtiff/tiff_3.9.2.bb
+++ b/recipes/libtiff/tiff_3.9.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.remotesensing.org/libtiff/"
 DEPENDS = "zlib jpeg lzo"
 PV = "3.9.2+4.0.0beta5"
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-4.0.0beta5.tar.gz;name=tiff400beta5targz"
 SRC_URI[tiff400beta5targz.md5sum] = "a0a83604e38a299fae9f0b1a39c04870"
diff --git a/recipes/matchbox-desktop/matchbox-desktop_0.9.1.bb b/recipes/matchbox-desktop/matchbox-desktop_0.9.1.bb
index 2e813a5..99b43da 100644
--- a/recipes/matchbox-desktop/matchbox-desktop_0.9.1.bb
+++ b/recipes/matchbox-desktop/matchbox-desktop_0.9.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Matchbox Window Manager Desktop"
 LICENSE = "GPL"
 DEPENDS = "libmatchbox startup-notification"
 SECTION = "x11/wm"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://projects.o-hand.com/matchbox/sources/matchbox-desktop/0.9/matchbox-desktop-${PV}.tar.bz2 \
            file://pkgconfig_fix.patch \
diff --git a/recipes/navit/navit_svn.bb b/recipes/navit/navit_svn.bb
index 1d01a8c..abcbaf7 100644
--- a/recipes/navit/navit_svn.bb
+++ b/recipes/navit/navit_svn.bb
@@ -2,7 +2,7 @@ require navit.inc
 
 SRCREV = "3358"
 PV = "0.1.99+svnr${SRCPV}"
-PR = "${INC_PR}.8"
+PR = "${INC_PR}.9"
 
 S = "${WORKDIR}/navit"
 SRC_URI += "svn://anonymous@navit.svn.sourceforge.net/svnroot/navit/trunk;module=navit;proto=https "
diff --git a/recipes/shr/libphone-ui-shr_git.bb b/recipes/shr/libphone-ui-shr_git.bb
index 1f4a104..098eeb7 100644
--- a/recipes/shr/libphone-ui-shr_git.bb
+++ b/recipes/shr/libphone-ui-shr_git.bb
@@ -3,7 +3,7 @@ SECTION = "e/apps"
 DEPENDS += " dbus-glib libframeworkd-glib libfsoframework libphone-ui evas ecore edje edje-native elementary"
 SRCREV = "01c15bc1e68ba416dbdc8d85d0df3ecf4cd74608"
 PV = "0.0.0+gitr${SRCPV}"
-PR = "r8"
+PR = "r9"
 
 SRC_URI = "git://shr.bearstech.com/repo/libphone-ui-shr.git;protocol=http;branch=master"
 S = "${WORKDIR}/git"
diff --git a/recipes/shr/shr-e-gadgets_git.bb b/recipes/shr/shr-e-gadgets_git.bb
index a301426..21dfa75 100644
--- a/recipes/shr/shr-e-gadgets_git.bb
+++ b/recipes/shr/shr-e-gadgets_git.bb
@@ -7,7 +7,7 @@ SECTION = "x11/application"
 
 SRCREV = "4f94c139bd50935dbfb6524e8525d0c35200380b"
 PV = "0.0.0+gitr${SRCPV}"
-PR = "r4"
+PR = "r5"
 
 inherit autotools
 
diff --git a/recipes/shr/shr-wizard_git.bb b/recipes/shr/shr-wizard_git.bb
index 0ae7971..74c3f95 100644
--- a/recipes/shr/shr-wizard_git.bb
+++ b/recipes/shr/shr-wizard_git.bb
@@ -6,7 +6,7 @@ RDEPENDS_${PN} = "python-elementary shr-settings python-phoneutils e-wm python-d
 SECTION = "x11/application"
 SRCREV = "b04c841861b0f293e1a9536592fd154efc662554"
 PV = "0.0.0+gitr${SRCPV}"
-PR = "r5"
+PR = "r6"
 
 inherit autotools
 
diff --git a/recipes/webkit/webkit-efl_git.bb b/recipes/webkit/webkit-efl_git.bb
index f750061..d4139e2 100644
--- a/recipes/webkit/webkit-efl_git.bb
+++ b/recipes/webkit/webkit-efl_git.bb
@@ -6,7 +6,7 @@ DEPENDS = "icu flex gst-plugins-base gstreamer jpeg libpng libxml2 pango \
 
 SRCREV = "3a5ee77664c898ed51a2b2d5759822f8c0a06472"
 PV = "1.1.11+gitr${SRCPV}"
-PR = "r8"
+PR = "r9"
 
 SRC_URI = "git://gitorious.org/webkit-efl/webkit-efl.git;protocol=git;branch=master \
            file://fix-build-with-newer-evas.patch \
diff --git a/recipes/webkit/webkit-gtk_svn.bb b/recipes/webkit/webkit-gtk_svn.bb
index b646049..a4fae82 100644
--- a/recipes/webkit/webkit-gtk_svn.bb
+++ b/recipes/webkit/webkit-gtk_svn.bb
@@ -3,7 +3,7 @@ DEPENDS = "geoclue enchant gtk-doc-native gtk-doc gnome-keyring libsoup-2.4 curl
 
 SRCREV_FORMAT = "webcore-rwebkit"
 
-PR = "r1"
+PR = "r2"
 SRCREV = "60413"
 PV = "1.3.1+svnr${SRCPV}"
 
-- 
1.7.2



