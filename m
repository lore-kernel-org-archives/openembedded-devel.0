Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51478C52D7C
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 20:09:27 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.37])
 by mx.groups.io with SMTP id smtpd.web11.56156.1723493357392757236
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Aug 2024 13:09:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=LohkLs4y;
 spf=pass (domain: axis.com, ip: 52.101.70.37, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UvN4wRaLdWk5Kup4AFF2Pfr/u1Gpb3gvGXlrX2cnGrFXr2OTURnFKWRJICUlgeqaLJ6+PWtziVpouFk8GHCD8QBIle1nni7MdDHdFElVZoMoYZw21FPTpz3HWikGXA588MLwGsAUaNHPTCZajVvr/yGyZsgLyfGJOOSJ0P5qPxesTxvjgE4IOwp5rTZFRH0kq8zGTTcKpf16hIHmvHMR74d084ePq0qIsb/0/Dburs92YBK7enmVKee+paa/V7qW9hTpDD/7JYhBdW0C1bVJQEDGR3pYfkREvGSQBusDO5O6Kqm6fGtbdxPdbmrgCrYKuq+7FrGLpTfcl1InSPpz6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbOCjzLX1h2ueH1PLkZWaLfjZk3B9Vzmp0+wl5dRAaU=;
 b=uxDfTNokq8lckckRgdOlqeW0UXVFKJvZugSQAuZ0uGl9FhjHAroaFuzwOKTruqCF7qpSaVcip3lAn0oy3Nq/sdWUQd81KcFDfkiX4S1NJfO9d/Ftgv6RRuYAYlDxEZ1yXukLt+dSnTPAfzZ6rat/6tkc4fijG/BaRtXOSvRSdt7tN+p9TvDTWn5ZLwg0p/YZeatHpYippOXygkozhOVZum11vY3KrITjCVUZq9Frkzn39GT+pn2srkM1ByKlFP03faT91+Ee1bjeYrVgzaF4eOiuDOvXHlVxIMZ6UuHyj8PvxeAUxejC6JEFM4uqkDGBI5PQFRHzHzivR4J+yyXEfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbOCjzLX1h2ueH1PLkZWaLfjZk3B9Vzmp0+wl5dRAaU=;
 b=LohkLs4yLP2WFo3ERTlNQ0Q26KuuBnCZdQSeAR2mZKm4D+fkZeOcRZNSQjT5qCGEmzsoL8uizSxlthHFuAaKja1VVqhryziBU/D2Nu07W79s2oJsDx2ebnRARaozzv+pirANR2oiATyIrAuReMCDCECmrd0LJW4UZhNZTEm4clA=
Received: from AS9PR04CA0146.eurprd04.prod.outlook.com (2603:10a6:20b:48a::19)
 by GV2PR02MB9421.eurprd02.prod.outlook.com (2603:10a6:150:d5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.19; Mon, 12 Aug
 2024 20:09:11 +0000
Received: from AM1PEPF000252DA.eurprd07.prod.outlook.com
 (2603:10a6:20b:48a:cafe::1f) by AS9PR04CA0146.outlook.office365.com
 (2603:10a6:20b:48a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22 via Frontend
 Transport; Mon, 12 Aug 2024 20:09:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM1PEPF000252DA.mail.protection.outlook.com (10.167.16.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 12 Aug 2024 20:09:11 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 Aug
 2024 22:09:08 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 12 Aug 2024 22:09:08 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 5E4DA31F
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 22:09:08 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 47CK98Nj3077968
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 22:09:08 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 47CK98HZ3077967
	for openembedded-devel@lists.openembedded.org; Mon, 12 Aug 2024 22:09:08 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [scarthgap][meta-oe][PATCH 3/3] libjs-jquery-icheck: Correct LIC_FILES_CHKSUM
Date: Mon, 12 Aug 2024 22:08:54 +0200
Message-ID: <20240812200854.3077901-4-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240812200854.3077901-1-pkj@axis.com>
References: <20240812200854.3077901-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DA:EE_|GV2PR02MB9421:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b44d068-09d5-41ca-3437-08dcbb0aa189
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eh1e8PG8eUEYjJ9idAaJPRjKVgNtfCEvauj8771EnnHy/wkEKEFEJIW29G2S?=
 =?us-ascii?Q?4R/dYSIsjIVO6nIjc7nKfRFRG7HH+scTQy1o1e81LPOf23MniujUJJkzyTgq?=
 =?us-ascii?Q?IAUsd64Acd8laCbyaC3lNSu9yifx3M+E2cA606sQaGajQDBcJ0SauTt3EQSJ?=
 =?us-ascii?Q?xdlQrUY9692J5WhbBktwMU0XSpswSfgsMnXUd4x9jVYk9cwdxQAc7do6BOze?=
 =?us-ascii?Q?dHFS5w0fYo7aMnnnJbHJ4tVApyLslABp2wJFzDE1vmo4piShXVC/cw2bWh8F?=
 =?us-ascii?Q?HxVJ4QtvewEO7W8lLa1o9uAfe5gSzTid07ThcaRkM+xIPECAazEl32ozmRua?=
 =?us-ascii?Q?pANTIeK5olhezGG+a10DWfuMnLwGW+N0Yh5HbiBBiu3DYOb+BhuvAUIgMfsq?=
 =?us-ascii?Q?JRH5Gr9N5UjpSxjmUbqDVwctGPIN9pgN9spQZj40eF0faPeQR+4HoBbiqi6h?=
 =?us-ascii?Q?vDnqm5xUVn9SAVIcGFNM2GLBQZljXvcovuCBbVxX9GxhM63hKH2KZlmJZgup?=
 =?us-ascii?Q?u2VQUs2pml/sH4mn5QAVaJiXH/35B2x+miGr5x1v0jFnAbZW+oP5iPdw1jlS?=
 =?us-ascii?Q?G8tSFXX+dCTbRzPcBHonjOAya1MEykJEInc+OtaunuBesCIFqpzdLOFOUTxy?=
 =?us-ascii?Q?ZPNHpFgV3NyvK3aCBZKEazB6AaNPvw/058wV2lqJxGGbmRwr50tEg5M/KB6V?=
 =?us-ascii?Q?4NwHoaf9FlWdBMHY5X97Tbc+flEzIWKzDXLUN5NinOXRzM2hqZISyFh5c4hL?=
 =?us-ascii?Q?1UBWlPlP6fP9ct2r8yqeWuQsdwgfhsXS/lIjTZWO+9zcKsncRVepvsjpwFQO?=
 =?us-ascii?Q?afziIky0PsEsK7szVMh51q5GbM7yu+DvuQ9mRw+CoeieDuTZGMEB68cRsF+9?=
 =?us-ascii?Q?Fa9i0IsR/uNWrBupIFLLDaiJDraMjB4CYHlspLyqLrA7nMqPBhaBYjyf+7xX?=
 =?us-ascii?Q?P4lCkHWfurerzJu/LpXNqlC6JLkR2MjjV2R/s2KYiQ9SOMUs8s4+82obuwBX?=
 =?us-ascii?Q?vucXag74XJNXjTCxY8WaG9/A1FioH11rGnMNMGZJ25xjopLQlq+izLwr63GG?=
 =?us-ascii?Q?IXKvDj8HYY8wYHRA3LLe1Q5xYZ0YYYH64JVLPz/W7lNplFeewECjbdKcmDt+?=
 =?us-ascii?Q?0hH4X8ocqrviH/m8cVmvTEyOsejkyTiRKhNew8QQyvPjbfOsi9Gou2md3iWr?=
 =?us-ascii?Q?qd9lfNgVC8quQcF2qn0WMLPhXJjVJA5l5xobB6w86mbqXkjDxtSb/Y6x0RCO?=
 =?us-ascii?Q?dXmNotc8h+m1Lad2AFVUoIVQanY44RXOdFL4Qb4s5VdlXiLBsvLV3SXNfyMn?=
 =?us-ascii?Q?9RnNr1NpN33skjY+mOZlyKkKMv0CSdJ8W8yLVueAXFGS1PmMC9D366h6OCiu?=
 =?us-ascii?Q?v5ZI6XB3J8AP0Zcd7jFV9JAqHnLy?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 20:09:11.3489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b44d068-09d5-41ca-3437-08dcbb0aa189
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB9421
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 20:09:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111780

Only include the lines from icheck.js that cover the copyright and the
license text.

License-Update: Only include the relevant parts of icheck.js
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb b/m=
eta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb
index 31c3534b8..63dfc6fa7 100644
--- a/meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb
+++ b/meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb
@@ -3,7 +3,7 @@ SECTION =3D "console/network"
 HOMEPAGE =3D "http://fronteed.com/iCheck"
=20
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://icheck.js;start_line=3D1;end_line=3D8;md5=3D4=
04078d7de9f05ed64d364274f790055"
+LIC_FILES_CHKSUM =3D "file://icheck.js;beginline=3D6;endline=3D7;md5=3Dea2=
5eee37fc3b14403e215bfe13564bc"
=20
 SRC_URI =3D "git://github.com/fronteed/icheck.git;protocol=3Dhttps;branch=
=3D${PV}"
=20

