Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A90C433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 20:41:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2552.1638391297674735219
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Dec 2021 12:41:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=o0SNQvBg;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=796984d3b6=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1B1JJYkG029585
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 1 Dec 2021 12:41:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=d3ExWWhbzwT761sXZnkM5IOQ29kcC117v++b8qChW4o=;
 b=o0SNQvBgq0fkZkJE+gtiLuirt4w+wAleBP/JYNH66ijI0UBh01Zv70OFDQECVdWm0Ro4
 tkm+v1FX1aOGPbbPGNBVNq+DJvsN/RgkaN9kzVkjyY9u3jmvS7FUi+bh9qHEV304MXXe
 NTaZgB9tpYnrnY/wKcqo5jIZPwbsNpk8YLtbmP1KmZGX3odHWumlYoU34WAkT+q4E5Zp
 uE7rerinT5yMybOIJSlvCkBj5Jhsq0o4sEzHjDW9/7xjI4wrRZe32YaQdeu3SsOf+K2X
 ywzeMTTWEl/lmPd3WeAlA8MR+/fdjgjxU1NB4bJmIkiePwMVPMZCHVMZK9xsdj+lteLL iQ==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cp4nqgm6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Dec 2021 12:41:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HZYTy0qwmKzZ7VcIvh1AJXWMYyUXguouUJYOwXSwvUzMW3m4GsNqALPOGvhwDRho8P31WkQUMTzT8XlvFBu6eEqJTjQj387r34wnkQWeW6n0lUXbt0gevslPsZZ5R9ZedIrETVbQUmuKWCeQK5L9t58tX7InIeeWnGaZux5iVG2NGiRwhm55UxJLy5TT347d+jqrubn1g15zXjfCS4zq8zTnYXMstUT7AFjXB2f23DbCLpRlZVWb3uCkUb8hewBS+Wq1JwfuI0UtykcjDXDCsfZt9mPsRvx1Ade1ChPTJVxJxzDQ9bv7iUrRiSDIkMHALIuFQBEMks+CDjPSMcjIVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3ExWWhbzwT761sXZnkM5IOQ29kcC117v++b8qChW4o=;
 b=nuhy3Kvpzc1NM8V7gokMQ9oVAQSfwWhV+zwsrfrndHjkrk0X+c/e4gmsJSsXm0UkmW2VxmvjP/CznT3sB/fiEp/V4poezbHGUOiWzDBf8nSo+tlXTtHG2yZcTPCDrUD528502NSTphLdlBOkXYAZsLkuKCrmQR1LHtZ0Q7r75AK7lK54TTqA8/rnV0Sqds1coKayi5V+e4eU9j38oyUdTwmHOcqFoE+5IxSvonnwxDHc3FaLXJ3FSYyrfutf+24R5yO6GA6GhV+4BWkAA2Ld9a32nTecQ0bwYruGQ0lYmw8YR4rfUkZQyQ5qbY7im9QnMtQ3BopGVSiXIoj65x9ClQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2535.namprd11.prod.outlook.com (2603:10b6:a02:be::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Wed, 1 Dec
 2021 20:41:33 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::ccb2:28ab:f000:8440]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::ccb2:28ab:f000:8440%3]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 20:41:32 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] libnftnl: upgrade 1.2.0 -> 1.2.1
Date: Wed,  1 Dec 2021 15:41:17 -0500
Message-Id: <20211201204117.9717-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR11CA0019.namprd11.prod.outlook.com
 (2603:10b6:208:23b::24) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
Received: from yow-lpggp3.wrs.com (128.224.252.2) by
 MN2PR11CA0019.namprd11.prod.outlook.com (2603:10b6:208:23b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Wed, 1 Dec 2021 20:41:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55a7ff97-7ba7-40e9-65a2-08d9b50af54e
X-MS-TrafficTypeDiagnostic: BYAPR11MB2535:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB25359656950498C3F8C1FE759F689@BYAPR11MB2535.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	W5op6lbqDeKhCQITgdOJNZtrDOtKcG0dt6C8WcpN4ebCeda8I5qSH7Hn+M60mt+3tLtPqSzhNGF7QMeXGQGmmYYhWyYjd03Fp37mO8OTmNNZoeIH2kV+Hh2Flh0Ca4RuBf2bFTKLwDG//s1WwKHZyQEB//nk0hzuLbWEw2makJW98hCv19pKtg3oO4tYldZR3t1NumvvhR5uEO7bxpZZJRmuTqZrMsFafH5ILitKL+WbGB5m3whaLTxri873gP2H7+AR1usq8C9Dc+qyTdeuw3y6pfoZqbC7nntp6FEwBWbdGXXdsQmG2z7anFfmrDmS8igS55gnmz3kcV1rzNhpGplQLO/O5gYNMSRpPWk0nOcBtXT8XEfoiu6tol434iPvkTzWQ3G6URlPidE2uxoR+uuiLpBvBovZdE2Rc7RqZ9QfmnvCnjwJfAezxfhgRtuUfzdaiM235bxlh3jn0seSBoe2OiUGMZ6VEJMkn6MDmVNN2fEiBO0zbvjQ4kmXiy3ikjmCDxoNhZY8RD14y7Vc5szbuzgPeMzPnKSSmTLUerp6igiQL/JjNAW9GvE3sa522v1w78IJcTX8rGTQfdfbL5znS7hhFljHXfaQUreV06jmRtu/zB2/Buf9Xm8XVqW31K2S7CeWZCTyZArSabuHdHcFjMO09OCb54bLB07wCJm5XREBq5XyA9QyfAs9ZbyMANDKTf9a6gTd70mzOJsWwA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(2906002)(6486002)(6506007)(38350700002)(1076003)(83380400001)(6916009)(5660300002)(2616005)(956004)(66946007)(6512007)(316002)(66476007)(508600001)(66556008)(44832011)(26005)(8676002)(52116002)(38100700002)(6666004)(86362001)(36756003)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XVHUUJi/4A7dnepy58CSW0vch2y4oSKHV7E/Jx3GUW7hQFPRJ3u7lCcFLdqU?=
 =?us-ascii?Q?TKYeCeYin2wmLs0H/RI/W1YIe1CaPZ3DoyDaVpQNB2/QxB7nswQUbSf5rOPx?=
 =?us-ascii?Q?oa2AQR1heAOYU44YfLuUT8S0vJWvWN9XXXRfD7VhY+BatoiA8yb8b0VxCDzW?=
 =?us-ascii?Q?dly8Q470Kmu3yGqqnZfMvtzKkhxViy/jiDSOHUbfatAfEoaSc2uAr77F913K?=
 =?us-ascii?Q?Zxaqtxyf95bVw4ru6mAeqqoKlfzwcuiMiEo8ea9LVquuv2hlRiXMxOACKYy4?=
 =?us-ascii?Q?+CpzMD1s00o/qWgeBsIBT6LplwvMIRq9NPKsmXlE5pYIY1ikbCOaSwn/C+TZ?=
 =?us-ascii?Q?hymUr1xrSz7pKDdmRE97MnuptO43AbbfnMkKnjLDCrbpUNdM750OIhc0sBam?=
 =?us-ascii?Q?Jnj+CTsM04Nu5TW5MZRjybIi8/hW9ONkRYzsAE8YXLY9Ls/pMkX3F5WTQrxV?=
 =?us-ascii?Q?loGG63q3nobuFBdsKkHnTdlHTFaPkkGugQ2Mtb9SmHaZtxhVYPayCc4c/cVL?=
 =?us-ascii?Q?j3gQRTMcTZnL+ius8QDgxJj/8o8eVWqtIiR8PqyJpjaArS0haes0ygM6fu/M?=
 =?us-ascii?Q?cWgqHiPOoka7sbrf15igmktZA8eXt3gzGZ+iNpU8K504KskFHUn0bTOOznQT?=
 =?us-ascii?Q?H5A4+EC/r/y19N1syuHrqkxW5T8I6T+sYsHQzQZKaoCY6gaC3GGHMY24bdCg?=
 =?us-ascii?Q?SQDE0EteFNdE2WVC8xc1F5vWeL8Tt/4rmTMjHuyphje4Cx7eSswPqvXIRmc7?=
 =?us-ascii?Q?uL6XG/pOjoEHmlVx9eajULPk2R/etZnupG+f5xnyYMG0Uo948HSYpdfUOpwZ?=
 =?us-ascii?Q?nZsoTlS86o3qjB7PFjgt6/ZUKeTp/4EH6PScQnoNRNpV7Vzn34ow/FycrITS?=
 =?us-ascii?Q?HoO2mdC4D77rm4IIkzjIW/ey/QE6AX3+Lb/XXa1B80J3kH/855X4UIb8XzeK?=
 =?us-ascii?Q?M9574IJ2Ohm0xNhKwnE0hYwose6xJ2q9dcUteh4wWSAhT0My8codY2wKLwkL?=
 =?us-ascii?Q?9s5B1udr56eyrNUK0Tb03pwTu+h7EoAcFqtDdjkV7oWKRAG1bEnOsa+/G3Q4?=
 =?us-ascii?Q?L5j4m8P9oTbJR91BBpARsxm5PIizhjUFa8SzhgQYtTwa+M2tMGXqWFaTQe/0?=
 =?us-ascii?Q?CBFnGOuPuylf5C+fxrdFuxiAhvEYwasOazPRKer18Lu0cStPFNin1rgXXSjq?=
 =?us-ascii?Q?qbUjt13ZzedIUjS+u1nmT7g/1u32yKNPgWiBrXZEFEOVg6yjjtr4pt2O4eM+?=
 =?us-ascii?Q?iPO3toPkJZmkPtOD2YBykWFJd7qrJiJ52wDRt2CnpMdn1baZMVKRck6+oozh?=
 =?us-ascii?Q?O0Vwyd6XALvUwWrQxo+O7lMwPjQGu7reIKEUBx4e1VNP+vyPvMwzu/soEjUO?=
 =?us-ascii?Q?9Cr2d6mQYXyU9Eb2CS/k1CtzzTGw+9C3lKjaaUoManQWMrIZHylhaU4jCs7k?=
 =?us-ascii?Q?IdMoMutB1/QxKIk8etQy/nhcEu+E01CBbsidOGj7Ofv+H+x2QurHNfkNphgZ?=
 =?us-ascii?Q?UkLrbXA5bU4egAl+0TFlbFZ4+LlefZ0O8ZDbxTCaZRzege2Aoj1vHe08A4UK?=
 =?us-ascii?Q?2osA3C1aFy/Zu3n1I8e2LiVIb9pq1no17fCt8+6Qpesb3MUypoQ5735jikXa?=
 =?us-ascii?Q?vmcNDRrwzDOqdvlvGQusRsR6dIwEeftEchiZeC444jWks/cWxr5W9f5oXbRn?=
 =?us-ascii?Q?pI4kdZQzCB5osyJhgONIKWXK+gg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 55a7ff97-7ba7-40e9-65a2-08d9b50af54e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 20:41:32.0901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CM73dhKH/QYhqx5RZcM1734Ay4pN1zLillE5p7X2rqMoyV+OtrXjQnc7DXTiYfhnvgiL0kUfFRW1bxRqSU5YmUyCDfV8MAUfNWS/Y+2MiyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2535
X-Proofpoint-ORIG-GUID: d5mjSPmSFc3mNzDZL2wRa1TNk0Ixyi_s
X-Proofpoint-GUID: d5mjSPmSFc3mNzDZL2wRa1TNk0Ixyi_s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-30_10,2021-12-01_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112010109
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Dec 2021 20:41:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94165

Also fix patch contributor name in the process of reworking it to apply
on the new 1.2.1 release (I had accidentally modified it when reworking
it previously).

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 ...cal-function-as-one-of-printf-family.patch | 29 ++++++++++++++-----
 .../{libnftnl_1.2.0.bb => libnftnl_1.2.1.bb}  |  2 +-
 2 files changed, 23 insertions(+), 8 deletions(-)
 rename meta-networking/recipes-filter/libnftnl/{libnftnl_1.2.0.bb => libnftnl_1.2.1.bb} (89%)

diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl/0001-avoid-naming-local-function-as-one-of-printf-family.patch b/meta-networking/recipes-filter/libnftnl/libnftnl/0001-avoid-naming-local-function-as-one-of-printf-family.patch
index 62328203d..68eb04a83 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl/0001-avoid-naming-local-function-as-one-of-printf-family.patch
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl/0001-avoid-naming-local-function-as-one-of-printf-family.patch
@@ -1,6 +1,6 @@
-From c29959e045dd09d0b5727682d4e9dbc10923ac4f Mon Sep 17 00:00:00 2001
-From: Trevor Gamblin <trevor.gamblin@windriver.com>
-Date: Wed, 2 Jun 2021 11:08:51 -0400
+From e03b003610a176d608da9a02e433e7ded7e4b75f Mon Sep 17 00:00:00 2001
+From: Todd Cunningham <tcunningham07@gmail.com>
+Date: Wed, 11 Dec 2019 10:18:56 +1000
 Subject: [PATCH] avoid naming local function as one of printf family
 
 Fixes build issues with clang
@@ -14,6 +14,9 @@ Signed-off-by: Todd Cunningham <tcunningham07@gmail.com>
 
 Use wiggle to get the patch to apply for version 1.2.0.
 
+Add the same change in src/expr/last.c to make the patch apply for
+1.2.1. Also correct the patch to show the original author and metadata.
+
 Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
 ---
  include/expr_ops.h      | 2 +-
@@ -33,6 +36,7 @@ Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
  src/expr/fwd.c          | 2 +-
  src/expr/hash.c         | 2 +-
  src/expr/immediate.c    | 2 +-
+ src/expr/last.c         | 2 +-
  src/expr/limit.c        | 2 +-
  src/expr/log.c          | 2 +-
  src/expr/lookup.c       | 2 +-
@@ -66,7 +70,7 @@ Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
  src/obj/synproxy.c      | 2 +-
  src/obj/tunnel.c        | 2 +-
  src/object.c            | 2 +-
- 50 files changed, 51 insertions(+), 51 deletions(-)
+ 51 files changed, 52 insertions(+), 52 deletions(-)
 
 diff --git a/include/expr_ops.h b/include/expr_ops.h
 index 7a6aa23..d3a2855 100644
@@ -265,6 +269,17 @@ index 94b043c..a8a3c1f 100644
 -	.snprintf	= nftnl_expr_immediate_snprintf,
 +	.snprintf_	= nftnl_expr_immediate_snprintf,
  };
+diff --git a/src/expr/last.c b/src/expr/last.c
+index e2a60c4..2f75464 100644
+--- a/src/expr/last.c
++++ b/src/expr/last.c
+@@ -134,5 +134,5 @@ struct expr_ops expr_ops_last = {
+ 	.get		= nftnl_expr_last_get,
+ 	.parse		= nftnl_expr_last_parse,
+ 	.build		= nftnl_expr_last_build,
+-	.snprintf	= nftnl_expr_last_snprintf,
++	.snprintf_	= nftnl_expr_last_snprintf,
+ };
 diff --git a/src/expr/limit.c b/src/expr/limit.c
 index 3dfd54a..f652df0 100644
 --- a/src/expr/limit.c
@@ -376,10 +391,10 @@ index 215a681..75a6b3c 100644
 +	.snprintf_	= nftnl_expr_osf_snprintf,
  };
 diff --git a/src/expr/payload.c b/src/expr/payload.c
-index 9ccb78e..aa17025 100644
+index 82747ec..e9130ec 100644
 --- a/src/expr/payload.c
 +++ b/src/expr/payload.c
-@@ -258,5 +258,5 @@ struct expr_ops expr_ops_payload = {
+@@ -259,5 +259,5 @@ struct expr_ops expr_ops_payload = {
  	.get		= nftnl_expr_payload_get,
  	.parse		= nftnl_expr_payload_parse,
  	.build		= nftnl_expr_payload_build,
@@ -631,5 +646,5 @@ index 46e208b..d321c50 100644
  	}
  	ret = snprintf(buf + offset, remain, "]");
 -- 
-2.31.1
+2.33.1
 
diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.0.bb b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.1.bb
similarity index 89%
rename from meta-networking/recipes-filter/libnftnl/libnftnl_1.2.0.bb
rename to meta-networking/recipes-filter/libnftnl/libnftnl_1.2.1.bb
index d4aa267fa..16de8589a 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.0.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=79808397c3355f163c012616125c9e26"
 SECTION = "libs"
 DEPENDS = "libmnl"
 
-SRCREV = "d45be40eef72f0d42a1ba82efddbb0970d4c760a"
+SRCREV = "09456c720e9c00eecc08e41ac6b7c291b3821ee5"
 SRC_URI = "git://git.netfilter.org/libnftnl;branch=master \
            file://0001-avoid-naming-local-function-as-one-of-printf-family.patch \
            "
-- 
2.33.0


