Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EBC0C0015E
	for <webhook@archiver.kernel.org>; Sun,  6 Aug 2023 06:01:14 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.6649.1691301672111052954
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 23:01:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout07.t-online.de (Postfix) with SMTP id ACBB01D59C
	for <openembedded-devel@lists.openembedded.org>; Sun,  6 Aug 2023 08:01:09 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.165.3]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qSWp8-0MNppp0; Sun, 6 Aug 2023 08:01:06 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-software: update 44.3 -> 44.4
Date: Sun,  6 Aug 2023 08:00:51 +0200
Message-ID: <20230806060051.51814-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1691301666-0AFFA649-103D5075/0/0 CLEAN NORMAL
X-TOI-MSGID: d810ef66-4576-46f6-9c85-228a8049d7f8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Aug 2023 06:01:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104295

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-software_44.3.bb =3D> gnome-software_44.4.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-software/{gnome-software_44.3.bb =3D=
> gnome-software_44.4.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software_44.3.=
bb b/meta-gnome/recipes-gnome/gnome-software/gnome-software_44.4.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gnome-software/gnome-software_44.3.b=
b
rename to meta-gnome/recipes-gnome/gnome-software/gnome-software_44.4.bb
index a7807c34b1..ac3571685f 100644
--- a/meta-gnome/recipes-gnome/gnome-software/gnome-software_44.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software_44.4.bb
@@ -29,7 +29,7 @@ RDEPENDS:${PN} =3D "iso-codes"
=20
 EXTRA_OEMESON +=3D "-Dtests=3Dfalse -Dsoup2=3Dfalse"
=20
-SRC_URI[archive.sha256sum] =3D "325abb722cab20b6aa67f158ea2ff2ea899830ca=
0a883e24594d9def85fd1622"
+SRC_URI[archive.sha256sum] =3D "8b53767ef6cc54a2db588ef1c5926838b0d67b8d=
9b21173de5139cd0fbd28095"
=20
 PACKAGECONFIG ?=3D "flatpak"
 PACKAGECONFIG[flatpak] =3D "-Dflatpak=3Dtrue,-Dflatpak=3Dfalse,flatpak o=
stree"
--=20
2.41.0


