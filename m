Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DBAACE7A8A
	for <webhook@archiver.kernel.org>; Sat, 23 Sep 2023 00:10:50 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.12079.1695427843578413577
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 17:10:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout08.t-online.de (Postfix) with SMTP id 3455EC2CC
	for <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 02:10:41 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.34.192]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qjqEK-23FnFZ0; Sat, 23 Sep 2023 02:10:40 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/4] gexiv: Upgrade 0.14.0 -> 0.14.2
Date: Sat, 23 Sep 2023 02:10:23 +0200
Message-ID: <20230923001033.2805049-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1695427840-56FF8F57-C071C955/0/0 CLEAN NORMAL
X-TOI-MSGID: 6ddbe293-6466-453e-9f5f-8763a559b1d4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 00:10:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105081

- enable vapi build
- delete removed meson option

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gexiv2/{gexiv2_0.14.0.bb =3D> gexiv2_0.14.2.bb}          | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-gnome/recipes-gnome/gexiv2/{gexiv2_0.14.0.bb =3D> gexiv2_0.1=
4.2.bb} (72%)

diff --git a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.0.bb b/meta-gnom=
e/recipes-gnome/gexiv2/gexiv2_0.14.2.bb
similarity index 72%
rename from meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.0.bb
rename to meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.2.bb
index fed29da0f..15091d4cd 100644
--- a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.0.bb
+++ b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.2.bb
@@ -7,13 +7,12 @@ DEPENDS =3D "exiv2 python3-pygobject-native"
 GNOMEBASEBUILDCLASS =3D "meson"
 GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
-inherit gnomebase gobject-introspection gtk-doc python3native
+inherit gnomebase gobject-introspection gtk-doc python3native vala
=20
-SRC_URI[archive.sha256sum] =3D "e58279a6ff20b6f64fa499615da5e9b57cf65ba7=
850b72fafdf17221a9d6d69e"
+SRC_URI[archive.sha256sum] =3D "2a0c9cf48fbe8b3435008866ffd40b8eddb0667d=
2212b42396fdf688e93ce0be"
=20
 EXTRA_OEMESON =3D " \
-    -Dvapi=3Dfalse \
-    -Dpython3_girdir=3D${PYTHON_SITEPACKAGES_DIR}/gi/overrides \
+    ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dvapi=3Dtrue', '-D=
vapi=3Dfalse', d)} \
 "
=20
 PACKAGES =3D+ "${PN}-python3"
--=20
2.42.0


