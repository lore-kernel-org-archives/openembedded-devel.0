Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id CF55E7BFD0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2019 15:16:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45tMX55b6nz23
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2019 17:16:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563895013;
	bh=A/tBkK4CyZbXsgiiPcjtMhrLmmWeF8FmXE1pcWcXtRk=;
	h=From:To:Subject:Date:From;
	b=ZFioI0XuUeLt6bS9EiP7F8ne3F+TSVIB71cNPtQ/i1C180NED2eXH66SeWEFdXv4q
	FntQ+er87rYJB4+EWP0vrEkjZGOfGVP322W87T4URaMNI/z/TK+6u7FWZ/SjtAk7oL
	HvJnhpJduywB0/irJLsDVAclfB0GDnn3CnFZBsFfc1RaYtDQuuoBZJ0fAKacJj6JTd
	WbUlaIMcSDTKvMX97Vs7bYJ+ec7JY7rtNWeCZlIPKLAgTcPXEBI4riFRl3yZb/T8ju
	tNcPM6BzZ+TvuDZcQDH/6VeoqYJRKXJhQJnVI+VZdVEAD8otB5Z/gY3CP39hJiO1X3
	tnRpn1OpQccsROBV2KPF1qgG6UeATj78mGmhWtgm+n9ufbm1vpMs6TyDt96TOKArEk
	k2+GTzdqVioo7ktB/PPfenY40YFDWwjndnxXrbi7/IARaPdKtIt0B0LPR+1SPaNupH
	cxeWk1HSajgG71hn2mDFxGhQkEXLRN9EHqJihTiMNOLLJRAPKdyA+533y0Rkdb1oHX
	evcCVTBjENWU6eqoIXR3V9yXBR0xVZf+pIxayLk0wQJ8macxx5RqLk5f2kfaaPH6wi
	NiOEHVoGXtyy/d1TpLwEHZ6hR+uy+pXm/mkfQ6jtwPWvwYMGvP85ddg/MxKJB9dDq5
	rcijwgHNVhnurkcJh7t9xxuw=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Jul 2019 18:16:49 +0300
Message-Id: <20190723151649.9238-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH v2] meta-oe: Inherit gnomebase instead of gnome
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Jul 2019 15:16:54 -0000

The gnome class pulls in usually unwanted dependencies like gconf.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-gnome/atk/atkmm_2.28.0.bb                | 2 +-
 meta-oe/recipes-gnome/vte9/vte9.inc                      | 2 +-
 meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb             | 3 ++-
 meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb | 4 ++--
 meta-oe/recipes-support/pidgin/gmime_3.2.3.bb            | 2 +-
 5 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-gnome/atk/atkmm_2.28.0.bb b/meta-oe/recipes-gnome/atk/atkmm_2.28.0.bb
index 63f4f09ba..e587e2a10 100644
--- a/meta-oe/recipes-gnome/atk/atkmm_2.28.0.bb
+++ b/meta-oe/recipes-gnome/atk/atkmm_2.28.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 
 DEPENDS = "atk glibmm"
 
-inherit distro_features_check gnome autotools pkgconfig
+inherit distro_features_check gnomebase autotools pkgconfig
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
diff --git a/meta-oe/recipes-gnome/vte9/vte9.inc b/meta-oe/recipes-gnome/vte9/vte9.inc
index 206c430da..d860d44e2 100644
--- a/meta-oe/recipes-gnome/vte9/vte9.inc
+++ b/meta-oe/recipes-gnome/vte9/vte9.inc
@@ -8,7 +8,7 @@ RDEPENDS_libvte = "vte-termcap"
 GNOMEBN = "vte"
 S = "${WORKDIR}/vte-${PV}"
 
-inherit gnome gtk-doc distro_features_check upstream-version-is-even gobject-introspection
+inherit gnomebase gtk-doc distro_features_check upstream-version-is-even gobject-introspection
 ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
 
 EXTRA_OECONF = "--disable-python"
diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb b/meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb
index 943986e77..1d64910fd 100644
--- a/meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb
+++ b/meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb
@@ -8,6 +8,7 @@ DEPENDS = " \
     gdk-pixbuf-native \
     intltool-native \
     libxslt-native \
+    dbus-glib \
     gtk+ \
     babl \
     gegl \
@@ -24,7 +25,7 @@ DEPENDS = " \
 "
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxmu libxpm', '', d)}"
 
-inherit distro_features_check gnome gtk-doc
+inherit distro_features_check gnomebase gtk-icon-cache gtk-doc
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
diff --git a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb
index 6a8274405..421ea9d5c 100644
--- a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb
+++ b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb
@@ -2,9 +2,9 @@ DESCRIPTION = "PulseAudio Volume Control (pavucontrol) is a simple GTK based vol
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "intltool-native gtkmm3 libcanberra pulseaudio"
+DEPENDS = "intltool-native gtk+3-native gtkmm3 libcanberra pulseaudio"
 
-inherit gnome distro_features_check
+inherit gnomebase distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
diff --git a/meta-oe/recipes-support/pidgin/gmime_3.2.3.bb b/meta-oe/recipes-support/pidgin/gmime_3.2.3.bb
index 8c6f0b010..bce89bec8 100644
--- a/meta-oe/recipes-support/pidgin/gmime_3.2.3.bb
+++ b/meta-oe/recipes-support/pidgin/gmime_3.2.3.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Runtime libraries for parsing and creating MIME mail"
 SECTION = "libs"
 DEPENDS = "glib-2.0 zlib"
 
-inherit gnome autotools gobject-introspection
+inherit gnomebase autotools gobject-introspection
 
 SRC_URI += "file://iconv-detect.h \
             file://nodolt.patch"
-- 
2.17.1


