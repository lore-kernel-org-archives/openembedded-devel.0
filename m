Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6190C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 07:32:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3260.1740468753139247232
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Feb 2025 23:32:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=41510be863=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P65M6a012763
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Feb 2025 23:32:32 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44yar7k1n0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Feb 2025 23:32:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gzhZ+vfYhhv8KvrhLWB0w598dc+iKLGsN6lJXGYXgGOyLAB6bmJLFOW6tfeRIn/bfj4NS2/1L8726Bg94EX1CmwBbH2IiQXq6Ge/WcN+ypieOMW9UEk3AbLn4RKr1eM84b9tANbhwDtJ9ay+1Q0rK+zO6RM7PSS/V3I/yW/O1r2AcRgQMNqcmaqNpOpv/R+P2bf5p4EJM3kDYOQ2LvIy2dhC++muS6NFuKLpg7M4vILLW0I3bg7vuOjHrDnsUSz4dppZo4tNitF/0tVZNnGAkwDV2WiAoDnQItNwVQk4wX5Mt+38GRwcbR4nmjur/weevdWQo61KIzK5ziRauSqXpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QSz4k9gVBOSodIzRiqlsPD/6CypjsOdBOEgPORWgkM=;
 b=EKZlZSJTDKSfRF6uD1OUuvtibLX3UCYhrrtTfaoQvpE1ZUJKYRwV17wbVY6losM4wUvwdfZJ+KMfpXDKUkRzWU5txy3iEh+qMA7ptEQU7VyMHjvv+7N49OA8bZFfuceJuwPWqRoiK0jMYipbBuHtOx+t1Q2RODUhHrJfYcPS/I6eTGaFo67y4mYZdpK6C1rWHD+7LG8r1TDXHJJ2xit1qplvH4cB2o2sVS4tC0yu8yNaZkfWTszwtpnxwEfyoKLvUzWvn8z56PdPKSYKrN/wfybjBCHAOavVAsLbX9ziMMcscHbfMHGX7brEDD6pwwNL8bm1tHx1buzu4X+W81przA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB6396.namprd11.prod.outlook.com (2603:10b6:208:3ab::10)
 by SJ0PR11MB5894.namprd11.prod.outlook.com (2603:10b6:a03:42a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 07:32:29 +0000
Received: from IA1PR11MB6396.namprd11.prod.outlook.com
 ([fe80::79e6:58f0:788d:b45]) by IA1PR11MB6396.namprd11.prod.outlook.com
 ([fe80::79e6:58f0:788d:b45%5]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 07:32:29 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] inotify-tools: upgrade 3.22.6.0 -> 4.23.9.0
Date: Tue, 25 Feb 2025 15:31:22 +0800
Message-Id: <20250225073122.2574210-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:404:56::30) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6396:EE_|SJ0PR11MB5894:EE_
X-MS-Office365-Filtering-Correlation-Id: e3082a8f-dc75-4626-535b-08dd556e7582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JWZ45QX3Jt4n3jrxBvCE03iQqQyXmmZIMeWa0b9gKBFNKHZgShuUwK2RE2t5?=
 =?us-ascii?Q?1QUszgQwQlwESeYZ9ad/7fkWqF+z5q/qSDDnZQ5hqhv6LpxMEbnX60oD1wau?=
 =?us-ascii?Q?vg0dOskX3c1a+xavCxHJgzyE/oS68db7oHxdms9e9JBou9zRDbGZg5q1kXzO?=
 =?us-ascii?Q?CqjOv86J0zKIp5/O5H1dvHdfniDMLMehyDbCsaRYxmTc1LMiZuC8kKuyzMTA?=
 =?us-ascii?Q?wajLBiNRnPK+hZ7/jGdcqqvjMAnLqXB3Tv6wQkjgmUrj3nG6wHNQKAH5VOPD?=
 =?us-ascii?Q?vO3aSGueF1CAhXGx0zOhRay5mpzCWPBKfdGMGt+G/TI9DO09C5jCE1iovz2V?=
 =?us-ascii?Q?+GhBhai4OljKp9a8rXk78IVrzRgZ3eFiLLJZf+bApiuygf79VgJKtGwzsQuZ?=
 =?us-ascii?Q?2OJfrE07YWtNNK91buBWTCTRv1Kx61uAt2WUdIvFhWDDdp6ngLVfK0c8f7eD?=
 =?us-ascii?Q?szthMesFO8kWkSNeIbcSALbhuiiB1OEECez3zFX9W20rKgSWXkIb5TU0/8z6?=
 =?us-ascii?Q?YE61q4/Rp3OAFVbHg5IrySliwAiJlnCPywKEGQFC9QIJ3cZRCSOKhC0ZmtyH?=
 =?us-ascii?Q?2ZAr6qvg0dqS9FVmdBAP3mmhIPPf7obteMb4pLubWDjOqMSkXoGUq7DbBzFs?=
 =?us-ascii?Q?KhccYZY3nDerTn8y47Uvu85Uk/6+KwwE5tHKhAfQiAwnYt5hpFDRnFarDZhF?=
 =?us-ascii?Q?4FJHSn1yyx6XCofI5ed4StuPLt/1rDI8lTZGslF1QxxkLRUd7nx46o0IUmNM?=
 =?us-ascii?Q?bJ42y2zYq9FTsE1MiSonIBJQtN9DvHPwG+luVOt6OwfV44gG12JwqiAg9vUi?=
 =?us-ascii?Q?XDRfmIijZb3hJ1ggsB0l8FLnIjL4RhKsRGm/yg0/PKPz7BsElJT5li7IecS8?=
 =?us-ascii?Q?SzqRssuQy73eKT8N3x6tfnHjhaByy4Ia4lvqOP9r/nqsTycnDyH0/B3Y5ZIM?=
 =?us-ascii?Q?LXo7cHgJtOs/a7xX04qKaCd2yK8gGvdBTLKe53wGtEbtMIO7uUlKRYzR18wD?=
 =?us-ascii?Q?FvqIN8A17goQqozWtimLqNSrkq9PT3VNNEN9Jwd/+E9HJvO9pQ/BSnLFAAmj?=
 =?us-ascii?Q?uWjXoyZ9ciSzxZrHbFgRBfVeMTYLBiTZA9leDde/e4f1AZzNC6EVXkzX5P7I?=
 =?us-ascii?Q?Q1kHsPcBoUrWvGVCnGHkD2+jWgNb8UydybrWYGDdR0eBBpcnhuvLIiDvpJrG?=
 =?us-ascii?Q?HYBq12/QpF7ZeCOns8O52IECGNk4Owey/IHItrMklLo1s4bHM3VaUUaduzrS?=
 =?us-ascii?Q?l0GXXs6AMO2+03mZ+yuo8IP2An7qERUKsReQrvZWfAbjyH2rWwlvGT6cRRqU?=
 =?us-ascii?Q?AI6FUANhiK0fzTFNtu+vAuqZwcRNjYIEE0p6Fz+E/lVhEC8G1DqGs2wU1dNJ?=
 =?us-ascii?Q?osiC8VyIydkrOZpWp0xaeeupJFVPELnf8sJw+9A3JGUYW4EpOg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6396.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DnunEUXyJur/hTPYSUaJa9yiqlGyddifNlqdkkuTkUZ+GeRaYkopVI2fzf1y?=
 =?us-ascii?Q?Wf4f8b14CO3HpDLvdokLnsZktx0i1hu6os6H4MfueFZ+jFJe3qXsZjWR6iFJ?=
 =?us-ascii?Q?a1UatIjox3zKMfclHPZxpnpTx4lepnk1dPnwO5+h648XR3Qx3r5Cj1qngsre?=
 =?us-ascii?Q?6jTebk/uztrBCCCNpQpFgK+LAy4Vt7LVk0oHadGg/e5KKqrmgKRSr4a3fzQP?=
 =?us-ascii?Q?+rgsK84GyvZ2xXlZ6v/KlLoOIFzskSXkh2fmk5PpzJ2fvInFyYy3lpCttPwb?=
 =?us-ascii?Q?vB/gkyGh0LYwKFzkEMqzksdlTaJ4Yqc3z9B51ROgFLPj0AEXZUDGdkd+pxSd?=
 =?us-ascii?Q?swps8JziOcilk8+qAwvvYGCR24rzSPteJJV1S3nKmrbjkTz3q6IK9qqhIFkp?=
 =?us-ascii?Q?C8yx+GgPzXuP/i1U0EfcMGcigH6zYddYO7A+Gm+8hkiyTj4UCt7J0Jiqte0w?=
 =?us-ascii?Q?qON7AGNN1OT2BDDROgIY48H2IiCwy6EXEtLYocImD+Crmwb5tssOgSBFArB0?=
 =?us-ascii?Q?OgU06Lba+MTKg8lA8sR6zZqmgepl/jLxR8HG2pk+53eDg2UGrak+6Ezp9Sgs?=
 =?us-ascii?Q?oKGQeBK+SstehXyPbeeEMB2G6oC+IbhTUp5hkbV/py1PWtYtyfX+dBe+Oa81?=
 =?us-ascii?Q?azmQ0p3pSFDhHOooJm40Fb5tsHQXShS+k+P3Vo1t3LwmiXPbxqBb4Gl4bHk8?=
 =?us-ascii?Q?ipKqWDyF9qViRi2gRz67m9zv98obs4Xz7b88Hqu0ImCRPeRTrHEg45Z7yfoF?=
 =?us-ascii?Q?PdvjC8WvYX7eKB+TkNmlHzzT8GtEspSzlOulTi9T1IQ77AWWUk7JQHSowWnx?=
 =?us-ascii?Q?MwKzuodazyaM9O/J4SzYiEE2zznq6bE9lBdbRT32HLvs/w51AmP/o4d1lFkR?=
 =?us-ascii?Q?uvAaN8qwgaOspYP/wDfUgNY0UlLLyu9drPeofbqKuBDMsspJxcZOS+x3swGs?=
 =?us-ascii?Q?yT2a0Ie50mSta7ICgLYJbgsHhzfz9UkGW3JYpy3QxlTfBpW/vIvGcxbSWSjH?=
 =?us-ascii?Q?MdHqzycpjqiB6mKBOhLOIPYwfwhGxCqVXdUH2DJHJ5stviwrFjA77QFzDhU2?=
 =?us-ascii?Q?Jg9+Csd4kDSuqd1Qs+i/ZnISMvnaJCyoymYvsTsfee7Ihi5wopxt7n12jtLn?=
 =?us-ascii?Q?RxvjkGncGDOVHPsz8AdN82+vZStuiT4Vf/mgbMV0VRu49aB+3vR0z5g335rd?=
 =?us-ascii?Q?D6LOKehpGOohwqrUlqBg38/P6h4XmtiUX3IcOGRY277v9e2QBOgoeo8/zbPp?=
 =?us-ascii?Q?g+GAZPO/s7fDd1eUun6/ogupAUyrbkEgUaNQEHNoCw716cD0377L2/1CaKT4?=
 =?us-ascii?Q?QmBmEnh5HUKkNDXWg6FsrleXRr/7sclepLAkk2SELOHYyXLAxJPlZPVOUJRu?=
 =?us-ascii?Q?KtgTDhGWz26Px4MD8ScpqYiWFV2S/S4n12g3/IbKK3mVTplFICxFtvSgdrVz?=
 =?us-ascii?Q?lRnqhq9khG7lPjre0NC++1n7Yj/roW9SqNEEvVgCBZDtqTOzP3YjtCZpp5Py?=
 =?us-ascii?Q?C0v1l3saqXnY5dB+MKlDrRrjJr0xIUvZVHqMQA5YBJUbgyC3IQWiUpfK9OFH?=
 =?us-ascii?Q?B1vAOXbniBZfwZ9xXRK5Sg5AjFMCMsfquWKpspLc?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3082a8f-dc75-4626-535b-08dd556e7582
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 07:32:29.1894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e/b4DPmniQFPmh6uBEN5DERtXVg6ZWIQNu1YbSJTFF1RwrdPxj43vlyyb+qwcVSTuQNZhvcZeyQ8Fh0UiBc4zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5894
X-Proofpoint-ORIG-GUID: 9vhbAXxjhJmaAnEOh6eOO-G-oICTcAQV
X-Authority-Analysis: v=2.4 cv=Be0i0qt2 c=1 sm=1 tr=0 ts=67bd7210 cx=c_pps a=ztkV8ooph0rfw1Th5QLTnw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=xCCLRF3hAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=ApGU2bTspFFACcf45TwA:9 a=PhG5usI1duurLUPoRPb1:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 9vhbAXxjhJmaAnEOh6eOO-G-oICTcAQV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_02,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502250049
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 07:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115561

ChangeLog:
https://github.com/inotify-tools/inotify-tools/releases/tag/4.23.8.0
https://github.com/inotify-tools/inotify-tools/releases/tag/4.23.9.0

Drop local patches as they have been merged upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-Add-AC_SYS_LARGEFILE-autoconf-macro.patch |  28 -----
 ...Bridge-differences-between-musl-glib.patch |  40 ------
 ...place-stat64-lstat64-with-stat-lstat.patch | 119 ------------------
 ..._3.22.6.0.bb => inotify-tools_4.23.9.0.bb} |   5 +-
 4 files changed, 1 insertion(+), 191 deletions(-)
 delete mode 100644 meta-oe/recipes-support/inotify-tools/inotify-tools/0002-configure-Add-AC_SYS_LARGEFILE-autoconf-macro.patch
 delete mode 100644 meta-oe/recipes-support/inotify-tools/inotify-tools/0002-libinotifytools-Bridge-differences-between-musl-glib.patch
 delete mode 100644 meta-oe/recipes-support/inotify-tools/inotify-tools/0003-replace-stat64-lstat64-with-stat-lstat.patch
 rename meta-oe/recipes-support/inotify-tools/{inotify-tools_3.22.6.0.bb => inotify-tools_4.23.9.0.bb} (70%)

diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools/0002-configure-Add-AC_SYS_LARGEFILE-autoconf-macro.patch b/meta-oe/recipes-support/inotify-tools/inotify-tools/0002-configure-Add-AC_SYS_LARGEFILE-autoconf-macro.patch
deleted file mode 100644
index 3b195aae4f..0000000000
--- a/meta-oe/recipes-support/inotify-tools/inotify-tools/0002-configure-Add-AC_SYS_LARGEFILE-autoconf-macro.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 6a57ff26d695aaad096b798879a5dbc5af2cedf5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 20 Dec 2022 10:46:50 -0800
-Subject: [PATCH] configure: Add AC_SYS_LARGEFILE autoconf macro
-
-This will define _FILE_OFFSET_BITS to be 64 if off_t is 64bit
-and we do not need to define lfs64 functions
-
-Upstream-Status: Submitted [https://github.com/inotify-tools/inotify-tools/pull/174]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index bddf14d..b89a266 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -17,6 +17,9 @@ AC_PROG_CC
- AM_INIT_AUTOMAKE
- LT_INIT
- 
-+# Add option for largefile support
-+AC_SYS_LARGEFILE
-+
- AC_PATH_PROG(DOXYGEN, doxygen, NO_DOXYGEN)
- 
- AC_ARG_ENABLE(doxygen,
diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools/0002-libinotifytools-Bridge-differences-between-musl-glib.patch b/meta-oe/recipes-support/inotify-tools/inotify-tools/0002-libinotifytools-Bridge-differences-between-musl-glib.patch
deleted file mode 100644
index 931244830c..0000000000
--- a/meta-oe/recipes-support/inotify-tools/inotify-tools/0002-libinotifytools-Bridge-differences-between-musl-glib.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 6c3ce01a281a9aa661494d24a862219fc9e2b460 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 16 Dec 2021 14:57:55 -0800
-Subject: [PATCH 2/2] libinotifytools: Bridge differences between
- musl/glibc/kernel fnotify.h
-
-System detects to use sys/fnotify.h and then assumes glibc's definitions
-but musl has definitions of its own. perhaps portable thing would be to
-use linux/fnotify.h interface directly on linux irrespective of libc
-
-See the differences discussion here [1]
-
-[1] https://inbox.vuxu.org/musl/20191112220151.GC27331@x230/T/#ma8700992467200c8792e0fa8508eae656b81aeba
-
-Upstream-Status: Submitted [https://github.com/inotify-tools/inotify-tools/pull/154]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libinotifytools/src/inotifytools.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/libinotifytools/src/inotifytools.c b/libinotifytools/src/inotifytools.c
-index 902eac2..2b96395 100644
---- a/libinotifytools/src/inotifytools.c
-+++ b/libinotifytools/src/inotifytools.c
-@@ -55,6 +55,12 @@ struct fanotify_event_fid {
- 	struct fanotify_event_info_fid info;
- 	struct file_handle handle;
- };
-+
-+#ifndef __GLIBC__
-+#define val __val
-+#define __kernel_fsid_t fsid_t
-+#endif
-+
- #endif
- 
- /**
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools/0003-replace-stat64-lstat64-with-stat-lstat.patch b/meta-oe/recipes-support/inotify-tools/inotify-tools/0003-replace-stat64-lstat64-with-stat-lstat.patch
deleted file mode 100644
index c0784ecc73..0000000000
--- a/meta-oe/recipes-support/inotify-tools/inotify-tools/0003-replace-stat64-lstat64-with-stat-lstat.patch
+++ /dev/null
@@ -1,119 +0,0 @@
-From c6093ad63b92f5d25e6826d1c49dc7cee86d3747 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 20 Dec 2022 10:48:10 -0800
-Subject: [PATCH] replace stat64/lstat64 with stat/lstat
-
-lfs64 functions are not needed when off_t is 64-bit
-Additionally this fixes build with musl which does not
-export these functions without defining _LARGEFILE64_SOURCE
-
-Upstream-Status: Submitted [https://github.com/inotify-tools/inotify-tools/pull/174]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libinotifytools/src/inotifytools.c               | 8 ++++----
- libinotifytools/src/inotifytools/inotify-nosys.h | 5 -----
- libinotifytools/src/inotifytools/inotifytools.h  | 5 -----
- src/common.c                                     | 4 ++--
- src/common.h                                     | 6 +-----
- 5 files changed, 7 insertions(+), 21 deletions(-)
-
-diff --git a/libinotifytools/src/inotifytools.c b/libinotifytools/src/inotifytools.c
-index 50f6135..3e17ac6 100644
---- a/libinotifytools/src/inotifytools.c
-+++ b/libinotifytools/src/inotifytools.c
-@@ -1750,14 +1750,14 @@ int inotifytools_watch_recursively_with_exclude(char const* path,
- 
- 	static struct dirent * ent;
- 	char * next_file;
--	static struct stat64 my_stat;
-+	static struct stat my_stat;
- 	ent = readdir( dir );
- 	// Watch each directory within this directory
- 	while ( ent ) {
- 		if ( (0 != strcmp( ent->d_name, "." )) &&
- 		     (0 != strcmp( ent->d_name, ".." )) ) {
- 			nasprintf(&next_file,"%s%s", my_path, ent->d_name);
--			if ( -1 == lstat64( next_file, &my_stat ) ) {
-+			if ( -1 == lstat( next_file, &my_stat ) ) {
- 				error = errno;
- 				free( next_file );
- 				if ( errno != EACCES ) {
-@@ -1840,9 +1840,9 @@ int inotifytools_error() {
-  * @internal
-  */
- static int isdir( char const * path ) {
--	static struct stat64 my_stat;
-+	static struct stat my_stat;
- 
--	if ( -1 == lstat64( path, &my_stat ) ) {
-+	if ( -1 == lstat( path, &my_stat ) ) {
- 		if (errno == ENOENT) return 0;
- 		fprintf(stderr, "Stat failed on %s: %s\n", path, strerror(errno));
- 		return 0;
-diff --git a/libinotifytools/src/inotifytools/inotify-nosys.h b/libinotifytools/src/inotifytools/inotify-nosys.h
-index 01aa45e..97166d4 100644
---- a/libinotifytools/src/inotifytools/inotify-nosys.h
-+++ b/libinotifytools/src/inotifytools/inotify-nosys.h
-@@ -13,11 +13,6 @@
- #include <sys/syscall.h>
- #include <unistd.h>
- 
--#ifdef __FreeBSD__
--#define stat64 stat
--#define lstat64 lstat
--#endif
--
- /*
-  * struct inotify_event - structure read from the inotify device for each event
-  *
-diff --git a/libinotifytools/src/inotifytools/inotifytools.h b/libinotifytools/src/inotifytools/inotifytools.h
-index 49936ae..2ec4358 100644
---- a/libinotifytools/src/inotifytools/inotifytools.h
-+++ b/libinotifytools/src/inotifytools/inotifytools.h
-@@ -1,11 +1,6 @@
- #ifndef _inotifytools_H
- #define _inotifytools_H
- 
--#ifdef __FreeBSD__
--#define stat64 stat
--#define lstat64 lstat
--#endif
--
- #ifdef __cplusplus
- extern "C"
- {
-diff --git a/src/common.c b/src/common.c
-index 5a6fda1..885286e 100644
---- a/src/common.c
-+++ b/src/common.c
-@@ -45,9 +45,9 @@ void print_event_descriptions() {
- }
- 
- int isdir(char const *path) {
--    static struct stat64 my_stat;
-+    static struct stat my_stat;
- 
--    if (-1 == lstat64(path, &my_stat)) {
-+    if (-1 == lstat(path, &my_stat)) {
-         if (errno == ENOENT)
-             return 0;
-         fprintf(stderr, "Stat failed on %s: %s\n", path, strerror(errno));
-diff --git a/src/common.h b/src/common.h
-index 12d3dde..7f1e34a 100644
---- a/src/common.h
-+++ b/src/common.h
-@@ -1,13 +1,9 @@
- #ifndef COMMON_H
- #define COMMON_H
- 
--#ifdef __FreeBSD__
--#define stat64 stat
--#define lstat64 lstat
--#ifdef ENABLE_FANOTIFY
-+#if defined(__FreeBSD__) && defined(ENABLE_FANOTIFY)
- #error "FreeBSD does not support fanotify"
- #endif
--#endif
- 
- #include <stdbool.h>
- 
diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb b/meta-oe/recipes-support/inotify-tools/inotify-tools_4.23.9.0.bb
similarity index 70%
rename from meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb
rename to meta-oe/recipes-support/inotify-tools/inotify-tools_4.23.9.0.bb
index 8a0ae17ad7..fdec940268 100644
--- a/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb
+++ b/meta-oe/recipes-support/inotify-tools/inotify-tools_4.23.9.0.bb
@@ -4,12 +4,9 @@ SECTION = "console/devel"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ac6c26e52aea428ee7f56dc2c56424c6"
 
-SRCREV = "c8bdbc0a2ed822fc7c67c5c3e102d89fe27fb2d0"
+SRCREV = "5c2ab772338bcbe516306bf8cf1059ddf2fa6bb7"
 
 SRC_URI = "git://github.com/${BPN}/${BPN};branch=master;protocol=https \
-           file://0002-libinotifytools-Bridge-differences-between-musl-glib.patch \
-           file://0002-configure-Add-AC_SYS_LARGEFILE-autoconf-macro.patch \
-           file://0003-replace-stat64-lstat64-with-stat-lstat.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.25.1


