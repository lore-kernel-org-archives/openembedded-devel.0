Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 743B2C48286
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 08:28:24 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.117])
 by mx.groups.io with SMTP id smtpd.web11.17300.1707208093144428353
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 00:28:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=Ta0z5Zou;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.13.117, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PdZVoKx9W0FXOhlKsbl2xyPgKUW0qsfJAh8klp6XnqjdYcQ/U9LQRkz4eSJ76GySxXIScHtgMZyLP9C0PJbh05Aih8Xe7BlNBwCH1fOGXlM1Kzs9MuCigBSieFmxyO7P+tGbNZRJNTBLWnsrHzJRJfkM1h+bUBGOTij0h8LGW5/nqW5BjrG5feruidmjVSN73y36GtTOsh3OoJ/xkJS8FFmyZCiNy/9v9SwZXqiQ9FV5Ppu1j4N4Bwm0GEu80lhQ64pqXsJB1DyGVRSwlxGrvCGcgcVhvDSjHgsv+Pr1FnhIEmomQDcYRuxqtnLhzJIAFhACx0/1wgTlSw1XbPYOLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fm0U97kg0oGmu4v9Ib05U+TvpVJB9vetkYnACwXi5+k=;
 b=iE/C893iDWy0sgx7yxttH1brX6EyFyl5yZRxAGmEMkAm1DePIBiEdBKzAaILeQz4gPopPB4UVGxQnqkXN+H/sSe+HVT+9UOtGHoPQ4q5B39B6JymHYHBpv5ksFznGnwEkDLxnsblg9mKBDWHYu+bcuChXhPzDfbOi+iCiR5tGZ3ylhMDVbUW/NR488Yz2Ds4n5zwoLCWVO43DZwM93L1yqgZKsRF0zHCNSWAj45OC/umItoxM/Q5tYfVMlCSFgQsUISibJayeiZl8yOnQgec9QypSet/e5mNZ+8TmxFvxkGJaBOQekrPbckGIteasZSV9jfNT+xyAFscwTWNWAHRIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fm0U97kg0oGmu4v9Ib05U+TvpVJB9vetkYnACwXi5+k=;
 b=Ta0z5ZouCzjIXujVPrDmKId8D4eKpmAj5FNxSSxFAscL7RPWaGV+d2IdX0Yy2DFp/VyR7uWxlDJMdC2X81GEibpLgdsDHvZo1z4Gj8mxuvscjpfjnVEFbT+dxzxhnS24s+zrkqMRq1MFdBvze5BkJHVdfvSpiRl4CkEpmC1FK/JDj7mMb/xogSUmwxyfpFvIaiqBruTl7GbS0bgxUTPuQYEtOlf3KFg/W/ICbi8Nefw3n5d4Mr1NLAZyO30wVGgfiqQo8aGcHicTXTEJOUx2UOWnCam6FLn109/fr7hT3m0tbYCT1k8oa/UtaYMe2iiUmU3K9al0amNT0dBfarqvtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DB9PR06MB8630.eurprd06.prod.outlook.com (2603:10a6:10:4ef::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 08:28:09 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::b5ae:8355:acaf:29e0]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::b5ae:8355:acaf:29e0%4]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 08:28:09 +0000
From: niko.mauno@vaisala.com
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH] pkcs11-provider: Bump version to 0.3+git
Date: Tue,  6 Feb 2024 08:27:34 +0000
Message-ID: <20240206082734.1849305-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF0000FA77.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:4:0:4) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DB9PR06MB8630:EE_
X-MS-Office365-Filtering-Correlation-Id: e5685461-4c46-4572-cf80-08dc26ed8d0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jVXQ4rEQyNgrphYFfu+iDPAGOOjw0klx4KwBK+VNDYMgHG/M/Vv3O/2dc0LBMaLlaVzrsaXUr20isVpM+XBhhDq2A0QYFPsMT+8fV2YeBRAytmke6tOssGRH5EfSK/+a1JJDi1sH3T1iIV+LrtPADYk2XAm5aMUaiTFn9NNvQV7G2B8Pm+4FuqvWypHINoFVbHP577apv6F63teiXUis78aPY+1igpRj+xwJYyEOiM5cmR6XqYmd1Efu7TaFePvzFeExZoGKcp4Lb+pP8zEEYUs1tvJGHx9EqyZx/wzh2Fw7UhKQdENZBvsAIhZRKwnAM5lS14d5wOmN1ZZ1j2B6JLTZv2qOti25g0KiSjp/94ZZ2VYgXs0/f61jYuOvBukdqzWEH6ObYuslj6w1709vxXH6VD5Kg4aIfxHJHkb3ZUGD05QMmvkstISlB5jirshOSfhudBJrrES6pBo5g3KkX4ejTZVLs0o6O488O7f3hW2eGpFcVc7G7pwJXhxf7CMR4/9yIXwY2lnjbv9Gq0gmVWJgsJt+QwImhhbab3O6t1w8QvjaPmZMIfeqv09Ad/n4M4VxvUnrmRZZvWpF6GtwcQ2c1/MGrsOoiJ7/M8MDcYAYxcTdD1WuNn9Nz/ttf25R
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(396003)(366004)(346002)(136003)(230922051799003)(230273577357003)(1800799012)(451199024)(186009)(64100799003)(5660300002)(38350700005)(36756003)(41300700001)(2906002)(86362001)(8676002)(8936002)(4326008)(38100700002)(316002)(66556008)(66946007)(6916009)(66476007)(83380400001)(6486002)(478600001)(6506007)(6666004)(52116002)(1076003)(6512007)(2616005)(9686003)(107886003)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VROAboqDVUK1vysyE+j+A/gHmPX9cIbevdZa4F6+zxV9Avlhzrfq7vHv/zKw?=
 =?us-ascii?Q?9Ot/oAMos3p5t38eqeiebKegI6F+2jYPs6EOmY61RGaPNL2N+SmSQot7DJvz?=
 =?us-ascii?Q?pQtiF+qn1T+OfPhTbmZpfBD7ZIPemumgocUZRZf0O7qjV8jjNyLgHuikU5z+?=
 =?us-ascii?Q?57laXzldDwfFvTSOUXj1geUxe3K/FejxmfXcgv0mxkg6S0WEqp7CqndoOZx/?=
 =?us-ascii?Q?0f2m50307uqvO1Xs2x458SDAgsMdEYV/l0qllQNkUD7kBswYXYyktRPFI5Jd?=
 =?us-ascii?Q?pQ+KH69RoisxIM1aLaRo+EdbUbazC2oswdW6qxRmdeWcx8NQi/ZqUGWE2xy7?=
 =?us-ascii?Q?itP29I5MrGWpIleY1eFbatN/5vYzj8aMhKVlpMtGNt+550iBA9BfPexChYX2?=
 =?us-ascii?Q?HpmfKOPCt9USU01cu2KkH7+XrwLY2vBFj+YwQN2v3OwIuPXo+6cFuQYL35aS?=
 =?us-ascii?Q?IVgWcxhm9NkteTcRoHDecU1u6AVM0JJNw5FbXiRRawZgt78ZO4/m5vGR3Y0T?=
 =?us-ascii?Q?41lrMQPNYWiHEb9B7PEMgPmWB4Xj011vA9McOb5gGmBOgzBGhshRvwuQK5DH?=
 =?us-ascii?Q?j+CsM6hegvBup4ZdAk3GNxr8L3QET1o+nGHhLoT1HPmfPP3uPlL2DfpmnO13?=
 =?us-ascii?Q?EnlxSMeR2qhTi0wK7LiywTOmVgBi5IzHDs9wOyrcAiD5vor00UVJZpIQ1SwW?=
 =?us-ascii?Q?VDyPTw5IceAkl7DSkazSUZ7+hmgowdb3g66vHPm+07vAfZIn6BVRYo+i/1D1?=
 =?us-ascii?Q?KihQ1uWN4GJ9OZnL9SecudP1HZARYrOJolEsednmOY3o43cUJJJjOLkOMgIv?=
 =?us-ascii?Q?+DL0e8yvqNlAs7tS/9tDX49QaUXUnbXciZYSNH+LnVLWhML3+XF66FDjQMXD?=
 =?us-ascii?Q?T30yufFkgxwFTVUu8Vio5wpcuVYyOEvEYXDxfDYm9p68W9z5ihjamoekdjXk?=
 =?us-ascii?Q?HHQrbPHgw8utZGk91XaDlECM291eXcjLFmbZm1wcZOaBuWG+EzvVqK+rmpT7?=
 =?us-ascii?Q?0FUdC8dEvrntackp01lMOb8hapGpxUj+VdqWE4YDs7zR+oFA5HxJKKk2XiOD?=
 =?us-ascii?Q?OaIrFVhhWd7PYC5ALVcGNRiANYyfLhA7WDOLmIAMtWn0pv6ypqphTcSTNZc/?=
 =?us-ascii?Q?X7krlMTS45plwt3Q+hOuYQUabI9lqj7MupOTjwSdWO9SU7NpwC7fbJui8Dx0?=
 =?us-ascii?Q?juQoQyDT/bSAyh57b6HpsS4mynmY2uiT4+A2gaIdkfsQ+rNnuZh1sIIJCcHr?=
 =?us-ascii?Q?UKnO0gno+S/iIpU7D6KJHEMjQQw0l3MQF6WWr4fYAWhmKiO95+lsJiekplge?=
 =?us-ascii?Q?qPOtouOqAi2I16zrHFqFTlinvypcHLz5xypMYe7Y3W+sCUIk11yotISZXfvl?=
 =?us-ascii?Q?iyGVocEGwUQik/oyVhMt65e0VEnvNBrAclcKcVBOLsn5vgc8udQsTRlcjrcz?=
 =?us-ascii?Q?Xz9WyQbH8EfbrUIqpTkERzfZQ1FvGhf7y3apoEvDDUFfurlEkMe5wfX0TGXZ?=
 =?us-ascii?Q?o+D29kbjYgNJ8TZ8n8piWFDPHCZYIkNhqIpHeqiDfJJG2e0A1IOY+Z4D+Yn/?=
 =?us-ascii?Q?ApomAYF0jcrszpMbJf75+RmDE6hybqBEyq2cNlGGLktFUyyfzYiG0KfbOHhe?=
 =?us-ascii?Q?zg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5685461-4c46-4572-cf80-08dc26ed8d0c
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 08:28:09.6838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qB4He4y0B2CuHOP7ycGTyQZnQUMbudEIW21f88Mtij+tNMgjJBwGmagCmU+1KehY9+dYvJ4G3dtn5k6Y1ol0pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB8630
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 08:28:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108609

From: Niko Mauno <niko.mauno@vaisala.com>

Adds following new commits since previous git hash:
8cd8062 Actually fix typo in README
b9e8026 Remove obsolete pointer to docs in the wiki
58040b4 Release version 0.3
9ced563 workaround false positive warning in shellcheck
71e4949 tests: Check csr for keys in token with openssl
c9fb942 Do not load profiles for 2.40
cd89838 Fix RSA key generation and test size
01ebd73 Add --with-openssl info to BUILD.md

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../recipes-support/pkcs11-provider/pkcs11-provider_git.bb    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_git.bb=
 b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_git.bb
index 19412a517..507e1943d 100644
--- a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_git.bb
+++ b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_git.bb
@@ -16,8 +16,8 @@ DEPENDS =3D "\
     p11-kit \
 "
=20
-SRCREV =3D "e2abc4a7ae33159f2fb21b9d87a05ea9e79ef584"
-PV =3D "0.2+git"
+SRCREV =3D "8cd80623a69885b395506298af9d51639251e41f"
+PV =3D "0.3+git"
=20
 SRC_URI =3D "git://github.com/latchset/${BPN}.git;branch=3Dmain;protocol=
=3Dhttps"
=20
--=20
2.39.2


