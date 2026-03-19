Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E375107528E
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 09:56:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7482.1773914168247392420
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 02:56:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lOvBFbS/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=753824cbf9=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5o0C82399990
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 02:56:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=3GQJiySSnUAlUydKgRAG7LgXJUOQKzVCC3UREOXE9EQ=; b=lOvBFbS/Dae4
	GZnq2fP/IrDl5QQ0dCkJ07xf9+bkigVYGe2BXtaUHRVPMhhnY8QIt5QsSu+TLB0+
	oZfX6lU+tJA08OsvtI92UReXvhJbVqUNmsLFm3cxs9S84RDwBBjfkkKLpLNSmK5W
	vdKfPn5BiSxvQ3NEcvFQ4pyquBm53zNWKImd9bsuMM8a1tcWXtBa5qnmvJM9EvEX
	iZR1MaKK+1naCdg0Hn2g/2AmV+sBOrlOv7fbN1UZCOq/08M2eMnB5GE1DIZemA0W
	YI1TurmhK+A2ZYAyJlBE/uIEUrpg93SR1RlmE3JOukwSEcS7p85ir2obvrKLgGzA
	IY4/GymI2g==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010016.outbound.protection.outlook.com [52.101.46.16])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw2y163w5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 02:56:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VlWDujDfJTLwA8SdHUJIt8RqXID9EPZP0Cw3Z/Lj8d4VqE/EOYT4C/ctujK1K41DKIDX2q03BmNTdoMNTj06g0F1rcIyu2ahfC1Cg3M9MBM09cMLBo80fhfgmw3e4bifJSQ3PBYQyJ3N2C1s3uruRhAYo9NMl0rKW5QnNy4uoBEckj4tVv8AU2h2Ve1y7ZdmwL8mkSfv//K+bSGk5hF7DMv22lOhtWHiRjx+gFJFlWqt+k1vNeNRcb8UdWMInbAtawmO3n7C9G8Bx4T+EUIXTosjXdbJyR5bFuR9WtcntRdevKd+WMY9RvwJg74E2MUK07yvCzDFPZN+Rbqhp34VOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3GQJiySSnUAlUydKgRAG7LgXJUOQKzVCC3UREOXE9EQ=;
 b=jB9mncB/g6wCJTvGxAMae47csQvQguIixymzZZgxY56Vq9VHe0Zq0cFepkTi/urlkihdOy1vjkO64z5KRQXRE+12RZfhm8oWCfO0TXKYWOSk9d7FmHOV8wVV04sUYSaoVuLSYqUMBS3EmrxiRgSlKUA2xs6hzhYRprH+KkJHWnr4L3x4YDGZvJNPt/CJKeQIyoT8Nk/OzqD+hqfnBl/3vxkR3WaDoNUARXHSNlsJYu8Z6h+HUmEb7VbByexh1KeQmEpJNUj8lygvSxHrX8M6rO/1A/WPBX2sdQkp2RLrxBp/zpSqwTk6hnhMvteTSA7oBG+82DGzzGqSzWH9vAVvDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by MW4PR11MB5821.namprd11.prod.outlook.com (2603:10b6:303:184::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Thu, 19 Mar
 2026 09:56:06 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 09:56:06 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 6/9] ristretto: upgrade 0.13.3 -> 0.14.0
Date: Thu, 19 Mar 2026 17:55:44 +0800
Message-ID: <20260319095547.3614749-6-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20260319095547.3614749-1-peng.zhang1.cn@windriver.com>
References: <20260319095547.3614749-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0123.apcprd03.prod.outlook.com
 (2603:1096:4:91::27) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|MW4PR11MB5821:EE_
X-MS-Office365-Filtering-Correlation-Id: d010c351-d91c-4795-1303-08de859dbd0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	3b40ipwMl/pbJHsFtZR+HBSg3LKV+eAH6i7PjusXJ9OKhIHZ8WDPeaY4gUfLuAp3LYvgtGUxlK7K9a9/r6+aY0k9odsOBWcrezqvitxd0x4qXsemfm6mGiwdFNA5y1NdBuqlWQMXLJugfIaV9yN9S8Krm5QIryFBaWdJsB+BUtZZlKx120yK36mBMcIllL2U933Xdv3mpvie8i9nJk0qPrMqsd+XH0VPv1U6jndGEUIadaVbUu15YCTmxvsgZO90GU8l9impOl24+2CFwwSqZWvM1u4E7bLsjNwfKItmXrn45puBNwZQyhzBwOT0r6wrScmPCVGUBqiYa5NCXscoAX/way+m9BoP6H89SpvhytEGgtbojJvgVT32/Ho+xVS9q+oYomXJb7viBHyCgorhvUP6IBFOQ9MZfMDuAMpDC1zk3GhHbSs4nGXCN4VYJdu6vkdBrfxSpOBEbemJiNZBNxFgAHG7jGIcjFWtcVpetkjwvKjfjdHGQ4HfUfX6NIhqbFRqyBQkexscx5Zvpj+Fz8iixBWPxmZ3P3+WusTi5Dkbp11JoMR/KBUyrQzKn2n3pvWR9QG0oiowXms6ursV2TxX2zsL14kGarCQGrTMlTTXRL0E9AVlZt0ZCWaGy4YGbkt6eh2GpNgICiCyxuU7ARlm82461+/5E95d+BAWG4OVKS4Mif5VBA7ZAm1pifPqnHjYC4pL9o2eelcZrIiUEPawLyJ9/fQkwEnu/vVmN4/lZ7bwMZePWP5dTg6g2ol/qoWCcRzR6lPBaGhaFUyTQz7U03Xb1S1hnQEsKg2+Vi8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PJ5pwN8jkhuxA/jn1LUAm8JCs3WVvjsiUcQUA+lq4MBoA9rbGPueAxqp1akT?=
 =?us-ascii?Q?rvSuRpNBQkX2FjEFo1sHhkAlATPmsGzroEO6vS2y5BvXxCW9U7BIxB7Ux+m6?=
 =?us-ascii?Q?p2HF7e+jIMRKT7TA3sKOAwzUkuR+aLm6f9u5j7OjyVyZQw+RpjPIm5Sl4A8M?=
 =?us-ascii?Q?UkByZ63bz8hcsZZ3TuBr92t0JfSmy6uVhtCc0FRXVGmcJSE6myBEmtzv2Fmc?=
 =?us-ascii?Q?kX+gDi3WzcaYgP7uZM1BPGHcMzL1cJnpVPQsfHIE8rc0vr2eMpIo/4vVhqi+?=
 =?us-ascii?Q?f8ZWg5fzD7O6mQmzJnyEyk/nbnINTmyht47vngt2q0F8Biu3DRwbVlBpTEXK?=
 =?us-ascii?Q?udMdsUc67frM+VEUUKNPYxrv/2vYcAa0mHKKgveXk3qeo1d08XMASPPkTeDW?=
 =?us-ascii?Q?RtdCfSB596rXQLwKzEwUsjLJ5SifLxcG8zL9Sr1oFKnn2LLfuYBPwJEU7BnH?=
 =?us-ascii?Q?DVma02+tClQInI1wehZgzfUYwVir1GL6/fTq6cbSvcC6OfUgKDwNfpy0DKo1?=
 =?us-ascii?Q?X9qg4j9cggyUvZCBlINk5qgeBEsaZ7ulCmj/RRj5QPjVwFH62gvAV/ef5du5?=
 =?us-ascii?Q?MEmwzLz6i5xhtGbXlWURn3MNKQ7dPR+jIFyanSlACjng+z5d3AP3WC1APmOC?=
 =?us-ascii?Q?rMTBgt9BzchT5VcTbdUu/+0fq9FH83ChPPX9VuXH0Plyypl7hlc7/GVMsaf/?=
 =?us-ascii?Q?h45YGjpRrr+kKbtPbNXrvpNhPRjtx7SDYkF1q5Qw1Dt0qNY8kWpUJpcwc2uB?=
 =?us-ascii?Q?Wn4x3aX8Ad1+MKWUZM1Ca5ZEy4ZbKIxZrEYDU4ag9WTHPFvH7yIvFJbwRC5N?=
 =?us-ascii?Q?qZaaM1RNe3BiFtNWJCG7L0SX5NbhX+HC1kC0zGJyBNRa244TIwvXNdKB2zX6?=
 =?us-ascii?Q?7ImhIh2epPthX52jhqlwUkM3KhzZtFA/wrHaBoOQvjbdLKRtsiGn27A5Za5U?=
 =?us-ascii?Q?EzUB5VUl/NGFJpNg2tJMBaJKX5LWtxIDVyNgcP/YDwR5i8uwo3kErTJvQde9?=
 =?us-ascii?Q?bkM6sm64APqqJGS/Y7otuwHi7LpArikIfqjSf9mnq7eM33h0EU/pU2N9aZSe?=
 =?us-ascii?Q?aGekSBiZMo9RMsPSQXJYh35u+lzama+m65zRtAjOrjql3avs6oKR1C42Qodc?=
 =?us-ascii?Q?dLX5UWfOPXXs+UUNgYkKx5jlNgDFmQsUkExcdfL06s8oGSljfvI2ECex1ZqV?=
 =?us-ascii?Q?tWRgBCTUiAKV320vBnfSYtaBgIAAv/RWHGxvLhmITmwP4n3YyiUGlI4qUZMp?=
 =?us-ascii?Q?DPxDz3c+xu10JStKcfcUQWVsREVA8FlYcNsGWdF20xmFwwqfucEcoVHOScP9?=
 =?us-ascii?Q?4NOoNQ6A/CPQv3iKvdIJwIWICNEALy7ERG4hE2JuZfxgXK6QEwY7Kn6rw5fd?=
 =?us-ascii?Q?P9AzbeYZWkA9ImXqbWJ0jcmMV2qTMwkcQa5AYqgKX957P7Nu0JXt7HGcgkgh?=
 =?us-ascii?Q?BkAWBjpZ2/5KAQ+DiyIvHsKeZoiuC2ZROlEohFMdNI2dXQQCt6anJ/e1Z0Z7?=
 =?us-ascii?Q?CjyBLicjYD7jDARp0NC5u18hc815PWAxuXxfi7zqyuuKTySzoF9lt0m9ZjIs?=
 =?us-ascii?Q?zbAe3SBjvrMYJPlEAWV30d/F/yOqrCVNFTwJSlueN9Pv1fw+XSqHm+gz95w7?=
 =?us-ascii?Q?QsQfDZeqni2644fOPI6dvP8ujdqkRhXviAGinreYDL7xhkMlmjGVW0asP8U8?=
 =?us-ascii?Q?5355ZOlsb38gFGkOV+kp79x7aTfdgs1oV175zGiHXRSx06+T8AhtloJ1xJL+?=
 =?us-ascii?Q?G6z7rl2WKcRgN7ABasQ0EMv+yy0h0vY=3D?=
X-Exchange-RoutingPolicyChecked: 
	kXf3aVVS0F/doixVVMFmsdI6yxOgCcx+ktVQNX5976U7aDN9Z8KSLMaeqUfOKquZ6GBKTTWaKOBni5WBrXD6kclUQjKuxhx1DgUWo8+ORWQzlj20R9qnhmkHXtm5iwlvyLkQxwkL18Us05nGrS9BE2vXKX/qDFWZCVyD0AAzqcy+7d7M6GgkBG6I1K2TC1ApJZ3M006VCp0kNPDu2Oy3GyVEWH522o3ACaYAxYb2h2k7ymA9vPZ67VoIPEO687R6Kv/8bm/ggch0+kG9ENoJjFp8NDO8iWsGDEt4tz5Hd3WtY+0/6rVQCQ7zwaj5weiSt9l8V7W780ksJ0ow7Rrk8Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d010c351-d91c-4795-1303-08de859dbd0c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 09:56:06.3537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Nt5ZBeuTnqaHMpLhvA7hHhKXvI0olAey9v/8HMy702k+IqpqzcYoE4fMorMSOB+dL2IXCIy/SDpYQbHvZmY5W9aG7tT07YZYHCGyzr+56s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5821
X-Authority-Analysis: v=2.4 cv=CekFJbrl c=1 sm=1 tr=0 ts=69bbc837 cx=c_pps
 a=+tUgqrp9vGCFEjR5l+cGAg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=O24Aq5uEAAAA:8
 a=t7CeM3EgAAAA:8 a=nT8G-E-38M_L7JyIhHsA:9 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3OSBTYWx0ZWRfX4bupEJcsMHfk
 TYLuXjmiokQeJtFsMs92vQ/u2fKrzTjF48xLpPQqnOX+t9K/dTHo5iCV6JKdiZHrlZeKxGwTXIT
 ADITBO/JL26CXRjYMrXyfHgAbSxvM9cpr2/Yt+xm5JEtGcMc8NIsh/87swLaVIJSlaZgR696Bcr
 iVlRanexZ9uI6ur6fe0NJo7yysIFPlfq4rFT520G7WeH1YL64Y5yAmHRnaS8BG/3MO6Sl0/cj0m
 6i7gE4NIDQWeAwUrDbuzrUxD1FAkvNZFPowNNFzHDg2RGA0rqh0z3sflrAY4ylZYG+jUqKsR+2I
 9XbRFXASo+z04xsGA7BGNQyfOhcSrIJEMXn9gzU9EWhu93GAIroep9LAp3Ro3g1LtAPXpsRe25h
 MBFi+03qcSq5+3QZP/ZhPf3k5sQKPi2lTOgFtEMi4Fe56QtBBAwMn15i8O1VygxpJdlkDdWz5si
 NuDkkjhWNN2W2qQ0AJg==
X-Proofpoint-GUID: AvBkTPrssL1kQ4NBpZEPYSsavGVdBKHu
X-Proofpoint-ORIG-GUID: AvBkTPrssL1kQ4NBpZEPYSsavGVdBKHu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190079
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 09:56:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125388

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Changelog:
https://gitlab.xfce.org/apps/ristretto/-/tags/ristretto-0.14.0
https://gitlab.xfce.org/apps/ristretto/-/tags/ristretto-0.13.4

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../ristretto/{ristretto_0.13.3.bb => ristretto_0.14.0.bb}   | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-apps/ristretto/{ristretto_0.13.3.bb => ristretto_0.14.0.bb} (75%)

diff --git a/meta-xfce/recipes-apps/ristretto/ristretto_0.13.3.bb b/meta-xfce/recipes-apps/ristretto/ristretto_0.14.0.bb
similarity index 75%
rename from meta-xfce/recipes-apps/ristretto/ristretto_0.13.3.bb
rename to meta-xfce/recipes-apps/ristretto/ristretto_0.14.0.bb
index 7175690694..d223fa5b9b 100644
--- a/meta-xfce/recipes-apps/ristretto/ristretto_0.13.3.bb
+++ b/meta-xfce/recipes-apps/ristretto/ristretto_0.14.0.bb
@@ -6,10 +6,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=35d145429ad3cbf5308d1dc93f66376b"
 
 DEPENDS = "exo libexif libxfce4ui libxfce4util xfconf cairo file glib-2.0-native python3-packaging-native"
 
+XFCE_COMPRESS_TYPE = "xz"
+XFCEBASEBUILDCLASS = "meson"
+
 inherit xfce-app mime-xdg python3native
 
 RRECOMMENDS:${PN} += "tumbler"
 
-SRC_URI[sha256sum] = "5b9172ef704ae192a5338df6bee4e91a59edc65618c375bb4433ffb38e2126cb"
+SRC_URI[sha256sum] = "502cf1577de14b38132dc89e56884c5e10f86f6a028d8dde379a8839110fda55"
 
 FILES:${PN} += "${datadir}/metainfo"
-- 
2.50.0


