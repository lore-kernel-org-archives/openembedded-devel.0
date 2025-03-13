Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF9DC28B30
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 03:19:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6360.1741835982339233629
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Mar 2025 20:19:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5167901028=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52D0VI8P023468
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 20:19:42 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45b0j4sf4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 20:19:41 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52D3JeS3007133;
	Wed, 12 Mar 2025 20:19:41 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2041.outbound.protection.outlook.com [104.47.55.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45b0j4sf4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 20:19:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ilepLhae4f5Rffakbk4M3tJFhYSGwW788JbNscmgWANE88LjaIc94zG6/a+TFbmOdvaaidhut+mT10lYRr0Q0PJw9oYPODYQk321XNugbBEukpWfBnwVYtnZ5an6TllINeyASRUG1t7zqB78T9y2IoUqsRTgvHsIF1TX2Y3uf4LvXfu+8exrhW/OPkoHfym4n8bl1VoNwMdva/DDJtkhQ55M6cd2LbZsZrOoNM59+UH0gwSNn8ZyZpXvWsBklnsH4ShAqm15/rX3A3HizeXW6rISmp5YJqqgHP9xTjO+zR4A5rVzk9EIZ5zPaiw+mZIjGKBO4Z7c8bP3yhF/fo187A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wu1AR1xQx3QEETLTkX9N2bjHKpN05CZU3ELIWCUMXIo=;
 b=W3GIRy6sJel+lPVAvjEkfmYIyFLcJJao1LoMwYvSHepi1dXL4amCiInFWgR5DNrvOXIQ4qm16P0FlLyv4/HkUqRq3y7VkgTGRH48ZFVzYPC1MVziJ6oINN8wQByepkLasBtStca17MM4U9usU/gIDs9VqETKw5ShfBLzBb07gDzOKdQIi1HBSK/hRu82oEP5HVYu6Ml1r3ZMPeLbobxrdD1gbEB/CEgUMgyjDEVPYkR8AMNNIvkJXA/VVCXG6rww1cgjeGPkhQg5ncA/gEzCVCw+NKLdqjub8lZuxyOPSYMKrUX29uocYEdaA6GB+qvDX/vghhxah3R7i1mNwBybvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5533.namprd11.prod.outlook.com (2603:10b6:5:38a::7) by
 LV8PR11MB8463.namprd11.prod.outlook.com (2603:10b6:408:1ed::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.27; Thu, 13 Mar 2025 03:19:37 +0000
Received: from DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd]) by DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd%6]) with mapi id 15.20.8534.027; Thu, 13 Mar 2025
 03:19:37 +0000
Message-ID: <1a6cd29c-a7c1-4320-8620-8b57fe407aa3@windriver.com>
Date: Thu, 13 Mar 2025 11:19:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [kirkstone] netcat0.7.1 segfault
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <da5b94df-7153-4e2d-9f28-261d5f97c940@windriver.com>
 <5d9ed679-129f-4e5f-b33f-818bb471a17a@gmail.com>
Content-Language: en-US
From: "Wang, Jinfeng (CN)" <jinfeng.wang.cn@windriver.com>
In-Reply-To: <5d9ed679-129f-4e5f-b33f-818bb471a17a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYAPR01CA0115.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::31) To DM4PR11MB5533.namprd11.prod.outlook.com
 (2603:10b6:5:38a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5533:EE_|LV8PR11MB8463:EE_
X-MS-Office365-Filtering-Correlation-Id: c87eb871-7cc5-4fde-563f-08dd61dde1c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VlRxU1lQbUwyQU1hbEI0cnhoUGNkQ2M4YjhNTWVJNE4remtyb0NTQXJHNW5v?=
 =?utf-8?B?RFVDMlAxeEdNYjZCMm4rTG9kWHh5ZTdqU2QzbDA2NTZLMTZSMHd6OG9NSWQ5?=
 =?utf-8?B?SVdyOS9YZnhheHV1RWgyN0pVMGZUdTdwLytVVkFZcmNmbk51RXRDejhJSWph?=
 =?utf-8?B?dkNLb1JGWVpYTEdUYnUvUlhYekRsTXRraGNheE4za05RdDdQd1VCZFdVQUU1?=
 =?utf-8?B?amQzRkRMdG16SXF1QUZPYThpdkdHK2xYNGt3Y3J0WGRpamZVS1RWbnR4cXdN?=
 =?utf-8?B?R3JYeGZRUnhaODRZWTljSWNteUpWM3A0eG10YVBsYlVTNjZTL1AzTjN2U2Ry?=
 =?utf-8?B?SWZyVi96ejQwemxrZmtrZVRMNHgydndOUklIa0Q1Y0I4a0JOLzVxWFI4UEg0?=
 =?utf-8?B?REJYci9BdWg4R2hBa3J1WUw2alo3Y01zeW9ZRHA3bXBtYWd2M1FsenhjZEJs?=
 =?utf-8?B?SG9tRWRZSzF0cStzYW5JQTBEZUhCN3N6RHd1S0hSY0dKMm9oNVFZTEpaYnhH?=
 =?utf-8?B?Q3hkQ3RBOFdlVFZMc3JhNERCTjJreWVjd2h4WFZ5MXZUNjg4QzNET3A2N2dX?=
 =?utf-8?B?NUM5V2g0aDNVY2dKQk1MR2Z5bDFJeFlIYlpFaFJyUjlqcjcrTkdURlZrV0Rm?=
 =?utf-8?B?bTlYcDZHTzIzN01LSVNjNnFMdkZIMWNkT3JrZ1BVQ0QvZDlqSnJmRjdSdk1z?=
 =?utf-8?B?d3BUUExZZTdSWlZvV0RScjBwTysrU201SE40NU5ZdjlEZXR2Lzc2amtsTGhh?=
 =?utf-8?B?SzhhcEtiR1BmaWNmRm1zeGE1bEJxc2xGK1NLZmkzUjkydjFqUnRWWFU3WXBM?=
 =?utf-8?B?aE5YcmFwQkdpQnU0K2Uwa3d4UTN1c3hWYXFYa1E5Q3ZOblF5dERGbXRTN2dX?=
 =?utf-8?B?bHlXbS80M2Q1RzBHeExZNm1kTlIzZllINnZGL2hqV01BMjNjWndrQVphSW5n?=
 =?utf-8?B?YlZWZXlRKy9zQ1BtOGs5OTBjNXU4Y1RpVUdoS3pHblpEMThoRmNNdTV3aFYy?=
 =?utf-8?B?djZLdDdURzJFbDJEbld0ekhwVHkxbUpCcVo3TDhadUpJbklOcFlsQ1VxTlJ1?=
 =?utf-8?B?czRSWUc2S2x3b1FQMjk5TWE5di8ra3BDMXVpbWpoNStuMytDNVIxOXNMUmRn?=
 =?utf-8?B?aFU2RWYxeTd4UXNMYVYwOS9rOE5zcktZK283SVV2a2dzaVFqYlpLOTJXczNL?=
 =?utf-8?B?NlMvblZlVVQ1bTNDdWtRUlRSS2tKK01oRWppM3NocDhDYzdaSUxmWWZOcEZG?=
 =?utf-8?B?Z3ZqWG9nLzJVNFpHQVc1eTA4TGhJSU1Vb2dkVitFbC9EbU1JZENjY1QwMkhI?=
 =?utf-8?B?WnBvR3ZQS3JqWExzNnRJWllwZVJSK1JUeEtrdFVzQXJjYk5VTU1hMm1FK2N2?=
 =?utf-8?B?ajBEelRiZVQ5cDFuTUx4alVGQTRsUFpPVEZEK3hkOXBGQWRSQW91d0FDcW8x?=
 =?utf-8?B?S0hQUkNzVjVUMlFNT0prcjVpUWR4bkhFbFJxVklUODRSNkpxTXVVdHlCTUVs?=
 =?utf-8?B?OGdRSHo1c0l3QjhoNW5FZWw0d0QxNHRFN0h3dll1aDB2dGNXQWpTOXRPZXpK?=
 =?utf-8?B?d0FYSWxaMHJTWENBSE1zMUFWa1Q5ODU0eFhzS212SS9zZ09vcFpMV010TDVz?=
 =?utf-8?B?TExaNTJ6SnRmNzlwMlcrVDh2MTY1b2c3UjhHMmdCZ3VwOVlZcUkyQU1pYUQr?=
 =?utf-8?B?WUhkT0ZmMzdoaURhNkgxc1BUNGs1N2tadFBVT3MrWGdFV2dYVEpLQWVyYjFZ?=
 =?utf-8?B?endXamFHdVpiVzQ0M3lBem5qU2dSSDRSaW82REZsRTJGTDJyN0hmWEhGd1Vq?=
 =?utf-8?B?STcrcVpDTDJRSlk0QmxLUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5533.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SmRNQXhOUVovVjV1eTdvT05RT09meitvb3ZJZ245VTFrY1ZDS0F3QVM4SEw1?=
 =?utf-8?B?dnpqWGtkaXZxeEl4dTQyd2dxVEJjSEFJRmxhNlZVcXU4VXloOHBabW1NbkR1?=
 =?utf-8?B?TmtOQkNGOU5kYm02OTFqY1NzdG9XN0NiaGJVZDcyRFFaeks2OU9WdVZXZmNB?=
 =?utf-8?B?b2NBSmdMY1J0Q0hrYWhZZUN5b1F0Ymo1MVQ2VGV4VGhYdjNSYU5jYTZHOTVp?=
 =?utf-8?B?eE92Mm1aWWdjSE9oaGtBUmpCODZPRmFFdWpIUlJ2UVlWQVV5eG13NTB6cld0?=
 =?utf-8?B?cGZaZmtEa3VNUkgzVXNrYXhVQ09oUFdRMkFxZitXckJRSVhodHdjZ3ZYeFhO?=
 =?utf-8?B?dm9JWmRJandiTmhOeDVqVTZnNW5LSHFQYWJFYzlhdWxCT1ZJckl4SnZGKzNU?=
 =?utf-8?B?bzhRSFZQaUJNbkk3Qm5oZWVQYWJTb1o0TzgvamFQbjBsOW1SV0w2SDFXMWtP?=
 =?utf-8?B?Nzl2RWlzTWYxTm5zR21RYU9kdjM1MmExUWNsQlRObnNsQ0VkUUVyQ3pibytm?=
 =?utf-8?B?NlZQa0sxektRUnBsNlVpdEZkMVM2OHhLUzMvZ2Jsd3hEVjNpaVpZYnlIdjRw?=
 =?utf-8?B?Z1hONFdqZzJIRkVFL1JpbGZuVjduSGlJbDRlcTFnNTJQb2pRUDlscmVib29L?=
 =?utf-8?B?aTFtT3ZlbTV2SVREVTFtZjdwVXJieGRVTDhydnlKdjQ0a0tBOHUvWlhoUHpB?=
 =?utf-8?B?M2lPUUtzV0s2dzJsN2J3T29iZlB1M3RnK29vSzQ5ZkFiTktiakJIV1VXdC9R?=
 =?utf-8?B?SFlmNW90aHdvTkFOZThtWkJHV3VKL20zWEtmd2pnaTZ5dVdadFN5VFA0ellL?=
 =?utf-8?B?eko5RUtxN2FSNS9uVGl0cHZMUFZZbWNmOE5sOXNwa1Z2Zlp2MWMzNk1lV3pj?=
 =?utf-8?B?aFRSRDg1RjI1amlUUkpjVXZDNVB5WHNjVHZoUVN5eU5Rai9rT1NFeUxJdnFp?=
 =?utf-8?B?MGhSWUJDTFYyYnNYcGF4a3lZUkNtb3ZNaUdOaDNieUg3eGdNdE93YnRuV01T?=
 =?utf-8?B?OUZUUXV3K0o2OHJIWTduSDFZdTFyRDd0cElBQVBVNHFQOStOTUhDUWJIZjBP?=
 =?utf-8?B?QlUzRUlmaDRtRnh4Y0VSblFWeDRmNWtReTFjYUVuMUlRR3FCbm9lSFhIcXJT?=
 =?utf-8?B?cmxlcTRTdm1PdUJ5ZkdxSzFOZFVqcGhqZk10RTNzbkFRTDZKQ2NkajhWbjFN?=
 =?utf-8?B?UFdadXVpUDVKRERQbVQ0N29rR2U0alp6U2NPb2hCMDdnN3pJMk9VY3llTjdx?=
 =?utf-8?B?R2FCaWpPZVdaZXMrb3FnSWc4QitxVVN1cTB4Sml4SllDSmtCdDl2MklmVklI?=
 =?utf-8?B?NU9sWjFiTEM2VU1POU1La1ZXWDZTcmRmdUFlTUl5Q2ttVm1BOHpEY2FiS2tv?=
 =?utf-8?B?SDhqbjdwbHZVTUxZVjhoQ0VLbTZ0UVZzMVRtRGc3ZExGRFVFUHB5OG1IQVpV?=
 =?utf-8?B?ZWlvaGpEY3NxOE11NEs0KzROTnlBU0FJSW10Q0t1OEtEcGtNemJLUXhub3Jh?=
 =?utf-8?B?TUpBYTQ1SUhydjE3V1Z4d09ZZ3NCNnRhckxqL3BEOGFVUnFXQzlFRHE2WUxS?=
 =?utf-8?B?VGJndFZTcElaRXdxbkZSdWZOTHBzb1lXOEJrK3V4VnhBSkRtc3VXalZud04w?=
 =?utf-8?B?SnFBRlNWWWJRaC9pUWJSRkRzcmF2VFBHcUl0L0NnN0FQSHBvSFdlYjUzcThC?=
 =?utf-8?B?MVB5dUF0djVIOERkS0xEUzV1L09LOHVQWXdINHVucXBhVEpTMmZPVjBGVFdQ?=
 =?utf-8?B?aG91R0VadjZYa2dqbG9oc3graFd2OGNzRUtqWDFXRXRLYU4rTmlPUmppZW5h?=
 =?utf-8?B?aDBoL3pIdllVdHJZVUlMY0pMQXVBcFlKNkRYUjhrUmVnNnR5eHpyZU1UanJa?=
 =?utf-8?B?UndoWmUzaDIvd3J2TGNGRUZWVW5ZWlNlWTJ6ZTlwb3hxU0N4ZjlTOGc2cG91?=
 =?utf-8?B?Rk5xdTViYnJzR3V2c3NzOWZ0OUh4b1dIMFNFSEZjTFczd2txU3B0T0dXK2V6?=
 =?utf-8?B?NUxiZGwzb0tHcHROL205UFFOcFRPNXNiYml2eGNGaGVwUk1UM0VBbGNyVHdD?=
 =?utf-8?B?ekVUQjlPUmJGWC9YaVNCQlJKT3RkTmgrMEV3Q1puVHVJMlRpbWw3NDZoam85?=
 =?utf-8?B?K1I3bVJuU2J0STdSZjdncE83V0RUWll0UmVZWGlGQ3hpdjJXbUQ1WXhwVk5X?=
 =?utf-8?B?K1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c87eb871-7cc5-4fde-563f-08dd61dde1c5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5533.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 03:19:37.0374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eLTeUqfAf/zm+GZQyexp6On6Zro1PfeWoZkQulYZ27zB2nfQzhDsJQUgmGXzQB6Xt907DNyVzVeQEt84JGFEN1P3kB3G7/fNMCYtCDTLQHc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8463
X-Authority-Analysis: v=2.4 cv=Cc0I5Krl c=1 sm=1 tr=0 ts=67d24ecd cx=c_pps a=O5U4z+bWMBJw47+h9fOlNw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8 a=pGLkceISAAAA:8 a=PgD2CHadq_HHrm4Mc_0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: TNuwt9UjJ9NHXujzFisWZh56ATnJ8Q2F
X-Proofpoint-GUID: KT4bzwlB7Dhoo5rB-GfZdzIGGy9_Vhv8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_02,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2502280000 definitions=main-2503130024
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52D0VI8P023468
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 03:19:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115950

Thanks.

I will test with netcat-openbsd.


Jinfeng

On 3/12/2025 6:27 PM, Gyorgy Sarvari wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> Unfortunately gnu netcat has seen better days - last release 20 years
> ago, last change 10 years ago.
> Is using netcat-openbsd out of question for you? It's also in meta-oe.
>
> On 12.03.25 09:17, Wang, Jinfeng (CN) via lists.openembedded.org wrote:
>> Hi all,
>>
>>    I found there is a segment fault in gnu netcat 0.7.1. I can reprodu=
ce
>> it in kirkstone.
>>
>>
>>     root@qemux86-64:~# netcat -nlvp 12347 -T
>> Connection from 127.0.0.1:52236
>> [=C2=A0=C2=A0 87.252879] netcat[242]: segfault at 55b9310e0000 ip 0000=
55b9310b9d3e
>> sp 00007ffcac0fa530 error 6 in netcat[55b9310b5000+5000]
>> [=C2=A0=C2=A0 87.254051] Code: e8 57 b6 ff ff 31 f6 83 c3 01 39 dd 7e =
68 48 63 c3
>> 41 0f b6 54 05 00 48 63 05 b2 45 00 00 80 fa ff 74 04 85 c0 74 e0 8d 4=
8
>> 01 <41> 88 14 06 44 8d 66 01 85
>> Segmentation fault
>>
>>
>> Reproduce steps are as belows:
>>
>>      1. git clone https://git.openembedded.org/meta-openembedded
>>       git checkout kirkstone
>>
>>       git clone https://git.yoctoproject.org/poky
>>       git checkout kirkstone
>>       cd poky
>>       source oe-init-build-env
>>       bitbake-layers add-layer
>> /mydir/workspace/poky22/meta-openembedded/meta-oe/
>>       bitbake-layers add-layer
>> /mydir/workspace/poky22/meta-openembedded/meta-python/
>>       bitbake-layers add-layer
>> /mydir/workspace/poky22/meta-openembedded/meta-networking/
>>
>>       vi conf/local.conf
>>          INIT_MANAGER=3D'systemd'
>>          EXTRA_IMAGE_FEATURES +=3D "package-management debug-tweaks"
>>          BB_NUMBER_THREADS =3D "32"
>>          PARALLEL_MAKE =3D "-j 16"
>>          IMAGE_INSTALL:append =3D " netcat ssh"
>>
>>       bitbake core-image-minimal
>>
>>       2.###on the target run:
>>       netcat -nlvp 12347 -T
>>
>>       ssh login:
>>       run the following test.py:
>>
>>          import socket
>>
>>          RHOST =3D "127.0.0.1"
>>          RPORT =3D 12347
>>
>>          print("[+] Connecting to %s:%d" % (RHOST, RPORT))
>>          s =3D socket.create_connection((RHOST, RPORT))
>>          s.send(b"\xFF") # Telnet control character
>>          print("[+] Telnet control character sent")
>>          print("[i] Starting")
>>          try:
>>              i =3D 0
>>              while True: # Loop until it crashes
>>                  i +=3D 1
>>                  s.send(b"\x30")
>>          except:
>>              print("[+] GNU Netcat crashed on iteration: %d" % i)
>>
>>
>> Any suggestion?
>>
>>
>> Regards,
>>
>> Jinfeng
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#115916): https://lists.openembedded.org/g/openembe=
dded-devel/message/115916
>> Mute This Topic: https://lists.openembedded.org/mt/111656319/6084445
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [skandigraun@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

