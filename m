Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4762C0219E
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 00:10:15 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.19])
 by mx.groups.io with SMTP id smtpd.web11.306.1739232611697819971
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 16:10:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=J9IRVgak;
 spf=pass (domain: axis.com, ip: 52.101.71.19, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TLprx1zTOUWLemxAAcql8RiDOMJM8YCPeo5fbDMNW6zJl/3hqPXEp3uKWYoeY5lLKblI+g2bHiLQGKJA2Xzt2Fl/D89u4Id2Rm/48bK/G4SEXVd0NpufhUnjonO9+vH1KqBZ8NwIaVpddiyes3IumCnShipOo2d769CTJMPGy7YcwzUFCLRxCZTfF/dgzorRXsUdkYB7Yk7Od2ZbyivpzEC200SOC7PgKv0GR5keoNLclgiIiB17RXVs2fTY+NFXgMExMk/wCLnGXOBj3FDoARVIPiRv8Oj6bH6zBz0hfYspwNcDhCWlgCH5IIxizGZg7WZ+GMx40YbRTzE9YFYK7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDHo3CxTWYhJG2S4JJcRCWZdVFFdaRHLCnVtzdE90Ho=;
 b=mghOyGG9/Z6owv3WiGWmbo0JLxwFUOSyeMKnCqEunpLj5IINL3j9Pewu0LYI8DLzbVNZasDJFDMAzBeFQGRdvRzXdJ9RoApdwdS/7YVWwVLm5Gv9+Oez3nFDDmVxJancuvSHu2slwOEjcO67SlchVio1l7OBjMfVqmIxHjDT4qHYYLtvi2KTjS0XLlNmODqkygdCDRPqS0fNEwagMZEPNJ7yIJYlkj+0LbIx6mzm1lkyCyZQhBfkWmSCg9cNx8pWLsQDQ3Tpymvw7YqE30WihSnufEaX9j9eNw8QifsTRMayL2/0fHwsx6a/PkpxGUetVqpA1r9E5FIdq30GTQPPxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDHo3CxTWYhJG2S4JJcRCWZdVFFdaRHLCnVtzdE90Ho=;
 b=J9IRVgakXYOnawUFvNzyWwJ6m7nhWpix6COrU8HVmLk09r5U2X+swyjBdDMZPeL2BQSSokuL3H+PRgZxkR7hFD3Min/TemOpiT7GCYNhgWhaLfsUnAye/KgzPndloto/ipJFwkiXeJWU8WS2GOWosspWR/x6kFV3O5r1xDQqugg=
Received: from AS9PR06CA0457.eurprd06.prod.outlook.com (2603:10a6:20b:49a::18)
 by PAWPR02MB11137.eurprd02.prod.outlook.com (2603:10a6:102:46b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Tue, 11 Feb
 2025 00:10:07 +0000
Received: from AM4PEPF00027A65.eurprd04.prod.outlook.com
 (2603:10a6:20b:49a:cafe::15) by AS9PR06CA0457.outlook.office365.com
 (2603:10a6:20b:49a::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.22 via Frontend Transport; Tue,
 11 Feb 2025 00:10:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00027A65.mail.protection.outlook.com (10.167.16.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.10 via Frontend Transport; Tue, 11 Feb 2025 00:10:07 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 11 Feb
 2025 01:10:06 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 11 Feb
 2025 01:10:06 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 11 Feb 2025 01:10:06 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 88E9134B
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 01:10:06 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 51B0A6Zr4178981
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 01:10:06 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 51B0A5OD4178980
	for openembedded-devel@lists.openembedded.org; Tue, 11 Feb 2025 01:10:05 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [styhead][PATCH 0/5] Backport of five patches from master
Date: Tue, 11 Feb 2025 01:09:53 +0100
Message-ID: <20250211000958.4178887-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A65:EE_|PAWPR02MB11137:EE_
X-MS-Office365-Filtering-Correlation-Id: 24e64b79-df9f-4486-fd62-08dd4a3070fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|30052699003|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dzqugcT8KQyiDV6R4xbLi7fhjQLuPiP1re2918McX/xLgzA+yGtd4BkwVr4m?=
 =?us-ascii?Q?gM9gY1jmJE8FblGbK8vnlszIKKDvF/tfcjP1V4kHrS+7eXEoROsHfftQIUrZ?=
 =?us-ascii?Q?Q6RHdzoWtuamqQo2JfCZO5wCrEedC3m7j48gIyFmxferCuTqGARow7aLSix+?=
 =?us-ascii?Q?mFkE13HXfR0wrxNc/lA1Vl5DTYmHVINLqzsNbzoF4QJj13x+t/aGYLvex86G?=
 =?us-ascii?Q?gMdtGs7so1WxBO9P//cirKgWpO5/hvtOC7zy5sxoFLixM31abTdBciczyziq?=
 =?us-ascii?Q?wSyHoT6sadVNvceNqTSAk2Zy2sTU66kkJPonVIPCJdW8nE+qoDtFDYocMPzf?=
 =?us-ascii?Q?H2SdAG2XG669UgkwulXwBQF1eO3hK0d+0r2pryuaaWrXjasNg89f7KgTopm9?=
 =?us-ascii?Q?KxsLDjx1u4W2kZj3Qdz1trJmVxkpUSywESoDfIvlk704FO8wCWzH8PlSOI48?=
 =?us-ascii?Q?8gY9R9kbksFF5CWc6Sr2E713J0mM8XQbk2R+xJpu14TtynaVu+US6K2x4BAR?=
 =?us-ascii?Q?YAnU8aVVDurewfUDB/VZlbBJUPyWigzbD2DmYv4G8tk4Wb1Cd2LnscEH0q7c?=
 =?us-ascii?Q?G7QJpIHdhl5Ah/NGpNiyVAaIM74hm2lEFdVYp/dC2WcFBjeDM7NgMPvFC/Pp?=
 =?us-ascii?Q?sMFFb0nFCRPxIdW4auMkd2cu/oPnZPVwrmBv+/xQZ5cQh2CEzZ8JJ1H09KK2?=
 =?us-ascii?Q?XQevXK2TPK5M6iXo8K/eK1p4x1zgoLU5uXGMOA6zcmcn6F7OYPwZfsuemrId?=
 =?us-ascii?Q?DFLuXdihVRR9Vq1hlJ9pZco6z1gbrR81QiwDDnKQu0ErYw9eFUN4diCQIIfd?=
 =?us-ascii?Q?OwEfbPRkSDTstmTErSrR0x9gZ1KqZr0QljpSqXd1aOsPQp0BV3E13CicVTvR?=
 =?us-ascii?Q?MKw3Sseqyk+wNQU6bnTN/iH4RjmXYW/b/ao+nEj2ePO9VZUbQFekfKGDRIhL?=
 =?us-ascii?Q?vJRnzb4y+2s5fua2paMZ24x+VgsJSHhwemhR/IciNwt//+yplKKy/GX7/Cdx?=
 =?us-ascii?Q?XfepWN+bVSKp/dj+eoq9uXyUbd46zVoOgdRuMgg0h5YYRelnt8PzQfIjfdC8?=
 =?us-ascii?Q?fKLShGUDT6mYOaT8nFSFLtHvUrSUahVD+BNhx6u54RgnTBDMqx420p/12mSy?=
 =?us-ascii?Q?SWNnpb2qq2l0g4vrS9538S5IwRcKtxM4wABRevgoQBCbrUwi5wx4ssmuwKm7?=
 =?us-ascii?Q?PZ/uhvB4y+PKt+I8L/V+nMzEIgUvVs9b3Mm///gHCenRfKII+cmxQrmlJPO/?=
 =?us-ascii?Q?Klr3xXBbyktQfFhw1PLv4ITjdtTJ9PR6YcyPDRlbPsV7db67tOffUEE7RqMF?=
 =?us-ascii?Q?IxK7G3HMBKO1JotT2ru+QTUDA0keyvISSi+FGiA9zgaSsI5d3kKFVM6axcWs?=
 =?us-ascii?Q?3MotWK1wZgnweo1JqmdR9JG2P079FYAHxdo2hXvnGVHzSgejW0UlcKoA+BlZ?=
 =?us-ascii?Q?D7o5rwbFuZf+W5mrN+gPCzcClTqWapjC2G3ikNiIILhc6vTP/9S1oA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(30052699003)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 00:10:07.0589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24e64b79-df9f-4486-fd62-08dd4a3070fd
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB11137
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 00:10:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115411

This patch series contains backports of my commits from master.

The last patch (which removes the MINPACK license) may or may not be
appropriate for Styhead. Nothing in meta-openembedded uses it anymore,
but there is a tiny, tiny chance that something in some other layer uses
it. However, they would be better off switching to use the Minpack
license instead.

//Peter

Peter Kjellerstedt (5):
  ebtables: Remove the dependecy on bash
  tbb: Re-enable hwloc support
  lvm2: Remove a lingering reference to ${PN}-udevrules
  libeigen: Remove LGPL code
  licenses/MINPACK: Remove

 .../ebtables-2.0.11/ebtables-legacy-save      |   19 +-
 .../ebtables/ebtables_2.0.11.bb               |    2 -
 meta-oe/licenses/MINPACK                      |   51 -
 ...0002-Remove-LGPL-Code-and-references.patch | 1040 +++++++++++++++++
 .../libeigen/libeigen_3.4.0.bb                |    9 +-
 meta-oe/recipes-support/lvm2/lvm2.bb          |    2 +-
 meta-oe/recipes-support/tbb/tbb_2021.13.0.bb  |    1 +
 7 files changed, 1058 insertions(+), 66 deletions(-)
 delete mode 100644 meta-oe/licenses/MINPACK
 create mode 100644 meta-oe/recipes-support/libeigen/libeigen/0002-Remove-L=
GPL-Code-and-references.patch


