Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7648CC3DA7D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 16:11:42 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.67865.1672762301328901999
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jan 2023 08:11:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout03.t-online.de (Postfix) with SMTP id 16D3826DF9
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Jan 2023 17:11:39 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.228.243]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pCjt3-1FFuuv0; Tue, 3 Jan 2023 17:11:37 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH] gnome-shell: add runtime dependency on adwaita-icon-theme
Date: Tue,  3 Jan 2023 17:11:26 +0100
Message-Id: <20230103161126.180996-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672762297-EF7F5A26-853DFD40/0/0 CLEAN NORMAL
X-TOI-MSGID: 696484de-cbc3-46e4-97ca-b157f4612e2c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Jan 2023 16:11:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100366

This is needed to have icons and cursors visible by default

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gnome-shell/gnome-shell_43.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_43.1.bb b/m=
eta-gnome/recipes-gnome/gnome-shell/gnome-shell_43.1.bb
index f75bad28b..14163a186 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_43.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_43.1.bb
@@ -67,6 +67,8 @@ FILES:${PN} +=3D " \
=20
 RDEPENDS:${PN} +=3D " \
 	accountsservice \
+	adwaita-icon-theme \
+	adwaita-icon-theme-cursors \
 	gdm-base \
 	gnome-control-center \
 	gnome-backgrounds \
--=20
2.34.1


