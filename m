Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC3ACC38142
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 13:42:19 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.14773.1674567734799475961
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Jan 2023 05:42:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1pKJYz-0006AX-74; Tue, 24 Jan 2023 14:42:13 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1pKJYz-0007iT-C5; Tue, 24 Jan 2023 14:42:12 +0100
Received: from jlu by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1pKJYx-00GcbJ-EX; Tue, 24 Jan 2023 14:42:11 +0100
From: Jan Luebbe <jlu@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Luebbe <jlu@pengutronix.de>
Subject: [meta-oe][PATCH] pcsc-lite: fix homepage URL
Date: Tue, 24 Jan 2023 14:41:35 +0100
Message-Id: <20230124134134.3961559-1-jlu@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Jan 2023 13:42:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100722

pcsclite.alioth.debian.org is not resolvable, so use the URL indicated
in the README.md file.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.9.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.9.bb
index dc572e46b4f2..c84c94dd5b2f 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.9.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.9.bb
@@ -1,5 +1,5 @@
 SUMMARY = "PC/SC Lite smart card framework and applications"
-HOMEPAGE = "http://pcsclite.alioth.debian.org/"
+HOMEPAGE = "https://pcsclite.apdu.fr/"
 LICENSE = "BSD-3-Clause & GPL-3.0-or-later"
 LICENSE:${PN} = "BSD-3-Clause"
 LICENSE:${PN}-lib = "BSD-3-Clause"
-- 
2.30.2


