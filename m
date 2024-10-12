Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED37D1A431
	for <webhook@archiver.kernel.org>; Sat, 12 Oct 2024 06:53:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5733.1728716012708255125
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 23:53:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0015cf250c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49C6rWTU011280
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 23:53:32 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2043.outbound.protection.outlook.com [104.47.55.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 426sfgh950-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 23:53:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iFIeuTfyhAOdWY72GRrT2sRapQM6nHb9YQ/gFkG5I8tFQ0tXhuelN33pv0vYo3B2oy94gZKXaJjgbXKIt0mhm5M6uALUujOptPlTV0GGaOAbQMDX3XnUs2HiM8OIBzmDh9BDtn3sg5iH0TFChJRhJwoY4sIcRBAV8+LmvVvOMCIVxsF3K32ZblPvinQP18efhPvPtzHtYEq9DDasGf8Pxjx7scmtLFMssA2UKpsSZRkpq8KxyBTYDCh9GS71djICPPx4Eyt/TfnqJMmsZ3rOFteYB61zdEkJ7+ydBfHppcnP1zDpSzUDHh5PqxPYl5yHlAuYmjGgrrAblqGJ1zVHYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RsbyJ+1nOctv8sCsUsuB/B3/OmgWI2eSMyUEgiAbDWw=;
 b=KqtPFJ/ZTd4miPZBcDfC00Z/SXRv2TTHf3ZDPgmLGiW0awdnsfujVNMgbgjX+2Vj0cVKFC6HKs/8TFgAxt2/MP1YWIW7TS83oRu5oeOLspDKJOn/DP2/nuUdMuE297vUYbcSMZ+wVHpptSlo9oJ7MprDNBsotOSDZY3GSbv1Kab2niN6aAdCsSzKA4GKv9ufTWaqIhlZF4b0GjAu7b1D4jwHjr+RRi8VsCjZufOhYVeDaZylt4PI4a9IaSxeIYnDH9Kkn+aq0D/DPFxl0wPuAjjx4SUKU1/44EIenbHjHMxJzQoVnf+0OpziCMGDZPqPeWqG6MisnGeRfDmr0VYXeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CY8PR11MB7267.namprd11.prod.outlook.com (2603:10b6:930:9a::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.20; Sat, 12 Oct 2024 06:53:30 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8048.017; Sat, 12 Oct 2024
 06:53:30 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] pm-graph: upgrade 5.5 -> 5.13
Date: Sat, 12 Oct 2024 14:53:12 +0800
Message-Id: <20241012065312.3239400-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241012065312.3239400-1-yi.zhao@windriver.com>
References: <20241012065312.3239400-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::14)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CY8PR11MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: 11669306-4343-449d-f715-08dcea8a94e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dtrqLaLWJSHio47FbCEvSE2tJqBKjCUd7u82D4FFWTSLPoBxLbFt6Dn0XHul?=
 =?us-ascii?Q?ECQuEQj04PT6rUmQsg1KgYJKQzmyWz3oXvyXKRH9jQwOzRRgd+ZRFaIeZpFH?=
 =?us-ascii?Q?7lsj+o7xTqkO4tcDEi3kRJniOaa9w7yWdJyZzctcRPh4t/K6dL6mL9Ai072s?=
 =?us-ascii?Q?3njZFghPCAWQvlXz7NfkGtKTpMhfdtEHwbysR10cefnpqMZmm9kz5ii6v2TK?=
 =?us-ascii?Q?LcutWbrLjCGhLIrAWaplCasXfSgltMF6Q+ifQ7KaO35qFpcT9I2kJgvYD5BZ?=
 =?us-ascii?Q?t3JfMMNAVxYO2I6CXLXUIHUv3kkusfR31tA4a2Yw0hSh0CtZHSSf43g2xbe7?=
 =?us-ascii?Q?Gu0sYvLkTebplj0woClSP7GVvd4xXmHv7V93lUbZ/YVtg05nYbSVymGqav3j?=
 =?us-ascii?Q?Ve8856z6gFKZoQKkH0gcpk0jqXBeDGemDoaQl28qlYmd0VkA73sxi+R5wvOH?=
 =?us-ascii?Q?EvA6iaJT7glz7mKn5dBlkAiowDMk7FztD0sgUeJAnf8n7JloXcp6F6rKV9JZ?=
 =?us-ascii?Q?q4DCT+weg+St+zTvZxAVKijsEZG79d4SPdDnRXE/o1NYoWJujcTS3JTzHYLa?=
 =?us-ascii?Q?JQcXICf54+ee+ZNRqvhPR85QeggkWV2Ce8INVI1mI56WyLSlNY41UKFQexzv?=
 =?us-ascii?Q?DVyfRe8Mu35A22w+Cq2jJ/KyQ9OWMfGLs9pZxbTu2IIZHS7NWQwADvrmdtUe?=
 =?us-ascii?Q?LiIssCmMjpBLrQfU+X72ooCK5ItBqnw/3z0W45+rLHTT8UduxW91ALQJFo16?=
 =?us-ascii?Q?MX4xXg0kkTH1sFgf1s/PHSZVVR/EbQGluwdtMnv0mvHY2pjot3HZVZQ+jZfa?=
 =?us-ascii?Q?cqEb+zUrl1opRwtrp69PMXJ21RHu9DzVv+B/y1I7AiXoQCLrw8eEOJMysEbB?=
 =?us-ascii?Q?pQBcevdMMSYXS+MTNYyOyIRAeH3VgKVOmtScXtU9cfKrHAO+8wTHQPRoMtIB?=
 =?us-ascii?Q?g0JGiR/NgT0a/nbkff3CfRDCxhE8+K+1PS/lSDy7ZHBT4b2cAvWrmPekytaW?=
 =?us-ascii?Q?NJqfcDYM0GJQqlTO+kuP/3gOvfY8cvW6Y2FORrcLG0VItpPmMokAlwJyOeH4?=
 =?us-ascii?Q?0HRLMIz7j7apmgTdJu5ozOHq4vHN0L0CPn2n/RKgsefks9+qrKzgk28yg9Ht?=
 =?us-ascii?Q?bACpB+AmYV/nDmLz788U3xJwJ1DK360Mw1Tphruety4c+D3cRp5PCb9WOo5I?=
 =?us-ascii?Q?8FgO8LDnl1gnwOkwOvOCeFrWPh+BcnXFY2+XZ2cxmoDo5PnEqjyYrUna2GVm?=
 =?us-ascii?Q?/8txTTqCnAu/tg8XQ5cYw7xna3hQWf7gtnpDHIpr4G0+rpGk3zoDWPopilsW?=
 =?us-ascii?Q?Guz4MpTBqPrbjB9FM5vpR2adJ49yYjl1IN/rH/53EQeX2w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?28FVQvJpLjneXr9QWmJLdPDA5AyvnTzzBQPFDXYW8z9fljpDrKoijzsWBxRD?=
 =?us-ascii?Q?vBERUcLGpGZwjMiMDUhSR3mbDtPA/BECxwGV1/FHWBdOCy/iQ1aiVnPWHJ7V?=
 =?us-ascii?Q?V1JlOUbX8PQVm7XSPB57V69bX3RBlieepRRJBaefGJUNVNEjE05/jyYhbDXC?=
 =?us-ascii?Q?X+UuTx6P7KjYNQ3frwc8sHeQGeCE4hI/4cqU1v5wXaRmTrJ4t8Bq7nNYOYMy?=
 =?us-ascii?Q?zhEZUWVmDztMz06INpy+W2RiTVXzj+7dya6okEwTY0FOrs5x/Ac7p1mLYyea?=
 =?us-ascii?Q?zZs+NnUbpgRIKU8O94tKz+XpAUHCbv6wDcOP9qsmim4Z5AOSNeoXQCFhIUMC?=
 =?us-ascii?Q?DWq3YIgp3YrdoLjdW6mUh3byROPw4LqtT+WQCk1iQCVerQ/d2NrQlfixVoHE?=
 =?us-ascii?Q?BEtdTiFFQF653PzfkdwZyeNZtPcxSgzD5SjYvnsBYjhmE0pOWr3podT1C7UH?=
 =?us-ascii?Q?15sGGEkCgvQqSW5VqK8rCQvVya9GExfuhR6b7AhAX+68rPvUFNydIMYSpH0t?=
 =?us-ascii?Q?gcf+xdAu6u7eWD2fEraLqZUYCx6nxIfbPV80kESUTmP9mr34yG0ssuvRVS+d?=
 =?us-ascii?Q?F8NMeU8MLhW1xs8wxTXvWQt5zgINJliNu57yC7UaxMsjki0EJrlC/uha369y?=
 =?us-ascii?Q?Id6p5iQ36tjVCHmtXZpLBYINu4cANGTVvMdW46tvjX744cXhf61Z1CxFksA3?=
 =?us-ascii?Q?QizRSKDjTIR5VHp4xRRdFslgANaGinLR2fENxuArNDU+/aR3jGSehj2UkVT3?=
 =?us-ascii?Q?ne4FOwh7OZkBRC6MF1zZj5TV7Rj7Z+0ZAzrX/aYnHgB2d705imaffGJFda9l?=
 =?us-ascii?Q?4uhVT78yCK/wrj0beiBFwFtwPqGyXUdiEptQiwWZyrVh93HzMX2y/q/evGrf?=
 =?us-ascii?Q?iLvr2q0q9MfobEKy/qQUV3J5pBa9zouWbNVq3d+3e76jgxiDaF7XMm3wya5N?=
 =?us-ascii?Q?rZ9F0iTVyoRSsgrZZYT1omN2WAvzt2ZVgo80PRrEr+MtqNBuJ6dZEGuU/9sS?=
 =?us-ascii?Q?Me+FLQpWPuC0unbTz5RtLCGuPI70fiWip6Xeq1r7n3/he5S06+9SieQAdDfL?=
 =?us-ascii?Q?1r0vqm3RI7zQslioKXtk839P+TXncEoCTbhRk6upv/ogG+CM35KcA9L1NCSx?=
 =?us-ascii?Q?XjJpWOrQ0HiS5+A6OIT6C1Qo9GTANTnscDrv8cr3eVM+Lh9ih7mMYF/cfamY?=
 =?us-ascii?Q?s/ksl2SxxZdt9RpuiTz1/ZEBX6llHZFXmlgWCcNOpkyiYvmblpLQNg8rf9ip?=
 =?us-ascii?Q?cUtGd+MpakvHnOrggCDNu2jeWhDLkLfP6S4i1jyHGoTD5RBGt26lO7w4qJA/?=
 =?us-ascii?Q?FMcnUIiaFI9CeEFaMgdeitlmjUM8tg9+1iPBADPLnaGgXnbnxikQBrPuXeTY?=
 =?us-ascii?Q?2OTqeCuSFzr+tyvYx3Nn5LbFVI5m3O1cD7fpN3G0F0FxYNXZb9GJSKMVYxNn?=
 =?us-ascii?Q?GZ5rZfQXz0ZJohkPOOmlQCzf7zDusZW9UAP9CPvRMxGQbX5DJhNXV9CbazsT?=
 =?us-ascii?Q?AEtds4EgCsKaXWUDvKuhpgQJs5UR5NZe0LPl+ztZ/Q/7vpzyLwI+VuPItI/d?=
 =?us-ascii?Q?XQsPqj4pCMBc9SaV5G0su+ueNmTn+YGUJDsDTNgD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11669306-4343-449d-f715-08dcea8a94e9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 06:53:30.7608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ei6lhBHV3xS2LVzLL9OSMF7GNcgeTAiS+JckRqKWUPiH/ICbESXNg5mUXOq5aiuLiF61apFEzopdiy6+M8VJcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7267
X-Authority-Analysis: v=2.4 cv=QrQM3kyd c=1 sm=1 tr=0 ts=670a1cec cx=c_pps a=2TzYObwzRp/N0knVItohZg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=QyXUC8HyAAAA:8
 a=i3X5FwGiAAAA:8 a=FfdT2z34ZAYTguh2hjMA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-GUID: ecuN5hHNrMelVqsDeGvXrGHemLyk5vyT
X-Proofpoint-ORIG-GUID: ecuN5hHNrMelVqsDeGvXrGHemLyk5vyT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-12_03,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0 phishscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2409260000
 definitions=main-2410120045
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Oct 2024 06:53:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112821

ChangeLog:
https://github.com/intel/pm-graph/releases/tag/5.13

* Refresh 0001-Makefile-fix-multilib-build-failure.patch
* Drop the following patches as the issues have been fixed upstream:
  0001-sleepgraph.py-use-python3.patch
  0001-sleepgraph-add-support-for-RT-kernel-ftrace-flags.patch
  0001-sleepgraph.py-parse-unfished-cpu-exec-line.patch

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-Makefile-fix-multilib-build-failure.patch | 105 +++++++-----------
 ...d-support-for-RT-kernel-ftrace-flags.patch |  42 -------
 ...raph.py-parse-unfished-cpu-exec-line.patch |  51 ---------
 .../0001-sleepgraph.py-use-python3.patch      |  39 -------
 .../{pm-graph_5.5.bb => pm-graph_5.13.bb}     |  13 +--
 5 files changed, 47 insertions(+), 203 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/pm-graph/pm-graph/0001-sleepgraph-add-support-for-RT-kernel-ftrace-flags.patch
 delete mode 100644 meta-oe/recipes-kernel/pm-graph/pm-graph/0001-sleepgraph.py-parse-unfished-cpu-exec-line.patch
 delete mode 100644 meta-oe/recipes-kernel/pm-graph/pm-graph/0001-sleepgraph.py-use-python3.patch
 rename meta-oe/recipes-kernel/pm-graph/{pm-graph_5.5.bb => pm-graph_5.13.bb} (69%)

diff --git a/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-Makefile-fix-multilib-build-failure.patch b/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-Makefile-fix-multilib-build-failure.patch
index 56981d96f..e28903d6b 100644
--- a/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-Makefile-fix-multilib-build-failure.patch
+++ b/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-Makefile-fix-multilib-build-failure.patch
@@ -1,4 +1,4 @@
-From 50cea8fd3c07ab27da6edce865a49339f16f3b57 Mon Sep 17 00:00:00 2001
+From 468850b5d39435025633df14dda3d48651d9ec29 Mon Sep 17 00:00:00 2001
 From: Naveen Saini <naveen.kumar.saini@intel.com>
 Date: Tue, 18 Jun 2019 17:10:15 +0800
 Subject: [PATCH] Makefile: fix multilib build failure
@@ -6,20 +6,26 @@ Subject: [PATCH] Makefile: fix multilib build failure
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+
+Refresh to 5.13
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
- Makefile | 50 +++++++++++++++++++++++++++-----------------------
- 1 file changed, 27 insertions(+), 23 deletions(-)
+ Makefile | 16 ++++++++++------
+ 1 file changed, 10 insertions(+), 6 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 8455415..4aa0786 100644
+index 337c53e..58e3779 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -1,30 +1,34 @@
- # SPDX-License-Identifier: GPL-2.0
- PREFIX		?= /usr
- DESTDIR		?=
-+BASELIB		?=
+@@ -25,6 +25,7 @@ BINDIR ?=	/usr/bin
+ MANDIR ?=	/usr/share/man
+ SHRDIR ?=	/usr/share/pm-graph
+ LIBDIR ?=	/usr/lib
++BASELIB	?=
  
+ # Toolchain: what tools do we use, and what options do they need:
+ INSTALL = /usr/bin/install
+@@ -33,6 +34,9 @@ INSTALL_DATA  = ${INSTALL} -m 644
  all:
  	@echo "Nothing to build"
  
@@ -27,63 +33,34 @@ index 8455415..4aa0786 100644
 +	@echo "Nothing to clean"
 +
  install : uninstall
--	install -d  $(DESTDIR)$(PREFIX)/lib/pm-graph
--	install sleepgraph.py $(DESTDIR)$(PREFIX)/lib/pm-graph
--	install bootgraph.py $(DESTDIR)$(PREFIX)/lib/pm-graph
--	install -d  $(DESTDIR)$(PREFIX)/lib/pm-graph/config
--	install -m 644 config/cgskip.txt $(DESTDIR)$(PREFIX)/lib/pm-graph/config
--	install -m 644 config/freeze-callgraph.cfg $(DESTDIR)$(PREFIX)/lib/pm-graph/config
--	install -m 644 config/freeze.cfg $(DESTDIR)$(PREFIX)/lib/pm-graph/config
--	install -m 644 config/freeze-dev.cfg $(DESTDIR)$(PREFIX)/lib/pm-graph/config
--	install -m 644 config/standby-callgraph.cfg $(DESTDIR)$(PREFIX)/lib/pm-graph/config
--	install -m 644 config/standby.cfg $(DESTDIR)$(PREFIX)/lib/pm-graph/config
--	install -m 644 config/standby-dev.cfg $(DESTDIR)$(PREFIX)/lib/pm-graph/config
--	install -m 644 config/suspend-callgraph.cfg $(DESTDIR)$(PREFIX)/lib/pm-graph/config
--	install -m 644 config/suspend.cfg $(DESTDIR)$(PREFIX)/lib/pm-graph/config
--	install -m 644 config/suspend-dev.cfg $(DESTDIR)$(PREFIX)/lib/pm-graph/config
--	install -m 644 config/suspend-x2-proc.cfg $(DESTDIR)$(PREFIX)/lib/pm-graph/config
-+	install -d  $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph
-+	install sleepgraph.py $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph
-+	install bootgraph.py $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph
-+	install -d  $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
-+	install -m 644 config/cgskip.txt $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
-+	install -m 644 config/freeze-callgraph.cfg $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
-+	install -m 644 config/freeze.cfg $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
-+	install -m 644 config/freeze-dev.cfg $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
-+	install -m 644 config/standby-callgraph.cfg $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
-+	install -m 644 config/standby.cfg $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
-+	install -m 644 config/standby-dev.cfg $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
-+	install -m 644 config/suspend-callgraph.cfg $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
-+	install -m 644 config/suspend.cfg $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
-+	install -m 644 config/suspend-dev.cfg $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
-+	install -m 644 config/suspend-x2-proc.cfg $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
+ 	$(INSTALL) -d  $(DESTDIR)$(LIBDIR)/pm-graph
+ 	$(INSTALL) sleepgraph.py $(DESTDIR)$(LIBDIR)/pm-graph
+@@ -54,10 +58,10 @@ install : uninstall
+ 	$(INSTALL) -d  $(DESTDIR)$(SHRDIR)
  
- 	install -d  $(DESTDIR)$(PREFIX)/bin
--	ln -s ../lib/pm-graph/bootgraph.py $(DESTDIR)$(PREFIX)/bin/bootgraph
--	ln -s ../lib/pm-graph/sleepgraph.py $(DESTDIR)$(PREFIX)/bin/sleepgraph
-+	ln -s ../$(BASELIB)/pm-graph/bootgraph.py $(DESTDIR)$(PREFIX)/bin/bootgraph
-+	ln -s ../$(BASELIB)/pm-graph/sleepgraph.py $(DESTDIR)$(PREFIX)/bin/sleepgraph
+ 	$(INSTALL) -d  $(DESTDIR)$(BINDIR)
+-	ln -s ../lib/pm-graph/bootgraph.py $(DESTDIR)$(BINDIR)/bootgraph
+-	ln -s ../lib/pm-graph/sleepgraph.py $(DESTDIR)$(BINDIR)/sleepgraph
+-	ln -s ../lib/pm-graph/netfix.py $(DESTDIR)$(BINDIR)/netfix
+-	$(DESTDIR)$(BINDIR)/netfix defconfig > $(DESTDIR)$(SHRDIR)/netfix.cfg
++	ln -s ../$(BASELIB)/pm-graph/bootgraph.py $(DESTDIR)$(BINDIR)/bootgraph
++	ln -s ../$(BASELIB)/pm-graph/sleepgraph.py $(DESTDIR)$(BINDIR)/sleepgraph
++	ln -s ../$(BASELIB)/pm-graph/netfix.py $(DESTDIR)$(BINDIR)/netfix
++	#$(DESTDIR)$(BINDIR)/netfix defconfig > $(DESTDIR)$(SHRDIR)/netfix.cfg
  
- 	install -d  $(DESTDIR)$(PREFIX)/share/man/man8
- 	install bootgraph.8 $(DESTDIR)$(PREFIX)/share/man/man8
-@@ -37,11 +41,11 @@ uninstall :
- 	rm -f $(DESTDIR)$(PREFIX)/bin/bootgraph
- 	rm -f $(DESTDIR)$(PREFIX)/bin/sleepgraph
+ 	$(INSTALL) -d  $(DESTDIR)$(MANDIR)/man8
+ 	$(INSTALL) bootgraph.8 $(DESTDIR)$(MANDIR)/man8
+@@ -90,8 +94,8 @@ hwcheck-install :
+ 	rm -f $(DESTDIR)$(LIBDIR)/pm-graph/hwcheck.py
+ 	$(INSTALL) tools/hwcheck.py $(DESTDIR)$(LIBDIR)/pm-graph
+ 	$(INSTALL) -d  $(DESTDIR)$(BINDIR)
+-	ln -s ../lib/pm-graph/hwcheck.py $(DESTDIR)$(BINDIR)/hwcheck
+-	$(DESTDIR)$(BINDIR)/hwcheck cronon
++	ln -s ../$(BASELIB)/pm-graph/hwcheck.py $(DESTDIR)$(BINDIR)/hwcheck
++	#$(DESTDIR)$(BINDIR)/hwcheck cronon
  
--	rm -f $(DESTDIR)$(PREFIX)/lib/pm-graph/config/*
--	if [ -d $(DESTDIR)$(PREFIX)/lib/pm-graph/config ] ; then \
--		rmdir $(DESTDIR)$(PREFIX)/lib/pm-graph/config; \
-+	rm -f $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config/*
-+	if [ -d $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config ] ; then \
-+		rmdir $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config; \
- 	fi;
--	rm -f $(DESTDIR)$(PREFIX)/lib/pm-graph/*
--	if [ -d $(DESTDIR)$(PREFIX)/lib/pm-graph ] ; then \
--		rmdir $(DESTDIR)$(PREFIX)/lib/pm-graph; \
-+	rm -f $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/*
-+	if [ -d $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph ] ; then \
-+		rmdir $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph; \
- 	fi;
+ hwcheck-uninstall :
+ 	if [ -e $(DESTDIR)$(BINDIR)/hwcheck ] ; then \
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-sleepgraph-add-support-for-RT-kernel-ftrace-flags.patch b/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-sleepgraph-add-support-for-RT-kernel-ftrace-flags.patch
deleted file mode 100644
index f7f8bc068..000000000
--- a/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-sleepgraph-add-support-for-RT-kernel-ftrace-flags.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 47a1db21f6c5d17c94c58c3fe0dcce35c623dbf4 Mon Sep 17 00:00:00 2001
-From: Liwei Song <liwei.song@windriver.com>
-Date: Tue, 23 Jun 2020 04:47:20 +0000
-Subject: [PATCH] sleepgraph: add support for RT kernel ftrace flags
-
-with PREEMPT_RT enabled in kernel, ftrace have a different
-flags format:
-
-                   _-----=> irqs-off
-                  / _----=> need-resched
-                 | / _----=> need-resched
-                 || / _---=> hardirq/softirq
-                 ||| / _--=> preempt-depth
-                 ||||/     delay
-TASK-PID   CPU#  |||||   TIMESTAMP  FUNCTION
-   | |       |   |||||      |         |
-
-add support for this.
-
-Upstream-Status: Submitted [https://github.com/intel/pm-graph/pull/18]
-
-Signed-off-by: Liwei Song <liwei.song@windriver.com>
----
- sleepgraph.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/sleepgraph.py b/sleepgraph.py
-index cfed8e09e0e6..561f165cf9be 100755
---- a/sleepgraph.py
-+++ b/sleepgraph.py
-@@ -2689,7 +2689,7 @@ class TestProps:
- 		'[ +!#\*@$]*(?P<dur>[0-9\.]*) .*\|  (?P<msg>.*)'
- 	ftrace_line_fmt_nop = \
- 		' *(?P<proc>.*)-(?P<pid>[0-9]*) *\[(?P<cpu>[0-9]*)\] *'+\
--		'(?P<flags>.{4}) *(?P<time>[0-9\.]*): *'+\
-+		'(?P<flags>.{4,7}) *(?P<time>[0-9\.]*): *'+\
- 		'(?P<msg>.*)'
- 	def __init__(self):
- 		self.stamp = ''
--- 
-2.24.1
-
diff --git a/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-sleepgraph.py-parse-unfished-cpu-exec-line.patch b/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-sleepgraph.py-parse-unfished-cpu-exec-line.patch
deleted file mode 100644
index fc5991d46..000000000
--- a/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-sleepgraph.py-parse-unfished-cpu-exec-line.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 9bbc991a927722439cad38c892fc9f57207089d3 Mon Sep 17 00:00:00 2001
-From: Liwei Song <liwei.song@windriver.com>
-Date: Mon, 24 May 2021 08:27:28 +0000
-Subject: [PATCH] sleepgraph.py: parse unfished cpu exec line
-
-exist the below case in ftrace file:
-sleepgraph-6508    [003] .... 18197.824037: tracing_mark_write: ps - xxx..., lock_torture_wr-94 169,lock_torture_wr-95 143,lock_tort
-sleepgraph-6508    [003] .... 18197.824043: tracing_mark_write: ure_wr-96 189,lock_torture_wr-97 174,lock_torture_wr-98 160,lock_torture_st-99 1
-
-lock_torture_wr-96 was split to different line due to limited buffer
-size(1k) set in kernel, check this case and re-parse the unfinished
-line.
-
-Upstream-Status: Submitted [https://github.com/intel/pm-graph/pull/20]
-
-Signed-off-by: Liwei Song <liwei.song@windriver.com>
----
- sleepgraph.py | 17 +++++++++++++++--
- 1 file changed, 15 insertions(+), 2 deletions(-)
-
-diff --git a/sleepgraph.py b/sleepgraph.py
-index e340d5b3f03b..38b4439db8eb 100755
---- a/sleepgraph.py
-+++ b/sleepgraph.py
-@@ -3365,8 +3365,21 @@ def parseTraceLog(live=False):
- 					val = ps.split()
- 					if not val:
- 						continue
--					name = val[0].replace('--', '-')
--					proclist[name] = int(val[1])
-+					if not len(val) < 2:
-+						name = val[0].replace('--', '-')
-+						proclist[name] = int(val[1])
-+					else:
-+						proclist = dict()
-+						nextline = next(tf)
-+						mcont = re.match(tp.ftrace_line_fmt, nextline)
-+						n = m.group('ps') + mcont.group('msg').split(': ')[1]
-+						for pscont in n.split(','):
-+							val = pscont.split()
-+							if not val:
-+								continue
-+							if not len(val) < 2:
-+								name = val[0].replace('--', '-')
-+								proclist[name] = int(val[1])
- 				data.pstl[t.time] = proclist
- 				continue
- 		# find the end of resume
--- 
-2.29.2
-
diff --git a/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-sleepgraph.py-use-python3.patch b/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-sleepgraph.py-use-python3.patch
deleted file mode 100644
index 25c87093f..000000000
--- a/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-sleepgraph.py-use-python3.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 22ce65d997f99606a3bb9d2a660ead42eecc234a Mon Sep 17 00:00:00 2001
-From: Naveen Saini <naveen.kumar.saini@intel.com>
-Date: Wed, 11 Sep 2019 11:31:07 +0800
-Subject: [PATCH] sleepgraph.py: use python3
-
-Already compatible with Python 3.
-Same goes for bootgraph.py
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
----
- bootgraph.py  | 2 +-
- sleepgraph.py | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/bootgraph.py b/bootgraph.py
-index d3b99a1..efb5714 100755
---- a/bootgraph.py
-+++ b/bootgraph.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/python
-+#!/usr/bin/python3
- # SPDX-License-Identifier: GPL-2.0-only
- #
- # Tool for analyzing boot timing
-diff --git a/sleepgraph.py b/sleepgraph.py
-index 1794c79..cfed8e0 100755
---- a/sleepgraph.py
-+++ b/sleepgraph.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/python
-+#!/usr/bin/python3
- # SPDX-License-Identifier: GPL-2.0-only
- #
- # Tool for analyzing suspend/resume timing
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.5.bb b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.13.bb
similarity index 69%
rename from meta-oe/recipes-kernel/pm-graph/pm-graph_5.5.bb
rename to meta-oe/recipes-kernel/pm-graph/pm-graph_5.13.bb
index 6e52a58de..88c70ae82 100644
--- a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.5.bb
+++ b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.13.bb
@@ -5,12 +5,9 @@ HOMEPAGE = "https://01.org/pm-graph"
 LICENSE  = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
-SRCREV = "cf59527dc24fdd2f314ae4dcaeb3d68a117988f6"
+SRCREV = "0987732b013936ad771334f51cba31c453c8a9c9"
 SRC_URI = "git://github.com/intel/pm-graph.git;branch=master;protocol=https \
            file://0001-Makefile-fix-multilib-build-failure.patch \
-           file://0001-sleepgraph.py-use-python3.patch \
-           file://0001-sleepgraph-add-support-for-RT-kernel-ftrace-flags.patch \
-           file://0001-sleepgraph.py-parse-unfished-cpu-exec-line.patch \
 "
 S = "${WORKDIR}/git"
 
@@ -23,11 +20,13 @@ S = "${WORKDIR}/git"
 #   - CONFIG_FUNCTION_GRAPH_TRACER=y
 
 COMPATIBLE_HOST='(i.86|x86_64).*'
-EXTRA_OEMAKE = "PREFIX=${prefix} DESTDIR=${D} BASELIB=${baselib}"
+EXTRA_OEMAKE = "PREFIX=${prefix} DESTDIR=${D} LIBDIR=${libdir} BASELIB=${baselib}"
 
 do_install() {
-        oe_runmake install
-        install -Dm 0755 ${S}/analyze_suspend.py ${D}${bindir}/analyze_suspend.py
+    oe_runmake install
+    install -Dm 0755 ${S}/analyze_suspend.py ${D}${bindir}/analyze_suspend.py
+
+    rm -rf ${D}${libdir}/pm-graph/__pycache__
 }
 
 RDEPENDS:${PN} += "python3-core python3-threading python3-datetime python3-compression"
-- 
2.25.1


