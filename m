Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D78CFCAC5BE
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 02:47:54 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.26])
 by mx.groups.io with SMTP id smtpd.web10.4678.1758941271322590508
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 19:47:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=GwXYVyxi;
 spf=pass (domain: axis.com, ip: 52.101.72.26, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LSO9Or1s7/AS7v1wzdvLhossjyznVBtUbsUY+xo8sjv/qXOiUX4oQo3QxzfKRfxa0Q8bwGzx6thHFQSspa0O/knpf9/DAxI9Yyz3n2qQrjfh/5gC/2LNLSwR/qrxk9Fq6T3EySgP47PzRIt7C9CtIf1kfBqnKYrgPlehtmykd9orGnYLd+ZWbpKfysv4SIkxVla9EuWkk4CFuOC3tQpSJOilMkmJFe4B64cz1YG3sAvgNnElU2h6fjqQYrj2/lO/zsZ47Y9oW8m5f/m0Ki1R17yHui8pW6qFy3y0WCSOMQ90vHb8zUuO+yOKE64BF5Nf5MWv5dSx/JzRXt9JMnus0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JP4rdAqCFal7tMU3hDKK/zhn5cQbneiujoPfvqN02Ao=;
 b=LctoaplQ62Mr6dtwkg2r87FIdkqdlDNK0GTxIiwxSr0qXDbmzi1CWNjeZt9OM7dO0WZtdTLrM6y4p1Ncw6A43YgdrDcV56+PYaZeV5ZnCJ9R+Wm/UJLYTlImpYWJ2Sd8Kf/kUUM6hJs16wVR/hTJG0GyNdOvvsAhfyb+zh5F9JVHvP08xk2TrSuE54jjS3WL7Wv4UdHIuyxyhUbKZgU2SRxjZgKXfiuxxh89SCELoGcpU9JtBsH9n2r1MWEgQoP3shY4ATgiMW7f70zNNLJTzvAYoXEslr2spas22X8Ds/VZVaws9LuASvkm+VEiZh15X8ONu7P4/paNXtojGq/w6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JP4rdAqCFal7tMU3hDKK/zhn5cQbneiujoPfvqN02Ao=;
 b=GwXYVyxix5GY8ml+H243ucoBV8AF0fYMtYDM+ez59P4+ZjeP7o6jcoJgNuzSzNAjfcnlqBih2jD/Tzw3DudQxMHHt4qx2IrR0+kAfgjBpIJhmpqK4+DW+li8zmQUTDdeS0hvaJVSMNi/7657S50vZZyz+IlDaLLmWObQTj57HKo=
Received: from CWLP123CA0132.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:87::24)
 by VI1PR02MB6431.eurprd02.prod.outlook.com (2603:10a6:800:196::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.11; Sat, 27 Sep
 2025 02:47:46 +0000
Received: from AMS1EPF00000048.eurprd04.prod.outlook.com
 (2603:10a6:401:87:cafe::3d) by CWLP123CA0132.outlook.office365.com
 (2603:10a6:401:87::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.13 via Frontend Transport; Sat,
 27 Sep 2025 02:47:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000048.mail.protection.outlook.com (10.167.16.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9160.9 via Frontend Transport; Sat, 27 Sep 2025 02:47:45 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Sat, 27 Sep
 2025 04:47:45 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Sat, 27 Sep 2025 04:47:44 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id F182D17D
	for <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 04:47:44 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 0FC141203FD; Sat, 27 Sep 2025 04:47:44 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/2] glog: Support building for native
Date: Sat, 27 Sep 2025 04:47:41 +0200
Message-ID: <20250927024742.1485096-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000048:EE_|VI1PR02MB6431:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dd88966-15c2-453a-fef1-08ddfd703cba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nofuBiVrJ6BaBwg9ze6UFHi262C8qb+SLXQ/UC/O1fYxZa8mBUNHatOx/xjP?=
 =?us-ascii?Q?GtzKEWIP7flsFoOgDcnH2eHZHBvEn0u2NmPulaj1rvnuaD1bKAHYxpP4Ih9s?=
 =?us-ascii?Q?MafsXTz6FBZBvI97FPVQmMZrlmzoUgZIzCZ+9bdvhiO+F+yoCuQhIJG9vC45?=
 =?us-ascii?Q?2fjp40gHPEdBwSAB6Q7m92+j4qLxDJ2PViOdBFL5u/rAgtkIrnHXIf5fqm5a?=
 =?us-ascii?Q?o9btDBjJ5ox9NwCHsumvW7Y8jWO9DqMAQW0me7orj+bUwN71outfwTdgRK0E?=
 =?us-ascii?Q?tN4owgpTgRQ8SjZ5iGKPWoTJ4SuAoKkmNLDAJxkGGFE17aB8SoSYbODhN6ri?=
 =?us-ascii?Q?mX/Bm+6uxj4n3WKbxvQMQFD4c4C6t3rv9IJrAzVTc36hbhxqhXBYt2lmnpCi?=
 =?us-ascii?Q?jz5LLyNPyzweY1iPfnPeEJe2eu8EjRjBLqfGr7k6RkhuBSLx6qMzsSz5BynI?=
 =?us-ascii?Q?DYUvtXLFjV/XTi68xxAhY2/PD5iW0/nobzQYJT7ctfiJpUnhYvyFVQKDRV4u?=
 =?us-ascii?Q?6jFHlADZKw3YdtgyEyvFu4aK1UCQk4x28QJOyg99FhhqHfXMT6PQwzx7XSk8?=
 =?us-ascii?Q?BrT8a+2whfgTvGoESeEZEdjZtFjiTeknqyTvdP7gQWTFfMPMbtenj+vsaITT?=
 =?us-ascii?Q?PpTO1LswFh5v9/5Jl5xDdN4zB5vBcPb0O5IRVLMhO4RLMpPULKCpdl5tFNAD?=
 =?us-ascii?Q?svDpG3zH4LkreVZGOciNms0QjIpRdyZXYXf+Oe+TPKa+hB8SQpn4vmwNEZiM?=
 =?us-ascii?Q?WtuMvy0CEG0acRU63MQhLUbAa1T0QsokxD766RtBCFAHJuVzh0ihg7tulI0x?=
 =?us-ascii?Q?msRAsWPr4PD9XWkTmu33E//VwR2Ggor+Cc+gRuJuL//iu+OIiXRDym27lJPJ?=
 =?us-ascii?Q?w1KedGHaLiYGiLxGvuTiInnwKUrGbeO1Nq18x53q418iYepcSLK3dRcyMRqb?=
 =?us-ascii?Q?8PVo58+eZ/D6fIMhj+A/rEa4B9yI0EOrry5xiROp1TeEwJ1RCaOcpaCSqA2D?=
 =?us-ascii?Q?7q848oEooHOQmvapkkU4BDFw6GnaPPuR0s6lPSncMO4Kl1+CjzGpWMgQGjfr?=
 =?us-ascii?Q?qduCTDNXYRk9N21Zx4HE6Oe9TvlBocus+O1jLSH71M1xXVXfzgD66DG+KXNq?=
 =?us-ascii?Q?hU7crvrIfvUnDPys2lPDcTyXXeTy22coI39ADWdvvqKeDO8W8XTaIf/E3l3E?=
 =?us-ascii?Q?i8VBYH+XO4m55DHTVCrtay27Sx+LidCxqAGxM7ddg3l3uR4LrVcxf67Lb64H?=
 =?us-ascii?Q?F704gwEVKclrRoJNrDuYl5d6ZX+Lor3HJzIE45ScZfa2uqRRlGwdyr/V7+7u?=
 =?us-ascii?Q?oIJHHJnQRvDPpCY+6ZAMtJt+1Wnj3qRYZ8jMPKbOdBa8d8vnl7X0m17gyHsl?=
 =?us-ascii?Q?CR/9JnAjrR9ZCnrih0NWbRMGRYjYdQDyYT44ryN92n8Pr/Sngn3oYQK5uiXT?=
 =?us-ascii?Q?Td1B5vdjlQyzlaHvRDsPJ4u5ftZbAEsEe3uz9SSabPmLgrE2cl5CMNCA0/wU?=
 =?us-ascii?Q?orIDsHOmUUC1UICB46HYjLtqhH0hu4asJv3g/Be6tigTWABjYPDTY1SOJ3+r?=
 =?us-ascii?Q?RtemC1TG7PtEL2q/eY8=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2025 02:47:45.3109
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd88966-15c2-453a-fef1-08ddfd703cba
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6431
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 02:47:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119948

This is needed to build opencv-native.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-support/glog/glog_0.7.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/glog/glog_0.7.1.bb b/meta-oe/recipes-s=
upport/glog/glog_0.7.1.bb
index 570d9a7e5f..6a649325a0 100644
--- a/meta-oe/recipes-support/glog/glog_0.7.1.bb
+++ b/meta-oe/recipes-support/glog/glog_0.7.1.bb
@@ -12,7 +12,6 @@ SRC_URI =3D " \
=20
 SRCREV =3D "7b134a5c82c0c0b5698bb6bf7a835b230c5638e4"
=20
-
 inherit cmake
=20
 PACKAGECONFIG ?=3D "shared unwind 64bit-atomics"
@@ -39,3 +38,5 @@ do_configure:append() {
 }
=20
 FILES:${PN}-dev +=3D "${datadir}/${BPN}/cmake"
+
+BBCLASSEXTEND =3D "native"

