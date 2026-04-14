Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 753FEF531FF
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 07:55:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13679.1776153347795313770
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 00:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XkOhLjqY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=85647f3f2e=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E4pAMa1792590
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 07:55:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=kR5Bv/FFV6Q5BO4Lnc4AKh5Q13LGwBUrFhj0+nMlkkU=; b=XkOhLjqY/v5K
	8d3+KTKtEeFcMQnsvE3QLIBKr5ywu5qHYhc1TdTVq/8KXTL+dWb+81UTlSE4pJ6x
	meIE92c9kqaRsEwIFYr7lqvYlUM5aJecbmo0BAgdcWbvVjAqC9n1mk4RbVCZMykM
	7KYEUFtVeI0/AB4qTHQJ8FQlGNkZv2pzKrFsHSQu+qj8Y9WiHGX499MQPY86Vns1
	SSjgZi/7LtXcQzxCOuHDYuT5yOynjxQY3pOPyqpXcpHwEMKavmQ1kr406n2YecJ6
	yMZ97XtA9h/Z0wDicInm1vlm/ydv9qV8U6MzmQp78CLwZQWRiCV24q6Us+NWXRXN
	mRTvfog80Q==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012033.outbound.protection.outlook.com [40.93.195.33])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh877gekx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 07:55:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UdmmDoc2vHRn/VGTr5uCe3/pB9vqqMM6+aSDw/2qkGnEU6YVKCKcLwmPLOm3IOiilBIipMRTTaBn76DlAButeoDfr1v62pRlEwl+MXL83rR72xaHzUeJjTy8cyerO28B1tsPIwSxlobneeoyIXVlR/FFZwWB1pEIiK7H1tQCSj33k5EX46argd2nTk/h2OZKGXnOfVZmuoKj4tq4ezdREeJQ2lausFimrZJdbtFN6N1k35dZRzbgB3c+8jnZ9sMflD4Qyjkp1NLTbDb5uMm5v+S5bxpkUFIbYWxd73bHFgpWm6mjhVYrzTtmy8oDTM9dNiBA+zaq4cynkABUqQakiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kR5Bv/FFV6Q5BO4Lnc4AKh5Q13LGwBUrFhj0+nMlkkU=;
 b=fKoqa7dJcrki1UxH/J+SD7J+q/5pPYD6ltcv1+3woJam4AwAnicaBh631ifLUIHDZ7EKmFcigNcyC9gwBUhxoCEQPKeJ8Jb16vJli2B3Il1e2QUD4yzVtoFLR04CIL284W8vk41T0u//pVTs0r0vFGOcOEHDWL0W/LrksKo8ixEULW7eV4sRQ4/pfcF0hI/z4fewNtcDCYqW7zT7ZUguA9ZG+oAzCfYTPFfVAKSkEIWrjfhwj0dh5zKJTgRrDXlywyGxwwHRYjp20YiRUe27RRIZPnnG6DjciViCDml7H+SjaaN3O8yr+ie55AeHlBW5T+aNC74J6IgecU97yMJLQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by LVUPR11MB9786.namprd11.prod.outlook.com (2603:10b6:408:39c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 07:55:45 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 07:55:45 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 5/7] thunar: remove x11 from REQUIRED_DISTRO_FEATURES
Date: Tue, 14 Apr 2026 15:55:19 +0800
Message-Id: <20260414075521.91846-5-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260414075521.91846-1-changqing.li@windriver.com>
References: <20260414075521.91846-1-changqing.li@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0092.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c2::9) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|LVUPR11MB9786:EE_
X-MS-Office365-Filtering-Correlation-Id: b1c161e3-ed98-466e-d99a-08de99fb3bd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	8BsKnNZkLUpcsNEJj2UE41LBSn2UOKSsBz9gsvYclRzB3mtTR8tyRMbSTxtwh8Ph6SCs05te40wPxUWfMiIJ4jRcXZ6kiiYqMPGdgOoCFOyTI6InMZtrXPOF2hPDIO/W/KnTMcb7THBH95jbEr64X4/YD7yDsf/HNaJtlv+YyNuLzlZhZ5Jj9yke2Z8G6y1RwAunyNpHkGg/rhxLDzcyy334d2bthKZWg2sD1HRGbIziw2JKAkDQF6PwnhO+HalmzC+KyXEOGGnzUsqsk8EEkNUtO8s+BN2qKI8IhpoF8wTgKTuFZZ1kkSVeeToH33CNj+ezBRiOozpVmhAjS0J38oDJ8sS2zLnbLr4N2YBI10k5W789CkELDY2JlPWsZ2DCWD9M8qK/gPBtYtMgldJ/xf5bqkJB3XYjUp/W42hPdgQSyNbx0KdtSxph8ySctoj7GjzqbtWzujU/emotdzS7alZBvkuw1h3SM3sG9N1JyE7wsamGDMZhQ8Ys49A2uGKyhcYohl8elIvTqtjWJ/RDQrF0PcXzlErCnOkw695qC0D49DuYvblt63Z4ry3tWJ1RLP2sSmEKIIaaygU5t53zxhFWZAEU7ljC2hWe3icPYkkf2HfLkCuuxJeBHJpsQiGSbzIKfMT/L9lR4uka8pE2l6/hUGUDw0muDPXn5bKY6NvVvdotWOxN/OAp8at7hIGUxtSpg0xPU4yhEiHJT9nYhBHhvA3tuNnqZ6Zh6O2NUSCIoUIj6azMZVsXgQI+RPsQ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?K7uOwp14gSdqLbaHmqAOp/FgF+oX3nZJsXX3lyjjjksN07pBhO+vUjl6Tu2z?=
 =?us-ascii?Q?fKk2/hbPVX7+cVpXFMqh6UaJgVK8qPIphzLSmsFVv+cDPk2DrhfA1GzkWtXE?=
 =?us-ascii?Q?8inPcQ8tTQu70kM3igQUSirhEbA/e1DuKbH0l4HG+/gFpEac1mZSMS0KELfj?=
 =?us-ascii?Q?m3QT9y0ii4mp8fBombfLMtwfpmPwHVsKpseeuN57nlWzDBFd7LcasKjbynQF?=
 =?us-ascii?Q?Hn5b1u/onMPJHQldJC2KvNeX9GGtLJ2JcTso9qQOAikOGtvBVboY0+vU96m5?=
 =?us-ascii?Q?Fiha5flB7Ttr8wHCvYhRmAhb+UpLBz1MtmTf81HjBgqOUQQ07KEKMUbEOLYM?=
 =?us-ascii?Q?s53Uzs7NSUbiWuYkbQUn3bQ9UKiv53s1wMkQPLvOUFtGq8YgBv7VjyKGgjvt?=
 =?us-ascii?Q?JF4a/4a133zgEZAmY35odP7v87xDDrnTxFp3dy4OM6eBxZS0MfyyryDvX0lG?=
 =?us-ascii?Q?T4qDP9j14aaDhiQqgXcHxunRwMIEkuo6cd7u4unq2xfNFKHQrBRwj/J4XGEF?=
 =?us-ascii?Q?p/ZYyvyTvzCjOlNRwuaT+J+/CJmTZHWX/9N7TS5akxo678kE4FJXfRO+hDFl?=
 =?us-ascii?Q?oe7TaUXeg0JJMR88Q5qY/Un718XG9s3JO8BC+MWbGPfIJaFcIXWaDAHAh8lw?=
 =?us-ascii?Q?0TZCKW8LGAD8swdeXGwjqmbVcV8Q63PvXkQ3ZE1zpPfbRLAX+9y6wfG9Ze+I?=
 =?us-ascii?Q?ONEXfaitUXA6RfGRvAlsKU+j4tdfy/MF+P3RT7rza0x3D4Epr8+B/XVGJ78o?=
 =?us-ascii?Q?VPO8JFd4BtqhLjr9acN+at/Tkf+ugT9CbskfBuoxd+gtpTL0XdQBeu9aNLVQ?=
 =?us-ascii?Q?Gqz40rrbGep+IQ/YPRmo618aD26OojCZmznDsubQgIsj2969AUpeUuHte81P?=
 =?us-ascii?Q?IRdSim9wZZZhWOTtxOpFHwjBGhdn3U3dhpsDD4Ay4RBhtp2ClLFP8ysKNZzP?=
 =?us-ascii?Q?Bd2ghSmDRMe/wTra/mpgS+99U9r0cda2zrAK9HqQ67bIccYLxlaTZ/ztHq85?=
 =?us-ascii?Q?XECZXvRqSsCrIkA4fUjtVDsyu6bphZeRhwUcFq6gZc5s6C9a9nC6HR6P1nUm?=
 =?us-ascii?Q?uEzzz6lGPMDjLfMivbVAmoikbKD09qrQsVFD6TYyWm97EwoDeGYCNwuLGPuC?=
 =?us-ascii?Q?kfbyuIFSff0q0cveqF4ULEjyhc407yhv0aWeDNpKORCXMn4ivA2eq7ZGYnnl?=
 =?us-ascii?Q?Jlt9uCy+24S6hO63tpAZqK/2XaJrJ626IhFfj/i2Kii2cNqmQl3e6N9cgLBM?=
 =?us-ascii?Q?k/mI5v0m5GIqaL9ZOxvwpsj+H3PawdbUcIEzfpsHjAJUSmOlC2W2HC3rNwLZ?=
 =?us-ascii?Q?+9kfQCg9grPfqO3hNcGMXmt/PimEHXpoxyWYmSrHr4Ym4dXqephie6kxTQUn?=
 =?us-ascii?Q?tlgAQHnpETV9caMsJg7ZCW5RGVAoI5/L4v3kQXxnJhTc8/0lvizeMpkbDH5U?=
 =?us-ascii?Q?ngFiX0sbAZb66jbs/aAeDByHNCZG9/dOzPgEquQFQt4XpfB7vrdHP9Fj48r4?=
 =?us-ascii?Q?z7TD6BUzXAM8dq2XxKw0EqNAiVyt7dO+wuWzF5r9wb9eDaOE7eTmN6kCOOy1?=
 =?us-ascii?Q?Sd08wYkko1magZpRWggUhp45e5DgUAaz2TBOvTicrGecLHqxSjzPZVtu77vh?=
 =?us-ascii?Q?R1W5yfAzi117d4qw2ROXyrI1ijOpqtHs4VWe7rOqpZpAmG/tusPkQHbIEjwV?=
 =?us-ascii?Q?k3Xn3jJVdZ4ZniwGR0nNnxqDZtUjRRuyTQc+kifVqM0ZkabSS9X/E9FrBjem?=
 =?us-ascii?Q?81J8WHuOQUluFcJ4Rj0LdQp74wAB4AE=3D?=
X-Exchange-RoutingPolicyChecked: 
	eLyGgQryfX20Y+TxkZ6b9gEbrlJed1P5tHRNYmoUjzV3ikRWbHALsZ8WhOdvWl0hYuNatn7Cal6iJbIBTTrMWthO/ym5o8WsyIa1qzBzjB+L0rgH6Cgt41B9W1y6gPiWOPNQ56JtBk5gLCDLpFiwf3NHy0RhdjXpqyPrFWAfgUr8Y7qS4RLI9e/7nsFlrzwG7QS+a23qc37sLA+Qu39HfoF6Gm8tsejxmnGii9GiaCmLHTDR/MqePTyGGeKggUaXExC0qRxPTygSbPPN70l4TOxzx1cibo3A2UR22lzi3ij5XgKaTkJprB1mP0iRmMUywwLBYaY/b8/E83Xdq+r5zA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c161e3-ed98-466e-d99a-08de99fb3bd3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 07:55:45.4582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C856wDvQ8K7RN/HtIMHpH4+tGw33L1WKrMxn2MKjl0pyCaZ611gj8ql0M6IUFgJhNZcIedC7pM117xisMeDEChIv6S6EG1FPa3OZDwefhzQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9786
X-Proofpoint-ORIG-GUID: SA7oJqVnXZqwOUXnH7Gi5xPRfETpKrjT
X-Authority-Analysis: v=2.4 cv=ZtHd7d7G c=1 sm=1 tr=0 ts=69ddf302 cx=c_pps
 a=Za6wG3+qag5e9bFCWm8neg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=O24Aq5uEAAAA:8
 a=t7CeM3EgAAAA:8 a=Qx3jBToFpX7qqUQ60z8A:9 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: SA7oJqVnXZqwOUXnH7Gi5xPRfETpKrjT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA3MiBTYWx0ZWRfX9pk2MUeWC9dX
 125qWzVRK6E5G82zi9Cxz1xMZHc/ETaAzX1FGbs90QcvA01VQz+7oWMFASiUnYRTdONzYApnpn0
 PeCn1xa2n4FxgyyIAFvOdQm5CHr8329bd/HxfsFAtTE9NEJOutWhyMmjOaNWatizzHXyuKdYina
 0B0oLETY/CEjyE2jED3QEv9WNLAR0qPwhZ8V9dgRzk/c9KieacCMfJKttw/isj9qGRBPMdVj6A6
 B5iSMsDLA2grHNYx40GfDz6WE4peZFVCJkDSlrz0rGfgeuIj5bnBeJGWq22BEqm+PRQF2LxFTy4
 FB1L4gg+wIMzZT3n5xpaGp2UQuCIV9PaEmk8CIxfTcgMd3X2zt02vJPtjDFZupPseZ9bifx+yI3
 tTupwxXZoxOrnVzZMPbPXQ3HHre369kjHxbagVB2vDom2lMmjpu7OKFQQE/4MJQ8n3AirJQ/5kN
 sX8wG4aHbm+5ASA6+KA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140072
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 07:55:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126301

We add x11 into REQUIRED_DISTRO_FEATURES since xfce4-panel requires it,
now, xfce4-panel not require x11, so remove x11 from
REQUIRED_DISTRO_FEATURES

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-xfce/classes/thunar-plugin.bbclass       |  4 +-
 .../shares/thunar-shares-plugin_0.5.0.bb      |  3 +-
 .../0001-Properly-guard-gdkx.h-include.patch  | 37 +++++++++++++++++++
 .../recipes-xfce/thunar/thunar_4.21.5.bb      |  8 ++--
 4 files changed, 44 insertions(+), 8 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/thunar/files/0001-Properly-guard-gdkx.h-include.patch

diff --git a/meta-xfce/classes/thunar-plugin.bbclass b/meta-xfce/classes/thunar-plugin.bbclass
index 82a1be6347..f38996d26e 100644
--- a/meta-xfce/classes/thunar-plugin.bbclass
+++ b/meta-xfce/classes/thunar-plugin.bbclass
@@ -1,6 +1,4 @@
-inherit xfce features_check
-
-REQUIRED_DISTRO_FEATURES = "x11"
+inherit xfce
 
 DEPENDS += "thunar"
 
diff --git a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.5.0.bb b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.5.0.bb
index b8a18c2f51..b270ad0838 100644
--- a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.5.0.bb
+++ b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.5.0.bb
@@ -5,7 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit thunar-plugin features_check
 
-REQUIRED_DISTRO_FEATURES = "pam x11"
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+REQUIRED_DISTRO_FEATURES = "pam"
 
 SRC_URI[sha256sum] = "34d4d69d413e63837c5083506b4dbf65f1fd2efe17667b1d7ad0699e1e2eb07d"
 
diff --git a/meta-xfce/recipes-xfce/thunar/files/0001-Properly-guard-gdkx.h-include.patch b/meta-xfce/recipes-xfce/thunar/files/0001-Properly-guard-gdkx.h-include.patch
new file mode 100644
index 0000000000..9d4afc7167
--- /dev/null
+++ b/meta-xfce/recipes-xfce/thunar/files/0001-Properly-guard-gdkx.h-include.patch
@@ -0,0 +1,37 @@
+From dd7fbf4540891053a4083228aac2485e6c469199 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ga=C3=ABl=20Bonithon?= <gael@xfce.org>
+Date: Sat, 11 Apr 2026 18:07:05 +0200
+Subject: [PATCH] Properly guard gdkx.h include
+
+Fixes: #1820
+
+Upstream-Status: Backport [https://gitlab.xfce.org/xfce/thunar/-/commit/201f8ca0c3bc7b5e651201526fc3006a130718eb]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ thunar/thunar-session-client.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/thunar/thunar-session-client.c b/thunar/thunar-session-client.c
+index c36719c..2832818 100644
+--- a/thunar/thunar-session-client.c
++++ b/thunar/thunar-session-client.c
+@@ -30,6 +30,7 @@
+ 
+ #ifdef ENABLE_LIBSM
+ #include <X11/SM/SMlib.h>
++#include <gdk/gdkx.h>
+ #endif
+ 
+ #include "thunar/thunar-application.h"
+@@ -38,7 +39,6 @@
+ #include "thunar/thunar-private.h"
+ #include "thunar/thunar-session-client.h"
+ 
+-#include <gdk/gdkx.h>
+ #include <glib/gstdio.h>
+ 
+ 
+-- 
+2.34.1
+
diff --git a/meta-xfce/recipes-xfce/thunar/thunar_4.21.5.bb b/meta-xfce/recipes-xfce/thunar/thunar_4.21.5.bb
index 32d4c39aa5..d8e9edfc25 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_4.21.5.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_4.21.5.bb
@@ -9,15 +9,15 @@ XFCE_COMPRESS_TYPE = "xz"
 XFCEBASEBUILDCLASS = "meson"
 GTKDOC_MESON_OPTION = "gtk-doc"
 
-inherit xfce gobject-introspection features_check mime-xdg perlnative gtk-doc
-
-REQUIRED_DISTRO_FEATURES = "x11"
+inherit xfce gobject-introspection mime-xdg perlnative gtk-doc
 
 SRC_URI[sha256sum] = "eddbd4bab29c73718734e0bfcf650ceea8b4fcc8cb2cbb0b24fe22b286a2be00"
 
+SRC_URI += "file://0001-Properly-guard-gdkx.h-include.patch"
+
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[pcre] = "-Dpcre2=enabled,-Dpcre2=disabled,libpcre2"
-PACKAGECONFIG[x11] = "-Dx11=enabled -Dsession-management=enabled,-Dx11=disabled,libsm startup-notification"
+PACKAGECONFIG[x11] = "-Dx11=enabled -Dsession-management=enabled,-Dx11=disabled,libsm startup-notification virtual/libx11"
 
 FILES:${PN} += " \
     ${libdir}/thunarx-3/* \
-- 
2.34.1


