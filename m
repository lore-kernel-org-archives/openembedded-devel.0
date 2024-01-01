Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D2A1C47077
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 07:50:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1320.1704095416335109067
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Dec 2023 23:50:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=j1+p1jUd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=17302f783c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4017naQd013571
	for <openembedded-devel@lists.openembedded.org>; Mon, 1 Jan 2024 07:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=5gbaMwdxT9QMAB89pvKBy7bGXAywAvhXdlUP+CW3JU4=; b=
	j1+p1jUd8bbBkMHMoHsdQtCEnBHJDN+5W/zjwvO44XEg+/jsrsfWrvAo1w2RmB5k
	gSJMRebCgBl0Uqht4MI0Rj6/beciQMcqmydQVBsc5njjI5F9Vc3wQVYqo8ju+a6/
	QpQmw2BmoAysuoWkuL4JAVziWQrWGdy2jFnYiaUdgGNmsiiK20CejChnCkhrQTG3
	9+YYnEFnHzGM03kRz7PENrnPTEZC7QOJWiQK9zUYwTm8DcsYAovwmL6xCKhJPftZ
	OVAOmVX/xcqmsXHvBmFYtd9gflxGR9psbLbji4LZEzzWG9fE6C9tET/K88zYLVBx
	TKXHeuT1A4ieyTZ+exNzJQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vaa661pjx-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jan 2024 07:50:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZgZGXUw6IT9nefk86dsMEMJrWwvfbEiDUmTSAnp6+rvVHq/c9rLe3+4usutjvKSwNXyNT4BCC8DT+5qkuXNAHaShG+s7YIr143zhNpokx28aP5iPZTkFrDI/JtLQzm1ZfYQsVywrNhfZ9Yc0JoUJfICJKju73nmrKCsVavRDfIeAFrW5SkLfge/5TOdeXRxhg09VVJ64UJPWereim8ZCMZjyAFKTkpoG1QTzdsYRWE76H5K1mSkgkaP2PM24ScPI/otnh5nWiq1LEpN8Em13FDhLsotvSkm6WXb0idZZV3JnEA0C97bC2rVkgYVZrf+MCMV3F61TowBRVus3OKL8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gbaMwdxT9QMAB89pvKBy7bGXAywAvhXdlUP+CW3JU4=;
 b=huv9DsN1PN2DXCCoKI9nB/uNCv5kT10XUJOghl5vHBgdHhtqR5LCVZpD74jOT7wuko9UCz1P+6vt02IwevYw3U2WX965rd6gi8rJgJGpPyUNpBeuE6BD6o2s0oVoOTC5hm95uQ/lTA9yfTgNRFXP+UnayGHHIV7Rn+F+NHeXZyGuDDWSHlw76CaQBkKr0cYnJQRK6fZOAOTf2+bWiYgKf2nlWv8VjFABUmaHcM1QRZYVTCpxZ4oxfvXcYYkeRn+mp2oglAqqvciWCS0nyOW5J0PH8sjdjEYkX69mAfS3NaSjEDwbeVvxEOJVByVsNUD82dWKnAYDlYtX2f8tNMTG5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by IA0PR11MB7814.namprd11.prod.outlook.com (2603:10b6:208:408::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.24; Mon, 1 Jan
 2024 07:50:12 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::c56:aece:e7ef:6cb3]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::c56:aece:e7ef:6cb3%3]) with mapi id 15.20.7135.023; Mon, 1 Jan 2024
 07:50:12 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 4/5] libldb: upgrade 2.7.2 -> 2.8.0
Date: Mon,  1 Jan 2024 15:49:57 +0800
Message-Id: <20240101074958.2782143-4-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240101074958.2782143-1-yi.zhao@windriver.com>
References: <20240101074958.2782143-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0368.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::19) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|IA0PR11MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: 932375bd-cbf2-46cc-85ef-08dc0a9e48d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LEiTuGGpqdgvtzEEnC3ZNKPAGHGUsxZU+FStBn863pCPcoL7PMupLEieU/xtxV6syKnXUQqEy1mkd/QTr7P9aWjLXQOQ5vjrQKg4b94SVKYy4xXuVc2aJCfXynGEcciUaEyE81yPvglWksOalvouKPQr7ntWUN84CjRjlmiuRBHqnRuQRdf4YTqwdA57AM1udaYwu3YGxOALycImeTJf5qwHfLfMmP2vl13RRZ+5a6FflJs1vug/HBzV5F/oYV5GcK2lu9jCVBPTJwg29vDekI5NtoQREUCgsGz3sZxhxaF413f0R49pu2Wfrlnz/qD3bO0lPkD1p/HCfMfXSKunJ8ONgeOqaPq7yx/SlqUS++rmpuGBcKGHyWCpgECQ5XnxpkZvAk3+22XwL805DIsWpQme0PyxcDl97oelpwvFdYORY2jTawbfrc25qE0RkN+DIsQUgbeGJS/YIGtR+SgpyKnR7p7OuDhYg45tDfHvuizxAPHk5tL5300c+oW9dbiuSxpuAqnWJlKPikcZH4mPjSiTFFocLRQ/5AZxhZf/2FC9cZAvimhOVGFSxHK+E+oLjYs2wGTJyW5pqqT+/vAT/ynKzvi+QU1igQzzvtqpWGLQ8cGjtRes4n7FH3msUXff
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(136003)(39840400004)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(1076003)(26005)(83380400001)(2616005)(6666004)(6506007)(6512007)(53546011)(30864003)(5660300002)(44832011)(41300700001)(2906002)(478600001)(6486002)(316002)(8676002)(8936002)(66946007)(6916009)(66476007)(66556008)(86362001)(36756003)(38100700002)(38350700005)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T8UrYibGTa+/9xOVKcVsDrV1za1l+Wfs3a6ZINOrG/f5ySm8R/o/Ix1FbcvX?=
 =?us-ascii?Q?H4aeLFjBgYnR8jySa6ZJGHBLkePvxto4ASBywYPkykdaYmap1R5GUOuHfxPY?=
 =?us-ascii?Q?/ioNUq4bAzkff2vXy4YztGnggH9W3gj/QmcExqpuvZThLbmzu191oaPoxMdR?=
 =?us-ascii?Q?K1SSXIVNOHjhAJZ0BuyNlZrIoehn2pf5xSKH9TXib7ngHiyA23RSkGD7wWWV?=
 =?us-ascii?Q?82xZ74cD5r1V7a5/cOUGF50ne+Yl6mysMCR18q7gWqNqbgDJ6nxjJ2sigzTc?=
 =?us-ascii?Q?yTOiou3OF0EbmOMMNDqtcq1C3dtH1M+gky2LwE9uOuZPNTuhktdbFpyynaxl?=
 =?us-ascii?Q?IQTgMrsvTDOtL+sVlij4i+2MGtsOMGC/4MNoWSK7LLPM43kkQKqsitfPAfyP?=
 =?us-ascii?Q?uGmCKe+kTuyv8/fUHllaU90aV/YK/cDWVI+Mpuq/WSUKdm7gkAr5DOeAdOJ0?=
 =?us-ascii?Q?TIuwmpr7xPj3D6kQbsQ2cwhmMhWrSMiTeNj6Q/eGqjdfqbSuQ/oTq2A6M0qv?=
 =?us-ascii?Q?dKydiM2Yee+fTcYumo7uTMmQbmILgYSBVYbwjtXzEFVihlrHawLCsz/U0Gj5?=
 =?us-ascii?Q?vtYGdGpa/9RvmDuYkMWzgoqbpIyzWDpn80LekPNMBR1eUf3BHWQHeWZq/cBA?=
 =?us-ascii?Q?YibRgi66inCbK4zuqpsa8ib6MrJ9jUMBNBQjkUNoIzBpaZ+NN1GpSKbdSBV8?=
 =?us-ascii?Q?1rCc/Y8701rzvJIwiU2aZBCNVnHADSqQHOtj4vQ+Z9zWAekMb0A49pSzsRtd?=
 =?us-ascii?Q?tC3tgzaIvIRtOELReZcGspkTjmDmsP4ADq66Y+tXvnroScm+Yov2Zow374Ac?=
 =?us-ascii?Q?4Ox7o+Z9KB2oAIsi/wdS3XG1IciMxNQHWVR7YZ+EMEy9e8OjPv9oh0b/Hq/+?=
 =?us-ascii?Q?MrOkZCmfxENsvY3tt9jun84SzENKFxPFzTkgFMA3v51Ad49fn5F8iMqXVPg6?=
 =?us-ascii?Q?hQgFo1zV5qDT/25MuBvwitpGzLGVKK4NsafVZkrS1C/kEuWFsBeQ9574dIFE?=
 =?us-ascii?Q?8OIpBHxMzbTmQZJxvAuieFjJgZEAzKLTZWtKC2myrxh0SnYzHWhe7PeJWz1L?=
 =?us-ascii?Q?j48PEEfPvP2MtKxNE2t+R63nrJxj5CB5atGP+MaZTTPuWW9G6JG5nCqt1vsu?=
 =?us-ascii?Q?Aep1MPQmQCfJFJ09Si1LYLOTraE3VdnB0P8GvMR6FLcKmnLj2Cr0hp9S9rar?=
 =?us-ascii?Q?4ac8ROHn32faIVSc5LlcCWFKxyKghu+VBIY2k8hhPiXUM7Ksg4OY+LqOMTPs?=
 =?us-ascii?Q?v6laDk2QtJfcsqLDfkvbHshp7a5qVaydS8eE6kQfgG/8jfAA0jMIc2PfKNnx?=
 =?us-ascii?Q?aOV89FBl/LdBM9azXZVxiVRmrqPNMUD7UPDMLgeoYEU0QEpPrMVLmY3OFt59?=
 =?us-ascii?Q?droZxr1sYkmIz8qbcFBTBzSxBLhnP8KVAHJCEGHiinKWeA5LfLBErat6x2FH?=
 =?us-ascii?Q?IXwG8jP3S9x4Xc3baYvv+loNZWb4yuN7GgtjKkPNpMlK3PK9hQViBboJ6tQs?=
 =?us-ascii?Q?zGor7TBDp3RRCpHBi9oezoc6YW5Q1Eoh1PMVdv9909+F7yLJ66To/aIjRjHW?=
 =?us-ascii?Q?5VMfoY/beMUJvmjH6A2O9eLghFSRMDSIXQ/RuEY4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 932375bd-cbf2-46cc-85ef-08dc0a9e48d5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2024 07:50:12.4809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ja4HNk0UaXkfujuo/ciZ+lTltLrin6oIVvRoVn+hTT0yw5PzUkGJXcQRMxyuSvbXHy25lUVc7gF/SaSLX5OGmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7814
X-Proofpoint-GUID: fO7lpTdUuC1yZhD3vhuuNAfSvtcwxa_n
X-Proofpoint-ORIG-GUID: fO7lpTdUuC1yZhD3vhuuNAfSvtcwxa_n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401010063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jan 2024 07:50:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107981

* Remove PACKAGECONFIG[libaio] as libaio is no longer required by
  libldb.
* Refresh patches.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...rt-target-module-while-cross-compile.patch |  6 +--
 ...b-Add-configure-options-for-packages.patch | 40 ++++++++-----------
 ...-pyext_PATTERN-for-cross-compilation.patch |  6 +--
 .../libldb/avoid-openldap-unless-wanted.patch |  4 +-
 .../{libldb_2.7.2.bb => libldb_2.8.0.bb}      |  7 ++--
 5 files changed, 27 insertions(+), 36 deletions(-)
 rename meta-networking/recipes-support/libldb/{libldb_2.7.2.bb => libldb_2.8.0.bb} (91%)

diff --git a/meta-networking/recipes-support/libldb/libldb/0001-do-not-import-target-module-while-cross-compile.patch b/meta-networking/recipes-support/libldb/libldb/0001-do-not-import-target-module-while-cross-compile.patch
index e21524237..09c84b440 100644
--- a/meta-networking/recipes-support/libldb/libldb/0001-do-not-import-target-module-while-cross-compile.patch
+++ b/meta-networking/recipes-support/libldb/libldb/0001-do-not-import-target-module-while-cross-compile.patch
@@ -1,4 +1,4 @@
-From 69c409195ede704ed7e9298ed4942cc70a52e099 Mon Sep 17 00:00:00 2001
+From 6a2f229e74804f70f4419b2a1e6843aab059e098 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Tue, 25 Jun 2019 14:25:08 +0800
 Subject: [PATCH] do not import target module while cross compile
@@ -19,7 +19,7 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 19 insertions(+), 8 deletions(-)
 
 diff --git a/buildtools/wafsamba/samba_bundled.py b/buildtools/wafsamba/samba_bundled.py
-index 7d2d855..01dcb56 100644
+index 2300565..26d9e8c 100644
 --- a/buildtools/wafsamba/samba_bundled.py
 +++ b/buildtools/wafsamba/samba_bundled.py
 @@ -4,6 +4,7 @@ import sys
@@ -30,7 +30,7 @@ index 7d2d855..01dcb56 100644
  
  def PRIVATE_NAME(bld, name):
      '''possibly rename a library to include a bundled extension'''
-@@ -241,17 +242,27 @@ def CHECK_BUNDLED_SYSTEM_PYTHON(conf, libname, modulename, minversion='0.0.0'):
+@@ -245,17 +246,27 @@ def CHECK_BUNDLED_SYSTEM_PYTHON(conf, libname, modulename, minversion='0.0.0'):
      # versions
      minversion = minimum_library_version(conf, libname, minversion)
  
diff --git a/meta-networking/recipes-support/libldb/libldb/0002-ldb-Add-configure-options-for-packages.patch b/meta-networking/recipes-support/libldb/libldb/0002-ldb-Add-configure-options-for-packages.patch
index 4b74a877b..15e093fd6 100644
--- a/meta-networking/recipes-support/libldb/libldb/0002-ldb-Add-configure-options-for-packages.patch
+++ b/meta-networking/recipes-support/libldb/libldb/0002-ldb-Add-configure-options-for-packages.patch
@@ -1,4 +1,4 @@
-From acd3985f9c428882f1b731a6f9ce5cb1a4a3a02c Mon Sep 17 00:00:00 2001
+From e949da7cb100c571631cd9bc7532e528c1f74820 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 1 Jul 2019 16:14:16 +0800
 Subject: [PATCH] ldb: Add configure options for packages
@@ -6,7 +6,6 @@ Subject: [PATCH] ldb: Add configure options for packages
 Add configure options for the following packages:
  - acl
  - attr
- - libaio
  - libbsd
  - libcap
  - valgrind
@@ -19,17 +18,20 @@ upgrade to version 1.5.4
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 
 Rebase to 2.3.0
+
+Rebase to 2.8.0
+Remove libaio option
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
- lib/replace/wscript | 90 +++++++++++++++++++++++++++++++++++----------
- wscript             |  8 ++++
- 2 files changed, 78 insertions(+), 20 deletions(-)
+ lib/replace/wscript | 80 +++++++++++++++++++++++++++++++++------------
+ wscript             |  8 +++++
+ 2 files changed, 68 insertions(+), 20 deletions(-)
 
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index 5c2b750..a38baae 100644
+index 37d7759..d0d6bb0 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
-@@ -25,6 +25,41 @@ def options(opt):
+@@ -25,6 +25,34 @@ def options(opt):
      opt.PRIVATE_EXTENSION_DEFAULT('')
      opt.RECURSE('buildtools/wafsamba')
  
@@ -47,13 +49,6 @@ index 5c2b750..a38baae 100644
 +                   help=("Disable use of attr"),
 +                   action="store_false", dest='enable_attr', default=False)
 +
-+    opt.add_option('--with-libaio',
-+                   help=("Enable use of libaio"),
-+                   action="store_true", dest='enable_libaio')
-+    opt.add_option('--without-libaio',
-+                   help=("Disable use of libaio"),
-+                   action="store_false", dest='enable_libaio', default=False)
-+
 +    opt.add_option('--with-libbsd',
 +                   help=("Enable use of libbsd"),
 +                   action="store_true", dest='enable_libbsd')
@@ -71,7 +66,7 @@ index 5c2b750..a38baae 100644
  @Utils.run_once
  def configure(conf):
      conf.RECURSE('buildtools/wafsamba')
-@@ -38,12 +73,25 @@ def configure(conf):
+@@ -38,12 +66,22 @@ def configure(conf):
      conf.DEFINE('HAVE_LIBREPLACE', 1)
      conf.DEFINE('LIBREPLACE_NETWORK_CHECKS', 1)
  
@@ -92,28 +87,25 @@ index 5c2b750..a38baae 100644
 +    if Options.options.enable_attr:
 +        conf.CHECK_HEADERS('attr/attributes.h attr/xattr.h')
 +
-+    if Options.options.enable_libaio:
-+        conf.CHECK_HEADERS('libaio.h')
-+
 +    if Options.options.enable_libcap:
 +        conf.CHECK_HEADERS('sys/capability.h')
 +
      conf.CHECK_HEADERS('sys/fcntl.h sys/filio.h sys/filsys.h sys/fs/s5param.h')
      conf.CHECK_HEADERS('sys/id.h sys/ioctl.h sys/ipc.h sys/mman.h sys/mode.h sys/ndir.h sys/priv.h')
      conf.CHECK_HEADERS('sys/resource.h sys/security.h sys/shm.h sys/statfs.h sys/statvfs.h sys/termio.h')
-@@ -113,8 +161,9 @@ def configure(conf):
+@@ -113,8 +151,9 @@ def configure(conf):
      conf.CHECK_HEADERS('sys/fileio.h sys/filesys.h sys/dustat.h sys/sysmacros.h')
      conf.CHECK_HEADERS('xfs/libxfs.h netgroup.h')
  
 -    conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h')
--    conf.CHECK_HEADERS('valgrind/memcheck.h valgrind/helgrind.h')
+-    conf.CHECK_HEADERS('valgrind/memcheck.h valgrind/helgrind.h valgrind/callgrind.h')
 +    if Options.options.enable_valgrind:
 +        conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h')
-+        conf.CHECK_HEADERS('valgrind/memcheck.h valgrind/helgrind.h')
++        conf.CHECK_HEADERS('valgrind/memcheck.h valgrind/helgrind.h valgrind/callgrind.h')
      conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
      conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
      conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
-@@ -436,20 +485,21 @@ def configure(conf):
+@@ -443,20 +482,21 @@ def configure(conf):
  
      strlcpy_in_bsd = False
  
@@ -131,7 +123,7 @@ index 5c2b750..a38baae 100644
 -
 -    if not conf.CHECK_FUNCS('closefrom'):
 -        conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
-+    if Options.options.enable_libbsd: 
++    if Options.options.enable_libbsd:
 +        # libbsd on some platforms provides strlcpy and strlcat
 +        if not conf.CHECK_FUNCS('strlcpy strlcat'):
 +            if conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
@@ -150,7 +142,7 @@ index 5c2b750..a38baae 100644
      conf.CHECK_CODE('''
                  struct ucred cred;
 diff --git a/wscript b/wscript
-index 03076e6..5365408 100644
+index ed5d45f..6bb0b37 100644
 --- a/wscript
 +++ b/wscript
 @@ -40,6 +40,14 @@ def options(opt):
diff --git a/meta-networking/recipes-support/libldb/libldb/0003-Fix-pyext_PATTERN-for-cross-compilation.patch b/meta-networking/recipes-support/libldb/libldb/0003-Fix-pyext_PATTERN-for-cross-compilation.patch
index acd521e69..71934795b 100644
--- a/meta-networking/recipes-support/libldb/libldb/0003-Fix-pyext_PATTERN-for-cross-compilation.patch
+++ b/meta-networking/recipes-support/libldb/libldb/0003-Fix-pyext_PATTERN-for-cross-compilation.patch
@@ -1,4 +1,4 @@
-From d9f4d5bbd3e58ca7fd7cbc4ab7656fe27bf4c346 Mon Sep 17 00:00:00 2001
+From 989addc0ca7be8233b413d42704c5dc900e85d81 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Wed, 24 Nov 2021 13:33:35 +0800
 Subject: [PATCH] Fix pyext_PATTERN for cross compilation
@@ -42,10 +42,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/third_party/waf/waflib/Tools/python.py b/third_party/waf/waflib/Tools/python.py
-index a23bd01..af202e0 100644
+index b2dd1a9..2bd3545 100644
 --- a/third_party/waf/waflib/Tools/python.py
 +++ b/third_party/waf/waflib/Tools/python.py
-@@ -328,7 +328,7 @@ def check_python_headers(conf, features='pyembed pyext'):
+@@ -339,7 +339,7 @@ def check_python_headers(conf, features='pyembed pyext'):
  	x = 'MACOSX_DEPLOYMENT_TARGET'
  	if dct[x]:
  		env[x] = conf.environ[x] = str(dct[x])
diff --git a/meta-networking/recipes-support/libldb/libldb/avoid-openldap-unless-wanted.patch b/meta-networking/recipes-support/libldb/libldb/avoid-openldap-unless-wanted.patch
index 87909c952..7e60b5305 100644
--- a/meta-networking/recipes-support/libldb/libldb/avoid-openldap-unless-wanted.patch
+++ b/meta-networking/recipes-support/libldb/libldb/avoid-openldap-unless-wanted.patch
@@ -1,4 +1,4 @@
-From cc86b8bdd45ca30bdf65a3b8b0960b27aeb34522 Mon Sep 17 00:00:00 2001
+From 226b75a0e9654fb3c0435256af5fed0178dc0d69 Mon Sep 17 00:00:00 2001
 From: Jens Rehsack <rehsack@gmail.com>
 Date: Thu, 19 Nov 2015 20:45:56 +0100
 Subject: [PATCH] avoid openldap unless wanted
@@ -12,7 +12,7 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 3 deletions(-)
 
 diff --git a/wscript b/wscript
-index 7f14847..092da2d 100644
+index 6bb0b37..8ee25b1 100644
 --- a/wscript
 +++ b/wscript
 @@ -154,9 +154,7 @@ def configure(conf):
diff --git a/meta-networking/recipes-support/libldb/libldb_2.7.2.bb b/meta-networking/recipes-support/libldb/libldb_2.8.0.bb
similarity index 91%
rename from meta-networking/recipes-support/libldb/libldb_2.7.2.bb
rename to meta-networking/recipes-support/libldb/libldb_2.8.0.bb
index c4b7602bf..ec56eb020 100644
--- a/meta-networking/recipes-support/libldb/libldb_2.7.2.bb
+++ b/meta-networking/recipes-support/libldb/libldb_2.8.0.bb
@@ -22,7 +22,6 @@ PACKAGECONFIG ??= "\
 PACKAGECONFIG[acl] = "--with-acl,--without-acl,acl"
 PACKAGECONFIG[attr] = "--with-attr,--without-attr,attr"
 PACKAGECONFIG[ldap] = ",,openldap"
-PACKAGECONFIG[libaio] = "--with-libaio,--without-libaio,libaio"
 PACKAGECONFIG[libbsd] = "--with-libbsd,--without-libbsd,libbsd"
 PACKAGECONFIG[libcap] = "--with-libcap,--without-libcap,libcap"
 PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind"
@@ -34,14 +33,14 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
                     file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
                     file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
 
-SRC_URI[sha256sum] = "26ee72d647854e662d99643eb2b2d341655abf31f4990838d6650fb5cf9209c8"
+SRC_URI[sha256sum] = "358dca10fcd27207ac857a0d7f435a46dbc6cd1f7c10dbb840c1931bf1965f08"
 
 inherit pkgconfig waf-samba ptest
 
 S = "${WORKDIR}/ldb-${PV}"
 
-#cross_compile cannot use preforked process, since fork process earlier than point subproces.popen
-#to cross Popen
+# Cross_compile cannot use preforked process, since fork process earlier than point subproces.popen
+# to cross Popen
 export WAF_NO_PREFORK="yes"
 
 EXTRA_OECONF += "--disable-rpath \
-- 
2.25.1


