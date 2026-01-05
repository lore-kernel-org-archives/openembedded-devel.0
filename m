Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD9D8C79FB7
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 18:14:02 +0000 (UTC)
Received: from mx0a-000eb902.pphosted.com (mx0a-000eb902.pphosted.com [205.220.165.212])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70766.1767636388135641103
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 10:06:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=deruU7Yo;
 dkim=pass header.i=@garmin.com header.s=selector2 header.b=iHlRz12P;
 spf=pass (domain: garmin.com, ip: 205.220.165.212, mailfrom: prvs=6465f1319b=colin.mcallister@garmin.com)
Received: from pps.filterd (m0220294.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 605H2MAD003254
	for <openembedded-devel@lists.openembedded.org>; Mon, 5 Jan 2026 12:06:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps1; bh=Uqmh7
	U3M9kG8efEPcJQ+z14TUN62Gfh4t7Pu8iADOHI=; b=deruU7YoLcuNckacB4You
	aJlF1SuGmOEh9xkJuP3QZ6j+JvD8yf5lDH1kHCXuAeBxv9sMxqG1DbuyKkttsACo
	ofdi78X9fOaGKsIqbrPfIbVcd3OrGyYJYmy9+UHgMlEizLSUNy6BZajSbUJ4j4lp
	ZSbDOaT7NthTo/or91YBuT3HWDC1KsLNfP7bfFnWgxmMhhdTlGenvMPqLE7/9p4A
	HvtK9OlVdF7x92Gf/NReBn6KagpI8I27BEwebm/QqLQwqHVWVuN6NHRhkfPGU+UE
	9bhYrCyC8gj+Hrai+nwiE0aEG0MpTJ7Jl2ddRzIvzK6quGl+oFhyfGKMXAtRn+yT
	Q==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022106.outbound.protection.outlook.com [40.93.195.106])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 4bgbkt8vbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 12:06:27 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DdYVEORe0fAYPneUCeB7IWewHPaJqp/dHF6sh/l3E+PHKBso2mRThtCQtMct4DHyW2KnP6PXnaRpNiOxxLvu1rhS77WvzZiFFL/wMAt+sZ7o2VigC1YGM0UTgXMKAIO5WayhlU+l4kVub6vQe6Xs7WA9BZWWLrUFX4O3nFCYwP/rxZwqoUIctiNX631FLSY+UBh0WOIeryY5wS0su7tMm1+VgSsgIOtJ8GluUoqpGmu8I0Y0X5wndYu4Ci2+7veE3Uj6lrT1Imqhh3XI81aQg9/qFq8zINWtAVRgR8tlzFXQn7NdsVWic5/CLnJPLC8mrGXQLkuUb9Hg8rTAQxWz3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uqmh7U3M9kG8efEPcJQ+z14TUN62Gfh4t7Pu8iADOHI=;
 b=NiomRbcgF3/X6D+2WKhfn1Rp9loaC2RLY62eikmXGTxMSqiRfLVAGYzZXCzSgobfYJZ3Rh18740CzGURCCOjYsbieZ8eCd3fjkLWzrDvOxQ+76lIED+ujycEuG0vK9V3K+5HQ1wuVRwvtoUQtImWJIBM+Kk67zUvvLvZrND3rjH/QrXnogUkxw3z5oMgKG/r8Qs2ypwMwuA2rHRIvgTcTk/Eey5pH46oFhoT4b7BC9PhUsWaSa6j9fXMFq+FZrV5HY43egMMDVrQPhGjXmSWXnHiZycjM/9ngTymZ+DzmWMyegfuKMpQjuJn0m1m++fJIMWKKXWjMSTVNSmkubnp1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=garmin.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uqmh7U3M9kG8efEPcJQ+z14TUN62Gfh4t7Pu8iADOHI=;
 b=iHlRz12PU2tXsonK9PavuCqs36UsQl2iVR9o1d8+BILW10Otxey/qn/8xU9Wi/Dgdhj+RultNzh2NP52aQW90WvKHgvLJ4A1S9ONtJ0+uitQkDtB6SPGXgIunSqGd7j1gUVnJLXDYFS9URk2piM76hfV54h2EMpRR2Oa046hhQh0ryJX2VJuuWNkCTFcye1aQXq/LBtOAId2vU8O13aW4AQ+gTGwVOX5c3qua+MZgCQZvqkyyJHxp60n0n8sjBmicqzN6q3GCq/Ie+3kvVmJk00tBtyDhUcaNrA5S7KF34zqxZ0s4p44CSqaEW/cTo9uASbdwQ8QEmSEp8T86o4Cbg==
Received: from SJ0PR13CA0127.namprd13.prod.outlook.com (2603:10b6:a03:2c6::12)
 by PH7PR04MB8580.namprd04.prod.outlook.com (2603:10b6:510:2b3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 18:06:25 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::3b) by SJ0PR13CA0127.outlook.office365.com
 (2603:10b6:a03:2c6::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1 via Frontend Transport; Mon, 5
 Jan 2026 18:05:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 18:06:24 +0000
Received: from KC3WPA-EXSE03.ad.garmin.com (10.65.32.86) by cv1wpa-edge1
 (10.60.4.251) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 5 Jan
 2026 12:06:08 -0600
Received: from cv1wpa-exmb1.ad.garmin.com (10.5.144.71) by
 KC3WPA-EXSE03.ad.garmin.com (10.65.32.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.17; Mon, 5 Jan 2026 10:06:10 -0800
Received: from cv1wpa-exmb1.ad.garmin.com (10.5.144.71) by
 CV1WPA-EXMB1.ad.garmin.com (10.5.144.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57; Mon, 5 Jan 2026 12:06:10 -0600
Received: from ola-jnrkg73.ad.garmin.com (10.5.209.17) by smtp.garmin.com
 (10.5.144.71) with Microsoft SMTP Server id 15.1.2507.57 via Frontend
 Transport; Mon, 5 Jan 2026 12:06:10 -0600
From: "Colin McAllister" <colin.mcallister@garmin.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Colin Pinnell McAllister <colin.mcallister@garmin.com>
Subject: [meta-webserver][scarthgap][PATCH v2 0/2] Fix CVE-2025-23419 for 1.25.x
Date: Mon, 5 Jan 2026 12:06:04 -0600
Message-ID: <20260105180606.2192902-1-colin.mcallister@garmin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231153607.3978985-1-colin.mcallister@garmin.com>
References: <20251231153607.3978985-1-colin.mcallister@garmin.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|PH7PR04MB8580:EE_
X-MS-Office365-Filtering-Correlation-Id: 2547363b-89e5-4359-8900-08de4c8523b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zHwIrzu8rKB7q+LKhw4CH8MVefkmjZEz0zofza6mgLUOwz4R10Ri9irw9iHI?=
 =?us-ascii?Q?gBoo2FaJr7sRz0zEnvPZ31R2Cq3HX70UWoug+lIX9PWjbbyjxE5GLbxL8v6Y?=
 =?us-ascii?Q?SU34C1UGi677Bte3xtFACVfA1qvicldU3VAjQV3oJKrgNeO5EFmhpFev1ZDg?=
 =?us-ascii?Q?BRcVZQ1yrWEryEseZFS1tuGP8dkvXcLt9wtg9aeD5UQHN9D/8jPhzJmmL75D?=
 =?us-ascii?Q?c80hbCfQCk3wXnfSh6jbvHkyLdR6FuA3ute5B24vBwsxFRaYpAw2/ll9sigQ?=
 =?us-ascii?Q?2CCRGBdd8597BUunz7p8+YZMPj0sctbYZnuvwrDbnqs/OeuXgKSLza/+qgEi?=
 =?us-ascii?Q?G6m1ZveIiATyJJDdiWAm8Z4cogAx9DYlFq5S7U7QAWH2CaX6VHumntklgpA0?=
 =?us-ascii?Q?/u4ammZG/+BIVwOYHxEl3Y1oykTQZNQtkRRZY9eAmo/lxnzpeLeYhDzXcIM4?=
 =?us-ascii?Q?7GXxzjQPabwg/xQx04JgMrE2Dq8PXmKWXaEG5gsTi+gllEDMObVfTx5dECh7?=
 =?us-ascii?Q?QKQWretAWF/bQMAMaW8NOFVnDIKpCdY+VEPUd7BWStbmDME4WZ71vwxg7Fxp?=
 =?us-ascii?Q?grcFVFQC6ZKm70u3WYhEJNCuZXovnXPqOZlAquWJmbrUfFaNwHKZXLRwiQYG?=
 =?us-ascii?Q?MONOOnHbKfRRR0L4N82rtGHMrqeMuYHDHld9gH5SKUNpIqjemZJ8EbRBgZLX?=
 =?us-ascii?Q?fOsl5fLWtQIDK9bkpRoYwqPhN3PZvqgJyA1SGL058mQd15FpR489OpbncTZa?=
 =?us-ascii?Q?ThqZz+5paKY/VVLvdSJqhPEr9Vzl6mi6zWs8q/I707uSeKt6pF4CoJW2/d4T?=
 =?us-ascii?Q?Wjk1oZqDA1+UDnENodh/fu4WFVmfWBdxE1JX+Ru/J0x3TRmKN7UTOOVW0JFo?=
 =?us-ascii?Q?nhVSeLCSy2lmSykiwHYQl6nJzA0e1bVxOTEe5ylyaMLX6drHDoTXSu0CANNp?=
 =?us-ascii?Q?b92E+D2DqtL8QQNTT/ndvR0opIcpLDs23JXB7sBNth2tWFQtztnreQzmn0ev?=
 =?us-ascii?Q?2e+gsFVNJGjwfP0NiJ2tsoH7FjPwVWGcQbJdrOhVqm/3CPNdFJ/LTMM77uVy?=
 =?us-ascii?Q?jQaIHWVnu31k2wrAbTW9qEI4Ze3SJEc3cs88WUiTTwouPFP7miqeSgzz3Ovy?=
 =?us-ascii?Q?90tqlLUpRR1IEuw5jfjA4VSW8ZkDQd7Q1VFzMxZc/KfWfQyuWCxafIEYR+ie?=
 =?us-ascii?Q?3upqEgvspnCKoThNlrR7/8KQjRnfaW+6K93svu8nYm3uKUIGM/dSKahyf55g?=
 =?us-ascii?Q?eMIWqfMYCc7eP6rBJMRJPH7vV6YEPy965pUuNH8U87BtSvjst/h08OpZyThG?=
 =?us-ascii?Q?pB2HQZ7xWf7iuP8SLpRuzs/Bfz8j/7KcnGraVVxQALX+UvLolLQKnnklDbB+?=
 =?us-ascii?Q?BbxByvojL1arIZnUB5WAyJ/uynghe1XTZfga+NmlvxjVpVP7P2gLtbv3/PpC?=
 =?us-ascii?Q?eqPvDSQWnKReACY4xrJY6YKoGKhcXFbyNGOFzx+kJUIugWzcOo0znAigaodn?=
 =?us-ascii?Q?xdnek/Bx6PSLIwsnv+NS5W/u6WLdX6p/TPxjLYwSgzB8dSuxefW9X3W3jBBJ?=
 =?us-ascii?Q?PM4FRJJZ88AvDG9OjKk=3D?=
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 18:06:24.5022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2547363b-89e5-4359-8900-08de4c8523b3
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR04MB8580
X-Proofpoint-ORIG-GUID: _Dvp9EN45GgxtwI2F6jo6ssVcOw3VVYR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDE1NyBTYWx0ZWRfX8bGFLaCbHASz Jqul77l2IK958ywcXKK1PIzgJIWv01Kf5j1V+may+CTslhmck7vyRxkp1REz4IqvUtc33oX62sf AOjsWoODbKW6OKf0iEpd9NOHGm71A2UwWgQh7AjWaaVrrkJu59KL/eEZSDpSnzOC7ZDgnhvBG6I
 xSrIdLc955SrQW/y9xbLHsnlb4nhI762qkxD3W94w3zlH7H5o7O48JeHNqlltGrh9FurFSvZo8K sT++Kx9ceFOlm/U3VdeXwkhJ6u/trV86ovTLhZQfhEuaBbDSVQC2ETOgxmXM0Drh3m1xp5JMlJg sUbT/WT1NRnFi3nx46A0miyuARjE9sH623McXHZPtHFBTwuY4zdAaAWxNEiRaFa4z/kVLZBjFrb
 JljuKLlQsQxHOCIpV2EpYA8JpNP/I3ya5M6N3FtrgB4pQmm6gDIQ4WzsHDKpqEAUPJvwkFUlXRJ I++Xfuf58+uxOeHK7CbkoGZkEz7KLQjYmXDewbCg=
X-Proofpoint-GUID: _Dvp9EN45GgxtwI2F6jo6ssVcOw3VVYR
X-Authority-Analysis: v=2.4 cv=dJOrWeZb c=1 sm=1 tr=0 ts=695bfda3 cx=c_pps a=njBiJbAQTUgP4Zm4Bb3rbQ==:117 a=YA0UzX50FYCGjWi3QxTvkg==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=vUbySO9Y5rIA:10 a=qm69fr9Wx_0A:10 a=VkNPw1HP01LnGYTKEx00:22 a=ezJcGdSBdXJ7H69gWhMA:9
 cc=ntf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc=notification
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2512120000
 definitions=main-2601050157
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 18:14:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123159

Fix CVE-2025-23419 by upgrading nginx from 1.25.4 to 1.25.5, which allows the upstream fix to be applied cleanly.
It appears that the CVE-2025-23419.patch for 1.24.0 can be applied to 1.25.4, however this patch is a modified
version of the upstream patch. By upgrading 1.25.4 to 1.25.5, we are able cleanly apply the upstream fix.
Since 1.25.x is not the default preference, I assume upgrading one patch version is acceptable.

Changes in v2:
* Moved existing CVE-2025-23419.patch for 1.24.0 to "nginx-1.24.0" dir.

Colin Pinnell McAllister (2):
  nginx: upgrade 1.25.4 -> 1.25.5
  nginx: Fix CVE-2025-23419 for 1.25.5

 .../CVE-2025-23419.patch                      |   0
 .../nginx/nginx-1.25.5/CVE-2025-23419.patch   | 119 ++++++++++++++++++
 meta-webserver/recipes-httpd/nginx/nginx.inc  |   1 +
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |   3 +-
 .../{nginx_1.25.4.bb => nginx_1.25.5.bb}      |   2 +-
 5 files changed, 122 insertions(+), 3 deletions(-)
 rename meta-webserver/recipes-httpd/nginx/{files => nginx-1.24.0}/CVE-2025-23419.patch (100%)
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.25.5/CVE-2025-23419.patch
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.25.4.bb => nginx_1.25.5.bb} (74%)

-- 
2.52.0


