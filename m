Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B0CC61DC4
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 18:53:53 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.34])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1792.1787856828028904020
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2026 11:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=RcwZReQd;
 spf=pass (domain: est.tech, ip: 52.101.65.34, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eGIyCtV5CU+bDxguiXQfIgKLfBItNiHTH3DvLKiKGr4r8eYzQJmULx+glUVm3cyP7jrU81DrwfKqNaSYYHIWhP+5ahiFy97E6eveAY4v4PuZo4yzk4z8xnadraK8PYQXOzFAYDEWKiBe9RDWl85hmplb4AGt/EQAV7QHCbhRn6RSk+LeW3b9CJRLE+OXgHfQx5kTfBkujrWvBeS7j7pUTK791ocYZqkiW3ye1XNCV4rSFQD02/xhwpJMoLXxnOeHrzAVVvUHbw33/B4DvmrtAsEAq9T08RcaCTQH4Q+dnNFJA/NKjZeqb9oqsUbpfRFtbjQeVXzejzbEcvpKSt2NOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XibuMjmtid6VGfdmsixorMIOuiipgl0ynNHs1lBElfY=;
 b=ewUGlYpw7futLe3nnEF4Vhaguyn4Yv0hkuyZBOLgjL8S6+B//UVC3O1uPxBPy7q2uxBFlO94UT6ALfgKXEMvu/NVvCAvD3ipJlQNyOPSfV8fGyUpuwUQQ/GGMJ2g2VkZvD1hhLElV+J+yF/OWV+uCT1lq7lPiu3ud/o2ntbwyjrJWz3Q0qtIGJtAjBebS9KiIzfrHox36LD+xzTCz9juxPV6vlOvlFzP5Bml3Qn0z98c4KCufzQfO5tFfPIcKdNApLAUnWdyYFKEQfdTCQp+cyLK72IIugezhrJFlXD9jk9kml9LqAq5aNb/ty1xo/Dwf3oTDLOgz4XFlxh+2LGgYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XibuMjmtid6VGfdmsixorMIOuiipgl0ynNHs1lBElfY=;
 b=RcwZReQdBiVkHkmjCiTrr/E2b+2jPcL+XS0oYDSN6n5FMeQlfEIugB4f2DAHHCjGrkD44eGKtngBZDcd+J+fKDghLp2jwUbvsC7qmmOw7D2qektpyE9L0BNk78XxwFxGB6jdh2zsTb4S5of7o3jT05/Qa5vs9Yi5k+bAu5CMIUxBJWNaBPSBp0uDNbLGn60x/nP8QPJlCQ6ypJh2wy3mBLsDRVaiJIYJyP2RfkHj99PW6Bd4keWc2WdFCK4SRX2Op0yHN+bR1GJvK6e52LZcJQDMmmV4IL7jDykvdBMhefQ26R9q/ZK8G9nm+AmY+m7JYEiK2v7IfLjodSWQ8KEeYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB9P189MB3598.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5fc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 18:53:46 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 18:53:46 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [meta-python][RFC 08/20] python3-grpcio: fix build with OpenSSL 4.0
Date: Thu, 27 Aug 2026 20:53:12 +0200
Message-ID: <20260827185324.78997-9-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
References: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0549.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::18) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB9P189MB3598:EE_
X-MS-Office365-Filtering-Correlation-Id: a523530b-08d9-469a-971e-08df046c863d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10070799003|10067099003|56012099006|11063799006|6133799003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	CCPNvvRM0Ox4vQkQs395FQZ9hlMCooy2nWJwikFqIGCVN948iilao0BLKFer0muNIuS1KD2VYtze2OAS0teTAKprGSdNxpSyCOgbUMkb5m80KUtjuQBIVhnxa9zqKG/TupNL5wHH0tl9rAe4S2ugCCx1Uz956Pr7lcTQnQFuXeQKXNLpvibF37e7lsOlFCGGCzPfaE53j/78i+niwYOaK+diXrnY0C+sFC6pz9edh26EaTRiJldeBcMkZoW+sLvuERr/DcUzRv/CsBomRolCbHQRT048SNxP2Hrm4ja0uzgrYQgYMKmNGjAedoaMO51gLN9zwRvkdmj9zqpT/Ug8e+BLCg1VFbhAdLZoOPyQU+nGcHIBWJEf7RJzA+ZkQS9OaeDHVX0sspz9bqCa+LZdxSk1zX8f+w+jesgJ6menIGlvcbO2Lj03TW+WspMPynx0V12nTGY0xkIVKwSMFDms73YGzWuVxzUb/p8+tnwWQmaEc0xivRc5FxGQFJpZYRwfS72hkqrtgWtJvzaafiD8o6HdIyTim6ih9shVAj9dCliaOxulB9z8sMdklthZdSH/BHKW5FflR6X+0O/fdMzu8LOXje6gL5QSaDbyg5Vqwc/IRY2Qx+QPEsx1K24Ja1I0y4lB4B7OhbE6yqafMJymRKfldL2MBKpmIsqF8TFwiPg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10070799003)(10067099003)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LCL0jcaGc8oaH3BH95pZcGj57VepmW3TegFOfz3T6DB7lY7/t9pukE5IUAoU?=
 =?us-ascii?Q?TE+udDK8BE+WlSKL7Au0bnh55riepSkqevS9UBFxl4IHHLEq4H9OSSkNarp7?=
 =?us-ascii?Q?/gmSPvlbLdKHpFy7ZxLdQK5Qa8vRgwD/O4udUaxOubVbR7+TCuVRUK0+eR1L?=
 =?us-ascii?Q?chGe1f9UkeZ5sMiRhZKJJ+KJwxzYvfS2LJeHWupnlWjtroVIwxWJ/h/OGeL2?=
 =?us-ascii?Q?k68m9LetFjUvsC3pWWsgAHnj97nvdr+mWVZzYbHa+LnPSAaLnKfWe5sIbd9s?=
 =?us-ascii?Q?GQSArZ9phu/7uQ83BoOv1FPrS3uFBPZI+weK9I7tHTUgGAbtTxx2V5xunpCi?=
 =?us-ascii?Q?8+ZP7G2xzvyi0eTKQ1jZjUGyD02vzb+pLQ/maH9Ycu1LD8iYhWnetA8B4RKv?=
 =?us-ascii?Q?jdOtKS0aLXiVwU5BSRsq+/qqE7ju6XkfYWLAy2KGsPq9Rr7TGx3097U6nVsA?=
 =?us-ascii?Q?lBxLsFK5bflwppvKPz3oL5bbEu66s3+EWYT82l3q49vHBLMiFf/8DUHrrJoZ?=
 =?us-ascii?Q?uL/ffKVy9AEFltH23TCO697Iya76C/lwv/KkWNKovgNiKNWy3rJRzYg01kDB?=
 =?us-ascii?Q?pfqTqNLJxD2ciRWIXto+HxSM3/RuF92OvchUnZ38D+ddzfwOxDs+P69JEQhy?=
 =?us-ascii?Q?Z0hV/x05md5DV/FeLft5ISfv8mHHKrzKKaUD3IF+k5C5Bn0uQRMHyj/X6wVW?=
 =?us-ascii?Q?699bbWHNKyzc3TN8gf2QjEz/pEjgDWu/9OOTUAUMuRx3wqWlKFUbcjzDVF7+?=
 =?us-ascii?Q?N0DXtmdJnpEcn9kMk+nwX3oFeXMHmmYVLgQzrNUOvz0EDMOdPJzJ4oHLnwsn?=
 =?us-ascii?Q?6JpEbA63B4P5RQ+Z6GNXB1lY42vFwfPvyj9k3PyEJk64mmRmFJ6rVWEpKvy5?=
 =?us-ascii?Q?1rQnuVgvFZ7rh80sGlRF7DriImIi6HW4aA1mAgSheAoNWx1CmY+mNzQZa91I?=
 =?us-ascii?Q?Hqn5z079Qr7UcMRcVhQXKieePdE9M815koqS+EsuTTao6OEnOisR1+9hE3dO?=
 =?us-ascii?Q?q1yAwrPV4dmwTQOHKxtlhW0iiwkGdwwPSV1FXVB97brYy//gTBtCFseLazRa?=
 =?us-ascii?Q?lm3hwRs68nz101zoR8hCdC16o+BjVbURsbU4XumDV6kfj5l5wbYSWiNf2pMY?=
 =?us-ascii?Q?DHKeGIvNOLaBwvMN/8rb4V/kTXS/eco9GQHIVtXcnChwmoeKdReGu6fOouPy?=
 =?us-ascii?Q?pZxGF8Ec6zqXoBJNeR2mTHfTJgTeOYv+K4K9GIf48mewDllU20vqX/dKoO/l?=
 =?us-ascii?Q?fquJIbJ1ZfeL1WeP+j4GlBNzkb+AhIkbiD/gldpG3epyrP+ai6Es9zR/zdIe?=
 =?us-ascii?Q?DrHUI+POHcOCyKxzhcgFQhP7Rm31x3zNfeafdPMCevwA9RPOV4RSTDsWtzhJ?=
 =?us-ascii?Q?qzS4XPkxhCzccL+7FdG8S8VAD2343x3XJPX/xaoK8IAfeY14pDTdCC2w267Y?=
 =?us-ascii?Q?VXDIdV+pYbiQrIInYu6oZ9bJpRKhDGlvJWGeKMtnPog3m6jOK0+T4iuSWtKw?=
 =?us-ascii?Q?5ERVsgYvgHBQHK0GSg6U/kRuC//ffI/kp54TrWU+2fQNf+Dxs71kteNBQ5WS?=
 =?us-ascii?Q?BOagB3xbpxNCa7VsPtvE8QOVFIUMIw50Bmvd5qdAENt1Zdkec0uqXgs62Nho?=
 =?us-ascii?Q?smhE69A0g+e8+tbWc3HKlLP3IRL3gUmB0qRGKIM4VLW53oZQNNvdDWbP6G0p?=
 =?us-ascii?Q?pWhgo5akjduUb/GMOwNHXYDRJI/heRlh75ImzFIEYOcEiLiOyvIPGF59RyQ6?=
 =?us-ascii?Q?8kPokiGo+ibsFHzueI4XRBetGakrsn4UYyxwfExO9KHfo+e7v+wcqa6r6OaR?=
X-MS-Exchange-AntiSpam-MessageData-1: +Z+/kDyGxLN7xthI2TsksobaZUi5WsT48ec=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a523530b-08d9-469a-971e-08df046c863d
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 18:53:46.6135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nf+fgomD2VyDotTSHVlHO6ZJTCMFfl7dkuDXpqMwtOSi/KoNnpG0mitT1iKQ+bH21r/xQVH211q7Is1xdVj612UlodqzQyCulex11Jyhq9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB3598
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 18:53:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129543

python3-grpcio bundles grpc 1.78.0 C core which has the same
OpenSSL 4.0 const and opaque type issues as grpc 1.83.0.

Upstream-Status: Submitted [https://github.com/grpc/grpc/pull/41932]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../0001-Fix-OpenSSL-4.0-compatibility.patch  | 140 ++++++++++++++++++
 .../python/python3-grpcio_1.78.0.bb           |   1 +
 2 files changed, 141 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001=
-Fix-OpenSSL-4.0-compatibility.patch

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-Fix-Op=
enSSL-4.0-compatibility.patch b/meta-python/recipes-devtools/python/python3=
-grpcio/0001-Fix-OpenSSL-4.0-compatibility.patch
new file mode 100644
index 0000000000..895ceab88c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-Fix-OpenSSL-4=
.0-compatibility.patch
@@ -0,0 +1,140 @@
+From 664032e1cee574e5d3874bbf55466448f537ab1a Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 27 Aug 2026 10:55:42 +0000
+Subject: [PATCH] Fix OpenSSL 4.0 compatibility in bundled grpc
+
+OpenSSL 4.0 returns const pointers from X509 accessor functions
+and makes ASN1_OCTET_STRING opaque. Use auto* for const returns
+and ASN1_STRING accessors for opaque access.
+
+Upstream-Status: Submitted [https://github.com/grpc/grpc/pull/41932]
+
+Note: Fixes bundled grpc 1.78.0 C core. Our fix for areas not
+covered by the upstream PR.
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ .../transport/tls/grpc_tls_crl_provider.cc      |  2 +-
+ src/core/tsi/ssl_transport_security.cc          | 17 ++++++++---------
+ src/core/tsi/ssl_transport_security_utils.cc    | 10 +++++-----
+ 3 files changed, 14 insertions(+), 15 deletions(-)
+
+diff --git a/src/core/credentials/transport/tls/grpc_tls_crl_provider.cc b=
/src/core/credentials/transport/tls/grpc_tls_crl_provider.cc
+index 7bd4c5a..22d266e 100644
+--- a/src/core/credentials/transport/tls/grpc_tls_crl_provider.cc
++++ b/src/core/credentials/transport/tls/grpc_tls_crl_provider.cc
+@@ -56,7 +56,7 @@ absl::StatusOr<std::string> IssuerFromCrl(X509_CRL* crl)=
 {
+   if (crl =3D=3D nullptr) {
+     return absl::InvalidArgumentError("crl cannot be null");
+   }
+-  X509_NAME* issuer =3D X509_CRL_get_issuer(crl);
++  auto* issuer =3D X509_CRL_get_issuer(crl);
+   if (issuer =3D=3D nullptr) {
+     return absl::InvalidArgumentError("crl cannot have null issuer");
+   }
+diff --git a/src/core/tsi/ssl_transport_security.cc b/src/core/tsi/ssl_tra=
nsport_security.cc
+index 6526d3f..ff03697 100644
+--- a/src/core/tsi/ssl_transport_security.cc
++++ b/src/core/tsi/ssl_transport_security.cc
+@@ -406,9 +406,9 @@ static int looks_like_ip_address(absl::string_view nam=
e) {
+ static tsi_result ssl_get_x509_common_name(X509* cert, unsigned char** ut=
f8,
+                                            size_t* utf8_size) {
+   int common_name_index =3D -1;
+-  X509_NAME_ENTRY* common_name_entry =3D nullptr;
+-  ASN1_STRING* common_name_asn1 =3D nullptr;
+-  X509_NAME* subject_name =3D X509_get_subject_name(cert);
++  const X509_NAME_ENTRY* common_name_entry =3D nullptr;
++  const ASN1_STRING* common_name_asn1 =3D nullptr;
++  auto* subject_name =3D X509_get_subject_name(cert);
+   int utf8_returned_size =3D 0;
+   if (subject_name =3D=3D nullptr) {
+     VLOG(2) << "Could not get subject name from certificate.";
+@@ -466,7 +466,7 @@ static tsi_result peer_property_from_x509_common_name(
+ static tsi_result peer_property_from_x509_subject(X509* cert,
+                                                   tsi_peer_property* prop=
erty,
+                                                   bool is_verified_root_c=
ert) {
+-  X509_NAME* subject_name =3D X509_get_subject_name(cert);
++  auto* subject_name =3D X509_get_subject_name(cert);
+   if (subject_name =3D=3D nullptr) {
+     GRPC_TRACE_LOG(tsi, INFO) << "Could not get subject name from certifi=
cate.";
+     return TSI_NOT_FOUND;
+@@ -562,16 +562,16 @@ static tsi_result add_subject_alt_names_properties_t=
o_peer(
+       char ntop_buf[INET6_ADDRSTRLEN];
+       int af;
+=20
+-      if (subject_alt_name->d.iPAddress->length =3D=3D 4) {
++      if (ASN1_STRING_length(subject_alt_name->d.iPAddress) =3D=3D 4) {
+         af =3D AF_INET;
+-      } else if (subject_alt_name->d.iPAddress->length =3D=3D 16) {
++      } else if (ASN1_STRING_length(subject_alt_name->d.iPAddress) =3D=3D=
 16) {
+         af =3D AF_INET6;
+       } else {
+         LOG(ERROR) << "SAN IP Address contained invalid IP";
+         result =3D TSI_INTERNAL_ERROR;
+         break;
+       }
+-      const char* name =3D inet_ntop(af, subject_alt_name->d.iPAddress->d=
ata,
++      const char* name =3D inet_ntop(af, ASN1_STRING_get0_data(subject_al=
t_name->d.iPAddress),
+                                    ntop_buf, INET6_ADDRSTRLEN);
+       if (name =3D=3D nullptr) {
+         LOG(ERROR) << "Could not get IP string from asn1 octet.";
+@@ -855,13 +855,12 @@ static tsi_result x509_store_load_certs(X509_STORE* =
cert_store,
+       break;  // We're at the end of stream.
+     }
+     if (root_names !=3D nullptr) {
+-      root_name =3D X509_get_subject_name(root);
++      root_name =3D X509_NAME_dup(X509_get_subject_name(root));
+       if (root_name =3D=3D nullptr) {
+         LOG(ERROR) << "Could not get name from root certificate.";
+         result =3D TSI_INVALID_ARGUMENT;
+         break;
+       }
+-      root_name =3D X509_NAME_dup(root_name);
+       if (root_name =3D=3D nullptr) {
+         result =3D TSI_OUT_OF_RESOURCES;
+         break;
+diff --git a/src/core/tsi/ssl_transport_security_utils.cc b/src/core/tsi/s=
sl_transport_security_utils.cc
+index 8f6607c..93876bb 100644
+--- a/src/core/tsi/ssl_transport_security_utils.cc
++++ b/src/core/tsi/ssl_transport_security_utils.cc
+@@ -281,11 +281,11 @@ bool VerifyCrlCertIssuerNamesMatch(X509_CRL* crl, X5=
09* cert) {
+   if (cert =3D=3D nullptr || crl =3D=3D nullptr) {
+     return false;
+   }
+-  X509_NAME* cert_issuer_name =3D X509_get_issuer_name(cert);
++  auto* cert_issuer_name =3D X509_get_issuer_name(cert);
+   if (cert =3D=3D nullptr) {
+     return false;
+   }
+-  X509_NAME* crl_issuer_name =3D X509_CRL_get_issuer(crl);
++  auto* crl_issuer_name =3D X509_CRL_get_issuer(crl);
+   if (crl_issuer_name =3D=3D nullptr) {
+     return false;
+   }
+@@ -316,7 +316,7 @@ absl::StatusOr<std::string> IssuerFromCert(X509* cert)=
 {
+   if (cert =3D=3D nullptr) {
+     return absl::InvalidArgumentError("cert cannot be null");
+   }
+-  X509_NAME* issuer =3D X509_get_issuer_name(cert);
++  auto* issuer =3D X509_get_issuer_name(cert);
+   unsigned char* buf =3D nullptr;
+   int len =3D i2d_X509_NAME(issuer, &buf);
+   if (len < 0 || buf =3D=3D nullptr) {
+@@ -331,7 +331,7 @@ absl::StatusOr<std::string> AkidFromCertificate(X509* =
cert) {
+   if (cert =3D=3D nullptr) {
+     return absl::InvalidArgumentError("cert cannot be null.");
+   }
+-  ASN1_OCTET_STRING* akid =3D nullptr;
++  const ASN1_OCTET_STRING* akid =3D nullptr;
+   int j =3D X509_get_ext_by_NID(cert, NID_authority_key_identifier, -1);
+   // Can't have multiple occurrences
+   if (j >=3D 0) {
+@@ -356,7 +356,7 @@ absl::StatusOr<std::string> AkidFromCrl(X509_CRL* crl)=
 {
+   if (crl =3D=3D nullptr) {
+     return absl::InvalidArgumentError("Could not get AKID from crl.");
+   }
+-  ASN1_OCTET_STRING* akid =3D nullptr;
++  const ASN1_OCTET_STRING* akid =3D nullptr;
+   int j =3D X509_CRL_get_ext_by_NID(crl, NID_authority_key_identifier, -1=
);
+   // Can't have multiple occurrences
+   if (j >=3D 0) {
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.78.0.bb b=
/meta-python/recipes-devtools/python/python3-grpcio_1.78.0.bb
index a926ac2baf..5cd530f1c4 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.78.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.78.0.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM =3D " \
 DEPENDS +=3D "c-ares openssl python3-protobuf re2 zlib"
=20
 SRC_URI +=3D "file://0001-python-enable-unbundled-cross-compilation.patch =
\
+           file://0001-Fix-OpenSSL-4.0-compatibility.patch \
            file://abseil-ppc-fixes.patch \
            "
 SRC_URI[sha256sum] =3D "7382b95189546f375c174f53a5fa873cef91c4b8005faa05cc=
5b3beea9c4f1c5"

