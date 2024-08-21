Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37177C52D7C
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 15:30:35 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.135])
 by mx.groups.io with SMTP id smtpd.web11.22901.1724254226932166968
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Aug 2024 08:30:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=mp6sjd7D;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.103.135, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I2js5JCSHEubpbe2gSzT0eGbjv3p0CTVNigp0dJwDPoHlvI2T3RFz9Z6TlYPbWkVorzdKryRcogmxdagGEghodhp0HFBZ1vCZ52tB4oVBfXjylKlKlRBGMKdj4d/axSdQL0MdOV1H8wjrE0rgU04W1HO4+ovWjDVhUMe+iZwX6IfRG2far4rwptwMHBaC+RRvd4PC5gIU3gVKsXydCJcSet74UW9y8mGxAgF8HTE/K2Py40Z7+LsOiCMCyU+NrkqQ0DDmqqTFYsk1ldbsjYsAImYITOLySXhDOkBGZk+FzCo/mjz7lzG4ywiGUmXgDycIdJVwTbdybr+doPCgHEPBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IR+5GHnHtb8ChTi4boFbPCXlDffCw15qdB7H6jSGD84=;
 b=hL9aC1UPK7RKy6TPjA65ozZZbPgLL0CCZs0dfzYNHHqV+gdd/YxRsSuakaZJd0qWglBVJX6Nb1761mLnrcYDRVbf2XX4A9sqmQu8YhZ8OtWrBDM7lgPAnKYOliQAguWijLZw1A94Vzpx0A846dNpmELURODQtSyA/TX+hb8dYXRb5HyshQJVphv5huxqwrb95wluJ9M0aI6DrnaRRLwfUoODxh56GxdO2DuLsTeGi8YGaU6jKRiWPPi1HAil5mw7jgMUiBCLFEzt5beeAV7qNsY9ifeFwj7Ey9gpewXuoRjrqMIQZS2A65rCjSvOO9SFsZYF+4Q/8bvjWv2FwEGv9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IR+5GHnHtb8ChTi4boFbPCXlDffCw15qdB7H6jSGD84=;
 b=mp6sjd7DkvkFCGkvooxMfQaZPVpP5rc254g0NHfoumD/y0Ny+rILArZMCTIkR3mdSE/O9hJdQGxGcVM4EQXC4wT4KbBqjqP3eW5HtY/IiCeOF/WwhcQhQX2Bt3++4/45B4P+Y7ZCHWNEqyZBNzdIMPUnHXhnQaRHwsYYcgr9ygbIzZQ/oAwVzjx7G2eme81ezrRUqonrueoEskTKj6solEOaWKP2T+GHyxEpyQaPdFu8++SLDnRXi591Q8D3xmPcIyNmNMO7/+jyGbTMMH/u9PRXOwecciVaedDPoKkdb03yaF4CDmZIupu4p1b845bnAi4uTs5l6xWJFX+RAr0xug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DB9PR06MB8140.eurprd06.prod.outlook.com (2603:10a6:10:296::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 15:30:24 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 15:30:24 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH 5/5] opensc: Cosmetic fixes
Date: Wed, 21 Aug 2024 15:29:46 +0000
Message-ID: <20240821152946.650107-5-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240821152946.650107-1-niko.mauno@vaisala.com>
References: <20240821152946.650107-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF00011B55.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:8:0:19) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DB9PR06MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: cc02ed9b-c526-4f5b-aa96-08dcc1f62d35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8FmJd1Cy90HlLUIjCp1wZFmhbqH8uZCXEsMr9XrlQQqRk0L66dpB8TMFKSmo?=
 =?us-ascii?Q?o1HxcYLT+lpckn7TwwrFHrKlc2YBUB4GgT++P58pLhisSXEJ2JAFkTxY2miX?=
 =?us-ascii?Q?j0IhUC9HpskdNNYrJ2IT7B9zj9UPPLPG5YKq2p4LSF2peHbd4n8AynNBUy3H?=
 =?us-ascii?Q?vhnEf+hMSDUROVhxWE7IJZXwA6yOvT9/RTP7gTPKmECKv3twiwTm26GKBEjB?=
 =?us-ascii?Q?JGrPBzxQza/PluQgkBB7wugJoJeFnbjmPQXI3VaVlFuJl7mpMJy/G16w8vuC?=
 =?us-ascii?Q?EEYruDDwDPGtc7siDFekNS1C+Zi1WatSwnP2mf7CIQgsZC30IJHLQx9ycNrZ?=
 =?us-ascii?Q?5Pc7N+RdhwMYl2XO+7EuwofbK+5dOdrP7RSmx8tsVFNswNIQ/Dw+4dw7GnFq?=
 =?us-ascii?Q?V9Rv45jP8rp4tCy6uhrBIoZiGT1OZJDaXSFhGIkgsOESXCQOf2XSsYdTf2Hj?=
 =?us-ascii?Q?ulw78rhaMy+Qxx3fV3ceN7mRi6o0m0cZDqEgpnsMOTFwsAAZPHCWZf1VqtRS?=
 =?us-ascii?Q?0HzVbr6n8+EUmBE5eHErk4V694IHiqvaOkc8Y48mEhmveObKKW3yUOs8fgQu?=
 =?us-ascii?Q?IWZmpOiJyTPU5Lo4+FmAYpjVBYqRsGjalDd+qPP+mhRebJ62RFRFQl37CGwN?=
 =?us-ascii?Q?JVmdWlCL87O7IA3Umt2nJ++HRhlXQB89WfusAFxM9h2evH33h7UgDZETEDC/?=
 =?us-ascii?Q?Gqm8rVxrLZbV29ZwQiWGLvIAbcC4NoafwwBoLi245CeoMZ34zPvupSBm8+AL?=
 =?us-ascii?Q?shldQ3L6hXQ/qJpkUWIQuJJmMF95Ji05Gtik0Q386FK6PGgb4l8rWA8yG1ch?=
 =?us-ascii?Q?gkeLOIeydgnHstv9vCHLh5YwSrKXGv6C+/qDjYaiiLZgLC+aTBEyXf9gUOvO?=
 =?us-ascii?Q?ZF0gdnskgSP7GjGBO38d8D/RsC5KpBNftXd7mp6gr5orFTuLXquxw/wqY+zH?=
 =?us-ascii?Q?qGM9w/hBZCjj2HzKCjv0Fj+DjubyIgLnlqg5MLX88JUcbS3m7AnjXWW4AftH?=
 =?us-ascii?Q?1m+Nd85mPxYw2GHkfGm4fkziW4btK2XWWg4ZaNL75up0eMggN+Nlv9qy8rNO?=
 =?us-ascii?Q?O3iIJle2L8p0TJ1RPHzAoCOfLnbJUB3RyyPnQcuczESPN0HypcqBie+ExBe8?=
 =?us-ascii?Q?iYzAJ7xvkGbow07CH8Hl/iuP+3SMksUhP3HtanmsAUHyUeUVZVcS33LdbMW+?=
 =?us-ascii?Q?JO0gX8muVPZYAv94VWDphQkW1FS0qnUdQvzXYfg134aNnpMHK7GG+GJyKmTH?=
 =?us-ascii?Q?1FnSm+0SN/h/mf/zSpss7UloPsGHqi9cNNyCHINBegiC4F29dkPxGrA0u0gL?=
 =?us-ascii?Q?t3EYlVsovPEwNEU6w6LM1qd1fIuyeoCqGeHNFX/UISMQPu4Z76G1buo0mM8I?=
 =?us-ascii?Q?dMhvXFo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hq5zZMIoOm7tV45z853vIMYbQIhin/uwg0DQDTfOgVT9k4dMzZU/Yf35V47w?=
 =?us-ascii?Q?4xVCQgsvCQxQJkFarugE4fCHNNvpwWxO9lcgyITUny+XQa8xU0Ig59NCprsP?=
 =?us-ascii?Q?S/uMMqxlMerBWnwKJD7i2SF1b3GJLEt8hyT4cldYgjOqE1nYgV4STn+ybJpT?=
 =?us-ascii?Q?ZckfoaFyxjQWfpYHahrg1TwJzkIJO3AEQRWpDk4URrJlqkwMvTIclh0bh0f2?=
 =?us-ascii?Q?mXrMkU52p6bcTd7dZcC5sKEZ+RL9eB10wVIowOhGp5+kjLPazUSqHYf25jUd?=
 =?us-ascii?Q?3xR580aIpaglw4WIG1VyGwSdyzHVuzYtt9Bb5EfI78744tYLsScTe2tl6blJ?=
 =?us-ascii?Q?ZRaHzZVQtIjx6yyr+3w5hmyMWtjaCtusw09BmpOL2SOxzFOnG8e/XUDy6mAO?=
 =?us-ascii?Q?guFiXCHFl6E6j55whnGJhdvZiF1bJg0AojDYtnqjZWEJwzJ8bn0Z2JZ7VRuu?=
 =?us-ascii?Q?FP1h/4+NCVTQuXm8VG31WgASHIDKzTu/1ZVIyADF9T/eSaznrtFiz4URpAst?=
 =?us-ascii?Q?aOk7kwTIkaBy9PKCcewY6e0nfeF/zoqFEIHjzIIlAJASFaTIesRgkxuHnfOy?=
 =?us-ascii?Q?m/cUwZhaUIYESTteyWXNfGy1WAqP0Kkb60+IAiQHqSkT4YOqvVvaHlaOy7T5?=
 =?us-ascii?Q?UYXkyD7Bt4H4lx38vfyq9VqndRSza6ZnXbw5HBONKcqhGRZu08uWCgNyqycP?=
 =?us-ascii?Q?198cgaWghk6eBNeaAUjqsnitgJqzg3RlawUVnU6RHUc9ha6CamJ3k3Tgothg?=
 =?us-ascii?Q?SVYH+mp+xU7FP+5/pj1ZQR+CB9vFFeia6JZmKmEMiGMiD2sVQCxab2MXBP/F?=
 =?us-ascii?Q?J20Vx0C2a85KSsNn9AhAuKhMTppfoS9jE6WJonr17gj+yyKTMvWWl3hWBV4Y?=
 =?us-ascii?Q?pTqVj277DwmN68k0bmFWHVk5EM4X4OAp/wWfTMz8zovpGbwwaMXCuChia4Ay?=
 =?us-ascii?Q?OXfaoT0ztcWe64jVon6I+hYjkHHXHv/rQhFBvLu/EBB2wgUik41NSn113zyp?=
 =?us-ascii?Q?Z5k2EEKfGiw8JV6X79EbOG6zhx9Ca+ltb3yWZapf7tepZXe5ItY+W2xT460n?=
 =?us-ascii?Q?AAK0/IFA5qeAhKOY/wmk9FgaOUTmNySefcuJ6I3fLNE9qPwi/cwCLLjd1uwM?=
 =?us-ascii?Q?yrrDtOTzPXrjG9oqE9tRd+hyAyEUTsm5Lic0Ld7x4lN8hY39EYemPyZFNlX5?=
 =?us-ascii?Q?N6bLNv64wO1ktSES8tR7ypVWscPYEIjdEunVNPeAMn2T3TaHi3QGz7Mlo9o2?=
 =?us-ascii?Q?KLc+OU1E943n1V+X1Lx96BFhI/DIp2KRv5tJFEbJCmTOwOdGoQgqgnGupCXv?=
 =?us-ascii?Q?pZOq7b2PY2hcyp5IK+/HsJvYxGeOw7JDI4lgAXwC3Rap9VVOu0BbiFIeNejI?=
 =?us-ascii?Q?QcNF3AIZhDLMuztgGHT7FaBeWFtpqn4B9sPGW/N2YXnAiIIJHVV51ulErnPZ?=
 =?us-ascii?Q?ZVpjdTQBOYD93bq/oUk65uk01/5vKArSOoVCyZkTP5/8pyezImPDQ/0X1AGs?=
 =?us-ascii?Q?VjZTT66HXVdIPez5+F/jCnIn49IRxLc3pd3iQuiz+Wzts7rOJqKZKHhdsCRf?=
 =?us-ascii?Q?Zdfrf7rf05JmywfW4HW0M4+ZlU7tg7X1Zwv30Iwun4rR0sFf+as5OkdLMace?=
 =?us-ascii?Q?Tg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc02ed9b-c526-4f5b-aa96-08dcc1f62d35
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 15:30:24.5018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XpXDQR+vY6qx8vQzZO0hZGFQzNKpoNNX7TiAIqqXrr8sic94FN+Y1AH+i1fJX3Mm/4wheoAqvbj4cmX8GhRI6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB8140
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Aug 2024 15:30:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111889

Apply some suggestions from oe-stylize.py and sort configure options
alphabetically, and remove stale version comment line which has not
been updated for some time.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-support/opensc/opensc_0.25.1.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb b/meta-oe/reci=
pes-support/opensc/opensc_0.25.1.bb
index 1a31cdbda..636bfa036 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
@@ -5,24 +5,23 @@ functionality (e.g. SELECT FILE, READ BINARY) should work=
 on any ISO\
 keys on the smart card is possible with PKCS\
 such as the FINEID (Finnish Electronic IDentity) card. Swedish Posten\
 eID cards have also been confirmed to work."
-
 HOMEPAGE =3D "https://github.com/OpenSC/OpenSC/wiki"
 SECTION =3D "System Environment/Libraries"
 LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcb8aedd3bced19bd8026d96a8b6876d=
7"
+DEPENDS =3D "openssl"
=20
-#v0.21.0
 SRCREV =3D "0a4b772d6fdab9bfaaa3123775a48a7cb6c5e7c6"
 SRC_URI =3D "git://github.com/OpenSC/OpenSC;branch=3Dstable-0.25;protocol=
=3Dhttps"
-DEPENDS =3D "openssl"
=20
 S =3D "${WORKDIR}/git"
+
 inherit autotools pkgconfig bash-completion
=20
 EXTRA_OECONF =3D " \
-    --disable-static \
     --disable-ctapi \
     --disable-doc \
+    --disable-static \
     --disable-strict \
 "
 EXTRA_OEMAKE =3D "DESTDIR=3D${D}"
--=20
2.39.2


