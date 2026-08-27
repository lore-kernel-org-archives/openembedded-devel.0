Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A48C61DB9
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 18:54:13 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1890.1787856851987395423
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2026 11:54:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=b9DZqYOx;
 spf=pass (domain: est.tech, ip: 52.101.65.27, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BA01m84on4jElZlJ3pOgeLuhPd1avhwh5MqXd7I0p7mTha51r4vEUummsOdhRFLx1sk1AmKEqQWTVgxAUWhYMp0i6JxGJvdmA60J54tc7J1lbFE1IkYrMfQbQy3Ki3fb/tfjJVZ7KMTtHuWe4Dce1yFMEcn9uKArwbH6mevD7QmlZ+q3j2NIQzXG2/kdDGO4GZ78puzbntFt2zBu8Zuz8wghluani6EZIjnTZRY9pqBg6/xWKCARNGda45uhPxCRH0LzHL7Gt1ahDJyPfq1jkJqgWgREM6hhdirg13OGTpT+4yq01jCK3JhN7qng1oHpNDfq+u7naKfNae2nkjg9Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQ0Xu3QM/9GbTAaXmaPRDHWrMN9339LODZ3rTXXU9iM=;
 b=DxOPN4M31qPAxlbMMNl+t67Xow8zgjPSZ89KFqEtO+3zUBTdHSxap/lVWbGs5pQoMrG6rX0bX27/7ycW1T7By11efYQIaHoY6lgorj/qjwyoOgQxha4KERKiF6r6PKu9fKkf0osF7+zk9JnCHMDDyTGLO0EZcSFZQfC+p9R+wtAq6dkKNeYYV0dWsnD9AeKYqly0rDQfWJm2VxZydFkVyJ62cin86C4jNtIb9sa8cuA2bqqHT9YCtXP9zdEAZOed3BrgrZnyiVM131LXmdJLsfCffiXPONYh5q23wD/6WG3pcGti/V+fSCIuioio9xWND4BKAW9ZyRKbdXhoOXneUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQ0Xu3QM/9GbTAaXmaPRDHWrMN9339LODZ3rTXXU9iM=;
 b=b9DZqYOxhAuVdeNRIz2gdKk7QPGy9cm1p2/4KiFNITop0I6oyc7jpBUvTSpxFm7aCnb7bmuS8qMIesLvsSztdHm0ZzSLTBD3eouyM3usp5aFhE4PNZETpVymfMXbNUiVbph/BkqPdOdICYF2y/GsbI9OyUJRz7m3NzbfFzRuEFWev4uhmC+m6OdWfaEY2l1uOQ1lIb6TOJgl1XrzKwqtRyvz8lGqPEaBF/3Y3xSDh3AFsbfyDz3OoEr77y3fSUUvetvRKxsMufZohDWSy4HmbEgk+kE+Uhp9er6DUXqy8rwrFxzehUN7Tidr3qd2B23PJ99JqDTCeatsUkqoA1QhoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB9P189MB3598.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5fc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 18:54:09 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 18:54:09 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [meta-networking][RFC 16/20] znc: fix build with OpenSSL 4.0
Date: Thu, 27 Aug 2026 20:53:20 +0200
Message-ID: <20260827185324.78997-17-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
References: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7PR01CA0011.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::14) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB9P189MB3598:EE_
X-MS-Office365-Filtering-Correlation-Id: 70d1e5cc-e7c8-4480-746c-08df046c9401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10070799003|10067099003|56012099006|11063799006|3023799007|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	o0Ljr/Z+Peg1mkKjtNe+Clhqc9DTxWsWP/rLHbim7yV9Nod742htz563FTRz2zY2jMJ5uL7qJPgJgdNx+lam7q+bpryGVuUj8ZkP/EOgUhXs/Hpu1BGMH3OLXvGB8woYb/z6oXmy1iHO6LLAyl0P9xezeZucwoS/3LZhYGY1OiwQdZlmjMZ/eAzx/4oBQ/bSSfG7eg0k/kI+J2g1UlGWPrDx7Ps38ThyRa0M1fDMFkqKMkz2dP3ZXwcG1vkvb5GWmNuTD2SH+e4mfIrfjZ6K8pgQlSF8T5LdfUXzDPRIYOczEqoCnxXKcggS5ndjOjcdtlAk9P7XhXh3fE1PiyqKferl6/a7wNrTYeYfAJKbCtTC829Ga8A6WGxSrHq1fYl7hits8o2s5qLy+KeQqgreFmHiAfgT7w67TLCgoNPF2GnQXAH++lo7FeH5TyG5m8/g7w6aFrNksKIf7wIEQtHIVgvFb7Ib9rc2ZnUA5yaHBblbzccc9RRKQmioNlCjEpKzBr746OxYETk1JDfvGDHKIAt5aoRQy2iYanAhqHY2xaVGx6QT4IqzXZZ9IqIVQZCHVClp2riQb24kCaXOJdmXA1STh3aHpjdb5Kvly/SPeChrH+6RiXIOO9gC0Vt4cAvd/h0v6HjMC8VyLdck2UlVNCVYKckB/DWEZ0BmWPirKPc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10070799003)(10067099003)(56012099006)(11063799006)(3023799007)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ld6hKn17JcVyFS/YWwTK2ctmvt1edfaomOWzwwfZUGtujSZSNzRAXgCAhHb1?=
 =?us-ascii?Q?3nMfX1SM6+/umIr3H+aWvv/1H974mA38Hr3iSLP77AevzC3j0db6zLG5Je67?=
 =?us-ascii?Q?pYsfX8w5EoAaeu8fZsSPLVyEq15AVr+KbtFQ9eEy2MssoQ+DjmUluD1rPpmL?=
 =?us-ascii?Q?fLt8aO8gFJOT5MOAmTut3xYueYKmj4qQyROjmuwih3aQy+zY5mFq6HueVVIt?=
 =?us-ascii?Q?iwVKBMkE8PMaUOnpwaX7pTALfHqoPnK+BjWgIdiJncWq884b3VYyyQyFlJWv?=
 =?us-ascii?Q?tq4pPEYKqtlb43K8Vi5hwqVYxY3pU8MLJIiCNNapSlKxCQJdJa1iVffmtjYP?=
 =?us-ascii?Q?ykQoWIrDrsI02WkaqyVzPeV10wBpw4asP5AtKfE4WhNChZOXhSLgivzeo+/i?=
 =?us-ascii?Q?rvS7XFJ01UgQgI11EiwkUOGCqLtqj2H+N2hwukf624a72Yrjc6GQFycUsC7C?=
 =?us-ascii?Q?EaJtspABS6vScS36LLzlNhKxY+NPbEwkzDESFOsUPIhMElWeMcvbRKrZ8pcf?=
 =?us-ascii?Q?WlsHTEzvus3kaHyrqq/59WBi1Fbt4kPf5GiyfV1pz7lz7OsfqbE1w3h0Luka?=
 =?us-ascii?Q?oi4jJVRbJe0UAV7gzpWaFwqIQVYD2yWSp4adfSq5TkGX73xzaixx+O+LAVo1?=
 =?us-ascii?Q?CAtTnxTx4RL8kGA9RvgHqyE0gSJsECfXg5g/NEYsPIvqO4jgmh56rWjtdiu6?=
 =?us-ascii?Q?d6U+uyXPrHOnwpZ0BHUZlIIfiSj42JFQm8Ly+WyNQ2t7tFiQI2EwwDqVolzW?=
 =?us-ascii?Q?EGvWrNwIUKCDFwLfD+kYfZwoaGd25HOid62TJ4NSyIqH4cHqCNvSmVQMiHVA?=
 =?us-ascii?Q?Tve79qiNXMAMiZ3dRnSEhNc0XK5Zl3iDD4yTXWJLsoMTAtl3lBwEpHeQBfBn?=
 =?us-ascii?Q?tkzO4Hj2dc4kWWT9rvErJFiP4glCaajVqE1hisgeqtMYUL2FnKuyGCWBhssf?=
 =?us-ascii?Q?t1pN+/6GxG3TArMAs7HY93FCA19x7rb9Rx2zmQC+JMRHC2hxWA7tzNvycbwG?=
 =?us-ascii?Q?tfHJxqyImiLLUY3qZtlhgoCrPZhUQI7QeGv/TaqnVaPnqWmRgUqauQbArvlt?=
 =?us-ascii?Q?Ii1mym2z3o0/dszeLCCBQqtHX2yhhH1SnGE4QZM2nabv3aBpt9Vr2lxcO7Bq?=
 =?us-ascii?Q?T6VkKNt+Wsj6T7zCuYNeCB00L65ua4v/YqWmomkAQQV51L2Er1DgDpB8izwQ?=
 =?us-ascii?Q?WDeFIEr6Z8j+RbFEGnB1BzmRFJde9U11WmPyAnRMTXK17BA7gGF2jm2La08V?=
 =?us-ascii?Q?ZblqEAKhUB/kNGVAiYMuId2FtBhi+Qy58hajwVdSXPODXWUOatrqLyJcQ7L3?=
 =?us-ascii?Q?H7BQ+wzveMygHJWpzTTrEpun2aRMOisf0YQ9IQnQOaATDaYxBzTluWgL/GlB?=
 =?us-ascii?Q?CuQbkLgSYD8+WdkCkhXN7mjApDrXgtSineo/0NVN8kplkcyI6/T9ZQPfFMGA?=
 =?us-ascii?Q?MrbdHOnYDgbWSsdh7hyIg9pc1LAuWpHrhqCkFML48kqHM+aYa8cRY4NWr6Co?=
 =?us-ascii?Q?mg7UWAa63/n3+7kroPDu8XFfycMDosKcPkDI3mKhnC3uUj0sGgiGRySUgfMs?=
 =?us-ascii?Q?2UtaIgrz1U60HMh8ips9/DZ6d6Zj9W2HyaHO4xvGhw8uqd9R6zB+SohwHXBY?=
 =?us-ascii?Q?oh5ARUxaMOHsnziQVj7WZzuMnCUuTlejYlxifmC3q8mYRJpoj0Azdk50HXEe?=
 =?us-ascii?Q?oy/vjq1yXbgvHOQMkU6B3xMcRFicRRXB3vYEckEYjYER8ZcBjlmd3X9nh5i9?=
 =?us-ascii?Q?CS2vFBmr22SAElm04Esjdz1os3gG6PIZX3IPS6qQpkD6A2vnsNBWRsPWCS3A?=
X-MS-Exchange-AntiSpam-MessageData-1: w4S3DAhfoZlOvr/7aMwdbowWLrGAQTjR6uw=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d1e5cc-e7c8-4480-746c-08df046c9401
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 18:54:09.6956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dC8/tzHKbJpqfD8OJkKQe+fvXH5m6FtZ6NVJ/uuIUGVriUIO2SiU2PD9SE0Wsr35+5qRY4dHXMwifqsd2H0en5m/ZWjEoGhUxAl/pJNsZOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB3598
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 18:54:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129551

OpenSSL 4.0 adds const qualifiers to X509_NAME and ASN1_STRING
returns. Backport upstream fix.

Upstream-Status: Backport [https://github.com/znc/znc/commit/c6b7fece1ec3]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../0001-Fix-build-error-with-OpenSSL-4.patch | 51 +++++++++++++++++++
 meta-networking/recipes-irc/znc/znc_1.10.2.bb |  4 +-
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-irc/znc/znc/0001-Fix-build-erro=
r-with-OpenSSL-4.patch

diff --git a/meta-networking/recipes-irc/znc/znc/0001-Fix-build-error-with-=
OpenSSL-4.patch b/meta-networking/recipes-irc/znc/znc/0001-Fix-build-error-=
with-OpenSSL-4.patch
new file mode 100644
index 0000000000..7e43eeff7f
--- /dev/null
+++ b/meta-networking/recipes-irc/znc/znc/0001-Fix-build-error-with-OpenSSL=
-4.patch
@@ -0,0 +1,51 @@
+From c6b7fece1ec318c67ed8afa80ef914a135180a4f Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
+Date: Tue, 16 Jun 2026 10:08:17 +0200
+Subject: [PATCH] Fix build error with OpenSSL 4
+
+Upstream-Status: Backport [https://github.com/znc/znc/commit/c6b7fece1ec3]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/SSLVerifyHost.cpp | 4 ++--
+ src/Utils.cpp         | 5 ++++-
+ 2 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/src/SSLVerifyHost.cpp b/src/SSLVerifyHost.cpp
+index ccc20898e2..99b215bc23 100644
+--- a/src/SSLVerifyHost.cpp
++++ b/src/SSLVerifyHost.cpp
+@@ -306,8 +306,8 @@ typedef enum {
+ static HostnameValidationResult matches_common_name(const char* hostname,
+                                                     const X509* server_ce=
rt) {
+     int common_name_loc =3D -1;
+-    X509_NAME_ENTRY* common_name_entry =3D nullptr;
+-    ASN1_STRING* common_name_asn1 =3D nullptr;
++    const X509_NAME_ENTRY* common_name_entry =3D nullptr;
++    const ASN1_STRING* common_name_asn1 =3D nullptr;
+     CONST_ASN1_STRING_DATA char* common_name_str =3D nullptr;
+=20
+     // Find the position of the CN field in the Subject field of the cert=
ificate
+diff --git a/src/Utils.cpp b/src/Utils.cpp
+index ed2c9c8386..744f61d195 100644
+--- a/src/Utils.cpp
++++ b/src/Utils.cpp
+@@ -129,7 +129,8 @@ void CUtils::GenerateCert(FILE* pOut) {
+     sEmailAddr +=3D "@";
+     sEmailAddr +=3D sHostName;
+=20
+-    X509_NAME* pName =3D X509_get_subject_name(pCert.get());
++    X509_NAME* pName =3D X509_NAME_new();
++    if (!pName) return;
+     X509_NAME_add_entry_by_txt(pName, "OU", MBSTRING_ASC,
+                                (unsigned char*)pLogName, -1, -1, 0);
+     X509_NAME_add_entry_by_txt(pName, "CN", MBSTRING_ASC,
+@@ -137,7 +138,9 @@ void CUtils::GenerateCert(FILE* pOut) {
+     X509_NAME_add_entry_by_txt(pName, "emailAddress", MBSTRING_ASC,
+                                (unsigned char*)sEmailAddr.c_str(), -1, -1=
, 0);
+=20
++    X509_set_subject_name(pCert.get(), pName);
+     X509_set_issuer_name(pCert.get(), pName);
++    X509_NAME_free(pName);
+=20
+     if (!X509_sign(pCert.get(), pKey.get(), EVP_sha256())) return;
+=20
diff --git a/meta-networking/recipes-irc/znc/znc_1.10.2.bb b/meta-networkin=
g/recipes-irc/znc/znc_1.10.2.bb
index 7793813234..31984742d8 100644
--- a/meta-networking/recipes-irc/znc/znc_1.10.2.bb
+++ b/meta-networking/recipes-irc/znc/znc_1.10.2.bb
@@ -4,7 +4,9 @@ LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd5=
7"
=20
 DEPENDS =3D "zlib"
-SRC_URI =3D "gitsm://github.com/znc/znc.git;branch=3Dmaster;protocol=3Dhtt=
ps;tag=3D${BP}"
+SRC_URI =3D "gitsm://github.com/znc/znc.git;branch=3Dmaster;protocol=3Dhtt=
ps;tag=3D${BP} \
+           file://0001-Fix-build-error-with-OpenSSL-4.patch \
+           "
=20
 SRCREV =3D "59af2206c62724eec0d8c43d3c1c0b70610ca1d9"
=20

