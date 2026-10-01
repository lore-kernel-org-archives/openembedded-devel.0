Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55AFECA5FD4
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 16:40:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15799.1790872815935713712
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2026 09:40:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=WslPL32G;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0EE521476
	for <openembedded-devel@lists.openembedded.org>; Thu,  1 Oct 2026 09:40:12 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1BFBD3F85F
	for <openembedded-devel@lists.openembedded.org>; Thu,  1 Oct 2026 09:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790872815; bh=PPhMD727yYZUU9NAkWIvTEVNg88YL7/lqWVGW7CWuoc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WslPL32G+rFpQmpbguILPy5R4wQhqs0p5E+6oglWslOIXPP/sy9SZKKzLD0CjUfSt
	 hI9AoiLaiVajuaOZ1zTt/Urk/C5UYn6C9dQDfym3VZ27dvm6Lg6ef2cUSoJWlAcT0W
	 H24b4H8fNPwk6P2T8QAydkulRzK0Y904uiq3XUo4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] ibus: merge bb/inc
Date: Thu,  1 Oct 2026 17:40:03 +0100
Message-ID: <20261001164003.2854547-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001164003.2854547-1-ross.burton@arm.com>
References: <20261001164003.2854547-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 16:40:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130599

Now that ibus-native doesn't exist, there's no need to have split .bb
and .inc files.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-gnome/recipes-support/ibus/ibus.bb       | 41 -------------------
 .../ibus/{ibus.inc =3D> ibus_1.5.34.bb}         | 41 +++++++++++++++----
 2 files changed, 32 insertions(+), 50 deletions(-)
 delete mode 100644 meta-gnome/recipes-support/ibus/ibus.bb
 rename meta-gnome/recipes-support/ibus/{ibus.inc =3D> ibus_1.5.34.bb} (6=
1%)

diff --git a/meta-gnome/recipes-support/ibus/ibus.bb b/meta-gnome/recipes=
-support/ibus/ibus.bb
deleted file mode 100644
index 99056a83d4..0000000000
--- a/meta-gnome/recipes-support/ibus/ibus.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-require ${BPN}.inc
-
-DEPENDS +=3D " \
-    glib-2.0-native \
-    glib-2.0 \
-    dbus \
-    iso-codes \
-"
-
-inherit gtk-icon-cache bash-completion features_check
-
-# for unicode-ucd
-EXTRA_OECONF +=3D "--with-ucd-dir=3D${STAGING_DATADIR}/unicode/ucd"
-
-PACKAGECONFIG ??=3D " \
-    dconf vala \
-    ${@bb.utils.contains_any('DISTRO_FEATURES', [ 'wayland', 'x11' ], 'g=
tk3 gtk4', '', d)} \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libnotify', '', d)} =
\
-"
-
-REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('PACKAGECONFIG', 'gtk=
4', 'opengl', '', d)}"
-
-do_compile:prepend() {
-    export GIR_EXTRA_LIBS_PATH=3D"${B}/src/.libs"
-}
-
-FILES:${PN} +=3D " \
-    ${datadir}/dbus-1 \
-    ${datadir}/GConf \
-    ${datadir}/glib-2.0 \
-    ${libdir}/gtk-2.0 \
-    ${libdir}/gtk-3.0 \
-    ${libdir}/gtk-4.0 \
-    ${systemd_user_unitdir} \
-"
-
-FILES:${PN}-dev +=3D " \
-    ${datadir}/gettext \
-"
-RDEPENDS:${PN} +=3D "python3-core"
diff --git a/meta-gnome/recipes-support/ibus/ibus.inc b/meta-gnome/recipe=
s-support/ibus/ibus_1.5.34.bb
similarity index 61%
rename from meta-gnome/recipes-support/ibus/ibus.inc
rename to meta-gnome/recipes-support/ibus/ibus_1.5.34.bb
index d53c5e63d5..b4d24ed702 100644
--- a/meta-gnome/recipes-support/ibus/ibus.inc
+++ b/meta-gnome/recipes-support/ibus/ibus_1.5.34.bb
@@ -3,11 +3,7 @@ HOMEPAGE =3D "https://github.com/ibus/ibus/wiki"
 LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fcd118f065f900982=
c24"
=20
-inherit autotools-brokensep pkgconfig gobject-introspection gettext gtk-=
doc vala
-
-PV =3D "1.5.34"
-
-DEPENDS =3D "unicode-ucd libx11-native"
+DEPENDS =3D "unicode-ucd libx11-native glib-2.0-native glib-2.0 dbus iso=
-codes"
=20
 SRC_URI =3D " \
     git://github.com/ibus/ibus.git;branch=3Dmain;protocol=3Dhttps;tag=3D=
${PV} \
@@ -17,6 +13,16 @@ SRC_URI =3D " \
 "
 SRCREV =3D "1f7af28437afd62a6d145bfc81035e698a37411d"
=20
+# brokensep needed as vapi fails to build correctly
+inherit autotools-brokensep gettext features_check pkgconfig
+inherit bash-completion gobject-introspection gtk-doc gtk-icon-cache val=
a
+
+PACKAGECONFIG ??=3D " \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
+    ${@bb.utils.contains_any('DISTRO_FEATURES', [ 'wayland', 'x11' ], 'g=
tk3 gtk4', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libnotify', '', d)} =
\
+    dconf vala \
+"
 PACKAGECONFIG[appindicator] =3D "--enable-appindicator,--disable-appindi=
cator,qtbase"
 PACKAGECONFIG[dconf] =3D "--enable-dconf,--disable-dconf,dconf"
 PACKAGECONFIG[gtk2] =3D "--enable-gtk2,--disable-gtk2,gtk+"
@@ -32,18 +38,35 @@ EXTRA_OECONF =3D " \
     --disable-tests \
     --disable-emoji-dict \
     --disable-python2 \
-"
-EXTRA_OECONF:append:class-target =3D "\
     --with-python=3D${bindir}/python3 \
+    --with-ucd-dir=3D${STAGING_DATADIR}/unicode/ucd \
 "
=20
 do_configure:prepend() {
-    touch ${S}/ChangeLog
-    touch ${S}/ABOUT-NLS
+    touch ${S}/ChangeLog ${S}/ABOUT-NLS
     # Remove vapigen.m4 bundled with sources so that the one shipped by =
vala is used instead.
     rm -f ${S}/m4/vapigen.m4
 }
=20
 do_compile:prepend() {
+    export GIR_EXTRA_LIBS_PATH=3D"${B}/src/.libs"
     cp ${STAGING_DATADIR_NATIVE}/X11/locale/en_US.UTF-8/Compose ${B}/src=
/Compose
 }
+
+FILES:${PN} +=3D " \
+    ${datadir}/dbus-1 \
+    ${datadir}/GConf \
+    ${datadir}/glib-2.0 \
+    ${libdir}/gtk-2.0 \
+    ${libdir}/gtk-3.0 \
+    ${libdir}/gtk-4.0 \
+    ${systemd_user_unitdir} \
+"
+
+FILES:${PN}-dev +=3D " \
+    ${datadir}/gettext \
+"
+
+RDEPENDS:${PN} +=3D "python3-core"
+
+REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('PACKAGECONFIG', 'gtk=
4', 'opengl', '', d)}"
--=20
2.43.0


