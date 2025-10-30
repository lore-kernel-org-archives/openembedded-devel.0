Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14428CCF9E5
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 05:12:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web01.17653.1761801126501641188
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 22:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Op8fUdEm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=339869172a=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U3dBd9923771
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 05:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=W+DnI/QxNctldWgF1tnsBI18wOkVWThDlVKPxQmhq2k=; b=
	Op8fUdEm406ajZx59oR8rUFvtn2S50q3EG69T6ouH4oa89iNmQrhMdVih8dTyyab
	/PLJ4tPRZyGKCfSULleqIwOGlpu/mOgw1exxETNUGmZ0LAurFsiG7zhbIE+I3I+P
	5IutCiWgXEHGtl6VaEwp+J2IJpylqsRY/qJcDglAHOvpJNhJTn6Kex/ZGm8D7viT
	u42WoAhtT7iDEIAkoUFCQrXUFZBzJN9/1JHOIqA5wQRpVqNhbsLbEliY2akK/KD3
	+TMHpT7ECnPAjcKHG8x30eVv5QRTQ6Nyx720LSQoJXA0pVUY+0gUMhLnkyME9kyd
	jRx5pvq6UAh45/UiNfKCWA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012053.outbound.protection.outlook.com [40.93.195.53])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a3w9gg5m9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Oct 2025 05:12:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nBmKWDR1/YaBL7kyXAnRAFbgGSQZm3Rwue0aF84OHlwoL1Tgq5Ia2SZyIH93zY+sFWc6+LaEOhITcQZeABftSuamQeMrdKnQGI9caMRSUJ0AcG3LIpDvmJHPM1vlup7JAyqKpwGRsGNGdPhOUPOPp+Ab2ltnunG5MspVlvW+Jo4AeZwDqOHSaCqSZsQDE4SpkqFCByyiULOXHxflCmHh2B/Z7x6SqJTPRQ1sRqr9Jpj9sDUaxs9y4o1yP4qkucYFXOrC1LseUtDdIOU/RkiyKzHnULmVOcgcT+SHmg3/zUsp41UkKHbEofvLOwEOqxXUBKGXbooL5VG/1hoTypj8bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+DnI/QxNctldWgF1tnsBI18wOkVWThDlVKPxQmhq2k=;
 b=Zwh0+h2vTrsSYpP6wfDqmdLoLrQ4II3qU2yrCmpDE7DR7lttrQ/bRpQSCoqDvvj/Is/3rN09kofJRHoSXihmIhvI2qmUvQwNQGyYAryEvRCwI71dRkQNY0HeWwTI2HLV5UIk+iox6TxMo16G+1GRRAgx+NTh9XYy/TKAkn5n/4EBsfLY+Rx7ZfpX8b/gJ5fLMpfr9tXity7ZlAPcT/xShqga5Z7ZSERWijQ7yeMbn/KLML052YhWLQwUTG01mGmFOSzUX0DF8pHezBVrkBJsw7aKNFfheEwPrYjJSq1982D/O9pQtiD6R3SfiC6qvi8JS/pN0NM9LkFP0jhVVAUnRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by MN6PR11MB8217.namprd11.prod.outlook.com (2603:10b6:208:47d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 05:12:02 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%4]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 05:12:01 +0000
Message-ID: <51bc3716-b933-4856-a29b-a6257c88de42@windriver.com>
Date: Thu, 30 Oct 2025 13:11:57 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v2] nodejs: fix compile failed for 32 bit
 arm target
To: raj.khem@gmail.com, hongxu.jia@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
References: <20251028111956.2903925-1-hongxu.jia@windriver.com>
 <CAMKF1so2PNXmxTsWOfiHU7fJ2RpbsyY06Ky=AQs9yjcCOUDLpg@mail.gmail.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <CAMKF1so2PNXmxTsWOfiHU7fJ2RpbsyY06Ky=AQs9yjcCOUDLpg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCPR01CA0200.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::7) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|MN6PR11MB8217:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c13d209-50c7-4ebb-3686-08de1772dbdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QytlYkQ1cUlhNlM1RHhISFpmamJ0WjJKZVV6MVhmR1FJUTdsZ2pzTnJQN08r?=
 =?utf-8?B?bTdBbEtNQ0xXTG4rWVpsNTNaNnNqWitabG1OS2JxSGpPUmN5R1BZRGMxZzQw?=
 =?utf-8?B?WGxOQVdnVk9JcFJRLzZMMlNZWlpZVVpxMDUvcHE3WWdyVmhsYXlXNlUzZ0gv?=
 =?utf-8?B?RmJXMUxvOVpzbnFWNGdXR08way9neEsva0FmeXMyRUJFMmw1b243c1lZWkV4?=
 =?utf-8?B?M3NqVU5SallFYkt1TEdTaXllWnFRL3RVSlZkYVdZc3JWcTZaUmtRSjZGK3Yy?=
 =?utf-8?B?RHBIVkl3d0VSdEFqbElEU1RneDh1MHVuQkFuSDRobUhJUDNFdDZVeTlOdXlM?=
 =?utf-8?B?UHNiZVJkZHBydUZBdE9Oc2dSd05Ia1N1WVlYOExGMTNHeFFnQ2pTcWVVYUYx?=
 =?utf-8?B?dGJYeWlnL21MNmh5UHhxUEg0UUNmREhLK1NkMVlieHdlTXNNYXUveFJCcE5v?=
 =?utf-8?B?QW1rR1ZkRW9ycDJXdGVRcHova1lNUWlMd2FHWm5kMkx4cWZ4YUtpMDRlRTJQ?=
 =?utf-8?B?a1dXM2xCZEJQQW5HMWZVOEJPUDVoWXhCL2hOZkhzY2ZjekFrZG9XSEdTbXBP?=
 =?utf-8?B?eWZDQXJTUnE1dDR3MVRWUWdzak9SS0NtMUEyVU41Y1ZsR1R6bUVzR240UmRF?=
 =?utf-8?B?d05lNGpiY2NFZDVYckVFWnRDUDdPbXZrVWxoQnc2bUdwSDdKR2JMekpRY2dC?=
 =?utf-8?B?UW5nR3h4WFNldUE5MFlxRmhkaDM5NXZDeGg0bGI5T29qbHBpVGxld1JGbWZx?=
 =?utf-8?B?UUdibExLNk9qQVM3UUtLaXVFdVd2YXgyd3J6QXVhdzBvUTdIM1ZlYW9tSXMv?=
 =?utf-8?B?ZXJUcUZ2UmsyeDR4OVYzN2N3MG4yWC84MWtkZDV0dUhRSzBtZEdtaG5jSU5v?=
 =?utf-8?B?QjV3aTdGa2wrTTQxaVdTcjlaNFg4eURyTElMdGROcjFzVmpwaDVhSzA5bTBH?=
 =?utf-8?B?RC94TkNKdXc4NmZEdFM1aUZ3c3RmcVRkWlJhVzhrTEJOcUphakx6YkZTQUpo?=
 =?utf-8?B?dzlhM0UvTXNMdlVJVkw2aDVLeXlnU2IrbVRTUWFlR2JtOEh5ZXJWTmkzTmpU?=
 =?utf-8?B?a2pxcDN4Y0lnWG42cXBjTVFvQWlrelQ4aDV2dVBxY3l2VHJTWlNFSGZxWHBK?=
 =?utf-8?B?R2JFcFo0cUM2Y1lJUldrNUtkRU9yTlJ4OVpELzlUWmgrMFdDcjJoMHFsZnFq?=
 =?utf-8?B?SEtjMGROdTFSQXM1OWJsQWFlWVdIMTZGT05USFV5QVBURnl1NlVseE9KdHpE?=
 =?utf-8?B?cEFFdXVybW5IeHdpUW5tMlNORHdLbHJxMlA0S1pheVJtOFVSb2xZdXZoQk9S?=
 =?utf-8?B?b2IwNG94S2VlZlp6RFZDb3JSaGEyak5tdlZ3OTFOem51TzcwQzFqOENMSmlI?=
 =?utf-8?B?YWRoTHVaVlhMeXY1aTdyMW9CZ01jTXpxZndUQWl5Rk5VZjUwWHlzbXNtWEtL?=
 =?utf-8?B?R2dvR0lzb08wa3lmdis3cTNNTFZEdy9wNVJZSFhhK2JIV2NjYXBSSjZtUG1T?=
 =?utf-8?B?NXFrd3BLU3FnaTM4eVRxRkxCbVhjbkVnTTkrOFJaek8zM1p6bnpiRVl3aGtS?=
 =?utf-8?B?c1lqOXFpUWVWdVFBa0ZUTW5UT2oyUGZkMDRvMlpCYytWcGljYzZqUTR0K3hl?=
 =?utf-8?B?NXZUS2U0OE5zVVlzWlFiakJjcDNZaHQzWGRiQ2RFUGJ1UnZrd1RtVW93allO?=
 =?utf-8?B?amtlbVlQNzJzd1l1YWE0Q2phYzlieVZEaU9zd3RlQjNIMlo4bXFNZzRJVUlV?=
 =?utf-8?B?em1JeWxMOTNNbHpxUy9udXJ0OWppNWhOekMrbXV1cUNVbEpSWVhXNjdNQ1Fm?=
 =?utf-8?B?RW9neVpOTlU2Ti9oWVJwNnAyOExEdTZUTGZlZXlEbEF4ekFpRnZXeXEzcURx?=
 =?utf-8?B?VzhaZGltelVTWWQ5cUdmMkRBd2g3L0pxR3NIQVNmcGpPQ0E9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UW1zVlhpSU5FdS92UVlZb3Y5RWU3Z3R5a0hjcy9WUUgyL3pocU4xREg0VFo0?=
 =?utf-8?B?MzRJOUFTWlhLT1V1cC9yTWVGN0ErenRVYmNOeG1COXlqeGc1ZFFHNjdjVlYr?=
 =?utf-8?B?bWZ2eWFIOUJweEs3ZVU1VDJNRXQ5VU80eHBTTDVYYmxqakNaVEI0cmNBRzBM?=
 =?utf-8?B?eklYSzhMajV2c0FhNVFuMmNDUlVmRVVGR2hhUkpaTnJkZ0g5RlZxcWYrdXBH?=
 =?utf-8?B?SHNtZVhqMmM5V1o2aURzY3FSTTVQTUFFelAySW5HWWF2aS9Eb0VITjZ3Ykw0?=
 =?utf-8?B?SDB1bXJBeHd1RVVjY2VlRkNSYjdSZ1FWU1NYb1lMRFp5U3FQclM2RHZDQ2t1?=
 =?utf-8?B?a3NCMVpqemdaTVI2ZmhFUnNQcWRKRUFhdEhKSW1FVXdHZ1VaNU1uUzJGSjIy?=
 =?utf-8?B?NDZTRGtVQUJvUTRGSHBLWDMrMVJPRkVxSUNuR3M3djlnQi96K1VrU0ZSNnFZ?=
 =?utf-8?B?YVdSdFdTOTZDQWYxSUlHelRSUUlORFFkSDR1cXRiaWV2Q0wwWHBxdFlyUGZC?=
 =?utf-8?B?TXRBcVZrNDJNSk5nM3BSWkJRdXdTVGNaRmJ5cW1FRTk0ZFAwV2hDWXF5S0dS?=
 =?utf-8?B?N2ZjbUluUUxRVTB2aGdmRDBBRWhrK3NIUmhBMVU0MjBScndESlViV2txd1Ev?=
 =?utf-8?B?Q0tCcUI4SkVNdHRVZzhOOGVKeS9QZURrSk1uaDNOQnZaaDJqd2t4dVJtNWhp?=
 =?utf-8?B?SndFTEozQ2IxejNpM2VmdXBMQkpISjhpOEwzcjVNRnpibDlTMFZMZEROU0Iy?=
 =?utf-8?B?WncvVzFtTmJXUm5QanR5bFFMVEs0Z1hLYUNtM2VkUThtNlZCb1FIOGJTdmll?=
 =?utf-8?B?aSszRGZFZUtmSFIyWGFHVzVTWmxoYVBibW5zWDZidXozR3dEYlJTRWo2dkVJ?=
 =?utf-8?B?OVRYQm85bmJGc0JNa0dSSmJiNFg5dHJUUXR1TmlnVTdobzU3UlpRTGIxK2hP?=
 =?utf-8?B?MFJaUDRJNUJPUE9qOU9iYkF0a29aZVU0OFp3ZnMwS1l4QzhNc3Bkc1JhRHNi?=
 =?utf-8?B?dXAyd0ZGZG56R3VnbGpjODgwMEp4c2FqQXdDVCs1K3ZDY2VwZW9uaHdkQ1lv?=
 =?utf-8?B?REYyYzkwenoyOVExM1NiT0Nzenl5L25BTEt0UmRGRElnaFBwOWtNOXMrZVpO?=
 =?utf-8?B?b1duVTIySlN3NElJTEFCNHpCNlJUbkhWRTV2dDVyZmsrRmMxd3RySFdYQVd3?=
 =?utf-8?B?Uk0rV081bEdPWGZyalBTNmh5b0tSWnVzdmVwUEJuQ2x4YUhQQUNVa2N1N01O?=
 =?utf-8?B?ZVJOaFAxSzE3ZVYwK3hvdUVvSi9XMFE2bDJKdHRva3krQ1U4UjZPaUNDV1My?=
 =?utf-8?B?SlJZRkp4QXZxRlUydlVmeGR1c1lvUXNzMWo1ckczY1ArVmJqelE0Zjc4K2w4?=
 =?utf-8?B?Ris1RzJtTXY0a2UrSjZnSlZiSExZZE1jTGRLb29tdGFndjZCdGdnMHhzVFVp?=
 =?utf-8?B?Nmp6MnRYd08vZ3FhdCtRTUhPRmIzUHpHMHhHU0MxMHJVbnJ4WnIxeklnSkxl?=
 =?utf-8?B?M2c2MWRTU3FpR1N5M3FmUWJWYTVqNXcwM0sreGs3TkdXN3k2S2VWZm5Rc3Bw?=
 =?utf-8?B?WDU1K2R5WjhYdDN4dTZJV3k3M28wWDQ4OVZUTFJZb0x3OUovYVdMbGRFcG8r?=
 =?utf-8?B?MURidUxoRVNBdW5BbVVFOXhIVEhTWmV3K0FmdlpJL0hvUXljSlJ2WjFGdExG?=
 =?utf-8?B?c1d5WkRDTlljYnZFdU1UbDJ5a1ZvcXppR2sxQnpyUUpCMGd0MVBlM0IrWlFT?=
 =?utf-8?B?Z3F5YWtnVFV6cDJ3NlRnckZhNHZYNUU2OW1OeW1ZYXUvSmh5YmNqWk93YmQr?=
 =?utf-8?B?OXJ4UFJjOHEwakRDREtVRG5KenhEZm5nOXh0UmZsVHVxNzVISFJBZFlKN2hS?=
 =?utf-8?B?NVJ6aUYrcVZ5Z054TmpnR2dod1doL1NPY1A4ak9VeWRaK0dEU1JrSWh0cEFr?=
 =?utf-8?B?bWxLY2FtbXlrQWRPK0VBUW94b1ByS3N6bUtjcnh0ZVFvaDlpT1hNSS8yQk9h?=
 =?utf-8?B?TVRIcGxDVlhrTHhSUmtWZ1huOVJWaXVYamhWNFVyeW1lR3VPZWdPWUFOWm9h?=
 =?utf-8?B?SmVnQkxKdGdIdGhTaGt4YmUveWNnT1g2M24rYTFxVStYOVpSZWxOS002aTUy?=
 =?utf-8?B?WVVicEhsMEZaVG9IeUFpNUdwWm1QS3hpbEdlS3VNQkplQmpZK09lVXlaSkk1?=
 =?utf-8?B?Y2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c13d209-50c7-4ebb-3686-08de1772dbdb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 05:12:01.8579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZc9pB5fWpWJ1yZxpQZh7B81fICPH15LjMhsA0LX4EHVdqRKVTlsXtTmS3/NiuatWEA9Ub/zq5kie3ZPLs3DIqFG24v2tyiYdG4nXbb8YBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8217
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA0MCBTYWx0ZWRfXw3SYxp2/XY0Q
 jsci1EvmLZbABdz2MU7zcowGee9hW0jhnsb+p+xyapR4X3n75CYcBPCe2UOpz2FmiPzsBTgCijR
 ITWzeW3vRD6hHPTwIqFgjKSQVuc5Di3a0sjmAD32VtjhDIstWSFlDTcfoeiY2ETD/Zdso9xszVX
 hPWwECHQtbOQFgvD06Iu94Ttxpo1AAMlXZ38gIYyexa1/sgYvXfZh/Q0HIV4iy7rE4tLymwCUpi
 3yzG8Osp89kdPKHc8so526r729J9XDYisAPlLRJO0/inKSCILzo4yYiA94ZrYjiFFPDUxhe8vv+
 FQbuFwTLbpThIDfhS8EOojCi9uJEtuNpW4hEJLLL8EWEqfM3xXZ0TqwHid8kjxT3IBvlmNmeO7t
 ERH0d3+BpWGqwwxll9zffgx+WTGwVQ==
X-Proofpoint-ORIG-GUID: WGHLBEueAQjXTE79kZ_zVCnDFNMa84jo
X-Proofpoint-GUID: Dq8a6ZYGeFcEY9Vbe5GZazWiOM79hQor
X-Authority-Analysis: v=2.4 cv=YqcChoYX c=1 sm=1 tr=0 ts=6902f3a5 cx=c_pps
 a=25df8hqnvvr9QcO7WBwFwg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=_7Podz288jRFAubH_u4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300040
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 59U3dBd9923771
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 05:12:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121186

On 10/29/25 09:38, Khem Raj via lists.openembedded.org wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> I wonder if it needs to enable neon machine feature, I am not seeing
> this failure with clang.

Agree, clang toolchain does not need it, I will apply the option for gcc=20
toolchain only

//Hongxu

>
> On Tue, Oct 28, 2025 at 4:20=E2=80=AFAM hongxu via lists.openembedded.o=
rg
> <hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
>> Build failed for 32 bit arm target
>>
>> $ echo 'MACHINE =3D "qemuarm"' >> conf/local.conf
>> $ bitbake nodejs
>> ...
>>   2645 |         );
>>        |         ^
>> ../deps/llhttp/src/llhttp.c:2643:11: error: incompatible type for argu=
ment 1 of 'vandq_u16'
>>   2643 |           vcgeq_u8(input, vdupq_n_u8(' ')),
>>        |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>        |           |
>>        |           uint8x16_t
>> ...
>>
>> Use '-flax-vector-conversions' to permit conversions between vectors
>> with differing element types or numbers of subparts
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta-oe/recipes-devtools/nodejs/nodejs_22.21.0.bb | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.21.0.bb b/meta-=
oe/recipes-devtools/nodejs/nodejs_22.21.0.bb
>> index 6d1a364be0..7a784bf7f2 100644
>> --- a/meta-oe/recipes-devtools/nodejs/nodejs_22.21.0.bb
>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.21.0.bb
>> @@ -48,6 +48,10 @@ CVE_PRODUCT +=3D "node.js"
>>   # v8 errors out if you have set CCACHE
>>   CCACHE =3D ""
>>
>> +# Use '-flax-vector-conversions' to permit conversions between vector=
s
>> +# with differing element types or numbers of subparts
>> +CFLAGS:append:arm =3D " -flax-vector-conversions"
>> +
>>   def map_nodejs_arch(a, d):
>>       import re
>>
>> --
>> 2.34.1
>>
>>
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#121139): https://lists.openembedded.org/g/openembe=
dded-devel/message/121139
>> Mute This Topic: https://lists.openembedded.org/mt/115991441/3617049
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [hongxu.jia@eng.windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


