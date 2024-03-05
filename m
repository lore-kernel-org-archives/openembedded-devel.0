Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CF2CC54E41
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 20:08:00 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.3033.1709669279185239377
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Mar 2024 12:08:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: uol@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1rhb4u-0004lk-SW; Tue, 05 Mar 2024 21:07:56 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1rhb4t-004by2-C7; Tue, 05 Mar 2024 21:07:55 +0100
Received: from uol by dude03.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <uol@pengutronix.de>)
	id 1rhb4t-00Ehkq-0l;
	Tue, 05 Mar 2024 21:07:55 +0100
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: yocto@pengutronix.de,
	=?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [meta-oe][PATCH] signing.bbclass: fix typos
Date: Tue,  5 Mar 2024 21:07:53 +0100
Message-Id: <20240305200753.3504775-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 20:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109131

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 meta-oe/classes/signing.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bbclass
index ec076d96851a..f52d861b763c 100644
--- a/meta-oe/classes/signing.bbclass
+++ b/meta-oe/classes/signing.bbclass
@@ -6,9 +6,9 @@
 
 # This class provides a common workflow to use asymmetric (i.e. RSA) keys to
 # sign artifacts. Usually, the keys are either stored as simple files in the
-# file system or on a HSM (Hardware Security Module). While files are easy to
-# use, it's hard to verify that no copies of the private have been made and
-# only authorized persons are able to use the key. Use of an HSM addresses
+# file system or on an HSM (Hardware Security Module). While files are easy to
+# use, it's hard to verify that no copies of the private key have been made
+# and only authorized persons are able to use the key. Use of an HSM addresses
 # these risks by only allowing use of the key via an API (often PKCS #11). The
 # standard way of referring to a specific key in an HSM are PKCS #11 URIs (RFC
 # 7512).
-- 
2.39.2


