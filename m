Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48620C636D3
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 18:17:46 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.5941.1675880255506940080
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 10:17:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: uol@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1pPp0f-0007Ks-8T; Wed, 08 Feb 2023 19:17:33 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1pPp0c-003Zj1-Q5; Wed, 08 Feb 2023 19:17:32 +0100
Received: from uol by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1pPp0c-006vxm-Jn; Wed, 08 Feb 2023 19:17:30 +0100
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [meta-networking][PATCH] tnftp: switch to using variable flags for alternatives
Date: Wed,  8 Feb 2023 19:17:29 +0100
Message-Id: <20230208181729.1652601-1-u.oelmann@pengutronix.de>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 18:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101002

Up to now in this recipe the alternative mechanism only worked by accident, so
do like all other recipes and utilize varflags.

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 meta-networking/recipes-support/tnftp/tnftp_20210827.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/tnftp/tnftp_20210827.bb b/meta-networking/recipes-support/tnftp/tnftp_20210827.bb
index 8c5892668d44..a6ba671e703c 100644
--- a/meta-networking/recipes-support/tnftp/tnftp_20210827.bb
+++ b/meta-networking/recipes-support/tnftp/tnftp_20210827.bb
@@ -23,8 +23,8 @@ inherit autotools update-alternatives pkgconfig
 ALTERNATIVE_PRIORITY = "100"
 
 ALTERNATIVE:${PN} = "ftp"
-ALTERNATIVE_LINK_NAME_${PN} = "${bindir}/ftp"
-ALTERNATIVE_TARGET_${PN}  = "${bindir}/tnftp"
+ALTERNATIVE_LINK_NAME[ftp] = "${bindir}/ftp"
+ALTERNATIVE_TARGET[ftp] = "${bindir}/tnftp"
 
 FILES:${PN} = "${bindir}/tnftp"
 
-- 
2.30.2


