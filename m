Return-Path: <matthias.p@variscite.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 292FCCD37B2
	for <webhook@archiver.kernel.org>; Sat,  9 May 2026 23:00:31 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.109])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21139.1778367622577548074
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 May 2026 16:00:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@variscite.com header.s=selector2 header.b=LH3/Srp2;
 spf=pass (domain: variscite.com, ip: 52.101.66.109, mailfrom: matthias.p@variscite.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZSMoJpHeww9sSEjyl5CYGS7mtBnHS0P8q09vQEGNJt+x50Cv05/hufZH2gUYwxmDhgFMbShEGP4Cl9hBy6jmmIqVDdYMmvm/Zpl84VPZECI7YydCoi6hzyxKgTW31cRBvPpH947BokNGMoh4vTMPgyUER6/uNGgU7T/KoEvc4UXDKavbSvTmW+uSjfiMLX/sLQWufaBdIfzaNcEbdevvI2MLc7sTkdIh1xCWPic2Eje6EbYkPkaepbIXCP1KgHr9e0QbK9z95v6/Z3CXoafjhJcTcmb3CinWYBF++9I7vUlkiP9iqFAxRnPIH+La/xsRX6ucxXClCAEipFJQS13cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vhnPUNXXZ8g/zu59Z3hKtLlIT8zrKtMmYl5OiQORfqE=;
 b=phZW94UhHHRQ36lFOjEKY5zq+EcGiEvpVcrlVGxA93tGuTWm52qqAYvCRNVYIH2dZxnckL2gLEI0D9OZxQ9gxC1IrdMavgcJ+9fH6FQWd1spkY1aU+bvlgBrED6m1qPYRr4yhOtqhmViE+3vA+7QHmSGvTB0TqH7yx6UtsOAlOWpTmKv54cuTJ8MBi0ckXPALa5xtvgiMymrMrQCLqpJu1psfzvA+hUNe0eGEocr8jdGTXe5FWLfHvRIXl+bo6vnpN9ZgI3yOpYdRXaT1Q8TmK0sHlWuVa4OYOOM5gnet8Qb6zMbymju8IXUIsUrEJuQFJRt2b0mE5sywCQLIUc2bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=variscite.com; dmarc=pass action=none
 header.from=variscite.com; dkim=pass header.d=variscite.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=variscite.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhnPUNXXZ8g/zu59Z3hKtLlIT8zrKtMmYl5OiQORfqE=;
 b=LH3/Srp2xzJTjNKgM1FuGB2zgbYeC4PINt7Cj3N0g6k81WJnZu31drv2ezq29uzVbF23mScsS3a420lsKJdACOk/JtRSv77ITgLMEd52E6Iwe3OhAy0EipXk3TrBOtO12U6BY+fPFbIEE9aNcnundkTdMugKT/8GDRJ4fg8oKC3ByfQnLyuSkIe1ZdXaLluLIjJUd6hR5GOIRQIEbSaC7u6VHnjTWWKGLI5ec7J6nxrU61zuIRCbM7zTXK299XqIkdU9TecSau5bwpiwA3epD/cdSsSLX/Bu+cWvTR3UsIsJbnCcL42je5zjBU6a/sefqjit0u8k+ckDLnEo1KVTHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=variscite.com;
Received: from DB9PR08MB6715.eurprd08.prod.outlook.com (2603:10a6:10:26f::9)
 by VE1PR08MB5791.eurprd08.prod.outlook.com (2603:10a6:800:1b1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Sat, 9 May
 2026 23:00:17 +0000
Received: from DB9PR08MB6715.eurprd08.prod.outlook.com
 ([fe80::e021:f0f7:11f0:80da]) by DB9PR08MB6715.eurprd08.prod.outlook.com
 ([fe80::e021:f0f7:11f0:80da%3]) with mapi id 15.20.9891.019; Sat, 9 May 2026
 23:00:17 +0000
From: Matthias Proske <matthias.p@variscite.com>
To: openembedded-devel@lists.openembedded.org
CC: Matthias Proske <matthias.p@variscite.com>
Subject: [meta-oe] [kirkstone] [PATCH] fmt: fix SRC_URI
Date: Sun, 10 May 2026 01:00:07 +0200
Message-ID: <20260509230006.8337-2-matthias.p@variscite.com>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: CPAP307CA0004.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:3::17) To DB9PR08MB6715.eurprd08.prod.outlook.com
 (2603:10a6:10:26f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR08MB6715:EE_|VE1PR08MB5791:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fb92d0e-062d-4345-9d80-08deae1ebcc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|3023799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	LDZrk3mG9RpPKxkYQY2D5//qEkZksSHXIc/AP5Q2ek3FSWKkJHS008Vm7okjRy87bbtDQaYUmCxxJfk/APO3sro3PvjhljQm2Dw1tZapd/qj1ebD9+e4CPg6nfJPIqkynIctq4XaMAm4HBkKhX4LSg7Xh4zxMOnx167qMEOwTbxv5zsRYycGcQ6sAotgnixyv500xxFTSO0q/mSF0prDnh/C8xe3EG56jw37bIhCBfGBHKurP2gY2fQMIrI5BuWzLfz+Kd5JsG2TvCZdMBWMHgeg8DkPKE0onc9wNqww7vGA2UV0W6dKbNk4Ki4C6D9Ng9DJTMtLIlqWuoXGt+C30WqH2MqbLqRLDLDDNsvS6SiKjU0M3SafD1zvBzMq8pSVDOxnWONh6roFbfbPg+RXRwWjeecvSZEH3h1rBNpZ1AyhtLI0UVFxa5GZ7/Xpd5AA6tlzLgWmkS01Pjxo7SBIOhJ2qbyYc2Dy0n+pNnjVIfyWxMvMvNu1bHFmnXlD1ebs4RJLGtfpj+1j5xcdLej++yRrCIC5lN/u1tnQLH0QKSg1K04OqUXCNd8PLMDGAQknD+/eULbvBlm+9BbRuXWKG5W3+fRSd7H8ufdQ7tietEPOWJgM/bgpK80TM36R457xTkQ1ElMBt9P2TrwOhEtvhA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6715.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(3023799003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ui035i9MBNY8VG0KO7jWGDzTUqhWbtnCkSB9t0nFa2zCcgdn5RVpOyqKbHse?=
 =?us-ascii?Q?ikDFR7Mlk5AbDeIEl1VBvHlbfK5mVAWnl8IH9Rrf2nMyd+4jlKbfDSxS+/Bs?=
 =?us-ascii?Q?f/U2m9GErBYuYTczBmU1h9Bl2BBc3XE7LZFHhpcQDDiTApsiMJkd29D7S2Y7?=
 =?us-ascii?Q?F0swtnV8iqcCXMZPUoyU3Lfyt9aKfpwWfBOFbPNNGhbff3Mrn/d12soZjyrw?=
 =?us-ascii?Q?nhRBQfIFv2M6G8umRGOp7g9BcMjr4rSO+YXubpXXKidKFar+/ue2wqK3uJuV?=
 =?us-ascii?Q?gISJtVzf+PI+W/m1giuabOrp+DsYyN2mBe4WYMGccxPnWMrUCQkBqSoNfet4?=
 =?us-ascii?Q?nQz34m8TVmMjDV37Qxlgjk3UVtntOQYrXuBCz3zlYV7YihSfI2WFxBUaAavM?=
 =?us-ascii?Q?pLwcdpcgqBBv52rwKba0iZC7+61I3VmdTFNUGVWltv4SR2Ms1Ls9JfZ7PWJX?=
 =?us-ascii?Q?J8AKfwSwPoqq9NacC0s6qG6g05hD5L2nSKOFkwm7BoI5uQNOdk5MGq0QD7BH?=
 =?us-ascii?Q?2PwRvB70KL6jkQSTimnMqPEbieMzaR4jxrEwQ2kiYTHLUDqCaRWBSNkxf3Na?=
 =?us-ascii?Q?htYjzfnnpEcsmkCuSAi6XkbkBIabWNouBeN2XELDt6NDSsHhbdhqRCmUpcBi?=
 =?us-ascii?Q?h8ZrP+XiQK5e6fcPIy0pME7VlT6IfKSR+9w7YzRyAplytEBEuvs6Akc6wFyR?=
 =?us-ascii?Q?cI6G94xl51uxZqPVAQrDj3yOOp3MpJrUc3DxkVO8KBWro4+soEt16R/kpsta?=
 =?us-ascii?Q?OiahrADDZhv0dML75KgyCQIFPuG9DzLmrV4v5y/79ykrSAJtI+DkotOfh+ik?=
 =?us-ascii?Q?1egzvDW0VITA4NXX7mJquVx1rbHEqV1WT3Ngy3+xMt7sCulw3RaybldtmJVi?=
 =?us-ascii?Q?A8LEne5hZ9mWqs4Fn31CH46T8gyyk+MEbgTiIbZqODYW/XzQuXuDspNKuKQ3?=
 =?us-ascii?Q?A1+QlSWY6xktvt0IGnLhYcw85Xx7z8EjuKsJ3cTAnxd9RfK6pMJnkxtInig6?=
 =?us-ascii?Q?m+2ggMPtoyyp9qB+3pU+OV+OBi+q9dkwTzLoCpAy0MYvGuhPiFw+TW5rionj?=
 =?us-ascii?Q?2WqRB8Mr84hqxofad62heCuc6PsixguW9eiYNYNJWtpDAod099BT82cfh9wK?=
 =?us-ascii?Q?VisuBgbCFmK1wJLfdJxaYIGo0XSxS/HVL45YJyg1l8uJUWMVMz7VeOEiBd63?=
 =?us-ascii?Q?zfrJQUmXP9D5YM0x+Ncc6nFuhqq7yZTl92f2EUqAODrQCZi6M0qXbq6EQg6k?=
 =?us-ascii?Q?OAS48ehJk/htTcCLytFpTqbCzj46EiVAJ4vNfq+uQD63QLsEGSHA7Q1laxNY?=
 =?us-ascii?Q?eweA9LOIoHjc4nnj+rhNCBgLV6m/Q+quYc77NAsCLnFPM8XBs2WEBPGzb4ij?=
 =?us-ascii?Q?YiBlNfgk4jgreyn5URJwHmEBI5Z2xB/m4/jhpAbyPstIUWiRZA48AxmoUOuh?=
 =?us-ascii?Q?hOuYse/1ulTj7+EjGg/ViUyrPkYUbWJjBxCR3LwffUxuvH6L9pCCVzLQxMXv?=
 =?us-ascii?Q?YE0eYp7gF2x+Y7Aw/70HopU48sWNrsMDKa/Mym8IpX/m3cazWQrkxbd40nPn?=
 =?us-ascii?Q?5wlz5A4TkRw8do+ybFPWB1qkLKJBGbiuOXV73hcBQceEFRngOfOukPlVX2G+?=
 =?us-ascii?Q?VnZWufHbusyWp6hJOcK4sm6FuYbuWpsUWj3/mGymbDzm+/+JBC/+3BOlZojx?=
 =?us-ascii?Q?sToG8NUpIQ0Wj1izP/I/gEEbwJq6wVi5qxzNyZxvnuZOefTaID/ILVmuYeU5?=
 =?us-ascii?Q?UKnQ8DBCoi2Fa9HfRQpSb1tyiUNc3zQ=3D?=
X-OriginatorOrg: variscite.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fb92d0e-062d-4345-9d80-08deae1ebcc3
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6715.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 23:00:17.3320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 399ae6ac-38f4-4ef0-94a8-440b0ad581de
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: plmc69NSm4/QOXSdi3pbgRovoYqDGjrXS7JIiwr8ubQYM+t868OsBTIu58vskVRrRXL7pIYCwNEriKFtHKfD0KFpp2y0wP6Wr6YEivxHYss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5791
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 09 May 2026 23:00:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126832

The source branch was renamed from master to main.

Signed-off-by: Matthias Proske <matthias.p@variscite.com>
---
 meta-oe/recipes-support/fmt/fmt_8.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/fmt/fmt_8.1.1.bb b/meta-oe/recipes-sup=
port/fmt/fmt_8.1.1.bb
index 54b8fd3d9e..6655d1311a 100644
--- a/meta-oe/recipes-support/fmt/fmt_8.1.1.bb
+++ b/meta-oe/recipes-support/fmt/fmt_8.1.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE =3D "https://fmt.dev"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3Daf88d758f75f3c5c48a967501f2=
4384b"
=20
-SRC_URI =3D "git://github.com/fmtlib/fmt;branch=3Dmaster;protocol=3Dhttps =
\
+SRC_URI =3D "git://github.com/fmtlib/fmt;branch=3Dmain;protocol=3Dhttps \
            file://run-ptest"
 SRCREV =3D "b6f4ceaed0a0a24ccf575fab6c56dd50ccf6f1a9"
=20
--=20
2.54.0


