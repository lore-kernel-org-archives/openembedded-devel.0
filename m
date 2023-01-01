Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11156C4167B
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 07:28:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7308.1672558074727580088
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Dec 2022 23:27:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=raTMByQE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03651cea20=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3017PZpt018539
	for <openembedded-devel@lists.openembedded.org>; Sat, 31 Dec 2022 23:27:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=dWu7m+XBE5XYo/cQVYNdVP6QoM//hTzO7prOdmK+X+A=;
 b=raTMByQE3bJkNdvvEPhbl8MmT6ZF6nk8oXuPByCQsKHpuvwWJcTrzl/E7yyaLAuMsA26
 WyKss7qQjzj1EvtKR7Zzs+Zj84DH0Nl6VGloYln8UYuj8PGxNHIlZie3X2sztYsndzec
 t7KHikEPLmis1G8Yuc8nx6HfhLQ7uC/JwS3z9szYyiDu333ikL2xHUAnCiRYALL/FQ74
 uLiCUhII3BnuLwxpkmt2mhaWMf9nu6S7Prch48oaNHoYp+HOWAR4oomZHl+1OOssGFcn
 aoFcDiLMvvwl7/QA+qxiMaiEtzuT6y8AudI1qvq0YNuUJDqHimrufdSNkaf1IPRCgSP+ Jw== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mtnfrrakf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 31 Dec 2022 23:27:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccB3mOhWphx5MN53X5XkimcG+Z4O/5v0lxvlgIgAQd8ybdsY8NEr4Lq/gmSA9qSQzahg2Hp3cYFMO5gNBP8dW+J3I8F98G4Wb3n3qaUH+YvSgkzAxIdBqeKOuzcYdD6LZCDnQtwhE2hknj/ofc094O95izFOINcA34tFjHNNNv/tPYxu7aC0KRj22We5RRkcdJQleohqH5Hl7RsSfm3IIJ4pdvbhsvOoOphfTgRJzdxMCNaCP6oyqNMVwMSaWHHu8abOqEoY8OmsqB4TICGByGrW9dJVHANQMkg66vuNOYT5upqXb4t30f/BtXQ2BD7R4I4m+9L8G/VWrwA8qK1AeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWu7m+XBE5XYo/cQVYNdVP6QoM//hTzO7prOdmK+X+A=;
 b=cvASHMankXcw6OFoIi5bLf5wsu3vpQt4VrEFv9J3urSGkF3f3x8aQUU+iDiwT+yajstCQVolFvzzDUOvZWSOQEZSH414P2fFYAn5SHVxMX/H3KPZBSCB2kOnMfPKBdHYNa0IRVGSlY29HtBcpsV0G0sRjfIl37B6YHCW45fEuCX8SHQ7nwSBqdojAkjub5ezMe2moSivEmm7RrWDajj5IMXUmerGUGMFc0ZMok410p8OVjG09avqY5iZOlEANuSB0QRYZBae5JFBU/+vyWL6d/gGolZLmIPvj55CwR61JHTTuO5m1wO17AoiF4lZo17P/rVajAXhuS+F5+Rr3S5Z8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SN7PR11MB7638.namprd11.prod.outlook.com (2603:10b6:806:34b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.18; Sun, 1 Jan
 2023 07:27:52 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::eb7b:3a04:80bb:4a5f]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::eb7b:3a04:80bb:4a5f%4]) with mapi id 15.20.5944.019; Sun, 1 Jan 2023
 07:27:52 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 4/5] libldb: upgrade 2.3.4 -> 2.6.1
Date: Sun,  1 Jan 2023 15:27:38 +0800
Message-Id: <20230101072739.75462-4-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230101072739.75462-1-yi.zhao@windriver.com>
References: <20230101072739.75462-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0103.namprd05.prod.outlook.com
 (2603:10b6:a03:334::18) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|SN7PR11MB7638:EE_
X-MS-Office365-Filtering-Correlation-Id: f2a5989d-1580-49d3-02ca-08daebc9b13c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	F2uVs/2NJmW0RTgO4r6v3J1cME5LY0spOPIw8hB6ZLBqiSlVL2W55MH57dtklNcmyg50DrQ+hdquEQH8LHgyM4GeE6o0T85Uouq1pa5tsgGSS/9LgrbM255vraEPGdaB4upKTsGHqT95+x+3mP3+V2DvBgurEv1kEoeE6tbDdV+N6GEYrsOM5R9drJOb7tVFW9GD8jK9G8w/8baLksZ+pMrWHIlkp4DZ01IIRqgLz1q//lgs8cPAQPm+nssV6CeTbm+7WgJaxtpn26pPpNSwuQpqmS6j0TpItExN7zFc+j0tCNAWiiYXjdHB5lXL2odt9Z1OdmJjMAUpIKRr+O3ST0C7kus4Euqz91egsrsYA08sSBrH/3BdzPlWvsns7aS3Xb9HNVszJBe6i86qJ225AoW1DlWy/TOtmOxndXScrTttnJnSSHnvBP00BFwVQqKsMfVXwZNgQ1Q+8Xctbp4d5aO50+XhywkYIq01iUW0cZjd/F9lHr3TBGBk5eRc/zfl/VXYGrnOE/1QK3sEx+7euH29T6KhHU9DjA/EJseBYNPNH9DwNv9R4tSG6w2Ehy+GAtz9ivuLwhniXUZ5PcgaDsN65+efd9HoRsJuj9XkphN4Wd0goQWKyJL45zrxktB7Wp5bPeVYX2CAt7W28lr+dlEOh0E+m1HerHzC01PrbXsvaIM5Q/5BDdnta4NexiACAHKk8MMy919j3xjBX1i07IVm+YuJfC8lJp7J4By1g/GY5KeyoxJ4tsG0NNPmGtB8
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39840400004)(396003)(376002)(366004)(451199015)(6666004)(8936002)(53546011)(38350700002)(478600001)(6506007)(38100700002)(6916009)(52116002)(2906002)(86362001)(41300700001)(2616005)(26005)(186003)(6512007)(36756003)(44832011)(66556008)(30864003)(83380400001)(66476007)(5660300002)(316002)(6486002)(66946007)(1076003)(8676002)(22166003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Y7oO/ZgpQMgv3iAFggyCBzkeYJAIkH2QLRB+xFt9edOCnYy2hdiYCh5MxXfD?=
 =?us-ascii?Q?H2Z2X6zq4du+wC8TB+Nrwjg4cZKkokSRZuj8iB862ZK0XvK4i1IF5SmYGmlf?=
 =?us-ascii?Q?uzV2oiS6VW6sSAMvcVLB3+tUXNJkdMcMdPmAsLH3GqklNZAoTghYTG+1dOwB?=
 =?us-ascii?Q?fJABtjuBe2Ap4xFAk7wDfve22021qxktRUiCpAMOhIsNPLWmCRI4h8UUkr/g?=
 =?us-ascii?Q?w7V4OBvd1Mjt+HcU3kCJKgZxcSIgqljz00Q2aD4LsXb7KBuz+kXIZPalvuvK?=
 =?us-ascii?Q?tCsIGq3ZbfTfoBkv1vOkYefqhyM2DcX4ZyKNlvkFIVMyWkPA6szkxLnmhXUR?=
 =?us-ascii?Q?CHxUCuEE+udVpd1tiuQ5HmghQo4V3Y3dUBJOnRqry1dwqCxRopOYbBeO6TpR?=
 =?us-ascii?Q?Y57y7VZHeTSlpYpVvkt/154e0bt0Jh6R4sDThMLdIXfKMMH3tKv9YcKmzYz6?=
 =?us-ascii?Q?ny3bFjuINt13BwKAen9fSPkVfc/8tcrZh+w+DoTwdBbqtU5qTDlgwZd8MZOT?=
 =?us-ascii?Q?SxDLywWCAPPG41jePdoC7ekDJGL7Dz7Ots1VXBc0Qreje+q7lVGBCx6UHcf8?=
 =?us-ascii?Q?CersAXuxPdYBc535JYVydMKP1+YWe0e3/HauDEH5RaLjIsoTf6U2LEvCn6Ff?=
 =?us-ascii?Q?RuWNXJDpzYWOEyjkJXBkFOeCJDf2hbcSOGzRJnamzfB+/Yle0b2W3oF4gNdi?=
 =?us-ascii?Q?GelYuu0wyvc0CTyfphL2rOSiyMFYCZqh6kjtGOJbp0ypuUaC6gXR655cLVqN?=
 =?us-ascii?Q?xaRIZsukQVj5fk7EjUTUrPDHRIzC02lCjhr1MXaQnXgMPt1KThOl4RvarHBn?=
 =?us-ascii?Q?Ai0DJ5fRRRKUpvLSFj+zSUhc5VhDL+SbZQI+gInFV2FJeUSlkPh9L83gfpXx?=
 =?us-ascii?Q?c2IgRp7zEuY8kZCJLTmgeff1k4mRUAUNCRiVGfGEXV2dkRx//BvLEsEU0EpY?=
 =?us-ascii?Q?yRZL79VOUj8SeVybgT6G6RzVo5nt7X8s9DFBOlZ+mWnIOmqLrY+bLxuAObFT?=
 =?us-ascii?Q?Zj9BkL8ntIhVqEpD80Yd/KkTkGUDkk9vIkjdjgIpKh6AoP1i7wRXjxEjx5tF?=
 =?us-ascii?Q?tbk84HwhJzFzQqm/MWPE7RpdSIJEymEutwc493UBjyPQwFCk3ss5griwtAmv?=
 =?us-ascii?Q?jH0Qe1vZpKb87wg7DzYeb1queDAzWPAcY8QO06pDBHfBCW/p/5W2JeEk0jON?=
 =?us-ascii?Q?DR5c0YIBlAwWHLscS3DhME9V0kmRmqvSh775UCXYyDij4s67kTuvXhDqQIlg?=
 =?us-ascii?Q?LYP4kIWQAmpuQEwJ8SRWibyao+rzcxrP6HEvh/6Zggr8Er/sgs6Tr47hLc72?=
 =?us-ascii?Q?SKZpPgo4teb9Yy1fIunEjBNHHdJn/jEjPu/FWDB0J9z2sqYQhTau/Zel4rur?=
 =?us-ascii?Q?9SfZs8+cnNfELwYMDeaATlpEpTrHvAE0WzDn7nRrBbSGymiMgDAxhzxi9mI8?=
 =?us-ascii?Q?ourFOtHOe9rHzQGn4nsueZ3RZes9Jv9IcFY12WTrLHII9938z5eJAoiMlOHP?=
 =?us-ascii?Q?zlzkYTfGKcrGiNTxFwXY9riciHEVQ3Oo3wac51Hm597K6wuQd8xTVWdZ/DAs?=
 =?us-ascii?Q?xrzinraoqMwUePnGowIVUa/2uF8MtS4Jw/nNF41b?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2a5989d-1580-49d3-02ca-08daebc9b13c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2023 07:27:52.3299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zD9v5naH3fnIqt0EMQjEaFjcSAI7msJYZhP8DhLDCu/yb6ZqHj45vnQZM56o2OBQZcmwDrY7hP4oAZbLlSG1sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7638
X-Proofpoint-ORIG-GUID: XNweHblj1ZAJ9r8Ho9B-bkGdJVo3W6Ux
X-Proofpoint-GUID: XNweHblj1ZAJ9r8Ho9B-bkGdJVo3W6Ux
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-31_16,2022-12-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301010068
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Jan 2023 07:28:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100333

* Refresh patches
* Add a patch to skip checking PYTHONHASHSEED

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...rt-target-module-while-cross-compile.patch | 10 +++----
 ...b-Add-configure-options-for-packages.patch | 14 ++++-----
 ...pyext_PATTERN-for-cross-compilation.patch} | 10 +++----
 ...wscript-skip-checking-PYTHONHASHSEED.patch | 30 +++++++++++++++++++
 ...tch => avoid-openldap-unless-wanted.patch} |  9 +++---
 ...x-musl-libc-conflicting-types-error.patch} | 16 +++++-----
 .../{libldb_2.3.4.bb => libldb_2.6.1.bb}      | 14 +++++----
 7 files changed, 68 insertions(+), 35 deletions(-)
 rename meta-networking/recipes-support/libldb/libldb/{0001-Fix-pyext_PATTERN-for-cross-compilation.patch => 0003-Fix-pyext_PATTERN-for-cross-compilation.patch} (88%)
 create mode 100644 meta-networking/recipes-support/libldb/libldb/0004-wscript-skip-checking-PYTHONHASHSEED.patch
 rename meta-networking/recipes-support/libldb/libldb/{0003-avoid-openldap-unless-wanted.patch => avoid-openldap-unless-wanted.patch} (80%)
 rename meta-networking/recipes-support/libldb/libldb/{libldb-fix-musl-libc-conflict-type-error.patch => cmocka-fix-musl-libc-conflicting-types-error.patch} (76%)
 rename meta-networking/recipes-support/libldb/{libldb_2.3.4.bb => libldb_2.6.1.bb} (86%)

diff --git a/meta-networking/recipes-support/libldb/libldb/0001-do-not-import-target-module-while-cross-compile.patch b/meta-networking/recipes-support/libldb/libldb/0001-do-not-import-target-module-while-cross-compile.patch
index 74f8d8ad0..e21524237 100644
--- a/meta-networking/recipes-support/libldb/libldb/0001-do-not-import-target-module-while-cross-compile.patch
+++ b/meta-networking/recipes-support/libldb/libldb/0001-do-not-import-target-module-while-cross-compile.patch
@@ -1,4 +1,4 @@
-From 00500909ebb0f51dd3b4e90c665f07158e7fe255 Mon Sep 17 00:00:00 2001
+From 69c409195ede704ed7e9298ed4942cc70a52e099 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Tue, 25 Jun 2019 14:25:08 +0800
 Subject: [PATCH] do not import target module while cross compile
@@ -19,7 +19,7 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 19 insertions(+), 8 deletions(-)
 
 diff --git a/buildtools/wafsamba/samba_bundled.py b/buildtools/wafsamba/samba_bundled.py
-index 5f080dd..cdc115e 100644
+index 7d2d855..01dcb56 100644
 --- a/buildtools/wafsamba/samba_bundled.py
 +++ b/buildtools/wafsamba/samba_bundled.py
 @@ -4,6 +4,7 @@ import sys
@@ -28,9 +28,9 @@ index 5f080dd..cdc115e 100644
  from wafsamba import samba_utils
 +import importlib.util, os
  
- def PRIVATE_NAME(bld, name, private_extension, private_library):
+ def PRIVATE_NAME(bld, name):
      '''possibly rename a library to include a bundled extension'''
-@@ -249,17 +250,27 @@ def CHECK_BUNDLED_SYSTEM_PYTHON(conf, libname, modulename, minversion='0.0.0'):
+@@ -241,17 +242,27 @@ def CHECK_BUNDLED_SYSTEM_PYTHON(conf, libname, modulename, minversion='0.0.0'):
      # versions
      minversion = minimum_library_version(conf, libname, minversion)
  
@@ -67,5 +67,5 @@ index 5f080dd..cdc115e 100644
          Logs.error('ERROR: Python module %s of version %s not found, and bundling disabled' % (libname, minversion))
          sys.exit(1)
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-networking/recipes-support/libldb/libldb/0002-ldb-Add-configure-options-for-packages.patch b/meta-networking/recipes-support/libldb/libldb/0002-ldb-Add-configure-options-for-packages.patch
index a55d46bf7..988931c49 100644
--- a/meta-networking/recipes-support/libldb/libldb/0002-ldb-Add-configure-options-for-packages.patch
+++ b/meta-networking/recipes-support/libldb/libldb/0002-ldb-Add-configure-options-for-packages.patch
@@ -1,4 +1,4 @@
-From 100d16aaa6fe9a28a5ba77b2de2bde81a3fa3dac Mon Sep 17 00:00:00 2001
+From b4e04e5dd13c9de8b336f7d0c254973a225e3b5f Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 1 Jul 2019 16:14:16 +0800
 Subject: [PATCH] ldb: Add configure options for packages
@@ -26,7 +26,7 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  2 files changed, 78 insertions(+), 20 deletions(-)
 
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index 2c856b6..36b696d 100644
+index 4c774d9..63c9967 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
 @@ -25,6 +25,41 @@ def options(opt):
@@ -101,7 +101,7 @@ index 2c856b6..36b696d 100644
      conf.CHECK_HEADERS('port.h')
      conf.CHECK_HEADERS('sys/fcntl.h sys/filio.h sys/filsys.h sys/fs/s5param.h')
      conf.CHECK_HEADERS('sys/id.h sys/ioctl.h sys/ipc.h sys/mman.h sys/mode.h sys/ndir.h sys/priv.h')
-@@ -121,8 +169,9 @@ def configure(conf):
+@@ -110,8 +158,9 @@ def configure(conf):
      conf.CHECK_HEADERS('sys/fileio.h sys/filesys.h sys/dustat.h sys/sysmacros.h')
      conf.CHECK_HEADERS('xfs/libxfs.h netgroup.h')
  
@@ -113,7 +113,7 @@ index 2c856b6..36b696d 100644
      conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
      conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
      conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
-@@ -418,20 +467,21 @@ def configure(conf):
+@@ -434,20 +483,21 @@ def configure(conf):
  
      strlcpy_in_bsd = False
  
@@ -150,10 +150,10 @@ index 2c856b6..36b696d 100644
      conf.CHECK_CODE('''
                  struct ucred cred;
 diff --git a/wscript b/wscript
-index bf6129b..722fdf6 100644
+index 60bb7cf..7f14847 100644
 --- a/wscript
 +++ b/wscript
-@@ -39,6 +39,14 @@ def options(opt):
+@@ -40,6 +40,14 @@ def options(opt):
                     help='disable new LMDB backend for LDB',
                     action='store_true', dest='without_ldb_lmdb', default=False)
  
@@ -169,5 +169,5 @@ index bf6129b..722fdf6 100644
  def configure(conf):
      conf.RECURSE('lib/tdb')
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-networking/recipes-support/libldb/libldb/0001-Fix-pyext_PATTERN-for-cross-compilation.patch b/meta-networking/recipes-support/libldb/libldb/0003-Fix-pyext_PATTERN-for-cross-compilation.patch
similarity index 88%
rename from meta-networking/recipes-support/libldb/libldb/0001-Fix-pyext_PATTERN-for-cross-compilation.patch
rename to meta-networking/recipes-support/libldb/libldb/0003-Fix-pyext_PATTERN-for-cross-compilation.patch
index 382a19ced..acd521e69 100644
--- a/meta-networking/recipes-support/libldb/libldb/0001-Fix-pyext_PATTERN-for-cross-compilation.patch
+++ b/meta-networking/recipes-support/libldb/libldb/0003-Fix-pyext_PATTERN-for-cross-compilation.patch
@@ -1,4 +1,4 @@
-From c67c7cee024150fcbdca18764a026aed8724d7ae Mon Sep 17 00:00:00 2001
+From d9f4d5bbd3e58ca7fd7cbc4ab7656fe27bf4c346 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Wed, 24 Nov 2021 13:33:35 +0800
 Subject: [PATCH] Fix pyext_PATTERN for cross compilation
@@ -42,18 +42,18 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/third_party/waf/waflib/Tools/python.py b/third_party/waf/waflib/Tools/python.py
-index b1c8dd0..24faa31 100644
+index a23bd01..af202e0 100644
 --- a/third_party/waf/waflib/Tools/python.py
 +++ b/third_party/waf/waflib/Tools/python.py
 @@ -328,7 +328,7 @@ def check_python_headers(conf, features='pyembed pyext'):
  	x = 'MACOSX_DEPLOYMENT_TARGET'
  	if dct[x]:
- 		env[x] = conf.environ[x] = dct[x]
--	env.pyext_PATTERN = '%s' + dct['SO'] # not a mistake
+ 		env[x] = conf.environ[x] = str(dct[x])
+-	env.pyext_PATTERN = '%s' + (dct['EXT_SUFFIX'] or dct['SO']) # SO is deprecated in 3.5 and removed in 3.11
 +	env.pyext_PATTERN = '%s.so'
  
  
  	# Try to get pythonX.Y-config
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-networking/recipes-support/libldb/libldb/0004-wscript-skip-checking-PYTHONHASHSEED.patch b/meta-networking/recipes-support/libldb/libldb/0004-wscript-skip-checking-PYTHONHASHSEED.patch
new file mode 100644
index 000000000..8747175d2
--- /dev/null
+++ b/meta-networking/recipes-support/libldb/libldb/0004-wscript-skip-checking-PYTHONHASHSEED.patch
@@ -0,0 +1,30 @@
+From 6e403b3bac2edadb67776434da54ac2fc2e8de04 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Wed, 28 Dec 2022 16:31:05 +0800
+Subject: [PATCH] wscript: skip checking PYTHONHASHSEED
+
+Skip checking PYTHONHASHSEED as it is set to 0 in oe-core by default.
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ buildtools/wafsamba/wscript | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/buildtools/wafsamba/wscript b/buildtools/wafsamba/wscript
+index 8729b08..a4d6f3e 100644
+--- a/buildtools/wafsamba/wscript
++++ b/buildtools/wafsamba/wscript
+@@ -8,10 +8,6 @@ import wafsamba
+ from samba_utils import symlink
+ from optparse import SUPPRESS_HELP
+ 
+-phs = os.environ.get("PYTHONHASHSEED", None)
+-if phs != "1":
+-    raise Errors.WafError('''PYTHONHASHSEED=1 missing! Don't use waf directly, use ./configure and make!''')
+-
+ # this forces configure to be re-run if any of the configure
+ # sections of the build scripts change. We have to check
+ # for this in sys.argv as options have not yet been parsed when
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/libldb/libldb/0003-avoid-openldap-unless-wanted.patch b/meta-networking/recipes-support/libldb/libldb/avoid-openldap-unless-wanted.patch
similarity index 80%
rename from meta-networking/recipes-support/libldb/libldb/0003-avoid-openldap-unless-wanted.patch
rename to meta-networking/recipes-support/libldb/libldb/avoid-openldap-unless-wanted.patch
index dd1246538..87909c952 100644
--- a/meta-networking/recipes-support/libldb/libldb/0003-avoid-openldap-unless-wanted.patch
+++ b/meta-networking/recipes-support/libldb/libldb/avoid-openldap-unless-wanted.patch
@@ -1,20 +1,21 @@
-From 1f24231095a59debcf25d0e3309dc5d1056a7fad Mon Sep 17 00:00:00 2001
+From cc86b8bdd45ca30bdf65a3b8b0960b27aeb34522 Mon Sep 17 00:00:00 2001
 From: Jens Rehsack <rehsack@gmail.com>
 Date: Thu, 19 Nov 2015 20:45:56 +0100
 Subject: [PATCH] avoid openldap unless wanted
 
 Upstream-Status: Inappropriate [embedded specific]
 
+Signed-off-by: Jens Rehsack <rehsack@gmail.com>
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
  wscript | 4 +---
  1 file changed, 1 insertion(+), 3 deletions(-)
 
 diff --git a/wscript b/wscript
-index 722fdf6..22700d5 100644
+index 7f14847..092da2d 100644
 --- a/wscript
 +++ b/wscript
-@@ -153,9 +153,7 @@ def configure(conf):
+@@ -154,9 +154,7 @@ def configure(conf):
      if conf.env.standalone_ldb:
          conf.CHECK_XSLTPROC_MANPAGES()
  
@@ -26,5 +27,5 @@ index 722fdf6..22700d5 100644
          # we don't want any libraries or modules to rely on runtime
          # resolution of symbols
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-networking/recipes-support/libldb/libldb/libldb-fix-musl-libc-conflict-type-error.patch b/meta-networking/recipes-support/libldb/libldb/cmocka-fix-musl-libc-conflicting-types-error.patch
similarity index 76%
rename from meta-networking/recipes-support/libldb/libldb/libldb-fix-musl-libc-conflict-type-error.patch
rename to meta-networking/recipes-support/libldb/libldb/cmocka-fix-musl-libc-conflicting-types-error.patch
index 444fa3ff1..8e756d8d3 100644
--- a/meta-networking/recipes-support/libldb/libldb/libldb-fix-musl-libc-conflict-type-error.patch
+++ b/meta-networking/recipes-support/libldb/libldb/cmocka-fix-musl-libc-conflicting-types-error.patch
@@ -1,7 +1,7 @@
-From 5bd7b5d04435bd593349825973ce32290f5f604d Mon Sep 17 00:00:00 2001
+From a37eb0a46669592e32ed4e004abb2698ee4f90c5 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 25 Jul 2018 09:55:25 +0800
-Subject: [PATCH] libldb: fix musl libc conflicting types error
+Subject: [PATCH] cmocka: fix musl libc conflicting types error
 
 /third_party/cmocka/cmocka.h:126:28: error: conflicting types for 'uintptr_t'
             typedef unsigned int uintptr_t;
@@ -16,19 +16,19 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 3 insertions(+), 4 deletions(-)
 
 diff --git a/third_party/cmocka/cmocka.h b/third_party/cmocka/cmocka.h
-index 4fd82a9..5443a08 100644
+index e6861c8..238201d 100644
 --- a/third_party/cmocka/cmocka.h
 +++ b/third_party/cmocka/cmocka.h
-@@ -110,7 +110,7 @@ typedef uintmax_t LargestIntegralType;
+@@ -111,7 +111,7 @@ typedef uintmax_t LargestIntegralType;
      ((LargestIntegralType)(value))
  
  /* Smallest integral type capable of holding a pointer. */
 -#if !defined(_UINTPTR_T) && !defined(_UINTPTR_T_DEFINED)
-+#if !defined(__DEFINED_uintptr_t) 
++#if !defined(__DEFINED_uintptr_t)
  # if defined(_WIN32)
      /* WIN32 is an ILP32 platform */
      typedef unsigned int uintptr_t;
-@@ -134,9 +134,8 @@ typedef uintmax_t LargestIntegralType;
+@@ -135,9 +135,8 @@ typedef uintmax_t LargestIntegralType;
  #  endif /* __WORDSIZE */
  # endif /* _WIN32 */
  
@@ -36,10 +36,10 @@ index 4fd82a9..5443a08 100644
 -# define _UINTPTR_T_DEFINED
 -#endif /* !defined(_UINTPTR_T) || !defined(_UINTPTR_T_DEFINED) */
 +# define __DEFINED_uintptr_t
-+#endif /* !defined(__DEFINED_uintptr_t) 
++#endif /* !defined(__DEFINED_uintptr_t) */
  
  /* Perform an unsigned cast to uintptr_t. */
  #define cast_to_pointer_integral_type(value) \
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-networking/recipes-support/libldb/libldb_2.3.4.bb b/meta-networking/recipes-support/libldb/libldb_2.6.1.bb
similarity index 86%
rename from meta-networking/recipes-support/libldb/libldb_2.3.4.bb
rename to meta-networking/recipes-support/libldb/libldb_2.6.1.bb
index af5f0427d..d5440cce2 100644
--- a/meta-networking/recipes-support/libldb/libldb_2.3.4.bb
+++ b/meta-networking/recipes-support/libldb/libldb_2.6.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Hierarchical, reference counted memory pool system with destructors"
-HOMEPAGE = "http://ldb.samba.org"
+HOMEPAGE = "https://ldb.samba.org"
 SECTION = "libs"
 LICENSE = "LGPL-3.0-or-later & LGPL-2.1-or-later & GPL-3.0-or-later"
 
@@ -9,10 +9,12 @@ RDEPENDS:pyldb += "python3"
 SRC_URI = "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
            file://0001-do-not-import-target-module-while-cross-compile.patch \
            file://0002-ldb-Add-configure-options-for-packages.patch \
-           file://0001-Fix-pyext_PATTERN-for-cross-compilation.patch \
-           file://libldb-fix-musl-libc-conflict-type-error.patch \
+           file://0003-Fix-pyext_PATTERN-for-cross-compilation.patch \
+           file://0004-wscript-skip-checking-PYTHONHASHSEED.patch \
           "
 
+SRC_URI:append:libc-musl = " file://cmocka-fix-musl-libc-conflicting-types-error.patch"
+
 PACKAGECONFIG ??= "\
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)} \
@@ -26,14 +28,14 @@ PACKAGECONFIG[libcap] = "--with-libcap,--without-libcap,libcap"
 PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind"
 PACKAGECONFIG[lmdb] = ",--without-ldb-lmdb,lmdb,"
 
-SRC_URI += "${@bb.utils.contains('PACKAGECONFIG', 'ldap', '', 'file://0003-avoid-openldap-unless-wanted.patch', d)}"
+SRC_URI += "${@bb.utils.contains('PACKAGECONFIG', 'ldap', '', 'file://avoid-openldap-unless-wanted.patch', d)}"
 
 LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9adade \
                     file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
                     file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
 
-SRC_URI[md5sum] = "b01d6913a06901c22c5bc6caedc548ac"
-SRC_URI[sha256sum] = "f2e88dcab7b6007d92724b62f8a16e7c6e77275885c60eb4f87097e4aa4082c1"
+SRC_URI[md5sum] = "3a5f54f511fb237b83e1f34e2c7e25cd"
+SRC_URI[sha256sum] = "467403f77df86782c3965bb175440baa2ed751a9feb9560194bd8c06bf1736c9"
 
 inherit pkgconfig waf-samba
 
-- 
2.25.1


