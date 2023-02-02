Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CFC0C61DA4
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 11:31:45 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.12455.1675337494697783818
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Feb 2023 03:31:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1pNXoS-0002i6-4Y; Thu, 02 Feb 2023 12:31:32 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1pNXoP-0029vX-DK; Thu, 02 Feb 2023 12:31:30 +0100
Received: from jlu by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1pNXoP-009FMi-PE; Thu, 02 Feb 2023 12:31:29 +0100
From: Jan Luebbe <jlu@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Jan Luebbe <jlu@pengutronix.de>
Subject: [meta-oe][PATCH] opensc: fix private key import
Date: Thu,  2 Feb 2023 12:31:25 +0100
Message-Id: <20230202113125.2203923-1-jlu@pengutronix.de>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Feb 2023 11:31:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100912

Importing private keys into a PKCS#11 token is broken with OpenSC 0.23.0
and OpenSSL 3. Fix it by backporting the corresponding upstream fixes.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 ...1-pkcs11-tool-Fix-private-key-import.patch | 33 ++++++++++++
 ...g-more-information-on-OpenSSL-errors.patch | 54 +++++++++++++++++++
 .../recipes-support/opensc/opensc_0.23.0.bb   |  2 +
 3 files changed, 89 insertions(+)
 create mode 100644 meta-oe/recipes-support/opensc/files/0001-pkcs11-tool-Fix-private-key-import.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/0002-pkcs11-tool-Log-more-information-on-OpenSSL-errors.patch

diff --git a/meta-oe/recipes-support/opensc/files/0001-pkcs11-tool-Fix-private-key-import.patch b/meta-oe/recipes-support/opensc/files/0001-pkcs11-tool-Fix-private-key-import.patch
new file mode 100644
index 000000000000..e270a8e2e6c6
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/0001-pkcs11-tool-Fix-private-key-import.patch
@@ -0,0 +1,33 @@
+From 6f868bbcd9e65447f459f74381c09d1e315a32f6 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Thu, 1 Dec 2022 20:08:53 +0100
+Subject: [PATCH 1/2] pkcs11-tool: Fix private key import
+
+Upstream-Status: Backport
+---
+ src/tools/pkcs11-tool.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/tools/pkcs11-tool.c b/src/tools/pkcs11-tool.c
+index aae205fe2cd6..cfee8526d5b0 100644
+--- a/src/tools/pkcs11-tool.c
++++ b/src/tools/pkcs11-tool.c
+@@ -3669,13 +3669,13 @@ parse_rsa_pkey(EVP_PKEY *pkey, int private, struct rsakey_info *rsa)
+ 		RSA_get0_factors(r, &r_p, &r_q);
+ 		RSA_get0_crt_params(r, &r_dmp1, &r_dmq1, &r_iqmp);
+ #else
+-		if (EVP_PKEY_get_bn_param(pkey, OSSL_PKEY_PARAM_RSA_FACTOR1, &r_d) != 1 ||
++		if (EVP_PKEY_get_bn_param(pkey, OSSL_PKEY_PARAM_RSA_D, &r_d) != 1 ||
+ 			EVP_PKEY_get_bn_param(pkey, OSSL_PKEY_PARAM_RSA_FACTOR1, &r_p) != 1 ||
+ 			EVP_PKEY_get_bn_param(pkey, OSSL_PKEY_PARAM_RSA_FACTOR2, &r_q) != 1 ||
+ 			EVP_PKEY_get_bn_param(pkey, OSSL_PKEY_PARAM_RSA_EXPONENT1, &r_dmp1) != 1 ||
+ 			EVP_PKEY_get_bn_param(pkey, OSSL_PKEY_PARAM_RSA_EXPONENT2, &r_dmq1) != 1 ||
+-			EVP_PKEY_get_bn_param(pkey, OSSL_PKEY_PARAM_RSA_EXPONENT3, &r_iqmp) != 1) {
+ 			util_fatal("OpenSSL error during RSA private key parsing");
++			EVP_PKEY_get_bn_param(pkey, OSSL_PKEY_PARAM_RSA_COEFFICIENT1, &r_iqmp) != 1) {
+ 		}
+ #endif
+ 		RSA_GET_BN(rsa, private_exponent, r_d);
+-- 
+2.30.2
+
diff --git a/meta-oe/recipes-support/opensc/files/0002-pkcs11-tool-Log-more-information-on-OpenSSL-errors.patch b/meta-oe/recipes-support/opensc/files/0002-pkcs11-tool-Log-more-information-on-OpenSSL-errors.patch
new file mode 100644
index 000000000000..880a13ac6149
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/0002-pkcs11-tool-Log-more-information-on-OpenSSL-errors.patch
@@ -0,0 +1,54 @@
+From 4b5702409e7feea8cb410254285c120c57c10e1b Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Thu, 1 Dec 2022 20:11:41 +0100
+Subject: [PATCH 2/2] pkcs11-tool: Log more information on OpenSSL errors
+
+Upstream-Status: Backport
+---
+ src/tools/pkcs11-tool.c | 15 ++++++---------
+ 1 file changed, 6 insertions(+), 9 deletions(-)
+
+diff --git a/src/tools/pkcs11-tool.c b/src/tools/pkcs11-tool.c
+index cfee8526d5b0..f2e6b1dd91cd 100644
+--- a/src/tools/pkcs11-tool.c
++++ b/src/tools/pkcs11-tool.c
+@@ -3641,10 +3641,8 @@ parse_rsa_pkey(EVP_PKEY *pkey, int private, struct rsakey_info *rsa)
+ 	const BIGNUM *r_dmp1, *r_dmq1, *r_iqmp;
+ 	r = EVP_PKEY_get1_RSA(pkey);
+ 	if (!r) {
+-		if (private)
+-			util_fatal("OpenSSL error during RSA private key parsing");
+-		else
+-			util_fatal("OpenSSL error during RSA public key parsing");
++		util_fatal("OpenSSL error during RSA %s key parsing: %s", private ? "private" : "public",
++			ERR_error_string(ERR_peek_last_error(), NULL));
+ 	}
+ 
+ 	RSA_get0_key(r, &r_n, &r_e, NULL);
+@@ -3654,10 +3652,8 @@ parse_rsa_pkey(EVP_PKEY *pkey, int private, struct rsakey_info *rsa)
+ 	BIGNUM *r_dmp1 = NULL, *r_dmq1 = NULL, *r_iqmp = NULL;
+ 	if (EVP_PKEY_get_bn_param(pkey, OSSL_PKEY_PARAM_RSA_N, &r_n) != 1 ||
+ 		EVP_PKEY_get_bn_param(pkey, OSSL_PKEY_PARAM_RSA_E, &r_e) != 1) {
+-		if (private)
+-			util_fatal("OpenSSL error during RSA private key parsing");
+-		else
+-			util_fatal("OpenSSL error during RSA public key parsing");
++		util_fatal("OpenSSL error during RSA %s key parsing: %s", private ? "private" : "public",
++			ERR_error_string(ERR_peek_last_error(), NULL));
+ 	 }
+ #endif
+ 	RSA_GET_BN(rsa, modulus, r_n);
+@@ -3674,8 +3670,9 @@ parse_rsa_pkey(EVP_PKEY *pkey, int private, struct rsakey_info *rsa)
+ 			EVP_PKEY_get_bn_param(pkey, OSSL_PKEY_PARAM_RSA_FACTOR2, &r_q) != 1 ||
+ 			EVP_PKEY_get_bn_param(pkey, OSSL_PKEY_PARAM_RSA_EXPONENT1, &r_dmp1) != 1 ||
+ 			EVP_PKEY_get_bn_param(pkey, OSSL_PKEY_PARAM_RSA_EXPONENT2, &r_dmq1) != 1 ||
+-			util_fatal("OpenSSL error during RSA private key parsing");
+ 			EVP_PKEY_get_bn_param(pkey, OSSL_PKEY_PARAM_RSA_COEFFICIENT1, &r_iqmp) != 1) {
++			util_fatal("OpenSSL error during RSA private key parsing: %s",
++				ERR_error_string(ERR_peek_last_error(), NULL));
+ 		}
+ #endif
+ 		RSA_GET_BN(rsa, private_exponent, r_d);
+-- 
+2.30.2
+
diff --git a/meta-oe/recipes-support/opensc/opensc_0.23.0.bb b/meta-oe/recipes-support/opensc/opensc_0.23.0.bb
index b0f147c798d0..f68107df87ab 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.23.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.23.0.bb
@@ -14,6 +14,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cb8aedd3bced19bd8026d96a8b6876d7"
 #v0.21.0
 SRCREV = "5497519ea6b4af596628f8f8f2f904bacaa3148f"
 SRC_URI = "git://github.com/OpenSC/OpenSC;branch=master;protocol=https \
+           file://0001-pkcs11-tool-Fix-private-key-import.patch \
+           file://0002-pkcs11-tool-Log-more-information-on-OpenSSL-errors.patch \
           "
 DEPENDS = "virtual/libiconv openssl"
 
-- 
2.30.2


