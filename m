Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC14C61DD5
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 18:53:42 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1876.1787856818107880496
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2026 11:53:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=xlMdeJ48;
 spf=pass (domain: est.tech, ip: 52.101.69.43, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MH+WoNXiD44fHE5yk73W09Fe10UhxgmqmAGoGPOrnBXGqv3jO+mAKOT2kE+dM0P3WMbuM/6r341DRDv6VguAovJ8Grtla0dSjq+thmIvhlKjlys+nOQQuUU6WR6ohK1YboxIYfVIx/mztIuQl0Rc0VfvXWMP5zN/dIIQWp4icCTlxYusi93t0bCYi10NfYXcUNs3LU++yUfRLyNTqGRfzFlr9oRLrpCFXVOR0FUtxs5xcCzkTDdG6CVNJQag43IKoD/yj+U+CeOb2O0TyZIOI+qXLIv5zTWgMPq9B0tAlSnHkbYGMBMTwoobtZRu8+y87jHmcRWwhUMrshVmWuctnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/CagYaWaGxy0u5qj9hn+pWcjcvczEM8R8BCWjXvlJY=;
 b=vQCqIbAAu0RODJ3FW/kqhsGJXK6ykkGSNPjIpn279Ef/WeyFgrG9rg07nB6LLE3P9GF6NkMAOjkpj+zxowHn4obe8lBxSC8+ybqIMRJv2+tybIydXiNk0fbHHgP3DGLCkHYH4fTiqDx+nATdjDih4boyqCBKs+zXCOcgSG63E02L8pXK4v59s+nKWZVPo5bwaASPESLjQLzmuWSbp/xrsYT8H29ETnrhNe8Da1x0TIUWg6vLs+LyLTihb+2zVTFen3DXPLy9dPKzOTYPh59ScLAgtj/3bRre+qw8ypPQLYf6AdXsayBqFLHDJYg+YZg1/iLC9qjYBP7jqPY3U3jhIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/CagYaWaGxy0u5qj9hn+pWcjcvczEM8R8BCWjXvlJY=;
 b=xlMdeJ48RT6Z/AV3yPUrL1H8TdiCR54oJyughxuSviyAI2r/5/nIUZW2WBTCJ+DBOFLpSrYL4ZZ31S7ltecBDlDsiH7Uu8JLi5ui6ZKQ0gDoqSIqCL3Z5HVk42uuynj/fD319QPXuyYCzHhMGwzaUNvMvgpQVsiDLWdPV3ZROO3uDKQHPipvvs1VuqqBnpy44sl1/GChzKjsi4h4KtWRJo+SPjd7zLkmrqjLRNZx/L88wNFJ/f9xgzS7gbzGQtmuS0dKiKJ9QzNQ7k/K/Ah1qyKnZ59/jcbr/DjCmNY08plgHgoEk5fEEpVyADwEg7QoU9fccU6DwBeANkq73mlRAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB8P189MB0809.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:122::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 18:53:34 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 18:53:33 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [meta-perl][RFC 03/20] libnet-ssleay-perl: fix build with OpenSSL 4.0
Date: Thu, 27 Aug 2026 20:53:07 +0200
Message-ID: <20260827185324.78997-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
References: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO0P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::10) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB8P189MB0809:EE_
X-MS-Office365-Filtering-Correlation-Id: 42f2895f-b76b-4d09-7324-08df046c7ea3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|10070799003|23010399003|376014|22082099003|18002099003|56012099006|13003099007|3023799007|6133799003|11063799006|5023799004|10067099003;
X-Microsoft-Antispam-Message-Info: 
	V+h5T2Z+C0VBNFTNhcg/iZAV7F/JoyUtXhjJq1ROivgov3lTvri3Wgc4AjxOOhurVmEpVV+xyd4QNVSPGeBK4PutfwDQgpKBj8AXD5lFHzKJ7XHVlCW/gwf/MfHH+TqF/dY5a5LYsiwndRRHtlnXRXB+i3ftGne3yDygf//iunMgIXg2QDPXBObydM1p3FumzIKcaQ2PiscZ2eJXb8G0ntD/IAL90EFCQVpcepflJrfvbpbKiv6p/qMLC/tMOtFdkcUeOBq9YACvi1RF9lotMPX7WKOJIdSyRgiFQOFO7e7x73MRJeH0oQeaP3cLdYoAAjMmBbRLtXWVj6e+dE5SDbM79BnYHwm3THNLdr6cr3QyfuAeYR8iykebTx1FeThPUdPqf3b8bgAwmPf2FprEHDg8nsCclLDNJfB5DWMBNy9IqWCl2+U5Vcnph2PUuXSp6r2FqH6Zwe2CGlXvabUD/VjjKtS9AvIIKw6W944WMyrxLj2qvMcoGMZiv0FI9kDx3hEgQRAz2hq/iEbIYuoHQyYfN7rqjiHSlW/kcRQFVAf4VwlUk2AoOILEzfPJqRSu8sFhROIU5YOz3BGOJdbY4i5rFvknZ0n3iw3/9WugdjMfinTkhbjGXLdQE6yEpoGf9LjTmGOb5uDotj2/rhdmS658tZ3wA5XDCC1fLdXlpVU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(13003099007)(3023799007)(6133799003)(11063799006)(5023799004)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?F3S90XwpXCccT6qKgjEPK+npHgurzra7D6jLYD08IUVgjFvvu+gDpgyQUjmG?=
 =?us-ascii?Q?79jCRCHTHh3Pdo1wPFgbPUn7fSRLehdpqlRx5fjPoaYHoP9+kNrhz+f4BTBX?=
 =?us-ascii?Q?nYx0JmJfQ7KZyUYcQ5h39Z3KQvuQ8YdP/4fIFiZnn5y8lJFZHFYajnXMGoDc?=
 =?us-ascii?Q?ZmRGGq4qLS4pks6/zEDwxqmM+vgQCXogi+rqBbGaMwjAMi5OheSv5+W/Yyff?=
 =?us-ascii?Q?LUFQxEqxNq15ywEDMYF/4PcnjkF+RqKHZRA2SzyMJG9VT2QeBTL4WqSk0lWP?=
 =?us-ascii?Q?25Edv7KJdQW5xz9Oor/6D8RHxl0fJlCGDDnwfw3Jyf4ApIJRKcyJEkio0cyz?=
 =?us-ascii?Q?5uTiZMkMx9s10wwEYM0JeNlTzTESKsJNGSoau5JeRg+pKaQ3rP8k8eouyK0x?=
 =?us-ascii?Q?UerKt1EBnI568VJ7wS9W0WE1VK4f4nbgsW8CSmap9acGeYeOGZxXYr6sgRbf?=
 =?us-ascii?Q?UosBBB02jVAHG7NDrpRpWsWIpWcblszmScU99drUGztrFp4N8v2HcQtGtu7S?=
 =?us-ascii?Q?JSNOUHqZ1oLz8zUdu9bJJ7iCFWgTRVUrFAXS/C4hSPZwP80AVttAK0Da4PR9?=
 =?us-ascii?Q?QVHbNHdrgcZ0lPCK6cAyWqtW9aMn5ptt6p1rggzNRrwUcyo0z3XXhJTgZGAx?=
 =?us-ascii?Q?rT4+FBYon/3VooX3XpWkLipOEo0ONUgQdqYD2B6lB8Gq8mEVXrr9Wn7Xfy67?=
 =?us-ascii?Q?FcNM26sovhT89WASiesoubgw2w3hqp82GuwgQ1i9Woyda1VPFPAWoUcRi/Zw?=
 =?us-ascii?Q?mF2iIfyVgFDx3YL32w1lPIK+HSkesOX6H6FEQG6TEyNPYwyG6Vwp5b7lKqZP?=
 =?us-ascii?Q?Fqehq/SH1taWkipe0EFGi914hyod/fm6PsKipJXUCwDDl7Ibdj5Xaq1aO+Wq?=
 =?us-ascii?Q?52EXYtB0L1wamBeTPRAwmtz0M5mvwHDYC8kER/bkb73k+BP7IZBWrattEcqM?=
 =?us-ascii?Q?ZFgqZ1dW/oj+7Pml4pbtho1FJNyhkpk4o0DF8b2CA3Qmit4LWcCUVuaxklie?=
 =?us-ascii?Q?/UbDSBKWTiK/A3cQZFwHGlemzrEupfcmCPlPdv4E8UaZoU0K5gXs1QCnaT1Z?=
 =?us-ascii?Q?7Dd9qf6cra7IfceU9K9vXPaN+fymHZUdTt4JuttyUBbh4yd7C0sj6UTmMMuN?=
 =?us-ascii?Q?HFLUOr8SLYfsEZA1MEs2WRVe6pey3Zx7NZj3VifWMtCUw/XTE8AKzWEZlmzd?=
 =?us-ascii?Q?C2A4He9y5HNECpcwtYpkkGN1rFMu8dmMqnu6L/CrDZrIef79SuEZeaemC4XL?=
 =?us-ascii?Q?7Lr96auqDW+PSkyM5AnzOborn6QUKr/UwTHMesJAHjLxZsT/oOoY7ub7S0lv?=
 =?us-ascii?Q?8kK2aOWQyoE1rJbXHe0QkCur7TgZ0cIK4uLvAVOHtJn8zL1t1G/CrDRjiCkP?=
 =?us-ascii?Q?rnw52YNibCHBkVz+xXpOOvY/73gEDbbFiz7I8Mc2WUUetPmXDlhI0Ci/5zzk?=
 =?us-ascii?Q?qrF3A1t7VkiQX9hqPDdrSikYj2I540zo7GefqapfhuW0tVn1VQQhkPIirmTi?=
 =?us-ascii?Q?yZROgfvcXf/hj7xl3T6S6UOTKuYqmIaCOqVm2O9USgkgSFX05zKCbhD+W126?=
 =?us-ascii?Q?NvunuHDSHKbezuWFwHSDu2utEg+pKoFrDlqRuQ+eKMTo/IJKub3uEJaeXb6Z?=
 =?us-ascii?Q?TTrn5rXFvB0jpgrR/0s+YpvXp7BSXY6fjbWfcWMPg5UXfprbvtGwONB5gFtn?=
 =?us-ascii?Q?btAjpLnev8zcUJiWhwfw7mKwuXPtxnbrhJnfs9CqiegnPgWNOIDzgGiXoGGg?=
 =?us-ascii?Q?t3JdMXfIvR1Qr9x0bzgnf6Wc6X2p2IgJPU75YrJVxohbak58m1iureZIQz18?=
X-MS-Exchange-AntiSpam-MessageData-1: mgLCa8EQkls61s4J4F2wtQaVkTXFvb8bCmk=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f2895f-b76b-4d09-7324-08df046c7ea3
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 18:53:33.8731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gc7lQx8S124sv/j4KP8b0Rb5M5HvhuDygmtsuv5eO9R5wyWzbSMnjm76FwKzcF5wIRxbSaEtyTkeFYpqpADk5pVtTL/MPddCQsXwjTo/apw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0809
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 18:53:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129539

Backport three patches from upstream PR #553 (merged):
- Fix SSLv3 in OpenSSL 4.0.0
- Remove support for some TLS functions
- Support opaque ASN1_STRING

Upstream-Status: Backport [https://github.com/radiator-software/p5-net-ssle=
ay/pull/553]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../0001-Fix-SSLv3-in-OpenSSL-4.0.0.patch     |  34 ++++
 ...emove-support-for-some-TLS-functions.patch | 192 ++++++++++++++++++
 ...SSLeay-to-support-opaque-ASN1_STRING.patch | 175 ++++++++++++++++
 .../libnet/libnet-ssleay-perl_1.96.bb         |   6 +-
 4 files changed, 406 insertions(+), 1 deletion(-)
 create mode 100644 meta-perl/recipes-perl/libnet/libnet-ssleay-perl/0001-F=
ix-SSLv3-in-OpenSSL-4.0.0.patch
 create mode 100644 meta-perl/recipes-perl/libnet/libnet-ssleay-perl/0002-O=
penSSL-4.0.0-remove-support-for-some-TLS-functions.patch
 create mode 100644 meta-perl/recipes-perl/libnet/libnet-ssleay-perl/0003-F=
ix-Net-SSLeay-to-support-opaque-ASN1_STRING.patch

diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/0001-Fix-SSLv=
3-in-OpenSSL-4.0.0.patch b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl=
/0001-Fix-SSLv3-in-OpenSSL-4.0.0.patch
new file mode 100644
index 0000000000..269e39c1bf
--- /dev/null
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/0001-Fix-SSLv3-in-Op=
enSSL-4.0.0.patch
@@ -0,0 +1,34 @@
+From 361b3adc1dd09f70be7bd8972992626a3240b58d Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Michal=3D20Josef=3D20=3DC5=3DA0pa=3DC4=3D8Dek?=3D <mspac=
ek@redhat.com>
+Date: Tue, 14 Apr 2026 12:37:39 +0200
+Subject: [PATCH] Fix SSLv3 in OpenSSL 4.0.0
+
+Support for SSLv3 was removed.
+Upstream-Status: Backport [https://github.com/radiator-software/p5-net-ssl=
eay/pull/553]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ SSLeay.xs | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/SSLeay.xs b/SSLeay.xs
+index 0ed7d967..5407fa1a 100644
+--- a/SSLeay.xs
++++ b/SSLeay.xs
+@@ -2454,7 +2454,7 @@ SSL_CTX_v2_new()
+=20
+ #endif
+ #endif
+-#ifndef OPENSSL_NO_SSL3
++#if !defined(OPENSSL_NO_SSL3) && OPENSSL_VERSION_NUMBER < 0x40000000L
+=20
+ SSL_CTX *
+ SSL_CTX_v3_new()
+@@ -5600,7 +5600,7 @@ SSLv2_method()
+ #endif
+ #endif
+=20
+-#ifndef OPENSSL_NO_SSL3
++#if !defined(OPENSSL_NO_SSL3) && OPENSSL_VERSION_NUMBER < 0x40000000L
+=20
+ const SSL_METHOD *
+ SSLv3_method()
diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/0002-OpenSSL-=
4.0.0-remove-support-for-some-TLS-functions.patch b/meta-perl/recipes-perl/=
libnet/libnet-ssleay-perl/0002-OpenSSL-4.0.0-remove-support-for-some-TLS-fu=
nctions.patch
new file mode 100644
index 0000000000..bad83e9398
--- /dev/null
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/0002-OpenSSL-4.0.0-r=
emove-support-for-some-TLS-functions.patch
@@ -0,0 +1,192 @@
+From 780c7ad4803d0fc8e755bb86e589f84898e65040 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Michal=3D20Josef=3D20=3DC5=3DA0pa=3DC4=3D8Dek?=3D <mspac=
ek@redhat.com>
+Date: Tue, 14 Apr 2026 14:08:00 +0200
+Subject: [PATCH] OpenSSL 4.0.0 remove support for some TLS functions
+
+Removes fixed version TLS methods
+(https://github.com/openssl/openssl/pull/30128)
+Upstream-Status: Backport [https://github.com/radiator-software/p5-net-ssl=
eay/pull/553]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ SSLeay.xs          | 51 ++++++++++++++++++++++++++++++++++++++++------
+ lib/Net/SSLeay.pod | 17 +++++++++-------
+ 2 files changed, 55 insertions(+), 13 deletions(-)
+
+diff --git a/SSLeay.xs b/SSLeay.xs
+index 5407fa1a..ad996d5c 100644
+--- a/SSLeay.xs
++++ b/SSLeay.xs
+@@ -2472,7 +2472,7 @@ SSL_CTX_v23_new()
+      OUTPUT:
+      RETVAL
+=20
+-#if !defined(OPENSSL_NO_TLS1_METHOD)
++#if !defined(OPENSSL_NO_TLS1_METHOD) && OPENSSL_VERSION_NUMBER < 0x400000=
00L
+=20
+ SSL_CTX *
+ SSL_CTX_tlsv1_new()
+@@ -2481,9 +2481,22 @@ SSL_CTX_tlsv1_new()
+      OUTPUT:
+      RETVAL
+=20
++#elif OPENSSL_VERSION_NUMBER >=3D 0x40000000L
++
++SSL_CTX *
++SSL_CTX_tlsv1_new()
++     CODE:
++     RETVAL =3D SSL_CTX_new(TLS_method());
++     if (RETVAL) {
++          SSL_CTX_set_min_proto_version(RETVAL, TLS1_VERSION);
++          SSL_CTX_set_max_proto_version(RETVAL, TLS1_VERSION);
++     }
++     OUTPUT:
++     RETVAL
++
+ #endif
+=20
+-#if (OPENSSL_VERSION_NUMBER >=3D 0x10001001L && !defined(OPENSSL_NO_TLS1_=
1_METHOD)) /* OpenSSL 1.0.1-beta1 */
++#if (OPENSSL_VERSION_NUMBER >=3D 0x10001001L && OPENSSL_VERSION_NUMBER < =
0x40000000L && !defined(OPENSSL_NO_TLS1_1_METHOD)) /* OpenSSL 1.0.1-beta1 *=
/
+=20
+ SSL_CTX *
+ SSL_CTX_tlsv1_1_new()
+@@ -2492,9 +2505,22 @@ SSL_CTX_tlsv1_1_new()
+      OUTPUT:
+      RETVAL
+=20
++#elif OPENSSL_VERSION_NUMBER >=3D 0x40000000L
++
++SSL_CTX *
++SSL_CTX_tlsv1_1_new()
++     CODE:
++     RETVAL =3D SSL_CTX_new(TLS_method());
++     if (RETVAL) {
++          SSL_CTX_set_min_proto_version(RETVAL, TLS1_1_VERSION);
++          SSL_CTX_set_max_proto_version(RETVAL, TLS1_1_VERSION);
++     }
++     OUTPUT:
++     RETVAL
++
+ #endif
+=20
+-#if (OPENSSL_VERSION_NUMBER >=3D 0x10001001L && !defined(OPENSSL_NO_TLS1_=
2_METHOD)) /* OpenSSL 1.0.1-beta1 */
++#if (OPENSSL_VERSION_NUMBER >=3D 0x10001001L && OPENSSL_VERSION_NUMBER < =
0x40000000L && !defined(OPENSSL_NO_TLS1_2_METHOD)) /* OpenSSL 1.0.1-beta1 *=
/
+=20
+ SSL_CTX *
+ SSL_CTX_tlsv1_2_new()
+@@ -2503,6 +2529,19 @@ SSL_CTX_tlsv1_2_new()
+      OUTPUT:
+      RETVAL
+=20
++#elif OPENSSL_VERSION_NUMBER >=3D 0x40000000L
++
++SSL_CTX *
++SSL_CTX_tlsv1_2_new()
++     CODE:
++     RETVAL =3D SSL_CTX_new(TLS_method());
++     if (RETVAL) {
++          SSL_CTX_set_min_proto_version(RETVAL, TLS1_2_VERSION);
++          SSL_CTX_set_max_proto_version(RETVAL, TLS1_2_VERSION);
++     }
++     OUTPUT:
++     RETVAL
++
+ #endif
+=20
+ SSL_CTX *
+@@ -5616,7 +5655,7 @@ SSLv23_server_method()
+ const SSL_METHOD *
+ SSLv23_client_method()
+=20
+-#if !defined(OPENSSL_NO_TLS1_METHOD)
++#if !defined(OPENSSL_NO_TLS1_METHOD) && OPENSSL_VERSION_NUMBER < 0x400000=
00L
+=20
+ const SSL_METHOD *
+ TLSv1_method()
+@@ -5629,7 +5668,7 @@ TLSv1_client_method()
+=20
+ #endif
+=20
+-#if (OPENSSL_VERSION_NUMBER >=3D 0x10001001L && !defined(OPENSSL_NO_TLS1_=
1_METHOD)) /* OpenSSL 1.0.1-beta1 */
++#if (OPENSSL_VERSION_NUMBER >=3D 0x10001001L && OPENSSL_VERSION_NUMBER < =
0x40000000L && !defined(OPENSSL_NO_TLS1_1_METHOD)) /* OpenSSL 1.0.1-beta1 *=
/
+=20
+ const SSL_METHOD *
+ TLSv1_1_method()
+@@ -5642,7 +5681,7 @@ TLSv1_1_client_method()
+=20
+ #endif
+=20
+-#if (OPENSSL_VERSION_NUMBER >=3D 0x10001001L && !defined(OPENSSL_NO_TLS1_=
2_METHOD)) /* OpenSSL 1.0.1-beta1 */
++#if (OPENSSL_VERSION_NUMBER >=3D 0x10001001L && OPENSSL_VERSION_NUMBER < =
0x40000000L && !defined(OPENSSL_NO_TLS1_2_METHOD)) /* OpenSSL 1.0.1-beta1 *=
/
+=20
+ const SSL_METHOD *
+ TLSv1_2_method()
+diff --git a/lib/Net/SSLeay.pod b/lib/Net/SSLeay.pod
+index 554fd119..d947ad39 100644
+--- a/lib/Net/SSLeay.pod
++++ b/lib/Net/SSLeay.pod
+@@ -1575,7 +1575,7 @@ Check openssl doc L<https://www.openssl.org/docs/man=
master/man3/SSL_CTX_new.html
+=20
+ =3Ditem * TLSv1_method, TLSv1_server_method and TLSv1_client_method
+=20
+-B<COMPATIBILITY:> Requires OpenSSL or LibreSSL built with support for TLS=
v1. Server and client methods not available in Net-SSLeay-1.82 and before.
++B<COMPATIBILITY:> Requires OpenSSL or LibreSSL built with support for TLS=
v1. Server and client methods not available in Net-SSLeay-1.82 and before. =
Not available in OpenSSL 4.0.0 and later. Use L</TLS_method> with L</CTX_se=
t_min_proto_version> and L</CTX_set_max_proto_version> instead.
+=20
+ Returns SSL_METHOD structure corresponding to TLSv1 method, the return va=
lue can be later used as a param of L</CTX_new_with_method>.
+=20
+@@ -1587,7 +1587,7 @@ Check openssl doc L<https://www.openssl.org/docs/man=
master/man3/SSL_CTX_new.html
+=20
+ =3Ditem * TLSv1_1_method, TLSv1_1_server_method and TLSv1_1_client_method
+=20
+-B<COMPATIBILITY:> Requires OpenSSL >=3D 1.0.1 or LibreSSL built with supp=
ort for TLSv1.1. Server and client methods not available in Net-SSLeay-1.82=
 and before.
++B<COMPATIBILITY:> Requires OpenSSL >=3D 1.0.1 or LibreSSL built with supp=
ort for TLSv1.1. Server and client methods not available in Net-SSLeay-1.82=
 and before. Not available in OpenSSL 4.0.0 and later. Use L</TLS_method> w=
ith L</CTX_set_min_proto_version> and L</CTX_set_max_proto_version> instead=
.
+=20
+ Returns SSL_METHOD structure corresponding to TLSv1_1 method, the return =
value can be later used as a param of L</CTX_new_with_method>.
+=20
+@@ -1599,7 +1599,7 @@ Check openssl doc L<https://www.openssl.org/docs/man=
master/man3/SSL_CTX_new.html
+=20
+ =3Ditem * TLSv1_2_method, TLSv1_2_server_method and TLSv1_2_client_method
+=20
+-B<COMPATIBILITY:> Requires OpenSSL >=3D 1.0.1 or LibreSSL built with supp=
ort for TLSv1.2. Server and client methods not available in Net-SSLeay-1.82=
 and before.
++B<COMPATIBILITY:> Requires OpenSSL >=3D 1.0.1 or LibreSSL built with supp=
ort for TLSv1.2. Server and client methods not available in Net-SSLeay-1.82=
 and before. Not available in OpenSSL 4.0.0 and later. Use L</TLS_method> w=
ith L</CTX_set_min_proto_version> and L</CTX_set_max_proto_version> instead=
.
+=20
+ Returns SSL_METHOD structure corresponding to TLSv1_2 method, the return =
value can be later used as a param of L</CTX_new_with_method>.
+=20
+@@ -2998,7 +2998,7 @@ Creates a new SSL_CTX object - based on SSLv3_method=
() - as framework to establi
+=20
+ =3Ditem * CTX_tlsv1_new
+=20
+-B<COMPATIBILITY:> Requires OpenSSL or LibreSSL built with support for TLS=
v1.
++B<COMPATIBILITY:> Requires OpenSSL or LibreSSL built with support for TLS=
v1. In OpenSSL 4.0.0 and later, this function is emulated using L</TLS_meth=
od> with L</CTX_set_min_proto_version> and L</CTX_set_max_proto_version> fo=
r backward compatibility. It is recommended to use L</CTX_new> with L</CTX_=
set_min_proto_version> and L</CTX_set_max_proto_version> instead.
+=20
+ Creates a new SSL_CTX object - based on C<TLSv1_method()> - as a framewor=
k for establishing connections using TLSv1.
+=20
+@@ -3008,7 +3008,7 @@ Creates a new SSL_CTX object - based on C<TLSv1_meth=
od()> - as a framework for e
+=20
+ =3Ditem * CTX_tlsv1_1_new
+=20
+-B<COMPATIBILITY:> Requires OpenSSL >=3D 1.0.1 or LibreSSL built with supp=
ort for TLSv1.1.
++B<COMPATIBILITY:> Requires OpenSSL >=3D 1.0.1 or LibreSSL built with supp=
ort for TLSv1.1. In OpenSSL 4.0.0 and later, this function is emulated usin=
g L</TLS_method> with L</CTX_set_min_proto_version> and L</CTX_set_max_prot=
o_version> for backward compatibility. It is recommended to use L</CTX_new>=
 with L</CTX_set_min_proto_version> and L</CTX_set_max_proto_version> inste=
ad.
+=20
+ Creates a new SSL_CTX object - based on C<TLSv1_1_method()> - as a framew=
ork for establishing connections using TLSv1.1.
+=20
+@@ -3018,7 +3018,7 @@ Creates a new SSL_CTX object - based on C<TLSv1_1_me=
thod()> - as a framework for
+=20
+ =3Ditem * CTX_tlsv1_2_new
+=20
+-B<COMPATIBILITY:> Requires OpenSSL >=3D 1.0.1 or LibreSSL built with supp=
ort for TLSv1.2.
++B<COMPATIBILITY:> Requires OpenSSL >=3D 1.0.1 or LibreSSL built with supp=
ort for TLSv1.2. In OpenSSL 4.0.0 and later, this function is emulated usin=
g L</TLS_method> with L</CTX_set_min_proto_version> and L</CTX_set_max_prot=
o_version> for backward compatibility. It is recommended to use L</CTX_new>=
 with L</CTX_set_min_proto_version> and L</CTX_set_max_proto_version> inste=
ad.
+=20
+ Creates a new SSL_CTX object - based on C<TLSv1_2_method()> - as a framew=
ork for establishing connections using TLSv1.2.
+=20
+@@ -3035,7 +3035,10 @@ Creates a new SSL_CTX object based on $meth method
+     #
+     # returns: value corresponding to openssl's SSL_CTX structure (0 on f=
ailure)
+=20
+-    # example
++    # example (recommended, available since OpenSSL 1.1.0)
++    my $ctx =3D Net::SSLeay::CTX_new_with_method(&Net::SSLeay::TLS_method=
);
++
++    # example (TLSv1_method not available in OpenSSL 4.0.0+)
+     my $ctx =3D Net::SSLeay::CTX_new_with_method(&Net::SSLeay::TLSv1_meth=
od);
+=20
+ Check openssl doc L<https://www.openssl.org/docs/manmaster/man3/SSL_CTX_n=
ew.html>
diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/0003-Fix-Net-=
SSLeay-to-support-opaque-ASN1_STRING.patch b/meta-perl/recipes-perl/libnet/=
libnet-ssleay-perl/0003-Fix-Net-SSLeay-to-support-opaque-ASN1_STRING.patch
new file mode 100644
index 0000000000..c1e733ac7b
--- /dev/null
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/0003-Fix-Net-SSLeay-=
to-support-opaque-ASN1_STRING.patch
@@ -0,0 +1,175 @@
+From 929e8eb5ae2953fdb5231588a9d916ae6cffa939 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Michal=3D20Josef=3D20=3DC5=3DA0pa=3DC4=3D8Dek?=3D <mspac=
ek@redhat.com>
+Date: Tue, 14 Apr 2026 14:32:27 +0200
+Subject: [PATCH] Fix Net::SSLeay to support opaque ASN1_STRING
+
+Upstream-Status: Backport [https://github.com/radiator-software/p5-net-ssl=
eay/pull/553]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ SSLeay.xs | 95 +++++++++++++++++++++++++++++++++----------------------
+ 1 file changed, 57 insertions(+), 38 deletions(-)
+
+diff --git a/SSLeay.xs b/SSLeay.xs
+index ad996d5c..2567d81a 100644
+--- a/SSLeay.xs
++++ b/SSLeay.xs
+@@ -2194,35 +2194,41 @@ int ssl_ctx_set_cert_cb_invoke(SSL *ssl, void *arg=
)
+=20
+ time_t ASN1_TIME_timet(ASN1_TIME *asn1t, time_t *gmtoff) {
+     struct tm t;
+-    const char *p =3D (const char*) asn1t->data;
++#if (OPENSSL_VERSION_NUMBER >=3D 0x1010000f && !defined(LIBRESSL_VERSION_=
NUMBER)) || (LIBRESSL_VERSION_NUMBER >=3D 0x2070000fL)
++    const char *p =3D (const char*) ASN1_STRING_get0_data(asn1t);
++#else
++    const char *p =3D (const char*) ASN1_STRING_data(asn1t);
++#endif
++    int asn1t_length =3D ASN1_STRING_length(asn1t);
++    int asn1t_type =3D ASN1_STRING_type(asn1t);
+     size_t msec =3D 0, tz =3D 0, i, l;
+     time_t result;
+     int adj =3D 0;
+=20
+-    if (asn1t->type =3D=3D V_ASN1_UTCTIME) {
+-	if (asn1t->length<12 || asn1t->length>17) return 0;
+-	if (asn1t->length>12) tz =3D 12;
++    if (asn1t_type =3D=3D V_ASN1_UTCTIME) {
++	if (asn1t_length<12 || asn1t_length>17) return 0;
++	if (asn1t_length>12) tz =3D 12;
+     } else {
+-	if (asn1t->length<14) return 0;
+-	if (asn1t->length>14) {
++	if (asn1t_length<14) return 0;
++	if (asn1t_length>14) {
+ 	    if (p[14] =3D=3D '.') {
+ 		msec =3D 14;
+-		for(i=3Dmsec+1;i<asn1t->length && p[i]>=3D'0' && p[i]<=3D'9';i++) ;
+-		if (i<asn1t->length) tz =3D i;
++		for(i=3Dmsec+1;i<(size_t)asn1t_length && p[i]>=3D'0' && p[i]<=3D'9';i++=
) ;
++		if (i<(size_t)asn1t_length) tz =3D i;
+ 	    } else {
+ 		tz =3D 14;
+ 	    }
+ 	}
+     }
+=20
+-    l =3D msec ? msec : tz ? tz : asn1t->length;
++    l =3D msec ? msec : tz ? tz : (size_t)asn1t_length;
+     for(i=3D0;i<l;i++) {
+ 	if (p[i]<'0' || p[i]>'9') return 0;
+     }
+=20
+     /* extract data and time */
+     OPENSSL_cleanse(&t, sizeof(t));
+-    if (asn1t->type =3D=3D V_ASN1_UTCTIME) { /* YY - two digit year */
++    if (asn1t_type =3D=3D V_ASN1_UTCTIME) { /* YY - two digit year */
+ 	t.tm_year =3D (p[0]-'0')*10 + (p[1]-'0');
+ 	if (t.tm_year < 70) t.tm_year +=3D 100;
+ 	i=3D2;
+@@ -2242,11 +2248,11 @@ time_t ASN1_TIME_timet(ASN1_TIME *asn1t, time_t *g=
mtoff) {
+     if (tz) {
+ 	/* TZ is 'Z' or [+-]DDDD and after TZ the string must stop*/
+ 	if (p[tz] =3D=3D 'Z') {
+-	    if (asn1t->length>tz+1 ) return 0;
+-	} else if (asn1t->length<tz+5 || (p[tz]!=3D'-' && p[tz]!=3D'+')) {
++	    if ((size_t)asn1t_length>tz+1 ) return 0;
++	} else if ((size_t)asn1t_length<tz+5 || (p[tz]!=3D'-' && p[tz]!=3D'+')) =
{
+ 	    return 0;
+ 	} else {
+-	    if (asn1t->length>tz+5 ) return 0;
++	    if ((size_t)asn1t_length>tz+5 ) return 0;
+ 	    for(i=3Dtz+1;i<tz+5;i++) {
+ 		if (p[i]<'0' || p[i]>'9') return 0;
+ 	    }
+@@ -4690,7 +4696,11 @@ X509_get_subjectAltNames(cert)
+                          EXTEND(SP, 2);
+                          count++;
+                          PUSHs(sv_2mortal(newSViv(subjAltNameDN->type)));
+-                         PUSHs(sv_2mortal(newSVpv((const char*)subjAltNam=
eDN->d.ip->data, subjAltNameDN->d.ip->length)));
++#if (OPENSSL_VERSION_NUMBER >=3D 0x1010000f && !defined(LIBRESSL_VERSION_=
NUMBER)) || (LIBRESSL_VERSION_NUMBER >=3D 0x2070000fL)
++                         PUSHs(sv_2mortal(newSVpv((const char*)ASN1_STRIN=
G_get0_data(subjAltNameDN->d.ip), ASN1_STRING_length(subjAltNameDN->d.ip)))=
);
++#else
++                         PUSHs(sv_2mortal(newSVpv((const char*)ASN1_STRIN=
G_data(subjAltNameDN->d.ip), ASN1_STRING_length(subjAltNameDN->d.ip))));
++#endif
+                          break;
+=20
+                      }
+@@ -5229,15 +5239,20 @@ P_ASN1_TIME_get_isotime(tm)
+      ASN1_TIME_to_generalizedtime(tm,&tmp);
+      if (tmp) {
+        if (ASN1_GENERALIZEDTIME_check(tmp)) {
+-         if (strlen((char*)tmp->data)>=3D14 && strlen((char*)tmp->data)<2=
00) {
++#if (OPENSSL_VERSION_NUMBER >=3D 0x1010000f && !defined(LIBRESSL_VERSION_=
NUMBER)) || (LIBRESSL_VERSION_NUMBER >=3D 0x2070000fL)
++         const char *tmp_data =3D (const char*)ASN1_STRING_get0_data(tmp)=
;
++#else
++         const char *tmp_data =3D (const char*)ASN1_STRING_data(tmp);
++#endif
++         if (strlen(tmp_data)>=3D14 && strlen(tmp_data)<200) {
+            strcpy (buf,"yyyy-mm-ddThh:mm:ss");
+-           strncpy(buf,   (char*)tmp->data,   4);
+-           strncpy(buf+5, (char*)tmp->data+4, 2);
+-           strncpy(buf+8, (char*)tmp->data+6, 2);
+-           strncpy(buf+11,(char*)tmp->data+8, 2);
+-           strncpy(buf+14,(char*)tmp->data+10,2);
+-           strncpy(buf+17,(char*)tmp->data+12,2);
+-           if (strlen((char*)tmp->data)>14) strcat(buf+19,(char*)tmp->dat=
a+14);
++           strncpy(buf,   tmp_data,   4);
++           strncpy(buf+5, tmp_data+4, 2);
++           strncpy(buf+8, tmp_data+6, 2);
++           strncpy(buf+11,tmp_data+8, 2);
++           strncpy(buf+14,tmp_data+10,2);
++           strncpy(buf+17,tmp_data+12,2);
++           if (strlen(tmp_data)>14) strcat(buf+19,tmp_data+14);
+          }
+        }
+        ASN1_GENERALIZEDTIME_free(tmp);
+@@ -5250,7 +5265,6 @@ P_ASN1_TIME_set_isotime(tm,str)
+      ASN1_TIME *tm
+      const char *str
+      PREINIT:
+-     ASN1_TIME t;
+      char buf[256];
+      int i,rv;
+      CODE:
+@@ -5272,22 +5286,27 @@ P_ASN1_TIME_set_isotime(tm,str)
+      buf[14] =3D '\0';
+      if (strlen(str)>19 && strlen(str)<200) strcat(buf,str+19);
+=20
+-     /* WORKAROUND: ASN1_TIME_set_string() not available in 0.9.8 !!!*/
+-     /* in 1.0.0 we would simply: rv =3D ASN1_TIME_set_string(tm,buf); */
+-     t.length =3D strlen(buf);
+-     t.data =3D (unsigned char *)buf;
+-     t.flags =3D 0;
+-     t.type =3D V_ASN1_UTCTIME;
+-     if (!ASN1_TIME_check(&t)) {
+-        t.type =3D V_ASN1_GENERALIZEDTIME;
+-        if (!ASN1_TIME_check(&t)) XSRETURN_UNDEF;
++     /* ASN1_TIME_set_string() not available in 0.9.8 */
++#if OPENSSL_VERSION_NUMBER >=3D 0x10000000L
++     rv =3D ASN1_TIME_set_string(tm, buf);
++     if (!rv) XSRETURN_UNDEF;
++#else
++     {
++        ASN1_TIME t;
++        t.length =3D strlen(buf);
++        t.data =3D (unsigned char *)buf;
++        t.flags =3D 0;
++        t.type =3D V_ASN1_UTCTIME;
++        if (!ASN1_TIME_check(&t)) {
++           t.type =3D V_ASN1_GENERALIZEDTIME;
++           if (!ASN1_TIME_check(&t)) XSRETURN_UNDEF;
++        }
++        tm->type =3D t.type;
++        tm->flags =3D t.flags;
++        if (!ASN1_STRING_set(tm,t.data,t.length)) XSRETURN_UNDEF;
++        rv =3D 1;
+      }
+-     tm->type =3D t.type;
+-     tm->flags =3D t.flags;
+-     if (!ASN1_STRING_set(tm,t.data,t.length)) XSRETURN_UNDEF;
+-     rv =3D 1;
+-
+-     /* end of ASN1_TIME_set_string() reimplementation */
++#endif
+=20
+      ST(0) =3D sv_newmortal();
+      sv_setiv(ST(0), rv); /* 1 =3D success, undef =3D failure */
diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.96.bb b/met=
a-perl/recipes-perl/libnet/libnet-ssleay-perl_1.96.bb
index d2c3bee645..e5f8718f68 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.96.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.96.bb
@@ -24,7 +24,11 @@ RDEPENDS:${PN} +=3D "\
 "
=20
 SRC_URI =3D "${CPAN_MIRROR}/authors/id/C/CH/CHRISN/Net-SSLeay-${PV}.tar.gz=
 \
-           file://run-ptest"
+           file://run-ptest \
+           file://0001-Fix-SSLv3-in-OpenSSL-4.0.0.patch \
+           file://0002-OpenSSL-4.0.0-remove-support-for-some-TLS-functions=
.patch \
+           file://0003-Fix-Net-SSLeay-to-support-opaque-ASN1_STRING.patch =
\
+           "
 SRC_URI[sha256sum] =3D "ab213691685fb2a576c669cbc8d9266f8165a31563ad15b7c4=
030b94adfc0753"
=20
 S =3D "${UNPACKDIR}/Net-SSLeay-${PV}"

