Return-Path: <potin.lai@quantatw.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F17CC433EF
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 02:17:06 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (APC01-PSA-obe.outbound.protection.outlook.com [40.107.255.110])
 by mx.groups.io with SMTP id smtpd.web08.2372.1648693024501356116
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Mar 2022 19:17:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quantacorp.onmicrosoft.com
 header.s=selector2-quantacorp-onmicrosoft-com header.b=duSPVRZ/;
 spf=pass (domain: quantatw.com, ip: 40.107.255.110,
 mailfrom: potin.lai@quantatw.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJDzubDdNq5MmVEatyEVBaXF0K6Uxl9DSH5P+EOgGBBkWW/isAXXG2z+9lhMZz/qjGMk8ZM4/VX83Qnkv9XFn2tn6c4yGv1LRbkyVG0zJ1Yld0oTfADoMXV26WwTWNTag9Fum5J9RtGzJ5VsEoZP5lB4ZywW2jzOcP6Yi2MC9CiYp51e7KOWJjhGXayJxoe7YCL9r0I/KkotYDOdbF7ckPMlgbjNQMtfK74e8pWkZSh+1lRLLSD+Ow0CGj3mPoNzRnhMSac1OCEFUhgyIllbiTAa1Nmv20US8KkPWGjAl/Aiwz84P8fBUXypaYipNTC8JdOdP7nk/p7AJTfGKMyaOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TXNHiYO2I3fvokhPnZzTD+70+kv/J7RXirg8NgnvII4=;
 b=TslYdxU09EzLnPsYQyyFJYHYCahpH73Ntcj1blQ2t3n0ksg/vHWnbtR1ubj51JvMjpp71CMwNkeHGhK2xR0RLwtkv/JwTayoMNqTdpIQDH31IENaQ0RKzLTTZvczirgwoya+0qDXv50co3PmMXfSELUqeqWulz+eLJKe0ctvpXXtKZhhaGBuZuk4CsrNXyceteUD5Tc+zMGxcB7dqmEyZmktk5Rwc/oOsG4Dfjt5iuDCKKuzVD5zPyQeyiF23+GXNec30i6t/1HjqPCFfUHhh7g0IrI0twK1RAZD7E+Quihn2qLnDomIMXPSWRxX/Ay6XqIHvhvE1r/uvTLaRWxZjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TXNHiYO2I3fvokhPnZzTD+70+kv/J7RXirg8NgnvII4=;
 b=duSPVRZ/koDuQXMMdnj49KHKAcvg/1+P7wxPil159l1BwJFt657U7fEwYOP1Gx5DbOVOmdBtMXEl0mu+EhQXSbAMuk+ndquyb4DNBdoUWdvSdcAUCg8DPZJJdDqldE34rQdu5RWdbYnpTrtOc9AN2bXL0owzI0gwAoIdakvAEN4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by PS2PR04MB2694.apcprd04.prod.outlook.com (2603:1096:300:46::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.20; Thu, 31 Mar
 2022 02:17:00 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::7cfe:c9ba:7793:f42]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::7cfe:c9ba:7793:f42%7]) with mapi id 15.20.5102.023; Thu, 31 Mar 2022
 02:17:00 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: patrick@stwcx.xyz,
	Potin Lai <potin.lai@quantatw.com>
Subject: [meta-oe][PATCH v2 0/4] add idevicerestore support
Date: Thu, 31 Mar 2022 10:16:44 +0800
Message-Id: <20220331021648.16582-1-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0150.apcprd02.prod.outlook.com
 (2603:1096:202:16::34) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf2e72b2-58a0-4ef8-4f4d-08da12bc89da
X-MS-TrafficTypeDiagnostic: PS2PR04MB2694:EE_
X-Microsoft-Antispam-PRVS: 
	<PS2PR04MB2694D47721475165278E55A08EE19@PS2PR04MB2694.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z5H7UTNrOcy31nkiF/tJUuARRYXW939TMGJJx5BcGnGk++hNGCrJtc/5yEALx8MBgeSTqPQFd1+9YmNKlvHxnjq021GHcV56qosfkqcQW4EN2W/lI5BAV9F4n7TP0NZz4jxgXk5Tq1lbx1IM6GHPTZDQvxoa6WmlpjreE8Cd0Nyb3vLmH+irz7qKKL9vw7IWGkxXthlSWcpUKMuAWpG1u2m3zzgo7+LRhSfe3E+xL6s+HJ0ZUAr+SIr9EypYHcyzuekgUogMy8dfET0lf/7nYFDYhbM3ZKjjxruaTCszbOA73HuS1D63R7v/vdnKWz3aiKF1LqT9/jHVKklzamVdnvpq/aDsKa7E4AlYVc0W7/L1PrpfnMgtElGWLYyUy00BoES8CKvKBy72J/NEfZV63KpZyZqEE7dHngOGrbsw94+vFTzOjw1HbPj9nImonAUHAnw3nO8xPyCkp98EQm9pcB1vLAGflANJKwJbRVcaGU/D4T4ovPxubuvXQ+KrRcv8ITO/SWtjkkVNxZLFflins5rimdgyo9nUlV0Rx/XF4gZkcIsl/bjhw4KwZ4/JianjBKOQojxZCAERDeoFIoGjyVOQvp9I5frKzrX7BikJLzYDvwX5SsR4BFHzq1GHu40tb7WIF8gDpnonUQ8k1GH6SdFwLEjUkvEf+H2I/Cpuh2BkkOsvDUoOHVUzDNqxIMBuCQWTo1kVP8i37+u0d4VfkwcufxlERqG2pBeAjNc83JOCcfvTMu5wLqBhK3KdTVUa70GRGweMDQpaLf8aeWQGatuFa06f3cY9t8DtE00CZA8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR04MB3282.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(1076003)(2616005)(6506007)(6512007)(26005)(6666004)(966005)(5660300002)(186003)(107886003)(38350700002)(38100700002)(8936002)(86362001)(6486002)(508600001)(44832011)(66476007)(316002)(66556008)(36756003)(66946007)(83380400001)(2906002)(52116002)(8676002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fa8bV8tdupqzNjyAdJNnpfNxP5JNniWCpMpGXA3HaQffDgfgzlPwzVGqErrV?=
 =?us-ascii?Q?sYBMTqyDD7jZzTQq/pV7lNRlmrhkPkipvIRocsxSKKEjpIVgmcVQqE7GFFyT?=
 =?us-ascii?Q?h/4KGTOP0lKuw2SUbja+69vKYBOfeHxdzyBrQCHACK+eeuqNZ1zMXcvSfGFL?=
 =?us-ascii?Q?ZhvPSWfZyZklbj8xXGQ87BP6ml8h4j2y9D7YtILSSlgUx/aTVAXkxtPhKxsP?=
 =?us-ascii?Q?PSreQpqPoH3wne5ogbJIlA7cwU2Hg7AV+3NWAJ36UlKODjkz2Dny1N73P3E/?=
 =?us-ascii?Q?3iJwS7NEirDMp8WWrOnNgUKxBGREiJjHljM+nmdtjdg6+9lLyuFvTnNqTanb?=
 =?us-ascii?Q?C20tVroAonzV0QQ3FTOgGwEyOdT8kWiJotzBVE9h3iOBZeo/RkZNO4MWtO2c?=
 =?us-ascii?Q?Rr+tEY9zCcrv0Bi+vjnCZUAeNQmOTu80WWTN0e0WOfj/Iw1Q+xkuh0d8/8HW?=
 =?us-ascii?Q?uilYi2gq+3NksE8yQAKIROy1vFLtl5IX7vDJnxi4QAoVVMITTsTyjO6eGuAm?=
 =?us-ascii?Q?o/zOdJAKtg/6UlDz4FkVQzMlMfpIwbwd5z0/Qobt0qIkx5nXwEsodgaNGqqx?=
 =?us-ascii?Q?u1aJmXOTerhaTipAraqpjHvzDxvYDe9k5cGX9izk/6NME28SpmV4J1WbyiCe?=
 =?us-ascii?Q?GqZ+cBqp7xTS7IpXSCYrnNLKk94mMbL58zVL05neH6QpvHqtGukBpjSS6/I6?=
 =?us-ascii?Q?newjL59TutYc/acF9X+yOqy8i17SzRzcRkRFKGANiXqC71dfBMgxIN4pdVGT?=
 =?us-ascii?Q?eGVoR9SuU58u9nd9keAExvFCWIjRHksNkVa9VlSxVPrCke+z05ie/qGT/ey6?=
 =?us-ascii?Q?VedN01zRl8hfwK5zi5m+b8UvYHwt3ltOO2i5aXYkkIhjmQjdDKDMKsaHVPut?=
 =?us-ascii?Q?f9vt/oW1ja4HZsYGi/FUt51URB4o1Q38e5BXcAI3jdahv5Cr7LQJ1ShS1ujy?=
 =?us-ascii?Q?rLoHPbIsORDU/YkjK/cZNcPw/LmFJQB1D8fmPUQAD6lyBu0cr5cMCqwuga1Y?=
 =?us-ascii?Q?nXR2rTQ/TQfLfPitp1b+ngIh0OMpb3LHnKb39GDbRDsXXRgXkWI9I9obygre?=
 =?us-ascii?Q?H1Cdvz67HXOqEw2A7kOvgqMaHjJYW1C3edI+xDV2rSwfcnpyRa2Ez5onyCeT?=
 =?us-ascii?Q?gM9RqccPZuVbnJft7J5+mIGvbytFPRzjPygD3L2s1MISlnVU0HFw09yuxlL7?=
 =?us-ascii?Q?3dzeF9hmcy9pktzkQkm+pLT69QCqs8PfKmEROuIrJFQbhQQ4uilpxhqOeatZ?=
 =?us-ascii?Q?UFFmA9FN4p8u0roUjkgumKn5DRYsdaChTy9/0VWYXD79fe4DTaQVXpCqkBzK?=
 =?us-ascii?Q?Z9wKLXXH8QoqlFyzjcirdUaQr45uLGuHavi8NxtYUgFZ6axevDAtZrEXPNJl?=
 =?us-ascii?Q?TVgMo+mzW6aI0tROu5aa8tZkZj0rCuKWPDp7NSDh7pMBtrx4p0nLMc/5VgOG?=
 =?us-ascii?Q?NqVUxAmZTHC2HKSlK3BXtzDOzGFniljx2C3hUQN1tNarLGpm6o1d3LNUpbbD?=
 =?us-ascii?Q?O1l7oV3KEOPvu3y7ADHZmWCrV+vwjK3sKMkzLPwd3NbmbSYsRVHICsGDN5aT?=
 =?us-ascii?Q?NhNRRXUamFquZ16LLpxVy9rMbVKxpEGAj2pNMC1zE9FElsQThFJ7/+tI0zDy?=
 =?us-ascii?Q?HI2tjmUUlGTtffY+akdlF8PhPnv8kzIQCSysLL0Sj2eHUBAaGbsPptOPXQ8k?=
 =?us-ascii?Q?+6eu8dXc4kFIahmHPmgk0JMECVEpa69t3dfHeww8yLQA78Fn0Xp627DtIP88?=
 =?us-ascii?Q?4+aZOdJ9hTL06gMRhGgjcDf0xaj9Xls=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bf2e72b2-58a0-4ef8-4f4d-08da12bc89da
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 02:17:00.4471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 SK1ixBV6M0pkO/182UmiDSzOcSAHadO+bos5J79wkfXySkHQjrH2NC5/DkXKNQw7INaEmnwo1nZP/jP+U+3prA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR04MB2694
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Mar 2022 02:17:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96275

This patch series adds idevicerestore package and dependent libraries.

LINK: [v1] https://lore.kernel.org/all/20220329024856.27349-1-potin.lai@quantatw.com/

Changes v1 --> v2:
- add patch for libimobiledevice-glue to fix undefined bswap error

Potin Lai (4):
  libimobiledevice-glue: add recipe
  libimobiledevice-glue: fix undefined bswap error
  libirecovery: add recipe
  idevicerestore: add recipe

 ...wap32-and-bswap64-errors-for-MIPS-ma.patch | 32 +++++++++++++++++++
 .../libimobiledevice-glue_git.bb              | 18 +++++++++++
 .../libirecovery/libirecovery_git.bb          | 15 +++++++++
 .../idevicerestore/idevicerestore_git.bb      | 15 +++++++++
 4 files changed, 80 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libimobiledevice-glue/files/0001-fix-undefined-bswap32-and-bswap64-errors-for-MIPS-ma.patch
 create mode 100644 meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb
 create mode 100644 meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb
 create mode 100644 meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb

-- 
2.17.1


