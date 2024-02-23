Return-Path: <sha@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF3C5C48BC4
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 08:45:55 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.6668.1708677949472110679
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Feb 2024 00:45:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: sha@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1rdRBj-0000Fi-Kt; Fri, 23 Feb 2024 09:45:47 +0100
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sha@pengutronix.de>)
	id 1rdRBi-002OGd-UK; Fri, 23 Feb 2024 09:45:46 +0100
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1rdRBi-007WkZ-2e;
	Fri, 23 Feb 2024 09:45:46 +0100
From: Sascha Hauer <sha@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Luebbe <jlu@pengutronix.de>,
	Sascha Hauer <sha@pengutronix.de>,
	Miklos Toth <Miklos.Toth@knorr-bremse.com>
Subject: [meta-oe][PATCH] signing.bbclass: fix wrong function name
Date: Fri, 23 Feb 2024 09:45:44 +0100
Message-Id: <20240223084544.1793722-1-sha@pengutronix.de>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 08:45:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109008

The function signing_import_pubkey_from_pem is defined twice, one of
them should really be named signing_import_pubkey_from_der. Fix this and
while at it fix some argument names in the comments above the functions
as well.

Reported-by: Miklos Toth <Miklos.Toth@knorr-bremse.com>
Fixes: 4a6ac691f ("add signing.bbclass as infrastructure for build artifact signing")
Signed-off-by: Sascha Hauer <sha@pengutronix.de>
---
 meta-oe/classes/signing.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bbclass
index 553d74e28..ec076d968 100644
--- a/meta-oe/classes/signing.bbclass
+++ b/meta-oe/classes/signing.bbclass
@@ -142,10 +142,10 @@ signing_import_cert_from_pem() {
     signing_pkcs11_tool --type cert --write-object /proc/self/fd/0 --label "${role}"
 }
 
-# signing_import_pubkey_from_der <role> <pem>
+# signing_import_pubkey_from_der <role> <der>
 #
 # Import a public key from DER file to a role. To be used with SoftHSM.
-signing_import_pubkey_from_pem() {
+signing_import_pubkey_from_der() {
     local role="${1}"
     local der="${2}"
 
@@ -171,7 +171,7 @@ signing_import_pubkey_from_pem() {
     signing_pkcs11_tool --type pubkey --write-object /proc/self/fd/0 --label "${role}"
 }
 
-# signing_import_privkey_from_der <role> <pem>
+# signing_import_privkey_from_der <role> <der>
 #
 # Import a private key from DER file to a role. To be used with SoftHSM.
 signing_import_privkey_from_der() {
-- 
2.39.2


