Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F954C7115B
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 12:47:14 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.14022.1750337228697892767
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Jun 2025 05:47:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1uSEfb-0006sG-7H; Thu, 19 Jun 2025 14:47:07 +0200
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1uSEfa-004Inx-35;
	Thu, 19 Jun 2025 14:47:06 +0200
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1uSEfa-00CKU2-2t;
	Thu, 19 Jun 2025 14:47:06 +0200
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Jan=20L=C3=BCbbe?= <jlu@pengutronix.de>,
	johannes.schneider@leica-geosystems.com,
	yocto@pengutronix.de
Subject: [PATCH] signing.bbclass: make PEM loading compatible with OpenSC 0.26.0
Date: Thu, 19 Jun 2025 14:46:41 +0200
Message-Id: <20250619124641.2934463-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Jun 2025 12:47:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117946

With https://github.com/OpenSC/OpenSC/pull/3174 which is part of 0.26.0,
OpenSC does not support reading (DER) data from stdin anymore.

However, OpenSC/pkcs11-tool also supports reading PEM files directly.
This we can use for simply replacing and simplifying the stdin piping in
signing_import_cert_from_pem().

Only for password-protected files we still have to use OpenSSL for
conversion, since OpenSC/pkcs11-tool currently doesn't have a mechanism
for providing passwords.
For these cases, we store the converted PEM into a simple temporary
file. This handling is sufficient, since SoftHSM import should be used
for example keys only and SoftHSM also doesn't protect the keys in any
way. Keys which actually need to be protected are stored in HSMs and
accessed via their PKCS#11 URIs.

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 meta-oe/classes/signing.bbclass | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bbclass
index 8af7bbf8e0..8c7daa2391 100644
--- a/meta-oe/classes/signing.bbclass
+++ b/meta-oe/classes/signing.bbclass
@@ -172,9 +172,7 @@ signing_import_cert_from_pem() {
     local role="${1}"
     local pem="${2}"
 
-    openssl x509 \
-        -in "${pem}" -inform pem -outform der |
-    signing_pkcs11_tool --type cert --write-object /proc/self/fd/0 --label "${role}"
+    signing_pkcs11_tool --type cert --write-object ${pem} --label "${role}"
 }
 
 # signing_import_pubkey_from_der <role> <der>
@@ -198,12 +196,12 @@ signing_import_pubkey_from_pem() {
     if [ -n "${IMPORT_PASS_FILE}" ]; then
         openssl pkey \
             -passin "file:${IMPORT_PASS_FILE}" \
-            -in "${pem}" -inform pem -pubout -outform der
+            -in "${pem}" -inform pem -pubout -outform der -out ${B}/pubkey_out.pem
     else
         openssl pkey \
-            -in "${pem}" -inform pem -pubout -outform der
-    fi |
-    signing_pkcs11_tool --type pubkey --write-object /proc/self/fd/0 --label "${role}"
+            -in "${pem}" -inform pem -pubout -outform der -out ${B}/pubkey_out.pem
+    fi
+    signing_pkcs11_tool --type pubkey --write-object ${B}/pubkey_out.pem --label "${role}"
 }
 
 # signing_import_privkey_from_der <role> <der>
@@ -226,12 +224,11 @@ signing_import_privkey_from_pem() {
     if [ -n "${IMPORT_PASS_FILE}" ]; then
         openssl pkey \
             -passin "file:${IMPORT_PASS_FILE}" \
-            -in "${pem}" -inform pem -outform der
+            -in "${pem}" -inform pem -outform der -out ${B}/privkey_out.pem
+        signing_pkcs11_tool --type privkey --write-object ${B}/privkey_out.pem --label "${role}"
     else
-        openssl pkey \
-            -in "${pem}" -inform pem -outform der
-    fi |
-    signing_pkcs11_tool --type privkey --write-object /proc/self/fd/0 --label "${role}"
+        signing_pkcs11_tool --type privkey --write-object ${pem} --label "${role}"
+    fi
 }
 
 # signing_import_key_from_pem <role> <pem>
-- 
2.39.5


