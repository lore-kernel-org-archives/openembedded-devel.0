Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF10C61DCD
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 18:54:03 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1798.1787856836066463489
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2026 11:53:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Tci4sCss;
 spf=pass (domain: est.tech, ip: 52.101.65.11, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b1iC8hD7wU8ZfsYpIfxMU2lQ2FFJmlnCMNli1IhlZQAXOKdbr5nm42/r02r8a0zhlRc82es5SjmCSOO/oBatrT6zoh3excBqfVyw04lEhw+EBrCEyJLPh1wzDYI3LhBPIi5tJb6XT0NeOh7ifKrsGlGyqJk5r/0eBFiDjVdn0QSp+fE0HWWPs8RXc+HIxid/klhqGkThOm28pFs/INI+Yi1tj4knqdM7cE1EXrKKv3vWCuFTtW+KiJS2G5LMbH3RpupXZJId+Tipqr+cyKonmhbquIYWgz2ZvZ6ECnvirmfhqkrUrcbnurUm7kFeefb8myT3IwmhFUr3yjvmJwE8vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIQw/Y0D4wULQxQeMgBGRB9Bn85AZ/oQjA9BUGNydvE=;
 b=bGfw8DdZ3+nbO+COxknZz2jAe5m9vlSlDvG9wUkvDnbt+8OYvcCW/m0lDwJmcZCSWG3aJb0tgVaEBw5mFHvydAR05FmWLP4S1ViE+bkzAqQGD3r4AvZtEhq8ovXkMUi8dOGjMY2xnwpOKpD5DYjtDonL3p3eTijanbfNZ1gbmGwzUgwTnqHGBURHrG1vFk0Q+qM+jdn+lgJ6UExKkXw8/Ek+fQ7C0Xb+M+SX5nypklYTwtzprvzYPd8mNm1Y65zusBlgKeC5EkPPBpTcKlRrGN1JPlU6pUmuZiP+A9UM2Wds3+Bv6v6kIUn7mK7z61aKX79xd2+ND+tqAT6Rbje9uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIQw/Y0D4wULQxQeMgBGRB9Bn85AZ/oQjA9BUGNydvE=;
 b=Tci4sCssii+CW0bNy4lYppW3zTuO3PQm2wjjAraWi64vkowmDQNsU06/wqxrHBzrDjSJfHOW0Ic35J8tc1FLRbup18JQr/34b10fjXV3aw5ru2xhl4YwNonOkrSHbqm4+qE1OuOeInvAsIK/20TxzKgbX0r0BYQLvh6zBPmQpT8QofmScBtY3IXppnvs7mj5IYIGbaJOD1aBjR7Ijszr29pD9E5Fs8rD9wqZRz6CF1113eu6NpZMY5YqaVRqzNtOFMuAT4tr8al1EmGukXQizIr2dCO0bGVsXn4ZVgy9HmR27anPYIKEsStY7IfH8P2p/D2KEuNC6bjgf+lVVlTiIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB9P189MB3598.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5fc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 18:53:53 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 18:53:53 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [meta-oe][RFC 11/20] imapfilter: fix build with OpenSSL 4.0
Date: Thu, 27 Aug 2026 20:53:15 +0200
Message-ID: <20260827185324.78997-12-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
References: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0040.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::18) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB9P189MB3598:EE_
X-MS-Office365-Filtering-Correlation-Id: 0350245f-1912-442e-36b3-08df046c8a96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10070799003|10067099003|56012099006|11063799006|3023799007|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	avSxJIv8GrYyIRoqzv3VutQ3PMrRHxEBzQfl52A1SYZDw9rIZljt1jR8YUth3J0PDW2b6AMA9Q0nUv5WiKPe7/sM3mHA9UPV/vEZ+GyuCVrjIuS1OrejNEZK76ZBdpKYuedy3bgKp0FcTlgJeiqUONozvK93JF3ixi0zKho8+LJlC21HnnfuPgPzx6Tdu8oan0ibbi/CN0rhcOy7hIrDYh0Miuhe4iBsEZcHdtrVXss92nbVGL4YcKeNPR0+t9LGhYWpbM2SThlTL6Z7NvtRroy1QOn8d9iNz3qkryNlFPr20I3aKYe2tUklJGN1Ys0DaZA8A5vAB7BLCvYzAK/ttT/+N6qOHpYm/ANOk7BIviIDm+dBeeSjrhTp2llz0bWAp56HLE0Gj+ElZyP4wTMEtkuVA1yA0jgXum8Z0Jy2HRiBcKvTFICB0JagOxABOm3BjxGsYT/b08OtDcJkpr7ffB9l4kjQKvOlkFLRnKp5IXhPvH8uCIz2BAVJo++Y5FIBhaPRAMKhK7WwYKrHfQbBuJv/qXDpTSSg1p7GACKODoGUYwQnOM5qpFW3WsD8kljMHwal08DxotHTJB2CtP8bMhaqjSov79PNAEHMvT28rVOB7nryp/EdmAIcGhP47JlWKbwAoxvNTJq7XhLBG0+clAVqFWzY5eKXIBEbKrJl7XM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10070799003)(10067099003)(56012099006)(11063799006)(3023799007)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lhrl85fQ7x8MfHpAPwAFSLb3GAhUXhlJ6edZgSm6fSwnWQx4khJojCJ6pxdO?=
 =?us-ascii?Q?L8KLg3MX6/eEQfJnil2RCqogcyfODjuPz40L+VTVB2bOY6HGsYOEPjs5Kd40?=
 =?us-ascii?Q?n/6QaYMa7jJP5288A2/N2oSZwOlGqKC3zlDWzP6gDWVDfSuYCuSDvBz9C/FS?=
 =?us-ascii?Q?LCf1p89kFoY+RJRsp7Bbd72D2Pyez/eZKDvVYXu9bHr22O+czaClMUuOvBD7?=
 =?us-ascii?Q?4kOKTSvY9YDRfyH82hbn2c6BqlCnPoleWHhNOLesd8cbPM9dp8Yhz0gsws0/?=
 =?us-ascii?Q?+QY3yHxjYZ9+eK+6AwCcrkOjByAruPv2jTUvbbMk0psO+u0w/ho/YZfdNUM9?=
 =?us-ascii?Q?RjhQlhI2mgET3cVic0W0+0lZC0RTPbWugvH1qzPH41pWzuDN9w1riivoLDnN?=
 =?us-ascii?Q?f7UzqICvCWpDYoXPJ14ysCnRNwcJ/lGkaiy3Mppz3BTN3Bl4xUp2XrGTs3nJ?=
 =?us-ascii?Q?KSfRAUKRZ8jjuct4prIfFf98wYoaTBrg0K8bBEevwPrTF+aaA8u3mh7ftR7s?=
 =?us-ascii?Q?JrenOQgh1N4l4A/7BsbopZFwu9Bs8qgq+zE9gXGbG5V7vm4nmRXgn1mOFFB9?=
 =?us-ascii?Q?CaNAniYzk7xs/K8/xbIR86ElrNAltbKFm6lLQkiqjdLLtMsoYCautHZmcJeo?=
 =?us-ascii?Q?WuZMh4awMULurtgekAciDIqeJr9UxJPk/KRxYc9eReOhIHtNLuuQd625gEu5?=
 =?us-ascii?Q?DfeLesWLJVZJDrgBVAhkAXs3jTHP+lZKsqZ99Ahk60KOoM7luZGbsk4KbyR5?=
 =?us-ascii?Q?5rXzcT5UfRwWONazffCCbkxpsVbJvAlOWHPx1jp7KTOuFA0mBsSGD/FI4YQm?=
 =?us-ascii?Q?vXDmnbD80K1kZinMqBsswXmJOpb94rOLCN5yjLxMDzkmPlGpUrSrg1i4Mlt/?=
 =?us-ascii?Q?2z+bLxfmtV/VJflfrnesPBtgvm9XR2+rSUJpo79eGt67G0BsRb2uewhfOlNd?=
 =?us-ascii?Q?BzX0Y0/Bc8cqmFct7S0EBqnYC+0jDb0EB6jLqnEVufjOxsiU5Uv6jWcB2kQl?=
 =?us-ascii?Q?3WNVd2ZITocVkK9ajqmxJ8KmgtprcvTRZ38q+L0DFBpzy2RV12CikSKW7XS5?=
 =?us-ascii?Q?pFGv+PF542/hzwEmwjDD2z5QQ/zx/JzEO/8r+1y3OlE25FZIdvLaxmhdMqJB?=
 =?us-ascii?Q?Xeqw461yViqSIDwov3cJ5EIUlIOIcmCoZYT3Di3VCVumRc2pS3O9e/EGX82Q?=
 =?us-ascii?Q?iqq5VamoCHfTOKGUFoQXY44e4XXlW02EXG2XGu8uNCG/ZaIGN/E3TZa5DDIS?=
 =?us-ascii?Q?KhS1FR9m8oqU4CZ1z5uyqye+/28oGi+0duzWOXdtkXWHgiHLkniTnVZeNkr4?=
 =?us-ascii?Q?lF9NSoXM5T+9NvlLRc1Uex8APoDq3xuZxm1QSrF2vocBn1Du7qFUxn1xej9H?=
 =?us-ascii?Q?HfLX9xtJ4+r8gvXF2sVl70Z+R3PFoHmyLJh5l4ThN99yn5omcLEr/+4k5mPk?=
 =?us-ascii?Q?cSqXp/6Uj0MhIYh6OYrikWaRUmhuv8zwcZDpJjiVhCFzDLURM1l7HltrqYbH?=
 =?us-ascii?Q?IFYkdCQe/Mf7q2+YUY//ZyolP2SwfDY/jNWZ60yL3rvTLiYeYbAo2L3BNoQv?=
 =?us-ascii?Q?9W3+xAjQhneD/Sz4JVhSIYzWfUZA2ULGTSJZBVQGvw7Tt/xEp0vF5UWCXVB9?=
 =?us-ascii?Q?4sSubGjtvoBmNSspR9m0USREfOdaZLhVwKHkj6fZrSBCvT50AhEB5+zMfO90?=
 =?us-ascii?Q?lgworqk2Hx5mW9FJiyN1biJDkL+PwRaKqxtXLGULdjN8QXLCiFYVEM1akvGi?=
 =?us-ascii?Q?s9PBD0msig2EG7HKY84SyVVo7tQyFbj2bXTvqhSY3tFIQWaw1Gg7g1ftWdEE?=
X-MS-Exchange-AntiSpam-MessageData-1: DvDuAGyoE/OvX5wMq4Zu7Z/F15QRd1KoDgg=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 0350245f-1912-442e-36b3-08df046c8a96
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 18:53:53.8959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: frc899rE8r8xj18XseLQWVyujyuFG8s/HGTqWtjyo7P+DIgE+uOaBJw26+7QmvLUvxwf18ucVS/oVh4QFInxQUpUMeU55cGbafMFDkPTOQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB3598
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 18:54:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129546

OpenSSL 4.0 makes ASN1_INTEGER opaque. Use ASN1_STRING accessors.

Upstream-Status: Submitted [https://github.com/lefcha/imapfilter/pull/317]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...NG-accessors-for-opaque-ASN1_INTEGER.patch | 45 +++++++++++++++++++
 .../imapfilter/imapfilter_2.8.5.bb            |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-support/imapfilter/imapfilter/0001-Use-=
ASN1_STRING-accessors-for-opaque-ASN1_INTEGER.patch

diff --git a/meta-oe/recipes-support/imapfilter/imapfilter/0001-Use-ASN1_ST=
RING-accessors-for-opaque-ASN1_INTEGER.patch b/meta-oe/recipes-support/imap=
filter/imapfilter/0001-Use-ASN1_STRING-accessors-for-opaque-ASN1_INTEGER.pa=
tch
new file mode 100644
index 0000000000..4342de42c9
--- /dev/null
+++ b/meta-oe/recipes-support/imapfilter/imapfilter/0001-Use-ASN1_STRING-ac=
cessors-for-opaque-ASN1_INTEGER.patch
@@ -0,0 +1,45 @@
+From d0e1b29ee5ae0e6e91944fd5c04b943fc810e13c Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
+Date: Mon, 3 Aug 2026 23:02:04 +0200
+Subject: [PATCH] Use ASN1_STRING accessors for opaque ASN1_INTEGER
+
+OpenSSL 4.0 made ASN1_INTEGER opaque. Replace direct struct member
+access (->length, ->type, ->data) with ASN1_STRING_length(),
+ASN1_STRING_type(), ASN1_STRING_get0_data().
+Upstream-Status: Submitted [https://github.com/lefcha/imapfilter/pull/317]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/cert.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/cert.c b/src/cert.c
+index a6f614a..b188dd0 100644
+--- a/src/cert.c
++++ b/src/cert.c
+@@ -186,21 +186,21 @@ get_serial(X509 *cert)
+ 	serial =3D X509_get_serialNumber(cert);
+ 	buf =3D xmalloc(LINE_MAX);
+ 	*buf =3D '\0';
+-	if (serial->length <=3D (int)sizeof(long)) {
++	if (ASN1_STRING_length(serial) <=3D (int)sizeof(long)) {
+ 		num =3D ASN1_INTEGER_get(serial);
+-		if (serial->type =3D=3D V_ASN1_NEG_INTEGER) {
++		if (ASN1_STRING_type(serial) =3D=3D V_ASN1_NEG_INTEGER) {
+ 			snprintf(buf, LINE_MAX, "-%lX", -num);
+ 		} else {
+ 			snprintf(buf, LINE_MAX, "%lX", num);
+ 		}
+ 	} else {
+-		if (serial->type =3D=3D V_ASN1_NEG_INTEGER) {
++		if (ASN1_STRING_type(serial) =3D=3D V_ASN1_NEG_INTEGER) {
+ 			snprintf(buf, LINE_MAX, "-");
+ 		}
+-		for (i =3D 0; i < serial->length; i++) {
++		for (i =3D 0; i < ASN1_STRING_length(serial); i++) {
+ 			len =3D strlen(buf);
+ 			snprintf(buf + len, LINE_MAX - len, "%02X",
+-			    serial->data[i]);
++			    ASN1_STRING_get0_data(serial)[i]);
+ 		}
+ 	}
+ 	return buf;
diff --git a/meta-oe/recipes-support/imapfilter/imapfilter_2.8.5.bb b/meta-=
oe/recipes-support/imapfilter/imapfilter_2.8.5.bb
index 754e793faa..3e449523ca 100644
--- a/meta-oe/recipes-support/imapfilter/imapfilter_2.8.5.bb
+++ b/meta-oe/recipes-support/imapfilter/imapfilter_2.8.5.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc9e8d74e78283c63=
19317d3cb15eded4"
 SRCREV =3D "23b693f7f7cad8b459beb5cf748078f9cc0e5dc8"
 SRC_URI =3D "git://github.com/lefcha/imapfilter;protocol=3Dhttps;branch=3D=
master;tag=3Dv${PV} \
            file://ldflags.patch \
+           file://0001-Use-ASN1_STRING-accessors-for-opaque-ASN1_INTEGER.p=
atch \
 "
=20
 DEPENDS =3D "openssl lua libpcre2"

