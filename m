Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3FE6CCD1B9
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 03:11:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.342.1761102682265569078
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 20:11:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=fuSx4ToH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2390edad6f=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59M2lFS01535927
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 03:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=0w/MihxaNGXj+YABqnmo5+wJFwDcYG5PH13gmvwyIu4=; b=
	fuSx4ToH0jyPsOyDoHwsRYWdtDrY8FL961OVln9RnHnSO1LKjOXN2PcI5+DfClzL
	N7jBFju0BFB6io+bX/MU7tAoLGvxhm/g8Uia2sluDunAZ6DN1S3boYK74VRaJE+Z
	pmvOZ2I+mVSHBQAuKJHvVdZ03t60l0HCJD5c9P1nN6TEGIK2J+YpjN9aqdQ5wvgp
	Faj9pVVel+wyEWX/tmoW4Te2CS1V04aHk8h5KaZwlOkPUJRBiIMeNOhKXdbw/IX0
	mO7dsxPwsH0ytJPzHgcv/1lQ3lZlk8ot+98GREK1VuMBozeg1mHAgZ1DsAhBGwho
	lSL5EmbYT6OThhwzlU2nSA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012065.outbound.protection.outlook.com [52.101.48.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49v1v5c444-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Oct 2025 03:11:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PaPqdZoi8/1BlhmIQpuYmiFO4ONy3scjsej6rEHZIBYI8ZDRG3QyYc191A2qHcgGc5dLmQGEB91Kx8gNgtb1d5OvI5AgpiGPaERRi7oPHr9HRPm4CoMETE/1FF+THHoK7GxS/NaeWMlsitcFGUS6koWllvk+Fj2LqU9V+dYhXKZtY0gfhh6h+A0YDvltmckW6OH2NCfORSyCLQFBXMWtpVCJgAHlRdB7acQwub1evDj/DokTY7giPZuQx9qB+qXf8X8djfbAHH9THhEIgz7eNOSuecnp9hpbXF/vYK1xRiHmLKAe/9SpVA1KRFvSXWtafUfsNGiolKELV4C6GYXOTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0w/MihxaNGXj+YABqnmo5+wJFwDcYG5PH13gmvwyIu4=;
 b=xu0ilWYtyBJXwNJVaEGr6SWfyySPYUF7f9DBrb2UKef9wvDl0ne3xNUDkvQDD3FAStXvW/WgamYN8lkwrjwiFDrN7IzDyGUXXwz9kjQuaNh+xPsb1ZlgUQ9b40T6YiLtRtnoBFS/BYurkUPjbNnF5iNTTxAvKOAQNcUQSARTUedYN3kK/HAWz1pgCnI/prbbjL9EYyxA/DrFAHiGh8ccXfuu0t/E70x8yJX0ouGvp1H2JR1/4Zj52hHKpUqM5iFyZMYljYiIR6Tu9VHfCYqnV5S7DVPciwZ6IMJebSHfg0grnewhiklv+R0BVxE2cV85bng95aBRG3/XqcioJAau3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by IA4PR11MB9156.namprd11.prod.outlook.com (2603:10b6:208:562::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 03:11:18 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%4]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 03:11:18 +0000
Message-ID: <7f257312-3a64-4262-a211-6bf081bf9139@windriver.com>
Date: Wed, 22 Oct 2025 11:11:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v3] poppler: fix racing build issue
To: Khem Raj <raj.khem@gmail.com>
Cc: hongxu.jia@eng.windriver.com, openembedded-devel@lists.openembedded.org
References: <1870AFA4856349AB.25855@lists.openembedded.org>
 <20251022025948.3520973-1-hongxu.jia@windriver.com>
 <CAMKF1sqpMDSt8J6MuzRGWKAQjZcHMSxqJ3sxqzztYpwkahfTfg@mail.gmail.com>
 <dedb4143-6db4-488b-bd91-07afa291e078@windriver.com>
 <CAMKF1so7kzbn2zNhjrkaY-7n+ctT86VzBJutvm=vHr6msqEr7w@mail.gmail.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <CAMKF1so7kzbn2zNhjrkaY-7n+ctT86VzBJutvm=vHr6msqEr7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2P153CA0006.APCP153.PROD.OUTLOOK.COM (2603:1096::16) To
 PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|IA4PR11MB9156:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d96167c-5797-4bdb-862b-08de1118aad0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|4022899009|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OUdqdVFIa2NPUXVOVnJHKzZyUmd4SHdMa2JVOHlxTmd4SnMxWG1UaUJaZTN0?=
 =?utf-8?B?SDlkNWNsVEREaEUzNGFLSGdwQTdTWmZ5d2xLTTRNMUhBd3ZNemNHQVY2R3I0?=
 =?utf-8?B?Q3RYQTA2VUhhMmlxaHlOdlNFMkR4VGJLTHQ4RXFtUml6eHdObGw0Uk5zTG9F?=
 =?utf-8?B?OGl5UUdqZ3RQRE12eEh3T0VOMjRGeHM5elR5Z3pCNnNubFIyNXlncTVUdW5W?=
 =?utf-8?B?RDdKakE2SlhWUDZSdGpDMlRMVEpMZ3hpRGVFWGRqaVhGNWwraUpRQTdSeGh6?=
 =?utf-8?B?bjdTSWEyWUVWTW9TUTV3QjdZK0U2Yys3Y3c3a1paM1BKa3daMStxU1N5UTM1?=
 =?utf-8?B?WUhIeTZyK1FNaEFqUWZPeUN3dXN2aFFLUndDVnJ4M1hkYzNoZWloR2NMNUxW?=
 =?utf-8?B?VEtKOTRyc2JZSEZlTW1LV1pTdzdZOUNXQTFKak9IZEhXNkxpY0dtd2JuZThQ?=
 =?utf-8?B?Q1UyaW5jai9QeDBqK01ndkg2SkhtTVRYYlpraEVsditWYTZOMWlZTkZNQTlz?=
 =?utf-8?B?d0dTUmlzSlFOQS9QYUJ4bUtXY3JxTVNkRzFSL3l5b0t3emVBaXJPYXE1Yy84?=
 =?utf-8?B?VkVHa2dvVlNuVkx3OGRJc1ZQUGM3QlBkNWo4UGl2Wk96RVFTRFltRXpuNmYw?=
 =?utf-8?B?SDBkZEdyM2JDL3c1WSszajY3ZFpOUGxLbmhaWkZLT0k0MjRWZEdubnR3VHB1?=
 =?utf-8?B?R2FzV1hxeXdORU5TeVVxWExLOTlrRGFYQm1sRXlWekZ1UmtHTWIvU2hBbzB1?=
 =?utf-8?B?cmJQR3ZiV2NkcDhqeUN3Ukl0SFpaUUtvd1pDWDVkNjJwbFVGZVJobjVMWTN3?=
 =?utf-8?B?NzJwUXFnektObGMyYmVHSnVNdkN1RURXaWd5NmR0UGc5MlZRdFo3UkJVanp0?=
 =?utf-8?B?aHhnaGJlOG1zTkhyU3FsMHROOU1yK1hlWFZCQjV3aXF4QzZJb3RGODZRSzVo?=
 =?utf-8?B?dFFXb0tYZ3Bla1pyTk91anVFQWJ3SkxjZnFmQUdtV2NvZ0xvRldsTXZNR1I3?=
 =?utf-8?B?RE5yOFBxeU5kRzl4ZU5BNFRDZFpUNE9QUk41MTU3SjI4cUpGRHNTdjIrRnFi?=
 =?utf-8?B?dWFkR2tzQmlReWpmazJDREpod25QL0xzUkxuTFRKcnRyOUc0emNnV0tKaHJM?=
 =?utf-8?B?S3lkM2orU25NWUZNOHg4WlpsYnc1YUVITjM2OXlFMDF5dzk4dk41L2NqVzJB?=
 =?utf-8?B?dEw1Tkl5alM5a3NkT3VES2U5eUpEL01jclZhTmRUK0JVRFJsUjlTeGZUTnJG?=
 =?utf-8?B?Uloxemh5dnpYSVcycURhTkU3dlBYdFZQanhFTzN2SXhPbzhmWWg3dXovZkp6?=
 =?utf-8?B?SEFZVFo3U2U0ZndQN3crVmFoNHpGcnpkQVR4TTlCc2VvU3BJVDJBNVFrYk00?=
 =?utf-8?B?eDhxMkdONitldzJBZmpBeUVEaHBqYUg4RzlsRGJZaGhEZHpaV1BNYmtPMjJv?=
 =?utf-8?B?eGFLUWxFbXhPQnQwdEtoa0FEN3pwVTBkbXV5Mlp3NmtPYnFvbC9USG0rMS9l?=
 =?utf-8?B?a21XVmtwUGJwcjZvaE9rRVU5NjBVU0I1RWYyL3V3K0t5UFRra3JsRmtxdnNT?=
 =?utf-8?B?Y2VJNnQzZlBieWZ3SzJIUVhjN0xTU1VRV1g4clFqUjY2SkpCemFkK1NLOUdh?=
 =?utf-8?B?cXZQT2RjVU1CNWRsT0p0UEZJNXZoS1FMSDNlb3RqM09zYTNRTGVqVHZINnR3?=
 =?utf-8?B?b2x1NW1xaExoRWY2TVV2dW5JaE50endIZGluRmxtbWUxd2hwSlNLLzY3cjRO?=
 =?utf-8?B?MjA2bHlhK1hkNXpLaW1WNE8wbHk0WXVDekJkbWpvR3hhTmpnVzRPWjUyazdT?=
 =?utf-8?B?eU0rc292TW9oZml4Zkg3MU5iZDB0THQ0S2tCcXV1THhQdWhrcE9za3hDSlZX?=
 =?utf-8?B?aThyRXplaHZSV1o4aW8wenJvdVh3VmUzRVNIQTE3SmY5OWc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZUhrREx2Q25YSlA3eTZCUGc2bnluRWIzaWszSGlMQVNURnAxZG02MmV3VGdn?=
 =?utf-8?B?T2UzbTRmK0ovelpxZkZrMmlKZU9rWWwyaHhWSXo2YzkvMldRZEYyc1dmME9p?=
 =?utf-8?B?MzhqUi9UYVpvQXlEalNValRhQkVBd2pYRGFNY2lHU2Vza1cxOVB2V2cydXNK?=
 =?utf-8?B?N1JpZ1UvOGtNUTZuWjZ4Zmp3K09xZFEzNElnY1hhTDlEZVFUU3M2akQ2WWpV?=
 =?utf-8?B?cFBPOU9XRERNeUxMamtTNXMyc0tvdXNXUFFJS1VnTGdna05aekFzak5xNW5a?=
 =?utf-8?B?N0RuL3l1UFF3bVozSnE1YjA4enFCWHdwbVl6cUZYdnBtNnZqRGxjSGFvNTA1?=
 =?utf-8?B?ME1aNmJiL3hTSmpxckxvWmx1aHRucmRKUmZqSEhjdTM0UFFkU1BidUdCNU15?=
 =?utf-8?B?ck1YQUlGbDZTNzhIb01LUWEvdVpPc1M4c3Q3aFNjVi83cEU5SDZ5SHVETTNy?=
 =?utf-8?B?RGVUSXBmcnRpMVA5aThOcXpYRzNJeFlKVjVwdFJ5VFQ1SzZYZkVqYzhoKzBq?=
 =?utf-8?B?SFlJa1VhY3NDNXNBM29xTUxVT1BoQktrbnRUYUhjand5bmVjcGZUcmordFNz?=
 =?utf-8?B?bXVRWjJTNDJBaU5UZHlIV1YrQVV2eDNPUTJFY3kwT2hPYjdXMUZuNktPc3B4?=
 =?utf-8?B?bXgzdTRXS2Vrck5Ha0htcWhnZC8yK1huVTM0bk0vS1h6R3ZWMUdRemRZWDVs?=
 =?utf-8?B?cTFXckdLdXpXb3gxcDRRTXpwSC9NQlRqaU9PZTNDRmgwVU5paEczQzVQenNq?=
 =?utf-8?B?WS9XOXEwb1R0UTFRd0xuWWhickVCQ1RHMUE0Q0Rta0J2RnMrcFlZUzE5clM0?=
 =?utf-8?B?SEIyUm9CRnNvT0RuOWdkWHhud3ZqUVpaU1JQallFTFNzcm84T3dQWkF2czNK?=
 =?utf-8?B?aDlzcEh6UkZ3ZDdTUFJ0R3Exd1plRERaLzJhcDhRYWRNNGkyRXZjZG44N2Fz?=
 =?utf-8?B?YlBCK01PM3N5NjBSMTdVZ3JzeWRWWkxFT1BLTXhqbWxJWkFCZkVmSXlLM3NX?=
 =?utf-8?B?OTdiRGM2TzNBZzRVSnExNzBXc3RheVZmQ01UU0hEd2crTzU2aDdKekhsRy9F?=
 =?utf-8?B?WXI4RzFsSlNaN2E5aFo2Y05zR01qLzBkOHExZHBIeVhSanovSCt0WlpYMmxC?=
 =?utf-8?B?aS8wUXpsbitGZjRXSFFscGV4cVdPTjRJSGdBODdnVGE2TEtISDZDK1pPOHhC?=
 =?utf-8?B?WTNsdXM1NmVSeXVkNDN2YXFFdHlYZ0p4OUNERkc3Mzk1Wm51a3NJK0Q0NDVH?=
 =?utf-8?B?YmFhSlgvS3lodldWU2VCNFRJTjMwc2dqSzhQMG1PR3grN0Z6blZRcVkxOVV1?=
 =?utf-8?B?YVk0MTEvdHdXdlh5ZEpTOXprU2FMTkwrWW1kYzhKM0hCY3lXVkNPRzlHT01w?=
 =?utf-8?B?QUVtdTFDV05Fck5RVU1udkpnWDRraFV3QWJnUnhra1VmUXFXaFd5QXJ2UW45?=
 =?utf-8?B?UUU5OVhIb3pwVnBFay9aeHNVeW15ZWRpaGpJVFphNWNPcHd6Q2lxWWJqOUZm?=
 =?utf-8?B?NHI0SEZsU285TU03a1BPdzNOOHUwbGplUXlTWmJHZDM4UW0vN21Gd29hZ3ZZ?=
 =?utf-8?B?TjAyaWhTUTN1dXV6T1UxTUlINTZPWlVmQ1VVRnkvMy9zUS9nOGVIUmVCVHRU?=
 =?utf-8?B?TC9WT3BpM01NMFJhN0Y4ZWJ0cTVWRFBhZ2dHTUs4YkRtZlJTZnVBMmxadDJw?=
 =?utf-8?B?clJHUktkSkpKZnpZclpic1lzVUJ2ZzRUTkVGdWRtMDRlTmV6UlpOVzRXOTRU?=
 =?utf-8?B?WG4wd1FBQXZiQ1hFZnJYdUh5WTdiV1V0S01UNzBZd090cE1jN1hKM3VlcW9L?=
 =?utf-8?B?d284MCtjUzNaaDU5OHJBRi9VQ2dKRzljbVVweTlXTmIzQkM4ZWluZzg1WEla?=
 =?utf-8?B?OVNUK1N2dFJSVHBWZHFZemcrUHJJVFNTSTFzWlMvU3k2OTFsUjdIam5nQkZI?=
 =?utf-8?B?aDBmc2R5RGJiMGVSeXFkWHZrUTY4d2wwS2txVEc5Vm5aVjZ2cWk1TVJaSnUw?=
 =?utf-8?B?RE1DaTRIQ09UU0laSS9XL2ltSVpSMHFMeCtydHUrZHVsZy80M3lJZU9CN3dG?=
 =?utf-8?B?Q3BPNkt0QzFXVHg1Wm52U2JDSTJWYitDSmRwQVpOUElNenFZWXh5RE9JcnlZ?=
 =?utf-8?B?MGhqcjFRNndTdEpZRjAwOURuMDlwanllaVpGME1YSmExWGJDcmVFZS91OUlB?=
 =?utf-8?B?aHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d96167c-5797-4bdb-862b-08de1118aad0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 03:11:17.9461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z6C9x974xWIZVtAaj9ajMJSusdbdVA8e1muIKRxG4g/X2dcIiYqz8ZT8h1q29/up0XaFi1rrQxSBfV8Exi9QGpGtMjYcAbk+NuBU02s00aM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9156
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDAyMyBTYWx0ZWRfX+jF2qSi11S0P
 BIierhpIBLPO2kRWfB2936pi6ZtHqe1RW+qz/5z+0/VxFJKF7Mt/gznihxesg7oWz16oxTcun55
 tTru1BgbY6x6qzIkpkAURkh19g/ibMFkkqgypiHYsyuDRahcftOnLnhktJcxUTtIo+MX9i3UVgk
 lWT9ptdoSZpajxXHphyFKlg4AGLh4p95ZYkv0f0FDf/lvEOl9qSguHuKgyRBXlruIzrszK0W3A5
 fjQvIvXfUBpyLhIzdCPuCr1/gglQOc/PEul4hwZLwDLZ8FPMsunWL1cE5F55an5HOiYZvQVaalG
 EM8GsDaxASew6C047xVjqTunj1aKdbuO7VqEkrgzXN9e1ExqlCe0xkcLh25+cC+C1Glpp8EuT2A
 2uWfhTM4IdVyfXNXRhVu64tZYiigTA==
X-Proofpoint-GUID: QQR23eYvdaCfHwLSvodhSY4y4Dsgk9tz
X-Proofpoint-ORIG-GUID: eWiJqjC3Zwyh-hP_GZ-SAqCRsfvpZlvE
X-Authority-Analysis: v=2.4 cv=ANdmIO46 c=1 sm=1 tr=0 ts=68f84b59 cx=c_pps
 a=W8nThqPTbj8xD7CpgneC0w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=Tit_AaRdPUHdV2BWBkQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Vxmtnl_E_bksehYqCbjh:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510220023
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 59M2lFS01535927
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 03:11:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120882

On 10/22/25 11:07, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Tue, Oct 21, 2025 at 8:05=E2=80=AFPM Hongxu Jia <hongxu.jia@windrive=
r.com> wrote:
>> On 10/22/25 11:02, Khem Raj wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
>>>
>>> what changed in v2 and then v3 ? and it does not seem to be rebased o=
n
>>> master branch, it helps if the changes between
>>> versions are clearly documented and feedback is addressed.
>> The upstream defect number differs in comments between v2 and v3
>>
>> https://gitlab.freedesktop.org/poppler/poppler/-/issues/1550 in v2
>>
>>
>> https://gitlab.freedesktop.org/poppler/poppler/-/issues/1551 in v3
>>
>> V3 is the actual number
> Feedback on v1 is not yet addressed
> https://lists.openembedded.org/g/openembedded-devel/message/120839?p=3D=
%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C%2Cpoppler%2C20%2C2%2C0%2C11587067=
5
>
> Have you even tested this patch on the master branch ?

Oh, sorry, I missed it in my mailing list, I am working on it

//Hongxu

>>
>> //Hongxu
>>
>>> On Tue, Oct 21, 2025 at 7:59=E2=80=AFPM hongxu via lists.openembedded=
.org
>>> <hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
>>>> There is a racing issue in world build while multilib enabled:
>>>>
>>>> ...log.do_install...
>>>> CMake Error at utils/po/ca/cmake_install.cmake:46 (file):
>>>>     file INSTALL cannot find
>>>>     "TOPDIR/tmp/work/core2-32-wrs-linux/poppler/25.08.0/build/utils/=
po/ca/pdfsig.gmo":
>>>>     No such file or directory.
>>>> Call Stack (most recent call first):
>>>>     utils/po/cmake_install.cmake:47 (include)
>>>>     utils/cmake_install.cmake:243 (include)
>>>>     cmake_install.cmake:229 (include)
>>>> ...log.do_install...
>>>>
>>>> The issue has reported to upstream [1] and upstream tried to fix it =
[2],
>>>> but the issue still existed. The catalan translation of pdfsig is no=
t
>>>> vital for poppler. So revert upstream commit "pdfsig: Catalan transl=
ation"
>>>> to workaround
>>>>
>>>> [1] https://gitlab.freedesktop.org/poppler/poppler/-/issues/1551
>>>> [2] https://gitlab.freedesktop.org/poppler/poppler/-/commit/053acd5d=
2b310c696993dc97072d1f2b3b1dd7ac
>>>>
>>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>>> ---
>>>>    .../0001-workaround-build-racing.patch        | 43 ++++++++++++++=
+++++
>>>>    .../poppler/poppler_25.08.0.bb                |  1 +
>>>>    2 files changed, 44 insertions(+)
>>>>    create mode 100644 meta-oe/recipes-support/poppler/poppler/0001-w=
orkaround-build-racing.patch
>>>>
>>>> diff --git a/meta-oe/recipes-support/poppler/poppler/0001-workaround=
-build-racing.patch b/meta-oe/recipes-support/poppler/poppler/0001-workar=
ound-build-racing.patch
>>>> new file mode 100644
>>>> index 0000000000..fdf4f7ff70
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-support/poppler/poppler/0001-workaround-build-=
racing.patch
>>>> @@ -0,0 +1,43 @@
>>>> +From 83ad73024c69d41fda302f39acf50c381684890e Mon Sep 17 00:00:00 2=
001
>>>> +From: Hongxu Jia <hongxu.jia@windriver.com>
>>>> +Date: Tue, 21 Oct 2025 02:39:36 -0700
>>>> +Subject: [PATCH] workaround build racing
>>>> +
>>>> +There is a racing issue in world build while multilib enabled:
>>>> +
>>>> +...log.do_install...
>>>> +CMake Error at utils/po/ca/cmake_install.cmake:46 (file):
>>>> +  file INSTALL cannot find
>>>> +  "TOPDIR/tmp/work/core2-32-wrs-linux/poppler/25.08.0/build/utils/p=
o/ca/pdfsig.gmo":
>>>> +  No such file or directory.
>>>> +Call Stack (most recent call first):
>>>> +  utils/po/cmake_install.cmake:47 (include)
>>>> +  utils/cmake_install.cmake:243 (include)
>>>> +  cmake_install.cmake:229 (include)
>>>> +...log.do_install...
>>>> +
>>>> +Revert "pdfsig: Catalan translation" to workaround
>>>> +
>>>> +This reverts commit 99f5416d9bfb6a34bbc5cbcb368e258b98fd3f08.
>>>> +
>>>> +Upstream-Status: Inappropriate [Yocto specific]
>>>> +
>>>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>>> +---
>>>> + utils/po/ca/CMakeLists.txt | 4 ----
>>>> + 1 file changed, 4 deletions(-)
>>>> + delete mode 100644 utils/po/ca/CMakeLists.txt
>>>> +
>>>> +diff --git a/utils/po/ca/CMakeLists.txt b/utils/po/ca/CMakeLists.tx=
t
>>>> +deleted file mode 100644
>>>> +index 3225131c..00000000
>>>> +--- a/utils/po/ca/CMakeLists.txt
>>>> ++++ /dev/null
>>>> +@@ -1,4 +0,0 @@
>>>> +-get_filename_component(_lang ${CMAKE_CURRENT_SOURCE_DIR} NAME)
>>>> +-gettext_process_po_files(${_lang} ALL INSTALL_DESTINATION ${CMAKE_=
INSTALL_LOCALEDIR} PO_FILES
>>>> +-  pdfsig.po
>>>> +-)
>>>> +--
>>>> +2.49.0
>>>> +
>>>> diff --git a/meta-oe/recipes-support/poppler/poppler_25.08.0.bb b/me=
ta-oe/recipes-support/poppler/poppler_25.08.0.bb
>>>> index 45f94b0ae7..3b0b4b0e99 100644
>>>> --- a/meta-oe/recipes-support/poppler/poppler_25.08.0.bb
>>>> +++ b/meta-oe/recipes-support/poppler/poppler_25.08.0.bb
>>>> @@ -7,6 +7,7 @@ SRC_URI =3D "http://poppler.freedesktop.org/${BP}.ta=
r.xz \
>>>>               file://0001-Do-not-overwrite-all-our-build-flags.patch=
 \
>>>>               file://basename-include.patch \
>>>>               file://0001-cmake-Do-not-use-isystem.patch \
>>>> +           file://0001-workaround-build-racing.patch \
>>>>               "
>>>>    SRC_URI[sha256sum] =3D "425ed4d4515a093bdcdbbaac6876f20617451edc7=
10df6a4fd6c45dd67eb418d"
>>>>
>>>> --
>>>> 2.34.1
>>>>
>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#120878): https://lists.openembedded.org/g/openem=
bedded-devel/message/120878
>>>> Mute This Topic: https://lists.openembedded.org/mt/115886629/1997914
>>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/uns=
ub [raj.khem@gmail.com]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>


