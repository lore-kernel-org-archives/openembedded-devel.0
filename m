Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48F16D42BB7
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 17:28:39 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.46])
 by mx.groups.io with SMTP id smtpd.web11.92628.1731432510941867244
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Nov 2024 09:28:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=QdfRVQXl;
 spf=pass (domain: axis.com, ip: 40.107.247.46, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nL4Z1/s3PQafJxe43tg4KVd2YUEWc389FkVoheuJh8iAM1sBTVuKUgvSzozPPzlyifav7izscLRkY9kJ8G382j6o5W3zK5sPaEBTNpDdbPgmRhfbQLFlIKuojdBZ5A5qDPQnRv4xzD4EQ8c+JhsbDm5QTnT1lUOWprpVejMkVZrkONBFaOkhlf+Dh2ANy4/z5Iu/o3AhPEdcdYY4ZFN2f9ymHS0dY86cpuz03b49lShHidbBPpP3AwLblNHvl8alPF6O5/YEt5D4DgmFy0RYlmDp/Fdq5VtgCf8aj/lQuLfvjALBrbsURedU9fWFdwBtbZ4x85+5PdUCKv5alrn8uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJBbaTRAcCkLPjdV5GcAU+L6bDP3/OcUg7zzFcvtAgs=;
 b=OloPNCSW5kkPCdvCPW4C6h3sEIYalW6j1Ac4Z3rYW2exOofTb+3nupH0bv4YbfG9qnyKDR7j9F1Ivd9ZMLMFIRS4VDgDU+PVYAVf2jHxVR3qXylg/lI0Lb/lee+6KDt70njMiRE3CKpnbOUszboEen1jRtDF0GXWX1NeM56qmbnS16z5gULR4Ih4xQbpLXRViZ1TZn+nw8ISkBwKolEmGPn75HC/HwJdBE/zeLkuw9axxymWO5j1ug1G7tBhsjoYYt6p31vLcqKFrjRr0agHTsdPgqBmLpBMCO2bsoKGS4qAFuau4FMWJiXtoCA3bEnvwqoXjHHbJq4QiVMY/CnFog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJBbaTRAcCkLPjdV5GcAU+L6bDP3/OcUg7zzFcvtAgs=;
 b=QdfRVQXlURYk2xTd6ONlynq9FUDiWMpy3OkhqcsoeWtPXwQm2mgPSuzCCkKo2xmsmenjzK/I9kAUHMsboHwNxHIRvf0Tj9yoh87I33cUJig0c9LnrZr0PYF93x/YPEwHFEhCozOxkTrTxKASQ6wuShFtB8QDwAzh3L+PH7IX0YY=
Received: from AM8P189CA0013.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::18)
 by AM7PR02MB6210.eurprd02.prod.outlook.com (2603:10a6:20b:1b0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Tue, 12 Nov
 2024 17:28:27 +0000
Received: from AM3PEPF0000A791.eurprd04.prod.outlook.com
 (2603:10a6:20b:218:cafe::b3) by AM8P189CA0013.outlook.office365.com
 (2603:10a6:20b:218::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29 via Frontend
 Transport; Tue, 12 Nov 2024 17:28:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A791.mail.protection.outlook.com (10.167.16.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 12 Nov 2024 17:28:26 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Nov
 2024 18:28:26 +0100
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Nov
 2024 18:28:26 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 12 Nov 2024 18:28:26 +0100
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 038B0F0
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Nov 2024 18:28:26 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.17.1/8.15.2) with ESMTPS id 4ACHSPHQ3127140
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Nov 2024 18:28:25 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 4ACHSPv53127139
	for openembedded-devel@lists.openembedded.org; Tue, 12 Nov 2024 18:28:25 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] tbb: Re-enable hwloc support
Date: Tue, 12 Nov 2024 18:28:20 +0100
Message-ID: <20241112172820.3127118-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A791:EE_|AM7PR02MB6210:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f1993cf-23a1-4efa-7741-08dd033f6ac2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KzqsEbW3X0PVspZABoOq7KuPTpqfGIWIw2uWDm6UoAXzs9HAbpv3DU+rlLBT?=
 =?us-ascii?Q?sJcmN8LNgpqjVZ9xuS0DjmPYeerc9OWgvIl2bGqKFUc9IUlXpQtF9YfBD/4w?=
 =?us-ascii?Q?cUKy+IW7WtSQIOxE7LGMi5po1pEf/rKx7J80vR6HdTmfHYUD0mnptPFyRC5J?=
 =?us-ascii?Q?HLrk90PsnmlvZZ18g4zvwR4iXE3FkWFHsOnkqEihCihtLomJhaowZzSXbWsV?=
 =?us-ascii?Q?HxidKElA+3T67LWayWvnIYnDiEVgthY5FayvgDt4EJzKDRGGpubKAoO71bCt?=
 =?us-ascii?Q?egv3yIFRVSIo6RJ6uR2dd+UqlD4CfG82eYt9BhdUtFO9Khe2yFcIqTwWWHvT?=
 =?us-ascii?Q?omEFqqV7h9CU2ss+KF1atDB343xGeldUGrqH7OyWrDODhdTd7MCy82gDNjzr?=
 =?us-ascii?Q?X3ZE+ETkqW7CROeo3b3/gz1SUow506RZUu9eeQSlTetLCpJKj6zmHoAaymPW?=
 =?us-ascii?Q?FsKSNcEfP9ocmcA4uZ8yKlxOPlQ06vXiFMDBOWdyOJZHVBGD1jXLh8X+Hi2I?=
 =?us-ascii?Q?VdecVLkvrDbihuNB8iexuYvVdh0DybppvtG1x214YYzb0YInV1tlbLnFL3Z3?=
 =?us-ascii?Q?PjysxuMti3cPqxskUhIYH0fiSdavn3F0BKhBEZcinkGm/PX06sJ0tfHnFw4v?=
 =?us-ascii?Q?hrLO4JstaocZJ/LWNDgk1w3xaVxQHjbpYSIFwM9nwK0laUJFjPppH8KUhh3p?=
 =?us-ascii?Q?b4/b8fQ7QpxmMXyMt8EKDDqHg5MTY/1oKRYk8zh3aP8nnIuX668Cyr9bJH2s?=
 =?us-ascii?Q?5OLMLK01WYcs2UZQ5MWyqoIblWViVveDLGOaOF9rjDlXacb1bUgHWnHY3SO3?=
 =?us-ascii?Q?PSoUeAy1zwIHA/+j1mWc3qLI1iqcwWk+uJBkBo8/9SpbmPJrKfHaXe0lQiNR?=
 =?us-ascii?Q?mFx/8N1731CUkxpcAHdgIn8l07bKwtljRJov3LCA3VnPLLdJmPFgvOEOmIhP?=
 =?us-ascii?Q?kh0nhTibeL/w2j0cxC/hRMibkj6t9nrUVYRawG80g2zKp55rgt/gSBQV15VN?=
 =?us-ascii?Q?DCxbaH2oAMOk3ldoHKw9DO5hTKt76C2lF71J8KRTLnHNVQPvzKap0wcLAZO4?=
 =?us-ascii?Q?gT/i7VhiManGzCTyaWJUpPl3C+gLF48DZPhMRgp18+CMz3AEcVQxwZOO0tkH?=
 =?us-ascii?Q?/BVFbX8yTe+yqIShf+vLes4K72bXoQn5q67xo+O2WGLYdDbV+ditgexBgeoK?=
 =?us-ascii?Q?584L/REatEahUZxQCnqfy9VCEUUDKH6n0TN0lYYNxcUxwPAm2W9BBc+zyBh0?=
 =?us-ascii?Q?mgFA1UE9lck1/3AUI/FoK0bLFsLF43JHPmbOySB7NiNB3lCJsInPeE8gTmzj?=
 =?us-ascii?Q?u/3fasDc1qEp2Dgfod4W1lnpfM5GOTGhz1KGVJ9DCwJcfi1nW6oycqOu48Rt?=
 =?us-ascii?Q?xHgo1XXctPRkyaAwnMlunJdKFSksFCStNMLn3dadVLD7xeca5w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 17:28:26.4962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f1993cf-23a1-4efa-7741-08dd033f6ac2
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6210
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Nov 2024 17:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113796

The problem with using pkg-config to find hwloc when cross-compiling was
solved by upstream in 2021.13.0. However, the upgrade in commit
d8c5a72788ab0f2e36aee16e6d9e7555537366a5 missed that upstream defaults
to disabling searching for hwloc when cross-compiling.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-support/tbb/tbb_2021.13.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/tbb/tbb_2021.13.0.bb b/meta-oe/recipes=
-support/tbb/tbb_2021.13.0.bb
index e2b7543c0f..4d0f80ca8e 100644
--- a/meta-oe/recipes-support/tbb/tbb_2021.13.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2021.13.0.bb
@@ -26,6 +26,7 @@ EXTRA_OECMAKE +=3D " \
                     -DTBB_TEST=3DOFF \
                     -DCMAKE_BUILD_TYPE=3DRelease \
                     -DTBB_STRICT=3DOFF \
+                    -DTBB_DISABLE_HWLOC_AUTOMATIC_SEARCH=3DOFF \
                 "
=20
 # Hard-float 'd' ABI can't be used for a target that doesn't support the D=
 instruction set extension (ignoring target-abi)

