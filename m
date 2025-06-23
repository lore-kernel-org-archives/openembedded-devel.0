Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9970EC7115B
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 09:18:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.15577.1750670302316711656
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 02:18:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82698d78b6=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N4PIdF002542
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 02:18:22 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dv8mh8qt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 02:18:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DZvC1xyxlo7jq2t+idYBlNToe7QhoRH6PFAV55OH7bGv+e+NcwIzAxZTF2cvwKNIPbJBdJlEEo5hptv9OWZI+6wy24Q5iVrPU1aS9TsdupsKSzJsuvLXg6cBYqIFs/IicCALC6GkEZ0y7Fj4tYP2jvpFJIUS0NUUsdpVp6qhJyMt2NiUDI8ZNjxaH9J3wy0ZhQSDlL4Vy1KI7i5tJAcff9csqhp9qrlHrt0hXi2pVU6BNWTj3GhR7qPE6F8MRb07sx4q9ZH4c3MgKyhH1f+w6QnsdWGWl5vJrKXaTBVmEQvUO7rgQR1z4jcVFyKdzS5A11+2n82TBIAqaRwcTreHrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bA9G+eijXxrJlQmOLq5fy8OTwTeZilQHmgeoKTYZMg0=;
 b=QJbsY4qT70K+PuK/dntIbud9W9m08VQRjhLGE4n5ySABiFQQZYChOX1PHI/T2kVquR4HMg9vBtTJPfsLk2JO7mhCbM+WAls4wZ1HCcbiQZBueKXfq41LAtRy4sfOGYHqMn52EOlQOaFAA6Cj4e7tob10blx2juBmj9TLfroWf6Cyc8B4ViXuuEhkY7lrHwych+YmsHHVx1MeXduDZbZaa2yBw3ffzwkbpkBHzdGhGjINwS8XXPByEj7Wq9KgvMHuH1CP/krRyIM5CwmkDfVepLk0QcAEbJ2Vndy3ZI+Ye3UWdfVoPgBn3icxxsBy9nlR2ESrZ4Cda8d4kwlALUs5RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA1PR11MB7061.namprd11.prod.outlook.com (2603:10b6:806:2ba::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 23 Jun
 2025 09:18:19 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 09:18:19 +0000
Message-ID: <c4987087-78dc-48a5-a322-ef5c14ff731d@windriver.com>
Date: Mon, 23 Jun 2025 17:18:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] influxdb: Use GO_SRCURI_DESTSUFFIX in SRC_URI
To: openembedded-devel@lists.openembedded.org
References: <20250623091243.2256836-1-christli@axis.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20250623091243.2256836-1-christli@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0057.jpnprd01.prod.outlook.com
 (2603:1096:405:2::21) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA1PR11MB7061:EE_
X-MS-Office365-Filtering-Correlation-Id: 90a8ed8d-201c-4fbf-037c-08ddb236e472
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|4022899009|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N1gvWlRaODNKVFpnZTlSV0VIaHhidEdqODMwMEk5NTJZaDVRd3EreDFvUFJT?=
 =?utf-8?B?ZkNQOHhiaThGKzBrVzM1aUo4Q1pkNDZWZkZKcG9ZeWVlZG5DOWdKS3p6UlZu?=
 =?utf-8?B?NzBQdWVWbDhVcVJVclJjSU9uVFBYeFFHV0N5Q3AwcmJKNDU1L2ZubEs3b0lI?=
 =?utf-8?B?OENsNnJpM3M3OU9udU41KzMxWTUwalZodVRRc2JKc0dJNDZEYU5ZaTVlZ2NT?=
 =?utf-8?B?MERsMkNUWElsVnc1VnRzRGNwNDlKS3I2OGpDTnhjZXJPNEJYWVJDMkl5YWoz?=
 =?utf-8?B?ZkFTYThzNXJYbFNYVXFrSlZwM1BUdXRVdGJidUpvckZWNWJEQzNGTWI0RnAr?=
 =?utf-8?B?RUJJeitvU2VMUVF4RGhMS1RpN25RaWVGK1RJMjBPQkZNZFBIeEtrWDN5U3M2?=
 =?utf-8?B?NVRuWC8yUllZdkZTN0NqTW15ZExJbjd2cWVqQUx2R3UyRTczald4Qm9yS1l3?=
 =?utf-8?B?bnFocTVPbS90MXlGd1E4RmgxR21RcUVsM1B4U3hUOXQ3UzhQc3dhNUhrTUg3?=
 =?utf-8?B?N2ZlcCtxalBSYXBuc1h1VkNoLzVOQ1N6UUV4SXFIbGFrd3djY2V3a1dsWjBH?=
 =?utf-8?B?T3RuSEpNL2t5YmlVU0RaNWtRZHY1VGtuV2pSNVZlc1E3dE5hdUVta2tLcHl0?=
 =?utf-8?B?SkRCeHRsK1dMLzVBaFVqVExNY1cvSVZXU016VFZTTyt0L0FFMHdoSkhnazdr?=
 =?utf-8?B?STVLQ1BmeGNnVFZNOUMyRHZEZVZCUyszRmFVWjBvMWJYd1N6WE5lbEZLRGJ3?=
 =?utf-8?B?bHlvb1pHREhWVVA2ZEo2MlhocnR2SmMvSCsxbXlKWGROYmhEN0VCTTdRU2Zv?=
 =?utf-8?B?by9OM0FuRU5GTFF2VDh3MTA1UTFOdGNCUk5DTHpCeTRHQ21DUm5kUGJsQi92?=
 =?utf-8?B?YjcveDY2QktYdUEyTEFySFk0Z21zTHcyK0l1TGd0UUdWTFlvYnVheVRsNDNN?=
 =?utf-8?B?cS9LS25Lb0Niajd6b0wxaDB2QlJWY2E5WE9SOGtEMFNRM1lXM28zYk0wQ2hh?=
 =?utf-8?B?a3hHWXlmTGovZEZYYk5CZzZZR3FneTc2QlJpZyttbU9UN2IzZm4wTHV2SEwz?=
 =?utf-8?B?Ti9UU0cxQ29zS3BseEx2Vm5WM1g1cVVrMXBhcXlvL1R0aUNVdTJaR3dkempp?=
 =?utf-8?B?UGRNTDJLNjdCMmF5UlpoK3V3LzFZb0xMUms2cE1OSmRiSW5pNFM2S2RveVF5?=
 =?utf-8?B?NG8zblBIY2c3RkZBMGNmS0JjYitIdWZrRXFHK2haUVZBRXc2VEx5V29WejU4?=
 =?utf-8?B?ZDN3UWFreGdKcTdzbFN4eW8yZTNUclkzUjh2b2R5cUF3QWErc3YvUzZick4w?=
 =?utf-8?B?eFhvYzBoNGZ5YWdkdllEaFdLS0p3RHc1TE5jNjB2TVhKaUNCUlplb3pGNklM?=
 =?utf-8?B?MnE1MGk0dnlDdWFtUklqMit1UjFTemFqVW81UXZQZThYL2N5dTRUQVpTenlV?=
 =?utf-8?B?WURaZTFIancyMlEveWNMdlltSWZsMXFGR3NkWmRwdjBCWDVOSzREWThrMWg5?=
 =?utf-8?B?MlFBTFYraFZOV29ZOSt1QmREZFc1MCt1M0lkMk9DeUthekU4VWs4a3BQd0hF?=
 =?utf-8?B?eFc5b2NmMllTY3NzQzdTWVJqQjhaQkN2czlxMzZ3MjRCVlZmL0doTjh2a2hB?=
 =?utf-8?B?TG5GUU8yTTI5M1BIeVVwT2l0R2tkTTh5emVDSllrcDFQRGlzSngrcXJYdzFK?=
 =?utf-8?B?ci9wSzdFTkFPVWxmVTMxYSt2d2lHbHhHR1Z2dXp6UEdIVDlKR080d2c3YUhL?=
 =?utf-8?B?dFJuTkJmV1MrQ3ZvVW9WdmVJMU5vS0pTRFN6SWpVS1JDamVlWDJENnBCZkU4?=
 =?utf-8?B?Nm41WTlHSGR0K3hqMmtHT20yU09GbEdTdGIxYzRMYTZUYzlQTUhMU2pKWWVP?=
 =?utf-8?Q?C6oBxpc/Jx/OF?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eDZQNHdtL0FZNnprcVFiM000TjJPRTdhZU8rWVFsd0F4bnh0cWJPU0FGQ2Yr?=
 =?utf-8?B?Mkx5dGJqYStBbmwya3pIWGNYV1pqUzRId2lpRVFja3ZMMjQwVzFYZE1KN2hr?=
 =?utf-8?B?cC9xVEZ5UmdvVGJ0aWhnYjUzRWJyZDFBelJ2Vm1ST0RKbk82OUU4Mm1WdWRs?=
 =?utf-8?B?R3dDREwzcGFmTnliYkRwelAwNmVhbUduUUpPZm0xbUxqTE9pVGcxLzZuN0RJ?=
 =?utf-8?B?Tlc4c2FMNzRVYzNXM0hVcFd6Ulg4b1VINUZ1TmhVMm5mU3ZBY0tKaHdNM0tE?=
 =?utf-8?B?WUI4RkhFajExVkdRbysvMzBjZitnNHR2NVlEcXA1a0hSQWtQWUpoY21JeDA0?=
 =?utf-8?B?RWVsMDdQNFE0NVFCUjYwYWFYWENNc0ViV1N2NkZta0JtbENXd3dvWnRjdjlU?=
 =?utf-8?B?M09TTFRSci9lL0FvK1JzNEtZbTd3UHJhZGhJN2JlNGdlRXJkaFRnbXQwOWtw?=
 =?utf-8?B?OG13VzRqTzd4bnduc1QzeVlMNFc3RDQvSDdtUzh4RjVXMDFVM0czTThZSVpv?=
 =?utf-8?B?MzB1T05uUUREMHE1Mlh1bURzdHBOZjB0ZUVGbG1ZV1pxbXBrczVwWnQ4WDhl?=
 =?utf-8?B?RUhmVSs0MjMrZmhoZ1N6Ry84cGFkRFJXVExTTG1heStSM29vdlpnNExYZ2xN?=
 =?utf-8?B?bTJxQXRXcjFYZHpxVWVLSjhndXlFcmJ0cGV0d2pWaVdSS09PdHRHYUFFNm4v?=
 =?utf-8?B?MEpGL0xvUjdjUEcxWDMzQjQ3V0JuQ05USGJNNkFrYm5iUFFEUmptZHZyOXpt?=
 =?utf-8?B?bi8zZDk5TFFISUFlMFk5c0c1T3hITkZTWHlWVHBlODBIcjFjOVcyTHloNVNk?=
 =?utf-8?B?bkp1Q0g2bXl5Nkw0WnNQQTdvQjRQZkE5L2RaY29seTU1cThmcmdSMmsyNHBW?=
 =?utf-8?B?Um1KQWhqbWVzc3VzZ0pneUEweWlHZEt3NkNJdzZtRTJQUncyWGd3MEZQeHhS?=
 =?utf-8?B?Y0U2SU02bFVxMUlKTHVNTWJNVURuNnZDU3EzMjFhZHMxaWNVZUxXc1dPVkNW?=
 =?utf-8?B?L0ZXZXNOWjBqY0RFNDd3Vy9ZOWprQU4zaC9KUitSYUdXeWxOTlZLYVkrSnhi?=
 =?utf-8?B?R2lubHlKdnprNXVrV09KQ3Ayd0drMEZTK0ZIQmxGdE9NTXVlZ0xSTFhqZlRQ?=
 =?utf-8?B?bFNoRmNuSWpKWGxGYXJXZXY3ZmRXUEN5Zm5UMk9FRFBucGFEMnhBeUVGZ0Vx?=
 =?utf-8?B?aWY2UkhMcjVoV2tTdCtYTVFlclhqUVVqKzZ5eUhTTmVLeWxpaGxIejRPM2N5?=
 =?utf-8?B?UFBqTE5zZVMwRzFhRExNSklxU0VRSGwzdDB1SXhJWWc2QzVPVWUrRldNMnN5?=
 =?utf-8?B?U0pwZVNYYStPaHcrb2N4ZnFteXJhRFluUmQxRVFSRTNKeG95MHByaG5scGNv?=
 =?utf-8?B?UDFkYiswdm42MjhCVzNyUHkzbGJRMzZQYjZEN0RxcHVHT213alVYNndoRjQ1?=
 =?utf-8?B?NEI3d0Y3Q1dlTDJYWkhOL3pVVUhNVUhvSHlGTjNUTWs2ZElieklMTU1vdVdY?=
 =?utf-8?B?WENtWm1ZWjZDeGwxeTRYYjRERkRNbFhyYkZIQTJKSTlndnEvV2Y0OElqMUxr?=
 =?utf-8?B?T3NHeEVGMlloUXZnV3JIOHFSZG1FZTVUeUJqWEVvd1ViSWs2MWpTSWNZQ1Yy?=
 =?utf-8?B?c095OEJobkEvYTdOTjYvSnN3WWk3QXlKSDgyY1BNeU05ejdmaGQ0QkhvZGoz?=
 =?utf-8?B?SUhmOGRNN0lvdXJEWlJwRDNNQkdVWFMwNUU2Qko5TFZmK2xHckRNdmIzY3hT?=
 =?utf-8?B?ZFYxNU1zbXEzUU5PdGpUbHBabUtjSm9GcjFtSVVjSzdCWTJvNlNLTjRHK2NN?=
 =?utf-8?B?cWJORmJnKzFPQ3VVLzh4bklvV1VpNDB0VnVMU1Qxdllrb01WVEkrci9mK25k?=
 =?utf-8?B?eXQ3MVBZY2FNYlE5Q3lleUNHUTdKakt6TTFadE9FVmNtZTEveThvVU1SWGZX?=
 =?utf-8?B?SzU3ZDZBYjZqM1M4YVhXUVRrNzdkTEF0N2RlQVd5UjRuQTFqWlRrR2g2WGJF?=
 =?utf-8?B?MXNtbUN1ZGIwbUcxOVVaOGFlQTRLUXF2T1kweDArTUR0SEFwV21DMFFVb0hU?=
 =?utf-8?B?elByb3hjQitHM1lqUUpVNi9pbjZDNHR0d0NvMExISndhNjU3aksrekFaYytk?=
 =?utf-8?Q?0uTPSsTHebzBnXNYVjAoAcvl7?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90a8ed8d-201c-4fbf-037c-08ddb236e472
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 09:18:18.9774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+iH0d0FIVn/3/cZzYl9Pj1tAmgVsF3oFPkCctePI+9ZzQDTm/lohG3Izhst90f1cVbfFEVWEJI5KSBrnzKOPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7061
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA1NCBTYWx0ZWRfXwR/KPrSlcg/e 9adx2jwXrxv85k4GnKpuhM7PL3tIe63vgD2KHgZKqgKEM6/599L3ICDHYAdBidgHNx2gzNwmZ7E xpqRYJmtD+wvsI+/cjxH7HbA5kY36OAbfOUGVpTxeiiQPOldtzk+HaCauh0L2FJFO12joBvhwFi
 IMu8DOfW70t8v+qf1w5BBFHCSoiv79XvhRCbRTXjidRXbx7MlMoUlMtmdSomkw+3mS0RLgflDus cpMJegGys6LMoK5lzLlM4UbkrdSWWCDaKQa6wVTpfFUP9yhtgMHaN7fTbIMP1MOShwjJcSqS3WD E9iX2ntZNGWllgpSl2wZW0S7NJKrILLCXT4wiNWTOj+2eJ4bKUUYagzlvvshmYsOgqPhDW0Khf/
 EWDqFIdfdhrH4oVCttdHpI0VeelzdPaQLGmb6mLu5c8LANQI0Rkkd0zu24j95QThKriDBS/M
X-Authority-Analysis: v=2.4 cv=MeNsu4/f c=1 sm=1 tr=0 ts=68591bdd cx=c_pps a=e+cqt0niYsBDK9swwqJcCg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=iYDA69_llT2MONy12lYA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Kqxchkf-slJptypTG1lwmJZ-Yuz8ZBF2
X-Proofpoint-ORIG-GUID: Kqxchkf-slJptypTG1lwmJZ-Yuz8ZBF2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1011
 mlxscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=765 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506230054
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 09:18:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118067

On 6/23/25 17:12, Christian Lindeberg via lists.openembedded.org wrote:
> Use the GO_SRCURI_DESTSUFFIX convenience variable for the Go main module
> in the SRC_URI variable.
>
> Change-Id: Id7a1f476c880b92b6e1eab057a9fc22875f0114c

Where does this Change-Id come from?

Regards,
Qi

> ---
>   meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
> index cc305f6e8d..5dd5644c4c 100644
> --- a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
> +++ b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=f39a8d10930fb37bd59adabb
>   require ${BPN}-licenses.inc
>   
>   SRC_URI = "\
> -    git://${GO_IMPORT};protocol=https;branch=1.8;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/src/${GO_IMPORT} \
> +    git://${GO_IMPORT};protocol=https;branch=1.8;destsuffix=${GO_SRCURI_DESTSUFFIX} \
>       file://0001-Use-v2.1.2-xxhash-to-fix-build-with-go-1.17.patch;patchdir=src/${GO_IMPORT} \
>       file://0001-patch-term-module-for-mips-ispeed-ospeed-termios-abs.patch;patchdir=src/${GO_IMPORT} \
>       file://influxdb \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118066): https://lists.openembedded.org/g/openembedded-devel/message/118066
> Mute This Topic: https://lists.openembedded.org/mt/113785094/7304865
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


