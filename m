Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF4DD1A442
	for <webhook@archiver.kernel.org>; Sat, 12 Oct 2024 06:53:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5732.1728716012271580630
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 23:53:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0015cf250c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49C6rWTT011280;
	Fri, 11 Oct 2024 23:53:32 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2043.outbound.protection.outlook.com [104.47.55.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 426sfgh950-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 23:53:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uQ7+U5QXmghSFAMU2VghlZnR1+i+5VAfm7glqez/hQohZW+QpnOJy34KtYK/rXQLBGeMxBd2qgefEWKOIEXXTi17i1fkJ4jNHhtPnqxzL9DckfS9dNQA6BFvmPrN2sA/JjgdYZrwk+o1Wz7kpmHT1EbuUoDUs45Z5I7QtpMrY9PqpyqzsKskUy13VVkl1KMsNxDGDVAIQx0+sxZdQElsBkVL7j4GiW4w+dXeU0r9DzPk1maD4LljlASJ2s8PP4Q7u4x5spidaR34xQw5zDPdSvqq40RgMBRgSl/kziGkof09e8w/AMwzRvEzPGCRXyFxWxI0VvNNwIOkBENGTRLbGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQV7BKorz7b2XccU26m3ASTG6kbgxQcU1T7oWKr7Xsw=;
 b=xdZkr0GHMGjz8WHzMc87RN7AbaZYnlFkyNIT9cyPjNlNSQiw2nE8PWLQJH8bGXLnlLbPuFHs7azY8EEGFyVTJNsocEATvj2DmRQZgIf5rkGCQ83Rbh00WENz0A7YczDddTyHeJxJPEMw9vjG2mHgqk5jKmKmKmhk5E+t0ceH8M70t5q+k88pkFEs48J5nBA6cPRgEvQy9x5Xkxws7Mf+7G4TwHIZ+35YII0Wf8KOr83JWv4e6IJB36DuJDuePM9JGCr2sCkoyqTkYVUb/43xrGaCGbGGpfCwQ7mC+DqZ0sUo217WiZrjaVFX2Of6uxOHg4tqR4jJ1p7pENsFQpx6+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CY8PR11MB7267.namprd11.prod.outlook.com (2603:10b6:930:9a::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.20; Sat, 12 Oct 2024 06:53:29 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8048.017; Sat, 12 Oct 2024
 06:53:29 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] glog: upgrade 0.6.0 -> 0.7.1
Date: Sat, 12 Oct 2024 14:53:11 +0800
Message-Id: <20241012065312.3239400-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::14)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CY8PR11MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: bfe00dac-12cf-49a5-f495-08dcea8a9426
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Sc0+jxZ4kxnrimAor0XudNZ5kPtTCuOMfN6ww4C30R43lVT1D1slqKk6fyOF?=
 =?us-ascii?Q?+/vLNpcTW8VwBP+14zveS44EH6L8kFBFWE4PNIQR5BAiVvDgOMuFMrzlmTmL?=
 =?us-ascii?Q?Z+eCeOajLNYoBbEciItt5Ns6bgKYLtVCOD6F4EQ7YInGJs9PzM1iPdve4st+?=
 =?us-ascii?Q?bXk6ZoF0sFc4OphTBSq3vtT4mjDA3bTvDNcIX608eADgA/NHvR/gNDcHTi05?=
 =?us-ascii?Q?4l9N1alzlbmFuR4W63GRtEFFDhFuv3syaYcuLBmDbfsnF7VUcmYSvCCD3EGi?=
 =?us-ascii?Q?k5r/YTJGYdABn5wd+2kjZNDCjXVm0VBNEFLXlBhWagepIpzSaTlV8iJvW4q6?=
 =?us-ascii?Q?bbxprmd/JZF5lUAC5GiHNBa3JyEIb8gsqAqxxm98uqd/PxF+GkLOyh3x5gfD?=
 =?us-ascii?Q?CqziUU7Q2FtF0TzsOhhXek8yAbxgTA/m1pyxj9RzMtC4Kc1tKC3WxoaegwP7?=
 =?us-ascii?Q?s8LqIDGp4VEAh3/GX4MOfPZTcRkj0aR44fuf2ls047Uhz+n/BKxmKnuuRYqP?=
 =?us-ascii?Q?lBpCZhDeTkmlyqJh3R/SGvVjLlK2Sd7giJahqCoMSb4iwW34lS7hE9CRe7cd?=
 =?us-ascii?Q?+XWnUj9Hfh+/at5FdC6bXhvER1NmTPjWEuuMbwgU3HjMcDwSGiUpcgIkLtl6?=
 =?us-ascii?Q?xRokc0hvEUomVbM7/lmYGyi3z79xpZzwqiGgbjXzgBBE5JDLlFmobZIZ/wvu?=
 =?us-ascii?Q?XqfJQW9qr24+Hmc+Hv9Z+TeR9HqXRIjMWzHOJ8qvmFhdK6r127u2/DVHEf1g?=
 =?us-ascii?Q?zWMYcotqdhhiNSsTOHssJK5flgN7VwXzBY1E72dmJq1sW4Th9mvekOErMTSY?=
 =?us-ascii?Q?CEYcy5pWB2G6hBB53o9yloAUuwPNd/Br0pJ9JUEkhdvConswJfO/IQoZg/v/?=
 =?us-ascii?Q?G2kKKu2viJOaTEKOiDdijRt1xSHWxKVgY9BqXtmhhiWQ4uIh6hsssqw+nWt/?=
 =?us-ascii?Q?QeNw3sOcpXGdWMJLqKWhgqXg3HNtf35skkhsirQw9GoeKdrQVWi6aPebU/wO?=
 =?us-ascii?Q?1LfoeAn060rd/nILPAVnOZcEOTU7SM3veoSKAX3ZIwMAgLeDLHz+D/u5oizZ?=
 =?us-ascii?Q?h2Bn1ZJN/gUELE96Q64h3veoHRN5X4ZUpcd72US7d0VrA+umToDDLGSYbwPC?=
 =?us-ascii?Q?r4Ivj22hIUyCrbfy/c3pw6FyKtwbVLFteUlhsKfp2Uy4oCvhikei8ttw+1FD?=
 =?us-ascii?Q?EyMaNVz1OE5thyOwTdOkhDk87TuFgRzfU0CZ44HtUHw0CFegSOJhzF4y7W9E?=
 =?us-ascii?Q?AJrhl7kgKPF+0SSnUud0sPf0/III+BR5phmxLenTZw1CLtI315ZzQKJVATcf?=
 =?us-ascii?Q?GLLX3jDuYe5idJIQGOiunmm3bMoyBOwAO6TSBa6TBcbaRw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZHXyrDia7dJx6Dtd3yVH+u2qBkbPHgxxlaICNrajbqbEi3fuRb8On7C8A428?=
 =?us-ascii?Q?IWsB8ZERVmw6lXG0Cap/FTzLY6Klp20D4LMhP1jQ8Or28z8ly5A/Di/TwJmG?=
 =?us-ascii?Q?rAQjArRLdpFhrYGQiPUdBv0MPhRrHf0jBLrBGHHCkFZX1QA0f7QkYXeP4rGZ?=
 =?us-ascii?Q?9o/eGz61brg5H9WZ5g9iD4Fure+vZ18tTLm/hbVtzaKRX96lBuBVhUGURdhk?=
 =?us-ascii?Q?2/SPtUZGLx6ftvVjWQHm4tqbCLIL60AE5hWhfNwtrvZd5QQI1q5nF+T+0CSL?=
 =?us-ascii?Q?5E2NaLmlNiXIpRKKJ4cZhofoWX5ENgfwdReXdvFDTLL4X2Cwmkp5+kAte0qO?=
 =?us-ascii?Q?4zRuNMwB3C+Fjjcnc3f8GoDC1yuDysJqSfOupDB0V8C0cbKepiC6Qcn7VNqQ?=
 =?us-ascii?Q?PCeVlXPS1nbv7jHKN9ed2ypzv+Rl8jFGQV30dlO93trSErQ6XatUunu95GXw?=
 =?us-ascii?Q?qJYrYqX5T44EcOZWeboddTe1xpzwTN0fRR+ERB5NFefcLqyxzbrSWyHkwTwK?=
 =?us-ascii?Q?7J7CKECoJFVq6xRQsl89uSDYbL33G/oL53+RC2iMn312SWdTwSCKoUj+wt5f?=
 =?us-ascii?Q?E4uvzHKO7TfyyvmgErZnEiujvnMH0+lchbV5HWsXRDf+rvCrVLPrgEjplVIH?=
 =?us-ascii?Q?fTINu8ZuvbR9oai7qKqm64bvY0exYfpb3vd2G+rZZvZjar9hj16p+laaxx+K?=
 =?us-ascii?Q?Rig+INhnvD63OnaGWL+Et786eSY9AX8DmewA/hUWTAUGmfshqLqeXCqtUFhD?=
 =?us-ascii?Q?WJMGwFwVHVUVnMEwHci3S08RdL8hGBPdi+0WL+yZvnX3IZ+5/NGQAvrA7FBl?=
 =?us-ascii?Q?JgqEGWpc7hsxpPjTbMd78GLfb2YsVQg2ovR3Q6tz8x/v5LM7luvKuGblqObO?=
 =?us-ascii?Q?M8131TWA2AFvr1B8/uIakL0Fop9PrWLHG/rtVK2CM3HjwuHDi/p/JftrUnZm?=
 =?us-ascii?Q?OLMimH8MhA1yxrNcyTZxAYpxMeu5eiZoJVT9GjW2cNmnpZ0SojUPZj3/qzNc?=
 =?us-ascii?Q?UnTsfKI3jlvp0O0exvyGvPfyYSniMtkyECvD2iYN/o2rmK943MGGlgEaeDTe?=
 =?us-ascii?Q?OiEz086p0oAtyghUTjWz3qOjPS8Xbf39OB93UV9iYfkBS5gAXuT8lWV0Ucyu?=
 =?us-ascii?Q?2s/cSI3Ghs+dw2nKU7F4PdA3ai0lUZuMlcxC8dkUwbzc5M5Cftbcg7vtgxCb?=
 =?us-ascii?Q?WVVj50muPYXIbNeVQdycQ/PXYd85bmpo2kkTi9lb+35VNWguwLGgwFmKc4Py?=
 =?us-ascii?Q?GlS4E9JCqkuwl8lTnZSKd8qFdavUstHsA0zias5cYs18/be5teq8NrXHuzkf?=
 =?us-ascii?Q?xnS3gCGg0KC/8raXKDOq0lIet18cbLAYC/dtw2rtimiVe7n+djm/fq6Rgrnd?=
 =?us-ascii?Q?BzNFEkbTuOgclkeUPCg3RFRST8hY9bJ8hl6Pu1qIg0voeFWg0V8M3bemJPUh?=
 =?us-ascii?Q?5QVqy6TMDnSWi++0vBAr2moKlWexZ8/Jxniy/AHTr58RCM3ndTV2kM4mxfnK?=
 =?us-ascii?Q?YvJnFsvgKnpOHQAI3lmlSmBeQyfWS+m+mgJdVOVPI6qryvqUoWlmdLpO6LKs?=
 =?us-ascii?Q?p60lsaIozQ60+LIDc8E5C2TTXCFTgWhNAVBe/VUg?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfe00dac-12cf-49a5-f495-08dcea8a9426
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 06:53:29.3178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /aC5ruRk27Mp/JcSl6QbgCKkQShNGY+pej2UXmEQM9vcWOe8/0QMceKEQtanEiE0CUZBCgatBBoYn3Af1JxHxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7267
X-Authority-Analysis: v=2.4 cv=QrQM3kyd c=1 sm=1 tr=0 ts=670a1ceb cx=c_pps a=2TzYObwzRp/N0knVItohZg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=wzS5HhsdN6HSmMmEo_wA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: IuXSIAzm8kV6Qyc5epkW9tFBp4f3_pLp
X-Proofpoint-ORIG-GUID: IuXSIAzm8kV6Qyc5epkW9tFBp4f3_pLp
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112820

ChangeLog:
https://github.com/google/glog/releases/tag/v0.7.0
https://github.com/google/glog/releases/tag/v0.7.1

Drop 0001-Change-SleepForMilliseconds-parameter-from-unsigned-.patch and
libexecinfo.patch as the issues have been fixed upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...illiseconds-parameter-from-unsigned-.patch | 33 ---------------
 .../glog/glog/libexecinfo.patch               | 40 -------------------
 .../glog/{glog_0.6.0.bb => glog_0.7.1.bb}     |  7 ++--
 3 files changed, 3 insertions(+), 77 deletions(-)
 delete mode 100644 meta-oe/recipes-support/glog/glog/0001-Change-SleepForMilliseconds-parameter-from-unsigned-.patch
 delete mode 100644 meta-oe/recipes-support/glog/glog/libexecinfo.patch
 rename meta-oe/recipes-support/glog/{glog_0.6.0.bb => glog_0.7.1.bb} (84%)

diff --git a/meta-oe/recipes-support/glog/glog/0001-Change-SleepForMilliseconds-parameter-from-unsigned-.patch b/meta-oe/recipes-support/glog/glog/0001-Change-SleepForMilliseconds-parameter-from-unsigned-.patch
deleted file mode 100644
index 3732c62cd..000000000
--- a/meta-oe/recipes-support/glog/glog/0001-Change-SleepForMilliseconds-parameter-from-unsigned-.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 176230435cb4b64ff7f2d97f77a04579ad9ca239 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 18 Feb 2023 13:14:14 -0800
-Subject: [PATCH] Change SleepForMilliseconds parameter from unsigned int -> long
-
-Fixes following error on 32bit platforms
-
-src/googletest.h:631:35: error: non-constant-expression cannot be narrowed from type 'unsigned int' to 'long' in initializer list [-Wc++11-narrowing]
-  const struct timespec req = {0, t * 1000 * 1000};
-                                  ^~~~~~~~~~~~~~~
-
-Upstream-Status: Submitted [https://github.com/google/glog/pull/894]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/googletest.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/googletest.h b/src/googletest.h
-index 5761361..836b06c 100644
---- a/src/googletest.h
-+++ b/src/googletest.h
-@@ -625,7 +625,7 @@ class Thread {
- #endif
- };
- 
--static inline void SleepForMilliseconds(unsigned t) {
-+static inline void SleepForMilliseconds(long t) {
- #ifndef GLOG_OS_WINDOWS
- # if defined(_POSIX_C_SOURCE) && _POSIX_C_SOURCE >= 199309L
-   const struct timespec req = {0, t * 1000 * 1000};
--- 
-2.39.2
-
diff --git a/meta-oe/recipes-support/glog/glog/libexecinfo.patch b/meta-oe/recipes-support/glog/glog/libexecinfo.patch
deleted file mode 100644
index a791a40db..000000000
--- a/meta-oe/recipes-support/glog/glog/libexecinfo.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 19d00c15710840910a7397252c14d612746631fe Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 8 Mar 2021 14:58:40 -0800
-Subject: [PATCH] Link libexecinfo if its found, this is needed for musl based
- systems
-
-Fixes
-ld: libglog.so.0.4.0: undefined reference to `backtrace'
-| collect2: error: ld returned 1 exit status
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- CMakeLists.txt | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 846b444..1553358 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -162,6 +162,7 @@ cmake_pop_check_state ()
- check_cxx_symbol_exists (snprintf cstdio HAVE_SNPRINTF)
- 
- check_library_exists (dbghelp UnDecorateSymbolName "" HAVE_DBGHELP)
-+check_library_exists (execinfo backtrace "" HAVE_EXECINFO)
- 
- check_cxx_source_compiles ("
- #include <cstdlib>
-@@ -629,6 +630,10 @@ if (Unwind_FOUND)
-   set (Unwind_DEPENDENCY "find_dependency (Unwind ${Unwind_VERSION})")
- endif (Unwind_FOUND)
- 
-+if (HAVE_EXECINFO)
-+  target_link_libraries (glog PUBLIC execinfo)
-+endif (HAVE_EXECINFO)
-+
- if (HAVE_DBGHELP)
-   target_link_libraries (glog PRIVATE dbghelp)
-   set (glog_libraries_options_for_static_linking "${glog_libraries_options_for_static_linking} -ldbghelp")
diff --git a/meta-oe/recipes-support/glog/glog_0.6.0.bb b/meta-oe/recipes-support/glog/glog_0.7.1.bb
similarity index 84%
rename from meta-oe/recipes-support/glog/glog_0.6.0.bb
rename to meta-oe/recipes-support/glog/glog_0.7.1.bb
index ec39604f4..586afcad5 100644
--- a/meta-oe/recipes-support/glog/glog_0.6.0.bb
+++ b/meta-oe/recipes-support/glog/glog_0.7.1.bb
@@ -4,15 +4,13 @@ macros."
 HOMEPAGE = "https://github.com/google/glog"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=dc9db360e0bbd4e46672f3fd91dd6c4b"
+LIC_FILES_CHKSUM = "file://COPYING;md5=583a6ead531ca3cd5a2ea593a2888800"
 
 SRC_URI = " \
     git://github.com/google/glog.git;branch=master;protocol=https \
-    file://libexecinfo.patch \
-    file://0001-Change-SleepForMilliseconds-parameter-from-unsigned-.patch \
 "
 
-SRCREV = "b33e3bad4c46c8a6345525fd822af355e5ef9446"
+SRCREV = "7b134a5c82c0c0b5698bb6bf7a835b230c5638e4"
 
 S = "${WORKDIR}/git"
 
@@ -24,6 +22,7 @@ PACKAGECONFIG:remove:riscv32 = "unwind 64bit-atomics"
 PACKAGECONFIG:remove:mipsarch = "64bit-atomics"
 PACKAGECONFIG:remove:armv5 = "64bit-atomics"
 PACKAGECONFIG:remove:armv6 = "64bit-atomics"
+PACKAGECONFIG:remove:powerpc = "64bit-atomics"
 
 PACKAGECONFIG:append:libc-musl:riscv64 = " execinfo"
 PACKAGECONFIG:append:libc-musl:riscv32 = " execinfo"
-- 
2.25.1


