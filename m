Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1524ACF9C69
	for <webhook@archiver.kernel.org>; Sat, 21 Sep 2024 15:58:45 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.12140.1726934315304989865
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Sep 2024 08:58:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout10.t-online.de (Postfix) with SMTP id 712DB486FF
	for <openembedded-devel@lists.openembedded.org>; Sat, 21 Sep 2024 17:58:33 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.36.251]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ss2VE-4A2kTp0; Sat, 21 Sep 2024 17:58:32 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] gnome-photos: switch from tracker to tinysparql
Date: Sat, 21 Sep 2024 18:00:19 +0200
Message-ID: <20240921160020.5364-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1726934312-87FFD467-7F0C8874/0/0 CLEAN NORMAL
X-TOI-MSGID: f9c2d0fe-225d-4dc0-a1da-6dd0a021ab92
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Sep 2024 15:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112431

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb b=
/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb
index 4b05e52ca..4b343814b 100644
--- a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb
@@ -17,7 +17,7 @@ DEPENDS =3D " \
     gnome-online-accounts \
     gsettings-desktop-schemas \
     libdazzle \
-    tracker \
+    tinysparql \
     libhandy \
     libportal \
 "
--=20
2.46.0


