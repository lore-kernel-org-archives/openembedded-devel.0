Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC324D743F1
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 23:26:02 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.1926.1732145161614967753
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Nov 2024 15:26:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout10.t-online.de (Postfix) with SMTP id 959E3911
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 00:25:59 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.160.173]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tDu58-3zmzPF0; Thu, 21 Nov 2024 00:25:58 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] geary: add itstool-native dependency
Date: Thu, 21 Nov 2024 00:28:11 +0100
Message-ID: <20241120232812.2718277-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1732145158-4E7FA459-17DBD872/0/0 CLEAN NORMAL
X-TOI-MSGID: f11a3d72-1cfc-478d-9c05-bfaa6c6a3e49
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 23:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113941

fixes:
| Configuring org.gnome.Geary.service using configuration
| Program itstool found: NO
|
| ../git/help/meson.build:21:6: ERROR: Program 'itstool' not found or not=
 executable

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-connectivity/geary/geary_46.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-connectivity/geary/geary_46.0.bb b/meta-g=
nome/recipes-connectivity/geary/geary_46.0.bb
index d8d48ef51..2ca27c4f3 100644
--- a/meta-gnome/recipes-connectivity/geary/geary_46.0.bb
+++ b/meta-gnome/recipes-connectivity/geary/geary_46.0.bb
@@ -18,6 +18,7 @@ DEPENDS =3D " \
     gtk+3 \
     icu \
     iso-codes \
+    itstool-native \
     json-glib \
     libhandy \
     libical \
--=20
2.47.0


