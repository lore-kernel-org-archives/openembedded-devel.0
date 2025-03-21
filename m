Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88319C36000
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 13:00:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.20529.1742562022240380719
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Mar 2025 06:00:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5175c14ca8=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LAo2cQ015434
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 06:00:22 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2049.outbound.protection.outlook.com [104.47.70.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45eprrd1ac-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 06:00:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lhjl6ZTcfyDtQHQ6+SnJvkhQEcJ4uU37XunWL3YjdR5et3nNHenDxKqQydZQKXHhe78szvNT5AuvMvA1c9WW4FqhbMzCZVBbTEJ+yVb/Zs9yDUsr7LAUaOfFzAt0Nyg4354ybVr1VrzHclLD9N8H+IAiZQfS/HIo63ke3OAcFgwE0WW15zVg8DpVCn+gN+wNJ/k16w28TILmoLfbBFXSmchzWO6CtT2BmxNLm7rOh1+GfvYK5gVDuvy76obuV4qfIOGyG9nadD1oiK9LxuqJy+fkEVIO4APlFXihT+xD2nZZWgOPFIhEk/rfWbg6n/6D6evib+ncTnl/jMCyTGO5nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCxZCpEymm+jZywQsdzarEr5MsbmT/zi0g0btgfny/Q=;
 b=qq8pfZCbugYvFdEz6pdO1XCmt5cAyUu3ck4S5lB3QMFdrZxt2ZPtG6gvaniwbzWjkhTzTETdJbJ3q17q1i5Ebmb1tyWZ2Fj2V668AxX9htl3B1gD04u4BGEIB2cCkw6zB7Qh7PBYfz0ZVPY8yxxQoVjNdUJ/jKW62U0q++ESIQ30f1oMxOu02q6RAiRNa/mPlTHI0vtrUrCnutcZt269xJSJiMYOiTgoOmEOC1qTa3xaDQCCpgfolZLO+xAs6AFFMQPmT3f5wzD1SpWPZetd0/U1bTNjFwd3KqJ7TRcfJsB8OG8yCDDfmtXfdNyOcD1WK0anKL+ZxUNtHTk45Q/8yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH7PR11MB6953.namprd11.prod.outlook.com (2603:10b6:510:204::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.33; Fri, 21 Mar 2025 13:00:19 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 13:00:19 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/3] drbd-utils: upgrade 9.28.0 -> 9.30.0
Date: Fri, 21 Mar 2025 20:59:59 +0800
Message-Id: <20250321130000.667251-2-yi.zhao@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7d680fc0-985f-46b5-df65-08dd68785564
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yapLr4ghV5m1m6QA/UWO3zVNPlZNEYKquJU/FjsmDujXCZ9wUHRlCkzgzBaj?=
 =?us-ascii?Q?tys1SD7vlOXVqBPUEDyebjAJ5Zc6qRtD0xIVYida0glGk1vCugcFq9AOuVXP?=
 =?us-ascii?Q?6MRGiggFRCPqwycLCCGkmY0oP9XFGRzyHrvPd52hwbgnf0WWsTpzVOcIl7eZ?=
 =?us-ascii?Q?xuVs9DaEbDKdsjI/6gs8MmdosYerupAoTVYi3HM4rY0eYTYnhnIsDqi9xX6v?=
 =?us-ascii?Q?HwhSy7/YA7ElK7OAIxqcCOwwPZoTwccPPkldUWbG+Hcxrwr9PQ+ovFlLZqim?=
 =?us-ascii?Q?L220nuCpZIYbnoqrffWPE7YGEpC8dqag+SUOigkkFspziYj73sxAfKvOKo/e?=
 =?us-ascii?Q?czNmUFvqmYrlEiAEHlPRY1fQ6cGxTwrJnso/rrnKAf+qE6CZ0pxFefXhCyat?=
 =?us-ascii?Q?RpKU4vP4HT4DjhffEihwAyb+lEejgHXwnN2gVOoshxsaPlJ1hxT7IatDTcfs?=
 =?us-ascii?Q?NUbsqxbGlGChxT3yu2zVAX4r9cX68S52SrFjSHAnK0OsvH4RStYKYTDD68vu?=
 =?us-ascii?Q?8NUJMC4RcH369LuAULOn1JnlNOtDF1xtYv2RbZBcrrsRk9xVZD0SHm9NKdOd?=
 =?us-ascii?Q?XtZhBGey56FI2w5HRZys/kwwiBIDk5fGTcGD4WUISq3bQfwZ6cBjNB/m4UM4?=
 =?us-ascii?Q?DYDCWGOra/PCjIPQ2xX7IKikDC+/q2U8CKrDogu7HPZn9ZO0xd7BbcCEczXU?=
 =?us-ascii?Q?iuJ1poGeW30YdMWHxN6L7tOPVXzIBFp5MU8n0VXkLhyTj7MygfJxbaGZgrRc?=
 =?us-ascii?Q?8pFbgo7qMhmZrhd8EBW0Z7ZjpmiI417pIUuOdHkwgk/4yptz7huu9BiP3X2U?=
 =?us-ascii?Q?DSRFxFZ+Bii8hOfISIOmE9saJvE8VSkazBYS8Un6joolTuwnk1RB3cM/lrTw?=
 =?us-ascii?Q?85/IB6qTPpEjN9CE4/ITw9CeWqQyTYDByYD+Iz28lgvDGr4ZhiFhto03pLIY?=
 =?us-ascii?Q?iFLuoCrGXzA1wto4v3GIjksrZUm4o105LLvlmJb3vxb/JQVQZa3ti3HVbX2d?=
 =?us-ascii?Q?hOEhesr0/IIGvlX5nJPAO9vliukI2bbMtNarNdSD1v5hEGI/F49vIoojggX8?=
 =?us-ascii?Q?NnWj4OR2ANPgj24ixjhPJATmaFy+g3c+cxwBkkrX4HY/Q23WsJSDmoqWAyVK?=
 =?us-ascii?Q?7WPX05L/ENWAvD9e7sL6LflKz3m4oZvUudTvY6UanezVC160ZnKAsMC2WF4Q?=
 =?us-ascii?Q?da8EaiZqt7EBNjlHrJ0v6rH2p1+CZbu539TspUePVNEY29gx8XxQMjnE7UW6?=
 =?us-ascii?Q?TdlAacX4TjQgIbKMXTuCgEWQ5CgH2NiE4ze5efgx7X5s3SYH61vU7zwjzVhc?=
 =?us-ascii?Q?DcBqYBqrTJPxKebNAfhknojUi9CJS7/scAIMSOwfMFMCu3mDKacbwSOole8B?=
 =?us-ascii?Q?dzIfcBeKuqqaZBaOk9BU9vZ/xunXdtzVGfM+Md+uXUSxgnVOgCcznrtx775U?=
 =?us-ascii?Q?yyLatGb821mx9O/wI/va2In8LX+psCU3?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MKwoGUNjKShGDp5X5H6N9V95Z7TvAC1TadgeW9pbelrFi8HfasXLd5f567x7?=
 =?us-ascii?Q?QK9FfzyVy4h9KraKar3K4dAAlMJvalnKFSG/f+WZuC4lWFNW+L09vdhpuuje?=
 =?us-ascii?Q?fAqpmF0Ntr2PntJQjEfhEJpiSR8cEd7llwZGsyvSmO7sFOcoSMM6uqcGyLJ0?=
 =?us-ascii?Q?L9gvw7UvJDxYril1S8Ak3HgAh8h91MvYHuU1SQJyfxiUjlNlmAlpn+p2/spH?=
 =?us-ascii?Q?b8ionW2pdXvcvXdwotQqvB3PLJyclNaVDF6quyLWfea/IetpZgeAn1QJS0DZ?=
 =?us-ascii?Q?c/UACAyjezbGX8Vufj65AID3CgUfklkkaeH+p3f2IKWouiDZfTnlaRanYy2p?=
 =?us-ascii?Q?nVtBydYuEy4pT2X81HnDcGLTz8HuuEjJBTZIKAnCUF8f4jUaoyK3kQk/i97i?=
 =?us-ascii?Q?Zg5FSHJKzrrkQYO2zUnSuolLB4AcpKSRClXLxsPlu9r3s8n25jJ5/hy/lqrs?=
 =?us-ascii?Q?RIJboEoybH9x1mcgXCQTdSsmW6hY9qAyfbB9vGvDIxXcIVhAgiX5yt1mL+2f?=
 =?us-ascii?Q?aiglMnFlhx1qgowjrzRZybwz54eKqo9xWZEde5fnse5UUFihrIvhn43QD6iP?=
 =?us-ascii?Q?4S6scA/naWpMCMo8z0cJLTqbxLyTjjoSc67lxIri9Dv1HcXellh1JA+mc8Mm?=
 =?us-ascii?Q?SW6aRuMJcn/Zcn+ERSrLU15bVeBuTP1379EDy3ZEJ4OSADURMsFbxI8VN4MS?=
 =?us-ascii?Q?zEzZOucq9j0T5AkFod6AvgCz423xlXQ550ToBLkmd00pwdiMJpB/I+bqSlCT?=
 =?us-ascii?Q?YbERs1kC73LoX74sv4ihgBSi7JoCSYh5I87MllHiR5krB4W4Q9qLrt9CpBga?=
 =?us-ascii?Q?htGf3IgnUn8NbbzNmA6EDU8hx9mbX0dcHbpEV2Je45JT4o8JtqqEyymPp3MK?=
 =?us-ascii?Q?iMqbo9GcnAvDv1C8320DSZ75ifXEHOAqE1YfarPJyNFlvlGhVU8l5OWiBuMp?=
 =?us-ascii?Q?4+5/Mwgs2e+1oCchy0ZV/iYYy3JaEmGxKIra2cXyJbf0WkuDTuELCPvz0W9z?=
 =?us-ascii?Q?vRvXfSCKLImKdbO5e6oG0gynkP8e4v473z8o42LZddp6dkTsrehIoJQ4Qdwv?=
 =?us-ascii?Q?WPWlX9MGHUBicVlgOZcn0U1ZXW6XXq4v4D8M+MmpgYPM4Nht79L/lAlQZktP?=
 =?us-ascii?Q?NShEG27871iVTsiNSS8eOPvz2OL2xRcdSpF1Um1OQvQpOSRJIJ0cZCitwepo?=
 =?us-ascii?Q?I6uxqNsqCMT2L+QrOBA7x6xODbhn1InEMgZyViHvKPLkZDxgxgWvbQuM/Fkk?=
 =?us-ascii?Q?DSwIqsaMD5F7YuIJMPvsZOwlXMLFBKaaF59buaqzL39uqUSeL7KTlJ6G1euJ?=
 =?us-ascii?Q?IpaEwmXYtuAVxe39hxWarKqyoawGyVe2AfJoJMwnmkHHMDIcOXzkHf7Z/dO+?=
 =?us-ascii?Q?HnCq4CTnvDm7jwqbFRY/4v6LIcDJ9bEbiUKCfbj5t95T/Am6fci/pW9H1Ras?=
 =?us-ascii?Q?SCQ4JBHyLFgF5cfzESOk1sx4GVgfI9unlWFysZJGz5xVezZ94NZIVhiQMcGs?=
 =?us-ascii?Q?BojMbljCpcZeaeYWt29xtVXXeFrsLLR4sX7jM+30FsS+ZfCWBJwjBdA/A2Gz?=
 =?us-ascii?Q?h8O8E04mf57c3sdg3a0lj+xnbNxV4z/KaMp1wWIR?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d680fc0-985f-46b5-df65-08dd68785564
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 13:00:19.5664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ro/v5jZRND6fb7VMmpy7nuPGfm5Itu/DYhZrBKlaKcFjyPm2pBgF+fJ656EF8CxuGixOUAEFcAbR1/TRk5bKNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6953
X-Authority-Analysis: v=2.4 cv=LZw86ifi c=1 sm=1 tr=0 ts=67dd62e5 cx=c_pps a=YkRwJB1Lcas13D3J5+BQ6w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=heqRTPqWGWpZfsG9C6YA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: _FcfsCO7JGdGXRLKrac_GZ_1IWwJ7jym
X-Proofpoint-ORIG-GUID: _FcfsCO7JGdGXRLKrac_GZ_1IWwJ7jym
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116185

ChangeLog:
https://github.com/LINBIT/drbd-utils/blob/v9.30.0/ChangeLog

* Refresh local patches.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../0001-drbd-utils-support-usrmerge.patch    | 155 +-----------------
 ...001-drbdmon-add-LDFLAGS-when-linking.patch |  17 +-
 ...d-utils_9.28.0.bb => drbd-utils_9.30.0.bb} |   4 +-
 3 files changed, 20 insertions(+), 156 deletions(-)
 rename meta-networking/recipes-support/drbd/{drbd-utils_9.28.0.bb => drbd-utils_9.30.0.bb} (96%)

diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-utils-support-usrmerge.patch b/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-utils-support-usrmerge.patch
index ef0229d5bb..93cb8e185e 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-utils-support-usrmerge.patch
+++ b/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-utils-support-usrmerge.patch
@@ -1,29 +1,21 @@
-From 9109f15f5b8ae142823194b9ef50c392615fe38d Mon Sep 17 00:00:00 2001
+From a019fbe36ab965e754b818fe1bdb0cea0e3ffb60 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 21 Apr 2022 17:22:35 +0800
-Subject: [PATCH] drbd-utils: support usermerge
+Subject: [PATCH] drbd-utils: support usrmerge
 
 Upstream-Status: Inappropriate [oe-specific]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
 ---
- configure.ac                             |  2 +-
- scripts/Makefile.in                      | 10 +++++-----
- scripts/drbd-demote-or-escalate@.service |  2 +-
- scripts/drbd-promote@.service            |  4 ++--
- scripts/drbd-wait-promotable@.service    |  2 +-
- scripts/drbd.service                     |  6 +++---
- scripts/drbd@.service                    |  6 +++---
- scripts/ocf.ra@.service                  |  4 ++--
- user/v84/Makefile.in                     | 14 +++++++-------
- 9 files changed, 25 insertions(+), 25 deletions(-)
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index d3ec5ff1..910232b1 100644
+index 37148597..52015fb2 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -178,7 +178,7 @@ AC_ARG_WITH(tmpfilesdir,
+@@ -217,7 +217,7 @@ AC_ARG_WITH(tmpfilesdir,
  AC_SUBST(tmpfilesdir)
  
  # set default early
@@ -32,141 +24,6 @@ index d3ec5ff1..910232b1 100644
  if test x"$with_udev" = x || \
     test x"$with_udev" = xyes ; then
  	if test x"$PKG_CONFIG" != x; then
-diff --git a/scripts/Makefile.in b/scripts/Makefile.in
-index 15a26f37..ff028310 100644
---- a/scripts/Makefile.in
-+++ b/scripts/Makefile.in
-@@ -90,11 +90,11 @@ ifeq ($(subst both,systemd,$(initscripttype)),systemd)
- 	install -d $(DESTDIR)$(systemdunitdir)
- 	install -m 644 $(SYSTEMD_UNITS) $(DESTDIR)$(systemdunitdir)/
- 	install -m 644 $(SYSTEMD_TEMPLATES) $(DESTDIR)$(systemdunitdir)/
--	install -d $(DESTDIR)/lib/drbd/scripts
--	install -m 755 drbd $(DESTDIR)/lib/drbd/scripts
--	install -m 755 drbd-service-shim.sh $(DESTDIR)/lib/drbd/scripts
--	install -m 755 drbd-wait-promotable.sh $(DESTDIR)/lib/drbd/scripts
--	install -m 755 ocf.ra.wrapper.sh $(DESTDIR)/lib/drbd/scripts
-+	install -d $(DESTDIR)/${nonarch_libdir}/drbd/scripts
-+	install -m 755 drbd $(DESTDIR)/${nonarch_libdir}/drbd/scripts
-+	install -m 755 drbd-service-shim.sh $(DESTDIR)/${nonarch_libdir}/drbd/scripts
-+	install -m 755 drbd-wait-promotable.sh $(DESTDIR)/${nonarch_libdir}/drbd/scripts
-+	install -m 755 ocf.ra.wrapper.sh $(DESTDIR)/${nonarch_libdir}/drbd/scripts
- 	install -d $(DESTDIR)$(tmpfilesdir)/
- 	install -m 444 drbd.tmpfiles.conf $(DESTDIR)$(tmpfilesdir)/drbd.conf
- endif
-diff --git a/scripts/drbd-demote-or-escalate@.service b/scripts/drbd-demote-or-escalate@.service
-index 20932238..8b5ce4a2 100644
---- a/scripts/drbd-demote-or-escalate@.service
-+++ b/scripts/drbd-demote-or-escalate@.service
-@@ -28,5 +28,5 @@ TimeoutSec=60
- # "Type=forking" would be an option to have it retry a number of times,
- # and then only escalate to FailureAction if that did not help.
- Type=oneshot
--ExecStart=/lib/drbd/scripts/drbd-service-shim.sh secondary-or-escalate %I
-+ExecStart=@nonarch_libdir@/drbd/scripts/drbd-service-shim.sh secondary-or-escalate %I
- ExecStopPost=-/bin/journalctl --sync
-diff --git a/scripts/drbd-promote@.service b/scripts/drbd-promote@.service
-index 71345d9b..678e0703 100644
---- a/scripts/drbd-promote@.service
-+++ b/scripts/drbd-promote@.service
-@@ -24,5 +24,5 @@ RemainAfterExit=yes
- # (ab)using systemd features
- # if we cannot configure and promote, that's a condition, not a failure
- # See the comment above wrt. FailureAction vs OnFailure
--ExecCondition=/lib/drbd/scripts/drbd-service-shim.sh primary %I
--ExecStop=/lib/drbd/scripts/drbd-service-shim.sh secondary %I
-+ExecCondition=@nonarch_libdir@/drbd/scripts/drbd-service-shim.sh primary %I
-+ExecStop=@nonarch_libdir@/drbd/scripts/drbd-service-shim.sh secondary %I
-diff --git a/scripts/drbd-wait-promotable@.service b/scripts/drbd-wait-promotable@.service
-index 81c3789f..3416abc6 100644
---- a/scripts/drbd-wait-promotable@.service
-+++ b/scripts/drbd-wait-promotable@.service
-@@ -10,7 +10,7 @@ Type=oneshot
- 
- # on first start, wait for access to "good data"
- # let systemd handle timeouts
--ExecStart=/lib/drbd/scripts/drbd-wait-promotable.sh %I
-+ExecStart=@nonarch_libdir@/drbd/scripts/drbd-wait-promotable.sh %I
- RemainAfterExit=yes
- 
- [Install]
-diff --git a/scripts/drbd.service b/scripts/drbd.service
-index 96c599e7..c81e95a6 100644
---- a/scripts/drbd.service
-+++ b/scripts/drbd.service
-@@ -12,11 +12,11 @@ RemainAfterExit=yes
- # A check for INIT_VERSION already exists, just set it to something.
- Environment=INIT_VERSION=systemd
- 
--ExecStart=/lib/drbd/scripts/drbd start
--ExecStop=/lib/drbd/scripts/drbd stop
-+ExecStart=@nonarch_libdir@/drbd/scripts/drbd start
-+ExecStop=@nonarch_libdir@/drbd/scripts/drbd stop
- 
- # Re-adjust everything on reload
--ExecReload=/lib/drbd/scripts/drbd reload
-+ExecReload=@nonarch_libdir@/drbd/scripts/drbd reload
- 
- [Install]
- WantedBy=multi-user.target
-diff --git a/scripts/drbd@.service b/scripts/drbd@.service
-index 0fad10be..556f3857 100644
---- a/scripts/drbd@.service
-+++ b/scripts/drbd@.service
-@@ -35,8 +35,8 @@ RemainAfterExit=yes
- 
- # depends... do we want this as ExecCondition or as ExecStart
- # failed start is "failed", failed condition is just "not startable yet"
--ExecStart=/lib/drbd/scripts/drbd-service-shim.sh adjust %I
--ExecReload=/lib/drbd/scripts/drbd-service-shim.sh adjust %I
-+ExecStart=@nonarch_libdir@/drbd/scripts/drbd-service-shim.sh adjust %I
-+ExecReload=@nonarch_libdir@/drbd/scripts/drbd-service-shim.sh adjust %I
- 
- # can only succeed, if you first stop all depending services
--ExecStopPost=/lib/drbd/scripts/drbd-service-shim.sh down %I
-+ExecStopPost=@nonarch_libdir@/drbd/scripts/drbd-service-shim.sh down %I
-diff --git a/scripts/ocf.ra@.service b/scripts/ocf.ra@.service
-index 9c2268a6..1666c482 100644
---- a/scripts/ocf.ra@.service
-+++ b/scripts/ocf.ra@.service
-@@ -22,5 +22,5 @@ Environment=monitor_inverval=30
- # Only the first argument is used by the wrapper,
- # the %n is just to identify which is which in the process list.
- # All parameterization is done via Environment= in per instance override.conf
--ExecStart=/lib/drbd/scripts/ocf.ra.wrapper.sh start-and-monitor %n
--ExecStopPost=/lib/drbd/scripts/ocf.ra.wrapper.sh stop %n
-+ExecStart=@nonarch_libdir@/drbd/scripts/ocf.ra.wrapper.sh start-and-monitor %n
-+ExecStopPost=@nonarch_libdir@/drbd/scripts/ocf.ra.wrapper.sh stop %n
-diff --git a/user/v84/Makefile.in b/user/v84/Makefile.in
-index 0fcefc5f..81f7d5ec 100644
---- a/user/v84/Makefile.in
-+++ b/user/v84/Makefile.in
-@@ -110,19 +110,19 @@ ifeq ($(WITH_84_SUPPORT),yes)
- 	install -d $(DESTDIR)$(localstatedir)/lib/drbd
- 	install -d $(DESTDIR)$(localstatedir)/run/drbd
- 	install -d $(DESTDIR)$(localstatedir)/lock
--	install -d $(DESTDIR)/lib/drbd/
-+	install -d $(DESTDIR)/${nonarch_libdir}/drbd/
- 	if getent group haclient > /dev/null 2> /dev/null ; then	\
--		install -g haclient -m 4750 drbdsetup-84 $(DESTDIR)/lib/drbd/ ;	\
--		install -m 755 drbdadm-84 $(DESTDIR)/lib/drbd/ ;		\
-+		install -g haclient -m 4750 drbdsetup-84 $(DESTDIR)/${nonarch_libdir}/drbd/ ;	\
-+		install -m 755 drbdadm-84 $(DESTDIR)/${nonarch_libdir}/drbd/ ;		\
- 	else								\
--		install -m 755 drbdsetup-84 $(DESTDIR)/lib/drbd/ ;		\
--		install -m 755 drbdadm-84 $(DESTDIR)/lib/drbd/ ; 		\
-+		install -m 755 drbdsetup-84 $(DESTDIR)/${nonarch_libdir}/drbd/ ;		\
-+		install -m 755 drbdadm-84 $(DESTDIR)/${nonarch_libdir}/drbd/ ; 		\
- 	fi
- endif
- 
- uninstall:
--	rm -f $(DESTDIR)/lib/drbd/drbdsetup-84
--	rm -f $(DESTDIR)/lib/drbd/drbdadm-84
-+	rm -f $(DESTDIR)/${nonarch_libdir}/drbd/drbdsetup-84
-+	rm -f $(DESTDIR)/${nonarch_libdir}/drbd/drbdadm-84
- 
- spell:
- 	for f in drbdadm_adjust.c drbdadm_main.c drbdadm_parser.c drbdadm_usage_cnt.c drbdsetup.c drbdtool_common.c; do \
 -- 
 2.25.1
 
diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-drbdmon-add-LDFLAGS-when-linking.patch b/meta-networking/recipes-support/drbd/drbd-utils/0001-drbdmon-add-LDFLAGS-when-linking.patch
index c7766067a1..ac2626c1c8 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils/0001-drbdmon-add-LDFLAGS-when-linking.patch
+++ b/meta-networking/recipes-support/drbd/drbd-utils/0001-drbdmon-add-LDFLAGS-when-linking.patch
@@ -1,4 +1,4 @@
-From bb044160faf4ae7615ddfdb17641dd88c33cde57 Mon Sep 17 00:00:00 2001
+From 26ed5003847a14a16d0c1d4030aa1a361c0289fb Mon Sep 17 00:00:00 2001
 From: Sakib Sajal <sakib.sajal@windriver.com>
 Date: Thu, 31 Mar 2022 15:09:58 -0400
 Subject: [PATCH] drbdmon: add LDFLAGS when linking
@@ -7,11 +7,11 @@ Upstream-Status: Pending
 
 Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
 ---
- user/drbdmon/Makefile.in | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ user/drbdmon/Makefile.in | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/user/drbdmon/Makefile.in b/user/drbdmon/Makefile.in
-index 7bd8987e..115a81b8 100644
+index 9c5427e9..0101a60b 100644
 --- a/user/drbdmon/Makefile.in
 +++ b/user/drbdmon/Makefile.in
 @@ -1,6 +1,6 @@
@@ -22,12 +22,19 @@ index 7bd8987e..115a81b8 100644
  CXX = @CXX@
  LIBS = @LIBS@
  
-@@ -72,7 +72,7 @@ $(dsaext-obj): $(basename $(dsaext-obj)).cpp $(basename $(dsaext-obj)).h
+@@ -76,10 +76,10 @@ $(dsaext-obj): $(basename $(dsaext-obj)).cpp $(basename $(dsaext-obj)).h
  $(integerparse-obj): $(basename $(integerparse-obj)).cpp $(basename $(integerparse-obj)).h
  
  drbdmon: $(ls-obj)
 -	$(CXX) -o $@ $(CPPFLAGS) $(CXXFLAGS) $^ $(LIBS)
 +	$(CXX) -o $@ $(CPPFLAGS) $(CXXFLAGS) $(LDFLAGS) $^ $(LIBS)
  
+ drbd-events-log-supplier: $(supplier-obj)
+-	$(CXX) -o $@ $(CPPFLAGS) $(CXXFLAGS) $^
++	$(CXX) -o $@ $(CPPFLAGS) $(CXXFLAGS) $(LDFLAGS) $^
+ 
  # do not try to rebuild Makefile itself
  Makefile: ;
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.28.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.30.0.bb
similarity index 96%
rename from meta-networking/recipes-support/drbd/drbd-utils_9.28.0.bb
rename to meta-networking/recipes-support/drbd/drbd-utils_9.30.0.bb
index af0afc2a91..d9f1ae3f77 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_9.28.0.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.30.0.bb
@@ -12,8 +12,8 @@ SRC_URI = "git://github.com/LINBIT/drbd-utils;name=drbd-utils;branch=master;prot
            file://0001-drbdmon-add-LDFLAGS-when-linking.patch \
            ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://0001-drbd-utils-support-usrmerge.patch','',d)} \
            "
-SRCREV_drbd-utils = "ba2ce9037989b6141222c7901d1219cf852949f1"
-SRCREV_drbd-headers = "0349f00825b4198d4ec3248f43884114a187676a"
+SRCREV_drbd-utils = "36ea199f38b543b2da92219109c2832e122e5bf9"
+SRCREV_drbd-headers = "94f4472513f351efba5788f783feba6ac6efe9fc"
 
 SRCREV_FORMAT = "drbd-utils_drbd-headers"
 
-- 
2.25.1


