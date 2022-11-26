Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BAFDC43217
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 23:04:38 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.81072.1669503871820534742
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Nov 2022 15:04:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout10.t-online.de (Postfix) with SMTP id 5BC0677E7
	for <openembedded-devel@lists.openembedded.org>; Sun, 27 Nov 2022 00:04:30 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.224.10]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oz4Dj-1zml0Y0; Sun, 27 Nov 2022 00:04:28 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCHv2 14/14] geary: build with gcr3
Date: Sun, 27 Nov 2022 00:03:51 +0100
Message-Id: <20221126230351.1431843-14-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221126230351.1431843-1-f_l_k@t-online.de>
References: <20221126230351.1431843-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669503868-167EF98D-0A69B324/0/0 CLEAN NORMAL
X-TOI-MSGID: 0e5a5eab-ae59-43a3-baa0-112fb84c30ca
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Nov 2022 23:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99765

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-connectivity/geary/geary_43.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-connectivity/geary/geary_43.0.bb b/meta-g=
nome/recipes-connectivity/geary/geary_43.0.bb
index 8dd0ea67d..03738c554 100644
--- a/meta-gnome/recipes-connectivity/geary/geary_43.0.bb
+++ b/meta-gnome/recipes-connectivity/geary/geary_43.0.bb
@@ -10,7 +10,7 @@ DEPENDS =3D " \
     enchant2 \
     evolution-data-server \
     folks \
-    gcr \
+    gcr3 \
     gmime \
     gnome-online-accounts \
     gsound \
--=20
2.34.1


