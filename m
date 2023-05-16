Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E769C77B75
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 04:35:30 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.13605.1684211725782507169
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 May 2023 21:35:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout08.t-online.de (Postfix) with SMTP id 85A62212A7
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 06:35:23 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([79.219.228.204]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pymP6-33a7Xt0; Tue, 16 May 2023 06:35:16 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 1/7] gnome-software: update 44.0 -> 44.1
Date: Tue, 16 May 2023 06:34:52 +0200
Message-Id: <20230516043458.6180-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1684211716-59FF057F-6F5E477F/0/0 CLEAN NORMAL
X-TOI-MSGID: a5eb96e1-0263-4e9a-aa34-a06eed4c5ac2
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 04:35:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102610

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-software_44.0.bb =3D> gnome-software_44.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-software/{gnome-software_44.0.bb =3D=
> gnome-software_44.1.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software_44.0.=
bb b/meta-gnome/recipes-gnome/gnome-software/gnome-software_44.1.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gnome-software/gnome-software_44.0.b=
b
rename to meta-gnome/recipes-gnome/gnome-software/gnome-software_44.1.bb
index f497f5bcde..beec3de521 100644
--- a/meta-gnome/recipes-gnome/gnome-software/gnome-software_44.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software_44.1.bb
@@ -29,7 +29,7 @@ RDEPENDS:${PN} =3D "iso-codes"
=20
 EXTRA_OEMESON +=3D "-Dtests=3Dfalse -Dsoup2=3Dfalse"
=20
-SRC_URI[archive.sha256sum] =3D "619719f9529e0bb1dad30fadbb780d7b1d99940a=
6db1f71df51bc737341830af"
+SRC_URI[archive.sha256sum] =3D "9dc6551512cf0a26d03e0d79f494870a6916d43c=
14d82199c43a11d9cc0ad5aa"
=20
 PACKAGECONFIG ?=3D "flatpak"
 PACKAGECONFIG[flatpak] =3D "-Dflatpak=3Dtrue,-Dflatpak=3Dfalse,flatpak o=
stree"
--=20
2.34.1


