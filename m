Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA77C7115B
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 05:03:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.12452.1750655000247077418
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Jun 2025 22:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82698d78b6=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N4mKiu003654
	for <openembedded-devel@lists.openembedded.org>; Sun, 22 Jun 2025 22:03:19 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dv8mh1pu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 22 Jun 2025 22:03:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AzXTjthGG7DCN4oosGKfuIZMJ0SvS590dBSB69dfXQgjO8j/cClgg6Kq9NaxjZyD3/yNfilmDCSa85l6BPzn5ParLp7IWJLrjUC5BkW2M8s1h+to2FiP+bADM68VXhqd77E8kQLuaxv9kDWoncEMV/Z8Cg+nTh65cDDZgXZvdC31E1L3qruWzu+z89WPEIgJwCQUTmjE66DGXmgX/p4wdCGGhJHyL32QstsNsfGqsS1i3SQDN32djeiKlc8Pa5r0zueiZesvt87NOE7VXN+Td0n+iv5iFBCTnjcHu503FooM593FVa+x3tgtQlJBzWav6AfYbSsQasKhTVFbob3moA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wBFeRYoJw7Tdm58lWgUolZ1jNEn6s3jZizLueftO1CE=;
 b=Z6pAvxlX3UTvF0GtRN78jCuSvQzQoIklWHSlJWe1QpVewwzOceS0pH+Sx9SIRazvq/Af7UoDzAr0mtgajJ7P749idqAig6GJ+THUfHcPZU36DViuEIQgZtY2WFnKfvj8wXlEGCtKB3RrkOVAoLfpSfL+mNkpFYHs97FzJpXOQv6IRWihRRuQNOfgsSt6tRT8wJr/NQ96EHJm4TX/FV+b2apg1flAJoKNDy1N4vmMCZD2V6Vi6wE2DsvaCj9bF+2zd06SBSW3SjBELuT2LM3x8V1b+usIr6UI/S5v+TjlxPHWEX434b54LxkASzli98eu89oAJMCTvLXcNOnGI7m+dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SN7PR11MB7090.namprd11.prod.outlook.com (2603:10b6:806:299::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Mon, 23 Jun
 2025 05:03:15 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 05:03:15 +0000
Message-ID: <6f24e896-3d88-4258-a4b9-b3ec10705bf4@windriver.com>
Date: Mon, 23 Jun 2025 13:03:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][walnascar][PATCH] check-version-mismatch.bbclass:
 make it work for walnascar
To: openembedded-devel@lists.openembedded.org
References: <18443E332A9DC0C5.18767@lists.openembedded.org>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <18443E332A9DC0C5.18767@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::6)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SN7PR11MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: 4331375d-ebf2-4d28-b812-08ddb21342f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|4022899009|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NDdvbXE3VXM4d290SktKV28yOVVKb3RUM2V1TFNEaG8wZHY4TTBtU1A3aWll?=
 =?utf-8?B?Q3daUGtzcGlPY3ZRb2NuTFR6TmlKMVcwMWxQbTVNdFVieTdWdkJ2RDJqSmdo?=
 =?utf-8?B?WVZaRkVDakFyMUErVGpuVnNLT2dab2lqZmpXaU9ML0hHR3JzMEhrQlVkK3pk?=
 =?utf-8?B?WkRmUnQ2MHg1NkNiRjNqWW14YTdncytTcG4wa3c1UW05aitUY29EczdJd1Mw?=
 =?utf-8?B?MSt3a3RaR1hQUThGa0lETVQ1QVBLeDRDSHdhTThCWWZ6MXlYR2RNUGM4RnZN?=
 =?utf-8?B?VlFOZCtXN1Z1TnhpSTRpZHhtUi9Cd1VndmNoV0VOT296YUgrUHE2cG1UdzZ3?=
 =?utf-8?B?cEYxVXM2d3VKNjNxKzU1YWpFTUZkaEVmMkhHRitVdlYzZ3pIQ29oOWh2ZHZH?=
 =?utf-8?B?aE45eStKamNTc3ZudEhhajFjd2dWM2sxMUZMN3N3c2FpMGhNRzJsNHJCNzhz?=
 =?utf-8?B?UDgzNFgrOU5zK3hjQ0VEZWpKUmdkeHhCc1htSk9aRWtqOWM2WTFGeHZ2U2U4?=
 =?utf-8?B?Z09Ta0E2azQ3MXQ3ZVhmeVd6ZEs2S1g4amhPUFBPQ2dmb090emMwOXF1UGZw?=
 =?utf-8?B?MjVkcTFlamtmVmdvaTNmNVROc0dqaFRmVFVyU3AvL3VIZXpBYXBja2Y0cmF5?=
 =?utf-8?B?M2ZKVjVqTVZPRThyaHZ1MGhBRXlibFFOZ3dUbVVucC85K0lWbHVQREgzOFgx?=
 =?utf-8?B?NkVLckJla2pwaVNWMG1ZV2l4azBCclRLOEJxUkpZV1BaSmtWUUMvRHlRWHZF?=
 =?utf-8?B?S09jclB0TXQyb05ZaFZ2MlpTNTAxSTJ4RkpaSjZMbFVmV2E3T3o1Y2VUZDUx?=
 =?utf-8?B?OWR0eGQyQTRVMXkrV0l6aGdCZVBsdUUwZklzcmVUUlVhbUUxN1ppN2t6SkRn?=
 =?utf-8?B?YWJvSjgycVdIMWY0c0w4Z2YzTEpoOTUvNDBGZ1NlVG81a3YvZHlrRlpxVGlK?=
 =?utf-8?B?alNiYkNuZWduN3VWSDUxczdBeVRTQXgwRWR1ckFobEFRdmxQSzRtTklIcEx0?=
 =?utf-8?B?M1FaTk5qdE80Vk5jYzBMaDJGN1hBaE9rOENmdDBqQ3FjVVB3eFhkVTZEajB3?=
 =?utf-8?B?akx0b3k0SExkVzFud0xxRE5GVTFlRUpRckM5cFJUZDhoL0d3VkZZRTE2OG1R?=
 =?utf-8?B?NnRzS0JFd0tKRG9jcGJZd21Md1EzanFkV2NtSVozVnFockcrWE5kdXFRM1NR?=
 =?utf-8?B?ZkIvQnpFZWxKNFozejUyWlhCSmtpQkh3VUNieWtvQ2ZVanNDVXdCMjg2a3kw?=
 =?utf-8?B?ekdRUGhsMXBCZDRTMkh5V1pZZ1lpZ3VTRU5BUEptaVF3WTR4TEZ6RkJsb0pQ?=
 =?utf-8?B?VldtWE1ibG9YWkNaOExYaHpycmIydWNXV2NBUzE5aWh4TmlxUzlkVTFyM0ZM?=
 =?utf-8?B?ZFdhc3FwbmQ2SE93Z0RiZm9tZzNuem1laHh3NDhyZnRwMW0zQ2NZRGsycFF5?=
 =?utf-8?B?d0pyTkFnc3NtbGZvRGFVNVJSaXVYdlRRWUtTRC9lbzRLZGhPKzluamtwUWRV?=
 =?utf-8?B?RzU4VXBiVkY5a1l6T2NhSXAyR3J5S1NZYldqaHEyK0FMbGkyTXc1QlVkV2o3?=
 =?utf-8?B?ZkZXRnY1alNjQjB2NmxReGxSY1NYMUNmOFdtWlQ2MW5WQWhjNGhDQmErMUc3?=
 =?utf-8?B?Q25KWU1xRGc2clY0dVhyQkNBUGZ2ajBQMDlaUTlmc2R0SXlJWCs0QmFpNnRQ?=
 =?utf-8?B?WGpGeTAvUWVIeDdpMVFtOXpoSUJxSGRBMG1YMHVkSWw1ckVILzNiMTVTNzJP?=
 =?utf-8?B?aVJyZUdMTWJUNFVIMDBrYW1jUVpjTWN1RlV2OXZ3bUM2ZWx5c3ZRdVJ3Tjlz?=
 =?utf-8?B?TVVNQ0lsd0I5Y0NUdVpJaHQ3RVNOZm9GbVlRcG9pMS8rRWlsZUlwN0F4Nkxa?=
 =?utf-8?Q?wvXZZKvJ/HRl7?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TmgxL09Wb28xcExlL3lkTVZ5eUNGZmhrMU9USVZKVEpveHFwNTFCUjl4SCtv?=
 =?utf-8?B?K2Z1OHZja0dvS1BxaCt2SHIwV1dsOS96THhPY21VQkNmNTdqQ0lLSTZ0cnYx?=
 =?utf-8?B?QUNFYlBZazZnRTVWTUFHKzRBS3V4dit0ZHR3U0xyQm5oUCt6U1JhY1g4YW54?=
 =?utf-8?B?anVYNlVTbWk1c1VKWEYzd2tJNmViQ1B0eGd0Uzk3N1RjL1pJSjVUY0xpU1N3?=
 =?utf-8?B?NUZ2N3BtMGNmK0ZEcXBtWmd6dTRNbEg3dXpVdWtyS1paZTRBMnZiNVAwSUYx?=
 =?utf-8?B?M2xTUjd0N21UYXhuQit0YU81aU13cWhYNS82YXdyWU00a0FKSVkzaFZKU1p1?=
 =?utf-8?B?WWdIWmNwa0w4N1dKRDFsWUM3eTNFTTFscTdKT2trTXpXTmJTUXhJQTVRdGVa?=
 =?utf-8?B?OHY0TE1EOGFiZWpWUmJ4dGZYaVFsMDd3RHhoU1hmQ2trd0Y5ME13bzRteExm?=
 =?utf-8?B?WUVJbmc5SDNaN3ZBOW01SzdxSHYxTmt3ZlN2YUg1aEt1M0Zod1JGN3RieW9q?=
 =?utf-8?B?M0Z6TmNhSXBTQ00yTVlWcitQejVhU2g2TmJZcjNUTEZMVUFET1pCQkpCbE1n?=
 =?utf-8?B?SE9xK0Z6bXYyVmN4Yk9ERnJ0a29nYTBHZSsyWXNpNEp5dDlxSkRrM29rTnZ3?=
 =?utf-8?B?d3JRcThGdzhsWVNrNnBOamk4L253Rlc5dXhmRmYvWC9nbExYQ294aUFXZlp4?=
 =?utf-8?B?dFk2Q0dyaHdQVXVXc2pQSjMrSlA4ZlVoMU1zeUNNSzVtcDZ0UVg2S1gwWWRD?=
 =?utf-8?B?R1RZczJkREFlSVB5NnNpNDBjRlcwMVNqc21FU1RjSVZLQ0d2YUt5NmQxckpq?=
 =?utf-8?B?UXJYbFFpSGtwTzROZVFRMWZxbXJzMGdURkljNDQ5ckFtV1RTSVc0MmljSG1o?=
 =?utf-8?B?ckVhNlFzNGpEUFcxTXdqM2Q3M3JuV0EzM1Fjd2JkTXZkMjRZL01UcFNFVURn?=
 =?utf-8?B?REk0bTIyOXZwNGNuSzhzQTFRczF0MHF2QTNndlNtZkMva0JLVWNuR3piQzZI?=
 =?utf-8?B?LzBiQW5VM1ZjTGw3MDBCRWM3SGlKOXVSNENPYzJxNlJhSTNkbERIdjArWTBK?=
 =?utf-8?B?dU9ZcStpQVdkTG9paHV4U21oMytvZVIzS0hhTmFTL0pvM25PRkExcWE0N0hO?=
 =?utf-8?B?SnRjM0J2emlZY1pHaWc4UWNreVA3dkZhZFVyQk1ad2hCVjlYYUVyY1FDOGh6?=
 =?utf-8?B?WGFDM3hCK3hHUFJTb05UWkZldWtEYkRIMUd0Rm4weGd6Yy93TmJtcDR3WTlv?=
 =?utf-8?B?MXdXZ1VMSFlqbStRZ2VWRTc1MmtmY1M5dnBUQnNXWnpyWnI2K01tRG9zWGRM?=
 =?utf-8?B?NzBQUUkrRXJxNmpkMS9Qb09UVUI1azN2UjJ5VVZBd2hSMFM0RmF0WnJQakRC?=
 =?utf-8?B?OFcxUWtxLytJNnBuejdSSk93MUVPMks3bWlBa0EyVkVXV1FiSkx4emZjQzBm?=
 =?utf-8?B?cUxRWk1yeG1KT0lMcjRIYkt0VXpyQUlVNVpOYTZWdktobkJCZkk5aVg3ZGhp?=
 =?utf-8?B?bloyWjdQckhMc25NeUpwaFMwalBMcHJmY2w2QlBGSEpZVElzNGFWTjNKTnRj?=
 =?utf-8?B?Y2pGY1BwekYydENKRk82aW1xd2JZWUxrdW81c3hIeHdSKzRFMStuWURoZWlB?=
 =?utf-8?B?cEh3VnFjWU83c2F6TzQvZk5nNERaY0liOG8rUVptMDJSSGdVV056Z2lJMkNs?=
 =?utf-8?B?WElIZU5FNVJ6SlhhZTJ6VlZHck1DcGR1WS9na28ybEx5QjdvdGFpemZVdUZl?=
 =?utf-8?B?NkdXYnVZWUt6bFphekRRVlB4MDdSb3hCSVlkTW1FRW1GUWhLWUE2aVBTVStw?=
 =?utf-8?B?ZHFUTWhhNWFRRHA5UllyTXRkVE5VUldDbXVXYWp2U0FZMUN1QUlkK1ovaFZM?=
 =?utf-8?B?SmxnMXdPbEl5NzROdnhVejJZYjV5R25VS0l2L3JEWFhoWHF4c2NoRER1Nkhy?=
 =?utf-8?B?WlJXWWFMOXZ3SG9EOWVWSVpER0lhL1lpb0M0bXA4TGh4ai9RQWw3MHkxWEZD?=
 =?utf-8?B?OGxqZkZ3K3IyNXRiajdCcVN4S0tkUFlxbzhkWHNCMnFPb0E0TWk4a3l0bDZk?=
 =?utf-8?B?WWpSd3NkR2NtUDJNR1NYTlBSdnl1eEdsT3V4clNlSkJRL1hwakpmZzFIN1Vx?=
 =?utf-8?Q?jRg8IxAAY73O3dpHf7zjvq0zM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4331375d-ebf2-4d28-b812-08ddb21342f1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 05:03:15.6325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u2cb+UCClgjuxLfpjNu7Xknl6TjEZPpy/jBqz3j+Q/PzUx9w7fcdZXNLJA7pUI0fNLlBK4HfcRxaaoGd0Glgsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7090
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDAyNyBTYWx0ZWRfX31UacNabblKr oSviNhcU3fo+cACAwiOElDU7ZqcT3Et01z0T9X+iskzFFhnkMksYg8dYc5M7mi4aVWQwirxB1J/ 6Hdok0LLQBXxBgojGa4BjgPUxsY215lKqrGEz/UoxFiJ1KS2KxACOk1mhsJ2GTvWGKbkXNgfCTq
 ebxy54odCHCs6bsG/iCF0wl5tSYZqy48y9fPppmkmUwpPiSneKwhEzQovhvziO7yFRubdhAzljR Qoy8nEv/hy+u3rUhXrvrmCaA270Y+Jvun+Q4MF9S5HfGI8DL6unZOnlBc50nFCb5nRXnFmBTsvJ S/6FRgmbiqshOGVXbZmEHcUfZ0c/s2KoD9pV8H0lUFoU6ZRUHHB6jfys8bX8URJOVq37WeTFnhq
 5QZTSmV8CQz5Zdsjaq9v9uL008RssKY/gAhEE10rdi4xaZcvHnokm6ZOIyY8CmIjgVNZBriW
X-Authority-Analysis: v=2.4 cv=MeNsu4/f c=1 sm=1 tr=0 ts=6858e016 cx=c_pps a=6kUXyxSL3GSgDGyJuzBerg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=eZSIFIZ1ktLbA80_KFQA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: TssK41jdTQyrkjlrcjpyK32rf9X9oN46
X-Proofpoint-ORIG-GUID: TssK41jdTQyrkjlrcjpyK32rf9X9oN46
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_01,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=886 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506230027
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 05:03:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118027

ping for walnascar branch

Regards,
Qi

On 5/30/25 15:42, Chen Qi via lists.openembedded.org wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> The oe-core master has qemu.bbclass refactoring, but walnascar does
> not. So we will need to copy all the needed functions and settings
> from qemu.bbclass here to make things work.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   .../classes/check-version-mismatch.bbclass    | 33 ++++++++++++++++++-
>   1 file changed, 32 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/classes/check-version-mismatch.bbclass b/meta-oe/classes/check-version-mismatch.bbclass
> index 7b46151b03..c023d3c71d 100644
> --- a/meta-oe/classes/check-version-mismatch.bbclass
> +++ b/meta-oe/classes/check-version-mismatch.bbclass
> @@ -1,4 +1,35 @@
> -inherit qemu
> +def qemu_target_binary(data):
> +    package_arch = data.getVar("PACKAGE_ARCH")
> +    qemu_target_binary = (data.getVar("QEMU_TARGET_BINARY_%s" % package_arch) or "")
> +    if qemu_target_binary:
> +        return qemu_target_binary
> +
> +    target_arch = data.getVar("TARGET_ARCH")
> +    if target_arch in ("i486", "i586", "i686"):
> +        target_arch = "i386"
> +    elif target_arch == "powerpc":
> +        target_arch = "ppc"
> +    elif target_arch == "powerpc64":
> +        target_arch = "ppc64"
> +    elif target_arch == "powerpc64le":
> +        target_arch = "ppc64le"
> +
> +    return "qemu-" + target_arch
> +
> +def qemu_wrapper_cmdline(data, rootfs_path, library_paths):
> +    import string
> +
> +    qemu_binary = qemu_target_binary(data)
> +    if qemu_binary == "qemu-allarch":
> +        qemu_binary = "qemuwrapper"
> +
> +    qemu_options = data.getVar("QEMU_OPTIONS") or ""
> +
> +    return "PSEUDO_UNLOAD=1 " + qemu_binary + " " + qemu_options + " -L " + rootfs_path\
> +            + " -E LD_LIBRARY_PATH=" + ":".join(library_paths) + " "
> +
> +QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS:tune-%s" % d.getVar('TUNE_PKGARCH')) or ""}"
> +QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS:tune-${TUNE_PKGARCH}"
>   
>   ENABLE_VERSION_MISMATCH_CHECK ?= "${@'1' if bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', True, False, d) else '0'}"
>   DEBUG_VERSION_MISMATCH_CHECK ?= "1"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117671): https://lists.openembedded.org/g/openembedded-devel/message/117671
> Mute This Topic: https://lists.openembedded.org/mt/113375864/3618072
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [Qi.Chen@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


