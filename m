Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD8AEEF8FF9
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 15:31:54 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20936.1772638312597429961
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Mar 2026 07:31:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: jlu@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1vxoCV-0004v9-5K; Wed, 04 Mar 2026 16:31:51 +0100
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1vxoCT-003joI-23;
	Wed, 04 Mar 2026 16:31:50 +0100
Received: from jlu by dude06.red.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1vxoCU-0000000GJ95-3rux;
	Wed, 04 Mar 2026 16:31:50 +0100
From: Jan Luebbe <jlu@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Fabian Pflug <f.pflug@pengutronix.de>,
	Jan Luebbe <jlu@pengutronix.de>
Subject: [meta-oe][PATCH 2/3] signing.bbclass: add support for OpenSSL PKCS#11 provider
Date: Wed,  4 Mar 2026 16:31:42 +0100
Message-ID: <20260304153143.3886815-2-jlu@pengutronix.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304153143.3886815-1-jlu@pengutronix.de>
References: <20260304153143.3886815-1-jlu@pengutronix.de>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124851

From: Fabian Pflug <f.pflug@pengutronix.de>

OpenSSL 4.0 will drop support for engines and use providers instead.

To access SoftHSM and other PKCS#11 modules via the provider API, we
rely on https://github.com/latchset/pkcs11-provider, which is already
available as via pkcs11-provider recipe.

We enable this provider by using a specific OpenSSL config when signing.
This means that recipes inheriting this class can decide whether they
want to use the engine or provider to access the key.

SoftHSM seems to produce broken keys when calling the C_CopyObject, so
disable caching in the provider for now.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>
---
 meta-oe/classes/signing.bbclass | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bbclass
index cb54b55641da..70c3807a6dfd 100644
--- a/meta-oe/classes/signing.bbclass
+++ b/meta-oe/classes/signing.bbclass
@@ -54,7 +54,7 @@
 SIGNING_PKCS11_URI ?= ""
 SIGNING_PKCS11_MODULE ?= ""
 
-DEPENDS += "softhsm-native libp11-native opensc-native openssl-native extract-cert-native"
+DEPENDS += "softhsm-native pkcs11-provider-native libp11-native opensc-native openssl-native extract-cert-native"
 
 def signing_class_prepare(d):
     import os.path
@@ -338,16 +338,10 @@ signing_import_install() {
 signing_prepare() {
     export OPENSSL_MODULES="${STAGING_LIBDIR_NATIVE}/ossl-modules"
     export OPENSSL_ENGINES="${STAGING_LIBDIR_NATIVE}/engines-3"
-    export OPENSSL_CONF="${STAGING_LIBDIR_NATIVE}/ssl-3/openssl.cnf"
+    export OPENSSL_CONF="${STAGING_LIBDIR_NATIVE}/openssl-provider-signing.cnf"
     export SSL_CERT_DIR="${STAGING_LIBDIR_NATIVE}/ssl-3/certs"
     export SSL_CERT_FILE="${STAGING_LIBDIR_NATIVE}/ssl-3/cert.pem"
 
-    if [ -f ${OPENSSL_CONF} ]; then
-        echo "Using '${OPENSSL_CONF}' for OpenSSL configuration"
-    else
-        echo "Missing 'openssl.cnf' at '${STAGING_ETCDIR_NATIVE}/ssl'"
-        return 1
-    fi
     if [ -d ${OPENSSL_MODULES} ]; then
         echo "Using '${OPENSSL_MODULES}' for OpenSSL run-time modules"
     else
@@ -367,6 +361,26 @@ signing_prepare() {
     echo "directories.tokendir = $SOFTHSM2_DIR" > "$SOFTHSM2_CONF"
     echo "objectstore.backend = db" >> "$SOFTHSM2_CONF"
 
+    cat > "${OPENSSL_CONF}" <<EOF
+openssl_conf = openssl_init
+
+[openssl_init]
+providers = provider_sect
+
+[provider_sect]
+default = default_sect
+pkcs11 = pkcs11_sect
+
+[default_sect]
+activate = 1
+
+[pkcs11_sect]
+pkcs11-module-quirks = no-operation-state no-deinit
+pkcs11-module-cache-keys = false
+pkcs11-module-encode-provider-uri-to-pem = true
+activate = 1
+EOF
+
     for env in $(ls "${STAGING_DIR_NATIVE}/var/lib/meta-signing.env.d"); do
         . "${STAGING_DIR_NATIVE}/var/lib/meta-signing.env.d/$env"
     done
@@ -378,6 +392,8 @@ signing_use_role() {
     local role="${1}"
 
     export PKCS11_MODULE_PATH="$(signing_get_module $role)"
+    export PKCS11_PROVIDER_MODULE="$PKCS11_MODULE_PATH"
+    # export PKCS11_PROVIDER_DEBUG="file:/dev/stderr"
     export PKCS11_URI="$(signing_get_uri $role)"
 
     if [ -z "$PKCS11_MODULE_PATH" ]; then
-- 
2.47.3


