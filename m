Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BDEECD343F
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 02:33:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3330.1778639633976921833
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 19:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=GFJLu6jM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9593c5b8d3=zhe.he@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D1dPDp012295
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 19:33:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=1e700P5vWA2r1/GhYWaucayjegy8r45B3Y1YF+Y8eE8=; b=
	GFJLu6jMk2HNV2clv13KHZXq1wd6MQk4te2Y7F6qn1fF3prVMYcy9Ul8QRgACebA
	D5925nQNLo2zu7ou1juDQHJcgHSibFhKBUk7TArRibfp/CRb1o8nxHmJGGjcNnST
	Gv39MCRYkUqJPQ/n2veY2G6v7B6bRf5wsc6z102So+ETfTP46gDAY4kqdo3Nwgey
	AwvOa4N96QS0u/jH3B2VbwGswMxHSZaoi3FuZKsaN2IWGiXpKEX0uDJoioQ5XyRu
	SWmSt9ejT9bSm9a3mDzgAfqEo3223tbke/a4mioMdrpJhVw3M3aocgzFb+EvMTG9
	JeVQbozZf0PRM48CKrpPiQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012050.outbound.protection.outlook.com [52.101.53.50])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e4ftb81rm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 19:33:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XxjaGGzhqpoow24KTMxYjajGy96HqYz5VRR2b43giiolweZBlltYy6SaCVVZaQAZ5vcOZLUOVtMY2XFu9R11PZQewQG5QFBFdsqCs72otNw+bKdez3QskHO/BgRuuJJ0s2JT3y0Jhnl0bswBaN/c+tgp3bKaGagiB78/U1y5++z3dVFtLN4eggMkcqFWfjwAa7u6E2gbutgMzMYFMWI4EJdZ6RUL5260IOLxql454y/42+2UFT9mnEffXWsJFH6vjkrqUQl2xjTLRk4QPdXIjIXWbuqUwwytt7y6CD9V9tBuhzZa+WURjdhkOeL66o0KypAMiISlLfAJdxT8yEyXiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1e700P5vWA2r1/GhYWaucayjegy8r45B3Y1YF+Y8eE8=;
 b=Gb+nc5yFWBHxg7Nxz67sPkYGwxeBHISWSHIk3vFsL0Wd4KWb9F67jDAEsHcm+W14gxY0hjG8qrFSe5PxC9BvEawFYewoqBCuWVBaEUWbxwQSzLQQAJs5MghcdSMoGy+UM0ho9w2FvcfeB7fYuZrglnqo6Ff2frJ2FKYo+ghiCLgmdnjZ3NOl5aqtLWBbcLJbcuDZhJbKVOr3omwbb1fkJsym2PEAT///UczOJxN1UkHRsrhGXoJr2Ddhciigp0osYvDTL9jEr6ITQiIu2+lEVtzW1TcKQwFf4ytVy4AzIlQkPUYTLgzUNJCisYKPP3qZPy24dVkRizpkGAQxujp6jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2633.namprd11.prod.outlook.com (2603:10b6:5:c0::14) by
 CY8PR11MB6843.namprd11.prod.outlook.com (2603:10b6:930:60::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.23; Wed, 13 May 2026 02:33:48 +0000
Received: from DM6PR11MB2633.namprd11.prod.outlook.com
 ([fe80::7989:d63c:1bdb:60ef]) by DM6PR11MB2633.namprd11.prod.outlook.com
 ([fe80::7989:d63c:1bdb:60ef%6]) with mapi id 15.20.9891.021; Wed, 13 May 2026
 02:33:48 +0000
Message-ID: <fd87a980-6820-48b1-beb6-98bcdf42e645@windriver.com>
Date: Wed, 13 May 2026 10:33:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] bpftool-native: Fix -Wdiscarded-qualifiers errors
 for glibc 2.42+
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20260509030739.1773307-1-zhe.he@windriver.com>
 <CAMKF1sqEqZqnXH-1AjJO8kAow8iRjOPp1DzPYDF04d=cEiVfuQ@mail.gmail.com>
From: He Zhe <zhe.he@windriver.com>
Content-Language: en-US
In-Reply-To: <CAMKF1sqEqZqnXH-1AjJO8kAow8iRjOPp1DzPYDF04d=cEiVfuQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI2PR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:4:197::7) To DM6PR11MB2633.namprd11.prod.outlook.com
 (2603:10b6:5:c0::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2633:EE_|CY8PR11MB6843:EE_
X-MS-Office365-Filtering-Correlation-Id: e496b9bd-9fa9-4e72-8310-08deb0980fa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|4022899009|376014|13003099007|18002099003|22082099003|56012099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info: 
	c/fRZPqLX4Pn9Kxn3NW1U7AOE/rKFnHZhUrFmh9e2QXg1ilfnN9yYBI3fSVxUnP0hWtyMp8wpXn65awfAA5fdZOs25zOEMkuu8YMPttRYZv0l+nXWR/uFByxAVAG8OnW8mV0qKktJChbPH39eajVui8uQEwRK4KM0Fay+jVUnQ7OZDx/1dcyZwQPBsRXUZPriVyRg4l4sa41Lof/Bx+LmfMm7bhBOuAyUiCRv28GSdFJm4FP5UGRkzxfxLN3nMhjFQgZURYUjBrdMTjWn4q/WC6q+CyuCjJRdlKKpXmywCggjZ7GYTbsgimSLqvCgmZYykn3y+mzMtclZknM7iX5wfuUTRyzyqLObg+fo3W61IQ51MzlivTX6hORXF1seCAa9asebbSFxzosaCP7Ia/5y5ME1a09sUJB5vlxPtVDSEP6B2ZBYeMgBtxN4/k7DUznwCCbg/rrF8G0K6BtJRqHyZKLiVU1oh0RwBpmHJiqKIkb96T7pjiuMU44CB/G4QO6vATAbt3RzOcP1NLK21wUHu8pjFC9rkSSkhfTTLP1Eh3jAbOFjrHY7RwqvAsl45fRb1BkgN8FWy1/oILzX8FoBDqQ94NX4OPlv63lLwd/cT+mm0PorKu2jjZASS4NWF0kgcJLI20gguoAG7G+oIdpQg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2633.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(4022899009)(376014)(13003099007)(18002099003)(22082099003)(56012099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M0ZnL0JKczJpeW9HVk9icjdoZWRGbFpVTWF3UzJFdTJHTXppL0FMUUNaT0Uy?=
 =?utf-8?B?bm94WDVvM3pGbVNSNFIwS1BSNHI5K21NYjhHcGxCdkEyc0trOHVENEtFM3U1?=
 =?utf-8?B?allTRk1YZlJpTUhNb1Z1ZzhweGY5Q0k4N1pXNm5HSE1xS00xRXI1QTRqVCtI?=
 =?utf-8?B?U3hPTHdtSGtydmFheVdGc1ZodXgySVZrRENibFNWQ21lSGUyNEk4QVdmb1pV?=
 =?utf-8?B?cllMa2Q2NE9BekQvOXkxZ3VleFBHNGNtY0JMYjJQREhBdUxSOFVoMzlnaTVI?=
 =?utf-8?B?eWJlZUNERG9nQzF1ZjhWRXZpMTdZSWNWc3lYV3dHVGpvVHNXa0ZXZ3BVaFNV?=
 =?utf-8?B?czJ1M3o5S3J4SjROS2tpMHZMeWNkcjFYaWNSTlV2U3RZM0Y5QzFuZ3BtZ3gz?=
 =?utf-8?B?YlhXeHdYV2w2VWwwcmE3TXJkWTBTemxRTFlDanpWYnhSalFyN3RaaktDZVBK?=
 =?utf-8?B?cmxUaVNUVFFCWC9zbDBjcjd1Q01GUXRjeGhwNURackFMQkxxK0JTR2xvc2lV?=
 =?utf-8?B?ekF5Z2svVXVOcGxoOXU2VWlJMTVWTlUvWjhETXM3bFQ0ZFJkZkhjTWFZTkx6?=
 =?utf-8?B?V011ZGM1WDJGSEtPMmE0VDZrSXp0dVJadHh4amVXMTNNamI1ZGlHcmIzdHhZ?=
 =?utf-8?B?UEdQWW8yejRRZnBkZ0UvTVg2ZTdCdVJXdlhkcmJKMVg2NHRqTjlyUk44NXJL?=
 =?utf-8?B?MFBpM3VkZGNybGxNdFZHaWdLL3dpSWNScEJPWExIaWFlc09LMEtjVFhTd3Nx?=
 =?utf-8?B?YnNqK2Vka0d2K0dCd1A0NGVlbGVXTE16aWkyd2lRMFNHMmpNT20zdGhvQnhQ?=
 =?utf-8?B?bmxXY2I4N2tCdjYyU0hyK0tBdk5jMjZ2Lzd3Ry9mclZUMnVTb0lJM1lOMlNz?=
 =?utf-8?B?NFd1NTA3WXloUzNjZWJUU0xXKzk4czFTWTMxYlBTL2xnamc1SmMzbG5MQVBU?=
 =?utf-8?B?bmVxMVNLMm1JTHB3ZGFLR2ZqOVYxSHFEV3U4bXdTSmUwWmJ2bUZyd1AzSEhD?=
 =?utf-8?B?SmVubEp4TTI2cXcvWHByNVVIc1ZHY09mWWZERXFlOVZ0Z0EzNUI2Nkx1Lzhu?=
 =?utf-8?B?VmlEVFdMV3EwQTZyMW5GYllJblhIYXZ2dHB5Q2Mwb0l0STJ3U0FRTHZ0TUdY?=
 =?utf-8?B?VXowaEJkMFNvdlUrZFBCWjkzcWpmcTRIdnFNelo1RmMyaCtKQjNWaDY1elFz?=
 =?utf-8?B?UWo5ak1vL0hCSGNXeWUzN2FNTWhEZVN1NzM1dS9vYU0yU3hOU2RyaldhMURE?=
 =?utf-8?B?djA4R25TUE1YNHZrb25UR3dxa2V2by96TXNEdzhnOFZTSk4ybDFWMmE4VmRu?=
 =?utf-8?B?WTdISGR3U3pyb1V5V0g2UWtaMVE0SWkydHZ0a3h5OGk0SW1PYzFGTUljblN4?=
 =?utf-8?B?MU1hd09kaDlCZmRIeWpaZFdPeGdETGtTdC9DbUdBRWt6NkhZZXc0Uk1VQTJa?=
 =?utf-8?B?Q0h5U2NhWkJNSE90NitPUVhKUXorQWZ5NkFod3BKZHk5L2x3MDJlZmx5Um1B?=
 =?utf-8?B?RmZlSm5zRmlqREU4T3hjdmg0KzY1TzNVbktlczQzWGFWbXpyYmZURVNVYTJI?=
 =?utf-8?B?c2F1SThGMU9jbEVVRi9kSlVBeU53MGlnRHd3Rm5LenBzMHhMN2tKRnR6SjBO?=
 =?utf-8?B?V3VGZmh5dGxnVlFxbWp4RzdnbnRxWXRxMUVjbkswRFZXeUxYZWlSQVVLK0lP?=
 =?utf-8?B?L1JqR1h4bi9IRHM4QWlJM3VkQWxvTG12VC9zSU5EYXlUM3cwU2pvZVhmNWFq?=
 =?utf-8?B?WG5PZVFvTjVNeWtIMXk2Sy9sUHlMV1N2cW5aQlB0MDB0RlR0c09PWTliRDU2?=
 =?utf-8?B?U3dneDJNYmJCOXVWVHRkeUhSenc1Z0cxbU8ycUVuejMyODdYTmoyYmE1a2JU?=
 =?utf-8?B?U1lKbXJxeUp5cTJsWWV4M1U4SUhkeDVXZzR5V1pEeEVUeWh5Q21WRTZQczY0?=
 =?utf-8?B?UW8rclVIYW5STm5SK2U4dWNvbG9UYndlWFpDK2JLdGpRUlB4Sk1lNy9LYlBn?=
 =?utf-8?B?RnZOb1RiRWpQWXUwSmFwMnIyYWRsWm9lTmQwYjcwYUZYWWdyc3hHaGtPbzhj?=
 =?utf-8?B?TlRRNlMydnFYQ3pPcXdXUmlyTWZiN3lvcGk3UVY0NS9qOXZHRXFSR08zRVhF?=
 =?utf-8?B?R0lCQU1jK0xjUGJidDhTTUFtalcwRTBCVWxNb1dVRnYxcE5hZHpoNXV1bXVS?=
 =?utf-8?B?YitITytXTjJyekxvQkhSbWtQSG5BUm8yTG1FQ1U2RCtFS2dXalhzZlpXUmdt?=
 =?utf-8?B?L3psTW1MWTlCS2U0Z0hYNFBReWZiM0VUNXUrMVZHeHNVOHNCVzlKajBaMi9l?=
 =?utf-8?B?aGpqbUVOaWMwdTdyV3pjTEM5WFlCSGJsamdjTnJHV3czNTJ5Y0Y1Zz09?=
X-Exchange-RoutingPolicyChecked: 
	wdiGOU81qcZkSiMiTRZuwJj2w0IRiHFo1Q2i8qhLVa5XFbfXojvUIaKHCfNU1zvi209iPCq8b7HR7s0RJ90Smy4BC7kBGFmbT4lawTGsu+EGNDCK157Jd/cumI40tALSGfKivDE3ZtQ8elMfpZZFOgM24Sho12aWi5mM3n54Lx6snlXcm6SG0Ir0dz1uNhMzcuwgXU8rmjTpCV8fNuRLR9Wkavp1A9oJqTuKt49WGX8yiT4zJlg/5k/mbftrwBOiFfpeT7z3ioljMfyK1N7Ei8Gw3rpnlV04UJf1n3JigvEgRRd5CT2TU2qC5cqGTNX2hm0ukh1uUwm5+9DXuzoz4A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e496b9bd-9fa9-4e72-8310-08deb0980fa5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 02:33:48.0117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 248Yv/43ICTBfDtaKCBziF5sYZ8hViXVqn6Be9UbQFimC4Pp5GoDJx9C/gZj9is2BUiFpPxWwrBH6p64mE+oIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6843
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDAyMyBTYWx0ZWRfX7NzrUmG//6Xh
 22SkOTkt3EtvDdhGgYS1RGzu/vgjLWUKjEEX8h7lW+ex+QChDtdsWMvCUivblo2P9/19Wir/hBv
 OXgueiWS2dkIkom5/YvMQAUjO8etsieGpGoQe6051CJg8fWtq4Iu7o2NDq0r8MKBg4bd7k/Zvrz
 28Js1GfnHEO7t/gi4kbG3CCgoowu0N6ZxqP8DG6ElmcurrAfgmmNQJP7JbrwHkLiuqJTfoD5P/b
 DxsPZhuYxLDgAIpnt3P3qEKIgw0tbBhosAsdrdZpK8UjMjzOyt+X5l4POuvrkEmCXzD7f75QNDv
 RPoBMRPAR4Lot/h5UtOsRZDbd3QbOg/wgPpek81kfIZRxJspRimVgkeg8lfTVL2ImvQY4GpVo/f
 AIu1UaMx9JbAzaIMtKK8N0+UrzjQMm2aUKY4TIb2IwiBlH6UDX/GQZHaj43Hhb0+PkhttiK+wua
 Du2CTDOmc5MWZguPxFw==
X-Proofpoint-GUID: hfns9sSIHuVr09nte1XBYYqbk0_MFgcz
X-Authority-Analysis: v=2.4 cv=du/rzVg4 c=1 sm=1 tr=0 ts=6a03e311 cx=c_pps
 a=Jpon84a9jUr9T0N/wBB0/Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=Q4-j1AaZAAAA:8 a=Y0B9y4s9AAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=iox4zFpeAAAA:8 a=ag1SF4gXAAAA:8
 a=4Iq_fUT2fqFpDV0IZVkA:9 a=lqcHg5cX4UMA:10 a=PRpDppDLrCsA:10
 a=O9Trw71uoXUA:10 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=DTxklB4FdWIe4mmVXPWM:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=WzC6qhA0u3u7Ye7llzcV:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: 0ojcSi3lY6UOwDoa_6t5snaYhPdIyfYe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130023
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64D1dPDp012295
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 02:33:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126878



On 5/12/26 23:33, Khem Raj wrote:
>
>
> On Fri, May 8, 2026 at 8:08=E2=80=AFPM He Zhe via lists.openembedded.or=
g <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!fyU-8plaF3gPF7YmHPCen6iKCIBIZoQ_R9_L9KoFZOc_83Rybpe8c1G0dpdd_F-YLMUE8=
KAesPAVTLMn$> <zhe.he=3Dwindriver.com@lists.openembedded.org> wrote:
>
>     Backport a patch from kernel to fix the following build errors.
>
>     bbpf.c: In function =E2=80=98kallsyms_cb=E2=80=99:
>     | libbpf.c:8192:13: error: assignment discards =E2=80=98const=E2=80=
=99 qualifier from pointer target type [-Werror=3Ddiscarded-qualifiers]
>     |=C2=A0 8192 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D strstr(sym_=
name, ".llvm.");
>     |=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^
>     | libbpf.c: In function =E2=80=98avail_kallsyms_cb=E2=80=99:
>     | libbpf.c:11497:31: error: assignment discards =E2=80=98const=E2=80=
=99 qualifier from pointer target type [-Werror=3Ddiscarded-qualifiers]
>     | 11497 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if (!(sym_sfx =3D strstr(sym_name, ".llvm.")))
>     |=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
^
>     | libbpf.c: In function =E2=80=98resolve_full_path=E2=80=99:
>     | libbpf.c:12085:35: error: assignment discards =E2=80=98const=E2=80=
=99 qualifier from pointer target type [-Werror=3Ddiscarded-qualifiers]
>     | 12085 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0next_path =3D strchr(s, ':');
>     |=C2=A0 =C2=A0 =C2=A0 =C2=A0|
>
>     Signed-off-by: He Zhe <zhe.he@windriver.com>
>     ---
>     =C2=A0.../bpftool/bpftool-native_6.16.bb <https://urldefense.com/v3=
/__http://bpftool-native_6.16.bb__;!!AjveYdw8EvQ!fyU-8plaF3gPF7YmHPCen6iK=
CIBIZoQ_R9_L9KoFZOc_83Rybpe8c1G0dpdd_F-YLMUE8KAesB2Q-Gdp$>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 +-
>     =C2=A0...-Fix-Wdiscarded-qualifiers-under-C23.patch | 69 ++++++++++=
+++++++++
>     =C2=A02 files changed, 73 insertions(+), 1 deletion(-)
>     =C2=A0create mode 100644 meta-oe/recipes-kernel/bpftool/bpftool/000=
1-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch
>
>     diff --git a/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb =
<https://urldefense.com/v3/__http://bpftool-native_6.16.bb__;!!AjveYdw8Ev=
Q!fyU-8plaF3gPF7YmHPCen6iKCIBIZoQ_R9_L9KoFZOc_83Rybpe8c1G0dpdd_F-YLMUE8KA=
esB2Q-Gdp$> b/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb <http=
s://urldefense.com/v3/__http://bpftool-native_6.16.bb__;!!AjveYdw8EvQ!fyU=
-8plaF3gPF7YmHPCen6iKCIBIZoQ_R9_L9KoFZOc_83Rybpe8c1G0dpdd_F-YLMUE8KAesB2Q=
-Gdp$>
>     index fe3ad6138e..edc635517a 100644
>     --- a/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb <https:=
//urldefense.com/v3/__http://bpftool-native_6.16.bb__;!!AjveYdw8EvQ!fyU-8=
plaF3gPF7YmHPCen6iKCIBIZoQ_R9_L9KoFZOc_83Rybpe8c1G0dpdd_F-YLMUE8KAesB2Q-G=
dp$>
>     +++ b/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb <https:=
//urldefense.com/v3/__http://bpftool-native_6.16.bb__;!!AjveYdw8EvQ!fyU-8=
plaF3gPF7YmHPCen6iKCIBIZoQ_R9_L9KoFZOc_83Rybpe8c1G0dpdd_F-YLMUE8KAesB2Q-G=
dp$>
>     @@ -9,7 +9,10 @@ DEPENDS =3D "binutils-native elfutils-native"
>
>     =C2=A0inherit native bash-completion
>
>     -SRC_URI =3D "${KERNELORG_MIRROR}/linux/kernel/v6.x/linux-${PV}.tar=
.xz"
>     +SRC_URI =3D "\
>     +=C2=A0 =C2=A0 ${KERNELORG_MIRROR}/linux/kernel/v6.x/linux-${PV}.ta=
r.xz \
>     +=C2=A0 =C2=A0 file://0001-libbpf-Fix-Wdiscarded-qualifiers-under-C=
23.patch \
>     +"
>     =C2=A0SRC_URI[sha256sum] =3D "1a4be2fe6b5246aa4ac8987a8a4af34c42a8d=
d7d08b46ab48516bcc1befbcd83"
>
>     =C2=A0S =3D "${UNPACKDIR}/linux-${PV}"
>     diff --git a/meta-oe/recipes-kernel/bpftool/bpftool/0001-libbpf-Fix=
-Wdiscarded-qualifiers-under-C23.patch b/meta-oe/recipes-kernel/bpftool/b=
pftool/0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch
>     new file mode 100644
>     index 0000000000..76b9aabb54
>     --- /dev/null
>     +++ b/meta-oe/recipes-kernel/bpftool/bpftool/0001-libbpf-Fix-Wdisca=
rded-qualifiers-under-C23.patch
>     @@ -0,0 +1,69 @@
>     +From ab21cf885fb2af179c44d8beeabd716133b9385d Mon Sep 17 00:00:00 =
2001
>     +From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
>     +Date: Sat, 6 Dec 2025 14:28:25 +0500
>     +Subject: [PATCH] libbpf: Fix -Wdiscarded-qualifiers under C23
>     +MIME-Version: 1.0
>     +Content-Type: text/plain; charset=3DUTF-8
>     +Content-Transfer-Encoding: 8bit
>     +
>     +commit d70f79fef65810faf64dbae1f3a1b5623cdb2345 upstream.
>     +
>     +glibc =E2=89=A5 2.42 (GCC 15) defaults to -std=3Dgnu23, which prom=
otes
>     +-Wdiscarded-qualifiers to an error.
>     +
>     +In C23, strstr() and strchr() return "const char *".
>     +
>     +Change variable types to const char * where the pointers are never
>     +modified (res, sym_sfx, next_path).
>     +
>     +Suggested-by: Florian Weimer <fweimer@redhat.com>
>     +Suggested-by: Andrii Nakryiko <andrii@kernel.org>
>     +Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
>     +Link: https://lore.kernel.org/r/20251206092825.1471385-1-mikhail.v=
.gavrilov@gmail.com <https://urldefense.com/v3/__https://lore.kernel.org/=
r/20251206092825.1471385-1-mikhail.v.gavrilov@gmail.com__;!!AjveYdw8EvQ!f=
yU-8plaF3gPF7YmHPCen6iKCIBIZoQ_R9_L9KoFZOc_83Rybpe8c1G0dpdd_F-YLMUE8KAesJ=
itfz3F$>
>     +Signed-off-by: Alexei Starovoitov <ast@kernel.org>
>     +[ shung-hsi.yu: needed to fix kernel build failure due to libbpf s=
ince glibc
>     +=C2=A0 2.43+ (which adds 'const' qualifier to strstr) ]
>     +Signed-off-by: Shung-Hsi Yu <shung-hsi.yu@suse.com>
>     +Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>     +
>     +Upstream-Status: Backport[https://git.kernel.org/pub/scm/linux/ker=
nel/git/stable/linux.git/commit/?h=3Dlinux-6.18.y&id=3Dab21cf885fb2af179c=
44d8beeabd716133b9385d <https://urldefense.com/v3/__https://git.kernel.or=
g/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=3Dlinux-6.18.y&id=3D=
ab21cf885fb2af179c44d8beeabd716133b9385d__;!!AjveYdw8EvQ!fyU-8plaF3gPF7Ym=
HPCen6iKCIBIZoQ_R9_L9KoFZOc_83Rybpe8c1G0dpdd_F-YLMUE8KAesMcSqBdC$>]
>
>
> This seems to be malformed ( add a space after 'Backport' )=C2=A0

v2 sent. Thanks.

Zhe

> =C2=A0
>
>     +Signed-off-by: He Zhe <zhe.he@windriver.com>
>     +---
>     + tools/lib/bpf/libbpf.c | 7 ++++---
>     + 1 file changed, 4 insertions(+), 3 deletions(-)
>     +
>     +diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
>     +index dd3b2f57082d..9c98c6adb6d0 100644
>     +--- a/tools/lib/bpf/libbpf.c
>     ++++ b/tools/lib/bpf/libbpf.c
>     +@@ -8245,7 +8245,7 @@ static int kallsyms_cb(unsigned long long sy=
m_addr, char sym_type,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct bpf_object *obj =3D ctx;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct btf_type *t;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct extern_desc *ext;
>     +-=C2=A0 =C2=A0 =C2=A0 char *res;
>     ++=C2=A0 =C2=A0 =C2=A0 const char *res;
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D strstr(sym_name, ".llvm.");
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (sym_type =3D=3D 'd' && res)
>     +@@ -11574,7 +11574,8 @@ static int avail_kallsyms_cb(unsigned long=
 long sym_addr, char sym_type,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=
=A0[0] fb6a421fb615 ("kallsyms: Match symbols exactly with CONFIG_LTO_CLA=
NG")
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char sym_trim[25=
6], *psym_trim =3D sym_trim, *sym_sfx;
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char sym_trim[25=
6], *psym_trim =3D sym_trim;
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *sym_=
sfx;
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(sym_s=
fx =3D strstr(sym_name, ".llvm.")))
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0return 0;
>     +@@ -12159,7 +12160,7 @@ static int resolve_full_path(const char *f=
ile, char *result, size_t result_sz)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!search=
_paths[i])
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0continue;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (s =3D =
search_paths[i]; s !=3D NULL; s =3D strchr(s, ':')) {
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 char *next_path;
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 const char *next_path;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0int seg_len;
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if (s[0] =3D=3D ':')
>     +--
>     +2.34.1
>     +
>     --=20
>     2.34.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#126828): https://lists.openembedded.org/g/opene=
mbedded-devel/message/126828 <https://urldefense.com/v3/__https://lists.o=
penembedded.org/g/openembedded-devel/message/126828__;!!AjveYdw8EvQ!fyU-8=
plaF3gPF7YmHPCen6iKCIBIZoQ_R9_L9KoFZOc_83Rybpe8c1G0dpdd_F-YLMUE8KAesIzpku=
_A$>
>     Mute This Topic: https://lists.openembedded.org/mt/119225487/199791=
4 <https://urldefense.com/v3/__https://lists.openembedded.org/mt/11922548=
7/1997914__;!!AjveYdw8EvQ!fyU-8plaF3gPF7YmHPCen6iKCIBIZoQ_R9_L9KoFZOc_83R=
ybpe8c1G0dpdd_F-YLMUE8KAesFRJ0bCG$>
>     Group Owner: openembedded-devel+owner@lists.openembedded.org <mailt=
o:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/un=
sub <https://urldefense.com/v3/__https://lists.openembedded.org/g/openemb=
edded-devel/unsub__;!!AjveYdw8EvQ!fyU-8plaF3gPF7YmHPCen6iKCIBIZoQ_R9_L9Ko=
FZOc_83Rybpe8c1G0dpdd_F-YLMUE8KAesESnBmdy$> [raj.khem@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


