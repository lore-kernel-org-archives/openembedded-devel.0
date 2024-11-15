Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78497D6DDF3
	for <webhook@archiver.kernel.org>; Fri, 15 Nov 2024 12:20:32 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.26])
 by mx.groups.io with SMTP id smtpd.web10.19614.1731673226039541130
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Nov 2024 04:20:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=LJtPtRqS;
 spf=pass (domain: de.bosch.com, ip: 52.101.67.26, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZWveKL7VvmIdYjvaJV1FNcRSbpJHgURLHWHteNru3aAYFJfU1zlqoW3QiYdn5T3xPkrmo2AsdrDaY7weAdwDTOfpSNa4uqb4MYYdcJYFpxzWymyt69R6xRX5C9Ub6ZFbtbLwZY3BHlPD4s1v9eLVvThYDqhPlcfxKkPIocji3A86J6YCKVbdg2jdAHAb4SQT5GTTJRHiUkyn5nPeJSO9aDydKxmPMTCs83eroXwYr7T1sSAxim/qdc/oJUX9w83KqpVFyHbBq2GO1dVAZGIBb8MvlqtG4FhcMG0x71KieldZabjZnJaoynduDea8rliHGUbWvlY27MpnIrtJBKjrzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SB4mM2nc4KbqJckHmaSFnr2E7NEF/C0g3N8Qim3nN5E=;
 b=aI9VyEpsNw2YV5NPhnnwLKninyo4SfIU1cW/BocV+UR8RISSQ1owpDFip626bGuEa5B5Efr0FylFOai6vhzcUqOwJOLf1feNb6MocF3oCU8Dsy2dqaPabVEhpvZhrIAymED2lwNUhpAZAFdCM9igJRT8zEOA+j4n9HB22RhXkfNaqfH8GY87C39E6bkk7M7HerFtWqZMCMSp6epKm2vqWr3qJTOhVKZdKz208WGSa0jrs9JpJrHhviBEUDRQgjIrcylm6/Qs648/TOIapHuHtzfTB2J8W0VYDOP6htGo8U7HliO8cMmmY1XTqsukzbmVuMtXE1B0pgzo9JaixVrx9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SB4mM2nc4KbqJckHmaSFnr2E7NEF/C0g3N8Qim3nN5E=;
 b=LJtPtRqS6quXRPZ9roCYTgGdUQZe6nogT8sYFhRl4UCwWfsiSO0tBuL1TO+wp0JOV0DolveHeL0JnU/6WeX4VsF1O41A4pgI7teqbVGXLr42ZKjyz1V95F7OtEL80Xvg1k5SnOSOJNWRQDJQ93bParew793WPfFcBw6QrHv2yRt2Wvn62wi7bX9U3JTE0b2I2FIXx7Boc6PRNtkD5rddZBwbfYYsNidfFasKW0ssdlXCW4q3mSvBsulypV0NEax90X+YDFlWviHz79t9iU3Jl+MS8swZANY7jW6hW+UY1E7EpKynUTc6uIZN1XkupIUkV3VLmIosIPH5HQa0xUUf+w==
Received: from AS9PR0301CA0014.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::21) by GV1PR10MB6540.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:84::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Fri, 15 Nov
 2024 12:20:22 +0000
Received: from AM2PEPF0001C70E.eurprd05.prod.outlook.com
 (2603:10a6:20b:468:cafe::70) by AS9PR0301CA0014.outlook.office365.com
 (2603:10a6:20b:468::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17 via Frontend
 Transport; Fri, 15 Nov 2024 12:20:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 AM2PEPF0001C70E.mail.protection.outlook.com (10.167.16.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.14 via Frontend Transport; Fri, 15 Nov 2024 12:20:22 +0000
Received: from FE-EXCAS2000.de.bosch.com (10.139.217.199) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Fri, 15 Nov
 2024 13:20:16 +0100
Received: from GRB-C-0009M.ot.de.bosch.com (10.139.217.196) by
 FE-EXCAS2000.de.bosch.com (10.139.217.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.43; Fri, 15 Nov 2024 13:20:16 +0100
From: <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <raj.khem@gmail.com>, Ricardo Simoes <ricardo.simoes@pt.bosch.com>, "Mark
 Jonas" <mark.jonas@de.bosch.com>
Subject: [meta-oe][PATCH] magic-enum: Upgrade 0.9.6 -> 0.9.7
Date: Fri, 15 Nov 2024 13:19:56 +0100
Message-ID: <20241115121956.5037-1-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.139.217.196]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70E:EE_|GV1PR10MB6540:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a906daa-f891-43bb-1e42-08dd056fe068
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?u4yOa2phY5frqVnNnM8+BY0CGoHUAFZuNFAKM0vQncoWqUJ+J6kKk2j8OOLQ?=
 =?us-ascii?Q?n0WXSZXab8DNMYH7KHjR2pWNaQ3+l0kSEt31nLsa8UfttDz2bpLliUB6qZy4?=
 =?us-ascii?Q?jICzwPKu/WLyhosKHXSnigqMBOxkqZSynHUrZOwyV7mWPujaIA59QG+n0S57?=
 =?us-ascii?Q?z5DgwSZxF8ay1kLOpUdnYRqKqB+2GsngoapiIIMvdyFwxEucCPLHepYGUPWj?=
 =?us-ascii?Q?uP9XZNKapIlpxN4xgwTp/9v8C1C1E8d8ki6+oA3DP1oJ0CtDhbmsc98UebY8?=
 =?us-ascii?Q?wEud2t6V1ETsOUHCMk3lqMI2FvB0yvBRSvYN+jVTqoivNxqzk/hBkstjIhgt?=
 =?us-ascii?Q?Fgt/r1iD9u8XAkKAiJc0nosJIT/issOKRu7v9MTV8oqIReff1g8/s62Vg2ZX?=
 =?us-ascii?Q?qmpmL1CFJceIctK0pkPPCeRUhVDp5NF2QKgr9TwmnMnG/AR8uo3d5vzqTLY5?=
 =?us-ascii?Q?o/NlUVij3Qhd2vvHMqd09ij3TGr03pPTkYnAKan7tHnNY0OU5xLqbMyhheZ+?=
 =?us-ascii?Q?Y/MVnI1C0mE0Ma5cAG1S2pV7Tq3xL+JlhCrlrieaw7Q7BYv3bSuK3bty/IB+?=
 =?us-ascii?Q?0jZKSkpRUiNFuyC0+sNtdLpmq/KOecisjVWvx1iUbviblQdkjDZlGuC+Kgci?=
 =?us-ascii?Q?Y5tdkIsRqC4KvfByfeMKs3yYieusGTONBIoVVsMg4yD0X9W3gjpijHlMAzB1?=
 =?us-ascii?Q?0r1ZgEzJBGqxjn+axp06GSCL5F0kKGCqOPLQ87K0/nvBj/AA36A2R+Q/fUvU?=
 =?us-ascii?Q?iPNDWA2yXI6X9ypm/UMfsC+57oZFmX9RUqL8XdV4QIkSCvf9EWekGocc6pOJ?=
 =?us-ascii?Q?QYj1eQMIQFdiJNgKjjNhAfUG2Fdn/EXVoA0Je2xzKJfo1LZiL9sVX9GUR140?=
 =?us-ascii?Q?9KittZkSOxsULVQiDHxafs5p8kGzBFddq+JF39Z2euJcvo1/q5nodvOrAzBD?=
 =?us-ascii?Q?kVri684Q9S0HIGxiASbZyUUq1W3ddhU6rAQ7bP9vKsmb2viUV4AgWKD+JKz+?=
 =?us-ascii?Q?BTqKUvVjH8BRIP+qncwU75yrhF/EOhoUXHzvQVrUbmj6ANENKGEJu/ZQK6rn?=
 =?us-ascii?Q?UVYDIwyIhyUUwBVoBA2tp46Ec4Xtlk3nkee3NS46KkO4wZwn+7uOhjzZoefG?=
 =?us-ascii?Q?zNMVt80EvXe5lReF93OPl0VsQPCuUGL1NGdZcxZDdFmL0vXD/9FGZNrhs7+9?=
 =?us-ascii?Q?GqsjeXeYmG+h9GvVTkajGm7RbuTEX461DM9SXcaK6CfoV8Px2j2c1rE9DogV?=
 =?us-ascii?Q?mbjl+21Z8hjfF1XDLQlFButugRkcmpEKm2ioc+xnCxoRghorlK2sAPOJf5hj?=
 =?us-ascii?Q?qcYiO/nBsQMq5Jvzfkqby+3VAlKweNNqRdA6/L04ms+MTZjsN/eaybUbTlWl?=
 =?us-ascii?Q?nNIW5Sbqm2aRY8TFeqBtX/1kRoW+E/C6cqtFczFqexyYTY+Mkg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 12:20:22.0282
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a906daa-f891-43bb-1e42-08dd056fe068
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6540
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Nov 2024 12:20:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113851

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

Changelog: https://github.com/Neargye/magic_enum/releases/tag/v0.9.7

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 .../magic-enum/{magic-enum_0.9.6.bb =3D> magic-enum_0.9.7.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/magic-enum/{magic-enum_0.9.6.bb =3D> magic=
-enum_0.9.7.bb} (95%)

diff --git a/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.6.bb b/meta=
-oe/recipes-extended/magic-enum/magic-enum_0.9.7.bb
similarity index 95%
rename from meta-oe/recipes-extended/magic-enum/magic-enum_0.9.6.bb
rename to meta-oe/recipes-extended/magic-enum/magic-enum_0.9.7.bb
index 01a134a5b..4557ed0a8 100644
--- a/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.6.bb
+++ b/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.7.bb
@@ -16,7 +16,7 @@ SRC_URI =3D " \
     file://run-ptest \
 "
=20
-SRCREV =3D "dd6a39d0ba1852cf06907e0f0573a2a10d23c2ad"
+SRCREV =3D "e046b69a3736d314fad813e159b1c192eaef92cd"
 S =3D "${WORKDIR}/git"
=20
 inherit cmake ptest
--=20
2.34.1


