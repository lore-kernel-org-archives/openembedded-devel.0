Return-Path: <f.pflug@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA39C3ABAA
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 15:05:18 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.52893.1746457517245001110
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 08:05:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: fpg@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <fpg@pengutronix.de>)
	id 1uBxNb-00008d-Ka; Mon, 05 May 2025 17:05:15 +0200
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <fpg@pengutronix.de>)
	id 1uBxNb-001FNc-1S;
	Mon, 05 May 2025 17:05:15 +0200
Received: from fpg by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <fpg@pengutronix.de>)
	id 1uBxNb-00BEgb-1H;
	Mon, 05 May 2025 17:05:15 +0200
From: Fabian Pflug <f.pflug@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Fabian Pflug <f.pflug@pengutronix.de>
Subject: [meta-python2][PATCH] layer.conf: update LAYERSERIES_COMPAT to scarthgap
Date: Mon,  5 May 2025 17:04:51 +0200
Message-Id: <20250505150451.2675990-1-f.pflug@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: fpg@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 15:05:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117319

Layer is compatible with all version up till scarthgap.

Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 38ef579..b1d9820 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -14,7 +14,7 @@ LAYERVERSION_meta-python2 = "1"
 
 LAYERDEPENDS_meta-python2 = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_meta-python2 = "kirkstone"
+LAYERSERIES_COMPAT_meta-python2 = "kirkstone langdale mickledore nanbield scarthgap"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
-- 
2.39.5


