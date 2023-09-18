Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE23CD342E
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 21:52:18 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.4038.1695073932227544260
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Sep 2023 14:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout06.t-online.de (Postfix) with SMTP id 98E8654F4
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 23:52:09 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.161.214]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qiMA1-3qxV2E0; Mon, 18 Sep 2023 23:52:05 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 14/18] gnome-software: upgrade 44.4 -> 45.0
Date: Mon, 18 Sep 2023 23:51:49 +0200
Message-ID: <20230918215156.1920452-14-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918215156.1920452-1-f_l_k@t-online.de>
References: <20230918215156.1920452-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1695073925-44FF45E3-E12FAAD8/0/0 CLEAN NORMAL
X-TOI-MSGID: 40b922c5-1f5d-4e6f-83ee-2e5b366bc3bb
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 21:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104943

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-software_44.4.bb =3D> gnome-software_45.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-software/{gnome-software_44.4.bb =3D=
> gnome-software_45.0.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software_44.4.=
bb b/meta-gnome/recipes-gnome/gnome-software/gnome-software_45.0.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gnome-software/gnome-software_44.4.b=
b
rename to meta-gnome/recipes-gnome/gnome-software/gnome-software_45.0.bb
index ac3571685..89a6f05f4 100644
--- a/meta-gnome/recipes-gnome/gnome-software/gnome-software_44.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software_45.0.bb
@@ -29,7 +29,7 @@ RDEPENDS:${PN} =3D "iso-codes"
=20
 EXTRA_OEMESON +=3D "-Dtests=3Dfalse -Dsoup2=3Dfalse"
=20
-SRC_URI[archive.sha256sum] =3D "8b53767ef6cc54a2db588ef1c5926838b0d67b8d=
9b21173de5139cd0fbd28095"
+SRC_URI[archive.sha256sum] =3D "61f42c2fd4d19b894a2484f691369032dc8b2a32=
a014ce6ca4d02c4fa4f75a14"
=20
 PACKAGECONFIG ?=3D "flatpak"
 PACKAGECONFIG[flatpak] =3D "-Dflatpak=3Dtrue,-Dflatpak=3Dfalse,flatpak o=
stree"
--=20
2.41.0


