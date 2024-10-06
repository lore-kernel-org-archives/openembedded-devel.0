Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3242CFB440
	for <webhook@archiver.kernel.org>; Sun,  6 Oct 2024 10:43:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.29000.1728211433144813608
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Oct 2024 03:43:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0009f33b99=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 496Ae7kc016681
	for <openembedded-devel@lists.openembedded.org>; Sun, 6 Oct 2024 10:43:52 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 422ve8s35a-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 06 Oct 2024 10:43:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OqkVHUq3cbZgPsjKju5q/R9p2XFiIl5b1Z5tKfTb0lAHsLjNo8cxnoYuRm5l12UhADUZsIR30Lk10HUe06WeImBDdI2vJ7fS+9bVznHUTIX2zGHjne+MbxlD9YJTNQbHjHzI15k75eNAY43ifX7NapWScfV26HMQB91Bq9GS/n4RejLZ40IdTvIWRq0TKlAGrITOMGFTmeYuht4ntHzCbQRhJyQL/kIVW5sIH3p9aMqexv+IASwQbUVouxKs8Y6+TO4R3z63qGEmspgBNeAY7nTqQIcXjdaZMRb+Wxt7jk2a9JXVh6gqm+flP7ll5YiQAGwEkXXtiMwY/MLWL5u/aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBEr5MP53ODY50Y9YkrlBp97A76e8o0U6kh8nH2SLVk=;
 b=aG7/OExj3az4TcrVr+7TnE13i8FmCRcp1tyvl0W+vhVKuW8VY6Rir/cynguvle5X6+Wo3WgYnqfAftcDpa+z3R4f6MsdhTxcFOyZp1CPtDI95oXQl1rjREVW3Ed7w9FJSrlTSJ4Jm2XG9lgilSgW23wMEUpasktJ7dXLsjoq/XiHxSVl+BsMZ08KVLDlYhQuitXz5n/napvGhBizz3TxNPXxmTGVVb847d/gvS+B2GXEoH5Zf5CvoyPO7VTFxsepYwlgm83yloZmX845v8KFfLenjCJWwby88x9vMkXxxrQ4cjQBYpkaKUWs8gvgQ+4Bt/M4E1pz3TRD/3GKSyWDMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CY8PR11MB7946.namprd11.prod.outlook.com (2603:10b6:930:7e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.20; Sun, 6 Oct 2024 10:43:50 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8026.020; Sun, 6 Oct 2024
 10:43:50 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] multipath-tools: upgrade 0.9.8 -> 0.10.0
Date: Sun,  6 Oct 2024 18:43:39 +0800
Message-Id: <20241006104339.1384855-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241006104339.1384855-1-yi.zhao@windriver.com>
References: <20241006104339.1384855-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0024.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::9) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CY8PR11MB7946:EE_
X-MS-Office365-Filtering-Correlation-Id: 67c58e52-c71a-4bfe-bc8e-08dce5f3c393
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?x9sGOMu5OZpS0zbwWxmn2UnZZwWyigrKCN0QZq8gT9cuQfymnzGnZ0d6XM/S?=
 =?us-ascii?Q?I6vTUrTGYxjMlRlHgOeqXdfTrBIzXutgCXB/ppbD6lZgB0LY6YUhmBr5d2LI?=
 =?us-ascii?Q?tpHO4XraPTYyxmY8VyTMKXWbK0XtFvF3dtnro9laDvSMviIvLXKnTpdamDuA?=
 =?us-ascii?Q?v89PONtlzMKbYfltNQgw+b55IIrPVZASJCTm/KePmoXKR7FaHbtXNh0esU9G?=
 =?us-ascii?Q?ktLoeOaB69GDlESIbvUbWiCsQc6e1+3dQ/qdWF/xPzJbz2lABRA2B/QkSFAH?=
 =?us-ascii?Q?7j3T7mSDzQW9ytn4oJzgbghRIYNsZ2X6ycTwU2BBBduTHALhV8p6PAzLEWQQ?=
 =?us-ascii?Q?QnYUuDzmDxH4AZ1tyI7Q7Xp/sy/gAdQg1pMm+EpBqnF4NHVXuxLmjtY8FQ5+?=
 =?us-ascii?Q?/W4upyUHxjmg0iyW7Vyyx0+5z8QciSs4uITO+JblYRWg9sOeAiTRH/kX86Sr?=
 =?us-ascii?Q?iobA47GILwLl0HLyXygFF/8U0dGxDajNQ63C0llhHtdVxk+aFblfebAuIhKU?=
 =?us-ascii?Q?u+i4mjJ6DgOa1ZFV1MPieHivdR6UypVwfwMZ7vPf+ngoehzXDYZh4PoR2B7v?=
 =?us-ascii?Q?HukBEE9J9hW/EhUoI2YZmx81UD5ZsR3J7F6r7uDDPt3WmURrsFh9Rv17hhok?=
 =?us-ascii?Q?bANu7H2jvXamKGEoihxYNV7MPrRqTI1k3oEbNA3XLop/KH79r+rQ/YEzGfzo?=
 =?us-ascii?Q?78i3BKuBgdF6zX7f3Xwg+/TprwmEC6B0ne66LYlQ7YUiuxEiymWTYqsC0O2w?=
 =?us-ascii?Q?bMKSMEE5U3vn6hKhusD/iyLKXAeN9KavjVAq5U3CAk4WO+Z78cTHLSw/0Gz4?=
 =?us-ascii?Q?9p+fn138TT0YG2SIDL2mUOUMXJ8Z3OHNyrReig1mkbMlsCghi8A3HLr+qDAL?=
 =?us-ascii?Q?syRY2iCwVv88Gz5xtankx437kwBbsSA6IyPIFnYuyJXowRoe3qG/GpShbJZi?=
 =?us-ascii?Q?IqwuAfXCWPYRi636SMkLC45J3P78DZzCNKSVrJMHQ/06FY0NDzsfKkDqoN2m?=
 =?us-ascii?Q?cQX5okpUdVMcpeSgk/9+ij7dLkCuZdBXfqVqQBUrzlsk8EpDb3+gf/dEy9IE?=
 =?us-ascii?Q?BtSwBY6SbQqgRatsLEunhlsMLdNTvgOkG/N5o4oxX2zC8zHVS4yyH2J5uYaf?=
 =?us-ascii?Q?GglIES23G4hMoQL8/pV6x8tnAViQQOJoOZon2mvTDIZKW5P/Lh3x4zxnBCg4?=
 =?us-ascii?Q?BZTOg6DAu2lj1aozICT/cnEsTXv6GBpzMwM3dpPxiBbpfoI6SbfQZQC99KKC?=
 =?us-ascii?Q?EnWYPObvKWR8kLUlqbxHV4ek3fYIathDC1aI0Q82vJ45Lulw+EAcWjUHrMmw?=
 =?us-ascii?Q?AczMF5SRVQsGZIjJVvdweRZ4Mt913X6SWwdzQJC6JlVMaIvzKASeUPcxMsQK?=
 =?us-ascii?Q?z/iLQ9U=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LvG3lWBdsjqGt5uFQ4Baa+EXWzz/k2yyrM334vIyB2CBlp/oSYN4gDRDLzyv?=
 =?us-ascii?Q?gPbr5JLzMDqmb4wHTHtQuK8jXjG1mR9XLazbT8h0bmAGjy513sQpVRvMJbx4?=
 =?us-ascii?Q?/svwQ2axIJ0ccBiT+71Vc7Chovdczv1KQQtXwy2ByBB+iteYIxD2L3eP5MTy?=
 =?us-ascii?Q?A81KtTJIuDbtBsUUaKkFe9sZM7LHl+FHpf9fBdO1Qtrj1nagcVi7+Lom/cY2?=
 =?us-ascii?Q?xh1lJx/dRwAY0o7eP8kYdGXM5nBPafVaOFl+G36hxuSlIV3IAqHcrOuXJGb6?=
 =?us-ascii?Q?KoDK4Wm33PobAcScHb+mBS/LCN7luDCNWtj9SSr+MpDQfpPthRl+Lck36D8I?=
 =?us-ascii?Q?Iwgu+kBHrUy9WtqrpATVu/2gn+34zEO4CUE19TudP/JC71x7iJx9CGX8IXmK?=
 =?us-ascii?Q?fiZa6wtwximz7vc6SSivwSQrTQu6aqK44dKzEkrt+7auI5gstWX0zujfyuNK?=
 =?us-ascii?Q?qJUCqPRdiLhHMfErMcaY3daOz5qTTdwGiamfwUDKn1c/82dcOApVGpA3A0DD?=
 =?us-ascii?Q?9D2dftZAvHB7KWLl1DMBRjy1lflUpzdI9wohTwdedqQQoCPLGzTF5eWDvZEC?=
 =?us-ascii?Q?f3nkUjG1NNRcVUCbJ3T4kKk7xMYX9qr3v6jjET8SmiWuqzWfOK7XehXZwP64?=
 =?us-ascii?Q?MvDFhhZhU4qD+K13je/bokbT6yp6fl9HuA4Y+LVa+hj4QYKUnz8n6iGwJcpb?=
 =?us-ascii?Q?dSDlmtj0hXnfXBEXTaU4Ok8Ex9+xO4gYA/mmP0C+Y3rnX6JvIzfHt8eMKM6q?=
 =?us-ascii?Q?Yyh8tygBaITQ0MSgOGdaPgAHEzTu6W80eidaNFFpQJf8OnIh5SFfYzdaUws1?=
 =?us-ascii?Q?w2TKXeGZBz+iF7im8uik+BTBnAafkuHtbxyqWsWaHgtOa32To6l6cpK5ZqPv?=
 =?us-ascii?Q?x5lVc395XGIHKFX86E2Eyl2VW4s8VFx8NY0cxTy+vm7RzzATzMCa189z049I?=
 =?us-ascii?Q?9aHf8I5217+Gk82xyi8wkH1HIBcQktou3J2AvbZIuIWcFvEpn+md/kYElk7w?=
 =?us-ascii?Q?NDsKrzylfyG0giQUxonFaBvHQOr+JD7Jfmmiw5GX05u/Kacc/RyO0PY7zUMH?=
 =?us-ascii?Q?F09nJulOzNkGCZkHbufhRsVL0F9WgMLACmI2Bki25kE5D9edm97atB8Onwcx?=
 =?us-ascii?Q?qE50CokKxxQCiKO057t2q5jyzOS8l2H2eLRfLwI4Qv7Fw4/cw3PLVMbZGkqC?=
 =?us-ascii?Q?/nyCfg9tTdUMNRKDrEFnbYyz5X1QpbE1oD0QS8nD82wWMzqfmB3WzCWm0yoW?=
 =?us-ascii?Q?LntP6RVzZNM9NAbvN9luPgrSxpvXdK4y0UrXOmQm9m7tgPbgl+h7nBjjEGpi?=
 =?us-ascii?Q?1ecTzTM+LsT6nZrod0sALDWrlUIhXxRh8Jq0QvoEv7PijRjJUi4Nuqj/2MOf?=
 =?us-ascii?Q?5QbEcyEPfR5HCunfRV3+wpRft9U63YHkh5TdBgWuJm56uDMNTUJvUL3D9EsV?=
 =?us-ascii?Q?fjxVIPTapdJlesermxcjvZ+I6+alQDczlN2waobENbfL8RIlkf7hIA0kUQF1?=
 =?us-ascii?Q?AamMKe9Nd5flCarCsx+B135Kh59iRzdDVHjYa6GuCY6n7EnDVQ0dje3SkNk8?=
 =?us-ascii?Q?4ov3KB2QY15fobxEG8H6SW2xAPYvy/+geDIgQW3f?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c58e52-c71a-4bfe-bc8e-08dce5f3c393
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2024 10:43:50.3717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YnFBgD/lNskiGrUESiWRfOBKFkODdycpy42tZDdGq0aZ+kcPlXCkfgdskPiz0arTZhxWL2MyJ9BFsdTVJ9SANw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7946
X-Authority-Analysis: v=2.4 cv=CPp4XgrD c=1 sm=1 tr=0 ts=670269e8 cx=c_pps a=UtaLnOzkojfj4BVWksq/2g==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8
 a=pGLkceISAAAA:8 a=omOdbC7AAAAA:8 a=rcTMlxIUc_i6OEo_3LUA:9 a=QOrrqyIChiMp79fg:21 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 3Qm2iS3fCKqAA7ESj8mkM1WJLvG5y295
X-Proofpoint-GUID: 3Qm2iS3fCKqAA7ESj8mkM1WJLvG5y295
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-06_06,2024-10-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 impostorscore=0
 suspectscore=0 phishscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2409260000
 definitions=main-2410060077
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Oct 2024 10:43:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112678

ChangeLog:
https://github.com/opensvc/multipath-tools/blob/0.10.0/NEWS.md

* Refresh patches.
* Drop 0001-libmultipath-always-use-glibc-basename.patch as the issue
  has been fixed upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../0001-RH-fixup-udev-rules-for-redhat.patch | 29 +++++++------
 ...bmultipath-always-use-glibc-basename.patch | 42 -------------------
 ...property-blacklist-exception-builtin.patch | 10 ++---
 ...RH-don-t-start-without-a-config-file.patch | 16 +++----
 .../0004-RH-use-rpm-optflags-if-present.patch | 29 +++++++------
 .../files/0005-RH-add-mpathconf.patch         |  8 ++--
 ...om-kernel-cmdline-mpath.wwids-with-A.patch |  8 ++--
 ...-on-invalid-regex-instead-of-failing.patch | 12 +++---
 ...-default-find_mutipaths-value-to-off.patch |  8 ++--
 ...modify-create-config.mk-for-cross-co.patch |  6 +--
 ....patch => 0010-Always-use-devmapper.patch} |  6 +--
 ...fix-bug-of-do_compile-and-do_install.patch |  8 ++--
 ...add-explicit-dependency-on-libraries.patch |  8 ++--
 .../multipath-tools/files/multipathd.oe       |  0
 ...ols_0.9.8.bb => multipath-tools_0.10.0.bb} |  5 +--
 15 files changed, 78 insertions(+), 117 deletions(-)
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-libmultipath-always-use-glibc-basename.patch
 rename meta-oe/recipes-support/multipath-tools/files/{0010-Subject-PATCH-Always-use-devmapper.patch => 0010-Always-use-devmapper.patch} (92%)
 mode change 100755 => 100644 meta-oe/recipes-support/multipath-tools/files/multipathd.oe
 rename meta-oe/recipes-support/multipath-tools/{multipath-tools_0.9.8.bb => multipath-tools_0.10.0.bb} (96%)

diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-RH-fixup-udev-rules-for-redhat.patch b/meta-oe/recipes-support/multipath-tools/files/0001-RH-fixup-udev-rules-for-redhat.patch
index 74ae1530c..909fd77ba 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0001-RH-fixup-udev-rules-for-redhat.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0001-RH-fixup-udev-rules-for-redhat.patch
@@ -1,7 +1,7 @@
-From 1e1ba9ecc16895bf472eae345d44631b65629611 Mon Sep 17 00:00:00 2001
+From 68160e86472b197107c60bf6e5a3d126040e85b6 Mon Sep 17 00:00:00 2001
 From: Benjamin Marzinski <bmarzins@redhat.com>
 Date: Thu, 13 Apr 2017 07:22:23 -0500
-Subject: [PATCH 01/12] RH: fixup udev rules for redhat
+Subject: [PATCH] RH: fixup udev rules for redhat
 
 The multipath rules need to run after scsi_id is run. This means moving
 them after 60-persistent-storage.rules for redhat. Redhat also uses a
@@ -18,17 +18,20 @@ Rebase to 0.9.8
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 
 Upstream-Status: Pending
+
+Rebase to 0.10.0
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
- Makefile.inc        | 2 +-
- kpartx/kpartx.rules | 2 +-
- multipath/Makefile  | 4 ++--
+ Makefile.inc           | 2 +-
+ kpartx/kpartx.rules.in | 2 +-
+ multipath/Makefile     | 4 ++--
  3 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile.inc b/Makefile.inc
-index 5668e638..de89b21f 100644
+index 729618bd..69521882 100644
 --- a/Makefile.inc
 +++ b/Makefile.inc
-@@ -59,7 +59,7 @@ tmpfilesdir	:= $(systemd_prefix)lib/tmpfiles.d
+@@ -62,7 +62,7 @@ tmpfilesdir	:= $(systemd_prefix)lib/tmpfiles.d
  modulesloaddir	:= $(systemd_prefix)lib/modules-load.d
  libudevdir	:= $(systemd_prefix)lib/udev
  udevrulesdir	:= $(libudevdir)/rules.d
@@ -37,16 +40,16 @@ index 5668e638..de89b21f 100644
  mandir		:= $(usr_prefix)share/man
  LIB		:= $(if $(shell test -d /lib64 && echo 1),lib64,lib)
  syslibdir	:= $(prefix)$(LIB)
-diff --git a/kpartx/kpartx.rules b/kpartx/kpartx.rules
-index 1969dee0..d2b28233 100644
---- a/kpartx/kpartx.rules
-+++ b/kpartx/kpartx.rules
+diff --git a/kpartx/kpartx.rules.in b/kpartx/kpartx.rules.in
+index 9d879609..2049eb8f 100644
+--- a/kpartx/kpartx.rules.in
++++ b/kpartx/kpartx.rules.in
 @@ -39,6 +39,6 @@ LABEL="mpath_kpartx_end"
  GOTO="kpartx_end"
  
  LABEL="run_kpartx"
--RUN+="/sbin/kpartx -un -p -part /dev/$name"
-+RUN+="/sbin/kpartx -un /dev/$name"
+-RUN+="@BINDIR@/kpartx -un -p -part /dev/$name"
++RUN+="@BINDIR@/kpartx -un /dev/$name"
  
  LABEL="kpartx_end"
 diff --git a/multipath/Makefile b/multipath/Makefile
diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-libmultipath-always-use-glibc-basename.patch b/meta-oe/recipes-support/multipath-tools/files/0001-libmultipath-always-use-glibc-basename.patch
deleted file mode 100644
index 0365a7ef6..000000000
--- a/meta-oe/recipes-support/multipath-tools/files/0001-libmultipath-always-use-glibc-basename.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 389286b25a903be62ce7f964246824fcc20c4c67 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 26 Mar 2024 18:56:55 -0700
-Subject: [PATCH] libmultipath: always use glibc basename()
-
-There is a use of basename() which expects it to be GNU version of
-basename, which is not available in other libcs e.g. musl on Linux
-therefore provide a version for such cases
-
-Upstream-Status: Submitted [https://github.com/opensvc/multipath-tools/pull/84]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libmultipath/configure.c | 13 +++++++++++++
- 1 file changed, 13 insertions(+)
-
-diff --git a/libmultipath/configure.c b/libmultipath/configure.c
-index 4ecf6ba4..e81cc67c 100644
---- a/libmultipath/configure.c
-+++ b/libmultipath/configure.c
-@@ -43,6 +43,19 @@
- #include "sysfs.h"
- #include "io_err_stat.h"
- 
-+#ifndef __GLIBC__
-+/*
-+ * glibc's non-destructive version of basename()
-+ * License: LGPL-2.1-or-later
-+ */
-+static const char *__basename(const char *filename)
-+{
-+	char *p = strrchr(filename, '/');
-+	return p ? p + 1 : filename;
-+}
-+#define basename(x) __basename(x)
-+#endif
-+
- /* group paths in pg by host adapter
-  */
- int group_by_host_adapter(struct pathgroup *pgp, vector adapters)
--- 
-2.44.0
-
diff --git a/meta-oe/recipes-support/multipath-tools/files/0002-RH-Remove-the-property-blacklist-exception-builtin.patch b/meta-oe/recipes-support/multipath-tools/files/0002-RH-Remove-the-property-blacklist-exception-builtin.patch
index 4b24bd2d3..a57828049 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0002-RH-Remove-the-property-blacklist-exception-builtin.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0002-RH-Remove-the-property-blacklist-exception-builtin.patch
@@ -1,7 +1,7 @@
-From bb6db01cc19940bb5162c1cc0c9b5f8e4c209822 Mon Sep 17 00:00:00 2001
+From e3449e163d7fe9bf1e188f0e28962f0659e9652d Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Fri, 1 Mar 2024 10:34:06 +0800
-Subject: [PATCH 02/12] RH: Remove the property blacklist exception builtin
+Subject: [PATCH] RH: Remove the property blacklist exception builtin
 
 Multipath set the default property blacklist exceptions to
 (ID_SCSI_VPD|ID_WWN).  This has the effect of blacklisting some internal
@@ -13,21 +13,19 @@ it.
 
 Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
 
-Upsteam-Status: Pending
+Upstream-Status: Pending
 
 [OP: Rebase to 0.9.3]
 Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
 
 Rebase to 0.9.8
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
-Upstream-Status: Pending
 ---
  libmultipath/blacklist.c | 16 +++++-----------
  1 file changed, 5 insertions(+), 11 deletions(-)
 
 diff --git a/libmultipath/blacklist.c b/libmultipath/blacklist.c
-index 75100b20..4fdaca76 100644
+index 17e1b54a..2cfb18b8 100644
 --- a/libmultipath/blacklist.c
 +++ b/libmultipath/blacklist.c
 @@ -221,15 +221,6 @@ setup_default_blist (struct config * conf)
diff --git a/meta-oe/recipes-support/multipath-tools/files/0003-RH-don-t-start-without-a-config-file.patch b/meta-oe/recipes-support/multipath-tools/files/0003-RH-don-t-start-without-a-config-file.patch
index 54b3bdc86..b11fb2c72 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0003-RH-don-t-start-without-a-config-file.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0003-RH-don-t-start-without-a-config-file.patch
@@ -1,7 +1,7 @@
-From de8ee3480ec7479ed014c197a9d747403f6e0237 Mon Sep 17 00:00:00 2001
+From 06a411b15e131eb4ebc2df95dc10fcff944bead6 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Fri, 23 Nov 2018 17:25:15 +0800
-Subject: [PATCH 03/12] RH: don't start without a config file
+Subject: [PATCH] RH: don't start without a config file
 
 If /etc/multipath.conf doesn't exist, don't start multipathd and blacklist
 all devices when running multipath.  A completely blank configuration file
@@ -28,7 +28,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  5 files changed, 23 insertions(+)
 
 diff --git a/libmultipath/config.c b/libmultipath/config.c
-index 83fa7369..8a3a8f37 100644
+index 0e3a5cc1..3fbfcc85 100644
 --- a/libmultipath/config.c
 +++ b/libmultipath/config.c
 @@ -26,6 +26,7 @@
@@ -39,7 +39,7 @@ index 83fa7369..8a3a8f37 100644
  
  /*
   * We don't support re-initialization after
-@@ -959,6 +960,23 @@ int _init_config (const char *file, struct config *conf)
+@@ -959,6 +960,23 @@ int init_config__ (const char *file, struct config *conf)
  		}
  		factorize_hwtable(conf->hwtable, builtin_hwtable_size, file);
  		validate_pctable(conf->overrides, 0, file);
@@ -64,7 +64,7 @@ index 83fa7369..8a3a8f37 100644
  
  	conf->processed_main_config = 1;
 diff --git a/libmultipath/config.h b/libmultipath/config.h
-index 384193ab..158cebf0 100644
+index 94cdf252..534b6142 100644
 --- a/libmultipath/config.h
 +++ b/libmultipath/config.h
 @@ -10,6 +10,7 @@
@@ -76,7 +76,7 @@ index 384193ab..158cebf0 100644
  enum devtypes {
  	DEV_NONE,
 diff --git a/multipath/multipath.rules.in b/multipath/multipath.rules.in
-index 780bf852..2c518378 100644
+index 2ac1972f..cc248231 100644
 --- a/multipath/multipath.rules.in
 +++ b/multipath/multipath.rules.in
 @@ -9,6 +9,7 @@ IMPORT{cmdline}="nompath"
@@ -88,7 +88,7 @@ index 780bf852..2c518378 100644
  ENV{DEVTYPE}!="partition", GOTO="test_dev"
  IMPORT{parent}="DM_MULTIPATH_DEVICE_PATH"
 diff --git a/multipathd/multipathd.8.in b/multipathd/multipathd.8.in
-index f1cab3ff..5ae21db1 100644
+index 7bc8806e..315884eb 100644
 --- a/multipathd/multipathd.8.in
 +++ b/multipathd/multipathd.8.in
 @@ -49,6 +49,8 @@ map regains its maximum performance and redundancy.
@@ -101,7 +101,7 @@ index f1cab3ff..5ae21db1 100644
  .
  .\" ----------------------------------------------------------------------------
 diff --git a/multipathd/multipathd.service.in b/multipathd/multipathd.service.in
-index 6d03ff71..0cd85102 100644
+index 646001e6..979e6f12 100644
 --- a/multipathd/multipathd.service.in
 +++ b/multipathd/multipathd.service.in
 @@ -5,6 +5,7 @@ Before=local-fs-pre.target blk-availability.service shutdown.target
diff --git a/meta-oe/recipes-support/multipath-tools/files/0004-RH-use-rpm-optflags-if-present.patch b/meta-oe/recipes-support/multipath-tools/files/0004-RH-use-rpm-optflags-if-present.patch
index 91477a44c..6556d4af8 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0004-RH-use-rpm-optflags-if-present.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0004-RH-use-rpm-optflags-if-present.patch
@@ -1,7 +1,7 @@
-From f1b74f21875d6d9f0a5ac3d67df40a28b167052a Mon Sep 17 00:00:00 2001
+From dd4f005ab3b38cee2776dcb0a0661c5a01befd00 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 26 Nov 2018 09:19:17 +0800
-Subject: [PATCH 04/12] RH: use rpm optflags if present
+Subject: [PATCH] RH: use rpm optflags if present
 
 Use the passed in optflags when compiling as an RPM, and keep the
 default flags as close as possible to the current fedora flags, while
@@ -16,15 +16,18 @@ Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
 
 Rebase to 0.9.8
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+Rebase to 0.10.0
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
  Makefile.inc | 12 ++++++++++--
  1 file changed, 10 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.inc b/Makefile.inc
-index de89b21f..6ac632ff 100644
+index 69521882..2127f208 100644
 --- a/Makefile.inc
 +++ b/Makefile.inc
-@@ -95,7 +95,15 @@ SYSTEMD_LIBDEPS := $(if $(SYSTEMD),$(if $(shell test $(SYSTEMD) -gt 209 && echo
+@@ -99,7 +99,15 @@ SYSTEMD_LIBDEPS := $(if $(SYSTEMD),$(if $(shell test $(SYSTEMD) -gt 209 && echo
  MODPROBE_UNIT := $(shell test "0$(SYSTEMD)" -lt 245 2>/dev/null || \
  			echo "modprobe@dm_multipath.service")
  
@@ -38,18 +41,18 @@ index de89b21f..6ac632ff 100644
 +                  -Werror=implicit-function-declaration -Wno-sign-compare \
 +                  -Wno-unused-parameter -Werror=cast-qual \
 +                  -Werror=discarded-qualifiers
- WARNFLAGS	:= -Werror -Wall -Wextra -Wformat=2 $(WFORMATOVERFLOW) -Werror=implicit-int \
- 		  -Werror=implicit-function-declaration -Werror=format-security \
- 		  $(WNOCLOBBERED) -Werror=cast-qual $(ERROR_DISCARDED_QUALIFIERS) $(W_URCU_TYPE_LIMITS)
-@@ -105,7 +113,7 @@ CPPFLAGS	:= $(FORTIFY_OPT) $(CPPFLAGS) $(D_URCU_VERSION) \
- 		   -DRUNTIME_DIR=\"$(runtimedir)\" -DCONFIG_DIR=\"$(configdir)\" \
- 		   -DDEFAULT_CONFIGFILE=\"$(configfile)\" -DSTATE_DIR=\"$(statedir)\" \
+ 
+ # Set WARN_ONLY=1 to avoid compilation erroring out due to warnings. Useful during development.
+ WARN_ONLY       :=
+@@ -115,7 +123,7 @@ CPPFLAGS	:= $(FORTIFY_OPT) $(CPPFLAGS) $(D_URCU_VERSION) \
+ 		   -DRUNTIME_DIR=\"$(runtimedir)\" -DCONFIG_DIR=\"$(TGTDIR)$(configdir)\" \
+ 		   -DDEFAULT_CONFIGFILE=\"$(TGTDIR)$(configfile)\" -DSTATE_DIR=\"$(TGTDIR)$(statedir)\" \
  		   -DEXTRAVERSION=\"$(EXTRAVERSION)\" -MMD -MP
--CFLAGS		:= -std=gnu99 $(CFLAGS) $(OPTFLAGS) $(WARNFLAGS) -pipe
-+CFLAGS		:= -std=gnu99 $(CFLAGS) $(OPTFLAGS) -pipe
+-CFLAGS		:= -std=gnu99 $(CFLAGS) $(OPTFLAGS) $(WARNFLAGS) -pipe \
++CFLAGS		:= -std=gnu99 $(CFLAGS) $(OPTFLAGS) -pipe \
+ 		   -fexceptions
  BIN_CFLAGS	:= -fPIE -DPIE
  LIB_CFLAGS	:= -fPIC
- SHARED_FLAGS	:= -shared
 -- 
 2.25.1
 
diff --git a/meta-oe/recipes-support/multipath-tools/files/0005-RH-add-mpathconf.patch b/meta-oe/recipes-support/multipath-tools/files/0005-RH-add-mpathconf.patch
index c6089612b..36a7d4774 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0005-RH-add-mpathconf.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0005-RH-add-mpathconf.patch
@@ -1,7 +1,7 @@
-From 8f52504859704466667e042baf437c2b6272ffb9 Mon Sep 17 00:00:00 2001
+From 30b85a61d665137ed1bca0d3e3d011c72758a192 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 26 Nov 2018 09:55:12 +0800
-Subject: [PATCH 05/12] RH: add mpathconf
+Subject: [PATCH] RH: add mpathconf
 
 mpathconf is a program (largely based on lvmcomf) to help users
 configure /etc/multipath.conf and enable or disable multipathing.  It
@@ -29,10 +29,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  create mode 100644 multipath/mpathconf.8
 
 diff --git a/libmultipath/config.c b/libmultipath/config.c
-index 8a3a8f37..a40b41ab 100644
+index 3fbfcc85..fbaaca8c 100644
 --- a/libmultipath/config.c
 +++ b/libmultipath/config.c
-@@ -962,6 +962,7 @@ int _init_config (const char *file, struct config *conf)
+@@ -962,6 +962,7 @@ int init_config__ (const char *file, struct config *conf)
  		validate_pctable(conf->overrides, 0, file);
  	} else {
  		condlog(0, "/etc/multipath.conf does not exist, blacklisting all devices.");
diff --git a/meta-oe/recipes-support/multipath-tools/files/0006-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch b/meta-oe/recipes-support/multipath-tools/files/0006-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch
index 8df7de3b4..04160eaac 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0006-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0006-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch
@@ -1,7 +1,7 @@
-From f93248d8e3598ccdc42b6d639107917c9cda268c Mon Sep 17 00:00:00 2001
+From bd65cdc704666dd4153779c74cdbb2cac6efea71 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 26 Sep 2019 16:29:48 +0800
-Subject: [PATCH 06/12] RH: add wwids from kernel cmdline mpath.wwids with -A
+Subject: [PATCH] RH: add wwids from kernel cmdline mpath.wwids with -A
 
 This patch adds another option to multipath, "-A", which reads
 /proc/cmdline for mpath.wwid=<WWID> options, and adds any wwids it finds
@@ -27,7 +27,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  2 files changed, 45 insertions(+)
 
 diff --git a/libmultipath/wwids.c b/libmultipath/wwids.c
-index 591cd09b..b01f1b85 100644
+index aac18c04..68f8e373 100644
 --- a/libmultipath/wwids.c
 +++ b/libmultipath/wwids.c
 @@ -439,3 +439,47 @@ int unmark_failed_wwid(const char *wwid)
@@ -79,7 +79,7 @@ index 591cd09b..b01f1b85 100644
 +       return ret;
 +}
 diff --git a/libmultipath/wwids.h b/libmultipath/wwids.h
-index 0c6ee54d..e32a0b0e 100644
+index ee47ad9f..1ed0d85e 100644
 --- a/libmultipath/wwids.h
 +++ b/libmultipath/wwids.h
 @@ -17,6 +17,7 @@ int remember_wwid(char *wwid);
diff --git a/meta-oe/recipes-support/multipath-tools/files/0007-RH-warn-on-invalid-regex-instead-of-failing.patch b/meta-oe/recipes-support/multipath-tools/files/0007-RH-warn-on-invalid-regex-instead-of-failing.patch
index c64b8aeab..b435e6d67 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0007-RH-warn-on-invalid-regex-instead-of-failing.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0007-RH-warn-on-invalid-regex-instead-of-failing.patch
@@ -1,7 +1,7 @@
-From 49d0b0279f54ceb96878e8e72e828efbb84a534c Mon Sep 17 00:00:00 2001
+From 9f1075f82ecd39a9960f868eef890baf2ba36d4e Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Fri, 1 Mar 2024 11:45:10 +0800
-Subject: [PATCH 07/12] RH: warn on invalid regex instead of failing
+Subject: [PATCH] RH: warn on invalid regex instead of failing
 
 multipath.conf used to allow "*" as a match everything regular expression,
 instead of requiring ".*". Instead of erroring when the old style
@@ -23,7 +23,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 34 insertions(+), 6 deletions(-)
 
 diff --git a/libmultipath/dict.c b/libmultipath/dict.c
-index 5af036b7..e494419d 100644
+index a06a6138..a734ba9b 100644
 --- a/libmultipath/dict.c
 +++ b/libmultipath/dict.c
 @@ -189,6 +189,34 @@ set_str_noslash(vector strvec, void *ptr, const char *file, int line_nr)
@@ -61,7 +61,7 @@ index 5af036b7..e494419d 100644
  static int
  set_yes_no(vector strvec, void *ptr, const char *file, int line_nr)
  {
-@@ -1798,7 +1826,7 @@ ble_ ## option ## _handler (struct config *conf, vector strvec,		\
+@@ -1854,7 +1882,7 @@ ble_ ## option ## _handler (struct config *conf, vector strvec,		\
  	if (!conf->option)						\
  		return 1;						\
  									\
@@ -70,7 +70,7 @@ index 5af036b7..e494419d 100644
  	if (!buff)							\
  		return 1;						\
  									\
-@@ -1818,7 +1846,7 @@ ble_ ## option ## _ ## name ## _handler (struct config *conf, vector strvec, \
+@@ -1874,7 +1902,7 @@ ble_ ## option ## _ ## name ## _handler (struct config *conf, vector strvec, \
  	if (!conf->option)						\
  		return 1;						\
  									\
@@ -79,7 +79,7 @@ index 5af036b7..e494419d 100644
  	if (!buff)							\
  		return 1;						\
  									\
-@@ -1924,16 +1952,16 @@ device_handler(struct config *conf, vector strvec, const char *file,
+@@ -1980,16 +2008,16 @@ device_handler(struct config *conf, vector strvec, const char *file,
  	return 0;
  }
  
diff --git a/meta-oe/recipes-support/multipath-tools/files/0008-RH-reset-default-find_mutipaths-value-to-off.patch b/meta-oe/recipes-support/multipath-tools/files/0008-RH-reset-default-find_mutipaths-value-to-off.patch
index 1fa1f3be2..9ea255cbc 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0008-RH-reset-default-find_mutipaths-value-to-off.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0008-RH-reset-default-find_mutipaths-value-to-off.patch
@@ -1,7 +1,7 @@
-From fcba3e0d4c8448a2510025acb255c7335413bf56 Mon Sep 17 00:00:00 2001
+From 87e19d273c46fe78933627fc4e8046e3a76da47a Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 26 Nov 2018 11:12:01 +0800
-Subject: [PATCH 08/12] RH: reset default find_mutipaths value to off
+Subject: [PATCH] RH: reset default find_mutipaths value to off
 
 Upstream has changed to default find_multipaths to "strict". For now
 Redhat will retain the previous default of "off".
@@ -17,10 +17,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libmultipath/defaults.h b/libmultipath/defaults.h
-index 64b633f2..a06a8a41 100644
+index 02f7e57c..98dd66f7 100644
 --- a/libmultipath/defaults.h
 +++ b/libmultipath/defaults.h
-@@ -23,7 +23,7 @@
+@@ -24,7 +24,7 @@
  #define DEFAULT_NO_PATH_RETRY	NO_PATH_RETRY_UNDEF
  #define DEFAULT_VERBOSITY	2
  #define DEFAULT_REASSIGN_MAPS	0
diff --git a/meta-oe/recipes-support/multipath-tools/files/0009-multipath-tools-modify-create-config.mk-for-cross-co.patch b/meta-oe/recipes-support/multipath-tools/files/0009-multipath-tools-modify-create-config.mk-for-cross-co.patch
index 041b79a9a..661e38f68 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0009-multipath-tools-modify-create-config.mk-for-cross-co.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0009-multipath-tools-modify-create-config.mk-for-cross-co.patch
@@ -1,7 +1,7 @@
-From 7452549e572b1c40aefe25524bf4bbbf34c952e5 Mon Sep 17 00:00:00 2001
+From c22c897e7c55fc0b8c5bdd113a0357654ee895ae Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Tue, 4 Jun 2019 11:39:39 +0800
-Subject: [PATCH 09/12] multipath-tools: modify create-config.mk for
+Subject: [PATCH] multipath-tools: modify create-config.mk for
  cross-compilation
 
 Do not look for systemd info on the host, and allow us to pass in CFLAGS
@@ -21,7 +21,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/create-config.mk b/create-config.mk
-index 4d318b96..a65975ba 100644
+index 8bd2c20c..40d2446a 100644
 --- a/create-config.mk
 +++ b/create-config.mk
 @@ -127,10 +127,6 @@ ifeq ($(ENABLE_DMEVENTS_POLL),0)
diff --git a/meta-oe/recipes-support/multipath-tools/files/0010-Subject-PATCH-Always-use-devmapper.patch b/meta-oe/recipes-support/multipath-tools/files/0010-Always-use-devmapper.patch
similarity index 92%
rename from meta-oe/recipes-support/multipath-tools/files/0010-Subject-PATCH-Always-use-devmapper.patch
rename to meta-oe/recipes-support/multipath-tools/files/0010-Always-use-devmapper.patch
index b48720b8a..cf053680f 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0010-Subject-PATCH-Always-use-devmapper.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0010-Always-use-devmapper.patch
@@ -1,7 +1,7 @@
-From 5d2fa3c5975266a6c02214afa6254e6eeeb1baad Mon Sep 17 00:00:00 2001
+From c34c65a3f5ddec22cb417872f90c2c9540a1847b Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 26 Nov 2018 11:17:41 +0800
-Subject: [PATCH 10/12] Subject: [PATCH] Always use devmapper
+Subject: [PATCH] Always use devmapper
 
 Do not try to compute several _API_ make variables
 from host information when cross-compiling.
@@ -21,7 +21,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 8 insertions(+), 28 deletions(-)
 
 diff --git a/create-config.mk b/create-config.mk
-index a65975ba..8ba592f4 100644
+index 40d2446a..f5eb2803 100644
 --- a/create-config.mk
 +++ b/create-config.mk
 @@ -79,34 +79,14 @@ URCU_VERSION = $(shell \
diff --git a/meta-oe/recipes-support/multipath-tools/files/0011-fix-bug-of-do_compile-and-do_install.patch b/meta-oe/recipes-support/multipath-tools/files/0011-fix-bug-of-do_compile-and-do_install.patch
index abaea2cfb..0c5015142 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0011-fix-bug-of-do_compile-and-do_install.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0011-fix-bug-of-do_compile-and-do_install.patch
@@ -1,7 +1,7 @@
-From 949070286692dfff89213792571da233fe82e440 Mon Sep 17 00:00:00 2001
+From 698361847e6fae321bc277a5fc518b2bd55751b8 Mon Sep 17 00:00:00 2001
 From: Wang Mingyu <wangmy@cn.fujitsu.com>
 Date: Sun, 10 May 2020 21:22:53 +0800
-Subject: [PATCH 11/12] fix bug of do_compile and do_install
+Subject: [PATCH] fix bug of do_compile and do_install
 
 when multiple processes make run in parallel,
 because of dependency error will occur.
@@ -18,10 +18,10 @@ Upstream-Status: Pending
  1 file changed, 10 insertions(+)
 
 diff --git a/Makefile b/Makefile
-index 4df5f161..065249c2 100644
+index f06f7faa..690dc050 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -91,6 +91,16 @@ libmpathpersist libmpathvalid multipath multipathd: libmultipath
+@@ -94,6 +94,16 @@ libmpathpersist libmpathvalid multipath multipathd: libmultipath
  libmultipath/prioritizers libmultipath/checkers libmultipath/foreign: libmultipath
  mpathpersist multipathd:  libmpathpersist
  
diff --git a/meta-oe/recipes-support/multipath-tools/files/0012-add-explicit-dependency-on-libraries.patch b/meta-oe/recipes-support/multipath-tools/files/0012-add-explicit-dependency-on-libraries.patch
index 2f774940d..f47d8afe4 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0012-add-explicit-dependency-on-libraries.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0012-add-explicit-dependency-on-libraries.patch
@@ -1,7 +1,7 @@
-From 7a46f43682641436464579d8bf76c382e71ea557 Mon Sep 17 00:00:00 2001
+From 69ee17207574ca032c3cb46a3db99736de3eedf8 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 25 May 2020 23:22:55 -0700
-Subject: [PATCH 12/12] add explicit dependency on libraries
+Subject: [PATCH] add explicit dependency on libraries
 
 [snip]
 gcc/i686-overc-linux/10.1.0/ld: cannot find -lmpathpersist
@@ -24,10 +24,10 @@ Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/Makefile b/Makefile
-index 065249c2..0444c2ea 100644
+index 690dc050..b775f949 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -90,6 +90,7 @@ libmultipath: libmpathutil
+@@ -93,6 +93,7 @@ libmultipath: libmpathutil
  libmpathpersist libmpathvalid multipath multipathd: libmultipath
  libmultipath/prioritizers libmultipath/checkers libmultipath/foreign: libmultipath
  mpathpersist multipathd:  libmpathpersist
diff --git a/meta-oe/recipes-support/multipath-tools/files/multipathd.oe b/meta-oe/recipes-support/multipath-tools/files/multipathd.oe
old mode 100755
new mode 100644
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.9.8.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.10.0.bb
similarity index 96%
rename from meta-oe/recipes-support/multipath-tools/multipath-tools_0.9.8.bb
rename to meta-oe/recipes-support/multipath-tools/multipath-tools_0.10.0.bb
index 374cda3b4..a09fbb221 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.9.8.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.10.0.bb
@@ -41,15 +41,14 @@ SRC_URI = "git://github.com/opensvc/multipath-tools.git;protocol=https;branch=ma
            file://0007-RH-warn-on-invalid-regex-instead-of-failing.patch \
            file://0008-RH-reset-default-find_mutipaths-value-to-off.patch \
            file://0009-multipath-tools-modify-create-config.mk-for-cross-co.patch \
-           file://0010-Subject-PATCH-Always-use-devmapper.patch \
+           file://0010-Always-use-devmapper.patch \
            file://0011-fix-bug-of-do_compile-and-do_install.patch \
            file://0012-add-explicit-dependency-on-libraries.patch \
-           file://0001-libmultipath-always-use-glibc-basename.patch \
            "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
-SRCREV = "3daacfdfd110b24a3a7d5a276dcf8512b7039199"
+SRCREV = "ee3a70175a8a9045e5c309d5392300922e2a0625"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


