Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1987F9B61F
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 11:16:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.80149.1776856110475919571
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2026 04:08:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=m3gfs60e;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8572cb5ccd=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M56Vwm2864429
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 10:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=bLZlLQAat/uyT0eHtMBE
	S5lJxdpxCgzseGu0x+91Er8=; b=m3gfs60eVI6TJ9ubT823mNPKMObhBSZGkG+m
	iO8VijergHgwKEtYwbiVFR0JPVXBJERurqz19YERHBTtlG5HxfG804ezm9xZK/EU
	BRLqLNkZr8zK8B2sS8zNGPd/eDocmgAQhViVrMKL3+7dbw4j+HwGf2cFtBK89JhJ
	Qcn8CMTwV84xWq1UnA3VPOzrT3xfJ/na7dTBqwcbn6gBNMonXGEXiu0tIcCiwFVd
	8cXTWyxqLk9YijdE+tsiLFeyx2DdyEXBEmRuHZ6cyznBfJjZo9X6DcqJWKZHJuSh
	7vfpk5F/AyxU52hem0CBdff9S9zZg3YNKoHmsVZRqc0QumqHRg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011049.outbound.protection.outlook.com [40.107.208.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dpenx0t8s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 10:47:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HKE4NxANmOFPtGH7WkHdW8znjFNpZcQH8DpoYFcX8t/sGLo28quFmoyhANnWr8PQxKrP3DStmQBBbHydD5dUyZdNBbGJLrXrGl5SctyV5PZO6fvX+FaduwzotIvahIDS6R5G4Me7XbfNwYr7ehpBpYz5GdBlfCCRXQZ/UwQXUUNCsuzMMN8OCkUG3i6KpyfAX1K+z259HuMpHAoiIFqqGz4HY9w+Sou+BjZo0BJFTcG/m1cuQogOm1n0vrzU1mIapb15QlpkmQWgES9C0UH2KUjcC9Z7rPc7jDybzUXKI+Kd4B2q7f/jP3lTIL6WkckEYRZpzyBQJFcPFqH3p148iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLZlLQAat/uyT0eHtMBES5lJxdpxCgzseGu0x+91Er8=;
 b=m4P9dRtMrkNcicf5ai/ykWv79NOVlbyWsa/gpuLZmJoq2WVnluPytJ8YvZcNPACXSgA18uTf87dwEJlcf1GeDWIjlhLncAFzH4xUnLVBPwKfTKkgi51SNnTDbT/bLOuavVbJKgOOq/9UJX9XZn03hQkvx8i/Uf8nsmQ6UWhHGMG9baFq+BVw8IUhASc9yVSmaf72tZUz2wbRgUEcJpGKPSe1dV8/rBeFj4/5P+LyHsZ6j8xqxgOaufBiVjzyOZQFQD8ORolYp+mGTfvcXB4bNfbYN/obtNBZd3BPJKYe6yQTDhbsE7tfO6SkuL8TxhU3zktqdthq/rrVOM8OQ6I2Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPF641CF4859.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::26) by SJ5PPFA058327E4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::849) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Wed, 22 Apr
 2026 10:47:11 +0000
Received: from DS4PPF641CF4859.namprd11.prod.outlook.com
 ([fe80::794e:2099:77b9:92f6]) by DS4PPF641CF4859.namprd11.prod.outlook.com
 ([fe80::794e:2099:77b9:92f6%6]) with mapi id 15.20.9818.017; Wed, 22 Apr 2026
 10:47:11 +0000
From: Xiangyu Chen <xiangyu.chen@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][scarthgap][PATCH] pahole: upgrade 1.25 -> 1.29
Date: Wed, 22 Apr 2026 18:46:59 +0800
Message-Id: <20260422104659.1814004-1-xiangyu.chen@windriver.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SG2PR04CA0166.apcprd04.prod.outlook.com (2603:1096:4::28)
 To DS4PPF641CF4859.namprd11.prod.outlook.com (2603:10b6:f:fc02::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF641CF4859:EE_|SJ5PPFA058327E4:EE_
X-MS-Office365-Filtering-Correlation-Id: d3a5da24-333f-452d-7ca3-08dea05c8209
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	iR0SZ8Fn8boerlItbGKxquaayFUAH+yyW82gpURorDnFwbWba/VLq3DZq6TyyFkjGSVprQ00MRwkDjU6qcCxyPGpWsXcNPVsB7WEy4dO5FjPZoawH9V1rSZuayvjGOiRIezg/v/2eXqamske+EUe7QZgkTS9Qw/z2UjjZrBwH0+wmZD6WymVvqZYMKsUNN23aHuiUSkCXELPisWRnRKpUYAfeW0gS1o7FeXkE5lS/U0JhuVkf0l5Q+2VuagBEqGexwg2HvdHH2AplLTCxGo4mBGOZ/HI1a0TcMws56norP7Ds/PLrJu6Az5WBccqnxlk1masLeircrm8ttcCRvMSVpzsrIuZEn/jysJnEDw208VNYd+BBHyrTiQ2vBzrMN+Cf5GuDkGcWMnYj3b2/RqgEAUQrsQT0IsKmFcAVaWSrmRPoEEOJ1rkqwaZ5maLTjc8FoBJvP5vFz0IdYc6X07D4oVXyZ52fz+jkAT+fLl8+amK6P+hLwZ+cxZpw7+STzy2sQWZ/jJMFQ8rO3NU2NXq+wNX7Ib6u000njTaWSj4d0NtREihyo0P8dSt+KCXEPtuzHDzuoaU7qR2Y49QomL00dQGfpRD/ZzCaNDLb4l9xKS6ZESIp/cswfhComMwUqmcQkX51zrsyk/E/BcKeJ0W7aLNdtlvOgg9iCwAGJrhgdG1IH8Aki5Pz1/ppEcvRFF0lQZwb2iVb82Lr0KNOzSSod742gTWTaTyNXfZzlLfDvJHHnMPv759vQjcc+dHOULI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF641CF4859.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Gygcky4eTfjjBi4nEoHvjSnTZofP+pLR+dMgbhfyVWpzyUEnvnefusGhLhm+?=
 =?us-ascii?Q?o1WIu9PDALFW14cPFooB6LpPb29tsk2IQmWi5AC14Xz5d19pozJQpOQj8lcL?=
 =?us-ascii?Q?k2zvoCQFaoxSLB28Caz4LJU9+UIenAnFfxcoPWIho5xZz1OyDay/80VEQNRt?=
 =?us-ascii?Q?ev7EoOkwuwhMdEmtxM39DnIJ2jQHYzwhDu26eY86sf9+yWZ6+QZ/XDETqKFp?=
 =?us-ascii?Q?Z10rJVlDl7z/hksaR81JN/Rk324kh8CMy9NkYODMm8DWaCRJ8qWVqbDMtDma?=
 =?us-ascii?Q?nwWlnFyFwDUHfeNhhcCEpNi1Ra143yAcbrdHYbYmjXs17w3k3xoAN8TdJ7zv?=
 =?us-ascii?Q?OeWMnTNqw+wVRDpxPFgunlCE30wOA9Xrvlj/DFVHaCa/aQLYLQBhazKQYog4?=
 =?us-ascii?Q?3xVpJ+ZDi2caA9hF+WRb+jQXGEDPjDIEx9pPsBHUfi43RlS+TB4AqGNhp3qF?=
 =?us-ascii?Q?Do8V5LZGlUkjYcQgMaf8buTwDHq9ZfJsSWgzLXhOZOo/vVdkaYFUwq+zcqjW?=
 =?us-ascii?Q?B2sWCUrlhsfycw0KwAu/uli9zkCr9sA7MqWe9SnYV9Xb+h81MksAUog+hliT?=
 =?us-ascii?Q?FzqRihxT8noJ2KdwYUGZc24iQf1XfAgQI/vUqxgWHyM+tClJRBZe80iLxdFJ?=
 =?us-ascii?Q?INim1S/LBZ+UVyUDzmGhTcSkH12IbS+c2+4AiOq63FJ5ZVREw5evxCcS8u5z?=
 =?us-ascii?Q?89M0aAObZ7bATTIZ4JAk13SMycPSKIJvoWX+XXxhun1R6PjavaPF5mG13Lqa?=
 =?us-ascii?Q?0lqIzE8+/bp+cClYl82DSdL6F0wGh9juUL7pnAWvwebcc4DQnEFYeDrA5604?=
 =?us-ascii?Q?w2klXuLkuGdKcRK/jkiU2B6GkU3w9xJIWQbIewV9dMrO8lvHVpELNnP/KbQc?=
 =?us-ascii?Q?0yBoldNNuSTyr1tXKSJIRuFZz8Q4FNEaMPmQCs7Gas7vRTuX3pxvvRU9rihL?=
 =?us-ascii?Q?bZ/TL9P5B9cBY3kqsbyyVbBLJUNLOd3lDHguDjqM8hqA0vBUJWRslD2ddFnZ?=
 =?us-ascii?Q?yCj7rad4m+s0RMHIWrpC6tuke6VPXs5YDJ6+j3juGIJpe23nyv7YKqAAkHuw?=
 =?us-ascii?Q?i7gsjyXF7CldY+jnVbb5wzfl9WDNZ69ngJmCjRfZkzpi/vjC3uQgMxer/V79?=
 =?us-ascii?Q?v3/F+NVyGYE4Y7Mg81uSGr1oxRweQwiSTwLUSHc3IAjgifUyxV0IHyPgDhet?=
 =?us-ascii?Q?6EF8uWLytv/6j5fchz9AyPVy9XCV+ZssMGIlTLY0RpyKORgpu7UiuGkXgT9L?=
 =?us-ascii?Q?nYF+KshimZ3eHg2dU0Cp7djHJKleUs/tJ1EKCI4mywq1ALtpmN6cSDifHy5B?=
 =?us-ascii?Q?f7Pc4QIZ7gG3z/9mg66sqEAsgCXPojrweMjVE0cbLe5c7RYyaEGdMPct6y6C?=
 =?us-ascii?Q?R5awF8ilOdwi8JKcRvwTi4q8f7OX2bHPcxfXnlV5bTCAa6U/Sp1pzXNATTrV?=
 =?us-ascii?Q?tjAVXP7+an9PxO0O7gIvQoc3KR2q4FJtJUiP8pcLeG5H8bY2dLbeLct11L0h?=
 =?us-ascii?Q?ecQQ9Xddu+CH4G+ZM3ZV1wuJLlql4yfekVwN5lVJJtFhZ6CYot0a/mM1ZACP?=
 =?us-ascii?Q?IzIMfNxWr/eis+tFkVV4yuypOLsdUar0fLFQoYM1QRtHIsircvidwkr2Dib0?=
 =?us-ascii?Q?Dc/M8HZCoXODnBPA5DXKGOFBwHeOJduZuByNhQYEN7++9D6htFUbDSXso9kk?=
 =?us-ascii?Q?buHyTXlWZ/TwAzDCKwc3WL/zOaMiwkelhjSi5oGfiARWMnsUl7ltiAR8WIlJ?=
 =?us-ascii?Q?KyVCh7BSRrZGeOPg4bDbEni27HMyCn8=3D?=
X-Exchange-RoutingPolicyChecked: 
	PbbjzSJvJSxV3DmIA6G68uJ/LaUGtPVbtKPYGIlBSmk9v8C69ilXPwbcYvDI6yaMutgRRfy59n3we7PGW0zGEeEQTVsNmTI7ocF/YmDwipZ27NVihoDZbLHWsbiInahmMuB2jB9J8hbh1tre3H7ZEngvRh7CNjwdvMhhFwCe1bRUl/IlgUNhzs8/XYSP3ly1uMexz1tM9901DYuWEp2FG1u5HHHW6n0C0Y/Kz7bo6/zOIwm3ULqHvu2Y4mSkwjrLvhI2UXHv2SZ0iCIGMYBbOziwvpWRF9tjtC87rbCqE3y4DY/g2dUbh7GNZZczZX+dhi7l0Ga8s6E9mbr4sVRgWA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3a5da24-333f-452d-7ca3-08dea05c8209
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF641CF4859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 10:47:11.4925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s7kQBHhrHG0pewX7Y+Bv5/3t6FJaNgPYREcPDnYV7M1KyK6rms0nipQBdIpJ6F60Pk5r6EU9CBAEhv5sEsApqXJWabL5JU0pp3CNuG7mDc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFA058327E4
X-Proofpoint-GUID: JVYeYNl2VD0ujpfYxGqO2ft-PMyp7yZG
X-Proofpoint-ORIG-GUID: JVYeYNl2VD0ujpfYxGqO2ft-PMyp7yZG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwMyBTYWx0ZWRfX1XZnjs/Bt5b7
 Ax9bO5wVAjiOWdBGlrWo/8DFlwIGR4P3DJ5/f9Bi1/+XSWG6TXsD4RB5JVqybKPwiVw3YiZL8bU
 W95QdmHy1mAMi6F0SmNMGvHKrIqEXl05Bxbjn27F3ZX/3NI7r0atCg+rfL+3fWsOwlQOn+yvanq
 PZ4onEVI4ZnWlXlA4LXRfI8KYKWxtel8yEUk+esZVvM54c77ezGXv45m7mGR/LEhr/uH16Mafbj
 MpeP6BcfpsVDNJZSxj83zrFZ4rTPniCd9LmhPSoC46Xc0ky+03VNjM2UoxqxXC6j7mrXxqshzV+
 5l8OYMg//L+ivUic7bLGrxWHFuj7CSq9HwaMmlJCeRB5GPUs7UgSP5d71KXXmOjgNIXucm8XmSf
 /XkHEhLVjFE2fpxrma5aQsXhGodoBvznYcC7q1k2KGnUum/a66pE/817ZzCK2aNkRnRBzVBK/46
 z81w8OJH75qfzh09AVQ==
X-Authority-Analysis: v=2.4 cv=ScrHsPRu c=1 sm=1 tr=0 ts=69e8a732 cx=c_pps
 a=9TxNVFKjsEmGPsTOmRxrqw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=VwQbUJbxAAAA:8
 a=t7CeM3EgAAAA:8 a=yMhMjlubAAAA:8 a=20KFwNOVAAAA:8 a=yPCof4ZbAAAA:8
 a=phSrvZsk4bRkOxLkj6gA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 clxscore=1011
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220103
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 11:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126550

From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>

pahole v1.25 in scarthgap non-deterministic BTF type ID ordering when using
its parallel mode (-j).
The kernel build system (scripts/pahole-flags.sh) automatically passes -j to
pahole for versions >= 1.22. This means two builds from identical source produce
different vmlinux binaries with different .BTF sections, even though the bitBake
task hash is the same.

It was fixed in pahole v1.29 (Jan 2025, commit 4c916259) which made reproducible
builds always-on by default.

Since Scarthgap is a stable release, the current v1.25 is retained to support
users who require the older version. Users can revert to it by setting
PREFERRED_VERSION_pahole = "1.25".

Additionally, the patches:
0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch
0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch
are backported from Walnasacar to resolve specific issues in v1.29.

Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
---
 ...python3-instead-of-just-usr-bin-pyth.patch | 34 ++++++++++++
 ...r-Fix-elf_functions-cleanup-on-error.patch | 55 +++++++++++++++++++
 .../recipes-devtools/pahole/pahole_1.29.bb    | 33 +++++++++++
 3 files changed, 122 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/pahole/files/0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch
 create mode 100644 meta-oe/recipes-devtools/pahole/files/0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch
 create mode 100644 meta-oe/recipes-devtools/pahole/pahole_1.29.bb

diff --git a/meta-oe/recipes-devtools/pahole/files/0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch b/meta-oe/recipes-devtools/pahole/files/0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch
new file mode 100644
index 0000000000..7dc18d7aa2
--- /dev/null
+++ b/meta-oe/recipes-devtools/pahole/files/0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch
@@ -0,0 +1,34 @@
+From 436163ab845c263312cf3d4717a43727cf5f0747 Mon Sep 17 00:00:00 2001
+From: Matteo Croce <mcroce@microsoft.com>
+Date: Wed, 15 Sep 2021 17:54:01 +0200
+Subject: [PATCH] Use /usr/bin/env python3 instead of just /usr/bin/python3
+
+Upstream-Status: Inappropriate [OE specific]
+---
+ ostra/ostra-cg        | 2 +-
+ ostra/python/ostra.py | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/ostra/ostra-cg b/ostra/ostra-cg
+index 52c902e..8142e67 100755
+--- a/ostra/ostra-cg
++++ b/ostra/ostra-cg
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python3
++#!/usr/bin/env python3
+ # ostra-cg - generate callgraphs from encoded trace
+ #
+ # Arnaldo Carvalho de Melo <acme@redhat.com>
+diff --git a/ostra/python/ostra.py b/ostra/python/ostra.py
+index 86fe079..9bb5ad1 100755
+--- a/ostra/python/ostra.py
++++ b/ostra/python/ostra.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python3
++#!/usr/bin/env python3
+ #
+ # Copyright (C) 2005, 2006, 2007 Arnaldo Carvalho de Melo
+ #
+-- 
+2.31.1
+
diff --git a/meta-oe/recipes-devtools/pahole/files/0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch b/meta-oe/recipes-devtools/pahole/files/0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch
new file mode 100644
index 0000000000..fb779481d8
--- /dev/null
+++ b/meta-oe/recipes-devtools/pahole/files/0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch
@@ -0,0 +1,55 @@
+From 6fa2b7de3e647e64c5d693aea7f3bacbfa964f53 Mon Sep 17 00:00:00 2001
+From: Ihor Solodari <ihor.solodrai@linux.dev>
+Date: Wed, 20 Aug 2025 09:00:03 +0100
+Subject: [PATCH] btf_encoder: Fix elf_functions cleanup on error
+
+When elf_functions__new() errors out and jumps to
+elf_functions__delete(), pahole segfaults on attempt to list_del() the
+elf_functions instance from a list, to which it was never added.
+
+Fix this by moving list_del() call out of elf_functions__delete().
+Remove from the list only on normal cleanup in
+elf_functions_list__clear().
+
+v1:
+https://lore.kernel.org/dwarves/979a1ac4-21d3-4384-8ce4-d10f41887088@linux.dev/
+
+Closes:
+https://lore.kernel.org/dwarves/24bcc853-533c-42ab-bc37-0c13e0baa217@windriver.com/
+Reported-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
+Reviewed-by: Arnaldo Carvalho de Melo <acme@redhat.com>
+Link: https://lore.kernel.org/dwarves/acef4a0e-7d3b-4e05-b3ca-1007580f2754@linux.dev/
+Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/devel/pahole/pahole.git/commit/?h=next&id=fe6738f4b46b63dcdc5b15b252a014b3eaba16a4]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ btf_encoder.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/btf_encoder.c b/btf_encoder.c
+index 511c1ea..2f8c6bb 100644
+--- a/btf_encoder.c
++++ b/btf_encoder.c
+@@ -162,7 +162,6 @@ static inline void elf_functions__delete(struct elf_functions *funcs)
+ 		free(funcs->entries[i].alias);
+ 	free(funcs->entries);
+ 	elf_symtab__delete(funcs->symtab);
+-	list_del(&funcs->node);
+ 	free(funcs);
+ }
+ 
+@@ -204,6 +203,7 @@ static inline void elf_functions_list__clear(struct list_head *elf_functions_lis
+ 
+ 	list_for_each_safe(pos, tmp, elf_functions_list) {
+ 		funcs = list_entry(pos, struct elf_functions, node);
++		list_del(&funcs->node);
+ 		elf_functions__delete(funcs);
+ 	}
+ }
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.29.bb b/meta-oe/recipes-devtools/pahole/pahole_1.29.bb
new file mode 100644
index 0000000000..b5110d05f5
--- /dev/null
+++ b/meta-oe/recipes-devtools/pahole/pahole_1.29.bb
@@ -0,0 +1,33 @@
+SUMMARY = "Shows and manipulates data structure layout"
+
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+DEPENDS = "elfutils zlib libbpf"
+
+# Depends on MACHINE_ARCH libbpf
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64|riscv64|powerpc|powerpc64|mips64).*-linux"
+
+SRCREV = "b9cc7963051b2099795129450f9b70c81950d02f"
+SRC_URI = "git://git.kernel.org/pub/scm/devel/pahole/pahole.git;branch=master \
+           file://0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch \
+           file://0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch"
+
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig
+
+PACKAGECONFIG[python3] = ",,python3,python3-core"
+
+EXTRA_OECMAKE = "-D__LIB=${@os.path.relpath(d.getVar('libdir'), d.getVar('prefix') + '/')} -DCMAKE_BUILD_TYPE=Release -DLIBBPF_EMBEDDED=OFF"
+
+FILES:${PN} =  "${bindir}/pahole \
+		${libdir}/libdwarves.so* \
+		${libdir}/libdwarves_reorganize.so*"
+
+PACKAGES += "${PN}-extra"
+FILES:${PN}-extra = "${datadir} ${bindir} ${libdir}/libdwarves_emit.so*"
+RDEPENDS:${PN}-extra += "bash python3-core"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


