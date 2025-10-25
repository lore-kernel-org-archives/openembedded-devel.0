Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2FC9CCD1BF
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 03:18:23 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.47])
 by mx.groups.io with SMTP id smtpd.web11.731.1761362299560797782
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 20:18:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Ua79AftD;
 spf=pass (domain: axis.com, ip: 40.107.162.47, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H2R2/yUNWscMhne+LUkkqq5o9JZQ2RY6sRLSMqbr8AgUmqpk8tNlF5CL2cSgJopoI323T1QCoFEpPC8IBEd3yltDYRSyrDFhpd0FK6Y5kKKN1I9OvbJMH1QIfaQMwPXRmAP7CS6KT8aaSXTw/CZNwkpm8B6GPzHJMZRE6rpXcXsbJEd3XJWwOp8snBoLL6mdqrGW9cZeJFsX5VEFeWYAu9+tiN14lClqr75+2vBC3QQOqC4nbfICW1kN6Er/TTsvukDCMpwsxrRK4G77I94HWGbEqQH7zPMH7M9JqQRXWj/Q7cU4yUPuT2kCWEL19k9/ZDdnak5xub1qYI9L69KgXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PE0OQdtLiPlVqAk7schOVrzA6KFQqn35ce54swsyJHw=;
 b=weT/z69j/YS+LpTdjRFG3iL1q75AiS9BJCwqYN6Q1jvGblNOmn/D9DhDQZnnD4GcawICVoGFToKPER3cYHpHmzSHp7Sq9kD7cjo4SvIMvQ7uAK/sVh4ysFdwz/0YkHRhriK4O5EClxMawk2KSRFhETSFw1gUwvchlDN9Vn+uNEgNJGXtrwLAo3LWNznVVJOWFaSyAC7wXqUIAMQ0nfPCNaNecjNoSK6HjTjm+UFfpZTE+S7UThEzakLL9A+mBslgTwhtxNNR6CGXTaRhAMejP6H8OWCzOxq5NjT8JigECTFe8BeXy7iiem2bawH0UhcJa2nZV3eJB09R9BGzhoYNgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PE0OQdtLiPlVqAk7schOVrzA6KFQqn35ce54swsyJHw=;
 b=Ua79AftDsg7lAjoWKpbbyeGLZZG9XbakyZldLtFTUthrXvsVsfcIQWbJ57lTvjt6sbSksPQhqpdOhSLVHmck3eF3T1jO2KPcByYX3cxs4TdsQNQ4Zx9sU7e/jAloCOsqzG68eCvsJkQlG0KpbA/7CzfrqGe1YjeG5jadQF4x5wM=
Received: from DU7P251CA0005.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::32)
 by AM9PR02MB7060.eurprd02.prod.outlook.com (2603:10a6:20b:272::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Sat, 25 Oct
 2025 03:18:14 +0000
Received: from DB5PEPF00014B94.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::30) by DU7P251CA0005.outlook.office365.com
 (2603:10a6:10:551::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Sat,
 25 Oct 2025 03:18:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B94.mail.protection.outlook.com (10.167.8.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9253.7 via Frontend Transport; Sat, 25 Oct 2025 03:18:14 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Sat, 25 Oct
 2025 05:18:13 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Sat, 25 Oct
 2025 05:18:13 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Sat, 25 Oct 2025 05:18:13 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 2B5002DE5
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 05:18:13 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id DE457122055; Sat, 25 Oct 2025 05:18:11 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/9] python3-pcpp: Add recipe for https://github.com/ned14/pcpp
Date: Sat, 25 Oct 2025 05:17:40 +0200
Message-ID: <20251025031748.2728416-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B94:EE_|AM9PR02MB7060:EE_
X-MS-Office365-Filtering-Correlation-Id: 11ad74f0-9e6c-47b0-fcf5-08de137522ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?B2hl+hRu0hmgu3z1fm3hTPCuiHBfarkBmtb35NDtXVJJXHfaisN6Rub6hJb9?=
 =?us-ascii?Q?JiUBxExzckUvTanrIaXKg97B2GZqNdWkCS+N6jzm857l9Qu5eVKZM3rnzh0T?=
 =?us-ascii?Q?My7k77YouBW2eTjofg/1XgRxZ+LYWahAVCIv7EPRv7qPU7AQMXrIGAhfKgfN?=
 =?us-ascii?Q?64YX0069NhKeSJRS6JFZjM7yFdhJRY9QyMFXBmsRM0gnSebGg19+BhUgG0vS?=
 =?us-ascii?Q?IN25uHje7qRmrybnrUJQd7yYM246xwk+P7L+PloofNgDRG+UIXqBhlabQUt8?=
 =?us-ascii?Q?wXOtb0xXgwiGBpJb76aDCSIG9zPzs3nVpCejl7Tj8xLQ5Pi9fNDMrbsZ3DSW?=
 =?us-ascii?Q?YkviKbuX5lJHiu4hWXqvoeGO3p3ttTIHeOf9/306eXg3yq+qS5XrE83BGf+0?=
 =?us-ascii?Q?s/IfIL+kyHi7075tVvgTrq75A/ZVFJ0Q/vhZv8NPHXUy62UiipJCMy4Q+e5P?=
 =?us-ascii?Q?eVq1EcSZtXWCpV+dU2oO8UM/5EJs0jzQA8IEmvFnEecA5b+nu1JyF0w67cUL?=
 =?us-ascii?Q?xZfFixL31xJYNVvyMX4eReC9osb2RfJWRZy4rS1JcDMZaPuSAuHscfrTk2FC?=
 =?us-ascii?Q?AF6DeUSwmfE5Djizce8yeEvgR4vee9tZJDHbWhw7ue4azzzDZANyQblDYAkU?=
 =?us-ascii?Q?H2/VOgjEA0pA3tX6Us9TmKgFqtPUJirlsrUDRlCGZTuldX2S9fpNAJsKb0AO?=
 =?us-ascii?Q?GcRe+PCzKz6QnVgkWDMH93+rMEzYmmQMRldShpPgtyZdGgTgOqi/9xxbzedr?=
 =?us-ascii?Q?OhqifPSvOO4Ma/FE9AIeH2yO4ULDSCWHJ/RHy6B4/hCXYMHZdgtUah3hc1T1?=
 =?us-ascii?Q?Rq3TU+uu9UQEN51WfoUoj6xFjgKBLL0y9ViadGZQiFJOlgzqs+c9THdr2fSk?=
 =?us-ascii?Q?P5qZthgiMOl2rmiaEV4VeE34dtnlIKNRE1OeiEj8JYP6FVG6c/aA5G8Ruz1X?=
 =?us-ascii?Q?iC249qTqt6sgxCWIAelRuPj4SoFmnhbIMcR56xYpvrAO2cot2RDJ5/NpJERp?=
 =?us-ascii?Q?cad3CfTPxA93spGAvXLQM1t49YIpJp/X9QHqEUQZaAQPf3XJbTVlFhiuyiJS?=
 =?us-ascii?Q?SRBWr1AYtqE5l+8WEDQDidnWqqlsmuixEYjnQTtYaICexoEqwXsb3AYtCfvs?=
 =?us-ascii?Q?6GhdsuR/ckVj/Q9mnIPyCdB/3bJVK6LYqKLhccwl4BTXIOrqE5I3/2eIPNsK?=
 =?us-ascii?Q?i5Bvn6QT9GnYDk4Q5qiETRgbsxcOrnRID17yb5u3Lw1kDcynHmmT2A6FmYYS?=
 =?us-ascii?Q?NrvrOq68tuvkPQdAGyDDpLqkiJCso7Oh1MGWw0bNSSZ83dxg/qrSN7/xZ1oM?=
 =?us-ascii?Q?SFlopuOI3i488kgUNkOPxiKmSzQ5A/CDttLzFb8/66YsFuDVKTgxiD1Es1fx?=
 =?us-ascii?Q?D3HoH4TlCO48cKOJf2QInlWmCvUcI1enRizlbglCV5nn0rXBXBYOpPMtL/E1?=
 =?us-ascii?Q?2djzrce67tw2CHMQR85jel+KYJLHSvPd0pnSq/U767DkQbBjBRrgZ4x6azcL?=
 =?us-ascii?Q?kpvbrrweVMgrcDvzhyqfGehckrigLnmn0cG6yA7Peu7SmR8jDLd6rqJyZYny?=
 =?us-ascii?Q?KW75C9O7/BM8cfyOEfE=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2025 03:18:14.6606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11ad74f0-9e6c-47b0-fcf5-08de137522ad
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB7060
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 03:18:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120976

From: Adam x Nilsson <adamni@axis.com>

It will be needed by lvgl.

Signed-off-by: Adam x Nilsson <adam.x.nilsson@axis.com>
---
 .../packagegroups/packagegroup-meta-oe.bb           |  1 +
 .../recipes-devtools/python/python3-pcpp_1.30.bb    | 13 +++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/python/python3-pcpp_1.30.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/m=
eta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index eee4e096a9..b331fbebe1 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -280,6 +280,7 @@ RDEPENDS:packagegroup-meta-oe-devtools =3D "\
     protobuf-c \
     pugixml \
     python3-distutils-extra \
+    python3-pcpp \
     python3-pycups \
     rapidjson \
     serialcheck \
diff --git a/meta-oe/recipes-devtools/python/python3-pcpp_1.30.bb b/meta-oe=
/recipes-devtools/python/python3-pcpp_1.30.bb
new file mode 100644
index 0000000000..97891f4250
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python3-pcpp_1.30.bb
@@ -0,0 +1,13 @@
+SUMMARY =3D "A C99 preprocessor written in pure Python"
+HOMEPAGE =3D "https://github.com/ned14/pcpp"
+
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dd3c12e3df3b040ebb89409b40ff=
32b3a"
+
+SRC_URI[sha256sum] =3D "5af9fbce55f136d7931ae915fae03c34030a3b36c496e72d96=
36cedc8e2543a1"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} =3D "python3-doctest python3-pickle"
+
+BBCLASSEXTEND =3D "native"

