Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56463CF259D
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 06:42:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.48554.1728888153543829294
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Oct 2024 23:42:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=00176287e7=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49E4r7rP007072
	for <openembedded-devel@lists.openembedded.org>; Sun, 13 Oct 2024 23:42:33 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 428jvmgcth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 13 Oct 2024 23:42:32 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49E6cl7Y028741
	for <openembedded-devel@lists.openembedded.org>; Sun, 13 Oct 2024 23:42:32 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 428jvmgctf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 13 Oct 2024 23:42:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VkQ8vW7OG3ATWwY8WkBXJmMZ73AhPgDXDuMnWJzNfwr/vIcg1qRlod+lxdGQIVtdHtTjJdGmuflL2IjtQ3CMcx7nWTtsCLxDMWTanC8tfFqcdYA/6UOWyeUZM+XT53y13HKMWtzErHmfdF49Qk0wzvyjIoFH/kONBZuBjEWjh+3+7tR8rZMD7RJjHwKjngsmZjpXbwk/JurAneVXWRFyWQMscX4ReicxTFFC5imTV3D0TciZNpGNd7/SBo0Jp9zw+0vo9BYsH1ZUzKJIzQ2QW0Hwu13B9id0j0KO456x57uHppt+1LyWNr2E5ovm/dHhhen2Ed6K6L1gZQVOs+9OSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TN0n/VgY4Ar3VKijsj9skHgF3UtFb6HP79A2xJYgpDY=;
 b=gtHy+Jsaup3ZOYdh8bBKZK/7vopmoaRBXP+zcrAJJiokUork8lZJ+FvwrBWoPhbebWqTJIE9i+hyZIa+kuDOTGQ/D/1QnkcmARauiOrZ477g2vq8orUg4VKrklyRZYlpSIdorEtTqs0K6ANPcsojTbol4CMO/cL7od9OuZoNvLMNLf9gxjrUofY5mO2r0+xCf8ODc2FQpV2cczsv1D75D/GGxvEQc8mgVubucZu8MnrS8aKJky0KPK9S9q/pP6vD0g6siC/3WDNF8EeANjTN6z8s/0GXM1Jw6Iky9TsgSkrv5kMo/KYMT943MJnRgcSlyL8UPOh9+R2SD4lFKwFj0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CH2PR11MB8867.namprd11.prod.outlook.com (2603:10b6:610:285::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 06:42:27 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976%6]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 06:42:26 +0000
Message-ID: <089ac659-e30e-4889-94a7-ac4269c92db7@windriver.com>
Date: Mon, 14 Oct 2024 14:42:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 2/3] tomlplusplus: Add ptest support
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: mingli.yu@eng.windriver.com, openembedded-devel@lists.openembedded.org
References: <20241012100147.618578-1-mingli.yu@windriver.com>
 <20241012100147.618578-2-mingli.yu@windriver.com>
 <CAMKF1sp_GqfxcDnExPfi+sh6PuyrZoQpOrf48mYqfiC_sjr61Q@mail.gmail.com>
 <5fa70fce-33a6-477d-a988-0e4063e5d0e1@windriver.com>
 <CAMKF1soKVFA=z9HG6AkKO9wudOTjUCXFgry46EtRkwFdsQkufA@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <CAMKF1soKVFA=z9HG6AkKO9wudOTjUCXFgry46EtRkwFdsQkufA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP301CA0070.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::12) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|CH2PR11MB8867:EE_
X-MS-Office365-Filtering-Correlation-Id: bb1b7a7c-d5d5-4fcc-9f8b-08dcec1b5e22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|4022899009|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dFFxNHFVUDFPWThPOGVEMHdtNHdIZlZidHAwbDJ5eHJkU2k4NHBMZUNFamVy?=
 =?utf-8?B?dko3Mi9TUDRmM0FGOFNNSnM2TTRQVnZvaDNrRVBmanViYmtNNFdJc2NWQzFP?=
 =?utf-8?B?a3hBQ1JSS0xFWHB0SEJ6dnlkMFdqd1Jzd25POEJ0ZzJCcDUzZmpuSW92R3JR?=
 =?utf-8?B?dFFFaVBPQi9UZkY4VlNwMzRpcEVwenVNdXhSZE83b3pXR21EYVVqQTNpR0xP?=
 =?utf-8?B?N3BHTm5vVm1hV3lnZXlzdnA0bHlCMVFZbFhwdzY2dGtwaFczeTVTRlV4Tkwy?=
 =?utf-8?B?eTMzMDVJTHA5WUorNEVvV1I4ZFJqYlUrQUU0dDE0TEdYeDFWLzJHRm9neEdX?=
 =?utf-8?B?Y0FYSFBGVkg2RWV3Zi9BQWFTdzZjS2xub05haFRTMEZRbTYzM3RoZHFZaXQ2?=
 =?utf-8?B?Sy8yM3J3VEh3OFNHa1lydzN1TzVXcmNYeTIxU2JYTUY4RC9JSGpwdkMzU2Ri?=
 =?utf-8?B?Ly90NDlsYUwxdDFhMllXakxRWSs1d2pobnEzaGRDRmIxR2RKVWdQcW1BRTVZ?=
 =?utf-8?B?OFVyYUZ6RFVnS0NiKzdIZ0VKSnNJS2g2eFJvcVNGWDNoZ3FLdUN3eCs3VnZw?=
 =?utf-8?B?UnhLZVo1NFNzMmZsY1NIaThwMXVOcDgxR21OcUJRZFVCTHJEMjQxbzR5YzZ2?=
 =?utf-8?B?VzJUdXJWeFpSSTNrNWd4SWNiWlF0alB3WnpHaDhDY3o1dHdCM2NZL1pXbHg3?=
 =?utf-8?B?M2ZXMkVWY2s3MmxaWjNxSUtFSWxaV2hjT24wMzU4VmRyS3RVdHNFQ0tpSGYz?=
 =?utf-8?B?TTM3TnVPb0tiZmFnc0prZ0JhK2pHNUUzSU9rWjlBSkhzMXBRWERlZGRDQ2JY?=
 =?utf-8?B?enJwa2MxNTNnUUlHWURidzI5RURIamVsUVBQNTN0bkZwMldvZnBFMEtNTHdN?=
 =?utf-8?B?dXNuSm1rQWtJNVVkSUtpS0EvTDNYOTZaSWNkRFlLeDNSQ0dxL0V3Rm1Rcktt?=
 =?utf-8?B?WjBsUGJqdjF3a0ZwUEs3Yzd3Z2VZdmZzemJIRkZyNjBYcDJzUGpUYnY3M2lH?=
 =?utf-8?B?b3RWb2s5dzFVUFNpcWRWSDU1RFhPSklLM3UrTldrOUlUUVBPSHpDMXRBM0dM?=
 =?utf-8?B?dkVNSEgwdzhTdzVrY3hZNEUzMUVVWWwzRWVMOWphaTljdFJieTNiYXJlZ01U?=
 =?utf-8?B?Y0I5WC9IT1hOK3pwdEE3bTZyYXVlMFY2Z3NubVhjeWcwTy81aDlzVWI1VDEv?=
 =?utf-8?B?MVBacWxLN21KMEN6NUppOW4vcmxSaExMMWtGZWZ2NDQ1QVpjL0paR1NqOUZK?=
 =?utf-8?B?dEUwUVdoemRMTzRzYUxRdnhlcDFUbC9qc0taREN4c2I5cjRNU2ZMSVNlRXNk?=
 =?utf-8?B?dVhOZUN2cm1LRkV2MGNmaVd3QzNOMTd6NnF5WWJWMGZNTmprMnlxekhLWGJM?=
 =?utf-8?B?ek5pTEU1ajdBbm84alpiVm0ycnplcGI5dTlQWXFBTkdpMGU4Wkg3Zk1TZ2tv?=
 =?utf-8?B?QUN4Vjd4RWU3Rmd3ZHJsRE1yeURVOGNQdnFQeVdhYUpCVzRRbmUyQzZ1RUVJ?=
 =?utf-8?B?NkQwbEVDNkwvbkJYdlVDQkZEMUw4MmZEbUhqWkQwODQ4eHVMSWF0aS9ERTBK?=
 =?utf-8?B?czk4b1grRTJhZFIzcXdSbTJjVVF4YVU2TmxiUW5URW5UNVcvOWtLdzg4dzNy?=
 =?utf-8?Q?vDyFxdldPNN8+SgAB9JfJJwYlcbjLByzd39EGV5KZTZo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZlpwVGVacWg3Y09ZOGROOGo1RU9TbHFQdy82Mm1uU3lsVjNxRTFjQ3FTOHdV?=
 =?utf-8?B?RFd4MU5ReFFxcVFyVjVLc3AyZUdvN1ByeFJLUTM5K0JuVncrUm9xZGFmdWpN?=
 =?utf-8?B?YUswUVpDaExCdEdFdkY1dHB0N09nTTIvWFVIbXV6VXh6eStTbHlYR0Rxc0Fh?=
 =?utf-8?B?YWlSTlMwNGpNNXZ4RHRueVRXSGdtVVBQS29BaGRWTlFqT3dndWUzYzFDVTQ3?=
 =?utf-8?B?TXRnNWllNzFjUDR4RCsvYWgzWk9veEJTQ1NvaVlpZFJjcFpMU0xMR2dtaTZ0?=
 =?utf-8?B?SG1MVFZLWTQ3N3UwdFUyV0ZwT0tVaFFGcHViWlJIQjZuVTBwM25TQkU5bmNx?=
 =?utf-8?B?Y2R6MDJlY3FrVTFQdENwdFRkcVBSVEIzaUNkZWluY21STGFWcW1xdTk1RTF0?=
 =?utf-8?B?UUJkQ09yUm1sV2dUY2RFdGNna0xFbUNGOTYvdVBnMllDODdTcDVKbHdzNjk3?=
 =?utf-8?B?TUR1S2lqamFFeTZDeGxrdWtoSDJ4eWtOWTM4K2lhUTBHK01PcEFkbGxIeU5P?=
 =?utf-8?B?eWdzTjdMRExtNUpvVmh1SExyQk8xMWs3ZHNYU0NOMG02bk1rZ0RVcTNoQ3Ja?=
 =?utf-8?B?ZXpBTmhmSTJTSkJLV1cvTTRIbmI4d1hDd3pXVTZUblc5a2VCT2xpUTJ4OThZ?=
 =?utf-8?B?cTJZWVg3bUF5OG1OYXlCdHJhcmRraC9RSVJGc2MvNXVBSmtqdUhZcE5naWox?=
 =?utf-8?B?YU9ya05KL08wZTNiM1FJcSt5dUVoTTYzSGF0R1cyajRhSW04Vkg3ZmdIRDZo?=
 =?utf-8?B?NEVYTVdUSHphSjI4WGpyL0ttTnk2UFdtaWNIb0VuUzVCMHdTRlNFZ3NFNDJ3?=
 =?utf-8?B?SzljMDdJRi9DWm40TFRIREg0YzVtbjczWjBMTS8veUNwMFpNZlN2Ynh2NUhq?=
 =?utf-8?B?blN2MVM4VDVKcG4xU1o3SFE2K20wajBpSkQ2VE1RRkxBWUgvZ0ZZTmxMM2JJ?=
 =?utf-8?B?aG5VNm0vLzhVVEN5bEExcTMvaGhXOU1LR3o1SllVN2s2aUlVelhjZURSZVdR?=
 =?utf-8?B?enhNbG1OS2lsWUtRVmRBSFFYdVRaNTVSME82N1IwYW44eVNTekw5TkxYS2Nl?=
 =?utf-8?B?eUFBUUZITlExYUVrM2s3M2ROTm90VEY2dUwxa2ZXMDNFb2c0YytqOUh1TGt0?=
 =?utf-8?B?WkZ0SnNqWXpuUnpqNE5SZXJOY0lOL2VUZUIvNURZYW1PS2Ixck44YXpvL1ZL?=
 =?utf-8?B?aE05TjErbEVsazlUOEVsS1p1M0haK3NrbWtzNjlEZ1dadWhPejltZ3BMbmhZ?=
 =?utf-8?B?OUVxeTRxRUpGNlRiR0xveDkzMnVZaHc2OUEzZ25YSGt3WjBnSmtQM2ZIemZx?=
 =?utf-8?B?cCtNenQvYVEwNUYrRy8rdHBHNU9uT015ZU1hL2VrU3VSMk53UjhEcWxUcUNu?=
 =?utf-8?B?d2lHUXNSaEM5ZXNzUWZJdEpoQzJEZVpyZjlVWGJhVXpvSk9NOXNuQWV6RUtm?=
 =?utf-8?B?UHNSVnM0UWczb1l2TVhZeUJpbHVMVGhLN1AwczRibDk2N3Q0Z0JDSDg4YUlG?=
 =?utf-8?B?VkpvWVZtcE83eG14dWJpR2xCeUhERHJIZW56bXR3V1lHUmxPelkyY2I3Slh1?=
 =?utf-8?B?M2dDTk9kMXFza2FnTWdZMVpaMjUrSW95OGVkcnAxWGlySGFXWjJlRGZ6TGRv?=
 =?utf-8?B?R2wzbWNaRXd5cStXK2VkRzVaZHM5OHEra0JlNE9WMU5xUEFIczRBV0JOTktL?=
 =?utf-8?B?eHhHTFFNTG1tNXdaN2Rnc0d4dm1XcHZoOUk4NWlnT0JBMlFGTjVaQy9rSnVt?=
 =?utf-8?B?eE1GRVJXTTZSTEJLVmJwTHZXVWZaYWJ4UGFzbnd3Qm5tdmRzYzZSbE8xMzZv?=
 =?utf-8?B?N0ZxdnNmcXZsYkkwMDZlSmhrQm83Q1ZuWkJuelpSM2hSS2F1ajBKQzE2dDJq?=
 =?utf-8?B?S1NFdXRLUVU4L3BFalArdE42UFRZdDFoUnM4YjJlQVB6c2tRNWFsc0ZpeFRD?=
 =?utf-8?B?ci9OZGF2OFlqTzBheUZIbzViQTlDaDV6L2czVk1JdDJXWkxpTVB3OXVmTktl?=
 =?utf-8?B?aThZZlFsSmRJTHlodXI4QU5zSENJVlphZVFBQzFKdURkZWl1a1MrVWJGdUsr?=
 =?utf-8?B?Yk9mamJ6U3dNTzhQQU9xVkN2RVVMOWxTT0UzUHptZDAwRTY4eE1LTUdsZTRl?=
 =?utf-8?Q?8Eo9PJ3YxIpm3dg6sTek6c/D6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb1b7a7c-d5d5-4fcc-9f8b-08dcec1b5e22
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 06:42:26.8750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H0LJHPwqcbKa/xmRGFrf/6IXa5GfZ+9jX5duMPDL02PvRnTy2SV5OEe9V4jURmEdk44DrorN7yvOLqg2yDdKXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8867
X-Proofpoint-ORIG-GUID: xFwnjTCMGCy23FPP9R9Fl4JlRdRd_i3x
X-Authority-Analysis: v=2.4 cv=arbgCjZV c=1 sm=1 tr=0 ts=670cbd58 cx=c_pps a=2/f09Pi2ycfuKzF0xiDRrg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=l1-WZR0qAAAA:8
 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=mmHAwmSbDC19QW3ild0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Qm0ypj1B_joA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=J0NmAbttn3WFok5z7_lE:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: uMzx517Y2otnxRb51F1BH4MD_5TCtjFZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-14_06,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410140048
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 49E4r7rP007072
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 06:42:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112847



On 10/14/24 10:36, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>=20
> On Sun, Oct 13, 2024 at 7:31=E2=80=AFPM Yu, Mingli <mingli.yu@windriver=
.com> wrote:
>>
>> Hi Khem,
>>
>> On 10/14/24 00:18, Khem Raj wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
>>>
>>> ptests seems to be failing for qemux86-64 -  https://snips.sh/f/PWrmT=
R3-bm
>>
>> I didn't reproduce the issue locally as below:
>>
>> root@qemux86-64:/usr/lib64/tomlplusplus/ptest# ./run-ptest
>> PASS: tomlplusplus_odr_test
>> PASS: tomlplusplus_tests
>=20
> Did you build and run with meta-oe-image-ptest-tomlplusplus ?
> secondly, I ran with image built with clang compiler

Yes, I have tested with "$ bitbake meta-oe-image-ptest-tomlplusplus=20
-ctestimage" and it succeeded as below:
$ bitbake meta-oe-image-ptest-tomlplusplus -ctestimage
[snip]
Output from runqemu:
runqemu - INFO - Received signal: 15
runqemu - INFO - Cleaning up
runqemu - INFO - Host uptime: 10209822.71

tput: No value for $TERM and no -T specified

RESULTS:
RESULTS - parselogs.ParseLogsTest.test_get_context: PASSED (0.00s)
RESULTS - parselogs.ParseLogsTest.test_parselogs: PASSED (2.02s)
RESULTS - ping.PingTest.test_ping: PASSED (0.01s)
RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectfail: PASSED (0.36=
s)
RESULTS - ssh.SSHTest.test_ssh: PASSED (0.50s)
RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectsuccess: SKIPPED=20
(0.00s)
SUMMARY:
meta-oe-image-ptest-tomlplusplus () - Ran 6 tests in 2.892s
meta-oe-image-ptest-tomlplusplus - OK - All required tests passed=20
(successes=3D4, skipped=3D1, failures=3D0, errors=3D0)
NOTE: Tasks Summary: Attempted 1430 tasks of which 1429 didn't need to=20
be rerun and all succeeded.


$ tail -2 conf/local.conf
TOOLCHAIN =3D "clang"
IMAGE_CLASSES +=3D "testimage"

Could you help to provide your local.conf to help to reproduce the issue?

Thanks,

>=20
>>
>> Anyway, I will look into this then.
>>
>> Thanks,
>>
>>>
>>> bitbake meta-oe-image-ptest-tomlplusplus
>>> bitbake meta-oe-image-ptest-tomlplusplus -ctestimage
>>>
>>> On Sat, Oct 12, 2024 at 3:01=E2=80=AFAM Yu, Mingli via lists.openembe=
dded.org
>>> <mingli.yu=3Deng.windriver.com@lists.openembedded.org> wrote:
>>>>
>>>> From: Mingli Yu <mingli.yu@windriver.com>
>>>>
>>>>    # ./run-ptest
>>>> PASS: tomlplusplus_odr_test
>>>> PASS: tomlplusplus_tests
>>>>
>>>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>>> ---
>>>>    .../recipes-devtools/tomlplusplus/files/run-ptest | 12 ++++++++++=
++
>>>>    .../tomlplusplus/tomlplusplus_git.bb              | 15 ++++++++++=
+++--
>>>>    2 files changed, 25 insertions(+), 2 deletions(-)
>>>>    create mode 100755 meta-oe/recipes-devtools/tomlplusplus/files/ru=
n-ptest
>>>>
>>>> diff --git a/meta-oe/recipes-devtools/tomlplusplus/files/run-ptest b=
/meta-oe/recipes-devtools/tomlplusplus/files/run-ptest
>>>> new file mode 100755
>>>> index 000000000..4f682c5eb
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-devtools/tomlplusplus/files/run-ptest
>>>> @@ -0,0 +1,12 @@
>>>> +#!/bin/sh
>>>> +
>>>> +cd tests
>>>> +for atest in tomlplusplus_* ; do
>>>> +    rm -rf tests.log
>>>> +    ./${atest} > tests.log 2>&1
>>>> +    if [ $? =3D 0 ] ; then
>>>> +        echo "PASS: ${atest}"
>>>> +    else
>>>> +        echo "FAIL: ${atest}"
>>>> +    fi
>>>> +done
>>>> diff --git a/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.=
bb b/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
>>>> index 0e8202bdc..245c309a2 100644
>>>> --- a/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
>>>> +++ b/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
>>>> @@ -3,7 +3,9 @@ HOMEPAGE =3D "https://github.com/marzer/tomlplusplus=
"
>>>>    LICENSE =3D "MIT"
>>>>    LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D90960f22c10049c117d56e=
d2ee5ee167"
>>>>
>>>> -SRC_URI =3D "git://github.com/marzer/tomlplusplus.git;protocol=3Dht=
tps;branch=3Dmaster"
>>>> +SRC_URI =3D "git://github.com/marzer/tomlplusplus.git;protocol=3Dht=
tps;branch=3Dmaster \
>>>> +           file://run-ptest \
>>>> +"
>>>>
>>>>    PV =3D "3.4.0"
>>>>    SRCREV =3D "30172438cee64926dc41fdd9c11fb3ba5b2ba9de"
>>>> @@ -11,4 +13,13 @@ S =3D "${WORKDIR}/git"
>>>>
>>>>    DEPENDS =3D "cmake-native"
>>>>
>>>> -inherit meson
>>>> +inherit meson ptest
>>>> +
>>>> +EXTRA_OEMESON +=3D "-Dbuild_tests=3D${@bb.utils.contains("DISTRO_FE=
ATURES", "ptest", "true", "false", d)} \
>>>> +"
>>>> +
>>>> +do_install_ptest () {
>>>> +    install -d ${D}${PTEST_PATH}/tests
>>>> +    cp ${B}/tests/tomlplusplus_odr_test ${D}${PTEST_PATH}/tests
>>>> +    cp ${B}/tests/tomlplusplus_tests ${D}${PTEST_PATH}/tests
>>>> +}
>>>> --
>>>> 2.34.1
>>>>
>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#112828): https://lists.openembedded.org/g/openem=
bedded-devel/message/112828
>>>> Mute This Topic: https://lists.openembedded.org/mt/108964413/1997914
>>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/uns=
ub [raj.khem@gmail.com]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>

