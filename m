Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C878CDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 06:56:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.33138.1697180165886321204
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Oct 2023 23:56:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CTpvE/hu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8650b84d85=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39D5dQmA029150
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 23:56:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=sAPt/yXzpTKEcjBHF7
	2frmFR6qYEzWOebzQbesnRk9I=; b=CTpvE/huPMXKdiMhe+iz2bszm1UXQ997tg
	1tGzkCsw0ixOltuT1xbeXi9DzQGdj9YGUdouCkS0yhV2DVcpIdw7UGNcfIzZxZAA
	4RcjZk9mh0K8oIIsJF6da5rkcFiiVulaPZV38yfWRRxsuTIgs1u5eDhoKL01Kq/S
	Fw91YhHwjU6jDqk7NezJ2uidx5/L6DwrRNSvwcVqsHTb/w6tgzjAM0/xaQ4JcEFS
	vYI3AJvF+kX5lhhENLEv4P6fj1xhmeYgh9iBZYB/KfOz1Ca3cEH1yh6VuheSF794
	tHwtuyfyO/bpOn0gOgb7dY6MbNVlGrUgcHPtOfPYNqGZCs0J9mNA==
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tnhq4a7e6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 23:56:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E0sKJBKrPlta/qzaxBJ2RdyRucUgb3G4yMIKnC97LM4AiQRbQeLnGhMBYuQuSCBFcWX3vVKJKLhOpJDqPMwKjZ/YAvEZV+YteG9i3NYHVdPlWX/mfqRqUXlZko8UyCT88qbXtS/wM5R15iSJOs8T7QwsCHBnoy4zQ28vl1YiUcp3SlnHW6+WBTY0RISeP2eLUWaYsiyBnZbU2WigC7qgGpSsKQzxuwsVwhvWqNDq0LaV/vd3U1/Cy+cR+JhkisPOOrZKESv3y55EnHiai/fZCpZdSNbOAoCZPwEbju3g6QX5+AfFJvoj68T9MNkRlgvKDXyp4d2DYbqNFY+YQIasvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sAPt/yXzpTKEcjBHF72frmFR6qYEzWOebzQbesnRk9I=;
 b=R0yemAqDGCVjK1e4kBXzyFMEfV8zfqX2PJ+4fEHywNNiw6pRwsFeVt2yFKlRBrSfRxEDjpNuOYwAJ7tGDddRONBP2XIkX7LGAgFHorHvMfYf2VbtR1fLdan+rG1rf52DMBp1BgytF3BBqHhlx00Ff4v2ajggjACL1rGqSBskYuv0sxdnW2pErfDkej8Z461M26tUM2GqhUdtupYElJ0yzkv0qE/TFrKBXIpLqeD8puOPqpG0wlSPEp8g0g5lacXhD3fUknzHG2hgLr+6IjKatIYnVUWXg4pkUHxD2Vq1k85YqFxjw5eaR5yp18hbjcoX+dIbgKfBLi+CSet31MAugg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SA0PR11MB4527.namprd11.prod.outlook.com (2603:10b6:806:72::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Fri, 13 Oct
 2023 06:56:03 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::96db:9814:2d71:a957]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::96db:9814:2d71:a957%6]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 06:56:03 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] mbedtls: upgrade 2.28.4 -> 2.28.5
Date: Fri, 13 Oct 2023 14:55:52 +0800
Message-Id: <20231013065552.4148468-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0035.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::14) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|SA0PR11MB4527:EE_
X-MS-Office365-Filtering-Correlation-Id: 0493dbff-bc57-442c-0704-08dbcbb976e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zGrY28Ij7W/PBPF8V+SjpuftoKvQJUg/hf5+BagN32WZxYJVakvXxyS5pVimFw2qp6wOTrs2iOoEqKCZ75Xhb77ap4eOyVHKv5LmooSMWpmJhZVyAO/fG2zX/jfGz0ZDQVaobYO49qbuygWHN4iuJ+utJAr0raVLAFnuMiWtz518jI45Hk5d1CuNeyLPC2G2Yjss6Ig9XNpVcReXXg/e2GoE7wPCc9cg+Cx/RFmlynwZQoGFg4z07MX0JrPUy+J7XJq8LRaxYjcbH7NADKvpBY7d4Cqr9nxM1pyuSZ4purr1doEkkViZGAioFpHaESTgKhKKIJJGRgCml08hsKSDvxNeBCAKg9cW4jGaKcsuv+43WyjyEZd9t4GdOWFUHblk0XDybxOdjXpvoGRTVj2x+27sJDy/b3VkpnPdcv1eXQQShcCfIQ69KEigExQRTrRmTWtNF1j5h4WIk49/obBeZhANEGNJ6DsHmHL6HF5RvfRvAkD99GmNPrnaEtcId4Q+HhAoMsmeoGf8QPO+PVxnYW8fwfwRgHcLyIXs4ThKoiUY5UffbzY5c8xmURHRTpBy0JFbkzAhw1CRzvTxrQ0fAUaid6WRg8JK6be0tqebsZ8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(376002)(39850400004)(136003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(26005)(6506007)(66556008)(44832011)(36756003)(316002)(83380400001)(66476007)(66946007)(6916009)(6512007)(2616005)(52116002)(38350700002)(38100700002)(86362001)(1076003)(6486002)(966005)(478600001)(6666004)(2906002)(5660300002)(8676002)(8936002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?j/AfNUcAsC6OmLrtBTR6w3cZu34skfd2VyBMi0Pt/Iwj+9iZL+Hveh2jyT/l?=
 =?us-ascii?Q?Nk01YwhY+z2buyTsM316VXZpVnu47dvvOQAr8kEuBpvONweg9RBiJIpD05tX?=
 =?us-ascii?Q?9MlkkntNcX4dsA1qKKVeFQgIC/BqyWCh03dpwidFNMjdGavIod5MQImLTCgE?=
 =?us-ascii?Q?yUTkScol18n0ngwJ0K8X6X6hI7FVbdsNby6/8awrXQ+HAWET4yhG0h6oQceB?=
 =?us-ascii?Q?AjD7yZjajKShWb5pYnpY4Gd12U5EDm4k/iNEdfNayjS3C1g0m39PZhp9NfzY?=
 =?us-ascii?Q?NB6TzcaAVZdQ9SJTrKuCD5jG94WPPgguR0M3kv07IluhTc49Qszet3tgPY5Q?=
 =?us-ascii?Q?g2wFb8BcHlYi6dXqcBuCehcEluwB+gA1qRaavbuQHKCQ8Rlh4r/XYK6Jk1hd?=
 =?us-ascii?Q?njesePdiCZg7aGe/79ODZBkSkYfLvmv9ylg3QTcUXfCue+KgVTOrfOSg/oWq?=
 =?us-ascii?Q?ES34xFOTqxj2esbPjyQL3/oC9IZTcMWIE4EwtLmZEdbyUp+dVt9SKJZx+qIW?=
 =?us-ascii?Q?U+J7OtK8A4EybJY7b9rUmJg7pWl25PpnoCQ2FixZqM1YNq7hf3akpSdQ1cR6?=
 =?us-ascii?Q?TVLYCz7O2PENvVoblDTf8t6mxvgVgeXTrnSBNULSKJduCIdesWkpEJvSGyqx?=
 =?us-ascii?Q?ERJqWXQaHPjstKbSg16e2Ei2VpCC7/x/p7JjA5k7uAKovrkxA46ENd7UX8ao?=
 =?us-ascii?Q?n3fVBRg1Cy/EFdw5xOzaV3xoivzpbvpZBi7Vu6AfYkqOXsywCVBVEjWOJOhn?=
 =?us-ascii?Q?WwMQOJ4UzpLJmc6bdOhqPnuA0T2jK8I45vs5r9l87kyxGKfJ8hBZO0fDm3Mq?=
 =?us-ascii?Q?2gHPAI/WippKe/NYIyRhVlt5ePE3mqATMUagq0GrZOSJZUQHNYeAzXaqxQkw?=
 =?us-ascii?Q?kJBY+SGE56uMbqq1aZ2NMnbEe7HuZHwsHU6zhxr7Pdx/ize01/YFA88l/NMb?=
 =?us-ascii?Q?HlYeOxg/jlmS4pzVGl6F674zQXolFy+osLYbiYCKDKHHKPjX8JYdDwk4Gg2l?=
 =?us-ascii?Q?Z1BNMDs5OHZeXg9Cf14m6dgU+GzPVy5QEoFIMa4TQG1BQ6u/l2K+1IMi4DaO?=
 =?us-ascii?Q?klwfCfhQqscD2rvPjwbRkUL2PwF6arVbEwxLG2BS9ekUYO/U6OxXlAi3LUua?=
 =?us-ascii?Q?lg4/VOWm2hWTHdD8tJ/Aw+B5MPFvr5WVnusQZu42/ygnpXAyiakzOTqApY86?=
 =?us-ascii?Q?1rVQdYo4EQIpStY8CHmr5u37m9Mh+4e30c0p3qAopP0EyWxjPs9jhJEzrj+F?=
 =?us-ascii?Q?oGArtD/ZFbGQ6130Eivn3DdRrSI35nEgR5RLVK6GIDEJwuIMr2N+iIvcX0aK?=
 =?us-ascii?Q?peACWOgFH6ZgsbU5XVpftPxul3DhlrZPFwIUtg4hPhc59/Ivacr6hXJo4CyW?=
 =?us-ascii?Q?u5ypdsxhQy3xsNfmWJMKgyShuMueTyIeB53KKAcEDIkEs0YJ8ERZ5zX7MT5s?=
 =?us-ascii?Q?dMtLPvHHs6EFQxwVPIHDsjvMoOrD+csISA8n+2b03KfSIKaYzcK4+sL8Rm7R?=
 =?us-ascii?Q?Weu+at6MuLZOChDzxQSdvE3k0PSfkjcSdgLrM48cBA6G8VZA2GPsPWLEIIF0?=
 =?us-ascii?Q?Q+lo4IFOeAjzf/E2Z9F7LoK3/O+aO44BOi8gqRCv?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0493dbff-bc57-442c-0704-08dbcbb976e5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 06:56:03.1938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hAf717yEet7M1bHaKl88s+Ka9+tgNbWFkU9O88fx4tdKcAjLv1KPfHlOJ8e/RlLJySCUCJQzTCmhbUo+XDT09Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4527
X-Proofpoint-ORIG-GUID: EWqisIEI8vSAl6xVJuYfc-GpTKeiT2Lr
X-Proofpoint-GUID: EWqisIEI8vSAl6xVJuYfc-GpTKeiT2Lr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-13_03,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 mlxlogscore=999 phishscore=0 mlxscore=0
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2309180000 definitions=main-2310130058
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 06:56:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105460

This release includes security fix for CVE-2023-43615.

Changelog:
https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-2.28.5

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../mbedtls/{mbedtls_2.28.4.bb => mbedtls_2.28.5.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.4.bb => mbedtls_2.28.5.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.4.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.5.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.4.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.5.bb
index 80ec8a5af..e74d39cf2 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.4.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.5.bb
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRCREV = "aeb97a18913a86f051afab11b2c92c6be0c2eb83"
+SRCREV = "47e8cc9db2e469d902b0e3093ae9e482c3d87188"
 SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=mbedtls-2.28 \
            file://run-ptest \
           "
-- 
2.25.1


