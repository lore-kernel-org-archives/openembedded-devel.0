Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25133C61DB9
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 18:53:53 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1795.1787856831279643942
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2026 11:53:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=cidc37ln;
 spf=pass (domain: est.tech, ip: 52.101.65.12, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l6dhffo16dTf+jNxApVm2eizU4ANERCnDqOjNEK8B4uNvfPcW50f3agleWCs/oGURNt/3p6XXVMxto+wqUU/AzhwOCUJmvgt4srlQ9WsOZQfxA9SK8kQCWDegDnKwS1TI96aOk6oA8HDBY2QaA1CK2gObM13nLPUGkoRpFSfQehLiPxeGN25TqrNTSmN9Zb8XiaAS17JFU6MNFg8KyQnh051W+hPCoXyHuZ5BSewHrNfT8ELIAQtIGZRGs7gthIY/K7nYnO7EoHxkvPw0xLBBBiwW3XNGX+OlJbm1UhJxJcfHpwaQCqO4bBQr4kj65TfF0t0HVZojj/6QPmzaQ6NCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pj1Syc3BvdpOWgll0TWWoJ9C7X6vW26myxQui0Aw8Q4=;
 b=R454Zyj9Y+YQq/V/alMAOZmzzXfPXOi8Fq65tH4FI1ngfSZRUNxgc5xKYMZ1h44zo5qnRMzSIoAj7/oyqrSxo4vwJT0rNryOwabgvWetUaSDsJXtlyW3HRp73StvCyeG9Ijue7wIY30a0Pyvf6GC2EjLOGZPvJgJrLQyX4/P4ZzEOh3HkC8Sxt1pJXK+/NVBxHLLscPOYb59f+PuWSTt7IN7PgDn+G3H91VeAGzKX1b8A/RBSHvlyz7KopVSFK9o/DgvLGmW0KR0ABj6h80VddnjGMi5lgOQLDMBh8+UFHhxiHkEn8lo4R2TC5KZMWjYtl9Gttgtk9QFfl6l2g/nrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pj1Syc3BvdpOWgll0TWWoJ9C7X6vW26myxQui0Aw8Q4=;
 b=cidc37lnKlry1/fE6+cqNxAO0jk2FG/587K0+63uEDmQ1ZCzoScOpq/fYqRYfojiVMMrx1GwEu6LDycllsHrXhccubT1YwW7UU9B/Nr3oITPs671UzAfPU8vqK1E/8n1zp/vjxhsSbQprJFso7n5635k4OxZA36kv1oTW1KuD29C0ErWm54KzPfnqb+Fo+u+27hc9J1o09eZEt4uMC3V5kSuPQHFBLm4cCV91lKpQmeQQI7loUHLDVGv+GX2H97TEOqQio8u4xiSWqz5/7WkKv7pclqGmIHCtu+B7U+Sao/5u4QAKrzFBnmHQvfLyvlKSaQWNzeMqSCA/jCJo1GEcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB9P189MB3598.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5fc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 18:53:49 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 18:53:49 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [meta-oe][RFC 09/20] thrift: fix build with OpenSSL 4.0
Date: Thu, 27 Aug 2026 20:53:13 +0200
Message-ID: <20260827185324.78997-10-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
References: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0305.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::9) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB9P189MB3598:EE_
X-MS-Office365-Filtering-Correlation-Id: 8814730c-a291-48b1-6abb-08df046c87a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10070799003|10067099003|56012099006|11063799006|6133799003|12006099003|3023799007|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	1N6/XOQL0kJec0ym8QMufghtwzaaQtmJ5UktjdPRVgXw4xrYS7fhZTCd97ZvTgoXilKQcRVVhq7m8cPKKxdnCCZvYHI1sNTgIYqf7rhpf8Al11QctjkZswps3u+j8BUGzx4ocapNovDnP0pgzNuN+hMjFN2WNRICKFBefNDPC6Q4p9biX8xw+cDwSyfMr/WnOReacqaQY3nF2fnzWMYDl2Byzh+qKMJCOkdm/FB99aQXlDA1ik8Reu+0FxYlBbRo5Fm5yZ2VPDKvyHfLV9tsjfpxjkDWIrcSTUebbAAORqSpcr18NhPKTIFQ9wRPR5hRaWsVp3Rxb6vrjEq6TnQi7zxpcmYN86ih16/ToPWURWxxHC/EMmHwzcbIcz27qSPuaW0t5McjM2yMmQUYdiws0IPGqUty1Wr2suwS7OTilPbkqCW4VvnCHNS9H93yDofoNqd2mYToVrBOKUD/V757VXH1CbNsMjhdOI4/PPutyOVfAoGOjhmRyj94Wn2CSGjMWf1x6s28+50OEa3kekovdUnJz7HzqSxp5Fc0sHPoPD08cDYqDPuZCNgcMGPYIH5lSJHuo0998MkYb5pFWnhDaKWAS7nTUVY5aMTKSmWaD96LnyeNPSAKS++YKi1SqtDLvi9hEPBd3W0W1R/lKGJwQZpfzyAgGDrYlHdlHNVwV/U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10070799003)(10067099003)(56012099006)(11063799006)(6133799003)(12006099003)(3023799007)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Mi4Zgep93zEvm5s8CdfCmDEpWUALDwc5Oj+LSDbhJ/qIEc35iGznKslHwJ8C?=
 =?us-ascii?Q?ksZ7wQ66Wv4mqlB9rrsxxtTj5oxissFOtXUTHanVE+J7AoOk6u4lQ24276vo?=
 =?us-ascii?Q?WN0ffAqIT/R9JjX8bW1I4Hq8L+u3roeCbzM6n6YKGJp7149Ypc8slSehDdMI?=
 =?us-ascii?Q?fAojGuRCBeQ1JHYH/Z2RVf8X302+QFuACLcMIMpLAlb11Yy12QDVi0CBb09K?=
 =?us-ascii?Q?Kj+bQqIjpUyIS4j6gNbWWXmLM9NMSMoCTXDJmp2wak+QENqKSyiLOrE+bS0N?=
 =?us-ascii?Q?rt9vq+hpdnmdSebs0uqEf+oy3VolS0Fy/IlPNdpNo5l8OpcluzGodU+KVPXg?=
 =?us-ascii?Q?MFjQJVoySi/Q3QiYBvbJZK9o3ulgMCMXIg/kecN50PnL8Kav320Qse2eZ2Jn?=
 =?us-ascii?Q?lkgleT/K5I1QTnwJCNlWxk1iGtdfQDBcBvtdqd5b9e4/soabi3P7J0MsZDh1?=
 =?us-ascii?Q?GF+3uE9qAv6M5jBGNOeqINx5PaxSfjG31Cb5KGkrosEVLTAVmNDhLlhpQXTK?=
 =?us-ascii?Q?ywk+g5Rft+AT7NijuB7EqxCttaKbzE6jh3fQ6DER7cicK7R29R/qGV4Z4AH6?=
 =?us-ascii?Q?tjh5bcIRPUAfK/JA09r+G/zyc+2OjhwmYVoruoQwG2xIrypQljn671yDKKmD?=
 =?us-ascii?Q?E4QVglJ283p5FQOBz7AkB/DXDVfW9okfAunPUu/jIDXvVVxM/HG51tqL+o/7?=
 =?us-ascii?Q?4KeVVv1A0U1IF53VyFsnD01ZvUE2fTf17v1CDBI06f51APQLLC23v42JYefW?=
 =?us-ascii?Q?IFpIhGHhe7daWRjY2EKc5numknKj3GklhKptlU0V2oN4YadkWK10c1jX+qap?=
 =?us-ascii?Q?0SppLQ68sQ2uaskPMUPkNBWyBgzY2I4xqPFcsZHIo1XbrfXMsF8v6hJ3lon4?=
 =?us-ascii?Q?eMZBpIg1m8ZXpTeWcl/9XF3yCl66Xf/VPtNcQgxqZ0v3ybfdkhBligl5/Qxd?=
 =?us-ascii?Q?EfJTTNY4ns/TmMJz386UNShPwT22dqyrqfbxbrovC4xJxB7/U5lkDvifCGyb?=
 =?us-ascii?Q?ZrBhY1OOITvdRWdXxv0Ovg5Dv3UEaANFsidNDWdkAW9kTrM/DEA2L9D7dOtW?=
 =?us-ascii?Q?ag1GKte6o0U57Jj4g4Kpu4h0e0jXABYXzfFEJ1oTyN37mUoIWzOr/VR3sBGH?=
 =?us-ascii?Q?q0Pg+dkYvM8Jr2Z+aqTafdZv22m0HvilIiReWOryjJ2itn2scoJ+T/EyvLxj?=
 =?us-ascii?Q?d6TBkE3aHR4eexAfrzNHvXrYPzfc45IhnxQAE0CYxOHtXLtN1anqiQyj8IgU?=
 =?us-ascii?Q?p0l52awGFqDBwAcdGuN5gR+dgKlZydXH8f9QZ40VfBY0WIR3n+mQ8v4MNGAI?=
 =?us-ascii?Q?StwQBG3OX/z6ssBlOpA7lT1GI5BiBzSvmRvqRZsWn5Bu7Dz5KLzbQORwCEFg?=
 =?us-ascii?Q?fnewo3Ved75iqFQcChOzA9F9ee+Gi/8lywwZ0YDvOlY2RT+YROWiYojmMEBm?=
 =?us-ascii?Q?27pUSC6GMh2hMY90Pi0dfqljlEcZnI4or/9S05qKIshLHJZIBeCX6Z4FMQbe?=
 =?us-ascii?Q?XXWtYlnAHT3cfP+wTyuaDZaYKaDUo+eMjNKeyZZhOdxZ2K3zcpWhap94zRAu?=
 =?us-ascii?Q?mxx30OpdQdPiIdsgmd4Z2zW1ZfGu9Wi03HBJCcy/eMbJcR1d95iFR5SVgXgO?=
 =?us-ascii?Q?bMWFOexVMgMATPh+B/GIjLzdGhBLUBo7Pyl6otJupT4ShynTTsLblMh2QNUs?=
 =?us-ascii?Q?J+0ALoAq4LrzBR0DjfVUD2qNzW66kEwOccFrpw2L2bCCHdbk2rDgzP1joBqI?=
 =?us-ascii?Q?EEXCGCF4u/OHIQY0l0yxOChFBCOyiNOjE6NLiNUvWwW73B5+YK/Lz8eeqNKq?=
X-MS-Exchange-AntiSpam-MessageData-1: XSpw0hHT+lIyoh1mR6TYmeGpc3Al1gf+N3Y=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8814730c-a291-48b1-6abb-08df046c87a1
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 18:53:48.9190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sbLdMc+XYMr0o+Ii3ZFr/abMSq/ZbX4kYPHkM2DYNl0SDY4pmVrG0nTBFPRnw+itK6TEOVXnf3/OQep1rPXBOGVyQx8KyKrhnLcdjSOQ9bE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB3598
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 18:53:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129544

OpenSSL 4.0 removes SSLv3_method(), per-version TLS method functions,
ERR_remove_state(), ASN1_STRING_data(), and returns const pointers
from X509 accessor functions. Fix both C++ and C GLib bindings.

Upstream-Status: Submitted [https://github.com/apache/thrift/pull/3752]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...SSLSocket-fix-build-with-OpenSSL-4.0.patch | 113 ++++++++++++++++++
 .../thrift/thrift_0.24.0.bb                   |   1 +
 2 files changed, 114 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/0001-TSSLSoc=
ket-fix-build-with-OpenSSL-4.0.patch

diff --git a/meta-oe/recipes-connectivity/thrift/thrift/0001-TSSLSocket-fix=
-build-with-OpenSSL-4.0.patch b/meta-oe/recipes-connectivity/thrift/thrift/=
0001-TSSLSocket-fix-build-with-OpenSSL-4.0.patch
new file mode 100644
index 0000000000..965f024b6e
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift/0001-TSSLSocket-fix-build-=
with-OpenSSL-4.0.patch
@@ -0,0 +1,113 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 27 Aug 2026 11:00:00 +0000
+Subject: [PATCH] Fix build with OpenSSL 4.0
+
+OpenSSL 4.0 removes SSLv3_method(), per-version TLS method functions,
+ERR_remove_state(), ASN1_STRING_data(), and returns const pointers
+from X509 accessor functions.
+
+C++ (TSSLSocket.cpp):
+- Guard SSLv3 and TLS version methods with version check
+- Replace ASN1_STRING_data with ASN1_STRING_get0_data
+- Add const qualifiers for X509_NAME, X509_NAME_ENTRY, ASN1_STRING
+
+C (thrift_ssl_socket.c):
+- Remove ERR_remove_state() calls (no-op since OpenSSL 1.1)
+- Guard SSLv3 and TLS version methods with version check
+
+Upstream-Status: Submitted [https://github.com/apache/thrift/pull/3752]
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+diff --git a/lib/cpp/src/thrift/transport/TSSLSocket.cpp b/lib/cpp/src/thr=
ift/transport/TSSLSocket.cpp
+--- a/lib/cpp/src/thrift/transport/TSSLSocket.cpp	2026-08-27 11:26:40.2420=
05669 +0000
++++ b/lib/cpp/src/thrift/transport/TSSLSocket.cpp	2026-08-27 11:26:40.2630=
05736 +0000
+@@ -182,16 +182,18 @@
+ SSLContext::SSLContext(const SSLProtocol& protocol) {
+   if (protocol =3D=3D SSLTLS) {
+     ctx_ =3D SSL_CTX_new(SSLv23_method());
+-#ifndef OPENSSL_NO_SSL3
++#if !defined(OPENSSL_NO_SSL3) && OPENSSL_VERSION_NUMBER < 0x40000000L
+   } else if (protocol =3D=3D SSLv3) {
+     ctx_ =3D SSL_CTX_new(SSLv3_method());
+ #endif
++#if OPENSSL_VERSION_NUMBER < 0x40000000L
+   } else if (protocol =3D=3D TLSv1_0) {
+     ctx_ =3D SSL_CTX_new(TLSv1_method());
+   } else if (protocol =3D=3D TLSv1_1) {
+     ctx_ =3D SSL_CTX_new(TLSv1_1_method());
+   } else if (protocol =3D=3D TLSv1_2) {
+     ctx_ =3D SSL_CTX_new(TLSv1_2_method());
++#endif
+   } else {
+     /// UNKNOWN PROTOCOL!
+     throw TSSLException("SSL_CTX_new: Unknown protocol");
+@@ -770,7 +772,7 @@
+       if (name =3D=3D nullptr) {
+         continue;
+       }
+-      char* data =3D (char*)ASN1_STRING_data(name->d.ia5);
++      const char* data =3D (const char*)ASN1_STRING_get0_data(name->d.ia5=
);
+       int length =3D ASN1_STRING_length(name->d.ia5);
+       switch (name->type) {
+       case GEN_DNS:
+@@ -796,19 +798,19 @@
+   }
+=20
+   // extract commonName
+-  X509_NAME* name =3D X509_get_subject_name(cert);
++  const X509_NAME* name =3D X509_get_subject_name(cert);
+   if (name !=3D nullptr) {
+-    X509_NAME_ENTRY* entry;
++    const X509_NAME_ENTRY* entry;
+     unsigned char* utf8;
+     int last =3D -1;
+     while (decision =3D=3D AccessManager::SKIP) {
+-      last =3D X509_NAME_get_index_by_NID(name, NID_commonName, last);
++      last =3D X509_NAME_get_index_by_NID((X509_NAME *)name, NID_commonNa=
me, last);
+       if (last =3D=3D -1)
+         break;
+       entry =3D X509_NAME_get_entry(name, last);
+       if (entry =3D=3D nullptr)
+         continue;
+-      ASN1_STRING* common =3D X509_NAME_ENTRY_get_data(entry);
++      const ASN1_STRING* common =3D X509_NAME_ENTRY_get_data(entry);
+       int size =3D ASN1_STRING_to_UTF8(&utf8, common);
+       if (host.empty()) {
+         host =3D (server() ? getPeerHost() : getHost());
+diff --git a/lib/c_glib/src/thrift/c_glib/transport/thrift_ssl_socket.c b/=
lib/c_glib/src/thrift/c_glib/transport/thrift_ssl_socket.c
+--- a/lib/c_glib/src/thrift/c_glib/transport/thrift_ssl_socket.c	2026-08-2=
7 11:26:40.245005679 +0000
++++ b/lib/c_glib/src/thrift/c_glib/transport/thrift_ssl_socket.c	2026-08-2=
7 11:26:52.923045957 +0000
+@@ -285,7 +285,6 @@
+       SSL_shutdown(ssl_socket->ssl);
+       SSL_free(ssl_socket->ssl);
+       ssl_socket->ssl =3D NULL;
+-      ERR_remove_state(0);
+   }
+   return thrift_socket_close(transport, error);
+ }
+@@ -710,7 +709,6 @@
+   ERR_free_strings();
+   EVP_cleanup();
+   CRYPTO_cleanup_all_ex_data();
+-  ERR_remove_state(0);
+ }
+=20
+=20
+@@ -835,6 +833,7 @@
+     case SSLTLS:
+       context =3D SSL_CTX_new(SSLv23_method());
+       break;
++#if OPENSSL_VERSION_NUMBER < 0x40000000L
+ #ifndef OPENSSL_NO_SSL3
+     case SSLv3:
+       context =3D SSL_CTX_new(SSLv3_method());
+@@ -849,6 +848,7 @@
+     case TLSv1_2:
+       context =3D SSL_CTX_new(TLSv1_2_method());
+       break;
++#endif /* OPENSSL_VERSION_NUMBER < 0x40000000L */
+     default:
+       g_set_error (error, THRIFT_TRANSPORT_ERROR,
+ 		   THRIFT_SSL_SOCKET_ERROR_CIPHER_NOT_AVAILABLE,
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.24.0.bb b/meta-oe=
/recipes-connectivity/thrift/thrift_0.24.0.bb
index 6a5efdabdf..aa822d8696 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.24.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.24.0.bb
@@ -10,6 +10,7 @@ DEPENDS =3D "thrift-native boost flex-native bison-native=
 openssl zlib"
=20
 SRC_URI =3D "https://downloads.apache.org/${BPN}/${PV}/${BP}.tar.gz \
            file://0001-DefineInstallationPaths.cmake-Define-libdir-in-term=
s.patch \
+           file://0001-TSSLSocket-fix-build-with-OpenSSL-4.0.patch \
            "
 SRC_URI[sha256sum] =3D "e0fa5839a4c5c1d631b0931cf2c554ebbfa4e2fee3a9fb3ffd=
4f82ce4396c6e4"
=20

