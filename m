Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5C9FC021A4
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 15:58:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.93604.1740412717561681856
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Feb 2025 07:58:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=41502d4960=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51O5jUal022380
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Feb 2025 15:58:36 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2041.outbound.protection.outlook.com [104.47.58.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44y5j8af0j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Feb 2025 15:58:36 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cMoElE3NyrP5KDQeRo8fToYCpFMj1Ks3iXlymI4y+HTfULvdMbylXjvqQddj++pddaLgwdqp0GyLYqgzqdsTxkaGXLIp0mAeZptFSkWxUOHrMGu91Zo3KuFRiQ6OPVfYVgiFpdnXvGoy7fHlTsapa8kO34lGaUbf6Fu04yBHX4z99zqnH5D/fiOIiUi5tzyk5ispU7BJMsYWCJejUB3ogm3Cb5jGt8JM19m0wjwjHd25nC2Z36mnLHJnMymAPKyk9XmK596QEvloAEDu8ms7Pyi8OW0KH0TIDTSOk3LzSzdMtQGXZhuA4tYLBJgslqH8AJaMoRTmtoQUHmdlk1g0sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57UbTGjUEyd2hKNPxO7SBF3MSObIDNBas0PkDxIkVrM=;
 b=m0YvZ442jT25H0XoeCRi4E9x5IUzGLUtuFPPkUtQhmCWcZBNFHLVT7dGWaF596gp9bqYc46OHI0GCCFlCwY5bwDyqjKZ8zY1i4a5O1GFINDtPpFaRRcqD88+idLkmhU/DZenzJEi5vvuYc4Sb2hIE9aUQoH5F0Nud5adBaflhv3Rn+NQlhpfEB3PfxqE/bPIhJFZDfGPOw9G8SMwcYAwrB7FGx7w8UwNFjWUP60AHP4QALa1e8yE+kzJcsEpv3XvIV1d5vLBnypy6iB2qTLZkhQLT+EL67zbEcuwSW2Qlw6eolMGDLKet5mVyT00bvz3cVImTK0NQc3oPgadfnx5AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH7PR11MB6929.namprd11.prod.outlook.com (2603:10b6:510:204::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.19; Mon, 24 Feb 2025 15:58:27 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 15:58:27 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] googletest: upgrade 1.15.2.bb -> 1.16.0
Date: Mon, 24 Feb 2025 23:58:13 +0800
Message-Id: <20250224155813.3704540-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0344.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::16) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH7PR11MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: ae9bbd3a-daf9-48f7-b4e6-08dd54ec1353
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?n4Ye3/5t45Ktpgb09QiUKxRZLTwmhd4v0YRQA4L08+yZJPVgc6B6AgLnwA+I?=
 =?us-ascii?Q?P/0CrXwfx7fisCuZTVKWbzCl6soQs/ttjxK+15nwzA6PHLAP9vnx39wdhec2?=
 =?us-ascii?Q?LkfWp293+0oUwR1QHgsUa6lU/4hyFeCpNU4oyeSnVOS4KCLfo0RqE8NH0vQp?=
 =?us-ascii?Q?Qh1dHx2UGISN8tXrfiikvshXmv53gpo//rojYcRWwP+ZIxs2xSOnozeettMi?=
 =?us-ascii?Q?5l2a2VVM68eGVmzn9hSHgJHRH+0FMF7M2Ctlx3iD7HEgyJat/jDl2XVsvtg2?=
 =?us-ascii?Q?oIx9ufPQCIqkUDjik89GFwOxx8oesPtPvdwYUFMIZZFSRuRwnMXgdZ6MdBM+?=
 =?us-ascii?Q?75MugU0dtuC4jf8oVnlYb/pEZju/rKlNlyoJ8a4RBOoC5nZtVlQkwy1KaBJ+?=
 =?us-ascii?Q?6sS0d8PtSbY84Z29yFROqhQ2LL5m0KILsFVrADiL59GefFtCkD3+4NgA/zVs?=
 =?us-ascii?Q?x7q5PNTBLhTfxpmj1si5NvUTGOUb2oPgzS7FfFL9QIKUeFJZU+H++Al+RV1O?=
 =?us-ascii?Q?EZYoc1vj26eH7Skmlz+xxF/lxaY5BSZna7/xXE2iiappMROznfosITfmzYnN?=
 =?us-ascii?Q?buGm3C01R8j8936KF00HSRDE6Gn54DeOScg5YpL+wmF/SkZhgqZbNH/TBjtI?=
 =?us-ascii?Q?ciDuyKZD3QFY+fiCpJs3fVwYUoNbV1keRuDkUzAGJf7b+w9SFUMr5Vv4iPN3?=
 =?us-ascii?Q?sA+Sqj9h6JPx2d0z4OI9oH6kTFvIhqwXe45F2IbnHPIbCFArAcDWrqtNIQ+d?=
 =?us-ascii?Q?w5vqJ+X3gRYQgRJPq3gcFTwfAzd5mt5WC+UYQO89g8/KF2XR9edHACLzoUcS?=
 =?us-ascii?Q?M6WqcbLX8IMkfaqGvP4fmmUqiuc8T348f9wMY6GS4IiAultphZjWVQ3RkpCc?=
 =?us-ascii?Q?215d7P608saxqcUmOI9bZFUVh5ru6qGUD5w+kqZfd27/NmG3QaXEgKIi8brn?=
 =?us-ascii?Q?ujrmS6TR1p/8/xJugoP2LhKRm5J4bejVbpLmKzv/Md4dYjmGRoHpLY15Yqyj?=
 =?us-ascii?Q?pI1oSwW957SvYZH8NTewrEr7yZss1u29Kh+wHNeruNxmUpk6IYGWPOr3J658?=
 =?us-ascii?Q?X4mbpinb4ydAjbw9d5j9CGq+nFODCFQ4q8B5YdpXZ2OQUkR02T8HhiM+x9UO?=
 =?us-ascii?Q?lC6wlUtR574oG5Zy5eZIPy/gF9oD9LT2agPTqWqm+sSLXOzQexZMbWkEv5jW?=
 =?us-ascii?Q?OQaCTilE7liFy1tQoA416V9H66IBV8ch5n7Z/9rvxVQFd/OQpGUbteOQPVnB?=
 =?us-ascii?Q?W3Yzr93jarKiXt773FcZeq+yF+11wgkGHOYBCXmuTxlE8/6IwHPyIM4uNAUl?=
 =?us-ascii?Q?wTGYn5rAkhjF3VQEY97KJKHJZy0mOQE9zlMUEZHmHMjsXKDfIasdoX9wAJUc?=
 =?us-ascii?Q?vE1xql2Yb1NWzk6UQZ7yiBODRFWGK5PH1TkkFIbtqOHAJANs3wJ0Xyc0wliY?=
 =?us-ascii?Q?nthnrbknRRkHupcNNEzyS9nnHb/Vxzdp?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?keN0pwKhVeBwPQJzvcC8uM8LSDcG++f/FpCfBlZmb6HKncT2XOU+f0cWDMty?=
 =?us-ascii?Q?c+JzSnr0hjm52GU/CkBMGgW4BE7YkgWdxBWNnL+zlmvY/0Po7/K3Po4Z6pt7?=
 =?us-ascii?Q?2fRbHMpbMLvhUrH55/d9UMUz1JhGWtOV0YTi6soeiEsjQzgnpRWGRzEHiglJ?=
 =?us-ascii?Q?qEDDBmdmrxuMqsNpVjzx8I0MEXz6iE4VTsfEy9JNykHKdxBd3k4cxuNCXFN4?=
 =?us-ascii?Q?NXC37NaUZodFCaD+CRJ8FoNGsCkgBk9iQl+zeJF2XCO5kxWIkD+6lhlZDtl1?=
 =?us-ascii?Q?4UeDeX0xDxHymKYFEn7XbJRIhIiREpVgckG+EW/faxgC5L8iKBZdTAVtPihY?=
 =?us-ascii?Q?seLMNGPiDj+wL07c5nnQkBs+EvHX32gPxM089hbW3AhBz/O6gZaIpzAu6iCH?=
 =?us-ascii?Q?+Bd+doa4fagm0oKa2OA3KTuCeUi4S3bJNvOl0dip2KgxWBX8Ju47t+MDW8Ps?=
 =?us-ascii?Q?ebjr+em7qKrdr9DZpCzegNV8YWkdquTAOsoUZXCTj3G/LEWwDDqgURQ4fQGr?=
 =?us-ascii?Q?4VkYlzJXM/gl85eV6//05SHY/dDjurIvb+WJjXHpKYuwIAkytsL++XxbkbzC?=
 =?us-ascii?Q?cG8hKsi8A4Bm4ekLJCNUxi/vGRs2+NCc0/FCYRfS6JfsbHgIW8ebKK/nXmV7?=
 =?us-ascii?Q?2ZIEGeOyYuh+RFiXHFfegZVQ8comy/gt16dC+1nNkhgta+B6YdEXoS/FZYxr?=
 =?us-ascii?Q?794ramn6/ZrKgqKqvbPWzYjOShMq23yE8Z47Sdxq48p2yCneMF9ugAhBYbnb?=
 =?us-ascii?Q?lTl2aFCRYogT+5YIOl8OWLbou8EnOouPjZpozezD5Vwthqgi1pGMKPw53aX3?=
 =?us-ascii?Q?tyXhlPmSrfBiSRkgbVbZ+mDhR1Hu+qj3jtARWmhmEr99nmOzAKpP2pJ66XxJ?=
 =?us-ascii?Q?mszBFM2n7a8We65S63wbAXKhuy8cAidpzJH4A/LQSQE4L6pm3/mcLnKdBkws?=
 =?us-ascii?Q?My3SSiB4xPaODtwNNL8ShSXQBkG93iKRWzxmpSkKQsLa4y8d6bEoFUHcqgUY?=
 =?us-ascii?Q?Y3mz/3pYrrCo+eyAXE9aVBlcSlhN8fqqFwlCfhC1NMNEp4TbakyAA7pEm0Q2?=
 =?us-ascii?Q?FP+FXSOpMkSAcOGwgMPFYTCtQZoOgqDt6DJQ+Elexkr6ihmCTHzDe82GCXpN?=
 =?us-ascii?Q?Sz2ySd7sdEZ74p7NYwDpe+C/AgvkSsZrMdtVXMNCGtyWo9RtwpXQEsZHjoBD?=
 =?us-ascii?Q?+LX6se7b1/BHPC4cucphvijnH8zTl+oE30CZavhFzAlVYBydNVmtzvCePaof?=
 =?us-ascii?Q?bX7DxoB1nlrh9LJ1NT1KdSjGq1rqjCABIdjej9z5zeu+R+srvvH6LvLLn8y+?=
 =?us-ascii?Q?+8H3abhDCym/8ZBKlncabUirpWxjsykw4AZfaqVyzwtXwYMwULiNr3BzZ8Wy?=
 =?us-ascii?Q?QCPbosbU+G0OPTUcS79Fw03M8/IUaG54WDgmQEl8T5yzF9Rleo3ORSbl+ytx?=
 =?us-ascii?Q?+11Ww1Qvh9w+QagLnKLBWbsRzZwjggkLVeG46fAyqJ14dR6ar9ajp2zrrTZa?=
 =?us-ascii?Q?67uVIw9r/AFnDQhYVukQxd8f8XWcprCx8yUSkTtd1KJJ61Z3Ikh/ZBBe4DWA?=
 =?us-ascii?Q?m84ayfGiErnm5eTWarqflANL/zN0xw14/r2ePtun?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae9bbd3a-daf9-48f7-b4e6-08dd54ec1353
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 15:58:27.2672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 60BoCjO/AMRUfcWkla71fSwk8BmD8g5iS2VXdo7Uy5gGek1cmP8ZYMoZzlHTVyAmU/EegifFbxSP9IOHJ8FZhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6929
X-Proofpoint-ORIG-GUID: MZ3xdxBNm4-oSubuEi81ieUAGK4yBFeF
X-Proofpoint-GUID: MZ3xdxBNm4-oSubuEi81ieUAGK4yBFeF
X-Authority-Analysis: v=2.4 cv=U+ZoDfru c=1 sm=1 tr=0 ts=67bc972c cx=c_pps a=OnljjeCONrlUuPUItWmgXA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=8Fy0S5_bWddDYnw-bAgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_08,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502240112
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Feb 2025 15:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115551

Release Notes
https://github.com/google/googletest/releases/tag/v1.16.0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../googletest/{googletest_1.15.2.bb => googletest_1.16.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-test/googletest/{googletest_1.15.2.bb => googletest_1.16.0.bb} (91%)

diff --git a/meta-oe/recipes-test/googletest/googletest_1.15.2.bb b/meta-oe/recipes-test/googletest/googletest_1.16.0.bb
similarity index 91%
rename from meta-oe/recipes-test/googletest/googletest_1.15.2.bb
rename to meta-oe/recipes-test/googletest/googletest_1.16.0.bb
index bc479268ba..cc2e8e3c94 100644
--- a/meta-oe/recipes-test/googletest/googletest_1.15.2.bb
+++ b/meta-oe/recipes-test/googletest/googletest_1.16.0.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cbbd27594afd089daa160d3a16dd515a"
 PROVIDES += "gmock gtest"
 
 S = "${WORKDIR}/git"
-SRCREV = "b514bdc898e2951020cbdca1304b75f5950d1f59"
-SRC_URI = "git://github.com/google/googletest.git;branch=v1.15.x;protocol=https"
+SRCREV = "6910c9d9165801d8827d628cb72eb7ea9dd538c5"
+SRC_URI = "git://github.com/google/googletest.git;branch=v1.16.x;protocol=https"
 
 inherit cmake pkgconfig
 
-- 
2.25.1


