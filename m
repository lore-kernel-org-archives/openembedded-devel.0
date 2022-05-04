Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37DFFC433F5
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 03:44:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.2530.1651635873395505461
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 May 2022 20:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=UBvklp4q;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=212338d51d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2443WeFX030844
	for <openembedded-devel@lists.openembedded.org>; Wed, 4 May 2022 03:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=So+RyewUq0IiRqp8x5lIGDa5HW6jC/Cmcn92nL1+YHk=;
 b=UBvklp4qUGu1TQC64j8vcJzQQoFM4juKNGHbfWvCHHyNX9tu8TX96FOr5z9yd/YkS08U
 LX/1XdcDeEKQir0CkdrYFVqRqcA+zC+LQIHa3DjqHAh+v8OWxZvwHtVWx3Z2awnDKeys
 IWVxAIdAR734p5a7Qdgcxz7pF2Hxpl7ObEx2NhN5Gaz8mLJgZsZd1W68iXErAvHQaAzw
 yMtnBFNYF885Uw9CHF4XikN7cdaLZiHsmfssznwDS0G5BMotBtVVn2TO7kwkY0HW8reM
 glboH31koe7A3QnvMEytX0XjjRdjDDNxO5xjo9fG9yM8FeitEpenH+Ypcl70Cg696foH 4A==
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3frv38trcq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 May 2022 03:44:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BOFDVi3Qwea7Q9fzpGRQBOYIwZcRE68rN4G/5CivCsmrKLj4gzdJ2TRTtHGMOAVyrWoxgsP/ihwHUVdHbY3GrpuqgnsSjCdphmcSQ6RWjhHfGi5F4t9fP42GwmkWOmS1yh3NjxCkqmfy5rWi1x8cVNZpW+5FHQ2Np/2zqtjmKdyAbZjOZM5cRbhlwoAnut7y5vxL6npqspm058K7mtwsWG1eBjo6P02+K9M0AzhyYCSx+SNaaRESgoEgP1XGjxtfyGtSucEn/nvjE9vysjfU7wMPZGIEprPe9ygqGa2CgA70lPFCYIUzTJH/lcgp64MCzWJD6c2U/STWXE7geVURYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=So+RyewUq0IiRqp8x5lIGDa5HW6jC/Cmcn92nL1+YHk=;
 b=an/LW4jW1NS6pyzp7kYUBVR15N+0eDachRPe+Zgg1+pgSCHeiVlRrMARyJjw904JjWrJHhyPUysPVe1TNho2zPVFLbYG2a8Q4WgYz/Adv8kj6Xi/RtTYzPWiYthTwmDOXZe9PzRew/oyBFLQqMxE1dPyWCVpnAH4XEensF4CnKsNKlkdVhliXG2YrA2TePKEEULFhIVQAhBmsQDUW0AiHuToQZlG8Lq5QsbQ7GRCHrfUHfkqFQbPB0+Pa+sNWnvyIqTP3TW5BjAZWPrW8PIAYz2HUah/CGb3NoZg1Z74uQqjDq00hccc7JljUVw2pzUotHKAn/m48jS9GwAmm9c+Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by PH0PR11MB4952.namprd11.prod.outlook.com (2603:10b6:510:40::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Wed, 4 May
 2022 03:44:30 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::5424:a286:7b98:903]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::5424:a286:7b98:903%4]) with mapi id 15.20.5206.024; Wed, 4 May 2022
 03:44:30 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] networkmanager: fix parallel build failure
Date: Wed,  4 May 2022 11:44:16 +0800
Message-Id: <20220504034416.3061719-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:3:18::13) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fb9788f-e4e7-4c6f-04cf-08da2d806512
X-MS-TrafficTypeDiagnostic: PH0PR11MB4952:EE_
X-Microsoft-Antispam-PRVS: 
	<PH0PR11MB4952F3CD284857260F437D79F9C39@PH0PR11MB4952.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0Uv5FkGQwndkoh92KLY/C3/Yv+Om9Fx90lb/jV3WpFW+vis6kvvW2IGdIkAbSkT9lecpgnNU2yE6Vt/ZgveUxQgOths5vGMLhNNVaQg6BblXioQ8XY2wGsvn/RYU5DAFYsxH5jo0FaY+8QoPQiPUGeqrDtMbSl0DvlSz6OOYt/niJsdWSERmWa3/0gpNx2bsCYBY0C3DAxHIFG9LEWteJhkQcETIVDhhk91z5ggJQPVkTYZOl7Xy5ttAiqsd6x0Wz0GECd8uOdYrflNUWc64QREwkxpFDVxbJgGPJPL1EBE+SZsSOzbWf0mb8Z2ZqsBwOjDyQzht0EaeQrRDGH7AwsgdQzNBXZrUIy3lUltMjKNO7HgixS5GpDj9hufTNfKsufu0MvJBNyfHB3jI0aL2nSanILURDNGMNAaMqXA/e3iES/kbqjeA33saUylQ40fylRw0kPcADAtCiNw45VOMV6Ikxzv4sJ+LtqpXUAdv60YWrDpApoCOuZSDbEgCecWv9tnb6FnEGtaB5Lk9p4CvMtnHivwu+pLmJby8+eqNQR/Ose0GgdqDmW4FY4OIthzKFd0lX7p16FbexARHU6Bl9yfVEf9XbHR/u7l+BjjFagy6kGT+8thkjN8VLATI6TbD1xURNFV07226XL3nz3rfp4mEkYzYqWtq855QjkXobJ05U+qNUyALKOl4jIKbYI+HjlZn9od0yRMWNoYcNWafyA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(86362001)(6512007)(26005)(2906002)(38100700002)(508600001)(8936002)(6486002)(38350700002)(6666004)(36756003)(52116002)(44832011)(5660300002)(83380400001)(8676002)(66556008)(66476007)(66946007)(1076003)(316002)(186003)(2616005)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xnaPXsA09oMSZZSPhEDh0PuRfIHE7nEbFHxbcrK1w1DbMbXqpwJaedb/XOZl?=
 =?us-ascii?Q?RXT4chwidzh8D9lbNmXJiCGRUOwdXqkR8nW7SKGYpJws8xUl9TCQ0vSfufTI?=
 =?us-ascii?Q?AdjEYPG1X9W8RsYM61PKUpmMaeRr72ICIrLPHFxtzH6UsG/1m9nEUr8Wsh9X?=
 =?us-ascii?Q?pgJX6MukVR9i3BtNuJkoKx+amHu6tcbXW0LKLSY5bUZCh9H/4NVBBtsdRv5C?=
 =?us-ascii?Q?V2kLa3O165M+HIdG7rrVGGcd2vn07QugRi9ZLEDXnP5GqY9YVPKMGFtt6zkz?=
 =?us-ascii?Q?x6oroNeY3OrFV8cp7bgil+/IX2hmQh5H1/qlddNoJR1x5rOoFowwJ2VXhzeQ?=
 =?us-ascii?Q?dE2RgmKNkq9AYuoSmDPQcs9TevBXMnTTDo3tHOliEjXV/R/1mtxy5UOxeAr3?=
 =?us-ascii?Q?GpDwionN+uZVCD5LIrlReYuaqgxDtkTBrr9siS0pvmpLTPfPMXJaFChm9til?=
 =?us-ascii?Q?zSV+rUed8Z8EJc/dl29tJaKpBlMCO1+sWZIW0lMnIdguZWDdpOBzS/nKOWs+?=
 =?us-ascii?Q?tZK/ekjEaBdpY7rwyYbqy7T05RXd/RyYKirqzOvXwEnE5OaHtyFwVRnYZ6O5?=
 =?us-ascii?Q?mRzzJUlipS/aZdKu8+Kw37Ct+vmfj0D0c/fOoFEmSES8mThZIJaRGxIu6Thk?=
 =?us-ascii?Q?5XJSqxGsK/UxCh9wffAwIxBf45nD6I9yai0iD/H4gmBcqdmM2egU5gvjqfsp?=
 =?us-ascii?Q?NdP4o5JgTkaerj+Ov83EkFUrn3ZSpcFqmgJI2IpBF9PBlnfCc/sc81+Ur0TH?=
 =?us-ascii?Q?1qCxRlu4Nt/hLrQphB25tpHzrn2D+NgcR534KTBhOTt/fSfWdgesLQzzQP0R?=
 =?us-ascii?Q?9L5lifKhd2pplaeev+UebwnTlkZnHjjOET58m8UVeG/M8Ab/lJYf2cBBRr1V?=
 =?us-ascii?Q?M1dzympLZTBU98dUQcg8XgACLsQ1sAALFhm1jUYk9bNSNBFASiMS+2lm3COW?=
 =?us-ascii?Q?AkhUGhx+q71NGQLOLW664l+7XZexoq3JRIV5i2mg98IdTP3mnE5oxUuvMXVG?=
 =?us-ascii?Q?RyBUsMDKxLDQ7Ty1E0CtVo3yGfczkXeOeDBYMq9hdoFKC9vDDWtxNnCf+frG?=
 =?us-ascii?Q?GwcCKW7/niIXA/gGSTUBlAAfs/Kth6XScnjrQYA+AAaDc42jRFM+YwwIx6IO?=
 =?us-ascii?Q?ZfjM6wf62yKO7uGxD/fl1qU3ECdKo0ungrLyC8R3DUde6JIhbokrL9YPpdwc?=
 =?us-ascii?Q?LCynHr8Qg5vP2ZJ/kSkKW6GLWDn5cgLEsyOMkin3xSmmxm7Q/V/fAIvNF6pD?=
 =?us-ascii?Q?GCg/roI1U5xwD+Jq3pIQm1jN6q7ek7hEPJzS94fWJ+8ja8q4i9akBrQcNEm1?=
 =?us-ascii?Q?VuXpVClDRPz44yrvGM+CoJb4DEW6AOlL6xqEj7APhsz+vmHk3V87kFj49iZR?=
 =?us-ascii?Q?nvklv5tGSEw/i+4mRgoOPHtSi1mFrAuKUrkRoT4FMv/nHEhYO+eYRigu4uix?=
 =?us-ascii?Q?Sg6tuTfWPEfbe9ga9+9fB4I4osjv/L6ove4+b5ys03yX6ek0oYw4xrGoBOVW?=
 =?us-ascii?Q?W/JVTPKCYJONG41YUhw/cpm9u1bIN4bF1KkYiroAolXZjlP9GPQkfK2SUCFV?=
 =?us-ascii?Q?OzSeZ00c9RdQdFnjohGmk84aCNn6iw9QKiHwIduYrn0Bg11aiIwd90n2XtbK?=
 =?us-ascii?Q?NCbCWIv/P7D7Rmw/RUUIcgPI7Ux7mbiPuHpISvfEKtCNjaQiVb9vSszzNWlM?=
 =?us-ascii?Q?aFUbshC1+ydzKRIm8TUmMUXqPfkjvI2Pk+JIFwn7JvSoGjDsb/k2l3SCzrtd?=
 =?us-ascii?Q?EdTrepsh1g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8fb9788f-e4e7-4c6f-04cf-08da2d806512
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 03:44:30.2351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2JdqtV3XVa5wB7VSAGgwcfMd784PAvrYmWL8EHxwF+h5xEmGgkFUF2ZTofY9hbqOWIlTDuQ8ZmQiOVaSb/wVMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4952
X-Proofpoint-ORIG-GUID: ynwuzdcGhvoLOvchpmS6NV90e3Jfu-5r
X-Proofpoint-GUID: ynwuzdcGhvoLOvchpmS6NV90e3Jfu-5r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-04_01,2022-05-02_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 clxscore=1015 phishscore=0 mlxlogscore=736 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205040021
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 May 2022 03:44:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96955

Add dependency libnm_client_public_dep to libnm-client-test to fix
parallel build error:

| In file included from ../NetworkManager-1.36.0/src/libnm-client-test/nm-test-utils-impl.c:10:
| ../NetworkManager-1.36.0/src/libnm-client-public/NetworkManager.h:47:10: fatal error: nm-enum-types.h: No such file or directory
|    47 | #include "nm-enum-types.h"
|       |          ^~~~~~~~~~~~~~~~~

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...t-add-dependency-libnm_client_public.patch | 34 +++++++++++++++++++
 .../networkmanager/networkmanager_1.36.2.bb   |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-libnm-client-test-add-dependency-libnm_client_public.patch

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-libnm-client-test-add-dependency-libnm_client_public.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-libnm-client-test-add-dependency-libnm_client_public.patch
new file mode 100644
index 000000000..6be2d4bed
--- /dev/null
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-libnm-client-test-add-dependency-libnm_client_public.patch
@@ -0,0 +1,34 @@
+From 7b5dc04e1fcc28dc653fb7bf0e9dda3700d93218 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Tue, 3 May 2022 15:30:37 +0800
+Subject: [PATCH] libnm-client-test: add dependency libnm_client_public_dep
+
+Fix parallel build error:
+| In file included from ../NetworkManager-1.36.0/src/libnm-client-test/nm-test-utils-impl.c:10:
+| ../NetworkManager-1.36.0/src/libnm-client-public/NetworkManager.h:47:10: fatal error: nm-enum-types.h: No such file or directory
+|    47 | #include "nm-enum-types.h"
+|       |          ^~~~~~~~~~~~~~~~~
+
+Upstream-Status: Submitted
+[https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/merge_requests/1206]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/libnm-client-test/meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/libnm-client-test/meson.build b/src/libnm-client-test/meson.build
+index 8e2fba1130..bcac437702 100644
+--- a/src/libnm-client-test/meson.build
++++ b/src/libnm-client-test/meson.build
+@@ -13,6 +13,7 @@ libnm_client_test = static_library(
+   ],
+   dependencies: [
+     libnm_core_public_dep,
++    libnm_client_public_dep,
+     glib_dep,
+   ],
+ )
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
index b09ff18bf..6c665d53b 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
@@ -29,6 +29,7 @@ SRC_URI = " \
     file://enable-dhcpcd.conf \
     file://enable-iwd.conf \
     file://0001-do-not-ask-host-for-ifcfg-defaults.patch \
+    file://0001-libnm-client-test-add-dependency-libnm_client_public.patch \
 "
 SRC_URI[sha256sum] = "ab855cbe3b41832e9a3b003810e7c7313dfe19e630d29806d14d87fdd1470cab"
 
-- 
2.25.1


