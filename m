Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD09C4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 12:57:51 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.14508.1699793869077306204
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 04:57:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout11.t-online.de (Postfix) with SMTP id BBE27157C4
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 13:57:46 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.32.92]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r2A24-1GG3yD0; Sun, 12 Nov 2023 13:57:44 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-terminal: Remove recommendation on vte-prompt
Date: Sun, 12 Nov 2023 13:57:34 +0100
Message-ID: <20231112125734.3852645-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699793864-47FFC979-033A7A50/0/0 CLEAN NORMAL
X-TOI-MSGID: c8111771-86d1-4c02-88db-de00ca6a0fd6
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 12:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106585

vte9 does not contain a separate package for vte-prompt. Remove the
recommendation to avoid ${libexecdir}/vte-urlencode-cwd being pulled in b=
y
another vte version

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.=
1.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
index f3eb0c6cc..069a95f20 100644
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
@@ -34,4 +34,4 @@ FILES:${PN} +=3D " \
     ${systemd_user_unitdir} \
 "
=20
-RRECOMMENDS:${PN} +=3D "vte-prompt gsettings-desktop-schemas"
+RRECOMMENDS:${PN} +=3D "gsettings-desktop-schemas"
--=20
2.42.0


