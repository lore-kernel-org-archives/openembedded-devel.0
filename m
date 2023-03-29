Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C60F7C74A5B
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 10:08:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.20728.1680084511903888590
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Mar 2023 03:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34523aef51=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32T9UNaA014946
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 03:08:31 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3phv85ve69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 03:08:31 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32TA8VYE003042
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 03:08:31 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3phv85ve68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Mar 2023 03:08:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNFPGSo0tM4WSLoYMDtFvm62ys9XW6GRiA/fdNxuh7fBB/01r/94AUfW/QSVDqT/R9ox0E8Tx+9cax8pdrtq0+t593XtIBZcsrvy5IMur6zoGNggylGf1tAri0NgKEK1uokJQPQfj/VvCjGM8B7adhFRj2vgdGadqlhukK6yDF+nyQXH2FFeiGbkdTKmoJjr/HimJiU1jBybHYzCnrwu/2a0ls7O3VgASROXVoPC/9+bb/CuoFfnCP1zEd7HkYSTSOFiiyDn306MVaqR3u0Qav/U8+R4B7cPeQ5JeI38VgDYKNaxzBQv8GvcKRDnD1v/wbJ22pqv05g4GsZL//lHuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0dpMZ3oDiBNSMziY4Ft9363P8ZKv9eLVi8NyaqLctus=;
 b=kqiC/hFShBX2stElEuqRtmnTm79Kb87E0V5ncOfJd5zNwNlli6lu/rehf6C4caV3ZmREwiNCh1Ss9TXBCKNu/502m2MO2dFpAibjtPr7UshiTXvB2DhhIU6JezFRTJ36WAUHn9GbHVGsaevdXJZq1WBTMm5wViK71EMdHazr6wxW+qc0PHZAnr4fvf25IfKQlXowlf4DVKOsdzeNt/EC9Epga5NXk/kP8EdfOijXmSLhQlfmS2kzFDa+mSN0dh681WuJR32+JFZJJ9i/genckBtFnoHEVLFHDJ3p1bwfrAZ66PGt47MowFC6flG0a/CHRpepfX7phfOiy6b3rLPl4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by PH7PR11MB8036.namprd11.prod.outlook.com (2603:10b6:510:248::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Wed, 29 Mar
 2023 10:08:27 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::2ece:f831:c97b:dd8e]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::2ece:f831:c97b:dd8e%6]) with mapi id 15.20.6222.028; Wed, 29 Mar 2023
 10:08:26 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH v3 0/3] protobuf: upgrade 3.21.12 -> 4.22.2
Date: Wed, 29 Mar 2023 18:08:07 +0800
Message-Id: <20230329100810.705855-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0007.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::18) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|PH7PR11MB8036:EE_
X-MS-Office365-Filtering-Correlation-Id: 88dc8b14-a4e3-4d4a-58df-08db303d89d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JahBWVA1Sy+PJtCSIObxOVRyjCC8DYrSDFD5HRCtU84JmVx04941pBuF81iUOBG5+tQNg/n+KLDtPexgxWwvIVdgpHaDrIrTUk/myTIqF6txugiOBBbAH7cvVCfb4lO4pSyQMwMTuz/h1ade2Ceo0MTi1rOP4TEZQ1oxhfUwBHqzS2U0Gse6S1wFuvgkcxg4sWlUUs3DjQBg1u1C2QjEhnjAvwzpbN/SU4ws0jrOQnWGaR02aHYMU4R+NMCwu9zU8JszxCaVBfUGlV0Me5+AgrcwrTYF6sFB8Wtt7fH9+g4tpdBcNieFWfda0upUJSFsGBZj1LerCFDZHrswR/H0jf+0r4vMliBUJxtryPU/OKjqwu2poTETF6uCedbExpFeHd7xdqm2txdIzXExcLmViXzxYpTbrcsMV8E1nrPPTw8hX9oNnVdpOfoceI9JXlIlrIqtE0C265uU6JDnkV0pK+ZXeNbmeJiz803e9++bXtC9t5WFRelcEDVaV+/sSN/IX3EwNiUV7Qs8907RA6TvR/7SR8B7ZxrkfDfC7hWt6MoGRwsec9RyJcmORNF3p00sIQTmF7KMpqZfJxx2+VN3F1qIVI5nP6AHht/Ai+6A5JQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(396003)(346002)(376002)(39850400004)(451199021)(6512007)(26005)(41300700001)(6506007)(1076003)(6666004)(186003)(6486002)(966005)(52116002)(83380400001)(2616005)(478600001)(316002)(38350700002)(44832011)(66476007)(38100700002)(66556008)(4744005)(2906002)(8676002)(66946007)(83170400001)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?u5z1buAfx+muKmFkYvrO7R9ZZI/z2DsYChGNoazK1e+E2AMHbZXx8HGV0vyi?=
 =?us-ascii?Q?mGdhqTwP+vIAmgXenzYwBdyiWp+Rg9OT2BlHCSfuRlNd+WK1ImaDQNkCe06D?=
 =?us-ascii?Q?46FlwkjBbChbVW3W3f4xhQDf8MLzAtlNqdcxov1DuvUkHOOsEJAr5DMBSnin?=
 =?us-ascii?Q?P4ICDYRRepp18Nk8PEQZWtk0HX03kVTGHRaoPvfpsd+NhrrZwqsd8U5BGwyY?=
 =?us-ascii?Q?0oHlEsgbGiddD/VO4x6gGCkEQjJWRtwf3ZBtRt4BH6k6JCmrr3EyRYQF0/+Y?=
 =?us-ascii?Q?PK8Vedph8aqo1JSkIvKnGmU4uC5obwh9THBo4mvsLtR02QSQi5BFeqM+F/Jg?=
 =?us-ascii?Q?8POvqZG65PUwgsAv2Njc4wrg4r5FCXRENO0bJc7cN34ssOa26I9s/XI1yTw9?=
 =?us-ascii?Q?QYtMUcx/zoMzKovrtHbglG5w/KjScRKPkQ5SAGaznUyemQDxrFDBCFB9JbCB?=
 =?us-ascii?Q?TVPd0XcX4SZlYH3QtT7YvBYl0XGChKiudXI5M/mgDSreFQVsjyR1VAUICbXz?=
 =?us-ascii?Q?hNCgcgiHlhY4QiPGSso9nHKfbJ2nAHkD+uXM5SbxEbNzxWT188L7yC9nDV+C?=
 =?us-ascii?Q?3e1rK5PLp6zFkfjn4fIJhmyV4W7xTlj6VZpynJXzs1oF2x97t+CTe6bedhBZ?=
 =?us-ascii?Q?jT3IZyEMcad61iobD8Z7JvTOm2uEBZoAIRk9h6WxFTvljZdvr/89+vbkE8ez?=
 =?us-ascii?Q?T6bFG6QWhlBH3AhOJAPuSTOlrd2Xhi28DxXcO7O4OTTscaLfbf3CuSCSsdYo?=
 =?us-ascii?Q?dUkfoqU/6cENtpREygI8Fp5d2VuOawGd5mlt7Q/rG0HWRDHQwgDgyX2VJPhl?=
 =?us-ascii?Q?hQpPAF3f9D/IiVdjZIAjHV4MAykeWSKXJ23vJu+YdcOxZeOLCFTnD+2LNHTR?=
 =?us-ascii?Q?GCvPSCLmrasanQKy7tCw21oJ0dOi8gE6picpjIlmfUUigcKx5ewBXzfGePDg?=
 =?us-ascii?Q?y0Nr6PW/vxUYJ+8of/GPjTER9SLpVgWimhNqkdydSbj6TbIut/gx+hlw/+0Y?=
 =?us-ascii?Q?OXkF7jBZ9GbJ0YK3ZwgfDWmeb6ilLbdeRN/ezFKy7+cgwiqszR60dFiOYTVy?=
 =?us-ascii?Q?/hz2BoufStdZypECZt4mt5+hLtVjpBW3+zJYs2NUVovYnGEStfXiWPyV8e+u?=
 =?us-ascii?Q?MbxatuCupRn4daStwxmJZyAPdh+WPJSl+zZ3mkdMs7lo/XTU2SIrsXb1w820?=
 =?us-ascii?Q?llOqlHG8YOASHKIlwMUMiLfZymAkpGxvN3bMw1UEvmhgbj2xQY01HcIEn1FZ?=
 =?us-ascii?Q?czpUffT7hUGGINjJOkHyLcYU8c3FnEm1jNnC+Dgrt/vZWyvr7RCcj++2oH3O?=
 =?us-ascii?Q?FUp4kXajAsEWsRaf50c1+7mGlBPssiz41UUh+AXcoV36JY/WSsQ0uTsKhak2?=
 =?us-ascii?Q?az6M5jQWSxTQnhC/weZIYR+kEue4/qjONectbfWUGpzgCFKczjmPhBIbUE4e?=
 =?us-ascii?Q?PyajOxqoL68bEubVvL49CI/MNzYjIh12K5PNIVf9EBu9XF+6OBzjWpp1Q9Ny?=
 =?us-ascii?Q?+laW6xNOsaJvKncM0t1CgolNBMQp3ZQ5mcNa6O4U/ZsHs04izdgPn7Met1Fp?=
 =?us-ascii?Q?rmvRz/xf7Hm3GzlAClmkcDU6fwFUE0qkNg5afq7KqheaMBZLTpsZSrhAR1fm?=
 =?us-ascii?Q?4Q=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88dc8b14-a4e3-4d4a-58df-08db303d89d1
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 10:08:26.8837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: czC7SQaOEUaMhBFlBxRs9flTqO6L+ocKkrzR678/j/YjaVdhhrS3STwd2ygQUucFYsweOKCoo2Alr1aGuyyeJBpE6pYYhM0LD5TzZG50yPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8036
X-Proofpoint-GUID: kZuFZFtu5nCwZh_mUHjqwHrTCc6CEBRw
X-Proofpoint-ORIG-GUID: 0PcU2BOWBzL956j9YwAL3hOGMsik4l_P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_04,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxlogscore=694 bulkscore=0 spamscore=0
 impostorscore=0 phishscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303290084
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 10:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101812

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Changes:
v2->v3:
1. fix mosh compile failure
2. fix protobuf-c compile failure under clang

protobuf,protobuf-c and mosh tested under both clang and gcc mode.


v1->v2:
The v2[1] patch for upgrading protobuf from 3.21.12 to 4.22.2.
After upgrading the protobuf, the package protobuf-c cannot compile anymore[2] due to the latest version
protobuf is using c++14 and some of API name has been changed, so use another patch to add support of
protobuf latest version in protobuf-c.


Ref:
[1] v1 thread please refer to https://lists.openembedded.org/g/openembedded-devel/message/101784
[2] https://errors.yoctoproject.org/Errors/Details/698756/


Xiangyu Chen (3):
  protobuf: upgrade 3.21.12 -> 4.22.2
  protobuf-c: add support of protobuf 4.22.x
  mosh: add support of protobuf 4.22.x


-- 
2.34.1


