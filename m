Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F3ACA9EBD
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 11:28:15 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25289.1791718089929937501
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Oct 2026 04:28:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=eeU61v7A;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.69.33, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lEejnLltsaUziWPpVQmu/vf/8pHov/wZqGiGY7PL2l1iFMK23w2TJubZCygGfnk3Dj+dtjnOKS1Ae5RkPRoG2WxzaDFS35rQ3HMANtQNoTPKiFZ8wGRwXG8a1fEcqqOT8YZimeUojl8mto9JXYrDNbOO+0jqWtzltxJnQjF2jBeN98DXrn7ZqRFDTfxjKwLc4ig3SnfnJBzo2SS1BSHM30ShXaUZMtUi4Q264TezFPVlKBlzH3Eh13g5KIzGrR2wHUK8ftFVshGkdqDyL0NqTXJ64yIuPofEBGEevVE8QbcFrfy6PzUdpL5Z18uzec9duKuspQIe9y3ot7cvaqO1sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dbIiRXj8omgZlX5O+bxxzJJU55DVYb78SiGaM1C/yCk=;
 b=S83lQ7+7hZaYepNuIzlrq2AEUyNFWuin8ma6N70PSxfH/3LXa9bbzsdwXNx74Q9qfIcP/4n6aTbL3JIPjtg+t4qhASu6oArUwp+4iZYqkwsQuGn95GF0n3cStPHMZSZV4mJgEJNKJWSaNc2DUrb/sjF5z+sljL3kpN5Yz8H7M/ZK/TcjO1Ytfn/Aj5l3KS4ZUSix+9kEfSLvhriVSobP1u9L/a6ErQtO22ycA5gh0EG6FFeuS3UPHw90JSLWxcBEiXamYWfQvbq7IE60P4uBQSqo8GFteLO0CSE0/11+ct5gf7rU5OgUpcUcxIcG5Ua4WZjZDUaWn1n84R5QK9EdwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dbIiRXj8omgZlX5O+bxxzJJU55DVYb78SiGaM1C/yCk=;
 b=eeU61v7Anf63aRnXMAL5LKuxP3zuXGKGGtno+Qm20jzN08AYEPvGG7G8wYaFT8YIkGs5pJsMAPRZ+kGcYXk5NM+G6Ov4jjGTsR/kH8R3bOfsnmBfC7A++8m1BE5LUxuSsiuD2Mk9Avkfxu/wAWdKMEi6vSUmGxeLiUTbO1Yuh64=
Received: from DU7P191CA0017.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::25)
 by AM0PR06MB6530.eurprd06.prod.outlook.com (2603:10a6:208:196::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.18; Sun, 11 Oct
 2026 11:28:04 +0000
Received: from DB1PEPF000509E2.eurprd03.prod.outlook.com
 (2603:10a6:10:54e:cafe::8c) by DU7P191CA0017.outlook.office365.com
 (2603:10a6:10:54e::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Sun, 11
 Oct 2026 11:28:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 193.8.40.99) smtp.mailfrom=leica-geosystems.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none
 header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DB1PEPF000509E2.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sun, 11 Oct 2026 11:28:03 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Sun, 11 Oct 2026 13:28:02 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org,
	khem.raj@oss.qualcomm.com
CC: festevam@gmail.com,
	Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [meta-oe][PATCH v1] imx-cst: restore PKCS#11 signing on OpenSSL 4 via the provider
Date: Sun, 11 Oct 2026 11:28:01 +0000
Message-ID: <20261011112801.1577055-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 11 Oct 2026 11:28:02.0726 (UTC) FILETIME=[93D45460:01DD5973]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E2:EE_|AM0PR06MB6530:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e5b86e8d-4207-41b6-d6ff-08df278ab68e
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|11063799006|56012099006|18002099003|6133799003|260925022911599003|260925021911599003|260925021311599003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	f81O81C4+rPgMPl59I9jsjDlDQ/nt5OXFhX/wrv+vLIvtJ9abQYVfQ0SVRPgvJpmM4TUmm1aax35ANNJyfnZo/XnyhDTI/xkUCLyX2BXoATyRZEhMzpDopfL7xA3pFxyDF0TZ+jnXkzkGEWMpGnKv8FzwRjLnqN/6V2e5FV5ccsx9pQNASJ/pBiWBdVOFW41xcfJ8fkf7rmgV1psXpC7tvuaTtO1Wlo9VgqPCRGa4gqvjF6bFFSnvOAxONgXaficO/HTyrp1ZVowFQGUhoYJsGx7QEG5S79TZ4QKJDT3EB0t5Q2kl5Q4HrrOHpPPV3tCYZamxyHlWLmtRbF00+RsWFFD/uiOJCnMZm/An+RUWWh+R4DrQ0Pc0XDMme/kIem+3UiQn/ZehHRfUgRIMTBWAfFs1Xg1jPTQPSjF2I12xR43cSa+1zTOCqqsyBRjWyYBPLtNBPKshPyiDqdtat4O+7Hc4UBUzrjAqs6tRwpdceQcTduHX2SnlYhP0ssvkMaHJsldv8iF7t9ww2v6tcNjvPYE1qiEnM23n328BsPkr/kFAIgYBrjEacEMRwBPU7TT4Rm+v49ZFMtLA7JYBiFsPPi3x+Xou3JVcnLEf+WH6k1xbTeuvpgLDjsPViXhIhTG6cSq5avmwiFu30HMo0nXTJcb21ps/u+wUwAZ+irBb2V7x9SX/GBtg8p/xWoTDJtoVjt5oOqgwGZzFcZBmfW4Iw==
X-Forefront-Antispam-Report: 
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003)(6133799003)(260925022911599003)(260925021911599003)(260925021311599003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	hfzhW+Ttg8xyST8xHrCRL/dgQa0n6RkHO7Q8tDuKPKYau1UbEC+Z7GQFsLdsbRdvbr2dLEwT720+/0u0imhsSBP/ue0RuPY0HyyDzDeAtYiV8gbbGN3QXqGl/C/cKGjOIzHrd9DMXWc4/j/tzoEqBS15yLlf3kqW5X8zVu/Zcq9ZdvwPMhqi0+H81mpPu1qzg8MoVCXf2cmPNRtRtkFoNH/jiq9SqXTd6aa9ByohrkKfGoucYUVYAXDA8Nm7mIqHQqqddi+NTi14SjYpNAmpOZPf4l7MJx8OCqB+RpVoZ1bdg8viiIWtd8B++phnSTH/G1eoA3Mc0qOtcn/vCxKQVA+hQxXZG5peqM+uleJcQprZocsIwKD5I/+bK2+UBr1xeCdYYY/xnXd5i9nXh/Mfl3W++rEoGmmn6Z//6p5C/Ggy86t4GsZB1guANb8pkTpo
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2026 11:28:03.0770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b86e8d-4207-41b6-d6ff-08df278ab68e
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB6530
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 11 Oct 2026 11:28:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130725

0015-fix-openssl-4-engine-api-removal made CST build against OpenSSL 4 by
stubbing out the removed ENGINE API, but left PKCS#11-backed signing broken=
:
ENGINE_by_id("pkcs11") returns NULL, so engine_ctx_init() fails. Add a patc=
h
that reimplements the pkcs11 certificate and key loading on OSSL_STORE and =
the
pkcs11 provider (pkcs11-provider), restoring HSM/token-backed signing on
OpenSSL 4. OpenSSL 3 builds are unaffected.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 ...cs11-signing-from-engine-to-provider.patch | 236 ++++++++++++++++++
 .../recipes-support/imx-cst/imx-cst_4.0.1.bb  |   1 +
 2 files changed, 237 insertions(+)
 create mode 100644 meta-oe/recipes-support/imx-cst/imx-cst/0017-cst-port-p=
kcs11-signing-from-engine-to-provider.patch

diff --git a/meta-oe/recipes-support/imx-cst/imx-cst/0017-cst-port-pkcs11-s=
igning-from-engine-to-provider.patch b/meta-oe/recipes-support/imx-cst/imx-=
cst/0017-cst-port-pkcs11-signing-from-engine-to-provider.patch
new file mode 100644
index 0000000000..699402a447
--- /dev/null
+++ b/meta-oe/recipes-support/imx-cst/imx-cst/0017-cst-port-pkcs11-signing-=
from-engine-to-provider.patch
@@ -0,0 +1,236 @@
+From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
+Subject: cst: port pkcs11 signing from the OpenSSL ENGINE to a provider
+
+OpenSSL 4.0 removed the ENGINE API, so CST's pkcs11-backed signing stops
+working: ENGINE_by_id("pkcs11") returns NULL and engine_ctx_init() fails.
+
+Reimplement the pkcs11 certificate and key loading on OSSL_STORE and the
+pkcs11 provider. engine_ctx_init() loads the default and pkcs11 providers =
--
+default explicitly, because activating any provider stops OpenSSL
+auto-loading default, which would drop the EVP digest and signature algori=
thms
+the signer needs. ENGINE_load_certificate()/ENGINE_load_key() open the pkc=
s11
+URI through OSSL_STORE and return the X509 / EVP_PKEY, feeding the existin=
g CMS
+and EVP signing unchanged. The public entry points keep their names and
+signatures; the ENGINE * argument is now vestigial. The PIN travels in the=
 URI
+(pin-value=3D).
+
+Upstream-Status: Pending
+Assisted-by: Claude:claude-opus-4-8
+Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com=
>
+---
+Builds on the engine-stub change already in this recipe's series
+(0015-fix-openssl-4-engine-api-removal), which only makes the file compile=
 and
+noted that pkcs11-backed signing was still unavailable on OpenSSL 4; this
+restores it.
+--- a/src/lib/back_end/engine.c
++++ b/src/lib/back_end/engine.c
+@@ -7,8 +7,9 @@
+ /*
+  * OpenSSL 4.0 removed the ENGINE API.  <openssl/engine.h> still declares
+  * it for source compatibility, and defining OPENSSL_ENGINE_STUBS turns t=
he
+- * declarations into inline no-ops so this file keeps linking.  The pkcs1=
1
+- * engine simply does not exist there, which engine_ctx_init() reports.
++ * declarations into inline no-ops so this file keeps linking.  Signing n=
o
++ * longer uses an engine (see engine_ctx_init); the vestigial ENGINE * on=
ly
++ * keeps the public entry points' signatures unchanged.
+  */
+ #define OPENSSL_ENGINE_STUBS
+=20
+@@ -19,6 +20,8 @@
+ #include <openssl/err.h>
+ #include <openssl/x509.h>
+ #include <openssl/evp.h>
++#include <openssl/provider.h>
++#include <openssl/store.h>
+ #include <stdint.h>
+=20
+ #if CST_WITH_PKCS11
+@@ -31,6 +34,76 @@
+ }
+ #endif
+=20
++/* Load default and pkcs11 once; "default" explicitly, or activating pkcs=
11 stops OpenSSL auto-loading it and the signer loses its EVP algorithms. *=
/
++static int load_providers(void)
++{
++	static int loaded;
++
++	if (loaded)
++		return 1;
++
++	if (!OSSL_PROVIDER_load(NULL, "default")) {
++		fprintf(stderr, "ERROR: cannot load the default OpenSSL provider\n");
++		return 0;
++	}
++	if (!OSSL_PROVIDER_load(NULL, "pkcs11")) {
++		fprintf(stderr, "ERROR: cannot load the pkcs11 OpenSSL provider; "
++			"is pkcs11-provider installed and OPENSSL_MODULES set?\n");
++		return 0;
++	}
++
++	loaded =3D 1;
++	return 1;
++}
++
++/* Load a certificate and/or key from a PKCS#11 (or any OSSL_STORE) URI; =
returns 1 only if every requested object was found. */
++static int store_load(const char *uri, X509 **cert_out, EVP_PKEY **key_ou=
t)
++{
++	OSSL_STORE_CTX *store =3D NULL;
++	int ok =3D 0;
++
++	if (!uri)
++		return 0;
++
++	store =3D OSSL_STORE_open(uri, NULL, NULL, NULL, NULL);
++	if (!store) {
++		fprintf(stderr, "ERROR: cannot open PKCS#11 store for %s\n", uri);
++		return 0;
++	}
++
++	while (!OSSL_STORE_eof(store)) {
++		OSSL_STORE_INFO *info =3D OSSL_STORE_load(store);
++
++		if (!info) {
++			/* NULL means EOF or a non-fatal error; break on the error flag, or a =
bad object spins forever (eof stays 0). */
++			if (OSSL_STORE_error(store))
++				break;
++			continue;
++		}
++
++		switch (OSSL_STORE_INFO_get_type(info)) {
++		case OSSL_STORE_INFO_CERT:
++			if (cert_out && !*cert_out)
++				*cert_out =3D OSSL_STORE_INFO_get1_CERT(info);
++			break;
++		case OSSL_STORE_INFO_PKEY:
++			if (key_out && !*key_out)
++				*key_out =3D OSSL_STORE_INFO_get1_PKEY(info);
++			break;
++		default:
++			break;
++		}
++		OSSL_STORE_INFO_free(info);
++
++		if ((!cert_out || *cert_out) && (!key_out || *key_out))
++			break;
++	}
++
++	OSSL_STORE_close(store);
++	ok =3D (!cert_out || *cert_out) && (!key_out || *key_out);
++	return ok;
++}
++
+ struct engine_ctx *engine_ctx_new(void)
+ {
+     struct engine_ctx *ctx =3D NULL;
+@@ -41,16 +114,13 @@
+=20
+ int32_t engine_ctx_destroy(struct engine_ctx *ctx)
+ {
+-	if (ctx) {
+-		ENGINE_free(ctx->engine);
++	if (ctx)
+ 		OPENSSL_free(ctx);
+-	}
+ 	return 1;
+ }
+=20
+ int32_t engine_ctx_init(struct engine_ctx *ctx)
+ {
+-    dynamic_fns fns;
+     /* OpenSSL Initialization */
+ #if OPENSSL_VERSION_NUMBER >=3D 0x10100000
+ 	OPENSSL_init_crypto(OPENSSL_INIT_ADD_ALL_CIPHERS |
+@@ -66,60 +136,46 @@
+=20
+ 	ERR_clear_error();
+=20
+-	ENGINE_load_builtin_engines();
+-
+-	ctx->engine =3D ENGINE_by_id("pkcs11");
+-
+-	if (!ctx->engine) {
+-		fprintf(stderr, "ERROR: cannot load the pkcs11 OpenSSL engine\n");
+-#if OPENSSL_VERSION_MAJOR >=3D 4
+-		fprintf(stderr,
+-			"ERROR: OpenSSL 4.0 removed ENGINE support, so PKCS#11 "
+-			"backed signing is unavailable\n");
+-#endif
++	if (!load_providers())
+ 		return 0;
+-	}
+=20
+-#ifdef DEBUG
+-	ENGINE_ctrl_cmd_string(ctx->engine, "VERBOSE", NULL, 0);
+-#endif
+-
+-	if (!ENGINE_init(ctx->engine)) {
+-		ENGINE_free(ctx->engine);
+-		return 0;
+-	}
++	ctx->engine =3D NULL;
+=20
+ 	return 1;
+ }
+=20
+ int32_t engine_ctx_finish(struct engine_ctx *ctx)
+ {
+-	if (ctx)
+-		ENGINE_finish(ctx->engine);
++	(void)ctx;
+ 	return 1;
+ }
+=20
+ X509 *ENGINE_load_certificate(ENGINE *e, const char *cert_ref)
+ {
+-	struct {
+-		const char *s_slot_cert_id;
+-		X509 *cert;
+-	} params =3D {0};
++	X509 *cert =3D NULL;
+=20
+-	params.s_slot_cert_id =3D cert_ref;
+-	params.cert =3D NULL;
++	(void)e;
+=20
+-	if (!ENGINE_ctrl_cmd(e, "LOAD_CERT_CTRL", 0, &params, NULL, 1)) {
++	if (!store_load(cert_ref, &cert, NULL)) {
+ 		ERR_print_errors_fp(stderr);
+ 		return NULL;
+ 	}
+=20
+-	return params.cert;
++	return cert;
+ }
+=20
+ EVP_PKEY *ENGINE_load_key(ENGINE *e, const char *key_ref)
+ {
+-	return ENGINE_load_private_key(e, key_ref, 0, 0);
++	EVP_PKEY *key =3D NULL;
++
++	(void)e;
++
++	if (!store_load(key_ref, NULL, &key)) {
++		ERR_print_errors_fp(stderr);
++		return NULL;
++	}
++
++	return key;
+ }
+=20
+ X509 *engine_read_certificate(const char *cert_ref)
+@@ -161,14 +217,8 @@
+ #endif
+=20
+ out:
+-	if (ctx) {
+-	/*
+-	 * Destroy the context: ctx_finish is not called here since
+-	 * ENGINE_finish cleanups the engine instance. Calling ctx_destroy
+-	 * next will lead to null pointer dereference.
+-	 */
++	if (ctx)
+ 		engine_ctx_destroy(ctx);
+-	}
+=20
+ 	if (error)
+ 		ERR_print_errors_fp(stderr);
diff --git a/meta-oe/recipes-support/imx-cst/imx-cst_4.0.1.bb b/meta-oe/rec=
ipes-support/imx-cst/imx-cst_4.0.1.bb
index ec6838e95d..3a0f717440 100644
--- a/meta-oe/recipes-support/imx-cst/imx-cst_4.0.1.bb
+++ b/meta-oe/recipes-support/imx-cst/imx-cst_4.0.1.bb
@@ -29,6 +29,7 @@ SRC_URI =3D "\
     file://0014-fix-pointer-sign-errors-with-clang.patch \
     file://0015-fix-openssl-4-engine-api-removal.patch \
     file://0016-fix-openssl-4-const-subject-name.patch \
+    file://0017-cst-port-pkcs11-signing-from-engine-to-provider.patch \
 "
 SRC_URI[sha256sum] =3D "fd92a1a9faa10fb81bbf752c7ee1e257f17e1ec4c2964f8a47=
adf8a3eaa7df41"
=20

base-commit: cf030e73b8e0fa463a81ace8f13c82a9f1281ebe
--=20
2.43.0


