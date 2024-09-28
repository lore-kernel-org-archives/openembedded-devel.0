Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D22DDCF6491
	for <webhook@archiver.kernel.org>; Sat, 28 Sep 2024 23:06:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.23017.1727564813405475806
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Sep 2024 16:06:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0001c3639c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48SN6r0M027437;
	Sat, 28 Sep 2024 16:06:53 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41xhakgcwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Sep 2024 16:06:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tV0NaK6oh/Q7ldM1tiXwW4oMCiDybjvXy/kh5LoBLSCde14EGIun6GlbIC1sGQQbIv3jtYY7mi+a9oZEVGhmUANmaF0KOz2fTOmyW5qtEOQ0K+H6e2NoK6MsOUcHn3iMfLZXCBtd4YstNuN+21ulNb+m0/ERNGSaeHxDoHUYyfsbgPIItXcKwVkRr0WW4wrhPizMgsFDuCIMonLS4r/kAFIqwxrFMQoagwty1dpBf4hwGPK4dooZ+0Nb2BHFrERy+01YiBWYd9xvlFhq8adAjPHi27zCRRBgKu5TdTVtlG/9DngJjHeSu73VrDNro/Gs/9eSGT8h4xvhTfZjbvMHBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gSK6/f2nkt5a5bLoGpVIhNCjIUDt4vtNOHaILbKk0I=;
 b=noHB0tJDx9lBubTqlPEwcnlF2rhlvXYoNTZNkeYKhz24Wn3M+cxIz7TLo9E1KI0jFMud0z3hRDAp8DsQ5RROCp+dnTdUTLzKNs1gw24ugNTCVUphN7qa5zt0u/TXa1ajv2KI9MUhAu2xb05gT9OC7FuQlzzxxWP7Ufv1ODgcEXw5bdljlYwEJ2G7OkSUphWOegtI0cMg1WKleLY+uDY/axckpEA5J2pwfrgxUJVW1tXnawTcBurv+iWd5IDudVnkbgc4IyIarZoWEhvCcUoVFSRLZiNkFBpfXfnATWD+Jfs5qmVkwvp1T/EEQTDqRyLXKQY7c6q4AS3udhVoZQ/C9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SN7PR11MB7512.namprd11.prod.outlook.com (2603:10b6:806:345::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8005.25; Sat, 28 Sep 2024 23:06:50 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8005.024; Sat, 28 Sep 2024
 23:06:50 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] libnetfilter-conntrack: upgrade 1.0.9 -> 1.1.0
Date: Sun, 29 Sep 2024 07:06:36 +0800
Message-Id: <20240928230636.4036225-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0017.jpnprd01.prod.outlook.com (2603:1096:404::29)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SN7PR11MB7512:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c047bc2-7dfd-48eb-f0ee-08dce0123c3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qYY6822Osa5Qq+hTRY4lnXUltq8Q6Z+LBv11SEfcxRZ0GZcySuFcDBRv55hA?=
 =?us-ascii?Q?yy+8gwswS0I1DqMe5ityoLgmVNHqyPMt3QmQVINr+psJg+gE+LrGtyYKmNuk?=
 =?us-ascii?Q?gpwUFc6F/9e3kSI1IqpSyv5WU5gdpajr/c/jzGIyvGUaoPrTbOx+wOm17fZ7?=
 =?us-ascii?Q?U4bZybYum/+CcQeGYQn1A862i3BC8jwyVB+XMyBbZAHVdTg+GSkaUAaMULpW?=
 =?us-ascii?Q?ByI0w9UrBEmw+0rW31ItnHeCGOT0JVOHkiTK6fZgWU3j5VSMX5/uWKENax46?=
 =?us-ascii?Q?WuH0Sd83TKX1VCEaV9eU7Q5+r/m5fem2XVvwvudkLF04FY/HbQ/XkrtsErzr?=
 =?us-ascii?Q?LWqZLkLqye59a+JTP6Gs1q6T73TVXYDObglc+wSV2wD+7P57d+ucTtRsBvHP?=
 =?us-ascii?Q?FVTlo1LliFsCCS2FOFKaKcQAedTnw6R1wVe6FJIT5PYFH8e6tVvtEnOzXpd8?=
 =?us-ascii?Q?uhSHk6tdiDFmrI5cxcSzeE1+lkt8Ofa7kA2Z/Ep9beAfP/v/JsCxzIMMZgsy?=
 =?us-ascii?Q?SYoq3kDQczaJSwRnJ5dmnRBKhDs38Dfa5Q9STMTS4OG4GW01rsCIPhEeYrZE?=
 =?us-ascii?Q?eVAKkyPAbRJB/rkb+a51xX05w1ewOAI3JIa1zD5SQso0B/fY8d2gRJP4Ek7q?=
 =?us-ascii?Q?J6BWw8BG1piwehqpp3myFg65qI+Yxk3UqZGazZajo6VLI6xN39UeqpnONWEQ?=
 =?us-ascii?Q?xYjXV9hmLUQXMjxROI23My7b3I2OD7YxVlqFrY2cH8oeJWjoClg3+0E1cDUM?=
 =?us-ascii?Q?HVqaH7m51GjzJqbllV7yZJR6OxmVqdGlNgecmVmj1yglaa75JvqGmio93iKH?=
 =?us-ascii?Q?pa5Ztep6AdUXWPGKvhhBIz2u7HZ/eGsYG5Wqo2AP1zv35lhGt1Cgl6Gd/FwF?=
 =?us-ascii?Q?lk4uVOsssGSq0tBfX7ing1tY4d478iCxzMkDp1c9rjm1qFhxGxcFao25OmwT?=
 =?us-ascii?Q?TE33kgh05SzrHT+KFHbsaEpKv0VkTKbmSWc2N1pmUbufpJ7O/Kb38RJCksNa?=
 =?us-ascii?Q?//VTV3dU5SE/Fd3SsUYitwZ/+78wrTNWLw17hx028wcxvN6kFCiE4x+ep9pW?=
 =?us-ascii?Q?M6ESCH05Ok40rxUZeHXcGAOmGAq743TROKtV4PNAivRExqEvAPmQzfTKU7BS?=
 =?us-ascii?Q?6S45rkJdNcq73AXRSjQk6W7S0nTDVtdMhFvlh01sfglK7addYjC0hb+H0Ml2?=
 =?us-ascii?Q?J+1iSDZF2ubP9fc+DgGyZ6tLXFdoDNqmD0wQ3ClvbL/V4LnW9Uqulribnb3D?=
 =?us-ascii?Q?H3lZj05JQgtn5jrW6U7bahqHcchhPyfpkp4XCxXnrTf/qCb1JRGYDXJHFTSj?=
 =?us-ascii?Q?giQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MtNaDTrQIwIdLFIsvzd3gxyDA87U431LDcXI1TXCx6fPLtSgNfXabznD5pV6?=
 =?us-ascii?Q?f8aCEahaNBXlkcpy6DRRBmz41P1nRnkLuqmcIcLqEJYp8SfnxX/RAjaVYBsM?=
 =?us-ascii?Q?AxmrRhrJO0w7FG5jARpIqbI0gUDolbqM9TK53Qu1lvqPuN9zNqe9X3g6aaj+?=
 =?us-ascii?Q?uy6UQfmKhBAGMLfKBUVReKN6/rRs91bm7+sZ5GDewubGLWhvi9/8mh3mxPGT?=
 =?us-ascii?Q?+qpY4DvfuG831ZXDFVNPBlUk8TlIrJvOxH2gWQR+anuN9xEx2Vq4PS6FN6cL?=
 =?us-ascii?Q?wTKoCAfQNUwpjOwOdWIJ2fHxaF6OWisG1uKcMAuvcltfXB69Br6+AZ9gEL1q?=
 =?us-ascii?Q?oPXN3EaUlOb8cm+5WAVTTSe3ZD0F5IcgMlAdM4Mge6DuyhPo8MHy+xhwy2He?=
 =?us-ascii?Q?lDKwfQWtCXvxODPO3QrxYc26iBucOsK7mQViMB/NMgMfF2uYmJuMQHwtFGlq?=
 =?us-ascii?Q?e9XDUhlxshodFO16R027KfZCjYo/geppHosYFw37U9n1twm1Nv+4hZj1hmB5?=
 =?us-ascii?Q?plfi2fOsPjr9ngbL23rpbVz3ni2llPE4RMKxw+4Mx6uh5BuWIglNt554KVk8?=
 =?us-ascii?Q?tkpRJd3U/rO2jtFe+8MR88nS5//6iwq9Yu2iY8xjZFMX73JF3VM5FlQemqh7?=
 =?us-ascii?Q?34AsWc3vxMIA6qNHovtrh08cRmDAjyc1tH1iKkDW4E4k4IuTucDg5IUu1cnR?=
 =?us-ascii?Q?86oK9Ks2HafRNQcKymnelRC2dQrgvyzkaLSnz0JmsniryQ9LomKOYZIvPSB1?=
 =?us-ascii?Q?iO8UfUdzeUlIBx84D1nttqYLsut1DT7GFTsI/A/ZcNxlpQbdSGA7BJRuPRYV?=
 =?us-ascii?Q?ZTqDpRxmqr4Kqr/TnNkKQjdaxHRl1ZnsbVegely+6gSsQrV0afiAEqGb9fvB?=
 =?us-ascii?Q?Lb5tj84oqnFc7DVN/cHOdhs2IvgYtG8mXpiv5MGK6cRx4GpKBOgwa9acAYqf?=
 =?us-ascii?Q?sRYd9dvRKA/3R22seQzHOLnZ+OqQ/cz2vXI5ZbG7cfcWbRnMTUMB/Wdj7b/t?=
 =?us-ascii?Q?frMCi5HhkHpTNcZ972dnU2mHRU3H5WAT9suSwL/GllgOXPfJSWwOLgBD/rnZ?=
 =?us-ascii?Q?hoR1f0vAIZEQZ9Z6JPmDojJ+DofQN7p3aNx94ld4hLXV1OBOixVPMJqyBYY4?=
 =?us-ascii?Q?5FDf7hLFXLSlWvuG9pqLHo/D/XVN7FQFspuT/P2xM0SdUKTVv8KvU9R50j6K?=
 =?us-ascii?Q?GPzTtlP9asfK4sO8TciTfqP5ggHYB1knnLLRtgAs8SMscOWynYojERWbuCPB?=
 =?us-ascii?Q?UheRSLKRL1dUsGpWr3RWQAMGMUnN8sHzY/RepbsR2A76wuCbagne2NCgzWBE?=
 =?us-ascii?Q?iaUzbCI4iC0UDA8fdOkk5Dr0RtQYBcFt8WeSXf99BMHAq9YKoTSerd77SEhm?=
 =?us-ascii?Q?kAB07CgQdN2pCGrKTXnkldSHsKdAmsGfExTPyKIl6Lv/B1+aOcN8VinkA//f?=
 =?us-ascii?Q?L7yoa8rI6BHVpgRUp3yzgtz4HyQBPyEgxeviC/sVGruv9YiMnBUZUQHRmz6y?=
 =?us-ascii?Q?6DIYIZN3AAeSQXZFS8HekJW3DuD5+BPDuisJJ2fFUCSFio8e9XMIkBUA0ObD?=
 =?us-ascii?Q?Bbwrq6GWg7amVQ2iNRixNDtRV4M8IhKHTLQ219lO?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c047bc2-7dfd-48eb-f0ee-08dce0123c3f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2024 23:06:50.6148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4I63kN8q6ufoIMMgbHWnRDaLDLa3IelfO6Du6qizrgSPB2jIAJkFQcFWRT6e44FlTjOFDATvq1hxiIDvmWmQJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7512
X-Authority-Analysis: v=2.4 cv=YOLNygGx c=1 sm=1 tr=0 ts=66f88c0c cx=c_pps a=dIBsZBmI1wyUZqnlzmwqRg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=3HDBlxybAAAA:8
 a=a23bKEBk8k_3SMmLZuAA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=laEoCiVfU_Unz3mSdgXN:22
X-Proofpoint-GUID: Aw-EDIyENNCM7k1aNLiY0-xgmJd8EzQi
X-Proofpoint-ORIG-GUID: Aw-EDIyENNCM7k1aNLiY0-xgmJd8EzQi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-28_18,2024-09-27_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=958 clxscore=1015 suspectscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409280178
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Sep 2024 23:06:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112546

* Drop backport patch

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-fix-build-with-kernel-5.15-and-musl.patch | 61 -------------------
 ...0.9.bb => libnetfilter-conntrack_1.1.0.bb} |  6 +-
 2 files changed, 2 insertions(+), 65 deletions(-)
 delete mode 100644 meta-networking/recipes-filter/libnetfilter/files/0001-conntrack-fix-build-with-kernel-5.15-and-musl.patch
 rename meta-networking/recipes-filter/libnetfilter/{libnetfilter-conntrack_1.0.9.bb => libnetfilter-conntrack_1.1.0.bb} (68%)

diff --git a/meta-networking/recipes-filter/libnetfilter/files/0001-conntrack-fix-build-with-kernel-5.15-and-musl.patch b/meta-networking/recipes-filter/libnetfilter/files/0001-conntrack-fix-build-with-kernel-5.15-and-musl.patch
deleted file mode 100644
index a02940af3..000000000
--- a/meta-networking/recipes-filter/libnetfilter/files/0001-conntrack-fix-build-with-kernel-5.15-and-musl.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 21ee35dde73aec5eba35290587d479218c6dd824 Mon Sep 17 00:00:00 2001
-From: Robert Marko <robimarko@gmail.com>
-Date: Thu, 24 Feb 2022 15:01:11 +0100
-Subject: [PATCH] conntrack: fix build with kernel 5.15 and musl
-
-Currently, with kernel 5.15 headers and musl building is failing with
-redefinition errors due to a conflict between the kernel and musl headers.
-
-Musl is able to suppres the conflicting kernel header definitions if they
-are included after the standard libc ones, however since ICMP definitions
-were moved into a separate internal header to avoid duplication this has
-stopped working and is breaking the builds.
-
-It seems that the issue is that <netinet/in.h> which contains the UAPI
-suppression defines is included in the internal.h header and not in the
-proto.h which actually includes the kernel ICMP headers and thus UAPI
-supression defines are not present.
-
-Solve this by moving the <netinet/in.h> include before the ICMP kernel
-includes in the proto.h
-
-Fixes: bc1cb4b11403 ("conntrack: Move icmp request>reply type mapping to common file")
-Signed-off-by: Robert Marko <robimarko@gmail.com>
-Signed-off-by: Florian Westphal <fw@strlen.de>
-
-Upstream-Status: Backport
-[https://git.netfilter.org/libnetfilter_conntrack/commit/?id=21ee35dde73aec5eba35290587d479218c6dd824]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- include/internal/internal.h | 1 -
- include/internal/proto.h    | 1 +
- 2 files changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/internal/internal.h b/include/internal/internal.h
-index 2ef8a90..7cd7c44 100644
---- a/include/internal/internal.h
-+++ b/include/internal/internal.h
-@@ -14,7 +14,6 @@
- #include <arpa/inet.h>
- #include <time.h>
- #include <errno.h>
--#include <netinet/in.h>
- 
- #include <libnfnetlink/libnfnetlink.h>
- #include <libnetfilter_conntrack/libnetfilter_conntrack.h>
-diff --git a/include/internal/proto.h b/include/internal/proto.h
-index 40e7bfe..60a5f4e 100644
---- a/include/internal/proto.h
-+++ b/include/internal/proto.h
-@@ -2,6 +2,7 @@
- #define _NFCT_PROTO_H_
- 
- #include <stdint.h>
-+#include <netinet/in.h>
- #include <linux/icmp.h>
- #include <linux/icmpv6.h>
- 
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.9.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.1.0.bb
similarity index 68%
rename from meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.9.bb
rename to meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.1.0.bb
index abec84b25..83533832d 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.9.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.1.0.bb
@@ -6,12 +6,10 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 DEPENDS = "libnfnetlink libmnl"
 
-SRC_URI = "https://www.netfilter.org/projects/libnetfilter_conntrack/files/libnetfilter_conntrack-${PV}.tar.bz2 \
-           file://0001-conntrack-fix-build-with-kernel-5.15-and-musl.patch \
+SRC_URI = "https://www.netfilter.org/projects/libnetfilter_conntrack/files/libnetfilter_conntrack-${PV}.tar.xz \
           "
 
-SRC_URI[md5sum] = "596c722733cdf30f24d4418f34f999d9"
-SRC_URI[sha256sum] = "67bd9df49fe34e8b82144f6dfb93b320f384a8ea59727e92ff8d18b5f4b579a8"
+SRC_URI[sha256sum] = "67edcb4eb826c2f8dc98af08dabff68f3b3d0fe6fb7d9d0ac1ee7ecce0fe694e"
 
 S = "${WORKDIR}/libnetfilter_conntrack-${PV}"
 
-- 
2.25.1


