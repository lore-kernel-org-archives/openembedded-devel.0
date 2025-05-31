Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA5AC5B555
	for <webhook@archiver.kernel.org>; Sat, 31 May 2025 11:33:05 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.64])
 by mx.groups.io with SMTP id smtpd.web11.4002.1748691177680213813
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 May 2025 04:32:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=nzjRUgEP;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.159.64, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qKEBGolMeUT9WBE+GTmZZ2IpyB+//zdArGKOOeROIRvg6unSr8Hg2WeSTLVjs39H4BQlBvXHQs5w0vyOikQwnwThMMc5M01KA4XwE0ag1yLdR4HdRNeIG431VffAg+mnbJTUVun47go6PexVARABVEGNpCr9RJmlyIzEMjjUqstrfliYPRcHQf+arjQXZOZhY64KfTNYtl71CCwZrCCrJezRBm57Z2td8BFvsP4joKik2FsqTO2P+ive/pB9kxGDMQyLiM5ni3ZPlT0SUp424wl9vH0lMy4ktXSV5GZ3sS5n8FZ52Kpx3tEi0NYuwV8U24DWCGBFCC9CdnsmV8ib3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLU5H9OruAyr3181Xqpl3zLe06MhJwBb10rZBjOXxLA=;
 b=x1+HjNAdHlnf0JCAd7vVaByCcaN07FZesC4CWju73eMqy8s0soLLHcHK5xg6esGJ8vfEu2/xm2KAHQoLKO26nQCuXis9w71P9TbpAicgz6FrHTWF8+DNywvwv74Ql9L4USKr5GJC5F2d2gNx+6kx0Q79mjC39lYQAl4Uuo4MU7iUNCt3D7pG8fXPREc+neCFfz2iDrX0sm/GuvXWQtf2Y/nGWgnKm/MNhPTkHjgUB7dZiD0QQZeO3AWITrS7+63fbSyeIYOmk3EIiPMEH14ehyO926L142pd6W20lDGkywbZ/tQ9a5gYvH9iktykSnNrTFLJs+6CmvNfJUfyoE9kCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLU5H9OruAyr3181Xqpl3zLe06MhJwBb10rZBjOXxLA=;
 b=nzjRUgEPLYvmvZ+EY+GoHbV/JtnQ01j2e454fB5fZgRo+rNDnp54i1NcYH/nZgCoRpG/OYcLOWgRlyjK7XXBjI/Uf3R4DB/AjPlWpRnTCs1jwcW1HCa58ZTEF5fAlhBMcK6Bz8lxrs/Ghn3X1TObIiPjIjWaLICuHh0h2PTYR5I=
Received: from PR2PR09CA0001.eurprd09.prod.outlook.com (2603:10a6:101:16::13)
 by PAWPR06MB9950.eurprd06.prod.outlook.com (2603:10a6:102:4c9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Sat, 31 May
 2025 11:32:54 +0000
Received: from AMS0EPF000001B5.eurprd05.prod.outlook.com
 (2603:10a6:101:16:cafe::a3) by PR2PR09CA0001.outlook.office365.com
 (2603:10a6:101:16::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.19 via Frontend Transport; Sat,
 31 May 2025 11:32:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AMS0EPF000001B5.mail.protection.outlook.com (10.167.16.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.29 via Frontend Transport; Sat, 31 May 2025 11:32:54 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Sat, 31 May 2025 13:32:53 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com,
	jlu@pengutronix.de
CC: bsp-development.geo@leica-geosystems.com,
	customers.leicageo@pengutronix.de,
	Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [meta-oe][PATCH v2 0/6] signing.bbclass: add certificate chain handling
Date: Sat, 31 May 2025 13:32:46 +0200
Message-ID: <20250531113252.3889951-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 31 May 2025 11:32:53.0809 (UTC) FILETIME=[BF9C9210:01DBD21F]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B5:EE_|PAWPR06MB9950:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 08f178fc-1179-40f3-6d7b-08dda036e23e
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WiXvaBl6fAfv8bOqfDSfTn4+Jxo8hZ29T9CX5eqh2VFrUbI7yPnx1Rc30iC/?=
 =?us-ascii?Q?SwIwZNGtqpd0mbmktChsaPQwGEpZBZeB454IgfM9kTEll5Jj32C32xVOEEkz?=
 =?us-ascii?Q?+WLdOvfiXoIGGwXAIgiCACk0IfgMOidgUdMZsMzdlV4W4vWXe1MFleLrco6V?=
 =?us-ascii?Q?50omiXDsSgfZcDxE7zStOjlS3J3LMApaZdLrDhPjP19CDkfbtvne0ypzvCMp?=
 =?us-ascii?Q?GY1kVkLK2Xgxv51xsuFbv2Sv81t7KkIDPKisSA+yg3OKeMbLVob4+ZzABVHi?=
 =?us-ascii?Q?VlTRUys6OeQDiuMnFE+Hgot0fx/TNtji361MHB5i6/k4tg3AynTR3+bLUcyQ?=
 =?us-ascii?Q?QCUHRT172vHYLqr/jhNJ2Bq5qR7JqFusgDoCvNwrU2nPdJqzRmTomkSNN4WZ?=
 =?us-ascii?Q?TVtwVaZzszh459Wa3sGpjnNcpa6h7Qy25pl7mYVwzbAbDHg5UDtArHymWoBm?=
 =?us-ascii?Q?S1Id+Fj6ieIk5ZuNQED1GVWR2/hodYXeb4uQ3v+szJtD3n4hSpDFLqMDLsVi?=
 =?us-ascii?Q?qffD/iNaqOEn0aKsjLtCRYFS4EW3dck+iiofcONiUMcp+6qrGW5OP3b2P4E6?=
 =?us-ascii?Q?brhK21odwZnj8a532IIpDoqUoWWiC3Xtszb7Gl0jIq+3UrOmuzj15PyUSvVj?=
 =?us-ascii?Q?9vIUenXl54CQC1GsPP59gHMGGkqBCV1bvZU1ESB+/LYuZLT0aXzpcr2QVxv9?=
 =?us-ascii?Q?wJ0F5K6jZ0L+P43FR64AwnS0SxBetasIjpBcfCTADk1c2CAGU6/Em/laJVex?=
 =?us-ascii?Q?7q+8FEevHzzgegGjsyCH/+pLDTjEo0kzXKAdFoXrrvsU0os+TIbg2AQ/WoCE?=
 =?us-ascii?Q?qKntiCA8c+xiY41ak4KYFflwQmv/c3k++ud0EwAKGEHOAEyZK6y2KWcqeuTp?=
 =?us-ascii?Q?8oj6oVDi5RqmZhH2qA91iEfSFBbixuMmID367yaD0HRlbCvGoBdU0yyoXI3P?=
 =?us-ascii?Q?06wVbj2UDHi4cFstQYDj0bvGqVu+tiCsuGpMubFf9N3VD7Y0BmBrN7dG0DgI?=
 =?us-ascii?Q?AaJR3nd62xZwbdLMp4DkC87tWwMuQF7WnpkNjOg6FkX2IcQIDTm1/wEbQSAr?=
 =?us-ascii?Q?CEYFQQhDfxw7DCpcf7NInYXIN2eb5bQ41IBKXPcxkLYv7uodH+8URJ5HENWd?=
 =?us-ascii?Q?jQwfG3+K2POZMEEtvMb9TJSYgSjcpbTIgepSwEtAC1FJwqloYIrhJBSiIoLv?=
 =?us-ascii?Q?8kFMlFGd4JytjwN9WdUl1HlSxnjumV2tffNJe7h6y2MFet2GV25f9Eeg1Yf1?=
 =?us-ascii?Q?WoGFLs1cjz8sQw8lUJrdLqU/WI42YgSVG5X9ES8Sx951mwExdy72l/zVGTSZ?=
 =?us-ascii?Q?EXmEQMhVJtkxmxJAfWQKr/70Ng86BjGBKHyXrKld9oG1lneegzGDxEsce/uo?=
 =?us-ascii?Q?PRiOIUD3b4t7FNxwFxw559txkxk8nckWLlNU1rmNsADtj7YZKPSSGd3pdX9K?=
 =?us-ascii?Q?6WU6aqcBGhetsczdsZAo7GC4+TkhPbdTJfLKfGl22A4AhyO65CYfKV3cL8QN?=
 =?us-ascii?Q?tipUOF4Rz+PU184wyx4Xo94ax3PKo5ACx5zf?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2025 11:32:54.0546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f178fc-1179-40f3-6d7b-08dda036e23e
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR06MB9950
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 May 2025 11:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117682

Adding support for handling a complex PKI setup to the signing.bbclass

Since a (soft)HSM can only store a single certificate in one slot, the
relation between a leaf certificate, and it's signing intermediary (or
root) certificate has to be stored outside of the HSM, in the form of
some additional metadata.  This additional data is stored in an
environment variable, which is setup and manipulated by a set of
helper functions: signing_{get,set,has}_ca.

This patch-stack also does some cleanup of now superfluous code parts.

