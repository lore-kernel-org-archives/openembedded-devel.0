Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98462C61DC4
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 18:53:42 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1876.1787856818107880496
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2026 11:53:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=IggCKR9U;
 spf=pass (domain: est.tech, ip: 52.101.69.43, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BeXp/UxBZDXJeNKJcpkwggGh4i9Xu/0fEVDlGWvpv7yynIcKdilC8QwwUXo3Urj71BISQnixa7CSNneKgYNN3L/Kw25c2t2Dn9Hr2Giyb/MOVVN9vEdVH1P6gqNGnhja/DXa99XOAonErQDbRwHIADnKs4yY7zW7neNgK8XSV1A6IMZpLBpnDMyIzhVJ8bzQP/RQ7ehMxVG7b4c4uZXiv8CZwZQEmXc3g8PTmpf2qP9edjBXG44h1nz135JCIHhxd33OgaFnTlvjR/Y2+47sjIHkxbRKbY0A54Q2DiaUyowtrR54tqzp/T8YG3wlvEpju4fQquwKqhVCCquRhIB0kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PWYnvV66g/Bxxlzj882RdaJsZ30FFgU99OzTwg7i26o=;
 b=ksxJ9GQNetfEMvCiO3Zzl9YAIydFHb/5RvOJrS2J3T/v4QMScW18Ox01+Xi8ZAO2XwAWYmJsv44eCIc//yBzQKwp1tbFxT/hX/H8gohTLsa4526KjwieYmiZfyKn6LrOR2CYHWpPwroUA+50n4caaLq4tjIFJehLSPhCj6uOigsQOouTsNTitumkKGlyiqD+zlE6WNos9I6LvOCathFh3qnNaRmHWCfw7WoZc+CIEiMNxaNb2mZwhQYhc9i4YPetp1sVaQekYGjQvpp+yk1WYk8OezLkQZud6fM89fyiWtZE5xPXTiYV2E97In/sbztY1OYgorXGgwIob1o8kMNwFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWYnvV66g/Bxxlzj882RdaJsZ30FFgU99OzTwg7i26o=;
 b=IggCKR9UJETAcB1TDNZdwOuYMSf5d/JeAzudHBGbhtAeQ4nfSPodD7xEFS/COOiEAONW4yUv4hwJLidHmcJpRmiXc2mipYAyVid34hpwGBOqf9gmqusvD0vHMYtv4iCfBBT9nY8tMAiIl9V5fIgiSGKIl2nkPCj4cD5JK5QbNVTP/4wYDXv4CHdVFVOEA33pDq+ynfDZ+z9o0BSguqaM/T0TURpmsGPGA/AwgSpwfznT2K2xoCV6ChsXF9hI1ydN8NarPb55MTfg80Alx0kAHMWTOexcqRfQV2VG09mY6lHOWId+GaLwZ1h/1c602WP9LqczMmtV34GkItbw8xfNeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB8P189MB0809.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:122::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 18:53:37 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 18:53:37 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [meta-oe][RFC 05/20] pkcs11-helper: fix build with OpenSSL 4.0
Date: Thu, 27 Aug 2026 20:53:09 +0200
Message-ID: <20260827185324.78997-6-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
References: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO0P123CA0002.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::13) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB8P189MB0809:EE_
X-MS-Office365-Filtering-Correlation-Id: 1509d2d2-54b7-4d7d-ad6e-08df046c80e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|10070799003|23010399003|376014|22082099003|18002099003|56012099006|13003099007|3023799007|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	ZgpfVJpfo+aKtla+dEjrWEkKHVe7hOP+XQ2REwOHesNMbq5Mlbg7+9j+QMZ/9XNyr6nN6rACSwZx7RBTn8gnbpsGikrZ/v89/HqitNPUVoK615AkMznmWp+GXy8Ed8YTKZ+DUJzRfqB+NYCm9sQsnqHDQEw7xyBsrMebqHylExivoliKzKVdHOaTq5q1TN0Nqgbbui/04XmAtGAAkdMMU/ih+j36kTA/Zbr3pLeNEDrNJtEWVCfKLr3HL9kBOyAZu0vNjYPLURMRNSSsbuYOxocdlA69iXMHzGhu6AZ4LkB50gl+aiw409wR/0qadHvqKqRxGtbkX5r96G+PQ9wGCHf4erIxOdPj6faMZ1pdz558VAT0L5DCKOhCP4i7ejNqLvgvjDo05RN4ilTSSO/gTA1+9x8BSRkr2vIsRAP/GnnX8QF+QIQ7kij/lohu5Yx52QSiwO7MD2B5svWpoxTY8aFQkAQtUWBp8kTt0/2LnV34vUVDQGKMAwo0pkvni7mX3rubJ+MzJ5QH/MWP/9x+I6jdtzdvTl1Kvgo3EkbWRsVCYLZ0BQq9Q4qbSi3gIfioM3NrIXDDfFihNjTtp5LwZZ6fsMUa2XBnTEbmCaEhsi0PsS27s4OctFf62t38I5az9AEUOzinpc1dcQVvTEQ7Dr5vYEzXHniSkV3DRfIVMq4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(13003099007)(3023799007)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6R1YJG78G+XcabTZd4pf01hTINoLKhzDTVltJr/Oxte67OSa5no6a/wiQxhH?=
 =?us-ascii?Q?BjZh65feu9sn5hc8cUm/MroCdSF0faJ47g7j+B3YlC0uCGZrQE1DdWM6g9ao?=
 =?us-ascii?Q?HerA+WGPRcCdNvojSWMluViEM3btwvMa4NzIB5GKclqRFZsALlnqEgXA3pTf?=
 =?us-ascii?Q?4IQ9e8zzZB6HxJ/MbxLy0gF98RFeKdPAHEVBHiXTZuS7t65CnpyJxGJffz/x?=
 =?us-ascii?Q?9am6c2T+hlqNxZqYbhd70nvKySe3FJ4Q1FiNaDJRyHUvyce8McaS7y9sq+7S?=
 =?us-ascii?Q?MuUJNKZEZZz+Awloj/vdNQ0Kzqpvaod6AeqimIKokCAFQ2oZoNAmI85vwETS?=
 =?us-ascii?Q?yk59Wq3R3vzP3x+BLZSmlVfCEvCeAF8WPn23LlWFJ1DPbj+VroSay0/LRbtB?=
 =?us-ascii?Q?kz5BOiFFkwxbX1TXpt8SpN9PE+bZT+a+aBkmAbVdeOsvSkJrojZrOx8Vxs8j?=
 =?us-ascii?Q?pm/GPmBKfy1Bq0G8rU46QKSZq3efr2A36ok0lwoOa3HxcTPy5UEG6cK2cyJq?=
 =?us-ascii?Q?t2TFV2WWzhiHsVPRVsOUvNyCbrwFHl5rXwU1cEVpAvabXLkWIa8cChAvDpak?=
 =?us-ascii?Q?kttzcSYdGO+26/E0l3nnHw1ksl1zEmSbB2x4z/n+jBkzcOq2U19i9PphJUXz?=
 =?us-ascii?Q?LrueaLHeqVwWhspKLkPP67vj9a2zf6/xOLGySQDEIMKM1COyjcow33lrRUoM?=
 =?us-ascii?Q?DiAHzhOffdyGuSDSVePaTYbBVAFHHamqi1qrVbELvXrLUjFY/++FqqJD0yrz?=
 =?us-ascii?Q?DEJQ+TmcInrlP69oM2KB3qYyy7gJApSva7ItSoWhFVRTfE8YZcYu6uoQIsz8?=
 =?us-ascii?Q?/xVwGpXIXEIEcDpvNEO1cEfrfCLz3FhMAYFUjXSsfJGGTGYKPA2hyJ40GeKQ?=
 =?us-ascii?Q?cccy1X56jsWXHwq6vrRTxbMtQzGrbx/nnw5U0k76Vpmzpw7rkP91RwtYVctD?=
 =?us-ascii?Q?xHBVzi7CYoaHqfUKJ6UKgXBGNk2dep586ckQBJkTdoKbdRRZClIlLVos6N6b?=
 =?us-ascii?Q?zYIbfG8pVO/6ItKOviWz85F/yjW0y+/JrCaHzDXlyyOAw/VZ09xTujlrMt9f?=
 =?us-ascii?Q?npb2MMpO1+t9SpVz+w3NIqRngcyLBPRa0MCyqxxjCyG6aHk/cWozF26+CYsD?=
 =?us-ascii?Q?2t6+ai5p75pWODXyFsmg6MeDRxT/lG7ahkcaih8MhSMwbzBLPy6N0Vq5UyL7?=
 =?us-ascii?Q?MqGMDeqTKGvVV2/0AVdaUsXWez3pC3gBA5wzUU7d7RbeVGc5icvNoJhACNzv?=
 =?us-ascii?Q?Y+7An+p1Gbi559iBF2hBN8b8+yxEaiVtHCaCaDYrue83UiTuQ7KGfB0ud234?=
 =?us-ascii?Q?BBEirQnpRUFzmW1ZrMSypV/ZKOCSq9O9K3tvTtxtoW7xIulxBUaWNQNGgu1J?=
 =?us-ascii?Q?A6Jp6J5HKYoZ8GhSV7wS9Vo1AQVDbIXHugF8ZAwOJtGkIE4W9J853mFK9nAp?=
 =?us-ascii?Q?n0BH1ImjlXS6+i9IicyRWmEepzCcujl1l6nrHNtKc/hbndEXYsnq6IwHekCL?=
 =?us-ascii?Q?Mfs9++Q2ydc/7DCo/z4Zcc3J8ANOnkIPT5/7jVxyHt81alhzUOG0F0s4dSVD?=
 =?us-ascii?Q?EMQGD1zFXKnuhdJ6hlYsWkcwduNpa8HxIUclFhmRapxQlVrlDp6ANwLpvLtP?=
 =?us-ascii?Q?FrqYgrf9wZCpRb+cHei7kEN9ZZHte7W93+0QxH+m3UOYnuMI9rax4YHBOa/8?=
 =?us-ascii?Q?yOLJsP+41WuInVv9P+9/3JGYmEU8ZaevFvrT6ImN+uxYQndDUtp+mx/26r29?=
 =?us-ascii?Q?GSHqtzs+2NFtWc/YvIsr/Rg19yKqry/Wq6FjwUcMe53zrm2jKRvM6TdhKxfM?=
X-MS-Exchange-AntiSpam-MessageData-1: B7oHjyawcqC/6zn7T6HvKvQpwU4s0oBLdKA=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1509d2d2-54b7-4d7d-ad6e-08df046c80e7
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 18:53:37.7506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VZuNwj17DxspvoJeSLWf5pS/NTXR45QnBY5chN8xX1F685LXbmccwtwBLZYaNWiVQfTlkj0HxuyxWdv28pe337KjwdxHOmS+Cw+Q/BfWwkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0809
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 18:53:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129540

OpenSSL 4.0 makes ASN1_TIME opaque. Replace manual field access
with ASN1_TIME_to_tm() API.

Upstream-Status: Backport [https://github.com/OpenSC/pkcs11-helper/commit/5=
9cc22b8d656]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...1-crypto-openssl-use-ASN1_TIME_to_tm.patch | 45 +++++++++++++++++++
 .../pkcs11-helper/pkcs11-helper_1.31.0.bb     |  4 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper/0001=
-crypto-openssl-use-ASN1_TIME_to_tm.patch

diff --git a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper/0001-crypto=
-openssl-use-ASN1_TIME_to_tm.patch b/meta-oe/recipes-crypto/pkcs11-helper/p=
kcs11-helper/0001-crypto-openssl-use-ASN1_TIME_to_tm.patch
new file mode 100644
index 0000000000..3bc5d3d817
--- /dev/null
+++ b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper/0001-crypto-openss=
l-use-ASN1_TIME_to_tm.patch
@@ -0,0 +1,45 @@
+From 59cc22b8d65669da599f1c435fdfe35d4e07db0e Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
+Date: Thu, 4 Jun 2026 12:49:44 +0200
+Subject: [PATCH] crypto-openssl: use ASN1_TIME_to_tm
+
+Introduced in openssl-1.1.1 and is required for openssl-4.
+Upstream-Status: Backport [https://github.com/OpenSC/pkcs11-helper/commit/=
59cc22b8d656]
+
+Note: ChangeLog hunk dropped as it does not apply to the released tarball.
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ lib/_pkcs11h-crypto-openssl.c | 16 +++++-----------
+ 1 file changed, 5 insertions(+), 11 deletions(-)
+
+diff --git a/lib/_pkcs11h-crypto-openssl.c b/lib/_pkcs11h-crypto-openssl.c
+index 05af65e1..aa58722c 100644
+--- a/lib/_pkcs11h-crypto-openssl.c
++++ b/lib/_pkcs11h-crypto-openssl.c
+@@ -148,21 +148,15 @@ __pkcs11h_crypto_openssl_certificate_get_expiration =
(
+ 		notBefore !=3D NULL &&
+ 		notAfter !=3D NULL &&
+ 		X509_cmp_current_time (notBefore) <=3D 0 &&
+-		X509_cmp_current_time (notAfter) >=3D 0 &&
+-		notAfter->length >=3D 12
++		X509_cmp_current_time (notAfter) >=3D 0
+ 	) {
+ 		struct tm tm1;
+=20
+ 		memset (&tm1, 0, sizeof (tm1));
+-		tm1.tm_year =3D (notAfter->data[ 0] - '0') * 10 + (notAfter->data[ 1] -=
 '0') + 100;
+-		tm1.tm_mon  =3D (notAfter->data[ 2] - '0') * 10 + (notAfter->data[ 3] -=
 '0') - 1;
+-		tm1.tm_mday =3D (notAfter->data[ 4] - '0') * 10 + (notAfter->data[ 5] -=
 '0');
+-		tm1.tm_hour =3D (notAfter->data[ 6] - '0') * 10 + (notAfter->data[ 7] -=
 '0');
+-		tm1.tm_min  =3D (notAfter->data[ 8] - '0') * 10 + (notAfter->data[ 9] -=
 '0');
+-		tm1.tm_sec  =3D (notAfter->data[10] - '0') * 10 + (notAfter->data[11] -=
 '0');
+-
+-		*expiration =3D mktime (&tm1);
+-		*expiration +=3D (int)(mktime (localtime (expiration)) - mktime (gmtime=
 (expiration)));
++		if (ASN1_TIME_to_tm (notAfter, &tm1)) {
++			*expiration =3D mktime (&tm1);
++			*expiration +=3D (int)(mktime (localtime (expiration)) - mktime (gmtim=
e (expiration)));
++		}
+ 	}
+=20
+ cleanup:
diff --git a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.31.0.bb b=
/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.31.0.bb
index 3e776993f4..fd81ad888d 100644
--- a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.31.0.bb
+++ b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.31.0.bb
@@ -14,7 +14,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D008a5b65f5d167=
bd0f646530ad3d3293 \
                     file://COPYING.GPL;md5=3D8a71d0475d08eee76d8b6d0c6dbec=
543 \
                     file://COPYING.BSD;md5=3D66b7a37c3c10483c1fd8600772610=
4d7 \
                     "
-SRC_URI =3D "git://github.com/OpenSC/${BPN}.git;branch=3Dmaster;protocol=
=3Dhttps"
+SRC_URI =3D "git://github.com/OpenSC/${BPN}.git;branch=3Dmaster;protocol=
=3Dhttps \
+           file://0001-crypto-openssl-use-ASN1_TIME_to_tm.patch \
+           "
=20
 # master
 SRCREV =3D "286b4415b95f298ab35d62508a37c2aefc055037"

