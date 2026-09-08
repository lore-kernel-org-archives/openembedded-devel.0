Return-Path: <f.pflug@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04CF5C79FAD
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 11:22:56 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4793.1788866566202258804
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Sep 2026 04:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: f.pflug@pengutronix.de)
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <f.pflug@pengutronix.de>)
	id 1x3tuW-0001f2-0d; Tue, 08 Sep 2026 13:22:44 +0200
From: Fabian Pflug <f.pflug@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH 2/2] fitimage: strip pkcs11: prefix in FITIMAGE_SIGN_KEYDIR example
Date: Tue,  8 Sep 2026 13:22:43 +0200
Message-ID: <20260908112243.1085856-2-f.pflug@pengutronix.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260908112243.1085856-1-f.pflug@pengutronix.de>
References: <20260908112243.1085856-1-f.pflug@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::5c
X-SA-Exim-Mail-From: f.pflug@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Sep 2026 11:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129859

From: Ahmad Fatoum <a.fatoum@pengutronix.de>

Following the example in the comment as-is will lead to an error at
do_fitimage time:

  The key ID is not a valid PKCS#11 URI
  The PKCS#11 URI format is defined by RFC7512
  The key ID is not a valid PKCS#11 URI
  The PKCS#11 URI format is defined by RFC7512
  PKCS11_get_private_key returned NULL
  Failure loading private key from engine: error:40000064:pkcs11 engine::invalid id
  uboot-mkimage Can't add hashes to FIT blob: -1

Strip the pkcs11: prefix to resolve this and save future users the
hassle.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>
---
 meta-oe/classes/fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/classes/fitimage.bbclass b/meta-oe/classes/fitimage.bbclass
index adcfec0f0e..109b3b421b 100644
--- a/meta-oe/classes/fitimage.bbclass
+++ b/meta-oe/classes/fitimage.bbclass
@@ -62,7 +62,7 @@
 #
 #    FITIMAGE_SIGN = "1"
 #    FITIMAGE_MKIMAGE_EXTRA_ARGS = "--engine pkcs11"
-#    FITIMAGE_SIGN_KEYDIR = "${PKCS11_URI}"
+#    FITIMAGE_SIGN_KEYDIR = "${PKCS11_URI#pkcs11:}"
 
 
 LICENSE ?= "MIT"
-- 
2.47.3


