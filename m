Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B325C61DCB
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 18:53:53 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.34])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1792.1787856828028904020
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2026 11:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=kgYN8/tX;
 spf=pass (domain: est.tech, ip: 52.101.65.34, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bqeBWvgDNFMXUMypxi7UDQVc/UXKhcG9bvvMPQzOrNSuszBNw6Mda+Mp3k6+W5oLxjZ6ad2f5pR+DGO1hjzzOctE/m6ah/VS8xh+iY53e432efoz0u7xVNBDTjaDDtEswnRQq38wYJeQliJkdliOU3NrM/GidVoTN0x39juNAZEEAtCo8vgAohKjpSq+CMk8Z+px71+9b10TyQXMnR4s6bxkUN4YbgRtQ0tEdanfLIyImXjaA1bi5bAdV9hoMc7YFAZ1OHMzEF6gDyqp5PHX+vjIqeIisG6j96tITn9t2sCrP9LFCE204Mgwq0eyxgDIWSM9tUk6RbpZ7mLlB17UZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYztJfoUtIKw1DihbXduiahg7ZhoZyPSHxNnGfP/dhM=;
 b=n4Z+V3FKLGg1SSWvGjRQg/AguRyi6TDXxZApgHWZzpVNZoG2tgbl+PpyYUz8QMStn9BTMvSzptJqWnGJLrlvkYmvPrze21w6uOO9lWv2pTJ0er2RhWRyyaGsUF5Qs/lOz1fLwNQ4EhqoUN7m2pm+IQNpNDbEUyHt5r+UdsHU6mZLrby/t3fLbbucuNNnjZN43hCAMegTojtDnMYZ6by4PtH1Wg0qP24YhvS9jMtNBfeb/KI8lcVhwz1j8Lt+cqhjUZSn1X+2ogMvtPCeXU1Gl2n/Sx10/f2VHYHH5DYyMuNaScWR4F27yJXdZ/I3Cts3nvn7tTgPkIfrpDLEsr5gCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYztJfoUtIKw1DihbXduiahg7ZhoZyPSHxNnGfP/dhM=;
 b=kgYN8/tXfAibXEPFAsIS87O+yCrkaauCbaHRW8mUIqiUrmhzHBg+04fEvu0hCGXKsNqfEdzLr/Fu4XLi/BC6vQACPqQPeTOdN3NLQCxpwEwsy+0hL6Gfy8Qqpskl9oGR/yzMevvZmKUiy5fi6Efuhzqf2pn1nZdYXGWWHmdgxEdlbSlBDT1swcTcZgWw4ZtUFi3fjFjzveO+npzbL+Cz60veNikcGjCDLU+gzn1RE+sTGzOzrS5/p5z0mqenVRmOqw/t6U2XotZrPJ6921ybnVIvn9/2HhM/xP1nhTxyUEhCWwSpOih4WNmdAgXUBVDclmX1RG+vIQvAPGwUw3rTdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB9P189MB3598.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5fc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 18:53:44 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 18:53:44 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [meta-oe][RFC 07/20] grpc: fix build with OpenSSL 4.0
Date: Thu, 27 Aug 2026 20:53:11 +0200
Message-ID: <20260827185324.78997-8-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
References: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO6P123CA0031.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::11) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB9P189MB3598:EE_
X-MS-Office365-Filtering-Correlation-Id: aa6b3f7b-e89f-43c5-5edf-08df046c8500
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10070799003|10067099003|56012099006|11063799006|6133799003|3023799007|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	3MSC0FFYwudxI/eXfWPjNz+rt1CsmDuh5B/XxT9UxXtX/jMZ9RvIlxQOfgyijerAwm49XZ9QFoI+7o6W8QOMtIN/tuqM9O3pU8k4CsORIOHFPyQ9SB9JOLLCG8eSKKI5YzRqFBaLur87hTxakopnq36qgs/Gevem7lgnG0qJ4L2y59UG85BboLEQ9GAZrlAG1L5IdwNHrdWg0vvKJ5TYOpLjBOL/Kk3+ttUaSiSi0RwtTPxLtc/FZrDDqlUuFz/Ke4AJel1OeeBq1GhADNCZ18aJEFVowW5R180w/9jCqBAqcvdt9Ev89O8YJLqOXDGuP4a9uh+7vuIiL26wCiI/rDU52xFI2hAaDTMe5qIlSZ9Yf50wVGZn3V48plcsiIXGb/pqrndtqFewkZcoOuHpLz5j3tNYSbTRhQD4qDThxWw7wxZb6wmDMr/AgXTUg4wnSD0xbWOyK+tz0HbHrFB+7uH7BL3EscIHk/kbEfZv5x4T+RiRHnhP+HDvKm7VMfQTM4Ff0FLcZnF8LVCQmITifJVnkpuh6nKO70IG3nINeXnH6D83Ugra1+R+HnmdX2NIhKWebYgrAuktjBLwTGXZjT4AODDIOXS0x0s7Ma/ZkqhxVVKJxeZ22AFJeTfIM3J3jIpsivO3TyFcBs5t/mZI/tFi5qheDHwKrbWfkEv5tfA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10070799003)(10067099003)(56012099006)(11063799006)(6133799003)(3023799007)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kLjzKvoXvkkNUzvXpP+qEPq7Q596rhSuQoAVQnuyS1vFNgZHPvKsAJh1itOg?=
 =?us-ascii?Q?bZiAHSfQizjjGWOEVcLUMMazcBo3n7HAMO/Yzc2jWqPqVXsrBVNBwp+rTuP2?=
 =?us-ascii?Q?55BiEgl88Q+myH12CR3VT0Vx1btmP+tM/kjoUKFPOwAmix0qKioi9DN2ACLW?=
 =?us-ascii?Q?ZEp9UcBfTgk4MGVW3QnVsoiHE8Otl1dXQrXehBxnWvQooWIOH570DCjafam1?=
 =?us-ascii?Q?3ArCIFIgfa3AcbN4YLqPHjV7jdeYJ4KGOEidHg4TFpLYtjelMa5JfuHvgBPp?=
 =?us-ascii?Q?uLsHfWGxTxzOd9XzlGxsI9KkdFjluzDztleVLLSQcz8lGS7HZkgQDzvOOZ8K?=
 =?us-ascii?Q?QFKRnRIGqoFixRJVcoNoXjp3wryIp1prejUor3cKzo6fXg7D3yvOcVfgk3xP?=
 =?us-ascii?Q?iBbAfbNqBZBaKvVr2/M8doeW74n6O/+menB53WLezYc2rN0Cum/gaMNWqajA?=
 =?us-ascii?Q?YwW9/tPQg6rGo2c54j+/YbNYH80jqN2QtQRcfKeO904Qz4H5LJ9/mYUhR5D1?=
 =?us-ascii?Q?AaZgDBaIahq/bsvt7EMAzU86MYu0hPLlds4cxEMCcYyaO7WxWrQPOi04+QiC?=
 =?us-ascii?Q?lHtpBmKI3dzD/bF3p0WhXatNUwWnudSwA3byUM9Vds8ScNUCgRhI5LYSGHLB?=
 =?us-ascii?Q?61+iLFsblAsuE713HxXY5SmgdfNef62D8QKNNEkUBafGZ1z6mQUv9zUXK+Iy?=
 =?us-ascii?Q?epyLDh9aKRnuD8jZxqqH5hnPTYEI9DE7iW1RX9pFcJI9u2NKsykWtT59fkVq?=
 =?us-ascii?Q?XNv19hQqx7BdkqdtpTXCtpwLCpnCMJ4sXe84MWYJORphEohVuJXUzbPmxo/W?=
 =?us-ascii?Q?LsiIYMqOwTQ6UfgF8KCIdN8IgJwq+1PxT+rvKpbTX1XYfjBDTFEvP3Jkp0Yg?=
 =?us-ascii?Q?9bGr5DMyJxfDcelwQlhbhz8UKooVCfwbP8i4Y/So+rbjzz2ev7cyoyztMSpB?=
 =?us-ascii?Q?zT34CqgPxv5iNMYUuk/3NShoC9yNfXHQmUeMvhCjSc6GBeB4q6IZgptzU22d?=
 =?us-ascii?Q?RPOSmF5GlfQu4rhRvfRBV6U4XlYyss6MzS/IvV1vv//XRQ7qQagsUoftO+Xz?=
 =?us-ascii?Q?6W8UTUK/b6OZVyN8bwg3jPKhSyqJUccntsd7LUv8+fhF7S3oc+A6UgLCELr9?=
 =?us-ascii?Q?Yb5q55IqqFwItHl0NPeonZoNzmko0hvGLuJtfiFqIP2/RwLDlsOXnhk6+HB9?=
 =?us-ascii?Q?9irr7s6A7UxA0BMLb7LGF/QlhPoXd9OWKecVTQqjzHBAnoIMcf7fuuuIm5et?=
 =?us-ascii?Q?NHD0WitjT36Axzkco78V7vGJyy1HVovHODORB3KntRPXhJdsLhOzp+iREl6k?=
 =?us-ascii?Q?TGBicz3iQBgczzxStfbJ1+YL+N9Yt8Iyc0619HsLIUMoD1aIU1n+Rj9WBWpr?=
 =?us-ascii?Q?/RuOH9rep5P3tESLdC6drampdV5S2enBTs1fI1lGGDy/+Za3rfBp0VBnVsx9?=
 =?us-ascii?Q?G6fx+Q2UFTeqpy6qasVtjhBA0rapjNIoD3b163BRv7ewcUS42eqHa7BPwYBK?=
 =?us-ascii?Q?jHP1yjFgZr4C/6rnZ2+HR14WMfzCq9xk17pyX1Z9AYzQPM0wvM+GyQjoOj+n?=
 =?us-ascii?Q?9Ct2TtkC+JCH6/s6bzRPD5zQwtXjNqs7/DglaYEfw9dFqedjJXzm4YvpbfSs?=
 =?us-ascii?Q?nrHTqy007QtexBm2bVKheoMfNArNIgnpdpQ3Enmpq15ZjFl4kE/UJLr72+x3?=
 =?us-ascii?Q?9V5SCyu+BUCgw7pJH0ve82vS5Aibs5fZng21HlKygVm/uiZMwjXnsY+Jsf7/?=
 =?us-ascii?Q?dSFDcoFKKGMlDP53as6U6OJATeLNltNj0tOcK5ThheuwnzTrSLyo9u4I5Hbz?=
X-MS-Exchange-AntiSpam-MessageData-1: XM5LKSKbuWf5M8K1hbCowOeV4rOBJh+yQiI=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: aa6b3f7b-e89f-43c5-5edf-08df046c8500
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 18:53:44.5303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WMhjHCs1196mJlqaA/0arUTt9mt5l51iQpZ9b1po3cnnBKycfoONtCB5k/1tpRZrdpLZ0VeSoGkKjnnyRzpnX4zY3rkuzmQyCMaWpG2E7/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB3598
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 18:53:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129542

OpenSSL 4.0 returns const pointers from X509 accessor functions,
makes ASN1_OCTET_STRING opaque, and deprecates HMAC one-shot API.

Four patches addressing credentials, TSI transport security, and
TSI utils.

Upstream-Status: Submitted [https://github.com/grpc/grpc/pull/41932]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...ls-Fix-OpenSSL-3.0-4.0-compatibility.patch | 85 +++++++++++++++++++
 ...L-4.0-const-and-opaque-compatibility.patch | 59 +++++++++++++
 ...sport_security_utils-for-OpenSSL-4.0.patch | 61 +++++++++++++
 ...ing-const-qualifiers-for-OpenSSL-4.0.patch | 47 ++++++++++
 meta-oe/recipes-devtools/grpc/grpc_1.83.0.bb  |  4 +
 5 files changed, 256 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-credentials-Fix=
-OpenSSL-3.0-4.0-compatibility.patch
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc/0002-tsi-fix-OpenSSL=
-4.0-const-and-opaque-compatibility.patch
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc/0003-tsi-fix-ssl_tra=
nsport_security_utils-for-OpenSSL-4.0.patch
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc/0004-tsi-fix-remaini=
ng-const-qualifiers-for-OpenSSL-4.0.patch

diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-credentials-Fix-OpenSS=
L-3.0-4.0-compatibility.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-cre=
dentials-Fix-OpenSSL-3.0-4.0-compatibility.patch
new file mode 100644
index 0000000000..f062ecce08
--- /dev/null
+++ b/meta-oe/recipes-devtools/grpc/grpc/0001-credentials-Fix-OpenSSL-3.0-4=
.0-compatibility.patch
@@ -0,0 +1,85 @@
+From b07ee3b98c30251094692b84d1253e3ca881ff96 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Bj=3DC3=3DB6rn=3D20Svensson?=3D <bjorn.a.svensson@est.te=
ch>
+Date: Tue, 24 Mar 2026 13:12:07 +0100
+Subject: [PATCH] credentials: Fix OpenSSL 3.0+/4.0 compatibility
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+- Guard openssl/hmac.h include behind OpenSSL < 3.0 version check
+- Replace one-shot HMAC() with EVP_Q_mac() for OpenSSL 3.0+
+- Handle X509_CRL_get_issuer() which returns const in OpenSSL 4.0,
+  with const_cast for i2d_X509_NAME()
+
+Signed-off-by: Bj=C3=B6rn Svensson <bjorn.a.svensson@est.tech>
+Upstream-Status: Submitted [https://github.com/grpc/grpc/pull/41932]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ .../credentials/call/external/aws_request_signer.cc | 13 +++++++++++++
+ .../transport/tls/grpc_tls_crl_provider.cc          |  4 ++--
+ 2 files changed, 15 insertions(+), 2 deletions(-)
+
+diff --git a/src/core/credentials/call/external/aws_request_signer.cc b/sr=
c/core/credentials/call/external/aws_request_signer.cc
+index f7fb7a25b1d0b..26c70ccc7c174 100644
+--- a/src/core/credentials/call/external/aws_request_signer.cc
++++ b/src/core/credentials/call/external/aws_request_signer.cc
+@@ -18,7 +18,9 @@
+ #include <grpc/support/port_platform.h>
+ #include <openssl/crypto.h>
+ #include <openssl/evp.h>
++#if OPENSSL_VERSION_NUMBER < 0x30000000L
+ #include <openssl/hmac.h>
++#endif
+ #include <openssl/sha.h>
+=20
+ #include <utility>
+@@ -41,6 +43,7 @@ namespace {
+=20
+ #if OPENSSL_VERSION_NUMBER >=3D 0x30000000L
+ const char kSha256[] =3D "SHA256";
++const char kHmacName[] =3D "HMAC";
+ #endif
+ const char kAlgorithm[] =3D "AWS4-HMAC-SHA256";
+ const char kDateFormat[] =3D "%a, %d %b %E4Y %H:%M:%S %Z";
+@@ -67,12 +70,22 @@ std::string SHA256Hex(const std::string& str) {
+ }
+=20
+ std::string HMAC(const std::string& key, const std::string& msg) {
++#if OPENSSL_VERSION_NUMBER < 0x30000000L
+   unsigned int len;
+   unsigned char digest[EVP_MAX_MD_SIZE];
+   HMAC(EVP_sha256(), key.c_str(), key.length(),
+        reinterpret_cast<const unsigned char*>(msg.c_str()), msg.length(),
+        digest, &len);
+   return std::string(digest, digest + len);
++#else
++  size_t len =3D 0;
++  unsigned char digest[EVP_MAX_MD_SIZE];
++  EVP_Q_mac(nullptr, kHmacName, nullptr, kSha256, nullptr,
++            reinterpret_cast<const unsigned char*>(key.c_str()), key.leng=
th(),
++            reinterpret_cast<const unsigned char*>(msg.c_str()), msg.leng=
th(),
++            digest, sizeof(digest), &len);
++  return std::string(digest, digest + len);
++#endif
+ }
+=20
+ }  // namespace
+diff --git a/src/core/credentials/transport/tls/grpc_tls_crl_provider.cc b=
/src/core/credentials/transport/tls/grpc_tls_crl_provider.cc
+index 7bd4c5ab0b49f..99ed93d5d2944 100644
+--- a/src/core/credentials/transport/tls/grpc_tls_crl_provider.cc
++++ b/src/core/credentials/transport/tls/grpc_tls_crl_provider.cc
+@@ -56,12 +56,12 @@ absl::StatusOr<std::string> IssuerFromCrl(X509_CRL* cr=
l) {
+   if (crl =3D=3D nullptr) {
+     return absl::InvalidArgumentError("crl cannot be null");
+   }
+-  X509_NAME* issuer =3D X509_CRL_get_issuer(crl);
++  auto* issuer =3D X509_CRL_get_issuer(crl);
+   if (issuer =3D=3D nullptr) {
+     return absl::InvalidArgumentError("crl cannot have null issuer");
+   }
+   unsigned char* buf =3D nullptr;
+-  int len =3D i2d_X509_NAME(issuer, &buf);
++  int len =3D i2d_X509_NAME(const_cast<X509_NAME*>(issuer), &buf);
+   if (len < 0 || buf =3D=3D nullptr) {
+     return absl::InvalidArgumentError("crl cannot have null issuer");
+   }
diff --git a/meta-oe/recipes-devtools/grpc/grpc/0002-tsi-fix-OpenSSL-4.0-co=
nst-and-opaque-compatibility.patch b/meta-oe/recipes-devtools/grpc/grpc/000=
2-tsi-fix-OpenSSL-4.0-const-and-opaque-compatibility.patch
new file mode 100644
index 0000000000..afaaf509ad
--- /dev/null
+++ b/meta-oe/recipes-devtools/grpc/grpc/0002-tsi-fix-OpenSSL-4.0-const-and=
-opaque-compatibility.patch
@@ -0,0 +1,59 @@
+From 42693a829197a9120816fa91b9ce55535d798b28 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Wed, 26 Aug 2026 19:50:00 +0000
+Subject: [PATCH] tsi: fix OpenSSL 4.0 const and opaque type compatibility
+
+OpenSSL 4.0 returns const pointers from X509_get_subject_name(),
+X509_get_issuer_name(), X509_get0_serialNumber() and makes
+ASN1_OCTET_STRING opaque. Use auto* to deduce correct const type
+and use ASN1_STRING accessors for opaque struct access.
+
+Upstream-Status: Submitted [https://github.com/grpc/grpc/pull/41932]
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/core/tsi/ssl_transport_security.cc | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/core/tsi/ssl_transport_security.cc b/src/core/tsi/ssl_tra=
nsport_security.cc
+index 922bb836e14..ee2092acece 100644
+--- a/src/core/tsi/ssl_transport_security.cc
++++ b/src/core/tsi/ssl_transport_security.cc
+@@ -893,7 +893,7 @@ static tsi_result ssl_get_x509_common_name(X509* cert,=
 unsigned char** utf8,
+   int common_name_index =3D -1;
+   X509_NAME_ENTRY* common_name_entry =3D nullptr;
+   ASN1_STRING* common_name_asn1 =3D nullptr;
+-  X509_NAME* subject_name =3D X509_get_subject_name(cert);
++  auto* subject_name =3D X509_get_subject_name(cert);
+   int utf8_returned_size =3D 0;
+   if (subject_name =3D=3D nullptr) {
+     VLOG(2) << "Could not get subject name from certificate.";
+@@ -951,7 +951,7 @@ static tsi_result peer_property_from_x509_common_name(
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
+@@ -1047,16 +1047,16 @@ static tsi_result add_subject_alt_names_properties=
_to_peer(
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
diff --git a/meta-oe/recipes-devtools/grpc/grpc/0003-tsi-fix-ssl_transport_=
security_utils-for-OpenSSL-4.0.patch b/meta-oe/recipes-devtools/grpc/grpc/0=
003-tsi-fix-ssl_transport_security_utils-for-OpenSSL-4.0.patch
new file mode 100644
index 0000000000..a7d6c0f789
--- /dev/null
+++ b/meta-oe/recipes-devtools/grpc/grpc/0003-tsi-fix-ssl_transport_securit=
y_utils-for-OpenSSL-4.0.patch
@@ -0,0 +1,61 @@
+From d2beead89706a34ade404bfa7bec2f95e9b6225a Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Wed, 26 Aug 2026 19:51:01 +0000
+Subject: [PATCH] tsi: fix ssl_transport_security_utils for OpenSSL 4.0
+
+OpenSSL 4.0 returns const pointers from X509_get_issuer_name(),
+X509_CRL_get_issuer(), and makes ASN1_OCTET_STRING opaque. Use
+auto* for X509_NAME and const for ASN1_OCTET_STRING.
+
+Upstream-Status: Submitted [https://github.com/grpc/grpc/pull/41932]
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/core/tsi/ssl_transport_security_utils.cc | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/core/tsi/ssl_transport_security_utils.cc b/src/core/tsi/s=
sl_transport_security_utils.cc
+index 7318bc3f780..2738ffad923 100644
+--- a/src/core/tsi/ssl_transport_security_utils.cc
++++ b/src/core/tsi/ssl_transport_security_utils.cc
+@@ -282,11 +282,11 @@ bool VerifyCrlCertIssuerNamesMatch(X509_CRL* crl, X5=
09* cert) {
+   if (cert =3D=3D nullptr || crl =3D=3D nullptr) {
+     return false;
+   }
+-  X509_NAME* cert_issuer_name =3D X509_get_issuer_name(cert);
++  auto* cert_issuer_name =3D X509_get_issuer_name(cert);
+   if (cert_issuer_name =3D=3D nullptr) {
+     return false;
+   }
+-  X509_NAME* crl_issuer_name =3D X509_CRL_get_issuer(crl);
++  auto* crl_issuer_name =3D X509_CRL_get_issuer(crl);
+   if (crl_issuer_name =3D=3D nullptr) {
+     return false;
+   }
+@@ -317,7 +317,7 @@ absl::StatusOr<std::string> IssuerFromCert(X509* cert)=
 {
+   if (cert =3D=3D nullptr) {
+     return absl::InvalidArgumentError("cert cannot be null");
+   }
+-  X509_NAME* issuer =3D X509_get_issuer_name(cert);
++  auto* issuer =3D X509_get_issuer_name(cert);
+   unsigned char* buf =3D nullptr;
+   int len =3D i2d_X509_NAME(issuer, &buf);
+   if (len < 0 || buf =3D=3D nullptr) {
+@@ -332,7 +332,7 @@ absl::StatusOr<std::string> AkidFromCertificate(X509* =
cert) {
+   if (cert =3D=3D nullptr) {
+     return absl::InvalidArgumentError("cert cannot be null.");
+   }
+-  ASN1_OCTET_STRING* akid =3D nullptr;
++  const ASN1_OCTET_STRING* akid =3D nullptr;
+   int j =3D X509_get_ext_by_NID(cert, NID_authority_key_identifier, -1);
+   // Can't have multiple occurrences
+   if (j >=3D 0) {
+@@ -357,7 +357,7 @@ absl::StatusOr<std::string> AkidFromCrl(X509_CRL* crl)=
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
diff --git a/meta-oe/recipes-devtools/grpc/grpc/0004-tsi-fix-remaining-cons=
t-qualifiers-for-OpenSSL-4.0.patch b/meta-oe/recipes-devtools/grpc/grpc/000=
4-tsi-fix-remaining-const-qualifiers-for-OpenSSL-4.0.patch
new file mode 100644
index 0000000000..468aa9d669
--- /dev/null
+++ b/meta-oe/recipes-devtools/grpc/grpc/0004-tsi-fix-remaining-const-quali=
fiers-for-OpenSSL-4.0.patch
@@ -0,0 +1,47 @@
+From 12710dde230ae1721e1c7119f51490c239513c41 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 27 Aug 2026 09:42:20 +0000
+Subject: [PATCH] tsi: fix remaining const qualifiers for OpenSSL 4.0
+
+OpenSSL 4.0 returns const pointers from X509_NAME_get_entry(),
+X509_NAME_ENTRY_get_data(), and X509_get_subject_name().
+Combine X509_get_subject_name + X509_NAME_dup into single call
+to avoid const-to-non-const assignment.
+
+Upstream-Status: Submitted [https://github.com/grpc/grpc/pull/41932]
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/core/tsi/ssl_transport_security.cc | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/src/core/tsi/ssl_transport_security.cc b/src/core/tsi/ssl_tra=
nsport_security.cc
+index ee2092acece..23340beda98 100644
+--- a/src/core/tsi/ssl_transport_security.cc
++++ b/src/core/tsi/ssl_transport_security.cc
+@@ -891,8 +891,8 @@ static int looks_like_ip_address(absl::string_view nam=
e) {
+ static tsi_result ssl_get_x509_common_name(X509* cert, unsigned char** ut=
f8,
+                                            size_t* utf8_size) {
+   int common_name_index =3D -1;
+-  X509_NAME_ENTRY* common_name_entry =3D nullptr;
+-  ASN1_STRING* common_name_asn1 =3D nullptr;
++  const X509_NAME_ENTRY* common_name_entry =3D nullptr;
++  const ASN1_STRING* common_name_asn1 =3D nullptr;
+   auto* subject_name =3D X509_get_subject_name(cert);
+   int utf8_returned_size =3D 0;
+   if (subject_name =3D=3D nullptr) {
+@@ -1342,13 +1342,12 @@ static tsi_result x509_store_load_certs(X509_STORE=
* cert_store,
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
diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.83.0.bb b/meta-oe/recipes=
-devtools/grpc/grpc_1.83.0.bb
index 3e03bf510e..34ec8863ac 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.83.0.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.83.0.bb
@@ -27,6 +27,10 @@ SRCREV =3D "c876f4da50f7da2f331888b88b2a7243514139fe"
 BRANCH =3D "v1.83.x"
 SRC_URI =3D "gitsm://github.com/grpc/grpc.git;protocol=3Dhttps;branch=3D${=
BRANCH};tag=3Dv${PV} \
            file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
+           file://0001-credentials-Fix-OpenSSL-3.0-4.0-compatibility.patch=
 \
+           file://0002-tsi-fix-OpenSSL-4.0-const-and-opaque-compatibility.=
patch \
+           file://0003-tsi-fix-ssl_transport_security_utils-for-OpenSSL-4.=
0.patch \
+           file://0004-tsi-fix-remaining-const-qualifiers-for-OpenSSL-4.0.=
patch \
            "
=20
 inherit cmake pkgconfig

