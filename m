Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92134EF8FF7
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 15:31:54 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20935.1772638311462282034
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Mar 2026 07:31:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: jlu@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1vxoCS-0004uV-Vv; Wed, 04 Mar 2026 16:31:49 +0100
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1vxoCQ-003joC-2C;
	Wed, 04 Mar 2026 16:31:48 +0100
Received: from jlu by dude06.red.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1vxoCR-0000000GJ8x-44NZ;
	Wed, 04 Mar 2026 16:31:47 +0100
From: Jan Luebbe <jlu@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Luebbe <jlu@pengutronix.de>
Subject: [meta-oe][PATCH 1/3] signing.bbclass: remove trailing white space
Date: Wed,  4 Mar 2026 16:31:41 +0100
Message-ID: <20260304153143.3886815-1-jlu@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 15:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124850

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 meta-oe/classes/signing.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bbclass
index b35184398a45..cb54b55641da 100644
--- a/meta-oe/classes/signing.bbclass
+++ b/meta-oe/classes/signing.bbclass
@@ -19,7 +19,7 @@
 # build system level, this class takes the approach of always using PKCS #11 at
 # the recipe level. For cases where the keys are available as files (i.e. test
 # keys in CI), they are imported into SoftHSM (a HSM emulation library).
-# 
+#
 # Recipes access the available keys via a specific role. So, depending on
 # whether we're building during development or for release, a given role can
 # refer to different keys.
@@ -33,7 +33,7 @@
 #   SIGNING_PKCS11_MODULE[fit] = "/usr/lib/x86_64-linux-gnu/opensc-pkcs11.so"
 #
 # Examples for defining roles and importing keys:
-# 
+#
 #   meta-code-signing/recipes-security/signing-keys/dummy-rsa-key-native.bb
 #   meta-code-signing-demo/recipes-security/ptx-dev-keys/ptx-dev-keys-native_git.bb
 #
-- 
2.47.3


