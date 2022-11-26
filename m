Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB5E0C47090
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 23:04:38 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.81066.1669503869565347288
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Nov 2022 15:04:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout10.t-online.de (Postfix) with SMTP id 03A0869AC
	for <openembedded-devel@lists.openembedded.org>; Sun, 27 Nov 2022 00:04:28 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.224.10]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oz4DZ-1zml0P0; Sun, 27 Nov 2022 00:04:17 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCHv2 05/14] libgdata: use gcr3
Date: Sun, 27 Nov 2022 00:03:42 +0100
Message-Id: <20221126230351.1431843-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221126230351.1431843-1-f_l_k@t-online.de>
References: <20221126230351.1431843-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669503857-167EF98D-25EDF33F/0/0 CLEAN NORMAL
X-TOI-MSGID: 50fcce6e-50a3-4840-833c-5591d5a590e6
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Nov 2022 23:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99756

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb b/meta-=
gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb
index bd9180e8a..126ef712d 100644
--- a/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb
+++ b/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fc=
d118f065f900982c24 \
                     file://gdata/gdata.h;endline=3D20;md5=3D079a554efcf6=
5d46f96a515806e7e99a \
                     file://gdata/gdata-types.h;endline=3D20;md5=3D7399b1=
11aac8718da13888fc634be6ef"
=20
-DEPENDS =3D "libxml2 glib-2.0 libsoup-2.4 intltool-native liboauth gcr j=
son-glib"
+DEPENDS =3D "libxml2 glib-2.0 libsoup-2.4 intltool-native liboauth gcr3 =
json-glib"
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
 GNOMEBASEBUILDCLASS =3D "meson"
--=20
2.34.1


