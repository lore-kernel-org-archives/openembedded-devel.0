Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA585C36002
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 03:21:27 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.57573.1742872881675671158
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Mar 2025 20:21:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout12.t-online.de (Postfix) with SMTP id 0B972E72
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 04:21:19 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.32.137]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1twuqs-0TeWzi0; Tue, 25 Mar 2025 04:21:18 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] gnome-control-center: add PACKAGECONFIG knob for power-profiles
Date: Tue, 25 Mar 2025 04:22:03 +0100
Message-ID: <20250325032203.3034-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325032203.3034-1-f_l_k@t-online.de>
References: <20250325032203.3034-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1742872878-F2FFE83B-868B9ED1/0/0 CLEAN NORMAL
X-TOI-MSGID: b8f65220-0153-4f2c-81ca-4217fd3fc898
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 03:21:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116215

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-control-center/gnome-control-center_48.0.bb            | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_48.0.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_48.0.bb
index b43a59489b..340273aa33 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
48.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
48.0.bb
@@ -48,6 +48,7 @@ PACKAGECONFIG[wayland] =3D "-Dwayland=3Dtrue, -Dwayland=
=3Dfalse, wayland"
 PACKAGECONFIG[file-share] =3D ",,,gnome-user-share"
 PACKAGECONFIG[media-share] =3D ",,,rygel-meta tumbler"
 PACKAGECONFIG[malcontent] =3D "-Dmalcontent=3Dtrue,-Dmalcontent=3Dfalse,=
malcontent,malcontent-ui"
+PACKAGECONFIG[power-profiles] =3D ",,,power-profiles-daemon"
=20
 EXTRA_OEMESON +=3D "-Doe_sysroot=3D${STAGING_DIR_HOST}"
 GIDOCGEN_MESON_OPTION =3D 'documentation'
--=20
2.49.0


