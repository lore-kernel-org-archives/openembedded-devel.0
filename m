Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9623BC02181
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 01:43:59 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.43])
 by mx.groups.io with SMTP id smtpd.web10.6703.1737423835290308937
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 17:43:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Oa1EIwEH;
 spf=pass (domain: axis.com, ip: 52.101.69.43, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k+/DdfhbklFtRaumGTzC7ay9kEtU26GyzzFkd2tSW9Y27yEZQin7Y1V6wOEwWMewBGnzL5+5MmWgQqbHW/Cz+/0q7nOQRwCRiUGUwlRKu3aYrZmxSSd/nGKbg5HM6MofE/qFX90mg8xqFXfIYgjg7cEqZoIrkpv7e09mSJwyxB8O1H0EAWPoas2ur82n7UN/P476ezGIjtPolq7WMTaqTq0VqXh5Bt0F2i0EXUgM4D/NyS8Wy/Kq2LCVqaG45Pvk/5Jotcg6pdVH/2YEVLhEA8LORA8rvYeVUZWTjGvkkhHLLyrcwGAOiqfuLU+GrR05JiwwRk1SsuujWNS/Crv9SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CdYO2Nt+5K+lQ0otedgfNOxUatZOdSAzpoJvSUe4qeM=;
 b=UmOb9RB+x2SXKiVWGQNLqHVxiRIZUxJ06aCRwxB/dyB7FW1zplRplMaxlABcm1OZYg1jJO009Ft77Hfzgcj4DqHlXX/1aw8OMQsJChyWGtroXR6FaBlgVf1MEPs0ZFyK14YLzuBVw/YbyqDxCQTeyyJ86++T47rNOU5Tz0qMwecB2yCzJ1M/+Ti3UT6tknPQh2B/WEifz4Ki1Rj5DewF+p00AI/GqqChNHalPSxBwV63HBaBctYKWxWJqEX5el9gulauviCkDsPu4SKYWCv1t5u2DAI4MRkLLPWskcY8KM9gqTyNkCG4dEzsA0zG0TUGY8BVsMXUQ/6zz8H3iUh7zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdYO2Nt+5K+lQ0otedgfNOxUatZOdSAzpoJvSUe4qeM=;
 b=Oa1EIwEH39vDFSIPr/T3bvKpmKD+KtxKXiJ3GTVQELXpqIhvqYEg37sUaJbmqns8L+0U+ZinlyNt3b3PnprP9KmpVgX/EfQLWDK0AuUEWkNFCFftQ0VKB846iURZE164aCCzvfcfmA5EI5yEaIvfMOFZPdcVCTJLOETbAALtAfw=
Received: from DU2PR04CA0312.eurprd04.prod.outlook.com (2603:10a6:10:2b5::17)
 by PA4PR02MB7021.eurprd02.prod.outlook.com (2603:10a6:102:103::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Tue, 21 Jan
 2025 01:43:51 +0000
Received: from DB5PEPF00014B9F.eurprd02.prod.outlook.com
 (2603:10a6:10:2b5:cafe::d4) by DU2PR04CA0312.outlook.office365.com
 (2603:10a6:10:2b5::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.23 via Frontend Transport; Tue,
 21 Jan 2025 01:43:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B9F.mail.protection.outlook.com (10.167.8.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Tue, 21 Jan 2025 01:43:50 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 21 Jan
 2025 02:43:49 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 21 Jan 2025 02:43:49 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id DA55D24A
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Jan 2025 02:43:49 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 50L1hnZX289856
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Jan 2025 02:43:49 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 50L1hnm1289853
	for openembedded-devel@lists.openembedded.org; Tue, 21 Jan 2025 02:43:49 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] php: Define ACLOCALDIR
Date: Tue, 21 Jan 2025 02:43:44 +0100
Message-ID: <20250121014344.289823-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9F:EE_|PA4PR02MB7021:EE_
X-MS-Office365-Filtering-Correlation-Id: a0fc8624-1892-4a9b-da20-08dd39bd0e18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tUM29ZCMk4h8APxgqRW1Ld/hZQm/4GmTN5LCicL9BJvGYeQUfMuLdwQor5F/?=
 =?us-ascii?Q?H2rGv9Ox/ymdmYtltE0eHdLXu3+wyQ0OZrN9he/JHy0OhxCmhDabrkPK8ZyD?=
 =?us-ascii?Q?tRlIFS4qk0eB0PPidleR9N5seE0hQ9tuFJMIFJcUOzm9HiYA7+ydrXx3uBDP?=
 =?us-ascii?Q?DOi/rOPqELMiV4AwXLMBLcaNHyqfI9I3DGcz21L2S5n9g3X4RzvaKz+Q+ajH?=
 =?us-ascii?Q?UL+fqdfgNcUbtUCR+updIP3unyNdeXf6J7mMkl1m+Ra3ohia1QyGdmMN6dbv?=
 =?us-ascii?Q?seae9kzUnucPpUnYS9qImn4NGZqmUMCeRCaPUNowkkCGkt3TP8MjmjS3e0OL?=
 =?us-ascii?Q?2fq6barGiBzXA2rHjwdSg9g5GoACncI40EFEyFHjVjiGm2aXTQyebqI7Uh/i?=
 =?us-ascii?Q?sUv76pi7OGKbIksW33SRS6TC/p5mORpgnwVgZbDyn4wI3rbOBJUXgOrXDUbF?=
 =?us-ascii?Q?3xTRPjRYmq5keYWuTNGHFhakcXEDNcvV6QXtaySEvVyX5JSLfMLFsW+bCfAf?=
 =?us-ascii?Q?4dq/blA7DWm/K4sDfmiJ1Fo5zVoktegf/JZXvfgWdmmAN+jtAyD5TWXxofJV?=
 =?us-ascii?Q?D17zlKNFzKVHLGCOcWM3zEm3hB705a/4irnh44m1ynoMgrC92TrcArytFfxK?=
 =?us-ascii?Q?//1nhdo2YpDsKhRHtKGJtylGwwvuP+nliVotz6FjkWpAQm9uGTJ56EIX6VWp?=
 =?us-ascii?Q?EOYOi5ulyHnkr/RmesxIjxOxBWz/ei970dovVhL0FifLBBxw3DeHxarzvln5?=
 =?us-ascii?Q?+V/7FtLUEOj0QxpSvatWdI332obr5lhlfMVwszB7m6vc/DtTFFXR+q5g4UCj?=
 =?us-ascii?Q?rQ2WbKHvQWMjTvb6SV+OxkZUQenEji3JCFvyqASx1tv6x7I133bXdIJMl9mb?=
 =?us-ascii?Q?eAiMynbF4tLl3MKIGengbzZcn0HjZO6Xz345ZtjkPOpobrRN9yns2OJe9XAf?=
 =?us-ascii?Q?LsYlAl0vcqPDiNV4t6Zw9SJ2ZoVfiUl9goVGGOMXD37Ugk4ZmcNdFJF7urEF?=
 =?us-ascii?Q?8lfX7biKiMODAEARt654SfPHl0xXFGU3ZVy60G1HDKtkvcZgjlcOTwNaKgnV?=
 =?us-ascii?Q?YxgUS5/UZS9m3STgrX4kitoNs4PYYD7l2hKE9+S+6ZbFqQiTcb+ON2AX+oGY?=
 =?us-ascii?Q?bPVuOPfHzO3rASe4hnMB++EUt8rIFLTPF6vdMxmJdJJsgSdcHQB0hNEWBRvz?=
 =?us-ascii?Q?/cz8pxpLyC01T+wAQkVZ+NMfKn8hoab77d/pmzWAhw8GwMXzR9LGizREPp+G?=
 =?us-ascii?Q?YdDDYocgRqvpEKSQif16EUjR/5tVjg41jmfR1AsqvGvbpnIt2A1YX4kLqcuU?=
 =?us-ascii?Q?1p6wtKRlSe+c0TKg108ZvK4m++P2O371O/3Koewxk/7BwPdMJgWfKk5UkKUI?=
 =?us-ascii?Q?ap69aKS0iH6tHqtXJK8RD8USyXFLMMNQbUVswHC8nxYKZKlSumOzItLxTjgx?=
 =?us-ascii?Q?MvsebQFOMLubqVt6AITzxozrXMcogH3gr2mNsRDc7KXD3jDI8ghP96plXE77?=
 =?us-ascii?Q?l0CoXjGlq9DkUak=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 01:43:50.3965
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0fc8624-1892-4a9b-da20-08dd39bd0e18
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB7021
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jan 2025 01:43:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115001

The common definition of ACLOCALDIR has been removed from OE-Core.
Add a local definition since it is still needed.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-devtools/php/php_8.2.26.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/php/php_8.2.26.bb b/meta-oe/recipes-d=
evtools/php/php_8.2.26.bb
index f5e57ab36a..61b127373a 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.26.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.26.bb
@@ -162,6 +162,8 @@ do_install:append:class-native() {
     rm -rf ${D}/${PHP_LIBDIR}/php/.[a-z]*
 }
=20
+ACLOCALDIR =3D "${STAGING_DATADIR}/aclocal"
+
 do_install:prepend() {
     cat ${ACLOCALDIR}/libtool.m4 ${ACLOCALDIR}/lt~obsolete.m4 ${ACLOCALDIR=
}/ltoptions.m4 \
         ${ACLOCALDIR}/ltsugar.m4 ${ACLOCALDIR}/ltversion.m4 > ${S}/build/l=
ibtool.m4

