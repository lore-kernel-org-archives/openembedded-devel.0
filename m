Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58763C6FD1C
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 11:23:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6121.1678793002348697634
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Mar 2023 04:23:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=HGJcl7Mq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=243785f51c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32EBJWBC015792
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Mar 2023 04:23:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=bWbaztQyxztTiLbXK9v0BeqIooccSNuK4DZeN4MBR0U=;
 b=HGJcl7MqND0bthdMvq5PXkxdzRth2tBZQsFMUE0eH8ruoHbAuUPzRfWYtquAYlFvBr3C
 Gskx5SdW6DXgz+OrKsPBczQ2iQWVfXySyFge104IURoHI77MfxINF4Pw6BAhyQK9J+Sn
 L0U2M8oDgU71lewRpvgLTUWG9Mem1nakqDmCJ4HWp93Uxg8+YWcabj+kQRJoBAw1rd+m
 oIwK32bDdxXkNJQB9Pbi2EVBZlfhH70sP4RBfqFlNsabF9RMeJ8QCwEvNNIBwe+R2fqY
 wTQdNNpOCHdYxqFI6POEuZU961vVbKOKkpMfKUJsuCORKV4kuKc8p3ivXikvozi7P979 IA== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p8t1r2eh5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Mar 2023 04:23:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6hILCfEdTkQdnUcwRx/KUqQ+yIyB9G6AvDMS+7map/a3ydmXIu1IoxcTonglhzCsLBlJqr1MUH6tn2V9YUu+ZE40NHWq4oJEDZuG9SuvktSeE55pHgaukHJaVrc35mXhmUIEuxVFRc8qLOkztcCtHwkdgPh921emSbvqxnSbdnw7V1NL32G8I7M4chqBapSMYuTkGbrJJsJiNQKwx9E/tJt5aF0AhGnyot19HiZ29isLRY6vet2+Jtg5Qztk8nJ4kQWnDmPeHeq4UVd1x/Q5Um7rVOnp3bFca6ok7eAeQIwn6nD4YeOq/zVjsh98QolKFwNtxYW0yeEnqD/chlziQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bWbaztQyxztTiLbXK9v0BeqIooccSNuK4DZeN4MBR0U=;
 b=A9n5dugCJFCi9dlu7U+F09IfJUTYXoLnZpRqAYvI2K9EruPRj4aEHiARMrcrA0Hkx2nXwaafETttvhDE/ptxpPksPj3yDYWnPoXQTxxkmvUGZftD0ZeeQz8ZsPshYsGeKDVJ0KleUOX4MLl3DWf8C6tanbjkqYui5GIuXaI9zlsnkPUQu/f2Ld28+ljAjveie0GRlW/LYi56RrSxmt2g/aaQQlQxcd2RLea+XPzHUeLhvUjxKHowJxHVVHS6N5QOgsk+4NXBnlX3GOqkyQA4fmdzqr5QP68ym2EYXmlctzsFUbUIROWnf5KQh/ZMTFZBCiKx4Yp3HeshBqdNVyGyfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SA3PR11MB8024.namprd11.prod.outlook.com (2603:10b6:806:300::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 11:23:18 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3%6]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 11:23:18 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] libldb: upgrade 2.6.1 -> 2.7.1
Date: Tue, 14 Mar 2023 19:23:07 +0800
Message-Id: <20230314112308.2224997-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:a03:40::23) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|SA3PR11MB8024:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e577e54-a8d5-4025-b731-08db247e82b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ra7U/qOdOZmVz2Og8Zbm1qPxGtfJCMrA3gmOzE0rp46Dt6t0Lz70N0oYkjVzskQxxfAliaDX14wB0ze31xfge6r5leokRcI1czxJ41zxgkJon7b5c+Cvdmg7fcyh1bXCAum15rCB2sH8U+UJJtJ0071aqARf1xF1RLaKcaNalRMhJayBGb47/KkR1oKJOFzd++nrTF6Qy0ovKBJtVLdQgZ7m1W0yi/ZU3kwigWvtHEW3SHon7Kt9amn0adbR59Sz72FAv9jYJF9ZUb9UZDkq6Ztewep5oMryS83MKVbl59xdSB7BYlKUnH4vVQ2JiomqHiWFNYlTSM1ggorie5t9KHBUIwu58pnLDS3O9CFSh7VU8dKbSvuhUexqw+hnw02yaYteQCVqlTmkCkT4wH8t6RZ2Z1SyLxdrgZCib0tk/jlXsgXs48zNGT3H1Ka6853VFV3foc4IskgnAccG2ASkMs/RZGMoTa/xt6L1v8t3nJCvjbDdleVx3xOZRE2zqsBJF96GUwhiQpxs4GqmWnY1Az0UJ0+gDchnfbC+t3P6RdAtvncSXUI+dJs0vujQDlrDkGVJwuGvFqgWdil8OuCzYiwt/8+Yv+jq4IgPjuZIVNiqkhrYqKjZopVgJEFioCeXtPxFb1TLgzcDLZjT25/loJbLS9RcOUgTqQCrRKvA7Hfe6rQ4iniVlPxSPpcEDuwgYFRLCxwxNA1VWjLcXwrVfQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(136003)(346002)(396003)(376002)(366004)(451199018)(86362001)(36756003)(38100700002)(38350700002)(8936002)(8676002)(66476007)(66556008)(41300700001)(478600001)(6916009)(316002)(2906002)(5660300002)(44832011)(66946007)(2616005)(83380400001)(6486002)(26005)(53546011)(52116002)(6666004)(186003)(6512007)(1076003)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?X4vUdyETgHVLGczAXyayo0N9FsRJdIhxR5dI8nBP35hNyW3DW6LH3Y6Sh386?=
 =?us-ascii?Q?io998x3pYdmesIOIz+0lERcMmqNbXS3Bhwetd0AiWeKlHf1aR1rvG+hfMg1n?=
 =?us-ascii?Q?A8PqiUS8PT9A2IIjpwhLa4nkXnZ0657H1rsEZZTQYAvu+YMBmCBgCqEd2+ej?=
 =?us-ascii?Q?/HratD6o42hYq40otV7LxD/ihLybL9UhJDmWn4keabOBf+5FlkmHtxCoW16O?=
 =?us-ascii?Q?SjoqsbZnYHeR2/X8Y5IvoPkTYmfGYuL5UYhQ2615Rm5RJiDmz70mCzHYP9HY?=
 =?us-ascii?Q?lz5jYOo756XvqDwDvCX4Rd6VxsaPzE4isFf4JY89TNdI2n6fZXxQIYZ4EiGB?=
 =?us-ascii?Q?vGdnijyEWPMp3xzlzUFvSAQ1ejfbMPIkIjSLLQiEwdTUkDpt6pH2zxVWb09s?=
 =?us-ascii?Q?fRDczF9j7Sqa3Gvp+GKabjR1p76j+pBo/F37lQxDz+7f69HNB4VzDr/zwT8k?=
 =?us-ascii?Q?+bqez5tiCA2FsCUKv+gQa05oILwTsyEPRVMqTIzqpB62SUr+bdqbU0vo7QTh?=
 =?us-ascii?Q?tJjSBFva6WMLwxMKGqdNeTyw9q01xSP5WuE0/iusG0NAlWofZrubMgCBjhV3?=
 =?us-ascii?Q?zCAERdeezsUi7AsqeuserNsCn983WOObai7t5TPbwW2ui2qMANXM6sjmvODu?=
 =?us-ascii?Q?HF7gX9MHyplCJoX4ElPSMlq0d/xd3CTBYqInM/kgK2yDikSgepp3ryOgW++E?=
 =?us-ascii?Q?wXSrDCD34k65Cxuz0jc+8RbVdTTlJ+mHa2jiDJV8otA0MM+utG63vZarRtuY?=
 =?us-ascii?Q?YvfE/41+/zOqZ7xoGRSPokZ57Pzvpw/LcJuCcCDwQXSrL1wlWvXF54eqTYrC?=
 =?us-ascii?Q?9JHQlQT+/Y3Qtf9IYfJPbyley5KaAT95oOQWDMvrRCYUCmWqb3CDXgCPBfHW?=
 =?us-ascii?Q?BsPE2tjaDpcPkSHXWoI2ZLE+W+hxJsB8/TAGwu8lERiE2VrY6xmK+MZdwzdQ?=
 =?us-ascii?Q?q89EMxspbhs8dHMSwJSMW+VdMdu1BbLwvWI1ho75EDk/PJKPwg8BJSU5lp1t?=
 =?us-ascii?Q?Uxi2Ezl2CL/2ml/fP5QInKLlJte2U9J5sAeGuD8tVW5mncaWEjPmhjCdEB2q?=
 =?us-ascii?Q?Uj5LOXM9sUoyaMZ2SJuhJSh714/g/NXV3Wx7smws5rEJKM/Qyrvv9+AfwUFh?=
 =?us-ascii?Q?r5jr4sxTa8jzi45RJKXxBXHlqL6+je7VIoqeIymL6kMowpnFcR2cm09Z0bgS?=
 =?us-ascii?Q?D4KCijelrzpnj10CbdQy5r8fJXpKY4OrpVBcJPgcRN/kLGQSrwsX41vQ7P2u?=
 =?us-ascii?Q?7bt4bspadGQGBeX7RI/BmEyhpoMsesA9lRCoKbFpqH47/je9zXQikPxFwTvh?=
 =?us-ascii?Q?Gt9b0n/eMvofPEC+d8oW8DNnhrpzTiYrIdSOza4IFEgDbp7aXu+sgjUtAl0u?=
 =?us-ascii?Q?L24y5kv4OKdMKkOugEaWoOtRZoQFIW2VqB6gCF+sTleA8Ma2SNK2vEp+4/m3?=
 =?us-ascii?Q?UTNMbX+sDafVlWke+LIeM9zaw6gf791UCg9mdfhNwuAoO4kATWDyL4HKFqvf?=
 =?us-ascii?Q?u5mv7mzth6VcQGzxmGNTWwyOY/ZF8TPCr8hUVZXVIujMeI0tMZlD0FErJ5+P?=
 =?us-ascii?Q?aECOEMsVro/53i+33XPIgLWqyNTsA4Sq5Gw/VL3/?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e577e54-a8d5-4025-b731-08db247e82b4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 11:23:18.3403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QuzBc70cvLWKOb9u4aB9K+qqL4pCpSLZLkEcYailt9vbIUcXGX1x3J/if3DW0D0zeKBngh/fiDwsj+dTGuKncw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8024
X-Proofpoint-ORIG-GUID: 1wT2v8XXCwZMM-x1JORc-JpsFI8gm-xs
X-Proofpoint-GUID: 1wT2v8XXCwZMM-x1JORc-JpsFI8gm-xs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_05,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxlogscore=918
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303140097
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Mar 2023 11:23:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101517

Refresh 0002-ldb-Add-configure-options-for-packages.patch

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...02-ldb-Add-configure-options-for-packages.patch | 14 +++++++-------
 .../libldb/{libldb_2.6.1.bb => libldb_2.7.1.bb}    |  4 ++--
 2 files changed, 9 insertions(+), 9 deletions(-)
 rename meta-networking/recipes-support/libldb/{libldb_2.6.1.bb => libldb_2.7.1.bb} (95%)

diff --git a/meta-networking/recipes-support/libldb/libldb/0002-ldb-Add-configure-options-for-packages.patch b/meta-networking/recipes-support/libldb/libldb/0002-ldb-Add-configure-options-for-packages.patch
index 988931c49..4b74a877b 100644
--- a/meta-networking/recipes-support/libldb/libldb/0002-ldb-Add-configure-options-for-packages.patch
+++ b/meta-networking/recipes-support/libldb/libldb/0002-ldb-Add-configure-options-for-packages.patch
@@ -1,4 +1,4 @@
-From b4e04e5dd13c9de8b336f7d0c254973a225e3b5f Mon Sep 17 00:00:00 2001
+From acd3985f9c428882f1b731a6f9ce5cb1a4a3a02c Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 1 Jul 2019 16:14:16 +0800
 Subject: [PATCH] ldb: Add configure options for packages
@@ -26,7 +26,7 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  2 files changed, 78 insertions(+), 20 deletions(-)
 
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index 4c774d9..63c9967 100644
+index 5c2b750..a38baae 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
 @@ -25,6 +25,41 @@ def options(opt):
@@ -71,7 +71,7 @@ index 4c774d9..63c9967 100644
  @Utils.run_once
  def configure(conf):
      conf.RECURSE('buildtools/wafsamba')
-@@ -35,12 +70,25 @@ def configure(conf):
+@@ -38,12 +73,25 @@ def configure(conf):
      conf.DEFINE('HAVE_LIBREPLACE', 1)
      conf.DEFINE('LIBREPLACE_NETWORK_CHECKS', 1)
  
@@ -98,10 +98,10 @@ index 4c774d9..63c9967 100644
 +    if Options.options.enable_libcap:
 +        conf.CHECK_HEADERS('sys/capability.h')
 +
-     conf.CHECK_HEADERS('port.h')
      conf.CHECK_HEADERS('sys/fcntl.h sys/filio.h sys/filsys.h sys/fs/s5param.h')
      conf.CHECK_HEADERS('sys/id.h sys/ioctl.h sys/ipc.h sys/mman.h sys/mode.h sys/ndir.h sys/priv.h')
-@@ -110,8 +158,9 @@ def configure(conf):
+     conf.CHECK_HEADERS('sys/resource.h sys/security.h sys/shm.h sys/statfs.h sys/statvfs.h sys/termio.h')
+@@ -113,8 +161,9 @@ def configure(conf):
      conf.CHECK_HEADERS('sys/fileio.h sys/filesys.h sys/dustat.h sys/sysmacros.h')
      conf.CHECK_HEADERS('xfs/libxfs.h netgroup.h')
  
@@ -113,7 +113,7 @@ index 4c774d9..63c9967 100644
      conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
      conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
      conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
-@@ -434,20 +483,21 @@ def configure(conf):
+@@ -436,20 +485,21 @@ def configure(conf):
  
      strlcpy_in_bsd = False
  
@@ -150,7 +150,7 @@ index 4c774d9..63c9967 100644
      conf.CHECK_CODE('''
                  struct ucred cred;
 diff --git a/wscript b/wscript
-index 60bb7cf..7f14847 100644
+index 03076e6..5365408 100644
 --- a/wscript
 +++ b/wscript
 @@ -40,6 +40,14 @@ def options(opt):
diff --git a/meta-networking/recipes-support/libldb/libldb_2.6.1.bb b/meta-networking/recipes-support/libldb/libldb_2.7.1.bb
similarity index 95%
rename from meta-networking/recipes-support/libldb/libldb_2.6.1.bb
rename to meta-networking/recipes-support/libldb/libldb_2.7.1.bb
index 7c7701acc..d13bd37cc 100644
--- a/meta-networking/recipes-support/libldb/libldb_2.6.1.bb
+++ b/meta-networking/recipes-support/libldb/libldb_2.7.1.bb
@@ -35,8 +35,8 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
                     file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
                     file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
 
-SRC_URI[md5sum] = "3a5f54f511fb237b83e1f34e2c7e25cd"
-SRC_URI[sha256sum] = "467403f77df86782c3965bb175440baa2ed751a9feb9560194bd8c06bf1736c9"
+SRC_URI[md5sum] = "e443a8da17758479c3b5c542e8e3ff1a"
+SRC_URI[sha256sum] = "c4632c9a7f81f8a45ed46fc14d18eb507edf4e79f6e88d16977478ef95ed5b7f"
 
 inherit pkgconfig waf-samba
 
-- 
2.25.1


