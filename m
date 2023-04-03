Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1599C76196
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 09:10:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.65552.1680513028618360400
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 02:10:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=b8pyyoL2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3457c3350c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3338gLWX026568
	for <openembedded-devel@lists.openembedded.org>; Mon, 3 Apr 2023 09:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=bJy8tnjFO68mepfizA5wcS4+DOyBmRymY3/ofXVFqEQ=;
 b=b8pyyoL2/cY9yEvBQF+RFHbdlLRau+T/hr7MSIEE5O4RI/v5Dj4kFt9NkvkF+XLr37Nr
 U4I8beTxO8D+/zlyAt7+23NAzeSykbPaV3vYIeYtANOrWh6hG4nwJRGOvfVf7fXpL7Ty
 VSeO6kcKYBMxNpKefe5qqu8h6iH5k6mBG7lTYVUBe6TT7vLUJ+28coz+e3TbnawL+g/R
 6LtxQRZz0QNPX50i2SXd76B4Byxq86n043ZvAD75EESgMywQLVXPAP40SybPCmdpjXfS
 tgdW55jPB5oTgzGk01H3QfZdVkcaO3v6FFzPDHilt5Yu4f5qQIBhBPVY8ZkLok1O1VNw KA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ppbkbhs2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 09:10:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVQz50EY/dqrQx5zAG6U5IiFu1TKhz0HPleIPyVjVt6YKJIIwyqCUH0ARh+XS16JU39gRB9Uxfl7BZJ5SCvQXvZyMTvfTh9a5+mC/t2xS44hdeGplhyFuICAg5DCTwJVB0TUGo6cejfTBqgh2bQjDRTHBJbFY5AP4eN7RhZGNf7SSxx2LRMFLQJDlc4Ywnr6dTIkOHQq7PGbzHJvZzZQCMSsOHMDSius3KSzh89opYQ+L6DgDkQ6GFQQOgZIZtAF+J/xNmLH6WsMupzOSnsPcGrI7fCN+7QdMYXB79AuJ/Ak9vPZyZMqA9oac19xy9uWkK/aRmGlKipNrEWRbSvCaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJy8tnjFO68mepfizA5wcS4+DOyBmRymY3/ofXVFqEQ=;
 b=Og17d5K9M3QWxS30QLC7Z+O63dLH+rMuv6Rul68sGasanprXCfZxcVmergkE0/sWkrOpiCzesG24rmZWwlXwaduD6KNUIBZFEcKOnOF2KvwaL+svY0o0x6rIXO+6Dc7yFSJA4nZb8DE0OH6EV+Sk4EPKn/SeVzq/QouuLZew9MOnVdxTFb7eoVX/SVR0tGxGyrqRqWXmfz15rIZ2udlcSbPKSMPw3SforhoMG/tlKGOFq/T6UHoppCFOuAr7yFva42O0k6dUvbdMg0m5zDulPtx9qUOq18FmNAOzKwD5z4uW/Ase7fl7TNjwn+CcSl2lKgfjEhDiK2Om6BRATk7C9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by PH0PR11MB7493.namprd11.prod.outlook.com (2603:10b6:510:284::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 09:10:25 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::cfb0:1a8d:38fc:7ef8]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::cfb0:1a8d:38fc:7ef8%8]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 09:10:25 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] libldb: upgrade 2.7.1 -> 2.7.2
Date: Mon,  3 Apr 2023 17:10:10 +0800
Message-Id: <20230403091011.530326-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0047.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::16)
 To CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|PH0PR11MB7493:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a030b4a-7f26-4bce-644c-08db34234295
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	79CeCrzsJdKXnjYTS7T5+WJ9g4MRnb6a9WYFaeyBhMMaCh93rcuqrXEFTU/tvHEd9M3JsFDYxGbZspxB3kdmSQDiP5wxwJuAk3mof9TOjFdPKl0itUHeHo6BIOHNUzPZ9rHMVdXRT1+6QUGGzF+WBgZvo8BRK4xoi3E3w/AL4rhg1k08pa9VJUgCKK+60dhvGK2mcIrB/riv5y7t1TTbzpsm4VBlZn/CRCpBTSjpXSbyIKCnSZj5RXF1l3daJez/flMWZGxUBIrZjYz43bWSURl7gKSjylQ551u/8JM/qwRPz68+TcRJ8m+kltQiha9D3pdFPVUpuauevMkprpQCQX9ZtxGQKhItLhR+DghE6XVjXLbR4JQ7Ffeq6suiJ4Nz9HWjtAyq3ZJpxq0SitIpjX8utENMTJae0MT0tbP/QrooL5C6nEtHiPxdOL1DZLRH0c8oOeHmJRCwQHdIKGVxYqgEar7cTfChG6rvnZt2RP82cHkrXHkPAO4Co2on4pBFYr/BjVrRkJAOwA4u9J9FR2uvVo4WxVQJPpS8oh3h/lfcJju/PVFaHB5UqXgm2PxJjUzEYt0T+GuWRhm99wMC8bZ6BTrr+98VNMxbZBa9MIVcZ9XffZc54+jsBd5SHkXl
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(366004)(39840400004)(396003)(376002)(451199021)(6916009)(8676002)(66946007)(66556008)(66476007)(478600001)(316002)(8936002)(5660300002)(41300700001)(38100700002)(38350700002)(44832011)(186003)(83380400001)(2616005)(52116002)(6486002)(6666004)(6512007)(6506007)(1076003)(26005)(86362001)(36756003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?n0xEcTC6sXdbVyur4PX+kXEcL83ew9tl0OnJr+yT+wWjDg99PmXvi1JeFAPM?=
 =?us-ascii?Q?l2NEpkoeV/6+L6B2c4+6QEFr+EgDqu6lHP3G3bn78gpZ0sAhxTiJz4ZL0Jqy?=
 =?us-ascii?Q?yDBrOiCeWFKH4B0IUmn1xyo5fKaGKa4IvyyXnldLgVk4gjo+ubrqI7bIDPPe?=
 =?us-ascii?Q?Yk+XNMR6QWSAD75iBj7avJhaGqOHIF1gQSd0YSd3ipFAoUjWRmmFJj6TYh8/?=
 =?us-ascii?Q?JiyuKgwWJ3CM/87T2Epft6U/llzr54+Yi3VTdRTRduiqsIxvWVvyF3DT4ev7?=
 =?us-ascii?Q?vuTffNSKDfBHCS0taA8lmu42IjJCtjEAAb73h9vlolz6iHLgtzRZWmlHF9cx?=
 =?us-ascii?Q?47gDX9bV9HqwO/Wt+2wsCfyOj1Ynq8eTXjpeT/AiOro+6ITEKvIy0ifjCKzf?=
 =?us-ascii?Q?XP0TLasbc/byHYJyeNFSGtLl33vXNcH8ANp6+FSke2nOxGnf08kocaJDESOS?=
 =?us-ascii?Q?QAogarJ6Fjd20z7UwbOdtPQ8Ojq8YhS47zmeOw87AiO3BwYnL/Frd0DZNB2H?=
 =?us-ascii?Q?QD543BbO/HIzrZsx5KRnCah8sn1Dt/wFB4u0eNebuq0Y9hv4LfAxvuj4k/RZ?=
 =?us-ascii?Q?sBowMlbSTcnMyv2bo8cBTZcXreNJS8pw5QDN6uQymbR6ngaBv6N87EA+mryI?=
 =?us-ascii?Q?19MhWd5DwEpnGURwlzyri2yv2CDOXKuSPTQ6APghXxXFkhhixAzO4FuP3MuI?=
 =?us-ascii?Q?lP6zBrYvszqewazTbKfut6hhv2i+iLrHTfvstxpnLCZV4yZdsDH8Yjbrqwvr?=
 =?us-ascii?Q?YKde6MS/uViO8qvJIjCG//awS3BYda/rreujRnhGd/dBlccZ9W2zndx3daWT?=
 =?us-ascii?Q?vVMWWlSl4PQ71dHc7vvfKrxZEZR68jOXazbul+EYiNfAl5Gdnl6ZcZjf+6LD?=
 =?us-ascii?Q?u9vTzblUutme+Id3lbZWw7a1OKLavgXwEohF3T8bAzNhDoaFV+htWXca1Fnf?=
 =?us-ascii?Q?sJdaE9pGB0a7uUOnmVpBiC0n1xZdbfEUJzIgHlNuDPqmkBSaIeDhe/QcnnDc?=
 =?us-ascii?Q?PVtzVMy/KIly3sl9bjUTCon830Wr/GjzLC+2RckwU2WUi4w6tPL7Gu8DEoX8?=
 =?us-ascii?Q?DY6I1gFOdBn/PyCy4huvR59O+JMz2pCleXl/JVCgUa0mw9y2lnitiUf1OnQh?=
 =?us-ascii?Q?3Id/vzMXIHvG62gVBXJ886TPzv/YnJ5FqWNJFKMsqvGf9H0nDM2Yrb6BIYn0?=
 =?us-ascii?Q?d1PME0Z3S55vuOUxwrVgD187ay6RDrkykLLQtdc3rj2+TVBf7uAasgqtW6Q3?=
 =?us-ascii?Q?NMBtkhduT444g9bEWAbQhYZRf42pUKzkDNZWBFTkw1J+SiZXQUge4+dTqmv9?=
 =?us-ascii?Q?ubxvUAdL9ijU/KWGjvGML+1I8bz7YxcNfp3PNE6xW+X8MVO0LkERyOKFej9l?=
 =?us-ascii?Q?Txp+EOAt2AhRWdrBFK0Z+KOhC8e42ie+7XUEuUQImlim+Cpg6k7EBKqZk5EL?=
 =?us-ascii?Q?Xo+8xq/u1F3E3m3FSxCTFSdlTHuMrwoGwjl3nyU3feY/k62tLOOsyLmGuaVX?=
 =?us-ascii?Q?xhWQlIJL0Ynz3aUTMMDzCMXfjo5+YWW3q3Qvt2SvGCU83teowudDqM7GK4Tr?=
 =?us-ascii?Q?/u2uoX8t8Wf8hzEhn5LonGnMpJs1d17kk4O6OH02?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a030b4a-7f26-4bce-644c-08db34234295
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 09:10:25.1826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: siGWJrLXfEL9KT933YH+wkEr/vjiQ8C2LmTPWoXy5/5hS/GQiLQZbCYmcWdScOjsP32LJIOhqXMZIEp2gPgKVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7493
X-Proofpoint-GUID: ONVHeyKt3AQ4I-0j3HhMt-Aovc_0eb9v
X-Proofpoint-ORIG-GUID: ONVHeyKt3AQ4I-0j3HhMt-Aovc_0eb9v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_06,2023-03-31_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=832 phishscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304030070
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 09:10:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101907

Required by samba 4.18.1

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libldb/{libldb_2.7.1.bb => libldb_2.7.2.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libldb/{libldb_2.7.1.bb => libldb_2.7.2.bb} (95%)

diff --git a/meta-networking/recipes-support/libldb/libldb_2.7.1.bb b/meta-networking/recipes-support/libldb/libldb_2.7.2.bb
similarity index 95%
rename from meta-networking/recipes-support/libldb/libldb_2.7.1.bb
rename to meta-networking/recipes-support/libldb/libldb_2.7.2.bb
index d13bd37cc..1ca50a08e 100644
--- a/meta-networking/recipes-support/libldb/libldb_2.7.1.bb
+++ b/meta-networking/recipes-support/libldb/libldb_2.7.2.bb
@@ -35,8 +35,8 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
                     file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
                     file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
 
-SRC_URI[md5sum] = "e443a8da17758479c3b5c542e8e3ff1a"
-SRC_URI[sha256sum] = "c4632c9a7f81f8a45ed46fc14d18eb507edf4e79f6e88d16977478ef95ed5b7f"
+SRC_URI[md5sum] = "f414017ebb286eb939c4afddb8429540"
+SRC_URI[sha256sum] = "26ee72d647854e662d99643eb2b2d341655abf31f4990838d6650fb5cf9209c8"
 
 inherit pkgconfig waf-samba
 
-- 
2.25.1


