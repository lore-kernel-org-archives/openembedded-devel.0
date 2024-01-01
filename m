Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ECECC4707C
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 07:50:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1265.1704095415669548112
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Dec 2023 23:50:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oEle9qdV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=17302f783c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4017naQc013571
	for <openembedded-devel@lists.openembedded.org>; Mon, 1 Jan 2024 07:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=6C45CoPy5yjsRrF7A6M9tJ23vuo8/mj4Hhfzsgqwf94=; b=
	oEle9qdVWjMMgf4Q4zPZj/JJpfP/YPOGszYEiRjqwuWy5VEq3x1QtOwrWXG6cqaE
	IZGSr3+ujqGOx9a9FR95QFCR0sNUFnz/B4Gmh8YTqzCgEC3+sOg4B4FqLkeuWduf
	xnzR9GAj/EvLY0W070qa7dOqs7/OQEAmYTDx+wNh/vZMUuZLXoy6U9RydthusYoG
	E0p1Cfc139ZZHvLoBLP16l3Fwq2wjOSQmYMyjBm3LtHOAcXxdXgTrqoBZ9yMjlSd
	2ws8qIrfDVI2hLCmo5izz40HOpIqBy1vGXFmYER539DF+qR1SYFv1pBRYGZHPQXG
	cJubClI33J9fuvF85VY+9w==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vaa661pjx-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jan 2024 07:50:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F1ulUEK6n8ONfoS709eb+pXcBo4BgbW4RKDotm2e9rxG9eJ5zIchDwYXB4qeoVAFcTxJzsoB9Ngt18KzxbZlfd/VITzjV+VIV9pzk7pIZyIgWyfv4GyVwWqSZynrBDD+4BwLLkMT/d+mFhrIBDTIKWeBPr+jx8tuivHLhFgQJuaggQ49xt3MSkqlLHLsHWCgsm445FnAgJz49919JoJP+WK1gJn+s85imX2g1lgIt15/ZDg5XmmXu5IIWAPQypFDlPlzbBSNDMxXeRu8gfxNJxI1uhCc9Cau1gYa84Y8q0qsi6k8tUm3t9V9Da+cxQISbZzTrzOfi1MybAt20JXTlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6C45CoPy5yjsRrF7A6M9tJ23vuo8/mj4Hhfzsgqwf94=;
 b=Sd6G1JRnzhh+3YpYSKaAzlonFEtbrNo4BLe1C6+fXxH/C5O00RaTNsOzavJYIFiJrWffxn4Yp05LLE1q5ggf5x12g3dgBON60RCEZ8twSyMm/czEvQXLGB7hmQsA/UxQsYPjjNtMZzXbt/qD4Oshn1VcavI1FMMBdYiRsvtnvVtp6YGrofsxujD6sRbSdVB+yYNhpvOwgiVxKB5EbVpOazjnwHWnml3VleIXYF/5mKbxEotm53UlHEv+PFdNGpa6FfDzQyRnO3XTkh5W6+aFY6Sw9nAfF42KLVw+k4AnZ4A8kJFJxQE+j3I8oYWY03gOQmHqFWnE8qZBuGUVJG+bCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by IA0PR11MB7814.namprd11.prod.outlook.com (2603:10b6:208:408::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.24; Mon, 1 Jan
 2024 07:50:11 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::c56:aece:e7ef:6cb3]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::c56:aece:e7ef:6cb3%3]) with mapi id 15.20.7135.023; Mon, 1 Jan 2024
 07:50:11 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 3/5] libtevent: upgrade 0.14.1 -> 0.16.0
Date: Mon,  1 Jan 2024 15:49:56 +0800
Message-Id: <20240101074958.2782143-3-yi.zhao@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 09616e7b-b5d1-4ec3-dbdc-08dc0a9e4829
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	B+/mayGp6ZqFTzAXGeBFi/FQ0/9k/cCkLX/D7SFq8D51IE68MfQ3sZ/DKVv8EDTih5MvpKKUlbpB9gAcBp+53cd3OlA8z8SrS225m+LOWzpSlscavcQXu4AMhlPlqPjQROrS+yA5Y7huGt95TsQwgAKrfJSZpKAxm1+FmKulc6pxv85ogIY9PQ+h2JedRXDnO3TOEzCVoe9HBZ+OIDgP8EynXl+mJQfNDAOaSnmA7bP8Bs9J9T0QxdLvvejuPpz8iHvogSEhtjEqrOF1D/LaaOS3tLxGShakEghmg/gQmrq90MnjpT+A4tw4UCzC6eye9urkfKeKx975jUBkaXm6gQ/DYFKY182eT2kMIktCWpEjVxSXtoL5XbE88nFu+DrQTtiA8t8cJhNFth36aBqiTUCZVqN1+x4heMCE5+LBAhPuqhOc3tDvc6k0oY2jcXvRL3Z70A+GdWHwMQ5rljc5YAnzLaNZhMkRu8p302D/DEVmYhRXiOLIm6NisUhWsbJ9anrSZg78ETsF55SDC7ewCWkNolGwcy3oC83ap+VuABGqD7gLR0/qNmeDxmTYZq+XYdH38Mx+84IQcXMe1T8xUIfVARaokVsgDHOrI2pSFC8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(136003)(39840400004)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(1076003)(26005)(83380400001)(2616005)(6666004)(6506007)(6512007)(53546011)(30864003)(5660300002)(44832011)(41300700001)(2906002)(478600001)(6486002)(316002)(8676002)(8936002)(66946007)(6916009)(66476007)(66556008)(86362001)(36756003)(38100700002)(38350700005)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gf0gpcvnqn3mjvWzbsQXpY3mc7fZp7eyhHG9gdGo+t5IKHw3I4CCmNVuJF4Z?=
 =?us-ascii?Q?ulAYVDC5goxyWH2npB8ZgRGUuOVGEiYRqfvka2XjhporBiQjMUFan8kPMi36?=
 =?us-ascii?Q?Mkdt/gHCNTCVLmGsoqb9OvV3wOrmLOY1YWconge5CPOtEeJjuNFJfED8m9Mk?=
 =?us-ascii?Q?dCikct6ZjlIQtdJw++Y81bQfdOf3XI3xBAMSuG0CnhCdsNrnm3cjQT6hFFpe?=
 =?us-ascii?Q?cii6myY4SV3VPUtFE0aDmIPhy+Yq3ygNIgLvqZoHzF/mqg4DttFu1Da9rYBF?=
 =?us-ascii?Q?WFGdUDS4dLSvvm55wTfnLMYBIiX868rBk9yebZwDKLiL6FjUISqfqdxXQ+Eb?=
 =?us-ascii?Q?JN09poADg2UC1ZtRxR2f2lV5jxg2hWTTN3st5EkxkKB11I/oM9klAwHzKZn2?=
 =?us-ascii?Q?7616cQ2e+gMg+IEfwk1sSn03uwmfWOxbnXztV1k71UrXcET2XFYqJXKk0B/e?=
 =?us-ascii?Q?RPXPZ6NTXuGpDnHVIeAQW5h34WFDqDpjCl3L7cqIlchm/WHCt/+hEfOycY2p?=
 =?us-ascii?Q?nQQnF5hAcWw/2HiiUOl2zwFLcZl0Xoy2YMhVUs4RBUbMFFM8Imx8hlRaiW6U?=
 =?us-ascii?Q?vsgI69LIy9udpjCKkve+FHeRb1mXxiO01xUi2kTyRswZRVV4MsW32sqL+Idg?=
 =?us-ascii?Q?npHRge87CpynWDPGlvWEHjHnCnTtsrlkIxuKLNVl5IQCpTCXgYPr2jtMg48t?=
 =?us-ascii?Q?ENhxl1deE6WBEZYFaeCGk0zSIRC0IHllX4FxPBizybU7y5y2uGxBTKKmw/Wh?=
 =?us-ascii?Q?4GkGmzvnf0yvVK171403B5ZyG6hIMJXRja1aggDBl1GZhElaFdCvTJqRgOv4?=
 =?us-ascii?Q?7BsuwQ4vmpP44bp+1OMTGaNurCgZq2TIZdYpu0rguAfMkgeunJvmvISR+Snw?=
 =?us-ascii?Q?lMjSS29eg3Ey/cKEOvHJdv1EmdA3hznXW5//wGWbu+5wP+MinBKK+UJxHZZN?=
 =?us-ascii?Q?30M6kkT4dnJ7J95MCwZ9/ncNjUsDks/kQB+Xrml8ix7v6/OaFw3122gqG9tM?=
 =?us-ascii?Q?yuePqyBF/YbDkbPD+tulEDgt6xTyhIUzjrwfElmObRhqZzDPrSydpvIf/5qj?=
 =?us-ascii?Q?QZ5dmKGgJqm8o5Xupl5vBUmRGY3ndmTHSulzOu8VM7Zay4Dgosazc3auRHwV?=
 =?us-ascii?Q?ouh3wtvpXyeShYcFCm7cy/6OrO1VXRw+cb7GLyVjdX4dm7BeNhXxo041FqlP?=
 =?us-ascii?Q?Y1qigACUaWvK/PgM/PB7AyPFYl/Mumi2PBsgqT3/yRBtsOkxgA4ilZjO3deU?=
 =?us-ascii?Q?WoxjhsBBFemepV29F54PsHNY4qj42ZjLU2Nvy6oWwbV+LkeouQMyM1OIcYO6?=
 =?us-ascii?Q?3dryvveyvFqE0eUQIMAm+SrVIQREZwrqd9yGCKQdiRYhVW01CkZ/TMqJgbZd?=
 =?us-ascii?Q?8r4kQgksRrUI3kkNbqM+9+BuJ/bP6hoV6+k+9LIgtkHUIFJg4v/B5QgxfoWH?=
 =?us-ascii?Q?z0rPA7zxvkdh379fNXElNSsnGY347b+WPK9DJbNMAcPPtr7JslT/KJoeb/1O?=
 =?us-ascii?Q?qBP92pZTP5zZn6uBqH/laguVf1wSMlAmgpOU6nMjoXSvTBcRwGJGbP1EoeII?=
 =?us-ascii?Q?muCeQVu+LMCdZjonvNMOKKFCI33zE6WFvqcNo4B+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09616e7b-b5d1-4ec3-dbdc-08dc0a9e4829
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2024 07:50:11.3377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eX4QvfTxG1fgGwFBMxN/yXGAKxfvzCmWDaRS4idF/WBweB/8vGXD1RDOj/5Cep31FeYdhgy3YFH+vM8fe3tiZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7814
X-Proofpoint-GUID: w0agZghiSruiuF90nPTvVgZ0n0eszzYo
X-Proofpoint-ORIG-GUID: w0agZghiSruiuF90nPTvVgZ0n0eszzYo
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107980

* Remove PACKAGECONFIG[libaio] as libaio is no longer required by
  libtevent.
* Refresh patches.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...1-Add-configure-options-for-packages.patch | 70 ++++++++++++-------
 ...-pyext_PATTERN-for-cross-compilation.patch |  6 +-
 .../libtevent/avoid-attr-unless-wanted.patch  | 11 ++-
 ...ibtevent_0.14.1.bb => libtevent_0.16.0.bb} |  7 +-
 4 files changed, 55 insertions(+), 39 deletions(-)
 rename meta-networking/recipes-support/libtevent/{libtevent_0.14.1.bb => libtevent_0.16.0.bb} (87%)

diff --git a/meta-networking/recipes-support/libtevent/libtevent/0001-Add-configure-options-for-packages.patch b/meta-networking/recipes-support/libtevent/libtevent/0001-Add-configure-options-for-packages.patch
index cb66adba9..7fdeec61f 100644
--- a/meta-networking/recipes-support/libtevent/libtevent/0001-Add-configure-options-for-packages.patch
+++ b/meta-networking/recipes-support/libtevent/libtevent/0001-Add-configure-options-for-packages.patch
@@ -1,4 +1,4 @@
-From d9fd1c52d1646254944bfee37be611e04d4daddb Mon Sep 17 00:00:00 2001
+From c2241d7a1371ece3b89dfdad4861dcf0a152d5d4 Mon Sep 17 00:00:00 2001
 From: Wang Mingyu <wangmy@cn.fujitsu.com>
 Date: Fri, 25 Dec 2020 15:03:17 +0900
 Subject: [PATCH] Add configure options for packages
@@ -6,7 +6,6 @@ Subject: [PATCH] Add configure options for packages
 Add configure options for the following packages:
  - acl
  - attr
- - libaio
  - libbsd
  - libcap
  - valgrind
@@ -24,16 +23,20 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
 
 Update patch to version 0.14.1
 Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+
+Rebase to 0.16.0
+Remove libaio option
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
- lib/replace/wscript | 85 +++++++++++++++++++++++++++++++++++----------
- wscript             |  6 ++++
- 2 files changed, 73 insertions(+), 18 deletions(-)
+ lib/replace/wscript | 100 +++++++++++++++++++++++++++++++-------------
+ wscript             |   6 +++
+ 2 files changed, 77 insertions(+), 29 deletions(-)
 
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index 5c2b750..28835ac 100644
+index 77e655b..452c741 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
-@@ -25,6 +25,41 @@ def options(opt):
+@@ -25,6 +25,34 @@ def options(opt):
      opt.PRIVATE_EXTENSION_DEFAULT('')
      opt.RECURSE('buildtools/wafsamba')
  
@@ -51,13 +54,6 @@ index 5c2b750..28835ac 100644
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
@@ -75,7 +71,7 @@ index 5c2b750..28835ac 100644
  @Utils.run_once
  def configure(conf):
      conf.RECURSE('buildtools/wafsamba')
-@@ -38,12 +73,27 @@ def configure(conf):
+@@ -38,12 +66,24 @@ def configure(conf):
      conf.DEFINE('HAVE_LIBREPLACE', 1)
      conf.DEFINE('LIBREPLACE_NETWORK_CHECKS', 1)
  
@@ -96,28 +92,25 @@ index 5c2b750..28835ac 100644
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
-@@ -113,8 +163,9 @@ def configure(conf):
+@@ -113,8 +153,9 @@ def configure(conf):
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
-@@ -436,20 +487,18 @@ def configure(conf):
+@@ -443,31 +484,32 @@ def configure(conf):
  
      strlcpy_in_bsd = False
  
@@ -126,6 +119,17 @@ index 5c2b750..28835ac 100644
 -        if conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
 -                               checklibc=True):
 -            strlcpy_in_bsd = True
+-    elif conf.env.enable_fuzzing:
+-        # Just to complicate it more, some versions of Honggfuzz have
+-        # got strlcpy and strlcat in libc, but not in <string.h>
+-        # (unless it is there coincidentally, on a BSD). Therefore we
+-        # can't use CHECK_FUNCS alone to decide whether to add the
+-        # headers to replace.h.
+-        #
+-        # As this is only known to happen on a fuzzing compiler, we'll
+-        # skip the check when not in fuzzing mode.
+-        conf.CHECK_HEADERS('bsd/string.h')
+-
 -    if not conf.CHECK_FUNCS('getpeereid'):
 -        conf.CHECK_FUNCS_IN('getpeereid', 'bsd', headers='sys/types.h bsd/unistd.h')
 -    if not conf.CHECK_FUNCS_IN('setproctitle', 'setproctitle', headers='setproctitle.h'):
@@ -138,12 +142,26 @@ index 5c2b750..28835ac 100644
 +    if Options.options.enable_libbsd:
 +        # libbsd on some platforms provides strlcpy and strlcat
 +        if not conf.CHECK_FUNCS('strlcpy strlcat'):
-+            conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
-+                    checklibc=True)
++            if conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
++                                checklibc=True):
++                strlcpy_in_bsd = True
++        elif conf.env.enable_fuzzing:
++            # Just to complicate it more, some versions of Honggfuzz have
++            # got strlcpy and strlcat in libc, but not in <string.h>
++            # (unless it is there coincidentally, on a BSD). Therefore we
++            # can't use CHECK_FUNCS alone to decide whether to add the
++            # headers to replace.h.
++            #
++            # As this is only known to happen on a fuzzing compiler, we'll
++            # skip the check when not in fuzzing mode.
++            conf.CHECK_HEADERS('bsd/string.h')
++
 +        if not conf.CHECK_FUNCS('getpeereid'):
 +            conf.CHECK_FUNCS_IN('getpeereid', 'bsd', headers='sys/types.h bsd/unistd.h')
 +        if not conf.CHECK_FUNCS_IN('setproctitle', 'setproctitle', headers='setproctitle.h'):
 +            conf.CHECK_FUNCS_IN('setproctitle', 'bsd', headers='sys/types.h bsd/unistd.h')
++        if not conf.CHECK_FUNCS('setproctitle_init'):
++            conf.CHECK_FUNCS_IN('setproctitle_init', 'bsd', headers='sys/types.h bsd/unistd.h')
 +
 +        if not conf.CHECK_FUNCS('closefrom'):
 +            conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
@@ -151,7 +169,7 @@ index 5c2b750..28835ac 100644
      conf.CHECK_CODE('''
                  struct ucred cred;
 diff --git a/wscript b/wscript
-index 0f6e92f..5a54f3a 100644
+index d912a8a..484a6fa 100644
 --- a/wscript
 +++ b/wscript
 @@ -28,6 +28,12 @@ def options(opt):
@@ -168,5 +186,5 @@ index 0f6e92f..5a54f3a 100644
  def configure(conf):
      conf.RECURSE('lib/replace')
 -- 
-2.34.1
+2.25.1
 
diff --git a/meta-networking/recipes-support/libtevent/libtevent/0002-Fix-pyext_PATTERN-for-cross-compilation.patch b/meta-networking/recipes-support/libtevent/libtevent/0002-Fix-pyext_PATTERN-for-cross-compilation.patch
index ba3f4ca7a..f1b8f8e9b 100644
--- a/meta-networking/recipes-support/libtevent/libtevent/0002-Fix-pyext_PATTERN-for-cross-compilation.patch
+++ b/meta-networking/recipes-support/libtevent/libtevent/0002-Fix-pyext_PATTERN-for-cross-compilation.patch
@@ -1,4 +1,4 @@
-From da1dc659fd351ff6283f843eeba5e0b3f7b2d584 Mon Sep 17 00:00:00 2001
+From 2bb7bf2d945d4ea0dafe3858adc6b8faae18b1e8 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Wed, 24 Nov 2021 13:33:35 +0800
 Subject: [PATCH] Fix pyext_PATTERN for cross compilation
@@ -25,10 +25,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
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
diff --git a/meta-networking/recipes-support/libtevent/libtevent/avoid-attr-unless-wanted.patch b/meta-networking/recipes-support/libtevent/libtevent/avoid-attr-unless-wanted.patch
index e15f14ab7..a8cddcd04 100644
--- a/meta-networking/recipes-support/libtevent/libtevent/avoid-attr-unless-wanted.patch
+++ b/meta-networking/recipes-support/libtevent/libtevent/avoid-attr-unless-wanted.patch
@@ -1,19 +1,18 @@
-From 82dc31b72e77f263574645092ba1597a8f1152e7 Mon Sep 17 00:00:00 2001
+From ace8fed037ec3d03f65f861b4da217faff94015b Mon Sep 17 00:00:00 2001
 From: Wang Mingyu <wangmy@cn.fujitsu.com>
 Date: Fri, 25 Dec 2020 15:10:58 +0900
 Subject: [PATCH] avoid attr unless wanted
 
+Upstream-Status: Inappropriate [embedded specific]
 ---
-Upstream-Status: Pending
-
  lib/replace/wscript | 4 +---
  1 file changed, 1 insertion(+), 3 deletions(-)
 
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index 21a746a..6be3276 100644
+index 452c741..61fcde0 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
-@@ -968,8 +968,6 @@ def build(bld):
+@@ -983,8 +983,6 @@ def build(bld):
      if not bld.CONFIG_SET('HAVE_INET_ATON'):     REPLACE_SOURCE += ' inet_aton.c'
      if not bld.CONFIG_SET('HAVE_INET_NTOP'):     REPLACE_SOURCE += ' inet_ntop.c'
      if not bld.CONFIG_SET('HAVE_INET_PTON'):     REPLACE_SOURCE += ' inet_pton.c'
@@ -22,7 +21,7 @@ index 21a746a..6be3276 100644
  
      if not bld.CONFIG_SET('HAVE_CLOSEFROM'):
          REPLACE_SOURCE += ' closefrom.c'
-@@ -984,7 +982,7 @@ def build(bld):
+@@ -999,7 +997,7 @@ def build(bld):
                        # hide_symbols=bld.BUILTIN_LIBRARY('replace'),
                        private_library=True,
                        provide_builtin_linking=True,
diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.14.1.bb b/meta-networking/recipes-support/libtevent/libtevent_0.16.0.bb
similarity index 87%
rename from meta-networking/recipes-support/libtevent/libtevent_0.14.1.bb
rename to meta-networking/recipes-support/libtevent/libtevent_0.16.0.bb
index 9a2b5ede2..0158f8bc7 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.14.1.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.16.0.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://samba.org/ftp/tevent/tevent-${PV}.tar.gz \
 
 LIC_FILES_CHKSUM = "file://tevent.h;endline=26;md5=47386b7c539bf2706b7ce52dc9341681"
 
-SRC_URI[sha256sum] = "ef85fcaa80ffd2351036ba4b347630fef2a1ac3da964a7f1820466bad03cd00d"
+SRC_URI[sha256sum] = "1aa58f21017ed8c2f606ae84aa7e795b5439edd4dd5f68f1a388a7d6fb40f682"
 
 inherit pkgconfig ptest waf-samba
 
@@ -26,7 +26,6 @@ PACKAGECONFIG ??= "\
 "
 PACKAGECONFIG[acl] = "--with-acl,--without-acl,acl"
 PACKAGECONFIG[attr] = "--with-attr,--without-attr,attr"
-PACKAGECONFIG[libaio] = "--with-libaio,--without-libaio,libaio"
 PACKAGECONFIG[libbsd] = "--with-libbsd,--without-libbsd,libbsd"
 PACKAGECONFIG[libcap] = "--with-libcap,--without-libcap,libcap"
 PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind"
@@ -35,8 +34,8 @@ SRC_URI += "${@bb.utils.contains('PACKAGECONFIG', 'attr', '', 'file://avoid-attr
 
 S = "${WORKDIR}/tevent-${PV}"
 
-#cross_compile cannot use preforked process, since fork process earlier than point subproces.popen
-#to cross Popen
+# Cross_compile cannot use preforked process, since fork process earlier than point subproces.popen
+# to cross Popen
 export WAF_NO_PREFORK="yes"
 
 EXTRA_OECONF += "--disable-rpath \
-- 
2.25.1


