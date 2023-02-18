Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CEB1C636CC
	for <webhook@archiver.kernel.org>; Sat, 18 Feb 2023 15:44:22 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.13810.1676735054341425004
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Feb 2023 07:44:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1pTPNk-0002Lx-Ls; Sat, 18 Feb 2023 16:44:12 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1pTPNi-005qFj-RV; Sat, 18 Feb 2023 16:44:12 +0100
Received: from jlu by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1pTPNj-000MRI-Bv; Sat, 18 Feb 2023 16:44:11 +0100
From: Jan Luebbe <jlu@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Jan Luebbe <jlu@pengutronix.de>
Subject: [meta-networking][PATCH 2/2] atftp: use https for git repository access
Date: Sat, 18 Feb 2023 16:43:38 +0100
Message-Id: <20230218154337.84829-2-jlu@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230218154337.84829-1-jlu@pengutronix.de>
References: <20230218154337.84829-1-jlu@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 15:44:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101145

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 meta-networking/recipes-daemons/atftp/atftp_0.8.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/atftp/atftp_0.8.0.bb b/meta-networking/recipes-daemons/atftp/atftp_0.8.0.bb
index 359d8b365ff3..507621795f92 100644
--- a/meta-networking/recipes-daemons/atftp/atftp_0.8.0.bb
+++ b/meta-networking/recipes-daemons/atftp/atftp_0.8.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f65159f73e603f89d6867d43191900e5"
 
 SRCREV = "d5c27eb7a9695d83569767e27ef69674173db39a"
 
-SRC_URI = "git://git.code.sf.net/p/atftp/code;branch=master \
+SRC_URI = "git://git.code.sf.net/p/atftp/code;branch=master;protocol=https \
            file://atftpd.init \
            file://atftpd.service \
 "
-- 
2.30.2


