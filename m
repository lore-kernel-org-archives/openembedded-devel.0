Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92B3C25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 14:30:05 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.21146.1716301803296185705
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 07:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout01.t-online.de (Postfix) with SMTP id 8BF0D1BBEF
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 16:29:58 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.175.137]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s9QV1-21P7r70; Tue, 21 May 2024 16:29:55 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-control-center: add PACKAGECONFIG knob for malcontent
Date: Tue, 21 May 2024 16:30:27 +0200
Message-ID: <20240521143027.3130140-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1716301795-42BC3C65-E54DE5F6/0/0 CLEAN NORMAL
X-TOI-MSGID: c4846f4a-1137-4c45-b542-fd2dbcdfd668
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 14:30:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110447

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-control-center/gnome-control-center_46.1.bb            | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_46.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_46.1.bb
index 9b54a00e6..6202f81cb 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
46.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
46.1.bb
@@ -46,6 +46,7 @@ PACKAGECONFIG[ibus] =3D "-Dibus=3Dtrue, -Dibus=3Dfalse,=
 ibus"
 PACKAGECONFIG[wayland] =3D "-Dwayland=3Dtrue, -Dwayland=3Dfalse, wayland=
"
 PACKAGECONFIG[file-share] =3D ",,,gnome-user-share"
 PACKAGECONFIG[media-share] =3D ",,,rygel-meta tumbler"
+PACKAGECONFIG[malcontent] =3D ",,malcontent,malcontent-ui"
=20
 EXTRA_OEMESON +=3D "-Doe_sysroot=3D${STAGING_DIR_HOST}"
=20
--=20
2.44.0


