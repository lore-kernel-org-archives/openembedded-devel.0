Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E221FCFB43F
	for <webhook@archiver.kernel.org>; Sun,  6 Oct 2024 10:43:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.28999.1728211432591438040
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Oct 2024 03:43:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0009f33b99=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 496Ae7kb016681
	for <openembedded-devel@lists.openembedded.org>; Sun, 6 Oct 2024 10:43:51 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 422ve8s35a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 06 Oct 2024 10:43:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qM47SU9vRWqA/bVW9ngO/eYX1+4Mpgk5mJ1yLRrKkXuzsGBTSeWFaYxW8I1QsxioHMs0Fo6rCTKgOcPdsoFNuxBdWrSY30qbRBlXSliR5ywseXy/03EVvCy4s1m3Rvr9vpEJD8t1wY1EU+WJliIHlpoxI/x7nP7jE8/bXt0EFK6qyZ2JWpQ16IF3TjwG/QZ81J5d4YnQ/uTbLGqQznU2OCt0lngXONd8zqBjpXbaeg27MAUp0UFSUcVfTZrYSj8i2Xfa911tP/eSjQbiDsNigpbJQZVsfQaY/9senUwrpCk1gz68BjEhuMwvcam1INtB5BC1vJxE/nnltpl5/cvAOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XzTqauGr8jP023Vn+eke6jAxrBZ8r0yrqFaGXYljqY=;
 b=fHpa9Kx5m7sMLioK4pYOEoKSUxOPCNU5UhRw7i/W/crrekUJ8R2GosgpaKGCfkoMaIPkw7CjDDuDzjhxqjzvPvF658Ou5/U6ulK5KfMGDLN9y90/JA0fMn8QW+V+3iG5gwhWqx/K4l7EYEKG7Wua8YPpNyOlWOcWYwJzVJZItAfAQL5cCBbOvaN00uvQ7fBwInSNJVpr5sLEGM0DL2S7jBaIXqFef8EY3M0QSTAAa3jJc2DyuAK/wseZja/KYo3yZ+em42F1chEdYFgiAF75AyBW2w+oQQb1xWdF6dh8Lan95bsIv+/nqfJyMSJhvURHL8LkI/ix34InYjMWEa8MwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CY8PR11MB7946.namprd11.prod.outlook.com (2603:10b6:930:7e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.20; Sun, 6 Oct 2024 10:43:49 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8026.020; Sun, 6 Oct 2024
 10:43:49 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] libblockdev: upgrade 3.1.1 -> 3.2.0
Date: Sun,  6 Oct 2024 18:43:38 +0800
Message-Id: <20241006104339.1384855-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0024.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::9) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CY8PR11MB7946:EE_
X-MS-Office365-Filtering-Correlation-Id: d8c8e5ec-582e-4212-e37d-08dce5f3c2ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?iy1nIaELqEgzefkruou6qYeFGBPI4b1Px7eMp0H8SuXWmBNkDDcuVaLHI57T?=
 =?us-ascii?Q?3KND5NmNuLffHJ/bFUz54OoUgAUFepuF9zzWmjCtc3niokxU9msVUYffkMKl?=
 =?us-ascii?Q?6zdBBjV1Gf8ku2jpbef2hBQgF05OjK4oFxPyz7lPt83yQuO8oRumKFYB0vmh?=
 =?us-ascii?Q?BUYzMRXDnKrFkOu+rEmdD12LhReGm3VkNSQulmDU+yJksh/1ud1bM6eyzUuJ?=
 =?us-ascii?Q?r/73yqo0cugZacULYE4+VJaohED1UQPi5ulOlMAtRyMyksnLk8W/XYkBndyA?=
 =?us-ascii?Q?f1klep1eBX33dm1JIcC7MTqvp4eC+Htad+4HV4ORa5K6kzEYVssr7/yTEyWM?=
 =?us-ascii?Q?q/0jjgEPSEnf5bKlwGovy+YnxHtTQmdkQ6ymzoQFB5zJDebrektHu+3kLnk6?=
 =?us-ascii?Q?ampq+g58ic3MFdbXwdzcs4cPIHl4OekqKXTBS043JDzn9/kStVRP/n2vhRlj?=
 =?us-ascii?Q?cOfJXiWCT2ofww2tT3usmrUJFdjBwG92aW12q1cqdu8akyiGdFsk9W6kzyaO?=
 =?us-ascii?Q?UDjxuOMMy3tSJeMgnFb477Zj5rl1M4a80aLHpIgK7j7MJZmIQq6QB+MT+ifo?=
 =?us-ascii?Q?wj2OgwRsYJ3ML5MAThOtYmVE3yVxE0Sl4ZFVI+YYTRLjEx2etVr4F6CufeX0?=
 =?us-ascii?Q?IxcLa60ZfkXwXBgj2p36d2YsCMpo/+s+4WMSM4kF+Dp4lhJr4NfRh8fvXz0Z?=
 =?us-ascii?Q?qnfg7YQiwd5zNv1c2m6/W5qmv/UpLsCARN3fREqA8rUXzIwaZKQLliQqQ6BO?=
 =?us-ascii?Q?Bm3qQBL+afs79G8AXhi4tbKzgjDzAW2mbwVErWgIzOO3lD+EZCi4gjhmRvR3?=
 =?us-ascii?Q?P8BQPqDge4f1YrmTrkvPheyqlYOOkMhcwoed36eoGmIiTyVWzgZmZ8olubzi?=
 =?us-ascii?Q?Y8g0B4jcNh+QqcVnaSduHysa3GlSF6PykknXfG5kn91SlwiwYPPmsoLQFFJ+?=
 =?us-ascii?Q?E4LUIQFiURn/poQv31oijdzBsG3/x1czZyaDYhcagBNzbfFDzRf+NTcbVh+/?=
 =?us-ascii?Q?WGJvOBvjWppNzee5M4YmKfuPDwRzDLjCdv5agEFSboKffFADPJDGJ0PSLL/M?=
 =?us-ascii?Q?S58D8ti4HVSSREs3yabvtvU6/HaI91L2EwVvDCgefcqOubgRhunN4F7v4AMu?=
 =?us-ascii?Q?K/r/eXD6CffH4RBi0wBIO4cvnEygESzpLENA0NENOXWTulQCxpBaVKZvBhoU?=
 =?us-ascii?Q?madkg5mLA0vPk6lnemnEFQr34FgqQ83NqDDIhvpYny8P0fCqawUlb/zC+zK2?=
 =?us-ascii?Q?5DeovkTJv4UC5St/PLd2H2ihuohiBYIkUwPEqG4HV4iFqwKNRMMahaQi/I+r?=
 =?us-ascii?Q?EGphIfQaL0o2XUOKBs5+vWdVIGs4UMSIw3Tsgaw5FZruZA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NHbf8u8eB2V0XnHzTVt5VriRG8Lph9uBcAXrMbyhG4qvDQnKrnB1/L86XHJm?=
 =?us-ascii?Q?Bxrv5IUHMcOJstcZPyyW2CLbxwiQlK4AWs3T63f+H70mONBKKjj14Oypxb5b?=
 =?us-ascii?Q?QN0oNNskDuUqMc2KIllyWF9nAcr4mLO0kgdJ53enWHKa9UpzQAcaNt6R36IA?=
 =?us-ascii?Q?a2gpQjX0n3vMXrU1G+BRuKcnMn+GNwIDmEujtgxvtglFZOUAS6f+Le5Tva3r?=
 =?us-ascii?Q?KBeFpfaEPfo3tO4kf85BaugXJw6/xIN008z8QXm1uZ0Mej25Fhvr2O39lFk+?=
 =?us-ascii?Q?o29Y4jJn1iy07Z/W64h3gE/EeFjeWDloR+2vIWtLp08usZ/fNeuhb6gM8QVu?=
 =?us-ascii?Q?vjOz5VHif6Jv4zmd42joSB6HV6Bq3SfjgmuxIvfd6kMcRqwKebf2EeugYCAT?=
 =?us-ascii?Q?zcNyr2l+n8NNU7PwWLmNZWMcWkY/eXpIuiB/sQoCUjybHGMk43/MGYyCj9wJ?=
 =?us-ascii?Q?3a7O51jdtSPbBGPjL2TSb4wCBAOsbanoYxcKt5b93rH1lEKP63DA7dXq58tB?=
 =?us-ascii?Q?ksdOYpXH8Qei7wOPZKVW8BxuZVx/Gia32KlUJaziDveeXKx3CVtcch4NZSuX?=
 =?us-ascii?Q?cXYfyy2TIcN9er72y98VmqjTzkjt/kf+W/37l9XbaC6EFkzfqV9HOLNOD+bL?=
 =?us-ascii?Q?7GI/fxCT3MRe+HaLdGrQ0ZZsjVOR5CJWNaZoZX9UMsymegbEkqPlOWrkkpm4?=
 =?us-ascii?Q?mybr5qXYYlNVFa7Oa35+CKphnIvNqfXDhCwnhbRw4hCoIpDDZd/kM966Wl1D?=
 =?us-ascii?Q?avAQ/4jNVGG878aDn7zYKc/VjqSaacFcGSNp/KfQQKehSHEw2Cqh2lfDQfOT?=
 =?us-ascii?Q?AnOulXEzwssBmQ7QXaWmQgVVM6NqPIQ7KG4AJXnJwEu1j01Hs/f6vAzH2hv6?=
 =?us-ascii?Q?U0+OW/nliP2eaGvi2JnBpci5bXhOrVFP75kw6qPnWEAk+dhVHP20uvi0F0bb?=
 =?us-ascii?Q?NRwUu4WTmNoyVKfJkoanp7MIIr7W1oYvCFSFDQe1NvVHumd4HPKIrVbFSVz1?=
 =?us-ascii?Q?Mim4DAKmodjgrp5+kRA7kRhNfwnlPoJRZyU+UbeWQwAHw+51BHNVFK3w0e00?=
 =?us-ascii?Q?Bu/8F6D/pHyFhP5v2IZBIB/yA7cWh5QzJs133enMHVINzQv5dAr+aTqlVsYA?=
 =?us-ascii?Q?d97aX+oBfxGMzzxbFJol00G1KCeD0b8pGEv53om6gXeViJoIc///7II8RFsW?=
 =?us-ascii?Q?aafHsKDsE13+wBGFi/9M3wT/HLkiBHmhcmlENa1YfYItnZryZJ4une+z6hxa?=
 =?us-ascii?Q?TBZlBrjj1gEdiO21EsY5yAUpNYkoVpe4LE9kPZdxwTPAgBC6bvHxktCtygwT?=
 =?us-ascii?Q?GyVTzJGjufRR9ua25eNU4Wla/UwlQPU9CA6LrosLZCjII7JfpI12voUq0hqp?=
 =?us-ascii?Q?CUY08ndjLH6EcIV6xK1rSDNhIl/XwoPUD9ROuJP2o+3/ycwEe/9CcJshCWIb?=
 =?us-ascii?Q?TtFEbho/CiQYFB9d9I0Y3DJlL0qx8S4fOqmZE4aHXbWYNxUZkoKMKoL/wx06?=
 =?us-ascii?Q?2V0diNJc38bcZ5m5Kd+oL1ZrRp8Qr7suJgYa4kr1KxjF4NtJwROuG08/ZuSJ?=
 =?us-ascii?Q?NvhYQeH3bwCo3v7HD/7NM+OVIwJm/WYV2oUgLVeP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c8e5ec-582e-4212-e37d-08dce5f3c2ef
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2024 10:43:49.1619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VJqalA1lpYKylrpaARKNLhtSgSfGyBUceTxnC014Gx/tWsPr8tVi7tvBrVTBLGxWtwm9C5hugDhmjzARFsQMRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7946
X-Authority-Analysis: v=2.4 cv=CPp4XgrD c=1 sm=1 tr=0 ts=670269e7 cx=c_pps a=UtaLnOzkojfj4BVWksq/2g==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8
 a=pGLkceISAAAA:8 a=92XoPHsD9W-mH10iXXEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: SwNNE7uqXmI0pm1WZq3BNkiBvng0a1N2
X-Proofpoint-GUID: SwNNE7uqXmI0pm1WZq3BNkiBvng0a1N2
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112677

ChangeLog:
https://github.com/storaged-project/libblockdev/releases/tag/3.2.0

* Drop 0001-libext2fs-unused-parameters-fix.patch as the issue has been
  fixed upstream.
* Add PACKAGECONFIG[smart] and PACKAGECONFIG[smartmontools].
* Add libyaml dependency for PACKAGECONFIG[lvm] and
  PACKAGECONFIG[lvm-dbus].

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...0001-libext2fs-unused-parameters-fix.patch | 92 -------------------
 ...blockdev_3.1.1.bb => libblockdev_3.2.0.bb} | 13 +--
 2 files changed, 7 insertions(+), 98 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libblockdev/files/0001-libext2fs-unused-parameters-fix.patch
 rename meta-oe/recipes-extended/libblockdev/{libblockdev_3.1.1.bb => libblockdev_3.2.0.bb} (85%)

diff --git a/meta-oe/recipes-extended/libblockdev/files/0001-libext2fs-unused-parameters-fix.patch b/meta-oe/recipes-extended/libblockdev/files/0001-libext2fs-unused-parameters-fix.patch
deleted file mode 100644
index 8129c1e2a..000000000
--- a/meta-oe/recipes-extended/libblockdev/files/0001-libext2fs-unused-parameters-fix.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From 3aad8d471201da4125bd03d7a6921707461fe182 Mon Sep 17 00:00:00 2001
-From: Vojtech Trefny <vtrefny@redhat.com>
-Date: Fri, 7 Jun 2024 10:06:22 +0200
-Subject: [PATCH 1/3] fs: Ignore unused-parameter warning in the FS plugin
-
-There are some unused parameters in the libext2fs header which
-together with Wall and Werror means the plugin compilation fails.
-As a workaround we'll disable the unused-parameter warning for
-now.
-
-Fixes: #1026
-
-Taken from Fedora
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- src/plugins/fs/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/plugins/fs/Makefile.am b/src/plugins/fs/Makefile.am
-index 7d4849c0..00474d5a 100644
---- a/src/plugins/fs/Makefile.am
-+++ b/src/plugins/fs/Makefile.am
-@@ -2,7 +2,7 @@ AUTOMAKE_OPTIONS = subdir-objects
- 
- lib_LTLIBRARIES = libbd_fs.la
- 
--libbd_fs_la_CFLAGS   = $(GLIB_CFLAGS) $(GIO_CFLAGS) $(BLKID_CFLAGS) $(MOUNT_CFLAGS) $(UUID_CFLAGS) $(EXT2FS_CFLAGS) -Wall -Wextra -Werror
-+libbd_fs_la_CFLAGS   = $(GLIB_CFLAGS) $(GIO_CFLAGS) $(BLKID_CFLAGS) $(MOUNT_CFLAGS) $(UUID_CFLAGS) $(EXT2FS_CFLAGS) -Wall -Wextra -Werror -Wno-unused-parameter
- libbd_fs_la_LIBADD   = ${builddir}/../../utils/libbd_utils.la $(GLIB_LIBS) $(GIO_LIBS) $(BLKID_LIBS) $(MOUNT_LIBS) $(UUID_LIBS) $(EXT2FS_LIBS)
- libbd_fs_la_LDFLAGS	 = -L${srcdir}/../../utils/ -version-info 3:0:0 -Wl,--no-undefined -export-symbols-regex '^bd_.*'
- libbd_fs_la_CPPFLAGS = -I${builddir}/../../../include/ -I${srcdir}/../
--- 
-2.45.2
-
-
-From da5c14f3e2f83c8c40203897154ee2b788782792 Mon Sep 17 00:00:00 2001
-From: Vojtech Trefny <vtrefny@redhat.com>
-Date: Fri, 7 Jun 2024 15:21:09 +0200
-Subject: [PATCH 2/3] fs: Ignore shift-count-overflow warning in FS plugin
-
-The warning happens in the libext2fs header.
----
- src/plugins/fs/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/plugins/fs/Makefile.am b/src/plugins/fs/Makefile.am
-index 00474d5a..42e1c777 100644
---- a/src/plugins/fs/Makefile.am
-+++ b/src/plugins/fs/Makefile.am
-@@ -2,7 +2,7 @@ AUTOMAKE_OPTIONS = subdir-objects
- 
- lib_LTLIBRARIES = libbd_fs.la
- 
--libbd_fs_la_CFLAGS   = $(GLIB_CFLAGS) $(GIO_CFLAGS) $(BLKID_CFLAGS) $(MOUNT_CFLAGS) $(UUID_CFLAGS) $(EXT2FS_CFLAGS) -Wall -Wextra -Werror -Wno-unused-parameter
-+libbd_fs_la_CFLAGS   = $(GLIB_CFLAGS) $(GIO_CFLAGS) $(BLKID_CFLAGS) $(MOUNT_CFLAGS) $(UUID_CFLAGS) $(EXT2FS_CFLAGS) -Wall -Wextra -Werror -Wno-unused-parameter -Wno-shift-count-overflow
- libbd_fs_la_LIBADD   = ${builddir}/../../utils/libbd_utils.la $(GLIB_LIBS) $(GIO_LIBS) $(BLKID_LIBS) $(MOUNT_LIBS) $(UUID_LIBS) $(EXT2FS_LIBS)
- libbd_fs_la_LDFLAGS	 = -L${srcdir}/../../utils/ -version-info 3:0:0 -Wl,--no-undefined -export-symbols-regex '^bd_.*'
- libbd_fs_la_CPPFLAGS = -I${builddir}/../../../include/ -I${srcdir}/../
--- 
-2.45.2
-
-
-From 90ceb4b52fbda34673fe5303da84b9a902187503 Mon Sep 17 00:00:00 2001
-From: Vojtech Trefny <vtrefny@redhat.com>
-Date: Wed, 12 Jun 2024 15:34:02 +0200
-Subject: [PATCH 3/3] fs: Fix ignoring errors from libext2fs
-
-Follow-up for #1028, we still want to show the warning and not
-completely supress it.
----
- src/plugins/fs/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/plugins/fs/Makefile.am b/src/plugins/fs/Makefile.am
-index 42e1c777..1ee256f0 100644
---- a/src/plugins/fs/Makefile.am
-+++ b/src/plugins/fs/Makefile.am
-@@ -2,7 +2,7 @@ AUTOMAKE_OPTIONS = subdir-objects
- 
- lib_LTLIBRARIES = libbd_fs.la
- 
--libbd_fs_la_CFLAGS   = $(GLIB_CFLAGS) $(GIO_CFLAGS) $(BLKID_CFLAGS) $(MOUNT_CFLAGS) $(UUID_CFLAGS) $(EXT2FS_CFLAGS) -Wall -Wextra -Werror -Wno-unused-parameter -Wno-shift-count-overflow
-+libbd_fs_la_CFLAGS   = $(GLIB_CFLAGS) $(GIO_CFLAGS) $(BLKID_CFLAGS) $(MOUNT_CFLAGS) $(UUID_CFLAGS) $(EXT2FS_CFLAGS) -Wall -Wextra -Werror -Wno-error=unused-parameter -Wno-error=shift-count-overflow
- libbd_fs_la_LIBADD   = ${builddir}/../../utils/libbd_utils.la $(GLIB_LIBS) $(GIO_LIBS) $(BLKID_LIBS) $(MOUNT_LIBS) $(UUID_LIBS) $(EXT2FS_LIBS)
- libbd_fs_la_LDFLAGS	 = -L${srcdir}/../../utils/ -version-info 3:0:0 -Wl,--no-undefined -export-symbols-regex '^bd_.*'
- libbd_fs_la_CPPFLAGS = -I${builddir}/../../../include/ -I${srcdir}/../
--- 
-2.45.2
-
diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_3.1.1.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.0.bb
similarity index 85%
rename from meta-oe/recipes-extended/libblockdev/libblockdev_3.1.1.bb
rename to meta-oe/recipes-extended/libblockdev/libblockdev_3.2.0.bb
index a42e09d33..baf2acca5 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_3.1.1.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.0.bb
@@ -12,19 +12,18 @@ inherit autotools gobject-introspection pkgconfig lib_package
 
 DEPENDS = "autoconf-archive-native glib-2.0 kmod udev libnvme"
 
-SRC_URI = "git://github.com/storaged-project/libblockdev;branch=3.1.x-devel;protocol=https \
+SRC_URI = "git://github.com/storaged-project/libblockdev;branch=master;protocol=https \
            file://0001-fix-pythondir-for-multilib-when-cross-compiling.patch \
-           file://0001-libext2fs-unused-parameters-fix.patch \
            "
-SRCREV = "68aaff5556afe26be749c29a2b7cbd714dce3050"
+SRCREV = "27881cb6e57eb0146c51d032ea72fbb3cd6bda7e"
 S = "${WORKDIR}/git"
 
 FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR}"
 
-PACKAGECONFIG ??= "python3 lvm lvm-dbus dm parted fs escrow btrfs crypto mdraid mpath nvdimm tools"
+PACKAGECONFIG ??= "python3 lvm lvm-dbus dm parted fs escrow btrfs crypto mdraid mpath nvdimm tools smart smartmontools"
 PACKAGECONFIG[python3] = "--with-python3, --without-python3,,python3"
-PACKAGECONFIG[lvm] = "--with-lvm, --without-lvm, multipath-tools, lvm2"
-PACKAGECONFIG[lvm-dbus] = "--with-lvm_dbus, --without-lvm_dbus, multipath-tools, lvm2"
+PACKAGECONFIG[lvm] = "--with-lvm, --without-lvm, multipath-tools libyaml, lvm2"
+PACKAGECONFIG[lvm-dbus] = "--with-lvm_dbus, --without-lvm_dbus, multipath-tools libyaml, lvm2"
 PACKAGECONFIG[dm] = "--with-dm, --without-dm, multipath-tools, lvm2"
 PACKAGECONFIG[parted] = "--with-part, --without-part, parted"
 PACKAGECONFIG[fs] = "--with-fs, --without-fs, e2fsprogs util-linux"
@@ -36,5 +35,7 @@ PACKAGECONFIG[crypto] = "--with-crypto,--without-crypto,cryptsetup keyutils nss
 PACKAGECONFIG[mdraid] = "--with-mdraid,--without-mdraid,libbytesize"
 PACKAGECONFIG[mpath] = "--with-mpath,--without-mpath, multipath-tools, lvm2"
 PACKAGECONFIG[tools] = "--with-tools,--without-tools,libbytesize libdevmapper"
+PACKAGECONFIG[smart] = "--with-smart,--without-smart,libatasmart"
+PACKAGECONFIG[smartmontools] = "--with-smartmontools,--without-smartmontools,json-glib,smartmontools"
 
 export GIR_EXTRA_LIBS_PATH="${B}/src/utils/.libs"
-- 
2.25.1


