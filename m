Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A02CEF173
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 13:04:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8662.1728392660568333133
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Oct 2024 06:04:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=001195aab3=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 498C1D5J004952
	for <openembedded-devel@lists.openembedded.org>; Tue, 8 Oct 2024 13:04:19 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 422tp438qt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 08 Oct 2024 13:04:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vYFLN0Fg+zpu0CWSFBFCEI1DbwSQ9aW4pqp/TgRZSt4Dp0U29TbMZlOBKvtCC0KYdqc3yeLIV7aC0A3s511CdV87TP14yO1Kqm4+KiM34Ypeb+pdsuvZasBn90XXj+3TPPOotLufnOUxtItFUFlSyxPrOwnRD+GCU3X3GIuFenr6icp1lss40say9FtZOm8vLj1R51oUaicLbBtiZYQTMZ97gkEeHLuuxGGj78cF/nYSBhiMc89V83n7Bhl9phTy8/7xlCVPI4D3zFWY1H0VS9DcdVjMOwFOOCHwu9b8pSQEIyt51QtJj4DIQ7ZXL/R+QHTS2GBPS0G609EWFXrIPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/j6y4lGstzERkFpYhe6MhqA+Co6zzaPB7dWClflcLY=;
 b=l1cvMTnIr5ENUm858Kdj0Sg9Boh6X9xPWCk9Ynz/zhgPIsIXbwEE4I0aZQkv9myD82kG3Kx3U/WS1JOFPf4kixZjqlQPBkT7QAwLepOdOpaThPe4uYZ79PU0WU1/yxuyrT02PcYi+hJy3TN18GXOv/nz6jnkBoOfGvAMBIjngfLdCbIPYUCujNbzfAkS1mPt+EQSJbN1AGtjHd5BSGIj77Wjja1goieXUmKSR1xHbAFvEZ1/PRRn8M4AooFWWOR6Yx7S2a6sXd+hnzgveZ03TkstauLw1QwtmbKvaKUdt/bbAEFHwszhGlycZzBpUvUwixcmEytFTlnVCu4yBk7zVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by SA1PR11MB6758.namprd11.prod.outlook.com (2603:10b6:806:25d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 13:04:15 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 13:04:15 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/2] python3-fsspec: Add support for native and nativesdk builds
Date: Tue,  8 Oct 2024 21:04:03 +0800
Message-Id: <20241008130403.11585-2-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241008130403.11585-1-peng.zhang1.cn@windriver.com>
References: <20241008130403.11585-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0282.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::9) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|SA1PR11MB6758:EE_
X-MS-Office365-Filtering-Correlation-Id: 66fbf63b-4345-4a33-a513-08dce799b61c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kzfYdl/BZYWGTQaCiRR3yvylRE8gW5Wp6GFep2glkcq30H+uUk6eBHyGSNlQ?=
 =?us-ascii?Q?VywTd0FH8BGWxQ4c3K059+LdVy/KeVLtWEOcUKbkREvRLZmBjH3FDK65q3QC?=
 =?us-ascii?Q?axJXONYxovGIHeoaTjoXqYhAhnJ5+G/HA0ieOQAjFVaDclUi008hLKi74UU7?=
 =?us-ascii?Q?CtvoBg1Wy00gjFxan15IMe4ntIHrjlduC9AVB1njxc8CmBaz/G8+kLNr48VY?=
 =?us-ascii?Q?3SbvsYeEhEWKuoekgbHDGXDYg+gIQ1uhORrF97Ofx7p9Sm3QzZPjSZ+/zBxU?=
 =?us-ascii?Q?0fugcJA7earsRBRps0rA5VchtkVzvUVoqjTeFFMXkdmmOe1qhZvd0Ej5m3ha?=
 =?us-ascii?Q?7bBjYZc1z41nF+ZzA0+IKpqZ+848HJjBtmHYWoeutgiVGCOCPou991QKyM/W?=
 =?us-ascii?Q?VLeTQ5MWWZiU7d+wJe8RCSEi4r+Hw+8c4mpbMKLhtga2KdJyxICKu5P6Tbkv?=
 =?us-ascii?Q?LOuIIKyw88jagaxNO44qFSzet05NJKl2n63aYziqcCMFgPVYVIQadLrAqWHS?=
 =?us-ascii?Q?HY8dr5LXTznlPHVOFw/dXiMXdxOUiZwcp15JBBaNS1HQlANszdH5D4vmwnO8?=
 =?us-ascii?Q?n3pVMJs0VW2CsZnMWydTqdQexJMMMcD328pfsTEDYPW/yhGYum69DqAl0sRE?=
 =?us-ascii?Q?/EGNqdhGJ30wHLEuAObcHWCO+BKL1hJVIeFaJApKC0hvTqnEk7EPwPEpYVzD?=
 =?us-ascii?Q?pkWP3Vm1lyrvhsDBEesDZVVQ5ZbCdpKtgg0UnC82svbKfsmwxUEi1+m+jU1k?=
 =?us-ascii?Q?9dTtowteK0u9m/UXBkd3liiXQZtHTR0vVC+kFYM77r2bsg564zCf7Xe1CGc8?=
 =?us-ascii?Q?ww3k9YG/Mjlsz/KP74ZGxPj1hBnYnvoHzOjlx9hBbW2tSv5X2u935ImEkC55?=
 =?us-ascii?Q?Q27yaqOiLwjCvCkuXPYyGwgVVJv7K3bLClvtE8nxY/R35lcskj1WE1DKh1M5?=
 =?us-ascii?Q?pgdW+0wAMRuOzspDc92fMI/xmnoURCnReUI+/qFlM6GnWdI/u4jkhnvyy9X6?=
 =?us-ascii?Q?GSMPi9edDQaa3RVzIhWrtnIcsl1kmSm4YRHL7K46YlsyHCpl9MHfKW4klLIi?=
 =?us-ascii?Q?NCbT93R8VLVTBn9fcEOcaviehxoDUZbqqfZHk1or7G4cTGOGvJelwbT6Tica?=
 =?us-ascii?Q?Gmyfmnxe3ohEQsaj0XYLLiiH59G4V4NA9k/ErqZE5sYxv/RpckH/z8WJd2cT?=
 =?us-ascii?Q?J8tjb3PZ/vzYTlJuGZlRgW69HbfGUFSx7b1Fq6RDFr9VUSJCikE1ifuMvqJd?=
 =?us-ascii?Q?wWHTsSHaljniTBQVFlDJ1OGk95ZSM0kLupIxiM1J+6pvnqIg+cLQ+IFZvfIS?=
 =?us-ascii?Q?u9JtPV6QzTD8+M6FFYmACoZIMmAAW7xsq/w5YFvIfbdvHQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sOTi/tLpbIt6WXlqzgf8gd1HVDFIqrbq8fPQJMbLDRBJCuZBwunM61JdO8m/?=
 =?us-ascii?Q?wStHAYC7Hs2YlWA5yiiH77B4EfpnnmSvyp8jTHXILuQQovuqa1SZWmoYhbrK?=
 =?us-ascii?Q?3H+GVPcq1vf5SHokh8Jw5B0VUdv6o+KRpPCNo/GHaPtkmrcSGZT2/KNdqpUS?=
 =?us-ascii?Q?tVcUNazJ7lOwRkXviz4gfdOIUQz1H5UCj51XJM7QLeLRARSgJNuMQLOU8V3X?=
 =?us-ascii?Q?VUWEQIkQ80n9jFNKQGFGBNV51/gsgJ36ViLEI7eU1eMvYax27G8+7ygpIRIL?=
 =?us-ascii?Q?frBQFFw7+lWaVFNg35XyQ8LN9tZYB/Pe7yhRZS0M0tmWbocZoAOu1JNAXv1B?=
 =?us-ascii?Q?7m8x4B74Js44AbA1RO3WQ5VrHr7zF8yeKyO5Rsnw9PccNKLzWV2b3BM/4xzu?=
 =?us-ascii?Q?hmLcqEQso0hXvYy/HW9KSWvNZzROO4oP9ZMF0Fa8Okg06hU3xdNl3Ni+JBe3?=
 =?us-ascii?Q?OKcntPcr/gJ5qnshByhCNVEjnv4Jy06s1aRIA0IAKRyALOqWzhqRuPvkUBAp?=
 =?us-ascii?Q?2680q+EQsNlTl4G4vWu7uRwvSTed42QUNs2o/fWBT2goez0WClvD7n2zRETh?=
 =?us-ascii?Q?rfCzhS0h9JzByfMQHTO51OzwyXGl9qdDG9E22lSkkI0lXZzlvSplkmIfcvLQ?=
 =?us-ascii?Q?dmh9haaDvEpf3NNbN29suyoqwow/Ad2bXCzTMvwbnoRHUmPqLxgonq9t5330?=
 =?us-ascii?Q?LRGjUgH9v61+nrnIdto6LjUL0m8Gn/Ri+KpSyVG+jWk7yXToO2OAmZdaIw9f?=
 =?us-ascii?Q?qLgGpQ/7S+AA+h7pRuZ1SXqg9V3OA7M+pKzNv+fOvNWhidpfV+Kkstz192zN?=
 =?us-ascii?Q?0MDBdr2ytM75SM5wlRFpZPgRVVeMYkblh8jSkHCLc/uE2tY2/NBDEIxTAZNA?=
 =?us-ascii?Q?AjrId7QEzJADQxbfi67mg+/rmbK/KqoIOPIeoTW8P2G90vRK1Xpj6fZ4jsVa?=
 =?us-ascii?Q?1PWdEmtbcQheg0eSYJD/+JE+y1uNSFfFhf6o9ni1JV70j//9mderSd3mGk6O?=
 =?us-ascii?Q?++0VpYGJuulgocrv2GUkRWKoz3jaQxQHyUUBHcoByXuKcXAhOEmCYGmAez/C?=
 =?us-ascii?Q?B7BW7T60NFBsNts0Jvk5mGLVggSGd0x+eZrvlheYFzWgrPcz6klsPcPsBqk/?=
 =?us-ascii?Q?qSKIP20NJqIvgId2JZG62lQbJAc101xRPTjl9xGWZLJR4/Ob9AxqCFLCvDpV?=
 =?us-ascii?Q?IV0qt9KkjPoPQ7zjpk+fDmdLJ4yGJxveHj8fHRf6N//pPpCcmGXDNP+mDJze?=
 =?us-ascii?Q?uSJg0eDBRmsohVN4g5qbetF+Xesu774htXgmOMENZiltls2Bv6fCY/yvx+8/?=
 =?us-ascii?Q?uj6M0nNSPj9rgaJQm0eOmMt/AdagYdvFhBtyhLOSA51jGobKIUrflmpvVpGu?=
 =?us-ascii?Q?CEHiDABubYXw3Qo5okluY4Lw1TeaexEfkvgJSRkprI+R4EEEfB45foBUdDMO?=
 =?us-ascii?Q?8ncNdA9j3QasPnYaT3Xx9OVtM/4Nz+P49pakbp7PqL182OBuwfN9SC4L7OAp?=
 =?us-ascii?Q?e5aZrEqPFjl9nx2CuE35DgAKfJ8R40lN6Ek1ePtm8NVAme24D5Omd+mSPeGL?=
 =?us-ascii?Q?zoeNu44+9uMMeHgeBmBz1lix8RQE3LkW8EuvnXK6uBAloVoB1Au1JJugkJ7+?=
 =?us-ascii?Q?6A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66fbf63b-4345-4a33-a513-08dce799b61c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 13:04:15.4111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ricWXFJAq1M1WvKgAz3hdREBTIGUT/kPpPNWbYL+kpIBXB+mu2pq3PUcSPfE1UfgiWf7nSdddCI/8IDpjrTASkhm4B+w/lL+YVfARCArGTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6758
X-Authority-Analysis: v=2.4 cv=XPtiShhE c=1 sm=1 tr=0 ts=67052dd3 cx=c_pps a=b6GhQBMDPEYsGtK7UrBDFg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=wsvdAHlgWGGfOnPeVBMA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: WUrjBfahel2UOXLycIThnXjWaQuv9xZD
X-Proofpoint-GUID: WUrjBfahel2UOXLycIThnXjWaQuv9xZD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-08_11,2024-10-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=959 malwarescore=0
 suspectscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410080082
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Oct 2024 13:04:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112715

From: Peng Zhang <peng.zhang1.cn@windriver.com>

python3-pyyaml-include already supports native and nativesdk builds.
Starting from version 2.0, fsspec was introduced as a dependency for
pyyaml-include.
This commit adds support for native and nativesdk builds in the fsspec recipe.

Signed-off-by: Peng Zhang <peng.zhang1.cn@windriver.com>
---
 meta-python/recipes-devtools/python/python3-fsspec_2024.9.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-fsspec_2024.9.0.bb b/meta-python/recipes-devtools/python/python3-fsspec_2024.9.0.bb
index 49ca4b3e9..1073f9480 100644
--- a/meta-python/recipes-devtools/python/python3-fsspec_2024.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fsspec_2024.9.0.bb
@@ -20,3 +20,5 @@ RDEPENDS:${PN}-ptest += "\
 	python3-numpy \
 	python3-requests \
 "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


