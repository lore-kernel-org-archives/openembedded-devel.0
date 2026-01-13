Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 878B2D2D0E9
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 12:53:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57882.1768308804101389905
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 04:53:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=n2ptHiGu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5473251d22=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D4o3Wv2887711
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 04:53:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=7+t+Xcwz2Urqt8xjHQcO
	SPtnJQNPsPFWxtK8N+BpIX8=; b=n2ptHiGuabhCJ3oV4mCxRTv9Stoc/aVNhPww
	hthrwH+/Q24BX1NbV0Kkwu1CsYBc7CTDo5bvu5ZVUuwAWge0iCzVHy8Q/ptq8mGK
	AlodlPrKcGpueVt9f6vaVVd3zr+9ay8T5ZfOMSkMxI8VCh826yVCrO1oGp1Nxzqg
	NSccz55Ko9gfIFDSJqCNyNcBvneBALFUlxsTP/7mXN5bfYp2w/UiqH6WVqARg62w
	XTqpXlisJy7ERvBUmSxKwZcq7pcw3UfDzIgjoadlMMHMrqlmV/kFnF6twuS2amBk
	fRbkjJ3QPdZsMHfbjfwXUpQ4dEwxa/nFSdu+zfFVHYxIA90GhA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011032.outbound.protection.outlook.com [40.93.194.32])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkq5fttkc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 04:53:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cRcW4taNWEuFh5mnRtDFwkSWM9g9C21hezHpVw9DFdW1HycqWgqECZlrOKj2V+3U8/jkOVyop9t1kMd/FGgDg6dH4q7cJyS9AiWuDNaR5HJDc9Bx7NCi9ZOjdV5lbyzRFXXvdXEbF0ShItMQRJT2drK8H2sxMvIdhQ8JzwRimJjm5wo2s4D4+QM4HnXSlEn8TloV6WXegEtjVcrRgHZGyCrvqpLxTsj3/5BM4YnCpW1sY06Ya30fyGLHlooXioDqPqvdmN7J7+2iUYYtA+CzO8Zlrh11F/QYrGMF+qDCt0VR7pLqs7eIKyxvZZslrod2YravsCjtyooNUmybQaM6sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+t+Xcwz2Urqt8xjHQcOSPtnJQNPsPFWxtK8N+BpIX8=;
 b=Te/QsYCKP6D+vtgIaOqzs2bQidRUmnTBp8NNb7vGJXiOMfWozALY4D3JmX76ge/Ryr+iu00eI5EDWwMf/Ct1ITedQDd/bcwi6VEtskyzbr/aIpgMyC4rI90A0CzLu9yblaT7DNZcUsaJ0xmZusdbbh8JOKJo/HE8dxCTiwwI9xN2EtlzDyAkmlJjGk7S4J9/pHAq/C2BOEsEoHQipE78ES6XxuYWtkR4fCjOXiWn/BZ7uunV61+hEcw54Z/0HLL8aB973ZIhD2YDKaF1snMYPatCOWS5UN+pkX2pP17c4YiNMbIBtL/1b5FZIhRrbp2RqHwSP51FI8Yw6cPyxCfhdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MW4PR11MB7077.namprd11.prod.outlook.com (2603:10b6:303:223::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 12:53:20 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9520.003; Tue, 13 Jan 2026
 12:53:20 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] frr: upgrade 10.5.0 -> 10.5.1
Date: Tue, 13 Jan 2026 20:53:05 +0800
Message-Id: <20260113125305.2966121-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::17) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MW4PR11MB7077:EE_
X-MS-Office365-Filtering-Correlation-Id: b5b3c250-5896-4194-8a52-08de52a2ba80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Vk3OEVTCUtn2GYBiPxr1yVZAdtJ37rxBmyymrHQvqANsv9uCgbr4pzStXGea?=
 =?us-ascii?Q?CCeXq0u6fG5QmF9laS+4lHBQYfvwuyiwY1xe+kcJOPHhPPpW6GkvAr+x+0RC?=
 =?us-ascii?Q?Aa4xg86r4tP40YSWrFgFOyK+kpP3TFt5srVA/lHktcL+4Dwb7XaqY7spp2ti?=
 =?us-ascii?Q?eiagCqO6kfzuzp/JQQbV14onnjELv7oF8jWAV6A8Kh1WUMrYpu81N98Zss1L?=
 =?us-ascii?Q?29P8UgUHwcidRy6x05H5YwqHf9XPsdtpzbgQUz4os/lqVpOJxGhr7icNUQh7?=
 =?us-ascii?Q?8qmxMrckunu0E03WtyGZ5c8b+EddHEMDQR4lw5F1q52votFVDnfCgZXPRAZQ?=
 =?us-ascii?Q?L5KnsSpCnLQ+wdL2pQExtdOlDOcsDWmAzYRFrCfBSZt14DbCxHh1vfbYGbbR?=
 =?us-ascii?Q?SzUXJEcNtfSf4qd7c47Q72TsyUkfE4/vOrS1nvGWrMLHQo6vQQFEDFCM2HQ6?=
 =?us-ascii?Q?UAJntLIJxf3gju2xy0A+xdssjira6eSEoRkNqp6Jtw2LRnEQln4GkfIP3ltT?=
 =?us-ascii?Q?dO422rOp+q2gObeOZuzGsoiOK9L3aP1RFQpvA+c4UBibXgVpVfr4ksZzQekN?=
 =?us-ascii?Q?/57WOpKlMnLX2EmXRg7C0rUUVQeYXYHcgVPZoThljZlLW9SW4ijHqYMzXNA1?=
 =?us-ascii?Q?Fq9MWKJCgTiwBI9MY8/SJPsNP1arrZey2fPnXlln2oIeYG4e6GJPLrSQC8Of?=
 =?us-ascii?Q?Ob4Rfjh3CiwWW/Vh+QrDWlaOBmEFrQmv+zsPRANuBVJkLRTcE1bA76BaC9ox?=
 =?us-ascii?Q?YI0+rrHUE792rTx4GhHzFOUO35FnToWzok9Z51UwhdTOk79cf3LDcxKrHIZT?=
 =?us-ascii?Q?8kYBVeIBy3SnD9nZnevBRz+E3PnBZka4LJjMwb42orGhKAL3W8ICjsyL463z?=
 =?us-ascii?Q?Jctj3kMTx7AvUNTgsqulYMJFA30cDLTsmcxfZGHlgzv8Daomn9ubBkguTYTz?=
 =?us-ascii?Q?04bjX2NXYfLjjVms6RY7zoN1H4LgkYAqrvYWM5XknX+7Ix3om5VYy4Xd7RYO?=
 =?us-ascii?Q?SaPm7Hp2TwwrclB4BninP2ErBQjLLDBE5YeWiBt9aHMaSUXmp+Wcjjts3acz?=
 =?us-ascii?Q?+6/xBhm1oiQWihF0T0VhU6RuWLYMUs+nxL60h4q8H4cGkMTIGZxCxQgl7Avj?=
 =?us-ascii?Q?7S9wsgkPWmEZsJdOXukM5bRI83bdmnhPVicUrM2ECrSGL+1pXlbZzkqWA4De?=
 =?us-ascii?Q?WfHAjas6Bb4ibBn0415Dc4a8i5roGMxREnh6JypkNF+9D18PkeDTFgBVWVOE?=
 =?us-ascii?Q?qj7eCLaSfWB0mdhr+Ff4UiIe0fvjRiC2lPZ3Gwqi0wlRXF4SmGVeAX+jx4L/?=
 =?us-ascii?Q?Ot/uUlvJJStQth17SrJHkilNyh6BzlXmO0D2uueVjQF74KJMmHZQI7It4TD3?=
 =?us-ascii?Q?S1Yn6G96uWVACkArMKH9pu8F1w88aVPdiigFxJ9IL8ly0xcVVrXT6EGXcdLi?=
 =?us-ascii?Q?yp3A70+JRjEkYZS8vEHGT9wFYjJ3VQ8XcMkVQfsjOadLl6giAipS94t8oozn?=
 =?us-ascii?Q?R1G02FLXLUhQEmWgmahaAXQLZ2HrHhe3662h?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UhruitDiMihu0rftxDc1N6bt67J6WMNlFJiNTZNq2EQ2lqjmEjpA7Ylz8eqd?=
 =?us-ascii?Q?Q6VB7LvPq2Jqn5THcTsAOr06VgJjg7ARjOd2yp6ksIjo89h85pLglz0lVq7A?=
 =?us-ascii?Q?LcBVohb04FRYe4uQcpJsOOFLAPd67PGbNbGvK3xbChFtk6Cbame8ai9t/vNj?=
 =?us-ascii?Q?NTPloTjaHkJQzV5c1/2UPwReMDgmm2Msfam8e+A4C87Dt1wrqCtSljmjXKfB?=
 =?us-ascii?Q?REQOkYDfJ6Yz3UZ/vA/6iD7a6ePKjB8XoOIT8ymF8hHEPm3fDHvqn7ow2Y3v?=
 =?us-ascii?Q?u8oC8zjzY8hJ26Ml8I9UMJN4U7D/28hE9WcDbXWz8q5nFJ40Bg/oH66Nhf3d?=
 =?us-ascii?Q?mGhEWTlE56LXyn/j1Bj72oWb5QiKhzgBpyKoXMMvWhRt3fNAROWKIvpMKgvu?=
 =?us-ascii?Q?GVTD+gBHWy3YN1EmTtEVosJ/ErbsXzuijQdNL2x4LytCFHfFRkZrAxZvGAmp?=
 =?us-ascii?Q?zHOMWLeF5ap5vNSYpqNhewvLP2tscT/t6SynC0DVu1lN8g8NPC5nXzEt7Y8W?=
 =?us-ascii?Q?spSH4460wio8IPDD6uTIqb2IkSjSNIsYKm7LlFbhoUQ8Lskq0wnsjbOb1vvP?=
 =?us-ascii?Q?dwo8E8qLfRRIHjHcr4YQnY/Sgx0ebXYB+En+UIQ7qukMTA1XqGjRM1QwArBN?=
 =?us-ascii?Q?R4w8pqMXIi+wKBI8+rsWezQx45rG7R+Dj2j6exdjAuLJ5RbwhoFGuVlI5hvM?=
 =?us-ascii?Q?4ntoCjPkCJu/Yr6fTjbeGK+yo4c5trHdxXWb64dMwVrg2v0wFsL83dhHnx9s?=
 =?us-ascii?Q?kyS4iiBTeOfSjirHllbr69uVBh6z0wgzc3yyhLOvcU8CxUA1H16c190C7zt1?=
 =?us-ascii?Q?uwH6m154l8JU8JGEgSTDlPagiE+Xe83PZcTUWLbkkExC9XD+qQKm7MBwDAFt?=
 =?us-ascii?Q?5OyOAlPbONQd81d/oEfZS7RM7hM1W/EMl/YtAkOnAH9tjTl2mmh6EuNjpIvK?=
 =?us-ascii?Q?1klf2HB4e31ZIKbb/Aqbq/X7pOeUiKKe0DkQgpuY+ztrJ/7gKzD5WNTJY9ka?=
 =?us-ascii?Q?M8uUaNZaTp7TaYw5ORYgSuADn/msOMKpeQuE5+8Uf2WQ+scYbANjzLOyP4pO?=
 =?us-ascii?Q?k/yWiHLUyT5PeBnVTPg87AlDztDQliOr7+6M+59+qtkce6u7xS+d3okQe5Dt?=
 =?us-ascii?Q?B7SlDzI3C4yL0PDOpkiZX1g0C+CLVPKi82KuBkMrH+N6NMAaWgFpitnwRBcU?=
 =?us-ascii?Q?kMUGzfIvHgwdjDUPIASYQ4Kf1d7sQY8NS4tkTTIWyC4UHlu5SazkrLh87GlP?=
 =?us-ascii?Q?aB4nF+e/530Wg2atmy/19BX+RJXH+4PW6kQDMBcFkNWYV+0T8er6j/BK3U2b?=
 =?us-ascii?Q?MzMaOOzDNQdgN1OmpmTuX+kF9WuIT0XC8JIYCZ3Vj5ESSBZdlYnt9ixG07jP?=
 =?us-ascii?Q?IMEKVGKKr+DTLcZihAyxKAz47lKA03I8OwOiJqQVBsLL6LKS7sZjVINN9phE?=
 =?us-ascii?Q?zRDDCjE/9lgMejIbHd/NO/8MImDcFi30YQXSCpPGIhwdF72XvuZl6dv0Zy2l?=
 =?us-ascii?Q?/bLjvPUROrbLnbgiTGfDkCu8DDzgFrKbHOw+1fcXiwgrunVJhWhKA+RE0wma?=
 =?us-ascii?Q?6Z8sIZ9W0BgmtT+ac8CFJVonWA3woVxuCLMgCLz7zWFaje5ccoxCOkNz5iL9?=
 =?us-ascii?Q?IZZA4FLwQqkf5kONpuT/w+aMz2ZlmC5vgo9PyJV01plXg6hFpEu8pIbyBxfG?=
 =?us-ascii?Q?JKy2q+e20c2MQJUlLYlaL/AGGj/EOlVuPRm0tS9bbycVjQMX/9h6ka+Lkh+n?=
 =?us-ascii?Q?VNOJPxjrjg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b3c250-5896-4194-8a52-08de52a2ba80
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 12:53:20.3303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ah/02zsaifBMQcHbfq22Qtv/WloGsJMcmhJL0BDrKxUu+tFxQkiELes+aBiTklzR7yznQrebwPSYHrsUH515pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7077
X-Authority-Analysis: v=2.4 cv=d/z4CBjE c=1 sm=1 tr=0 ts=69664043 cx=c_pps
 a=9MZ2ugitVzia3XLGoiWL/g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=b_WmPgYj1zwQEKoL-ekA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEwOSBTYWx0ZWRfXzsTKTUpwiZgC
 A8djvgYx/1ox9bub5K93TI9ItLEHvU3yQbcjyHrQqc5XjD4Abj2l+pbHpQyUX00b2PUtjX+YIA2
 YE+LWJG+6snSpPEhVoTH4gf7zxgeAiihPRsVptruITxiLK9IQR/tfE+hAiVagwV++nwhBjY2daC
 jHnQ3QZvVK2zKMD/xYd+679SMrm6DO+r//2c/rik+jCuB2XSRHOcBudPCe9sP1fwqpvlym+uO9+
 SxLFPM3jgJ19VUKrnlJCb3G/e7I7SSXeLjA7cBCMV4kG171YSrPtSmramlfm0Qncu7GKSUaLOlu
 mmmT6JLkPRQc1ZheEt44YE+mI/MPeyThtd9N8IaFJPtrZ01XlerkID65KdACLE7eeAz/Ekfj0UN
 0Kifa+1AiiZjDowSoILQupjqQohJe2tjKYm7aW7Kb4fORxPTpRYTeun/Rdti7K4n95MNqgtUT0s
 FAaTDaToc7sdhe9vh+w==
X-Proofpoint-ORIG-GUID: tXGd3XWuXRlAIvdYZRY9YNDKfcVwT1p0
X-Proofpoint-GUID: tXGd3XWuXRlAIvdYZRY9YNDKfcVwT1p0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130109
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 12:53:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123436

ChangeLog:
https://github.com/FRRouting/frr/releases/tag/frr-10.5.1

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-protocols/frr/{frr_10.5.0.bb => frr_10.5.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/frr/{frr_10.5.0.bb => frr_10.5.1.bb} (99%)

diff --git a/meta-networking/recipes-protocols/frr/frr_10.5.0.bb b/meta-networking/recipes-protocols/frr/frr_10.5.1.bb
similarity index 99%
rename from meta-networking/recipes-protocols/frr/frr_10.5.0.bb
rename to meta-networking/recipes-protocols/frr/frr_10.5.1.bb
index b1f863a47b..a309330dc1 100644
--- a/meta-networking/recipes-protocols/frr/frr_10.5.0.bb
+++ b/meta-networking/recipes-protocols/frr/frr_10.5.1.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://doc/licenses/GPL-2.0;md5=b234ee4d69f5fce4486a80fdaf4a
 SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/10.5;tag=frr-${PV} \
            file://frr.pam \
            "
-SRCREV = "c41ba202c3f821a43091781181c73772501034ae"
+SRCREV = "d17791ee7ee76a0407d3fdbebf81bd242840741b"
 
 UPSTREAM_CHECK_GITTAGREGEX = "frr-(?P<pver>\d+(\.\d+)+)$"
 
-- 
2.34.1


