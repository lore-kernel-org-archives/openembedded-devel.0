Return-Path: <christian.lindeberg@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB231CA100D
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 14:30:38 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.52])
 by mx.groups.io with SMTP id smtpd.web10.78936.1756823436097858720
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Sep 2025 07:30:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=kfqD+wjV;
 spf=pass (domain: axis.com, ip: 40.107.159.52, mailfrom: christian.lindeberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fr1rl8wxJfL66MV6dzqz2m9ZrxIbYDvVXRIRt81tg7HelZeOrChtVrWF2TIIIUjOEYqDnz4XCEBpK5+ituqowoJRdw12+gFdXe2WhxYL0f8ocowWe4HAcPORaxnZN5iB8NTbawjfXlSUdQ46LUVdW/LCKWllwk84na4HvgaC8yi29eDuCUuN0CYoyatvgAAHaLWkTXyTbCVMLag1jwtu/Q1a/V+H44VjzLbp7GdrmThbh0IXf17S5Pd3YDuRFUqLX2QEgpLwCVTI25pjv7jEqs2hFOsc47xwWOSreUvFbA1iGL/NCDeAkMCgPNf3oWe9n/m54nRHVcpBYndhvjV3rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPa+aLvBCL03mH1i8tn+PQvgRLzAiWTZ0etUOx4VB0w=;
 b=YsX6mtN/RlzNTdNQ8/BLNsxFgeoYXt+DcKLUCHdI82Iod/SRdyvd8twRr4+2jMoRDdHiOQYAiAdcQQP6nJUTm6euhBrWMlmFVCViIPvE72bcCaS1zuktHnQ0EOJIu7nShSKFWriCtgdr4GDS0nXPYNuT1NnNNZ8mTkbcHAq2qLh90+hVSwaav+1odYrZUXzJj3q4jGiEqNcH47SOmui+NAS9/lkTNnh15yosKz7OwuxwjyzMa+4kqSfnNOhTzMV6KtnuLUy4dgAuNTNNESqyDtuBG/ZklFHmrTA/MN+9gArx9ZB3A6EPQt4obQu8lI5mnryUPGCvm9P+HPOSeXQemg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPa+aLvBCL03mH1i8tn+PQvgRLzAiWTZ0etUOx4VB0w=;
 b=kfqD+wjVmfiPpLOwKI37DjuByEfFF6RkbdEa2E3sZL1T885pvZ+TkGCg72XPfn0qDmX3GynEIuCBPM4MR8SC95UIHNMpHZ9N0dqLHRk53XOgdTPxIpqMeKCv9COnK59524HN6nq791UxESnQ1u/LFhO5OVu2jIjdWSfX8PyFpiU=
Received: from DU7P191CA0023.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::14)
 by DB9PR02MB7066.eurprd02.prod.outlook.com (2603:10a6:10:226::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 14:30:31 +0000
Received: from DB5PEPF00014B88.eurprd02.prod.outlook.com
 (2603:10a6:10:54e:cafe::e7) by DU7P191CA0023.outlook.office365.com
 (2603:10a6:10:54e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.16 via Frontend Transport; Tue,
 2 Sep 2025 14:30:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B88.mail.protection.outlook.com (10.167.8.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Tue, 2 Sep 2025 14:30:30 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Tue, 2 Sep
 2025 16:30:30 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 2 Sep 2025 16:30:30 +0200
Received: from pc50740-2234.se.axis.com (pc50740-2234.se.axis.com [10.94.131.4])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 853E2123F
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Sep 2025 16:30:30 +0200 (CEST)
Received: by pc50740-2234.se.axis.com (Postfix, from userid 21184)
	id 7FC632426D07; Tue,  2 Sep 2025 16:30:30 +0200 (CEST)
From: Christian Lindeberg <christli@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 0/4] Go module dependencies
Date: Tue, 2 Sep 2025 16:30:26 +0200
Message-ID: <20250902143030.139421-1-christli@axis.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B88:EE_|DB9PR02MB7066:EE_
X-MS-Office365-Filtering-Correlation-Id: 00810862-e90a-4e39-103b-08ddea2d4509
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cqFaRE6fhHicFGP+rbMiox8sNTrrkOF0ipKDLz3SLQb31UgMX4BNUFieewZf?=
 =?us-ascii?Q?hY0ngXOdLwcCCkaggSYE7wqdNauFHkt9fe6GrsTe+5Zyo+7vLPYolPHjnPU+?=
 =?us-ascii?Q?N10ZhoETvFBxM+pzFJndoGWLOWgD/dnVI3/BdLjUxkEtmtGDIZBgwP8uFcI4?=
 =?us-ascii?Q?kVCYxgcGE+5tDtkwe1QRpMUq/7lF3+a5ig+SVV7WHSkrRVt5EEGHW+RiRXWY?=
 =?us-ascii?Q?CcvIT0KtYMxTGM3DezwhKc9TqzKXsw+7NS6UzXoSOqsnUHf0ZJCVJ08g5IZF?=
 =?us-ascii?Q?8t09fl31WZwDdxnGWUw+Vj/X1sLsrQ/VVnmyg3Cac8nE+5gMV+tgYUfYU39g?=
 =?us-ascii?Q?O7ENdTYrtLt3YyJgiKXuTJA2ekZD3emejm701SMCTvy5G+Zq+eDsX8H1bzUk?=
 =?us-ascii?Q?TvRhczaqo+XxVHq6x0WUtpEEdbKIYySfXwxnuOgBvqpLV57cB9bHalwfajUt?=
 =?us-ascii?Q?BAsmwqsSvx+Xt4pio79r+sV5xRWOuhmgP1Bw7E/g6nHQUn7nzJbAlqyPMBx/?=
 =?us-ascii?Q?fPWh4IFULEegSoZ+1EkTlFNm+2omwV/QCu0ZD3wuTA0o0S9wDhXsMP+Y1/iT?=
 =?us-ascii?Q?3DdU4zzp0MN8gmmRD264HSmmRqSbkIBVG72S9NkLx85e7DZneuFhTOYvDsJO?=
 =?us-ascii?Q?/RLydZDxSzGHdSDQQnJuZIPdng9LS/5REtmEEudh2nIMO0zhyVJNEMiTeVHZ?=
 =?us-ascii?Q?yXd6imeDtqjnvx/6d3+VBtOoFtCmSCsQgos0sXXlLDsQuEUIPnnibeygM7MF?=
 =?us-ascii?Q?+ZbPMwV39EWIuVW4O3J/nGeCgohYMBY970KiFTM7NBH2taEy0uxDLQT6blwO?=
 =?us-ascii?Q?ggMwLcJeMJmRuSINDa2FXgGY7Xg4x4zDOLuGnkOZeHUgfq3uwfAcxVMfyDKv?=
 =?us-ascii?Q?33gEMXJcCUGG16nS544IYjPlyoZYHMlqwoJnyI+HSlSlsAn/KJGXGpBn3kKV?=
 =?us-ascii?Q?ACI+ZX6UL2+iYEEndC/AT81Q+2HScSd5OtP9hwUba4Zt4a7wUnaLc7JvLELI?=
 =?us-ascii?Q?7xpjmXw70YXkBIAQOhDanpwQ5DD4RNqkHXskiE8IC4uks7jrJDZvHjgrUbtt?=
 =?us-ascii?Q?kMLt32iAX7ywbJclOEs//mlFpvQdbstJ1W8KDWrc5t/AGPhTtmBLm9gIQQ8/?=
 =?us-ascii?Q?Sw+RMiJ1oUcGdnu8B/iXpVF0N0pgTgZ2zumMnzz0gpmiuWeOYrF6Akfv3+8z?=
 =?us-ascii?Q?W9dQ3N6dsygD/LGH8/rK4YqtWNqXlB6/4iFIMMNVf2CBXMzSSFcVRC/MDMIi?=
 =?us-ascii?Q?1jkFwq4zJxXHh9XkVFzAMLj/1TKhUJMksdB/xSeW5V1cPrymSZa1bSbXJptu?=
 =?us-ascii?Q?C6+6E3ksfOdk0TgY299cTQcRQ1slWmhP3pAQUtMv1X+9Sls15P39GDGWfWZk?=
 =?us-ascii?Q?lPtKyTrNy2gFadtf/Y/tRx1ECpLFo6UjZqTB4fn6pgJKwnx0+hSFlrsY+hbU?=
 =?us-ascii?Q?QAsiwxDkl2MClh0FoJWi3X2TbmpVy8HMbJ1liSBQmaaVEDSKOgRofw72QFdw?=
 =?us-ascii?Q?s19/9yqCGC/sKpEiaw2/jsgoy+IWkE+IlqFq?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 14:30:30.8620
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00810862-e90a-4e39-103b-08ddea2d4509
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7066
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Sep 2025 14:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119180

From: Christian Lindeberg <christian.lindeberg@axis.com>

Here's a stack that together with another stack for oe-core will try to
close the gap between the two gomod fetcher based recipes and the
go-mod-update-modules class in oe-core.

Christian Lindeberg (4):
  crucible: Add spdx parameter to license URIs
  crucible: Update module cache content
  influxdb: Add spdx parameter to license URIs
  influxdb: Update module cache content

 .../recipes-dbs/influxdb/influxdb-go-mods.inc |   8 +-
 .../influxdb/influxdb-licenses.inc            | 128 +++++++++---------
 .../crucible/crucible-go-mods.inc             | 116 ----------------
 .../crucible/crucible-licenses.inc            |  72 +++++-----
 4 files changed, 104 insertions(+), 220 deletions(-)

--=20
2.39.5


