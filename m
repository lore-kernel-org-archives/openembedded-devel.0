Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C768EE49B0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 01:34:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2360.1692754479906647162
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Aug 2023 18:34:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TOo4DZX9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7599c7e7ca=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37N10pLc025544
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Aug 2023 18:34:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=uWfXIerVogo3RZfQMd
	yyrdrzBHIammhFF4ohowHrjJU=; b=TOo4DZX9ukZfEjs03vVNJWIEojr0Y3ofGT
	AEte6sLHf9Uj/VDAtTKeamyarm0ZMjsX9l65koOQa+/Ck8zBLbzKOle8qarXzQlv
	1kWxyig6H3VauJxItW0A/mT0E2+r0ifJC2i0LumvmWy7B7NsMREelPOl6ub0sedx
	5l4W/FvdKRDWuBxfNBjNZG9APVD8YoWXJ7b+16o5A6QB4/xt/gLNT7w5qQaouuxK
	pFtJH7LVA4JUi5AUVs1o9h+T2juHnn1b0Eqcwar4r6qGduwdBv4xkpBO0xLcOH5B
	cV/rZh2GgX8cLodnBUgQ6t2ccl/tUNcTZadoXc9gLdJA9LwYLC7g==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sn20e09y2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Aug 2023 18:34:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWF2JgNFzeZMd1II26jKsbPVjdonPNVv2DtLLcxv6OYDrLE0ooOltJ3Chc1QeHd+xSzBo94irXVo7QWgWaJWAHrCrG89pVoI0qikah1ZOQ5azzr/HcoVTrtOT/UareQF8KXOQST/J9NKzlKmilfDVmBbsr0PzIK6Cq4PtQs2t791GgmxG28JDOzm2MSMZumB0K+5sX9EFNR6Yt/zxPCPTr6QzEvVJF4E/USwjeLVmjGg1T5CO02yGivx5BSurBwzzbMMl7FzRnMbmuvnLZHh3Iv22IYQ+AtAd6niHOaNdSZzykYwEIHtkUWS33IcVZhV3i+J0sK7fb9a5Ri6MtzZlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWfXIerVogo3RZfQMdyyrdrzBHIammhFF4ohowHrjJU=;
 b=Wz3yfGuf2Zta6k84/2+5U1mdA87y9NSVk+pqXOAioOb+NGcY8OfmQbllNCF9QSPB7WzYDMAg7Op7mwAp8QbHOvpmeTB295ovXi3cgG3mBS3V5FbY6odXc8gWAlgM4howvmdfOB/KgHGOxq6e55USObINxUGNdt3xAqDTTyfxh/sEeJjvOYC5O8D9hdvhmq9ArOaZfffzu/FoOdNsGJ2fz97odBmiN9c2wuqFMGXtt1SARgMOSCUsFt/tPSxUPAOE+8hyiEUz0X8y1Srx2+GqwGvuMjYzsFTdnZdfzoC5eA72ElK0cPZAJ83aoVb6kGBJqSoHJ5f2WEUUk0kUTIxlqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SA1PR11MB8328.namprd11.prod.outlook.com (2603:10b6:806:376::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25; Wed, 23 Aug
 2023 01:34:37 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1ba9:4bef:c1a4:306]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1ba9:4bef:c1a4:306%2]) with mapi id 15.20.6699.026; Wed, 23 Aug 2023
 01:34:37 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] nftables: upgrade 1.0.7 -> 1.0.8
Date: Wed, 23 Aug 2023 09:34:22 +0800
Message-Id: <20230823013425.2252936-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::9) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|SA1PR11MB8328:EE_
X-MS-Office365-Filtering-Correlation-Id: 610ea78c-8853-467d-2354-08dba3791c7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FsRWduMkzXeKw1+bIjHOM18qF9c+Eb/24SCoNFyBl8ZejMgKrF1p/QkPetGumBXLt2KVql13k6VmpuvVrg8HeV927uAr+dYpMjC9znXpsuQXvdW9WOzGFr2SNjhkUdqVJdDef6kGaBJ1lT8Rk4nnSJefPaNL7iHGGR9irzxGIZhYSxineL6aIcfTuuVacph0Mj0CMbG5QRlr1FiFKofwL7Fogw7j8agf0JxL6Z6Lf/64iwVyoyCPfeis8vd8dYu5Me6xRZBPsd+gpBNDiuN158d8BhsYrvcZHT5Vbto5J0SNFD1Jkz4+H1qhYDLFq5bHkoufGFNfMY4tvM0Vi83DLa2YkDtK8udyfsF7W9mMzagNgYjPPeO0MsTov6QTpsutgOQEv6AwNSnNmyBw1FL5EhPw8B5n172cNOLoa5sfoPUaZoWXOlmkAnMTCOzzNHnImehrCy9lgEOLk0vAkhUV/HBmHA44pskSaw4wZziVzwOw7LEI1kGuh2FaYVpOICyxBjeuWqhJfkqsaqZeTCPvFxL3uFNjzFe0rdBoqBxZ7kuUX1AWesUR+ezVc4OfTRhmHtPhVEH5R1kDr2BBkIwq+xtM/W8CeQqVeDM02kow697wtqqOUTg4XBXU6n3179G4O2bZdCLAK1i4dKM+uzDmYA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39850400004)(366004)(396003)(136003)(376002)(186009)(1800799009)(451199024)(36756003)(478600001)(41300700001)(6512007)(86362001)(966005)(6506007)(66476007)(66556008)(316002)(6916009)(52116002)(66946007)(6486002)(6666004)(2616005)(5660300002)(1076003)(8936002)(8676002)(26005)(44832011)(83380400001)(38350700002)(38100700002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4p81tuB4QxVKNWM2n8tdyW2258PDbkh0DFAYDML/IlKNwVZG3Mlivded6gVU?=
 =?us-ascii?Q?Z65bCw7a51gwsoPFyEcfCzckGGTvBDhqMTj15flLcYT6cD4116Tp4PdxfsV5?=
 =?us-ascii?Q?saMaM2IAGL2BFscXnjF8SOjAytyj/B+jzxCP/1VvOp9o8zMv9gtuMsOnE1YG?=
 =?us-ascii?Q?xxNo2w+MHKg4FsPsQ+WbR++HrvRhEqznooTiLYiZTNyU8kImIljPyyteg+IT?=
 =?us-ascii?Q?I4hlc/sQexM9/LI1W7gpKODzri/p0KfYMZnrCW/NiH6+kcjxRK10BYhAQNSU?=
 =?us-ascii?Q?71uEvpeZjSJ4xe2UH4xrL20RQSqaU9RnRwCWF8Xyf7e1PxvkHQVI/aZWNZxk?=
 =?us-ascii?Q?PQkwgEej0R8byryFwji3XaSTzbl+b7A9biW33UqPy/5t7i4s9xOZjWO1FlfE?=
 =?us-ascii?Q?NgbiE1IKwJkYjtj7oa6T6JBa2gc1PoKuLwp0E3AApFlnEQEZ7CLvZ4BcF4So?=
 =?us-ascii?Q?EQys9EBIxMzd0U6PeBXRbbOZ2bVaiUISyf3V7eCOtsMKSsmNZxZlIG28D8Kx?=
 =?us-ascii?Q?YD2ATlvLH8QqXlSF+XiG9ocH3S9kBZQEGvnowft133EJfQP0+VxX/ZGAEsZo?=
 =?us-ascii?Q?+zWt4RofCfunTe2vYO3nX2uhWgjqDfxPjFy1esB6WN2sC0TYoYzEtkNnGWRM?=
 =?us-ascii?Q?XRf9v+D2U8Iqy4kL60BKWFQUn1fYxNRhYgCzKihkp5t2JXbnZwV/wkoHIibi?=
 =?us-ascii?Q?gSP3Vdb74sGF9kAdFcjtmwNIIaT8a38f96VHCoK97/YTfODofkOmIuhAfi1Y?=
 =?us-ascii?Q?ceKYinG2CsF5dgHvNxSJd4EV34GtFjMfI1z9gfqpPkhbFjo2pyYXVr4Cf3TO?=
 =?us-ascii?Q?iSQOvwcxBcgd4hSshuPu378m8fcF9qeqdPOcccdvjbvgsTOHG7jWjY2GrCC3?=
 =?us-ascii?Q?reHw7Mv3mzIsHBE/wOuvPdtQekYnYxFZ+1XH5XZ76c68PAkrtB3MePLFSb/B?=
 =?us-ascii?Q?uOoKn2T+E+ydS11d+xb0KByUWW0KIgTuAqcD9v0g2D9hQcLfmTx3S06PjLSx?=
 =?us-ascii?Q?DNTD+J1ctc/IBybmlCGp58CQSZM7CbVLGSVV3OiBdVIccrDBlJigDLnEOllM?=
 =?us-ascii?Q?00D++pCCeUOPsbPT5zXMzXEEYvsBrIvId279z2TLiB+Ri5nC3MM0l0tF7u2z?=
 =?us-ascii?Q?7VITQ9jWmb/ePa0W2s4lpSpCgk7ZsyWWvsuTeQVebjNm4P44ttwqKnDMxJ8K?=
 =?us-ascii?Q?fDj4qELWdUrZCIuMD4esaX68ByUCOuh7GVwo7SOn8GDTw/oxYGOlzhXjL0da?=
 =?us-ascii?Q?5555lkj/0Zgdfs+R3dSipDDGccWS0Z11dxFupfI49Bv7T2l380NOwkDwglXp?=
 =?us-ascii?Q?IG+17zgxiaZP5ZGrpMxsWC+tnJxkcoKO/EXW68hReKDNMeBYca4nbW87reFf?=
 =?us-ascii?Q?QWWGthbgyiecqc1QJ8O4F9fpTHDvusGvNa4EmP7jL2dcUVeMEm58tmlfMWbS?=
 =?us-ascii?Q?T61KXl+jXZa2T+IH0jrPeQFiN+7w5s0TxUJmeb4tx2RbXFkEYlwuzQt7ceqC?=
 =?us-ascii?Q?JjI41lA81uooyZCuRypT4ql23jt0l1FGmcCpx2D9LsAXXUMZ2l2fZoZ7l/xv?=
 =?us-ascii?Q?z+0B0wygxU6uJdb5GIAOcmVG/tpr8XjlU2Kh64Sq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 610ea78c-8853-467d-2354-08dba3791c7f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 01:34:37.0472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BEz3H+0dKRpxjCzn+4KuPeLY2i1txHkx0rSObLFHjhrtQ+a4GUF/gjBrZhTrSshPbOOr4wZZBWwH4mDxRvVcLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8328
X-Proofpoint-GUID: SBaiM4Tg9Ds_MIZofg2xv272ue_xjWtU
X-Proofpoint-ORIG-GUID: SBaiM4Tg9Ds_MIZofg2xv272ue_xjWtU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-22_22,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 spamscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=760 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308230013
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 01:34:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104524

Changelog:
https://netfilter.org/projects/nftables/files/changes-nftables-1.0.8.txt

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../nftables/{nftables_1.0.7.bb => nftables_1.0.8.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/nftables/{nftables_1.0.7.bb => nftables_1.0.8.bb} (97%)

diff --git a/meta-networking/recipes-filter/nftables/nftables_1.0.7.bb b/meta-networking/recipes-filter/nftables/nftables_1.0.8.bb
similarity index 97%
rename from meta-networking/recipes-filter/nftables/nftables_1.0.7.bb
rename to meta-networking/recipes-filter/nftables/nftables_1.0.8.bb
index 8380bbd73..00fe483bb 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.0.7.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.0.8.bb
@@ -9,7 +9,7 @@ DEPENDS = "libmnl libnftnl bison-native \
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.xz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "c12ac941fff9adaedf17367d5ce213789b98a0d314277bc22b3d71e10891f412"
+SRC_URI[sha256sum] = "9373740de41a82dbc98818e0a46a073faeb8a8d0689fa4fa1a74399c32bf3d50"
 
 inherit autotools manpages pkgconfig ptest
 
-- 
2.25.1


