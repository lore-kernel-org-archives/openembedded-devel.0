Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE4B6C36014
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 09:28:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.27659.1743326895849289147
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Mar 2025 02:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61843d4d18=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52U9KTvf005812
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 09:28:15 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2047.outbound.protection.outlook.com [104.47.74.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45p63111wb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 09:28:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z8QPrMeCvWMccCN39aXRb/x1khMWmcQo1sDhAq/92BOKvpww6rhGxCQKvMZ2maXx7jvqf/a26P/pR66GGwkHl0ikkcdny278LGkd1/PxFy21CqW9s2kzxGea57nxXvci8B15qP2opLOfHG+b0ZNUHDYFIkc3RwZBn5s85+aIaLJF/LY22OuRX7GXxsQakNbPSnw0zjmzwUdtXo+qfIlKHVmf8wdStCJhQn+SCq2Y3eGZzYvZuIbxem3nnDevpFWFrSPi6H30dnQLNds11NQb9tdtgtKdBG5NpJiaFIsNwoE5xvfKG+KusQY0mi6Ca0qKmKtCLSsioPyF7BrvljNmWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9KvzB08NGAb/hd0FyKAFzK9bBFnM4WfBjnUwXZLLIs=;
 b=AGgRJunz4BRI5xlprS0WHTuxZlRBmuC0BuVxvF+WMeRA4g1Hp5OzXDJ8dIQlwirPVoYSMnxdRj56lT48bXLrRVZz4j7rV1n/r6vUXMq9S2xSmKAXGiWlbs9kigAYWhLf5XMu6DYR2T2VkSTEPQ3b3+I8tulpLCERU9ki+mRnqgfHEBE7nZK0CEfMeuLCKc35lAhD78VPrLGS+lW3mLUIDwfUK66q6j0KyfTMuGBBUtMKikmZLwL/DlL8/W716w3Tc8FhvTej9C4jwJhy01DdP7UbM4xrunX1UToc8qti/mMWpYukZurBf6io7kCOxMTgqOsdlOTCkH1PIFdU0AQJsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 LV8PR11MB8769.namprd11.prod.outlook.com (2603:10b6:408:204::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Sun, 30 Mar 2025 09:28:11 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8534.043; Sun, 30 Mar 2025
 09:28:11 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/7] libidn: upgrade 1.42 -> 1.43
Date: Sun, 30 Mar 2025 17:27:54 +0800
Message-Id: <20250330092800.1275186-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:3:18::20) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|LV8PR11MB8769:EE_
X-MS-Office365-Filtering-Correlation-Id: d05a921a-33cd-465b-e379-08dd6f6d3096
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?F4tMxPxY/rSITRyQfLATqleEs5BR6Wx2twjGDP/bmuHZKzcAQyeWOrJZRxoc?=
 =?us-ascii?Q?0mTJxvJ5ucqiUq+zcTDTuRTM0UPu4TgbZaClKZHcPEPgtdTJUkTwn18aSUtW?=
 =?us-ascii?Q?0mNB63vk40Bbm4fL/i+NwZ7D4aH+rJQ4TEUjYW4r9oRBIGXl9g3LweBLfxoB?=
 =?us-ascii?Q?OfOpzIm7BNyobaSXbx8j0x4hfmiBw4MKyU7yA81vs6VM4Sq0FPPu8TSi0Nm0?=
 =?us-ascii?Q?S79XDF3MKhHPgPoSD3M9BnLK8UGYor5tUbZCe1w3tLTy0Qa96Cv/zzQmMAdQ?=
 =?us-ascii?Q?yHhXvGpRiiJjP+ztHBiDOETTj+ns+Pg7RREKcuiqamhhZC25OS4XLDWGuBrl?=
 =?us-ascii?Q?JeeNcF4SD1SKS3vt96uBF4Kn9AXwbLFCcdEh12xyYe5S/44qfS4iGw0AT0Bi?=
 =?us-ascii?Q?sCmnZMYgi/FuHFV/zD0buAV8vV6Y8j0XnGoBKaeUM6ABj2HRa3CxbQEvf/aM?=
 =?us-ascii?Q?ojzrjhX3NIrX4WBUyQspqakh6COeC6cym8Jb5m1sIuaLBnOenSPdKZVgsRwQ?=
 =?us-ascii?Q?7n+X5k4nYVFFYa2686lQuy4fiZdoz4fuF/bYNqJqemcgk31G4gaJoYHUqB+t?=
 =?us-ascii?Q?UMsUKMZgff/ioAkjbKBLMGpff2+5Mv5dc/TRD1yR2KIZhdEcJIGCY7nYAZ2G?=
 =?us-ascii?Q?ka0cNuRzJrfQZ4pdkEUQjCTy2j96Umc9dozcQcCWboiQJdjeh7U4uYNwq9w7?=
 =?us-ascii?Q?4CZZc1p+uUdSUmecW9bu4Z9FrfGawd5EaHgwBrD9Ft3FR6UqRbG2oCe8CoAR?=
 =?us-ascii?Q?P01OTqHhO2Ld3yxEi3JOf35yLvWPJEOHpf3UsbratVz93PwFZ3qpYP8wz1rR?=
 =?us-ascii?Q?7NtZxWHbI3i2JU3ThLg3dlwLYvH1/kC/lmGwuuwxHQUq0XL9FDqEhEyasKzF?=
 =?us-ascii?Q?I8RklV3rFoQYYMZD3igmu4y4ZypKrXQi3/fhdFuQp8i0ZVeGzBI+jnkzxoJ7?=
 =?us-ascii?Q?UvqRx3vL/JWoyuohciTYthCrAYfpz95iNtykXKWNUQTsLEkNJ23ZI4qjrax+?=
 =?us-ascii?Q?/cYRvOGytCOC5bcGkUfalBIhV3Z4Z+hmdVtogCdXFVSjoYK/Fo+0ApFrkNGb?=
 =?us-ascii?Q?Q4OOliZjYWbQtc/BnKFCe+iB5zBDYOn+96aJ3b6NxfwnBqDm0zzq1tgqCZcs?=
 =?us-ascii?Q?leqH1wL4KkkUaWGyflfAsKbR/DjYAhE1R/cbMPmH315mHpBmADw+XaCEov57?=
 =?us-ascii?Q?EZcdOd0ueaXDp6F5LdZgFVZfFTwhyQYmFaL8eFZLJeGlVD5UJrO4qIbqRBwl?=
 =?us-ascii?Q?waueikPkOT1dMFMav0z7yDt2Xr1rMb8Lj2MU1Kjf8xi1HLQp53lMp1LHiKm6?=
 =?us-ascii?Q?HEz2KP5/aQIa11VUSTsXYwAdlg3xDww5SYPUmybMqO0bmvLMwPTLubqQywKe?=
 =?us-ascii?Q?jn5NEgpsIewHI78qMOUCLEbkSilgwrWAAHEDOyyDEQWAVj2dc7gV0Np9qitO?=
 =?us-ascii?Q?XGlNp4Qg3cA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bkk2e0sVSVVGnCAs+Fha8VlBKelUfzf0EKu0mYSDmkT1g5gvp56sLWOJd+1b?=
 =?us-ascii?Q?I7ZrrbBy3zmrkTHCr0w/MilFrUqRLakFWqF8eJXPwFMrL6LM37AqxsDtro21?=
 =?us-ascii?Q?OKXyjlqPVfkRDLdlLZeyBoi5/KChQswOzTpz4rnobRuwlH6AhyPJ26WE5OUq?=
 =?us-ascii?Q?cFN3MVRYNI6C+FR5bLmWuwJMTu2SKSw/8TRn6TxR+YBdUg4Vkf4119JDxYeO?=
 =?us-ascii?Q?2MWAW4FYWTK2AQ3fLq1Wm+QG4Tc0a/RLfe9nyFpp3hFxxfrIaeDH0q3UVBFR?=
 =?us-ascii?Q?CBzUUAGPsLXg5pjXjg5zRcP6aYzfYCndUjj6KD5xkwip1Fxaf5FnxcaezgL/?=
 =?us-ascii?Q?cPghQ7ZPpAgzCsXA0C5Q/ZMbYRsdeX+O4TbnE21KxInMINEEOTalpkY1Qux3?=
 =?us-ascii?Q?iGsSHczoz2DW3ZWQNvpZu/swPN7HWx6qs64aUb3HVlCx0QKWeiyHbT3306PN?=
 =?us-ascii?Q?A/+zkMPB3ZOv36T/JiFnKSa+wWTzlSQ76hYFHx5vP5Camdp0PoXxlfS1Ac7T?=
 =?us-ascii?Q?ITXntJ4moa8vpMZr/L4tLUXQoT5YbyG2MKky4sFoFYfBhwe+JXqu18ZhR6U7?=
 =?us-ascii?Q?sSsqCpZDWhjrLDgf5Ie97NKrdnpbP1pzd9blXwc309OPk5balRbxBwVNfhB4?=
 =?us-ascii?Q?xgRx/2GbbeUMEhHW+6YrxqMR0oW/gRgGRxIizDIcp3gOazrS9HE2bAYIxiQn?=
 =?us-ascii?Q?XQ5HCctAFxBbzpUF2pB6kdPU0wVDoQVRVo27Y3rJHbPg0J7rb8bLeUfxOnXA?=
 =?us-ascii?Q?w1UI4/Fw4JLSnmA/mayH6aQJ8iDtndf8CT0jMTlnKfNe1+SxvWF9b9VwWl/f?=
 =?us-ascii?Q?EE5V4ocXfE+/WA6dso6OaMBcLQOoOBzrD3JLysOO2MdjVGTff+c8/9PeuIvp?=
 =?us-ascii?Q?gdUaFs6Lz8oYPSG08LCgtgJxNE3IGGndXYhrsbo92xsQYkP5utD6Uk4NY1Kw?=
 =?us-ascii?Q?m3XN0sMHociYwX9C/KWwXSbldUKwlsmAUc5kNNNtU2N1dgzoI+SB5n0lKX2z?=
 =?us-ascii?Q?IqIt6faHHFeg+F0MX/VBZYaD5YWZ0+lhYGl5FBm4zeGysuQNz3KOjL3E7LYO?=
 =?us-ascii?Q?emVlddzQlJR7gEBzPbMtXk5Mq2U7+zxS99Rxor/4xwA2A5u3Z6IyMObEgPnO?=
 =?us-ascii?Q?eo/bje9ymaamre9pHpTv6ufkCeitZYT7gDSLwvm1eyHeSkLD0o7q+WtHKlNl?=
 =?us-ascii?Q?JamYFlgz3+yq8ZvIW01MUKMl/QU6idtAXkehAWbls9h2aTskyt0Srqs3vO0m?=
 =?us-ascii?Q?ANH2zg1Dl1JmzC5OlF9SwpkPsMXa4693EsB3+ZcShRUFScOSheAjGSlYlPq2?=
 =?us-ascii?Q?wtK0C5+mup5HrkV77KXykuQEEnc3Hxn8CWycDrSYD3Equ+85WikT2B9XP0Y6?=
 =?us-ascii?Q?Zirzjc40HJcKUqjBRykmQKXhhrRNgY+NRUgrj5Etj3ZZxt2TnS0IATQOY1iy?=
 =?us-ascii?Q?4Zh80EuqVWHw055IddVEvzS5fit6edKVqRgAmoPYme0iOGigv/6XMVnn9RtJ?=
 =?us-ascii?Q?s8RfqnimVGzKDjK98Xg3hzkZrtZ3JGQfBhDf2otuAafu+YKrS7aY6cRkVJ6l?=
 =?us-ascii?Q?ZIvuna+FvRCQw3z6kBAJTfWA+XneP3eyAkPOaO6o?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d05a921a-33cd-465b-e379-08dd6f6d3096
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2025 09:28:11.5323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UkwC/laoam4KrOzG87PoDVdX17jc1hKaGKAgYfrWrxqrneDKcpPrAwvgpHJWo5DHHq1AUEIBiVABH1vpDV6NLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8769
X-Authority-Analysis: v=2.4 cv=C+npyRP+ c=1 sm=1 tr=0 ts=67e90eaf cx=c_pps a=tpf30LWoD3GURU9dwhXxZQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=1Ek0H-WffEOfODHU3yQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: l4BjImSMF7NQhJCGFMdBXKzUHLkRheom
X-Proofpoint-GUID: l4BjImSMF7NQhJCGFMdBXKzUHLkRheom
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503300065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 09:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116379

ChangeLog:
https://git.savannah.gnu.org/cgit/libidn.git/tree/NEWS?h=v1.43

License-Update: Move COPYINGv3 to COPYING[1]
                Updated copyright years for idn.c and idna.h[2]

[1] https://git.savannah.gnu.org/cgit/libidn.git/commit/?id=799b11bdbcca9109c812c700e082cebc9295be5c
[2] https://git.savannah.gnu.org/cgit/libidn.git/commit/?id=27314c5af11763598ce5b20fc32690a48fe782c5

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libidn/libidn/dont-depend-on-help2man.patch       | 11 +++++++----
 .../libidn/{libidn_1.42.bb => libidn_1.43.bb}         |  9 ++++-----
 2 files changed, 11 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-extended/libidn/{libidn_1.42.bb => libidn_1.43.bb} (74%)

diff --git a/meta-oe/recipes-extended/libidn/libidn/dont-depend-on-help2man.patch b/meta-oe/recipes-extended/libidn/libidn/dont-depend-on-help2man.patch
index bb45c87246..a066b100c3 100644
--- a/meta-oe/recipes-extended/libidn/libidn/dont-depend-on-help2man.patch
+++ b/meta-oe/recipes-extended/libidn/libidn/dont-depend-on-help2man.patch
@@ -1,4 +1,4 @@
-From e75f27cb1d70052fe2bb6cae5846b68f8ea7fa65 Mon Sep 17 00:00:00 2001
+From 62d8c09422148c56b7b1011a5b3ccd553631e3c5 Mon Sep 17 00:00:00 2001
 From: Marko Lindqvist <cazfi74@gmail.com>
 Date: Sun, 29 Sep 2024 18:38:05 +0800
 Subject: [PATCH] dont depend on help2man
@@ -11,10 +11,10 @@ Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
  1 file changed, 1 insertion(+), 8 deletions(-)
 
 diff --git a/doc/Makefile.am b/doc/Makefile.am
-index d63cafa..ba9aab4 100644
+index ff62009..dba833f 100644
 --- a/doc/Makefile.am
 +++ b/doc/Makefile.am
-@@ -70,16 +70,9 @@ BUILT_SOURCES = example.txt example2.txt example3.txt example4.txt example5.txt
+@@ -87,16 +87,9 @@ BUILT_SOURCES = example.txt example2.txt example3.txt example4.txt example5.txt
  
  # Man pages.
  
@@ -25,10 +25,13 @@ index d63cafa..ba9aab4 100644
 -idn.1: $(top_srcdir)/src/idn.c $(top_srcdir)/src/idn.ggo $(top_srcdir)/.version
 -	$(MAKE) -C ../lib
 -	$(MAKE) -C ../src
--	$(AM_V_GEN)$(HELP2MAN) \
+-	$(AM_V_GEN)env SOURCE_DATE_EPOCH=0 $(HELP2MAN) \
 -		--name="Internationalized Domain Names command line tool" \
 -		--output=$@ $(top_builddir)/src/idn$(EXEEXT)
 -
  # GDOC
  
  gdoc_TEXINFOS =
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-extended/libidn/libidn_1.42.bb b/meta-oe/recipes-extended/libidn/libidn_1.43.bb
similarity index 74%
rename from meta-oe/recipes-extended/libidn/libidn_1.42.bb
rename to meta-oe/recipes-extended/libidn/libidn_1.43.bb
index 453a21f574..7c478a1495 100644
--- a/meta-oe/recipes-extended/libidn/libidn_1.42.bb
+++ b/meta-oe/recipes-extended/libidn/libidn_1.43.bb
@@ -3,13 +3,12 @@ DESCRIPTION = "Implementation of the Stringprep, Punycode and IDNA specification
 HOMEPAGE = "http://www.gnu.org/software/libidn/"
 SECTION = "libs"
 LICENSE = "(LGPL-2.1-or-later | LGPL-3.0-only) & GPL-3.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f95a3dc99fecfa9a0c4e726d4b5d822f \
+LIC_FILES_CHKSUM = "file://COPYING;md5=11cc2d3ee574f9d6b7ee797bdce4d423\
                     file://COPYING.LESSERv2;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING.LESSERv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
                     file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://COPYINGv3;md5=11cc2d3ee574f9d6b7ee797bdce4d423 \
-                    file://lib/idna.h;endline=28;md5=bff92cd5c90908728225a065d6908289 \
-                    file://src/idn.c;endline=19;md5=dc51ec9ffae14c4f96fb7db4a3d96b2d \
+                    file://lib/idna.h;endline=28;md5=82ce5c462ff87f37c7c0d3a92f8d2f6b \
+                    file://src/idn.c;endline=19;md5=21b4efac8525241da4d38dc1c2e3a461 \
                    "
 
 DEPENDS = "virtual/libiconv autoconf-archive"
@@ -20,7 +19,7 @@ SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
            "
 
-SRC_URI[sha256sum] = "d6c199dcd806e4fe279360cb4b08349a0d39560ed548ffd1ccadda8cdecb4723"
+SRC_URI[sha256sum] = "bdc662c12d041b2539d0e638f3a6e741130cdb33a644ef3496963a443482d164"
 
 # command tool is under GPLv3+, while libidn itself is under LGPLv2.1+ or LGPLv3
 # so package command into a separate package
-- 
2.34.1


