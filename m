Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 218BFC54798
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 16:13:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.16453.1708704816743884405
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Feb 2024 08:13:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=F7FtFlzB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=27833f607c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41N7K27q020576
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 08:13:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=4e9g6rxP03m9t2Zxuh
	oeOo6DvZ//+3lLT8rNm+NzF78=; b=F7FtFlzBrbGHlHOAR+8DGMxj/6UAFwMsRg
	3Jf3Ax23D2EPsULWBnP5zThb8K+7NzwLoj/Rnm4Fz3Fx7KaAaG1LeO64rGbciJ9m
	w+GTREKmKH41ZLSFeHDSL7nV4jK4QkXILe/PBa6OCKzkItVF5cTFY2Z0G0nRzq+T
	TNVg59Lo+Q4DRO60plhnSkL+71jUvPFl6vvoNk0w+Oo8Be2VUIdfflYD/BeFlZ2f
	LEbWuf/arTVhq01bq9IIasX7DQHrjDU0B+02ILgOW0Ck4cxv82zrPCebv3RSMGm5
	RFnSBA/dCm8KunpmR48or1dmh/WQ5S10QVdTuYqePsfYKcHwYb4Q==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wd20ckb66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 08:13:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ei1B/H3ltDh4UlFDmDb9cBfwI1pE96Ep6SsugWo0PsH04Whbs+qaVK2rKRUKg4ipl3BuWiA4KObbOJKiCEx0ExYGoCEi8eQ9t2fYuxpEjL/zhJ+Pjlwo+Mtyl18S3pkF5d+DOHX3coOSoCaYIaQjJqGctsblvnHqzen+MEfEVUTv2p8eyei4VvTlN3zoD+7HM3f9Mpy+OQ0M1YZlYztyH+6fVlA9vbAr0BEsow6uEJ3QBy/3sJa+8GokHMaVgG7C03CSHH2hF5R+fY8pGeGAeveeJljf8BlOhxz2EfsezP7ahH87DhABqz7PVVp9/EnxmNyOzJIqGBPdwS2us1qTMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4e9g6rxP03m9t2ZxuhoeOo6DvZ//+3lLT8rNm+NzF78=;
 b=CE39/KG4cstBZPsrJN9Qu3YXyO6x/nGriM0pO13tMORZUaelh83Snix/srlbTKOA3HvkzKWmIyPhsDfukBm4ttTXsKKp8h48SQv0fbTo8nCAsOfmoD7UAGdGUW5nerh9IQEBBQsQsI2B9o/ZqVZLlT0bYl4ojxzC5vTm1NFN8P5kbCAePJr7Ee6tSt1DrseydUjKV3jeiPB7NBhCH9XqyUOncZZFSMPmE6xpRhIC/5kiY0cY6R1hlUaTQTPJyxymUIHVjxiTGqcJmzAFSXUQ4ceaedgOWYhSzyGrE0Js+oNRJcdiv+S7kxLeK7dP/4QVV7qqDmrrsb0IRS5FAgD7QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by DM4PR11MB5246.namprd11.prod.outlook.com (2603:10b6:5:389::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Fri, 23 Feb
 2024 16:13:34 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::3639:15d2:da14:44b9]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::3639:15d2:da14:44b9%7]) with mapi id 15.20.7292.036; Fri, 23 Feb 2024
 16:13:33 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] audit: upgrade 3.1.2 -> 4.0
Date: Sat, 24 Feb 2024 00:13:22 +0800
Message-Id: <20240223161322.1469137-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:4:197::21) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|DM4PR11MB5246:EE_
X-MS-Office365-Filtering-Correlation-Id: ccc6971f-8806-4238-000c-08dc348a6213
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yQqZM7XOlyA5xY0CIjVaDaDO04IH9etsUuqT9aCpPTazmfn8/27z7zALNJLP44NY6SajTpivzTeiUtDqba8wt5pQxea2Kx/Bamp0Wyjf7hh24iWTFo9VvWIMeVGjmE3KnLlIi9h7vm8dAE11zDcJazIKZHW9Y0+6z979oT+rPheeDnfDEDo7LdA3jE8TSzBba6kZA6aDDR94uJTmoZ+go+6wscMNz08JFHU1D3dOwhHsS3yqH7O6Tr6NSmOoYlvqkjTPyumt+Sg/SK/O5S90xpG94CIU7PEqHlZZS/8klOg+HPD8lhH0aEzqo3uZH5Xbm23lPxPbsbWEx5Jh1u1rgL/jwog8sdKBnyTFmTbvVL6IJlTgcepnflGQRjM2dB8cHCkMexkH3HsCCLEVotRFDvRL/fmguk/1MzEkHccGKGytP7GMkMW6FIYNiclqXcGiIO+YrPGU+nMBJRNKi3pF3Ip4EL9VlDeW6sPQ6tfkvTNc6SGSnuCUduuGYlRYprlqarFxQH3OwUiVKxCAF7E/4p0osFgMVrzSg1pCQpvimbjlABGGgTmTrdT62UPjkG2z3IhiaIT329XFApPfTNK5mMdX2hGM4mkcp7UwJWmB33k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?asR5dsAJvPRtEvKSxw415H2kKlnFNACULNhK/cmLnZkSdO2vLRs5EyginmY8?=
 =?us-ascii?Q?F8JOcGoo8fsUBj32LCYeXjLvTTH6WtsRRNQ63+uHXzM9mypt57ypzoxZp0kh?=
 =?us-ascii?Q?ZBKVZFU56o4InkF7Hk7AbXAtGyCD6ws/esCs/zbLgaNAHTjT6+Bsf/2rppK3?=
 =?us-ascii?Q?nG2KpmAhnMEumzRYexM4eTQahd5+sDEIO/dPXWdgzyI6Fd3BURwI+2XZOmxk?=
 =?us-ascii?Q?jcJQSb5T/+QswMjyxdHRUMk2OIQnm0/oLrOj8JumYfUZzO/CRKGgIFca/mAs?=
 =?us-ascii?Q?NsFgB35zXOd/8UbWk8bvc7hY888GdybqrMaqRhk3aHAROlvQmTqnOidBqvhc?=
 =?us-ascii?Q?q8bqryeC4PfgV2Uvt1Wp3yDb+nKLM9/xpgVK3LRaFW/PYSZAI2jikglM0jnw?=
 =?us-ascii?Q?UxbB3eVoLpgzKuKMXLNcgL5qn2ISp0FKE/E0099HMCoavj3E2sVSKOfG0Wht?=
 =?us-ascii?Q?TVnGkNgiVw+CEXg7QDEBFMK1We2Cvleo7YVSrPmtZp3CrRsqcXbVvKGHEJay?=
 =?us-ascii?Q?3JU/us9bmH12eoU+JmJnfL0OzOz2I+GlPayuOA77MM1OgeM8uJfogcB5g7/M?=
 =?us-ascii?Q?yS3VSGg+0p0kdfK5Yt072wBillOqB2d8AtPgB98xujkYJb02BtjUQQNS+zk6?=
 =?us-ascii?Q?HEdNTOTwYdir3YPKVNe4wHaRF3YugEskRexIezUt09djtzSsoENf0lBHlImR?=
 =?us-ascii?Q?LKueYhtXIg5yNK6/i/euvnYyH+O80d7kMXGI/pI3Tt2Y4erYVjg56/Wi+REG?=
 =?us-ascii?Q?GwiHPQ+ft9QU3hPS6XwJ9eyPj8z7SVv49Pc19T/m54z2lk1E1DzBk90oMAMu?=
 =?us-ascii?Q?OPWxX7ilCxnI0rgyMoW2hoPGvORFb3ZNx76wdWyH2Q/PQVk9QXVcItxpInKS?=
 =?us-ascii?Q?LhEmAhSk+x3jzsitme6CUO/xUjjGIxbXpWT/346CUfJU0248QzpFU8ezZ+SO?=
 =?us-ascii?Q?6892hT3gKcg2FxIMxgFSpxOYuhADLvKz3VYGTs2sAngOPKqJr0bvwDos+omq?=
 =?us-ascii?Q?pYyXOnA0OOxQNxLDogHVz59KtWBx+yH73zFU0La21ZZPUs7anPte4eeFqCkK?=
 =?us-ascii?Q?vAnlOyEH4+emq6p6PvF8uDZRE3qiq2RoOO3oir7Yr8CvdMBUQp1a5pvs5Lht?=
 =?us-ascii?Q?NxEP7fl9zMOfRCaZhVwZfLoOUcd8U1+fb+LJxq+4t8ucBQHoXr6rZ7kE6AcV?=
 =?us-ascii?Q?FlWWCD7JG8ctNurKTn3PvUm/b/KmZACVRv9JLcoqhPsaPF1/i519tyIwTEu0?=
 =?us-ascii?Q?vLFNeh/thvLPOB7PAWi1/SrSMBy1AX2Pflmq9Ew+HuV/09Zqryr6c1f/IS4R?=
 =?us-ascii?Q?S73si+FVBqtnfVs+QxSno6gbEP6SBH7vSN9/VpIPjDCO9yIlDy4hi4QpbK0E?=
 =?us-ascii?Q?iSRk/9YcN8Ookaxu3eOFeM+GHkMprib2XR2XxUTcuHo4hM9PiJTbSKyXnDdN?=
 =?us-ascii?Q?48yYYuvmFqiPgDRXnRoz5vUBVcz90aT41rsh6qax7Xu8+uqH4w1OwHcPDh0K?=
 =?us-ascii?Q?CFSQIgR1Zmk20zx4vsudwpN4lPfz5MA3gCQw7YLunMLm2CTL3GMtNDMijkyM?=
 =?us-ascii?Q?P+taPmOUbV3slLeiERsc/IJiP269mgCpe5JoewFh?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc6971f-8806-4238-000c-08dc348a6213
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2024 16:13:33.8769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EU0Zg4Ci6zHN1yl++NznWwF712E/bpLrrKStytPLjZIgrxiwWSrXJdZD4APXb78U3VU8i9EeJH4CtzpNfPmPFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5246
X-Proofpoint-GUID: YBGgazICx8ElF822rnPM7ZtFcywFp1jh
X-Proofpoint-ORIG-GUID: YBGgazICx8ElF822rnPM7ZtFcywFp1jh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-23_02,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1011 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402230117
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 16:13:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109012

ChangeLog:
https://github.com/linux-audit/audit-userspace/releases/tag/v4.0
Major changes:
  Separate loading rules and logging events into separate services,
  audit-rules.service and auditd.service.
  Drop support for python2 and SysVinit.
  The auvirt and autrace programs have been dropped.
  The syscall and interpretation tables have been updated for the 6.8
  kernel.

* Backport patch to fix build error with musl
* Clean up configure options
* Use its own systemd service files
* Refresh patches
* Fix indentation

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-Fixed-swig-host-contamination-issue.patch |  16 +--
 ...te_malloc__-with-__attribute__-__ma.patch} |  24 +++-
 .../0002-Add-attribute-declarations.patch     |  35 ++++++
 .../audit/audit/auditd.service                |  28 -----
 meta-oe/recipes-security/audit/audit_3.1.2.bb | 116 ------------------
 meta-oe/recipes-security/audit/audit_4.0.bb   | 103 ++++++++++++++++
 6 files changed, 165 insertions(+), 157 deletions(-)
 rename meta-oe/recipes-security/audit/audit/{0002-Replace-__attribute_malloc__-with-__attribute__-__ma.patch => 0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch} (54%)
 create mode 100644 meta-oe/recipes-security/audit/audit/0002-Add-attribute-declarations.patch
 delete mode 100644 meta-oe/recipes-security/audit/audit/auditd.service
 delete mode 100644 meta-oe/recipes-security/audit/audit_3.1.2.bb
 create mode 100644 meta-oe/recipes-security/audit/audit_4.0.bb

diff --git a/meta-oe/recipes-security/audit/audit/0001-Fixed-swig-host-contamination-issue.patch b/meta-oe/recipes-security/audit/audit/0001-Fixed-swig-host-contamination-issue.patch
index 5f2ecc141..f2755d5c0 100644
--- a/meta-oe/recipes-security/audit/audit/0001-Fixed-swig-host-contamination-issue.patch
+++ b/meta-oe/recipes-security/audit/audit/0001-Fixed-swig-host-contamination-issue.patch
@@ -1,4 +1,4 @@
-From 9a32d42dfc6713fd0085dd4563a934afc30ec097 Mon Sep 17 00:00:00 2001
+From 5cdc667aeb7a014cdc1f8c7df8f8080408773dbe Mon Sep 17 00:00:00 2001
 From: Li xin <lixin.fnst@cn.fujitsu.com>
 Date: Sun, 19 Jul 2015 02:42:58 +0900
 Subject: [PATCH] Fixed swig host contamination issue
@@ -19,7 +19,7 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/bindings/swig/python3/Makefile.am b/bindings/swig/python3/Makefile.am
-index 6131e80d..2fb7207b 100644
+index c2c6def4..bcc2836c 100644
 --- a/bindings/swig/python3/Makefile.am
 +++ b/bindings/swig/python3/Makefile.am
 @@ -23,6 +23,7 @@
@@ -28,9 +28,9 @@ index 6131e80d..2fb7207b 100644
  AM_CPPFLAGS = -I. -I$(top_builddir) -I${top_srcdir}/lib $(PYTHON3_INCLUDES)
 +STDINC ?= /usr/include
  LIBS = $(top_builddir)/lib/libaudit.la
- SWIG_FLAGS = -python -py3 -modern
+ SWIG_FLAGS = -python
  SWIG_INCLUDES = -I. -I$(top_builddir) -I${top_srcdir}/lib $(PYTHON3_INCLUDES)
-@@ -37,7 +38,7 @@ _audit_la_DEPENDENCIES =${top_srcdir}/lib/libaudit.h ${top_builddir}/lib/libaudi
+@@ -37,7 +38,7 @@ _audit_la_DEPENDENCIES =${top_srcdir}/lib/audit_logging.h ${top_builddir}/lib/li
  _audit_la_LIBADD = ${top_builddir}/lib/libaudit.la
  nodist__audit_la_SOURCES  = audit_wrap.c
  audit.py audit_wrap.c: ${srcdir}/../src/auditswig.i 
@@ -40,18 +40,18 @@ index 6131e80d..2fb7207b 100644
  CLEANFILES = audit.py* audit_wrap.c *~
  
 diff --git a/bindings/swig/src/auditswig.i b/bindings/swig/src/auditswig.i
-index 9a2c5661..6cbb7295 100644
+index 6b267844..5a4e442f 100644
 --- a/bindings/swig/src/auditswig.i
 +++ b/bindings/swig/src/auditswig.i
-@@ -43,7 +43,7 @@ typedef unsigned uid_t;
-  * generating setters against them: https://github.com/swig/swig/issues/1699
+@@ -50,7 +50,7 @@ typedef unsigned uid_t;
   */
  %ignore audit_rule_data::buf;
+ 
 -%include "/usr/include/linux/audit.h"
 +%include "../lib/audit.h"
  #define __extension__ /*nothing*/
  %include <stdint.i>
- %include "../lib/libaudit.h"
+ %include "../lib/audit-records.h"
 -- 
 2.25.1
 
diff --git a/meta-oe/recipes-security/audit/audit/0002-Replace-__attribute_malloc__-with-__attribute__-__ma.patch b/meta-oe/recipes-security/audit/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch
similarity index 54%
rename from meta-oe/recipes-security/audit/audit/0002-Replace-__attribute_malloc__-with-__attribute__-__ma.patch
rename to meta-oe/recipes-security/audit/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch
index 7f0af74a8..b1f324f22 100644
--- a/meta-oe/recipes-security/audit/audit/0002-Replace-__attribute_malloc__-with-__attribute__-__ma.patch
+++ b/meta-oe/recipes-security/audit/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch
@@ -1,4 +1,4 @@
-From 679cb57fa93984fed345dd3890cdbcbaa24e8518 Mon Sep 17 00:00:00 2001
+From 88c9b2c5cebebf13f90890baebbadc60d9fe8d16 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 9 Aug 2022 23:57:03 -0700
 Subject: [PATCH] Replace __attribute_malloc__ with __attribute__((__malloc__))
@@ -14,14 +14,28 @@ Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- auparse/auparse.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ audisp/plugins/remote/queue.h | 2 +-
+ auparse/auparse.h             | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
 
+diff --git a/audisp/plugins/remote/queue.h b/audisp/plugins/remote/queue.h
+index 36b70d04..031507dc 100644
+--- a/audisp/plugins/remote/queue.h
++++ b/audisp/plugins/remote/queue.h
+@@ -53,7 +53,7 @@ void q_close(struct queue *q);
+  * On error, return NULL and set errno. */
+ struct queue *q_open(int q_flags, const char *path, size_t num_entries,
+ 		     size_t entry_size)
+-	__attribute_malloc__ __attr_dealloc (q_close, 1) __wur;
++	__attribute__((__malloc__)) __attr_dealloc (q_close, 1) __wur;
+ 
+ /* Add DATA to tail of Q. Return 0 on success, -1 on error and set errno. */
+ int q_append(struct queue *q, const char *data);
 diff --git a/auparse/auparse.h b/auparse/auparse.h
-index 5cb7402e..39156eff 100644
+index c27f1ff9..87c52965 100644
 --- a/auparse/auparse.h
 +++ b/auparse/auparse.h
-@@ -54,7 +54,7 @@ typedef void (*auparse_callback_ptr)(auparse_state_t *au,
+@@ -55,7 +55,7 @@ typedef void (*auparse_callback_ptr)(auparse_state_t *au,
  void auparse_destroy(auparse_state_t *au);
  void auparse_destroy_ext(auparse_state_t *au, auparse_destroy_what_t what);
  auparse_state_t *auparse_init(ausource_t source, const void *b)
diff --git a/meta-oe/recipes-security/audit/audit/0002-Add-attribute-declarations.patch b/meta-oe/recipes-security/audit/audit/0002-Add-attribute-declarations.patch
new file mode 100644
index 000000000..349142580
--- /dev/null
+++ b/meta-oe/recipes-security/audit/audit/0002-Add-attribute-declarations.patch
@@ -0,0 +1,35 @@
+From 64cb48e1e5137b8a389c7528e611617a98389bc7 Mon Sep 17 00:00:00 2001
+From: Steve Grubb <ausearch.1@gmail.com>
+Date: Thu, 25 Jan 2024 15:14:51 -0500
+Subject: [PATCH] Add attribute declarations
+
+Upstream-Status: Backport
+[https://github.com/linux-audit/audit-userspace/commit/64cb48e1e5137b8a389c7528e611617a98389bc7]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ audisp/plugins/remote/queue.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/audisp/plugins/remote/queue.h b/audisp/plugins/remote/queue.h
+index 36b70d04..2c70e839 100644
+--- a/audisp/plugins/remote/queue.h
++++ b/audisp/plugins/remote/queue.h
+@@ -1,5 +1,5 @@
+ /* queue.h -- a queue abstraction
+- * Copyright 2009, 2011 Red Hat Inc., Durham, North Carolina.
++ * Copyright 2009, 2011 Red Hat Inc.
+  * All Rights Reserved.
+  *
+  * This library is free software; you can redistribute it and/or
+@@ -25,6 +25,7 @@
+ #define QUEUE_HEADER
+ 
+ #include <sys/types.h>
++#include "common.h"   // attribute decls
+ 
+ struct queue;
+ 
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-security/audit/audit/auditd.service b/meta-oe/recipes-security/audit/audit/auditd.service
deleted file mode 100644
index 06c63f0e5..000000000
--- a/meta-oe/recipes-security/audit/audit/auditd.service
+++ /dev/null
@@ -1,28 +0,0 @@
-[Unit]
-Description=Security Auditing Service
-DefaultDependencies=no
-After=local-fs.target systemd-tmpfiles-setup.service
-Before=sysinit.target shutdown.target
-Conflicts=shutdown.target
-ConditionKernelCommandLine=!audit=0
-
-[Service]
-Type=forking
-PIDFile=/run/auditd.pid
-ExecStart=/sbin/auditd
-## To use augenrules, uncomment the next line and comment/delete the auditctl line.
-## NOTE: augenrules expect any rules to be added to /etc/audit/rules.d/
-#ExecStartPost=-/sbin/augenrules --load
-ExecStartPost=-/sbin/auditctl -R /etc/audit/audit.rules
-# By default we don't clear the rules on exit.
-# To enable this, uncomment the next line.
-#ExecStopPost=/sbin/auditctl -R /etc/audit/audit-stop.rules
-
-### Security Settings ###
-MemoryDenyWriteExecute=true
-LockPersonality=true
-ProtectControlGroups=true
-ProtectKernelModules=true
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-oe/recipes-security/audit/audit_3.1.2.bb b/meta-oe/recipes-security/audit/audit_3.1.2.bb
deleted file mode 100644
index 7136ed6a4..000000000
--- a/meta-oe/recipes-security/audit/audit_3.1.2.bb
+++ /dev/null
@@ -1,116 +0,0 @@
-SUMMARY = "User space tools for kernel auditing"
-DESCRIPTION = "The audit package contains the user space utilities for \
-storing and searching the audit records generated by the audit subsystem \
-in the Linux kernel."
-HOMEPAGE = "http://people.redhat.com/sgrubb/audit/"
-SECTION = "base"
-LICENSE = "GPL-2.0-or-later & LGPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=master;protocol=https \
-           file://0001-Fixed-swig-host-contamination-issue.patch \
-           file://0002-Replace-__attribute_malloc__-with-__attribute__-__ma.patch \
-           file://auditd \
-           file://auditd.service \
-           file://audit-volatile.conf \
-"
-
-S = "${WORKDIR}/git"
-SRCREV = "572eb7d4fe926e7c1c52166d08e78af54877cbc5"
-
-inherit autotools python3targetconfig update-rc.d systemd
-
-UPDATERCPN = "auditd"
-INITSCRIPT_NAME = "auditd"
-INITSCRIPT_PARAMS = "defaults"
-
-SYSTEMD_PACKAGES = "auditd"
-SYSTEMD_SERVICE:auditd = "auditd.service"
-
-DEPENDS = "python3 tcp-wrappers libcap-ng linux-libc-headers swig-native python3-setuptools-native"
-
-EXTRA_OECONF = " --with-libwrap \
-        --enable-gssapi-krb5=no \
-        --with-libcap-ng=yes \
-        --with-python3=yes \
-        --libdir=${base_libdir} \
-        --sbindir=${base_sbindir} \
-        --without-python \
-        --without-golang \
-        --disable-zos-remote \
-        --with-arm=yes \
-        --with-aarch64=yes \
-        "
-
-EXTRA_OEMAKE = "PYLIBVER='python${PYTHON_BASEVERSION}' \
-	PYINC='${STAGING_INCDIR}/$(PYLIBVER)' \
-	pyexecdir=${libdir}/python${PYTHON_BASEVERSION}/site-packages \
-	STDINC='${STAGING_INCDIR}' \
-	pkgconfigdir=${libdir}/pkgconfig \
-	"
-
-SUMMARY:audispd-plugins = "Plugins for the audit event dispatcher"
-DESCRIPTION:audispd-plugins = "The audispd-plugins package provides plugins for the real-time \
-interface to the audit system, audispd. These plugins can do things \
-like relay events to remote machines or analyze events for suspicious \
-behavior."
-
-PACKAGES =+ "audispd-plugins"
-PACKAGES += "auditd ${PN}-python"
-
-FILES:${PN} = "${sysconfdir}/libaudit.conf ${base_libdir}/libaudit.so.1* ${base_libdir}/libauparse.so.*"
-FILES:auditd = "${bindir}/* ${base_sbindir}/* ${sysconfdir}/* ${datadir}/audit/*"
-FILES:audispd-plugins = "${sysconfdir}/audit/audisp-remote.conf \
-	${sysconfdir}/audit/plugins.d/au-remote.conf \
-	${sysconfdir}/audit/plugins.d/syslog.conf \
-	${base_sbindir}/audisp-remote \
-	${base_sbindir}/audisp-syslog \
-	${localstatedir}/spool/audit \
-	"
-FILES:${PN}-dbg += "${libdir}/python${PYTHON_BASEVERSION}/*/.debug"
-FILES:${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}"
-
-CONFFILES:auditd = "${sysconfdir}/audit/audit.rules"
-
-do_configure:prepend() {
-	sed -e 's|buf\[];|buf[0];|g'  ${STAGING_INCDIR}/linux/audit.h > ${S}/lib/audit.h
-	sed -i -e 's|#include <linux/audit.h>|#include "audit.h"|g' ${S}/lib/libaudit.h
-}
-
-do_install:append() {
-	sed -i -e 's|#include "audit.h"|#include <linux/audit.h>|g' ${D}${includedir}/libaudit.h
-
-	rm -f ${D}/${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.a
-	rm -f ${D}/${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.la
-
-	# reuse auditd config
-	[ ! -e ${D}/etc/default ] && mkdir ${D}/etc/default
-	mv ${D}/etc/sysconfig/auditd ${D}/etc/default
-	rmdir ${D}/etc/sysconfig/
-
-	# replace init.d
-	install -D -m 0755 ${WORKDIR}/auditd ${D}/etc/init.d/auditd
-	rm -rf ${D}/etc/rc.d
-
-	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-		# install systemd unit files
-		install -d ${D}${systemd_unitdir}/system
-		install -m 0644 ${WORKDIR}/auditd.service ${D}${systemd_unitdir}/system
-
-		install -d ${D}${sysconfdir}/tmpfiles.d/
-		install -m 0644 ${WORKDIR}/audit-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
-	fi
-
-	# audit-2.5 doesn't install any rules by default, so we do that here
-	mkdir -p ${D}/etc/audit ${D}/etc/audit/rules.d
-	cp ${S}/rules/10-base-config.rules ${D}/etc/audit/rules.d/audit.rules
-
-	chmod 750 ${D}/etc/audit ${D}/etc/audit/rules.d
-	chmod 640 ${D}/etc/audit/auditd.conf ${D}/etc/audit/rules.d/audit.rules
-
-	# Based on the audit.spec "Copy default rules into place on new installation"
-	cp ${D}/etc/audit/rules.d/audit.rules ${D}/etc/audit/audit.rules
-
-	# Create /var/spool/audit directory for audisp-remote
-	install -m 0700 -d ${D}${localstatedir}/spool/audit
-}
diff --git a/meta-oe/recipes-security/audit/audit_4.0.bb b/meta-oe/recipes-security/audit/audit_4.0.bb
new file mode 100644
index 000000000..c8ab0d880
--- /dev/null
+++ b/meta-oe/recipes-security/audit/audit_4.0.bb
@@ -0,0 +1,103 @@
+SUMMARY = "User space tools for kernel auditing"
+DESCRIPTION = "The audit package contains the user space utilities for \
+storing and searching the audit records generated by the audit subsystem \
+in the Linux kernel."
+HOMEPAGE = "http://people.redhat.com/sgrubb/audit/"
+SECTION = "base"
+LICENSE = "GPL-2.0-or-later & LGPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=master;protocol=https \
+           file://0001-Fixed-swig-host-contamination-issue.patch \
+           file://0002-Add-attribute-declarations.patch \
+           file://auditd \
+           file://audit-volatile.conf \
+          "
+
+SRC_URI:append:libc-musl = " file://0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch"
+
+S = "${WORKDIR}/git"
+SRCREV = "ae7d2830391c1115cebff6340ef3130b1b03ce45"
+
+inherit autotools python3targetconfig update-rc.d systemd
+
+UPDATERCPN = "auditd"
+INITSCRIPT_NAME = "auditd"
+INITSCRIPT_PARAMS = "defaults"
+
+SYSTEMD_PACKAGES = "auditd"
+SYSTEMD_SERVICE:auditd = "auditd.service audit-rules.service"
+
+DEPENDS = "python3 tcp-wrappers libcap-ng linux-libc-headers swig-native python3-setuptools-native coreutils-native"
+
+EXTRA_OECONF = " \
+        --with-libwrap \
+        --with-libcap-ng \
+        --with-python3 \
+        --with-arm \
+        --with-aarch64 \
+        --without-golang \
+        --disable-gssapi-krb5 \
+        --disable-zos-remote \
+        --sbindir=${base_sbindir} \
+        "
+
+EXTRA_OEMAKE = " \
+        PYTHON=python3 \
+        pythondir=${libdir}/python${PYTHON_BASEVERSION}/site-packages \
+        pyexecdir=${libdir}/python${PYTHON_BASEVERSION}/site-packages \
+        STDINC='${STAGING_INCDIR}' \
+        "
+
+SUMMARY:audispd-plugins = "Plugins for the audit event dispatcher"
+DESCRIPTION:audispd-plugins = "The audispd-plugins package provides plugins for the real-time \
+interface to the audit system, audispd. These plugins can do things \
+like relay events to remote machines or analyze events for suspicious \
+behavior."
+
+PACKAGES =+ "audispd-plugins"
+PACKAGES += "auditd ${PN}-python"
+
+FILES:${PN} = "${sysconfdir}/libaudit.conf ${libdir}/libau*.so.*"
+FILES:auditd = "${bindir}/* ${base_sbindir}/* ${sysconfdir}/* ${datadir}/audit-rules/* ${libexecdir}/*"
+FILES:audispd-plugins = "${sysconfdir}/audit/audisp-remote.conf \
+        ${sysconfdir}/audit/plugins.d/au-remote.conf \
+        ${sysconfdir}/audit/plugins.d/syslog.conf \
+        ${base_sbindir}/audisp-remote \
+        ${base_sbindir}/audisp-syslog \
+        ${localstatedir}/spool/audit \
+        "
+FILES:${PN}-dbg += "${libdir}/python${PYTHON_BASEVERSION}/*/.debug"
+FILES:${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}"
+
+CONFFILES:auditd = "${sysconfdir}/audit/audit.rules"
+
+do_configure:prepend() {
+    sed -e 's|buf\[];|buf[0];|g'  ${STAGING_INCDIR}/linux/audit.h > ${S}/lib/audit.h
+    sed -i -e 's|#include <linux/audit.h>|#include "audit.h"|g' ${S}/lib/libaudit.h
+}
+
+do_install:append() {
+    sed -i -e 's|#include "audit.h"|#include <linux/audit.h>|g' ${D}${includedir}/libaudit.h
+
+    # Install default rules
+    install -d -m 750 ${D}/etc/audit
+    install -d -m 750 ${D}/etc/audit/rules.d
+
+    install -m 0640 ${S}/rules/10-base-config.rules ${D}/etc/audit/rules.d/audit.rules
+
+    # Based on the audit.spec "Copy default rules into place on new installation"
+    install -m 0640 ${D}/etc/audit/rules.d/audit.rules ${D}/etc/audit/audit.rules
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -D -m 0644 ${WORKDIR}/audit-volatile.conf ${D}${sysconfdir}/tmpfiles.d/audit.conf
+    fi
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+        install -D -m 0755 ${WORKDIR}/auditd ${D}/etc/init.d/auditd
+        rm -rf ${D}${libdir}/systemd
+    fi
+
+    # Create /var/spool/audit directory for audisp-remote
+    install -d -m 0700 ${D}${localstatedir}/spool/audit
+}
-- 
2.25.1


