Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 037F07EF73
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 07:32:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45sYGh4vlrz4t
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 09:32:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563780748;
	bh=uK+WlY3IHjqpsXnMk4TnPjjRvHW6XS49y2qmVRTbUbQ=;
	h=From:To:Subject:Date:From;
	b=B8XISe1gqxYoyotX8rXFcl/ZDjVUEDYglXjtsJZbEbZ8dv65APSFKEw8yOEVdImbW
	/KR03zPHE4qnm+Sl+KD3AVzG2F51JtX4VnlEmTavhhaP6ie1Coykru5Q1Z6r/xhtmD
	VLFflgpDjGzW9V1fNF7FPYYTuRSAMShZt0wk7jBn8VOgwEiz5TlGH9lGGy+ki4/Q+O
	NmO48wV/urpd8TZxIrxd9LnJ45q4+Qx2SMxqAQ0VX8TL6nkFVs3bBtLYN+AJ29LH+v
	NetJE0WbVS84PH0XpRJEX3FWHouieSZh0jgdDY4cfEhDfbpp5A8KYyeMu0yxRaI79y
	EsH0NtU0Ro0IoZ0LQF3naJSLOuELDmm589F2OyzphEoAleDIBmwsjzV2q3cawziF7F
	jUiFoKnlIhlN/RqB+8UQ+iqiIcEzMtNQThRQ9xBNku9zB4VCrM/KuJsZgnUpO0BEm1
	1EmlG08Va2L4ru57nNANw1I5+3MMEg/4qdHXsgBdceBbtgFb79+T7WyVH9VNcmwNKW
	b1wu19tXKGo6VqjP2wfFWfLBnLSgQw0pidrEJHqoSve1Yf/BWLJlJaUgwnvmMWf/pY
	LKYGsaJQEt4q2hFSfPiK+znAlkbu9xO1gcoMEfZAYJA1qdIZK2LD/K3ddZN/B4JjZr
	86p4WrIPIzHfQ1/B4EMndUO4=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Jul 2019 10:32:24 +0300
Message-Id: <20190722073224.9950-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] meta-oe: Inherit gnomebase instead of gnome
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
X-List-Received-Date: Mon, 22 Jul 2019 07:32:28 -0000

The gnome class pulls in usually unwanted dependencies like gconf.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-gnome/atk/atkmm_2.28.0.bb                | 2 +-
 meta-oe/recipes-gnome/vte9/vte9.inc                      | 2 +-
 meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb             | 3 ++-
 meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb | 2 +-
 meta-oe/recipes-support/pidgin/gmime_3.2.3.bb            | 2 +-
 5 files changed, 6 insertions(+), 5 deletions(-)

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
index 6a8274405..44801c8d9 100644
--- a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb
+++ b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = "intltool-native gtkmm3 libcanberra pulseaudio"
 
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


