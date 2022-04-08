Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CB5BC41535
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:09:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.1819.1649388772980022994
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Apr 2022 20:32:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=rO1dTOgB;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=10974aa226=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2383WqEO000961
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 7 Apr 2022 20:32:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=+pulGz80aHNr2t45dVB96hrzPz1nZuXBM4hvpvdJvBA=;
 b=rO1dTOgBxy2jwq9j1j/GSuR8yo8ddzpZp4hEyQp0z9Cfb7ZPPQzQSX96UDxcXJNemO4P
 mHvW6+Tg9BkF0VCBQlqSdUjlXOMcCw4Uw1N05LhRpIC+FLR4OTUC3Vf9T469XVU8vGaM
 o59wZObVaRbXePl6kQx4ee8W61txkBvmsUrawDEum7k62lAv8SCv7oAdck//WKub/kaM
 bT5C9QsxmjKjNbZQEFPXHmX1c0s26azSGUw+8z0w7XlwM1Tcy6SYf5RQYXVNh5RTdaVY
 XnvFpvh/M8polN8kXPWMYuGZwclqhKMj30AdsfqCWa9svKJITdso5eKM/HT6WPHTYzwu Bw==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f6p0jck12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Apr 2022 20:32:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RSyBZqJ/9l2cnKg+aZRs811ox1j2ZUWhSWegdnG/YdcuyCXjQYvpcconvw75yotuel8smtdK+k3E6vc+RZ6QU39aNz8+/iAWRaEi/qAMcbIg7InAPa5bVPKPPLFTU9651q7yTyAVGjfg8jDxarqpBAKf1vWvTiWOTBzSATcLD3R1r5wUpV3Mqb7eYnkVFvzgdKyBu8hyBtgONC6ZVr64nzN7ICw/mMcv2c19sRZlNb/qKMm/z8PTbz4vSjzbphZruBh1t8ZzvHRcrKrM/mgrnME6f/EMoDYzA35S29OKN4hLHpSDi5QynBOP/nYeZdVJfjTNcH8nOOdIidRlDPEudw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+pulGz80aHNr2t45dVB96hrzPz1nZuXBM4hvpvdJvBA=;
 b=ge5CqlKkcFlUxNctb5BYJ2Ct1P9pwHP+24amAmWFr5/lXx7jTctQNY+LL41v6VogKDLtissvwfdG1uy0UiOFgVlxyR92j7kUVvW/acMGiuIpE0ACMrJoIXe89u6O1CYOEIxyGptNW+628DFXTR3x1dxhqCCOtYe3Ny5eGD2yF3atOoT3c8HxmpLF/myUr8BjTGuXA7w5bvY9KKS5mW5PHpPtXRajz/FrNYWEWXlxYilV61qwb3nLRJlHfJ7qn08SP1KFq63tMPeALJ6OfW6MBJYQ/0kgy+8/kNiDawIiVzzu2nvl9eB2F89rI+pZKY/v4k+5fy3IM1snBBwwjDtL4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1597.namprd11.prod.outlook.com (2603:10b6:301:d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 03:32:48 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1962:6577:b409:494c]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1962:6577:b409:494c%7]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 03:32:48 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libyang: do not inherit binconfig-disabled
Date: Fri,  8 Apr 2022 11:32:37 +0800
Message-Id: <20220408033237.1561727-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR0302CA0014.apcprd03.prod.outlook.com
 (2603:1096:202::24) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ccbeddbe-5af0-45bb-ce5f-08da191073b3
X-MS-TrafficTypeDiagnostic: MWHPR11MB1597:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB15975B5D1909E293722AFBC8F9E99@MWHPR11MB1597.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IHsX9ZTvKfHaclTxYKBXBAwo4uIrTCPbwmMn5VCuNOjlr/7NdnSqzrc9Rpe7pSOVXyjS8JYcjaAi5/3fwTf0LlGX2gxgPsnk6vfoMjQeH2gvroHd8QZXdHvtp8+ubjrf7awvfzleBbc/Gjja/+HNtunzvl+6hJjPDRQRUeb/icG2sKCOZqTbk05sDaCPU9vXY6FvFh8/rfS3ujjeBi1Nk+OGyNjZAa1l56JujzzzvN9b+zRgLT7AsUi9OaVWVWfLIQmCJaLCq7QAZ63XK1XIhVRT2O//xbc6ou3Ziwrd7bvVUg/46oiy794Hj1K7fQWzio5KrioC3lR/hEcMrHhDBWSprDqrGVtDm02q5TVyUaFdGsH4XPl/ifZ+dLc2E2RDSqbl0RLYbAJN9bTngdwoEMtc+Janfh/KMC0RHnd29FXcOHdEWCY1E1/0nmUHRS8t+FTRlNfHe49tlNQDexeIoXthFG3sIbOV5O5Hq6Wra1wPsNP+aBP0+rnweTFDmMLZ/Rx1xEKFhcYD3lutgwgNSBdFdylE6N+JlRy7npK7BzGfjCEg3vb71jqWGanG5kzru3F0b8SJYJ/LAfFoP3/L1oaYbnzGnuRUgvFcCB2yJhHTfZWU+oEocgi0Yx8LaAxSKjbREPuEckB393Se0G74fKcB6rQatxPbkChmTHDeNJpRQUXfj+w9zVQ8UiZCW5J3Rz4PRsv6iQ2Lh0WSdidXGQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(1076003)(38100700002)(38350700002)(52116002)(6512007)(6506007)(26005)(6486002)(2906002)(6666004)(86362001)(36756003)(508600001)(44832011)(8936002)(2616005)(4744005)(5660300002)(83380400001)(186003)(316002)(66556008)(66946007)(8676002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PzEXHxjNJNNE/+z05i9Yg/ZP8Fpw3PyBaym9Gup3r8+8eCKDi7azfJdp/1OA?=
 =?us-ascii?Q?rEZRIzZTT27LCRrXJonhGycXX1aighOJ9uiXwIthIFIFne0yon+Vyw1PktDC?=
 =?us-ascii?Q?RbmNEVB7zKfdtU/W8HO/7kLCygrFnbYmcbiUiYaJKPvJ2OMuKDTH1DPFhJV2?=
 =?us-ascii?Q?SarZ8QIoOp66eNdoytKhV5frvo5zOmd/Bj6p9S28iXzjlFG1yV2SEm1CEqWf?=
 =?us-ascii?Q?6AFJQvGv+av0gg2I2m3B0UZWEik6rzffJIalolu/gIaMiugsxzPdZHz9sT5a?=
 =?us-ascii?Q?P7AS8tnXschO8yo7X2YV5epXMthiX/EezfBY8Ao/fl2XB7KFOaysPR/Ixm07?=
 =?us-ascii?Q?zDL00Co0ArbY0Dg4T25+InI7k2M5IjJt89bBrOtEfcgDD1+d/oKs6WCO07kQ?=
 =?us-ascii?Q?tvhBiGrGC56cHBL9vLLMrTp07zgS66i8yXgzAaS5RrrOSBUH7swhlHOpWXGd?=
 =?us-ascii?Q?QpIr5Szd9B/q7t1/xreDRjB3eF3IO+fri9b2BJX3Jpcf+a/XsKqrt5T+iA7m?=
 =?us-ascii?Q?w4CYa77TFi5GfpQzBFCZ2rq3qWY1tFysPihohYGg3oJh1VzvBAewuEbmla5j?=
 =?us-ascii?Q?5JV44G1z3E1pUCJWmUVKKbGdNLOy5H/2JiO2cIH3PgJ4A6wj57hxwfkR4pf5?=
 =?us-ascii?Q?W6gkcJbjEns26rFfAYBpw1vz1g3E4BHB5obTaNERp2OyjdWa7dNebCk35Kp8?=
 =?us-ascii?Q?6x9jMBCwabVxlelE/x15jaZGKtuQ5ezo9Opw+vC55EylT6EIB940u/cCXQLn?=
 =?us-ascii?Q?uEO0UEUjYWpuDXG7usFFpm2nXuK27sm2sBeaolFEHAIlYROnZpkiXpnjDDJ8?=
 =?us-ascii?Q?8kHm2Phm1VTFTeu7dObf6e1XG1TBeAnSRrVVQ4+7p0BHK87CrBEjkwAxq/LG?=
 =?us-ascii?Q?YvybudX81w5C9CFSyjRqbgxgHUgPUBKppjzFI4m9RQolUzUFcDmczJBFYQjv?=
 =?us-ascii?Q?7dlnKwGlZhOYH3iahu2FJ5QCFYjvIzkpJg0jjUEDj1n0PR8P7gCFmQ3N9VlI?=
 =?us-ascii?Q?D3nBQvPM/EDVqWIbZvdYCTPrGdP+BOeZ9uYVy/9jBCaW3PbAt4twpmd1ZPTV?=
 =?us-ascii?Q?4bSJsj57YwMDoceXBZrmk+UoHym+v7h/A9XsvVnQ8hB2bHnoQIeCVVam7F5D?=
 =?us-ascii?Q?L7GEZmudeKTDdac/5h/k5NImkfpr4488EiQeZqF2JQ8ixePEqA3OqXM6VjjS?=
 =?us-ascii?Q?F0/HCG1OJWQ1eyPA0tQ7wfoS5CD8To7Wn9a1ujHVh9Oq3myCc03JH6FZF0QC?=
 =?us-ascii?Q?+LVRp+H8wi2xlMVOJRJlJBvMRdTo1MAhRb9PMHPXiIiBdsljyyuRXxQziyR3?=
 =?us-ascii?Q?b0SR39IK5IWpbxBlGFCYPdmwzC33dGfrp2987aVH+yDaNICNXWNBChEpYuOI?=
 =?us-ascii?Q?3NwfVaBlb5v8D4uUsKeH3LsTa+BNqq9wgI6pfoGLd9mS8jYtSPEdoAdAi8KE?=
 =?us-ascii?Q?sLwacK4ZYKh37Out+d67Jcehg7TJsuAP3SwL0wPph5Eyq0tTZMFqa12YiQo0?=
 =?us-ascii?Q?ArYfH+7RQhurboLMhRU/OAyvEZ3WCDBDB4dBaiG2dMLQTV1bA/Zyhb7lQqsZ?=
 =?us-ascii?Q?6wK5+EW4pRi8Pq67OGBQ5s8+dBOyKA6OS9M74Al9atwP0H2VNKtJAk9nWiMJ?=
 =?us-ascii?Q?GYfFyzEudXLn2jwg0CxlP7p5Y+iV4R0iVNbf5w5uEkXHnGN2SFYnNmbFLXnt?=
 =?us-ascii?Q?2iGACPYTeRNBv/wB63A7J4JBC9w5WBUm91j5dNST3Une/V+pE/25Bxr9SQFN?=
 =?us-ascii?Q?hWYkqPQ1EQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ccbeddbe-5af0-45bb-ce5f-08da191073b3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 03:32:48.0649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ohOUFWyl4zNZj0ZlFBmUJknKpK6etP9TV32TRQwoW9TGnmCNgG0I+pMUfgeVLje/g/IdhvoYz4SuhDg5igQyeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1597
X-Proofpoint-ORIG-GUID: pBgfpls8u_4zE7GyFEkBQOTDzGnm_wRB
X-Proofpoint-GUID: pBgfpls8u_4zE7GyFEkBQOTDzGnm_wRB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-08_01,2022-04-07_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0
 mlxlogscore=735 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2204080018
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Apr 2022 17:09:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96470

Do not inherit binconfig-disabled as pcre2-config is not required by
upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-extended/libyang/libyang_2.0.164.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/libyang/libyang_2.0.164.bb b/meta-oe/recipes-extended/libyang/libyang_2.0.164.bb
index 8f41769e0..2817be7c8 100644
--- a/meta-oe/recipes-extended/libyang/libyang_2.0.164.bb
+++ b/meta-oe/recipes-extended/libyang/libyang_2.0.164.bb
@@ -21,10 +21,9 @@ COMPATIBLE_HOST:armv5 = "null"
 COMPATIBLE_HOST:riscv64 = "null"
 
 # Main dependencies
-inherit cmake pkgconfig lib_package binconfig-disabled ptest
+inherit cmake pkgconfig lib_package ptest
 DEPENDS = "libpcre2"
 DEPENDS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'cmocka', '', d)}"
-BINCONFIG = "${bindir}/pcre2-config"
 
 # Ptest dependencies
 RDEPENDS:${PN}-ptest += "valgrind"
-- 
2.25.1


