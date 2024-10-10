Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADBCD2445E
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 23:36:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.58948.1728603404667860858
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Oct 2024 16:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=00130c5401=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49AClH5B008712
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 16:36:44 -0700
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2042.outbound.protection.outlook.com [104.47.74.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4230r4e76t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 16:36:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KxmOlK46nCL36tWZWQbNb7TvTBZ91UQe6iD66KjzAX2dm91PMKvHnU7mk5nFu2qebzAv3PWfSWPWkCzFc5UA0Rflq0o0ZXKgjZG6Uu29mUxF/5xhMQgFCBMQL8oxmaKcgdkmDvwsdlog9G96pj8wbcDx+AiN0tjOA+2waSXZMqoa6yWM3fBFU8nWnSaiSe4/TLdjVcucIU7fKAUXSQc9trPG2pwYUVawgjXFy35b/HCBoSQ+X4qMIPDFWpq12wVrxTlZxQ3nkqOTav8TzMcE3saC8QswjQyQn1d3QV1g3/lG1IgUgWmegVa87kWIF/gnv0e/yhrO8h2hdf0oJdmKSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fD5OoomYZ6TMaU0NCtvNdmZpbN4/TiUW2I1HLSLGwpM=;
 b=yXSvER5wWvV6xYzqPhobId6r7YwAmQkbYatLQUAWGHvnXZ8I9gVPd3EwAP8lhEvO2Ras9lL9aWpHZlHK+oWVoyq0+mr35FAjIuOjW0ANivsdxn4nGk6YG7czeOEq8aX4rqkENYWuq7LUKH6rEaeQa2e73l+ciBhC9cEqgfodRswiUuYl8RH0M7xaRJNowePPgTf6ArMxu74RmGphYRsmb99Q+El4/XvRO6z8o0o3y6aJ3WO2D1P6waL0hYwZt1b6Okql+sF0Q5rbTajSf9wHIafW8kYsEEqeCebw4vKPT3gUaN/j42yZ0GnYqMgJkT54J25sO/dZnxcEKSWYvmLTgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DM6PR11MB4739.namprd11.prod.outlook.com (2603:10b6:5:2a0::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.16; Thu, 10 Oct 2024 23:36:39 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8048.017; Thu, 10 Oct 2024
 23:36:39 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] tigervnc: upgrade 1.11.0 -> 1.14.0
Date: Fri, 11 Oct 2024 07:36:23 +0800
Message-Id: <20241010233623.1902296-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241010233623.1902296-1-yi.zhao@windriver.com>
References: <20241010233623.1902296-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0048.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::17) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DM6PR11MB4739:EE_
X-MS-Office365-Filtering-Correlation-Id: 84a9243e-1638-40aa-8e92-08dce984634d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8ngTklJRaYVdoHrodDOD4gBHAtB+5Gt36rVMUmlcWUkg8b3686pwvrF55Aa3?=
 =?us-ascii?Q?Te0ArCQjThbpmDc9UfMTJmCf2/6gpLugX61hDM3NbEGgGGBdxXSKsXP6VNjL?=
 =?us-ascii?Q?wQ7f9md7/I9JfV6UG38494U1g+vvP7sfUNBem+k6ZyMMUuLLRHCmSW1JBrN2?=
 =?us-ascii?Q?ZIMvymNA4j/CVOkCMY8vrZ6gMcd+kntxgCsC9xNn++4oJNzt01brHQreymsw?=
 =?us-ascii?Q?ojQOO5HMxO3utb2bz0kwhEmj/4L6IF2TicShDdIbMcICyrnHAFg+ddUvNivf?=
 =?us-ascii?Q?D9h7DShNwEbiMcEeAKZ2c3emp1GifYbf87daG6U5LNxhFv+dApeml2naPb2G?=
 =?us-ascii?Q?tTiRCJw0w6Yt51FrA6b8GWF/v5BCLfXsHENunW9HD2/4Jo1BPVZEMby0QGaO?=
 =?us-ascii?Q?jXOefvQtP+iDwrfDZF8UyKX/0038dV7YRwB7ztKkaDhrJLjqkqwPiWMm1ESF?=
 =?us-ascii?Q?6Q1Jv2yoLXqWViYpKfdX9jFgOR/olzI9YwUGWqmBHGsCuK7MK5FzXJTeApab?=
 =?us-ascii?Q?tyoYiciq374SrcgLMuMoB6hNx1iuJrskfwY2PnLH1WJEJWo90L9f7oHIwxnX?=
 =?us-ascii?Q?tjTFP/nBpZo94vr/UMsd4H7ozE57+x1H2skExbiApEF8O1/9yqO6rq4uSyru?=
 =?us-ascii?Q?CGHHMpzpAh92uYP5YA7smqwSdV81sWSn5Y+EDD4/R9dvUBx43aW7BWxaEoLZ?=
 =?us-ascii?Q?QnMUUhchNnn5KLee+H1NFytFZ9TQVMpvsUIIl9nW0z28VaCiyxdlF4i9WYgO?=
 =?us-ascii?Q?YFCaihX8dr2LUS4lnZDuOeknJSZXkvLNuOv5XvtXdKbGtyFTF4nPIKdjZ2M1?=
 =?us-ascii?Q?JC6TmX1UQkPbWP+yZ/N+YIlpoJyJcMVZm7FN+L4ZrmviT0hEtDR7kBhTx6rj?=
 =?us-ascii?Q?MjM/LetyroKEhpgXFl1XuYCl4MlwDKHrUnuKNDpMXMO+ry8r741NO3Z7kOu9?=
 =?us-ascii?Q?S7dI3f9YbYIFI1GWaN/lwxZ/JxlXRCHkijlnsfzRKkA5BMYl0d7uRVJjuyaJ?=
 =?us-ascii?Q?nAg/kd2AdG1vB/H82qiJiK52ET3tdfTRqeXQ+Vdjp/haUt2eWVGlvufjwtX0?=
 =?us-ascii?Q?T/9uGbSqHZpxnOqH/ritE7jEvkkwwpg1W/TNGCK1k2vpodbGLce0+X0D/i62?=
 =?us-ascii?Q?iK2hTXCpMlhOaMumZ2KGP4mN3qmNV1HSzZoD+U9Eyn5uwnT+kjUO4dvdn93X?=
 =?us-ascii?Q?KrEJOT2wkc7dBzF4Un8DzVLOoIvvB8aAMJaifF9yuN6wyPRDvZoFeYsYtDeS?=
 =?us-ascii?Q?zDQRPk6xgYhjoEZyeu8XrBWM+T4MczgRCjm8dG/xza2AAxHrpg7NctYzxAO3?=
 =?us-ascii?Q?Za0AIdGiZqj0u7gzKzuD/dU/R8fWJF38jKt0ydrj4wGNrA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YZYOC/4CdninNXVlRKvEzBSMdp2McEDoIFQHiYnltB39lg/zhY55IusWDhPB?=
 =?us-ascii?Q?EGialf7VOfkiSofA3nweTUKVnuK4J6dbOcJGoe4Fobtxvx5dRIjRijwVsONb?=
 =?us-ascii?Q?J407BlznKN9EC6xe1WVtYprQgRJLEsLPNGhLH6rwV9q1Oy5OM2nLwIlVvnf8?=
 =?us-ascii?Q?R48+c15MYgUqey95lgm73uAsBcJ7DahjKW8p46Z+2awP3Zis3tY4Bt5f6CjX?=
 =?us-ascii?Q?TOMGM5dClTujz8Tn8Pkqv55bTkupCVcJKBIzYAZNnb/5OJCxKEOVqtqYLrvh?=
 =?us-ascii?Q?+QKwpGCdiVV5RLcMFqWzp0g3SZNPPx0dvXdBxiZoqucJ3gGwkIruZoW9hgU1?=
 =?us-ascii?Q?EsBR1siFSR7VH4dnrzxwGVtlozjAim5RGf++W+vPx8ULjzUtaDjXK4X15h4u?=
 =?us-ascii?Q?7UPgH/dZOIUrprO1IMjGmUcjC2J8Xdf22z3PCobrWmXmsW0FXq+zQB3aCbiQ?=
 =?us-ascii?Q?9d1GNLCFJqG5N8RFI+0zxB46wkm9N5PEiUq0EHjGm4qfu37BlrJqIkhbD/wq?=
 =?us-ascii?Q?aOTS1GysAftKa1ywTcnswKZ9H69r0X8UV+wHxOvi2QBBr3BJ1R0YXUOYDfY5?=
 =?us-ascii?Q?o7UrZon9WH1CJt/P/LSUMaL8+G09PmQ7tgLkbpXIjf2QSz+oGgBfVQ4fwizN?=
 =?us-ascii?Q?mNPVp9ib4Zs/Dz4Ktcgr50IX+5giqNeB+Pm8LM9JFNksIIt+biWrk7vdtNz8?=
 =?us-ascii?Q?41kUqQTf8AxmO/P5KvTCkwtmnA8YOYSC1xYTtMoJBSu8PaX8Zak58R9/lBB+?=
 =?us-ascii?Q?A45qMNBOXZUeoUF9oZjX5/tGyjHnPt/5RSq/i2YV9XcDTGTJbJKhqdglPAkz?=
 =?us-ascii?Q?xVDk7PTJp6Qb2M3BgDyQ/m3SOD7irylOOBULbzh81OPuKBM9qosuAR4Uce5s?=
 =?us-ascii?Q?HRxKKZDvcha+kY5v5itTpVKB9qp5cYUl5P0EVCGi1DAIVUew5UgHCgjgM61j?=
 =?us-ascii?Q?TLmnX0xCvG5RCHSouYj+wZtmslWa8Q+NLuFe4FFg+2sBBWUqsweqHr5XNqKq?=
 =?us-ascii?Q?0XfdtrZH1FAorzR5+4sjTJbEfsTCB3eDN2Bk9s65chYf3PuqMjOKEmoU++26?=
 =?us-ascii?Q?xFkTkHPzGAMux20qYcMj+ByKIl1zEO0RCZ6XcaMSrTHJNcKwnoFaoE2rVYlW?=
 =?us-ascii?Q?N8hVYs6tQzOPnTsaAku5u8T/9h0Ez+BZJeYUXU+GuaqjB7r4E8NoWthUVHUH?=
 =?us-ascii?Q?pUq7CkzJiSleYgKCh5VHtW6jSmWsCQOOoRtTUxTIQbvgJM3fkcnjyG2jsmk5?=
 =?us-ascii?Q?yRY/KLaTlBUvhOWZzD7ZLIWY/zQ9K7ANrM6Z6jW6By/nO8FMQn3nR6ZTr7XS?=
 =?us-ascii?Q?P9lqDPwSkgJ8gWxQI3KHIXLU2DVfGcA0Kcc+GKDXP/G0VBUupQglP3h2oLKe?=
 =?us-ascii?Q?P3Anv9A9PBc093869Lhl+rmpiYC2844u6xTeXT9cymnlT/6YSA1lUGC77btG?=
 =?us-ascii?Q?KE/Sqwx2E7TodyzRS2jTPDq+NJOZXpaSc+4gUHbZYP+pOtDoAolnG1K0lTa8?=
 =?us-ascii?Q?kfyrWnNFvcvKLkpBHkVY3RJ7MP7A7HoaIm5lOtgP3J4P05P3csGL/GWcqBg1?=
 =?us-ascii?Q?gFlBQ/dLSjD7tD2Un/dH1P6rp9mSUoH7srBWXBsE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84a9243e-1638-40aa-8e92-08dce984634d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 23:36:39.2315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iikT9nW4drC+Oc3yrv3oSCw62+/BQZS/wk55Oc/naFYOhe7OE7t8g+10MZWTRor5IDz6nqcrG7euqakertHJYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4739
X-Proofpoint-ORIG-GUID: nSTohN60UC5yMUSR-kpUy93kyeL2u5V9
X-Authority-Analysis: v=2.4 cv=bP1EI++Z c=1 sm=1 tr=0 ts=6708650b cx=c_pps a=CZyBIZNk7+VlD+/eRBofeA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=RKuA-lt40fQ3OubNNhIA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: nSTohN60UC5yMUSR-kpUy93kyeL2u5V9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-10_17,2024-10-10_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410100156
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 23:36:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112782

ChangeLog:
https://github.com/TigerVNC/tigervnc/releases/tag/v1.14.0

* Refresh patches
* Update xorg-server to 21.1.13

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...01-do-not-build-tests-sub-directory.patch} | 14 ++++-----
 ...g-dynamic-library-to-FLTK_LIBRARIES.patch} | 10 +++---
 ...nc-add-fPIC-option-to-COMPILE_FLAGS.patch} | 16 +++++-----
 ...{tigervnc_1.11.0.bb => tigervnc_1.14.0.bb} | 31 +++++++++----------
 4 files changed, 34 insertions(+), 37 deletions(-)
 rename meta-oe/recipes-graphics/tigervnc/files/{0002-do-not-build-tests-sub-directory.patch => 0001-do-not-build-tests-sub-directory.patch} (71%)
 rename meta-oe/recipes-graphics/tigervnc/files/{0003-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch => 0002-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch} (71%)
 rename meta-oe/recipes-graphics/tigervnc/files/{0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch => 0003-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch} (80%)
 rename meta-oe/recipes-graphics/tigervnc/{tigervnc_1.11.0.bb => tigervnc_1.14.0.bb} (80%)

diff --git a/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch b/meta-oe/recipes-graphics/tigervnc/files/0001-do-not-build-tests-sub-directory.patch
similarity index 71%
rename from meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch
rename to meta-oe/recipes-graphics/tigervnc/files/0001-do-not-build-tests-sub-directory.patch
index 5a42e67d0..0d58d2502 100644
--- a/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch
+++ b/meta-oe/recipes-graphics/tigervnc/files/0001-do-not-build-tests-sub-directory.patch
@@ -1,4 +1,4 @@
-From 076d0e12a7be6cd2108e4ca0dcde1cb658918fa5 Mon Sep 17 00:00:00 2001
+From e117ccc2b4ebb116ab63a3aa6097104964ee223b Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 19 Apr 2021 23:02:45 -0700
 Subject: [PATCH] do not build tests sub directory
@@ -12,19 +12,19 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 3 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7bf99441..bda80598 100644
+index 468f4b54..c47c9c0e 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -304,9 +304,6 @@ if(BUILD_VIEWER)
+@@ -351,9 +351,6 @@ if(BUILD_VIEWER)
    add_subdirectory(media)
  endif()
  
 -add_subdirectory(tests)
 -
 -
- add_subdirectory(release)
- 
- # uninstall
+ if(BUILD_VIEWER)
+   add_subdirectory(release)
+ endif()
 -- 
-2.30.2
+2.25.1
 
diff --git a/meta-oe/recipes-graphics/tigervnc/files/0003-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch b/meta-oe/recipes-graphics/tigervnc/files/0002-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch
similarity index 71%
rename from meta-oe/recipes-graphics/tigervnc/files/0003-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch
rename to meta-oe/recipes-graphics/tigervnc/files/0002-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch
index cfb84ac14..56bed4bbf 100644
--- a/meta-oe/recipes-graphics/tigervnc/files/0003-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch
+++ b/meta-oe/recipes-graphics/tigervnc/files/0002-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch
@@ -1,7 +1,7 @@
-From 6369a5be2af2ed1fa443f40f48deaf318d22713e Mon Sep 17 00:00:00 2001
+From 7ca0b0a4f8a37f9dbe461e28a731364b9aaa60bb Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 20 Jul 2017 05:06:00 -0400
-Subject: [PATCH 3/4] add missing dynamic library to FLTK_LIBRARIES
+Subject: [PATCH] add missing dynamic library to FLTK_LIBRARIES
 
 Upstream-Status: Pending
 
@@ -11,10 +11,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index fb72a00..5732dc8 100644
+index c47c9c0e..f4b576a0 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -246,6 +246,8 @@ if(UNIX AND NOT APPLE)
+@@ -270,6 +270,8 @@ if(BUILD_VIEWER)
    endif()
  endif()
  
@@ -24,5 +24,5 @@ index fb72a00..5732dc8 100644
  option(ENABLE_GNUTLS "Enable protocol encryption and advanced authentication" ON)
  if(ENABLE_GNUTLS)
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch b/meta-oe/recipes-graphics/tigervnc/files/0003-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch
similarity index 80%
rename from meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch
rename to meta-oe/recipes-graphics/tigervnc/files/0003-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch
index 5f14665b8..c292df4a5 100644
--- a/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch
+++ b/meta-oe/recipes-graphics/tigervnc/files/0003-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch
@@ -1,4 +1,4 @@
-From 7f8acd59bb2e54f9be25a98dd71534700a9e355a Mon Sep 17 00:00:00 2001
+From 36bf37cb638cd87d7f8eb96afaf69c2d95177614 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 19 Apr 2021 23:14:28 -0700
 Subject: [PATCH] tigervnc: add fPIC option to COMPILE_FLAGS
@@ -18,35 +18,35 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  3 files changed, 3 insertions(+)
 
 diff --git a/common/network/CMakeLists.txt b/common/network/CMakeLists.txt
-index d00ca452..e84e0290 100644
+index f08eaa31..85c05951 100644
 --- a/common/network/CMakeLists.txt
 +++ b/common/network/CMakeLists.txt
-@@ -16,4 +16,5 @@ endif()
+@@ -15,4 +15,5 @@ endif()
  
  if(UNIX)
    libtool_create_control_file(network)
 +  set_target_properties(network PROPERTIES COMPILE_FLAGS -fPIC)
  endif()
 diff --git a/common/rdr/CMakeLists.txt b/common/rdr/CMakeLists.txt
-index 989ba2f4..20f6489d 100644
+index 30c2403a..94e1ff98 100644
 --- a/common/rdr/CMakeLists.txt
 +++ b/common/rdr/CMakeLists.txt
-@@ -27,4 +27,5 @@ target_link_libraries(rdr ${RDR_LIBRARIES})
+@@ -35,4 +35,5 @@ endif()
  
  if(UNIX)
    libtool_create_control_file(rdr)
 +  set_target_properties(rdr PROPERTIES COMPILE_FLAGS -fPIC)
  endif()
 diff --git a/common/rfb/CMakeLists.txt b/common/rfb/CMakeLists.txt
-index fc5a37bf..7f5ce131 100644
+index 360434a9..28566e90 100644
 --- a/common/rfb/CMakeLists.txt
 +++ b/common/rfb/CMakeLists.txt
-@@ -99,4 +99,5 @@ target_link_libraries(rfb ${RFB_LIBRARIES})
+@@ -116,4 +116,5 @@ endif()
  
  if(UNIX)
    libtool_create_control_file(rfb)
 +  set_target_properties(rfb PROPERTIES COMPILE_FLAGS -fPIC)
  endif()
 -- 
-2.30.2
+2.25.1
 
diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.14.0.bb
similarity index 80%
rename from meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
rename to meta-oe/recipes-graphics/tigervnc/tigervnc_1.14.0.bb
index 668ca79dd..c5268fd2b 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.14.0.bb
@@ -15,21 +15,20 @@ REQUIRED_DISTRO_FEATURES = "x11 pam"
 
 B = "${S}"
 
-SRCREV = "540bfc3278e396321124d4b18a798ac2bc18b6ca"
+SRCREV = "4a09a96661624dff14662d6e9849e06a6c70ae03"
 
-SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.11-branch;protocol=https \
-           file://0002-do-not-build-tests-sub-directory.patch \
-           file://0003-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch \
-           file://0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch \
+SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.14-branch;protocol=https \
+           file://0001-do-not-build-tests-sub-directory.patch \
+           file://0002-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch \
+           file://0003-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch \
 "
 
 # Keep sync with xorg-server in oe-core
 XORG_PN ?= "xorg-server"
-XORG_PV ?= "1.20.6"
-SRC_URI += "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${XORG_PV}.tar.bz2;name=xorg"
+XORG_PV ?= "21.1.13"
+SRC_URI += "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${XORG_PV}.tar.xz;name=xorg"
 XORG_S = "${UNPACKDIR}/${XORG_PN}-${XORG_PV}"
-SRC_URI[xorg.md5sum] = "a98170084f2c8fed480d2ff601f8a14b"
-SRC_URI[xorg.sha256sum] = "6316146304e6e8a36d5904987ae2917b5d5b195dc9fc63d67f7aca137e5a51d1"
+SRC_URI[xorg.sha256sum] = "b45a02d5943f72236a360d3cc97e75134aa4f63039ff88c04686b508a3dc740c"
 
 # It is the directory containing the Xorg source for the
 # machine on which you are building TigerVNC.
@@ -37,16 +36,13 @@ XSERVER_SOURCE_DIR="${S}/unix/xserver"
 
 do_patch[postfuncs] += "do_patch_xserver"
 do_patch_xserver () {
-    for subdir in Xext xkb GL hw/xquartz/bundle hw/xfree86/common; do
-        install -d ${XSERVER_SOURCE_DIR}/$subdir
-    done
-
-    for subdir in hw/dmx/doc man doc hw/dmx/doxygen; do
-        install -d ${XSERVER_SOURCE_DIR}/$subdir
+    subdirs="Xext xkb GL hw/xquartz/bundle hw/xfree86/common man doc"
+    for i in ${subdirs}; do
+        install -d ${XSERVER_SOURCE_DIR}/$i
     done
 
     sources="hw/xquartz/bundle/cpprules.in man/Xserver.man doc/smartsched \
-             hw/dmx/doxygen/doxygen.conf.in xserver.ent.in xkb/README.compiled \
+             xserver.ent.in xkb/README.compiled \
              hw/xfree86/xorgconf.cpp hw/xfree86/Xorg.sh.in"
     for i in ${sources}; do
         install -m 0644 ${XORG_S}/$i ${XSERVER_SOURCE_DIR}/$i;
@@ -57,7 +53,7 @@ do_patch_xserver () {
     xargs tar cf - | (cd ${XSERVER_SOURCE_DIR} && tar xf -)
 
     cd ${XSERVER_SOURCE_DIR}
-    xserverpatch="${S}/unix/xserver120.patch"
+    xserverpatch="${S}/unix/xserver21.patch"
     echo "Apply $xserverpatch"
     patch -p1 -b --suffix .vnc < $xserverpatch
 }
@@ -127,6 +123,7 @@ do_install:append() {
 FILES:${PN} += " \
     ${libdir}/xorg/modules/extensions \
     ${datadir}/icons \
+    ${datadir}/metainfo \
     ${systemd_unitdir} \
 "
 
-- 
2.25.1


