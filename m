Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA2FEC4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 15:00:42 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web12.20455.1667487635566898526
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Nov 2022 08:00:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: uol@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1oqbhp-0002Lt-89; Thu, 03 Nov 2022 16:00:33 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1oqbhp-0025fD-FT; Thu, 03 Nov 2022 16:00:32 +0100
Received: from uol by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1oqbhn-000cuY-TB; Thu, 03 Nov 2022 16:00:31 +0100
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [meta-java][PATCH] layer.conf: Mark as compatible with langdale
Date: Thu,  3 Nov 2022 16:00:30 +0100
Message-Id: <20221103150030.149529-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Nov 2022 15:00:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99426

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 2e2ce1677ecc..99a137608744 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "meta-java"
 BBFILE_PATTERN_meta-java := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-java = "10"
-LAYERSERIES_COMPAT_meta-java = "kirkstone"
+LAYERSERIES_COMPAT_meta-java = "kirkstone langdale"
 LAYERDEPENDS_meta-java += "openembedded-layer"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
-- 
2.30.2


