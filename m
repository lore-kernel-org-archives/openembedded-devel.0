Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5240C6FD1C
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 11:03:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.30526.1678100598334038464
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Mar 2023 03:03:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=bZq1cZGB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2429e4d58b=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 326AeiL1016794
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Mar 2023 03:03:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=XALk8xOHG5smdYQGd3KSBXNEFv7mzsX+pqzleUsXDUs=;
 b=bZq1cZGB0STjRZo+nV0e5oBch37U0HuUsfoPJKDHFGFVmk7rLgz3sVnrGRbt/oiv/8kO
 9v1At4Jnj+U94amTiP9Xxbn7NUZrq0WEcgSMW5ytW37+631TPuEAkO6HvyRM+dLkHEDH
 D+QeLhjsqhzQqGAwSFi4UY9lyvoEDifoXh1IsNIKPgMy9Ika3KsHB7KokM5MLXrwf2fu
 8D/rICk94WvRcnqJ3xC3QawYCJb0mpGmSeYF2GezO83HecUWOg0nDVZuFUinazHv12Tb
 lxUdpBShSr7i4ltgreTQmSZpix4MvP4n/uWKm+qDZlvE+nBScL7RMLci5nLJKCbiPtfg 9A== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p4258sp5a-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 06 Mar 2023 03:03:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ok2iBZ7XxFTnG7ZGzOximR4xT9pJDIEdzILSh7fiN/0AEs4Qmxcfe8xvZh5Z46n0nGsSZEaEIbMdCavKxTa/nN3/U9F9xzr1+KefDV7QtlrPa+gP3aLRYSOKvg4sGgV3VlZf3TrG77dShBrRBZSgGCkOhL1laZgbGJvfkBe9N4HLCaYIYJgp33rN6g4iOxF1YEk4511jXY+leJztTzjstYZMJmbs4zlOQcVpW35dK+IPifVsB04r80tob3ypjyzzNgS1G5oqTHqKR1FOjue2rENp9DclDt5tl+3UWuKA024eRIfM0vhzNvIBNU7gOy53bYGj1KsQbR5q5klSdSPb+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XALk8xOHG5smdYQGd3KSBXNEFv7mzsX+pqzleUsXDUs=;
 b=MDrB0Q5rdD+Eu69O6dvAuoKjurU39XtOH1/9CnKXPsYfnyrrBHf1b4DwFeofqDj2vGVoGL5inJJhBX1xxv4fin/XuBTIzRcbSVfKAnodJw7kWlFKOTMp45fIakPy+lquL6YcEXogLFUiYGZe2IWdCkPEqkJgIPkZYYMZPJsQjDIreh/XK9ZpMwDoPN9b4AVmAKqsFeg6Efv4aQ+5gP4Uvn/PQPu2Yn6SUyDZ/LxEGPBRQH0g76cc45c/WCBM1nTWAEIjlKzEbBQJe8Uad9bX1NXvpOkvEdAOPkfrIaHiOzKoWN3mxNBPsi19A08TqHE0l7MkPViiQq8rgkN7qT1ZHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by PH8PR11MB8257.namprd11.prod.outlook.com (2603:10b6:510:1c0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 11:03:15 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e%2]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 11:03:15 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 3/6] libnetfilter-cthelper: upgrade 1.0.0 -> 1.0.1
Date: Mon,  6 Mar 2023 19:02:58 +0800
Message-Id: <20230306110301.75991-4-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230306110301.75991-1-yi.zhao@windriver.com>
References: <20230306110301.75991-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:510:174::17) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|PH8PR11MB8257:EE_
X-MS-Office365-Filtering-Correlation-Id: 41d0bf19-fa91-494b-a61d-08db1e32627c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8CtK4gBCGFCKLzXIKR9SJa5jcDLHeWqKrA9y+AiBdL3gAuuS/SUWVY9AwuwDcQNZ2kO+XRAkFSXst2LfECf0+OJX28bps5E7Nd70vQ8DcQqD3hZn6WljU5q8a0MbvIP4uhS4L66ouFEgAJXXlVZz2+LFseCoXGRp7R6uma6KpYPaz7gufKluYewbldhTmkAIZFLj3Ejxps4GRwAq++VyoC1ewlwAG4WkXKXIo2pPOCA/V7LM4JPHkmXA1NSzdNYfNS81b8pYUREuVdKCkbhc76BtTJEMY7g6NMWc56VG/3VHBuMmOVLSZcDAaqAmSlr/6JOclJnwQ9PvSYWH5LKv4aDj7mYYm2izHjxO2h6YEQuJHU5UK9XSYhGc8hL71Wy5XkyqGur8++RDDW8Y/wpawkaYUJ2+xzqsXbh5KqixwCZFYjhXU6VVEbs5s8fA98rnppieaM5bxW01WbcG1WJFSzHxpAWKYjYgvETOgVhhMI13sQOiL0YBEJI43BZC0XVdHAPTY4gxiPuIWkoRrXaGY6VE0TzycR3XgHM6kSVdMD8z9xT7whiNHVcPc2RX/ApWBuP46NWGW/yrah1lN+92kamOruduuuBMwIkHlopN+NH4P4SZLBCHIglaf82JcVr+pA3pHUrIUnPxSxSy1ILv6jR5hbcjPCAybSSXDwfn/1HL5RZNv3NiPt5Z27Q37M0a9RtYg4PVofF9mpiF1bZJMdtoPFszN64PHyYpRxKQXPw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(136003)(366004)(396003)(39850400004)(451199018)(83380400001)(36756003)(478600001)(316002)(38350700002)(38100700002)(2616005)(6486002)(6506007)(6512007)(6666004)(1076003)(52116002)(186003)(26005)(41300700001)(5660300002)(44832011)(30864003)(66476007)(66556008)(66946007)(8936002)(8676002)(6916009)(86362001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DBkm+WnDIk1FsVTRNa3I3zypaLI0P8ztZKRRHU9q/xuMy8HsEnqK+Mw4UP1U?=
 =?us-ascii?Q?WrpzqtiQGTyyDfUnxOk0e9AfbaS5iA6/GSb6hAcXlRp3PPb5/W8GVnZhWTOQ?=
 =?us-ascii?Q?0qdCgJjCict8mNsDI5Y/23cLuWotmnw1uBXUC+GsoTjXPeGKThJCyc2Z8CbG?=
 =?us-ascii?Q?Wl4p22bpvuneJwxCmUpZnHnRQ+OKJr0hYJXWaozLpCRFX89XrkMFWfKQMzve?=
 =?us-ascii?Q?AmAT6vx6hxMzrUjjjgWhBaUXOiKYm5J3F4qHtje5l7J0k0G1OMPkmgsgZmBx?=
 =?us-ascii?Q?BFaG6aBqAj/WvkoQnlf128OM5e5TnnjYbaGEBtMOSMlzZqsdxvWtrBw+Hy0U?=
 =?us-ascii?Q?4a8RbxpLbKtxUBTWv5T2e1tzy4CKiXZdg0nHcFQgxlXXJ+igV3PsWkRIbbnT?=
 =?us-ascii?Q?0SY6qgtQpzYB3T6RCvjfs6j77g1ycFYsbG6thWyA0yM8eun0qGng2o/Qe6PG?=
 =?us-ascii?Q?ZQvkrjZ/jl8f3x1htHlKrlIpK4l4/HmzNX2nNYvHYoIOfoWupVmD9z6GZtAl?=
 =?us-ascii?Q?Aazh9D/dRhWE00XmQGxsoQdlI6Sv2VKKK7nLVwgBDnx5VgvVCKKIpa5VRnHH?=
 =?us-ascii?Q?zcfzRwSv22g+/kJMz9s6VeyZSJ61dbN8gbMBF5Vz/Dqef7zvsTLpZGt1vAy4?=
 =?us-ascii?Q?1CEGy6CgeB5jm/bQFVKw5FhWA7x5yn4E3fSjHUShfx+pQKG8a8p0D0G6k8Q5?=
 =?us-ascii?Q?2zZFatv8YVpdSAwexB44i4cpYl/k85VihU0tnb4R5rE05wU+WgQsxgBOs2Qq?=
 =?us-ascii?Q?QjaT8fl8d/OLSGmxwh+Me9NxlGlofzDlNSEPxvsoVkQ4O01uaZpbxHhD9i4u?=
 =?us-ascii?Q?NLgG0Vmdyca+hqcMc3T2r/hCKz9vl6mThtjK6Tg9iW4SFf6AXk8DcLbm+aF+?=
 =?us-ascii?Q?se16Uls1va78sTDmA5lF2W0CwQQ18QJ3F4Mh/xiwfezDnBPwprdm1KU69yRC?=
 =?us-ascii?Q?aRvHPYX7aqJ0U1qV+hrgrInKKP3rOuuBzyUtTvqO9CtKfLTbwhhu6qKpezha?=
 =?us-ascii?Q?nUF+cA8xhdWHTkje1zk2Yd4nlvBNjUueae+8IkWjAuoXzCiPD1GMJkLYSqr/?=
 =?us-ascii?Q?WBpKLowcV4XHnxXx+OzlFBVPSSTGJxB5ymCbNnkeA+3SkOJ7u78fCKDcGyTr?=
 =?us-ascii?Q?RuC6xGGogji0yprW3AqiTjJk8sV3Y4X5CCBesPZqHlGtx8Pe87QNOfrFuDxG?=
 =?us-ascii?Q?OQMd1q4x2cbBL+wEqVqSL1PqiHre6SHwHfuAt9RizJuFHBQWvvtwBZecsBj+?=
 =?us-ascii?Q?swMtxUJ30E9P3+GbUGow99Stdn+K2JdDrC49CC2U2ZHefwVQJIlUedStSGxY?=
 =?us-ascii?Q?rM119bx7Z/OAZ0IgPUOY5NmoMKZO//89TbfVdkDnG14IRuch7srLL7VxJUlo?=
 =?us-ascii?Q?5nxnfM5pLxcRuQpMkfqySCLik2dHjA9eQAaw91+TX6G+g+pLEJHhEVtaSzwT?=
 =?us-ascii?Q?i2c38SKHm0VWRHjyKjlDIZBkT7Y0McWRlFcvV6bDuw+d/RpojpWtumZQQb/t?=
 =?us-ascii?Q?7RxJvXH+4xTWoNJV03Vq67BG2wVH9AyCSzC2EABXg0huxZguxJvGZOs07szD?=
 =?us-ascii?Q?XJ8PuWDY2V3RBRKM/2t9pEhVKZr6kxtpBDU1kaU3u2OXamnbcUHi5gKBF5a2?=
 =?us-ascii?Q?XA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d0bf19-fa91-494b-a61d-08db1e32627c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 11:03:15.5559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LUrqrHmLnUQ2xu67vuvRV2G10zzwajVQgQD71VcffPSmx+x6PMYFiYIW+8OMX4yJhOnT67jK2p6x8PKCOqzRQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8257
X-Proofpoint-GUID: mAJ2KwBUj74OxPZ9easUVhVnHXCSCKc9
X-Proofpoint-ORIG-GUID: mAJ2KwBUj74OxPZ9easUVhVnHXCSCKc9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_03,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303060095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Mar 2023 11:03:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101396

Drop backport patch.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...netfilter-cthelper-visibility-hidden.patch | 382 ------------------
 .../libnetfilter-cthelper_1.0.0.bb            |  17 -
 .../libnetfilter-cthelper_1.0.1.bb            |  17 +
 3 files changed, 17 insertions(+), 399 deletions(-)
 delete mode 100644 meta-networking/recipes-filter/libnetfilter/files/libnetfilter-cthelper-visibility-hidden.patch
 delete mode 100644 meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.0.bb
 create mode 100644 meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.1.bb

diff --git a/meta-networking/recipes-filter/libnetfilter/files/libnetfilter-cthelper-visibility-hidden.patch b/meta-networking/recipes-filter/libnetfilter/files/libnetfilter-cthelper-visibility-hidden.patch
deleted file mode 100644
index e717d5b0e..000000000
--- a/meta-networking/recipes-filter/libnetfilter/files/libnetfilter-cthelper-visibility-hidden.patch
+++ /dev/null
@@ -1,382 +0,0 @@
-From f58c5b09fb59baf07c942d373fc4d522b27e73c6 Mon Sep 17 00:00:00 2001
-From: Kevin Cernekee <cernekee@chromium.org>
-Date: Wed, 4 Jan 2017 14:30:26 -0800
-Subject: Use __EXPORTED rather than EXPORT_SYMBOL
-
-clang is sensitive to the ordering of
-__attribute__((visibility("default"))) relative to the function
-body.  gcc is not.  So if we try to re-declare an existing function
-with default visibility, clang prints a warning and generates
-a broken .so file in which nfct_helper_* are not exported to library
-callers.
-
-Move the attribute up into the function definition to make clang happy.
-
-Signed-off-by: Kevin Cernekee <cernekee@chromium.org>
-Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
----
- doxygen.cfg.in              |  2 +-
- src/internal.h              |  5 ++-
- src/libnetfilter_cthelper.c | 83 ++++++++++++++++++---------------------------
- 3 files changed, 36 insertions(+), 54 deletions(-)
-
-Index: libnetfilter_cthelper-1.0.0/doxygen.cfg.in
-===================================================================
---- libnetfilter_cthelper-1.0.0.orig/doxygen.cfg.in
-+++ libnetfilter_cthelper-1.0.0/doxygen.cfg.in
-@@ -72,7 +72,7 @@ RECURSIVE              = YES
- EXCLUDE                = 
- EXCLUDE_SYMLINKS       = NO
- EXCLUDE_PATTERNS       = */.git/* .*.d
--EXCLUDE_SYMBOLS        = EXPORT_SYMBOL
-+EXCLUDE_SYMBOLS        = 
- EXAMPLE_PATH           = 
- EXAMPLE_PATTERNS       = 
- EXAMPLE_RECURSIVE      = NO
-Index: libnetfilter_cthelper-1.0.0/src/internal.h
-===================================================================
---- libnetfilter_cthelper-1.0.0.orig/src/internal.h
-+++ libnetfilter_cthelper-1.0.0/src/internal.h
-@@ -3,10 +3,9 @@
- 
- #include "config.h"
- #ifdef HAVE_VISIBILITY_HIDDEN
--#	define __visible	__attribute__((visibility("default")))
--#	define EXPORT_SYMBOL(x)	typeof(x) (x) __visible
-+#	define __EXPORTED	__attribute__((visibility("default")))
- #else
--#	define EXPORT_SYMBOL
-+#	define __EXPORTED
- #endif
- 
- #endif
-Index: libnetfilter_cthelper-1.0.0/src/libnetfilter_cthelper.c
-===================================================================
---- libnetfilter_cthelper-1.0.0.orig/src/libnetfilter_cthelper.c
-+++ libnetfilter_cthelper-1.0.0/src/libnetfilter_cthelper.c
-@@ -99,17 +99,16 @@ struct nfct_helper {
-  * In case of success, this function returns a valid pointer, otherwise NULL
-  * s returned and errno is appropriately set.
-  */
--struct nfct_helper *nfct_helper_alloc(void)
-+struct nfct_helper __EXPORTED *nfct_helper_alloc(void)
- {
- 	return calloc(1, sizeof(struct nfct_helper));
- }
--EXPORT_SYMBOL(nfct_helper_alloc);
- 
- /**
-  * nfct_helper_free - release one helper object
-  * \param nfct_helper pointer to the helper object
-  */
--void nfct_helper_free(struct nfct_helper *h)
-+void __EXPORTED nfct_helper_free(struct nfct_helper *h)
- {
- 	int i;
- 
-@@ -119,7 +118,6 @@ void nfct_helper_free(struct nfct_helper
- 			free(h->expect_policy[i]);
- 	}
- }
--EXPORT_SYMBOL(nfct_helper_free);
- 
- /**
-  * nfct_helper_policy_alloc - allocate a new helper policy object
-@@ -127,21 +125,19 @@ EXPORT_SYMBOL(nfct_helper_free);
-  * In case of success, this function returns a valid pointer, otherwise NULL
-  * s returned and errno is appropriately set.
-  */
--struct nfct_helper_policy *nfct_helper_policy_alloc(void)
-+struct nfct_helper_policy __EXPORTED *nfct_helper_policy_alloc(void)
- {
- 	return calloc(1, sizeof(struct nfct_helper_policy));
- }
--EXPORT_SYMBOL(nfct_helper_policy_alloc);
- 
- /**
-  * nfct_helper_free - release one helper policy object
-  * \param nfct_helper pointer to the helper object
-  */
--void nfct_helper_policy_free(struct nfct_helper_policy *p)
-+void __EXPORTED nfct_helper_policy_free(struct nfct_helper_policy *p)
- {
- 	free(p);
- }
--EXPORT_SYMBOL(nfct_helper_policy_free);
- 
- /**
-  * nfct_helper_policy_attr_set - set one attribute of the helper object
-@@ -149,7 +145,7 @@ EXPORT_SYMBOL(nfct_helper_policy_free);
-  * \param type attribute type you want to set
-  * \param data pointer to data that will be used to set this attribute
-  */
--void
-+void __EXPORTED
- nfct_helper_policy_attr_set(struct nfct_helper_policy *p,
- 			    enum nfct_helper_policy_attr_type type,
- 			    const void *data)
-@@ -170,7 +166,6 @@ nfct_helper_policy_attr_set(struct nfct_
- 		break;
- 	}
- }
--EXPORT_SYMBOL(nfct_helper_policy_attr_set);
- 
- /**
-  * nfct_helper_attr_set_str - set one attribute the helper object
-@@ -178,23 +173,21 @@ EXPORT_SYMBOL(nfct_helper_policy_attr_se
-  * \param type attribute type you want to set
-  * \param name string that will be used to set this attribute
-  */
--void
-+void __EXPORTED
- nfct_helper_policy_attr_set_str(struct nfct_helper_policy *p,
- 				enum nfct_helper_policy_attr_type type,
- 				const char *name)
- {
- 	nfct_helper_policy_attr_set(p, type, name);
- }
--EXPORT_SYMBOL(nfct_helper_policy_attr_set_str);
- 
--void
-+void __EXPORTED
- nfct_helper_policy_attr_set_u32(struct nfct_helper_policy *p,
- 				enum nfct_helper_policy_attr_type type,
- 				uint32_t value)
- {
- 	nfct_helper_policy_attr_set(p, type, &value);
- }
--EXPORT_SYMBOL(nfct_helper_policy_attr_set_u32);
- 
- /**
-  * nfct_helper_attr_set - set one attribute of the helper object
-@@ -202,7 +195,7 @@ EXPORT_SYMBOL(nfct_helper_policy_attr_se
-  * \param type attribute type you want to set
-  * \param data pointer to data that will be used to set this attribute
-  */
--void
-+void __EXPORTED
- nfct_helper_attr_set(struct nfct_helper *h,
- 		     enum nfct_helper_attr_type type, const void *data)
- {
-@@ -250,7 +243,6 @@ nfct_helper_attr_set(struct nfct_helper
- 		break;
- 	}
- }
--EXPORT_SYMBOL(nfct_helper_attr_set);
- 
- /**
-  * nfct_helper_attr_set_str - set one attribute the helper object
-@@ -258,44 +250,40 @@ EXPORT_SYMBOL(nfct_helper_attr_set);
-  * \param type attribute type you want to set
-  * \param name string that will be used to set this attribute
-  */
--void
-+void __EXPORTED
- nfct_helper_attr_set_str(struct nfct_helper *nfct_helper, enum nfct_helper_attr_type type,
- 		    const char *name)
- {
- 	nfct_helper_attr_set(nfct_helper, type, name);
- }
--EXPORT_SYMBOL(nfct_helper_attr_set_str);
- 
--void
-+void __EXPORTED
- nfct_helper_attr_set_u8(struct nfct_helper *nfct_helper,
- 			 enum nfct_helper_attr_type type, uint8_t value)
- {
- 	nfct_helper_attr_set(nfct_helper, type, &value);
- }
--EXPORT_SYMBOL(nfct_helper_attr_set_u8);
- 
--void
-+void __EXPORTED
- nfct_helper_attr_set_u16(struct nfct_helper *nfct_helper,
- 			 enum nfct_helper_attr_type type, uint16_t value)
- {
- 	nfct_helper_attr_set(nfct_helper, type, &value);
- }
--EXPORT_SYMBOL(nfct_helper_attr_set_u16);
- 
--void
-+void __EXPORTED
- nfct_helper_attr_set_u32(struct nfct_helper *nfct_helper,
- 			 enum nfct_helper_attr_type type, uint32_t value)
- {
- 	nfct_helper_attr_set(nfct_helper, type, &value);
- }
--EXPORT_SYMBOL(nfct_helper_attr_set_u32);
- 
- /**
-  * nfct_helper_attr_unset - unset one attribute the helper object
-  * \param nfct_helper pointer to the helper object
-  * \param type attribute type you want to set
-  */
--void
-+void __EXPORTED
- nfct_helper_attr_unset(struct nfct_helper *nfct_helper, enum nfct_helper_attr_type type)
- {
- 	switch(type) {
-@@ -307,7 +295,6 @@ nfct_helper_attr_unset(struct nfct_helpe
- 		break;
- 	}
- }
--EXPORT_SYMBOL(nfct_helper_attr_unset);
- 
- /**
-  * nfct_helper_attr_get - get one attribute the helper object
-@@ -317,8 +304,9 @@ EXPORT_SYMBOL(nfct_helper_attr_unset);
-  * This function returns a valid pointer to the attribute data. If a
-  * unsupported attribute is used, this returns NULL.
-  */
--const void *nfct_helper_attr_get(struct nfct_helper *helper,
--				 enum nfct_helper_attr_type type)
-+const void __EXPORTED *
-+nfct_helper_attr_get(struct nfct_helper *helper,
-+		     enum nfct_helper_attr_type type)
- {
- 	const void *ret = NULL;
- 
-@@ -358,7 +346,6 @@ const void *nfct_helper_attr_get(struct
- 	}
- 	return ret;
- }
--EXPORT_SYMBOL(nfct_helper_attr_get);
- 
- /**
-  * nfct_helper_attr_get_str - get one attribute the helper object
-@@ -368,13 +355,12 @@ EXPORT_SYMBOL(nfct_helper_attr_get);
-  * This function returns a valid pointer to the beginning of the string.
-  * If the attribute is unsupported, this returns NULL.
-  */
--const char *
-+const char __EXPORTED *
- nfct_helper_attr_get_str(struct nfct_helper *nfct_helper,
- 			 enum nfct_helper_attr_type type)
- {
- 	return (const char *)nfct_helper_attr_get(nfct_helper, type);
- }
--EXPORT_SYMBOL(nfct_helper_attr_get_str);
- 
- /**
-  * nfct_helper_attr_get_u8 - get one attribute the helper object
-@@ -384,12 +370,12 @@ EXPORT_SYMBOL(nfct_helper_attr_get_str);
-  * This function returns a unsigned 8-bits integer. If the attribute is
-  * unsupported, this returns NULL.
-  */
--uint8_t nfct_helper_attr_get_u8(struct nfct_helper *nfct_helper,
--				  enum nfct_helper_attr_type type)
-+uint8_t __EXPORTED
-+nfct_helper_attr_get_u8(struct nfct_helper *nfct_helper,
-+			enum nfct_helper_attr_type type)
- {
- 	return *((uint8_t *)nfct_helper_attr_get(nfct_helper, type));
- }
--EXPORT_SYMBOL(nfct_helper_attr_get_u8);
- 
- /**
-  * nfct_helper_attr_get_u16 - get one attribute the helper object
-@@ -399,12 +385,12 @@ EXPORT_SYMBOL(nfct_helper_attr_get_u8);
-  * This function returns a unsigned 16-bits integer. If the attribute is
-  * unsupported, this returns NULL.
-  */
--uint16_t nfct_helper_attr_get_u16(struct nfct_helper *nfct_helper,
--				  enum nfct_helper_attr_type type)
-+uint16_t __EXPORTED
-+nfct_helper_attr_get_u16(struct nfct_helper *nfct_helper,
-+			 enum nfct_helper_attr_type type)
- {
- 	return *((uint16_t *)nfct_helper_attr_get(nfct_helper, type));
- }
--EXPORT_SYMBOL(nfct_helper_attr_get_u16);
- 
- /**
-  * nfct_helper_attr_get_u32 - get one attribute the helper object
-@@ -414,12 +400,12 @@ EXPORT_SYMBOL(nfct_helper_attr_get_u16);
-  * This function returns a unsigned 32-bits integer. If the attribute is
-  * unsupported, this returns NULL.
-  */
--uint32_t nfct_helper_attr_get_u32(struct nfct_helper *nfct_helper,
--				  enum nfct_helper_attr_type type)
-+uint32_t __EXPORTED
-+nfct_helper_attr_get_u32(struct nfct_helper *nfct_helper,
-+			 enum nfct_helper_attr_type type)
- {
- 	return *((uint32_t *)nfct_helper_attr_get(nfct_helper, type));
- }
--EXPORT_SYMBOL(nfct_helper_attr_get_u32);
- 
- /**
-  * nfct_helper_snprintf - print helper object into one buffer
-@@ -431,9 +417,10 @@ EXPORT_SYMBOL(nfct_helper_attr_get_u32);
-  * This function returns -1 in case that some mandatory attributes are
-  * missing. On sucess, it returns 0.
-  */
--int nfct_helper_snprintf(char *buf, size_t size,
--			 struct nfct_helper *helper,
--			 unsigned int type, unsigned int flags)
-+int __EXPORTED
-+nfct_helper_snprintf(char *buf, size_t size,
-+		     struct nfct_helper *helper,
-+		     unsigned int type, unsigned int flags)
- {
- 	int ret;
- 
-@@ -454,7 +441,6 @@ int nfct_helper_snprintf(char *buf, size
- 
- 	return ret;
- }
--EXPORT_SYMBOL(nfct_helper_snprintf);
- 
- /**
-  * @}
-@@ -490,7 +476,7 @@ EXPORT_SYMBOL(nfct_helper_snprintf);
-  * - Command NFNL_MSG_ACCT_DEL, to delete one specific nfct_helper object (if
-  *   unused, otherwise you hit EBUSY).
-  */
--struct nlmsghdr *
-+struct nlmsghdr __EXPORTED *
- nfct_helper_nlmsg_build_hdr(char *buf, uint8_t cmd,
- 			    uint16_t flags, uint32_t seq)
- {
-@@ -509,7 +495,6 @@ nfct_helper_nlmsg_build_hdr(char *buf, u
- 
- 	return nlh;
- }
--EXPORT_SYMBOL(nfct_helper_nlmsg_build_hdr);
- 
- static void
- nfct_helper_nlmsg_build_policy(struct nlmsghdr *nlh,
-@@ -530,7 +515,7 @@ nfct_helper_nlmsg_build_policy(struct nl
-  * \param nlh: netlink message that you want to use to add the payload.
-  * \param nfct_helper: pointer to a helper object
-  */
--void
-+void __EXPORTED
- nfct_helper_nlmsg_build_payload(struct nlmsghdr *nlh, struct nfct_helper *h)
- {
- 	struct nlattr *nest;
-@@ -593,7 +578,6 @@ nfct_helper_nlmsg_build_payload(struct n
- 	if (h->bitset & (1 << NFCTH_ATTR_STATUS))
- 		mnl_attr_put_u32(nlh, NFCTH_STATUS, ntohl(h->status));
- }
--EXPORT_SYMBOL(nfct_helper_nlmsg_build_payload);
- 
- static int
- nfct_helper_nlmsg_parse_tuple_cb(const struct nlattr *attr, void *data)
-@@ -795,7 +779,7 @@ nfct_helper_nlmsg_parse_attr_cb(const st
-  * This function returns -1 in case that some mandatory attributes are
-  * missing. On sucess, it returns 0.
-  */
--int
-+int __EXPORTED
- nfct_helper_nlmsg_parse_payload(const struct nlmsghdr *nlh,
- 				struct nfct_helper *h)
- {
-@@ -832,7 +816,6 @@ nfct_helper_nlmsg_parse_payload(const st
- 	}
- 	return 0;
- }
--EXPORT_SYMBOL(nfct_helper_nlmsg_parse_payload);
- 
- /**
-  * @}
diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.0.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.0.bb
deleted file mode 100644
index fea520d43..000000000
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.0.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "Netfilter connection tracking helper library"
-DESCRIPTION = "Userspace library providing a programming interface (API) to the Linux kernel netfilter user-space helper infrastructure"
-HOMEPAGE = "http://www.netfilter.org/projects/libnetfilter_cthelper/index.html"
-SECTION = "libs"
-LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
-DEPENDS = "libmnl"
-
-SRC_URI = "http://www.netfilter.org/projects/libnetfilter_cthelper/files/libnetfilter_cthelper-${PV}.tar.bz2;name=tar \
-           file://libnetfilter-cthelper-visibility-hidden.patch \
-"
-SRC_URI[tar.md5sum] = "b2efab1a3a198a5add448960ba011acd"
-SRC_URI[tar.sha256sum] = "07618e71c4d9a6b6b3dc1986540486ee310a9838ba754926c7d14a17d8fccf3d"
-
-S = "${WORKDIR}/libnetfilter_cthelper-${PV}"
-
-inherit autotools pkgconfig
diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.1.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.1.bb
new file mode 100644
index 000000000..ebb0eb232
--- /dev/null
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.1.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Netfilter connection tracking helper library"
+DESCRIPTION = "Userspace library providing a programming interface (API) to the Linux kernel netfilter user-space helper infrastructure"
+HOMEPAGE = "https://www.netfilter.org/projects/libnetfilter_cthelper/index.html"
+SECTION = "libs"
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+DEPENDS = "libmnl"
+
+SRC_URI = "https://www.netfilter.org/projects/libnetfilter_cthelper/files/libnetfilter_cthelper-${PV}.tar.bz2 \
+          "
+
+SRC_URI[md5sum] = "e59279645fe65d40dd7dfc82a797ca5b"
+SRC_URI[sha256sum] = "14073d5487233897355d3ff04ddc1c8d03cc5ba8d2356236aa88161a9f2dc912"
+
+S = "${WORKDIR}/libnetfilter_cthelper-${PV}"
+
+inherit autotools pkgconfig
-- 
2.25.1


