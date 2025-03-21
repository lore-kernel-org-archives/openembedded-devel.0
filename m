Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B8C1C36001
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 13:00:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.20502.1742562024727019510
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Mar 2025 06:00:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5175c14ca8=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52L885n4005889
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 06:00:24 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2043.outbound.protection.outlook.com [104.47.70.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45eprrd1am-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 06:00:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c9fgXz+opwa7olxx7R/fDPbfvep1FJlCauQCGAKDCMVTSoiVvINdphXWBjlLDG3NDF+R7lgGFzl0AAUZgyIIu9DxdkHMptuh71wa8MJdFFG+A/y0dfv03HzS29Z1L7CNuRA1oIupLPnkMWZ+qFg2wbAv2tf0vGQsTiYhLOh7oCVH6OpiumzsYnBHzdr4o3P/fbTOk2iBS9Ij0i/pD4A/b0vIseEcpUGWn7rWrW/b2LZCukzclIksZQTL2V0Kp0x22n0PdOmwX6LohV8c7Xc5xDqHrjETgQcXSPHrk8f82LZ1hnREAGpYNCPALvbKeDMGk+L7c8jqxyc2+kmCkjU97A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rdV7XaLtwfFyXwqq9Zem+uVQIT3kAB6tQ7FnzEbyDU=;
 b=B/FnLkhe8+48tShJi9AGP0y1TCLgeh/pXTbZbVy/MIzE7r72JPpA274ht5HzraF21ZR4DcVt9LK7kYxjPopH5QzafTXe5kSF1wgpblkNRdcimnScgLuTmXtRYBrF/OD/hv+qpOzeKFPFzOzH1+MrbjCqA9rfriBgya4eIij4Cq/DFItmBu4GYjWONKroA4HH3h1EX+RtxO68CGjwlffBg3ml5wJitC0qGp1jT5gE0h/G/VKYXkYpXShWA+Hetv8kIrAnfB00wR7qb+NJ0kW11Hb/Vw3JdiqhHDBjFmKVmNSNM/M1QYxY+le8t24DBlFvAe/++l3mA6GGLllrILt8nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH7PR11MB6953.namprd11.prod.outlook.com (2603:10b6:510:204::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.33; Fri, 21 Mar 2025 13:00:21 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 13:00:21 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 3/3] freeradius: 3.2.5 -> 3.2.7
Date: Fri, 21 Mar 2025 21:00:00 +0800
Message-Id: <20250321130000.667251-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250321130000.667251-1-yi.zhao@windriver.com>
References: <20250321130000.667251-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::24)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH7PR11MB6953:EE_
X-MS-Office365-Filtering-Correlation-Id: 6215a8e6-9c65-41b6-395a-08dd68785637
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?AxteeRnVS3+XgbJ/0FGD/liwaIC0f4VQZNmKP4K5bWSDfw1wOAkZx579+WCj?=
 =?us-ascii?Q?HO9XtrEnBwCj/RgS4/BfJkj7uw6YU6T+BXfanz4G07mrbM87s4imn2uDg0Dm?=
 =?us-ascii?Q?TQ8JhVHH1fvtSSzKg/MWFT4VWYPT1XVWoqEnposItTucHFSMbx+pAJeowYEK?=
 =?us-ascii?Q?X8ys9r75RoPbK6FxhvpnMfw5OlmS7WstSZoEiitFwCqSqBXDTexrLN1d4Jy+?=
 =?us-ascii?Q?tHk3FRc2bc5RhasQjnoBUj/drYIoONr4X8ppHvvqZyZRj8bKQCs2C+jeXGq1?=
 =?us-ascii?Q?QLlJlNr2sxWbUKuzODTTBTphD5815+ar9mNH1/Mf44m94LtPm1iIltk0lsSn?=
 =?us-ascii?Q?aLflKDoVUAMf/xePUFseanJKyWSXGjSQ8qZhxGhTte7POmPrQC83XI//Tmih?=
 =?us-ascii?Q?ZQz7HAB8fis6RIsN2XCiORwZZEZ3VM8IO7pTOICTy9BslkZzeYcxhFFvaltO?=
 =?us-ascii?Q?o4grp4ZrvHptg0sZR4CIYTSY7tthT4E8EIsEei8fbRrxdzubno4ox2Tw4ikR?=
 =?us-ascii?Q?tGMk063LcXUifNaAfA8OJ+NgFzKXWjDqGxWUNCwNMF5ULbNmdLKSaNqKy6JW?=
 =?us-ascii?Q?fSON92bmJFKw8sWTO9d2C1zbgmQMRzIz3LGXPsLbrj8BkBZ0XCI50KxpSske?=
 =?us-ascii?Q?Zgr/L4OgRETQNG+1hiZ5W0Z4yiKS5ujFyqUwMxv9QWCN3oAMJ/ZGUay/Krnh?=
 =?us-ascii?Q?1JJvL+sqGHm+WVPzW2KbisFcn4yLzMpaUfe+afePRxLmmRUPY7SgrGBLwwVY?=
 =?us-ascii?Q?WRt/Z8+0LCf2F3RSffn9N12e9mwWMqDB21/KyowVy4UCD4n2cXJgMVvqpqGj?=
 =?us-ascii?Q?t8Z4Z+Aa5ueHv4Baqa5zFV1D/ttMrtlaWuHm9YhoVwHr2jYswUXVZHHauSE+?=
 =?us-ascii?Q?TJf+ba0Gl7N5BKgkeXcgjrdh9+tcbqf4VuKEtt6GIVW575mLTabieGnqW93i?=
 =?us-ascii?Q?VlEyxstSwcMpJbZNdFcDBPrzuHcjH154/fhzNVmsrHvPiU5iO1uBl8YaXy5/?=
 =?us-ascii?Q?HFxOp1iHeArKisGW/GZEXCNMqp1YrN0wP/wYN6gxBFnu2YUsCKN0NH0QOXc1?=
 =?us-ascii?Q?ET8/ts5Yf/CCMieFmaC4n7q27Nmgwzfzi/RLFbiW2+O4iU2TZsikrRyKCqJ+?=
 =?us-ascii?Q?URJjYkS7rFdAdrGC9Td7s0Tu1aD/vZHplqZAquq7cpWnvJD7R83kvTL6B80n?=
 =?us-ascii?Q?VBodXIbQlqXSOY4mL9EevVnpBD4vELusVNypAHyZbkTmwXcIFGSk9LbPdFWc?=
 =?us-ascii?Q?YtdoyE/dnEYXXfWKrTwWL0fan9qmcRF7zB4xMBjdn/gx+eESm74VWJhKtvqh?=
 =?us-ascii?Q?ohyE2U1ml2fex5g1qqkGmuPpHi5ibiNpKRjO3PYDx1jNV0+j6Jb2f3i8iVJ7?=
 =?us-ascii?Q?XwMdofZiTU02QyhcovWNQLnUsP6Ns/zGBTMUK6eYj3UdNohCYtFReq+12muA?=
 =?us-ascii?Q?kePE1YAd/kQMEHYS7wvVs0jhLq1qBTQ1?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0kw2C7nEDn/E8FZ8SHoQ93aqfvkxlwRtjuUTfIALp/xF0JEqzKfI77DZF/hG?=
 =?us-ascii?Q?31fq9hDwfY8UEeQc/mB0adkaLikaA2ttz1m9bMDsRPUVajzdNzdI9hKJlUwF?=
 =?us-ascii?Q?q7hQCgG00KT2yo5hG0mVQ8sIhW/4roZK7nJ6BKewFQhs5TN33JDWkIPyATU2?=
 =?us-ascii?Q?DNXVecDoyFR0oUwxcuxbmVEYdUVB4FUL73CkXUDqCQ02P6AlfTqQfEsH1JEU?=
 =?us-ascii?Q?hWQdaBHAVvz+G+7pKiydyl3NywhuIjiCoF9kReWX2nLsmza6x+lkrQ6vaZjO?=
 =?us-ascii?Q?E9sNOJ5ZfL6S/ieHXG5/9oC9qJnlFh+odp8gis4bcAgFJm7LgweRS1S7PmPH?=
 =?us-ascii?Q?v3DRtRTIyiTZ2z6onFXXCjeooYWSek94ThH65kvdDt5AQdlB9DltbtZCVhp0?=
 =?us-ascii?Q?F/mVOxiNwQ5gppMoOWckjGAJkASEx2f7K0sx3KZL9T4CyaNMtQ5u7v8Ulxl1?=
 =?us-ascii?Q?fGp6f/Q204WX7eh6KA0psFarguw9SXka9KHW8LDrt57de3xatM/S0MY7jyO6?=
 =?us-ascii?Q?xf/KsiitEOBoYxAV8wWF01PsDpLbSaiXxL6AKIRi6la0EDGNb46uUskR5nN0?=
 =?us-ascii?Q?0y99N/ogHPvzDnNWof5WwPZhFRW7obUpBOFLSSCZ9HQqIUknVU7ggMu+Ghzj?=
 =?us-ascii?Q?Bq+bB3TGwRY954mXRFFS1ETW6ueN6F9wXEC/5uaXPXn5Xl9WLH7Q7uJQhkRR?=
 =?us-ascii?Q?izbmkpoZNXwjJua2TS8QPMvlXsyYD1ZW2xj9tsnIkauxuEQRnvb7C9/HJk2l?=
 =?us-ascii?Q?DC86xQqkRWTdictfTzPqgmxcV913FF+CB6S/hMmaluQjWVH6pMcLB/NAV0/j?=
 =?us-ascii?Q?bxFD0Hx3XMOoMUWX4JOOsE9N5YwPB4zQ0h0yCs+9GCtVDath+Xj9W+cCWVxL?=
 =?us-ascii?Q?2BeuE+vbltXtgEqo74/6lxx45Cq2om4JrejBRCGyMxm7E6qVhPNjj5+4TIb3?=
 =?us-ascii?Q?EoHKZCid4smVqR6VcaMUS7P/oKku6dZE2VJLw8wwA45Q9bhsjirrNJp80TGl?=
 =?us-ascii?Q?cfrPvzAOuyaPO1x0kVaARjaXX+8Cw0EsnUE08U7uUKoCzHDyjIQNxwGktTk9?=
 =?us-ascii?Q?2AaLFhCOC5U71Y2No2J63gqZeCaEFuAdh8LsxSuT3BOvVIz5o4VMldz03JTW?=
 =?us-ascii?Q?s5hvtad+fQFX00P8Q7gNJIuoWmYtjLDnrAW3HszroOe3SFHSl3dCc23wTUDd?=
 =?us-ascii?Q?Q8xKUQVw71wPocsvwLKP6f6VAFgFFV/dVm5g4bp9thgtDvVmPObsaR7uswvE?=
 =?us-ascii?Q?EJ762dmwfebeYQ8WAt5hYD2MX147sqIR4O/yzc0vt5Pd406ev4loSvX/gzzb?=
 =?us-ascii?Q?SjWTU9vSqIWCXNOpPQXp6w+y4W/9GvWSecbQM1VVyhUO0FpD+5qTmZ8ADO5k?=
 =?us-ascii?Q?KD0/mp+rkuKAE5CdxWQaXUYFtjNJQI3BRBUk2NooMespmCN41PgX7yashEqW?=
 =?us-ascii?Q?AeNdnby2/6DeslNlNmlMeOurPHk5E+2FEEy61305400IOEFiZMqvjmiP+j60?=
 =?us-ascii?Q?XSMc2hAn/xT/FvAym+F/goG6PLx/pd2LedES3KqIBQYvy267yFYbDKbB8Gm9?=
 =?us-ascii?Q?+zL2YbeP9DsMa6xiEuVoythbSsXSS3IjUuwBVkOX?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6215a8e6-9c65-41b6-395a-08dd68785637
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 13:00:21.2311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N1hnqRQq68LQfFQKxJQ9/CEIJU1JxedRpTv86S9+92KJKzG/bKvzDnaexcHXt3VyCkba9W1WyW2NPYf5/6ukdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6953
X-Authority-Analysis: v=2.4 cv=LZw86ifi c=1 sm=1 tr=0 ts=67dd62e8 cx=c_pps a=GoGv2RwMe+/7w9MjyR+VRg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=OA-qDgz8yoi9TB8ewloA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: coHoriWfSJhuAzfx19wGQIXOB1qgLgfG
X-Proofpoint-ORIG-GUID: coHoriWfSJhuAzfx19wGQIXOB1qgLgfG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503210096
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 13:00:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116186

ChangeLog:
https://github.com/FreeRADIUS/freeradius-server/releases/tag/release_3_2_6
https://github.com/FreeRADIUS/freeradius-server/releases/tag/release_3_2_7

* Refresh local patches.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../files/0001-Add-autogen.sh.patch           |  2 +-
 ...e-user-and-group-of-freeradius-serve.patch |  6 +-
 ...configure.ac-allow-cross-compilation.patch |  6 +-
 .../files/0004-Fix-libtool-detection.patch    |  6 +-
 ...5-configure.ac-add-option-for-libcap.patch |  8 +-
 .../0006-Avoid-searching-host-dirs.patch      | 93 ++++++++++---------
 ..._python-add-PY_INC_DIR-in-search-dir.patch |  5 +-
 .../0008-libtool-do-not-use-jlibtool.patch    | 48 +++++-----
 .../0009-Fix-quoting-for-BUILD_WITH.patch     |  2 +-
 ...r-for-expansion-of-macro-in-thread.h.patch |  8 +-
 ...ncludedir-instead-of-hardcoding-usr-.patch |  5 +-
 ...file-fix-the-existed-certificate-err.patch |  4 +-
 ...file-fix-the-occasional-verification.patch |  4 +-
 ...4-Workaround-error-with-autoconf-2.7.patch |  8 +-
 ...trap-check-commands-of-openssl-exist.patch |  2 +-
 ...16-version.c-don-t-print-build-flags.patch |  6 +-
 ...nclude.m4-to-include-required-macros.patch |  4 +-
 ...reeradius_3.2.5.bb => freeradius_3.2.7.bb} |  2 +-
 18 files changed, 118 insertions(+), 101 deletions(-)
 rename meta-networking/recipes-connectivity/freeradius/{freeradius_3.2.5.bb => freeradius_3.2.7.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/freeradius/files/0001-Add-autogen.sh.patch b/meta-networking/recipes-connectivity/freeradius/files/0001-Add-autogen.sh.patch
index e1228c2ebe..3e83b4d04c 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/0001-Add-autogen.sh.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0001-Add-autogen.sh.patch
@@ -1,4 +1,4 @@
-From 3be3b9a1345942d1578ec73efa9b2e3c41bd67c5 Mon Sep 17 00:00:00 2001
+From 1e43b309183f2cca627d1995908aeb9bb0b5bf97 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Fri, 21 Jan 2022 13:22:24 +0800
 Subject: [PATCH] Add autogen.sh
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0002-Enable-and-change-user-and-group-of-freeradius-serve.patch b/meta-networking/recipes-connectivity/freeradius/files/0002-Enable-and-change-user-and-group-of-freeradius-serve.patch
index c57ee93c33..801ff90ac9 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/0002-Enable-and-change-user-and-group-of-freeradius-serve.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0002-Enable-and-change-user-and-group-of-freeradius-serve.patch
@@ -1,4 +1,4 @@
-From 2a74c10836c0d2d19248ca40d113936f4a56b039 Mon Sep 17 00:00:00 2001
+From 77e9dbe0d0d175deead427793192ffb4ffad2825 Mon Sep 17 00:00:00 2001
 From: "Roy.Li" <rongqing.li@windriver.com>
 Date: Sun, 8 Jan 2023 22:47:11 +0800
 Subject: [PATCH] Enable and change user and group of freeradius server to
@@ -13,10 +13,10 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/raddb/radiusd.conf.in b/raddb/radiusd.conf.in
-index 154b50d610..4594d6d2d2 100644
+index 376892e151..63c49a224c 100644
 --- a/raddb/radiusd.conf.in
 +++ b/raddb/radiusd.conf.in
-@@ -557,8 +557,8 @@ security {
+@@ -562,8 +562,8 @@ security {
  	#  member.  This can allow for some finer-grained access
  	#  controls.
  	#
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0003-configure.ac-allow-cross-compilation.patch b/meta-networking/recipes-connectivity/freeradius/files/0003-configure.ac-allow-cross-compilation.patch
index 3635412d3b..33a77233d1 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/0003-configure.ac-allow-cross-compilation.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0003-configure.ac-allow-cross-compilation.patch
@@ -1,4 +1,4 @@
-From ba1390a80662ff2ab7bfda978cde7df9a871f6ae Mon Sep 17 00:00:00 2001
+From 0a9e26096b1e93f9202f83ecf7302cfcf138b7cf Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Tue, 24 Jul 2018 15:03:39 +0800
 Subject: [PATCH] configure.ac: allow cross-compilation
@@ -18,7 +18,6 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
 Rebased for 3.2.3
 Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
 ---
  src/modules/rlm_krb5/configure.ac | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
@@ -37,3 +36,6 @@ index 9ee6379ea4..1dad481da8 100644
  	fi
  else
  	krb5threadsafe=""
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0004-Fix-libtool-detection.patch b/meta-networking/recipes-connectivity/freeradius/files/0004-Fix-libtool-detection.patch
index 479e1ba76f..41d8ff3ce8 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/0004-Fix-libtool-detection.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0004-Fix-libtool-detection.patch
@@ -1,4 +1,4 @@
-From 5ba3d140842268cbbdd983266efecb1fba5bdd59 Mon Sep 17 00:00:00 2001
+From 864316403192a3e93a2b1f37de479437964eb7f3 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 22 Aug 2019 10:45:46 +0800
 Subject: [PATCH] Fix libtool detection
@@ -20,10 +20,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 36 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index ad8bc8cdda..ef8fced680 100644
+index 6f29206646..c0d6ea99ca 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -321,6 +321,42 @@ dnl #  See if we have Git.
+@@ -319,6 +319,42 @@ dnl #  See if we have Git.
  dnl #
  AC_CHECK_PROG(GIT, git, yes, no)
  
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0005-configure.ac-add-option-for-libcap.patch b/meta-networking/recipes-connectivity/freeradius/files/0005-configure.ac-add-option-for-libcap.patch
index 8ef3c4bdf9..168fc78162 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/0005-configure.ac-add-option-for-libcap.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0005-configure.ac-add-option-for-libcap.patch
@@ -1,4 +1,4 @@
-From 9548dc5e1a6c835cd4f387ba384d8f3f14c3fc8b Mon Sep 17 00:00:00 2001
+From f655b4b6a89ae3bb183c659e61cc78539c2c4e81 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 22 Aug 2019 10:50:21 +0800
 Subject: [PATCH] configure.ac: add option for libcap
@@ -12,10 +12,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 27 insertions(+), 9 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index ef8fced680..263098f7fd 100644
+index c0d6ea99ca..64aa9e4293 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1161,6 +1161,22 @@ fi
+@@ -1209,6 +1209,22 @@ fi
  dnl Set by FR_SMART_CHECKLIB
  LIBS="${old_LIBS}"
  
@@ -38,7 +38,7 @@ index ef8fced680..263098f7fd 100644
  dnl Check for cap
  dnl extra argument: --with-cap-lib-dir=DIR
  cap_lib_dir=
-@@ -1194,15 +1210,17 @@ AC_ARG_WITH(cap-include-dir,
+@@ -1242,15 +1258,17 @@ AC_ARG_WITH(cap-include-dir,
        ;;
    esac])
  
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0006-Avoid-searching-host-dirs.patch b/meta-networking/recipes-connectivity/freeradius/files/0006-Avoid-searching-host-dirs.patch
index 510136da1f..e036549827 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/0006-Avoid-searching-host-dirs.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0006-Avoid-searching-host-dirs.patch
@@ -1,4 +1,4 @@
-From 8fe25b30b6fbb3170705f4468eb4c92eef3a968f Mon Sep 17 00:00:00 2001
+From d8631a433abf7336b065ecfaa5161e408ea47255 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Mon, 4 Jan 2016 01:44:04 -0500
 Subject: [PATCH] Avoid searching host dirs
@@ -14,15 +14,15 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 Rebased for 3.2.3
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
- m4/fr_smart_check_include.m4                                |    2 +-
- m4/fr_smart_check_lib.m4                                    |   22 ----------------------
- src/modules/rlm_sql/drivers/rlm_sql_db2/configure.ac        |    4 ++--
- src/modules/rlm_sql/drivers/rlm_sql_firebird/configure.ac   |    4 ++--
- src/modules/rlm_sql/drivers/rlm_sql_iodbc/configure.ac      |    4 ++--
- src/modules/rlm_sql/drivers/rlm_sql_mysql/configure.ac      |    6 +++---
- src/modules/rlm_sql/drivers/rlm_sql_oracle/configure.ac     |    2 +-
- src/modules/rlm_sql/drivers/rlm_sql_postgresql/configure.ac |    4 ++--
- src/modules/rlm_sql/drivers/rlm_sql_unixodbc/configure.ac   |    4 ++--
+ m4/fr_smart_check_include.m4                  |  2 +-
+ m4/fr_smart_check_lib.m4                      | 22 -------------------
+ .../rlm_sql/drivers/rlm_sql_db2/configure.ac  |  4 ++--
+ .../drivers/rlm_sql_firebird/configure.ac     |  4 ++--
+ .../drivers/rlm_sql_iodbc/configure.ac        |  4 ++--
+ .../drivers/rlm_sql_mysql/configure.ac        |  6 ++---
+ .../drivers/rlm_sql_oracle/configure.ac       |  2 +-
+ .../drivers/rlm_sql_postgresql/configure.ac   |  4 ++--
+ .../drivers/rlm_sql_unixodbc/configure.ac     |  4 ++--
  9 files changed, 15 insertions(+), 37 deletions(-)
 
 diff --git a/m4/fr_smart_check_include.m4 b/m4/fr_smart_check_include.m4
@@ -38,6 +38,39 @@ index e7d4443f9c..2b69704f98 100644
  
  dnl #  Our local versions
  _smart_try_dir=
+diff --git a/m4/fr_smart_check_lib.m4 b/m4/fr_smart_check_lib.m4
+index 16ac5b3c5e..0f5e9fc6d6 100644
+--- a/m4/fr_smart_check_lib.m4
++++ b/m4/fr_smart_check_lib.m4
+@@ -64,28 +64,6 @@ if test "x$smart_lib" = "x"; then
+   LIBS="$old_LIBS"
+ fi
+ 
+-dnl #
+-dnl #  Try to guess possible locations.
+-dnl #
+-if test "x$smart_lib" = "x"; then
+-  for try in /usr/local/lib /opt/lib; do
+-    AC_MSG_CHECKING([for $2 in -l$1 in $try])
+-    LIBS="-l$1 $old_LIBS"
+-    CPPFLAGS="-L$try -Wl,-rpath,$try $old_CPPFLAGS"
+-    AC_TRY_LINK([extern char $2();],
+-		[$2()],
+-		[
+-		  smart_lib="-l$1"
+-		  smart_ldflags="-L$try -Wl,-rpath,$try"
+-		  AC_MSG_RESULT(yes)
+-		  break
+-		],
+-		[AC_MSG_RESULT(no)])
+-  done
+-  LIBS="$old_LIBS"
+-  CPPFLAGS="$old_CPPFLAGS"
+-fi
+-
+ dnl #
+ dnl #  Found it, set the appropriate variable.
+ dnl #
 diff --git a/src/modules/rlm_sql/drivers/rlm_sql_db2/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_db2/configure.ac
 index 0d94ee9bf6..6108e62054 100644
 --- a/src/modules/rlm_sql/drivers/rlm_sql_db2/configure.ac
@@ -146,7 +179,7 @@ index f31b7d2c5a..67bbf66df5 100644
  if test "x$ORACLE_HOME" != "x"; then
  	smart_try_dir="${smart_try_dir} ${ORACLE_HOME}/include"
 diff --git a/src/modules/rlm_sql/drivers/rlm_sql_postgresql/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_postgresql/configure.ac
-index 46587e4099..b41c51bda7 100644
+index 6b1c9e964e..1937d81134 100644
 --- a/src/modules/rlm_sql/drivers/rlm_sql_postgresql/configure.ac
 +++ b/src/modules/rlm_sql/drivers/rlm_sql_postgresql/configure.ac
 @@ -43,7 +43,7 @@ AC_ARG_WITH(rlm-sql-postgresql-include-dir,
@@ -158,7 +191,7 @@ index 46587e4099..b41c51bda7 100644
  FR_SMART_CHECK_INCLUDE(libpq-fe.h)
  if test "x$ac_cv_header_libpqmfe_h" != "xyes"; then
  	FR_MODULE_FAIL([libpq-fe.h])
-@@ -95,7 +95,7 @@ else
+@@ -110,7 +110,7 @@ else
  		])
  fi
  
@@ -188,36 +221,6 @@ index 3bdfae6032..ce68c312c6 100644
  FR_SMART_CHECK_INCLUDE(sql.h)
  if test "x$ac_cv_header_sql_h" != xyes; then
  	FR_MODULE_FAIL([sql.h])
-diff --git a/m4/fr_smart_check_lib.m4 b/m4/fr_smart_check_lib.m4
-index 16ac5b3c5e..0f5e9fc6d6 100644
---- a/m4/fr_smart_check_lib.m4
-+++ b/m4/fr_smart_check_lib.m4
-@@ -64,28 +64,6 @@ if test "x$smart_lib" = "x"; then
-   LIBS="$old_LIBS"
- fi
- 
--dnl #
--dnl #  Try to guess possible locations.
--dnl #
--if test "x$smart_lib" = "x"; then
--  for try in /usr/local/lib /opt/lib; do
--    AC_MSG_CHECKING([for $2 in -l$1 in $try])
--    LIBS="-l$1 $old_LIBS"
--    CPPFLAGS="-L$try -Wl,-rpath,$try $old_CPPFLAGS"
--    AC_TRY_LINK([extern char $2();],
--		[$2()],
--		[
--		  smart_lib="-l$1"
--		  smart_ldflags="-L$try -Wl,-rpath,$try"
--		  AC_MSG_RESULT(yes)
--		  break
--		],
--		[AC_MSG_RESULT(no)])
--  done
--  LIBS="$old_LIBS"
--  CPPFLAGS="$old_CPPFLAGS"
--fi
--
- dnl #
- dnl #  Found it, set the appropriate variable.
- dnl #
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0007-rlm_python-add-PY_INC_DIR-in-search-dir.patch b/meta-networking/recipes-connectivity/freeradius/files/0007-rlm_python-add-PY_INC_DIR-in-search-dir.patch
index 78259d7d74..4d8400c87f 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/0007-rlm_python-add-PY_INC_DIR-in-search-dir.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0007-rlm_python-add-PY_INC_DIR-in-search-dir.patch
@@ -1,4 +1,4 @@
-From e4ff7a2a9834e2589bc7bdda4b74f5bc962b15e6 Mon Sep 17 00:00:00 2001
+From 0aab0817acf2179d99c516d7933c80c411855eb7 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Wed, 27 Jan 2016 05:07:19 -0500
 Subject: [PATCH] rlm_python: add PY_INC_DIR in search dir
@@ -28,3 +28,6 @@ index c79c327064..5f4d274990 100644
  	FR_SMART_CHECK_INCLUDE(Python.h)
  	CFLAGS=$old_CFLAGS
  
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0008-libtool-do-not-use-jlibtool.patch b/meta-networking/recipes-connectivity/freeradius/files/0008-libtool-do-not-use-jlibtool.patch
index 559b857b63..f469e85b91 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/0008-libtool-do-not-use-jlibtool.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0008-libtool-do-not-use-jlibtool.patch
@@ -1,4 +1,4 @@
-From d0fa5b259c2dc942d0a43a9cf1bfc32f40c184f9 Mon Sep 17 00:00:00 2001
+From c47048a68eec6838c87e5cde5fddc7e7500b7742 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Thu, 7 Jan 2016 22:37:30 -0800
 Subject: [PATCH] libtool: do not use jlibtool
@@ -12,26 +12,25 @@ Upstream-Status: Inappropriate [embedded specific]
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
- Make.inc.in        |  4 ++--
+ Make.inc.in        |  3 ++-
  scripts/boiler.mk  |  2 ++
  scripts/install.mk | 14 +++++++-------
- scripts/libtool.mk | 22 ++++++++++++++++------
- 4 files changed, 27 insertions(+), 15 deletions(-)
+ scripts/libtool.mk | 22 +++++++++++++++-------
+ 4 files changed, 26 insertions(+), 15 deletions(-)
 
 diff --git a/Make.inc.in b/Make.inc.in
-index 05f82776ff..e78f3fe9dc 100644
+index 6d5cc1c343..7944aa7143 100644
 --- a/Make.inc.in
 +++ b/Make.inc.in
-@@ -57,7 +57,7 @@ CPPFLAGS	= @CPPFLAGS@
+@@ -57,6 +57,7 @@ CPPFLAGS	= @CPPFLAGS@
  LIBPREFIX	= @LIBPREFIX@
  EXEEXT		= @EXEEXT@
  
--LIBTOOL		= JLIBTOOL
 +LIBTOOL		= @LIBTOOL@
  ACLOCAL		= @ACLOCAL@
  AUTOCONF	= @AUTOCONF@
  AUTOHEADER	= @AUTOHEADER@
-@@ -168,7 +168,7 @@ ANALYZE.c       := @clang_path@
+@@ -168,7 +169,7 @@ ANALYZE.c       := @clang_path@
  #
  ifeq "$(USE_SHARED_LIBS)" "yes"
  	TESTBINDIR = ./$(BUILD_DIR)/bin/local
@@ -41,10 +40,10 @@ index 05f82776ff..e78f3fe9dc 100644
  	TESTBINDIR = ./$(BUILD_DIR)/bin
  	TESTBIN    = ./$(BUILD_DIR)/bin
 diff --git a/scripts/boiler.mk b/scripts/boiler.mk
-index 2ce0c18f34..567cc0f22f 100644
+index 9d70104747..a882e5ce2b 100644
 --- a/scripts/boiler.mk
 +++ b/scripts/boiler.mk
-@@ -272,6 +272,7 @@ define COMPILE_C_CMDS
+@@ -271,6 +271,7 @@ define COMPILE_C_CMDS
  	$(Q)$(ECHO) CC $<
  	$(Q)$(strip ${COMPILE.c} -o $@ -c -MD ${CPPFLAGS} ${CFLAGS} ${SRC_CFLAGS} ${INCDIRS} \
  	    $(addprefix -I, ${SRC_INCDIRS}) ${SRC_DEFS} ${DEFS} $<)
@@ -52,7 +51,7 @@ index 2ce0c18f34..567cc0f22f 100644
  endef
  else
  #
-@@ -287,6 +288,7 @@ define COMPILE_C_CMDS
+@@ -286,6 +287,7 @@ define COMPILE_C_CMDS
  	$(Q)cppcheck --enable=style -q ${CHECKFLAGS} $(filter -isystem%,${SRC_CFLAGS}) \
  	     $(filter -I%,${SRC_CFLAGS}) $(filter -D%,${SRC_CFLAGS}) ${INCDIRS} \
  	     $(addprefix -I,${SRC_INCDIRS}) ${SRC_DEFS} ${DEFS} --suppress=variableScope --suppress=invalidscanf $<
@@ -116,21 +115,28 @@ index 916411563b..e38c1ed697 100644
  
  
 diff --git a/scripts/libtool.mk b/scripts/libtool.mk
-index 381127ec2d..e83d7e6ad7 100644
+index 64c2fe0804..05ed2292f0 100644
 --- a/scripts/libtool.mk
 +++ b/scripts/libtool.mk
-@@ -60,7 +60,9 @@ ifeq "${LIBTOOL}" "JLIBTOOL"
-     # Tell GNU Make to use this value, rather than anything specified
-     # on the command line.
-     override LIBTOOL := ${JLIBTOOL}
--endif    # else we're not using jlibtool
-+else    # else we're not using jlibtool
-+    all install: ${LIBTOOL}
-+endif
+@@ -33,7 +33,7 @@ JLIBTOOL := ${BUILD_DIR}/make/jlibtool
+ 
+ # Add a rule to build jlibtool BEFORE any other targets.  This
+ # means that we can use it to build the later targets.
+-all install: ${JLIBTOOL}
++all install: ${LIBTOOL}
+ 
+ # Note that we need to use a compilation rule that does NOT
+ # include referencing ${LIBTOOL}, as we don't have a jlibtool
+@@ -51,7 +51,7 @@ jlibtool_clean:
+ 
+ # Tell GNU Make to use this value, rather than anything specified
+ # on the command line.
+-override LIBTOOL := ${JLIBTOOL}
++#override LIBTOOL := ${JLIBTOOL}
  
  # When using libtool, it produces a '.libs' directory.  Ensure that it
  # is removed on "make clean", too.
-@@ -74,11 +76,19 @@ clean: .libs_clean
+@@ -65,11 +65,19 @@ clean: .libs_clean
  # Re-define compilers and linkers
  #
  OBJ_EXT = lo
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0009-Fix-quoting-for-BUILD_WITH.patch b/meta-networking/recipes-connectivity/freeradius/files/0009-Fix-quoting-for-BUILD_WITH.patch
index 9386675e46..a28a1e84e9 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/0009-Fix-quoting-for-BUILD_WITH.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0009-Fix-quoting-for-BUILD_WITH.patch
@@ -1,4 +1,4 @@
-From 3e701d6274924adaed568e22af2362aa5af1f055 Mon Sep 17 00:00:00 2001
+From 33ef5c4e285796c5f208b2b091d4b75e0849f282 Mon Sep 17 00:00:00 2001
 From: Peter Seebach <peter.seebach@windriver.com>
 Date: Sun, 8 Jan 2023 23:01:28 +0800
 Subject: [PATCH] Fix quoting for BUILD_WITH
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0010-fix-error-for-expansion-of-macro-in-thread.h.patch b/meta-networking/recipes-connectivity/freeradius/files/0010-fix-error-for-expansion-of-macro-in-thread.h.patch
index 051b66af8f..cae27ad3a4 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/0010-fix-error-for-expansion-of-macro-in-thread.h.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0010-fix-error-for-expansion-of-macro-in-thread.h.patch
@@ -1,4 +1,4 @@
-From 30ce5ccd62446349d432ff65d3fe8d46872423c8 Mon Sep 17 00:00:00 2001
+From 0475d948ceab91b22172f0fae3bc01e0a1502ae8 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Wed, 18 Jan 2017 14:59:39 +0800
 Subject: [PATCH] fix error for expansion of macro in thread.h
@@ -22,10 +22,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/src/include/threads.h b/src/include/threads.h
-index e36d81dac0..2bcb6aadcb 100644
+index f2aea776d6..1c4e526797 100644
 --- a/src/include/threads.h
 +++ b/src/include/threads.h
-@@ -89,7 +89,7 @@ static _t __fr_thread_local_init_##_n(pthread_destructor_t func)\
+@@ -92,7 +92,7 @@ static _t __fr_thread_local_init_##_n(pthread_destructor_t func)\
  #  define fr_thread_local_get(_n) _n
  #elif defined(HAVE_PTHREAD_H)
  #  include <pthread.h>
@@ -34,7 +34,7 @@ index e36d81dac0..2bcb6aadcb 100644
  static pthread_key_t __fr_thread_local_key_##_n;\
  static pthread_once_t __fr_thread_local_once_##_n = PTHREAD_ONCE_INIT;\
  static pthread_destructor_t __fr_thread_local_destructor_##_n = NULL;\
-@@ -100,17 +100,17 @@ static void __fr_thread_local_destroy_##_n(UNUSED void *unused)\
+@@ -103,17 +103,17 @@ static void __fr_thread_local_destroy_##_n(UNUSED void *unused)\
  static void __fr_thread_local_key_init_##_n(void)\
  {\
  	(void) pthread_key_create(&__fr_thread_local_key_##_n, __fr_thread_local_destroy_##_n);\
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0011-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch b/meta-networking/recipes-connectivity/freeradius/files/0011-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch
index efa5c53c9f..d05ed00605 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/0011-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0011-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch
@@ -1,4 +1,4 @@
-From f0e764826e3a85488047f7f4e94ebf91460d2c12 Mon Sep 17 00:00:00 2001
+From f742496305018629be88eaac14cc6e1fa80d7594 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 16 Jun 2017 20:10:49 -0700
 Subject: [PATCH] rlm_mschap: Use includedir instead of hardcoding /usr/include
@@ -26,3 +26,6 @@ index 953336f475..77a18af55d 100644
  FR_SMART_CHECK_INCLUDE(wbclient.h, [#include <stdint.h>
  				#include <stdbool.h>])
  if test "x$ac_cv_header_wbclient_h" != "xyes"; then
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0012-raddb-certs-Makefile-fix-the-existed-certificate-err.patch b/meta-networking/recipes-connectivity/freeradius/files/0012-raddb-certs-Makefile-fix-the-existed-certificate-err.patch
index cbac989284..8f7457fdbb 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/0012-raddb-certs-Makefile-fix-the-existed-certificate-err.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0012-raddb-certs-Makefile-fix-the-existed-certificate-err.patch
@@ -1,4 +1,4 @@
-From 0f9f18fc330fe88080be13e43f300fbf7ba4a85a Mon Sep 17 00:00:00 2001
+From de2b9e3b8f9ad8b8ac3e7e820b8b831e91c2dd71 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Mon, 13 Jul 2020 07:01:45 +0000
 Subject: [PATCH] raddb/certs/Makefile: fix the existed certificate error
@@ -29,7 +29,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/raddb/certs/Makefile b/raddb/certs/Makefile
-index c9fbc9e864..d064fe252d 100644
+index 34948bd924..cae939668e 100644
 --- a/raddb/certs/Makefile
 +++ b/raddb/certs/Makefile
 @@ -92,7 +92,7 @@ server.csr server.key: server.cnf
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0013-raddb-certs-Makefile-fix-the-occasional-verification.patch b/meta-networking/recipes-connectivity/freeradius/files/0013-raddb-certs-Makefile-fix-the-occasional-verification.patch
index 287e47adcc..cf05efef30 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/0013-raddb-certs-Makefile-fix-the-occasional-verification.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0013-raddb-certs-Makefile-fix-the-occasional-verification.patch
@@ -1,4 +1,4 @@
-From bb1cb2ffc7a31c0a2bb2de51ef82d304b0a107c3 Mon Sep 17 00:00:00 2001
+From 38cbab566143b9e002ee24a1f08a52ec74186eca Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Wed, 5 Aug 2020 07:23:11 +0000
 Subject: [PATCH] raddb/certs/Makefile: fix the occasional verification failure
@@ -29,7 +29,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 15 insertions(+), 15 deletions(-)
 
 diff --git a/raddb/certs/Makefile b/raddb/certs/Makefile
-index d064fe252d..86f4547804 100644
+index cae939668e..52ae65755f 100644
 --- a/raddb/certs/Makefile
 +++ b/raddb/certs/Makefile
 @@ -59,7 +59,7 @@ passwords.mk: server.cnf ca.cnf client.cnf inner-server.cnf
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0014-Workaround-error-with-autoconf-2.7.patch b/meta-networking/recipes-connectivity/freeradius/files/0014-Workaround-error-with-autoconf-2.7.patch
index 17eadc7e59..86ca471536 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/0014-Workaround-error-with-autoconf-2.7.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0014-Workaround-error-with-autoconf-2.7.patch
@@ -1,4 +1,4 @@
-From c591da4a361496eec93625cf8c4f89bddfedaca7 Mon Sep 17 00:00:00 2001
+From 9fed86858d8d2045f3de77405059d786bb2d50ac Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Sun, 7 Feb 2021 16:02:36 +0800
 Subject: [PATCH] Workaround error with autoconf 2.7
@@ -19,12 +19,12 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 8 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 263098f7fd..fc296832d8 100644
+index 64aa9e4293..0861514ef7 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -878,14 +878,6 @@ fi
+@@ -926,14 +926,6 @@ if test "x$WITH_RADLAST" != "xyes"; then
+ fi
  
- AC_PATH_PROG(RUSERS, rusers, /usr/bin/rusers)
  
 -dnl #
 -dnl #  FIXME This is truly gross.
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0015-bootstrap-check-commands-of-openssl-exist.patch b/meta-networking/recipes-connectivity/freeradius/files/0015-bootstrap-check-commands-of-openssl-exist.patch
index d1d0111607..b664a9e3f3 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/0015-bootstrap-check-commands-of-openssl-exist.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0015-bootstrap-check-commands-of-openssl-exist.patch
@@ -1,4 +1,4 @@
-From 78494ea005bd38324953b05176d6eb2c3f55af2c Mon Sep 17 00:00:00 2001
+From e8802c019085c743dc691e9329f05f7e559d1fa5 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Sun, 8 Jan 2023 23:21:24 +0800
 Subject: [PATCH] bootstrap: check commands of openssl exist
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0016-version.c-don-t-print-build-flags.patch b/meta-networking/recipes-connectivity/freeradius/files/0016-version.c-don-t-print-build-flags.patch
index 2d67fdef05..8917457ec2 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/0016-version.c-don-t-print-build-flags.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0016-version.c-don-t-print-build-flags.patch
@@ -1,4 +1,4 @@
-From cbbb62ddda5c189c225f96bf6b599b3b3e8c8252 Mon Sep 17 00:00:00 2001
+From 99ea83d998d3b8957830afa15cec42ba265b67ca Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Wed, 3 Aug 2022 16:44:29 +0800
 Subject: [PATCH] version.c: don't print build flags
@@ -13,10 +13,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 13 deletions(-)
 
 diff --git a/src/main/version.c b/src/main/version.c
-index f1f1e87810..3ffcbb25a0 100644
+index 44a6edc699..a0e6f26911 100644
 --- a/src/main/version.c
 +++ b/src/main/version.c
-@@ -589,19 +589,6 @@ void version_print(void)
+@@ -614,19 +614,6 @@ void version_print(void)
  		DEBUG2("  unknown");
  #endif
  
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0017-Add-acinclude.m4-to-include-required-macros.patch b/meta-networking/recipes-connectivity/freeradius/files/0017-Add-acinclude.m4-to-include-required-macros.patch
index f5c399e584..e9511a6165 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/0017-Add-acinclude.m4-to-include-required-macros.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0017-Add-acinclude.m4-to-include-required-macros.patch
@@ -1,4 +1,4 @@
-From 40abff4062d0521cf2b2a8a4660a3d2933f86f9d Mon Sep 17 00:00:00 2001
+From f48b2887ef2ecff333a5d00551e108fc283c2ba5 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Mon, 1 Apr 2024 09:09:07 +0000
 Subject: [PATCH] Add acinclude.m4 to include required macros
@@ -57,5 +57,5 @@ index 0000000000..690efc3258
 +   echo "$as_me:$LINENO: \$? = $ac_status" >&AS_MESSAGE_LOG_FD
 +   (exit $ac_status); }])
 -- 
-2.35.5
+2.25.1
 
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.5.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.7.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/freeradius/freeradius_3.2.5.bb
rename to meta-networking/recipes-connectivity/freeradius/freeradius_3.2.7.bb
index ec68c1d920..5abdd97594 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.5.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.7.bb
@@ -39,7 +39,7 @@ SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.2.x;lfs=0
 
 raddbdir = "${sysconfdir}/${MLPREFIX}raddb"
 
-SRCREV = "a7acce80f5ba2271d9aeb737a4a91a5bf8317f31"
+SRCREV = "694a97dddbdd26423504afe7c530e8e1502b7354"
 
 UPSTREAM_CHECK_GITTAGREGEX = "release_(?P<pver>\d+(\_\d+)+)"
 
-- 
2.25.1


