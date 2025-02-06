Return-Path: <can.wong@emerson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B5A9C02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 17:14:26 +0000 (UTC)
Received: from mx0b-00300601.pphosted.com (mx0b-00300601.pphosted.com [148.163.142.35])
 by mx.groups.io with SMTP id smtpd.web10.46958.1738862057548254522
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Feb 2025 09:14:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emerson.com header.s=email header.b=vgyhjPrU;
 dkim=pass header.i=@Emerson.com header.s=selector1 header.b=4XvyOk1u;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: emerson.com, ip: 148.163.142.35, mailfrom: prvs=1132ee0a8d=can.wong@emerson.com)
Received: from pps.filterd (m0144091.ppops.net [127.0.0.1])
	by mx0b-00300601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516GeQTs017094;
	Thu, 6 Feb 2025 17:14:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emerson.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	email; bh=9QXIKYbp0tq9hlABn5RUmwocdwbmLy1lVpYeflj3bUg=; b=vgyhjP
	rUeYrqk4XFkEypu3ke+IXXg0+zbPHA8B3CZI44nYdGq+iIb+Hntnv4bNCmC0bCBQ
	XmtYZZDWmlv/mF7L/hEx3LdA+MmfsgaYiycgsT6tyJFig931buMQjpqMbZyM4p5A
	UrcpJ0Z0Rjfe808bwE2vf98GdyjHdk0O3ICVMYAbRU2H5X3skEt+BwVMbwkgJxxk
	h8Ck5RYGOv6IXLoK5slviZ+hvOwtvUKfXMXgV2Q+L8BXTVabiwKO83wXkugOvP3J
	WafBtfCvePyM+CHImZfgrD4sOUs1wg9XM93T3h/KiQ7IhKOevA7O+JZnHzxjQpHT
	peNlXcbk6U/V2hRA==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2046.outbound.protection.outlook.com [104.47.70.46])
	by mx0b-00300601.pphosted.com (PPS) with ESMTPS id 44n0qa0p1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 17:14:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KV4iojpzDk2t2+cz7075GuddanNXICG+ZvyFHgZwAZl1ACva4sD/ldg41QLWPpuJJ6Gjk76p6QjP4r3mJ380+CLz1d7Q8rPtQCx/sjqKZCyB8yRWJt7o2azB5nDca33d73d6bJADOOPQ+Onfjl7dILPYgcc1OCbC0WDaMRw2MbIgF0VV+nOBYGsDqbAgH57O8hd//wptDrFei7cIp6UOvcOvy7tPPFTmyaYhysyGfN6PkEDGvD8Zggw7zawZNHMymNBgEyMJizs4zOcj4vQ45XMiNUw70D9SNqfxFYpp1mLrHVfDiuvLE9Vk8C2pqt7oBGmc/726A7XmwsaX7f8Kkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9QXIKYbp0tq9hlABn5RUmwocdwbmLy1lVpYeflj3bUg=;
 b=ss9qAaCJXGGLU/gGEc6s/BkJiTd61IGZ9uvTsnuVTuJ1+56E8K2IDq+NkBj2t64bGyyglzgyg2HZzeOjZg5zW2Och3LTw5hfuQkViGy1C50nsmjAMe12a3xQUunA2PuXWwYvhCstJfIVx5tc/Oxl76m2hfsq2Nu10bSde9VhngiT4uTTYKokELCT+e3D3y1cDc9GqmruKtD8+6mOSywosqm9mfQ7phGpwhSa8fA5/ob2quAsEtLPri4SFoZckij6I7TeTvkOqbpoeJK8Qzso2s1cWvzqIFfUPlVj02KX42oVNOscWgmJ9VGyWxvQPd2jrxCcurfpI2a4KlOfWXDIsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=emerson.com; dmarc=pass action=none header.from=emerson.com;
 dkim=pass header.d=emerson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Emerson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9QXIKYbp0tq9hlABn5RUmwocdwbmLy1lVpYeflj3bUg=;
 b=4XvyOk1u0HPeAGiouz7B7C7/xjwvtt3BYmE3Qyp7SWTdDxPPmK5FKLNEcfcdKYTYhjXhKPeQEz9nBaECcH5T0HD5t3ZZDQlCR6LsYZjNjVUzay9WpCe56cVH2bD5si712Yy8Nf636kCH2juO4CcO2VidtMgcDAjOmm88j2+avt7KD4jX1x0Z01uewNAeCjjwftGOczurSL8iy+7EBw2mmO/tnhdMYCS9QwWzzQkA3c6FzsDWl7nqoEEEUEcts6lFfqy03W6BMMGiNATI0J8oerLreColNFgZ37OAkN1Wt6t7z8yS/xP0+lxjLzqXTbfZtE84CFhVN9b/aCobe5+YGw==
Received: from IA1PR10MB7418.namprd10.prod.outlook.com (2603:10b6:208:445::11)
 by IA1PR10MB7540.namprd10.prod.outlook.com (2603:10b6:208:445::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Thu, 6 Feb
 2025 17:14:12 +0000
Received: from IA1PR10MB7418.namprd10.prod.outlook.com
 ([fe80::76e:a3bb:ea4c:3f2e]) by IA1PR10MB7418.namprd10.prod.outlook.com
 ([fe80::76e:a3bb:ea4c:3f2e%4]) with mapi id 15.20.8422.009; Thu, 6 Feb 2025
 17:14:12 +0000
Content-Type: multipart/alternative;
 boundary="------------U0U87oujZihQzaCAFfmnYsNB"
Message-ID: <18f583e8-cc9a-4c36-8b20-3fb9528449dd@emerson.com>
Date: Thu, 6 Feb 2025 12:14:11 -0500
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
From: Can Wong <can.wong@emerson.com>
Subject: [meta-oe][scarthgap][PATCH] audit: fix build when systemd is enabled.
Cc: can.canwong85@gmail.com
X-ClientProxiedBy: BN0PR10CA0016.namprd10.prod.outlook.com
 (2603:10b6:408:143::23) To IA1PR10MB7418.namprd10.prod.outlook.com
 (2603:10b6:208:445::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR10MB7418:EE_|IA1PR10MB7540:EE_
X-MS-Office365-Filtering-Correlation-Id: 93c30c52-cdd4-4459-090e-08dd46d1ad29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?amdBWE03dWVyZENsSU9QbVg2N1RTK0xVRjdRNW9zYkNlNHdYb1hSVU4zY2Vo?=
 =?utf-8?B?ZUhEK3YzSjRyVVgyZ0VneE1Ra1duSXpiZXhadEgrbVBKN1hwNEFBUGlZWDFS?=
 =?utf-8?B?S1JiemlGU3VzdEpLN0VtZHhFdWRGZGQxc1hVUU5SMDhpU0p4Ty9ERnNFUngy?=
 =?utf-8?B?K0ZBMnc2ck9yWU9nMVV5Qk1BUEJSMHF5dXpkdkhmY2UraHN6NWtyMzRMVzZa?=
 =?utf-8?B?bUJsYUJuT1hYSjV0ejBjYTVqYk00RjlPRjF1TkxibFVoWThHT29HODZXTVAx?=
 =?utf-8?B?dXVtQ3FCa3E1VXY0VUUrd1IzRXhtTDJ5NWxkRzVBTzVPVmoyUkhVaVI5ckkw?=
 =?utf-8?B?cGZZdnFWOEhNdXRFNVI3QmdNMWdKd1pHOHV3c0pNOWU0ckw4VElXOE9PN29l?=
 =?utf-8?B?NFpOMEV2QVA2dkYwaHdUYnU0TmlZM3pyNlZISUNCaFVMczEyYzNYRjF0aElH?=
 =?utf-8?B?ZFl6bFNzOU5RbUdoV2NmN0d4cVY1R2h0YlQzcHpiNnpKdHl0aUwwNjNhZE9v?=
 =?utf-8?B?VU5aTklnekYyQTFaekkvQ2NTT0ErWi9haVFrZHczVFdlb1A2Njc0QzJiY3lR?=
 =?utf-8?B?ZjhuYm9hb0FSYUFaeTNDMGtadDlQRkpPTjFISGpWM0d3aHo0MU1ybm1DQzcy?=
 =?utf-8?B?WGw5VnFuOE14WWFTSEJUSDV5bnFIVDk2RzI3SmpCSWNrUjF2K1BYR1pwWk5p?=
 =?utf-8?B?Ynhza3FnbWFyTUl6Nm1QcDYyaHRUUm84NGFPa0NodGJnSHl3ZmZqTzJseERk?=
 =?utf-8?B?NDQ3OVplc295dXh2MjlaK3pGVWcyYkhjT0ZvejhCMDYvYm5laTU4VStjVlFB?=
 =?utf-8?B?MHNjcVZnVFVrbDh4bCttRnUzQ0V4MDdmdk5HcENxZXlRYVc3b29pRW0vZEZ4?=
 =?utf-8?B?S1l3TnpkNkE5K3g1MkVxSHlRcDh1UmU3VnVUbEwvQjVoVHBhK1RoS0g5R3g0?=
 =?utf-8?B?RkkvVU1UYnRlRGg2em1weDlWQWgvUVQ4dUVXU0lzN0ZZblRmajRrVmkwZzBB?=
 =?utf-8?B?dm1OT2k3U0lMMldxcjdpYStUSTJzVGlhbU80N2pUQTRYTXA2ZHFGeFJKeXZu?=
 =?utf-8?B?WTFIc3ppbkI3TjBmN2Y0M2R3dytBMkE5ay9Vb0NiMmJQVzV6VXJnU1NBdWxI?=
 =?utf-8?B?Yk9Oa1NDUXkxM2xxdmtkMG0xWDF1a3RTVEZnbWFSZTBBQlpMUDVPODJSZFFj?=
 =?utf-8?B?YU9ndlZSNFp0eUNDL1VpRzhoS3Z5REFVUERxUmlMb2pDVDVYZnkwRjB1NFh2?=
 =?utf-8?B?K29oQ2tOUFEzTnl2eitNZ0JwallvYUt0dFJvMWhkODJvV3VKbmxMaW1pcFdw?=
 =?utf-8?B?REZTSVU4Y0VwczRqWG1Ld0E0ZVpsYnZqN1RUSGF5UThiWGtZdGYxMkF5ZzZr?=
 =?utf-8?B?Y3VoaHNXV2tuUG5Nck56ZmlKbTkxaHM5VnRNcWMyNGVtSmJsQ252VndMbnJB?=
 =?utf-8?B?YmVqdUtRZDB1Z1RadDluSzdoZU9mR0tvQ2F4VDI1WTN3VFNQWUs5dWhPRzBa?=
 =?utf-8?B?cmgwUEJmcTNPK3ZpaDgrblBpU1JhN2srRkE5ZUwwR3l0NDFGdjBVVVNhMzJu?=
 =?utf-8?B?NkFRTGx0a0JyYkhFazR0QldETXlJbGYwSWRMMFZkRkhyeThTSDUzaUsrSytX?=
 =?utf-8?B?NUtwTUp1N0VLaG9ROElMYzNYa0lGRUVpSmE2UHhiZ3I4cHZ2VHhkTHhXc3Rr?=
 =?utf-8?B?cnRlci90c1NDWE1PR1BJcHlScm5rZzU5RXpEL0tWdzJGZTNmZEJ4YmhDS0VO?=
 =?utf-8?B?N2hzWk1ENHFKMVRnWWFlYnhMSnpZTHBEV2p1QkpjRllSLzh5WDEwZG4wNUhW?=
 =?utf-8?B?TzRmcDIwVy9pMHZsV0dOYXg3bXQxL0VZd2xRNXp3UFVzbU1DYTh1akFINGs5?=
 =?utf-8?Q?QGGQPayw9L91I?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB7418.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QUJFenJoN1JNWTNNNWZKVnJQdk5xU1VIeHg5dTJmcG1uUms5WXpVeHVWNys3?=
 =?utf-8?B?Skc5REdnSFMyMDZXUXJMT2t6NmpnQ3FiTFEwWW8vYko1Y045ZjhPK2d1b0I0?=
 =?utf-8?B?RzU5eU05akVYOFVMdnkxUEVjclBUUzJlQ3lFeklzeHJ0N2RuTmtIdVZIOUxw?=
 =?utf-8?B?aVcvRGM0NFF0QXlUcExvR1c5bk9xVnNWZ1NLYmJXSU5DNktiZ1hOTHR6TFRk?=
 =?utf-8?B?SktjV243b2MxWUdnYzJJYnRzZSt2SmtlRW1UVzRIOERNYlBjWVdZa1pjTEwz?=
 =?utf-8?B?Z3hzOHcvemJsQ2FxbXVpLzVqeHJxa1h1QloxQ1pBemtzdHB3NTlmNUNESStv?=
 =?utf-8?B?aklNM1RFWThuZURGSENHcWN1c0MwWTJ6RmMybmozbUZuUFc1clhhdUVQTmYz?=
 =?utf-8?B?OVpTNGorRXlhY2N6WE1UYm9Wa1p4V2VKYnMvbjV4Q0kxNnpBTDlVcVBCWUhh?=
 =?utf-8?B?T2JYd3FzRUFjaUxhMHFyeWY4eFFaVkVUSk0zOWF3VzhVMTQzdUduZTBVOXUy?=
 =?utf-8?B?RFdJMDhsMlhWeEdubmpZa0tFR2pSVk5QUFBDeTgyVTRIM3NKZFA5dWZEYzA5?=
 =?utf-8?B?WDJjTHFLeVJwSm94YUNVUitsMm1PVDJaenNmS3U1Y0RtUXFxb3g5bE81aFVm?=
 =?utf-8?B?Q2VIWjFzbk5JMCswSUlWelVhY0NPR0ZlUFFvOFlLU1FmZEgwcWczbU9uckVR?=
 =?utf-8?B?ZzE1YzlIRDY2aW8wS1FzOGQxUWkwRDV2VHcwS1hURTF0ZXFQUy9STWtScHM3?=
 =?utf-8?B?UlpUSmI4Wk04SXlGZkFCNHJ5TmFGK3FxU2hUZWY0UzMxUlNWblFyV0RGdDEr?=
 =?utf-8?B?TTU2V2VoWmFoaVRySWdkNDFBSEtIL2N6OFFaVFliY3loT3ZYM1diTlZUaTlm?=
 =?utf-8?B?WUkreHBOWFZEOS80amoxNVQ1SFJzUmhkMkIzY0g5UW9XUk5NanpLbHkzUXA2?=
 =?utf-8?B?eVVBc2xTNkNzdmZwV2hBNUxjMTRzaUxBZkNZWDJ3UnVzb1o1QXpnbUxNVEQ4?=
 =?utf-8?B?ejBjUEM5Zm0wU0RMd1luOXpKSFE2TjMvTk13RmJOVmc5Nmg0UUhHZ3FMcFVI?=
 =?utf-8?B?ZElJZXZOd3dMalFlUG5oaWtzK2Jxa08xWEZZdmEyejJxRkdncURrOHdVZUo0?=
 =?utf-8?B?R3ErbUxXK1o1SVBuRTNYZkJIcWY2c0VWeU1SKy84QXJKSGRKVHorR3REeW1T?=
 =?utf-8?B?NkMzMkNyWTdLbnF2Um8vWnM3UGZqL1laem1EVmJCMlgrNGFabWZROGdaVUxp?=
 =?utf-8?B?eS82NTVMMjlpd1hOL3k2cmVlVXdWaDlCdmVIRFFxNkR1WWpRMXFVVkVheGh4?=
 =?utf-8?B?bmdnM1dBUEplc3pncXRCSENFWnU4My9COXV3dkdFd09HK2NMTnB3N3FQR1dH?=
 =?utf-8?B?ai9TUnJPWlVCelExNmZoMmpzRDNKYVNzRjBKVW4yVkxFbWx6S1lGWWNGa1Fz?=
 =?utf-8?B?azNaSFMrRTBzMWhEYmR4bkNRdmdKREUzWFplV0dGT2VnZ1NLRk8reTMvRXhN?=
 =?utf-8?B?R0xLdlFub0hJNnpXRW9hMVB6TCtlQjdlVmVJZ29WbWZmVGZVYTIvSnRnT0My?=
 =?utf-8?B?ZmgwZXM3bzd3M3QvYXEzTEpBZXdUNmxUMlRTTTRXZTdtVkZwRTFYcy8vL2ZF?=
 =?utf-8?B?U0I4dmRFYkRSbjNZWTgzUWVxWkt1ZmJld0wzQ3BEcGJxQkFJQWdLUDFGUDQz?=
 =?utf-8?B?bHJkQ1N5N3BHckdmaDcveVZhR2VDUjdpbUlOOUMwRWZPV3hZdFEwaitIRjQr?=
 =?utf-8?B?RWdWVVIweHZnTFVoS3MwZkxVUzJBM2c5cHlRallzRUxLUzJSdmdnMUZNMTFL?=
 =?utf-8?B?UnZmSVRhSzhaejJObDZhZC9hbnpIUEFqTkYvU0dNbTJOUjBnaHFYd1kvYlZ1?=
 =?utf-8?B?aURyUFRjUTBHTVZxMmFoQy81dS9KRXhxaWkxejRHWHp3ZGQ5eHZMdzJuVnJl?=
 =?utf-8?B?eDIrUnQvbEpSWnRKeFdkK3NYazZlTFlFOWpWMDd4NVVZMWptSnFvL1JrZURa?=
 =?utf-8?B?NHJjbjR2OU5CUWJqeW5seVZVNjBBcDJicmJmYmdnbW5kQTBHMUhKS1JyTmQ3?=
 =?utf-8?B?SXF5VGpnNTFPL09VWGh4czVFOStJaEhDMEFuMmI5dTRSa1FTVXpiVm9LOGxT?=
 =?utf-8?Q?9rabq5HnbHMgBz6SyvoSuNcuh?=
X-OriginatorOrg: Emerson.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93c30c52-cdd4-4459-090e-08dd46d1ad29
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB7418.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 17:14:12.5161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eb06985d-06ca-4a17-81da-629ab99f6505
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uoQKubtFrbs6or28vjs8WWeGz3WhdWZP+JkMFfy9Kl2nU27tsDGvkNy1hiyDIL6UQPwzi7aGlVXp+s9IKhJkfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7540
X-Proofpoint-ORIG-GUID: H1vTod2L3gcdQW4nR62hLYOi5dLcAMxC
X-Proofpoint-GUID: H1vTod2L3gcdQW4nR62hLYOi5dLcAMxC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_05,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 mlxscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060139
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Feb 2025 17:14:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115290

--------------U0U87oujZihQzaCAFfmnYsNB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

From: Armin Kuster<akuster808@gmail.com>

Signed-off-by: Armin Kuster<akuster808@gmail.com>
Signed-off-by: Khem Raj<raj.khem@gmail.com>
(cherry picked from commit e68145b00260fc380242cd67579068427e501c10)
Signed-off-by: Can Wong<can.wong@emerson.com>
---
  meta-oe/recipes-security/audit/audit_4.0.1.bb | 6 ++++++
  1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-security/audit/audit_4.0.1.bb b/meta-oe/recipes-security/audit/audit_4.0.1.bb
index a37ae3bb84..ade566d82f 100644
--- a/meta-oe/recipes-security/audit/audit_4.0.1.bb
+++ b/meta-oe/recipes-security/audit/audit_4.0.1.bb
@@ -95,7 +95,13 @@ do_install:append() {
  
      if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
          install -D -m 0755 ${WORKDIR}/auditd ${D}/etc/init.d/auditd
+    fi
+
+    if ! ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
          rm -rf ${D}${libdir}/systemd
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${B}/init.d/auditd.service      ${D}${systemd_unitdir}/system/
+        install -m 0644 ${B}/init.d/audit-rules.service ${D}${systemd_unitdir}/system/
      fi
  
      # Create /var/spool/audit directory for audisp-remote
-- 
2.43.0

--------------U0U87oujZihQzaCAFfmnYsNB
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div style="clear: both !important; display: block !important; visibility: hidden !important; line-height: 0 !important; font-size: 0.01px !important; height: 0px"></div>
    <pre style="font-family: sans-serif; font-size: 100%; white-space: pre-wrap; word-wrap: break-word">From: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster808@gmail.com">&lt;akuster808@gmail.com&gt;</a>

Signed-off-by: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster808@gmail.com">&lt;akuster808@gmail.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
(cherry picked from commit e68145b00260fc380242cd67579068427e501c10)
Signed-off-by: Can Wong <a class="moz-txt-link-rfc2396E" href="mailto:can.wong@emerson.com">&lt;can.wong@emerson.com&gt;</a>
---
 meta-oe/recipes-security/audit/audit_4.0.1.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-security/audit/audit_4.0.1.bb b/meta-oe/recipes-security/audit/audit_4.0.1.bb
index a37ae3bb84..ade566d82f 100644
--- a/meta-oe/recipes-security/audit/audit_4.0.1.bb
+++ b/meta-oe/recipes-security/audit/audit_4.0.1.bb
@@ -95,7 +95,13 @@ do_install:append() {
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -D -m 0755 ${WORKDIR}/auditd ${D}/etc/init.d/auditd
+    fi
+
+    if ! ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         rm -rf ${D}${libdir}/systemd
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${B}/init.d/auditd.service      ${D}${systemd_unitdir}/system/
+        install -m 0644 ${B}/init.d/audit-rules.service ${D}${systemd_unitdir}/system/
     fi
 
     # Create /var/spool/audit directory for audisp-remote
-- 
2.43.0

</pre>
  </body>
</html>

--------------U0U87oujZihQzaCAFfmnYsNB--

