Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1BFDC25B4E
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 13:10:49 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.14348.1674565848422150285
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Jan 2023 05:10:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1pKJ4Y-0000ud-H4; Tue, 24 Jan 2023 14:10:46 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1pKJ4Y-0007Cg-6f; Tue, 24 Jan 2023 14:10:45 +0100
Received: from jlu by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1pKJ4W-00GGg0-LK; Tue, 24 Jan 2023 14:10:44 +0100
From: Jan Luebbe <jlu@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Luebbe <jlu@pengutronix.de>
Subject: [meta-oe][PATCH] pcsc-lite: fix native build
Date: Tue, 24 Jan 2023 14:10:29 +0100
Message-Id: <20230124131028.3875988-1-jlu@pengutronix.de>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Jan 2023 13:10:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100720

The native build fails during configure with:
  checking for flex... no
  checking for lex... no
  configure: error: no lex or flex found

Add flex-native to DEPENDS to provide it.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.9.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.9.bb
index fd232c1b6328..dc572e46b4f2 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.9.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.9.bb
@@ -9,7 +9,7 @@ LICENSE:${PN}-dbg = "BSD-3-Clause & GPL-3.0-or-later"
 LICENSE:${PN}-spy = "GPL-3.0-or-later"
 LICENSE:${PN}-spy-dev = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=628c01ba985ecfa21677f5ee2d5202f6"
-DEPENDS = "autoconf-archive-native"
+DEPENDS = "autoconf-archive-native flex-native"
 
 SRC_URI = "https://pcsclite.apdu.fr/files/${BP}.tar.bz2"
 SRC_URI[sha256sum] = "cbcc3b34c61f53291cecc0d831423c94d437b188eb2b97b7febc08de1c914e8a"
-- 
2.30.2


