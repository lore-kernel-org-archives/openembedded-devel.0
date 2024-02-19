Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3DD9C48BC3
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 07:01:38 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.36212.1708326088361634617
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Feb 2024 23:01:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout06.t-online.de (Postfix) with SMTP id 41984166EF
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 08:01:26 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.47.44]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rbxeX-1b5vjl0; Mon, 19 Feb 2024 08:01:25 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] libgedit-gtksourceview: update 299.0.5 -> 299.1.0
Date: Mon, 19 Feb 2024 08:01:39 +0100
Message-ID: <20240219070140.149267-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1708326085-577A9986-4CD6B495/0/0 CLEAN NORMAL
X-TOI-MSGID: 842bbf70-646e-4f27-9874-7451d4d5e4b3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 07:01:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108843

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ourceview_299.0.5.bb =3D> libgedit-gtksourceview_299.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gedit/{libgedit-gtksourceview_299.0.5.bb=
 =3D> libgedit-gtksourceview_299.1.0.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.0.=
5.bb b/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.1.0.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.0.5=
.bb
rename to meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.1.0.b=
b
index 00e5bec32..0ebc22acb 100644
--- a/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.0.5.bb
+++ b/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.1.0.bb
@@ -7,9 +7,9 @@ DEPENDS =3D "glib-2.0 gtk+3 libxml2"
=20
 inherit meson pkgconfig gobject-introspection features_check gtk-doc
=20
-SRC_URI =3D "git://github.com/gedit-technology/libgedit-gtksourceview.gi=
t;protocol=3Dhttps;branch=3Dlibgedit-gtksourceview-299-0"
+SRC_URI =3D "git://github.com/gedit-technology/libgedit-gtksourceview.gi=
t;protocol=3Dhttps;branch=3Dmain"
 S =3D "${WORKDIR}/git"
-SRCREV =3D "7e2179a8ff3022edad27e2d57744876d125cb040"
+SRCREV =3D "b271a625ca057cc3fa7d5ac83285c5d4e038202e"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
--=20
2.43.0


