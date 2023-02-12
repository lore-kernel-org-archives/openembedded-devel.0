Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6925FC05027
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 17:03:46 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.14903.1676221419415507124
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Feb 2023 09:03:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout10.t-online.de (Postfix) with SMTP id BD8991352E
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 18:03:36 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.232.57]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pRFlH-0uOOrC0; Sun, 12 Feb 2023 18:03:35 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 2/2] gnome-software: update 43.2 -> 43.4
Date: Sun, 12 Feb 2023 18:03:20 +0100
Message-Id: <20230212170320.284295-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230212170320.284295-1-f_l_k@t-online.de>
References: <20230212170320.284295-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1676221415-726BD7D8-434BF121/0/0 CLEAN NORMAL
X-TOI-MSGID: 82137cc1-a25b-4918-91b2-e9651ba79f68
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 17:03:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101055

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-software_43.2.bb =3D> gnome-software_43.4.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-software/{gnome-software_43.2.bb =3D=
> gnome-software_43.4.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software_43.2.=
bb b/meta-gnome/recipes-gnome/gnome-software/gnome-software_43.4.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gnome-software/gnome-software_43.2.b=
b
rename to meta-gnome/recipes-gnome/gnome-software/gnome-software_43.4.bb
index 183a2d107..f941c4134 100644
--- a/meta-gnome/recipes-gnome/gnome-software/gnome-software_43.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software_43.4.bb
@@ -29,7 +29,7 @@ RDEPENDS:${PN} =3D "iso-codes"
=20
 EXTRA_OEMESON +=3D "-Dtests=3Dfalse -Dsoup2=3Dfalse"
=20
-SRC_URI[archive.sha256sum] =3D "22aa7f0a317c770f68b897e9e512b2cbedb181b6=
95ffdb0b658d99bbd64f368d"
+SRC_URI[archive.sha256sum] =3D "e9df060ebab59f49697d5ef2630ec36de6045416=
9dc191af60d3483720aadb3e"
=20
 PACKAGECONFIG ?=3D "flatpak"
 PACKAGECONFIG[flatpak] =3D "-Dflatpak=3Dtrue,-Dflatpak=3Dfalse,flatpak o=
stree"
--=20
2.34.1


