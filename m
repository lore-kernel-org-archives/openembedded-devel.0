Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A3E4CCF9EA
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 03:06:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web01.164.1761707193618511523
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 20:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=O107TGd7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3397a23ea1=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SNUMa11395358
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 03:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=TX+eB1pUjJdab+zUxvkI
	ID9meGY6l3+2FCc1YsPZM4w=; b=O107TGd7CdtVwtJGaANo0FMWGoKFUClIdVk9
	K75mH0zjhEtqHwZEidtXtQohbuDs0b3WDhatDKTnUfSXQYsX04iNtBRpZL/m9ssv
	l4hTiZIeo2IOPliCWjYoBPtTMgMtRVQxMg28V9aXIeuSCh85aPewYz5dmHU9hWLm
	JxSRnIekxkKIZhV/ePR8Xc+UNqbIxTySNMz9HaIqHZopEqwx2S6G5yL7GsgM2DzL
	2DcmJnnsbnv8WeiHbUqCHi9Fvh5/moYmCh9jooOhuq/1oJwuTw9vvKH8zdgJYEhO
	ADWjwVfwBURrnB0C7pwvugN5Eskasyxyt8v9PSxF9cspoX/vzg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011054.outbound.protection.outlook.com [52.101.62.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a348bgb0k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 03:06:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JCqp/GSazVCfTueJgExolZ7TkLpA4ITs+jloGT3/nSBJ/ayYudRjE4pHYkAYl9M0lVugA6BYU9A67tSinNVl0aoelbVBioMd3c1za8zZgfyLWFQ6aBbt4htz9SY18NwjJK4YhVEWUbAbXjinPg60scrDCSCXK2MK6N1paHSBjXFoegJV96KnC9Tyxbj1c71ANJe2aNPDwc14ws4x2JrY3P+1G7uZNXotExUxwkTo4uP/Moj5qG9YoWCOBg2V+7AthIh1ArgvF/STKed5AMQP7XL7VMZsk3+V8OMrVBssWq4+WuuTl41/LsWuV7J/zmk/n3vOdCaZCmHkU0QmobVo0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TX+eB1pUjJdab+zUxvkIID9meGY6l3+2FCc1YsPZM4w=;
 b=UUo460r86ssKIfstBo5fJWfL5oPmLeNXL/0JbG2hXmwc0BqlW6FvHCI7J7KgE9jAeXvi4grud/Tggkap9Bfq9twWk5LLmFVpUS6IeX+PNwz4YG18WRA1VZA+/wcq+nMiDa399ockrF/pTuijXXE3vSyz3vATJ5RBTtsLmn80XfiJkcJflJUZ/CW9nvAQM8lEkgw+4TaNHENPI/eUJ207JxIeZKV25C73QkE4GxS00IBjvjY7irAZZZPxV0to2zDf5lZPVvE55SRIm/l7K3JlF28dR/RJHRUHpXC30tRstteT236VrNDhA6wcxUZNIx2yqQBpZ0yC+BCAENo+LdkPrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by CH3PR11MB8546.namprd11.prod.outlook.com (2603:10b6:610:1ae::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 03:06:30 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::89ea:ecfa:c345:3fc6]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::89ea:ecfa:c345:3fc6%6]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 03:06:30 +0000
From: guocai.he.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][walnascar][PATCH] python3-posix-ipc: fix runtime error
Date: Wed, 29 Oct 2025 11:05:24 +0800
Message-Id: <20251029030524.2430670-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::12) To CO6PR11MB5586.namprd11.prod.outlook.com
 (2603:10b6:5:35d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:EE_|CH3PR11MB8546:EE_
X-MS-Office365-Filtering-Correlation-Id: 74d4f1d7-98b7-4dde-c93d-08de16982830
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sW3TrlcrSd4AIrsU71WGQIUevgHh+fgUTikm0Ct2mxJfG+AZztFP7yXSTXeR?=
 =?us-ascii?Q?9yTcCOB/WwcGIFVCrLGhTIqPcRF7WQsXWnRVTqI97pJakMWznUardmq913It?=
 =?us-ascii?Q?/jeKq8DERxziXFeU/3AyOC69x2CcYAGEMVo36uQsr950LMa2/acSMUuSWSvz?=
 =?us-ascii?Q?5j/JWEto2FDqcUKSSe+YgutOyIxxtGLKgZBhi4namUmqu42cX/ctPy6334Vv?=
 =?us-ascii?Q?QnR8AmYtvvAUBLZ8aGWnXpc5k9ZArHUrxID0BZtk7SOY1XeZDZy1lBGooNb7?=
 =?us-ascii?Q?aEeOmJDRLY6yOZ3KePeF8fkb4YYwkvP0jxsuv+budRyaqVLvKdv3i6WOtWOC?=
 =?us-ascii?Q?Er3J69iYcFLhLg7nWUloAvOWxFOeaHJXEAWJbe6PbKXg7caNwjBedA8TqCtC?=
 =?us-ascii?Q?ZV1qhzhhcLHWf+eqFB5cn2okwtpwJTFe9UVnB+3gqqRGTTXtrsjKvxv/1Dl9?=
 =?us-ascii?Q?NeaGVBa9Z6NzPPqOe9GuP19ZqYF4uGRPpbb6IAsQO/0KUzpD0r9DBsd/5rTA?=
 =?us-ascii?Q?A4ILF2ClMuB3+Sw8uR/DV2Ikf99nqDWlNZYwWET72cr+92NI5fpn4U6Y48Lo?=
 =?us-ascii?Q?2SL46V6N5Ylt8EKCtUOqnB3fZOwivi18ydwgVxnSnfc6zGnl33+Mmu3Q3iwZ?=
 =?us-ascii?Q?BTurx1AtC3dNqzmCiPBtFTR6eygG5XCfYIgmpJQuUFB5/VijT/p91f7+XNc+?=
 =?us-ascii?Q?ZmUz3bFXoM7HL+Sdtwl0P1kAVW/mQ00SvbBB+lo8D/kHcYdq5205Pen2zH1b?=
 =?us-ascii?Q?0JAOMaiGDJP43cUMR2wjCECP7J/v5ANTdCikdBArFpzJOdUGoQpl9lnYMIQ/?=
 =?us-ascii?Q?Hezk0hat7pB9aGt93w+c7Zi/Yz9MtcAnSiy9S9a5gSRkEjisukRi985zYq6M?=
 =?us-ascii?Q?myhWtFE07HMHLFOcpQ/ABChl0JBhZUzrKk1xkbG0KX/bCn1W0644bhYiv6ex?=
 =?us-ascii?Q?EVtQ0IYTD9cw+leu5k8Ss4egWsIyFxSv2W7KgfI8/XdZWeS/8BuwgoUjA+WC?=
 =?us-ascii?Q?yXkQqwCYSEw0uReArPJ7BN7NB8rNepDIwR5OWiqqLqO6rlMFdiHPr93AVulf?=
 =?us-ascii?Q?tPluoBj7lk+fnuPNn+Jwo7HBuHvaevpK9jKjcCpUpLZyORm+rBHFVxcykfzr?=
 =?us-ascii?Q?b+Hvlc1IY525RvNbrWS3gfwHerIvn1LO5SmgHUH/oSBbMDsiOVnrmnoRS5Z4?=
 =?us-ascii?Q?Ec8Dvd1B9BtLE0Qgtfp8xYIOjUcNYnARDs+qq5t3ejKCtYuOSWw8nIt/YJw3?=
 =?us-ascii?Q?N8ynfQsuus+PUEdjgLnflbstOIZpfSSmZJdRQVZM3Ya5IXiWzRSH4xV6z2JL?=
 =?us-ascii?Q?2ne/vMi0qXiOHsHfURhwbeKlXu54pgcdrUiJvbBT4iSB8pAn7mGkrgnP+wSS?=
 =?us-ascii?Q?yVOiNcuITp0YGHDSMwbv7vd27ekb4+uvjnomk8qbapFcM+x8IwyJZ1cCoux2?=
 =?us-ascii?Q?HvoBGGaoD8HMYq19uAVSm1FPU7a/bIFYxS2fiwCDKK6RBLMbVwf6wPRhCOmX?=
 =?us-ascii?Q?iaLyttQ7Emc7yrnGRZt+1apw8vgP5Wgdnqrp?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?17VfTPl/5JwrdkAbUMimjWLcKp1QWpB0VpQs6BdHnvg4Poh51rxKRGqmdwVs?=
 =?us-ascii?Q?pcqXNwXoSSEqpezyLtCFzrwNhGoZnuAYy+GkhU30wytBn+pkTQaAULdCej2c?=
 =?us-ascii?Q?4aDqMB69CCl8a6cHFMY1lwtjYg3ho4bQK2p0MHUQsMF4M1b66sGy9I3ucBq3?=
 =?us-ascii?Q?ulIUP6STJVfJURV2bVuHvmcIhkkM4CiajKJm6eQhtxj94pG7JeIe9QElvsKY?=
 =?us-ascii?Q?eyfiSsXYyH8zBEtpkOX1+66L5da/rzfrjX29U5xWCC0pgRXJpg7XRs0Nrf+7?=
 =?us-ascii?Q?1Tw1tkoOQ0i9ojaEiBz6ka6A3TFUMHKFrRI/NHKXNHnRjR9bbjoWnuamDEGA?=
 =?us-ascii?Q?E1C1pbRoghmfQi+qsZ21gTdGAZBlA/nAUtR0fqfQL5GafKg6ge3fCVpfhL6a?=
 =?us-ascii?Q?/8GhyVfPYAmT8UZODh8ESltVJ8VSuWo0PIBhMsP7MLV9b9AiY606RGzfUv9E?=
 =?us-ascii?Q?jnmdl1EDNeYzWa6nDyQ/Nq847+MTLbSW4EgLNqXdeBhc5le7oC1Plig0i5nZ?=
 =?us-ascii?Q?PRVTNCwnK4D5xNhazNC02CWftIlawhtvCJfUJNa9MjRedUvIot3OjX5I7D3E?=
 =?us-ascii?Q?XMlVg2EmM568cAjaKaMCGN/+Clfx/iuV8f6WYs5Phz7rRdWo43b01esm0Xdq?=
 =?us-ascii?Q?DliRhJqFPalcFCw8WkBs+36XZoGporzbM6Fkhx+QGPt/KTkRjM0JZZBRRLvz?=
 =?us-ascii?Q?yJk/S/e1MXMKiJeyD2LJ22kULLNeGA/j9135jU2WH6lim1U3v8SHzIuDOmoZ?=
 =?us-ascii?Q?ArtkliG6EirFaMAr8WNvpIXMLA+LMTKZyOZEEsnZm0me37loEfrNRwRj3SQT?=
 =?us-ascii?Q?ufXlvwFkGPqZmYVgrBbWh0VYsAf0QovHomf40LlF0sM7BR0lhLj4BZayZ8z+?=
 =?us-ascii?Q?XtKW5h3n43JVN5TuAUjzzbO0NGFC9tKCWKG36rkzkYdZlNtRbGOsPwc1LTAS?=
 =?us-ascii?Q?wQRbOATTs52P25jt68wO7up3Qm65jtZeMScgQ83b9rrmPOEbiMTCQQs8sX4W?=
 =?us-ascii?Q?1p7425EkNVhYqfEPvFO4eG2GgNSqz+Fn+vY1aowcHgZLAbSBOYUcYgpP3RVd?=
 =?us-ascii?Q?+B0d7S4IS6ynBTgNsCtalUWFUGbIcC+UPyo7BeY+wkda45WvOt+kuZ1PcY9Z?=
 =?us-ascii?Q?L2zF8fwDIG3D4zjwUgZmBUN4lfZK1XSW9PLLCUhFiHMs/oXlp7BG3KjS81VC?=
 =?us-ascii?Q?Orit+9zrZ0CENYN7BgSe2NqoaYfIVF71IBOCtVV2HmHIIN1B3+0nrdd8igaY?=
 =?us-ascii?Q?BIts7ONAU/zTi5juDSgxzReISh1dH9pQ94Li3EgKn5W8qypup188liv5XSYE?=
 =?us-ascii?Q?DnfFPxqOj3owTpmjiHZIoJkCW2T9Y208Y9M/HSmYe+oiTWI+gy1D0fd8zjZp?=
 =?us-ascii?Q?6+ydEHiEE46nBxetaz94+uBnNDjkuQHJG3zbT5hLKmOJW1MUqzC8JFjgtUt4?=
 =?us-ascii?Q?i+XbASr8KJ+blYyxf3HU2pewEKLXtf3dxmvHayo3BQX/ZRnmzCnltDDhgZ49?=
 =?us-ascii?Q?NqJjaoJQdFdh+Zen4tuM0r1RqTZcevuxbCCidVvwdI6A67PodVrY7LyxhjbC?=
 =?us-ascii?Q?UNm1D5DzizlG2/R7qWIhCp37mIVaSxwQdAr2tXHWsFc5zlROQS5jULEbXC9w?=
 =?us-ascii?Q?QA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74d4f1d7-98b7-4dde-c93d-08de16982830
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 03:06:30.0765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pt/emnIfBIWLZKSTngfyo02HVKMTa+xQxXgf+9ygekrhQIW3UTrrcB01nFoYNAzScdKBIvXNvt7eFoECdmYAa7EhxKfO7/UWZsQdfcz0oOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8546
X-Proofpoint-ORIG-GUID: KwdhzU8IUxPlGQPKgVfCsSyQKgYijKIt
X-Proofpoint-GUID: KwdhzU8IUxPlGQPKgVfCsSyQKgYijKIt
X-Authority-Analysis: v=2.4 cv=UrRu9uwB c=1 sm=1 tr=0 ts=690184b8 cx=c_pps
 a=7v6vjeP3yXOm/Y6ajRpg3w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=QyXUC8HyAAAA:8 a=UxSvbUf5MOKH7wX9ivsA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAyMyBTYWx0ZWRfX9PCZ3WJcxk6E
 SJv/spraZmaTpLTSmGpvBS3Dc4YjlPRDa2GckM3aGExxHXwPjDMR4Yug+6Gzbz8whPskYhw2TqM
 jCE2ipyDSBYZNLe5XQk/JCT98XApi4l0qzRHNwOGiIQdLJedAeRI6elwr7OaoXjeu1SbifVMz9c
 PiUjlSJ3/tUp+iyNFtEcn5oE22Q+P+bcosFBZzGrUqRuV81jORQsIf0pSEtNEOGGKAr8isUSg0E
 XaD/Kawud7s2Mv81fT7BqMonEqkt1mRR42Ex5a9MC+CowtgnYFH/fAwf894PtDLBBdI00TEdb34
 aOxvpH7GR3X8XPdk6Izk7cGXyVBSM57WaiE+X7J8g6QhkI1aAFmzi/Vcr5KNyAjY+IczFdW9Vzt
 EDlHDXotocYN8GeK0g+NZtIxWB35zA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290023
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 03:06:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121140

From: Guocai He <guocai.he.cn@windriver.com>

Fix follow runtime error: ./build_support/src/sniff_mq_prio_max:
/lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.34' not found (required by
./build_support/src/sniff_mq_prio_max)

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
(cherry picked from commit 40db628f58f6d786bbc24cf8438c17f223eb65d7)
Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
 ...ndle-runtime-errors-and-return-None-.patch | 47 +++++++++++++++++++
 .../python/python3-posix-ipc_1.2.0.bb         |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-posix-ipc/0004-build_support-handle-runtime-errors-and-return-None-.patch

diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc/0004-build_support-handle-runtime-errors-and-return-None-.patch b/meta-python/recipes-devtools/python/python3-posix-ipc/0004-build_support-handle-runtime-errors-and-return-None-.patch
new file mode 100644
index 0000000000..e84345a397
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc/0004-build_support-handle-runtime-errors-and-return-None-.patch
@@ -0,0 +1,47 @@
+From b079074048bc33b206b21f73fecb8173cf8adaf0 Mon Sep 17 00:00:00 2001
+From: Haixiao Yan <haixiao.yan.cn@windriver.com>
+Date: Mon, 15 Sep 2025 21:15:45 +0800
+Subject: [PATCH] build_support: handle runtime errors and return None for
+ invalid max_priority
+
+When cross-compiling, test binaries may fail to execute on the host system if
+the target toolchain was built against a newer glibc version than what is
+available on the host.
+
+For example, on Ubuntu 20.04 the following error occurs:
+
+./build_support/src/sniff_mq_prio_max: /lib/x86_64-linux-gnu/libc.so.6: version
+`GLIBC_2.34' not found (required by ./build_support/src/sniff_mq_prio_max)
+
+This change ensures that such runtime errors are gracefully handled, and
+max_priority is set to None when the test binary cannot be executed.
+
+Upstream-Status: Pending
+
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
+---
+ build_support/discover_system_info.py | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/build_support/discover_system_info.py b/build_support/discover_system_info.py
+index f6e6c8cbe6ba..4fec48b5529d 100644
+--- a/build_support/discover_system_info.py
++++ b/build_support/discover_system_info.py
+@@ -75,8 +75,12 @@ def compile_and_run(filename, linker_options=""):
+     if does_build_succeed(filename, linker_options=""):
+         try:
+             s = subprocess.Popen(["./build_support/src/%s" % filename[:-2]],
+-                                 stdout=subprocess.PIPE).communicate()[0]
+-            return s.strip().decode()
++                                 stdout=subprocess.PIPE, stderr=subprocess.PIPE)
++            stdout, stderr = s.communicate()
++            if s.returncode != 0:
++                # runtime error
++                return None
++            return stdout.strip().decode()
+         except Exception:
+             # execution resulted in an error
+             return None
+-- 
+2.25.1
+
diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb b/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
index 05a73f2896..e955108d3e 100644
--- a/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
@@ -13,5 +13,6 @@ SRC_URI += " \
     file://0001-build_support-use-source-filename-instead-of-foo-for.patch \
     file://0002-build_support-handle-empty-max_priority-value-as-Non.patch \
     file://0003-build_support-use-does_build_succeed-in-compile_and_.patch \
+    file://0004-build_support-handle-runtime-errors-and-return-None-.patch \
 "
 inherit pypi python_setuptools_build_meta
-- 
2.34.1


