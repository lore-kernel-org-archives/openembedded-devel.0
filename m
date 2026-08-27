Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A99AC61DCD
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 18:53:43 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1791.1787856822324223818
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2026 11:53:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ayDyVTpB;
 spf=pass (domain: est.tech, ip: 52.101.69.30, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jxxfoL8oSAJXPaf3AlOUfh71qozdo75ZhZUPIsIBnCbKyTVeyzeW7z027fwNezP7CcKBMz0pulTv16nUX3ms39t5Npcn69I8xzzHBYw56Qj1O6T4EK/APHTZw6HIbDGbP853q0UJ/G0QQr4BcPdJc7QVStpW6IFHQJo0oU+YilIUZc1DXepxcUjTlkqJg0pclU2clcpYFYe7eIHKfQU5xKyTBfoEPhQ6z9w7XP8ki+u92fxblb4UK4wmCgpQ3oks1nFsBdWlgoqTelR+x8Rdm+gcYLNY2T8e4juAd9vxcD2atx9P61Hsi+6c+Dlv8PDjKPyNmuCR3dzknILkN3OGXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcbQUbG19X/nada72IP5vBf5BSK5QMUXxXLrWqvpztE=;
 b=fxA50fT5yHuotEO9uYIKPwglA8fOxH540p6ol70p7rYEqhUHu4P8k813yVeKdHC3xdJqhuXbfvOe/tOEVVB2bpe5hUISC3HpvCWNldTAX0c8c5Zv+NetYXNgFNoDm0tuVns5lxsQJm8FWLnrs1v5pZXRi/0WSIAeL1HBA33pleUj+tG9y55JlXi/IbGbMB8/Wbb8WNcMDIdZVMtte9R2iGIJUASrTtZ7cQwrpGSfHp62IuvQbdfsWWl7EySp3/ynhtY5vCCuAQtcqiMgP1xe8JzrOCTN4wQW+TdzO/iTRbypvN/LBM+cpkHYGytvjx94kvAIxPIeRiJ3Y1o+sq2FJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcbQUbG19X/nada72IP5vBf5BSK5QMUXxXLrWqvpztE=;
 b=ayDyVTpB+MMcs8USc9Wuem1oKfxH0JdwQUmDMo9Dx8+P/2VbNRq8Gw+T+aDJ3QpMiOHRNRaJXi1VknfDs+Mk6NY383mBl4jiSokpaoZKoqohWyzFXLLox69sgvZ6o8ccjA90s5PXvkTsefzg9ASOFR4ef9X3LsPP95dMcQwVAK7swxNxjj5n8DpkSjsdBZdM1Raw2oIEwJTmEYub3HWYbZzYIymRHvVRlmq5BRjyaRc7ycsvViQ8Ay+EE7fcgYlqOspfhHgTQ3X5kM1mAEvLEqdWZwHkcIkvNRNEt5pg8YvlF0E7OV5yI+y+X9doUWlfxve65b08GR4hRjFuy+MWiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB8P189MB0809.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:122::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 18:53:39 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 18:53:39 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [meta-oe][RFC 06/20] opensc: fix build with OpenSSL 4.0
Date: Thu, 27 Aug 2026 20:53:10 +0200
Message-ID: <20260827185324.78997-7-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
References: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO0P123CA0007.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::16) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB8P189MB0809:EE_
X-MS-Office365-Filtering-Correlation-Id: 51c009aa-5e01-4793-dfb8-08df046c822b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|10070799003|23010399003|376014|22082099003|18002099003|56012099006|13003099007|3023799007|6133799003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	4dsySGBZCS2rD4pIEdkpUpB4/M14DiZW8dbIr+c5bx1LzhTxGFgMpsYDoZPDM1Gk4/c7WvNykuGZkBNOcS0ULioRYOUZTHwTYhKORYH4RC/161a80mKm6h8rcywV39olpdmSS4Y7eTDbaXpnYSmuVtlQ5v1fmVNRFuFZracOM7YSXFAbLq8NmDJ5piva+GUke36moFpZ37ikm7/KSa6adZRcYVoY5KHa+q2ruNOzHzGRiWzqCXwwjW4S4C5skadi57UhfYE720THWCTd9v4K6Xcaydy0QWDs3ofb8qyjFx1yG8LEl9icEo8gwpn7pcLxzxllZpmt/1nvVIygKXCRgUDQgrTo5Uk6x1wQAMIwZ3pg1JAWwuoMVKipIfcAAuaLRNXte/PM3latlwyLC2R+3VTku8E+Vdd8VKY3JGkwafaJF5pCOboHvmse4FCSNxXTLbTdcPa2Rri/Idl5zFdODTm/wl0H8NzzlwI4hV6Fnsc2SvId9dZX7u9Kv5lohZ9FQzSNrC5XopycJY/ZkJ1b1vHFppqo7wFzXLA5j1z7iIijmh4jFTGBpjFt9B9S9KkuRm/H+WndmFm619X8K+CzHLGMedlpnNveS0+Uerp4OO7LXNuIkaPKkUlbDXeEVzyLCdBGSZOQWy0fSZq+i/IMsbHlpucmTbadS67D/FwLKmk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(13003099007)(3023799007)(6133799003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?M2Luk4/zYxsHfrdbtLgdTb/U8dReeWhE9lqwvtjQTZj0BFyqtKIxmlnqk9TA?=
 =?us-ascii?Q?Xky0aRCA+JAddp5I5Fm+eqF9VVDU9mQJn4CwvMJzuf+QFoxhJX3G+Yqr5iLe?=
 =?us-ascii?Q?g/hHrWWpzqRuxxwhefZSzkmrK0YiuPO7rjm4WO5jUqdcj0iZHfH3HLFrYCt4?=
 =?us-ascii?Q?UH65mcmTUdrz1wDwXUJSRalTpNJ/TJq++qfuuYbOFwMA4lQrPAyql/9eg2ey?=
 =?us-ascii?Q?4wKnv1XoNScM2kJCgaBHjqJr0mLp0s7HhIotiRGJVCOwOgeK3ih4II0qKxhy?=
 =?us-ascii?Q?ko8HnkGybtNTXkjPdZIu3mqRsMgceKQZc0Vxk3jEGf8URul5cwX0bPF0sgW2?=
 =?us-ascii?Q?rViulZPqd4Nm3j1WBKNA/B88t+zVOqn33z+pIXblVDzczhsoMzQXn/CbN11H?=
 =?us-ascii?Q?I1nGTOe5vISlUgm9vBzfsc7ZFHRD5Zk7vf0Y7UElK8HKHsvzCxs/W8UmfX5h?=
 =?us-ascii?Q?znXZKF3y8A0T1tbRFjYpKTJz3wXDHMit2A+5lz97t4LG1Xq8VQ0yItR33J6O?=
 =?us-ascii?Q?HiQhy28pN9tGCf2bbU6YOQ8D4m1oSGErmPRH4Z9jHbTtjwgrYpdJzl9YIkPq?=
 =?us-ascii?Q?AYK3Rt0g0/O+XIYsrM53O7YNHaaUhf7DB7ZOWqFvk6XelzEbzIwvZuNBMjqd?=
 =?us-ascii?Q?EJNYS5+CEaY0xSmfIozEx7GObHNrZn10Xd1diGcukjS+wYVlgsxrPHj5MlJm?=
 =?us-ascii?Q?QjFXC+HN1/0lXLnTuv31yDU0IWiWwzcuPK/gqHzu74PSM9EkumrhRdUYyQZq?=
 =?us-ascii?Q?VpbcTlLZgyrYVDqtXH/WABpDzSEGslv59/tBHGyvmiVl2RxXgOZlPBO9PFKo?=
 =?us-ascii?Q?AL3T70ioJA7ldkAjkDd/tgV0LnDnvo1zBtbEtW1eX/oEY2l0GegSgCvmArGj?=
 =?us-ascii?Q?r/B1WYXU9rd2oGMWGirYU+TdEcuKoipvrIPiAt2gOU4x0jowy0yxabKcNLhl?=
 =?us-ascii?Q?obZigTZIxJTw4jHCFml4cXidQCRGy6iNkSyw7vlEdhW7dQ3H1t5OHAlFkWnx?=
 =?us-ascii?Q?+PLbdYBI23WfR6OlAxL59LPIyd2wJN6rIgGeyKixVvUKhxOkZYIwSjCxMi3j?=
 =?us-ascii?Q?EGEWC+x5CCGtbgZuBbolN+6aLiCVWw9kUYi/51OPrhGAzphkKn7hrWe9x9XU?=
 =?us-ascii?Q?nrQ9uDJ+3Miv7cwd5fSBpt5RZFexMUKtriucT9z45IBst/6zyQSb6xPjbvJx?=
 =?us-ascii?Q?Kr7wPtXBxzlOcSSZvMNHrZHyS5413QlVqLoUfAg8cV8iJx83AMuC10M8HW94?=
 =?us-ascii?Q?+hBtKrdA9fOmuNgY+KAtT9arldm4yKGiCMAoJwHiYDyn6xRvaSaQEvCOOph+?=
 =?us-ascii?Q?TVuiC3bRaQDEwtVDeGoir3TCIWUB/aAhqERS72C1O+n+1p1BGGMtKczlq0if?=
 =?us-ascii?Q?G7LKVghDTMkB+sBYoAIzJT5yIOdFBqAbkTXzpE38+rKx+NzcWX/UAEoBHNBU?=
 =?us-ascii?Q?ijgBnPjxK/gPwSLGRXRqyo170+QDI4WuSDBEqZ9opA9n4y8L4JeC8GmidheB?=
 =?us-ascii?Q?1etou2fRy0PHrf5mj4lQHeoKu/pLJaumCfDonEezpjxhxkROd726aKKAxpyJ?=
 =?us-ascii?Q?L7GEQTVUsNE42pXePLLOdvSGnAE8TxLswIaffJXHuOEQLUt5+KrKMYhD5kCV?=
 =?us-ascii?Q?0pc5LaEP201fS6UcPQ4mL9rj+phfyxWJUJkYv30yIrcZDhvmWrLeB4dk/zPa?=
 =?us-ascii?Q?smcR3moyU0bjbEUs68WJsgmoWQ3aiATSu1cTUfXmIAKgQpwu1OX8N5Cj4u0X?=
 =?us-ascii?Q?rMZ7dFqY0l2BiUCqwjJl6IUqpjZKxaHNSkOK/LF0gGxbmLGj6gPrq0ofRSwZ?=
X-MS-Exchange-AntiSpam-MessageData-1: Oilz/bcs8aO53h6hla6gsxhio1vVe2QGqiU=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 51c009aa-5e01-4793-dfb8-08df046c822b
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 18:53:39.7796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RD4NyyGDX3fZmkT8uPC2mQYAXLVLt30Zopog3Sm2RqwSxqEgMKY8SSSzu0jbhqlTAnJyO5vSiVViDMQWTdYxv1NxEBNM2slY8+naUR7Bm04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0809
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 18:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129541

OpenSSL 4.0 makes ASN1_STRING opaque. Use accessor functions.

Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/8226c67d=
832f]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../0001-Changes-for-OpenSSL-4.0.0.patch      | 331 ++++++++++++++++++
 .../recipes-support/opensc/opensc_0.27.1.bb   |   4 +-
 2 files changed, 334 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/opensc/opensc/0001-Changes-for-=
OpenSSL-4.0.0.patch

diff --git a/meta-oe/recipes-support/opensc/opensc/0001-Changes-for-OpenSSL=
-4.0.0.patch b/meta-oe/recipes-support/opensc/opensc/0001-Changes-for-OpenS=
SL-4.0.0.patch
new file mode 100644
index 0000000000..4308217058
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/opensc/0001-Changes-for-OpenSSL-4.0.0.=
patch
@@ -0,0 +1,331 @@
+From 8226c67d832f9adaf1f7c65e5abb49687d8cf949 Mon Sep 17 00:00:00 2001
+From: Doug Engert <deengert@gmail.com>
+Date: Wed, 15 Apr 2026 15:10:42 -0500
+Subject: [PATCH] Changes for OpenSSL-4.0.0
+
+Changes to get OpenSC to compile  with OpenSSl-4.0.0
+
+OpenSSL says:
+"Opaque Structures: ASN1_STRING has been made opaque, and further work has=
 been
+done to make X509 structures more memory-efficient and const-correct."
+
+ASN1_STRING was made opaque thus requiring the use of ASN1_STRING_get0_dat=
a,
+and ASN1_STRING_length. These routines have been in OpenSSL since 1.1.1
+and are also in libressl.
+
+ASN1_STRING_get0_data returns a const pointer, so the data can not be chan=
ged.
+There  are a number of reverse() functions one of which was reversing the
+bytes in a EC pubkey.
+
+Changes not addressed:
+"Global Cleanup: libcrypto no longer uses atexit() for cleanup;
+OPENSSL_cleanup() now runs in a global destructor."
+
+ On branch OpenSSL-4.0.0
+ Changes to be committed:
+	modified:   src/libopensc/cwa-dnie.c
+	modified:   src/pkcs11/openssl.c
+	modified:   src/pkcs15init/pkcs15-oberthur-awp.c
+	modified:   src/tests/p11test/p11test_case_common.c
+	modified:   src/tools/netkey-tool.c
+	modified:   src/tools/pkcs11-tool.c
+	modified:   src/tools/pkcs15-init.c
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/8226c67=
d832f]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/libopensc/cwa-dnie.c                |  2 +-
+ src/pkcs11/openssl.c                    | 14 ++++++----
+ src/pkcs15init/pkcs15-oberthur-awp.c    | 16 +++++------
+ src/tests/p11test/p11test_case_common.c | 24 ++++++++--------
+ src/tools/netkey-tool.c                 | 37 +++++++++++++++++--------
+ src/tools/pkcs11-tool.c                 | 22 +++++++--------
+ src/tools/pkcs15-init.c                 |  4 +--
+ 7 files changed, 68 insertions(+), 51 deletions(-)
+
+diff --git a/src/libopensc/cwa-dnie.c b/src/libopensc/cwa-dnie.c
+index 47f3792dad..6020921dbc 100644
+--- a/src/libopensc/cwa-dnie.c
++++ b/src/libopensc/cwa-dnie.c
+@@ -646,7 +646,7 @@ static int dnie_set_channel_data(sc_card_t * card, X50=
9 * icc_intermediate_ca_ce
+ 	dnie_private_data_t *priv_data =3D GET_DNIE_PRIV_DATA(card);
+ 	LOG_FUNC_CALLED(card->ctx);
+=20
+-	X509_NAME *issuer =3D X509_get_issuer_name(icc_intermediate_ca_cert);
++	const X509_NAME *issuer =3D X509_get_issuer_name(icc_intermediate_ca_cer=
t);
+ 	if (issuer) {
+ 		buf =3D X509_NAME_oneline(issuer, buf, 0);
+ 		if (!buf) {
+diff --git a/src/pkcs11/openssl.c b/src/pkcs11/openssl.c
+index 0a5d4394a2..a4027339b2 100644
+--- a/src/pkcs11/openssl.c
++++ b/src/pkcs11/openssl.c
+@@ -463,6 +463,7 @@ static CK_RV gostr3410_verify_data(const CK_BYTE_PTR p=
ubkey, CK_ULONG pubkey_len
+ 	EC_POINT *P;
+ 	BIGNUM *X, *Y;
+ 	ASN1_OCTET_STRING *octet =3D NULL;
++	unsigned char *octet_rev =3D NULL;
+ 	char paramset[2] =3D "A";
+ 	int r =3D -1, ret_vrf =3D 0;
+ #if OPENSSL_VERSION_NUMBER < 0x30000000L
+@@ -516,13 +517,16 @@ static CK_RV gostr3410_verify_data(const CK_BYTE_PTR=
 pubkey, CK_ULONG pubkey_len
+ 		if (group && pubkey_len <=3D LONG_MAX) {
+ 			const unsigned char *p =3D pubkey;
+ 			octet =3D d2i_ASN1_OCTET_STRING(NULL, &p, (long)pubkey_len);
++			if (octet)
++				octet_rev =3D malloc(ASN1_STRING_length(octet));
+ 		}
+-		if (group && octet) {
+-			reverse(octet->data, octet->length);
+-			Y =3D BN_bin2bn(octet->data, octet->length / 2, NULL);
+-			X =3D BN_bin2bn((const unsigned char*)octet->data +
+-					octet->length / 2, octet->length / 2, NULL);
++		if (group && octet && octet_rev) {
++			memcpy(octet_rev, ASN1_STRING_get0_data(octet), ASN1_STRING_length(oct=
et));
++			reverse(octet_rev, ASN1_STRING_length(octet));
++			Y =3D BN_bin2bn(octet_rev, ASN1_STRING_length(octet) / 2, NULL);
++			X =3D BN_bin2bn(octet_rev + ASN1_STRING_length(octet) / 2, ASN1_STRING=
_length(octet) / 2, NULL);
+ 			ASN1_OCTET_STRING_free(octet);
++			free(octet_rev);
+ 			P =3D EC_POINT_new(group);
+ 			if (P && X && Y)
+ 				r =3D EC_POINT_set_affine_coordinates(group, P, X, Y, NULL);
+diff --git a/src/pkcs15init/pkcs15-oberthur-awp.c b/src/pkcs15init/pkcs15-=
oberthur-awp.c
+index 22c943127b..fdb06ab6b4 100644
+--- a/src/pkcs15init/pkcs15-oberthur-awp.c
++++ b/src/pkcs15init/pkcs15-oberthur-awp.c
+@@ -51,21 +51,21 @@ awp_get_commonName(X509 *x)
+    	r =3D X509_NAME_get_index_by_NID(X509_get_subject_name(x),
+ 		   NID_commonName, -1);
+ 	if (r >=3D 0)   {
+-		X509_NAME_ENTRY *ne;
+-		ASN1_STRING *a_str;
++		const X509_NAME_ENTRY *ne;
++		const ASN1_STRING *a_str;
+=20
+ 		if (!(ne =3D X509_NAME_get_entry(X509_get_subject_name(x), r)))
+ 			;
+ 		else if (!(a_str =3D X509_NAME_ENTRY_get_data(ne)))
+ 			;
+-		else if (a_str->type =3D=3D 0x0C)   {
+-			ret =3D malloc(a_str->length + 1);
++		else if (ASN1_STRING_type(a_str) =3D=3D V_ASN1_UTF8STRING) {
++			ret =3D malloc(ASN1_STRING_length(a_str) + 1);
+ 			if (ret)   {
+-				memcpy(ret, a_str->data, a_str->length);
+-				*(ret + a_str->length) =3D '\0';
++				memcpy(ret, ASN1_STRING_get0_data(a_str), ASN1_STRING_length(a_str));
++
++				*(ret + ASN1_STRING_length(a_str)) =3D '\0';
+ 			}
+-		}
+-		else    {
++		} else {
+ 			unsigned char *tmp =3D NULL;
+=20
+ 			r =3D ASN1_STRING_to_UTF8(&tmp, a_str);
+diff --git a/src/tests/p11test/p11test_case_common.c b/src/tests/p11test/p=
11test_case_common.c
+index 1dd6eaba67..f571cd1598 100644
+--- a/src/tests/p11test/p11test_case_common.c
++++ b/src/tests/p11test/p11test_case_common.c
+@@ -776,34 +776,34 @@ int callback_public_keys(test_certs_t *objects,
+ 			switch (o->key_type) {
+ #ifdef EVP_PKEY_ED25519
+ 			case CKK_EC_EDWARDS:
+-				if (strcmp((char *)curve->data, "edwards25519") =3D=3D 0) {
++				if (strcmp((char *)ASN1_STRING_get0_data(curve), "edwards25519") =3D=
=3D 0) {
+ 					evp_type =3D EVP_PKEY_ED25519;
+ 					break;
+ #ifdef EVP_PKEY_ED448
+-				} else if (strcmp((char *)curve->data, "edwards448") =3D=3D 0) {
++				} else if (strcmp((char *)ASN1_STRING_get0_data(curve), "edwards448")=
 =3D=3D 0) {
+ 					evp_type =3D EVP_PKEY_ED448;
+ 					break;
+ #endif /* EVP_PKEY_ED448 */
+ 				}
+ 				debug_print(" [WARN %s ] Unknown curve name. "
+ 					    " expected edwards25519 or edwards448, got %s",
+-						o->id_str, curve->data);
++						o->id_str, ASN1_STRING_get0_data(curve));
+ 				break;
+ #endif
+ #ifdef EVP_PKEY_X25519
+ 			case CKK_EC_MONTGOMERY:
+-				if (strcmp((char *)curve->data, "curve25519") =3D=3D 0) {
++				if (strcmp((char *)ASN1_STRING_get0_data(curve), "curve25519") =3D=3D=
 0) {
+ 					evp_type =3D EVP_PKEY_X25519;
+ 					break;
+ #ifdef EVP_PKEY_X448
+-				} else if (strcmp((char *)curve->data, "curve448") =3D=3D 0) {
++				} else if (strcmp((char *)ASN1_STRING_get0_data(curve), "curve448") =
=3D=3D 0) {
+ 					evp_type =3D EVP_PKEY_X448;
+ 					break;
+ #endif /* EVP_PKEY_X448 */
+ 				}
+ 				debug_print(" [WARN %s ] Unknown curve name. "
+ 					    " expected curve25519 or curve448, got %s",
+-						o->id_str, curve->data);
++						o->id_str, ASN1_STRING_get0_data(curve));
+ 				break;
+ #endif
+ 			default:
+@@ -893,14 +893,14 @@ int callback_public_keys(test_certs_t *objects,
+ 			break;
+ #endif
+ 		}
+-		if (os->length !=3D exp_length) {
++		if (ASN1_STRING_length(os) !=3D exp_length) {
+ 			debug_print(" [WARN %s ] Invalid length of EC_POINT value. Got %d, exp=
ected %d",
+-					o->id_str, os->length, exp_length);
++					o->id_str, ASN1_STRING_length(os), exp_length);
+ 			return -1;
+ 		}
+ 		key =3D EVP_PKEY_new_raw_public_key(evp_type, NULL,
+-			(const uint8_t *)os->data,
+-			os->length);
++				(const uint8_t *)ASN1_STRING_get0_data(os),
++				ASN1_STRING_length(os));
+ 		if (key =3D=3D NULL) {
+ 			debug_print(" [WARN %s ] Out of memory", o->id_str);
+ 			ASN1_STRING_free(os);
+@@ -925,8 +925,8 @@ int callback_public_keys(test_certs_t *objects,
+ 			}
+=20
+ 			if (EVP_PKEY_get_raw_public_key(o->key, pub, &publen) !=3D 1 ||
+-				publen !=3D (size_t)os->length ||
+-				memcmp(pub, os->data, publen) !=3D 0) {
++					publen !=3D (size_t)ASN1_STRING_length(os) ||
++					memcmp(pub, ASN1_STRING_get0_data(os), publen) !=3D 0) {
+ 				debug_print(" [WARN %s ] Got different public"
+ 					"key then from the certificate",
+ 					o->id_str);
+diff --git a/src/tools/netkey-tool.c b/src/tools/netkey-tool.c
+index 23bab2a8ec..683ac182bd 100644
+--- a/src/tools/netkey-tool.c
++++ b/src/tools/netkey-tool.c
+@@ -144,25 +144,38 @@ static void show_certs(sc_card_t *card)
+ 			if(q[4]=3D=3D6 && q[5]<10 && q[q[5]+6]=3D=3D0x30 && q[q[5]+7]=3D=3D0x8=
2) q+=3Dq[5]+6;
+ 			printf(", Len=3D%d\n", (q[2]<<8)|q[3]);
+ 			if((c=3Dd2i_X509(NULL,&q,f->size))){
+-				char buf2[2000];
+-				if (X509_NAME_get_text_by_NID(X509_get_subject_name(c), NID_commonNam=
e, buf2, sizeof(buf2)) < 0) {
++				int idx;
++				const X509_NAME_ENTRY *ne =3D NULL; /* no free */
++				const ASN1_STRING *a_str =3D NULL;  /* no free */
++				int out_len =3D 0;
++				unsigned char *tmp =3D NULL;
++
++				idx =3D X509_NAME_get_index_by_NID(X509_get_subject_name(c), NID_comm=
onName, -1);
++				if (idx >=3D 0 &&
++						((ne =3D X509_NAME_get_entry(X509_get_subject_name(c), idx)) !=3D N=
ULL) &&
++						((a_str =3D X509_NAME_ENTRY_get_data(ne)) !=3D NULL) &&
++						((out_len =3D ASN1_STRING_to_UTF8(&tmp, a_str)) > 0)) {
++					printf("  Subject-CN: %s\n", tmp);
++					OPENSSL_free(tmp);
++					tmp =3D NULL;
++				} else {
+ 					sc_log_openssl(card->ctx);
+ 					printf("  Invalid Subject-CN\n");
+-					X509_free(c);
+-					continue;
+ 				}
+-				printf("  Subject-CN: %s\n", buf2);
+-				if (X509_NAME_get_text_by_NID(X509_get_issuer_name(c), NID_commonName=
, buf2, sizeof(buf2)) < 0) {
++
++				idx =3D X509_NAME_get_index_by_NID(X509_get_issuer_name(c), NID_commo=
nName, -1);
++				if (idx >=3D 0 &&
++						((ne =3D X509_NAME_get_entry(X509_get_issuer_name(c), idx)) !=3D NU=
LL) &&
++						((a_str =3D X509_NAME_ENTRY_get_data(ne)) !=3D NULL) &&
++						((out_len =3D ASN1_STRING_to_UTF8(&tmp, a_str)) > 0)) {
++					printf("  Issuer-CN:  %s\n", tmp);
++					OPENSSL_free(tmp);
++					tmp =3D NULL;
++				} else {
+ 					sc_log_openssl(card->ctx);
+ 					printf("  Invalid Issuer-CN\n");
+-					X509_free(c);
+-					continue;
+ 				}
+-				printf("  Issuer-CN:  %s\n", buf2);
+ 				X509_free(c);
+-			} else {
+-				sc_log_openssl(card->ctx);
+-				printf("  Invalid Certificate-Data\n");
+ 			}
+ 		} else printf(", empty\n");
+ 	}
+diff --git a/src/tools/pkcs11-tool.c b/src/tools/pkcs11-tool.c
+index f3ac4e6bf1..21c22864ee 100644
+--- a/src/tools/pkcs11-tool.c
++++ b/src/tools/pkcs11-tool.c
+@@ -7389,8 +7389,8 @@ static int read_object(CK_SESSION_HANDLE session)
+ #endif
+ 				point =3D EC_POINT_new(group);
+ 				if (os) {
+-					a =3D os->data;
+-					a_len =3D os->length;
++					a =3D ASN1_STRING_get0_data(os);
++					a_len =3D ASN1_STRING_length(os);
+ 					success =3D EC_POINT_oct2point(group, point, a, a_len, NULL);
+ 				}
+ 				if (!success) { /* Workaround for broken PKCS#11 modules */
+@@ -7464,9 +7464,9 @@ static int read_object(CK_SESSION_HANDLE session)
+=20
+ 					a =3D params;
+ 					if (d2i_ASN1_PRINTABLESTRING(&curve, &a, (long)len) !=3D NULL) {
+-						if (strcmp((char *)curve->data, "edwards25519") &&
+-								strcmp((char *)curve->data, "curve25519")) {
+-							util_fatal("Unknown curve name \"%si\"", curve->data);
++						if (strcmp((char *)ASN1_STRING_get0_data(curve), "edwards25519") &&
++								strcmp((char *)ASN1_STRING_get0_data(curve), "curve25519")) {
++							util_fatal("Unknown curve name \"%si\"", (char *)ASN1_STRING_get0_=
data(curve));
+ 						}
+ 						ASN1_PRINTABLESTRING_free(curve);
+ 					} else if (d2i_ASN1_OBJECT(&obj, &a, (long)len) !=3D NULL) {
+@@ -7526,26 +7526,26 @@ static int read_object(CK_SESSION_HANDLE session)
+ 					}
+ 				}
+=20
+-				if (type =3D=3D CKK_EC_EDWARDS && os->length =3D=3D BYTES4BITS(256)) =
/* note extra bit */
++				if (type =3D=3D CKK_EC_EDWARDS && len =3D=3D BYTES4BITS(256)) /* note=
 extra bit */
+ 					raw_pk =3D EVP_PKEY_ED25519;
+ #ifdef EVP_PKEY_ED448
+-				else if (type =3D=3D CKK_EC_EDWARDS && os->length =3D=3D ED448_KEY_SI=
ZE_BYTES)
++				else if (type =3D=3D CKK_EC_EDWARDS && len =3D=3D ED448_KEY_SIZE_BYTE=
S)
+ 					raw_pk =3D EVP_PKEY_ED448;
+ #endif /* EVP_PKEY_ED448 */
+ #ifdef EVP_PKEY_X25519
+-				else if (type =3D=3D CKK_EC_MONTGOMERY && os->length =3D=3D BYTES4BIT=
S(256)) /* note extra bit */
++				else if (type =3D=3D CKK_EC_MONTGOMERY && len =3D=3D BYTES4BITS(256))=
 /* note extra bit */
+ 					raw_pk =3D EVP_PKEY_X25519;
+ #endif /*EVP_PKEY_X25519 */
+ #ifdef EVP_PKEY_X448
+-				else if (type =3D=3D CKK_EC_MONTGOMERY && os->length =3D=3D BYTES4BIT=
S(448))
++				else if (type =3D=3D CKK_EC_MONTGOMERY && len =3D=3D BYTES4BITS(448))
+ 					raw_pk =3D EVP_PKEY_X448;
+ #endif /* EVP_PKEY_X448 */
+ 				else
+ 					util_fatal("Invalid or not supported CKK_EC_EDWARDS or CKK_EC_MONTGO=
MERY public key");
+=20
+ 				key =3D EVP_PKEY_new_raw_public_key(raw_pk, NULL,
+-						(const uint8_t *)os->data,
+-						os->length);
++						(const uint8_t *)ASN1_STRING_get0_data(os),
++						ASN1_STRING_length(os));
+ 				ASN1_STRING_free(os);
+ 				if (key =3D=3D NULL) {
+ 					util_fatal("out of memory");
+diff --git a/src/tools/pkcs15-init.c b/src/tools/pkcs15-init.c
+index e011232987..b978e0677a 100644
+--- a/src/tools/pkcs15-init.c
++++ b/src/tools/pkcs15-init.c
+@@ -2593,8 +2593,8 @@ do_read_data_object(const char *name, u8 **out, size=
_t *outlen, size_t expected)
+ static char *
+ cert_common_name(X509 *x509)
+ {
+-	X509_NAME_ENTRY *ne =3D NULL;
+-	ASN1_STRING *a_str =3D NULL;
++	const X509_NAME_ENTRY *ne =3D NULL;
++	const ASN1_STRING *a_str =3D NULL;
+ 	char *out =3D NULL;
+ 	unsigned char *tmp =3D NULL;
+ 	int idx, out_len =3D 0;
diff --git a/meta-oe/recipes-support/opensc/opensc_0.27.1.bb b/meta-oe/reci=
pes-support/opensc/opensc_0.27.1.bb
index d659fd1bee..05b7a58be5 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.27.1.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.27.1.bb
@@ -12,7 +12,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcb8aedd3bced19=
bd8026d96a8b6876d7"
 DEPENDS =3D "openssl"
=20
 SRCREV =3D "19868984dc4dc697af6a86d65ab32a1f19a43ea4"
-SRC_URI =3D "git://github.com/OpenSC/OpenSC;branch=3Dmaster;protocol=3Dhtt=
ps"
+SRC_URI =3D "git://github.com/OpenSC/OpenSC;branch=3Dmaster;protocol=3Dhtt=
ps \
+           file://0001-Changes-for-OpenSSL-4.0.0.patch \
+           "
=20
 CVE_STATUS[CVE-2024-8443] =3D "fixed-version: this is fixed since 0.26.0"
=20

