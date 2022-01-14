Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82658C433F5
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 01:39:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1660.1642124397977235735
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 17:39:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Cy9lWAT5;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=80133a60ff=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20E1XUqP020345
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 17:39:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=m1h5bKBcRD8E8IJ/ojaWMfELF+uG1ScCPItv6qBvHgs=;
 b=Cy9lWAT5zuSOoC7Pb7q4H3I/RkZ/eLVCztxaqQIOOFB7pYw6ZOhei/h9ajm5AE2WSbd8
 6INczgJx6o7iDlrC9fP8nTiQfGHq/J27snpDfxyurSkZHMC1CEtq1j1fNCKFNAHU9Ya7
 eZXcCXW4jLVAClEJ05HWabNL7QC5WzRjffRFYoEQNviE9PaXI7CXBJaY6poQrNQrynIR
 2tDljIKxGq6WZUjkHWK7a9CkFOeFZiHeYV8ubMkbdeV1/pt3jKsCkivRPTu8s8TmCvQS
 VPF2DQbjTjlN/gbBGvs9I1bJATaasy/qJHmTgd5ypIYeyPaOVkZfYoJ1d0KgWy0OdkaH /g==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dhy079ad7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 17:39:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IOmPMLiBRtKpPCLlQiHIa713cROmOp0ZwInH2t3Y7swmXryk0oB4Ddps/u0mgctBfMQYgs4MVBByqPm9YOhwdA2o0FSexB2Rk0spIj1LeDVbrxhWp8sq5vkYCajVs4u7wIjlorufNReLMyM+9g9J879peevZ0Q4Ark9xhW+UxQHzK//T8nsb+T/t4vs4RrHVOAkQRwvLrotTB3j23LI+lwo6rum/2UMfkqI8P4lllYHSlTWMgNl8vRguJFz7do7BXWlUxJcaqpe2QXhNu5kSRarPy/IaCC6IKM/M9lDcJFS83XobkTEL5C+h/v7MFU+t2NANr2cT8q01zGs7VQOFWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m1h5bKBcRD8E8IJ/ojaWMfELF+uG1ScCPItv6qBvHgs=;
 b=YmJjBx0oN3gYAV+OTuhf5XNJtIq5CgCPwatOYFJHfEooW8XbbvDU8tFgWkcm/TGsu5zSBRdHhoHiYz/LB52XvKi6DbjmnAsYlCBZLccStuNuW+W4G2iLmXWUJ2qYg4SXy6j1829nGwTBvh+1USKqDS9ziEH3Py8L3UIqR67HnITbgOdPjHCbyd4W/TwHKnRtC7mgjugd1F7QyZB0U7ibMFtSYYMNRdo8ydrRofU9I6r4vKQOGPZ1+icnTfxKbTvCWvfCxrObvbaGUR6bytcCBPU96sN7+yNoFytoH9B5ohpXTDZraKh41uinBkIooT6694bn296b+8TL91HOwSHZ/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB4878.namprd11.prod.outlook.com (2603:10b6:a03:2d8::19)
 by DM6PR11MB3145.namprd11.prod.outlook.com (2603:10b6:5:6e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 14 Jan
 2022 01:39:54 +0000
Received: from SJ0PR11MB4878.namprd11.prod.outlook.com
 ([fe80::687b:9478:2713:459]) by SJ0PR11MB4878.namprd11.prod.outlook.com
 ([fe80::687b:9478:2713:459%5]) with mapi id 15.20.4888.011; Fri, 14 Jan 2022
 01:39:54 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 3/6] libnetfilter-queue: upgrade 1.0.3 ->
 1.0.5
Date: Fri, 14 Jan 2022 09:39:38 +0800
Message-Id: <20220114013941.229837-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220114013941.229837-1-yi.zhao@windriver.com>
References: <20220114013941.229837-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0087.apcprd04.prod.outlook.com
 (2603:1096:202:15::31) To SJ0PR11MB4878.namprd11.prod.outlook.com
 (2603:10b6:a03:2d8::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 288c0b1a-ee71-40f4-0a3e-08d9d6fec3cd
X-MS-TrafficTypeDiagnostic: DM6PR11MB3145:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3145F86E5BC7FBE07EF2A2D4F9549@DM6PR11MB3145.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	e/ccMN8WM8rnI5+7OyNCFNO77pypha4Ku1wjq7+nt7RRxqkSdSuYAD5MnKuBwtgeIJzGjp8SqvplSDo3z06M8mom9+Lxpz2wo19AQQIUO0HkFfdkdSRhIpR1F4hejTYlpab++q7ItFyiRLSYAQe2E2si0fuK9ZHuP3K7sF8sX+Z+dIxMop2PMnh1dkCXCTDus0RoQ7xiwSAF+ScADk0Yj4zwXPBE5CzbsZH3cT7+vHdLGNLuK5+DdNNnSatqtQMdUjXHmKmgL4/DjPZ8Xc5Ovp6GH47dm4lIGCdkD1a/WTDwEXnJwBdmoTp9Y68KODdeNon9csflmuIFGQkN/Q6I+QdjAfv3BBYn+rSjpWJPmyBCRE2cRM4i6nImQFit9kMuwO7/xgIDr537WsqES/+0JHoUQLM0c1xG0aUYpqd3ngByBuTdzf5s5Zegs2Un21uFWONlVzTtNUbBLwC8jGdG8a1DMF81T8sqis3BsOtBBDeROku8TaZYB3i/dWE+Qc/roU+ANk9EgY0y7TOdLYOZ5h+8GPBYHMkI9Ur5S+KG2CMHvtxm+FYnyKUQ6QQChX+5dXS2Vvl+3HoH4j86EX6eknGkZ0Lmyyoi8N2L5YyJpqrfJ+Zo7YssgRFJsP+N3u1XMvWLH3KrPs/nm3Yvz8lngqe6Ni4oJ8RGFTRrpWeScHXEqw31mczjJ4bu5KIpMb4pMetrZZLtKr+2n3yfn9cUWg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4878.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(30864003)(6506007)(66556008)(1076003)(66476007)(2906002)(5660300002)(316002)(6916009)(83380400001)(44832011)(66946007)(8936002)(2616005)(8676002)(36756003)(86362001)(52116002)(508600001)(6512007)(26005)(38100700002)(38350700002)(186003)(6486002)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QzRpJcOEVxPIlZz4C3Xn0k63Zk+uXzYGDtDGq2gntnSEhvpJl27si+/zKVCk?=
 =?us-ascii?Q?PfBPiOfyC7OZixBswrAlXU/Jj2zUKKVEhtZUw5ztmFqE0YXaLiOUS6v4cv9D?=
 =?us-ascii?Q?lIuBVKk/SWPMhAvBtDl1mUbpfvv9MeBZG6mMM6uQtbYRmV/a2Wz8C/vnXQvE?=
 =?us-ascii?Q?M1mjrarjUne16PtlOGxukfvBuVisALRayxWVL8uxr7ncqUW5vKRwdA5iesYU?=
 =?us-ascii?Q?OslogIj9pb7CTQ8ahNnZuhHAhDevZ5IcO0IePPrU0yiuw+sC0N8iBJyIRAK5?=
 =?us-ascii?Q?dut4FHEVcIUdErXO4OFNtZ+r4EPRGkPcFKVmYbMQu6Ubv7Y8UGDmePfKCUVg?=
 =?us-ascii?Q?rf3h32gkDTTD/UhIVHRiBMQ3DW7zfggTTovR6xr+1xotG4wc0zGtt0lSRY9k?=
 =?us-ascii?Q?NQk2yhq1oRqtHnrZ297GUevGWUECz8jEIkrAOUYvR0RlCycS/DUjrMt94H5y?=
 =?us-ascii?Q?i+SGqhDwR+tCGh77PaW/W7Vk53qKxqxjhMd/qAWy59+35WZ2UMt24pDcw5l1?=
 =?us-ascii?Q?+W0MiaHQnym0rft9yefifyjN6X4Oy6KxPM2n/rhoWis+Hy5jmKPBLhXPkiXy?=
 =?us-ascii?Q?L2GidMuNLYa044C2rppM+NMYO+NgBiwT3OLFlKP/gXxAVqyR0KGqEv+VuKk9?=
 =?us-ascii?Q?FuR8B5FSFu0nBY8DeLYCvyeX5JGsQE1qb2DPs1jgvPqSXlOK8+mCnK046wne?=
 =?us-ascii?Q?/2LNOzD6xgZVLfYyTONc/pSR2vJdOB0HeGQodF9t50p6uLBilukEoD0zxpiD?=
 =?us-ascii?Q?c+CzquK3p6G3joLW0bn1l0yBNqz3grH+PmMIB8/fQWCUOpidvl/TBq4AQxO9?=
 =?us-ascii?Q?4UbmFUnOaWiwuWTCDXB7NWe+14979OjHV/lXFfkI4zSId5lOrsbFdhhgmT2J?=
 =?us-ascii?Q?1R3yixMZeSTfzNNQi6B1DifaeM3bNjQhix2c9HGoDTjMoUzuXWMyXI/QQnSq?=
 =?us-ascii?Q?ef5RPLnkPrePVp+JHaOK2DquheJv9JSQVQ56uXrIiur9HGYeh6pq8MV/Z0ju?=
 =?us-ascii?Q?4fTQttQS5Sww8hur1jlWVcI/9M0MuKfbhzjbZ89srXFtm4FvXouXOkkX2ebj?=
 =?us-ascii?Q?lmoPOinmrT1bKVw9ckYUrhXv1tRZyyJ9REPeuPbjvHliuTybVAv0E8NEzaFw?=
 =?us-ascii?Q?X5U1l2obmRg1Wd7WZjozSCwAI/6X9etAupkMzeS8Y9xyEClQhY3EX++Le8ft?=
 =?us-ascii?Q?rlIk1pQYg+Kr0swzcXjrJAZw3kiT6YWz3TD9pGOytjMsHSLxR2F0NnpLWIcV?=
 =?us-ascii?Q?5egfEmLpvOnkWe8sHCbTAX+P05WQbo2D/dg8f/F0CFDwpxnNMLGcbjXFHpdo?=
 =?us-ascii?Q?GjY7kpYLvt9/kM50KHaRlWAOS0TCynbIBoPXt6dysOu1r92WHDdFZXFgEKnR?=
 =?us-ascii?Q?xZx6FYym3Rn5cVpNjaVyxAaClymIoyt++RAVg2rMqNI8M7fdk8zZOOFl20Xn?=
 =?us-ascii?Q?WOjI2Pi8IQiLsVXNcTzrAYxWQ6glxEeafSUa3pfZSVFnW0eO/P+9Q38Wp+/8?=
 =?us-ascii?Q?pwFGzosOM4nBHAl7GWos9Q/Kbpf5OvRP6jHlGMcIKCNEWifQ0j9D0gSe6X5S?=
 =?us-ascii?Q?tD8JaMHYUP56dNwYeGlKKcxFiFsHDwKfFPIU0zdQOLO3/qT+00t8sx6DArYq?=
 =?us-ascii?Q?w5x+b3foIqgq9/1Xrg/jowY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 288c0b1a-ee71-40f4-0a3e-08d9d6fec3cd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4878.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 01:39:54.7792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 y+5cmnTK9WnWLtpr3EJJXlPgel47orl30gEX/6CHZKRWaUumeMG0raEXXy06bJzeQf4vjmPs4F/e6Anz1JGXzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3145
X-Proofpoint-GUID: lC7kk7DhHS70UNJRygtFCzmGF3XD0vL8
X-Proofpoint-ORIG-GUID: lC7kk7DhHS70UNJRygtFCzmGF3XD0vL8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-13_10,2022-01-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0 mlxscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201140007
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jan 2022 01:39:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94817

Drop 0001-libnetfilter-queue-Declare-the-define-visivility-attribute-together.patch
as the clang build issue had been fixed upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...define-visivility-attribute-together.patch | 1227 -----------------
 ...e_1.0.3.bb => libnetfilter-queue_1.0.5.bb} |    3 +-
 2 files changed, 1 insertion(+), 1229 deletions(-)
 delete mode 100644 meta-networking/recipes-filter/libnetfilter/files/0001-libnetfilter-queue-Declare-the-define-visivility-attribute-together.patch
 rename meta-networking/recipes-filter/libnetfilter/{libnetfilter-queue_1.0.3.bb => libnetfilter-queue_1.0.5.bb} (77%)

diff --git a/meta-networking/recipes-filter/libnetfilter/files/0001-libnetfilter-queue-Declare-the-define-visivility-attribute-together.patch b/meta-networking/recipes-filter/libnetfilter/files/0001-libnetfilter-queue-Declare-the-define-visivility-attribute-together.patch
deleted file mode 100644
index aa9ff09a9..000000000
--- a/meta-networking/recipes-filter/libnetfilter/files/0001-libnetfilter-queue-Declare-the-define-visivility-attribute-together.patch
+++ /dev/null
@@ -1,1227 +0,0 @@
-From db7eb5f0a4e78c6bd3c4f9cbd8332d909eb82ad6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 10 Apr 2017 12:09:41 -0700
-Subject: [PATCH] Declare the define visivility attribute together
-
-clang ignores the visibility attribute if its not
-defined before the definition. As a result these
-symbols become hidden and consumers of this library
-fail to link due to these missing symbols
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- doxygen.cfg.in           |   2 +-
- src/extra/ipv4.c         |  15 ++----
- src/extra/ipv6.c         |   9 ++--
- src/extra/pktbuff.c      |  42 +++++----------
- src/extra/tcp.c          |  21 +++-----
- src/extra/udp.c          |  21 +++-----
- src/internal.h           |   5 +-
- src/libnetfilter_queue.c | 108 +++++++++++++--------------------------
- src/nlmsg.c              |  21 +++-----
- 9 files changed, 82 insertions(+), 162 deletions(-)
-
-diff --git a/doxygen.cfg.in b/doxygen.cfg.in
-index a7378ca..659abee 100644
---- a/doxygen.cfg.in
-+++ b/doxygen.cfg.in
-@@ -72,7 +72,7 @@ RECURSIVE              = YES
- EXCLUDE                = 
- EXCLUDE_SYMLINKS       = NO
- EXCLUDE_PATTERNS       = 
--EXCLUDE_SYMBOLS        = EXPORT_SYMBOL
-+EXCLUDE_SYMBOLS        =
- EXAMPLE_PATH           = 
- EXAMPLE_PATTERNS       = 
- EXAMPLE_RECURSIVE      = NO
-diff --git a/src/extra/ipv4.c b/src/extra/ipv4.c
-index a93d113..56d5dc7 100644
---- a/src/extra/ipv4.c
-+++ b/src/extra/ipv4.c
-@@ -32,7 +32,7 @@
-  * This funcion returns NULL if the IPv4 is malformed or the protocol version
-  * is not 4. On success, it returns a valid pointer to the IPv4 header.
-  */
--struct iphdr *nfq_ip_get_hdr(struct pkt_buff *pktb)
-+struct iphdr __EXPORTED *nfq_ip_get_hdr(struct pkt_buff *pktb)
- {
- 	struct iphdr *iph;
- 	unsigned int pktlen = pktb->tail - pktb->network_header;
-@@ -53,14 +53,13 @@ struct iphdr *nfq_ip_get_hdr(struct pkt_buff *pktb)
- 
- 	return iph;
- }
--EXPORT_SYMBOL(nfq_ip_get_hdr);
- 
- /**
-  * nfq_ip_set_transport_header - set transport header
-  * \param pktb: pointer to network packet buffer
-  * \param iph: pointer to the IPv4 header
-  */
--int nfq_ip_set_transport_header(struct pkt_buff *pktb, struct iphdr *iph)
-+int __EXPORTED nfq_ip_set_transport_header(struct pkt_buff *pktb, struct iphdr *iph)
- {
- 	int doff = iph->ihl * 4;
- 
-@@ -71,7 +70,6 @@ int nfq_ip_set_transport_header(struct pkt_buff *pktb, struct iphdr *iph)
- 	pktb->transport_header = pktb->network_header + doff;
- 	return 0;
- }
--EXPORT_SYMBOL(nfq_ip_set_transport_header);
- 
- /**
-  * nfq_ip_set_checksum - set IPv4 checksum
-@@ -80,14 +78,13 @@ EXPORT_SYMBOL(nfq_ip_set_transport_header);
-  * \note Call to this function if you modified the IPv4 header to update the
-  * checksum.
-  */
--void nfq_ip_set_checksum(struct iphdr *iph)
-+void __EXPORTED nfq_ip_set_checksum(struct iphdr *iph)
- {
- 	uint32_t iph_len = iph->ihl * 4;
- 
- 	iph->check = 0;
- 	iph->check = nfq_checksum(0, (uint16_t *)iph, iph_len);
- }
--EXPORT_SYMBOL(nfq_ip_set_checksum);
- 
- /**
-  * nfq_ip_mangle - mangle IPv4 packet buffer
-@@ -100,7 +97,7 @@ EXPORT_SYMBOL(nfq_ip_set_checksum);
-  *
-  * \note This function recalculates the IPv4 checksum (if needed).
-  */
--int nfq_ip_mangle(struct pkt_buff *pkt, unsigned int dataoff,
-+int __EXPORTED nfq_ip_mangle(struct pkt_buff *pkt, unsigned int dataoff,
- 		  unsigned int match_offset, unsigned int match_len,
- 		  const char *rep_buffer, unsigned int rep_len)
- {
-@@ -116,7 +113,6 @@ int nfq_ip_mangle(struct pkt_buff *pkt, unsigned int dataoff,
- 
- 	return 1;
- }
--EXPORT_SYMBOL(nfq_ip_mangle);
- 
- /**
-  * nfq_pkt_snprintf_ip - print IPv4 header into buffer in iptables LOG format
-@@ -128,7 +124,7 @@ EXPORT_SYMBOL(nfq_ip_mangle);
-  * case that there is enough room in the buffer. Read snprintf manpage for more
-  * information to know more about this strange behaviour.
-  */
--int nfq_ip_snprintf(char *buf, size_t size, const struct iphdr *iph)
-+int __EXPORTED nfq_ip_snprintf(char *buf, size_t size, const struct iphdr *iph)
- {
- 	int ret;
- 	struct in_addr src = { iph->saddr };
-@@ -147,7 +143,6 @@ int nfq_ip_snprintf(char *buf, size_t size, const struct iphdr *iph)
- 
- 	return ret;
- }
--EXPORT_SYMBOL(nfq_ip_snprintf);
- 
- /**
-  * @}
-diff --git a/src/extra/ipv6.c b/src/extra/ipv6.c
-index 7c5dc9b..6641c6b 100644
---- a/src/extra/ipv6.c
-+++ b/src/extra/ipv6.c
-@@ -33,7 +33,7 @@
-  * This funcion returns NULL if an invalid header is found. On sucess, it
-  * returns a valid pointer to the header.
-  */
--struct ip6_hdr *nfq_ip6_get_hdr(struct pkt_buff *pktb)
-+struct ip6_hdr __EXPORTED *nfq_ip6_get_hdr(struct pkt_buff *pktb)
- {
- 	struct ip6_hdr *ip6h;
- 	unsigned int pktlen = pktb->tail - pktb->network_header;
-@@ -50,7 +50,6 @@ struct ip6_hdr *nfq_ip6_get_hdr(struct pkt_buff *pktb)
- 
- 	return ip6h;
- }
--EXPORT_SYMBOL(nfq_ip6_get_hdr);
- 
- /**
-  * nfq_ip6_set_transport_header - set transport header pointer for IPv6 packet
-@@ -61,7 +60,7 @@ EXPORT_SYMBOL(nfq_ip6_get_hdr);
-  * This function returns 1 if the protocol has been found and the transport
-  * header has been set. Otherwise, it returns 0.
-  */
--int nfq_ip6_set_transport_header(struct pkt_buff *pktb, struct ip6_hdr *ip6h,
-+int __EXPORTED nfq_ip6_set_transport_header(struct pkt_buff *pktb, struct ip6_hdr *ip6h,
- 				 uint8_t target)
- {
- 	uint8_t nexthdr = ip6h->ip6_nxt;
-@@ -115,7 +114,6 @@ int nfq_ip6_set_transport_header(struct pkt_buff *pktb, struct ip6_hdr *ip6h,
- 	pktb->transport_header = cur;
- 	return cur ? 1 : 0;
- }
--EXPORT_SYMBOL(nfq_ip6_set_transport_header);
- 
- /**
-  * nfq_ip6_snprintf - print IPv6 header into one buffer in iptables LOG format
-@@ -124,7 +122,7 @@ EXPORT_SYMBOL(nfq_ip6_set_transport_header);
-  * \param ip6_hdr: pointer to a valid IPv6 header.
-  *
-  */
--int nfq_ip6_snprintf(char *buf, size_t size, const struct ip6_hdr *ip6h)
-+int __EXPORTED nfq_ip6_snprintf(char *buf, size_t size, const struct ip6_hdr *ip6h)
- {
- 	int ret;
- 	char src[INET6_ADDRSTRLEN];
-@@ -143,7 +141,6 @@ int nfq_ip6_snprintf(char *buf, size_t size, const struct ip6_hdr *ip6h)
- 
- 	return ret;
- }
--EXPORT_SYMBOL(nfq_ip6_snprintf);
- 
- /**
-  * @}
-diff --git a/src/extra/pktbuff.c b/src/extra/pktbuff.c
-index 1c15a00..54d8244 100644
---- a/src/extra/pktbuff.c
-+++ b/src/extra/pktbuff.c
-@@ -40,7 +40,7 @@
-  *
-  * \return a pointer to a new queue handle or NULL on failure.
-  */
--struct pkt_buff *
-+struct pkt_buff __EXPORTED *
- pktb_alloc(int family, void *data, size_t len, size_t extra)
- {
- 	struct pkt_buff *pktb;
-@@ -84,120 +84,108 @@ pktb_alloc(int family, void *data, size_t len, size_t extra)
- 	}
- 	return pktb;
- }
--EXPORT_SYMBOL(pktb_alloc);
- 
- /**
-  * pktb_data - return pointer to the beginning of the packet buffer
-  * \param pktb Pointer to packet buffer
-  */
--uint8_t *pktb_data(struct pkt_buff *pktb)
-+uint8_t __EXPORTED *pktb_data(struct pkt_buff *pktb)
- {
- 	return pktb->data;
- }
--EXPORT_SYMBOL(pktb_data);
- 
- /**
-  * pktb_len - return length of the packet buffer
-  * \param pktb Pointer to packet buffer
-  */
--uint32_t pktb_len(struct pkt_buff *pktb)
-+uint32_t __EXPORTED pktb_len(struct pkt_buff *pktb)
- {
- 	return pktb->len;
- }
--EXPORT_SYMBOL(pktb_len);
- 
- /**
-  * pktb_free - release packet buffer
-  * \param pktb Pointer to packet buffer
-  */
--void pktb_free(struct pkt_buff *pktb)
-+void __EXPORTED pktb_free(struct pkt_buff *pktb)
- {
- 	free(pktb);
- }
--EXPORT_SYMBOL(pktb_free);
- 
- /**
-  * pktb_push - update pointer to the beginning of the packet buffer
-  * \param pktb Pointer to packet buffer
-  */
--void pktb_push(struct pkt_buff *pktb, unsigned int len)
-+void __EXPORTED pktb_push(struct pkt_buff *pktb, unsigned int len)
- {
- 	pktb->data -= len;
- 	pktb->len += len;
- }
--EXPORT_SYMBOL(pktb_push);
- 
- /**
-  * pktb_pull - update pointer to the beginning of the packet buffer
-  * \param pktb Pointer to packet buffer
-  */
--void pktb_pull(struct pkt_buff *pktb, unsigned int len)
-+void __EXPORTED pktb_pull(struct pkt_buff *pktb, unsigned int len)
- {
- 	pktb->data += len;
- 	pktb->len -= len;
- }
--EXPORT_SYMBOL(pktb_pull);
- 
- /**
-  * pktb_put - add extra bytes to the tail of the packet buffer
-  * \param pktb Pointer to packet buffer
-  */
--void pktb_put(struct pkt_buff *pktb, unsigned int len)
-+void __EXPORTED pktb_put(struct pkt_buff *pktb, unsigned int len)
- {
- 	pktb->tail += len;
- 	pktb->len += len;
- }
--EXPORT_SYMBOL(pktb_put);
- 
- /**
-  * pktb_trim - set new length for this packet buffer
-  * \param pktb Pointer to packet buffer
-  */
--void pktb_trim(struct pkt_buff *pktb, unsigned int len)
-+void __EXPORTED pktb_trim(struct pkt_buff *pktb, unsigned int len)
- {
- 	pktb->len = len;
- }
--EXPORT_SYMBOL(pktb_trim);
- 
- /**
-  * pktb_tailroom - get room in bytes in the tail of the packet buffer
-  * \param pktb Pointer to packet buffer
-  */
--unsigned int pktb_tailroom(struct pkt_buff *pktb)
-+unsigned int __EXPORTED pktb_tailroom(struct pkt_buff *pktb)
- {
- 	return pktb->data_len - pktb->len;
- }
--EXPORT_SYMBOL(pktb_tailroom);
- 
- /**
-  * pktb_mac_header - return pointer to layer 2 header (if any)
-  * \param pktb Pointer to packet buffer
-  */
--uint8_t *pktb_mac_header(struct pkt_buff *pktb)
-+uint8_t __EXPORTED *pktb_mac_header(struct pkt_buff *pktb)
- {
- 	return pktb->mac_header;
- }
--EXPORT_SYMBOL(pktb_mac_header);
- 
- /**
-  * pktb_network_header - return pointer to layer 3 header
-  * \param pktb Pointer to packet buffer
-  */
--uint8_t *pktb_network_header(struct pkt_buff *pktb)
-+uint8_t __EXPORTED *pktb_network_header(struct pkt_buff *pktb)
- {
- 	return pktb->network_header;
- }
--EXPORT_SYMBOL(pktb_network_header);
- 
- /**
-  * pktb_transport_header - return pointer to layer 4 header (if any)
-  * \param pktb Pointer to packet buffer
-  */
--uint8_t *pktb_transport_header(struct pkt_buff *pktb)
-+uint8_t __EXPORTED *pktb_transport_header(struct pkt_buff *pktb)
- {
- 	return pktb->transport_header;
- }
--EXPORT_SYMBOL(pktb_transport_header);
- 
- static int pktb_expand_tail(struct pkt_buff *pkt, int extra)
- {
-@@ -224,7 +212,7 @@ static int enlarge_pkt(struct pkt_buff *pkt, unsigned int extra)
- 	return 1;
- }
- 
--int pktb_mangle(struct pkt_buff *pkt,
-+int __EXPORTED pktb_mangle(struct pkt_buff *pkt,
- 		 unsigned int dataoff,
- 		 unsigned int match_offset,
- 		 unsigned int match_len,
-@@ -258,17 +246,15 @@ int pktb_mangle(struct pkt_buff *pkt,
- 	pkt->mangled = true;
- 	return 1;
- }
--EXPORT_SYMBOL(pktb_mangle);
- 
- /**
-  * pktb_mangled - return true if packet has been mangled
-  * \param pktb Pointer to packet buffer
-  */
--bool pktb_mangled(const struct pkt_buff *pkt)
-+bool __EXPORTED pktb_mangled(const struct pkt_buff *pkt)
- {
- 	return pkt->mangled;
- }
--EXPORT_SYMBOL(pktb_mangled);
- 
- /**
-  * @}
-diff --git a/src/extra/tcp.c b/src/extra/tcp.c
-index d1cd79d..8038ce5 100644
---- a/src/extra/tcp.c
-+++ b/src/extra/tcp.c
-@@ -40,7 +40,7 @@
-  * \note You have to call nfq_ip_set_transport_header or
-  * nfq_ip6_set_transport_header first to access the TCP header.
-  */
--struct tcphdr *nfq_tcp_get_hdr(struct pkt_buff *pktb)
-+struct tcphdr __EXPORTED *nfq_tcp_get_hdr(struct pkt_buff *pktb)
- {
- 	if (pktb->transport_header == NULL)
- 		return NULL;
-@@ -51,14 +51,13 @@ struct tcphdr *nfq_tcp_get_hdr(struct pkt_buff *pktb)
- 
- 	return (struct tcphdr *)pktb->transport_header;
- }
--EXPORT_SYMBOL(nfq_tcp_get_hdr);
- 
- /**
-  * nfq_tcp_get_payload - get the TCP packet payload
-  * \param tcph: pointer to the TCP header
-  * \param pktb: pointer to user-space network packet buffer
-  */
--void *nfq_tcp_get_payload(struct tcphdr *tcph, struct pkt_buff *pktb)
-+void __EXPORTED *nfq_tcp_get_payload(struct tcphdr *tcph, struct pkt_buff *pktb)
- {
- 	unsigned int len = tcph->doff * 4;
- 
-@@ -72,47 +71,43 @@ void *nfq_tcp_get_payload(struct tcphdr *tcph, struct pkt_buff *pktb)
- 
- 	return pktb->transport_header + len;
- }
--EXPORT_SYMBOL(nfq_tcp_get_payload);
- 
- /**
-  * nfq_tcp_get_payload_len - get the tcp packet payload
-  * \param tcph: pointer to the TCP header
-  * \param pktb: pointer to user-space network packet buffer
-  */
--unsigned int
-+unsigned int __EXPORTED
- nfq_tcp_get_payload_len(struct tcphdr *tcph, struct pkt_buff *pktb)
- {
- 	return pktb->tail - pktb->transport_header;
- }
--EXPORT_SYMBOL(nfq_tcp_get_payload_len);
- 
- /**
-  * nfq_tcp_set_checksum_ipv4 - computes IPv4/TCP packet checksum
-  * \param tcph: pointer to the TCP header
-  * \param iph: pointer to the IPv4 header
-  */
--void
-+void __EXPORTED
- nfq_tcp_compute_checksum_ipv4(struct tcphdr *tcph, struct iphdr *iph)
- {
- 	/* checksum field in header needs to be zero for calculation. */
- 	tcph->check = 0;
- 	tcph->check = nfq_checksum_tcpudp_ipv4(iph);
- }
--EXPORT_SYMBOL(nfq_tcp_compute_checksum_ipv4);
- 
- /**
-  * nfq_tcp_set_checksum_ipv6 - computes IPv6/TCP packet checksum
-  * \param tcph: pointer to the TCP header
-  * \param iph: pointer to the IPv6 header
-  */
--void
-+void __EXPORTED
- nfq_tcp_compute_checksum_ipv6(struct tcphdr *tcph, struct ip6_hdr *ip6h)
- {
- 	/* checksum field in header needs to be zero for calculation. */
- 	tcph->check = 0;
- 	tcph->check = nfq_checksum_tcpudp_ipv6(ip6h, tcph);
- }
--EXPORT_SYMBOL(nfq_tcp_compute_checksum_ipv6);
- 
- /*
-  *	The union cast uses a gcc extension to avoid aliasing problems
-@@ -134,7 +129,7 @@ union tcp_word_hdr {
-  * \param tcp: pointer to a valid tcp header.
-  *
-  */
--int nfq_tcp_snprintf(char *buf, size_t size, const struct tcphdr *tcph)
-+int __EXPORTED nfq_tcp_snprintf(char *buf, size_t size, const struct tcphdr *tcph)
- {
- 	int ret, len = 0;
- 
-@@ -177,7 +172,6 @@ int nfq_tcp_snprintf(char *buf, size_t size, const struct tcphdr *tcph)
- 
- 	return ret;
- }
--EXPORT_SYMBOL(nfq_tcp_snprintf);
- 
- /**
-  * nfq_tcp_mangle_ipv4 - mangle TCP/IPv4 packet buffer
-@@ -189,7 +183,7 @@ EXPORT_SYMBOL(nfq_tcp_snprintf);
-  *
-  * \note This function recalculates the IPv4 and TCP checksums for you.
-  */
--int
-+int __EXPORTED
- nfq_tcp_mangle_ipv4(struct pkt_buff *pkt,
- 		    unsigned int match_offset, unsigned int match_len,
- 		    const char *rep_buffer, unsigned int rep_len)
-@@ -208,7 +202,6 @@ nfq_tcp_mangle_ipv4(struct pkt_buff *pkt,
- 
- 	return 1;
- }
--EXPORT_SYMBOL(nfq_tcp_mangle_ipv4);
- 
- /**
-  * @}
-diff --git a/src/extra/udp.c b/src/extra/udp.c
-index 8c44a66..99c8faa 100644
---- a/src/extra/udp.c
-+++ b/src/extra/udp.c
-@@ -37,7 +37,7 @@
-  * This function returns NULL if invalid UDP header is found. On success,
-  * it returns the UDP header.
-  */
--struct udphdr *nfq_udp_get_hdr(struct pkt_buff *pktb)
-+struct udphdr __EXPORTED *nfq_udp_get_hdr(struct pkt_buff *pktb)
- {
- 	if (pktb->transport_header == NULL)
- 		return NULL;
-@@ -48,14 +48,13 @@ struct udphdr *nfq_udp_get_hdr(struct pkt_buff *pktb)
- 
- 	return (struct udphdr *)pktb->transport_header;
- }
--EXPORT_SYMBOL(nfq_udp_get_hdr);
- 
- /**
-  * nfq_udp_get_payload - get the UDP packet payload.
-  * \param udph: the pointer to the UDP header.
-  * \param tail: pointer to the tail of the packet
-  */
--void *nfq_udp_get_payload(struct udphdr *udph, struct pkt_buff *pktb)
-+void __EXPORTED *nfq_udp_get_payload(struct udphdr *udph, struct pkt_buff *pktb)
- {
- 	uint16_t len = ntohs(udph->len);
- 
-@@ -69,17 +68,15 @@ void *nfq_udp_get_payload(struct udphdr *udph, struct pkt_buff *pktb)
- 
- 	return pktb->transport_header + sizeof(struct udphdr);
- }
--EXPORT_SYMBOL(nfq_udp_get_payload);
- 
- /**
-  * nfq_udp_get_payload_len - get the udp packet payload.
-  * \param udp: the pointer to the udp header.
-  */
--unsigned int nfq_udp_get_payload_len(struct udphdr *udph, struct pkt_buff *pktb)
-+unsigned int __EXPORTED nfq_udp_get_payload_len(struct udphdr *udph, struct pkt_buff *pktb)
- {
- 	return pktb->tail - pktb->transport_header;
- }
--EXPORT_SYMBOL(nfq_udp_get_payload_len);
- 
- /**
-  * nfq_udp_set_checksum_ipv4 - computes a IPv4/TCP packet's segment
-@@ -91,14 +88,13 @@ EXPORT_SYMBOL(nfq_udp_get_payload_len);
-  * \see nfq_pkt_compute_ip_checksum
-  * \see nfq_pkt_compute_udp_checksum
-  */
--void
-+void __EXPORTED
- nfq_udp_compute_checksum_ipv4(struct udphdr *udph, struct iphdr *iph)
- {
- 	/* checksum field in header needs to be zero for calculation. */
- 	udph->check = 0;
- 	udph->check = nfq_checksum_tcpudp_ipv4(iph);
- }
--EXPORT_SYMBOL(nfq_udp_compute_checksum_ipv4);
- 
- /**
-  * nfq_udp_set_checksum_ipv6 - computes a IPv6/TCP packet's segment
-@@ -110,14 +106,13 @@ EXPORT_SYMBOL(nfq_udp_compute_checksum_ipv4);
-  * \see nfq_pkt_compute_ip_checksum
-  * \see nfq_pkt_compute_udp_checksum
-  */
--void
-+void __EXPORTED
- nfq_udp_compute_checksum_ipv6(struct udphdr *udph, struct ip6_hdr *ip6h)
- {
- 	/* checksum field in header needs to be zero for calculation. */
- 	udph->check = 0;
- 	udph->check = nfq_checksum_tcpudp_ipv6(ip6h, udph);
- }
--EXPORT_SYMBOL(nfq_udp_compute_checksum_ipv6);
- 
- /**
-  * nfq_tcp_mangle_ipv4 - mangle TCP/IPv4 packet buffer
-@@ -129,7 +124,7 @@ EXPORT_SYMBOL(nfq_udp_compute_checksum_ipv6);
-  *
-  * \note This function recalculates the IPv4 and TCP checksums for you.
-  */
--int
-+int __EXPORTED
- nfq_udp_mangle_ipv4(struct pkt_buff *pkt,
- 		    unsigned int match_offset, unsigned int match_len,
- 		    const char *rep_buffer, unsigned int rep_len)
-@@ -148,7 +143,6 @@ nfq_udp_mangle_ipv4(struct pkt_buff *pkt,
- 
- 	return 1;
- }
--EXPORT_SYMBOL(nfq_udp_mangle_ipv4);
- 
- /**
-  * nfq_pkt_snprintf_udp_hdr - print udp header into one buffer in a humnan
-@@ -158,12 +152,11 @@ EXPORT_SYMBOL(nfq_udp_mangle_ipv4);
-  * \param udp: pointer to a valid udp header.
-  *
-  */
--int nfq_udp_snprintf(char *buf, size_t size, const struct udphdr *udph)
-+int __EXPORTED nfq_udp_snprintf(char *buf, size_t size, const struct udphdr *udph)
- {
- 	return snprintf(buf, size, "SPT=%u DPT=%u ",
- 			htons(udph->source), htons(udph->dest));
- }
--EXPORT_SYMBOL(nfq_udp_snprintf);
- 
- /**
-  * @}
-diff --git a/src/internal.h b/src/internal.h
-index 558d267..79b0752 100644
---- a/src/internal.h
-+++ b/src/internal.h
-@@ -5,10 +5,9 @@
- #include <stdint.h>
- #include <stdbool.h>
- #ifdef HAVE_VISIBILITY_HIDDEN
--#	define __visible	__attribute__((visibility("default")))
--#	define EXPORT_SYMBOL(x)	typeof(x) (x) __visible
-+#	define __EXPORTED	__attribute__((visibility("default")))
- #else
--#	define EXPORT_SYMBOL
-+#	define __EXPORTED
- #endif
- 
- struct iphdr;
-diff --git a/src/libnetfilter_queue.c b/src/libnetfilter_queue.c
-index 673e3b0..c12f068 100644
---- a/src/libnetfilter_queue.c
-+++ b/src/libnetfilter_queue.c
-@@ -133,8 +133,7 @@ struct nfq_data {
- 	struct nfattr **data;
- };
- 
--int nfq_errno;
--EXPORT_SYMBOL(nfq_errno);
-+int __EXPORTED nfq_errno;
- 
- /***********************************************************************
-  * low level stuff 
-@@ -218,11 +217,10 @@ static int __nfq_rcv_pkt(struct nlmsghdr *nlh, struct nfattr *nfa[],
- 
- /* public interface */
- 
--struct nfnl_handle *nfq_nfnlh(struct nfq_handle *h)
-+struct nfnl_handle __EXPORTED *nfq_nfnlh(struct nfq_handle *h)
- {
- 	return h->nfnlh;
- }
--EXPORT_SYMBOL(nfq_nfnlh);
- 
- /**
-  *
-@@ -294,11 +292,10 @@ EXPORT_SYMBOL(nfq_nfnlh);
-  * over the netlink connection associated with the given queue connection
-  * handle.
-  */
--int nfq_fd(struct nfq_handle *h)
-+int __EXPORTED nfq_fd(struct nfq_handle *h)
- {
- 	return nfnl_fd(nfq_nfnlh(h));
- }
--EXPORT_SYMBOL(nfq_fd);
- /**
-  * @}
-  */
-@@ -349,7 +346,7 @@ EXPORT_SYMBOL(nfq_fd);
-  *
-  * \return a pointer to a new queue handle or NULL on failure.
-  */
--struct nfq_handle *nfq_open(void)
-+struct nfq_handle __EXPORTED *nfq_open(void)
- {
- 	struct nfnl_handle *nfnlh = nfnl_open();
- 	struct nfq_handle *qh;
-@@ -366,7 +363,6 @@ struct nfq_handle *nfq_open(void)
- 
- 	return qh;
- }
--EXPORT_SYMBOL(nfq_open);
- 
- /**
-  * @}
-@@ -382,7 +378,7 @@ EXPORT_SYMBOL(nfq_open);
-  *
-  * \return a pointer to a new queue handle or NULL on failure.
-  */
--struct nfq_handle *nfq_open_nfnl(struct nfnl_handle *nfnlh)
-+struct nfq_handle __EXPORTED *nfq_open_nfnl(struct nfnl_handle *nfnlh)
- {
- 	struct nfnl_callback pkt_cb = {
- 		.call		= __nfq_rcv_pkt,
-@@ -419,7 +415,6 @@ out_free:
- 	free(h);
- 	return NULL;
- }
--EXPORT_SYMBOL(nfq_open_nfnl);
- 
- /**
-  * \addtogroup LibrarySetup
-@@ -438,7 +433,7 @@ EXPORT_SYMBOL(nfq_open_nfnl);
-  *
-  * \return 0 on success, non-zero on failure. 
-  */
--int nfq_close(struct nfq_handle *h)
-+int __EXPORTED nfq_close(struct nfq_handle *h)
- {
- 	int ret;
- 	
-@@ -447,7 +442,6 @@ int nfq_close(struct nfq_handle *h)
- 		free(h);
- 	return ret;
- }
--EXPORT_SYMBOL(nfq_close);
- 
- /**
-  * nfq_bind_pf - bind a nfqueue handler to a given protocol family
-@@ -460,11 +454,10 @@ EXPORT_SYMBOL(nfq_close);
-  *
-  * \return integer inferior to 0 in case of failure
-  */
--int nfq_bind_pf(struct nfq_handle *h, uint16_t pf)
-+int __EXPORTED nfq_bind_pf(struct nfq_handle *h, uint16_t pf)
- {
- 	return __build_send_cfg_msg(h, NFQNL_CFG_CMD_PF_BIND, 0, pf);
- }
--EXPORT_SYMBOL(nfq_bind_pf);
- 
- /**
-  * nfq_unbind_pf - unbind nfqueue handler from a protocol family
-@@ -476,11 +469,10 @@ EXPORT_SYMBOL(nfq_bind_pf);
-  *
-  * This call is obsolete, Linux kernels from 3.8 onwards ignore it.
-  */
--int nfq_unbind_pf(struct nfq_handle *h, uint16_t pf)
-+int __EXPORTED nfq_unbind_pf(struct nfq_handle *h, uint16_t pf)
- {
- 	return __build_send_cfg_msg(h, NFQNL_CFG_CMD_PF_UNBIND, 0, pf);
- }
--EXPORT_SYMBOL(nfq_unbind_pf);
- 
- 
- /**
-@@ -524,7 +516,7 @@ typedef int nfq_callback(struct nfq_q_handle *qh,
-  * The callback should return < 0 to stop processing.
-  */
- 
--struct nfq_q_handle *nfq_create_queue(struct nfq_handle *h, 
-+struct nfq_q_handle __EXPORTED *nfq_create_queue(struct nfq_handle *h, 
- 		uint16_t num,
- 		nfq_callback *cb,
- 		void *data)
-@@ -555,7 +547,6 @@ struct nfq_q_handle *nfq_create_queue(struct nfq_handle *h,
- 	add_qh(qh);
- 	return qh;
- }
--EXPORT_SYMBOL(nfq_create_queue);
- 
- /**
-  * @}
-@@ -573,7 +564,7 @@ EXPORT_SYMBOL(nfq_create_queue);
-  * Removes the binding for the specified queue handle. This call also unbind
-  * from the nfqueue handler, so you don't have to call nfq_unbind_pf.
-  */
--int nfq_destroy_queue(struct nfq_q_handle *qh)
-+int __EXPORTED nfq_destroy_queue(struct nfq_q_handle *qh)
- {
- 	int ret = __build_send_cfg_msg(qh->h, NFQNL_CFG_CMD_UNBIND, qh->id, 0);
- 	if (ret == 0) {
-@@ -583,7 +574,6 @@ int nfq_destroy_queue(struct nfq_q_handle *qh)
- 
- 	return ret;
- }
--EXPORT_SYMBOL(nfq_destroy_queue);
- 
- /**
-  * nfq_handle_packet - handle a packet received from the nfqueue subsystem
-@@ -597,11 +587,10 @@ EXPORT_SYMBOL(nfq_destroy_queue);
-  *
-  * \return 0 on success, non-zero on failure.
-  */
--int nfq_handle_packet(struct nfq_handle *h, char *buf, int len)
-+int __EXPORTED nfq_handle_packet(struct nfq_handle *h, char *buf, int len)
- {
- 	return nfnl_handle_packet(h->nfnlh, buf, len);
- }
--EXPORT_SYMBOL(nfq_handle_packet);
- 
- /**
-  * nfq_set_mode - set the amount of packet data that nfqueue copies to userspace
-@@ -618,7 +607,7 @@ EXPORT_SYMBOL(nfq_handle_packet);
-  *
-  * \return -1 on error; >=0 otherwise.
-  */
--int nfq_set_mode(struct nfq_q_handle *qh,
-+int __EXPORTED nfq_set_mode(struct nfq_q_handle *qh,
- 		uint8_t mode, uint32_t range)
- {
- 	union {
-@@ -638,7 +627,6 @@ int nfq_set_mode(struct nfq_q_handle *qh,
- 
- 	return nfnl_query(qh->h->nfnlh, &u.nmh);
- }
--EXPORT_SYMBOL(nfq_set_mode);
- 
- /**
-  * nfq_set_queue_flags - set flags (options) for the kernel queue
-@@ -708,7 +696,7 @@ EXPORT_SYMBOL(nfq_set_mode);
-  *
-  * \return -1 on error with errno set appropriately; =0 otherwise.
-  */
--int nfq_set_queue_flags(struct nfq_q_handle *qh,
-+int __EXPORTED nfq_set_queue_flags(struct nfq_q_handle *qh,
- 			uint32_t mask, uint32_t flags)
- {
- 	union {
-@@ -729,7 +717,6 @@ int nfq_set_queue_flags(struct nfq_q_handle *qh,
- 
- 	return nfnl_query(qh->h->nfnlh, &u.nmh);
- }
--EXPORT_SYMBOL(nfq_set_queue_flags);
- 
- /**
-  * nfq_set_queue_maxlen - Set kernel queue maximum length parameter
-@@ -742,7 +729,7 @@ EXPORT_SYMBOL(nfq_set_queue_flags);
-  *
-  * \return -1 on error; >=0 otherwise.
-  */
--int nfq_set_queue_maxlen(struct nfq_q_handle *qh,
-+int __EXPORTED nfq_set_queue_maxlen(struct nfq_q_handle *qh,
- 				uint32_t queuelen)
- {
- 	union {
-@@ -760,7 +747,6 @@ int nfq_set_queue_maxlen(struct nfq_q_handle *qh,
- 
- 	return nfnl_query(qh->h->nfnlh, &u.nmh);
- }
--EXPORT_SYMBOL(nfq_set_queue_maxlen);
- 
- /**
-  * @}
-@@ -847,14 +833,13 @@ static int __set_verdict(struct nfq_q_handle *qh, uint32_t id,
-  *
-  * \return -1 on error; >= 0 otherwise.
-  */
--int nfq_set_verdict(struct nfq_q_handle *qh, uint32_t id,
-+int __EXPORTED nfq_set_verdict(struct nfq_q_handle *qh, uint32_t id,
- 		uint32_t verdict, uint32_t data_len,
- 		const unsigned char *buf)
- {
- 	return __set_verdict(qh, id, verdict, 0, 0, data_len, buf,
- 						NFQNL_MSG_VERDICT);
- }
--EXPORT_SYMBOL(nfq_set_verdict);
- 
- /**
-  * nfq_set_verdict2 - like nfq_set_verdict, but you can set the mark.
-@@ -865,14 +850,13 @@ EXPORT_SYMBOL(nfq_set_verdict);
-  * \param data_len number of bytes of data pointed to by #buf
-  * \param buf the buffer that contains the packet data
-  */
--int nfq_set_verdict2(struct nfq_q_handle *qh, uint32_t id,
-+int __EXPORTED nfq_set_verdict2(struct nfq_q_handle *qh, uint32_t id,
- 		     uint32_t verdict, uint32_t mark,
- 		     uint32_t data_len, const unsigned char *buf)
- {
- 	return __set_verdict(qh, id, verdict, htonl(mark), 1, data_len,
- 						buf, NFQNL_MSG_VERDICT);
- }
--EXPORT_SYMBOL(nfq_set_verdict2);
- 
- /**
-  * nfq_set_verdict_batch - issue verdicts on several packets at once
-@@ -886,13 +870,12 @@ EXPORT_SYMBOL(nfq_set_verdict2);
-  * batch support was added in Linux 3.1.
-  * These functions will fail silently on older kernels.
-  */
--int nfq_set_verdict_batch(struct nfq_q_handle *qh, uint32_t id,
-+int __EXPORTED nfq_set_verdict_batch(struct nfq_q_handle *qh, uint32_t id,
- 					  uint32_t verdict)
- {
- 	return __set_verdict(qh, id, verdict, 0, 0, 0, NULL,
- 					NFQNL_MSG_VERDICT_BATCH);
- }
--EXPORT_SYMBOL(nfq_set_verdict_batch);
- 
- /**
-  * nfq_set_verdict_batch2 - like nfq_set_verdict_batch, but you can set a mark.
-@@ -901,13 +884,12 @@ EXPORT_SYMBOL(nfq_set_verdict_batch);
-  * \param verdict verdict to return to netfilter (NF_ACCEPT, NF_DROP)
-  * \param mark mark to put on packet
-  */
--int nfq_set_verdict_batch2(struct nfq_q_handle *qh, uint32_t id,
-+int __EXPORTED nfq_set_verdict_batch2(struct nfq_q_handle *qh, uint32_t id,
- 		     uint32_t verdict, uint32_t mark)
- {
- 	return __set_verdict(qh, id, verdict, htonl(mark), 1, 0,
- 				NULL, NFQNL_MSG_VERDICT_BATCH);
- }
--EXPORT_SYMBOL(nfq_set_verdict_batch2);
- 
- /**
-  * nfq_set_verdict_mark - like nfq_set_verdict, but you can set the mark.
-@@ -923,14 +905,13 @@ EXPORT_SYMBOL(nfq_set_verdict_batch2);
-  * This function is deprecated since it is broken, its use is highly
-  * discouraged. Please, use nfq_set_verdict2 instead.
-  */
--int nfq_set_verdict_mark(struct nfq_q_handle *qh, uint32_t id,
-+int __EXPORTED nfq_set_verdict_mark(struct nfq_q_handle *qh, uint32_t id,
- 		uint32_t verdict, uint32_t mark,
- 		uint32_t data_len, const unsigned char *buf)
- {
- 	return __set_verdict(qh, id, verdict, mark, 1, data_len, buf,
- 						NFQNL_MSG_VERDICT);
- }
--EXPORT_SYMBOL(nfq_set_verdict_mark);
- 
- /**
-  * @}
-@@ -965,12 +946,11 @@ EXPORT_SYMBOL(nfq_set_verdict_mark);
- 	} __attribute__ ((packed));
- \endverbatim
-  */
--struct nfqnl_msg_packet_hdr *nfq_get_msg_packet_hdr(struct nfq_data *nfad)
-+struct nfqnl_msg_packet_hdr __EXPORTED *nfq_get_msg_packet_hdr(struct nfq_data *nfad)
- {
- 	return nfnl_get_pointer_to_data(nfad->data, NFQA_PACKET_HDR,
- 					struct nfqnl_msg_packet_hdr);
- }
--EXPORT_SYMBOL(nfq_get_msg_packet_hdr);
- 
- /**
-  * nfq_get_nfmark - get the packet mark
-@@ -978,11 +958,10 @@ EXPORT_SYMBOL(nfq_get_msg_packet_hdr);
-  *
-  * \return the netfilter mark currently assigned to the given queued packet.
-  */
--uint32_t nfq_get_nfmark(struct nfq_data *nfad)
-+uint32_t __EXPORTED nfq_get_nfmark(struct nfq_data *nfad)
- {
- 	return ntohl(nfnl_get_data(nfad->data, NFQA_MARK, uint32_t));
- }
--EXPORT_SYMBOL(nfq_get_nfmark);
- 
- /**
-  * nfq_get_timestamp - get the packet timestamp
-@@ -993,7 +972,7 @@ EXPORT_SYMBOL(nfq_get_nfmark);
-  *
-  * \return 0 on success, non-zero on failure.
-  */
--int nfq_get_timestamp(struct nfq_data *nfad, struct timeval *tv)
-+int __EXPORTED nfq_get_timestamp(struct nfq_data *nfad, struct timeval *tv)
- {
- 	struct nfqnl_msg_packet_timestamp *qpt;
- 	qpt = nfnl_get_pointer_to_data(nfad->data, NFQA_TIMESTAMP,
-@@ -1006,7 +985,6 @@ int nfq_get_timestamp(struct nfq_data *nfad, struct timeval *tv)
- 
- 	return 0;
- }
--EXPORT_SYMBOL(nfq_get_timestamp);
- 
- /**
-  * nfq_get_indev - get the interface that the packet was received through
-@@ -1019,11 +997,10 @@ EXPORT_SYMBOL(nfq_get_timestamp);
-  * \warning all nfq_get_dev() functions return 0 if not set, since linux
-  * only allows ifindex >= 1, see net/core/dev.c:2600  (in 2.6.13.1)
-  */
--uint32_t nfq_get_indev(struct nfq_data *nfad)
-+uint32_t __EXPORTED nfq_get_indev(struct nfq_data *nfad)
- {
- 	return ntohl(nfnl_get_data(nfad->data, NFQA_IFINDEX_INDEV, uint32_t));
- }
--EXPORT_SYMBOL(nfq_get_indev);
- 
- /**
-  * nfq_get_physindev - get the physical interface that the packet was received
-@@ -1033,11 +1010,10 @@ EXPORT_SYMBOL(nfq_get_indev);
-  * If the returned index is 0, the packet was locally generated or the
-  * physical input interface is no longer known (ie. POSTROUTING?).
-  */
--uint32_t nfq_get_physindev(struct nfq_data *nfad)
-+uint32_t __EXPORTED nfq_get_physindev(struct nfq_data *nfad)
- {
- 	return ntohl(nfnl_get_data(nfad->data, NFQA_IFINDEX_PHYSINDEV, uint32_t));
- }
--EXPORT_SYMBOL(nfq_get_physindev);
- 
- /**
-  * nfq_get_outdev - gets the interface that the packet will be routed out
-@@ -1047,11 +1023,10 @@ EXPORT_SYMBOL(nfq_get_physindev);
-  * returned index is 0, the packet is destined for localhost or the output
-  * interface is not yet known (ie. PREROUTING?).
-  */
--uint32_t nfq_get_outdev(struct nfq_data *nfad)
-+uint32_t __EXPORTED nfq_get_outdev(struct nfq_data *nfad)
- {
- 	return ntohl(nfnl_get_data(nfad->data, NFQA_IFINDEX_OUTDEV, uint32_t));
- }
--EXPORT_SYMBOL(nfq_get_outdev);
- 
- /**
-  * nfq_get_physoutdev - get the physical interface that the packet output
-@@ -1063,11 +1038,10 @@ EXPORT_SYMBOL(nfq_get_outdev);
-  * 
-  * \return The index of physical interface that the packet output will be routed out.
-  */
--uint32_t nfq_get_physoutdev(struct nfq_data *nfad)
-+uint32_t __EXPORTED nfq_get_physoutdev(struct nfq_data *nfad)
- {
- 	return ntohl(nfnl_get_data(nfad->data, NFQA_IFINDEX_PHYSOUTDEV, uint32_t));
- }
--EXPORT_SYMBOL(nfq_get_physoutdev);
- 
- /**
-  * nfq_get_indev_name - get the name of the interface the packet
-@@ -1107,13 +1081,12 @@ EXPORT_SYMBOL(nfq_get_physoutdev);
- \endverbatim
-  *
-  */
--int nfq_get_indev_name(struct nlif_handle *nlif_handle,
-+int __EXPORTED nfq_get_indev_name(struct nlif_handle *nlif_handle,
- 			struct nfq_data *nfad, char *name)
- {
- 	uint32_t ifindex = nfq_get_indev(nfad);
- 	return nlif_index2name(nlif_handle, ifindex, name);
- }
--EXPORT_SYMBOL(nfq_get_indev_name);
- 
- /**
-  * nfq_get_physindev_name - get the name of the physical interface the
-@@ -1127,13 +1100,12 @@ EXPORT_SYMBOL(nfq_get_indev_name);
-  *
-  * \return  -1 in case of error, > 0 if it succeed. 
-  */
--int nfq_get_physindev_name(struct nlif_handle *nlif_handle,
-+int __EXPORTED nfq_get_physindev_name(struct nlif_handle *nlif_handle,
- 			   struct nfq_data *nfad, char *name)
- {
- 	uint32_t ifindex = nfq_get_physindev(nfad);
- 	return nlif_index2name(nlif_handle, ifindex, name);
- }
--EXPORT_SYMBOL(nfq_get_physindev_name);
- 
- /**
-  * nfq_get_outdev_name - get the name of the physical interface the
-@@ -1147,13 +1119,12 @@ EXPORT_SYMBOL(nfq_get_physindev_name);
-  *
-  * \return  -1 in case of error, > 0 if it succeed. 
-  */
--int nfq_get_outdev_name(struct nlif_handle *nlif_handle,
-+int __EXPORTED nfq_get_outdev_name(struct nlif_handle *nlif_handle,
- 			struct nfq_data *nfad, char *name)
- {
- 	uint32_t ifindex = nfq_get_outdev(nfad);
- 	return nlif_index2name(nlif_handle, ifindex, name);
- }
--EXPORT_SYMBOL(nfq_get_outdev_name);
- 
- /**
-  * nfq_get_physoutdev_name - get the name of the interface the
-@@ -1168,13 +1139,12 @@ EXPORT_SYMBOL(nfq_get_outdev_name);
-  * \return  -1 in case of error, > 0 if it succeed. 
-  */
- 
--int nfq_get_physoutdev_name(struct nlif_handle *nlif_handle,
-+int __EXPORTED nfq_get_physoutdev_name(struct nlif_handle *nlif_handle,
- 			    struct nfq_data *nfad, char *name)
- {
- 	uint32_t ifindex = nfq_get_physoutdev(nfad);
- 	return nlif_index2name(nlif_handle, ifindex, name);
- }
--EXPORT_SYMBOL(nfq_get_physoutdev_name);
- 
- /**
-  * nfq_get_packet_hw
-@@ -1198,12 +1168,11 @@ EXPORT_SYMBOL(nfq_get_physoutdev_name);
- 	} __attribute__ ((packed));
- \endverbatim
-  */
--struct nfqnl_msg_packet_hw *nfq_get_packet_hw(struct nfq_data *nfad)
-+struct nfqnl_msg_packet_hw __EXPORTED *nfq_get_packet_hw(struct nfq_data *nfad)
- {
- 	return nfnl_get_pointer_to_data(nfad->data, NFQA_HWADDR,
- 					struct nfqnl_msg_packet_hw);
- }
--EXPORT_SYMBOL(nfq_get_packet_hw);
- 
- /**
-  * nfq_get_uid - get the UID of the user the packet belongs to
-@@ -1215,7 +1184,7 @@ EXPORT_SYMBOL(nfq_get_packet_hw);
-  *
-  * \return 1 if there is a UID available, 0 otherwise.
-  */
--int nfq_get_uid(struct nfq_data *nfad, uint32_t *uid)
-+int __EXPORTED nfq_get_uid(struct nfq_data *nfad, uint32_t *uid)
- {
- 	if (!nfnl_attr_present(nfad->data, NFQA_UID))
- 		return 0;
-@@ -1223,7 +1192,6 @@ int nfq_get_uid(struct nfq_data *nfad, uint32_t *uid)
- 	*uid = ntohl(nfnl_get_data(nfad->data, NFQA_UID, uint32_t));
- 	return 1;
- }
--EXPORT_SYMBOL(nfq_get_uid);
- 
- /**
-  * nfq_get_gid - get the GID of the user the packet belongs to
-@@ -1235,7 +1203,7 @@ EXPORT_SYMBOL(nfq_get_uid);
-  *
-  * \return 1 if there is a GID available, 0 otherwise.
-  */
--int nfq_get_gid(struct nfq_data *nfad, uint32_t *gid)
-+int __EXPORTED nfq_get_gid(struct nfq_data *nfad, uint32_t *gid)
- {
- 	if (!nfnl_attr_present(nfad->data, NFQA_GID))
- 		return 0;
-@@ -1243,7 +1211,6 @@ int nfq_get_gid(struct nfq_data *nfad, uint32_t *gid)
- 	*gid = ntohl(nfnl_get_data(nfad->data, NFQA_GID, uint32_t));
- 	return 1;
- }
--EXPORT_SYMBOL(nfq_get_gid);
- 
- /**
-  * nfq_get_secctx - get the security context for this packet
-@@ -1256,7 +1223,7 @@ EXPORT_SYMBOL(nfq_get_gid);
-  *
-  * \return -1 on error, otherwise > 0
-  */
--int nfq_get_secctx(struct nfq_data *nfad, unsigned char **secdata)
-+int __EXPORTED nfq_get_secctx(struct nfq_data *nfad, unsigned char **secdata)
- {
- 	if (!nfnl_attr_present(nfad->data, NFQA_SECCTX))
- 		return -1;
-@@ -1269,7 +1236,6 @@ int nfq_get_secctx(struct nfq_data *nfad, unsigned char **secdata)
- 
- 	return 0;
- }
--EXPORT_SYMBOL(nfq_get_secctx);
- 
- /**
-  * nfq_get_payload - get payload 
-@@ -1282,7 +1248,7 @@ EXPORT_SYMBOL(nfq_get_secctx);
-  *
-  * \return -1 on error, otherwise > 0.
-  */
--int nfq_get_payload(struct nfq_data *nfad, unsigned char **data)
-+int __EXPORTED nfq_get_payload(struct nfq_data *nfad, unsigned char **data)
- {
- 	*data = (unsigned char *)
- 		nfnl_get_pointer_to_data(nfad->data, NFQA_PAYLOAD, char);
-@@ -1291,7 +1257,6 @@ int nfq_get_payload(struct nfq_data *nfad, unsigned char **data)
- 
- 	return -1;
- }
--EXPORT_SYMBOL(nfq_get_payload);
- 
- /**
-  * @}
-@@ -1336,7 +1301,7 @@ do {								\
-  * would have been printed into the buffer (in case that there is enough
-  * room in it). See snprintf() return value for more information.
-  */
--int nfq_snprintf_xml(char *buf, size_t rem, struct nfq_data *tb, int flags)
-+int __EXPORTED nfq_snprintf_xml(char *buf, size_t rem, struct nfq_data *tb, int flags)
- {
- 	struct nfqnl_msg_packet_hdr *ph;
- 	struct nfqnl_msg_packet_hw *hwph;
-@@ -1489,7 +1454,6 @@ int nfq_snprintf_xml(char *buf, size_t rem, struct nfq_data *tb, int flags)
- 
- 	return len;
- }
--EXPORT_SYMBOL(nfq_snprintf_xml);
- 
- /**
-  * @}
-diff --git a/src/nlmsg.c b/src/nlmsg.c
-index ba28c77..5582407 100644
---- a/src/nlmsg.c
-+++ b/src/nlmsg.c
-@@ -30,7 +30,7 @@
-  * @{
-  */
- 
--void nfq_nlmsg_verdict_put(struct nlmsghdr *nlh, int id, int verdict)
-+void __EXPORTED nfq_nlmsg_verdict_put(struct nlmsghdr *nlh, int id, int verdict)
- {
- 	struct nfqnl_msg_verdict_hdr vh = {
- 		.verdict	= htonl(verdict),
-@@ -38,20 +38,17 @@ void nfq_nlmsg_verdict_put(struct nlmsghdr *nlh, int id, int verdict)
- 	};
- 	mnl_attr_put(nlh, NFQA_VERDICT_HDR, sizeof(vh), &vh);
- }
--EXPORT_SYMBOL(nfq_nlmsg_verdict_put);
- 
--void nfq_nlmsg_verdict_put_mark(struct nlmsghdr *nlh, uint32_t mark)
-+void __EXPORTED nfq_nlmsg_verdict_put_mark(struct nlmsghdr *nlh, uint32_t mark)
- {
- 	mnl_attr_put_u32(nlh, NFQA_MARK, htonl(mark));
- }
--EXPORT_SYMBOL(nfq_nlmsg_verdict_put_mark);
- 
--void
-+void __EXPORTED
- nfq_nlmsg_verdict_put_pkt(struct nlmsghdr *nlh, const void *pkt, uint32_t plen)
- {
- 	mnl_attr_put(nlh, NFQA_PAYLOAD, plen, pkt);
- }
--EXPORT_SYMBOL(nfq_nlmsg_verdict_put_pkt);
- 
- /**
-  * @}
-@@ -85,7 +82,7 @@ EXPORT_SYMBOL(nfq_nlmsg_verdict_put_pkt);
-  *   given protocol family.  Both commands are ignored by Linux kernel 3.8 and
-  *   later versions.
-  */
--void nfq_nlmsg_cfg_put_cmd(struct nlmsghdr *nlh, uint16_t pf, uint8_t cmd)
-+void __EXPORTED nfq_nlmsg_cfg_put_cmd(struct nlmsghdr *nlh, uint16_t pf, uint8_t cmd)
- {
- 	struct nfqnl_msg_config_cmd command = {
- 		.command = cmd,
-@@ -93,9 +90,8 @@ void nfq_nlmsg_cfg_put_cmd(struct nlmsghdr *nlh, uint16_t pf, uint8_t cmd)
- 	};
- 	mnl_attr_put(nlh, NFQA_CFG_CMD, sizeof(command), &command);
- }
--EXPORT_SYMBOL(nfq_nlmsg_cfg_put_cmd);
- 
--void nfq_nlmsg_cfg_put_params(struct nlmsghdr *nlh, uint8_t mode, int range)
-+void __EXPORTED nfq_nlmsg_cfg_put_params(struct nlmsghdr *nlh, uint8_t mode, int range)
- {
- 	struct nfqnl_msg_config_params params = {
- 		.copy_range = htonl(range),
-@@ -103,13 +99,11 @@ void nfq_nlmsg_cfg_put_params(struct nlmsghdr *nlh, uint8_t mode, int range)
- 	};
- 	mnl_attr_put(nlh, NFQA_CFG_PARAMS, sizeof(params), &params);
- }
--EXPORT_SYMBOL(nfq_nlmsg_cfg_put_params);
- 
--void nfq_nlmsg_cfg_put_qmaxlen(struct nlmsghdr *nlh, uint32_t queue_maxlen)
-+void __EXPORTED nfq_nlmsg_cfg_put_qmaxlen(struct nlmsghdr *nlh, uint32_t queue_maxlen)
- {
- 	mnl_attr_put_u32(nlh, NFQA_CFG_QUEUE_MAXLEN, htonl(queue_maxlen));
- }
--EXPORT_SYMBOL(nfq_nlmsg_cfg_put_qmaxlen);
- 
- /**
-  * @}
-@@ -179,12 +173,11 @@ static int nfq_pkt_parse_attr_cb(const struct nlattr *attr, void *data)
-  * This function returns MNL_CB_ERROR if any error occurs, or MNL_CB_OK on
-  * success.
-  */
--int nfq_nlmsg_parse(const struct nlmsghdr *nlh, struct nlattr **attr)
-+int __EXPORTED nfq_nlmsg_parse(const struct nlmsghdr *nlh, struct nlattr **attr)
- {
- 	return mnl_attr_parse(nlh, sizeof(struct nfgenmsg),
- 			      nfq_pkt_parse_attr_cb, attr);
- }
--EXPORT_SYMBOL(nfq_nlmsg_parse);
- 
- /**
-  * @}
diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.3.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.5.bb
similarity index 77%
rename from meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.3.bb
rename to meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.5.bb
index 1bbab6f3c..f806b0747 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.3.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.5.bb
@@ -6,10 +6,9 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 DEPENDS = "libnfnetlink libmnl"
 
-SRCREV = "601abd1c71ccdf90753cf294c120ad43fb25dc54"
+SRCREV = "2ff321690b8dafeca99ee8e9cafac71e36f292b9"
 
 SRC_URI = "git://git.netfilter.org/libnetfilter_queue;branch=master \
-           file://0001-libnetfilter-queue-Declare-the-define-visivility-attribute-together.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.25.1


