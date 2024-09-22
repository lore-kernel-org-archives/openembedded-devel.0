Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0789DCF9C6B
	for <webhook@archiver.kernel.org>; Sun, 22 Sep 2024 03:27:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8954.1726975649342829557
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Sep 2024 20:27:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=999533e59a=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48M3OPi5009065
	for <openembedded-devel@lists.openembedded.org>; Sat, 21 Sep 2024 20:27:29 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41sse4h4g5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 21 Sep 2024 20:27:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SvVM7TGZ6SEscAVAKE6GDNnUG8w+1cBfCBO/hxV03qOYQmjZ2hG6uiRoBkP7YAH/zw36pIyTXMFVIqW8u/usgLXMRHbDKNF9GE6MtNbqUBOsAOcgw5n0LtsRL8rnCJJlmKFyFGbJxA5t2NYi1Kl3EQCOINNlwLyQLrV1Y5rwq8OevUkgMSqwDea5x09AE4k0FGRNKYgavFhcFlMXoYTWs0wZCERUKy4QD42JeXiWB8OTB3JxPB7InUZ/DJE5+wVlRDdiMmYiop7l3SWnkPoOHZrLYyIbd52UAWk0VWrQkYWyHFVcf+wqLlokTf06hyRJ1MXrbpmq+pHaEYPb8uTXJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y6yENL0bRNiuzAg29oAJGYBiqW1irCgbDOnCVHqtCiQ=;
 b=F6LaSshTp859THoj4++NZSkq36L/Gl8hupmRgXOmebzR7elt+2KIsrUZPYb7M/isIssB7mw+JmCgfbDBcedN5tPmPOMe4j4PkhfjdKEGIKdl58mdTiO8+lTwauLHppuHQjRZ82yrnd4d+ArKdrZC6O6q3w3I9P6INKfHLjLxkOjyUZ+GceFdSUkMiKGE/t5uQ70RJVW4L36aABvwZfx+0t7WR8oh1mAVhoCoMiiVI/wLb4rRckRy2wOUOHV1yBHfDlBy8kHcqEXx209r8O3yWXu8UKUDC+h8+Vn1ECUQCr5wgbLoFUYStfOkW7+x1LWZ27ufT/loBHy7jQ/Fvc+qag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS0PR11MB8113.namprd11.prod.outlook.com (2603:10b6:8:127::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.16; Sun, 22 Sep 2024 03:27:26 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.7982.012; Sun, 22 Sep 2024
 03:27:26 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] abseil-cpp: upgrade 20240116.2 -> 20240722.0
Date: Sun, 22 Sep 2024 11:27:16 +0800
Message-Id: <20240922032716.1134287-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:404:15::21) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS0PR11MB8113:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c88880d-a775-4c8c-861e-08dcdab67aff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qV9MB7s+1VNezShJvKbULp7c3BeFQMSWCosuhFeaAAMaoCeMcITCW+BEkghH?=
 =?us-ascii?Q?gMknF8fiyzdyLPPfLwOTfGYZGgyRYNMVbkwRfmRxlH1J7phRBuRV+YL8272Z?=
 =?us-ascii?Q?evIB1oImpPbIPcP1qhXy8+OtC3rS0feHihRKDqc5iXVk45csoa1cWUGC5Sb0?=
 =?us-ascii?Q?AE21L0bfDs11t3hb2nYzqSvYkCq2Te4AvKFNHm10wc9XJH6lKOdZKmVHCjZk?=
 =?us-ascii?Q?gySEVmm2LvE7Y/JIXt0/WOuf0NZwL2FC+OZXUkSICfbG7gK0pZTk+D+KMwP1?=
 =?us-ascii?Q?vdqlVovzkyza1plUEQPDz7pDtD8Sab/kUQFgQEbo6Wji1Xyfdw9ePQABZ5uE?=
 =?us-ascii?Q?TlADrPbmzwCZO1tiYFclgARx2H3LW7KibE0ojAKmDNePodnWerUisUfmotm7?=
 =?us-ascii?Q?XXN5ADaUuFtAZOCQpJGi236dO1oA/Q/DxehsS7WoKYZ3myWQCn8QVLnWfgQz?=
 =?us-ascii?Q?lnkwnZgXny3TvkFvGfZlGm0QoKqTJl4Khmg0nD2EXXXotOvX5UKelOpt3/UE?=
 =?us-ascii?Q?0XjR/QF1f8CnpUBEpJq/7jr/wFo2Mfmkuj5Hsb8gbAan9Mzy+pYy/GSkRhez?=
 =?us-ascii?Q?KpZrC3hLhgQ9jhCM5bllq88jyiqPccTbilAyVWxPNgHrD6vIDe0CZOVzuXEy?=
 =?us-ascii?Q?V++WSOcVV6qSsjAGF3V/XwWDxwW31HG+nikITQVtJSB4UWmBS3mRGL23M7w7?=
 =?us-ascii?Q?hYQPNK5k9x+ViCvXRSdechJwzIKEPizHXbZHVJhYcfxEGLozPH9AGr1kQLkG?=
 =?us-ascii?Q?BWjyewJ8hawG/5k8cDsQw16tH0rbToBJTFJrc65elGG+6+w4nVdATaGtOBxL?=
 =?us-ascii?Q?+Kxr1r4HMzSt59AVtS/mcvX3dgbTf0va9r+8677h+mO5VYTwCZK55KrwPGcd?=
 =?us-ascii?Q?6rMHTZG5Mu87raNda6v6a7s3dyvBa0LMuzyi3FwBdlFmzgmeykDylOlSHEIb?=
 =?us-ascii?Q?6KCWatPZ/NEiWf0puarV8NKg5MNEXVjNmrnsB/OuGIf/GS+z6x8yOABb3Da2?=
 =?us-ascii?Q?rOKzxcdkYOQGdmWCviTP5O8BKa+39QXw30FO+d8SMrY3v36HHLUG2ZQ82CO2?=
 =?us-ascii?Q?kKn+4icOeUs5xfl4yU6Ni+LjlB0ryA3Fb3yRJHAwBJCMt1NuAaKDmct2R+3h?=
 =?us-ascii?Q?ufMgPXYDcTkihwtRBKAzAP8RMfVLgxH9TU8bsz3EU9W24H/5e+w76Q26G1ea?=
 =?us-ascii?Q?O7k5GekY3PHo/TImxLCRD0xWFqSELDAQfd4641kxKKbACVFJURghRaCjOcui?=
 =?us-ascii?Q?WGzpZswpElHjeVfu5H7vhOjJmaoKFFCi+JtxNJ4jL6GfLCb9YZc0sT6UBmVy?=
 =?us-ascii?Q?HDYMSA1X4hJlVu4i2q2av2sZR5AIbYCvu+EnDTYFF0l+ZtlAYfv91k3/C2kM?=
 =?us-ascii?Q?HqVWAOJTiYgZ/J5wC5KWWdLFuK3YFYUIdAmcebBLgYyIPIpKJM4nsMeVp8cJ?=
 =?us-ascii?Q?JVxe6iA2azE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wQ+lIfxeNHX5aosK1W86NQ5AjqqAP8x8L9iNeNVY16n/yFZAaz+Sgn4dQOQb?=
 =?us-ascii?Q?XV5clHY98iKbnNsBIdZUzMVVxuJFHa9EOL3m77nuuE8SyuA8Sogi4fHyXC4T?=
 =?us-ascii?Q?OAHrUGgpEmNPni/Z6aOzwfC2jPbDhuyScrgHVrPd4tMQRw4QbZrp4Y9yW2uE?=
 =?us-ascii?Q?+77rZMflVylbD6RGgbGn0jQmweJrS+1ATUUkFfaufCotvecWzw2WYYKLj6wf?=
 =?us-ascii?Q?svC8FUN3JwYvcJcdRITEEZ6pJkAWZgNB5WKOBk6A6DJeptq0+3hlA6v53OyQ?=
 =?us-ascii?Q?9Cm5RsaMalNizlkgXk6Q7PDIAvlk/JhsS5esjr4bdC05s4BccOqj0QpcYjFW?=
 =?us-ascii?Q?PtFzoQxuTnMLjgiegUVMaRZkiGDQe7s4q94wqxb/YSA2RYMn9z1wIjEuw9GG?=
 =?us-ascii?Q?2Atsw5+7FWJMboxUT9H5MHFDPfH4Xt70RjIlk6/yR43S03MdmzanrfBIPJet?=
 =?us-ascii?Q?m3GEbvbpBgkfL6UleWzB+cTNSWCEghZHKlZ/Ujl/8+gQ8vRi1j0nU5J2nhc7?=
 =?us-ascii?Q?UxxPxGpEce+aG5E9GEfKu9Ga5R9m4xHvQp77Whm2Mf9NsXPNN3wkoDGyevpo?=
 =?us-ascii?Q?IlTpMagXkcbCMGW8wqVIAEPuLV8C8WTy6Zw7VHJzjQFqQu5m7ZCrStEgybNL?=
 =?us-ascii?Q?8pAyu+HMhuHcjjKDg6Ijaw9lWrf68gAyiMPqb7B7SfDruk4OF2xFcZWt5Sts?=
 =?us-ascii?Q?7JwWfha2HsMiWpKgVMpr/P+DzOwbmpC1nIgKG1YL1PfdooWP52WkZ3NXo9pC?=
 =?us-ascii?Q?MFzRn78d6wyDt2tOD2+gotiHGRkzM6snXRdlAY52ohDtp0zUkQAvL/rSvw2T?=
 =?us-ascii?Q?WdcsoUC66QlLF6m/38oLxyevBHiF4A5tygP+cbqJKdVYOc31wJ2lpowBgf2s?=
 =?us-ascii?Q?qlQeIwBZMDK6wTBNEvOAwJfD5cyWvnhXY0cHY+kRVWfQMT/j7MNG+zV9VFOA?=
 =?us-ascii?Q?E+abgHlluQi66pGfTh11b248Yk1ANOcz+jcDdltbMQkHb0p/mz2jP58HETWV?=
 =?us-ascii?Q?x5dE5VLTG2qCN/cAGdNQA+jXFifV9Sg1qexcLw5zMQ8fes7Kh3hxRVdt/hk6?=
 =?us-ascii?Q?aGiO1brG5b1C9u9f4IYA5qNJtL/W3G+bA1NamC+jV5DqM3CyLZjKicbJU2ki?=
 =?us-ascii?Q?G7mkoaLfYZ5V4WDuoSd0F86UK7KqftGQ0Jjvz9iqXvKqzZmJkSTUxrWLxQxk?=
 =?us-ascii?Q?F1hUL69ZjK5FMdDjIOHud5KaOM2C0FtQs4TJGuzkun6HiMpHvQRGA++FpeO/?=
 =?us-ascii?Q?+KuzOLdFHWzBxEgjxLlROW6lP7NRQHx12ANBz1lu1kA6pPtBs6V8eGu+HTM9?=
 =?us-ascii?Q?t1RG9CF8ukfDTE8+UstyA2JngvmkNH46wTsjQ34wYjBhEvWad+GX+3RwtVxt?=
 =?us-ascii?Q?1dlgp+fGQE/y14dydeQIlrpHMU9ghaTC1Lunc8N+sXSQBZWYxyRZ/znJSdPJ?=
 =?us-ascii?Q?BbJL1ytSCvVKGTp0xe1YcvJ/3Us1YfftMgVjVJtsmEbgTEuwS0WmEIYwH6aP?=
 =?us-ascii?Q?/tlXJD1qCv3to89/WY3hU5gzIHdrtpSX30wQQuluRpftszP1W1uhLSZU3tYo?=
 =?us-ascii?Q?wvxFbrbR9kA2LlBeVAuauTCM6OzHGuMQ1cfIGLrJ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c88880d-a775-4c8c-861e-08dcdab67aff
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2024 03:27:26.4863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FLsO2VgivaJFFQ5fS9HsPzM6ovDItZK7At0naM+5Dypmpw3O3q8wfYYCz3RB/6rPacEPPKWSSnw0X3EsVJscbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8113
X-Authority-Analysis: v=2.4 cv=ANzEoFnr c=1 sm=1 tr=0 ts=66ef8ea0 cx=c_pps a=5b96o3JgDboJA9an2DnXiA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=yMhMjlubAAAA:8 a=hXZgYZo4AAAA:8 a=VwQbUJbxAAAA:8 a=k-42gJp3AAAA:8 a=frj-uP71LKxNOOxC1N0A:9 a=LRMKk6TO5PgEbQon:21 a=FdTzh2GWekK77mhwV6Dw:22 a=37BJPeUnzxYkbV1yBC-1:22 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-ORIG-GUID: 6ej9zWckzGrDp_wI2oMOD1tgP9jk5JCE
X-Proofpoint-GUID: 6ej9zWckzGrDp_wI2oMOD1tgP9jk5JCE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-22_01,2024-09-19_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 suspectscore=0 mlxscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409220024
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Sep 2024 03:27:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112447

ChangeLog:
https://github.com/abseil/abseil-cpp/releases/tag/20240722.0

* Drop backport patch:
  0004-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch
* Refresh patches

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../0001-absl-always-use-asm-sgidefs.h.patch  |  7 +-
 ...e-maes-option-from-cross-compilation.patch | 17 ++--
 ...e-neon-option-from-cross-compilation.patch | 18 ++--
 ...aledcycleclock-remove-RISC-V-support.patch | 82 -------------------
 ...ixes.patch => 0004-abseil-ppc-fixes.patch} | 44 +++++++---
 ...20240116.2.bb => abseil-cpp_20240722.0.bb} |  7 +-
 6 files changed, 56 insertions(+), 119 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch
 rename meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/{abseil-ppc-fixes.patch => 0004-abseil-ppc-fixes.patch} (69%)
 rename meta-oe/recipes-devtools/abseil-cpp/{abseil-cpp_20240116.2.bb => abseil-cpp_20240722.0.bb} (88%)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-always-use-asm-sgidefs.h.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-always-use-asm-sgidefs.h.patch
index 5242b29e0..6fecf2560 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-always-use-asm-sgidefs.h.patch
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-always-use-asm-sgidefs.h.patch
@@ -1,7 +1,7 @@
-From 738549dea7a4e6c462a79962c414eaa450c2cffd Mon Sep 17 00:00:00 2001
+From 11faa06436fdeb0c9948080a11f9a99d3b5ba16c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 9 Apr 2020 13:06:27 -0700
-Subject: [PATCH 1/3] absl: always use <asm/sgidefs.h>
+Subject: [PATCH] absl: always use <asm/sgidefs.h>
 
 Fixes mips/musl build, since sgidefs.h is not present on all C libraries
 but on linux asm/sgidefs.h is there and contains same definitions, using
@@ -10,13 +10,12 @@ that makes it portable.
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  absl/base/internal/direct_mmap.h | 6 +-----
  1 file changed, 1 insertion(+), 5 deletions(-)
 
 diff --git a/absl/base/internal/direct_mmap.h b/absl/base/internal/direct_mmap.h
-index e492bb0..c8a4fba 100644
+index 1beb2ee4..140b0697 100644
 --- a/absl/base/internal/direct_mmap.h
 +++ b/absl/base/internal/direct_mmap.h
 @@ -41,13 +41,9 @@
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0002-Remove-maes-option-from-cross-compilation.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0002-Remove-maes-option-from-cross-compilation.patch
index b92a48752..d49e860f2 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0002-Remove-maes-option-from-cross-compilation.patch
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0002-Remove-maes-option-from-cross-compilation.patch
@@ -1,20 +1,19 @@
-From d25cf3b9aa873595a19e197cc29ab46c0093bff1 Mon Sep 17 00:00:00 2001
+From a573ccd57e713486e7d8e782d6b3b34fde01ff9e Mon Sep 17 00:00:00 2001
 From: Sinan Kaya <sinan.kaya@microsoft.com>
 Date: Mon, 3 Feb 2020 03:25:57 +0000
-Subject: [PATCH 2/3] Remove maes option from cross-compilation
+Subject: [PATCH] Remove maes option from cross-compilation
 
----
 Upstream-Status: Pending
-
+---
  absl/copts/GENERATED_AbseilCopts.cmake | 4 ----
  absl/copts/GENERATED_copts.bzl         | 4 ----
  2 files changed, 8 deletions(-)
 
 diff --git a/absl/copts/GENERATED_AbseilCopts.cmake b/absl/copts/GENERATED_AbseilCopts.cmake
-index a4ab1aa2041e..23b9253c1f00 100644
+index da2282fe..5e0e8dfd 100644
 --- a/absl/copts/GENERATED_AbseilCopts.cmake
 +++ b/absl/copts/GENERATED_AbseilCopts.cmake
-@@ -158,7 +158,3 @@ list(APPEND ABSL_RANDOM_HWAES_ARM64_FLAGS
+@@ -229,7 +229,3 @@ list(APPEND ABSL_RANDOM_HWAES_ARM64_FLAGS
  list(APPEND ABSL_RANDOM_HWAES_MSVC_X64_FLAGS
  )
  
@@ -23,10 +22,10 @@ index a4ab1aa2041e..23b9253c1f00 100644
 -    "-msse4.1"
 -)
 diff --git a/absl/copts/GENERATED_copts.bzl b/absl/copts/GENERATED_copts.bzl
-index a6efc98e11d4..1e847f769501 100644
+index b9e0071e..0072008c 100644
 --- a/absl/copts/GENERATED_copts.bzl
 +++ b/absl/copts/GENERATED_copts.bzl
-@@ -159,7 +159,3 @@ ABSL_RANDOM_HWAES_ARM64_FLAGS = [
+@@ -230,7 +230,3 @@ ABSL_RANDOM_HWAES_ARM64_FLAGS = [
  ABSL_RANDOM_HWAES_MSVC_X64_FLAGS = [
  ]
  
@@ -35,5 +34,5 @@ index a6efc98e11d4..1e847f769501 100644
 -    "-msse4.1",
 -]
 -- 
-2.36.1
+2.25.1
 
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-Remove-neon-option-from-cross-compilation.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-Remove-neon-option-from-cross-compilation.patch
index 1a80a428b..c82b9e1b5 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-Remove-neon-option-from-cross-compilation.patch
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-Remove-neon-option-from-cross-compilation.patch
@@ -1,24 +1,24 @@
-From fb24c3e3539b5743d398a429a302a3886186f261 Mon Sep 17 00:00:00 2001
+From 632632508daf8bb3a5800dac937ffc33c6d85973 Mon Sep 17 00:00:00 2001
 From: Jonas Gorski <jonas.gorski@bisdn.de>
 Date: Thu, 16 Jun 2022 11:46:31 +0000
-Subject: [PATCH 3/3] Remove neon option from cross compilation
+Subject: [PATCH] Remove neon option from cross compilation
 
 Not every arm platform supports neon instructions, so do not enforce
 them.
 
-Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
----
 Upstream-Status: Pending
 
+Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
+---
  absl/copts/GENERATED_AbseilCopts.cmake | 4 ----
  absl/copts/GENERATED_copts.bzl         | 4 ----
  2 files changed, 8 deletions(-)
 
 diff --git a/absl/copts/GENERATED_AbseilCopts.cmake b/absl/copts/GENERATED_AbseilCopts.cmake
-index 23b9253c1f00..5d112a97f3e4 100644
+index 5e0e8dfd..57cfc4d3 100644
 --- a/absl/copts/GENERATED_AbseilCopts.cmake
 +++ b/absl/copts/GENERATED_AbseilCopts.cmake
-@@ -147,10 +147,6 @@ list(APPEND ABSL_MSVC_TEST_FLAGS
+@@ -218,10 +218,6 @@ list(APPEND ABSL_MSVC_TEST_FLAGS
      "/DNOMINMAX"
  )
  
@@ -30,10 +30,10 @@ index 23b9253c1f00..5d112a97f3e4 100644
      "-march=armv8-a+crypto"
  )
 diff --git a/absl/copts/GENERATED_copts.bzl b/absl/copts/GENERATED_copts.bzl
-index 1e847f769501..3e10db204faf 100644
+index 0072008c..72840fda 100644
 --- a/absl/copts/GENERATED_copts.bzl
 +++ b/absl/copts/GENERATED_copts.bzl
-@@ -148,10 +148,6 @@ ABSL_MSVC_TEST_FLAGS = [
+@@ -219,10 +219,6 @@ ABSL_MSVC_TEST_FLAGS = [
      "/DNOMINMAX",
  ]
  
@@ -45,5 +45,5 @@ index 1e847f769501..3e10db204faf 100644
      "-march=armv8-a+crypto",
  ]
 -- 
-2.36.1
+2.25.1
 
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch
deleted file mode 100644
index 461df7a60..000000000
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 7335a36d0b5c1c597566f9aa3f458a5b6817c3b4 Mon Sep 17 00:00:00 2001
-From: aurel32 <aurelien@aurel32.net>
-Date: Fri, 22 Mar 2024 14:21:13 -0700
-Subject: [PATCH] PR #1644: unscaledcycleclock: remove RISC-V support
-
-Imported from GitHub PR https://github.com/abseil/abseil-cpp/pull/1644
-
-Starting with Linux 6.6 [1], RDCYCLE is a privileged instruction on RISC-V and can't be used directly from userland. There is a sysctl option to change that as a transition period, but it will eventually disappear.
-
-The RDTIME instruction is another less accurate alternative, however its frequency varies from board to board, and there is currently now way to get its frequency from userland [2].
-
-Therefore this patch just removes the code for unscaledcycleclock on RISC-V. Without processor specific implementation, abseil relies on std::chrono::steady_clock::now().time_since_epoch() which is basically a wrapper around clock_gettime (CLOCK_MONOTONIC), which in turns use __vdso_clock_gettime(). On RISC-V this VDSO is just a wrapper around RDTIME correctly scaled to use nanoseconds units.
-
-This fixes the testsuite on riscv64, tested on a VisionFive 2 board.
-
-[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cc4c07c89aada16229084eeb93895c95b7eabaa3
-[2] https://github.com/abseil/abseil-cpp/pull/1631
-Merge 43356a2548cfde76e164d446cb69004b488c6a71 into 76f8011beabdaee872b5fde7546e02407b220cb1
-
-Merging this change closes #1644
-
-COPYBARA_INTEGRATE_REVIEW=https://github.com/abseil/abseil-cpp/pull/1644 from aurel32:rv64-no-unscaledcycleclock 43356a2548cfde76e164d446cb69004b488c6a71
-PiperOrigin-RevId: 618286262
-Change-Id: Ie4120a727e7d0bb185df6e06ea145c780ebe6652
-
-Upstream-Status: Backport [https://github.com/abseil/abseil-cpp/commit/7335a36d]
-[Adapted to apply on top of meta-oe's patch stack]
-Signed-off-by: Scott Murray <scott.murray@konsulko.com>
----
- absl/base/internal/unscaledcycleclock.cc       | 12 ------------
- absl/base/internal/unscaledcycleclock_config.h |  5 ++---
- 2 files changed, 2 insertions(+), 15 deletions(-)
-
-diff --git a/absl/base/internal/unscaledcycleclock.cc b/absl/base/internal/unscaledcycleclock.cc
-index f11fecb3..103b4f6a 100644
---- a/absl/base/internal/unscaledcycleclock.cc
-+++ b/absl/base/internal/unscaledcycleclock.cc
-@@ -121,18 +121,6 @@ double UnscaledCycleClock::Frequency() {
-   return aarch64_timer_frequency;
- }
- 
--#elif defined(__riscv)
--
--int64_t UnscaledCycleClock::Now() {
--  int64_t virtual_timer_value;
--  asm volatile("rdcycle %0" : "=r"(virtual_timer_value));
--  return virtual_timer_value;
--}
--
--double UnscaledCycleClock::Frequency() {
--  return base_internal::NominalCPUFrequency();
--}
--
- #elif defined(_M_IX86) || defined(_M_X64)
- 
- #pragma intrinsic(__rdtsc)
-diff --git a/absl/base/internal/unscaledcycleclock_config.h b/absl/base/internal/unscaledcycleclock_config.h
-index 5e232c1a..83552fc5 100644
---- a/absl/base/internal/unscaledcycleclock_config.h
-+++ b/absl/base/internal/unscaledcycleclock_config.h
-@@ -22,7 +22,6 @@
- // The following platforms have an implementation of a hardware counter.
- #if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || \
-     ((defined(__powerpc__) || defined(__ppc__)) && defined(__GLIBC__)) || \
--    defined(__riscv) ||     \
-     defined(_M_IX86) || (defined(_M_X64) && !defined(_M_ARM64EC))
- #define ABSL_HAVE_UNSCALED_CYCLECLOCK_IMPLEMENTATION 1
- #else
-@@ -54,8 +53,8 @@
- #if ABSL_USE_UNSCALED_CYCLECLOCK
- // This macro can be used to test if UnscaledCycleClock::Frequency()
- // is NominalCPUFrequency() on a particular platform.
--#if (defined(__i386__) || defined(__x86_64__) || defined(__riscv) || \
--     defined(_M_IX86) || defined(_M_X64))
-+#if (defined(__i386__) || defined(__x86_64__) || defined(_M_IX86) || \
-+     defined(_M_X64))
- #define ABSL_INTERNAL_UNSCALED_CYCLECLOCK_FREQUENCY_IS_CPU_FREQUENCY
- #endif
- #endif
--- 
-2.44.0
-
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/abseil-ppc-fixes.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-abseil-ppc-fixes.patch
similarity index 69%
rename from meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/abseil-ppc-fixes.patch
rename to meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-abseil-ppc-fixes.patch
index f2ebd9f08..ba0cd6692 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/abseil-ppc-fixes.patch
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-abseil-ppc-fixes.patch
@@ -1,4 +1,7 @@
-Upstream-Status: Pending
+From f9607924225ca59fb6c60222e6424b84e6f70029 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 21 Sep 2024 20:53:06 +0800
+Subject: [PATCH] abseil: ppc fixes
 
 An all-in-one patch that fixes several issues:
 
@@ -9,14 +12,24 @@ An all-in-one patch that fixes several issues:
 
 Sourced from void linux
 
+Upstream-Status: Pending
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ absl/base/internal/unscaledcycleclock.cc       | 4 ++--
+ absl/base/internal/unscaledcycleclock_config.h | 3 ++-
+ absl/debugging/internal/examine_stack.cc       | 8 +++++++-
+ absl/debugging/internal/stacktrace_config.h    | 2 +-
+ 4 files changed, 12 insertions(+), 5 deletions(-)
 
+diff --git a/absl/base/internal/unscaledcycleclock.cc b/absl/base/internal/unscaledcycleclock.cc
+index a0bf3a65..103b4f6a 100644
 --- a/absl/base/internal/unscaledcycleclock.cc
 +++ b/absl/base/internal/unscaledcycleclock.cc
 @@ -20,7 +20,7 @@
  #include <intrin.h>
  #endif
-
+ 
 -#if defined(__powerpc__) || defined(__ppc__)
 +#if (defined(__powerpc__) || defined(__ppc__)) && defined(__GLIBC__)
  #ifdef __GLIBC__
@@ -25,30 +38,34 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 @@ -58,7 +58,7 @@ double UnscaledCycleClock::Frequency() {
    return base_internal::NominalCPUFrequency();
  }
-
+ 
 -#elif defined(__powerpc__) || defined(__ppc__)
 +#elif (defined(__powerpc__) || defined(__ppc__)) && defined(__GLIBC__)
-
+ 
  int64_t UnscaledCycleClock::Now() {
  #ifdef __GLIBC__
+diff --git a/absl/base/internal/unscaledcycleclock_config.h b/absl/base/internal/unscaledcycleclock_config.h
+index 43a3dabe..196a8535 100644
 --- a/absl/base/internal/unscaledcycleclock_config.h
 +++ b/absl/base/internal/unscaledcycleclock_config.h
 @@ -21,7 +21,8 @@
-
+ 
  // The following platforms have an implementation of a hardware counter.
  #if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || \
--    defined(__powerpc__) || defined(__ppc__) || defined(__riscv) ||     \
+-    defined(__powerpc__) || defined(__ppc__) || defined(_M_IX86) ||     \
 +    ((defined(__powerpc__) || defined(__ppc__)) && defined(__GLIBC__)) || \
-+    defined(__riscv) ||     \
-     defined(_M_IX86) || (defined(_M_X64) && !defined(_M_ARM64EC))
++    defined(_M_IX86) ||     \
+     (defined(_M_X64) && !defined(_M_ARM64EC))
  #define ABSL_HAVE_UNSCALED_CYCLECLOCK_IMPLEMENTATION 1
  #else
+diff --git a/absl/debugging/internal/examine_stack.cc b/absl/debugging/internal/examine_stack.cc
+index 3dd6ba1a..f923b055 100644
 --- a/absl/debugging/internal/examine_stack.cc
 +++ b/absl/debugging/internal/examine_stack.cc
-@@ -33,6 +33,10 @@
+@@ -36,6 +36,10 @@
  #include <csignal>
  #include <cstdio>
-
+ 
 +#if defined(__powerpc__)
 +#include <asm/ptrace.h>
 +#endif
@@ -56,7 +73,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include "absl/base/attributes.h"
  #include "absl/base/internal/raw_logging.h"
  #include "absl/base/macros.h"
-@@ -174,8 +178,10 @@ void* GetProgramCounter(void* const vuc) {
+@@ -177,8 +181,10 @@ void* GetProgramCounter(void* const vuc) {
      return reinterpret_cast<void*>(context->uc_mcontext.pc);
  #elif defined(__powerpc64__)
      return reinterpret_cast<void*>(context->uc_mcontext.gp_regs[32]);
@@ -68,6 +85,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #elif defined(__riscv)
      return reinterpret_cast<void*>(context->uc_mcontext.__gregs[REG_PC]);
  #elif defined(__s390__) && !defined(__s390x__)
+diff --git a/absl/debugging/internal/stacktrace_config.h b/absl/debugging/internal/stacktrace_config.h
+index 3929b1b7..23d5e504 100644
 --- a/absl/debugging/internal/stacktrace_config.h
 +++ b/absl/debugging/internal/stacktrace_config.h
 @@ -60,7 +60,7 @@
@@ -79,3 +98,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #define ABSL_STACKTRACE_INL_HEADER \
    "absl/debugging/internal/stacktrace_powerpc-inl.inc"
  #elif defined(__aarch64__)
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.2.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb
similarity index 88%
rename from meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.2.bb
rename to meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb
index 87ab23931..f44a5d908 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.2.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb
@@ -7,14 +7,13 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915"
 
-SRCREV = "d7aaad83b488fd62bd51c81ecf16cd938532cc0a"
-BRANCH = "lts_2024_01_16"
+SRCREV = "4447c7562e3bc702ade25105912dce503f0c4010"
+BRANCH = "lts_2024_07_22"
 SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
            file://0001-absl-always-use-asm-sgidefs.h.patch             \
            file://0002-Remove-maes-option-from-cross-compilation.patch \
-           file://abseil-ppc-fixes.patch \
            file://0003-Remove-neon-option-from-cross-compilation.patch \
-           file://0004-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch \
+           file://0004-abseil-ppc-fixes.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.25.1


