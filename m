Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91AD5CCF9E3
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 14:59:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15410.1762959559761416648
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 06:59:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=j6TNpMCn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3411d85ce0=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC67cfE1782935
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 06:59:19 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=GIbPo0YkPxDZhg74DIK3
	PX6FW0IGuH4k34iGIXltO9k=; b=j6TNpMCnAszhK4/Al4CTXg0VOkFXUXIyvhRJ
	N/vo93L7k208fDeBlFelnHy3VbRtckoh2qhrAXs47+w0485iDUsUAqOxCziNMfkS
	z4/tgh/Bg1MmIXwFa8TQopKB6abzOdGllrd2VViRWfmDy4HNz+JkuT31V5Mff3HF
	dfC/uwI+smnhqHZIMu3YxYjygPn4uH8Ukckpj+F4UnOpXw5u300Gj4JQrQBjIwZt
	L94bfi3q1jQAuN4gv+znzCZjiGSx+piYGdYRkBv/oK4EoWOh4V6owGBmR6eHFUWh
	Ac3Pl0d5Cib8hk2jAd2sdJ91xtnOQEY1WyG6NGOONWmvip3v1Q==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013008.outbound.protection.outlook.com [40.93.201.8])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aa21358uu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 06:59:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dzLdrDyhn4B2Jy4WbJzeZDGWsGsucZ2p+SgQJObNPGIUZ7yISAtxFDoVYTXBS+f+EjU5DmDO/c1KNMkBnRxefSuH7PmbtgFUrQtt6Cx+m0WgFRQi3LvBByXmv+LuARDWBgxHhTJpEEbwoqE4hMwHrUmLlpmEj4j4ao8kq3FM5vHrvLEQtuMJpNgaD13w4CWyREZQiFheLHMbPgarxnA4rqEp9tyrOMC8+gaVTTWAnKR98HpLenMvlyfqwj7DugJfKOplzBSUkyoFGBoj/zgb1T7uOaT1/HxtKgJJ+2Vd42lUsdCysJlualvxcb3ykZ1mOriQyw4R4UzSxmfsMBu4pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIbPo0YkPxDZhg74DIK3PX6FW0IGuH4k34iGIXltO9k=;
 b=cQW+lp8iAja1Uk8+jcVtbDtXicYThXXIhdnQdJ6Eex/oRgQnjsikhg2e/Mw1PdM9+DLaGxC6EDumuuHx9hNgQWs8I/i1f8hXAkQsbh0hedPW71mrc1BBCfoUWIwStb0H+5vmeEzSSxKZAPJ0YpVqFp/MFG6EhtKM6IelfnJR94KZWrZcnXYfRQSPDAyW23GwPUiizM8jY/WZvI3kIgzbXk9ydlFiaZ+x5PmHMr8KJp+7lZz0a2SOm/HmQ09ybZPR5lSZqkqzNCXtg9kDfHyk6YhMGoxnOgGpxCk2D403Nkn8juZy4AwITrM1JuQK5ZvqwMryZutJrCEG0rpFE1xz5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ2PR11MB7598.namprd11.prod.outlook.com (2603:10b6:a03:4c6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 14:54:13 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 14:54:12 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 01/11] python3-cached-property: add UPSTREAM_CHECK_REGEX
Date: Wed, 12 Nov 2025 22:53:47 +0800
Message-Id: <20251112145357.3788595-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0128.apcprd02.prod.outlook.com
 (2603:1096:4:188::20) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ2PR11MB7598:EE_
X-MS-Office365-Filtering-Correlation-Id: 0934d92b-b2ae-46de-8595-08de21fb57a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LIH1Ff6W1IoWPqO4R3ehTxHy515w513k0wclL0yFhz5LSWs7FIhiVX3HnD18?=
 =?us-ascii?Q?cKEdaSRhisvFItZpgCQks1EA1R9hAeGhPs2kKBbpCGFeDSBb59H70EmiE457?=
 =?us-ascii?Q?PoBFFiyoCNYmPD5hi5aJP+JHNPiMnXW54UYiMtbk6Eva60u/5GiB62Vuwt28?=
 =?us-ascii?Q?fg0lTOVDEAwn+BJNzuCfClWDlYIJKd7iI7zhGB670ahoE/4Gc/xtGbqKyFkl?=
 =?us-ascii?Q?jtzVs4QVyc8kz2kEHBQ+5F10h282R2GWQUAnVkuTxHtS1lveGWzYQt/+/PVX?=
 =?us-ascii?Q?73uwOMEyZulT1t8zhrcD4C4MhO4N0iqRX7d3inPTQFKlWFiMoR7IOKL9tO0Z?=
 =?us-ascii?Q?gcK9VaCutkuUurjmGfkAxyd3A9ubKS/FaHOO3JFQcVf4/zU03rp2ZZ3hDRDI?=
 =?us-ascii?Q?7xBCbam26ePhZ0nUlphpJGAGRv8SXXA2S7BJ0wu6rO/Pu7e1lNqvKzBkKse8?=
 =?us-ascii?Q?kyD7LSdtVd+rLocDpzQ9ienaicVYsIlgVrP1LoJbU2yNK1WHqZkurNA06mtv?=
 =?us-ascii?Q?uLmqTkFyAToaJf9PKWHwiz83AI0hQ08BzjprrDPEXkapVv7X/fcXG6ajdFPZ?=
 =?us-ascii?Q?+mcONaRf+8cJlUbFAU9UaD0hgI3RIabLywWS4rf5tYTbuWFsFJrRECj1rFTO?=
 =?us-ascii?Q?HejJgU6gCOCJdyyWYYCB6EsJDWow8OuPFQ/SK3T6aEmd1F2cAg5qhn3DcRbX?=
 =?us-ascii?Q?q3eqAkmdSJrH/N+Ztp3rfa/2wGDgV1azDDu8XJNMoE9pAdy087kRIHloU0Sm?=
 =?us-ascii?Q?bpiASxITpCN1l5riYv421MKF252VDaHyGa/2NrHYvsHiDoWx2dt5BNtCeEpz?=
 =?us-ascii?Q?Pz79xqKaNeUeuzROMb0eggXlWPgm7X92Nxh1ohaCLCt4gCocZKJP+LwZ0+Ac?=
 =?us-ascii?Q?FSgRty7vrEvARVljbT0bIvfI+jKiKJqMBz3WlbYTeFBl1ofxL6GUG1Q2k6Uz?=
 =?us-ascii?Q?79gT+mGUHPUyL5BbE/43LZJF4T9bMqFogz15/sROsfcrtcNaj70y3em5Vbm0?=
 =?us-ascii?Q?gK2Cd0Iq3G6vbYYrIbThMhRrclJmZsjD6ZYqOj7mjuCUbGlibm6d0D5P8GmT?=
 =?us-ascii?Q?fPXeSN60Yk/tPOkyZdIgtgI+rg3p2x/hS9PuE+Zigy5RGcfwNIL8TiBgIR9s?=
 =?us-ascii?Q?YKfj+FtbdduAsKNISS1AMbzOmn4H3Lr7zRJ/XLmeH0VsBfKpRgaBE5C9jwJN?=
 =?us-ascii?Q?BfhX6rWYA+VIQgVKWRljvt+qwxTGmCaXRSFg3Qi+Mc2HyC4/jLDOtqoEW6sw?=
 =?us-ascii?Q?iunQLsLT9kodNq45vK0IGaytDtINNo7rQEeXxGZczBtSVS+uIqmHTby/pKSB?=
 =?us-ascii?Q?K9pjMaGZZvBAAIwqurYehiHDsHmctbt5OJSSl9gfukRqbUfInIxvr+R3UR57?=
 =?us-ascii?Q?V57aNZH4fQaxVmQYbEoXfSm2DLbcUis4u/kwE2dn0SjgAvfDnR5exdb8YpRn?=
 =?us-ascii?Q?oErKq4GAFA2KAYLfTKyVg8ljZRp3UXN0srhJbOm1s2H9VNJ0iW2V2Pm0ppDF?=
 =?us-ascii?Q?aDRCQ0gM4K2Vplp+f1lE77yzaDpL0BU1NYC5?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0CG8ozpA8Z67hPlTHkggWqsPaIgvjpsuulik0nUYUVPZFBID4nTbATiddIG8?=
 =?us-ascii?Q?WFW5hLuoy7QsneDqWKvcHCjRa2u71XgPKrgeT9EyZZWlNrZNqdLxntqy0Fu9?=
 =?us-ascii?Q?vWiFxM4MQD/tOY0Wu4m5PswzP1ITdfvxfteIVSfebTZnRUwGOnxERGocs4VJ?=
 =?us-ascii?Q?iF8n1MSmQWCR6XVrLeiRsquhmhCLpfHRyFT5KK5EAeHADIwr/zm5pGrVvnMI?=
 =?us-ascii?Q?41qQJN4bT2WhievVmiwnigoOTbiAsXvB1EDrUbfuqCkCBgdKujyh/MP5wnKP?=
 =?us-ascii?Q?2Axrr+6Hc6ets2cU8Bwg2AdoQGgLRooYzVxIe6Vv2zRqy3/kOxxtynGyHRKS?=
 =?us-ascii?Q?9xHxWJG98Zn76USGelhWM0PE++pH1qnaGArP/7VeKnMytbP3WZaQaFRjKXFl?=
 =?us-ascii?Q?69XUPDOwrrckLjc52YP8DpZg1EUK/RSOmsJUerjFbOffld74O6JJwDBN/H2H?=
 =?us-ascii?Q?FIifXWAW0XtnbiH/GdKo4Zu3BETUEgR1JuLsnLUpGdhpVmWP+3ue4R9Vuz+K?=
 =?us-ascii?Q?1HZYuBoVqDN6SdiczGYaa6tSyuX8sbf2kg7+BOvQKAZvZyMujaZa/YCncIi0?=
 =?us-ascii?Q?Vvze1N628PvR9yA/WtsyTn5EeCkwhBSG49CnNLYTMRBxRUjYQWIpqRut/K/c?=
 =?us-ascii?Q?gIskh9fmuPxwUZEBnKrP20e0LOl02AEXLQaGP01hnejHoHe8epqr572gkRHc?=
 =?us-ascii?Q?OTIfyg0HAHMPuixRktk3ASQQKHSYfkusrgrcA8I7J6YXrji1SjPOD3JaQYD0?=
 =?us-ascii?Q?gHSAsUqnMB1AiPn2XHO3hj+PVSwXPDCmlwHVQ9rGC4ZRPGoNmEubGCer+KT3?=
 =?us-ascii?Q?MrZVu4L9Pyfyv95abNBWTSpj42xjRaZ8kQj0Fdd42DJFTRs3P+GmTb+zhIPP?=
 =?us-ascii?Q?an6oOSrD5y+qXgOu97sGTEOkI9qoC6+Yv0iO26NnG2a1IyYpvgmAe4qD0tRu?=
 =?us-ascii?Q?XcuG55hyv7lAES2KgySvKP1QQ6Ce7aRXczLec4UiGeX7H5mBLUoyWQ9Iu/DK?=
 =?us-ascii?Q?gk+8goXkyt+WhS2rPOpIkfi+wR0y3b1dchLwNgHkfyj6Ss+cgTI/lBGD3F1M?=
 =?us-ascii?Q?JFS7b2lF0YT1R9/Haw6yw1IxBAOh0iRtFyuOdnZ4I8FdSK/ZI4+zs8+inb1R?=
 =?us-ascii?Q?BYiywJqZ9F87MR10QTQlk1/K6fjJT6AZLaQ+310HSye0vxpBQKMCxLEdVpRm?=
 =?us-ascii?Q?EKXXehbSOJhGT4xcAq/yIrVPLggFes/tkDi+O1Up0e2z1L7yqpNc/95MzLBg?=
 =?us-ascii?Q?xOyGa2FDeUoXzUlhaeOqKjEP9q+ypchf3tdbx35yzfQrV7yIYHoITZxkaged?=
 =?us-ascii?Q?Lfnc1UCSQDJ3jWGaqRxbqkA+QlX0POm4zpksbMSiXrku5afnTbqlO7sBXaLJ?=
 =?us-ascii?Q?Sxx2TJqjWEfT/64ohtPU+XLyKZx8Ec7oJApeqjNcxi8S9Z/H3IaXki05AJRJ?=
 =?us-ascii?Q?Lp2txtC3el2lKqvCwiwMo+oXvmknKgcHppGuISrZCaJPYisExFYYcWyHI20n?=
 =?us-ascii?Q?aephuXvn2msL4J7PujSdKYxR2+mb9BkgUNL9M/vzAtYUdSVYjyvEVQ6sphKr?=
 =?us-ascii?Q?7PixznwiDKVLXdsKNXPTBEURgGm1jEgsrsQ5L/OZ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0934d92b-b2ae-46de-8595-08de21fb57a7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 14:54:12.8347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DQj7mOEe6LwNa+2nxmUT//G1TBoGENN/LzvuOeMoy5ajuqrlbcKWnoKzdKlySBnRZ58hsxepeYrkR/XI6IRQwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7598
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDEyMSBTYWx0ZWRfXy2Ey08jdoxQ1
 7kr39yIw2Cy1TG9JViidgPfttHoF9Y3tDFUO/zJ9ZJTPHOo3N4EHJ5AN0gp7rprg03BmL4ESExL
 lxvELc87IYQtohXkyvoNCyVfEUO2YOB+MjMuAn8jFGeLGm0W8MgMOb6fFwWUwbP9URID4qes53P
 o/4qM+ouBvsFor3LUpN2V8KdXYYlgrssE52kcZFi/rCexsIrKCaulXGFFwfQfUytx/uuEZjVLi8
 oel4LHshK5krsoioDspo9dF0rLzCaP27OZKTqbLlKCpz8sYcGdQnWQvh+VmGhpUf/zZpSTbJSLF
 V4a4S0D1hSvcDiLuJHvGCyVt9rI2OaQwZsC7nNMnaf+sLOHrn5rxv/OBb2JvSwCgAkHnMLBGBCb
 CChRtvtXK6XA1xuZaDpcwLU6jHPNiA==
X-Proofpoint-ORIG-GUID: eaMMWqoiIGbBur-9R9EZeXMxLrYAanh8
X-Authority-Analysis: v=2.4 cv=XPA9iAhE c=1 sm=1 tr=0 ts=6914a0c7 cx=c_pps
 a=2E9rO6gqkamS8B1JEYjvvA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=LsTSizDlIOIG3JWFAr8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: eaMMWqoiIGbBur-9R9EZeXMxLrYAanh8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_04,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120121
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 14:59:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121560

Add UPSTREAM_CHECK_REGEX to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version python3-cached-property
INFO: Current version: 2.0.1
INFO: Latest version: 1.5.2

After the patch:
$ devtool latest-version python3-cached-property
INFO: Current version: 2.0.1
INFO: Latest version: 2.0.1

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-devtools/python/python3-cached-property_2.0.1.bb    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-cached-property_2.0.1.bb b/meta-python/recipes-devtools/python/python3-cached-property_2.0.1.bb
index 41211534b5..c5baa6fc93 100644
--- a/meta-python/recipes-devtools/python/python3-cached-property_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cached-property_2.0.1.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=db7ff60c4e14f58534201242803d8abc"
 PYPI_PACKAGE = "cached_property"
 SRC_URI[sha256sum] = "484d617105e3ee0e4f1f58725e72a8ef9e93deee462222dbd51cd91230897641"
 
+UPSTREAM_CHECK_REGEX = "cached_property-(?P<pver>\d+(\.\d+)+)"
+
 inherit pypi setuptools3
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


