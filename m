Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F98CF318A
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 10:42:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3814.1763548905062390081
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 02:41:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=temperror, err=temporary DNS error (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8816AFEC
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 02:41:36 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BA2CB3F740
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 02:41:43 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] gtksourceview*: use GNOMEBN
Date: Wed, 19 Nov 2025 10:41:38 +0000
Message-ID: <20251119104138.1753098-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 10:42:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121889

The gnomebase class has a GNOMEBN variable that does this now, so use
that instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gtksourceview/gtksourceview3_3.24.11.bb          |  9 +++------
 .../gtksourceview/gtksourceview4_4.8.4.bb            | 12 +++++-------
 .../gtksourceview/gtksourceview5_5.16.0.bb           | 10 +++-------
 3 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.1=
1.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
index baf4c33d38..48c54a7483 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
@@ -6,19 +6,16 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857=
fcd118f065f900982c24"
=20
 DEPENDS =3D "gtk+3 libxml2 glib-2.0-native"
=20
-PNAME =3D "gtksourceview"
-
-S =3D "${UNPACKDIR}/${PNAME}-${PV}"
-
 GNOMEBASEBUILDCLASS =3D "autotools"
 inherit gnomebase lib_package gettext features_check gtk-doc gobject-int=
rospection upstream-version-is-even
=20
+GNOMEBN =3D "gtksourceview"
+SRC_URI[archive.sha256sum] =3D "691b074a37b2a307f7f48edc5b8c7afa7301709b=
e56378ccf9cc9735909077fd"
+
 REQUIRED_DISTRO_FEATURES =3D "x11"
=20
 EXTRA_OECONF +=3D "--disable-glade-catalog --disable-gtk-doc --disable-W=
error"
=20
 CFLAGS +=3D "-Wno-error=3Dincompatible-pointer-types"
-SRC_URI =3D "${GNOME_MIRROR}/gtksourceview/3.24/${PNAME}-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "691b074a37b2a307f7f48edc5b8c7afa7301709be56378cc=
f9cc9735909077fd"
=20
 FILES:${PN} +=3D " ${datadir}/gtksourceview-3.0"
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.=
bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
index b9ff4ef459..439332bcea 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
@@ -6,17 +6,15 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857=
fcd118f065f900982c24"
=20
 DEPENDS =3D "gtk+3 libxml2 glib-2.0-native"
=20
-PNAME =3D "gtksourceview"
-
-S =3D "${UNPACKDIR}/${PNAME}-${PV}"
-
 inherit gnomebase lib_package gettext features_check gtk-doc gobject-int=
rospection vala
=20
+GNOMEBN =3D "gtksourceview"
+
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
-SRC_URI =3D "${GNOME_MIRROR}/gtksourceview/4.8/${PNAME}-${PV}.tar.xz \
-           file://0001-remove-pointless-check.patch"
-SRC_URI[sha256sum] =3D "7ec9d18fb283d1f84a3a3eff3b7a72b09a10c9c006597b3f=
babbb5958420a87d"
+SRC_URI +=3D "file://0001-remove-pointless-check.patch"
+
+SRC_URI[archive.sha256sum] =3D "7ec9d18fb283d1f84a3a3eff3b7a72b09a10c9c0=
06597b3fbabbb5958420a87d"
=20
 GIR_MESON_OPTION =3D 'gir'
 GTKDOC_MESON_OPTION =3D "gtk_doc"
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.16.0=
.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.16.0.bb
index 7076214a4d..ba1c2e8adf 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.16.0.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.16.0.bb
@@ -14,17 +14,13 @@ DEPENDS =3D " \
     pango \
 "
=20
-PNAME =3D "gtksourceview"
-
-S =3D "${UNPACKDIR}/${PNAME}-${PV}"
-
-
 inherit gnomebase lib_package gettext features_check gi-docgen gtk-icon-=
cache gobject-introspection vala
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
-SRC_URI =3D "${GNOME_MIRROR}/gtksourceview/5.16/${PNAME}-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "ab35d420102f3e8b055dd3b8642d3a48209f888189e6254d=
0ffb4b6a7e8c3566"
+GNOMEBN =3D "gtksourceview"
+
+SRC_URI[archive.sha256sum] =3D "ab35d420102f3e8b055dd3b8642d3a48209f8881=
89e6254d0ffb4b6a7e8c3566"
=20
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
--=20
2.43.0


