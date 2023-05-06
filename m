Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D92C77B7F
	for <webhook@archiver.kernel.org>; Sat,  6 May 2023 08:31:14 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.30307.1683361871807883473
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 May 2023 01:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout11.t-online.de (Postfix) with SMTP id 5DAD82611D
	for <openembedded-devel@lists.openembedded.org>; Sat,  6 May 2023 10:31:09 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.44.170]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pvDJs-0ea5VB0; Sat, 6 May 2023 10:31:08 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] adw-gtk3: update 4.5 -> 4.6
Date: Sat,  6 May 2023 10:30:59 +0200
Message-Id: <20230506083059.25735-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683361868-BD176C11-FC564F4F/0/0 CLEAN NORMAL
X-TOI-MSGID: 08785f72-39df-47be-b86c-5d2f9315c98d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 May 2023 08:31:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102325

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-themes/{adw-gtk3_4.5.bb =3D> adw-gtk3_4.6.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/gnome-themes/{adw-gtk3_4.5.bb =3D> adw-gtk3=
_4.6.bb} (88%)

diff --git a/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_4.5.bb b/meta-oe=
/recipes-gnome/gnome-themes/adw-gtk3_4.6.bb
similarity index 88%
rename from meta-oe/recipes-gnome/gnome-themes/adw-gtk3_4.5.bb
rename to meta-oe/recipes-gnome/gnome-themes/adw-gtk3_4.6.bb
index cb79b5df8..0b121183a 100644
--- a/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_4.5.bb
+++ b/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_4.6.bb
@@ -11,6 +11,6 @@ inherit meson
 SRC_URI =3D "git://github.com/lassekongo83/adw-gtk3.git;protocol=3Dhttps=
;branch=3Dmain"
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "bbc539534e881aa9c554665bd3cbf42ffeec6b76"
+SRCREV =3D "f26e86c8a7b40ac23f165efdb620f734c0f1db23"
=20
 FILES:${PN} =3D "${datadir}/themes"
--=20
2.34.1


