Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D6FBEB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 15:01:20 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.14708.1688742077908134234
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jul 2023 08:01:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout08.t-online.de (Postfix) with SMTP id CCB492884
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 17:01:15 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.154.160.21]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qHmxP-125UiA0; Fri, 7 Jul 2023 17:01:15 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] gnome-software: upgrade 44.2 -> 44.3
Date: Fri,  7 Jul 2023 17:01:05 +0200
Message-Id: <20230707150105.11070-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230707150105.11070-1-f_l_k@t-online.de>
References: <20230707150105.11070-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1688742075-F5FEF704-B27176F1/0/0 CLEAN NORMAL
X-TOI-MSGID: 80f5c58d-46d7-41e8-b4c7-5daa881c64c0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jul 2023 15:01:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103713

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-software_44.2.bb =3D> gnome-software_44.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-software/{gnome-software_44.2.bb =3D=
> gnome-software_44.3.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software_44.2.=
bb b/meta-gnome/recipes-gnome/gnome-software/gnome-software_44.3.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gnome-software/gnome-software_44.2.b=
b
rename to meta-gnome/recipes-gnome/gnome-software/gnome-software_44.3.bb
index 60aeecd18d..a7807c34b1 100644
--- a/meta-gnome/recipes-gnome/gnome-software/gnome-software_44.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software_44.3.bb
@@ -29,7 +29,7 @@ RDEPENDS:${PN} =3D "iso-codes"
=20
 EXTRA_OEMESON +=3D "-Dtests=3Dfalse -Dsoup2=3Dfalse"
=20
-SRC_URI[archive.sha256sum] =3D "c02dce70e52b37cd29c037650b372adb19b27d20=
fe44bc0921d81a959d35616c"
+SRC_URI[archive.sha256sum] =3D "325abb722cab20b6aa67f158ea2ff2ea899830ca=
0a883e24594d9def85fd1622"
=20
 PACKAGECONFIG ?=3D "flatpak"
 PACKAGECONFIG[flatpak] =3D "-Dflatpak=3Dtrue,-Dflatpak=3Dfalse,flatpak o=
stree"
--=20
2.34.1


