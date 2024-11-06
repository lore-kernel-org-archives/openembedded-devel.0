Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A0CDD44D4A
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 10:53:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.43232.1730890378818628668
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Nov 2024 02:52:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1040f5e824=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A668d5H027108
	for <openembedded-devel@lists.openembedded.org>; Wed, 6 Nov 2024 02:52:58 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42nkkjm22s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 02:52:58 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4A6AqvW2022990;
	Wed, 6 Nov 2024 02:52:57 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42nkkjm22r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 02:52:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T2y1F4dF/HffVfZFXesp/AXJ0f/78Ve8zzj8c8lDnl4jFjJdCPlCIjgsRj+yZ3q6wnotM1VpFf3y3nUTS6R+STGTxygw7F7kkLXR49KCyYWjgKPsQ5soOf8K9HEjtGS9Sq2ADK+4c7dUtlmOBuBSJ+BA8MDRxuGPgwvW1VgBs01hDIX9JlaTcHcPLu76helZCE2LfPzQNjdiN9cXdmcRlbhy4YPOoS4oe6IqQmyDGP3sG1JSSXpmIvzmj3uUUvDqLZ9rRVomANbUy3cvvR8BkqYR8DVG3ffDD1TL6Ghw9hlA+t3339l9e45IAczC74gqcOsEnDAHXrPao9pjuli/kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylntQsuu6UosqqmSE7TUTUTsKBy/1UeaMB7br2NpVIk=;
 b=KSurPnSsKfdGLodI/2wGx5SlBv7paNiPsMUrxnh+pAR8u609GpGoV8zpje9UWBIcmaL7LzKOkHRT3Pwn5/WokeaK4p3xCx3YaLXcSK+lRb6lGhATBEWyW4O3zrIlmyJQo5VGAMiawAszzQDlMtGqrFCZqKcM0FLItW4NPy9e0/PCdTIFWhBqi9F54sblS9yQ8SXGOuicuQ04fpxEeF/GnqiSaTqLRWf6u5uxhk8i44u1Rqn/zoA71tJgMhV7hZ/Sy5YmHj7M3MMI7EfbFXPHkPbcgIalTu9O1VrADRhCvUjsEifDGWTiz+AvxYSlKnch7dKx4jq8ymYNSKDPwjKWpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by IA1PR11MB7269.namprd11.prod.outlook.com (2603:10b6:208:42b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 10:52:54 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%4]) with mapi id 15.20.8114.028; Wed, 6 Nov 2024
 10:52:53 +0000
Message-ID: <37607690-2998-4532-accc-d8468d2c0bab@windriver.com>
Date: Wed, 6 Nov 2024 18:52:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] parallel: Add recipe for GUN Parallel
To: Khem Raj <raj.khem@gmail.com>
Cc: Rasmus Villemoes <ravi@prevas.dk>,
        openembedded-devel@lists.openembedded.org
References: <20241105101028.2967192-1-peng.zhang1.cn@windriver.com>
 <877c9ihrc0.fsf@prevas.dk>
 <950fae77-cccc-4785-a930-a42c86571d5e@windriver.com>
 <CAMKF1spfPByGjr3CcGVDGbo5LOug901YZYtxgwHQAJUjGc8y1g@mail.gmail.com>
Content-Language: en-US
From: Peng Zhang <peng.zhang1.cn@windriver.com>
In-Reply-To: <CAMKF1spfPByGjr3CcGVDGbo5LOug901YZYtxgwHQAJUjGc8y1g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYXPR01CA0055.jpnprd01.prod.outlook.com
 (2603:1096:403:a::25) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|IA1PR11MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: a5c262b0-30b0-46f7-779c-08dcfe512a09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|4022899009|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RkpvZ3dsTWQzRUsybUlEbW5MaDVlN0pBck5oeW9EMWhLUElnYkZSR3l5SUVh?=
 =?utf-8?B?MmZWbWx2ZnY4NGpXSTdnTlJiSzExRDdnQkg4RElUbGFwS0RPTzBVWDhyb1E4?=
 =?utf-8?B?NlBFRFVPOHRFcDcrY1VSaTBVVWVvQlRSbFp5QnpvZGMzS01oK1FldmhFV0R1?=
 =?utf-8?B?RFQ0OFdBWHhOQVpMSG5NTVJiUmMwaTBBdjNCQ0ZiQ2VFYTFXSDhMZ0o1SmRl?=
 =?utf-8?B?ZUJ6bjBHLzFkMlRHQjVPWHZyQzlUaWFIWFBnY2kvOXlVSEdoOHRiNUs2eGE1?=
 =?utf-8?B?WkVEY04ycit3cHdzK1ZyTS9rKzc1KzlTVHhiQzRuUG13T3RiQThjUVdaNG5Q?=
 =?utf-8?B?MGNOa3JvZHdvVXZjc21uOHhodzA2NHZKYkFJcmFEdE5qRHdSa2UwVmJFZjR5?=
 =?utf-8?B?bDdOUmNYa0tuUlBFbmhzSThGeE9JTFNwdnRadXJYdUk3emNBRXlBbnd5Ukk4?=
 =?utf-8?B?aWVHdHRnaXorYk1kVGpBRUFzOExKWm9oSGtTdWFZSEVabWVFZjBUMG8vUDRw?=
 =?utf-8?B?M3hUOTlUbE52UVFZNmprV21lV0g0RGNRZldLZWUybmFKUTR2TmR1bkk3alh2?=
 =?utf-8?B?N21HRlpnZUExa2t4bndiQzFmS0lyVlMzWExiaGtPbnJwblUzV05jaXhOd3cz?=
 =?utf-8?B?am0rRllXWktIVisxVmoxV0VKM25LWHFVVFdkSkNob1hhcUhzbktXS1Uxc0NY?=
 =?utf-8?B?bEhkeVVDUFZUUXZlKzJKdXNLYzlrTlh5WHhPNzJTeVJWdzBNcjE0bGRKSllw?=
 =?utf-8?B?aG9TcUxTVzdtYmhQaHMycFNNVWkycWlXZUI5ajB6aEV2ZDVWazZhWHQzSEpN?=
 =?utf-8?B?TkRhL3RlZnNraTJGWnRxbXlWb3NvbW1OOEVPVFRkYWE3V2QvZDFXNjhCZmxE?=
 =?utf-8?B?TmFBc3RaZkRTdlAza003YjU3QjYwLzFUY0ZhTlRFQ3JleWJpcEE5N1EzZkVo?=
 =?utf-8?B?cXZOT3lWemF4OHBBQlhVQksvOWpGdEpUcDZGNVQ1WUlsNVJwQzdjRXFuSHAw?=
 =?utf-8?B?Z2NKK3Y2eXRpK2wrVTYwaUdvSThHNXRYOVBCRkJYeElrNUh5WFpCUHVuNXkr?=
 =?utf-8?B?d3U5bTl1NlpJbFNpSXJwODZDWVN4aHp0THB4enErbksyRGIvR1BPVzV3Vlk0?=
 =?utf-8?B?TGQrRjEwUWtVc1JmNXBBSHpzQ1BrWUNZSGxwbld1MkVPWDFUY2grTWdxMFhY?=
 =?utf-8?B?ZS91U3pLVXB0cXJNbVNXQkRBTndUWDYrVUkycTVPZmkySFZ2OEd1eWYrWWt4?=
 =?utf-8?B?bmRpYnowMXNhRmRKN1ZFcCtUbDhIQVJQYVZaZmNVWTdlUmtkcWhKWm90akNj?=
 =?utf-8?B?V0V5cFVPL3pKdzRRTFpsbjd1S3p4Sko1Z1Q3NHEzSjhZOXovRGFYVGVvVytJ?=
 =?utf-8?B?eHY0WkZvYkhHMzFObk8yVENJeGFxOWl3WnNrTDRPTXpWaHV5V014Ri9KUjl2?=
 =?utf-8?B?dTNLSjNnNW9PU3FqTzdzSkVnK3BGaHRlZGxlNXRNNzFxY21vSE1GdklHZGxG?=
 =?utf-8?B?VTBJY0FpSTJ3UGIzRCtSN3dQaXAzUFo3N2VDbkw1clhudzF1d2Q0T3Y5dDUz?=
 =?utf-8?B?c2hNOUhoc05ja2VJSWVCeUxQSzRQUHRDMlZsRC9OZnBkQTNzbFo4SnBBVUdq?=
 =?utf-8?B?K0hHbDRvbHRoaVoxZnJiL1lGcHh4MDdjM3hCUk9ZeWYxc2lINnJuclR1Y0Nk?=
 =?utf-8?B?ME5heHZITUtwS0FhVkRWR2tob1VXL2lxalBTT2ZIOUNYUkQrMzdlOW1hbU5Q?=
 =?utf-8?Q?3Q7SpZRyFt45/gnv7qNqJjB1+zlEkvwMiYz3pW9?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U1RpQWdSaEZVZXVjMjdHRGZQelJIQ2JUOXdkYWJiK3RZMlVxd2NZeXVXVmFS?=
 =?utf-8?B?N29ucFloWng3aC9VWGowUmVvVUFRdnRJdWZzM3VneDRxRkpuMzMzMy9NcGdP?=
 =?utf-8?B?VkhmWTdvbG5mdHpWaG1nbkNVWDA5aktUM1JzcExHbkFoSy9sdklPazRwd0h0?=
 =?utf-8?B?eUp3cndCaDFSUlc3Y2xHTnhXdUFLVGx3b1l5OW5yUmJqMDVtZGx5QS9ySlN2?=
 =?utf-8?B?enVoU3Q2ZEpvWlhsUytzUjFXdU1lYUgraElEelhrOWFGbnZ6cmJZQlAvcU9J?=
 =?utf-8?B?b2dSK2Q4QWp1OHA1L0lkL2UvbVIwb1lvbVdhY21mY2tSbGxvYzdsNFNGYmtM?=
 =?utf-8?B?SmFORVVtN2RWTHl2ODliTWlRempBSHMySEh0b0F4Qi9FOWJFZVdWd0hNOTV2?=
 =?utf-8?B?M24wTzVyTEZNM2w0SHBiWjAwcEdBTi9wUWJIYjc4cnR1QVF5NFlxTHU4eEM1?=
 =?utf-8?B?RHJNc1F1MHlyMkpQYytRSXNLajU4RGJWYlp2b1RkckNTVVhXNmVKMnBGQS95?=
 =?utf-8?B?Q21tZllaWU9XeTJHcVRubnRaS3FIdGJVQStrUVViR2dZUHJCQWRRelU5UkQz?=
 =?utf-8?B?T2gxRVZ5alFzTVNMdlpmSlNMQndydzV4TXpacW5Mc1k1TU1YS1hNSHlreGF2?=
 =?utf-8?B?cnM5N0VMcWFNRlB2NjJFcHVnUnp4VkRoZXJEN0g4Qm1ZKzF3MU1qRS9CNkpI?=
 =?utf-8?B?SVVRTU5TL3ZXZGwwdWVaK0hQei9QT2RZa1NUYUtaYzV1ZXk3YWMzUlptamYz?=
 =?utf-8?B?ZCtzNWFBdDRudlVqZWpZOWN5YUtaZGVwL1U4WWk1TnNVaGNKVHNQQTR2U0Vx?=
 =?utf-8?B?cXBNTlJHTnpreVhJd2VwZThvY2cydzkvRGJ0KzVwem5QWnREWnFRbGNRWUNo?=
 =?utf-8?B?akRDVEx5L2l3eWNiejVtVHArbkhOT2d2QWFrb2RNcVJ6OFl0cGFmdnlmTStR?=
 =?utf-8?B?UXZscnBIcUtGNGZIU093eFlXa1E4VFlNamRRNCs1ZkhoRmxxbHBYRkFLQzZE?=
 =?utf-8?B?TndGcThjZlY1ckVGZ0lLUWN2dkpHYTgvNldUb3V6VFNFUjV2bXFxK1ZvRmFs?=
 =?utf-8?B?WTh4TXFLdGlKdFEwSmRIMTFEYTBScXh5UjVzWDVWM2lWWHFSemJ6YldMMkp0?=
 =?utf-8?B?b3Q2NVhMWXBrSHhTUktwWUYybWFJZVNjQ1Z2cVpVZ0xOVnRtS3ZyZ0NXejZ5?=
 =?utf-8?B?QnkwS2h5V3RQdjl3bWVGTTBLc3hBMGZTTzRLQUxOYVR0djQ0NStNdm5xM1ZP?=
 =?utf-8?B?Wms4UFRJcWJsTE1iSEN1eXNXMVhHakhKZi9PbmNDQ0p6TmVqVHZ2Nys4VlVk?=
 =?utf-8?B?MW1pVm1nZXlkWDhrT2o5VEY1cGZpa3NSdld1cy8ycWdKaVhTbDQ5ZDZsdlZ4?=
 =?utf-8?B?TWlkM0I4RjIzKzRnTDBrcGN6bks1cEthbU40OWVOYzNVWjBTTnp1bmErd09n?=
 =?utf-8?B?d1lNa2hKUHJNNkxuZU1pTWZObDdoTGEySnpGandFZUNpbTE0T2dGc3NabnZh?=
 =?utf-8?B?dzNrMm45MW9OWU9lYlNMS205UzUrNHViV1NOb0lZUGxHU2pZOEg4dUl2K2VH?=
 =?utf-8?B?d1FsZDRMN1JaSGwrd0RKMVVhZndHWFBrRnNzVW1KOFJaakF3cm42MEVpR21J?=
 =?utf-8?B?RXdHMUU2SlR0SkczcGNsd0Ywa1FteUo0RzZ0RUhrYjRna0llUzFGSkJCbUxz?=
 =?utf-8?B?U0QxUS9TVFU2OVpRU0hCUUE3SFBRVnEzdUxHdC9RdzRqc2QrUzJSc3dkQ21s?=
 =?utf-8?B?M3IvR0J6YTJKWEh1V2VFTkVSUXRtRGNrcjRwTmFvZlBJTDFFOVVaVFo1REdt?=
 =?utf-8?B?NFhSZzJTcFJITzU3T0U3TkdHZnlKc1FkTmpLczZYendGSEQ2MFMwY3hTSk1s?=
 =?utf-8?B?YVgvTWlWVzVRa21kVGJITE1nQ1FKb2lIRDNHelo3Q2V1a2QvcCtLTzN3eHBM?=
 =?utf-8?B?cXdncDFyTm90dDhxa0g1czlrbVhpTklDYkNWbHNPdzd0Z3VKZUlIYlkyRHV4?=
 =?utf-8?B?enU2Y3JvZlJlYmVGSGlFSjZDbnE3Y2xZRXA1OWVmTkNqMXZwZ25RVlVrN0Y0?=
 =?utf-8?B?TTZLM0prZXRJcE1rWnhnVGRvWUM5MXRZM0pRSjZBS0Y3S1MraXlUUXJGc0pU?=
 =?utf-8?B?VUJ6eTdsc3dMM0FJNjNiWXpQcjM0ajU0WkFFSFRYQW9seTJNZ2F5TndQL3Bm?=
 =?utf-8?B?VEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5c262b0-30b0-46f7-779c-08dcfe512a09
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 10:52:53.3433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k2w1042cfCT6HlGWB+eIWodNfSdxsdsUKp5azTzfjXlR36wUb4siTFAL4t8+zzwPfUi92HDVMg2tW1olAuL+JEGTAAi5h0ftEi4lqYMHSOU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7269
X-Proofpoint-GUID: U7qU2xu96MKWNV14IeNl72Aq7ZF34KvW
X-Authority-Analysis: v=2.4 cv=YvBdRJYX c=1 sm=1 tr=0 ts=672b4a8a cx=c_pps a=Bc47kgIQ+uE7vzpOcRUeGA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=xNyszjnFybh8n1HN29IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 3im8zc_R1wPyaaE_S8n_bITAvPF7aem9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-06_05,2024-11-06_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxscore=0 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411060088
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4A668d5H027108
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 10:53:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113737


=E5=9C=A8 11/6/24 08:26, Khem Raj =E5=86=99=E9=81=93:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Tue, Nov 5, 2024 at 3:15=E2=80=AFPM Zhang, Peng (Paul) (CN) via
> lists.openembedded.org
> <peng.zhang1.cn=3Dwindriver.com@lists.openembedded.org> wrote:
>>
>> On 11/5/2024 7:07 PM, Rasmus Villemoes wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
>>>
>>> On Tue, Nov 05 2024, "peng.zhang1.cn via lists.openembedded.org" <pen=
g.zhang1.cn=3Dwindriver.com@lists.openembedded.org> wrote:
>>>
>>>> From: Zhang Peng <peng.zhang1.cn@windriver.com>
>>>>
>>>> This recipe adds the parallel package, a shell tool for executing jo=
bs
>>>> in parallel using one or more computers.
>>> I often use GNU parallel, and might find some use for it on an embedd=
ed
>>> target, so makes sense to me. However
>>>
>>>> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
>>>> ---
>>>>    .../parallel/parallel_20150322.bb             | 22 ++++++++++++++=
+++++
>>>>    1 file changed, 22 insertions(+)
>>>>    create mode 100644
>>>> meta-oe/recipes-extended/parallel/parallel_20150322.bb
>>> Why such an old version? It's not a dead project, there was a release
>>> just a few weeks ago. If it's because of some dependencies that the
>>> newer releases have grown and which are hard/impossible to satisfy in
>>> oe, that should be mentioned in the commit message.
>> The first version I used was 20150322, which was already quite
>> user-friendly and straightforward to compile and deploy. Given that th=
is
>> is the initial version of OE, I prioritized getting it working first,
>> with plans to upgrade as new features or requirements arise in future
>> iterations.
> It's better to get the latest version to begin with here.

v2 sent, the version is 20241022

//peng

>
>>> Rasmus
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#113680): https://lists.openembedded.org/g/openembe=
dded-devel/message/113680
>> Mute This Topic: https://lists.openembedded.org/mt/109403275/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

