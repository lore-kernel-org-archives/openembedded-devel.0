Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71996C4708D
	for <webhook@archiver.kernel.org>; Sat, 10 Dec 2022 05:22:10 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.9055.1670649724868119780
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Dec 2022 21:22:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout04.t-online.de (Postfix) with SMTP id 5E7F2ED9
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 Dec 2022 06:22:02 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.225.165]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p3sJB-1hOgEf0; Sat, 10 Dec 2022 06:21:57 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 5/6] gtksourceview5: update 5.4.2 -> 5.6.1
Date: Sat, 10 Dec 2022 06:21:36 +0100
Message-Id: <20221210052137.303984-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221210052137.303984-1-f_l_k@t-online.de>
References: <20221210052137.303984-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670649717-E67DE07E-BB5333EB/0/0 CLEAN NORMAL
X-TOI-MSGID: fe2849ab-a472-492d-aa5f-66f1416cb9cf
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Dec 2022 05:22:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100016

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...urceview5_5.4.2.bb =3D> gtksourceview5_5.6.1.bb} | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview5_5.4.2.bb =3D=
> gtksourceview5_5.6.1.bb} (65%)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.2.=
bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.6.1.bb
similarity index 65%
rename from meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.2.b=
b
rename to meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.6.1.bb
index 297f79fe2..a35a8df7d 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.2.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.6.1.bb
@@ -5,13 +5,14 @@ LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fcd118f065f900982=
c24"
=20
 DEPENDS =3D " \
+    fribidi \
     glib-2.0-native \
     gnome-common-native \
-    intltool-native \
-    gtk+3 \
+    fontconfig \
     gtk4 \
     libxml2 \
     libpcre2 \
+    pango \
 "
=20
 PNAME =3D "gtksourceview"
@@ -22,14 +23,16 @@ GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase lib_package gettext features_check gtk-doc gtk-icon-ca=
che gobject-introspection vala
=20
-ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
-REQUIRED_DISTRO_FEATURES =3D "opengl"
+REQUIRED_DISTRO_FEATURES =3D "opengl gtk"
=20
-SRC_URI =3D "https://download.gnome.org/sources/gtksourceview/5.4/${PNAM=
E}-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "ad140e07eb841910de483c092bd4885abd29baadd6e95fa2=
2d93ed2df0b79de7"
+SRC_URI =3D "https://download.gnome.org/sources/gtksourceview/5.6/${PNAM=
E}-${PV}.tar.xz"
+SRC_URI[sha256sum] =3D "659d9cc9d034a114f07e7e134ee80d77dec0497cb1516ae5=
369119c2fcb9da16"
=20
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
 GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
+PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'vulkan', d)}"
+PACKAGECONFIG[vulkan] =3D ",,vulkan-loader vulkan-headers"
+
 FILES:${PN} +=3D "${datadir}/gtksourceview-5"
--=20
2.34.1


