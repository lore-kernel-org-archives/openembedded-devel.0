Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D168CD4F43
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 02:59:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15355.1763002764184362685
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 18:59:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=O+5yI959;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3412a946d8=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACNelD53217377
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 18:59:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Mjv/W7BtCzQ5HBKvShfWA+xZ/QrHA/PP/ZPotzRyPuU=; b=O+5yI959FNSp
	5MWJ57DWwYG229Y8LqxxTz6HIaHJhAqbOnhmBdqqerbPTX64gmkymCr6VXrEG787
	Q/OFXbIT5jjzddyZ79gSu6gEHI5wOSQevi5s2z3hMCZlzhJFbLpE2XhrREEtsMEN
	p+MGntxjZiym+UMQdDLyiO5H3Wa+goAcXMYgzHfH/OtlZAZHNB/uRUbY/cF8YXrJ
	h94Uj7nkUfl+cgKXEZyM3KP9fUx1Z5uVWwmyVq5cOLoSrtKT+rlacJJWWM9CUO1p
	S2msEA7GBUn9fMQWo6pm4HI8chowabO5WxXqwKKfLgQbron4WOKWiCa4ozoESQca
	ib1WPke13w==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013066.outbound.protection.outlook.com [40.107.201.66])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aa68jp8je-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 18:59:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjF6r3IM4S8wBWxMt9dhzmcY3AIoZ7oJOXnTy0DrSSKNpx0qmNIHe5Yi9w8CJJmDCP48Z/fTGkZ03Vme5QEIfd3ypqvtZYOh6NZDHHf5sY5YxWdT4M9MY4VQh+SEhTSLJYg1AxaJEa2UyLb+4obxae/MtQy8e/O0Gks+asE1QzjSIBKEIG8IaLEihI4OHPX1Dc+rOKjPlLIX+7GgokSIKrDR0+/LV7jqOn+J5hDnQZ2/90nNCnbq3Qk8oUmgAKxypFk7lUiJGnrWsApQtJv8eK/BCXBJeS8NUMsxkUspJmOALXIlLhcYlXK8IDwmeUO2LCZv48XHFy8S/iDiVwuoBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mjv/W7BtCzQ5HBKvShfWA+xZ/QrHA/PP/ZPotzRyPuU=;
 b=bBL0RtlmfR5nEsKI0jFlD9ON4tyjTjwK3aZhD00VUPfY2fUAygk83kvg2p5hq5EMHO2w5hq177Cl+tqf0bJjCmTGIhQCOff/QAmp7phq53rUOqhO2yMw73xHam8fFmusL1UeZQgH44nT4TN12hY5GtvmfZkYUrW5nbJ9XPRQrqpCy8agv8nos710X0i4xLLPQj7cmG3nkGc8CcV+p224OkjFlqXiuiX6yi6GGwpn4b5GJQcWM/gITFRnX8ZDd2EuVhyDyPYLzQnmrcetQRdUsisowpm1LRbfGXDFpUQHfqX7WRiAOvstlkLtvb958JRYoOrhNz0VpfWBz5+YUxtwAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH7PR11MB7570.namprd11.prod.outlook.com (2603:10b6:510:27a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.16; Thu, 13 Nov 2025 02:59:21 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 02:59:21 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 10/11 v2] python3-rich-argparse: add UPSTREAM_CHECK_PYPI_PACKAGE
Date: Thu, 13 Nov 2025 10:58:54 +0800
Message-Id: <20251113025855.1520038-10-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113025855.1520038-1-yi.zhao@windriver.com>
References: <20251113025855.1520038-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY1PR01CA0197.jpnprd01.prod.outlook.com (2603:1096:403::27)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH7PR11MB7570:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dad9f7d-3941-4960-d579-08de2260a4cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vGdmBOs9RZxXhsd+B64D27CIUyxFQv882mdNx7KA03MJVgwHcr7bADW+0XQA?=
 =?us-ascii?Q?pTJsmz0kXwWYbeSsnFep7q0p+8D8ojFd6JQD3JKylHDQjz2j4XXNER8wxmJz?=
 =?us-ascii?Q?pWL4gsdy57VLC8qDHReeVj9aQsE2chgN5DTKQ+vTUq5SrR1ctZXVQnC51kBO?=
 =?us-ascii?Q?kXqzXb89IwjDNe6DKPy1X+5kP6ltgxx5WTBeJuHXcCaJs0dMg8cFQkcmsMo2?=
 =?us-ascii?Q?K/Tjj8d8qjLBUzeCOQ8PhSZl9xE9Ooa9agzpeyTqfAO23NVTI0Z99OlQDYWv?=
 =?us-ascii?Q?RDS43Fxxe0GEmwMWmTEIHGJ7+7IrE6iDCHrTWlBIh3nai1rtzlaX6A/EiJUa?=
 =?us-ascii?Q?EVtB+i+86fvw0n0qvIU9qgMtMT639fM7s0fVC99IJMfnkW+XKrBAVsEbAPOI?=
 =?us-ascii?Q?jtTeXPZNvTUpiy8pSr7aAqQtsDk8Hw4OssaLlNWj8ClbL0BFOw1dBTEAl3p5?=
 =?us-ascii?Q?h8+6Y02NEj5zA/A1/KRTrhjaI1zldQEx0oXnKMRdnvCVf9nKtX+p8dX7X7zG?=
 =?us-ascii?Q?HkJuOjWwtJJjHgY1kb9ut3s3+wOQrHSTlem+aazHuXFjRadU82YA7jZDmr9+?=
 =?us-ascii?Q?HItb2aqSjYZuZjOAwTsLxFpy5T5dXAxbSCHXKHXirQ5qFpSvPXdtUBDfL/Vg?=
 =?us-ascii?Q?PZbTFbP/AszMyDYlc47kLKzzio/oL9MhTkog52o4xkQn9Tzju/hOrrV1Gqa5?=
 =?us-ascii?Q?Zr9xta+l8RgxfdNOmaiZgv+w+1tv0PVd5o/hfAorvuUk4VKbXAcYurmfKkO5?=
 =?us-ascii?Q?UTAjRwtUb3MbEvUcfhufuuHytMTI4PlAKQomrfoILVK0VfOMlgLBURP8X4aI?=
 =?us-ascii?Q?u6qUMwv8bIvdAeIjbRPZYx9KgzWE0+q4wLk5G8oj6i4xPzRwyM0Qau13LIrN?=
 =?us-ascii?Q?d0DMXeQlEclUjLco5Z2ortn/SbExn5WSE68fyZj88Ft7Q8n2fB3eYba64Zfr?=
 =?us-ascii?Q?5AT1reMnPyJFZDEtyoZRKRtr8DUBca5beTJxAiaiee7BZ4azlSk3EjHovuPl?=
 =?us-ascii?Q?JDGAhj72D57wWIuPqgVknTuHq7dazi/GwVFCLcJBZ5F2Re0r7SfEgllLsnak?=
 =?us-ascii?Q?lfjExCtcVsNjmNwljXMsLYzIJWs3/PgtCf5YlJYCHaJAprC5OYPGhRNtKzwU?=
 =?us-ascii?Q?JxEUB0H93zjMi7pDBUlFmuP+a3J8K7DfgxqrKD1LGccfEEhQGQcRAZLdAT3Y?=
 =?us-ascii?Q?akgSlRi6wQebzOwZGjHgLvOLy1OxDnRm9TK2p76bgFWXTZO3MQWcUIxofmml?=
 =?us-ascii?Q?5XHJ1KFKu3cDAZpOqwa/+JR2tm7bJi2q9HVXnUOyGyLpzwkcbtl2CsCKmuvq?=
 =?us-ascii?Q?fmbKtc6kkh+T+OLYboj+tSpbPRmSil0/mRQ5RSeFIhm2/qYtbY5AxgGvdJsn?=
 =?us-ascii?Q?KXPSvqTIVW8VE8FgwdGrH68L8Bi5Tbt+G4lBMjmf2WMg+tesU8zlIe+mPjtV?=
 =?us-ascii?Q?lHY7EhQ7GeIQSQTdkqc8bRLkduzS/OZcAzT1+hZTWDgBcG647b8jitNEFl4q?=
 =?us-ascii?Q?Rz+Gg30fi6urnhLkzfHY63HmdzqzeX0RL/SD?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?H2OuWHU2jbxTwTRStG0ifrLbtE8/MMEStXywqnRBCNvrtIRJmfIuCA1jGiCS?=
 =?us-ascii?Q?ggzOBfc9crlwUeYC6QKlYCAhdYezC36KjatkzsoEC9vQUCo5HhMIpiUo3z/e?=
 =?us-ascii?Q?oR7QBUJHbGFsQXAV7HOLkb0bJTvc/rifVQ4+XwzoPq0XZG7It4leURc9IBWI?=
 =?us-ascii?Q?mZX+AdC5v/qOw3+bwhA+aTX/50H2/rdfaoL4gop9LUvivD6HqgB0smZEtr0w?=
 =?us-ascii?Q?krJK2GFCxncPwHDT59KOXd/loZ1YfsL58hy2jFfRJs744gdY2ZmDeTD+ftLa?=
 =?us-ascii?Q?5DuiqtBYlqNZDH/Llhi2hyruUiHQksFQGJNXnC+exYJTgQ+5EXR9ruc9pGuX?=
 =?us-ascii?Q?ihdjwhb9h7KmNCdQtKPQoIXIiO0pa3RzgjEftypciWsNZEW76U7ErV49aPq9?=
 =?us-ascii?Q?B5ExWQ0dXn9+GomJPm24ZgHqC/qRPHix7Ia8LS2qsnV67bXgREoKF2C+41ij?=
 =?us-ascii?Q?CLObfd2Cl7cfK+xAfmaIbdgkgcdyx+PpHp9Yd6VYpuijXJYL2Hea3y8o5gqU?=
 =?us-ascii?Q?yT/hv8F1UTp/jyocO4Mx/JWC5EceqNPIdpn4sMFCSNI5k6qARkqEF29Ky1wc?=
 =?us-ascii?Q?23QzUg5jPwXSPo8kKBlkEui3jqQ3u+jmR5bBMd2y6N86MkkIkk/6aAWru4XV?=
 =?us-ascii?Q?1kFpRgU36vvp7nGjGjY0Zb1Os0BiKAP6OkmmsujPDvYtvpQF5ikphA8s7RWj?=
 =?us-ascii?Q?9xHV8invJ55/Qaov7qx/QJLBylDpAhT7NMSTZYz4odxwJ0jutT8T61HIxVw6?=
 =?us-ascii?Q?IhPy5ks3WJlRolWv2jyy2XQ6oKCHfal2FXXnKPOhMIeg8Gx58jgXWtBtLA8H?=
 =?us-ascii?Q?cRLT165mU+7nAzqhfx/vujmux8v2r63JQpn1arEZpTvOCTV6D6mPib4kttQj?=
 =?us-ascii?Q?+ishBoauLYcHCnOkowioGuPFnDqO9Dc7Poclj2IDhw+H+O3iZISxAjDYaYUW?=
 =?us-ascii?Q?pyU1jwGP4vSFCQcXTscBaVeBOw5Es1x0x+7uBJ7TWKzakrLho7SKl45+D0/6?=
 =?us-ascii?Q?BE4cAbZdtCDTc/UxZHIKPmLjbLm97guMOsIQFP+GR/CFjouZqqvC3E+r5sPn?=
 =?us-ascii?Q?H0SK7zuSX40DB+5hIiE81TLsW87vS3Zzaqd4bf26Iqv8VTGC94i2H/N8QdVL?=
 =?us-ascii?Q?FFzmkoIMGY2hWrC4lp+GZ1/gPy2M742GAxE9+gzFqdMMUrTHVAEjXFmhQHBM?=
 =?us-ascii?Q?In07zJqOUbbHdUZm9rl/xjILH3ExUhZezqay1w45lidZrzVhsFH6pfYfKPUT?=
 =?us-ascii?Q?wKfxwPT4OrMhwsY0Al8IT5wme6j5XM8EKol97FtCPFzEd5sJcfOwI54C70pv?=
 =?us-ascii?Q?C3oQLVrWOILvF42bq7P/giR62fXXJpciK4CRx122iyoKD/feohGFuPbhea46?=
 =?us-ascii?Q?eZprTnhIJzxtycPWVeRroUyp2TEumAGvyuOxroT2z/Mlmj81uTH7Zd8jGnJZ?=
 =?us-ascii?Q?0e3BtHmsjkdrcy+AawAh1QapZa2shEEU7TqxHSOE84eYFUie/qHziQtMLgea?=
 =?us-ascii?Q?tdnsAdp4fHhPw5RpoMD+2qqOLrljQ80w30olVIYBQvs4AlMAO3Yb1cWyHS2s?=
 =?us-ascii?Q?Mgu4jAPu+xDnzV/TOxWEgYYlySJxn2eqc7k+TW2Q?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dad9f7d-3941-4960-d579-08de2260a4cb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 02:59:21.2538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yMnTEKB1ktrs+GkDfnp4h8R8TQaFF4ClMPGjGPe5V/64D1KSlk1zsHjZ5kJlCr+dJV5l5GQzpKlm+0TLGQKM2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7570
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDAyMCBTYWx0ZWRfX/ez9PhgVofr9
 DS6zZ03vub/FtGeQViq8AzwppIuO8azXUxQeEGkSqwoouq/tPKg4BfuNQA4mmxzCnofYavRsKKJ
 RqSmdDJsy53msREX9ccYf23smZ8n2Hx/K4FtzWzS8YVvoBOSdDDMpofS3LpPOUSjpa+4YX9Doj2
 KNUXIiezZ+ChDzqUJ3n+sy2FtCS8T+8PgYWPncqEf8e9vzdDLksPAR4T9Qu2GvA6+xO81+1N6WM
 y4rkfqBIIRnhOWmdpWpqQoCMuWKib7/TPGm722t6/BSj+Ooh3NxrszWPuFFUZg4RhWhf+jl/Q7T
 rVmJbhB27paKFj0ktAhJRb3+jLKLM3HzPo6p7FiC35jHS8S8MQPLymaZXmN1NmqXIkgcY/Fe59Y
 YUC8paNQG39hIQqIsR1tYPxrYn/lfQ==
X-Proofpoint-GUID: PRoBczq3SIR03MvhxxgGL1iFEKakV_Jb
X-Proofpoint-ORIG-GUID: PRoBczq3SIR03MvhxxgGL1iFEKakV_Jb
X-Authority-Analysis: v=2.4 cv=ef0wvrEH c=1 sm=1 tr=0 ts=6915498b cx=c_pps
 a=2KosHvP3s5kmPOqSYQ0Nog==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=OXcMO6pI-PMLh_W-gwcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130020
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 02:59:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121591

Add UPSTREAM_CHECK_PYPI_PACKAGE to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version python3-rich-argparse
INFO: Current version: 1.7.1
INFO: Latest version:

After the patch:
$ devtool latest-version python3-rich-argparse
INFO: Current version: 1.7.1
INFO: Latest version: 1.7.2

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-devtools/python/python3-rich-argparse_1.7.1.bb       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-rich-argparse_1.7.1.bb b/meta-python/recipes-devtools/python/python3-rich-argparse_1.7.1.bb
index cb07b012b4..8228a509a3 100644
--- a/meta-python/recipes-devtools/python/python3-rich-argparse_1.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-rich-argparse_1.7.1.bb
@@ -4,6 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=06f5c372171ce02f7e6a18f5f57f0b69"
 
 PYPI_PACKAGE = "rich_argparse"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI[sha256sum] = "d7a493cde94043e41ea68fb43a74405fa178de981bf7b800f7a3bd02ac5c27be"
 
-- 
2.34.1


