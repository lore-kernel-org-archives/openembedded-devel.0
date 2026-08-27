Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D86C61DC4
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 18:54:23 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1893.1787856858941288240
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2026 11:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=KCyI86A8;
 spf=pass (domain: est.tech, ip: 52.101.65.49, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HSbTe9N7IvAxeUm+5EpoghugjopfMIkZwnqqWdRGFIvjmKDcT0v2yyWxnmBm1i1LYTVIOkC75Gz4HESJ84+4a4JOti2C4kVIMOjZGxrO8xP58RS2Al526IeTwNbVTkzfR6Pk8+cR7IjSc7DbTM2UxKMf9DR25XoOBcEs1Z9ENJg/wvRzhedlxp0nKOp4xZrDypwtdeQE+gUm0HwTOTKJ0jP+u0mY/nWJSIGblEcopar9iLXU+GYELM9BTsQgTUTDU4KywpHuCZiDjgHNdIQO+vZxkYR42DHsT0JOaU/iU6wxYkXOCtqBmaZT1+ukthHfZSaG7mQTN3FglS0YccgDQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+z7ykovFQRAq9ulPBTq1toSbsWQcx4DVL5wBUKGOl7Q=;
 b=StJmRh5kxOvsV7VKP95qRxyZs2q9gBbCuvFuCOC3RLJxb9J0LYzYImZiIfgZUjtmGebG0nLtj21ZY5Bzb72/yDFnzXUzm4cg0u1rhr59qjcqPBAastPXqOz1U190JLhcflDb5v9BEWSA5OVQmsvGsWR/D8OjqHt1ymunwt6km3dknWKoyN91NhroM+H4RjriIS0WUgJycnlVYdkdiuNkO7MOTHv0gk6MKTTCHTxtbZZTmZiO2AnqQLH91vxdj9SoF8EthlxnqYRsJiH8uSYM+RxaGJAQ1vZv7hZZGQL67f4JCCh7hXfw2zWw8glvIiJiC2qGMQE5qp3m8zZPzNPzSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+z7ykovFQRAq9ulPBTq1toSbsWQcx4DVL5wBUKGOl7Q=;
 b=KCyI86A8GjOCEm7GL84HGvLUMltvSMOlkCjUZ4o0qhzA6uZ4bW12Ocy3e3Rq6cIijETYmWGB4JyUzNTcGcsgbDU7trYw4n7n4hWGel6KzLOpE8CwRG26m7ylaywtASX2B9tL2w+tWJNa1dFbWtZX00BgPB46W4SRwjSlYxQU0f896HGDFkn0plLaRx4FFoNg5YBF0H4vlzMES6siDnB8qzAj+x7rthd65JXsmSj1zdJw+EYpgBe94raaerAeLjayds29RIpx/FF+RL91io9B/2PnnEwpvIlv4999cyIyrJ0fS+jPb7s/J/nmhCPGNVSFtjXovNggTl/R1D657IEvXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB9P189MB3598.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5fc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 18:54:16 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 18:54:16 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [meta-networking][RFC 19/20] libcoap: fix build with OpenSSL 4.0
Date: Thu, 27 Aug 2026 20:53:23 +0200
Message-ID: <20260827185324.78997-20-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
References: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0262.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::24) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB9P189MB3598:EE_
X-MS-Office365-Filtering-Correlation-Id: d27b54c5-c882-46d2-c70b-08df046c9836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10070799003|10067099003|56012099006|11063799006|6133799003|3023799007|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	nPUs/HUZvoFYmr/tidsoa+qhHnTUjWDDTSe5ON70H2GHoD6pQuoOqoMMubm11UHib8dcjhk6kBbVyvqH4qgcUb18WQXQWAxCm570FWtX62hZaAAIvIU2X4wUVdcK9lmIqMByDlc9PsDoO6lrjb9mZ1E0esQq5qjiqQAWXoKJpmVH1nueSZMANvVdfCXvDzULbmfzPelvFV/J4N2zpqOLuUSEgMKQbF/z6w9GHhFwoTsKnyM36u8dABcoQgBT3gDxeM1oFPl2LLSepeSt3XcQa+yPlk5BXVfw2vqPXQtwOLjJsXAN+PHX0+/Vtlq6CK2BEwUx67f+sApTfz7XvTpHu7vxoXl34MohijVgQuIgtlbwjcCKcTWvRoBssB8dIsFhCvMl/WkdtXKCVOcQyh+2AOd5oLo+yrWw4B1JSYNSNg8BMjVA1abhp9RNsfcXZhOJw5fz5Aifw72v6iqYcDNCtvVvPm+6kldtQZ1ohv9zytxxlrEAYNFqHA2EBMbQC/L2cAG27s/jYv2hojj0mTOnlMPeIHesNu3GmTmMKM0quFa/Kzdh98MkHaVgNWe4fg2+jLCClD9Lzj0BxIS9hHOtd0h4SzY/3qSqI/8zs0zVwBI3fi4Oa9/wKQic0lLZYWnzT/XzzUWIKdwUGbf3Xu6Xee+r72tBXnTXQRxTNo7M3Ew=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10070799003)(10067099003)(56012099006)(11063799006)(6133799003)(3023799007)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jvG46Qx6FWdBa4J8vaAUlBfURwbK7UcH2M4S3xeoTJAUs3X0XQf20TBJ9bdx?=
 =?us-ascii?Q?C4qh8maW2O0mscr4Xp2TOc1Ni3q5/C/CrXlYyO3CSlFWDGWrOpdnlXjDXQe1?=
 =?us-ascii?Q?LULOQzw6Mb4hqm6teaSyp50SDoaF6O/6qschztChQcDTdsUftxAlegyJJGEn?=
 =?us-ascii?Q?SrERAxP4i/p/V90YoHtiIyw2xkmxR8iIFIew8nEhH71qf8FdKPhMFCCUMsJA?=
 =?us-ascii?Q?3nw9QrCu86ijMx2m7Fhz3z9dy8HyWH9G4m5Su/dyycVeOjtkqfWuUuNzRf9S?=
 =?us-ascii?Q?ZnYJd9XurGvIr6nQMXcKyk2SfPeIDxVMItHKAi26dsE4xeY9Ezn531ykt1NM?=
 =?us-ascii?Q?5FWFo82V2MkE/BqOQxRgHn6pOSSZoEzfTjfloCkqVZRd6GVjGUWqm+Cy7F74?=
 =?us-ascii?Q?5iav4grNmxtRAv3Yrtm9cBBiio80ITL2+bWFc73xHAl2iWbtQ7q5gQSznbTF?=
 =?us-ascii?Q?iQ6WwBB/l1NvIFiaJbrpso2vdns4gYQhoGyVLzsaBX0WsWnYXSnaM9WftbpV?=
 =?us-ascii?Q?/RRNo06OUnBZsI5jj8J6opCNJHzgR2CWPp91/bI4/i+GGMFgUdnrGePkXXKa?=
 =?us-ascii?Q?S3MhhbZe3I12e7bcwDU4tqMg57XmZ8/joAA1JltlSNhKdwFNFaOjzZHbdq2l?=
 =?us-ascii?Q?dmZHWM6x2637QROUmuULgsdMh1Wl041c11L/IzHjvi015BGLfQCEizU8YAZ8?=
 =?us-ascii?Q?hehWP9XyyFOMIP0A3Mar3UQMcpclFAWJRb/LkQx5Er5l4rXiiNs9cpMMVOQ5?=
 =?us-ascii?Q?9kTH+Q4V2DcGeiIZ1hl/sowZCwXCGPVSq3M7uh1CGVwmWGn4ECLvvEtJEw6F?=
 =?us-ascii?Q?WN3FZNTT9kivzxM8SrFxXrJIcDK0KBs5gSNpc/2kecI3vLgrqVEoQ+W4TUPG?=
 =?us-ascii?Q?3lON/Zlfr/Oanc+1J/dhIf+RaqphIB8Ylw+CNtwM+nSphtFHavyqVmVzBc2D?=
 =?us-ascii?Q?CslfIHe/W61klow1t0UYehQM+EDJZK+A8x7lthXREvtZ0g+kx7PxfP927y9j?=
 =?us-ascii?Q?R7WRPYhgrvH8gDcM/CJeAEiSwBe4KGlZP/PohTSrK8NqWsufwRfvCBHNYHC2?=
 =?us-ascii?Q?iXH31M76ssq/n81IqE3jesi++Y6RiM+lH0sO8EG6d3l0fOf7DrOpQxrT+gGG?=
 =?us-ascii?Q?a65j+9eBfR4ASwSYbbf9EOH+2xs6g23UYqZXF2elMA+YnaGSrx3qMYrMwtj8?=
 =?us-ascii?Q?Agn3X1ZriDzekOTBiNbq62Aa2sg4a+r/w/u7WfBjGCsMQjc6l9YNKfA6EqOa?=
 =?us-ascii?Q?FG0lt4GdyOWjjbbvto5wKPb8913Blq5XdG0tkkRtP2T2mEz9sB4mZT2hUMbD?=
 =?us-ascii?Q?aI7RlAEJI0pz6JCvxoCSXmx3hoSAC4SSMweLyI0MmR8OJ+BNWb80rEByZxf+?=
 =?us-ascii?Q?DpUfEahUERkqZHgrMB1+DjM+lnpmlHvrOzmMopNvnpBoEB/KOp/FZdAP5NJV?=
 =?us-ascii?Q?4vBsG62HAlsGo+JfdcurcWmeXULB9CTFY1PsvmQzjxh6Uu2WS5pEGJFkS6SF?=
 =?us-ascii?Q?zliScZDQzBYZ5SRlbigEibXiA5cL4lNUbsWrOlE4rfkinqzBjxJvEK8iv0vJ?=
 =?us-ascii?Q?bMQjHxpPtwZzYzlc461gP+GMWKJ4uZGiBt5XfjqjxGfxAiIEkDooziWgv6b+?=
 =?us-ascii?Q?/ZH911nhwzuO2UMJWch5eTzAoUWhAdiYawOWANZFSiNbNdBePComJ0gf+R84?=
 =?us-ascii?Q?kzZZqFQgGdrhouiHJ01w1DK1lXyVx9EOoy4Q3yDWrRYG2k/qBqf+wSKaMMIk?=
 =?us-ascii?Q?7C5IkMBRRQYW4uGcB9mXeTYhsmh4utJoCWfkZTxpO/RyEB+nISkON2oXP4K4?=
X-MS-Exchange-AntiSpam-MessageData-1: M8zwAvLDBX47zAd/+/SAMXjp0KWnoNW6W3g=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d27b54c5-c882-46d2-c70b-08df046c9836
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 18:54:16.7627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c+ZwumFMlPtKwZqD6vTcMA10HGXQ8zLibkyzSZRI4+qmXfUq1LLGfeP2kL9pEx8yCwnk0HGs7wz1F03ov1o2w5T2mfF8dcyekHjW3GgoG28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB3598
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 18:54:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129554

OpenSSL 4.0 removes ENGINE API entirely. Backport upstream fix
that guards all ENGINE references with version check.

Upstream-Status: Backport [https://github.com/obgm/libcoap/commit/5ea8b7d5e=
956]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...OpenSSL-Support-4.0-and-later-builds.patch | 507 ++++++++++++++++++
 .../libcoap/libcoap_4.3.5b.bb                 |   1 +
 2 files changed, 508 insertions(+)
 create mode 100644 meta-networking/recipes-devtools/libcoap/libcoap/0001-O=
penSSL-Support-4.0-and-later-builds.patch

diff --git a/meta-networking/recipes-devtools/libcoap/libcoap/0001-OpenSSL-=
Support-4.0-and-later-builds.patch b/meta-networking/recipes-devtools/libco=
ap/libcoap/0001-OpenSSL-Support-4.0-and-later-builds.patch
new file mode 100644
index 0000000000..a139ad9044
--- /dev/null
+++ b/meta-networking/recipes-devtools/libcoap/libcoap/0001-OpenSSL-Support=
-4.0-and-later-builds.patch
@@ -0,0 +1,507 @@
+From 26ef10509e760e931d527982edf7fca8c00cbf4e Mon Sep 17 00:00:00 2001
+From: Jon Shallow <supjps-libcoap@jpshallow.com>
+Date: Fri, 5 Jun 2026 14:58:02 +0100
+Subject: [PATCH] OpenSSL: Support 4.0 and later builds
+
+Remove all references to ENGINE_*() as support has been removed in 4.0.
+
+There currently is no tested Provider support for PKCS11.
+
+Upstream-Status: Backport [https://github.com/obgm/libcoap/commit/5ea8b7d5=
e956]
+
+Note: Context adjusted for v4.3.5b (one hunk had minor comment difference)=
.
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/coap_openssl.c | 205 +++++++++++++++++++++++++--------------------
+ 1 file changed, 114 insertions(+), 91 deletions(-)
+
+diff --git a/src/coap_openssl.c b/src/coap_openssl.c
+index dc397071..b5afa7a8 100644
+--- a/src/coap_openssl.c
++++ b/src/coap_openssl.c
+@@ -69,7 +69,9 @@
+  *
+  */
+ #include <openssl/ssl.h>
++#if OPENSSL_VERSION_NUMBER < 0x40000000L
+ #include <openssl/engine.h>
++#endif /* OPENSSL_VERSION_NUMBER < 0x40000000L */
+ #include <openssl/err.h>
+ #include <openssl/rand.h>
+ #include <openssl/hmac.h>
+@@ -246,7 +248,11 @@ coap_dtls_pki_is_supported(void) {
+  */
+ int
+ coap_dtls_pkcs11_is_supported(void) {
++#if OPENSSL_VERSION_NUMBER < 0x40000000L
+   return 1;
++#else /* OPENSSL_VERSION_NUMBER >=3D 0x40000000L */
++  return 0;
++#endif /* OPENSSL_VERSION_NUMBER >=3D 0x40000000L */
+ }
+=20
+ /*
+@@ -285,14 +291,18 @@ coap_get_tls_library_version(void) {
+   return &version;
+ }
+=20
++#if OPENSSL_VERSION_NUMBER < 0x40000000L
+ static ENGINE *pkcs11_engine =3D NULL;
+ static ENGINE *defined_engine =3D NULL;
++#endif /* OPENSSL_VERSION_NUMBER < 0x40000000L */
+=20
+ void
+ coap_dtls_startup(void) {
+   SSL_load_error_strings();
+   SSL_library_init();
++#if OPENSSL_VERSION_NUMBER < 0x40000000L
+   ENGINE_load_dynamic();
++#endif /* OPENSSL_VERSION_NUMBER < 0x40000000L */
+ }
+=20
+ void
+@@ -308,10 +318,10 @@ coap_dtls_shutdown(void) {
+     ENGINE_finish(defined_engine);
+     defined_engine =3D NULL;
+   }
+-#else /* OPENSSL_VERSION_NUMBER >=3D 0x30000000L */
++#elif OPENSSL_VERSION_NUMBER < 0x40000000L
+   pkcs11_engine =3D NULL;
+   defined_engine =3D NULL;
+-#endif /* OPENSSL_VERSION_NUMBER >=3D 0x30000000L */
++#endif /* OPENSSL_VERSION_NUMBER >=3D 0x30000000L && < 0x40000000L */
+   ERR_free_strings();
+   coap_dtls_set_log_level(COAP_LOG_EMERG);
+ }
+@@ -331,6 +341,7 @@ coap_dtls_get_tls(const coap_session_t *c_session,
+   return NULL;
+ }
+=20
++#if OPENSSL_VERSION_NUMBER < 0x40000000L
+ static int
+ get_split_conf_entry(const uint8_t **start, size_t size, const char *get_=
keyword,
+                      coap_str_const_t **p1, coap_str_const_t **p2) {
+@@ -552,6 +563,19 @@ coap_tls_engine_remove(void) {
+   }
+   return 0;
+ }
++#else /*  OPENSSL_VERSION_NUMBER >=3D 0x40000000L */
++
++int
++coap_tls_engine_configure(coap_str_const_t *conf_mem) {
++  (void)conf_mem;
++  return 0;
++}
++
++int
++coap_tls_engine_remove(void) {
++  return 0;
++}
++#endif /* OPENSSL_VERSION_NUMBER >=3D 0x40000000L */
+=20
+ /*
+  * Logging levels use the standard CoAP logging levels
+@@ -1408,6 +1432,7 @@ add_ca_to_cert_store(X509_STORE *st, X509 *x509) {
+   }
+ }
+=20
++#if OPENSSL_VERSION_NUMBER < 0x40000000L
+ static X509 *
+ missing_ENGINE_load_cert(ENGINE *engine, const char *cert_id) {
+   struct {
+@@ -1456,6 +1481,7 @@ check_pkcs11_engine(void) {
+   }
+   return 1;
+ }
++#endif /* OPENSSL_VERSION_NUMBER < 0x40000000L */
+=20
+ #if OPENSSL_VERSION_NUMBER < 0x10101000L && COAP_SERVER_SUPPORT
+=20
+@@ -1899,10 +1925,11 @@ setup_pki_server(SSL_CTX *ctx,
+=20
+   return 1;
+ }
+-#endif /* OPENSSL_VERSION_NUMBER < 0x10101000L */
++#endif /* OPENSSL_VERSION_NUMBER < 0x10101000L && COAP_SERVER_SUPPORT */
+=20
+ #if OPENSSL_VERSION_NUMBER >=3D 0x10101000L || COAP_CLIENT_SUPPORT
+=20
++#if OPENSSL_VERSION_NUMBER < 0x40000000L
+ static int
+ install_engine_public_cert(ENGINE *engine, SSL *ssl, const char *public_c=
ert,
+                            coap_dtls_role_t role) {
+@@ -1990,6 +2017,7 @@ install_engine_ca(ENGINE *engine, SSL *ssl, const ch=
ar *ca,
+   X509_free(x509);
+   return 1;
+ }
++#endif /* OPENSSL_VERSION_NUMBER < 0x40000000L */
+=20
+ static int
+ load_in_cas(SSL *ssl,
+@@ -2052,9 +2080,7 @@ setup_pki_ssl(SSL *ssl,
+       if (!(SSL_use_PrivateKey_file(ssl,
+                                     key.key.define.private_key.s_byte,
+                                     SSL_FILETYPE_PEM))) {
+-        return coap_dtls_define_issue(COAP_DEFINE_KEY_PRIVATE,
+-                                      COAP_DEFINE_FAIL_BAD,
+-                                      &key, role, 0);
++        goto fail_bad_private;
+       }
+       break;
+     case COAP_PKI_KEY_DEF_PEM_BUF: /* define private key */
+@@ -2068,31 +2094,23 @@ setup_pki_ssl(SSL *ssl,
+             BIO_free(bp);
+           if (pkey)
+             EVP_PKEY_free(pkey);
+-          return coap_dtls_define_issue(COAP_DEFINE_KEY_PRIVATE,
+-                                        COAP_DEFINE_FAIL_BAD,
+-                                        &key, role, 0);
++          goto fail_bad_private;
+         }
+         if (bp)
+           BIO_free(bp);
+         if (pkey)
+           EVP_PKEY_free(pkey);
+       } else {
+-        return coap_dtls_define_issue(COAP_DEFINE_KEY_PRIVATE,
+-                                      COAP_DEFINE_FAIL_NONE,
+-                                      &key, role, 0);
++        goto fail_none_private;
+       }
+       break;
+     case COAP_PKI_KEY_DEF_RPK_BUF: /* define private key */
+-      return coap_dtls_define_issue(COAP_DEFINE_KEY_PRIVATE,
+-                                    COAP_DEFINE_FAIL_NOT_SUPPORTED,
+-                                    &key, role, 0);
++      goto fail_ns_private;
+     case COAP_PKI_KEY_DEF_DER: /* define private key */
+       if (!(SSL_use_PrivateKey_file(ssl,
+                                     key.key.define.private_key.s_byte,
+                                     SSL_FILETYPE_ASN1))) {
+-        return coap_dtls_define_issue(COAP_DEFINE_KEY_PRIVATE,
+-                                      COAP_DEFINE_FAIL_BAD,
+-                                      &key, role, 0);
++        goto fail_bad_private;
+       }
+       break;
+     case COAP_PKI_KEY_DEF_DER_BUF: /* define private key */
+@@ -2101,14 +2119,13 @@ setup_pki_ssl(SSL *ssl,
+                                     ssl,
+                                     key.key.define.private_key.u_byte,
+                                     (long)key.key.define.private_key_len)=
)) {
+-        return coap_dtls_define_issue(COAP_DEFINE_KEY_PRIVATE,
+-                                      COAP_DEFINE_FAIL_BAD,
+-                                      &key, role, 0);
++        goto fail_bad_private;
+       }
+       break;
+     case COAP_PKI_KEY_DEF_PKCS11: /* define private key */
++#if OPENSSL_VERSION_NUMBER < 0x40000000L
+       if (!check_pkcs11_engine()) {
+-        return 0;
++        goto fail_bad_private;
+       }
+       if (key.key.define.user_pin) {
+         /* If not set, pin-value may be held in pkcs11: URI */
+@@ -2117,39 +2134,36 @@ setup_pki_ssl(SSL *ssl,
+                                    key.key.define.user_pin, 0) =3D=3D 0) =
{
+           coap_log_warn("*** setup_pki: (D)TLS: PKCS11: %s: Unable to set=
 pin\n",
+                         key.key.define.user_pin);
+-          return 0;
++          goto fail_bad_private;
+         }
+       }
+       if (!install_engine_private_key(pkcs11_engine, ssl,
+                                       key.key.define.private_key.s_byte,
+                                       role)) {
+-        return coap_dtls_define_issue(COAP_DEFINE_KEY_PRIVATE,
+-                                      COAP_DEFINE_FAIL_BAD,
+-                                      &key, role, 0);
++        goto fail_bad_private;
+       }
++#else /* OPENSSL_VERSION_NUMBER >=3D 0x40000000L */
++      goto fail_bad_private;
++#endif /* OPENSSL_VERSION_NUMBER >=3D 0x40000000L */
+       break;
+     case COAP_PKI_KEY_DEF_ENGINE: /* define private key */
++#if OPENSSL_VERSION_NUMBER < 0x40000000L
+       if (!defined_engine ||
+           !install_engine_private_key(defined_engine, ssl,
+                                       key.key.define.private_key.s_byte,
+                                       role)) {
+-        return coap_dtls_define_issue(COAP_DEFINE_KEY_PRIVATE,
+-                                      COAP_DEFINE_FAIL_BAD,
+-                                      &key, role, 0);
++        goto fail_bad_private;
+       }
+       break;
++#endif /* OPENSSL_VERSION_NUMBER < 0x40000000L */
+     case COAP_PKI_KEY_DEF_PKCS11_RPK: /* define private key */
+     default:
+-      return coap_dtls_define_issue(COAP_DEFINE_KEY_PRIVATE,
+-                                    COAP_DEFINE_FAIL_NOT_SUPPORTED,
+-                                    &key, role, 0);
++      goto fail_ns_private;
+     }
+   } else if (role =3D=3D COAP_DTLS_ROLE_SERVER ||
+              (key.key.define.public_cert.u_byte &&
+               key.key.define.public_cert.u_byte[0])) {
+-    return coap_dtls_define_issue(COAP_DEFINE_KEY_PRIVATE,
+-                                  COAP_DEFINE_FAIL_NONE,
+-                                  &key, role, 0);
++    goto fail_none_private;
+   }
+=20
+   /*
+@@ -2165,16 +2179,12 @@ setup_pki_ssl(SSL *ssl,
+         if (!(SSL_use_certificate_file(ssl,
+                                        key.key.define.public_cert.s_byte,
+                                        SSL_FILETYPE_PEM))) {
+-          return coap_dtls_define_issue(COAP_DEFINE_KEY_PUBLIC,
+-                                        COAP_DEFINE_FAIL_BAD,
+-                                        &key, role, 0);
++          goto fail_bad_public;
+         }
+       } else {
+         if (!SSL_use_certificate_chain_file(ssl,
+                                             key.key.define.public_cert.s_=
byte)) {
+-          return coap_dtls_define_issue(COAP_DEFINE_KEY_PUBLIC,
+-                                        COAP_DEFINE_FAIL_BAD,
+-                                        &key, role, 0);
++          goto fail_bad_public;
+         }
+       }
+       break;
+@@ -2189,31 +2199,23 @@ setup_pki_ssl(SSL *ssl,
+             BIO_free(bp);
+           if (cert)
+             X509_free(cert);
+-          return coap_dtls_define_issue(COAP_DEFINE_KEY_PUBLIC,
+-                                        COAP_DEFINE_FAIL_BAD,
+-                                        &key, role, 0);
++          goto fail_bad_public;
+         }
+         if (bp)
+           BIO_free(bp);
+         if (cert)
+           X509_free(cert);
+       } else {
+-        return coap_dtls_define_issue(COAP_DEFINE_KEY_PUBLIC,
+-                                      COAP_DEFINE_FAIL_BAD,
+-                                      &key, role, 0);
++        goto fail_bad_public;
+       }
+       break;
+     case COAP_PKI_KEY_DEF_RPK_BUF: /* define public cert */
+-      return coap_dtls_define_issue(COAP_DEFINE_KEY_PUBLIC,
+-                                    COAP_DEFINE_FAIL_NOT_SUPPORTED,
+-                                    &key, role, 0);
++      goto fail_ns_public;
+     case COAP_PKI_KEY_DEF_DER: /* define public cert */
+       if (!(SSL_use_certificate_file(ssl,
+                                      key.key.define.public_cert.s_byte,
+                                      SSL_FILETYPE_ASN1))) {
+-        return coap_dtls_define_issue(COAP_DEFINE_KEY_PUBLIC,
+-                                      COAP_DEFINE_FAIL_BAD,
+-                                      &key, role, 0);
++        goto fail_bad_public;
+       }
+       break;
+     case COAP_PKI_KEY_DEF_DER_BUF: /* define public cert */
+@@ -2221,42 +2223,41 @@ setup_pki_ssl(SSL *ssl,
+           !(SSL_use_certificate_ASN1(ssl,
+                                      key.key.define.public_cert.u_byte,
+                                      (int)key.key.define.public_cert_len)=
)) {
+-        return coap_dtls_define_issue(COAP_DEFINE_KEY_PUBLIC,
+-                                      COAP_DEFINE_FAIL_BAD,
+-                                      &key, role, 0);
++        goto fail_bad_public;
+       }
+       break;
+     case COAP_PKI_KEY_DEF_PKCS11: /* define public cert */
++#if OPENSSL_VERSION_NUMBER < 0x40000000L
+       if (!check_pkcs11_engine()) {
+-        return 0;
++        goto fail_bad_public;
+       }
+       if (!install_engine_public_cert(pkcs11_engine, ssl,
+                                       key.key.define.public_cert.s_byte,
+                                       role)) {
+-        return coap_dtls_define_issue(COAP_DEFINE_KEY_PUBLIC,
+-                                      COAP_DEFINE_FAIL_BAD,
+-                                      &key, role, 0);
++        goto fail_bad_public;
+       }
++#else /* OPENSSL_VERSION_NUMBER >=3D 0x40000000L */
++      goto fail_bad_public;
++#endif /* OPENSSL_VERSION_NUMBER >=3D 0x40000000L */
+       break;
+     case COAP_PKI_KEY_DEF_ENGINE: /* define public cert */
++#if OPENSSL_VERSION_NUMBER < 0x40000000L
+       if (!defined_engine ||
+           !install_engine_public_cert(defined_engine, ssl,
+                                       key.key.define.public_cert.s_byte,
+                                       role)) {
+-        return coap_dtls_define_issue(COAP_DEFINE_KEY_PUBLIC,
+-                                      COAP_DEFINE_FAIL_BAD,
+-                                      &key, role, 0);
++        goto fail_bad_public;
+       }
+       break;
++#endif /* OPENSSL_VERSION_NUMBER < 0x40000000L */
+     case COAP_PKI_KEY_DEF_PKCS11_RPK: /* define public cert */
+     default:
+-      return coap_dtls_define_issue(COAP_DEFINE_KEY_PUBLIC,
+-                                    COAP_DEFINE_FAIL_NOT_SUPPORTED,
+-                                    &key, role, 0);
++      goto fail_ns_public;
+     }
+   } else if (role =3D=3D COAP_DTLS_ROLE_SERVER ||
+              (key.key.define.private_key.u_byte &&
+               key.key.define.private_key.u_byte[0])) {
++
+     return coap_dtls_define_issue(COAP_DEFINE_KEY_PUBLIC,
+                                   COAP_DEFINE_FAIL_NONE,
+                                   &key, role, 0);
+@@ -2270,9 +2271,7 @@ setup_pki_ssl(SSL *ssl,
+     switch (key.key.define.ca_def) {
+     case COAP_PKI_KEY_DEF_PEM:
+       if (!load_in_cas(ssl, key.key.define.ca.s_byte, role)) {
+-        return coap_dtls_define_issue(COAP_DEFINE_KEY_CA,
+-                                      COAP_DEFINE_FAIL_BAD,
+-                                      &key, role, 0);
++        goto fail_bad_ca;
+       }
+       break;
+     case COAP_PKI_KEY_DEF_PEM_BUF: /* define ca */
+@@ -2295,22 +2294,16 @@ setup_pki_ssl(SSL *ssl,
+           BIO_free(bp);
+         }
+       } else {
+-        return coap_dtls_define_issue(COAP_DEFINE_KEY_CA,
+-                                      COAP_DEFINE_FAIL_BAD,
+-                                      &key, role, 0);
++        goto fail_bad_ca;
+       }
+       break;
+     case COAP_PKI_KEY_DEF_RPK_BUF: /* define ca */
+-      return coap_dtls_define_issue(COAP_DEFINE_KEY_CA,
+-                                    COAP_DEFINE_FAIL_NOT_SUPPORTED,
+-                                    &key, role, 0);
++      goto fail_ns_ca;
+     case COAP_PKI_KEY_DEF_DER: /* define ca */
+       if (!(SSL_use_certificate_file(ssl,
+                                      key.key.define.ca.s_byte,
+                                      SSL_FILETYPE_ASN1))) {
+-        return coap_dtls_define_issue(COAP_DEFINE_KEY_CA,
+-                                      COAP_DEFINE_FAIL_BAD,
+-                                      &key, role, 0);
++        goto fail_bad_ca;
+       }
+       break;
+     case COAP_PKI_KEY_DEF_DER_BUF: /* define ca */
+@@ -2324,9 +2317,7 @@ setup_pki_ssl(SSL *ssl,
+         if (role =3D=3D COAP_DTLS_ROLE_SERVER) {
+           if (!x509 || !SSL_add_client_CA(ssl, x509)) {
+             X509_free(x509);
+-            return coap_dtls_define_issue(COAP_DEFINE_KEY_CA,
+-                                          COAP_DEFINE_FAIL_BAD,
+-                                          &key, role, 0);
++            goto fail_bad_ca;
+           }
+         }
+=20
+@@ -2338,36 +2329,66 @@ setup_pki_ssl(SSL *ssl,
+       }
+       break;
+     case COAP_PKI_KEY_DEF_PKCS11: /* define ca */
++#if OPENSSL_VERSION_NUMBER < 0x40000000L
+       if (!check_pkcs11_engine()) {
+-        return 0;
++        goto fail_bad_ca;
+       }
+       if (!install_engine_ca(pkcs11_engine, ssl,
+                              key.key.define.ca.s_byte,
+                              role)) {
+-        return coap_dtls_define_issue(COAP_DEFINE_KEY_CA,
+-                                      COAP_DEFINE_FAIL_BAD,
+-                                      &key, role, 0);
++        goto fail_bad_ca;
+       }
++#else /* OPENSSL_VERSION_NUMBER >=3D 0x40000000L */
++      goto fail_bad_ca;
++#endif /* OPENSSL_VERSION_NUMBER >=3D 0x40000000L */
+       break;
+     case COAP_PKI_KEY_DEF_ENGINE: /* define ca */
++#if OPENSSL_VERSION_NUMBER < 0x40000000L
+       if (!defined_engine ||
+           !install_engine_ca(defined_engine, ssl,
+                              key.key.define.ca.s_byte,
+                              role)) {
+-        return coap_dtls_define_issue(COAP_DEFINE_KEY_CA,
+-                                      COAP_DEFINE_FAIL_BAD,
+-                                      &key, role, 0);
++        goto fail_bad_ca;
+       }
+       break;
++#endif /* OPENSSL_VERSION_NUMBER < 0x40000000L */
+     case COAP_PKI_KEY_DEF_PKCS11_RPK: /* define ca */
+     default:
+-      return coap_dtls_define_issue(COAP_DEFINE_KEY_CA,
+-                                    COAP_DEFINE_FAIL_NOT_SUPPORTED,
+-                                    &key, role, 0);
++      goto fail_ns_ca;
+     }
+   }
+=20
+   return 1;
++
++fail_bad_private:
++  return coap_dtls_define_issue(COAP_DEFINE_KEY_PRIVATE,
++                                COAP_DEFINE_FAIL_BAD,
++                                &key, role, 0);
++fail_ns_private:
++  return coap_dtls_define_issue(COAP_DEFINE_KEY_PRIVATE,
++                                COAP_DEFINE_FAIL_NOT_SUPPORTED,
++                                &key, role, 0);
++fail_none_private:
++  return coap_dtls_define_issue(COAP_DEFINE_KEY_PRIVATE,
++                                COAP_DEFINE_FAIL_NONE,
++                                &key, role, 0);
++fail_bad_public:
++  return coap_dtls_define_issue(COAP_DEFINE_KEY_PUBLIC,
++                                COAP_DEFINE_FAIL_BAD,
++                                &key, role, 0);
++fail_ns_public:
++  return coap_dtls_define_issue(COAP_DEFINE_KEY_PUBLIC,
++                                COAP_DEFINE_FAIL_NOT_SUPPORTED,
++                                &key, role, 0);
++fail_bad_ca:
++  return coap_dtls_define_issue(COAP_DEFINE_KEY_CA,
++                                COAP_DEFINE_FAIL_BAD,
++                                &key, role, 0);
++fail_ns_ca:
++  return coap_dtls_define_issue(COAP_DEFINE_KEY_CA,
++                                COAP_DEFINE_FAIL_NOT_SUPPORTED,
++                                &key, role, 0);
++
+ }
+ #endif /* OPENSSL_VERSION_NUMBER >=3D 0x10101000L || COAP_CLIENT_SUPPORT =
*/
+=20
+@@ -3200,6 +3221,7 @@ coap_dtls_context_set_pki(coap_context_t *ctx,
+     return 0;
+   context->setup_data =3D *setup_data;
+=20
++#if OPENSSL_VERSION_NUMBER < 0x40000000L
+   if (context->setup_data.pki_key.key_type =3D=3D COAP_PKI_KEY_DEFINE) {
+     if (context->setup_data.pki_key.key.define.ca_def =3D=3D COAP_PKI_KEY=
_DEF_ENGINE ||
+         context->setup_data.pki_key.key.define.public_cert_def =3D=3D COA=
P_PKI_KEY_DEF_ENGINE ||
+@@ -3210,6 +3232,7 @@ coap_dtls_context_set_pki(coap_context_t *ctx,
+       }
+     }
+   }
++#endif /* OPENSSL_VERSION_NUMBER < 0x40000000L */
+=20
+   if (!context->setup_data.verify_peer_cert) {
+     /* Needs to be clear so that no CA DNs are transmitted */
diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb b/m=
eta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb
index e5bbdb9e27..07b3670317 100644
--- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb
+++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D05d17535846895e2=
3ea4c79b16a9e904"
=20
 SRC_URI =3D "git://github.com/obgm/libcoap.git;branch=3Drelease-4.3.5-patc=
hes;protocol=3Dhttps;tag=3Dv${PV} \
            file://run-ptest \
+           file://0001-OpenSSL-Support-4.0-and-later-builds.patch \
            "
 SRCREV =3D "851533c3cf63d16984d370ce39d586ecb3694971"
=20

