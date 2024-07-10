Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7BE8C38150
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 06:33:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7967.1720593203074050652
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jul 2024 23:33:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=792143356b=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46A4qNmj028684
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Jul 2024 23:33:22 -0700
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2170.outbound.protection.outlook.com [104.47.73.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4075eg37fe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jul 2024 23:33:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UoLfnGJpOZtzOChNpQB0H38iI/2R1r6SQO5caTgQpTmN0JWkbPKIoLtn1IY3xQW/v2pyqhvKE/9aTHTqqZc3NXnnSj+Q1f7QOyvRBDSP8wrLa843BsS2BY9jeD88iOxf5IKTX/YEoP0oCcrmVjO50sr2egcMPhfeUNNuJkHhUqWxRoCzsgH2mNpNLYShopJtVbEw5VfVtQXlCbbLWaTcO8yShRmESAyEpkgjZZppE6owDOYSse8IyqJflmvE92B02ej2mIWkLEkCOItQWJ9ll67Rp19KF66nKlN/BChcy5TPc8eyFiTbuaxzAHAuFBMEB80pnwh3X6PJ3fsCfvKgzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMNCAy8cvk4laZmzFCkdP46uCdHj39/LVbQBvBTh5Oc=;
 b=FjycjPGPodI1AlhlRhyNoRE3gdxLBUKwOHS3m2VWLi7rfWiV1k5izj9XqZ09SpMHeJA8s+vbm4Qkv3k8XRYYbPtyD1iqrkpP0yc7YRmlh3oW+nAcIT4FlUMb7rx/HH2GBFUfKJpqA+RRpAYOC/ajNsCMFv8Q9nQUhRbf+NZiv8NtQKKGmt35nOPlFR89xFcpTH9/gpFi95tJivSmg/606ODtg1LvXilT3reh05vJfIiTw594X0PvQSpHwl+cWS9ZxDvVOXzc+of1EMQdGFyUr4jqHPnARm5xr7VuxMqVXbF5cOX5dbH4Hvzlkchx96+K4OZO+TKaKbPQfRlAh/RBkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by MN0PR11MB5961.namprd11.prod.outlook.com (2603:10b6:208:381::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Wed, 10 Jul
 2024 06:33:19 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%6]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 06:33:19 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: Subject: [meta-xfce][kirkstone][PATCH] xfce4-panel-profiles:fix tar error
Date: Wed, 10 Jul 2024 14:33:01 +0800
Message-Id: <20240710063301.3143243-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.35.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:196::17) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|MN0PR11MB5961:EE_
X-MS-Office365-Filtering-Correlation-Id: 594e5c49-774a-4463-0d44-08dca0aa2ff8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wmcbUbLqiHK9cN+Dj4ShPkjF4bJ2S1+1zQyrNvd8MSfqG4hLV9nTejvZQech?=
 =?us-ascii?Q?88Z62lD8o854GYfKEqS2UgMKUGO9U3Wzrbb4iU1vgXKsArDJNZwV2nIffNoE?=
 =?us-ascii?Q?GOowK7N+hlf9o6rReKRSY8ifB8wAlpFgTU57Jagn81ZEcOonmtNTreYLjVTS?=
 =?us-ascii?Q?HSQaZeqaDV6De1+anZl+drgsbUX5uOgeRvQEumUeE5K6Kxa2ySTUwWHOPYuQ?=
 =?us-ascii?Q?kONw/o33oiaJ1pqaM0GRWvkF7sq56QNo5323kvBaeWc1eBAJ1HivUD+eq0B8?=
 =?us-ascii?Q?t/Ns8jqhQroUdub3WxX41Z5XU0nmZu2/CdM8Bpoag2Lc0oxYyhQ8gZsv3B/s?=
 =?us-ascii?Q?/mkYhqKwUVWH3RaX4zAGw2mex1loxC8ZyiD4Z0XCLbwQ6UE1bB4XkAye/QLF?=
 =?us-ascii?Q?zccINWopdDLg9iVa5bpehSmhw9eLwyX9G4UzlylasfKlL3HuW3p9o5v1x8kY?=
 =?us-ascii?Q?kOBNsQqvsR0hj2dtJuF455Kbdbo964m629U0Fb7RhWrwUHeHItl6QHQqRoKX?=
 =?us-ascii?Q?bTLIyz1bU/ZFTiB+yokJgHv4CMMcCURdJr0ZNRzgo3mnZ9gDQipQ1glO0Q28?=
 =?us-ascii?Q?tDMkOFjh4zWELnSgB0S3J70BC9mUIA/xhAz6K63/h4zUe3iGiwz2Fj+CdiUU?=
 =?us-ascii?Q?rNJDZw5DQkPVImWrIBqU4d6u5G9JFzNTYFzSD4pkAwXMhGIrFXQb9+5hFr6A?=
 =?us-ascii?Q?g9GimmYCNH9Q8v2ZEEHKuV4f2XV84IEQgwEz1ApFrKliI1C+Qt3XGIXzzNZn?=
 =?us-ascii?Q?lW3qXT+LsoKRPHIoJwWFDvcxwsnVJKkkwaSv2/V5QX+N48WWTOnugLJ1tXhh?=
 =?us-ascii?Q?he649Qu4jcUFypkLreCx9WxxyJY6f4sSZfizC4I3q6tHCPJheUOl2f5tyMfw?=
 =?us-ascii?Q?V7DlGz/iUIZ/SKWdh/QAwnEIYpgsVS8oh54l2iYj7q1Nri8saEC5/EX6eVd9?=
 =?us-ascii?Q?AH3N5CZbA/4oqc9ogGIObcxRljdeOix8fCDwU+jNXA8tHMtqGW0q+ps7JODx?=
 =?us-ascii?Q?dvJDjtxj8BI2WtaQFJWx4iTR7zV1ds+mP2IflvZIMejBriJVQn1y5xjh3wLQ?=
 =?us-ascii?Q?3OMCSiSon8h4CUtb9dNGigSHMmrj/A2anSKDECEdbIXRsAJMM/6ezXmDbjDY?=
 =?us-ascii?Q?j8equZAAC+biy31c32k3ffPSLAUZ3NJ6DJMOlcczkUB3ma3VaFt9Q1pPq31F?=
 =?us-ascii?Q?oB3gEaJzK0+gorKxwbzcL0v9okrmDQYssBLdvLZ9+9RbvdN1JCXm/fFzTc9T?=
 =?us-ascii?Q?W6FcMPxriA3qypCwJyCDkAPLPwsFt+jhqOSpVsYCVRSfvh+290YAs40QaLy/?=
 =?us-ascii?Q?I+Pb+5ufTEYrQ1fN278Ka5ZbTOrj4OxGzHn0xJ0wZvcW1dm7Dvgm/pEr4HPP?=
 =?us-ascii?Q?9d/7DrM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0ZC5SQGC0zvEU/ixTDt1/ekzhAENtvmwAm10L8wBibJTOrTlRA74V0HXMu+g?=
 =?us-ascii?Q?BJQX8YScGKhn/a1ilsvog5xzxPJZlOkAB/Rc4mhWtnXR0P0NvCCXGcWjCRwd?=
 =?us-ascii?Q?9sCmu71xDPjfJkyQtJBaJhavxIz2K6yE5zm1aAQ8Jc7k6WLTSBwW+ZCBWg4b?=
 =?us-ascii?Q?Ze95w04j1Vx6C/6jY/bljB4O3TsLk4DmZ7ZAzeu0Omi5L2rrwli46h6ocaeh?=
 =?us-ascii?Q?Ugz8WqORhDsch81NMJSCesfaod/0OLTUihUvwNUTxPGiQvl+eJUiZpVMA5PG?=
 =?us-ascii?Q?IvVyt3HmR/47Clu1HgMIBZK6dIUBErhr6UG4t20i9jeF2JQ7/r8bZyL2hqnC?=
 =?us-ascii?Q?rmZBAxwaZmS/rSYflTZFRFMC5n/kePEoqDcI8noNfeJzdVe7JD62DUJTjCAz?=
 =?us-ascii?Q?6rf2YitAxTMHazgimlynXno4tulEcqbK7v0NDHkuI0GU02Lsp0IRWYXWn7Ac?=
 =?us-ascii?Q?xCrD+N8Txg9/HIegc4sOPJeU7/zgjS7/zEhJiVy7+a2ir5p24shO/NK1y0rj?=
 =?us-ascii?Q?uGv/JmeWaZ4buH8IXKu5iLvZMB1Auk2Lz4emNQVGzakSKaGDlnejLaxehXT+?=
 =?us-ascii?Q?NmyK2Jm0uPJTzlvWVq5FtVVO/GlMSvipPm8mATyvK3fRvDN63rxZw47YhEM4?=
 =?us-ascii?Q?nv8tHbrkuZGSBVw/JC9qQ0ft1ULS1ej1ChiL/LKTpHoObb8qy+mN6Tr7Rhdy?=
 =?us-ascii?Q?Uwi3q+ByUZ0Qepl9AWvruuTP4jaaPqoouajcqYu9bk3WEpahIqJ6yk3nyHNX?=
 =?us-ascii?Q?+XEagCosY5V0blBTGsFh3+49wg/SKTWGdELd2ZS2CiKbfrQORevjcgkmQkq3?=
 =?us-ascii?Q?CkP1D/XtnpkkkZPKY39xf5/UbkFB6HCFG7qIzSXQl0fACFCEWXFnqAtWQzJb?=
 =?us-ascii?Q?68zFFeD+ZgareTuCrH0fIfMRnMNqi7Z+fczjpLS8bQuye0mpyXfHm6PGmYZY?=
 =?us-ascii?Q?y6/hnt4S5XN5ajVlV6yx6Yi/8XuB981CeJwcVYvDvl7KnsMNkx/YHpWTC8wN?=
 =?us-ascii?Q?InkWDUizR1TGRH2k9rtWdPwOaRJIVhMQl6crmw7alE/JDT0YULpjF8LuZ78A?=
 =?us-ascii?Q?Js9sdeL1zKPFjKqOnvLbsEelAaUwqEAn1DGWYF+ylUFgAqbaPbtTUCsKygRf?=
 =?us-ascii?Q?SwWUh4WELznRcseXFkMoxg5z1dPTxoYjA0voX5U67xTq7XGo1s6P1GEQE88/?=
 =?us-ascii?Q?IO0uQZ4vlSsvPs+zmAalzjABiTN97/O7IZD03NHgCJsCA8DGCvBUbvYpNk73?=
 =?us-ascii?Q?wEU6TOmNeA7k0mHAUHY9/1nW25DQF/Zp6wbV5FTFHAQC4Zys/rNgvglP+eVz?=
 =?us-ascii?Q?CpmhiCiAd4AgJlYR8POeufE42kZK0WrUdaUWRSyruJPFH1CcGVbbQ5ULuM8J?=
 =?us-ascii?Q?IUQMwCo6EWhplf+n5IF6/E+nvQSwOA63Uh4oSeEAv1qZL3gDGSpJ72H1egr2?=
 =?us-ascii?Q?iPzpOABcgUL5df3mDm4T9wgCqNrI7RGkvTGQlQgS+ZoQ/wysYiIFec2x3WGE?=
 =?us-ascii?Q?hr0GU57mh6tPdfZLjWE1/ABVfyZ2kdy1dtwoFFMB6GcRoXTUfh+l3etPdUcV?=
 =?us-ascii?Q?D21dR8d6z4EKIKP3Nv5o79+EIQK2ccYb81ZwoNlOsv4gz1ZmDpbfRrRV1pfT?=
 =?us-ascii?Q?lQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 594e5c49-774a-4463-0d44-08dca0aa2ff8
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 06:33:19.0939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aFNZ5MgH22EB3HsRqS/zSU4xoAKyPecEqTwRHFZmNP7+VRzA2q2I5xYYvALLf0JAK/Z8PPNOMJSFyChh5kBD4mb1rezZHJwDq1OTBVz94O8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5961
X-Proofpoint-GUID: sSqIbmmTMEKXNN_YY-FCyGAMqxGyO8JW
X-Proofpoint-ORIG-GUID: sSqIbmmTMEKXNN_YY-FCyGAMqxGyO8JW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-10_02,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 adultscore=0 bulkscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407100049
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 06:33:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111287

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix tar errors:

  tar: value 1762430260 out of uid_t range 0..2097151

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 ...Makefile.in.in-Pass-arguments-to-tar.patch | 30 +++++++++++++++++++
 .../xfce4-panel-profiles_1.0.13.bb            |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/0001-Makefile.in.in-Pass-arguments-to-tar.patch

diff --git a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/0001-Makefile.in.in-Pass-arguments-to-tar.patch b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/0001-Makefile.in.in-Pass-arguments-to-tar.patch
new file mode 100644
index 000000000..6e1718737
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/0001-Makefile.in.in-Pass-arguments-to-tar.patch
@@ -0,0 +1,30 @@
+Upstream-Status: Backport [https://gitlab.xfce.org/apps/xfce4-panel-profiles/-/commit/1b853cf]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 1b853cf45b63c67ef52fc1288afb19b18542bb21 Mon Sep 17 00:00:00 2001
+From: Akbarkhon Variskhanov <akbarkhon.variskhanov@gmail.com>
+Date: Thu, 3 Nov 2022 10:29:52 +0500
+Subject: [PATCH] Makefile.in.in: Pass arguments to tar to make build
+ reproducible regardless of user or umask
+
+---
+ Makefile.in.in | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Makefile.in.in b/Makefile.in.in
+index 84b12cb..cdb05c6 100644
+--- a/Makefile.in.in
++++ b/Makefile.in.in
+@@ -31,6 +31,8 @@ pot:
+ 
+ ifeq ($(shell tar --help|grep -o sort=),sort=)
+   TAROPTS := --sort=name --format ustar
++  TAROPTS += --owner=0 --group=0 --numeric-owner
++  TAROPTS += --mode=u=wrX,og=
+ endif
+ layouts:
+ 	cd data/layouts/cupertino; tar $(TAROPTS) -cvjf "../Cupertino.tar.bz2" *
+-- 
+GitLab
+
diff --git a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.13.bb b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.13.bb
index ab1b82726..f4681f460 100644
--- a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.13.bb
+++ b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.13.bb
@@ -11,6 +11,7 @@ DEPENDS += "intltool-native"
 
 SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/1.0/${BP}.tar.bz2 \
            file://not-create-link-to-locale.patch \
+           file://0001-Makefile.in.in-Pass-arguments-to-tar.patch \
            "
 SRC_URI[sha256sum] = "bc387c13f94109422dc72b0fcb919b0dc11619ba589d03e492252b0d2513b170"
 
-- 
2.35.5


