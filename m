Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9EAACCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 06:13:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2473.1761632017164653242
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 23:13:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qSKoW6Ps;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2396428d41=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S5I6Sr2397973
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 23:13:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=ozDEYgKEMg+Uzn7odRlx
	HQ4JL+lvmbDtPtFP4QbDP54=; b=qSKoW6PsXC6XzN0nOnV/GtOTDndubad+AqRI
	FXXM/hgzl459dCHnbiNT2V/wYDpoMaJbAnt46Lt4F7G3WvxscflsdLfqDnROg5Xr
	X2ZmoQ8IlquZseT2IGFILdy5wDp2fg1pBad51BZhSa5tG94J0zgdnj9A/cmmKC7S
	emndxnbxwocF936lc+69FkeZ9HGO2ZdG7rLtC/AeEWKE0Qe5Ng5RCJE89R0w3J8N
	cES2EbVG/6CmYKvh2sNxiNm2CesKwdM0piHZu9FV2bXJKtppDS0QQolY80kZlBBM
	guuqEQ/GoxP3iiJ+1c5uhrI+WOV5PxhC+XUF8vNw4+9smQu/Yw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012057.outbound.protection.outlook.com [52.101.48.57])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a0x2e2hue-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 23:13:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LWQNQlA2C5ykM/wpZvPg9R5S4fBBBagF1beyQNVCQA1sikYFv6FxsDn7MWs4N6RI80vMerRNdrwS1BDWOaAbEp5YS6cfMT/LF7AaxhuYujpL3Whx7eA81Y56VGcU3lTHAr8Yqr34LneZo0crVwykt4hdNxLsWfywRww22NWsJJ3q5GOgWFDJimAVZtgvd9aCL5ErhCNltOgraVaI7n5rrrqqU2nCYHGyMUTGfm4TK51qJWwxzVVuRV6K2dTZNzShIwSI7swnDFKZSmh88YN+16JDa5bgkIAv0zBTmT10AHgK6XByXN7OK9WCVoKZWHDhnOi3/B2VQFTBJjpjrCk+6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozDEYgKEMg+Uzn7odRlxHQ4JL+lvmbDtPtFP4QbDP54=;
 b=AvvBYOvzCDcE7nLgG+osFUIzWYngSPR8RvgITYFbfL7lIIpUg1D3h1cg5E5+/ZmE+p9c2j1TpcTv3RpYz+dbViyO7qPd2TAFY+60LFJKPC0d5xQg7ns4UBLmJXW8WPW4ecBvRric6II7H1q516tHR/wCCmVO1GBc3DjB6kP0xCgDZrFnmQ5U9alxNsQXCKmG4rrV6LrEkRQvfU/esOW2VSkjULoI5wSnRidV7dgI/o4imxUWtPmcsKIS5wOomfbL2dyXTMIQ5u55o83Icx/R1ECQzfL/DIc/4Ng4maFJAYpaGZHF7j30/ZypFHJYAw1iihFUXKnEdJXPLw7jmYeBbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by IA1PR11MB9494.namprd11.prod.outlook.com (2603:10b6:208:59c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 06:13:34 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 06:13:34 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH] frr: fix CVE-2024-31949
Date: Tue, 28 Oct 2025 14:13:22 +0800
Message-ID: <20251028061322.2651413-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KL1PR01CA0146.apcprd01.prod.exchangelabs.com
 (2603:1096:820:149::9) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|IA1PR11MB9494:EE_
X-MS-Office365-Filtering-Correlation-Id: 03c15329-c4d5-4ff0-be2c-08de15e91fcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sAE6XGAXoAJSXlZ16Ri0lZx3qH1AFWcuFkVpdahCYNSqzzjqRSDXk8DD0wfY?=
 =?us-ascii?Q?11CN2jVf/WA5jfk09iWWk3/BRUTRWkLQGZxxaQeW1jwXqWnIORjZ4L4K4laP?=
 =?us-ascii?Q?2y4Ns7e9sOA5mXMCR0k72bPQeMi0DTJlG06T21wlb3et8KaHkhyN5AF7e+Kq?=
 =?us-ascii?Q?Oqz+epMItUuA1tM9o+0II2SdLgTEHWA3Q2By+BDEfVhtlqbOjhLvjun2HbzO?=
 =?us-ascii?Q?iYVI52k6xrgsz1C4hxI5ly8WZgHJ843LD/o7W+moWzqqInk8XeoA4E0+ECdW?=
 =?us-ascii?Q?YP/ZANZIeOfKcn2w37OaAAN2WKlZqesKI9iA6M1qVacRwRJOvxW8VXElmrGc?=
 =?us-ascii?Q?AnVGwy5ZoKF7IJcQHWY8XoNCitkzG3kUxkZuWdu2tpGJA7W/nS0Imnnb+YXR?=
 =?us-ascii?Q?EFsD5DnsxT8X4Tz0rvZYLI49m6WRdKksrfgbenAGWkaX3Cs1IU0qfwo2AqfX?=
 =?us-ascii?Q?WChe8yXw+P3dmmyUBCyLEQMHhKU/W15BvO4qPD3bhimmH/GoBLE7xv83ZYx1?=
 =?us-ascii?Q?+DwJFHgemnU9gMd15N6UmPdRCDvyRvn24QnYGLGdBqwUWa/05FqU0uOkz3Sa?=
 =?us-ascii?Q?sXwlxbo8qNIIHqkmZ0s7BKFsZqoULwH5ss/q5tvBXbFgkglHVUautJsKjdk/?=
 =?us-ascii?Q?phTUB6Vk8uPUckwFYh08sFruEZSRrKWKfq2/RQKvpUwjkXfFcfZDBUlQPzaD?=
 =?us-ascii?Q?Zf98bEqcWfpYsZNtpzJO5UIl+2rOlXOa1glUtLd6DIONBbp+YrQE6pkNn2OK?=
 =?us-ascii?Q?ExvdSCtR3FU3CAiRsbcs44howDM2xXFhwuWvc9u2vHMJLSw4Ez6CS3LxDeU4?=
 =?us-ascii?Q?XnX6yAu6UQal0WXAgQatm2MkrI5Qnxynih/WPzQqXjuhvLwCocDHZdqIPNzk?=
 =?us-ascii?Q?iRvDDF1ugVTxHBvJMl/BbkYteJgYgV0xMzIrxWXuRuYgOTxcOo9hrrtxLuFG?=
 =?us-ascii?Q?b3vV/mvX+h6mJgVsOKEjBzy2GHHRZK44b2j3I2JOhqThNmcxyR+0oc0KT5gJ?=
 =?us-ascii?Q?nDitBd8mXOTMyittVzGdJSZ1tFS2aS3g9XHRIIRonVA0VzPFyO3Z6BuHk8PE?=
 =?us-ascii?Q?rvqeC6rfMzo/1yyZCI/TYcRx9ETJTBi9tqvtd5LRcQXjEgXuw8mzKGEb/UuI?=
 =?us-ascii?Q?p5hLgfQLsGxP29Xq4s3xLmFsF6y7DI7RN/UtGUbz///4A1RWp4gFYJMmhthG?=
 =?us-ascii?Q?pDSSvW9K7Pv/T7cTn2sWbiqtt27JreDjHHGDfLNFUQn3v4SSXcFk1nQox/iP?=
 =?us-ascii?Q?mz8+N+qid2le/198HEq2liEWjLSZlBc0CVLcgm1OXnBwmuprj5n7FVDgGE4+?=
 =?us-ascii?Q?PsevE8fm1/Y2YC+QsZTHIg1+VNbvCkjLTodQ4qqV85K6uurCFkJ+UUsmVnaC?=
 =?us-ascii?Q?ySzeN7KzCpYjmdTbs71umKYrPWD3FIuxxQbvNoa+sYK56yQnQtnF1i+eAp/O?=
 =?us-ascii?Q?/NLmHNd6Z+trc5BIhTDgikXe3JsGKwDZD8Qqm1Ny0AMnE+lD2S3bng=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CpuMQ+sIctax1A2mtELUyxD3Am6zkiV2QUaIN988wparAO1n9AItEI0gut0w?=
 =?us-ascii?Q?LQi6P4NsbLjq4LM8xG6zHujCw1J6aBprH5F/R0z1UCWLEC2Qt5+q1nfU6Bd1?=
 =?us-ascii?Q?iYRrN550HzvJfOqEMNlOm/7mCXsvwlc6r0OwUSk/JSQ6MJaoVow5T5z2Y5E2?=
 =?us-ascii?Q?jHd9ctsR/n077ei9wt9Hz3dI2RUn+kqxRkq4nuJ7yihw2oVL4Jce+Qe8iecc?=
 =?us-ascii?Q?Vkfc/eg59g1wzxOzuRyzWnRzmFpj8W8A7d3I93WYyWnwsgIsMIzm6DBB+I6o?=
 =?us-ascii?Q?5WD1iEdGiVbmO3cVboKg2+WCBSQ6HYWlG3RBWpVpxHRza7DnKZL0EOAvJAO7?=
 =?us-ascii?Q?STplAXpTJ+8HQ1ff7sI9lZwMDfgA3X5cOmwQuQUaQ1qz439ekxwZQc/vZjYB?=
 =?us-ascii?Q?4f1gCbM4ix8g+Reo7WrDFk0Q+Ne1MbAeELvN3GGpfmeB8zONWJ546uUKR4ce?=
 =?us-ascii?Q?26W4KrkpTp47nOFa6uWIpKb11yTZ8sbGQ1pa+ljxqNT24wquqH8r3Jl16TlF?=
 =?us-ascii?Q?hcl2l28pZzbp/06gxMbxQv1GcslhINNd4zEoJsjQx39psM7ZmbZ4+sLw6SW+?=
 =?us-ascii?Q?kuAesjiiF9aOjrjfp0Dr1Q1s9NntaPBFz3ZKE/LyArc3KtKrhK6BVRg6gx1P?=
 =?us-ascii?Q?e4gekpt89/ppaArBZvJ8tdKpsttdFaJPcSyfOjBUgP3fZs8jfKphVgGvr8Sr?=
 =?us-ascii?Q?GSsNOoOK0j6N/zVJJKg6vgkfTcGbDpTpnMkQQJrsYOLlEcp2KnMop3aBECPA?=
 =?us-ascii?Q?13H74TnZLpSN3D3pZSelDwpoVuavNy49ZfHNpWE8G5OAVFbazFijXyB19HOZ?=
 =?us-ascii?Q?ycbSSFBYszBOF1Tz2kMr5C00VgIBBLrrvk+0dbEt6us+iOp5TD0VxcAFbMxJ?=
 =?us-ascii?Q?FQsop3LyX6zsyQGxB6/c+okUlnExKWxLx4lPPA+8xUZTP5gxGoEiEKvGzaKC?=
 =?us-ascii?Q?c55ows8272ApNDTdIhRHK0KmGrCKjHZwhtHi9bwBaNaAvhpsTK5L1aiDUDfY?=
 =?us-ascii?Q?rFc6336s26yc/5VKmp4b1e76llreiFEa52XSVlby7VbolXcZZwqZgWXm+aQd?=
 =?us-ascii?Q?vZnVCmeijXvuH0iSxOxfc6YAGkT3tQt/fpCoUWDwleGvpSjvZhaL8MeSsSGG?=
 =?us-ascii?Q?JU0XqK3u38cNOeakXVFMNCrweH5Ke34sJNtiDBq76HPupXqbSCibNOCUR9eH?=
 =?us-ascii?Q?OIyCpZZYs0frz6N4Ku+1VbNF3eNHJMJovTp1UVRX222lF3YQ2P48DEry6cOi?=
 =?us-ascii?Q?NwH/QhL7Z3SVAfW+65XjLXBGYwezOmEuR++LV44/Ec+TJW8s8KzznZ94WVYL?=
 =?us-ascii?Q?OJP3A+2kNYPfli6ON43St9WQJrycEVv9JXMJRAEj9qOctfylBZsLZE9MTIO7?=
 =?us-ascii?Q?KWROWe65QLQ0pWDmkZyBveM5CWDpEh/cPQGCA1PAiaeISFhg2+HQUA8EmuOf?=
 =?us-ascii?Q?B7Gq5XFh9ptPS5vzQXLEg+ctZS1scP2vPgBg34K++ONWh+pPNUf74iNp7Qg+?=
 =?us-ascii?Q?Vb0FJBfnKFYVZOb9yrkoKJJx3GTbbgZqTRdIm6sJOruGDniiKxbXr19MzYJ9?=
 =?us-ascii?Q?PTiwHTxvX8+jYsCPMiJQ36ClfmOU23C0fY66QOg2hooJAv8733XSMNmRic8r?=
 =?us-ascii?Q?zg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c15329-c4d5-4ff0-be2c-08de15e91fcd
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 06:13:34.2327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3gxNlUKfbJrDfjgCaeOpx1AGROIWWMLBFfNusaBNrJGNwdzIinagxxGaj5BjhtQDTUuFuUViMk413NENl6lPIdfzBnVLGQw+L0EMS4HV2Xo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9494
X-Proofpoint-ORIG-GUID: pxHuIOjfa8nrAcwTot239i84B0BxKu53
X-Proofpoint-GUID: pxHuIOjfa8nrAcwTot239i84B0BxKu53
X-Authority-Analysis: v=2.4 cv=F6Zat6hN c=1 sm=1 tr=0 ts=69005f10 cx=c_pps
 a=7NJmVDyNEcEWmOhjwSrRAw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=PYnjg3YJAAAA:8 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=87jn28RfAAAA:8 a=vggBfdFIAAAA:8 a=x_lAc-YVYSfnS8hO9p8A:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=aVDrfO6s1PESLM1EhDzk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA1MiBTYWx0ZWRfX2mrez5Hp/DCp
 KTCQGEf7PINrPcjVVGpO48wWm6cIsEv2sUBY8mroJ9pA7zmwaGv1J09WpCJ9/ZjFqRgFvdsP1l/
 MFTV3379WzfHrJHto7/jBRm1G8Acdez+/8RaoG72xG5XatElYevD9FnAdyPB2oVYV7pXoyemcxK
 dxPKHYvkpL7xOX2+4SkgXy59OS8f83Aq92arLk+s5VC5y/bHXv1lRu6ZmpcbQL/MEAVYKqvR2QG
 i/BfbFbeLhZ8/kc8vW/8mpU/vNK9Ft3P/HZp7ajyiu+DGY42ksUURVIfhsC8n4PP6b0SVyKZpok
 DLI+O3YhWSdD/TLgsztTAicggsLAgiJ7DWGeNiJ/0uN7zaX+UlcWw0TwD/tyPyaUghsVqNUn/BA
 4uqEJLxA5Y3hHtanZB1chRjSLHZTVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280052
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 06:13:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121065

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2024-31949:
In FRRouting (FRR) through 9.1, an infinite loop can occur when receiving a MP/GR capability
as a dynamic capability because malformed data results in a pointer not advancing.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2024-31949]
[https://salsa.debian.org/lts-team/packages/frr/-/blob/debian/7.5.1-1.1+deb10u4/debian/patches/CVE-2024-31949.patch?ref_type=tags]

Upstream patches:
[https://github.com/FRRouting/frr/pull/15640/commits/30a332dad86fafd2b0b6c61d23de59ed969a219b]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../frr/frr/CVE-2024-31949.patch              | 153 ++++++++++++++++++
 .../recipes-protocols/frr/frr_8.2.2.bb        |   1 +
 2 files changed, 154 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024-31949.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2024-31949.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2024-31949.patch
new file mode 100644
index 0000000000..7d6c62e95f
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2024-31949.patch
@@ -0,0 +1,153 @@
+From 54816c5b32e5318fbd1ff8335adf7e8dd93e2415 Mon Sep 17 00:00:00 2001
+From: Donatas Abraitis <donatas@opensourcerouting.org>
+Date: Sat, 30 Mar 2024 15:35:18 +0200
+Subject: [PATCH] bgpd: Fix errors handling for MP/GR capabilities as dynamic
+ capability
+
+When receiving a MP/GR capability as dynamic capability, but malformed, do not
+forget to advance the pointer to avoid hitting infinity loop.
+
+After:
+```
+Mar 29 11:15:28 donatas-laptop bgpd[353550]: [GS0AQ-HKY0X] 127.0.0.1 rcv CAPABILITY
+Mar 29 11:15:28 donatas-laptop bgpd[353550]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 5, length 0
+Mar 29 11:15:28 donatas-laptop bgpd[353550]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 0, length 0
+Mar 29 11:15:28 donatas-laptop bgpd[353550]: [HFHDS-QT71N][EC 33554494] 127.0.0.1(donatas-pc): unrecognized capability code: 0 - ignored
+Mar 29 11:15:28 donatas-laptop bgpd[353550]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 0, code: 0, length 0
+Mar 29 11:15:28 donatas-laptop bgpd[353550]: [HFHDS-QT71N][EC 33554494] 127.0.0.1(donatas-pc): unrecognized capability code: 0 - ignored
+Mar 29 11:15:28 donatas-laptop bgpd[353550]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 0, code: 0, length 0
+Mar 29 11:15:28 donatas-laptop bgpd[353550]: [HFHDS-QT71N][EC 33554494] 127.0.0.1(donatas-pc): unrecognized capability code: 0 - ignored
+Mar 29 11:15:28 donatas-laptop bgpd[353550]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 0, code: 0, length 1
+Mar 29 11:15:28 donatas-laptop bgpd[353550]: [HFHDS-QT71N][EC 33554494] 127.0.0.1(donatas-pc): unrecognized capability code: 0 - ignored
+Mar 29 11:15:28 donatas-laptop bgpd[353550]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
+Mar 29 11:15:28 donatas-laptop bgpd[353550]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
+```
+
+Before:
+```
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
+```
+
+Reported-by: Iggy Frankovic <iggyfran@amazon.com>
+Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
+
+CVE: CVE-2024-31949
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/30a332dad86fafd2b0b6c61d23de59ed969a219b]
+Ref debian fix: [https://salsa.debian.org/lts-team/packages/frr/-/blob/debian/7.5.1-1.1+deb10u4/debian/patches/CVE-2024-31949.patch?ref_type=tags]
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ bgpd/bgp_packet.c | 14 +++++++++-----
+ 1 file changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/bgpd/bgp_packet.c b/bgpd/bgp_packet.c
+index bcd47e32d4..361cd7b6e1 100644
+--- a/bgpd/bgp_packet.c
++++ b/bgpd/bgp_packet.c
+@@ -2420,6 +2420,7 @@ static int bgp_capability_msg_parse(struct peer *peer, uint8_t *pnt,
+ 			zlog_info("%s Capability length error", peer->host);
+ 			bgp_notify_send(peer, BGP_NOTIFY_CEASE,
+ 					BGP_NOTIFY_SUBCODE_UNSPECIFIC);
++			pnt += length;
+ 			return BGP_Stop;
+ 		}
+ 		action = *pnt;
+@@ -2432,7 +2433,7 @@ static int bgp_capability_msg_parse(struct peer *peer, uint8_t *pnt,
+ 				  peer->host, action);
+ 			bgp_notify_send(peer, BGP_NOTIFY_CEASE,
+ 					BGP_NOTIFY_SUBCODE_UNSPECIFIC);
+-			return BGP_Stop;
++			goto done;
+ 		}
+ 
+ 		if (bgp_debug_neighbor_events(peer))
+@@ -2445,6 +2446,7 @@ static int bgp_capability_msg_parse(struct peer *peer, uint8_t *pnt,
+ 				"%s Capability structure is not properly filled out, expected at least %zu bytes but header length specified is %d",
+ 				peer->host, sizeof(struct capability_mp_data),
+ 				hdr->length);
++			pnt += length;
+ 			return BGP_Stop;
+ 		}
+ 
+@@ -2453,12 +2455,12 @@ static int bgp_capability_msg_parse(struct peer *peer, uint8_t *pnt,
+ 			zlog_info("%s Capability length error", peer->host);
+ 			bgp_notify_send(peer, BGP_NOTIFY_CEASE,
+ 					BGP_NOTIFY_SUBCODE_UNSPECIFIC);
++			pnt += length;
+ 			return BGP_Stop;
+ 		}
+ 
+ 		/* Fetch structure to the byte stream. */
+ 		memcpy(&mpc, pnt + 3, sizeof(struct capability_mp_data));
+-		pnt += hdr->length + 3;
+ 
+ 		/* We know MP Capability Code. */
+ 		if (hdr->code == CAPABILITY_CODE_MP) {
+@@ -2468,7 +2470,7 @@ static int bgp_capability_msg_parse(struct peer *peer, uint8_t *pnt,
+ 			/* Ignore capability when override-capability is set. */
+ 			if (CHECK_FLAG(peer->flags,
+ 				       PEER_FLAG_OVERRIDE_CAPABILITY))
+-				continue;
++				goto done;
+ 
+ 			/* Convert AFI, SAFI to internal values. */
+ 			if (bgp_map_afi_safi_iana2int(pkt_afi, pkt_safi, &afi,
+@@ -2479,7 +2481,7 @@ static int bgp_capability_msg_parse(struct peer *peer, uint8_t *pnt,
+ 						peer->host,
+ 						iana_afi2str(pkt_afi),
+ 						iana_safi2str(pkt_safi));
+-				continue;
++				goto done;
+ 			}
+ 
+ 			/* Address family check.  */
+@@ -2507,7 +2509,7 @@ static int bgp_capability_msg_parse(struct peer *peer, uint8_t *pnt,
+ 				if (peer_active_nego(peer))
+ 					bgp_clear_route(peer, afi, safi);
+ 				else
+-					return BGP_Stop;
++					goto done;
+ 			}
+ 		} else {
+ 			flog_warn(
+@@ -2515,6 +2517,8 @@ static int bgp_capability_msg_parse(struct peer *peer, uint8_t *pnt,
+ 				"%s unrecognized capability code: %d - ignored",
+ 				peer->host, hdr->code);
+ 		}
++done:
++		pnt += hdr->length + 3;
+ 	}
+ 
+ 	/* No FSM action necessary */
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
index 975607f5af..857973df16 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
+++ b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
@@ -35,6 +35,7 @@ SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/8.2 \
            file://CVE-2024-31951.patch \
            file://CVE-2024-31948.patch \
            file://CVE-2024-55553.patch \
+           file://CVE-2024-31949.patch \
 	      "
 
 SRCREV = "79188bf710e92acf42fb5b9b0a2e9593a5ee9b05"
-- 
2.50.0


