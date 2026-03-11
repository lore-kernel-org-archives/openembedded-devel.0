Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71285FD88F5
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 04:09:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13592.1773202165052350911
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 21:09:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=eHGY5lkc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7530cedf69=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B1p9fF2435355
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 21:09:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Mi1NvGfvL+GDIjx5vs0quTBMz1mBweOIQyzkvQNn47A=; b=eHGY5lkciQvB
	dOy68t+bzG1i5RIiFCEh0I/CX+ifcGunvYbgf26cPK+gyCS494T2mwWc+IIS/+P5
	c7LuLaOVceNTDQ30lFcCRqCsnX1jJJw9GciTxoBkr24WmR4o7XLqWdJnOcZNe0sH
	8HnJug1dQxjC5Thux0+8vV2NazaIcB0V2wgKeKRe6d4ah/qTLtDPS7rbgHJfjZY+
	v/DLMd0GvnDVFgBx5RJDLYlA0OHiuwKe0noDVSbgdqDlnKgnPkoqapfaFv2Q+pHh
	DCVQLj6XUnIh5bSZKpSlqVKqQBkvsxDeNAMok2F2H19U5w/4iPnL685k3/wdInwq
	PyXRXq/+Qw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011016.outbound.protection.outlook.com [40.93.194.16])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cty3j03ny-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 21:09:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mNkOnWA5utT4DgYs7kNg84RruY+6QnWKbmFNjk+/eyCj+cGopSxffKbs/KJeszlF1RBbW+EFU35JF3lJduPko3/c+ulBwHGisHVHfPU/gvdWIZ4P/lmsxbw/eAUGuH4En2Yml6Fenp3Ddg0D5Oe+tXlBGMUC3pRF3564zYkhxAV37earGFaT7LBteDVFHzBV2tLlBUfxuyZxlMzKPs76u/I8owZez59nnhka7gfnfN5o1jTwAq72cAKdc8IZE9GNQ6Pj3qHBl88vgjqkRW2o9xoWiLvBDTF2pfqUVcl4yy+ICvpgBcmVpaJqZCskPAWvDtA5G+krZbsWvOpI8QvJwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mi1NvGfvL+GDIjx5vs0quTBMz1mBweOIQyzkvQNn47A=;
 b=mqz4gUNFsXZskgLHDJiH07X+v2KD8C/9Nwz/Wd7iCSOQP1ekbZD1AEFfFl2c0zwQNnIYxpXyvAzgyprXmdWJt83JI1ZKzID38+Ma5kXq9Y+c/j24TdqFCeUgcIh28Wo3meMLWFLMdcEuxZOMnBPiJHbgNuaR/Lt0NrIlnM2ukIFVQJKVVhBpGnAo1iez93uxZeNWY0NLBKHdguyMb0OKBixrR0U4BqijE6cu9sGiVy972ZyC08t034rpq2XCrPToGo5PUWcKs+L2YqpInSQW83TotaduOxLr7N3pV5pGEfqphDyGNeQWRxiyUo5X2B0KartkgExbTRZveTCxHufn0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by DS0PR11MB7443.namprd11.prod.outlook.com (2603:10b6:8:148::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 04:09:21 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 04:09:21 +0000
Message-ID: <295c187a-5820-4331-873b-7dcf378481b1@windriver.com>
Date: Wed, 11 Mar 2026 09:39:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] cxx: Add cxx recipe
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        openembedded-devel@lists.openembedded.org
References: <20260310134815.374345-1-Deepesh.Varatharajan@windriver.com>
 <1f68cd24-b5ab-406a-b245-1c0d9b592367@gmail.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <1f68cd24-b5ab-406a-b245-1c0d9b592367@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0040.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::13) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|DS0PR11MB7443:EE_
X-MS-Office365-Filtering-Correlation-Id: 47ecce67-eb6b-4c60-8708-08de7f23f8c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	HWbUaG4BTMKTCP9UTilDveED1Ama2knf8v8vDpCcUZ6pHXfT5nesAmTGYjBxjGnJdnccIXI+qRaTtE4rzDBZttvL12yqD5SprCgAAGpNNlDDjgqHaOuqq1mYau6o1MRKGRexmlUJDONSgpMQQ/qE5EKBOQlc3Sv9LmNWnOY+2/0Mb8jaMNLa7ujZzCZEMTGEeCdFXJQemlzpONlTW309OL0Aubo06fzAZWctO7qX7MMDJw6xPWChpWfO3Y0D7/RhuUaon2Sswasg9f6iouMIRZSDFySF5G8QRxbZd/g1PZrP9Kdjahl+8i0+QReWswjIRJB1O8UQrzVBsUNLDzIRqjoHwzItffJ3yek6CADzH8Kjbi6r9eVk3XQbxNsvQyVTLAG/wLUWuz98SAi7Z7hc1mhI6a+NI3wM0eKeO8yK9DxhNvmVfJuOSxg7otuUTIok+1sRp9yoVahA4pcyfJF2mBwTkyBFvXMXXn0x7NxZph87Av92QY6rLFArQjQgxZTNjc8hv+gouT7EiX5WvK4T+g8qWUQ7AQMMWoslNFyDiAoeQPafuS49miApMwnItUcxbifixEGTeiOS+Wx+RUAy0Gp9rzrwUZD3Xm1zBBrJP7be7BwyHy+wxWRfsDZI7kXIyqtJIWrB/S8YbDbMEsVLt5tka8K1TC576y9OgbnfHUypKS36mZrqXXLRVWxZ3Q5G
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NHRZMFJ5QytaWFNKRjlJeXhBa0pua3VFZXRXWHpIdzhDbStJOGMrbi93ZTFt?=
 =?utf-8?B?ZmNPUHJXR2ZvWEZ4ZlpYNDBPNVVJcGh5WjZDdFFjL004VDZlOWxEUXNYS215?=
 =?utf-8?B?eU1oRG9MKzc4YjExazhIUjlYMzBXaE5hMzlQWGY5ZDl1MVB4RWlGODd1Ry8x?=
 =?utf-8?B?V3BvcFRuQnpRR1Rhb1IycTRjMjgraUxGcGJOWXN2QmFrQUp0RVJzemNwb2d2?=
 =?utf-8?B?ZHg5aDJSSVZEMFg4b0VXT2Y0TEh3TGhhaFZQNkNidktZS0ZZS244RkZEYnFX?=
 =?utf-8?B?dFN2YVhuSjhHRUdNZjRqTThmOXBNK1NFS1ZmVzlnMzF0WkpudHA4TW1Fa3Np?=
 =?utf-8?B?ZzA2L0pkcGhTZHpKazZXdkI2WmY3WVRDZzJMZ1g2VER5MEMxR3BmS29RWVM1?=
 =?utf-8?B?R0l6eDZtSk1rUEdaSVlMWWhmZEpvWXJ4Wkg2WEg5ZG0zU2hvU0ZEdGxFbC9l?=
 =?utf-8?B?anRFMW9ONkZhVzRvR1RMOVdKTkJUMWM2V1U2Q3M2MXRwc1J1MmtkTnJubFFC?=
 =?utf-8?B?bldMbzhpRktEMWVwV3BodjB5NEF4Z25xN2lwa1BBOURkRktpWnovdGtPOWpS?=
 =?utf-8?B?YWJ2SklXV3JOTjZHUmhXTXhmM3NobjI4RUFISEJFQVZJczZRamVGeVFHbHds?=
 =?utf-8?B?SGxkVEV0dkdNeXZmaHRFUTZubTExMVdWOTBoc2lYRnN1T2lmcU5nbUhkL3NV?=
 =?utf-8?B?Qk0walo2THdaa2QwNmlvaEtyN0Rra0daRW1lcGVmcSs4L3k5a3BWMFpYdTY1?=
 =?utf-8?B?TmpSQURSWXc1N3hxTnVjaGVkV1NVUkYyRDFtUDJXbW9peG5SenZrK0NzQ2Fn?=
 =?utf-8?B?KzMwKytjK0tuYVQzd0NRWmpQZmVZcnByekRyRG0yZWk5aWRYZ2hxZ0IyMVMx?=
 =?utf-8?B?Y0R0UTFPcGROcXlSczVLeW8xbVY5Vk1YUjhKdDFRRzdvZlFOM01jbnIvRVpW?=
 =?utf-8?B?ZE80akVrb2hTdFNLQmdiY3RmbVhKbDd5UmJmMCtNeS9odjgzYUxNR1FpaXFp?=
 =?utf-8?B?RW5NYklNcUFRTGpJdmFDZ29ZdGR3SjVVeUFVdUpqTDJqcWdZUFBHOFNTQU1W?=
 =?utf-8?B?RWd3a0xQM0czdGFseUhaZHBTbCtsbUovU3lBVlR4VUtGU0VyTXZNMjRJNU5M?=
 =?utf-8?B?bFEyZTNkUjQyaEcxUUpBa05yTVlmVTZVWW9XakIwMjZEU1JlQjlqUjE3Wnow?=
 =?utf-8?B?NGJIaEpBZHFhdGthcmtXMEhCZm0wRDNqazl1VjZONlVGOG91cTF0ZFpCS3pi?=
 =?utf-8?B?UG95bmxqL3p5bU1uZ05zZDVYRHluZ3VJOEwwRUY5eW8rN2lOenBCc0p1SXFx?=
 =?utf-8?B?eVZWVWdPVFZYaEhGVXpiOVZ6dVQrTEl3Vy9vWC9DS3hZZEdJVHhKQXdiRlpG?=
 =?utf-8?B?WlVjamd2cWdUVTFtVGdQN0RhY2YyWEtod3J6cWxINGdrOVBoS01JWmIxa0Zk?=
 =?utf-8?B?RjUxYS84WUxWNjZrUW1ndjlhR3F5ai9zVHBTQ0FXRFNWSWQwRUhDZXlXVWdl?=
 =?utf-8?B?dlR0L2VEV1A2dzNPMi8rTXpmdmlLTkNVNTJaeFgvV2hoOFZBY2l4NUpML24z?=
 =?utf-8?B?RE0wWExHUE0ybjZSdElnRVcyNFVQQW1qdkhPVm8zajM5UGdsdXVkT3lPclRM?=
 =?utf-8?B?WVZoRURZSStRblVpTFk5NWVYVjliSW1wWTdRQlU0U3pJbTJ3dHFLVnBnZFlT?=
 =?utf-8?B?VDFLUEkyeUVLSlhBekIxb09iQlFxSmJFSktUSDNiOEFNMlk1WGJnNkxEUlpE?=
 =?utf-8?B?c1RoVWdoVUpmVWxwRUZNNkpvMENMOHVnSmZXSlEyZkhIT1MyZUt1VU9TUy9O?=
 =?utf-8?B?THI4WUhaUTNzZHA0ajhsdTh4TlBDQjV0VmEvKzlaSm1yUE5TTWk4V25JUFQ4?=
 =?utf-8?B?Q1BScHN0aVo3ZEdCckV3NFBDb3hUZ1JqcWZudVlkaXM4ZGRKU2Z1Tk9za2FB?=
 =?utf-8?B?SDN4QUdDa3IvNlhkTHJ6aWNueHUvSlI3eTZoRWdnU2dyQ1NIS1J4NFVGelFK?=
 =?utf-8?B?WHM0aDB5VFVwVExwb01rN2YvQWZQTHJmZlJRa3g5eGtEczIzQU9LVjhyaGhn?=
 =?utf-8?B?VXVrSzFXNHJsTmdmOG9sZHFSMkFiaEphQko5SWY1ZWRnV0J5MU1kRzN2QlVl?=
 =?utf-8?B?ZUFQa1VBY2M5MGZPSHNUeVNrZmpjK3BOQU9YRmhDQWhQK1g0bWNaSlVDQURr?=
 =?utf-8?B?bG1STk9sRFlXKzBlUEpVQ1VvYm8vOWtVTXlIb01kUXdxM2ZacU5WTkVrbHZ2?=
 =?utf-8?B?REJ6d3dodFRiSUQrQW9qZmNOaHlxSmRVWlBxSTRtOWhnaTBUN3dXb3lzQjhB?=
 =?utf-8?B?eWhwYlRKV2k5eUZ0eVU5MEZtdzBETUFFZEhCNkxHWUNvVURuVVhrZ3JrcnFP?=
 =?utf-8?Q?MHV3l0GOlCUO3GI+rK4h4m06DgDChjm6+C8Vb?=
X-Exchange-RoutingPolicyChecked: 
	PAvq8GJ5ns1ZHr0UwgRIpChqbdqNA8im78Yk0V1RvN8K292/ui4JzBKle5baY0CQr2wuyoHuBwqC3U0VMffin5XNokOXsw1l61WjFMnWMJMPaLkYlymK2bY2zCdYMLQtqpC4aQycMnAkru521KVG8wJQhqEtQTN6nGfBJVkAqJOhE7YWLWQ85qVVIklY3zBcb55+NoeO0zpGGNMcbfitJlQ+3mbKj5ywODsjff8E2xMZRnAw0OXxN7hriLnFsMRUPcm2sWKqh4t7pcOZmbFxiI4PnJL3gOS4Bqgq8weVW7sTTlmDMTGYWD4KXQtGOMHEG9OXwPCvQwuFIbhuAtP8jA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47ecce67-eb6b-4c60-8708-08de7f23f8c3
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 04:09:21.0788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 50QqIVBdYoWxDpaQhngQfJgvYbkVKZ9LPOFWMlfVKKu5U196CMvbN2muyxQ3bCooegvxJBABnn84OblbfyBMFSYeCtVxAdzCyNVV8EkcgL8lou53Wo4FzTEjDPQ1oePr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7443
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: rWfSoqxSEc8Ize2oU6734xsLi93HYtv3
X-Proofpoint-ORIG-GUID: 5XxMSQFtNnQbjejLtufWKl2IxgEWFc_A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAzMiBTYWx0ZWRfXz0PPoMQH25p8
 0sz/fyw1CIQdtAEtgW+abPexij2PSDEnUjTkeEkTPg5NAAtxJshQraORUA8SIe4ZX+YaSAfhdPC
 pUB/ke9vFOlzeZnKA+9L16jT7+FOo/ptf7uf5fn5lV1tElgo8ZISyeSmxvPeSpkmXzH9jcXAdQW
 8XiJcjmDMNPV8epbWm8zgbuTWtE5lyeC6Fty1kqhCjYl7q3y/6ASUUHjojNyPrbQdEzfuAQLB2h
 YXv2Hk2rk7iDyzTUanzCPoTm8o8erjtTlRiU3nBfGg4zGZhYT+mevEfwTkFYcdybwgIjd76WDRg
 JkE/zmnIXCiX6YmRjBrS+i0OpgASVs8bhr7wWg/eggLS3VSQ0ISx15O23R4u/23ORbXLYl8bjLo
 qiVGQzCvz4gG1Lm2OcFtHR7dbm9S8yeBM2pJa4kFmIlHWApTR09s71tz9TmKCb8nkBgAEgmbuyE
 DETvSFMFVjWFokeHvEw==
X-Authority-Analysis: v=2.4 cv=Qr1THFyd c=1 sm=1 tr=0 ts=69b0eaf4 cx=c_pps
 a=hqw49duEbq/Dm1LMQehLaw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=OcE5tU-iAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=CdpbEqep5vkd6xwHsKYA:9
 a=QEXdDO2ut3YA:10 a=qwkNQZnGtIHGNKTLT1RO:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110032
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 04:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125050


On 10-03-2026 22:49, Gyorgy Sarvari wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On 3/10/26 14:48, Varatharajan, Deepesh via lists.openembedded.org wrote:
>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>
>> Add a recipe for the cxx crate, which provides a safe and efficient
>> bridge for interoperability between Rust and C++ code. It allows
>> defining the FFI boundary in a shared Rust module and generates
>> compatible bindings for both languages during the build process.
>>
>> The crate is implemented in Rust and supports zero-overhead FFI with
>> common Rust and C++ standard library types.
>>
>> More information: https://crates.io/crates/cxx
>>
>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>> ---
>>   meta-oe/recipes-devtools/cxx/cxx-crates.inc | 130 ++++++++++++++++++++
>>   meta-oe/recipes-devtools/cxx/cxx_1.0.194.bb |  34 +++++
>>   2 files changed, 164 insertions(+)
>>   create mode 100644 meta-oe/recipes-devtools/cxx/cxx-crates.inc
>>   create mode 100644 meta-oe/recipes-devtools/cxx/cxx_1.0.194.bb
>>
> This is mostly just a thought, I don't intend this as a blocker of this
> patch. Maybe a loud thought, or a quick-discussion starter?
>
> cxx is pretty generic name, I find it hard to guess that it's a Rust
> library for FFI.
Agreed, valid concern.
>
> Debian prefixes this (and similar packages) with librust - this one is
> called librust-cxx. Fedora calls it rust-cxx. (Though OpenSuse just
> calls it cxx - I guess there is accepted no standard)
> What if we would follow Debian or Fedora naming with such Rust
> libraries, similar to what is done with many Python and Perl recipes? I
> imagine that over time there will be more similar recipes.
librust-cxx seems like the more sensible choice. If there are no 
concerns. I'll
send a v2 with the change.

Regards,
Deepesh

