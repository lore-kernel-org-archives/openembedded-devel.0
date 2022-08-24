Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F1A5C32793
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 15:12:13 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web08.12087.1661353925949812630
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Aug 2022 08:12:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1oQs32-0005V8-45; Wed, 24 Aug 2022 17:12:04 +0200
Received: from jlu by ptx.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1oQs31-0000xX-Gn; Wed, 24 Aug 2022 17:12:03 +0200
From: Jan Luebbe <jlu@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Luebbe <jlu@pengutronix.de>
Subject: [meta-oe][PATCH] gensio: upgrade 2.3.1 -> 2.5.2
Date: Wed, 24 Aug 2022 17:11:57 +0200
Message-Id: <20220824151157.3599-1-jlu@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Aug 2022 15:12:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98417

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 .../gensio/{gensio_2.3.1.bb => gensio_2.5.2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/gensio/{gensio_2.3.1.bb => gensio_2.5.2.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.3.1.bb b/meta-oe/recipes-connectivity/gensio/gensio_2.5.2.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/gensio/gensio_2.3.1.bb
rename to meta-oe/recipes-connectivity/gensio/gensio_2.5.2.bb
index a6e0075538c3..9e8af18e258b 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_2.3.1.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_2.5.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a0fd36908af843bcee10cb6dfc47fa67 \
                     file://COPYING;md5=bae3019b4c6dc4138c217864bd04331f \
                     "
 
-SRCREV = "c500d8705c517f96e591c060105a789f053d2b7a"
+SRCREV = "b6cd354afe6d5f63bc859c94fd3a455a3cdf0449"
 
 SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=master"
 
-- 
2.20.1


