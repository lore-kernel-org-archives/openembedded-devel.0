Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE8D6CD13D8
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 13:44:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13707.1762955083547494610
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 05:44:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=e+LDZfvS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3411d85ce0=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC8kB8a2725025
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=r/s/i537Jns5/UnQmxqH0rFmLVH61SlQYh8TwislOwI=; b=e+LDZfvS/njO
	S4+tJRNfCDiPBt28lEAKszonrs9znTWvbGK0D0G2cPKa9a52qMvI4Ir15wvSk+3n
	2NYHuJp7aQ400C+50PHcTnMAY/hBzW5JxYArL7KUJkFqPgIoJTHu465oFpXgTEzC
	VH5VlYAuJKCPqZHRejWKxoMxuQkIP3Czzyk4d7lbTpNwjn1C70jD9wb75nOOO/A/
	Zl8+e6phqagTWHX1lBy+94q+504px2iZ/fL6EjSYVUIVAXgqAsPx+JYJrIKrecT3
	JvnuMxnHhb2DhQVnTe9Wg+ddIom8cJSWXy2z8AxASvMytRt3+E4qiNgZfc/2uJ47
	Dl/ZUSy8bg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012035.outbound.protection.outlook.com [52.101.53.35])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9vu958yc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P+A8EGfC+XlVIq20coZhPIqTsKiCdDf2bEaaMIFVD4wBSA9eoBnpASyjY9Dtmi5oRdbPXli2fsJSjEPT21oRf+IS6uXhaySGOoh71q7dbc6zSZUGoSK55SImgXEqHXl2asCzRjM4u9399JGBn2yevl720Nd/afJKdhbvhi/G952x25hWD7pJ+sSV/2yUsoS0V179dns9naUwa5qmpOO7zqik9AWckYWinrDR1klfteFXq3I1JNRTe0R/sNBPOR/01CUAWFrejN6ETSXGXkIfweNWMOCCZnqaYfzuMf1g9/zAfPpPLKvZc6cT6CyH5CR0lz/GYgL4dbOd/VBXeL84uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/s/i537Jns5/UnQmxqH0rFmLVH61SlQYh8TwislOwI=;
 b=uzNCPPl8z1PSSjS+pAi9Vnjms7DqmUeo7FufbM/QArFG/RgXIZQ3zsSla6JWxhRCbfxmtZiJ8G98srY7j/5cDEAOecvMQvQDV0nqo/3DcTPJSWWkK33zBSEOq62xzY+6tA0gTpHspDsDCf/lyQYkko8uUHVh6AxeCR62c2YyOK5NMDG0CX4YPO5IZ6egLoiMQCaPsKLNi5XOuDCPQ6tjT064PT8FzOEEEHqRjqK0ARf8l44RAdu0nRCrNgruNvQ3IO3LplR5Be0a1zXMBMefFTFDHrdCBadx7pjmW4WKV313Eu6e/towltyLPfX61922k3qCCTRy6IA/z3Lriv83Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS4PPFABF58482A.namprd11.prod.outlook.com (2603:10b6:f:fc02::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 13:44:41 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:44:41 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 13/19] lxdm: inherit sourceforge-releases class
Date: Wed, 12 Nov 2025 21:43:59 +0800
Message-Id: <20251112134405.3706508-13-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251112134405.3706508-1-yi.zhao@windriver.com>
References: <20251112134405.3706508-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0125.apcprd03.prod.outlook.com
 (2603:1096:4:91::29) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS4PPFABF58482A:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f189179-bdca-46ae-75d5-08de21f1a162
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?h20XT5i8OxOB5Z9qLYsvKiJuSYrCVr0lrfWgNxHHojj1BcpsbLtZnoRv1CSW?=
 =?us-ascii?Q?nnewW5O+F1iDTe63zrKNrJUdHpl39gtLjdjY22waK3baa6L8LJVQI3JFIdmI?=
 =?us-ascii?Q?lsKS4vYZwboEJIzi0vksdcJVoKtmAYWE6MweZOJXvwUOFadv3wb+y/LDPzMH?=
 =?us-ascii?Q?+sGjqp1cU0y/LGV+wRQ0i7mxvZKpWZOPyDxDr02h91/41BdHeh/FO/f2sDe0?=
 =?us-ascii?Q?zP3E+JLF4/QvOJy0PtYZ5dxscGbWPAwYxB7NFvVea4unckpo2FzvgfepSyPX?=
 =?us-ascii?Q?l/aB464JpV26OyHUOW3OSd/pe8/SZeiSk2JF4EO3q0t6ZrimrMaFoie9kd9U?=
 =?us-ascii?Q?06vzPjONdBjYAqYc/JW0U1K7yMVOJcQh0C6V4P9FhncRDmzq4T6oaX8l+XvU?=
 =?us-ascii?Q?xqKubDgBMzJJg/ndXRYwJ8Ldab4AOWiq77yMg0F2gXgWur7BT3QiEe+mOr/N?=
 =?us-ascii?Q?GPA6wkk5uyerJaUu12nLsS34yaD894Xq9VP1vXTOTpKDAMi7brsiqIqmxYNA?=
 =?us-ascii?Q?v4jnimlqXOJ3ohwO69C+0+m+LN69wTINrNcz9cNxOLlvD0CNxq2tAxsdUqdr?=
 =?us-ascii?Q?EzWAQIMWr/utMR/eWNJ4bAkGpRwgrrZ0v1b1KDjmFperL1ogHJl0xKoHHczC?=
 =?us-ascii?Q?SYS17DLf/pjgAkUhYUIPrccMZdqSO0mP0FGDwODBUU2NcEyNbecZ6TlzAlWs?=
 =?us-ascii?Q?3iN6q9zT9nN0V7IfbJRk3zX/xVwocxl8Bh5kg/7Dmfu4Xk83BYKLgIS9S647?=
 =?us-ascii?Q?edMww3MjQqBnoHFhbmZfAMGIyd1dzxAV3En67/2caUkoAXI0ZZfOjWa3xbIp?=
 =?us-ascii?Q?XqO2M1Z1k/4iRL5MLmaNVOG3GE54q5HFjcajt0lUDAOOF4v1+MDkvFG8+4uw?=
 =?us-ascii?Q?Uxvhsk0TkHr1ZobZd2BQ1TA4dtKFAhld3WnBK1gxO8+dEOfoX5S36Vbzf3/A?=
 =?us-ascii?Q?f3/8dKtbGpxiK/pY5UfR4g669K+u1kCyT06WdCjGijL01sdpr7bN7v2w1Y04?=
 =?us-ascii?Q?2Q6A/Yj+MwLSLD37A1YCSvKce81BK4/aWC1u8eGKF3R2UWPt4cLi/vBoKLPV?=
 =?us-ascii?Q?wYVtrMbgdJz0Pu2YEPRV6CytZL2pkExnm0s7sxm7Eehpj900ksapFARDAYHk?=
 =?us-ascii?Q?GS5lBi+quz9+z6WJgvGXgvsOVCA6AD7qxf+S/Ah15VE0k6tf0N6aNmqNU8UK?=
 =?us-ascii?Q?JhA+wBgDKMc5RUjubTV8u36mVFbWXNVR8QftNlbxCPtMVoVaOb6jW6V4tRlh?=
 =?us-ascii?Q?wQC+uPoEACjnak8RTb1WpcrspHrDjrEgO2yua/iMWUlKsIgttsJAj3XdpKva?=
 =?us-ascii?Q?W8FbwwEfgcqBypjFcbDehVhygNVudz0+NawmYsbiuzNvTFOUAtdF0/2fHQgs?=
 =?us-ascii?Q?zKSZO7cwNpII8xWVeKdehQ1gIBswOOJspU6nYTNphkaAnpGJXULm/rEoK9Jj?=
 =?us-ascii?Q?Y5WUh3Omtl76ybo16hErU7pb8BY3By0wvQyhKih99hFMBGhRuKTIXSVRny21?=
 =?us-ascii?Q?7xFCHVeOtmmkm7CneQ6ijICWscHgmnP3VGz1?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MfJz2uXmXk6xodK8rWN0EqWdg/GOtamOhnYLRY6vrupFfVjMiQFgOMS7Phkw?=
 =?us-ascii?Q?3cPJqV3tojGnzS7iHFGfazNV6bK3h3W1CAX3nOKQXUgWJ725Ed4SfWy2x//J?=
 =?us-ascii?Q?QL6lGHgdVLoLOii+kF8gfG9pBBltyo2r/vhrtlEXVzU/LqNsSjf3bwZy5fRY?=
 =?us-ascii?Q?oxIrEyINwxevgN3C/nhUNVWjjZzZx491uVuUyR4akYxKwYlPdw7OlXy2J4DC?=
 =?us-ascii?Q?AKKlPUNdlYLcpRG7UIfDX5sKUdGMUvEd12+B1AiaUfPMiPBfIVwRmkWYKWqX?=
 =?us-ascii?Q?clcEjRimxWi4l8/HUCyXKYFFGYxaEp1U6lhZqu9hslORJ7vf4OW0GsjJIxzS?=
 =?us-ascii?Q?X9TXcQ/GYXxMFAx6FcWwRHSR5mDoGByHs7SmNGRB4k+QUAV6fhrn9kKr/ssl?=
 =?us-ascii?Q?3Doy23dKfZeHw/RVu+vq/Ny3QM4IhD9fSmBo/B43fCRiLSWqT8IUVbk6+K7N?=
 =?us-ascii?Q?TqEpyb60FezQsjuyrHr4sF+7uUVmsEHQsg4qoArC7HtnJR1M2aQG1InuJLIC?=
 =?us-ascii?Q?8zbnmNC69NmVd/ixErHyA4HJAiUtFYo6lL1cZyf53/I7OxqJdyPuEhxBJ9gf?=
 =?us-ascii?Q?QugObUJ09MWB53rT0oWlDU1x2pv4ELAEgurc5Lc7KU7wvy+qzIT3iTOLULih?=
 =?us-ascii?Q?YQWMHE2aSD8/i2KKqNgRpFkmMn7zrm6hQB5DqYR3W7cAth538vsdV7B1Lu95?=
 =?us-ascii?Q?VfFW+YFbVxX3Dqv8BwZ2/qK82e4EwTeSm6IJCoudLubdbup7bCs8RXwths66?=
 =?us-ascii?Q?PfYMem0VUxMLavjVQmWaZjnLZVdBTDoHf/Rl9NtIpkMRbVXgcS01mg2xOPQg?=
 =?us-ascii?Q?7KBGSUijG1CBAn2olmyraX0kynkwO3gqwK9AFIRGDMP9bvltyU356NyOfS5H?=
 =?us-ascii?Q?56aYULxScVFKWe3xLippZz2KpGSj4T5Y0Uk42N9jqeS2LUYTm1bAXRiTYjii?=
 =?us-ascii?Q?8U33xA2j6WA96cwIIHe8csyiZy9abtgmSCwX1esi3HjUdLHIb2HR/xDIJzgx?=
 =?us-ascii?Q?MaA/t3/263HrPCLhZABxb3htcJKOjziU0vIL6UmmhCbGgKpnZd+reaOPUXW2?=
 =?us-ascii?Q?EKG37uW8AmfdghcoxG5ulcN9KDS/0A3/HFlsjoujrmqYBvnaWMgTBPQ72i0H?=
 =?us-ascii?Q?BpWD+lh5O1We0c/dvUd3POaI93Ixq8zhwa3l4MpFKyZ6EvA9gnfhnldNG7Hd?=
 =?us-ascii?Q?sBczc3jEKvx1ZlZAXRmijfNicWPnq/ZfprsfoSYsP19MyaKc3XDlJphcQBtt?=
 =?us-ascii?Q?6/gCGjBQ4Ka0i2i4CldSet0EcoAj3zTDlNEocSuER7IGRY5c0mT2K1dbJw1E?=
 =?us-ascii?Q?p7ig7OlZ+aIRfkcHIzA8aq/RGob5Pvu0yT/pprs4gBEbNu5UnfrKFo8Zkn/2?=
 =?us-ascii?Q?DwLcEu7h80okyL3ZD6lj7tSY+A42d8Bi/QbXbsK8X4C5ov9yw2kZwyJhd/Z6?=
 =?us-ascii?Q?VHWeEPkZy6kvoE6LpYta1WMrXqPegxMWMokd0QSKKVsSGzoBxdjd6gl6l7Wx?=
 =?us-ascii?Q?5sZ6rLVI15GyaoOD8FX6ukqZfiKLK3GGZB5rxkWYVZF9sYoXoyhns4krNOCY?=
 =?us-ascii?Q?UzA2uBjVr6WMf4NUCMnZXnvqcB16066xENBhJoko?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f189179-bdca-46ae-75d5-08de21f1a162
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:44:41.4718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TaGzlQt3BWlcnnS4MSWCdpiaxw9LrH4151irbRIbPd27g8OyqyonrK8PYCBcFPX8210d9gYvxMpZe2xpVU850w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFABF58482A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDExMSBTYWx0ZWRfXxyLyIRrFD6Pj
 k0F5j5RnJvjwEWPmkxl0pemkYZ/QOr0hIUhv30jcmQgyOGdV+kI/YmEXRIWChFbvp9k7ZTL12NF
 2K9gqAx/PNPetE2+Uazjp4+csaaSboTvZEdVgPxQ7wt/8CFp3V8Y3yULXLdUchKeJQr2GiE1Htb
 NAdMru4gIHvxvl6CP+pTkK7ReEVUVv3FIoSZdToGxr5KlAaox9NwWJN/6vfLuWQ/2kIbLBJQY/S
 I1yVqdoWex3KFYXQ1kC7v/wRD5LaAwHiNGu/yQrrtZbmfb2euEHnVBlaBOPD4dE5UCqy73pVwQo
 5izJ5aJYei7o8YZbAY+TN0GnarINFk328KPZJFEL5uug1PFFHoTwPIlJ7bWkbKCB2Fj5rZZjtyU
 5u9oSEDGn/8AOQAQmBpcMgYRBdxGkw==
X-Proofpoint-GUID: zpFLsCPS-VAckkqMQGIG2a_9P-V5G0Qq
X-Proofpoint-ORIG-GUID: zpFLsCPS-VAckkqMQGIG2a_9P-V5G0Qq
X-Authority-Analysis: v=2.4 cv=CMknnBrD c=1 sm=1 tr=0 ts=69148f4a cx=c_pps
 a=3/9ZW+mBBPtU5+OO10+n1Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=0mNrFfgDipPIZZbr1egA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120111
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121542

Inherit sourceforge-releases class to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version lxdm
INFO: Current version: 0.5.3
INFO: Latest version:

After the patch:
$ devtool latest-version lxdm
INFO: Current version: 0.5.3
INFO: Latest version: 0.5.3

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb b/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
index a7d79a916c..a2b4c5f83b 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
@@ -29,7 +29,7 @@ DEPENDS = "virtual/libintl intltool-native cairo dbus gdk-pixbuf glib-2.0 gtk+3
 DEPENDS += "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "", "consolekit", d)}"
 DEPENDS:append:libc-musl = " libexecinfo"
 
-inherit autotools pkgconfig gettext systemd features_check
+inherit autotools pkgconfig gettext systemd features_check sourceforge-releases
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.34.1


