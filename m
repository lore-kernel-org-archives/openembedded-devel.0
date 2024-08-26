Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81530C5472F
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 09:41:10 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.132])
 by mx.groups.io with SMTP id smtpd.web11.48815.1724665267299741598
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Aug 2024 02:41:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=pHkLRBSD;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.132, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BRJVg1+FtSFdC2ygyWoyVx5Mei2V3pA4EEIWsu8zyX3p/RT0Nqu2Q46awJBjlW9ITAE58cKPoMxeDotueAeuSolYS+Mq1NA0c/iYSkjjFsi/75AJmeiEIuKNJ3ySereCn4OXoAwvAbJuSG/KtVwl3ahVyCNKji5d3GaF8AYPLq6GriVA585wzEvzKJHVu91amXxnBwjv3JKv5jvzVeG8ZRCwT+bqtgj/9DkJtaqDxOeyY2XRcdpYP3G2uHP/P+I30Zort7E6xYQMQrioEWV80EzJdtuEsvnecoVLucp6tpBEUG0kydbj5Zdb+JlG1//NK1NyaFV+pkZ4vzNCFGIFTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3WayehEPVyTyGVNQWGweX6W+Q3H6s+cZxNDPh0C4Z8=;
 b=ghv30X4ELlq+KMKayCRtFwsADkrh44jabBH4RQ83k3vioM2f66mkQ6jPRxaj68j0cVxI9RcbngoLCLGxIEB1DzVQ4DaWLSTnBmYT2nGZUXb7AYhsqCS2el/Hgcq7tCIsxbVc6KZ4Edb4qogcvt4NvStC4CqF8I6TJSRGDk/7+R/DNN+oxOmEkJr6pEn84SHrakCA/on7Evex8NYblwy+CjzxPdjPiOi7kLkcoNu38of7T8VQtsuBtFv92MWtzztNWbU3pAV2K0S7fR5P9VcXOKT/ONBbP0thyWJVZyp+WFrjlPyd0V2cZdkrlkgxXbhw/g6nsspUsBuzBwVRAHnHrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3WayehEPVyTyGVNQWGweX6W+Q3H6s+cZxNDPh0C4Z8=;
 b=pHkLRBSDdR1ff1/q2bG+fyno2PBikwjsqzaKi7nYQVTo4iPufzB6nKPqrrxWb0/ZYHbSOUMGWJIvsZ7vxNDUjFUheYf0cjkM4HO7ECg5UOV2Eb0k5OrUbAxK/mru9o6koSsenjWvcaEECexhTFxj+M7ZwgIwpG1cihwkMaxfD6C6asxPrFxRnONftnJqq0HM1rjO1cQ9INjlWoITSkYxLr7GbMbn8peRW8254XSNyyRHFIQ24eTEtl8rzcE7TNU/vHS/gtI3Yi2x3CldaTmP313s69DEuoIJoNDVw3a6b6M0mpuqIzp87K4UOwmL1EtYpBHWFjywjBMjk4XqtE8Gww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PA1PR06MB9577.eurprd06.prod.outlook.com (2603:10a6:102:44e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 26 Aug
 2024 09:41:03 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 09:41:03 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-python][PATCH 12/21] python3-platformdirs: Fix LICENSE
Date: Mon, 26 Aug 2024 09:40:12 +0000
Message-ID: <20240826094021.2744296-12-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240826094021.2744296-1-niko.mauno@vaisala.com>
References: <20240826094021.2744296-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF00003668.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::384) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PA1PR06MB9577:EE_
X-MS-Office365-Filtering-Correlation-Id: cd4dba65-0bcc-47de-b3e9-08dcc5b3304b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZbJgpjiUESIFxxm2D/JQKpSQGay77NBHC/he2/kZ5TfdGdQf+9Y6+WEJAu3Y?=
 =?us-ascii?Q?Jw3GsbUimZTGveodULf5eunnqlW1axLIiV0yjLUSsDMG52GxiHG3BnI4sK7C?=
 =?us-ascii?Q?99IDwB6tbohBfml11z/z0c37kbyZRJHAdhlssZ6YrYRwqyjm/A+CE5WJPqHY?=
 =?us-ascii?Q?bfxjhWaUzRQpoVu/YU4FAnMN94xWcHr68F8UCbezAdOPAOkj1moIv25NlrZR?=
 =?us-ascii?Q?AJAaI/iG1bwiQiYokPNaPGX134FEyfZZnij73CuXXhyky1ltlRXwpKXMdtEm?=
 =?us-ascii?Q?VqfNGAqwiCjklkxrqP1i1/OLJepI5vbF0RepoZ+QaG0kr70WuIUxRxZ4fSe0?=
 =?us-ascii?Q?MK3M6Lugl5uAhH0JF+96kBK99HA68/ZDLI6TIq49lRCVPxj1B7khYRnaVCGK?=
 =?us-ascii?Q?xs6fbc1XW8auJRCAWI//SvqMYcL4KHhhP04I/3NSMgpjOYnatUbYGgY+/WRT?=
 =?us-ascii?Q?T9M9QXCoqY1PZJph+vHWvqMA6q6v5doCHT+3X3TVfdzhePl8ASFY+6Xbxg8Y?=
 =?us-ascii?Q?YwjsoEzGXiD1nhQCe42xgTD4Av8GnBteb/t+jABa3uWSZr8dwcuGHfJAFQkx?=
 =?us-ascii?Q?A1bmFBYcx5QnBGLksZMdLDyrHLfaWutp4CucunlzUiFowp5Yqh/JVcIR2zMX?=
 =?us-ascii?Q?9cw95ZaTwy6aPI1PcXdnIskF9lm9sC+y4GHwtSdcQM7wgDHcwC4Z868h2vt4?=
 =?us-ascii?Q?Lzr8pC2M9nAeCX2DO8uuMjTBinq7JZuyrNM4KjM8T4RJHg4Jtmh7Md1h53Vv?=
 =?us-ascii?Q?tX4p0W80FTigwTlsBAb8e4VhIHP1Ca1sjf9j5e7txDtiWaqy1Y1bWhpcSKsm?=
 =?us-ascii?Q?8NIuUvkk4tnCzjNDCC1+Z+kBs0JIapRECZJQlfp8Mz9SCHCwKoM3Fgh2gXUd?=
 =?us-ascii?Q?hYb7G+x7kC9Viml1oFTk2SeYVutEBTK4VWWjFuOycha8ukaJWlmpx7iycaRf?=
 =?us-ascii?Q?lzFvkK17IptNj9VUYdwSUjea8wGVr9hctoBI7pk5H1685XWx+niwOI2vOoL+?=
 =?us-ascii?Q?E4ZSlYj7PzI8qVUf4pi9OExWyhRSkaYpVD7g4Xu2VpKBgQyZgvC1DJuDqMSs?=
 =?us-ascii?Q?Yd85kaXZ0an+3Li9lM15MiJ/Dl5oJAjZFF67C0go7Mh4mIpL54+5/oPcKKIz?=
 =?us-ascii?Q?cbXzFhCTo/HN5/2KnhVTSZ8H25TeuodWvdDSX6vS8P+d+X3i+V9MFcSEaF7r?=
 =?us-ascii?Q?jgQvW9kPNP+HyF2tX1I8IXquzYH1UNDz+zl8st2fdyler/w7/bz9Q1ZQAqFn?=
 =?us-ascii?Q?ARxynGHSmpY6w+ImgyJ5KsY5HZ/KU7RDJGwdtDKIbm1hplf+iLfJvc83Lbyh?=
 =?us-ascii?Q?WZUN9qEgasHlR/FRrgazFgdPAHe/D8nWauYLNy8Ii1mqYV3Qg5pGz0j5c9sX?=
 =?us-ascii?Q?XMvGQfY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Nz6c2A1GVnaMNF1GSIXJfCPiBsm/vaRfI8Bc/wmxKqE3VrJyc+/l0StCg7fu?=
 =?us-ascii?Q?9N6T+2liDcxB54a8HSBeoHTXvA68+/v4uBPJDO/5upuprVjtyWe1oKwfiT8T?=
 =?us-ascii?Q?DvIkghUwbGR9gA1PEufZGTcGfpzikfxYv6BKrYzw+63nfTtuGFUATNdV/rIe?=
 =?us-ascii?Q?zZVbSzG7EWWp4L5ZsxwGxYAE31KgavL1/beb6TyusMTMSeKhBME50FbLFYcW?=
 =?us-ascii?Q?3oyoHK8YVqmASEkIN4zox7dd35Mry1hcyRftVhuiR68eWWF6hZ+EqGueYfDH?=
 =?us-ascii?Q?aPYJRI7/q1rOkZgP4gBmESWPYPG/ntVe8cIS6Wz6+84xeozYUBrdcBlNE/tk?=
 =?us-ascii?Q?iD36opDOGrH90yhtKPTIQZ0PZgONNpxAIqpYSVM+ipx3qFdd5Byr5dPF+3e0?=
 =?us-ascii?Q?PJzJOv3j9sA8o963X7T4gJEhrZYESiYAraEqCtyYyo7nkWiRPEd49lAh6b7c?=
 =?us-ascii?Q?ZYGLyrQeA1Jb95HvjYgVplKXgxbRH9g7V7bVjKGmt7U//Yr1PoYQe1y1cF+X?=
 =?us-ascii?Q?l/V87GBd8bpfbvR/X7Cwflfzc4qGBWf3VRp6Aahy5td9Yar95OGdVIrmIPXM?=
 =?us-ascii?Q?g9isyv1Ocd0yaLIXicXl5mRhGKjJ0lE7/pL6uVS2YUXzU5aCqQjiSjIXZXfm?=
 =?us-ascii?Q?qQsoo4AQSMSuyWK2EV5pk0lg96rGgS5zCmsxfBdEWz6WlVrzNtFr34wr5JCL?=
 =?us-ascii?Q?uVB64yWXD72LTa9xsNhOUOAIX05LCAps4IzkfvDTx8qgLvwbpiinKhtm6tWd?=
 =?us-ascii?Q?BpDARMG1q303XIsw1Z1xEtyjjEreqDQEoJAIe22hLK5mEiV4kry2AFyA4Pju?=
 =?us-ascii?Q?fvIK11tNT1P3zEvWY9sH86LmT7Hn53Pqe3dBsm56o2npbf9FQZuwdla22ekX?=
 =?us-ascii?Q?rRKjL7VRWSSijjcAwbeR/fQ97kHnEOIEIkSppF0iDi3ORa4UzNIvxVDizDEY?=
 =?us-ascii?Q?eOztQNxHkewcspcmr7fLc8Cu7Aplc66oadLAQhY+KTdCerGF3VTOf30IpxtI?=
 =?us-ascii?Q?oefkVqJmBTpcFZwvkKSMaqsywtaEjOqsGWee2yWiXrRyOwb7jKc1bIwqHjrW?=
 =?us-ascii?Q?pxe777MCvaXK/ACbT/5xdDOU5iOaijMYiqcZvPMRIyMBS5pCS20wD54PZRri?=
 =?us-ascii?Q?mLHIkGOQSi3E29k0Hjm9nDP1sTAcs3KFvDQRFeFFp8AxsW3cLIVWj+DELeL8?=
 =?us-ascii?Q?d2arMzkRg/nTaW1IYyMV/d8QxWjSzucSRLQ5WvVx3k/FILXFlPVhL9B6+egO?=
 =?us-ascii?Q?6Idwad9H/CC4puKsA02Q90sUCGxizS/qg/kV8cX8xPjcZ4xk459h7Zw/qQrN?=
 =?us-ascii?Q?OKmxfylB40/ElT2DLPKWoDwFCEX8iW+ymLekslKXbS+JYc3k7HAl/N/538rS?=
 =?us-ascii?Q?DW6cufp6nV5scZWWMpGUdZiNlWEPL2y5I/D5XmiHYy1CUKCDo77pQ/Vb0RwG?=
 =?us-ascii?Q?8t55I08inp5RNjmFaXblNnNaSUY/NNKZPKjwwcE6PlZ8+tMNn4lo3/dsbgV/?=
 =?us-ascii?Q?SwqiZgHslRkQNxlWSXhA9wrYsjYNd0r9P5YmwLvPK8MhLq0QypFQg9wrO4UZ?=
 =?us-ascii?Q?/w9gN67j/ZjMdZ42DHHHp3pkK34qchMEP1MBDVIH1A7xrNrfyNybB39BPvJK?=
 =?us-ascii?Q?zQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd4dba65-0bcc-47de-b3e9-08dcc5b3304b
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 09:40:58.1169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ibwWuFXANQw0uZS2VSqnLq/eHltTFNl5/k3SReQWp/YRWqPJYDgt5EKERVyJGPi/GRK+r/wY2MM5oh8usYnwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9577
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 09:41:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111953

According to https://pypi.org/project/platformdirs/ and
https://github.com/platformdirs/platformdirs/blob/4.2.2/LICENSE
the project is subject to MIT license.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../recipes-devtools/python/python3-platformdirs_4.2.2.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_4.2.2=
.bb b/meta-python/recipes-devtools/python/python3-platformdirs_4.2.2.bb
index 5821aedd4..fed82c068 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_4.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_4.2.2.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "A small Python module for determining appropriate platform-sp=
ecific dirs"
 HOMEPAGE =3D "https://github.com/platformdirs/platformdirs"
-LICENSE =3D "BSD-3-Clause"
+LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dea4f5a41454746a9ed111e3d8723d17=
a"
=20
 SRC_URI +=3D " \
--=20
2.39.2


