Return-Path: <sha@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BDD7C48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 09:18:33 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.7878.1707815904568499927
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Feb 2024 01:18:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: sha@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1rZovn-0004b5-2y; Tue, 13 Feb 2024 10:18:23 +0100
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sha@pengutronix.de>)
	id 1rZovm-000SB2-MU; Tue, 13 Feb 2024 10:18:22 +0100
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1rZovm-00AYEg-1t;
	Tue, 13 Feb 2024 10:18:22 +0100
From: Sascha Hauer <sha@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [meta-oe][PATCH] signing.bbclass: make it work with eliptic curve keys
Date: Tue, 13 Feb 2024 10:18:12 +0100
Message-Id: <20240213091812.2512963-1-sha@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Feb 2024 09:18:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108724

From: Sascha Hauer <s.hauer@pengutronix.de>

"openssl rsa" works with RSA keys only. Use "openssl pkey" instead which
is a frontend that picks the right operation automatically and works
with RSA keys, eliptic curve keys and also DSA keys.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 meta-oe/classes/signing.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bbclass
index 79944e3fe..553d74e28 100644
--- a/meta-oe/classes/signing.bbclass
+++ b/meta-oe/classes/signing.bbclass
@@ -161,11 +161,11 @@ signing_import_pubkey_from_pem() {
     local pem="${2}"
 
     if [ -n "${IMPORT_PASS_FILE}" ]; then
-        openssl rsa \
+        openssl pkey \
             -passin "file:${IMPORT_PASS_FILE}" \
             -in "${pem}" -inform pem -pubout -outform der
     else
-        openssl rsa \
+        openssl pkey \
             -in "${pem}" -inform pem -pubout -outform der
     fi |
     signing_pkcs11_tool --type pubkey --write-object /proc/self/fd/0 --label "${role}"
@@ -189,11 +189,11 @@ signing_import_privkey_from_pem() {
     local pem="${2}"
 
     if [ -n "${IMPORT_PASS_FILE}" ]; then
-        openssl rsa \
+        openssl pkey \
             -passin "file:${IMPORT_PASS_FILE}" \
             -in "${pem}" -inform pem -outform der
     else
-        openssl rsa \
+        openssl pkey \
             -in "${pem}" -inform pem -outform der
     fi |
     signing_pkcs11_tool --type privkey --write-object /proc/self/fd/0 --label "${role}"
-- 
2.39.2


