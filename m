Return-Path: <chanh@os.amperecomputing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84502D2E039
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 09:44:19 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.93])
 by mx.groups.io with SMTP id smtpd.web11.4986.1729676655251882602
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Oct 2024 02:44:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector1-amperemail-onmicrosoft-com._domainkey.amperemail.onmicrosoft.com on 100.100.100.100:53: no such host" header.i=@amperemail.onmicrosoft.com header.s=selector1-amperemail-onmicrosoft-com header.b=JDvB8ErB;
 spf=pass (domain: os.amperecomputing.com, ip: 52.101.43.93, mailfrom: chanh@os.amperecomputing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hwxUtTJYua9fGX+aNuJxC11W7veFLEznFHdcLCocuir7XkYm9Y7WkeILRTNwjcOJk50FKKL6gT4Ev/lzfI/lRG2lirKf31DkHKp6NlkQ3mqPSmXPRwgTK9NDeCSNngFi8I/XYNXtjeHOxtJsQEKc6YgrEXse5vF0ecmYYmQE1BWXq535uv7Mp6ZMZ5wN/R2jmb1H77y9TEwKT6x29Z22TSXiGR4w3Y0AxKBoVaVgM+zIUV3nisMomm2RQ8FdOjs7OBGva/aLJNQgGavG4WQvz56xPhBBaisAAznZ3RBFwgkx9aQkip7wnU83tgLkSfzqE+p6FQv2bOMKbkhODOYR9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avceuThjmdoVn79ywgQ86Rqj4XIqmpErxNIk3J7qpUI=;
 b=YQ+WJ9nufxnt0AExgrQDSKpUEWTkBLvgAx4TMhNtiFTvOt/MA9JxE/eVszT7irZNWLELxPgER1oBAhTYfir2lJBnlSEc35UAjDBLI57+OtyVP3tzZVp7Oyv/3GzhXgRhaKBfLWvfBiKcgXQSh/15kRCNFlLiS/6NynKiVbG1ElqJ7L2s0xTjqMpsgFsNDmKIioijIL4EqCarINdcf/eFzf2G+NjiChmj791vYMCFWgLiMWldPJUMuLRHE2QI6ABn6yRHvyEAWnZt6G+zhGxMmysEaOjmUX7xab7BVhQuZfBmGoKvRHlVBVpql70T7Jwa+mGPi5XD2/VjHb0JSfQMnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avceuThjmdoVn79ywgQ86Rqj4XIqmpErxNIk3J7qpUI=;
 b=JDvB8ErBu9qaSwUUVmFx3wL6Apkjp9AAAFYJvYRa+Bc3c4Aj9cMsdTMi1Fm+bu8nKbezIlCSh/3YPPyAhwBCuQYyf8UJJpY7WeUqi9fzjsIoUXyapuKdxlNgL+vmQ6nLXuDpoxBYckmWatrZueUJcxGEv1ezTu5ezcReIovAclI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 SA1PR01MB7326.prod.exchangelabs.com (2603:10b6:806:1f5::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.34; Wed, 23 Oct 2024 09:44:11 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%5]) with mapi id 15.20.8093.018; Wed, 23 Oct 2024
 09:44:10 +0000
Message-ID: <f4956959-0c24-4f66-9048-f52b7c46a377@amperemail.onmicrosoft.com>
Date: Wed, 23 Oct 2024 16:44:02 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking,v2][PATCH] mctp: upgrade 1.1 -> 2.0
To: Jeremy Kerr <jk@codeconstruct.com.au>, raj.khem@gmail.com
Cc: Chanh Nguyen <chanh@os.amperecomputing.com>,
 openembedded-devel@lists.openembedded.org,
 Phong Vo <phong@os.amperecomputing.com>,
 Thang Nguyen <thang@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Khanh Pham <khpham@amperecomputing.com>,
 Thu Nguyen <tbnguyen@amperecomputing.com>
References: <20241017063626.2089926-1-chanh@os.amperecomputing.com>
 <CAMKF1srdcMcJ6CVEm3Cf42nEyFug+kDO0yGWQ53GGjG1TADGfw@mail.gmail.com>
 <64bbd9ab-d24b-4085-9e7b-abbfbc286264@amperemail.onmicrosoft.com>
 <CAMKF1sqr6WcQHBXietnNMmVqSFq2wenkMtfLSqyD5OCRxeirEQ@mail.gmail.com>
 <66ef3f0b-431c-4d4e-a3a4-9519503feeac@amperemail.onmicrosoft.com>
 <3047b261e2b8da8c814e5a33d6229a15523a2ecd.camel@codeconstruct.com.au>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <3047b261e2b8da8c814e5a33d6229a15523a2ecd.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::21) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|SA1PR01MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: c6e05c85-3e2f-4867-90e7-08dcf3473f2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UXRDbnBJS2d2QWZXb1R6cXB4Q0hqcGx2am0ycmVzQ1NCSzExcTRIYnphWWZy?=
 =?utf-8?B?Q0dxcEhoekJtMXBEMFJUWGJyaG1qU0NsTi9uOFJpcVNJcEJVSG55bGtZUEZR?=
 =?utf-8?B?WC9yVjdjYkNHNzVWNVFtdzVCZ1dzV2R6dVZVSzRZbVRaWkM2N1VLZ2huOHBC?=
 =?utf-8?B?MWRxZXd2UzlCbkREQUNKUDdqZVVvQmtKU09xa3FLZGxrSFQ2Zm9oNGlZZVpo?=
 =?utf-8?B?dXJ4dlpSS3VBSHhmMEVYd01UYytTaUVTVzVYVENGQlNVTTBnYzJsMzN4dmFk?=
 =?utf-8?B?aldlQTV6K0luVUV2bmlIMm5LcUZVUUZ3dWsvVkVGdjdLWS9Zb1czUW52WjNK?=
 =?utf-8?B?NWxpbWxtd2tpZDJNTjRpanlOSW9xTXM2Mys5TTJvNnNxSlpYbUU4NFdhUGdH?=
 =?utf-8?B?M2J0ODFrNUVCSm9XNC8veHlpZGh0L3FtQjVrRTFqMnhiVFQ1clZUUXB3VjUz?=
 =?utf-8?B?bzBrSjh3emsycmRGYWZjaDVZeGxZdTl6MDU2Y2Z4T0tLc1BLWWhOVEpaOFRI?=
 =?utf-8?B?YUxubXJkNEI2bS9GUG9GK0xrTEVtempWZ2EwTm83YVJ3eUwxRW5vbkNvVEpi?=
 =?utf-8?B?MmVUeitqYkU1NXZUakFNb0VybEk4QUgzMG1YTzJYd1RBdDFjdktlU1grNWx0?=
 =?utf-8?B?M3hxRm9vU1VSRmxjK2RUVXBmK3lQS1MyYUg5Q284S01RRlZKYVFzYW1CNWxl?=
 =?utf-8?B?TjZwVXo2TWpDMzg1RHhocStvQmx1UFRuYUg1eE9iS3hRNzJPaHhOR1VKUlFC?=
 =?utf-8?B?akh2REdzM29SWVd6Zk4yR2tHRWZPWit3enZXaEVmcTJXQlA0bG8wbE5IRGJ1?=
 =?utf-8?B?TnV1T3BoQUU0TitUMlg3dzh1REZDZTBhZVNTRkdPY29mbHh2ang1UVZ1dVZV?=
 =?utf-8?B?RzVzdGt6RWhnZWZXTm1DR3ViVWRNZlJlS3p3NHFKdTY4MXRiMnFLZWJ5WlZu?=
 =?utf-8?B?ZlZWOGNVOUtTVUlVUHVsQ1B0TlhtV1I2QnJmZ0pzMmcvYTN1ZTVKQ08xUDNj?=
 =?utf-8?B?V1NlSFA2UjNnVkZ2SkQ3ZTFucVNzY1JXd3RyemprOFF5aDJLYzkrbGVKb0Mv?=
 =?utf-8?B?WldPMlNIK28rOTFhMDdSNnhIOEF3R21wcHdUYzQ3KzArTnZyZDMycUVKbVI0?=
 =?utf-8?B?SVp2RmQ3UndNWWJzOWFobVRzeFQwaUw4T21LdzFOcXdJclFaQ0tKL1VEeHYy?=
 =?utf-8?B?alNua2JDYTlFWWw4bEhIdkErb1dqNFIvMElSTHB6OHordGpld3JQQkNZU2xN?=
 =?utf-8?B?RzBxNklVeFMvUHF1QWgxVktXKzdhS1FVSVJUSDYzOGZTVDJkWUZHOTlSMUQz?=
 =?utf-8?B?akx5MkNvSzhCaFdheXJtaFpZVUZNNGd0TW93MTZNZFVDZEk4d0FyR0Ntd3Bp?=
 =?utf-8?B?aHh4bjJmdStBNERtRmpFY1hQcHFFSWI0cFpId1E1anBoNXFseXZ1K3RuWkxx?=
 =?utf-8?B?MVkxYmUxTHREY0YwMEtURXpqUzBNVUpnRUpDMUx5WDU5OENLYzdZTUVSQk9W?=
 =?utf-8?B?NkIzYlZ3YmhQamg2TUJrNXRGZEhzNXYzNE4rdHhDRDh5MStkL0RDUVB5SjE2?=
 =?utf-8?B?dm9xeHFLaDc4Rm51TVZSMUhyRHNUYUNQQTN3U3lWZzhHb0NUcXZ1ZnNtQWlx?=
 =?utf-8?B?UXZhZThyRW5GT2RZSi9rMVA1bkNWOWVKMzNsMlVJcE9COGczWnRDbDlTbktP?=
 =?utf-8?Q?8bcVTEDlO/V+T+m5+pKk?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WU5kR2VLa3ZiTWllMnA3ZFhwNjdlc2gzb0ErdkhhRldqdHIvWVE2cnp5eURG?=
 =?utf-8?B?cVJGaGV1MGxHYzVpYUhMY3ZGWmlqbnFEdkovTmNtNHdyVXg4VlNaKzNLUzdN?=
 =?utf-8?B?SkV1a28rMGRFOUU1ZFFEM3NTL2tuZzRSY3pnc1pET3gySy9ycXZ0RHQwWUpw?=
 =?utf-8?B?bnk5dDc2UW5RU2Q5UlBqSEhKc2NoU0RnZUhUQ1Urc3pOQXU4cXBHQTNWUGNI?=
 =?utf-8?B?U1ZQMHRraFAwZmtkd1NvMm1rL3FVWEZsN0U1MW9RZDBlb09uUUxlajZNQ1Zu?=
 =?utf-8?B?WWt3S3VJSExucFoxcnVsNms0Q1dSZjM2dmhsMVhuaTk2bmlaUFdOUXFUVkZC?=
 =?utf-8?B?RDRqUUhlOHF0Rm5zOFNackhVQ3B0NktWVDcyR2NQVUM1YkVRTVZIZjl0VTZm?=
 =?utf-8?B?OXNTZTRLZ3FjNTM4TmxCMUEySFVDa0MrQzQ5K1hRM1M2bEgwRDVMMmE1aFg3?=
 =?utf-8?B?WWU5a05PaE95M21nSEZqamlWNUV5SUp2NVF3WWV1cXRhRlFWdDFtT1cvR2xW?=
 =?utf-8?B?S2trNzNjZ2FoQVc1TmNNeWgxb09iaUx0Zm1tR3AxTVBRZjJtaWNlT0pldzNP?=
 =?utf-8?B?MHNIY1QyNWxrUFI3bGZsdDNlblR2ZlhTZmJEN2dGM3dCOGFDUFRCZ0VCbVRi?=
 =?utf-8?B?TkNWYVVxZjlzdXN0MnpJamZOU2t1Q3BTRS9ackpYYWJiTFlpeFJRK3ExUU03?=
 =?utf-8?B?QkpiTE92L2d2a0JkdVZLSHFycmVXZXFwa3ZHc29yQXdZVlVvVHVBKzlJM1lD?=
 =?utf-8?B?YUtEdDA5Q0RYWENxVzg3eE5OdEI1OURsSmRxVFdBVEs1MVBkemxRMG9mVnVZ?=
 =?utf-8?B?bUtNMnhaZGhKYUhjQ25iODdnOHhKelVPcFhaSDBtVXhQaUN2SHlaSU1EVFhx?=
 =?utf-8?B?YjFtZXRYd043VUpldTVjR05teHpUM3BOVzZEZmJzbThHdTFQaW0vL1lWOXNG?=
 =?utf-8?B?YWxaU01oQ2JZNnZ2WVZ5bEllRUdNMmlPSjRnTzJoc1N2V2ZsRERndFh0QTZH?=
 =?utf-8?B?TnZLU3BlNnkvWjhvUWJ2eXlmbVpKQkhmdkRsUndJQ2NWOTdYTHI2K1BSSUZY?=
 =?utf-8?B?Ky92dlRKb1ZCL2Z1cE5wL0lmMFBZV1pqUGViOGE0ekJKM2ZEb1ZmclYyUEth?=
 =?utf-8?B?cXBWckxpd0s4OWVudVY5aDh1Y1RHaU1tSXV3bjBvZ3BJWTRyNk1McWZ5ZjFG?=
 =?utf-8?B?eW82cWZVdmVBNzJZNEdjL1BESldzalhub0RpbWY4L0pQdU15OThIbEdqOEhT?=
 =?utf-8?B?aEVuTnFhVGlYNCtWWXl6a1ZEUzNzY3RsK2JPZW1vQlZyaXkxQ2RGbEFOQ25u?=
 =?utf-8?B?VTE4NTdSNU53d05lSHlwSlZnTXUwZXFhYW1GOGNleURXUzRuNWpiRHZINWZY?=
 =?utf-8?B?Z3VEbDZCeEtITG5KWVcvRjB2L3B0clcvdWZqRVA2L3V2YmtvVFpNSFJyd2tp?=
 =?utf-8?B?RStlTUs2MlhjSEJ2Nmo1YjZQYXgzcXpFazNMTUcvLzFPbTlJdGlFY1lLblBx?=
 =?utf-8?B?NHlkS1lNZktBZEl5UGJCNWtVelNISWNWbTlYT3E3eTIrUnhmL0tFNVdqaGZF?=
 =?utf-8?B?RktLTjFWbXRtYnBSbmQ2MXhFVmllWVJhTlBUUjBEbi9YdUhUM1U3WVpDVENF?=
 =?utf-8?B?dERId3FUNlJCRW1TZjI1aXVmNm40eFBBc1doT1RqeTNud1B0ZVE4TWdINHVz?=
 =?utf-8?B?RktCbXFwSnMzSEdBSmdZeWZ5b09kSkkxZ0dKaDNlNUVkSVk5VW0wcGl1cWlu?=
 =?utf-8?B?N0tPNEllWU9WclljeEFZOHpSeDhseERMSTdEd0FBMjZoSHdOaUJmeHQ4RzVX?=
 =?utf-8?B?aDNUYXZUeGJoRWFjSjBOditRS25jZVB5YlgwYnZsV05UM2MvMjV5aTkvR3l6?=
 =?utf-8?B?Qm5CeUdZRnZoa3NmZ0g4ZW44Q2VnNzJmTHNLWGZ0OG5oT0hUN1ZwVzBMcjFB?=
 =?utf-8?B?MjhJZ1hFOVFVRW16V2RyNWU0OUtVekxsbU9KUWs5R3owYnRmRWlOc2dVQlJW?=
 =?utf-8?B?UEFHUndWRHhWczdlUlRBUjdCbHkvYTJhTlFaOXRvZDE1dWp2WTFFZDg1ekI4?=
 =?utf-8?B?K2NnTkZQNXFLeHdTbE9MN1ZZTGhTMFg1NjlwaCthRklYQW5iWlUzTWNlMXJz?=
 =?utf-8?B?bE5CMllnMTZINmhtY2NNTXJlTGlTeElFTkhXMnJwdC9JbHpXcHlad1MxS0Fj?=
 =?utf-8?Q?n6vqJwivdN6p8k/f2hTa8SY=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e05c85-3e2f-4867-90e7-08dcf3473f2e
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 09:44:10.9069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jvVzJSKn00uRgMN2dgimhEidES4TyidXHTH2wvn/oJEw5WyrsEoUKue/W9W4YTmuk4xAZ4Q5VLLxQlO+0SVq4wHcSclr6Vl4+StaBUGSbXDJzwYCHo9MGDUrJx7erI8G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB7326
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Oct 2024 09:44:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113147



On 23/10/2024 16:38, Jeremy Kerr wrote:
> Hi Chanh,
>> I saw my patch v3 was merged to the master branch of meta-openembedded
>> https://github.com/openembedded/meta-openembedded/commit/b51e4288b93a97467b1d7dd77b4fab537bc311e3
> 
> Ah, neat. Khem had just mentioned that he had merged v2, not v3.
> 
> So, all looks good here? unless there are other build failures?

Yes, Khem had merged v3 
(https://patchwork.yoctoproject.org/project/oe/patch/20241018092326.2152223-1-chanh@os.amperecomputing.com/). 
This patch is good for me.

So, I think we don't need to do anything more.

> 
> Cheers,
> 
> 
> Jeremy


