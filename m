Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5970CDE026
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 08:09:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13386.1763107743968364686
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Nov 2025 00:09:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aBjpY2+r;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=341359508a=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE7wYps2232640
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 00:09:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=jY7RlowqtpETbFdr/zn2CqBaPhAAx9yYnZxjlOfq3lc=; b=aBjpY2+rmDfM
	Ttds0RAX76fl8rAc97Ylj4aHjGaEeuPaSb6Mkw3bEZV0F3yUPXR7MPOX2+sg0t4E
	RgNH4koRCDfSgsoadHsXPSLT0kWl8tyS3MeB/alJ7v/I06qWP1KDqhX5sBfAz8gv
	77uE00q8O3tG7+bAFUSRXp1jcxpqZNqfUAxw3BI6/YblnDyghiljo4cDDhB0nMB4
	zmF3nJCbAUOKBwcA7tNN+BTTAjhVJ9wGNddyydIitu2IOlaG8adUfrkvvOchvi0C
	4N4qiiPKyreScISEq0YDUO+oWLpR6x+5dEcceQtEDNejk6a8Zn4JOJBK8Cy/gTuR
	+yX5iERq+w==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012037.outbound.protection.outlook.com [40.93.195.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4adtk6r9g8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 00:09:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e27nTHtbej9R1VmwAOfTdGdOXcQPP0VSAoK70uacxXmMexixgmZLDIvczgi/R0MfR9jRLZysHam5Kl6fRYBh0PkEK+Gxi/7B26ic/UWLeOYy/94hmJARah0DORR+XqLlsauffEjFIXvy8nzLcRTR6US7ri6+xl1/JNTrqANkRr6WsLqnSTpH2cqV6gSutoAIozR8Zl8cmDnm/L7eTRdePNCvhL4bx/66+SHBLhoSYf2YV6ISu1Avgw0hEwL79lA7H5pMXwDJVIR6lIjygGu8Cyhzrb7PSL7YzA2gv/ME3Fr//AmDHRqXEKRNsT21WijfDrlhNGtQmNKYsOEWE34t9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jY7RlowqtpETbFdr/zn2CqBaPhAAx9yYnZxjlOfq3lc=;
 b=FQqJJqEGKFySibQNw+V8sqEp+Y6PwS6Cs+b2rkkf9vTqzPDxI8uhDqixZlok5qR9XU5geyFbyVdl/p6EG1PQtEzAF99TkQf+BOUvixnfu0NyfLMzU7ZPYg3vrZahoD8lROIDyzzr5LXRIDrIeKwmg1pMj9mn/CaxAvRFTdyjvFSvIh7cMxYZTT7xZxNHRo7rzkvA5NEIRNOOFc99hLlmD6cT6g44jneQofPClNbKW0WCm3MpnpDMhJFolh9A7mJjGbfc1uBiEIc0Sntwhw5uLxBl7dMBycoPRyIUkEm9BQDi9XZluYT/XyiwSOmL2F8VL8RLIH0rN9++q9q1s5AfQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by MW4PR11MB8290.namprd11.prod.outlook.com (2603:10b6:303:20f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 08:09:00 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 08:09:00 +0000
Message-ID: <7680ec42-85ec-438f-b0b0-9e9ab7ae0717@windriver.com>
Date: Fri, 14 Nov 2025 16:08:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-aiohttp: apply compile
 option -flax-vector-conversions for gcc
To: openembedded-devel@lists.openembedded.org
References: <20251030051505.1693030-1-hongxu.jia@windriver.com>
 <18732CF4DF98F73E.25345@lists.openembedded.org>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <18732CF4DF98F73E.25345@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0032.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::23) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|MW4PR11MB8290:EE_
X-MS-Office365-Filtering-Correlation-Id: 71216ac7-3ecf-4e29-63ae-08de235510da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OWJYS2lQWmUxTk1jcmxick1SOTlYUE05eWF0MmxBVXZ6MXQvVnNjTy82dHh1?=
 =?utf-8?B?YWl0OFVldEVpbUkwUCtad1ZrSmZrN2x2MitIVWFYL2pCdGU0WDU3ZXB6c09k?=
 =?utf-8?B?UHJBTVY3dEcvdm05bDhsdG4zU3Q0U2xMQm9SYTRTR3Z4dnIwQ3VzdjNVbjhv?=
 =?utf-8?B?WlJDQ2ZLZ3J5cm5nS1NOS2xoejl6RUM4UHZzN3UydThkUHVEUS9jVElQb0tI?=
 =?utf-8?B?Vkt2WE11cHMvSlJUVDlpb2ZoNWFmMGdQdWpzT3UwY3JRM1h2MU5YcndzenZC?=
 =?utf-8?B?Wi91c1ZsVFZwVm9RVGFTdHM0ZjdvSGpwaGFjZHRHY2hmc011ZzBpbXpZbXNs?=
 =?utf-8?B?Yk5iaUFyL09YeFN0MndvUGlyeCttY0pZUnhQTXlGUExUQkprL2k2dk9VTVNK?=
 =?utf-8?B?ZzI2L2xTVnNDRHdacWNPNGZpQUlVaHdUcWEyV2JZcHdybFhRajR4MHdwc3hK?=
 =?utf-8?B?bUVJZ1g1UU9xaUVrcVE4dExSS2V1aEZwOG1TRnVVV1EzSmVIZzMyaG5wbE1v?=
 =?utf-8?B?UE4rZ2Y2N285UTM1K3pNTXFvYy9kWjBpMk1hYVNiUTZ2bm84RDJ0Q2w4SURG?=
 =?utf-8?B?RFNjdXRVMXlzTDFHc24xSm4zTkRBVkUwanYrZVpNVlZZNnJmby9yUEtXUnBI?=
 =?utf-8?B?ajVZeldOUzl6VERUZFM1VFV1R3hDTjE3ekhnZUNHeWFRSTE3K1laR2hLOUJ2?=
 =?utf-8?B?NmtKcnFzU2FwUURoemlHM0ZhZFdNMEdPUGV4NlNYNGh4SGJtR0k4ZTZyWktN?=
 =?utf-8?B?djRKWE9IVmZtNlgxamdoVVRkQlpsdzFBMk5JU0VkbWkzQ0s0M2ljdGk1dk5P?=
 =?utf-8?B?bDdWdVBCZ0hINkJzQVVIaGxZbGUxREVyZldpb3pxY04xa21LN2EvVE5MVzND?=
 =?utf-8?B?ZWpqbUNGQkMySTdOK3hLM0tLR3A4TDVldkxQWXBkRTA4ai9OeGVRMkRYaDkr?=
 =?utf-8?B?dng5WFBGMUZNRUxyZE00em5qREdTWFJ4WmU5QXU2L1FRM1NTamNIVFU1U00r?=
 =?utf-8?B?cjdURzN6bmlYL2NmYWVyTW83R05UdktIcjVnd01yUTJzM2U4T3Z3SzFLQTdV?=
 =?utf-8?B?OUJLQkcxN0E1M3hnUVZ2UElpSUloWFA4QjRVZkQ2V2FYeWlFMTc3NnhxM0Rl?=
 =?utf-8?B?ZVYrZ1VVbTZSK3BTWmwxYStkN01NcGhPVWxaME9oRXZ3TCt3MEduSWMydEZ4?=
 =?utf-8?B?Q2plV2pGSVh1VEpxdW9TejNQUWl0SXcxd0xXakV2ei8xZzAvSzFhb2FlK280?=
 =?utf-8?B?WlBtY1hmeS9kaUNwdk9rN1JqTm5reVZGeDlvQWo4cHlVNzFINzVjVDRIcXh5?=
 =?utf-8?B?ZTliV29USlgrcG5zY2pkWHFXeUZVancwcStwUzBsdjhiMEZ4UVVJUHdRYW50?=
 =?utf-8?B?ZFVzSXRCUXI1SlY0VmNPa2ZJa1pOR1J1RmRLNFN2SHdNZ0k0aDYzRTVuam5L?=
 =?utf-8?B?VlZ5NXhzdXdOem5xMzh3OUk1aGEwdkNZWU5scUJQOFN0dkE5WXZ5aGoybUxq?=
 =?utf-8?B?ckJMQmJjNFdPeVdrbG50bHRiZ2Q5UXVLVHB4MjdRQkpZZDZNZ2dWSGdzY09Z?=
 =?utf-8?B?SC9OTDcrL2trQVVORUJsODB4VjdDbmtFWUoxNEcrNmlpRmtNY0tuUW56RFlR?=
 =?utf-8?B?a0l5eFNidkUzQ1JvVm5qVnVUUWV1dktjQmVIV1E4NlBDUG5hRjhUSHowc3hM?=
 =?utf-8?B?RUVoMlF5Q3NGelgybFBUK0xJQ2NjRDNvMlJEOTkyZk5zOWYvK3E2QkJHWDdh?=
 =?utf-8?B?MnIvR2JRN2R0cVJ3T290VktIQ0Y5eUQzNklkNUVIdExaVk45K1F3Y0JtL3hx?=
 =?utf-8?B?ZEZHYm1mMTY1dE1naWh0bDM0ZFRDeUZQTDNPamFubW9GbU0rTVJ4eEJBWmRv?=
 =?utf-8?B?Z0N1RUtUODBkU2hZaFB0cGU4RVM4WmRKSlYvcHNjRjRvT2c9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VGtNSWxlcHpseGdzWVNGUDZMSW1CTjhCVloxMmtiS2hacUdhSmRieVBtMGF6?=
 =?utf-8?B?THUrS1FGY3FqTXRoU3EyOUhXRWJvV09MUS9VdkRkOGIzVWd0Y201YXF6SnRG?=
 =?utf-8?B?MkdUUDUwTHpTTm9jRTRoWDJIQ3YwRllMQjdEWWsySmJhbzVhZzdHTEh0RThz?=
 =?utf-8?B?M1E3Tm95OUdtQkZ3a2MrL0F5VUJWbkYzNTYrZDkwNnlxRU5keG4yeVNXeE9a?=
 =?utf-8?B?MytJMEFVQkVCVkxqaUlGSWR2QnFTaWovQThjVXBiRHNWd2F5OG1KWTRVTmJt?=
 =?utf-8?B?VXB2Q1pCZ3Z5RmJuWkJ4bHJGeStlNmorQ0JXRldHcEhhckFvS1pWeTR4bmZC?=
 =?utf-8?B?WXR1RVp0L09GSmRZdGUyTWdhS1pjRFVPQ1dvTVdQZHM1RUZEdWlPUGswRlpJ?=
 =?utf-8?B?TmhnY0E4bnVRNFY5UTJVMHhZbWRjK3UycmF6SHQwbno3UTh3R0JaK3ZMSk5V?=
 =?utf-8?B?d21MY1BkUDVYY3VMOUhCUjIrN1FlTm9vY0RoSUJ6YVRyN091TnpBYitESDVI?=
 =?utf-8?B?cUxKNHN2Mk9LWDdFdkltbVdOVmkyTXdoZm55cmZrOEZ5bzcrWTI4TDZXayt3?=
 =?utf-8?B?bDVvbXJyUEJZUjlKaGZRRUpsclh4RVVuNDE3LzAvWS9QRU1mZDZ5aEpabit3?=
 =?utf-8?B?WG1nZGJiK3BIY0ZpU1FITWZTYStEQkxSRFVMZkVJcmNNRmVSYTVYNittVkt5?=
 =?utf-8?B?S1JYTmE4eWZhV2gwdjFwYVdNb0pnRW00T2c2VTY4ZERRdVM0S1NHN3JjMmx1?=
 =?utf-8?B?eXdPREtOci80VWdUaFp2dFBaMzhjNndqU1Fxb0VTNmlxRlpzZHhaOHJ2NVJq?=
 =?utf-8?B?c1RzbjZoalhPVGJBSWVjOHZURS9MWktiQUtoUVFqdlN6TzkwS3FXc01kMERW?=
 =?utf-8?B?NnFITjA3RkdldVZGVGlVdnRiZzlySUFWUzJtWFcxejUwWW9wb0RGeUtoVjlD?=
 =?utf-8?B?SlBTb2ZBR3hqM1BQa3hGZEwxcDJqWnZzdTh2SFJuWUJXTTl3Qm92bWZCSEg5?=
 =?utf-8?B?Z2JrOGFWVEdpVTdndVcvcUJrNTlJZkEwRXZHNlV2aW1BTTlITWlyVUs4cXl2?=
 =?utf-8?B?SExReXpNTUxyR1NJY3dLZ29rRHlmb3g3RVY5YU5ETW5acTl0eTlCQW9mWkpr?=
 =?utf-8?B?WXF3ZXJ0aC91ZjBqRzV3bFJCL1g1aUNqREFZbnVYMmFHaUx6VnM3Z040dmZ5?=
 =?utf-8?B?NjNiVUVyWGE0ZlU5ZDBzcEhxWUU2ejZmLy9HRTREUUExUmYvblN0R2pYczYv?=
 =?utf-8?B?eC9qTEdGcnNEeGNwdk5pSmVnaWZVTFFUS1l0bWI2V29qRkVBdmlSVG1uQ2Ri?=
 =?utf-8?B?ZE9zZ2htaTdDZ1FZOU5xa0tidTM2VFVMZDd0dkVNQUI4R1FYSFdtMHhGWFgw?=
 =?utf-8?B?SWlNVXoyTlNraHRoNDZ0Q1lSVC9aZnAvbDJoU2gyQzhWbFBTamdTRG5jUFlF?=
 =?utf-8?B?UlpGZUdTOHFMTkltYjNsWkp3bzBLU2kzOXAzb256eWNUTEJETlpLOE0vZVEz?=
 =?utf-8?B?STg5aE0wN2MwRDFTdElCemxhYzk0U2Nac25KczJmbmlMdk5CRm1vYURzQVpH?=
 =?utf-8?B?TkZTMDBkMjM2SjAvMi9hcGgzY2s5bEt6TmppTk5uT0d4eXBNUFNJMHJBQWk5?=
 =?utf-8?B?MEk3TVlQWDJ3VkhwMGxraU5TN0U1S000c1JQbzhiNWhoSG81N2VIb1NHM2pV?=
 =?utf-8?B?cEhiSU9kQnBpTEQ1WVZFcFlwRmNpYnp3cGhqYnl1MDNENmhNdkhqVHNXV2dQ?=
 =?utf-8?B?cHZXZURjOXJaZ2ZZeXorbUlVRFFKT2xBSFB4Y0JNc1ppYzZsR2xHYlVlb3ky?=
 =?utf-8?B?L3hhWkJKc05pc0hlL1VuYkpqRmZYcm12UEo5U1l1aTdhbFA0VmlFcjNjWjZr?=
 =?utf-8?B?b0FmdHRTVlZTY0Z4UzRGNGhpeHpmcHpUVzR3RVg4S1l1RXJSOXJJR2gyU2JB?=
 =?utf-8?B?c2xWUFlsUUdmWXhJNk0zbERyaGh6a2F4dWVXZG5DQWYvczYrYTBqeWc3Zm53?=
 =?utf-8?B?cHhMaHNvV3lCaXBnWEtnRlVHNkFKSVh6czZlaVRyOVpDanJSWitXc1hhSDRM?=
 =?utf-8?B?cGVwdmp1aWExMkxmT2tUNmZmL1Jma0gwcUVtMjFTNlNwUWFKY0U1UU1NVXVT?=
 =?utf-8?B?OUlPR0lpSWFvbnRaT3lQV2lJNjJ1MGtzZndWaXJaYW0ybnlQVTRvUXNwZGdF?=
 =?utf-8?B?dFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71216ac7-3ecf-4e29-63ae-08de235510da
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 08:08:59.9641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +FmDEUW1N2HcguyN09/38Qq+h9r9jBciFIsKjXCmrxnAhVTbeaeZa9sufKZNcGMTHxzX5GCXdn82pLNjCIHuJ91Wn+We9mACKNxvcRuIndI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8290
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA2MyBTYWx0ZWRfX6pT0L+UkfrDn
 x0E51a6WORKOUxuac59qxWN7JcFPYK8C6b8aUOs3kgHBhRNfNDcxNdGQfal966ux8Xqxm+Uye6C
 SyX3v1hjFFSYx7w1hz8n5+PZN6Xr+10Rcl/DEnOF53tR/VR+Dt0gSGAbOcQ+jsWKBUbDT34ioQV
 G60cw/NmGOwNSgEA2uD7Xb7VZTGk01PlZ2X83982WoZooMs9dQpODcsSiZzS5me5+8gmGP3MyQP
 H7XtI1L8zwq0CPDxn0iv0AwJXPk2VyAqnmOX/mgBvO06dRtzahofdhz2zF0kgtltNwszwlZ9ATG
 2wcCagxZL+E7wqNMLw2QG5HHdqNnTi/+tdbQJl9wsKJ1MZvUO/GRBT+eUfvcVectuNMnlSdDb/r
 p8XB2syqGlIxUCxOH4TKXVlVphuS3Q==
X-Proofpoint-GUID: 9SI_g0xXIfadtps9ovhC75-iMmxJ5T9g
X-Proofpoint-ORIG-GUID: 9SI_g0xXIfadtps9ovhC75-iMmxJ5T9g
X-Authority-Analysis: v=2.4 cv=YsQChoYX c=1 sm=1 tr=0 ts=6916e39f cx=c_pps
 a=Tu5Wf88tfLtYLtD+ArEHOw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=14Z9r8xRtE7pHVYXAB8A:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 08:09:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121692

Ping

//Hongxu
On 10/30/25 13:15, hongxu via lists.openembedded.org wrote:
> The clang does not need option -flax-vector-conversions to
> avoid build failure for 32bit arm target
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
> index 6ca05d0596..b6344d4c68 100644
> --- a/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
> +++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
> @@ -22,4 +22,4 @@ RDEPENDS:${PN} = "\
>       python3-aiodns \
>   "
>   
> -CFLAGS:append:arm = " -flax-vector-conversions"
> +CFLAGS:append:toolchain-gcc:arm = " -flax-vector-conversions"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121189): https://lists.openembedded.org/g/openembedded-devel/message/121189
> Mute This Topic: https://lists.openembedded.org/mt/116025741/3617049
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [hongxu.jia@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


