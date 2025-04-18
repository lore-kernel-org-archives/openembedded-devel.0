Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CDD1C369AB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 12:43:37 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.10754.1744980214115627963
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Apr 2025 05:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout05.t-online.de (Postfix) with SMTP id 44445F9F
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 14:43:32 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.239.25]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u5l47-4adomH0; Fri, 18 Apr 2025 14:43:31 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] static-passwd-meta-oe: add flatpak user
Date: Fri, 18 Apr 2025 14:43:22 +0200
Message-ID: <20250418124322.171293-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1744980211-C0FF6936-C92B6F8C/0/0 CLEAN NORMAL
X-TOI-MSGID: 5d011602-157c-4aa2-938e-38bc62970352
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 12:43:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116966

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/files/static-passwd-meta-oe | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/files/static-passwd-meta-oe b/meta-oe/files/static-p=
asswd-meta-oe
index 1aba2e8d62..47380b8d00 100644
--- a/meta-oe/files/static-passwd-meta-oe
+++ b/meta-oe/files/static-passwd-meta-oe
@@ -10,3 +10,5 @@ pcpqa:x:621:nogroup::/:/bin/nologin
 influxdb:x:622:influxdb::/var/lib/influxdb:/bin/nologin
 mongodb:x:623:nogroup::/:/bin/nologin
 gpio-manager:x:624:gpio::/:/bin/nologin
+flatpak:x:625:625:Flatpak system helper:/:/sbin/nologin
+
--=20
2.49.0


