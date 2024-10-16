Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D2FDD20691
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 02:24:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.13913.1729045485860391538
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Oct 2024 19:24:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=001917dd5c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49G1n7vY002035
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Oct 2024 19:24:45 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42a39882fc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Oct 2024 19:24:44 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49G2Oihi020660;
	Tue, 15 Oct 2024 19:24:44 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42a39882fb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 19:24:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9bbpeKJLo75SOLDJ/uWsoxd5gIPZLB/CLoZdpCGNnnMxYMgoaCvv+xMkddPdCQeKLJFQTPjgr264u088kLffU+gQ5EdHq7pPKJtvCLzDwJyS4bCv4iC1+URKFtFJwUReoQIYEHld/AFuGXfkZlHMVqjTBhQN+WLiVapmOXI8nWxbHE8FUsq6/9rXeQ8unO3pnN6kZQpHtejOK3W5BYQg7N3gXc0izlLnVJXFWalCRia302Fs9XdUfFQTSfD4vSg22MCImexy1g+CnA7Ia1tbfcw28426CMiXSeVttSv4drk/aJSlyZiqF/VdqA4QdVm35TNfmhmcyYHKPOhaCu3kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MlFZM1ysieziA0euk3Ihr1S4giikGLsVE6Y/UX78uZA=;
 b=FmgxPbSCmYqr76+VT+yFYKgD2npwxAIPpk+AZ+BRErkTKKW9GzdJyeYzvYe23PxQJRthUCfCCvSq07TXgR+Eupc1SfRWLfdETNziUqkzOVnWoRG/ULuTGedgJ0L6g4oiIyCgGSBzj9UMll8lQR966FwZdmUF2GCRDG8ipOoz1JcOPtiqyvHhVXyJ1p4H14849IqeRxKakaz9PKi8Ot0IU+JfMTDF1vXhCyMjZ9f0k6TXSuSgjCL9ayIq1MzJHP1LnsNiF81nRTjxcQLWAt/2r/tv2KYgVAf94ZJE5P2gWFOKMHeCg2WSRXjhcy9TH4vfGSQvKyvqTLu+bvRfcCZegg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB6396.namprd11.prod.outlook.com (2603:10b6:208:3ab::10)
 by IA1PR11MB7247.namprd11.prod.outlook.com (2603:10b6:208:42d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Wed, 16 Oct
 2024 02:24:40 +0000
Received: from IA1PR11MB6396.namprd11.prod.outlook.com
 ([fe80::79e6:58f0:788d:b45]) by IA1PR11MB6396.namprd11.prod.outlook.com
 ([fe80::79e6:58f0:788d:b45%3]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 02:24:40 +0000
Message-ID: <d158fd25-26fd-471c-b031-60f66da3a2b9@windriver.com>
Date: Wed, 16 Oct 2024 10:24:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 3/3] doxygen: upgrade 1.9.3 -> 1.12.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20241015142939.719707-1-yi.zhao@windriver.com>
 <20241015142939.719707-3-yi.zhao@windriver.com>
 <CAMKF1spBjFZ32QACcFQ9ybeYXYoByMjRx9m6Mrpys5vzVGXd+g@mail.gmail.com>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <CAMKF1spBjFZ32QACcFQ9ybeYXYoByMjRx9m6Mrpys5vzVGXd+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYAPR01CA0224.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::20) To IA1PR11MB6396.namprd11.prod.outlook.com
 (2603:10b6:208:3ab::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6396:EE_|IA1PR11MB7247:EE_
X-MS-Office365-Filtering-Correlation-Id: 45ee3493-4592-4cb7-6674-08dced89afe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|4022899009|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RjVpT0k2UEl4ZDFXU3l2cXZadUV1cEY5dFI4c2c4ZXBoZHZuYk1Hc3BnTFBk?=
 =?utf-8?B?OFp3RHhNWHlqNDM5Y2lUeVo4TDhBcjhkazVDbU51b3FMK0w5L05lRTMxd1Av?=
 =?utf-8?B?ajUvRUp4SnU2eXZKc2dpT0tEZzR0Ulh4U2dPN0U3c3JWMjZQMlJycUc5UTd3?=
 =?utf-8?B?MEVmM1kzWEhsbHFJZmFPejFlQjNOaVpuK0RWWVlrLzN1bVV1NEZoQ2w5WU8r?=
 =?utf-8?B?VDZZL0F3K0J2U0dXWkhrdDhYVzNZbHBxWHdpL1RRN29Va3dKN0lVSWY4Nng2?=
 =?utf-8?B?cHgzWEkyT2lxRUZjWnNnNEttd0ZzK3lBYUF6U3BPSUVOblprcFNhb1ZsWEpi?=
 =?utf-8?B?RlM1OW5KcnpLV3p1eWNJMzF3QXlQOExOdldsWG84L0lWL0ZtWU43TE5VR1lN?=
 =?utf-8?B?OUhzblJ2Z3BGYlJKZWYza1l1SWFEOWJCRFAzLzhvR1M0a0J1c1FjT1k2RmNl?=
 =?utf-8?B?RnBmVDVKODVpUWtuWGVJZ2hnT3l2cVZVMWh0MTI3ZUUrZ0lPdVFUb1V0UXVH?=
 =?utf-8?B?ZkRDbVBrNmRWWDZkZ0hGQWlYa2M0TFI5TG52aTdXNmJWRkVrTXlVZVgzVVJT?=
 =?utf-8?B?WHRCbXJtRGozc1RUdWJuWGRaejNobkl3VTVRUjNLMmhMNUU4QXVLVUlxK3pJ?=
 =?utf-8?B?VVBINUhNTFpCR0tSMTUyUWFxUkx0TVREVVRzWGxLeXhHTnA3T2tDZUU3M2dC?=
 =?utf-8?B?M21qa3RSVmFqRnZyNjdHb2xiU3h3SHl3VmJza2Q0UG44VS92bEIyUFI1RnhN?=
 =?utf-8?B?MDZYa3ZEei8rOWFNcFF3NTRyYU1kNGRDZUhmOVRRVlFKdjNGQnhFZFJ6NXAy?=
 =?utf-8?B?ZzU2NHdCOXRISTdBbkpISEhmOTFlcG80RTZTM1JUMTNqTVhVMlcyUDdUd1Bp?=
 =?utf-8?B?MFI4ZEhLaXhSc2FLSDg1bjdvQzJuNVA5R2x0VittTHRGNFFmSSsxd0pNTlM1?=
 =?utf-8?B?dlJ5NDVCVlRUWmh5RitxOVFtT2xBOTBmcjc3M3RSc3NuVXhLMlQraFl4WkZC?=
 =?utf-8?B?QlNvVUhOaGU3K2k0UzJwbE5OVm9FSzRkWHNxTzBEUFltK2pJeFYya0VrNGFN?=
 =?utf-8?B?Ukl0Y3YxTFdIM1RaSFpBZWk1Y1VPSnB3aEpDNTRtMGJteDF0dlgzSWZ2bHU3?=
 =?utf-8?B?eTFnY3F0SGx5bDlMVHJwRmpCUXVSc1lmN2krYno1Zzc5YVB1RUh5K0ZaZm94?=
 =?utf-8?B?WU9HQ01lcU5OMkhwTXhEeWpZY3BIQk0xR0tIL2wwK1dhZDFvRkd6dkxvb3Zk?=
 =?utf-8?B?REdXSXppdWQ1d05RU25rT2g2QkZGQUYvNWJWRGZ3WXRxUENhUDZSdDVCbXRa?=
 =?utf-8?B?bEJwNmpGaVdvU2hTQTZsa05TcWpnME5Dd3ozQytzWitFcEJoVU9ISUFNR2xn?=
 =?utf-8?B?Q253SXQyb25FTURSZ0U4Z0VuSVdZb0x2clBLU2ZWL3JiNklBR1ZLU1JTMm9H?=
 =?utf-8?B?WFprb2hJNE9XNk1wa3o5U2tVbFkvT2NYa2NWL2pOa0ZBYmxONW5FUzJ5WWRz?=
 =?utf-8?B?aDJaeFl4Y1UrWDlCY3lhZ0xuWnQ4K1JJWk9oZUhGN2cxZFYrMFU0MG9KTlFj?=
 =?utf-8?B?ZGI4T1UrM01WRmVieWFma05TOWJlVjRuQk9zc2toYjZwdTVrU3ZCSUt5cHBy?=
 =?utf-8?Q?OrW7pjCn8niMAYMcWd7JQ2J3mWZXi+UaK1EoXC2Xv7Eo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6396.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QnUzZlBmZnVrV2ZqTGtLaGh3eVBYdDJ5S0FFRXVqRU5rSXdZSVNhNGFHazFh?=
 =?utf-8?B?UGlVUEl1WHM2SGJidVp6K1hSbEswOUVQcGhvRkVCZHhQaUZSWGRjTkt3cE5S?=
 =?utf-8?B?YmFmTzA1MEVheWlFeEVXVHZxNEV3MGM3Ky9IZXJERWYvcm85RGxhWXJtaVhR?=
 =?utf-8?B?ZnRVWVhIWWRKTDhFQzdwcEdQdlNIYUQxZVpGOWJpVlBocTlpZ3g4TldVazBJ?=
 =?utf-8?B?Qk01Q3pJWjZKMnhPa0JjRjludHhpcytQeTY4NUh6NzRVMjFOcDBkcWVmb2cv?=
 =?utf-8?B?dUV4N2xMUXdWczlVVVcyZkFuUDBRR3plNWJiOUJMMXZJZmFDU28vWDRMYm9B?=
 =?utf-8?B?cjVtR01kM1BuRlRxNVM5YUFqYjZCcDR3bTU2SW1sZGV3QmdnK1RMcytVQ3Y5?=
 =?utf-8?B?bHYvTXpzMnBRL1NJMy9HWGI0a2Q2bUlFZlI3Y2hCWGhsUUtheTdMWVBrUVAy?=
 =?utf-8?B?Y2FaTkpKaGVGMDRUYnozUkQyMnBPeXk5blplNjZ4MVBOR0gvOGIyVUh4VVNm?=
 =?utf-8?B?TGNSWGNUWVJmRG1VVGNJOHNnSXpHV3NhWUc3UG9iRTlKTEJjdjFZcDVJOFFn?=
 =?utf-8?B?YnRjRHRldjJyWlJzOG1RYlgxbGxHS2poRytaZ0M2T0p4c3hzSFB2ZDR2SXNz?=
 =?utf-8?B?YS9WZk0yNnA1T0x2dWFWRUJpWU10ek9aZU82UmhPYmJub0duWkxuRTBOVzk2?=
 =?utf-8?B?cEc1MHVJdENyMCttTDI0dnM1RGVwRlVnRGlYNmc5ZEkwQzdSZW1Jak4rM2V1?=
 =?utf-8?B?YUxOczRZRXJHMkJrN0hnSmRyOG1tZU4rUW1qSU1qY25qajdLL3hFU3FDYnBV?=
 =?utf-8?B?MTl4cHp3RS9ObGhMZk1WL2twdTVoYnpETElEYTVQejhNcmJpSlJIREMrT25w?=
 =?utf-8?B?NGJJVkRLTUw4K0U5cnlOZlZHSXl3WU5GV0UwVFJZdUJyTExxcXpwYkxHcTY0?=
 =?utf-8?B?M1lUWWlFeklINzNiYUgyQzFDZXBVOEVkVHJiN0ZqSjhGN3g1ZzRXc1E3NS83?=
 =?utf-8?B?RkI3Q3BTSkFsbzhEOVdMVitJeGpsM3RadjQ4aXJscGxXOG9sSVRFbkdDS1hG?=
 =?utf-8?B?T0Z4R3VCcndnclN6ZWtyR085RTJ4eHM3L0lFUzlPamxUNG8zb3k1REw0Z2Rj?=
 =?utf-8?B?TEZqVkVaMDMyT3NIVUNDcnBGM1hocGloSkJjV21BbVhYY3JtK1c2Yk9mNVE4?=
 =?utf-8?B?RWtOVEh2TUxRTTNXbjBxU043eDlrcHdEVEtlR3NKOEpCSzlPeE43SFpSUWRF?=
 =?utf-8?B?K28xZWt0QVg3TEEzOHUrM01iNVpRVlN0N3lRTE9MdEpOcE8reHlJbW01SExK?=
 =?utf-8?B?WHVIODUwR2UvdnJnR2NOVUJyaDdSR1VGaDhsTlF1RWlBKzJSYi9XVGN6d3pq?=
 =?utf-8?B?d0J5TEN5VU9qcWRnU3RSV3EzUDl0Z21obFJGcWRCYjA2endDT2dMdERUR1l1?=
 =?utf-8?B?ellrd2Z6dVByMFp1NkdLM2grdXFiZTRLWFNUNjd0NWdMVFdHWGlFQmJ1NmNj?=
 =?utf-8?B?TXA0aE1jemYwREtQQitpZGZMWkhkTU1DRnJLcm9EMXdvSTJkd3JuakVMOTZ2?=
 =?utf-8?B?cERuQXgzZnM0VlNEdVM0bTlXOVprdTlLNkh5R3JJeGhoTjJkV0V2T1ZqTlBE?=
 =?utf-8?B?c3U5NnpqY1pqQWp6NG1mTU83dWlOWEZRd1BsekZFblpNMkxzYmd6MmhmWi95?=
 =?utf-8?B?WHZzQ2dYUUw5bHBVTDV4Tk5vUDZrOUZ3dUs3R3k1bEdrSm9wYXN3SWpOeDZa?=
 =?utf-8?B?aHk0UWdrUzNmYnBVa3pMYTJSSnh3djJVaUFMQTRTSk9hSTQ4clRyTTBhVkhD?=
 =?utf-8?B?RUJnMnluYURYSzdvRDlBVmRIazdJR21xZGNadDlrQjlDU0wyb1ZaZmF2NWI4?=
 =?utf-8?B?ajVjTmZHN3NWVnplM3RsZW85eVZQRy9WV3g0UlQrbVVYT2RpVFNPcnN4ZnFX?=
 =?utf-8?B?NUV4U0lGdTN6b2g1WmxXOUx5NW9IZFljaUZLejJuckVZTkFYRmJ4T0dmRWFC?=
 =?utf-8?B?TFZBeGVEaE1pRDJIMktVcWxGakk0RUtLVHJienQ0dW5haUFOWHROWHRmbmow?=
 =?utf-8?B?NUJzbVVnV09QTDZ6NGJvcGVBZGlhb0ZaYlhBcWRxaUFiTVJsd2R2WjB2Uldh?=
 =?utf-8?Q?uRk2KnBSWfSOZg752atQF3FQn?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ee3493-4592-4cb7-6674-08dced89afe9
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6396.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 02:24:39.9757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /oHuxrGHkPgrhypeBqAVn2tlo0ZRhe1eQCh9U/TUjFkeW4gbuf1+Zhaoy9K0XMT+DOXclMV0GId/2oLGuWamyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7247
X-Proofpoint-ORIG-GUID: _jTJCUE2XrBxw7yqyYclzX4y7WksBXmh
X-Authority-Analysis: v=2.4 cv=F7EFdbhN c=1 sm=1 tr=0 ts=670f23ed cx=c_pps a=9T78G36u1E64A7MtQSounQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=Twlkf-z8AAAA:8
 a=SCo1hh1FAAAA:8 a=Q4-j1AaZAAAA:8 a=w20KmqIKAAAA:8 a=t7CeM3EgAAAA:8 a=k-42gJp3AAAA:8 a=pGLkceISAAAA:8 a=7-dRPMYMmpsY8NnOevAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=W-gb19_dOTsA:10 a=Xjc3AndYmIsA:10 a=ZPE7x7C7M2cA:10 a=-74SuR6ZdpOK_LpdRCUo:22
 a=nwb-CePKZZm3gL-ai9HY:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Qf4GdZp0wr9wS1Hk4A6d:22 a=FdTzh2GWekK77mhwV6Dw:22 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-GUID: 4rGpWIOVzYqN8T49Tuo46wbecIOzA-Ok
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_21,2024-10-15_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410160015
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 49G1n7vY002035
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 02:24:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112934


On 10/16/24 10:09, Khem Raj wrote:
> Thanks for this patch and I do see you have tried to fix the build
> with clang-19, there is another issue seen when using LLVM libc++
> for standard C++ library. see
>
> https://gist.github.com/kraj/66baa45d3844e81f47b69814d450b399
>
> llvm libc++ has made changes to make char_traits to be more consistent =
see
>
> https://libcxx.llvm.org/ReleaseNotes/19.html#deprecations-and-removals
>
> I think doxygen can be fixed for not relying on this deprecated
> behaviour and such a patch will be worthy of upstreaming as well.
> e..g see how it got fixed for kea
>
> https://gitlab.isc.org/isc-projects/kea/-/merge_requests/2410


Thanks. I'll take a look at this.

//Yi

>
> Thanks
> -Khem
>
>
>
> On Tue, Oct 15, 2024 at 7:30=E2=80=AFAM Yi Zhao via lists.openembedded.=
org
> <yi.zhao=3Deng.windriver.com@lists.openembedded.org> wrote:
>> ChangeLog:
>> https://www.doxygen.nl/manual/changelog.html#log_1_12_0
>>
>> * Refresh patch
>> * Backport a patch to fix build with clang
>> * Drop doxygen-native-only-check-python3.patch as the issue can not be
>>    reproduced.
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>   .../0001-build-don-t-look-for-Iconv.patch     |  20 +-
>>   .../0002-Fix-build-with-clang-19.0.patch      |  52 ++++
>>   .../doxygen-native-only-check-python3.patch   | 232 ----------------=
--
>>   .../{doxygen_1.9.3.bb =3D> doxygen_1.12.0.bb}   |   4 +-
>>   4 files changed, 64 insertions(+), 244 deletions(-)
>>   create mode 100644 meta-oe/recipes-devtools/doxygen/doxygen/0002-Fix=
-build-with-clang-19.0.patch
>>   delete mode 100644 meta-oe/recipes-devtools/doxygen/doxygen/doxygen-=
native-only-check-python3.patch
>>   rename meta-oe/recipes-devtools/doxygen/{doxygen_1.9.3.bb =3D> doxyg=
en_1.12.0.bb} (80%)
>>
>> diff --git a/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t=
-look-for-Iconv.patch b/meta-oe/recipes-devtools/doxygen/doxygen/0001-bui=
ld-don-t-look-for-Iconv.patch
>> index 47c8edb49..6b0a48f00 100644
>> --- a/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-f=
or-Iconv.patch
>> +++ b/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-f=
or-Iconv.patch
>> @@ -1,4 +1,4 @@
>> -From 24650b0c7db6b213a2eaa5061b75b9f1b43f1ce9 Mon Sep 17 00:00:00 200=
1
>> +From 2d587d043fc061c53c3d8015501392a804c5f0b4 Mon Sep 17 00:00:00 200=
1
>>   From: Bartosz Golaszewski <brgl@bgdev.pl>
>>   Date: Fri, 23 Nov 2018 11:44:56 +0100
>>   Subject: [PATCH] build: don't look for Iconv
>> @@ -7,31 +7,31 @@ Drop the find_package() for Iconv. CMake is unable t=
o find iconv.h in
>>   native build but all modern systems supply it as part of the standar=
d
>>   C library. We don't need this check in meta-openembedded.
>>
>> -Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
>> -Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>> -
>> -Upstream-Status: Inappropriate
>> +Upstream-Status: Inappropriate [oe-specific]
>>   - upstream doxygen must build on many architectures, this change is
>>     too intrusive for upstream
>> +
>> +Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
>> +Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>>   ---
>>    CMakeLists.txt | 4 ----
>>    1 file changed, 4 deletions(-)
>>
>>   diff --git a/CMakeLists.txt b/CMakeLists.txt
>> -index 06b9696f..f30b46b8 100644
>> +index 3adf456..ad73997 100644
>>   --- a/CMakeLists.txt
>>   +++ b/CMakeLists.txt
>> -@@ -117,10 +117,6 @@ if (sqlite3)
>> -   endif()
>> +@@ -212,10 +212,6 @@ if ((CMAKE_BUILD_TYPE STREQUAL "Debug") OR enabl=
e_lex_debug)
>> +   set(LEX_FLAGS "${LEX_FLAGS} -d")
>>    endif()
>>
>>   -find_package(Iconv REQUIRED)
>> --include_directories(${ICONV_INCLUDE_DIR})
>> +-include_directories(${Iconv_INCLUDE_DIRS})
>>   -
>>   -
>>    #set(DOXYDOCS ${PROJECT_SOURCE_DIR}/doc CACHE INTERNAL "Path to dox=
ygen docs")
>>    set(DOXYDOCS ${PROJECT_BINARY_DIR}/doc)
>>    set(ENV{DOXYGEN_DOCDIR} ${DOXYDOCS})
>>   --
>> -2.27.0
>> +2.25.1
>>
>> diff --git a/meta-oe/recipes-devtools/doxygen/doxygen/0002-Fix-build-w=
ith-clang-19.0.patch b/meta-oe/recipes-devtools/doxygen/doxygen/0002-Fix-=
build-with-clang-19.0.patch
>> new file mode 100644
>> index 000000000..fc3aae75c
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/doxygen/doxygen/0002-Fix-build-with-cla=
ng-19.0.patch
>> @@ -0,0 +1,52 @@
>> +From cff64a87dea7596fd506a85521d4df4616dc845f Mon Sep 17 00:00:00 200=
1
>> +From: =3D?UTF-8?q?Bernhard=3D20Rosenkr=3DC3=3DA4nzer?=3D <bero@lindev=
.ch>
>> +Date: Fri, 9 Aug 2024 14:13:34 +0200
>> +Subject: [PATCH] Fix build with clang >=3D 19.0
>> +
>> +Clang >=3D 19.0 requires a template argument list after the template
>> +keyword for CWG96 compliance, see
>> +https://github.com/llvm/llvm-project/pull/80801
>> +
>> +This patch has also been submitted to upstream TinyDeflate as
>> +https://github.com/bisqwit/TinyDeflate/pull/9
>> +
>> +Upstream-Status: Backport
>> +[https://github.com/doxygen/doxygen/commit/cff64a87dea7596fd506a85521=
d4df4616dc845f]
>> +
>> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> +---
>> + deps/TinyDeflate/gunzip.hh | 6 +++---
>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/deps/TinyDeflate/gunzip.hh b/deps/TinyDeflate/gunzip.hh
>> +index 652058ab8..3ba341487 100644
>> +--- a/deps/TinyDeflate/gunzip.hh
>> ++++ b/deps/TinyDeflate/gunzip.hh
>> +@@ -1141,21 +1141,21 @@ namespace gunzip_ns
>> +             //fprintf(stderr, "both track flag\n");
>> +             SizeTracker<DeflateTrackBothSize> tracker;
>> +             return tracker(Gunzip<code & Flag_NoTrackFlagMask>
>> +-                (tracker.template ForwardInput(i), tracker.template =
ForwardOutput(o), tracker.template ForwardWindow(c), std::forward<B>(b)))=
;
>> ++                (tracker.template ForwardInput<I>(i), tracker.templa=
te ForwardOutput<O>(o), tracker.template ForwardWindow<C>(c), std::forwar=
d<B>(b)));
>> +         }
>> +         else if constexpr(code & Flag_TrackIn)
>> +         {
>> +             //fprintf(stderr, "in track flag\n");
>> +             SizeTracker<DeflateTrackInSize> tracker;
>> +             return tracker(Gunzip<code & Flag_NoTrackFlagMask>
>> +-                (tracker.template ForwardInput(i),std::forward<O>(o)=
,std::forward<C>(c),std::forward<B>(b)));
>> ++                (tracker.template ForwardInput<I>(i),std::forward<O>=
(o),std::forward<C>(c),std::forward<B>(b)));
>> +         }
>> +         else if constexpr(code & Flag_TrackOut)
>> +         {
>> +             //fprintf(stderr, "out track flag\n");
>> +             SizeTracker<DeflateTrackOutSize> tracker;
>> +             return tracker(Gunzip<code & Flag_NoTrackFlagMask>
>> +-                (std::forward<I>(i), tracker.template ForwardOutput(=
o), tracker.template ForwardWindow(c), std::forward<B>(b)));
>> ++                (std::forward<I>(i), tracker.template ForwardOutput<=
O>(o), tracker.template ForwardWindow<C>(c), std::forward<B>(b)));
>> +         }
>> +         else
>> +         {
>> +--
>> +2.25.1
>> +
>> diff --git a/meta-oe/recipes-devtools/doxygen/doxygen/doxygen-native-o=
nly-check-python3.patch b/meta-oe/recipes-devtools/doxygen/doxygen/doxyge=
n-native-only-check-python3.patch
>> deleted file mode 100644
>> index 796bc61dd..000000000
>> --- a/meta-oe/recipes-devtools/doxygen/doxygen/doxygen-native-only-che=
ck-python3.patch
>> +++ /dev/null
>> @@ -1,232 +0,0 @@
>> -From daf686508f2ee4711d93e96e5b100e50bf161656 Mon Sep 17 00:00:00 200=
1
>> -From: Leon Anavi <leon.anavi@konsulko.com>
>> -Date: Wed, 26 Aug 2020 10:52:10 +0300
>> -Subject: [PATCH] doxygen: Fix Python issues for doxygen-native
>> -
>> -It fails to compile doxygen-native when /usr/bin/python is a link
>> -to python3 on build host:
>> -
>> -| Failed to import the site module
>> -| Traceback (most recent call last):
>> -|   File "/usr/lib64/python3.6/site.py", line 564, in <module>
>> -|     main()
>> -|   File "/usr/lib64/python3.6/site.py", line 550, in main
>> -|     known_paths =3D addusersitepackages(known_paths)
>> -|   File "/usr/lib64/python3.6/site.py", line 282, in addusersitepack=
ages
>> -|     user_site =3D getusersitepackages()
>> -|   File "/usr/lib64/python3.6/site.py", line 258, in getusersitepack=
ages
>> -|     user_base =3D getuserbase() # this will also set USER_BASE
>> -|   File "/usr/lib64/python3.6/site.py", line 248, in getuserbase
>> -|     USER_BASE =3D get_config_var('userbase')
>> -|   File "/usr/lib64/python3.6/sysconfig.py", line 604, in get_config=
_var
>> -|     return get_config_vars().get(name)
>> -|   File "/usr/lib64/python3.6/sysconfig.py", line 553, in get_config=
_vars
>> -|     _init_posix(_CONFIG_VARS)
>> -|   File "/usr/lib64/python3.6/sysconfig.py", line 424, in _init_posi=
x
>> -|     _temp =3D __import__(name, globals(), locals(), ['build_time_va=
rs'], 0)
>> -| ModuleNotFoundError: No module named '_sysconfigdata'
>> -
>> -Replace find_package PythonInterp with Python3 to fix this issue
>> -that it uses python3 from python3-native. And it also replaces the
>> -result variable PYTHON_EXECUTABLE with Python3_EXECUTABLE.
>> -
>> -This patch is only needded by doxygen-native.
>> -
>> -Updated to apply to release 1.9.1.
>> -
>> -Upstream-Status: Inappropriate [oe specific]
>> -
>> -Co-Authored-By: Kai Kang <kai.kang@windriver.com>
>> -Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> -Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>> -
>> ----
>> - CMakeLists.txt                  |  2 +-
>> - addon/doxywizard/CMakeLists.txt |  6 +++---
>> - doc/CMakeLists.txt              |  6 +++---
>> - examples/CMakeLists.txt         |  4 ++--
>> - libmscgen/CMakeLists.txt        |  2 +-
>> - src/CMakeLists.txt              | 10 +++++-----
>> - testing/CMakeLists.txt          |  4 ++--
>> - 7 files changed, 17 insertions(+), 17 deletions(-)
>> -
>> -diff --git a/CMakeLists.txt b/CMakeLists.txt
>> -index 2455793..28f0d83 100644
>> ---- a/CMakeLists.txt
>> -+++ b/CMakeLists.txt
>> -@@ -105,7 +105,7 @@ else ()
>> - endif ()
>> -
>> - find_program(DOT NAMES dot)
>> --find_package(PythonInterp REQUIRED)
>> -+find_package(Python3 REQUIRED)
>> - find_package(FLEX REQUIRED)
>> - find_package(BISON REQUIRED)
>> - if (BISON_VERSION VERSION_LESS 2.7)
>> -diff --git a/addon/doxywizard/CMakeLists.txt b/addon/doxywizard/CMake=
Lists.txt
>> -index 63ac8e3..d37d1d0 100644
>> ---- a/addon/doxywizard/CMakeLists.txt
>> -+++ b/addon/doxywizard/CMakeLists.txt
>> -@@ -57,7 +57,7 @@ set_source_files_properties(${GENERATED_SRC_WIZARD}=
/settings.h PROPERTIES GENERA
>> -
>> - # generate version.cpp
>> - add_custom_command(
>> --    COMMAND ${PYTHON_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/version.p=
y ${VERSION} > ${GENERATED_SRC_WIZARD}/version.cpp
>> -+    COMMAND ${Python3_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/version.=
py ${VERSION} > ${GENERATED_SRC_WIZARD}/version.cpp
>> -     DEPENDS ${PROJECT_SOURCE_DIR}/VERSION ${PROJECT_SOURCE_DIR}/src/=
version.py
>> -     OUTPUT ${GENERATED_SRC_WIZARD}/version.cpp
>> - )
>> -@@ -65,7 +65,7 @@ set_source_files_properties(${GENERATED_SRC_WIZARD}=
/version.cpp PROPERTIES GENER
>> -
>> - # generate configdoc.cpp
>> - add_custom_command(
>> --    COMMAND ${PYTHON_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/configgen=
.py -wiz ${PROJECT_SOURCE_DIR}/src/config.xml > ${GENERATED_SRC_WIZARD}/c=
onfigdoc.cpp
>> -+    COMMAND ${Python3_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/configge=
n.py -wiz ${PROJECT_SOURCE_DIR}/src/config.xml > ${GENERATED_SRC_WIZARD}/=
configdoc.cpp
>> -     DEPENDS  ${PROJECT_SOURCE_DIR}/src/configgen.py ${PROJECT_SOURCE=
_DIR}/src/config.xml
>> -     OUTPUT ${GENERATED_SRC_WIZARD}/configdoc.cpp
>> - )
>> -@@ -74,7 +74,7 @@ set_source_files_properties(${GENERATED_SRC_WIZARD}=
/configdoc.cpp PROPERTIES GEN
>> - set(LEX_FILES config_doxyw)
>> - foreach(lex_file ${LEX_FILES})
>> -     add_custom_command(
>> --        COMMAND ${PYTHON_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/scan_=
states.py ${PROJECT_SOURCE_DIR}/addon/doxywizard/${lex_file}.l > ${GENERA=
TED_SRC_WIZARD}/${lex_file}.l.h
>> -+        COMMAND ${Python3_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/scan=
_states.py ${PROJECT_SOURCE_DIR}/addon/doxywizard/${lex_file}.l > ${GENER=
ATED_SRC_WIZARD}/${lex_file}.l.h
>> -         DEPENDS ${PROJECT_SOURCE_DIR}/src/scan_states.py ${PROJECT_S=
OURCE_DIR}/addon/doxywizard/${lex_file}.l
>> -         OUTPUT  ${GENERATED_SRC_WIZARD}/${lex_file}.l.h
>> -     )
>> -diff --git a/doc/CMakeLists.txt b/doc/CMakeLists.txt
>> -index ec63ceb..49a2bda 100644
>> ---- a/doc/CMakeLists.txt
>> -+++ b/doc/CMakeLists.txt
>> -@@ -168,7 +168,7 @@ configure_file(${PROJECT_SOURCE_DIR}/doc/doxyinde=
xer.1      ${PROJECT_BINARY_DIR
>> -
>> - # doc/language.doc (see tag Doxyfile:INPUT)
>> - add_custom_command(
>> --        COMMAND ${PYTHON_EXECUTABLE} translator.py ${PROJECT_SOURCE_=
DIR}
>> -+        COMMAND ${Python3_EXECUTABLE} translator.py ${PROJECT_SOURCE=
_DIR}
>> -         DEPENDS ${PROJECT_SOURCE_DIR}/doc/maintainers.txt ${PROJECT_=
SOURCE_DIR}/doc/language.tpl ${PROJECT_BINARY_DIR}/doc/translator.py ${LA=
NG_FILES}
>> -         OUTPUT language.doc
>> -         WORKING_DIRECTORY ${PROJECT_BINARY_DIR}/doc
>> -@@ -177,7 +177,7 @@ set_source_files_properties(language.doc PROPERTI=
ES GENERATED 1)
>> -
>> - # doc/config.doc (see tag Doxyfile:INPUT)
>> - add_custom_command(
>> --        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/src/configgen.py -doc $=
{TOP}/src/config.xml > config.doc
>> -+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/src/configgen.py -doc =
${TOP}/src/config.xml > config.doc
>> -         DEPENDS ${TOP}/src/config.xml ${TOP}/src/configgen.py
>> -         OUTPUT config.doc
>> -         WORKING_DIRECTORY ${PROJECT_BINARY_DIR}/doc/
>> -@@ -228,7 +228,7 @@ add_custom_target(docs_chm
>> -     COMMAND ${CMAKE_COMMAND} -E echo "    for file in files:" >> ${P=
ROJECT_BINARY_DIR}/chm/doxygen_manual_examples_chm.py
>> -     COMMAND ${CMAKE_COMMAND} -E echo "        if file.endswith('.htm=
l') or file.endswith('.png') or file.endswith('.css') or file.endswith('.=
gif'):" >> ${PROJECT_BINARY_DIR}/chm/doxygen_manual_examples_chm.py
>> -     COMMAND ${CMAKE_COMMAND} -E echo "            print(os.path.join=
(root, file))" >> ${PROJECT_BINARY_DIR}/chm/doxygen_manual_examples_chm.p=
y
>> --    COMMAND ${CMAKE_COMMAND} -E chdir  ${PROJECT_BINARY_DIR}/chm ${P=
YTHON_EXECUTABLE} ${PROJECT_BINARY_DIR}/chm/doxygen_manual_examples_chm.p=
y >> ${PROJECT_BINARY_DIR}/chm/doxygen_manual.hhp
>> -+    COMMAND ${CMAKE_COMMAND} -E chdir  ${PROJECT_BINARY_DIR}/chm ${P=
ython3_EXECUTABLE} ${PROJECT_BINARY_DIR}/chm/doxygen_manual_examples_chm.=
py >> ${PROJECT_BINARY_DIR}/chm/doxygen_manual.hhp
>> -     COMMAND ${CMAKE_COMMAND} -E chdir ${PROJECT_BINARY_DIR}/chm "${H=
TML_HELP_COMPILER}" doxygen_manual.hhp || echo > nul
>> -     COMMAND ${CMAKE_COMMAND} -E rename ${PROJECT_BINARY_DIR}/chm/ind=
ex.chm ${PROJECT_BINARY_DIR}/chm/doxygen_manual.chm
>> -         DEPENDS ${PROJECT_BINARY_DIR}/doc/language.doc ${PROJECT_BIN=
ARY_DIR}/doc/config.doc
>> -diff --git a/examples/CMakeLists.txt b/examples/CMakeLists.txt
>> -index 194b427..248b807 100644
>> ---- a/examples/CMakeLists.txt
>> -+++ b/examples/CMakeLists.txt
>> -@@ -54,7 +54,7 @@ foreach (f_inp  ${BASIC_EXAMPLES})
>> -         COMMAND ${CMAKE_COMMAND} -E make_directory ${PROJECT_BINARY_=
DIR}/html/examples/${f}
>> -         COMMAND ${CMAKE_COMMAND} -E make_directory ${PROJECT_BINARY_=
DIR}/latex/examples/${f}
>> -       COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen ${f}.cfg
>> --        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.=
py  < ${PROJECT_BINARY_DIR}/latex/examples/${f}/latex/refman.tex > ${PROJ=
ECT_BINARY_DIR}/latex/examples/${f}/latex/refman_doc.tex
>> -+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example=
.py  < ${PROJECT_BINARY_DIR}/latex/examples/${f}/latex/refman.tex > ${PRO=
JECT_BINARY_DIR}/latex/examples/${f}/latex/refman_doc.tex
>> -       DEPENDS doxygen ${f}.${f_ext} ${f}.cfg ${TOP}/examples/strip_e=
xample.py
>> -       OUTPUT ${PROJECT_BINARY_DIR}/html/examples/${f}/html/index.htm=
l ${PROJECT_BINARY_DIR}/latex/examples/${f}/latex/refman_doc.tex
>> -     )
>> -@@ -73,7 +73,7 @@ if (DOT)
>> -         COMMAND ${CMAKE_COMMAND} -E make_directory ${PROJECT_BINARY_=
DIR}/html/examples/diagrams
>> -         COMMAND ${CMAKE_COMMAND} -E make_directory ${PROJECT_BINARY_=
DIR}/latex/examples/diagrams
>> -       COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen diagrams.cfg
>> --        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.=
py  < ${PROJECT_BINARY_DIR}/latex/examples/diagrams/latex/refman.tex > ${=
PROJECT_BINARY_DIR}/latex/examples/diagrams/latex/refman_doc.tex
>> -+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example=
.py  < ${PROJECT_BINARY_DIR}/html/examples/diagrams/latex/refman.tex > ${=
PROJECT_BINARY_DIR}/html/examples/diagrams/latex/refman_doc.tex
>> -       DEPENDS doxygen diagrams_a.h diagrams_b.h diagrams_c.h diagram=
s_d.h diagrams_e.h diagrams.cfg ${TOP}/examples/strip_example.py
>> -       OUTPUT ${PROJECT_BINARY_DIR}/html/examples/diagrams/html/index=
.html ${PROJECT_BINARY_DIR}/latex/examples/diagrams/latex/refman_doc.tex
>> -   )
>> -diff --git a/libmscgen/CMakeLists.txt b/libmscgen/CMakeLists.txt
>> -index 34cf4d8..f015afc 100644
>> ---- a/libmscgen/CMakeLists.txt
>> -+++ b/libmscgen/CMakeLists.txt
>> -@@ -7,7 +7,7 @@ include_directories(
>> - set(LEX_FILES mscgen_lexer)
>> - foreach(lex_file ${LEX_FILES})
>> -     add_custom_command(
>> --        COMMAND ${PYTHON_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/scan_=
states.py ${PROJECT_SOURCE_DIR}/libmscgen/${lex_file}.l > ${GENERATED_SRC=
}/${lex_file}.l.h
>> -+        COMMAND ${Python3_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/scan=
_states.py ${PROJECT_SOURCE_DIR}/libmscgen/${lex_file}.l > ${GENERATED_SR=
C}/${lex_file}.l.h
>> -         DEPENDS ${PROJECT_SOURCE_DIR}/src/scan_states.py ${PROJECT_S=
OURCE_DIR}/libmscgen/${lex_file}.l
>> -         OUTPUT  ${GENERATED_SRC}/${lex_file}.l.h
>> -     )
>> -diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
>> -index 0e0c5f7..c1d3ca5 100644
>> ---- a/src/CMakeLists.txt
>> -+++ b/src/CMakeLists.txt
>> -@@ -40,7 +40,7 @@ set_source_files_properties(${GENERATED_SRC}/settin=
gs.h PROPERTIES GENERATED 1)
>> -
>> - # configvalues.h
>> - add_custom_command(
>> --    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/configgen=
.py -maph ${CMAKE_CURRENT_LIST_DIR}/config.xml > ${GENERATED_SRC}/configv=
alues.h
>> -+    COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/configge=
n.py -maph ${CMAKE_CURRENT_LIST_DIR}/config.xml > ${GENERATED_SRC}/config=
values.h
>> -     DEPENDS ${CMAKE_CURRENT_LIST_DIR}/config.xml ${CMAKE_CURRENT_LIS=
T_DIR}/configgen.py
>> -     OUTPUT ${GENERATED_SRC}/configvalues.h
>> - )
>> -@@ -52,7 +52,7 @@ add_custom_target(
>> -
>> - # configvalues.cpp
>> - add_custom_command(
>> --    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/configgen=
.py -maps ${CMAKE_CURRENT_LIST_DIR}/config.xml > ${GENERATED_SRC}/configv=
alues.cpp
>> -+    COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/configge=
n.py -maps ${CMAKE_CURRENT_LIST_DIR}/config.xml > ${GENERATED_SRC}/config=
values.cpp
>> -     DEPENDS ${CMAKE_CURRENT_LIST_DIR}/config.xml ${CMAKE_CURRENT_LIS=
T_DIR}/configgen.py
>> -     OUTPUT ${GENERATED_SRC}/configvalues.cpp
>> - )
>> -@@ -60,7 +60,7 @@ set_source_files_properties(${GENERATED_SRC}/config=
values.cpp PROPERTIES GENERAT
>> -
>> - # configoptions.cpp
>> - add_custom_command(
>> --    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/configgen=
.py -cpp ${CMAKE_CURRENT_LIST_DIR}/config.xml > ${GENERATED_SRC}/configop=
tions.cpp
>> -+    COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/configge=
n.py -cpp ${CMAKE_CURRENT_LIST_DIR}/config.xml > ${GENERATED_SRC}/configo=
ptions.cpp
>> -     DEPENDS ${CMAKE_CURRENT_LIST_DIR}/config.xml ${CMAKE_CURRENT_LIS=
T_DIR}/configgen.py
>> -     OUTPUT ${GENERATED_SRC}/configoptions.cpp
>> - )
>> -@@ -95,7 +95,7 @@ endif()
>> - # resources.cpp
>> - add_custom_command(
>> -     COMMENT  "Generating ${GENERATED_SRC}/resources.cpp"
>> --    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/res2cc_cm=
d.py ${PROJECT_SOURCE_DIR}/templates ${GENERATED_SRC}/resources.cpp
>> -+    COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/res2cc_c=
md.py ${PROJECT_SOURCE_DIR}/templates ${GENERATED_SRC}/resources.cpp
>> -     DEPENDS ${RESOURCES} ${CMAKE_CURRENT_LIST_DIR}/res2cc_cmd.py
>> -     OUTPUT ${GENERATED_SRC}/resources.cpp
>> - )
>> -@@ -126,7 +126,7 @@ foreach(lex_file ${LEX_FILES})
>> -     set(LEX_FILES_H ${LEX_FILES_H} " " ${GENERATED_SRC}/${lex_file}.=
l.h CACHE INTERNAL "Stores generated files")
>> -     set(LEX_FILES_CPP ${LEX_FILES_CPP} " " ${GENERATED_SRC}/${lex_fi=
le}.cpp CACHE INTERNAL "Stores generated files")
>> -     add_custom_command(
>> --        COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/scan_=
states.py ${CMAKE_CURRENT_LIST_DIR}/${lex_file}.l > ${GENERATED_SRC}/${le=
x_file}.l.h
>> -+        COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/scan=
_states.py ${CMAKE_CURRENT_LIST_DIR}/${lex_file}.l > ${GENERATED_SRC}/${l=
ex_file}.l.h
>> -         DEPENDS ${CMAKE_CURRENT_LIST_DIR}/scan_states.py ${CMAKE_CUR=
RENT_LIST_DIR}/${lex_file}.l
>> -         OUTPUT  ${GENERATED_SRC}/${lex_file}.l.h
>> -     )
>> -diff --git a/testing/CMakeLists.txt b/testing/CMakeLists.txt
>> -index fd6912e..0af1865 100644
>> ---- a/testing/CMakeLists.txt
>> -+++ b/testing/CMakeLists.txt
>> -@@ -1,7 +1,7 @@
>> - # run all tests sequentially (keep for backward compatibility)
>> - add_custom_target(tests
>> -       COMMENT "Running doxygen tests..."
>> --      COMMAND ${PYTHON_EXECUTABLE} ${PROJECT_SOURCE_DIR}/testing/run=
tests.py --doxygen ${PROJECT_BINARY_DIR}/bin/doxygen --inputdir ${PROJECT=
_SOURCE_DIR}/testing --outputdir ${PROJECT_BINARY_DIR}/testing
>> -+      COMMAND ${Python3_EXECUTABLE} ${PROJECT_SOURCE_DIR}/testing/ru=
ntests.py --doxygen ${PROJECT_BINARY_DIR}/bin/doxygen --inputdir ${PROJEC=
T_SOURCE_DIR}/testing --outputdir ${PROJECT_BINARY_DIR}/testing
>> -       DEPENDS doxygen
>> - )
>> -
>> -@@ -19,6 +19,6 @@ foreach(TEST_FILE ${TEST_FILES})
>> -       string(REGEX REPLACE "^.*/([0-9][0-9][0-9]*).*$" "\\1" TEST_ID=
 "${TEST_FILE}")
>> -       # add a test target for each test
>> -       add_test(NAME ${TEST_NAME}
>> --               COMMAND ${PYTHON_EXECUTABLE} ${PROJECT_SOURCE_DIR}/te=
sting/runtests.py --id ${TEST_ID} --doxygen $<TARGET_FILE:doxygen> --inpu=
tdir ${PROJECT_SOURCE_DIR}/testing --outputdir ${PROJECT_BINARY_DIR}/test=
ing
>> -+               COMMAND ${Python3_EXECUTABLE} ${PROJECT_SOURCE_DIR}/t=
esting/runtests.py --id ${TEST_ID} --doxygen $<TARGET_FILE:doxygen> --inp=
utdir ${PROJECT_SOURCE_DIR}/testing --outputdir ${PROJECT_BINARY_DIR}/tes=
ting
>> -       )
>> - endforeach()
>> diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.9.3.bb b/meta-=
oe/recipes-devtools/doxygen/doxygen_1.12.0.bb
>> similarity index 80%
>> rename from meta-oe/recipes-devtools/doxygen/doxygen_1.9.3.bb
>> rename to meta-oe/recipes-devtools/doxygen/doxygen_1.12.0.bb
>> index 16a4250b2..ed0c71b31 100644
>> --- a/meta-oe/recipes-devtools/doxygen/doxygen_1.9.3.bb
>> +++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.12.0.bb
>> @@ -8,9 +8,9 @@ DEPENDS =3D "flex-native bison-native"
>>
>>   SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.src.tar.gz \
>>              file://0001-build-don-t-look-for-Iconv.patch \
>> +           file://0002-Fix-build-with-clang-19.0.patch \
>>   "
>> -SRC_URI:append:class-native =3D " file://doxygen-native-only-check-py=
thon3.patch"
>> -SRC_URI[sha256sum] =3D "f352dbc3221af7012b7b00935f2dfdc9fb67a97d43287=
d2f6c81c50449d254e0"
>> +SRC_URI[sha256sum] =3D "a3a3dba2018ef409d83d81a2fc42a0d19bdbe087252ef=
342bf214b51b8b01634"
>>
>>   UPSTREAM_CHECK_URI =3D "https://github.com/doxygen/doxygen/releases"
>>   UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#112929): https://lists.openembedded.org/g/openembe=
dded-devel/message/112929
>> Mute This Topic: https://lists.openembedded.org/mt/109023379/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

