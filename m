Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D252FC021B8
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 20:17:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.19047.1740514645109571846
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 12:17:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4151b5491e=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PAo1Xx014789
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 20:17:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44y5j8c3q1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 20:17:23 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51PKFE8p007507
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 20:17:23 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44y5j8c3py-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 20:17:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uUwOhotImUFUEITCXge+IWAFPGEmA6DznV94w0B7EeSrNF4URbiKp3Ig08JXcbcvCKW6NPIsEMbqnGpaBAFBI7DrhT/l+3eU/UENWJK0XJ9fvNqd91frfUDfO40vWswwjy4VUzNz9bHoYJy3IR9U6lj/hmXPgaqwDO1OxSdbFphT9UdGkWo0b/eX6T2kxwGEB+772UimAjLFGQPx7PsKxeOR6NFnW9Hsw3m+7lXgUxCY8hSAAKbDucgDGvl3G/hW/B2846fnWWyCfLFMuswFmN1ArwNJ3W6K5zLcMxrZmJqWRi0oAlw85HP552+xRevtdqtc/vd/+QBwMQ1608Gocw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OUlaXCBZ/GmLII1KfTpUKWa7tjVXKsVE0iaO+OZoXEk=;
 b=rD8Y9nQhzCq5YBts6+dRIzcn/aQWE9a6xVxnLNCIcKvoOpQ095lxlxkMbUudeRSg1QtcoO52kaPBHkKWwe9cfkZaKVzP5A54FG1b2ARjx0ZL7DtZrwCzYGn1QxT53c2/yOMZ8blbHfzuotOfRI4hibXH+Q9397OVpEcaIe6PRk/r2NGDXsp6SFMeiPspqLHTVoy0K9OiytyhOmlACh8bz/YC2YsOYe5dhZhCryMxS+VJFZ7WUMO7DyOB71Ki00Lmv/vnPFDtpVWQA9mxAXqEp28P0Vq+giKYpPtBlZaHZCg6jqsc+3eAqqZJvXgn8YsB0QjSsJbWp0QkrLnD5bn+rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SA1PR11MB6760.namprd11.prod.outlook.com (2603:10b6:806:25f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 20:17:19 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8489.018; Tue, 25 Feb 2025
 20:17:19 +0000
Content-Type: multipart/alternative;
 boundary="------------3kHAqe7s7mxsQ0MNTlcaN3yu"
Message-ID: <544b076b-a77d-4e7e-abe6-d3f6ffbeae63@windriver.com>
Date: Tue, 25 Feb 2025 15:17:16 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] libyang: update from 2.1.148 to 3.7.8
To: openembedded-devel@lists.openembedded.org
Cc: r-gunasekaran@ti.com, reatmon@ti.com, yi.zhao@windriver.com
References: <18278CBDD6DCCF6C.4138@lists.openembedded.org>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <18278CBDD6DCCF6C.4138@lists.openembedded.org>
X-ClientProxiedBy: BYAPR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:a03:40::14) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SA1PR11MB6760:EE_
X-MS-Office365-Filtering-Correlation-Id: fe69626f-ef41-481b-ad4e-08dd55d9678f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|366016|1800799024|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dU5GNzlYUWhsaUlZcXRmTmQxZkE1RTJqMzJWa3Y0d0preEFJZjJ3MnZ2SlBR?=
 =?utf-8?B?eWdMNVZ6V3ZLcFRoc2xRWktadFJraVN6eS9LazljbmVYSkZmVkJETXlNMGVm?=
 =?utf-8?B?YldlTVFYWTQ2bDlDZDRGc3FaV3dZSmhZWklhOWN5L0k1aER6ek15WTRUUGhw?=
 =?utf-8?B?Wm1wMUxJaE9YRlhHdHQvdVgwMU51bVVPUkRHTUNZWlkvMndrNHMzazRiWDQ2?=
 =?utf-8?B?dmxDajVpUFdLSWxOeTVBWVBHdUJ1RktxMllYYnVpYXJ4UzFlNUpDNkhlYjN0?=
 =?utf-8?B?MHk1Z1hJeEZkRVpHa25JVmNtc2ljamh3MnIwdHgwb0doeWYrd3grN3BIWWhG?=
 =?utf-8?B?M3NhbFRZSG9KL0cwU05SNzk4dVV3RTVvUjJIcXZUKys3UU9xNmdLOVJSZ3dw?=
 =?utf-8?B?VjAyU29EOTNKMDJOWGNmVWRveWxMemZnZDNWcHd3TkxSWnlmVjNQUHdQUERQ?=
 =?utf-8?B?QXMzS1VZc216K04zaEFMa2pTSFZBTGRadEp2eG0rV2grd3lmWE5LTERZM240?=
 =?utf-8?B?M3hTK3c4UnhCWDdUbnY1TWlVWDVhQ0pCZlNQcWdlWmF1Ky8zZVFRcW5NM3NO?=
 =?utf-8?B?eE1seFRRaHBvYTlSbnhXb2ZGSFVuRWRMTG5VejBUd1lzdDlld1N1QUZnUXdZ?=
 =?utf-8?B?dEJ5QlBFTCsxOCtMcmJqcW80Y2NQUWNzcWJPOGEwUVlqWnBaajdPb2NVYkc5?=
 =?utf-8?B?TWlaQmhMa3FtcFp6bUxiM0VIekgyN3NySnNtVUJ2KzBycnB1dEF5a1JqMDFt?=
 =?utf-8?B?RE1BQnhaMWtJbTFqNVl0NFlsWDI3M21IdVlpYTdnUk51dzdpZGM4Z0JBcCtn?=
 =?utf-8?B?aWNEYXA0K04vV2Y1eFdSRmFNUm85UVNHUzdEemtKam1NRGkrb0NVUTdRV2tI?=
 =?utf-8?B?b2h0OUJkazBWRlpKZDdNMHRGaWZBVWJOaTUxUHROT3doeit2bzF4dmdsZkQ0?=
 =?utf-8?B?YkpIei9LNUtFNm8vK0paUmRJbENITGhiMFVRREtkSG05eWhGMlpna2lIaEhp?=
 =?utf-8?B?TlRZZDQ2elBZd0ZuYTVITkZ5Q3BieDhkaGgrZ3pCMlE3TFcydExLVFlDNFZR?=
 =?utf-8?B?aDRWMzBybk5rWlZxRUpBWUxOTC9FNVh6ODFXZnFyWmIvOVhQcGdtcUcvYmln?=
 =?utf-8?B?M095Ky8ycWh1bGUxMHh2Vzk1K2c4UWRETVBjL3lqQmllZEVSYlJNbEFXZzFa?=
 =?utf-8?B?QWhGZi9SRS9TWDRtUkw0Uk9lSVdrRy9oNnhSY2Y2dTU0ZnlQWXJPd1JNYjB3?=
 =?utf-8?B?d0JJaDVROTNleVpiV0dGUjRFQzdOUzlHbXFTYWkvekJrblorVDNSSWl6Sm44?=
 =?utf-8?B?WjJNbWdXMzRhRzFPN2RlMGMvbUdBNDZjaXpCeis4M1BRbGNza05CL25lQWww?=
 =?utf-8?B?N1RCTU1rMmJFM2JXaDN5cFlmMUpZQVBZWVFxTkI0bHFOMWpQa2FPSThQNHlT?=
 =?utf-8?B?NXVkSXZPdXJZS3ByNHNRVHphSHRhK09jVXRnSVk3TFJ2K2w1bmc5S1RRQ1Av?=
 =?utf-8?B?dkxrVTRtaHdEQ1N5ZWZZYkRoamNEck5udHA2RUhqR3BKelloTE1zN2txVjlp?=
 =?utf-8?B?c2N0Z0RqRi84WGNFN3Z0NFhZY3BvSDk4TjdIcUNISmlvOGpRc0djNDBqbUJU?=
 =?utf-8?B?aHVWd1ZINkFOdmpZdE5HTURsUzBmRW05VzlNcklZODBtQzJOUmhwckpsZ3lM?=
 =?utf-8?B?N1p3Mm9QQ1pCMlg3S3ZwNVZ0Ni9VeWlsRzR3aWJyeVJ0eUkrbkVDMHY2VXZp?=
 =?utf-8?B?c1o0NEovRFQzd3dOSStMQ1NOZGpZd2VnSjhQTmdQOUE3QVJsR2wvaXJFY1A2?=
 =?utf-8?B?WWp4WUlyZHhPWGg5azdoQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dnFqNjFod25SSVBGdXRMa0tZRHlUNkhZRk1OS3A1aDcvWCtGbUdSZW10OFRG?=
 =?utf-8?B?R0s5Ukk3WENITzY4ZS9aL1lnblRJd0FZQ0thVGZxaFk3cmhaWHBJeHBjNG0v?=
 =?utf-8?B?ZTJIQUJPcTkzRUZBSUtiSWlFVWMrUEgwOFZzN1pEOTZhandrNDZta3U4U1ht?=
 =?utf-8?B?TG83dWp2L09velE4Q0NhaHZaRU9kT3h0aDlRaXdKZnVVbmxqUUNnQWgxZlFG?=
 =?utf-8?B?cC9yd3d6Y1ZQRklqRXE1ZXBZMTE4U0FqUHd3VWJVc09KOGNhZFR1LzZlanFC?=
 =?utf-8?B?VmpQZm9PTlVLQlhRLy91ZVphZHc0WkZDSlRyMXltYjU5OWJnTVhrc3Awamhw?=
 =?utf-8?B?UmZGZ2diQ3VhVlc0Z3B4OTNWZG1jb2xsUlJnSW9ENDlheG4raytqbm4wSkNm?=
 =?utf-8?B?L0dBR3JORXZhVjd1VDRJOVNNbTNQOWYwd0xkN0YvdWRENUZ4YmFuWUlZWVNX?=
 =?utf-8?B?RWtrb0YxU21RRkFhV012YkVqUlE4MWFVNkdlMUV2YzJNUm1VMHEzOWU0UU5U?=
 =?utf-8?B?a3JnS2NMQ08xeFpFZ1Q5WXE0QmJnbjJLTzF3b1JKMkkwMnc3eEkyWDZYSlBa?=
 =?utf-8?B?YzBnNno3K0JVVjBxWGwrWXk3V3h2YzNMb09QMTJObDFjZFExUm1HdkxsK1Js?=
 =?utf-8?B?dEd1NmZGWUY0U2p0UEtqSTh1eituWnFFdTV4Uit5M2M2c29jUG5DQVVwMUFh?=
 =?utf-8?B?S3JSVjZHdTBVRDVYRGN2NXJHZzZybGVEMkdOaEZVOGwrcWFSK3NnaTB5MUox?=
 =?utf-8?B?dnk2dkQ0S1hxWlBMbkpsSVlGMlhwTHVHU3NOTG4vTUxpWEpNY1M1N1ZURGtX?=
 =?utf-8?B?RHhlT0ZQL0ROZHV6QmxuZUtNMXU5YzlaUDFjRzJETXpEMFBFbDhFTGVlRlpD?=
 =?utf-8?B?S2x3WkxhT1phZFZPdXdUU1VGSFBYck51RngreWJONWx0b0hzRDJ6clRTdmxU?=
 =?utf-8?B?SnIralpMaDVnaTBBUG5SNjBnZmUrSWRGUnRLTVVqaVUxSThmdUZFNDBwTmFJ?=
 =?utf-8?B?Wjd1MTJIdU83Y29Zc1ZxMVBCMmo1bGs5MUJ2T3EzU2ptTkU1dnNRTFNPUG12?=
 =?utf-8?B?THVCd2E2dEw2YU5PQjBicSs1d0dKWFI2SkhNcU9lVHJ3dTh3YVhhMjQ5NDFz?=
 =?utf-8?B?Nm9oTFFvR0ZkSU5JU0VUbDNJalNBMllwVVFzdlJ3MmtIbXNmd0JxNnZRZXlM?=
 =?utf-8?B?dHFPdkNHT1oyWG15WVZSeW1yYVV3ZVVNeGhOTy8rbit3YVhxZlZEZDhwQ3px?=
 =?utf-8?B?WGNkU1g3YU9hbnplaDhwZk04Z0FXUFRqUUhXd1oyQ21ER2w3YVBzM2xaaS9h?=
 =?utf-8?B?YzM5bURrSld1R3Y2OVByNVBYaUtBQms1N0RuN01ETlQ3Y3lGWVVhSWtPU0Fh?=
 =?utf-8?B?ZFIzSFQ3cmd4UHh3Wk9PczVKdjRFUEgySU1CYWJKWTRGaWQ4cG1Vencvc0lI?=
 =?utf-8?B?Skgyejk5bEVkQmZmZFM4TmNhTnRLSklhUXZqVUFyeXZmdHlWMFZQYUw2NTdk?=
 =?utf-8?B?OTEvYkFXQUQxYnZVcksyd1huN2NOQVZYY3FWMnJVYmkyazYxQ1l1N3o0cjlY?=
 =?utf-8?B?b3RJc3J6dGRLaE5XL05yQ0x0SHhuYkl0S1VQekRsWUNWc29UMWZNVlFlWnd6?=
 =?utf-8?B?UGtrZVpJV1VCZFB2TTB4Z0JVMjBodE5xQjlYMzQ3NHpidmpQVWxiV0NhRHhK?=
 =?utf-8?B?YUJreGdyWTlOd1hOWHRqMDVHTkxUTTU5Q1dDMFZJQnJzQ0xGNDB6bm94T1lP?=
 =?utf-8?B?YVNBdkNzbXNDbjQ0eS9kSzl2WEI5QnVpVG1JZ291UVdhSWhCcGpTd0hWcWVr?=
 =?utf-8?B?RGFVcUR4T0gzd2V6V1psR0hvTE1mZnJ4N0ZFbWQzb2FUSFBUMUd3SGVLSzNh?=
 =?utf-8?B?MkRvaWwzOWx5dzRMY1dhMGkreTRjdU5RQlVXTGVTelFOQVZOdmtiRGRyNFNt?=
 =?utf-8?B?U2lMMlBVL0tmQlFmY3dPREtkZGFPYkxUZ0RIMjZJQ1Z1bEtFazBVallCZURD?=
 =?utf-8?B?QmhTaFJsemV1ZWpJa0k5bDhNZHRNUFVSdHJmbVlvb0p0QlUrTDZQRkRybkFG?=
 =?utf-8?B?MHlKV0R0ZFV3TVB0VU1aWjZRK2FuWW9mSWNxTTJKQnF6czFjZGhBQXR0czVt?=
 =?utf-8?B?QXBqNUpSMkxPalZDSjF3VGZ5cnAyQWhLZVYvb0ZRMklnVTFVYVVBR1JlL1dG?=
 =?utf-8?B?VlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe69626f-ef41-481b-ad4e-08dd55d9678f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 20:17:19.2442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XBy1vp7+EHsEWPTkpmBLKFTYe6ylV9/CBClgF8gsKXnqIbe8wgPQUZJ0Pd/DEFCvL0SqqooAkj/04PkrAU0znAtE57x/1xnvkLIzK/ASZpM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6760
X-Proofpoint-ORIG-GUID: iF3CSpnT8_qfk8PHi3wERh-GZf7Uxs15
X-Proofpoint-GUID: 4jygJ411QJ5tqB6wYD5K9yu9xeJ0wVOg
X-Authority-Analysis: v=2.4 cv=U+ZoDfru c=1 sm=1 tr=0 ts=67be2554 cx=c_pps a=rPWB9DPlu1VaKM/QD/CSBg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=qTNkJVy2S2wKHqvqN2oA:9 a=QEXdDO2ut3YA:10 a=_d0nRTfDr0aFKIwOCHAA:9 a=stnKbiMPSaBT2fem:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=ImwWUX5h3JJ3gRE9moBe:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_06,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 impostorscore=0 mlxlogscore=886 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502250123
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 20:17:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115598

--------------3kHAqe7s7mxsQ0MNTlcaN3yu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


CCing potentially interested parties.

Ryan, Ravi,

Do you want to drop the duplicate libyang recipe:
https://layers.openembedded.org/layerindex/branch/master/recipes/?q=libyang
from meta-arago-extras ?


../Randy




On 2025-02-25 3:15 p.m., Randy MacLeod via lists.openembedded.org wrote:
> From: Randy MacLeod<Randy.MacLeod@windriver.com>
>
> Update libyang from 2.1.148 to 3.7.8
>
> Only the copyright years changed the LICENSE file in commit:
>     b13198971 doc UPDATE libyang v3 transition
> so update that checksum.
>
> Note that the prefix 'ly_' was added to header files in:
>     8f702ee38 libyang UPDATE add prefix for common and config files
> so the multilib header install:append was updated in the recipe.
> Packages that depend on libyang, such as frr, still compile.
>
> The ptests all continue to pass.
>
> Signed-off-by: Randy MacLeod<Randy.MacLeod@windriver.com>
> ---
>   .../libyang/{libyang_2.1.148.bb => libyang_3.7.8.bb}        | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-oe/recipes-extended/libyang/{libyang_2.1.148.bb => libyang_3.7.8.bb} (88%)
>
> diff --git a/meta-oe/recipes-extended/libyang/libyang_2.1.148.bb b/meta-oe/recipes-extended/libyang/libyang_3.7.8.bb
> similarity index 88%
> rename from meta-oe/recipes-extended/libyang/libyang_2.1.148.bb
> rename to meta-oe/recipes-extended/libyang/libyang_3.7.8.bb
> index 0eff3247c6..3bea9bc2b8 100644
> --- a/meta-oe/recipes-extended/libyang/libyang_2.1.148.bb
> +++ b/meta-oe/recipes-extended/libyang/libyang_3.7.8.bb
> @@ -4,9 +4,9 @@ HOMEPAGE ="https://github.com/CESNET/libyang"
>   SECTION = "libs"
>   LICENSE = "BSD-3-Clause"
>   
> -LIC_FILES_CHKSUM ="file://LICENSE;md5=f3916d7d8d42a6508d0ea418cfff10ad"
> +LIC_FILES_CHKSUM ="file://LICENSE;md5=9bb3d334294e8719f41c531e28a9a697"
>   
> -SRCREV = "fc4dbd923e044006c93df020590a1e5a8656c09e"
> +SRCREV = "03e294d83b610f89e8ba7b2156a80dc0ad534443"
>   
>   SRC_URI = "git://github.com/CESNET/libyang.git;branch=master;protocol=https \
>              file://0001-test_context-skip-test-case-test_searchdirs.patch \
> @@ -31,7 +31,7 @@ do_compile:prepend () {
>   }
>   
>   do_install:append () {
> -        oe_multilib_header  libyang/config.h
> +        oe_multilib_header  libyang/ly_config.h
>   }
>   
>   do_install_ptest () {
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115597):https://lists.openembedded.org/g/openembedded-devel/message/115597
> Mute This Topic:https://lists.openembedded.org/mt/111384199/3616765
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------3kHAqe7s7mxsQ0MNTlcaN3yu
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <p>CCing potentially interested parties.<br>
      <br>
      Ryan, Ravi,</p>
    <p>Do you want to drop the duplicate libyang recipe:<br>
      &nbsp;&nbsp;
<a class="moz-txt-link-freetext" href="https://layers.openembedded.org/layerindex/branch/master/recipes/?q=libyang">https://layers.openembedded.org/layerindex/branch/master/recipes/?q=libyang</a><br>
      from meta-arago-extras ?</p>
    <p><br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2025-02-25 3:15 p.m., Randy MacLeod
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:18278CBDD6DCCF6C.4138@lists.openembedded.org">
      <pre wrap="" class="moz-quote-pre">From: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>

Update libyang from 2.1.148 to 3.7.8

Only the copyright years changed the LICENSE file in commit:
   b13198971 doc UPDATE libyang v3 transition
so update that checksum.

Note that the prefix 'ly_' was added to header files in:
   8f702ee38 libyang UPDATE add prefix for common and config files
so the multilib header install:append was updated in the recipe.
Packages that depend on libyang, such as frr, still compile.

The ptests all continue to pass.

Signed-off-by: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>
---
 .../libyang/{libyang_2.1.148.bb =&gt; libyang_3.7.8.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/libyang/{libyang_2.1.148.bb =&gt; libyang_3.7.8.bb} (88%)

diff --git a/meta-oe/recipes-extended/libyang/libyang_2.1.148.bb b/meta-oe/recipes-extended/libyang/libyang_3.7.8.bb
similarity index 88%
rename from meta-oe/recipes-extended/libyang/libyang_2.1.148.bb
rename to meta-oe/recipes-extended/libyang/libyang_3.7.8.bb
index 0eff3247c6..3bea9bc2b8 100644
--- a/meta-oe/recipes-extended/libyang/libyang_2.1.148.bb
+++ b/meta-oe/recipes-extended/libyang/libyang_3.7.8.bb
@@ -4,9 +4,9 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/CESNET/libyang">&quot;https://github.com/CESNET/libyang&quot;</a>
 SECTION = &quot;libs&quot;
 LICENSE = &quot;BSD-3-Clause&quot;
 
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=f3916d7d8d42a6508d0ea418cfff10ad">&quot;file://LICENSE;md5=f3916d7d8d42a6508d0ea418cfff10ad&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=9bb3d334294e8719f41c531e28a9a697">&quot;file://LICENSE;md5=9bb3d334294e8719f41c531e28a9a697&quot;</a>
 
-SRCREV = &quot;fc4dbd923e044006c93df020590a1e5a8656c09e&quot;
+SRCREV = &quot;03e294d83b610f89e8ba7b2156a80dc0ad534443&quot;
 
 SRC_URI = &quot;git://github.com/CESNET/libyang.git;branch=master;protocol=https \
            <a class="moz-txt-link-freetext" href="file://0001-test_context-skip-test-case-test_searchdirs.patch">file://0001-test_context-skip-test-case-test_searchdirs.patch</a> \
@@ -31,7 +31,7 @@ do_compile:prepend () {
 }
 
 do_install:append () {
-        oe_multilib_header  libyang/config.h
+        oe_multilib_header  libyang/ly_config.h
 }
 
 do_install_ptest () {
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#115597): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/115597">https://lists.openembedded.org/g/openembedded-devel/message/115597</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/111384199/3616765">https://lists.openembedded.org/mt/111384199/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------3kHAqe7s7mxsQ0MNTlcaN3yu--

