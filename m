Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A48EF8FF8
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 15:31:54 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21080.1772638313406573666
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Mar 2026 07:31:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: jlu@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1vxoCV-0004vQ-VP; Wed, 04 Mar 2026 16:31:51 +0100
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1vxoCU-003joM-1Q;
	Wed, 04 Mar 2026 16:31:51 +0100
Received: from jlu by dude06.red.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1vxoCV-0000000GJ9C-330E;
	Wed, 04 Mar 2026 16:31:51 +0100
From: Jan Luebbe <jlu@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Fabian Pflug <f.pflug@pengutronix.de>,
	Jan Luebbe <jlu@pengutronix.de>
Subject: [meta-oe][PATCH 3/3] signing.bbclass: add signing_create_uri_pem helper function
Date: Wed,  4 Mar 2026 16:31:43 +0100
Message-ID: <20260304153143.3886815-3-jlu@pengutronix.de>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124852

From: Fabian Pflug <f.pflug@pengutronix.de>

The PKCS#11 provider has a mechanism [1] to support older applications
which have not yet migrated to the OSSL_STORE API [2]. It works by
encoding the 'pkcs11:' URI into a PEM file and passing that to an
application as a file. From the application's perspective it loads the
private key from a file, but OpenSSL will transparently use select the
provider to access it via PKCS#11 instead.

Instead of upstream's Python-based tool [3] (which would pull in
asn1crypto as a dependency), we just generate the ASN.1 for the PEM
using OpenSSL's 'asn1parse -genconf'.

It has been tested with RAUC, U-Boot's mkimage (for signed FITs) and
NXP's CST.

[1] https://github.com/latchset/pkcs11-provider/blob/main/docs/provider-pkcs11.7.md#use-in-older-applications-uris-in-pem-files
[2] https://docs.openssl.org/master/man7/ossl_store/
[3] https://github.com/latchset/pkcs11-provider/blob/main/tools/uri2pem.py

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>
---
 meta-oe/classes/signing.bbclass | 34 +++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bbclass
index 70c3807a6dfd..a9f657feb6bb 100644
--- a/meta-oe/classes/signing.bbclass
+++ b/meta-oe/classes/signing.bbclass
@@ -463,6 +463,40 @@ signing_extract_cert_pem() {
     rm "${output}.tmp-der"
 }
 
+# signing_create_uri_pem <role> <pem>
+#
+# Wrap the role's pkcs11: URI in a PEM file.
+# The resulting file can be used instead of the URI returned by
+# 'signing_get_uri $role' with applications which do not yet support the
+# OSSL_STORE for native access to the PKCS#11 provider.
+signing_create_uri_pem() {
+    local role="${1}"
+    local output="${2}"
+    local conf="${output}.cnf"
+    local der="${output}.der"
+
+    local uri="$(signing_get_uri $role)"
+
+    echo "Wrapping PKCS#11 URI for role '$role' as '${output}'"
+
+    # The \# escape prevents OpenSSL's config parser treating # as a comment.
+    cat > "${conf}" <<EOF
+asn1=SEQUENCE:pkcs11_uri_seq
+
+[pkcs11_uri_seq]
+version=VISIBLESTRING:PKCS\#11 Provider URI v1.0
+uri=UTF8:${uri}
+EOF
+
+    openssl asn1parse -genconf "${conf}" -noout -out "${der}"
+
+    {
+        echo "-----BEGIN PKCS#11 PROVIDER URI-----"
+        openssl base64 -in "${der}"
+        echo "-----END PKCS#11 PROVIDER URI-----"
+    } > "${output}"
+}
+
 python () {
     signing_class_prepare(d)
 }
-- 
2.47.3


