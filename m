Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B36C4332F
	for <webhook@archiver.kernel.org>; Sun, 11 Dec 2022 01:52:49 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.8666.1670723559649310276
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Dec 2022 17:52:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout11.t-online.de (Postfix) with SMTP id 7D9A0B5AD
	for <openembedded-devel@lists.openembedded.org>; Sun, 11 Dec 2022 02:52:37 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.227.99]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p4BVx-00DCLZ0; Sun, 11 Dec 2022 02:52:26 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCHv2 1/2] gtksourceview5: update 5.4.2 -> 5.6.1
Date: Sun, 11 Dec 2022 02:52:14 +0100
Message-Id: <20221211015215.3743566-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670723547-EFFE97E2-C8E8CA4E/0/0 CLEAN NORMAL
X-TOI-MSGID: 6c5bcaf9-1582-4cb4-9971-de6a93584ee6
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 11 Dec 2022 01:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100030

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...sourceview5_5.4.2.bb =3D> gtksourceview5_5.6.1.bb} | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview5_5.4.2.bb =3D=
> gtksourceview5_5.6.1.bb} (68%)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.2.=
bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.6.1.bb
similarity index 68%
rename from meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.2.b=
b
rename to meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.6.1.bb
index 297f79fe2..2fb64325c 100644
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
 REQUIRED_DISTRO_FEATURES =3D "opengl"
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


