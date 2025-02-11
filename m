Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E084DC3DA4A
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 00:10:15 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.43])
 by mx.groups.io with SMTP id smtpd.web11.310.1739232613719793220
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 16:10:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=bZ9SBVmz;
 spf=pass (domain: axis.com, ip: 40.107.21.43, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W2Yun6paGYbtajPo1yBqILFuK0dIj5jyrvozQEHQXtvK6WgOWGy4NciWUNQL1pKGls3ZfffcBAYH6VScpSdJlnCBE8OFyWOQfmNnrl+tLQKbJkx1XqhBXcpqtU/vJDaZw2IeweYeyk+gXfaw3bAuN4M1D82WwdqvewBbN4GAQU59BKqgybL0ikziqIf0ik/AKn+kB38i+k2k4eN4C87eiPms2fqP+ESTHbkJAM/MDD5evPti1YkPSNND4aw4ld6dOcy40m017XYfDjyDdiLmAycrSVB8Mk8WMfA2daVkjW/ms+fYrwiX454O8WtOhPFGY8/jNbz1O7+V9V9SQzb70g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJBbaTRAcCkLPjdV5GcAU+L6bDP3/OcUg7zzFcvtAgs=;
 b=D6MRnFWnqg6RdOUWX89NL5T/vibFaV3OnNqWMRG7xBs3DeO0hKDKWr1eUhy0ez2XuOCiB3jyXMYP7o7wgeKJUqc8hvPGj5LghiqBKYZMlsEeBhfYdRe6+zvGxVDZ4qpQ5Am1YgPKfQg1g9+agi5NXYMdttpVToZlyyliO6O0lv7lXDHmI0X1rprwPiPGSihuDkBsYvAg+OCERvERJS4zbzwv2imcWWSZFT0bXfWbbPNMJp+vPhcWH3Pbb6gFTtfe+2g2OSn1+NtWmHAIajI2D2MuXe4+7d/npOkZfZOdAShM7J9EvhqIDqFKUWozUafWJ0CqvZAoohmwwWpnkm1rOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJBbaTRAcCkLPjdV5GcAU+L6bDP3/OcUg7zzFcvtAgs=;
 b=bZ9SBVmznfZbrk0PBfFiokCR5qBFaEskE82nYIM3Q+GlRnoUhs5erFQUoWUda7YRFRVNkiEGWbc21Wvb/dwRfJGFibzdo48NiiesG9al3/bsMVnFrneuEH9+HpTWsA2avN6y1uvqC7EPwuxbk7GMWY+gde2evr9htJBuAdiJ1p4=
Received: from AS4P250CA0025.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5e3::15)
 by DB4PR02MB9334.eurprd02.prod.outlook.com (2603:10a6:10:3fe::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.15; Tue, 11 Feb
 2025 00:10:08 +0000
Received: from AM4PEPF00027A5D.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e3:cafe::d1) by AS4P250CA0025.outlook.office365.com
 (2603:10a6:20b:5e3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.31 via Frontend Transport; Tue,
 11 Feb 2025 00:10:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00027A5D.mail.protection.outlook.com (10.167.16.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.10 via Frontend Transport; Tue, 11 Feb 2025 00:10:07 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 11 Feb
 2025 01:10:06 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 11 Feb 2025 01:10:06 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id CC7961A5
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 01:10:06 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 51B0A62u4178989
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 01:10:06 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 51B0A6j84178988
	for openembedded-devel@lists.openembedded.org; Tue, 11 Feb 2025 01:10:06 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [styhead][meta-oe][PATCH 2/5] tbb: Re-enable hwloc support
Date: Tue, 11 Feb 2025 01:09:55 +0100
Message-ID: <20250211000958.4178887-3-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250211000958.4178887-1-pkj@axis.com>
References: <20250211000958.4178887-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A5D:EE_|DB4PR02MB9334:EE_
X-MS-Office365-Filtering-Correlation-Id: e3bda40c-7dec-4ea8-df34-08dd4a30711f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CHzpLRBsd/t4RCr/eVGwoyDJCIrCML4uotzV81apyOZt42eyM7anpXwjKQuF?=
 =?us-ascii?Q?bcvrxh4sh4iduGVLywiEMzG1U/kx9ANCZK2SNGMtjBCXk5Sh7VpRQA/yzEaK?=
 =?us-ascii?Q?WtXU0yY/z3ENsGRxP5Hr497LQ5uzAL8CNAXnBCkarO4ammrO0izirD9y2lx9?=
 =?us-ascii?Q?I21NESxaYRJZvksz3M74S88ILJG7ahDhSGiptHi+qzuqOcxCKnhVy0h5bh9X?=
 =?us-ascii?Q?wbEV8Guad8nR8byoNJLEbrTx+hRaxTEay5C9sPpX8/paTzJ/BwIBzyKFGa+Q?=
 =?us-ascii?Q?cio30Y2auOu5wWNNKyC/QsLPhcS+w9N+xqtHNMUw63y8RfH/gWHP+3QhSYyL?=
 =?us-ascii?Q?chedlHKbmINAQXflWcuTRXTBMZkNyYnRIGlyjTU9ayG2PWIpnMr68DN8LElm?=
 =?us-ascii?Q?FFh1rG8ZCCOQiyH/8qtmoQi9+fCiqrDekQ4xSUaDWPQWikjbj2DB+/yiES5z?=
 =?us-ascii?Q?6MPe6QqaNs7glPFeyuWR0Q/SzLUcisF89YGLae2OFFJ/chrpKbeHB9sUIFbW?=
 =?us-ascii?Q?zPFyr4q00sdE5+aEzP8PF0B89Bs/b1pUug3mp1ffUWcPhU2RpQ0glUsDUMmp?=
 =?us-ascii?Q?aN/VwZfcRK9xY3g4DfNYSwNoOJpmrpQs4E+K4bQf9uglwWGhThMNf9zJ55Ej?=
 =?us-ascii?Q?UgSMCnapsoiDKGv8GBax+eeBYyTZNcCGoQKBextw5/25Vhsf8ztUAhyETAxJ?=
 =?us-ascii?Q?3PNQ7PzT2lm1bj5oKWGaT1/+NrSFQ9buJUCcFpOmgWjugl+ffns/6XkkM4AB?=
 =?us-ascii?Q?WQoRRkonCcawMzyjfk0yaaXVT8Phx7DaB85c+m1CdHa/3xjbb0ClnirIjSOZ?=
 =?us-ascii?Q?GMDph/FFfbX8wZMKtTB8XWeScOk1osWBcXciy7VEtskpySTztSISeEAKWRsP?=
 =?us-ascii?Q?SveK55OGsyrc68P7Q2gC+1IAFVmunY94G/DbSPdPT8SF//KTRAoX7q8YxPE/?=
 =?us-ascii?Q?QwKg3XDhS4gSkwErsNI5un2hN6py6qetm4neBc0EzUY7zPtgwtetmolVbZMl?=
 =?us-ascii?Q?p0t04gCWzOH29c5tIE4H0oOBP6jMypWo/RL+LKXFpsna6iGdJOgoUhD0c6Ka?=
 =?us-ascii?Q?GI74hw9XanryPsxg6ZYz455rtcm6goaHvjjB1aoIvNUes7bLG8xlv1br+xz7?=
 =?us-ascii?Q?xgnZOgR0AKFkj1drqoWBrWfvCJok2BY6xtpamHGgIQZDnLU8YgrUvDVrl1JU?=
 =?us-ascii?Q?yNUJXsMibFnYLAmiKE3Lb9pIJnGcJUm5YSF6I+6vbzERMeJ+QHkDd0ELytqu?=
 =?us-ascii?Q?thLwqCgS/y2hjDwttcIzTRkyU2IG7JFP7abpKWNYEC49P72owMGobhYSY/nA?=
 =?us-ascii?Q?0ykEgPLZWPAymPhJ0O0OmptSue5ErKhvhD9NLvsedEwzIMSwR7NjaJItnmqa?=
 =?us-ascii?Q?Sj5xJYuDKexEyODMdnJF0lmXMrm7jalAP0Yg1edkYU/s5ao2N8id2dxHa9Ga?=
 =?us-ascii?Q?YYiPLY0s+YAL9bVzQiS6+zy+XK4Q43HE8CSthUcaWLkX2Rq9WPUcRf3ShQr1?=
 =?us-ascii?Q?IehC54OyzoL7EcI=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 00:10:07.2809
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3bda40c-7dec-4ea8-df34-08dd4a30711f
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR02MB9334
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 00:10:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115413

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

