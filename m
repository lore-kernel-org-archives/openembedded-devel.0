Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E01DC4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 10:24:09 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.51193.1699266240689798090
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 02:24:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout03.t-online.de (Postfix) with SMTP id DAE123C991
	for <openembedded-devel@lists.openembedded.org>; Mon,  6 Nov 2023 11:23:49 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.229.73]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qzwlo-0ZPSTa0; Mon, 6 Nov 2023 11:23:48 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] libchamplain: Upgrade 0.12.20 -> 0.12.21
Date: Mon,  6 Nov 2023 11:24:11 +0100
Message-ID: <20231106102411.58424-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231106102411.58424-1-f_l_k@t-online.de>
References: <20231106102411.58424-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699266228-1FFFCEA2-334C832F/0/0 CLEAN NORMAL
X-TOI-MSGID: f85c7041-d71d-4444-98b5-f8ed130c5b96
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Nov 2023 10:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106408

- switch to soup3
- build vapi

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{libchamplain_0.12.20.bb =3D> libchamplain_0.12.21.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/libchamplain/{libchamplain_0.12.20.bb =3D=
> libchamplain_0.12.21.bb} (61%)

diff --git a/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.20.b=
b b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
similarity index 61%
rename from meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.20.bb
rename to meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
index 859eab916..a89ab8cc7 100644
--- a/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.20.bb
+++ b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
@@ -1,13 +1,13 @@
 SUMMARY =3D "libchamplain is a Gtk widget displaying zoomable and pannab=
le maps"
 LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b=
0a1"
-DEPENDS =3D "glib-2.0 gtk+3 gdk-pixbuf clutter-1.0 clutter-gtk-1.0 libso=
up-2.4"
+DEPENDS =3D "glib-2.0 gtk+3 clutter-1.0 clutter-gtk-1.0 libsoup-3.0 cair=
o sqlite3"
=20
-inherit features_check gobject-introspection meson pkgconfig
+inherit features_check gobject-introspection meson pkgconfig vala
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
-SRCREV =3D "145e417f32e507b63c21ad4e915b808a6174099e"
+SRCREV =3D "941560af497148588783db991e8135f52a82574d"
 SRC_URI =3D "git://github.com/gnome/libchamplain.git;branch=3Dmaster;pro=
tocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
--=20
2.42.0


