Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6490C28B20
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 09:28:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.27415.1743326899366379480
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Mar 2025 02:28:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61843d4d18=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52U90UHQ024691
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 09:28:18 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45p7u8ryn9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 09:28:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xSUcUUNfWHOm8PYYZJ9+5NLadFO2zVzWm+JkwxY4i+EmMLtvu4NPP7S8DP0b4pwdlMnvlwgzUHfYDavRIimsOpf4Xi7dxr334FYUW8ZwqvqVPffrf+DJ53VXazLVBBJyxg3coRMjw2qcpTGx1SXOWaRatWZ1edhuI02P8c5MPeWnVd7fD9Rn+X6RnCIRfozgBCtx8FKTkufY6c2B5VE4UCN519Cp5sqK3ykIDiq28KDrBDbTeyE/mpB/sVbvCH+lJmW43UPijp+OE8ZT9mR9Y5ao6EZ6f3rhjslcemZZk3aDTQb/Lp2saBt3OYE//zRGWHHOndBCpGUeLTk+5BM4PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rn0Hmd/LiROOMMHKaWQ/nxmRf8bPixaSxvy3zDE8mlE=;
 b=Tpa1hrQG37rFXur3taRRRs9R2lf3x6RWE25Y7p9eWX0DrkV/Hd4YndSli+i6sWK6VAn3zC9pbuO/MZCG/hHi5uelKRakIZ1UOkufhQ0iEozfAt+kZER+ryq85HjAbsURHvB1u1k6FLiRobwJPrL1A3rBF8/JTG45ZrnIh14msScCFhV1iDGPYLravFxlLS9SbuhhjKAy+SoyPK42aR5QzJIBdi/44iWN0v37yU3wB13uO8535iPZMGxGg8l4MWVjVjwsNdRL4Ht68eNq70YV5EC7gizEwE54/Ze+hGNirBSns7G5qyp5dcnv2TooxzNyDXTtsqa2RAVcYZY9mUsPaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 LV8PR11MB8769.namprd11.prod.outlook.com (2603:10b6:408:204::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Sun, 30 Mar 2025 09:28:17 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8534.043; Sun, 30 Mar 2025
 09:28:17 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 5/7] googlebenchmark: upgrade 1.9.1 -> 1.9.2
Date: Sun, 30 Mar 2025 17:27:58 +0800
Message-Id: <20250330092800.1275186-5-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250330092800.1275186-1-yi.zhao@windriver.com>
References: <20250330092800.1275186-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:3:18::20) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|LV8PR11MB8769:EE_
X-MS-Office365-Filtering-Correlation-Id: c176c231-6bbe-4c4b-5911-08dd6f6d3405
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xfXvcfswxyZn+OzKdQ+cxd271KP5yzo6ClDE+VEvl/oowQAoZWhFASIFlhsK?=
 =?us-ascii?Q?hYclQ+nbzlpB7+X5P7Y3wV03onfGrw2h6OZGJx6/M5IfYeuCIXrgyEb597b8?=
 =?us-ascii?Q?ZSV30Xq+8C7/Ofjwhm5LhLYFhDI4UCyg1awzFq34F9Jg9wXRiflECBWkkJRb?=
 =?us-ascii?Q?KJrupV+SV4ehNCncKFxsttn3JM1Sgfr5xkS78BLN9P++6gqCZ1yvMIjU6r1b?=
 =?us-ascii?Q?Y1HdcuxQ7D4ftrDN3Bhbmo0njJjdpWO6KSq3Wdqe3bu+YtIuDdFNAZbeKteK?=
 =?us-ascii?Q?W0fT2GfOk88hjn9vnIASauVFXhEJ/wE+miCNx6ysA7uj5pSx98rA6v7gm76W?=
 =?us-ascii?Q?iANNyqfpvdWaHxAFxtr1Wlu1pCmDtAJCvj9Rh2lwGZKTwg62Dzlmf/Ha92pr?=
 =?us-ascii?Q?DhH3ac6rODzkmBrPcgZgKj+G6dNl0WrXRSfwqsbWn7ZfkrWezcf9ED/O+S0c?=
 =?us-ascii?Q?hOzb7K17+X3gkIJV40FkXYDkapfp5SfzTyGhTpacZNhibgBfqPnpOlH2xtGv?=
 =?us-ascii?Q?FkLmvE3W+aD7kG3kEmER1llL4DYpL2AXD6g65MjBMB95KQtiD40oWlYkyir8?=
 =?us-ascii?Q?kS84kbEhGfrBe51646BZPcFzEhqK6GM50k2W67CKVFf7x4awH1nBKoiasBpR?=
 =?us-ascii?Q?HoG2ua2ROJpzdY+LCcrGXd8xlv1pdPjRvSl7gUnsPG7R7jET24LfHyqOfLgF?=
 =?us-ascii?Q?DnZXDuSC6JDwmgV1dmalaMhILg8cKxwZkkwOE84NywAcPIW2oKO3KmaS5D53?=
 =?us-ascii?Q?J0ayDsqW6nCv0fpHFKEi482zm5gdyeNxZE8nYimTSEh1o7H1ejBjvuTZUnii?=
 =?us-ascii?Q?pQGnCipJciQCbL2TL9o9zX37/Rl3NoR/J+eVKxkclaCPjMeV04DB6HA3PAMT?=
 =?us-ascii?Q?RzuFT5WNGTPxdMpHsPNyka2setJJGKj0e1kgRYSeCCGqXc1SrcoALyjlbbeC?=
 =?us-ascii?Q?Ncec1szINfEdWLjs19VVo594HywxmgYsLSYhZwNM33sSsGHu54GXFSvk6ugJ?=
 =?us-ascii?Q?fVQtgpb07mJjYIDEiteFx7ZEQXzRpuZqEG8yyTyB3JQe+NLjyD7R9LWsT7cK?=
 =?us-ascii?Q?KacgzxhJQT21cmHpbvB9GXyRT2dSOQqmtN+GwfSOuzSlhIm7SAvahQ2twZcF?=
 =?us-ascii?Q?2+mKYg/D4mvhx1yYDFsWOmnOVWZdIdbmugbJlVxrIOR87uqLKdlUfbWetC2o?=
 =?us-ascii?Q?4MPEVU3uQfquKAyG0Ow+ONQ66Ra4nBu/CjDmEtfpxe62sKouKqJYh/vZWN5t?=
 =?us-ascii?Q?XOuUZvYaNz8R94pDQy+FB0Y5m6wq8JPWjVfY7OIkpFeurIa92trYnM9qK2zn?=
 =?us-ascii?Q?63apM8jgCGMYciGdMIznSSmD1Rx2SZzbD/ESNxhIu2aC9SaYNZbqc+XUYKJk?=
 =?us-ascii?Q?vPBtKNGdywJRUzW11dOkgM1sOCpvpxL7pPT5voIpoC0oosR/2Eo4Cpz/U3FX?=
 =?us-ascii?Q?ASQnB7XulxrC0T5lV6oLcWzgS+0uG8z6jzLq7l9felHKszzvCaEUAvzGG99z?=
 =?us-ascii?Q?vZqLK2oKWzOWmsM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?L9kwhVnxNQLr70zpvZAfmuShiRU6481EOyi4W+5QsX9BB7flw0tdpn15giL7?=
 =?us-ascii?Q?wPiCo9DtDdPt/ZF7UlhAhvlKYS1t9tzTR7v+AGimga5R144SPu+Whg+uNa/t?=
 =?us-ascii?Q?jzlIrC+dzqR/4gi3GVPcg4e/NnvBquSwipWc3xhnwaYG7XINwD24WxFXbAj1?=
 =?us-ascii?Q?rwvU+4GakNx/LnP9TbQphWr1sEFMWbUeL6MS74AvgmPoskukD1a1D/8siXpt?=
 =?us-ascii?Q?zh7Mv9Cch+vDl8drk3HyOX5q318mnibAlo/7T3mQHVvBChzJzHHfholq6DHe?=
 =?us-ascii?Q?y4Msa5dH3+RM3P6C89DpEz5tkduExmtAaBbizG6yQgcsQFOWvV0uevH2xwm7?=
 =?us-ascii?Q?2kbQwVByuEW7xwaPL5fu3wJfWWrw/nRnfQtbXinAPL8PjanW9YOsQCfQBltm?=
 =?us-ascii?Q?pxrbu5yDNemHWJGQqKl5Vxjhx7kcT1ViaLkgfdayXH/NP2sz1UKI350Exnat?=
 =?us-ascii?Q?SKrnC3ImrGfhg1DFb9gm2VbnGOLE5k/oUiw1d5d8M9K5LcaMNinPhkwfNg7N?=
 =?us-ascii?Q?MKs7eOkWd+acmqbWwl9HzH/viKAhxx3wkRNknAxnZlk4tenH3r/j+eoRWbu5?=
 =?us-ascii?Q?C+ylZWrRglX23oybkbkilJUBJiNSrP+YO84safdJbsdVOP65LC8n0H5Sl5zh?=
 =?us-ascii?Q?YLy8HFIb2oHym/e1jOCWUil2MHy2AkLckwlOCyRC/xfpX7Dgi96oB4jGdBap?=
 =?us-ascii?Q?Q/gq+d5zZ5Z8+U8pBcR8SoCUqjc+b/huEAzwIXxXzJtyVPt8XRF25fZ6ZX4S?=
 =?us-ascii?Q?CeGLMjx6E38FcmNPdGaN8HV91iBDf6JqR18FBk0W2DocQbs16EyHDCVTXnLJ?=
 =?us-ascii?Q?o6vtDbAgnM6ybEm8msYyIybamiXTk7D6Jg5+TNyjB+CCqjV12vhV1cGWHb7E?=
 =?us-ascii?Q?wFYKNpikEsmx3BDZjO3+bHnFZjAsjX88fAaFaGVV/jFpZueyFkndOlKJjyux?=
 =?us-ascii?Q?QQoXJi8HpdYsnMsS83C8/z2swV4RWn1y8fr7NSO6ApxTVqzFvy7aqckoaHh0?=
 =?us-ascii?Q?U6arxI3QzZFXg6TyXiW5OuHY8qGTcOkT5xYW07k21fOoRXb6omSkJQG7loBW?=
 =?us-ascii?Q?Kw5E0orgy6AhdcwMasDa19GcHcZr8gw7KN+MBWd9Upsjo8w3DHRb03Fvew4n?=
 =?us-ascii?Q?W2XtDTDA1b8bPn4zY4HxLSB7NQqXepIUQyYcXMhK3tsViQp/K4pr3dt7yBzw?=
 =?us-ascii?Q?kAyi6QWKZ+F1ZyW6U+n8SMSM5idaHXx9VCqXftH9uaPnb/3Jyg3UMWgP4MIz?=
 =?us-ascii?Q?BFSJVn+Hf1Ax+3AKtpI+Z03E9IcuDViVou8PxTvtH4aqbg3DsHDLWnD5tMxe?=
 =?us-ascii?Q?IjMa1K2jWAXg9I1GkPtNvrqPIBNEiJsr+OJt8NUK0Hj4LypvUuqF/6RHMv8k?=
 =?us-ascii?Q?65FW+hvVuEw24YbdFSLb7yJwg3p065Jyb5nxswICTpUqZ/CJdvG8Kskz5zrW?=
 =?us-ascii?Q?oDk79sn04L/TwH6jgCUHa0TzaCfmo3wx69sNMzSQYE3IuPaBb51iINqF4MHn?=
 =?us-ascii?Q?3OsvI3+zUMkUX8exk6KUrY9aUQ3QZooSks8ENjfoAD3TstRxXuhJ0pRpu5md?=
 =?us-ascii?Q?TBWw/rZBAEB+sYcZZMpDGB1mPjJOJ00bClH3d2pY?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c176c231-6bbe-4c4b-5911-08dd6f6d3405
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2025 09:28:17.4720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dM8lI29K13zTgM7q6aS86OzuUOG9mr4WIEJUQrLEsptnC8ulfo/Ne5U9QOfICBhIKnIybBe9tjeV6jtSSkBthQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8769
X-Proofpoint-GUID: jbFUr2Wb04Ov8GpJZxWlMR5Rgc7_83yA
X-Proofpoint-ORIG-GUID: jbFUr2Wb04Ov8GpJZxWlMR5Rgc7_83yA
X-Authority-Analysis: v=2.4 cv=RNizH5i+ c=1 sm=1 tr=0 ts=67e90eb2 cx=c_pps a=gIIqiywzzXYl0XjYY6oQCA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=Izn_IbvKoEbfaWVjJugA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503300065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 09:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116383

ChangeLog
https://github.com/google/benchmark/releases/tag/v1.9.2

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../{googlebenchmark_1.9.1.bb => googlebenchmark_1.9.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/googlebenchmark/{googlebenchmark_1.9.1.bb => googlebenchmark_1.9.2.bb} (90%)

diff --git a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.1.bb b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.2.bb
similarity index 90%
rename from meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.1.bb
rename to meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.2.bb
index adab241baa..03adffce82 100644
--- a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.1.bb
+++ b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.2.bb
@@ -5,7 +5,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/google/benchmark.git;protocol=https;branch=main"
-SRCREV = "c58e6d0710581e3a08d65c349664128a8d9a2461"
+SRCREV = "afa23b7699c17f1e26c88cbf95257b20d78d6247"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


