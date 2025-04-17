Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C6EC369CF
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 16:39:39 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.13562.1744907969829324162
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Apr 2025 09:39:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout11.t-online.de (Postfix) with SMTP id B2A8D1611
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 18:39:27 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.169.76]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u5SGs-0tTTjW0; Thu, 17 Apr 2025 18:39:26 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/4] static-passwd-meta-oe: add flatpak user
Date: Thu, 17 Apr 2025 18:39:10 +0200
Message-ID: <20250417163912.1060162-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417163912.1060162-1-f_l_k@t-online.de>
References: <20250417163912.1060162-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1744907966-B3FFC92D-736541F4/0/0 CLEAN NORMAL
X-TOI-MSGID: eb9bc48e-1193-48ed-992c-c5fe3fac5e59
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 16:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116940

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/files/static-passwd-meta-oe | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/files/static-passwd-meta-oe b/meta-oe/files/static-p=
asswd-meta-oe
index 1aba2e8d62..b08b2691f7 100644
--- a/meta-oe/files/static-passwd-meta-oe
+++ b/meta-oe/files/static-passwd-meta-oe
@@ -10,3 +10,5 @@ pcpqa:x:621:nogroup::/:/bin/nologin
 influxdb:x:622:influxdb::/var/lib/influxdb:/bin/nologin
 mongodb:x:623:nogroup::/:/bin/nologin
 gpio-manager:x:624:gpio::/:/bin/nologin
+flatpak:x:980:980:Flatpak system helper:/:/sbin/nologin
+
--=20
2.49.0


