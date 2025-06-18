Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16DBBC71136
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 02:22:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.36966.1750213333761863273
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Jun 2025 19:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82646e00fe=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I1nQN1002066
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Jun 2025 02:22:12 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 478xa1m1qv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Jun 2025 02:22:12 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W0fqyTiz/O9PR3hwzLpi6L+QUUchm8jt/ez1PwuFx7VXTdB1vSaVWxLTNd1bmeDVAavcbmPf/gg4PWV6jK6GrxlqGExO4yAEG5Nv9OB7vhML561sL1Vd3WFChNPrxk2E89kJKigLernaTYfdn9GgGsrGBfrrZsBf12pd6j2zX3W5LVp3z3ZqE1HA9O7/PVe+r4CUyGJEwfWB8nz/addvLUwIEZgSnOMSgYByQhkeTF1obDXTLHU/bwcst0mbf+E61Gv9lx9mQI6alO2Q2md+HOuXN/+8Vv00T3/jqrbSmb7y80NYILoo5XxLC242+KdMg8YW7LyAgYWFVSm0V/uwOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vISTQM7v/ED3BR8MdHnZMJYnlB0E/o7GFis/e4l/4nM=;
 b=S51DPSgwcEiy9L97feLzZ8PvPyUhx9pf06q33+fRN8lxO/vjXrPWUYqrTXsXU1A3pU0vxpFGZyX0MKztR/Ehq327GqW129bTkJeUXML5z/MttkkYxr5odXBE3PS9HEP4W5vwuITV8UJtNvdJh5gWN5xeq/eHJWjGtX49KdllZl1d3Ji6wUWr/hI0BzIGbUq0X7lNuIgZF2x/GNCFH2zDf1WrxF0+W9YeZKky3qzsSv2WKfX0vUrkUVoS/sxxlNXk6nnCsHmUUI6mFvz3C43/sHdwr8sjt4OAKjpMpecfaCz2hKq10WUtpPLoBoUrP00JmcisVItHMO72klKApyyusA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by IA0PR11MB7354.namprd11.prod.outlook.com (2603:10b6:208:434::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Wed, 18 Jun
 2025 02:22:09 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%6]) with mapi id 15.20.8835.018; Wed, 18 Jun 2025
 02:22:09 +0000
Message-ID: <82df0e1c-c572-42b4-99c6-6a595741804f@windriver.com>
Date: Wed, 18 Jun 2025 10:22:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] nodejs: Disable for powerpc64le
To: openembedded-devel@lists.openembedded.org
References: <1847B5CB35E47235.11623@lists.openembedded.org>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <1847B5CB35E47235.11623@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: KU2P306CA0063.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:39::18) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|IA0PR11MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ed6382b-fdf2-4fa5-f26a-08ddae0eed0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|4022899009|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MG5Ja2FqL1ZQYmdMU0NpNjNnMys3cEFyYzB6NU9ZMVVMUjdjWVBxeEY3T3Zx?=
 =?utf-8?B?NHFYM3U0NjFuVERnemZtclhpdVZldTVSa2kxd3daU2djY3JWMUswN0F3NThG?=
 =?utf-8?B?VkhnOXFHeHN1SHNFY01SWXA4dnZJbkNHMDFSU2xqNElTczNTNXJmamcvanJI?=
 =?utf-8?B?OGxUNU1jZitNNENGa3JnaUYrZ1Fqdnd2REJQdkJjQ0hRWnd6VFhEOGVYbS80?=
 =?utf-8?B?TnYzSi9rWjJZQVltcnEwZ0pCUDZxVDVud2tWQTJaNldNaW80eE5pd1ltd1R5?=
 =?utf-8?B?SHJHN0FrR0paTWtxeEszY29FaGVkeTVOelFONmp4VUp4Nkw0Z1BCMUk5RjF2?=
 =?utf-8?B?MTdXK3VWbDNlNjF4OXNRcEw3WnZZVjZydkkvV2h3YUF3Z1dxYmN3QnF0ZWdn?=
 =?utf-8?B?Z0lJdTNOY0RyTWdYN1d4TlJWa3NqRnpzY2IzeW5kZWVidlJCd0w2cHA4dEFQ?=
 =?utf-8?B?b055ZC90MGF2Myt3bUVBRmtsN2N1ZUdlRzYrL1R2VDY4cGJkV0x0dTZVL3R1?=
 =?utf-8?B?c2x5TGduZkVNUFlJWDJGUkZvNTNDUFZWQ0F2Q1E2R25pWDVVb0NTejBHa0R1?=
 =?utf-8?B?dy9qQkE1aHFEdjVJTGVuOE1sNXVmZmxzYkV6R1lxUkF1NVh3RG15ZEo0Q0VF?=
 =?utf-8?B?aWhYM3U0Q1NqejFEc2d3a0hlVlhMMnVWOXYxZGs1NGErbnY2U0J4L2NyMW8v?=
 =?utf-8?B?L0kvVUx2K3ZKUTVGR1ZnOU1jZkVLNUMxcmw4VGJXd1NOdVJjM2ZzM0hqTk0y?=
 =?utf-8?B?MktWVWlCaHFLUjhxbmhmbndOcjBBM2NjMjViaGd1SE1idkdjSEMwcmIwVGhw?=
 =?utf-8?B?dlVlbTVXdUhTNHcwV0VBN3pMbHV2SGMreUxNdGJuaW9uQWZoWmRQZytFbWs2?=
 =?utf-8?B?K3VVTFRzTzRuaUQrZDBQZllWRlhmSUQ1eHhyYXhkR2NWR3kvNnJhaTJTWGpn?=
 =?utf-8?B?MEFGQlBRdGp2a0VOcWxwd3VqTFkvREhYd2srMWhZWHpjNXhMRnAyT2ZpQnRG?=
 =?utf-8?B?Vnl2WjVGUGowckttb0RRK3V2VlR3KzlCNzlHejd0VUZsQThTMFhqK2tQTHEr?=
 =?utf-8?B?ZDNVUEFmbHdlZDNTK3lBQmo3TEZxVm1iSTB1RkhYV2hxQUhKT2FXL2FnS2VH?=
 =?utf-8?B?dWpOV1liNndMTy91cWd4aG1CYlIweGxSa1VqeG5BZ1kyWTZkQTNnYm5ib1JD?=
 =?utf-8?B?Uyt4Zzlaek1rNSt2Snd0UmEwSHRaelN5ODE3bnBaVFJ6MnRHU3lYN0JLVGI2?=
 =?utf-8?B?Y3h4ZkhnT2pKZW1KV0xERTdkMnlxeFExeEJjZ0hDU2kzSFcxZEVGWURaUHNM?=
 =?utf-8?B?dTdObGJxWEErS3ZWUXZjdzg0MURvSkczclRMc0IyQTU0elh2cjdWYldSTmpK?=
 =?utf-8?B?VnNJWlpEVC9qajc3Umt4V3FSWHZOa1lGRXBBQjh1cnNnYmRzNXg5MW54eTEy?=
 =?utf-8?B?aE9RRFJpWWdaOGNkeVo4UjRGSW5sdUtBKzc4WWZGMWhiZmcvaitEK2tKK0Q2?=
 =?utf-8?B?TU1OQzZuQTNpTTJYb1FXSmJrVndGWDdoMm9aRFVsU3plRjJHOVZQL0xvSTBI?=
 =?utf-8?B?bjNOU3lKMzBFQklkekUyalFDNk4yZ041dllhV0MyUjV3NDFlT2VMYWxKdGEy?=
 =?utf-8?B?ai9BdHBoWHlPYkFvUnFVbEs0Tit1TmZrVDFxWEFFUnArdXlDalYzMHRNdWVm?=
 =?utf-8?B?S21xcy9CT0xkWXhOOURpRGVkSHZhSTMwWGpJejAxMm5Gb2dDeFlWZlV3QkZj?=
 =?utf-8?B?VVNmKzBCanV2SEw5R0llNTFRMGRrcHZaWVRWbEpRSi9EK294RUg1UkJuU21w?=
 =?utf-8?B?UWE4VVZNbDNsVG1ydnZud2RuMkpud2pkZllqUHR3dWZwelBLOTJ1WWczbjRN?=
 =?utf-8?Q?P3LMP3MOqtd4J?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(4022899009)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZTFhWW5hKytPR05XUDhQVHo4RGVCRHhnWWhSZUZWTXl0dmNxUzQzRjN2dG9V?=
 =?utf-8?B?dm1mbVg4ajZXb2E2NnQ3RWxsNzR4TXZEOGpBNWljUDFqZXAxRUw1YkQyZXJV?=
 =?utf-8?B?b2dYWVBiV1ZtWEJ3ZjNpWFd2bzZVK01HZVYzWlRUUzNVVUpGWjkzL3BGc05j?=
 =?utf-8?B?TXFiYVZIV3FQTDFBUzRhYWVCRUcrUkI0ak0wS2E1WVNSdHk1OXVJS01GcUtN?=
 =?utf-8?B?UVlUOE9lTWFRNTZ5QkU1enM0Zm0rYThNcllwcmk5OVNtSFRBcHVRd25iQ1Q4?=
 =?utf-8?B?MHZVZWRPcEE3aGRPRUF4emhIQkNURmloZzRqcVJZdWR1K0dqZmV3Y2hYdnA3?=
 =?utf-8?B?UlFNdXFEUjMrK29kakduQ0pHTWxZWnFwNG8rK293ejVVNXR6KzRyaGQ1T0ll?=
 =?utf-8?B?Nmh4N1k0c0UrekIzSlIxSWNQcjdaeERiRm8yQkhMcERIVnpieG1UK0xGWktw?=
 =?utf-8?B?cDBCOWdPSWMzM1grQUE1MW1WMi9FZ1Z4MmdqVWt3MmR3U2V6SGdaQ1EwRGJs?=
 =?utf-8?B?UnBBTEJEcW9UbzdKcmpibm56WFZjL2gwcnpFbllNc0o0UTN6bzJXbzc3Vlky?=
 =?utf-8?B?RXplNCtsMHBoTGExRWlLU2NDVjRYdVI1dHVJaHVRRU42b0QvY3NUdmhhVkpo?=
 =?utf-8?B?eFZvclRCSTczdStySVpMRERqVnhMZk1jQWVuU1RaV2lSeHNFOWlCZU9NZVFz?=
 =?utf-8?B?T0hvSnV1VXBqU0EyakN0dDFVQ2RIYWRjek83SDFaeTYzVm85Mk54MHNEa2s2?=
 =?utf-8?B?cHYxb2VFM0dtRFJNbk9Fc3l2Sll4aENRNXpZQTBONnFTMU9VSjY1MXgvQ1k1?=
 =?utf-8?B?VkFjVnJEK2MxdzFueDJvYVUxSjcvMUtuemFWZlBkRWRWK0h0YW9nVmxqZU1h?=
 =?utf-8?B?Sll2bmdvQVFCcmpNbjJHbzIxUngrSTNNK05tYjdjQjZFRGsyQnRmclE2dEw3?=
 =?utf-8?B?a3QvRERoRmhDTEpoNEFKNXgxRElJTFlsZnBYQXR1VU9NRStzN0hyNnZwSzZL?=
 =?utf-8?B?TW5UVDhrTlZjcjk5Y2N2Y1hIeWtoZHFiY2tCUFF3aGhBWWc1ejBMeEVpWGo2?=
 =?utf-8?B?OVJWKzAvaVVpRHo5MmFzamJ1MUY0OHErVi9SOFljQ2IwWGplNzd1ZjMwTmFU?=
 =?utf-8?B?MGIwYWQvVWxvMitySXd6ajBkcEFmOCtoMVl3NkJ1eEVOMU1pMTV4N1dpZTV3?=
 =?utf-8?B?OGYvT1ZNNHkvalhtdGJMS0xydWZHT2paSXpJVkF5b2hrVTFGMm9wVWorZGhS?=
 =?utf-8?B?RDAzWFYvYzZIWEJ6bEw2REd5VHRiZ3p3S1ZpSGxVZmwvYVZmOWowK3FXU0tw?=
 =?utf-8?B?U0RTd3Z6UmdXNi9QTEQ3VzIrZ2V4cEdDODIrWG0wcGJaNXRZLzFvemI2WkYx?=
 =?utf-8?B?STJsaHA5Y0VOOXFBTHA4dFpFaDFUTmU1Y2RTR2pEOFdVODRBZU9HMzJiZjVm?=
 =?utf-8?B?cE0zcW56MUdOODVjMWdBSElyUHhsVlNtVkwyT0NmN3d4S3V6Vjk4MXJFMmhW?=
 =?utf-8?B?VHJiODdUM0k4RnY4eG42ajh5dFBYSmRVakloblBQSXpiblBLVXZUdTA2ck85?=
 =?utf-8?B?WTJ3cDdZb1NSYXJMUW1oOWhLV0s0NjlCUGF2RDJKQTJYMXhkaFVSaXJyQlU1?=
 =?utf-8?B?Y0xVRFhaSHdsTVpyK1NWUEhpZkFBYVViTEt5bEI5R21zbFBucTFYTEhTbXFX?=
 =?utf-8?B?cTVpWU5VL2QyWVRIcjV2VjQrZytyaFNWamp1SDdKUHFHNlppVVA3c2Vrc05V?=
 =?utf-8?B?RlczbXpGNHY4M2lZZllCL3p5cDBpaDdXT09PcGE3ZWZkalpXQTZoOUdPS2RO?=
 =?utf-8?B?aUxsclhlc2FBbnNydVBRK1pZN1ZvcGZGNzhsSE84UkhQTng1eUZyek96UnRZ?=
 =?utf-8?B?aWpXVGhtMGcrNFVsd0k0OXdzRHdsK1gxendSSm84alM4Q25HVFEvRmY5U2xD?=
 =?utf-8?B?eFViT2o0b04wZnAzN0ZCd0VBT2dLRUZCTnlSYkZUUE92cDIrdXl5WDlwenIx?=
 =?utf-8?B?emllWmtGZ0pUM3VhQUlzWEkzSm5sSXJGdFN4dktBbnNDeXo0a2IyYnAxWDhW?=
 =?utf-8?B?OXpUU0ZrUVJoUjlLeGh5ZnV4U2Q5d0JKR1JMcFhZSCtyK2wwYWpXV01RdnU1?=
 =?utf-8?B?alRWTnlMdXI4MGtpVHdMWGJtbEFiOURHNk4zdjZQRSs1dUx1NnRSYjBRaHBU?=
 =?utf-8?B?VkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ed6382b-fdf2-4fa5-f26a-08ddae0eed0b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 02:22:09.0604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M7lKssEmLEozY8ppGTU2suCDk8R5p5a1QlWP4jjAwip5R3sdgpvFrLNieEDZsm1WKLjpNFKiY4KjG2aGLlCVuC2LMq/+pHIXWvl3Xw5L28w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7354
X-Authority-Analysis: v=2.4 cv=PuiTbxM3 c=1 sm=1 tr=0 ts=685222d4 cx=c_pps a=YUS4zuHJQkVrgTdUfwMyaw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=-LCu6K_DAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=OddL1iF1gm1qf964UI4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Zf6YHxH7kkf26AVLflgOCliIsZPqWrhT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDAxOCBTYWx0ZWRfX+CtvhQ9J5VUV 0UpZy20LJx2dKm45ufn7iK7VU//1SHfelc0YxrBPzTeCXt0Z/KPITBbi9JhGZcmtXf4fUcaepLz RWMthh82sQAG2paAk9k8lgEX5V25DBHRtVfpZ7KOUt6Z/qBxIat31QP0w3yG4M/XhZESkY1tE+5
 /h9lXGcctPo5tbSk8xO6tq/iOLr4taGrLSM8YkaawPKGIXjvakhvDdMPNad2pAIwQWmAhMoTJun dr3692nbYwD5wSIRq1lltjXdW2GZFy/4cOpNtQNmKI0Ure1Iw+DfGXIeVBQEgArQv8iA5rQ9Z8e 3b7+voXmtPNGYzUPDpaAgtd90y+ZIV5aEznbU/jOB4uQ67W+m4uFxNVQTH1gCfJVFGNJLzok2i+
 viSCg27QeR4dQR0jJNvXrwrfaoKB3+Z8YsUncKfwEVHCEPsfaX8OB3Z6w3N6M7ZoA3HfLtG4
X-Proofpoint-GUID: Zf6YHxH7kkf26AVLflgOCliIsZPqWrhT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506180018
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55I1nQN1002066
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Jun 2025 02:22:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117933

Ping

//Hongxu

On 6/10/25 22:47, hongxu via lists.openembedded.org wrote:
> Fixes:
> 1. Compile failure with host gcc 11.4.0 (on ubuntu 22.04)
> $ echo 'MACHINE =3D "qemuppc64"' >> conf/local.conf
> $ bitbake nodejs
> '''
> ../deps/v8/src/execution/ppc/simulator-ppc.cc:5126:33: error: =E2=80=98=
ceilf=E2=80=99 is not a member of =E2=80=98std=E2=80=99; did you mean =E2=
=80=98ceil=E2=80=99?
>   5126 |       VECTOR_FP_ROUNDING(float, ceilf)
>        |                                 ^~~~~
> '''
>
> 2. Segment fault on qemuppc64
> $ runqemu qemuppc64 slirp nographic ext4 snapshot qemuparams=3D"-m 8192=
"
> root@qemuppc64:~# node --help
> Segmentation fault (core dumped)
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb b/meta-o=
e/recipes-devtools/nodejs/nodejs_22.16.0.bb
> index 43d9b99fd8..b29c83400a 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
> @@ -18,6 +18,7 @@ COMPATIBLE_MACHINE:mips64 =3D "(!.*mips64).*"
>   COMPATIBLE_HOST:riscv64 =3D "null"
>   COMPATIBLE_HOST:riscv32 =3D "null"
>   COMPATIBLE_HOST:powerpc =3D "null"
> +COMPATIBLE_HOST:powerpc64le =3D "null"
>  =20
>   SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
>              file://0001-Do-not-use-glob-in-deps.patch \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117871): https://lists.openembedded.org/g/openembed=
ded-devel/message/117871
> Mute This Topic: https://lists.openembedded.org/mt/113570966/3617049
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[hongxu.jia@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


