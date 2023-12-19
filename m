Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA693C35274
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 03:36:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4694.1702956988844992015
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 19:36:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=071779f400=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BJ3KBOh017277
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 19:36:28 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v1824jgx6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 19:36:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SWOnjvJwbemgfa/VCOS/DO31a9Y4MayhyMM7O46QgkeUKFq8lLZOAL2GMpCVWBCv/l2HXTYdwPkpO7AL1dFwUxJktewu4s4Lb2h+lQ7pLpLAboO1KG8sGersBTozbafuGDuWGyUz0LlUYyqL/l7ByVywuFeRRrZ05XRWxBZnLlGiJjFKSCqnkQ4zFLlt6MFmA3Q85yOGvd6g+TBNKoebCRrM5Jm43tQsrd1ZSKozQjYvwHYAgODfC1lvQYSdMYfP1KuegQOehGSCh+VyfjIQNDSTy2owWzp28VzeGg0JbqKeC5hgdiH15SQHZq9q2VstKWTf5hHaVyxG0TTGdkmb4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMUp8sIpkLHjomfrYrKpSJPuAwDGH3nPwL/RzHsKAdA=;
 b=Kz7BUgXZWqZbG/zz1w9RvP/FPbs2dtGmWoBfiL1dQa1fXiucX+mQLsp0PeOnqfAAdjIjl5MRx7lRKPZY6a0OJKzVmgTvOa9OLo4wfd8cMOCZkz+rz+OUapMvo3At/GHxYDTNaE029qyoxrJzsT1Zo/OJJbtAnie7wE12rCIDgoyi3odkCRMFcmFkMW+15ZrcXcSk2UxFX3NSiAdRlx7Y2n0b3iZn7x3zo/zqL08jGtX4R2ql47SEzxOWQqGG7ELU8GdFP1b3OSD9N+gQwYAEu7VV5wfh9HciTGx8NluT0a5ay2rQOB0gQJ6nZLONj9cmHaiYQQzj5Inim/Ez4xFd0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by MN0PR11MB6112.namprd11.prod.outlook.com (2603:10b6:208:3cc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 03:36:24 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd%4]) with mapi id 15.20.7091.034; Tue, 19 Dec 2023
 03:36:24 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] layer.conf: add libbpf to NON_MULTILIB_RECIPES
Date: Tue, 19 Dec 2023 11:36:11 +0800
Message-Id: <20231219033611.697251-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|MN0PR11MB6112:EE_
X-MS-Office365-Filtering-Correlation-Id: 78b49970-bd66-4200-fbcb-08dc0043acce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	J1ax/GCUeF1gXfy0weQvIh3q0iE4XiZE8GQ5UyxINMgfVe88o2FNLSGCza4Gml8jz218GsBpuyjCKk+gwCs8e4ghoqHfQGd7LF+L94mt4epUYSJ81hI3c0z2wzdMowilzQ597EU+5Dg3abxxPeC9rVGSVnZzlxl0h+QIH+wEmqCQrerac7gkVe9XNCsrzHKxVSD5PcKGb7TLin0/i7IoUHoqM5MdT7fBdSNx5UKajo1Ts/GXaUgZmgJy9DHSmULKMfnpNBItRFNHeTK6KTAtQg5PdwErI+hHroj6oXieBFKrrfnAqctGG0E31bXk7aA3v3N423md2M0ZLT3hlT56Aa7zXuP9gzxkkNLYxLuL1wQgWGCuc+k1vX8gazaUzWxpXueIw8/vS1kdoh8s/GMUYGsNCXuWOFp69LmlH9zb12Dta/1FKtI3k8U0NiAThpmbADRM0mLI+O0UFc5z7oEbuMXDSDFFlvRIgTpY16Ujfy0DUCrlYGJgien1N7uWSJXh/yuoavu6LmabDa49SOkKAuJoan70ftcrxHJj1BOI8E91YAPvpVBh/wcif3D5WOljtvhw0mgzdfUts/2il3GO7Lx2pRwMrpLNkuc/rLLvJUk5IwEZ8C9llwB3yUcRdteO
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(376002)(39850400004)(396003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(26005)(1076003)(2616005)(52116002)(6506007)(6512007)(6666004)(83380400001)(5660300002)(2906002)(4744005)(8676002)(8936002)(41300700001)(478600001)(6486002)(44832011)(66476007)(66556008)(66946007)(316002)(6916009)(38100700002)(83170400001)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AL4VjjwGRumnkDhiw+D8XGFZ6sXDmnNvB4eTRIYzK6W0XeF20/E/JcEwcoCs?=
 =?us-ascii?Q?smFGs3Z4Vh5f0eODHn8K/V43si9NuH56DulbyxUHDzJ0YczhJoO5VVfPxrKc?=
 =?us-ascii?Q?3huOz1T3n/ymJZqph90dZmBdz/f3J3l1YozsRnZcE7Kr/na31y1ix8EJBhTc?=
 =?us-ascii?Q?yI4APK+G+EzjohcyEGE59/uJrb8PLxWnbK2bFHFyj2wpR23DDfn0oKLTeKYz?=
 =?us-ascii?Q?QGTqKrMmhQTf82vTlxX/tdZkbfIQJEpVP8W0BTIQ8e7Y1KV6oNsMVDT5dTda?=
 =?us-ascii?Q?MJUgwnq9ybT6jW5ztB6c4eUzlJi42oYzB80vk+cGqNimdit4fo4Ja3rrh75n?=
 =?us-ascii?Q?hutt1WYK1VN9x7MlAvUgNAmZvQ2W7mvjOTQyX2L05GxOjPpDw6Upx/HInhAY?=
 =?us-ascii?Q?HevTf9RZroVrTkNFD0nKCwQP1VznImJfqiVHqx+V/QdF1Zmfp285iWpeteOM?=
 =?us-ascii?Q?/Bh1hSlS5Ww3KlM/vbbvxSHiQNzFQBNcXJm+xei1AjrVrbvyRS4IqfKEPPv9?=
 =?us-ascii?Q?szerOlJOgzCQXslsHa000cmsQ3YbRDXZhS/Rj7y+5Z05dAAPKMXm2jwBy7t2?=
 =?us-ascii?Q?TNLiD3SGEfi5krDu2dVI5UlaNbRpllaYTct/xYQEIf/DemAgXsYBaJAHxXtF?=
 =?us-ascii?Q?qMVnouTFGhHnPj5p8zYYn/y0I4o2GBHDB73Aq8OZRvR3czwfNQEqpNtyHbc3?=
 =?us-ascii?Q?isWfA+sLTLQIE1EpWvfIbWt7ZWE+Jd3M+1AOd/H4sxmG96xjVd/mbYGAX5L4?=
 =?us-ascii?Q?gsawXcNBRLdumTyOAz3ybQrMvjzZuFUQO4ybHfv/aFyFmN/xa49qCzScEM0o?=
 =?us-ascii?Q?xW866++hEPPkfRQMXOedeKxrP6QuU1uCLhE/z44GtFpas2CVG06tkLUyLH5t?=
 =?us-ascii?Q?msmqEPrCnno+fn6ZVf1g6srz+63d//BcTVWJ56cLJ/J+2QWd+oi/tbAhGlos?=
 =?us-ascii?Q?Y34ktp0/emuBGHC8+rRPVIW0ApruIznIpNyRvxARVxXENltdthSqzNKXWgUD?=
 =?us-ascii?Q?QAbH8H+yilP1zboUfPivc803HoTXFfgH7Ne045zzjsQ/JfQSpWUakTKKTNcP?=
 =?us-ascii?Q?URMhdR6iLRQEsB5zhP4gqSBlflTxcRzMHgozWKtWQICpqx8XnXr1+p1boFj9?=
 =?us-ascii?Q?h1BIi+LKwttNMuXpmvi+BxLf5e7OcWphV7ozelWNJdd6FiFhYK7hoIWQHV9q?=
 =?us-ascii?Q?Oc606ZcnspqVKhYRUJgzl1h3H4tLfve/3TSUSFE3I4LhY1SC0cMm5El88cAm?=
 =?us-ascii?Q?reJeknmqAHWP3t+vCF2y0GbwsoHroq47f5aUGyvBAOfizUHaUa/sNOpDIt50?=
 =?us-ascii?Q?tBuRZmD3o4viEJMbqMrAYGsSy/QSnOGQRZ3nxDq3ZoxL7td7DCepB3HChVTM?=
 =?us-ascii?Q?NOvYFvDMlB1pXvbnaegEA8+oXkOTXPlvKj+yfYpilcCBzNI6OC0rmcO72JAp?=
 =?us-ascii?Q?cWMyfxyJKX2XuzBZxdslPWgsimDDrr65Arc7VTLtcRoGSpcC2CUHeCeprKat?=
 =?us-ascii?Q?4/cEvsfghMhrqEZY9U0DZxJ181PHwIaS6N4+jjnn/mg6lwzrr2WpMOAfXq6a?=
 =?us-ascii?Q?8xlbGnbSbHLRJzySJ82/E1wkk9RlOHWjqPPz69BzEwSqHfs+cufKSHhF8mx3?=
 =?us-ascii?Q?Ig=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78b49970-bd66-4200-fbcb-08dc0043acce
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 03:36:24.4737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8CKpjVHTSyykGKvMvupIgIOwUkhS+P05RQGzyJa+uHAp5PLZiHwiPbqnP6p8Nj+lm/T4KjvEBye4nHgwOcV2D138pz1d2/pafukCaPAYTXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6112
X-Proofpoint-ORIG-GUID: noLu_H7xE2BNHxiYdHWUn4hRLFMM3qYR
X-Proofpoint-GUID: noLu_H7xE2BNHxiYdHWUn4hRLFMM3qYR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=710 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312190025
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 03:36:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107552

From: Xiangyu Chen <xiangyu.chen@windriver.com>

libbpf need line up with kernel architecture type,
so add it to NON_MULTILIB_RECIPES.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta-oe/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index b0e48dea7..4c63f1b39 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -112,4 +112,4 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
 
 DEFAULT_TEST_SUITES:pn-meta-oe-ptest-image = " ${PTESTTESTSUITE}"
 
-NON_MULTILIB_RECIPES:append = " crash pahole"
+NON_MULTILIB_RECIPES:append = " crash pahole libbpf"
-- 
2.34.1


