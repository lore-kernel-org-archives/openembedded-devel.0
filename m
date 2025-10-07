Return-Path: <Sana.Kazi@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E3BACCD184
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 07:55:52 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.119])
 by mx.groups.io with SMTP id smtpd.web10.13580.1759823741571375844
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Oct 2025 00:55:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=ul2pTBbj;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.57.119, mailfrom: sana.kazi@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HEj/ZPRsEAP5UJR5kcd7NheZIB9Dc0VriIorxDhRQFjPfb+Uut3gZ4IbmFPWFjBBRy0fqEG0qLegMDOIY+aNbzhQdRfLXAngJMCxJoxzrx4JXx21WiZtAEylbj45uEVhTvddYqUyb9cPMsBvFIyxg8xto+le++4r2uObtQtbTC34LsAJ/y7e9SC7YhH025s6VxKt2FmzKiP7o2bBLTZyy9bl/FR72O0OB+YOV5VTW0fMsIBgy1ww4qkAIvA426E5bh9bMPv86fgV4DS59NPXEYTxwd8UWbR96pm7YQoUE/1opeWx/tHsp2C2+bgaENfVh5AuZUjJ+X+z/cR0XdSV6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xMDVqTKdtRa7JA62zLRb+VuJ2RRV6SV3SGTtS3Uzho=;
 b=jdZnzyNE2yMcFFHZAUSlBh0PevYohABh5Odvbf0tIsRWWed4aSyjnBubmXCb5VbCUIF4pRsZ1w2Q4gewld7G3ymoCwJ8Cqs3U+gs24FObmCdOcYoxCZgHpkbns50JyYc/Xpu34TqfImaHLseFVVgi9inq7oNY6vnL2WoqK0hMdotgEq5UPjVgRvO/el1J31bNVfT69XxRy/vil/ghHoiVG2R7qGlAwZ9vcLxxspm1dSZrfL+umeQtwVkuvjikDzaHjaZwm2Ww5y1QrZUPCR7cgNP9oVpPL/d3mATeDxbhKW4JvZFRn2BzvllBj6GW/8MyBUkesyrqMi0nVU9WSkxnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xMDVqTKdtRa7JA62zLRb+VuJ2RRV6SV3SGTtS3Uzho=;
 b=ul2pTBbjMR+takKV6/kLcFUR+lKIbOut0qwa9yup4808mnA7qqTQZg7afvXg3lGyz/aajBNRE6L0e861cMZqBaAuqY+eYLaAxo7hbvZZ4NAJNfemPFeMVYseSzqEpgrph0Pk1lGhVpd/zcyRZlLalg91A7t23uIfQBjSEtBP5jTPqxAo7XM13+2/5v8yAgxVfKJ8dAz0Nje14KpIL8NWk8UpeyffbYQr1OraNskhNC+g0BAjbznETWII6ykfIPNyMjDDalG6LLYFEBlVU5eiSLbYRcqp07get/FqQaP4xuVhtxGKwkdp5vpdRA5NLApAEjPoEtztwlZLjqoyZILctA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA5P287MB4602.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:19a::20)
 by PN5P287MB4210.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2bc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Tue, 7 Oct
 2025 07:55:32 +0000
Received: from MA5P287MB4602.INDP287.PROD.OUTLOOK.COM
 ([fe80::478b:23ae:5e3b:de95]) by MA5P287MB4602.INDP287.PROD.OUTLOOK.COM
 ([fe80::478b:23ae:5e3b:de95%7]) with mapi id 15.20.9182.015; Tue, 7 Oct 2025
 07:55:32 +0000
From: Sana Kazi <Sana.Kazi@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org,
	sana.kazi@bmwtechworks.in
Subject: [meta-oe][kirkstone][PATCH] cryptsetup: Update the license field
Date: Tue,  7 Oct 2025 13:25:25 +0530
Message-ID: <20251007075525.18094-1-Sana.Kazi@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0049.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::12) To MA5P287MB4602.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:19a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5P287MB4602:EE_|PN5P287MB4210:EE_
X-MS-Office365-Filtering-Correlation-Id: 46d15d0e-dd67-484b-78ec-08de0576e3e8
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8oB6IcualeOv9b2Sc39X5mOYhsOapNzQCohNBOrBSFEQIwJugIhiFLQf0F+o?=
 =?us-ascii?Q?LNbofQezCOpgMr1+qQ8IW2qVJhp/fRQ0tE63KKLSwp4rKULvRcjQrefSIIn3?=
 =?us-ascii?Q?PHd4wK9cdcSEmOrrsEJ6nmv5+hpsVPNVpvYgs59sD6up29RLN96NlRBXCsjl?=
 =?us-ascii?Q?tLJ1/pjIk9EP1L1Yh3Ga90pAOqnibzDrG9JKRpIWXFWylgPPMcEkUrE7cyU2?=
 =?us-ascii?Q?/TWXosn3c/+91mlBjotV/CXPur+yxrJdNGGCGpKbvXXt8qdzxLzy+XaJBXNg?=
 =?us-ascii?Q?UH6O2c5XqKJHxwz+ii4M3HMYGzCYKo3cBo0p/TE0UDpVh8cJ4nWXooPbkaDy?=
 =?us-ascii?Q?yHUX/lgVk9EE7pBcMqvDH4hzyb15cjI+eyMokR5m6KUy8rB8pT4z/evBzHM3?=
 =?us-ascii?Q?lQJGxbVxBebg4BK8ZV5ih4IbWVZwp9hdbQSsIhKFaAY5h5b4lX5CiNX37Uo+?=
 =?us-ascii?Q?MzQXc7JOLKUeX69pFCOOuewhxO9sJtpgAdBVbjs5/SKu7jTjUJF+eMxaInfg?=
 =?us-ascii?Q?eFHNjFE9V5BtxSzQ24ZzDTZGf5s+Goj/ZzGHKRkTfYi/ZCy7P1HQZdJ3a911?=
 =?us-ascii?Q?jKUGTwxtSqEwOL9e3Dwqi+Ax3hMk6zfXf/lSsPprfsjzjFRtOwBzeb/Bq7zR?=
 =?us-ascii?Q?Ghfn7juYDuaVfGVvUdiaxjgpXhDrpOx0//Ox7714EzGt6KdxRdxUabWgQfKF?=
 =?us-ascii?Q?7YwBuWISPuXq8oSUIZGD6UMmuaK3ewYzgmVur2XokkRD6xzkxqQodnPf4peA?=
 =?us-ascii?Q?/+gHPJYpvXxIGPv8nZSEJ4MhIVf9knN7Cho4McLDPkd6dQuj/kEVoACIPEsW?=
 =?us-ascii?Q?crR3bYhXvcCiDtpPXipKlKyiW7ABlrViEDMNjrEV8KzBU7yfdTS54H9nPgVi?=
 =?us-ascii?Q?qo+SxEcOAwrSkEVowmQGtuDhN9cxPKENWwM08BG0P9fTrdBLpwq70q04yq8Y?=
 =?us-ascii?Q?/Vbs1ikUAki/MBPSHk1JYBp4qXwXfBSpWzWeow/4o0yeOPLSKRtk3NoZXgs8?=
 =?us-ascii?Q?c5QfNnk6N8Q+nijT7EYPDKu9CNj/lOEgd4O96FTkE2LSKy0I2owcj6PcP2ub?=
 =?us-ascii?Q?ys+StgKF392f5PEPXqq3lD0HkROCXkLOUcVKSJQcB6mntllBcLrEhHIwYjfD?=
 =?us-ascii?Q?XhIyyBIsflpnAVKMzJokGO8oKAWWak0JvB4rqj4rJqDr9Xq5M274AKZSTQdE?=
 =?us-ascii?Q?b50jctzTqS2xPN8zpjeJiDcFfyuisvIgT9YiQ8uaHoKsZYbx8sqK/q4KHUOa?=
 =?us-ascii?Q?/ZoEVxaRcTdlSY0xVpAeCd2T83jfGlv57VBTD5aQfjkrlNLU9lmpOXwttzW1?=
 =?us-ascii?Q?60sA6AxLHTOQZk2CVrmb4PQXSZl6/3svTpUpyH13tWfxj4PQWfJqrXS2nolB?=
 =?us-ascii?Q?r+wGp9Fjb7zD7NcLhJWeAtfvUFbZeGeUZOc1rZKV2wzgDVWto/ttUrBR4Fm3?=
 =?us-ascii?Q?jCH+INEO/1iZ3ON2ZAKfbCK25Ks8MiDi?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA5P287MB4602.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?y404HlMp7jkK5OO5c1v2XY9ovY2rxKpHE9pcSLTxhJtlyxCe2FOj7h5tmaZn?=
 =?us-ascii?Q?W1wgdTg+LVUNC48avfewVFBZpFSdweE5PQrnrDXcHz/AQOjC2ergezqTob1f?=
 =?us-ascii?Q?Wt1rxAY//3sOZgfhpp+9mwrpCTV3wonmq2bXnMzqmH44MrtWzqlqeZAyijNY?=
 =?us-ascii?Q?PSfDP2JZA0YfeHJXcNBZEdawSpS6WAjSm7UHNxApLvYDer3LusXEXxu457xa?=
 =?us-ascii?Q?7KS7yEi4VmfCxhE7i9FeFAJr/+5p8CA4zJFI9V0l6782IqgQ72unrDR4vBIk?=
 =?us-ascii?Q?3v9WBBcxfJB7K6wuK/j+cI91VAuVx9jceLqPVHZWoToIB61tLct/HhHZffhe?=
 =?us-ascii?Q?J1somCg544QAeM6dTxMYNUWvxsKvPdhnu3e2sKkZn4PhOyhmVOM+frmCGetD?=
 =?us-ascii?Q?6W0oCouhJN5aw6bFiyQhgEBIbocrs1aEkBajE2uwhcYFIT811Y8aAPS4pCAq?=
 =?us-ascii?Q?xaV5hwr2tL+2vVdA5GYmW8R+Qx8asU1e3rPGtdE9VfVSBIJZaQaQJu0KhPzb?=
 =?us-ascii?Q?5ArDvpkIOoagiv/FeilHwsFyacl8l6uK9eeuHw91mPs0QwKv781BbFvBO+KQ?=
 =?us-ascii?Q?ejLCfPabtEJe8QWpFzpJDZV8BVGa/e2Kwv4WwSqytSWni+GX3EzTx6bsAcOI?=
 =?us-ascii?Q?KVz9NcyRQxfVcQkTPQSCSREDa1n5h5s2W/yPXYITLIVBeLRwy1gGfs4X/PxJ?=
 =?us-ascii?Q?FYUtyYi326T+beSchy85inhWI/ecwgqPFnXGbwTqc2e4BtrsY0bEtK6RbWVy?=
 =?us-ascii?Q?QXZfu53zjeIiKOzl271H3Z/PmJYXL8AxL0/bAJPx/cM0te7+pMIMUXEcpqdU?=
 =?us-ascii?Q?SSs4BwV9gaPfU0qMUdvP0IaYKg3sbHpKPZvnHj8QBVkNKTFR4kHJEYCLbABm?=
 =?us-ascii?Q?d5NrcEMrLPWHsgyltPTTE8Z9lj2OLvECABgJEsMAqMBHLI0yfORGPQ10pD/r?=
 =?us-ascii?Q?1u++KhsnSEO3uqZgS6R9r34RttLZBdJJfdObR7+eaeGgqhmILcqT4wVtPZwJ?=
 =?us-ascii?Q?bDBOB79NjF46YNa+FpZ9oOnBTWwnbFVtyzcbGNAKc4lbilo1m91SE7CkqyHS?=
 =?us-ascii?Q?cXq1mgGc3EbBp3ze/v8mUqd9jkLqYzuXsA9jPYBjVpoDkr2+l2YjOI+T86FT?=
 =?us-ascii?Q?PVabt/+3P5xO7Tyi0BOlp7Pr7nXvMJfMaCt2RgHncE8Imu+T9KfsrXHKVo+C?=
 =?us-ascii?Q?/a6xYCTxMSy+5fJDEoE5GbgfuKBm6Hc2aw4iwTTrw6FGbd8qqnbpW2U8aC2X?=
 =?us-ascii?Q?EJV6g8lFv3nxsRBmSIiCTn906Ws/WCmeLk+A/BGDq4Tn7nb+mKhvV5pqcU24?=
 =?us-ascii?Q?SBveRSPOWfJ5VgsCcqJ2ysI3wgCVJQUcukw5GT3nekKVSuadN1AuKa+gkbRf?=
 =?us-ascii?Q?hN+mAtMQyZF3uM06KVmyBTSsfzt9LVkzZ3ChinuUcxI3SD6WGX6jnXguJE/F?=
 =?us-ascii?Q?JQonId55YUetUC9p+CKdi50gXNk0Ol95xtcAfo2Gy2kjEzJPud4Ew9bvL8uA?=
 =?us-ascii?Q?JQUiHRhBU5rp5nc0lqwg+2q7Cw5C4QYeprtyU6HFg1DVYi14mJ79vToM/8bI?=
 =?us-ascii?Q?f9uKpEcIQUnuKy8dNwSfRDoWsDZkiqRw3twsszr9?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 46d15d0e-dd67-484b-78ec-08de0576e3e8
X-MS-Exchange-CrossTenant-AuthSource: MA5P287MB4602.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 07:55:32.3145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: its6cDKVil/zsksNuojvVHhnqoziyKrNO7I+YEi4dSSaKTjD4Y/+l2r/JcVTMjGRRLYwGpgI6a9U4FeNeSGto360thKpr5IpADvpLXzP4m0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN5P287MB4210
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 07:55:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120321

The below reference clearly states that GPL-2.0-with-OpenSSL-exception
is to be used with GPL 2.0 or GPL3.0 and not as a standalone license.
Therefore, update the correct license.

Reference:
https://github.com/aboutcode-org/scancode-licensedb/blob/569d72e13e7c8d14a4=
4380f91e80c5a2d4091f8f/docs/openssl-exception-gpl-2.0.yml#L7

Signed-off-by: Sana Kazi <Sana.Kazi@bmwtechworks.in>
---
 meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb b/meta-o=
e/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
index 4f8bbf0358..e93c800241 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
@@ -6,7 +6,7 @@ and can hence offer more features than plain dm-crypt. On t=
he other \
 hand, the header is visible and vulnerable to damage."
 HOMEPAGE =3D "https://gitlab.com/cryptsetup/cryptsetup"
 SECTION =3D "console"
-LICENSE =3D "GPL-2.0-with-OpenSSL-exception"
+LICENSE =3D "LGPL-2.1-or-later & GPL-2.0-or-later & GPL-2.0-with-OpenSSL-e=
xception"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D32107dd283b1dfeb66c9b3e6be31232=
6"
=20
 DEPENDS =3D " \
--=20
2.34.1


