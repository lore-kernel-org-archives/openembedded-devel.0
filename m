Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E06AC3DA7F
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 20:09:17 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.28])
 by mx.groups.io with SMTP id smtpd.web11.56152.1723493354001969211
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Aug 2024 13:09:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=KWFcGaFr;
 spf=pass (domain: axis.com, ip: 52.101.70.28, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jmZjpx8mN0YGYHOuFIpPrjmf2crorlBGeggFHwGU4EeGA0qhy7/YDlzcYgYpENcwwJsuJCMjnbYpFHuE3jxLPhBHoLl8moa/nIdDY+Ju1DvEglUUFY4Jb2gFyGelhsHplZcXWGkMXEs3zqgJVqU+WDx4g0qV3yaZpOdzxOa70YtN8kMApoU7flaSwmAbugihOW/JtdU/kFeCHnZPIrNuGsem65lDinK7Ks7b97LQ4qaMitLTarg0IRB+jL5bEGaILyuMWtbg8esGUWzfJbBOfh535o1tMguCvXFsyylPEH0Sbs5ziqgM+WN6U2jG40Q7Nlu4AV4gm33DFv5/r81hww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NvtSak64KKqLHh6iaq9RNqAGD7HZleCyUknz77uq37Q=;
 b=nzbcqZoJsOGZ24NnF1PjYM4ZULoMSDoL41GZaBYMZmXZf2uTxNzygmBhAJemy2C3ibUcyajR4fD0qW3TpyGDFzJlV+DkFwqeniZP02nvpAqSB8ra61bNE76x8cIzKZVpqTgU5XbfREJwBKyRgj6Jpml2zxQri5AqYy6amkTK7k9aqPcjjLuaIP4VojGrJWB1c8juSVHbGS+Dlr122JCmIS5VyFdviImQSAMZg5Pc7HkJgslX8CHUYfNrt4j0jnhlR/lM9IySIGnNLfl0/C2qi2I4ML8Iuo20zZtrSYzE85NzB2U7z5qmRVZBkILOL0hg9Uip/LWju8i7nHau+hrx6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NvtSak64KKqLHh6iaq9RNqAGD7HZleCyUknz77uq37Q=;
 b=KWFcGaFrwC8Rqx/Hmm1kKjO6b5hnExe33tD/bRIGa/7ySnQ0GYRjCDnrWfiAgypatZWB+bLSjHVuBEkU4KSbvgcsL7oCxbKCmmTaSAdYTg2gljkXggk6rIEM2P+rIHRr6Ztg9K3V5xxf56w6PzBX5LO5HRzoy7pQmS37tVLUaVw=
Received: from AS9PR04CA0152.eurprd04.prod.outlook.com (2603:10a6:20b:48a::26)
 by GV2PR02MB8845.eurprd02.prod.outlook.com (2603:10a6:150:bf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.19; Mon, 12 Aug
 2024 20:09:10 +0000
Received: from AM1PEPF000252DA.eurprd07.prod.outlook.com
 (2603:10a6:20b:48a:cafe::29) by AS9PR04CA0152.outlook.office365.com
 (2603:10a6:20b:48a::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22 via Frontend
 Transport; Mon, 12 Aug 2024 20:09:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM1PEPF000252DA.mail.protection.outlook.com (10.167.16.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 12 Aug 2024 20:09:08 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 Aug
 2024 22:09:08 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 12 Aug 2024 22:09:08 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id E777E31F
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 22:09:07 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 47CK97Kq3077956
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 22:09:07 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 47CK97ea3077955
	for openembedded-devel@lists.openembedded.org; Mon, 12 Aug 2024 22:09:07 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [scarthgap][meta-oe][PATCH 0/3] Backport of three patches from master
Date: Mon, 12 Aug 2024 22:08:51 +0200
Message-ID: <20240812200854.3077901-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DA:EE_|GV2PR02MB8845:EE_
X-MS-Office365-Filtering-Correlation-Id: c95d4564-4319-4d4c-6fa6-08dcbb0a9fbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/HuUL+N/TMXALj1dRBgDfRaGDsdFeJGnrfrWXJlPJ43VQoXfuTG2UjIxGDoD?=
 =?us-ascii?Q?gpTajb1fvoGm9iel0aO5zaXAAiT9QlQoifiTaQl0Vkxunb/XDdFSDtQUfhyP?=
 =?us-ascii?Q?RkOINwC+ow1/i5Xqg6EE3SE6A/Udh1NCXKU86R1lg5xzkHQPjEq1o1vidWQA?=
 =?us-ascii?Q?czb0AXaN8eKCF3H6S2OaHad8tXizI5MViV+LyoX5ZF+2Uv7vM55SEMlysHFk?=
 =?us-ascii?Q?7Y9uYlM9jwX0QEjakciGg0nLJCptK6QxzpPU7jINAL/vzoldzWMDBpW6cGzK?=
 =?us-ascii?Q?oN6cB1YrdjIoSnfD00iX+hnHyBb59CGJIAVlLZ3IRtJCJbUUwT0/1BArMxf4?=
 =?us-ascii?Q?taK7/wAq1IlM3Zu4CxslSLF2MUVtTiWUQekkcMTeG8sLeOF5Ls7p4L5rkH4D?=
 =?us-ascii?Q?NfLm1DQPxzSWlW+1ybawFK8KjXamEN3fpYP08YvrNl4grn2uKuYNxBpbh6Gk?=
 =?us-ascii?Q?TOlHN6UAwbOZ3VFLk0XJ30J61KfpYiLDmO+45S3SstkKONQ4FTWpEm3DvaZ+?=
 =?us-ascii?Q?lJ073ofkGwaXYda4z14MM+QW1BrkhvjGm5a39Ps4IW6wXV56DOFoSihGnYT3?=
 =?us-ascii?Q?PgN6U9jMZNCV1cCMzBrxWcBWzKuhXaxgtYuj4k6qSc0GGIV6zrlMZMJ3LOlJ?=
 =?us-ascii?Q?7m2TBzb1ANEIRW1OXHSu47LT8z5pQ+TlGm4VJljgZK8Uzm2NLvAEdFV4Kpzs?=
 =?us-ascii?Q?UWjVNnvSAfvXkQq/xbQCSxHbzH4+OQsmD0EA48fyOCbspzctuRjbhb76FArm?=
 =?us-ascii?Q?VmPULtkP/Ltl4FzWPK4xBRDQ+Vb6B1HCktpSkFMdTXzMgbsHZ0xdqRMb9x43?=
 =?us-ascii?Q?sTQqBgXkFaHLiqesBZwl9l7or0DYiP/rwaG466RkypjhsCOPY/2nSaK5pA19?=
 =?us-ascii?Q?3cRJfskAQV/iDFa7UFM8RACMDzRVOUnr50kSO0U0/CaBo5aeN1TzyAnNKvJg?=
 =?us-ascii?Q?seX8lb8qBR8G7cTZQ870KzRyKgSlY7I7xO7+5rZbLgzgioe/wDh7HIFESyLu?=
 =?us-ascii?Q?YUHHNes/E0iFDtSNL8Q1LTsmDCKhXGGSqWhBflnbrF9k8j93bHHqPwlOV8Vt?=
 =?us-ascii?Q?DnAUy+nVjk9BF5VuFvkqO1d3OFvnPompsWU6EA17imOkO0MMRVP2AwTza2rN?=
 =?us-ascii?Q?RWtguu53MAL5purxHUqeGw/HCAiJFp4OeQ2JJnQDWPZqBH0ejzdbzSJ9UCpz?=
 =?us-ascii?Q?aZ5Q1Ctr1lqytQPFxJKhDpAKM35L2O9HDnONbRXJS+3dKSHYHI6nPIg3+8Tu?=
 =?us-ascii?Q?3edLk/hBGO9WBo03UCclshFqGX9NwU2zdpDrJcAzYF8xxefvcI4brA+jeaOJ?=
 =?us-ascii?Q?N7ekbl04XeXhj2xyY/iNOlqGvztVvCr94PmVyfEjf7XE33DL1vTAzZAqN/4h?=
 =?us-ascii?Q?rAvusNMw/193+r17njXkI3oTfu1wgD+m8d1MAKni0WScJ1P0+WzAh2T+2HzH?=
 =?us-ascii?Q?hi12+JEJZ353tQXhrr0iy9QlQkGY8+yZ?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 20:09:08.3489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c95d4564-4319-4d4c-6fa6-08dcbb0a9fbf
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB8845
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 20:09:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111778


Peter Kjellerstedt (3):
  hostapd: Support running "devtool modify hostapd"
  hostapd: Only include the relevant parts from README in
    LIC_FILES_CHKSUM
  libjs-jquery-icheck: Correct LIC_FILES_CHKSUM

 .../recipes-connectivity/hostapd/hostapd_2.10.bb  | 15 ++++++---------
 .../libjs/libjs-jquery-icheck_1.0.3.bb            |  2 +-
 2 files changed, 7 insertions(+), 10 deletions(-)


