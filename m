Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F08C04FF9
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 19:57:40 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.41293.1695220487790623436
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Sep 2023 07:34:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: afa@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <afa@pengutronix.de>)
	id 1qiyHu-00084o-1D; Wed, 20 Sep 2023 16:34:46 +0200
Received: from [2a0a:edc0:0:1101:1d::54] (helo=dude05.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <afa@pengutronix.de>)
	id 1qiyHt-007iAu-L5; Wed, 20 Sep 2023 16:34:45 +0200
Received: from afa by dude05.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <afa@pengutronix.de>)
	id 1qiyHt-000aGi-1x;
	Wed, 20 Sep 2023 16:34:45 +0200
From: "Ahmad Fatoum" <a.fatoum@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: yocto@pengutronix.de,
	jlu@pengutronix.de,
	str@pengutronix.de,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [meta-oe][PATCH] signing.bbclass: don't export OPENSSL environment variables globally
Date: Wed, 20 Sep 2023 16:33:41 +0200
Message-Id: <20230920143340.135812-1-a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: afa@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 19:57:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105028

OPENSSL_{MODULES,ENGINES,CONF} and SSL_CERT_{DIR,FILE} are currently
exported globally for any recipe that inherits signing. This not only
affects the tasks that use the signing infrastructure, but also unrelated
tasks like e.g. do_fetch. Avoid this by exporting the variables only
for these tasks that actually call signing_prepare.

This resolves a breakage I observed on Ubuntu 18.04, where the host
tool wget is called with the environment variables set and then fails
with a SSL error (exit code 5).

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 meta-oe/classes/signing.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bbclass
index 5c74a319e4f9..79944e3fe91c 100644
--- a/meta-oe/classes/signing.bbclass
+++ b/meta-oe/classes/signing.bbclass
@@ -224,6 +224,12 @@ signing_import_install() {
 }
 
 signing_prepare() {
+    export OPENSSL_MODULES="${STAGING_LIBDIR_NATIVE}/ossl-modules"
+    export OPENSSL_ENGINES="${STAGING_LIBDIR_NATIVE}/engines-3"
+    export OPENSSL_CONF="${STAGING_LIBDIR_NATIVE}/ssl-3/openssl.cnf"
+    export SSL_CERT_DIR="${STAGING_LIBDIR_NATIVE}/ssl-3/certs"
+    export SSL_CERT_FILE="${STAGING_LIBDIR_NATIVE}/ssl-3/cert.pem"
+
     if [ -f ${OPENSSL_CONF} ]; then
         echo "Using '${OPENSSL_CONF}' for OpenSSL configuration"
     else
@@ -308,9 +314,3 @@ signing_get_module() {
 python () {
     signing_class_prepare(d)
 }
-
-export OPENSSL_MODULES="${STAGING_LIBDIR_NATIVE}/ossl-modules"
-export OPENSSL_ENGINES="${STAGING_LIBDIR_NATIVE}/engines-3"
-export OPENSSL_CONF="${STAGING_LIBDIR_NATIVE}/ssl-3/openssl.cnf"
-export SSL_CERT_DIR="${STAGING_LIBDIR_NATIVE}/ssl-3/certs"
-export SSL_CERT_FILE="${STAGING_LIBDIR_NATIVE}/ssl-3/cert.pem"
-- 
2.39.2


