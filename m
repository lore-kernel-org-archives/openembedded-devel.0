Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFBC2C25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 18:10:58 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.3064.1716315056291025619
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 11:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout05.t-online.de (Postfix) with SMTP id 7D4B510262
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 20:10:50 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.175.137]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s9Twn-1UEG1p0; Tue, 21 May 2024 20:10:49 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCHv2] gnome-control-center: add PACKAGECONFIG knob for malcontent
Date: Tue, 21 May 2024 20:11:23 +0200
Message-ID: <20240521181123.78188-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1716315050-E53E93AB-C82C5E2C/0/0 CLEAN NORMAL
X-TOI-MSGID: c3a1eaf8-076c-43c6-82f8-0a9c5b55d4b8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 18:10:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110472

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-control-center/gnome-control-center_46.1.bb            | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_46.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_46.1.bb
index 9b54a00e6..d88c42531 100644
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
+PACKAGECONFIG[malcontent] =3D "-Dmalcontent=3Dtrue,-Dmalcontent=3Dfalse,=
malcontent,malcontent-ui"
=20
 EXTRA_OEMESON +=3D "-Doe_sysroot=3D${STAGING_DIR_HOST}"
=20
--=20
2.44.0


