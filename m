Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C89AC021A4
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 11:59:11 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.37])
 by mx.groups.io with SMTP id smtpd.web11.9430.1739447946140083369
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Feb 2025 03:59:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=B5nI7QzV;
 spf=pass (domain: de.bosch.com, ip: 52.101.65.37, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HfGlX9b2E3K3ZgGq9czZvi17bQ6tcW2CtmMlVpwceswSk/EDnRMhqeqiyJDvbuDyzckVs5ylqRXsABFTxeagTwcGnqlq3aB3xx1rjSLT2xinTBZRtbosgQgkrtiO6ocqvyooi2Xsl62+8zcxwCI0C0Rg4ICtCxr9k2RgnFgbcjo8gaQfoZHwaCEga5UfPsb2wKRhVtBIkKmIXn13ClXcEMn2F7zoGGR5GsggwMs87za/IMh9/e7OCakdSViWPfOcku6+ntZJNvv0cYrhbKdaZoTeALVwPCwtYP6zLO2YZxO6+0eIw8nkCc+qnxarrQNSivr5aO+ZrPjYdKmUNL/M+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4A1jmvo6fbFJ4kIRHwJImX7jkqpo44lXe/82zNtNXDY=;
 b=LZkw3ZexAvb+djpvd4L2J9jyhHJdz3LoTQXZsUoc/dNfAYe55USSnK3SGN+q+lvy6/OqWHoOzRWzHuyNZcm8Us5AF+waKcdPMOlNnaRO1bDfHen0X22oePyf1RYWCm81U+Ls/UjkwEPbNhHLE1nxQHnBl3CUGpnF8pgVruIt76ghfnb3nN/HfCMd88PdkWjpr6rTnVb6Yq00PBha3/HQ70yYoQOORtAbhphnRmtyfWeDkaFSXONDR9h0FsqTToA9057bJqmutVL/3Vs/3mO9mViiYALNIwDH3yUSY5xGIAArhWy6L7FKAa/MaP8lwMBusBFvYtam+344OAFnLSqfRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4A1jmvo6fbFJ4kIRHwJImX7jkqpo44lXe/82zNtNXDY=;
 b=B5nI7QzVkGtn6AU0/50o+5QD5AzwM7qQfXIU1YYFciZQf339kUKHUQF14/yx1lUXBO/TFJtK6tj+XcFoQjDlQDfmiUs5AjA+KffofgLKVCTkuXrMr7l2p9VtJ/azC7Ds3K/5Q7e9PFbPJNi7P9KpfvR6J9rOmmbLkbC+XThrPCYZMYm/8O+NA6VrhokCZTj6LuzaMnowED6whSyvmOi9K2RRYrVqoyFJNTUDVZF0JPFGxvYKVbPZYmgJsLMAHXr4N7/V2ioi1EgUfozqf6pQ947ScNsHcP91qVIYYQT771Mwi1StqLk6LfkgpU7Ngvm3INhFZm6d+ch7neac4HKbRw==
Received: from AS9PR05CA0156.eurprd05.prod.outlook.com (2603:10a6:20b:496::18)
 by DU0PR10MB6035.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3ca::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.8; Thu, 13 Feb
 2025 11:59:00 +0000
Received: from AM2PEPF0001C70E.eurprd05.prod.outlook.com
 (2603:10a6:20b:496:cafe::70) by AS9PR05CA0156.outlook.office365.com
 (2603:10a6:20b:496::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.16 via Frontend Transport; Thu,
 13 Feb 2025 11:59:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 AM2PEPF0001C70E.mail.protection.outlook.com (10.167.16.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.10 via Frontend Transport; Thu, 13 Feb 2025 11:59:00 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Thu, 13 Feb
 2025 12:58:59 +0100
Received: from GRB-C-0009M.ot.de.bosch.com (10.139.217.196) by
 SI-EXCAS2001.de.bosch.com (10.139.217.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.43; Thu, 13 Feb 2025 12:58:59 +0100
From: <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <raj.khem@gmail.com>, <wangmy@fujitsu.com>, <socketcan@hartkopp.net>,
	<mkl@blackshift.org>, Ricardo Simoes <ricardo.simoes@pt.bosch.com>, "Mark
 Jonas" <mark.jonas@de.bosch.com>
Subject: [meta-oe][PATCH 2/2] can-utils: Split mcp251fd* into sub-package
Date: Thu, 13 Feb 2025 12:58:26 +0100
Message-ID: <20250213115826.38194-3-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213115826.38194-1-mark.jonas@de.bosch.com>
References: <20250213115826.38194-1-mark.jonas@de.bosch.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.139.217.196]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70E:EE_|DU0PR10MB6035:EE_
X-MS-Office365-Filtering-Correlation-Id: ed70b751-5f57-4c5f-a754-08dd4c25cd81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nIdD/zOmUpI4ck5m85Yf77kAOu0E1nKh2LoEX+6AB89MVrFMducpdHGhQY/V?=
 =?us-ascii?Q?c6zB+vHJFlW1zbvmmnt8QMobMZX4wKx08IInCP/4a5ws4kRAfQVTSEJr5OmW?=
 =?us-ascii?Q?izQ4sMjM6Ydy8WT5zJJHZUQje3dIiNWVJcWnZplPfWMjR2HUU0vI0D6yjoPm?=
 =?us-ascii?Q?2leUM7UirrP3bO7eAND9EMGsiaAnaqn8JkJM5zrgc6mF/fR148fWhORqVQRW?=
 =?us-ascii?Q?cd1UlFuPt1uK2d12KXoEZryiSAA+3bGyoE6paCqCyUf3WkzZGQ7d2UdFCSZZ?=
 =?us-ascii?Q?ac/dN2lC3mSCNTFfBKmgJ0Q3ClacwIQdThz/VvGjl+OmFPSNSgie1JzMRGTa?=
 =?us-ascii?Q?tDjuGqJQg+dmeU072X/TNxjtpohxm2RUHxzus1Li4BCYAGvpA/+1/vS2Ytpi?=
 =?us-ascii?Q?8W5YQLtzNq8oHSaQ0aNL2+HCXzRiRlkN8DMmjjPApQWKIpytJf3rUajcpRZO?=
 =?us-ascii?Q?qZOWlgBCiBqHfDPRUh4Xk2YDChGAQzsAyYOknnWWXqzxlWpD4MI29/b8LJqB?=
 =?us-ascii?Q?wmweOXyWZVYYIRPnH8/14UhnJdd426ZKx1gldavm0XhIkhX8hDmkFDVhyrXv?=
 =?us-ascii?Q?Fol9tq1mt6vIRZdRqjRe5Zlir0mfOLJ+yO+Ol8b6Weofdh4YwsCjw6XZIceC?=
 =?us-ascii?Q?376Lpw6xZ4txgdKRFJzb+iAUsLsHy5VptaDguPAPvGY5FJoa7IF3wlE+o4eS?=
 =?us-ascii?Q?X0KJsWJfbAoZNcrYD4VlZfTEzv9mMXmDtkTL4It5cYxntKulezOAr7hhagu5?=
 =?us-ascii?Q?PVd9EtM5C9PAdQT9uXK5IByfLoGy6ckpKAZnmTkGYg3SvaYrLwuulj2oChV1?=
 =?us-ascii?Q?SttPxjYgB0lRaVUKXKB3vTFQafOIgqd6+UFJ0eQb2/iFfzcxiay7PTCVd73j?=
 =?us-ascii?Q?+j8/Z68hApfUsfJyaJtrOTqEHqY9xm632WelmoMv2WzGlckS03Ol+V0j6HN5?=
 =?us-ascii?Q?fET/4pUcLGztAaIceR32teug+yopi8u5PpJp0UsL3TAQ/tsdea+9Go6sTEBi?=
 =?us-ascii?Q?tngM5U6mmqNeYZms2cwdpxpKSieJN5QBKGjxDzmiaRdai4U0mwZbkLHFVcC3?=
 =?us-ascii?Q?0rkoUJYO3EGmd/NIiZ+Gf/77cQDIJWDx7/hZ8pR4qXOHqKudga8o72+HA25o?=
 =?us-ascii?Q?YUHasMK9FW9b9Mr7Swz5vBcO5DUG80+RWNtKin2xSUy2BLLj1lAdfiWxNc0o?=
 =?us-ascii?Q?LIT85BWjhIZSIbesG4O0zxSeXO6JSdDX7uPTtQpUegTUzkdEoOh2+odiiTV7?=
 =?us-ascii?Q?KMOwrUSM/0JmdAtSpPsUfUw6/4sJlIAL9SZtr0J780gW/KH7/atvm7tpwG9S?=
 =?us-ascii?Q?PIVw8kF/vhLBnAZ/1wgxMc+AW86ifBXKcktpCjZ6YU6tmItpKYotWyyxpl4Q?=
 =?us-ascii?Q?KL1irT09n6liS/cTNrOqaR+Xd7f8YBScCALgKS4tKp75MlPLsbUGBtapT8Au?=
 =?us-ascii?Q?sQOH4LVpodacQKWQIk6GHs/wePnaOPLbi5ihS0f6l1emqellGRBiPEwgwx+s?=
 =?us-ascii?Q?3AeiV5YXRyEguOc=3D?=
X-Forefront-Antispam-Report: 
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 11:59:00.1180
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed70b751-5f57-4c5f-a754-08dd4c25cd81
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6035
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 11:59:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115465

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

The mcp251fd* tools are specific to Microchip MCP251xFD Family CAN
controllers. This commit creates the package can-utils-mcp251fd to keep
these tools separate.

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb b/meta=
-oe/recipes-extended/socketcan/can-utils_2025.01.bb
index cad41944ec..932aa1de20 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
@@ -20,6 +20,7 @@ PACKAGES =3D+ " \
     ${PN}-isotp \
     ${PN}-j1939 \
     ${PN}-log \
+    ${PN}-mcp251xfd \
     ${PN}-slcan \
 "
=20
@@ -56,6 +57,10 @@ FILES:${PN}-j1939 =3D " \
=20
 FILES:${PN}-log =3D "${bindir}/*log*"
=20
+FILES:${PN}-mcp251xfd =3D " \
+    ${bindir}/mcp251xfd* \
+"
+
 FILES:${PN}-slcan =3D "${bindir}/slcan*"
=20
 ALTERNATIVE:${PN} =3D "candump cansend cansequence"
--=20
2.34.1


