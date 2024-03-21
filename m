Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 660B9C54E68
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 12:02:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5698.1711022558968420573
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Mar 2024 05:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=P36ocgXu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=38100d7185=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42L7ohtf029661
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Mar 2024 05:02:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=u4ZnPO86kATS4kblB9
	snCybYgJnAii34eSXw/bdY3sQ=; b=P36ocgXuNi4Qs0g7SUOfuY/GRGWhy8+RKr
	Z/Lwg8QrHee/UCvGmVK3mxYxOGHK6XabqueyeMED+cwS0K8HLn8SgcMBgiFq+sM2
	SHwKxoINl6qZRv3eJv+Gi18z4FDo4NFfLgJAjTY5ZsGwxiGM+AGozJedXdcPQJDY
	/ys/HUKOd6r5mAVMPTjz/6nsbuNZBCFZq0Bv8DxFCxCWFK3+mfwYJsyfdY7D0UL+
	s6X14GYJqgs7Z2DWvq4vFchnBI+KVncxeVjZLoAIuamziCGqxGfBQf/htCECdbcJ
	DcVkkAxnEreSjRBsa7EeoIUYZ+L3gQZ1Vh1R4fOhUnR26ZQ6uxlA==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wwaxgcn65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Mar 2024 05:02:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n1xE8b1HTB5FKoKhbZqEIugFLrAXH0Ogc1uzq3Qu5af3E7i2voYPFZDxZJ4DrMoZNqiLb6snyOYvcNdmq2QEJJqRJCqduWANe4p847hkRnMURpBelN3EXoBsLoa6pJfGcSzkX4N1yay5HCQulHKpqNgxqrWsmCWkPWKV8AL+DKqdHO5Npf7XtZJRz/CUAVFGPtI69LsI7Pk4OoRbyrmI/u2Ex95S/vwxKlNZsOKj/k6OhoqXIfvg9ACmni2/sFKpqJSsiemeim2GUyUWu/hWEaHoG/0jldF7JLoDFrCdQ/bDD/qQMnZHNLgt1uuo+6lh8eD/u9V03ZlaYgG/8+GedA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u4ZnPO86kATS4kblB9snCybYgJnAii34eSXw/bdY3sQ=;
 b=GmuFKiFeFUmoTSbc294UkfLQPUVQZjNpeqk+riIeBEFUdOkf6LzZL3qRXMidoyuZ4rESWhE62IL5OoO30Bbt7cmLQKzm87bIKhAgIKSilYFoou0GsLXPEzm3QcnuZkR7VJ9tTG1MapAy8ffIOC0ei+LecyRCl9l4Uf0OfNd31dqh0LnkkGBzwRk/Q7qblr7ngesM+FhE9k8nNimLC5MY0kwr51hOZlOSR/3VcWCd+uVcq9Yxhet+E+TD0tDxlZw3iBj8at0tNrpqqoMTtwxgzAlfd5CQBxFRWInTBJnQw+t7uyc0H92bdztP3SqpLH1TyHDeS1OkAPrlVHX8NnTJ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by CH3PR11MB8344.namprd11.prod.outlook.com (2603:10b6:610:17f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13; Thu, 21 Mar
 2024 12:02:33 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558%6]) with mapi id 15.20.7409.010; Thu, 21 Mar 2024
 12:02:33 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] rocksdb: upgrade 7.9.2 -> 9.0.0
Date: Thu, 21 Mar 2024 20:02:21 +0800
Message-Id: <20240321120221.1731929-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:195::10) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|CH3PR11MB8344:EE_
X-MS-Office365-Filtering-Correlation-Id: b6ba0119-8dfd-433e-5017-08dc499eca62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YUDOarSyxqouA+UKMarUhVTL1sH18wa1cJjoZQeMFudpeRd6XYAONknutWBd4kQ0VTwHg74L8uQ9qhnS4nkDGQgWE6+mnCs3iF4g+qYb8ljmYcSobEV4+745v6aiggboiFTy4gAB8un9ycoR6ugl38pTF22h1tY2437WVhhiXCDnT3Dk8271C2telQGSkxhug3Sl+wkz2bQCrS2nWnR7xO9VmfUSwumckj8cdC4YMVixW+K6Tll7rH7OlmTTDYSH8BRHQKxmNcTrI3MidzAv2XckQXexKzh2HUadCapK4iirosy0kmWC4Z6DRNHpO1XqpPoTkw1puAfnOO6UfQvS3glY7oKZOLyI7L1oTDwIG164K8gsVMA6oFXiv/OL6fYChYLmxyr0iLdWQFoy5bJ1ZVvi57BFfSF+XkZCFCooqOL33Q2suKh8OcJaInyJZRieBHVl98Zo6XbqUfrfx6/p+Ipe7H30rxZ4dDNXJd7feww0D2fOs3yxffp9ccFagYYJyXAOZivgDXuSBMiqQVsphUgLgu3N4ZXNYFqg5Wt3stth7mpUS8gbl4jRxUw6/64Cj4y/TVXQxCA6NWGGdDR1YiZ5FSkDaisLUC8V3tp9qz7OLcb6IlQQ1uK7yFo7Kjgpxt4pOyjbz0AJbRhd3AVlIF22l0Q12YCROthur0B9TdU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(52116005)(376005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4HOLPYXgUH634IneOSN8ubOFSWaGGNFJmmTosj4XjHx0IlEJatPc3ZURLeGN?=
 =?us-ascii?Q?IUVapGreUjpWt6KsTvNpekTr20H0GxW6Q+8B0sjDXRJk4i+lb9HV5Rjpc2XF?=
 =?us-ascii?Q?rfftLEfFzaMh5XUo87Iwqq4yj9I5nQ/dnhcGXXk8lFAwWlc9j6g/pG5RvXn6?=
 =?us-ascii?Q?g7cALaYDnjWuhvwbRU9/CpeKHLdmycVlY/wRKVBS4EmM5aGy1ZPBGAgeteR9?=
 =?us-ascii?Q?ejR/7md+M5mY/Zkn6fncThx+Qj5Lm0y5uA5eFJb+IYZZB/7QH1nH17HMMbFQ?=
 =?us-ascii?Q?3vwXmlGsHOWkt9E7ucI78JEgrGV6Hsaq9H2tmpxwMGKVz5nzpXO84HEJtWUf?=
 =?us-ascii?Q?m21XCFnASvSELaVWDbZMbYmFqJrL4ep01OIylo9bfKkLsS6/3ug4cjr/+Q03?=
 =?us-ascii?Q?FRn+JDS55FJGzG8YekS94puj4KK7g6HrNvZRCFMJ1xyByfEElamwZ4h16RmM?=
 =?us-ascii?Q?4hjGzL0AIUoCcoa428pL8dKHa4r4FHkeTHdY7JycdXjLT8dCKlo+xQ9m/z1p?=
 =?us-ascii?Q?sGPgzci3Q7sHpNNUVTuqxFHt1JPfuyBNBBr9J13dDBtyXNu69XvLKk3StObr?=
 =?us-ascii?Q?ZhpUo344f/CEjaFZHvS+onx9wd3xANWWI81gnWuyDfBKAngoL50LlKQVT+6o?=
 =?us-ascii?Q?K7BJzDls3nATg8gkIVkfW3ePc9YR/fsp9eEXJzQlEckCtHrOu96mv/sHWl3m?=
 =?us-ascii?Q?T9FaBbjNr+SfuCg/0ejDpaIOdHJ2HUzSXQBgPuz6gOnzDpckh0074y+dvguv?=
 =?us-ascii?Q?9qO/JJ1TJW6zrx5+MODrN05iJob7xgk+K7HpcGfWDza+CqAok/OqZtgeyHcT?=
 =?us-ascii?Q?WXkyT7ivLum72cGLNtq2Z3NaBlsQKmH1z4nsc9H70zZvNqC9QIhSbURVVUn7?=
 =?us-ascii?Q?ToFo7nPo0dFg2MLwdxJie1yAiVLyiIw+4a5uaXOflz8Wo79S2tMggivsX/Bu?=
 =?us-ascii?Q?8ZVYk2FFhXPC1uObEtMs8/dRr+77PUiLbonfn2mPs4QdoEREjwDz/AVBV89B?=
 =?us-ascii?Q?i8joXS4GJkZQk+/ANfTjuJPP4wHQeac7M37pG2FhlYhDxNojKEyKnygKoXNA?=
 =?us-ascii?Q?PzMIDKZpJsmPILcx/m3RDoXY0jvUcaDykaXZ5lMnxCYJM5UmNplpvIaAHI6M?=
 =?us-ascii?Q?nUfplmhR1jYe4+40a403MCu2uYuM+6UvoY+sgnFT/Vb1F7XTUokUkYeNjgGC?=
 =?us-ascii?Q?cP3yIA5uxUK6JQz+KsyIpIROV3iR9yi4Rhx2pUNmsugVm/byLfDlvxnG1pDw?=
 =?us-ascii?Q?5NoMnvTuDnoeRYhzzdWJ7C8xlZ8OUgc4O9+6vAxq4S1NF526yjxmyhdXUaag?=
 =?us-ascii?Q?prElASrqqB+auPt4fSv2GMB39w5LugsiZh0xGtaHinLMSX/nEeKGOyAPyVjm?=
 =?us-ascii?Q?D9G+HcP7DjtVoh/lPKuVOrz7oilrFfe7CKn+tRqV+fKDsZMTF5LiH9VE4k/y?=
 =?us-ascii?Q?0wxq02Jc/eiT3omGfxxmPDP1gMAn6K2WAdlZ1DG6DW6+ArINg/uLZIrJo3hi?=
 =?us-ascii?Q?e1TEJ5O06wj9GBvky6nkgrFg+pn1FQprr+oo1CwOMBTD1PNsdOlNq65quJU+?=
 =?us-ascii?Q?B7QB1/peBkTyPCElnt2hsAsPoH3vebonqZbsGMgW?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6ba0119-8dfd-433e-5017-08dc499eca62
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 12:02:33.2537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: srcOfSdF+4G/knXgoX6zAIu4X/fcZYkS4QFqMjaV0oTFzWSynHQQD0cF0VR3jgfayajlz142wuX26NvJb65r3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8344
X-Proofpoint-GUID: 6qvdbwbppOBkAfgd48MeG_ezy4I3Ai_z
X-Proofpoint-ORIG-GUID: 6qvdbwbppOBkAfgd48MeG_ezy4I3Ai_z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-21_08,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2403140001
 definitions=main-2403210085
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Mar 2024 12:02:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109503

ChangeLog:
https://github.com/facebook/rocksdb/releases/tag/v9.0.0

* Refresh patches.
* Drop backport patch.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-missing-includes-cstdint-and-cstdio.patch | 70 -------------------
 ...1-cmake-Add-check-for-atomic-support.patch | 13 +++-
 ...-with-new-atomic-builtin-equivalents.patch | 11 ++-
 ...2-cmake-Use-exported-target-for-bz2.patch} | 13 ++--
 ...Do-not-add-msse4.2-mpclmul-on-clang.patch} |  8 +--
 ...04-Implement-support-for-musl-ppc64.patch} | 20 ++++--
 ...mer-implementation-for-mips-platform.patch | 32 +++++++++
 ... => 0006-Implement-timer-for-arm-v6.patch} | 18 ++++-
 meta-oe/recipes-dbs/rocksdb/files/mips.patch  | 20 ------
 .../{rocksdb_7.9.2.bb => rocksdb_9.0.0.bb}    | 19 +++--
 10 files changed, 103 insertions(+), 121 deletions(-)
 delete mode 100644 meta-oe/recipes-dbs/rocksdb/files/0001-Add-missing-includes-cstdint-and-cstdio.patch
 rename meta-oe/recipes-dbs/rocksdb/files/{0001-cmake-Use-exported-target-for-bz2.patch => 0002-cmake-Use-exported-target-for-bz2.patch} (74%)
 rename meta-oe/recipes-dbs/rocksdb/files/{0001-cmake-Do-not-add-msse4.2-mpclmul-on-clang.patch => 0003-cmake-Do-not-add-msse4.2-mpclmul-on-clang.patch} (87%)
 rename meta-oe/recipes-dbs/rocksdb/files/{ppc64.patch => 0004-Implement-support-for-musl-ppc64.patch} (55%)
 create mode 100644 meta-oe/recipes-dbs/rocksdb/files/0005-Implement-timer-implementation-for-mips-platform.patch
 rename meta-oe/recipes-dbs/rocksdb/files/{arm.patch => 0006-Implement-timer-for-arm-v6.patch} (64%)
 delete mode 100644 meta-oe/recipes-dbs/rocksdb/files/mips.patch
 rename meta-oe/recipes-dbs/rocksdb/{rocksdb_7.9.2.bb => rocksdb_9.0.0.bb} (82%)

diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-Add-missing-includes-cstdint-and-cstdio.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-Add-missing-includes-cstdint-and-cstdio.patch
deleted file mode 100644
index a177ce28b..000000000
--- a/meta-oe/recipes-dbs/rocksdb/files/0001-Add-missing-includes-cstdint-and-cstdio.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 6e376601c990abaa5e261d1311f92acb3b370b8f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 24 Jan 2023 21:40:43 -0800
-Subject: [PATCH] Add missing includes <cstdint> and <cstdio>
-
-This is needed with GCC 13 and newer [1]
-
-[1] https://www.gnu.org/software/gcc/gcc-13/porting_to.html
-
-Upstream-Status: Backport [https://github.com/facebook/rocksdb/commit/88edfbfb5e1cac228f7cc31fbec24bb637fe54b1]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- .../rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h   | 1 +
- storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h   | 1 +
- .../rocksdb/rocksdb/table/block_based/data_block_hash_index.h    | 1 +
- storage/rocksdb/rocksdb/util/slice.cc                            | 1 +
- storage/rocksdb/rocksdb/util/string_util.h                       | 1 +
- tpool/aio_linux.cc                                               | 1 +
- 6 files changed, 6 insertions(+)
-
---- a/db/compaction/compaction_iteration_stats.h
-+++ b/db/compaction/compaction_iteration_stats.h
-@@ -7,6 +7,7 @@
- 
- #include <cstdint>
- 
-+#include <cstdint>
- #include "rocksdb/rocksdb_namespace.h"
- 
- namespace ROCKSDB_NAMESPACE {
---- a/include/rocksdb/utilities/checkpoint.h
-+++ b/include/rocksdb/utilities/checkpoint.h
-@@ -8,6 +8,7 @@
- #pragma once
- #ifndef ROCKSDB_LITE
- 
-+#include <cstdint>
- #include <string>
- #include <vector>
- 
---- a/table/block_based/data_block_hash_index.h
-+++ b/table/block_based/data_block_hash_index.h
-@@ -5,6 +5,7 @@
- 
- #pragma once
- 
-+#include <cstdint>
- #include <string>
- #include <vector>
- 
---- a/util/slice.cc
-+++ b/util/slice.cc
-@@ -12,6 +12,7 @@
- #include <stdio.h>
- 
- #include <algorithm>
-+#include <cstdint>
- 
- #include "rocksdb/convenience.h"
- #include "rocksdb/slice_transform.h"
---- a/util/string_util.h
-+++ b/util/string_util.h
-@@ -6,6 +6,7 @@
- 
- #pragma once
- 
-+#include <cstdint>
- #include <sstream>
- #include <string>
- #include <unordered_map>
diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Add-check-for-atomic-support.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Add-check-for-atomic-support.patch
index 0fe9c1276..ba6a2d4fb 100644
--- a/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Add-check-for-atomic-support.patch
+++ b/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Add-check-for-atomic-support.patch
@@ -1,4 +1,4 @@
-From cf168ae0b7bceab8432d096719b331f18428fe39 Mon Sep 17 00:00:00 2001
+From 034a9c4ce2ae61cfcffa977f1eb8e6f68947f480 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2020 15:10:37 -0700
 Subject: [PATCH] cmake: Add check for atomic support
@@ -18,6 +18,7 @@ Fixes
 | /mnt/b/yoe/build/tmp/work/mips32r2-yoe-linux/rocksdb/6.6.4-r0/recipe-sysroot-native/usr/bin/mips-yoe-linux/mips-yoe-linux-ld: librocksdb.so.6.6.4: undefined reference to `__atomic_fetch_add_8'
 
 Upstream-Status: Submitted [https://github.com/facebook/rocksdb/pull/6555]
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  CMakeLists.txt                  |  5 +++
@@ -25,9 +26,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 74 insertions(+)
  create mode 100644 cmake/modules/CheckAtomic.cmake
 
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 5cfc1b4803..0a7f820a22 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -1057,7 +1057,12 @@ set(ROCKSDB_SHARED_LIB rocksdb-shared${A
+@@ -1038,7 +1038,12 @@ set(ROCKSDB_SHARED_LIB rocksdb-shared${ARTIFACT_SUFFIX})
  if(WIN32)
    set(SYSTEM_LIBS ${SYSTEM_LIBS} shlwapi.lib rpcrt4.lib)
  else()
@@ -40,6 +43,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  endif()
  
  set(ROCKSDB_PLUGIN_EXTERNS "")
+diff --git a/cmake/modules/CheckAtomic.cmake b/cmake/modules/CheckAtomic.cmake
+new file mode 100644
+index 0000000000..8b7dc8a377
 --- /dev/null
 +++ b/cmake/modules/CheckAtomic.cmake
 @@ -0,0 +1,69 @@
@@ -112,3 +118,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +  endif()
 +endif()
 +
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch
index c98623360..342964cf2 100644
--- a/meta-oe/recipes-dbs/rocksdb/files/0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch
+++ b/meta-oe/recipes-dbs/rocksdb/files/0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch
@@ -1,4 +1,4 @@
-From 114c42fba3fc86119710e8dd1bb2b7a9e39e3064 Mon Sep 17 00:00:00 2001
+From 1ba84e1b8d4c9a3ad85dc443b0df4d79c89cca4b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 17 Jun 2021 19:35:01 -0700
 Subject: [PATCH] replace old sync with new atomic builtin equivalents
@@ -6,13 +6,15 @@ Subject: [PATCH] replace old sync with new atomic builtin equivalents
 Helps compiling with gcc on newer arches e.g. riscv32 where these
 __sync* builtins are not implemented atleast for 64bit values
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
  .../range/range_tree/lib/portability/toku_atomic.h   | 12 ++++++------
  1 file changed, 6 insertions(+), 6 deletions(-)
 
+diff --git a/utilities/transactions/lock/range/range_tree/lib/portability/toku_atomic.h b/utilities/transactions/lock/range/range_tree/lib/portability/toku_atomic.h
+index aaa2298faf..9385902808 100644
 --- a/utilities/transactions/lock/range/range_tree/lib/portability/toku_atomic.h
 +++ b/utilities/transactions/lock/range/range_tree/lib/portability/toku_atomic.h
 @@ -77,37 +77,37 @@ template <typename T, typename U>
@@ -59,3 +61,6 @@ Upstream-Status: Pending
  }
  
  // in case you include this but not toku_portability.h
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Use-exported-target-for-bz2.patch b/meta-oe/recipes-dbs/rocksdb/files/0002-cmake-Use-exported-target-for-bz2.patch
similarity index 74%
rename from meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Use-exported-target-for-bz2.patch
rename to meta-oe/recipes-dbs/rocksdb/files/0002-cmake-Use-exported-target-for-bz2.patch
index 706e0868e..6b46a1f30 100644
--- a/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Use-exported-target-for-bz2.patch
+++ b/meta-oe/recipes-dbs/rocksdb/files/0002-cmake-Use-exported-target-for-bz2.patch
@@ -1,4 +1,4 @@
-From 46a4e585175cac8d76bd0b64f0fc27c9e22f04a1 Mon Sep 17 00:00:00 2001
+From bb3fc86f87a9acc64628e1cb32f5c8a1cfbeb880 Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@nextrem.ch>
 Date: Mon, 12 Oct 2020 21:22:46 +0200
 Subject: [PATCH] cmake: Use exported target for bz2
@@ -8,12 +8,14 @@ This is not portable and makes it fail in environment like Yocto.
 
 Upstream-Status: Submitted [https://github.com/facebook/rocksdb/pull/7541]
 ---
- CMakeLists.txt | 9 ++-------
- 1 file changed, 2 insertions(+), 7 deletions(-)
+ CMakeLists.txt | 7 +------
+ 1 file changed, 1 insertion(+), 6 deletions(-)
 
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 0a7f820a22..be80edb955 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -154,12 +154,7 @@ else()
+@@ -149,12 +149,7 @@ else()
    if(WITH_BZ2)
      find_package(BZip2 REQUIRED)
      add_definitions(-DBZIP2)
@@ -27,3 +29,6 @@ Upstream-Status: Submitted [https://github.com/facebook/rocksdb/pull/7541]
    endif()
  
    if(WITH_LZ4)
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Do-not-add-msse4.2-mpclmul-on-clang.patch b/meta-oe/recipes-dbs/rocksdb/files/0003-cmake-Do-not-add-msse4.2-mpclmul-on-clang.patch
similarity index 87%
rename from meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Do-not-add-msse4.2-mpclmul-on-clang.patch
rename to meta-oe/recipes-dbs/rocksdb/files/0003-cmake-Do-not-add-msse4.2-mpclmul-on-clang.patch
index e52185443..e2f785d7c 100644
--- a/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Do-not-add-msse4.2-mpclmul-on-clang.patch
+++ b/meta-oe/recipes-dbs/rocksdb/files/0003-cmake-Do-not-add-msse4.2-mpclmul-on-clang.patch
@@ -1,4 +1,4 @@
-From cedc84a8db468d0b6652e78a8a6667e655586b53 Mon Sep 17 00:00:00 2001
+From bb10f55eb77be7b7eee94cb3506c9cbef8e24099 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 26 Jan 2023 13:00:43 -0800
 Subject: [PATCH] cmake: Do not add -msse4.2 -mpclmul on clang
@@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index dbef059028..981545a4e0 100644
+index be80edb955..a1bbade81a 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -290,7 +290,7 @@ endif()
+@@ -279,7 +279,7 @@ endif()
  
  include(CheckCXXSourceCompiles)
  set(OLD_CMAKE_REQUIRED_FLAGS ${CMAKE_REQUIRED_FLAGS})
@@ -29,5 +29,5 @@ index dbef059028..981545a4e0 100644
  endif()
  
 -- 
-2.39.1
+2.25.1
 
diff --git a/meta-oe/recipes-dbs/rocksdb/files/ppc64.patch b/meta-oe/recipes-dbs/rocksdb/files/0004-Implement-support-for-musl-ppc64.patch
similarity index 55%
rename from meta-oe/recipes-dbs/rocksdb/files/ppc64.patch
rename to meta-oe/recipes-dbs/rocksdb/files/0004-Implement-support-for-musl-ppc64.patch
index 273b8fe2e..5fcf1f7da 100644
--- a/meta-oe/recipes-dbs/rocksdb/files/ppc64.patch
+++ b/meta-oe/recipes-dbs/rocksdb/files/0004-Implement-support-for-musl-ppc64.patch
@@ -1,11 +1,20 @@
-Upstream-Status: Pending
+From c6accd34e8169d7a6b92fc89dce5d4309978e39e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 21 Mar 2024 14:11:09 +0800
+Subject: [PATCH] Implement support for musl/ppc64
 
-implement support for musl/ppc64
+Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../lock/range/range_tree/lib/portability/toku_time.h     | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h b/utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h
+index 9b83c53511..0a7488c397 100644
 --- a/utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h
 +++ b/utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h
-@@ -58,7 +58,7 @@ Copyright (c) 2006, 2015, Percona and/or
+@@ -58,7 +58,7 @@ Copyright (c) 2006, 2015, Percona and/or its affiliates. All rights reserved.
  #include <stdint.h>
  #include <sys/time.h>
  #include <time.h>
@@ -14,7 +23,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include <sys/platform/ppc.h>
  #endif
  
-@@ -131,8 +131,12 @@ static inline tokutime_t toku_time_now(v
+@@ -131,8 +131,12 @@ static inline tokutime_t toku_time_now(void) {
    uint64_t result;
    __asm __volatile__("mrs %[rt], cntvct_el0" : [rt] "=r"(result));
    return result;
@@ -28,3 +37,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #elif defined(__s390x__)
    uint64_t result;
    asm volatile("stckf %0" : "=Q"(result) : : "cc");
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-dbs/rocksdb/files/0005-Implement-timer-implementation-for-mips-platform.patch b/meta-oe/recipes-dbs/rocksdb/files/0005-Implement-timer-implementation-for-mips-platform.patch
new file mode 100644
index 000000000..2979b73d2
--- /dev/null
+++ b/meta-oe/recipes-dbs/rocksdb/files/0005-Implement-timer-implementation-for-mips-platform.patch
@@ -0,0 +1,32 @@
+From 2ebc0ff33e41d23e4d3aec1a86f3d8bd4be410e7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 21 Mar 2024 14:14:58 +0800
+Subject: [PATCH] Implement timer implementation for mips platform
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../lock/range/range_tree/lib/portability/toku_time.h       | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h b/utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h
+index 0a7488c397..ad7d9f2124 100644
+--- a/utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h
++++ b/utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h
+@@ -162,6 +162,12 @@ static inline tokutime_t toku_time_now(void) {
+   unsigned long result;
+   asm volatile ("rdtime.d\t%0,$r0" : "=r" (result));
+   return result;
++#elif defined(__mips__)
++  // mips apparently only allows rdtsc for superusers, so we fall
++  // back to gettimeofday.  It's possible clock_gettime would be better.
++  struct timeval tv;
++  gettimeofday(&tv, nullptr);
++  return (uint64_t)tv.tv_sec * 1000000 + tv.tv_usec;
+ #else
+ #error No timer implementation for this platform
+ #endif
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-dbs/rocksdb/files/arm.patch b/meta-oe/recipes-dbs/rocksdb/files/0006-Implement-timer-for-arm-v6.patch
similarity index 64%
rename from meta-oe/recipes-dbs/rocksdb/files/arm.patch
rename to meta-oe/recipes-dbs/rocksdb/files/0006-Implement-timer-for-arm-v6.patch
index 3066aa827..0ae673c42 100644
--- a/meta-oe/recipes-dbs/rocksdb/files/arm.patch
+++ b/meta-oe/recipes-dbs/rocksdb/files/0006-Implement-timer-for-arm-v6.patch
@@ -1,11 +1,20 @@
-Upstream-Status: Pending
+From 9e274ba2762724f353227b5a3a6e4433f706468a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 21 Mar 2024 14:16:08 +0800
+Subject: [PATCH] Implement timer for arm >= v6
 
-implement timer for arm >= v6
+Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../range/range_tree/lib/portability/toku_time.h   | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h b/utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h
+index ad7d9f2124..bcb795b7e7 100644
 --- a/utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h
 +++ b/utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h
-@@ -164,6 +164,20 @@ static inline tokutime_t toku_time_now(v
+@@ -168,6 +168,20 @@ static inline tokutime_t toku_time_now(void) {
    struct timeval tv;
    gettimeofday(&tv, nullptr);
    return (uint64_t)tv.tv_sec * 1000000 + tv.tv_usec;
@@ -26,3 +35,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #else
  #error No timer implementation for this platform
  #endif
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-dbs/rocksdb/files/mips.patch b/meta-oe/recipes-dbs/rocksdb/files/mips.patch
deleted file mode 100644
index cea70352d..000000000
--- a/meta-oe/recipes-dbs/rocksdb/files/mips.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Upstream-Status: Pending
-
-implement timer implementation for mips platform
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h
-+++ b/utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h
-@@ -158,6 +158,12 @@ static inline tokutime_t toku_time_now(v
-   uint64_t cycles;
-   asm volatile("rdcycle %0" : "=r"(cycles));
-   return cycles;
-+#elif defined(__mips__)
-+  // mips apparently only allows rdtsc for superusers, so we fall
-+  // back to gettimeofday.  It's possible clock_gettime would be better.
-+  struct timeval tv;
-+  gettimeofday(&tv, nullptr);
-+  return (uint64_t)tv.tv_sec * 1000000 + tv.tv_usec;
- #else
- #error No timer implementation for this platform
- #endif
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_7.9.2.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb
similarity index 82%
rename from meta-oe/recipes-dbs/rocksdb/rocksdb_7.9.2.bb
rename to meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb
index 8faaee40f..76d75f2b5 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_7.9.2.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb
@@ -6,17 +6,16 @@ LIC_FILES_CHKSUM = "file://LICENSE.Apache;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.leveldb;md5=fb04ff57a14f308f2eed4a9b87d45837"
 
-SRCREV = "444b3f4845dd01b0d127c4b420fdd3b50ad56682"
-SRCBRANCH = "7.9.fb"
+SRCREV = "f4441966592636253fd5ab0bb9ed44fc2697fc53"
+SRCBRANCH = "9.0.fb"
 
 SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH};protocol=https \
            file://0001-cmake-Add-check-for-atomic-support.patch \
-           file://0001-cmake-Use-exported-target-for-bz2.patch \
-           file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
-           file://0001-cmake-Do-not-add-msse4.2-mpclmul-on-clang.patch \
-           file://ppc64.patch \
-           file://mips.patch \
-           file://arm.patch \
+           file://0002-cmake-Use-exported-target-for-bz2.patch \
+           file://0003-cmake-Do-not-add-msse4.2-mpclmul-on-clang.patch \
+           file://0004-Implement-support-for-musl-ppc64.patch \
+           file://0005-Implement-timer-implementation-for-mips-platform.patch \
+           file://0006-Implement-timer-for-arm-v6.patch \
           "
 
 SRC_URI:append:riscv32 = " file://0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch"
@@ -46,12 +45,10 @@ EXTRA_OECMAKE = "\
 "
 
 do_install:append() {
-    # fix for qa check buildpaths
+    # Fix for qa check buildpaths
     sed -i "s#${RECIPE_SYSROOT}##g" ${D}${libdir}/cmake/rocksdb/RocksDBTargets.cmake
 }
 
-LDFLAGS:append:riscv64 = " -pthread"
-
 # Need toku_time_now() implemented for ppc/musl
 # see utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h
 COMPATIBLE_HOST:libc-musl:powerpc = "null"
-- 
2.25.1


