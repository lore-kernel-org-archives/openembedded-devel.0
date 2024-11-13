Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9CBFD462AF
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 14:25:41 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.76])
 by mx.groups.io with SMTP id smtpd.web11.12549.1731507931814684657
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Nov 2024 06:25:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=Q1i1UDzP;
 spf=pass (domain: axis.com, ip: 40.107.20.76, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UKUo44rC/WJw2NjYtLM617k5jiqlUGdek1Yn8lBid9JB66ziTbR6T1xAd0aV4nzZAn6SjvSIYwShDiZ4KScGh1Mg+FAzOqgplWUEACm7xpQitqt1uWXyPjcb2lp8ooFGm7KisruvVXC6ZUhja3pxcjmaFVFUCnjojhUUX7tiZ0fYuflaD/tMbRQLECJvkPmqhJU4CWQlTtn+rOfwbTePqSw0XGbEGqocUpy1GzLN49bPO0vKdegex45jzQjJ9UD5hdVsUBhZP33bl+L0p6oYfZR3J7t3LlgAeR031BRRLeMjU+ltIBVverhDqswWwYC4C4vHM4o1HCz3EVzFxI3YNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HREQhttEwAugLLVpYTUe856SsQRXFmalRsENt3EL2NU=;
 b=Bn8slAD70pUSF6i1MFD35wSjlz6BSbivSqpGmK2V6AvjIX4OpjvpkXb9kJzVQ+Y+MCSYQps22mLeeJ7Mv1nph0Aba/Ot1Cme1V6GdIAxi0TtNGRjTKrbzERKPov072kc1MWy1Z+483NAJTHCHavB1+SXF9MqKS/YtE4EuUSgkc/hJYl8O9W0up8QwUQllsG6P9gqiwFtdeWCMtN+h3Rr5tp6J//3fBnlvBwQJlf+eew96ac8ywooiObh11TCyZXq8lAbbOhD8gpcxh7EtR3xtpXRBQtvxCHZgiPcAFY7dUvNZnGcw+rSr+ZyknytDQLjOKUB6Bdjx81F/I+z7c5o5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HREQhttEwAugLLVpYTUe856SsQRXFmalRsENt3EL2NU=;
 b=Q1i1UDzPVwQbGOudTKLe2qjheFtrCHxTrY9W0Q4SLz6GNnC6GYgllx9KXK/46ehRdG2HZ2oxVZ5I6soOaXZYf8iCvfRLcfTa8GxpQB/4PBF/4gy71d55LXmb2OqioEYtThwFDRAPYxhexdWBnlIXM7aHU2fq167wEXUrj0spHFA=
Received: from AS9PR06CA0403.eurprd06.prod.outlook.com (2603:10a6:20b:461::33)
 by VI1PR02MB6479.eurprd02.prod.outlook.com (2603:10a6:800:19a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Wed, 13 Nov
 2024 14:25:27 +0000
Received: from AMS1EPF00000045.eurprd04.prod.outlook.com
 (2603:10a6:20b:461:cafe::83) by AS9PR06CA0403.outlook.office365.com
 (2603:10a6:20b:461::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16 via Frontend
 Transport; Wed, 13 Nov 2024 14:25:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000045.mail.protection.outlook.com (10.167.16.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Wed, 13 Nov 2024 14:25:23 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Nov
 2024 15:25:22 +0100
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Nov
 2024 15:25:22 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 13 Nov 2024 15:25:22 +0100
Received: from pc58073-2410.se.axis.com (pc58073-2410.se.axis.com [10.88.67.1])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 768146D2
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 Nov 2024 15:25:22 +0100 (CET)
From: <olani@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 0/2] Don't rely on OE-Core patch for Automake test-driver path
Date: Wed, 13 Nov 2024 15:25:20 +0100
Message-ID: <20241113142522.3113838-1-olani@axis.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000045:EE_|VI1PR02MB6479:EE_
X-MS-Office365-Filtering-Correlation-Id: 729bb3d4-dae3-4414-dde8-08dd03ef0287
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VenPjLQ90h+5ZQ6CdqsELx0cMlZ6BQ02xm+i2GqgeQFegA5t/qyo05MWLmzz?=
 =?us-ascii?Q?ReafIrtcFNqHY5F9jI0xuWC0MNGOQ1wHPG54T82aA4N7QgqkKInw5lYjRJmA?=
 =?us-ascii?Q?+FXMyZAkaDfN7kmAjI2W9SYUI8FNgwdIbgYK1GoHWBr22GZhJ+fJeCn1+XM1?=
 =?us-ascii?Q?0+8a0QIetzB5DBWeazCGvrT2tViPp182xI9I7Nd3+//3P+7QGkih2lqoTUMa?=
 =?us-ascii?Q?Xtn02W/vNHB7ipdbBXqFK3TU54kRkuxUygmgJppMNApDvN+66EA+cvE/IaZC?=
 =?us-ascii?Q?ivFk6o4XX+ASVpjK9SPKre6cSKhBo2wFsJT7iCOHQ7USDGs9awBhcqkGl0OI?=
 =?us-ascii?Q?txb8oZahhh3JbD24gdraxDRvS4i9Xa0XLNUdXQ/qnbuuO1J4GTXeGBuMjkur?=
 =?us-ascii?Q?MehoUpPKxWNYVH0NGE71ILy3lBZquV53MUydIbYrYUudls7MkGxS9vnZAvnq?=
 =?us-ascii?Q?e1n7xkdYm11E+8LaLZBPA9+oGYGp4WIZf+zu8H3H+zqHrVJzqmfuFtRqNhah?=
 =?us-ascii?Q?bkG+JGu9UFk1C9BR3cLg4toUGetH5YssUDjhxL/IWB1PzPB2tymfGWlE+2TQ?=
 =?us-ascii?Q?JItZk0oWL5qku9C1mBoSnluJ7QnSgaXVcUaBzIR5prmV/D3bUxh5VKxnQLrL?=
 =?us-ascii?Q?qNkn9qFlHZ0ivSjWKuHGz5LGCzqufYV8EAlsz+qpE4A8wo9rMWNs9pnycxIT?=
 =?us-ascii?Q?DHxBYWiYbvBrMVWHLaFoWiwKl21TsaXNlViW1AKxw0ucu/KUOJdtifl1ldPI?=
 =?us-ascii?Q?E8fLdGe5bYRvv/mGiVkmZR0WK3GDJL1LWI6vnjCruP6pOvTk2oJ49LpfFO6u?=
 =?us-ascii?Q?p51sXweHTSIWzFaumvw9bTNHD+Odxmh9mi8+RUHsnBSkNuDjnRabqDbOtF3A?=
 =?us-ascii?Q?JhxeAa3TSZKqUX1ykOOglgwbkZMDxJEjLhMQy9oK6H3X+j8T/g2fR4AKqIfc?=
 =?us-ascii?Q?QG1Uyfw/53jvHqrnNtaLVoHCBwOt+y+UObXkJc8v+/tsRkhhDkg6416M36bO?=
 =?us-ascii?Q?ginNP8CUYKEQVigyysQY4TRGDOVKYu4jIxrTKdZYdjKpzSgs+unY0z2DzOEl?=
 =?us-ascii?Q?eAkyRAnelmbW2xUB/aPAPHmc6I3aFcZS/TVHZi8t5JOI3CfA1VN/3ejf0Jqe?=
 =?us-ascii?Q?+pqDy/XTxS2DFZBlG+mf+e3rql5UtYYMtPEPUQYpevZqXO42fqzyEilF/oiJ?=
 =?us-ascii?Q?87xVpQqzaYF9396gkuKSNPe3KD4LGUKTQk70T7ENlzn//JV90jiDDdMZ6927?=
 =?us-ascii?Q?a6UAAbXZlC0XxKhU0wbji4p6e+XucV/8oES7w7f4ESBwOJKTI/Hp13HK8/0O?=
 =?us-ascii?Q?1NZ1bb9WhouZsR06GQeGRzTZ6WQVjbY4OZbXglNvZweRpZzveMaton1w7Gt1?=
 =?us-ascii?Q?wFb0EyBwcaVh5FDFJnDJVMc+t8cZWwWMp0mwe41Qs4vsSQPQGQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 14:25:23.0691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 729bb3d4-dae3-4414-dde8-08dd03ef0287
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6479
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Nov 2024 14:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113812

From: Ola x Nilsson <olani@axis.com>

Relates to [YOCTO #15635]

ptests in rsyslog and librelp rely on the Automake patch
"Set relative to top_builddir path in Makefile to access"
which hopefully will be removed from OE-Core as it breaks non-ptest
use of Automake.

This series fixes those two recipes so they do not rely on the patch,
but still works with the patch.

Ola x Nilsson (2):
  librelp: Fix the ptest path to test-driver
  rsyslog: Fix the ptest path to test-driver

 .../rsyslog/librelp_1.11.0.bb                 | 18 ++++++++-------
 .../rsyslog/rsyslog_8.2408.0.bb               | 22 ++++++++++---------
 2 files changed, 22 insertions(+), 18 deletions(-)


