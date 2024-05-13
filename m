Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6C8AC25B10
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 20:08:29 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.3395.1715630908128449045
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 May 2024 13:08:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout10.t-online.de (Postfix) with SMTP id 36ADA300A0
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 May 2024 22:07:53 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.44.250]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s6bxg-3atEqA0; Mon, 13 May 2024 22:07:52 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] gnome-control-center: add PACKAGECONFIG for malcontent
Date: Mon, 13 May 2024 22:08:25 +0200
Message-ID: <20240513200825.39767-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240513200825.39767-1-f_l_k@t-online.de>
References: <20240513200825.39767-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1715630873-423C0C65-6C3475F5/0/0 CLEAN NORMAL
X-TOI-MSGID: 469b286d-8ae4-41ac-aed6-ed940bc46bba
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 May 2024 20:08:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110342

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


