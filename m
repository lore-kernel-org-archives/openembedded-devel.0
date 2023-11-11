Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AECBC4332F
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 20:23:27 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.3356.1699734200732654441
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Nov 2023 12:23:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout11.t-online.de (Postfix) with SMTP id E54F41D4D8
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 21:23:18 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.34.215]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r1uVg-28Jp6P0; Sat, 11 Nov 2023 21:23:16 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-teminal: build with vte9
Date: Sat, 11 Nov 2023 21:23:29 +0100
Message-ID: <20231111202329.909361-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699734196-877FD968-EAD79CE4/0/0 CLEAN NORMAL
X-TOI-MSGID: d9ed4459-3b2a-4e10-af55-7e7335f92aa5
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 20:23:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106572

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/gnome-terminal/gnome-terminal_3.48.1.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.=
1.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.1.bb
index 8f91f7cca..d1c088369 100644
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.1.bb
@@ -14,7 +14,7 @@ DEPENDS =3D " \
     desktop-file-utils-native \
     gtk+3 \
     gsettings-desktop-schemas \
-    vte \
+    vte9 \
     dconf \
     libpcre2 \
 "
--=20
2.42.0


