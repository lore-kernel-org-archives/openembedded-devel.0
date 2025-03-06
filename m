Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D473C282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 07:09:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7177.1741244960131219499
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Mar 2025 23:09:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5160f33b3b=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5265PELv011897
	for <openembedded-devel@lists.openembedded.org>; Thu, 6 Mar 2025 07:09:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456cux1q62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 06 Mar 2025 07:09:18 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52679Hp6002355
	for <openembedded-devel@lists.openembedded.org>; Thu, 6 Mar 2025 07:09:18 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2174.outbound.protection.outlook.com [104.47.73.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456cux1q60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 07:09:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mKBkaBLHBFMayczkuugjEldPEhzWjeEehubSf3Jtt+QSLfOwCHUGG/vCRkLEHZ7IE3MugPDDM+wmYLTwNE57M3zvnFF8gZ3il3JAR9mZdqana0gGO/EBN3s4pYzyTMp6kxjQJwbwUtV4DE3JB/mY2fF5HshhYEi5aVohs7R9t6VqKG8yLx1J2V46VEfh+RBZvSpt0qQk5cb1z4+6dubLszxv/iAZ6brfkgE/++vY1Gai49OHXYCVRMTlVJfQSiY7fblPwcyKr1UwaS6SzCSrjaxWN69w3OtezYReRnxj53m/cfOCbLfTDBRMoxCg+y98KGmYCBEPJ3xrkiWTU/Htgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJ2KQS/wa7srJEaFn1P3iuSgsLyNUGUlRXQITCa5iK4=;
 b=baranLCralN6yqtxzdULpEKdtC+vTEuJ5jOV8CVza63VP45RdSJToD6tcCC/0DWTvGwyjap97YvFViXGDQ+NP74YHR5gOzHnSkIyXaNxOAXJbe1xpg514k0xo3CEDifqOdj6ULMuXBhWsCsDb6+Plg1qwnzSqKlM7KcSM6FeaqqosLqMdDFMGdQHkrfK/Y+WDLXF3YuDAnLRvCzmkYt8fJugKI86WgWj8swB0zsSrXgtasyGulu4f+lztzxRyfpDRWaocXDcugMpLi51FZmyI3Myu5kUt7qt9RgsIPOSb9EzPUfRwGN3ys4qwDs45w+GrSWW9PGpX0Op8q4geiH7PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH0PR11MB4984.namprd11.prod.outlook.com (2603:10b6:510:34::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 07:09:12 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%5]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 07:09:11 +0000
Content-Type: multipart/alternative;
 boundary="------------cA2epK7oWI3BbiQRYlNcLTZn"
Message-ID: <8fe2834d-f091-4d60-9457-e44d921b0a81@windriver.com>
Date: Thu, 6 Mar 2025 15:09:06 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [scarthgap][master][PATCH] phpmyadmin: upgrade 5.2.1 ->
 5.2.2
To: openembedded-devel@lists.openembedded.org,
        akuster808 <akuster808@gmail.com>
References: <1822B7353A1738B4.32551@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <1822B7353A1738B4.32551@lists.openembedded.org>
X-ClientProxiedBy: TYCPR01CA0093.jpnprd01.prod.outlook.com
 (2603:1096:405:3::33) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH0PR11MB4984:EE_
X-MS-Office365-Filtering-Correlation-Id: 67385a93-923f-4095-7a56-08dd5c7dcbbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|4022899009|1800799024|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VzFIdCtnZFFTbjd0ei9wZy8zejZxVVNRMzNyQTh1SlhVNFN4Mk5SQU02WFB0?=
 =?utf-8?B?RVNKOTBDNGdMZlc3UlpNbW5ycnpBemZQR2VkY1RCYlpZOXZKMHlaVlpsaXJh?=
 =?utf-8?B?a2V0N21QS3hqT1NLaC9jMEdnYzdzaXRWRlFZVXRoYmp2UndBbUNQUzFDQ3Vu?=
 =?utf-8?B?Y1ZzK1FNR1NZeFY0ZTREeWhZZ1N4cXZEVm1sRWxWTWs5RnFYelZ1WVRIS0d2?=
 =?utf-8?B?ZEhQUTgrbTRwZFdCb1pITXBpb1p5SWErVmpCZWpyTlAwMUZ3dG82NHpsbkI3?=
 =?utf-8?B?ckhaWVNFNDEvWEZjSzlBSzFZbnZ4Rm9HcE5EazRhYmg5bWJ4SjhnczNDT2dP?=
 =?utf-8?B?TCtySUtzMzEvOVRsb3N2ZkFKVyt2MXN3NXVvUU1zK1QvSEtnTFNlRUo2VXFY?=
 =?utf-8?B?eXR3WldDTWordmxXNnB6VUJxN1VGcnhETVNGMGQ5RWtwc2k0VWpJbDJ5Q2xY?=
 =?utf-8?B?UjNBekZ0TnZSRTNxSlg5ZVVhR0NEa1ZZenZoTm9CWWpXM1RvMzlmZHZrQlNh?=
 =?utf-8?B?ckxDUTBqbzNKUGRibDQxMFp2SzhiNXY3OHh0QXdHOU5tL2VKYU9SV0NzRy9C?=
 =?utf-8?B?QjQ1cmhGNHNxU1dwaXA4MnZmSUFNQ0xoUXBYZTRuT1hrQzdZMmtoQ2YvYmFi?=
 =?utf-8?B?c0luWkFPNEs0blRmcXExYzVsQkx1elIxek1tNjNUTzlMNmZ4QU1kelQzYk0w?=
 =?utf-8?B?N2NpenYrWTlUK2VUVzRIV1NSRmJkclVDanJVMEZDNTJVK3NvL09DRHpVWWNX?=
 =?utf-8?B?d1gvTVFMampmaVZpVTI4ZGFHeUpVL1Vpb0V5UG5PN1hDNWljNlhtN0ZmVDhB?=
 =?utf-8?B?ZUl0NE5aSk01TFRvMmEzMFJ3WWdXQ3MyVTViR2NMeGZXMWhSVW41NVF1VGtC?=
 =?utf-8?B?T3JSbk9nZ05XMkZUNmlVcnBNeUdKM215Z3hFV1puVE9IQnFLazhNR1BVWGIv?=
 =?utf-8?B?NElnY1lrMk9KWW1IS0w2V2hXUUJqdHExOHdFQzN4R2ZzSjRNVnI4cldFbUJ5?=
 =?utf-8?B?NlpTRW5JakVRMVVxRGJWaHVnRVhSQm1SNGR2SjdubzlXSFNmYTUyWVVERGVa?=
 =?utf-8?B?TXJlMFlYdkxvdTF0UlBzdUc2WGdWcVJqSUlvVWpOOHNxRGx0ZHhNZ0NWNzBP?=
 =?utf-8?B?K0NoNURDRS9nUFBrTDBaWDRJa3pGWi8rZXRuVDhPRFU5SHJwZXlsN05hLzFp?=
 =?utf-8?B?b1lYc3JQak5rZXpBMDNBUFNmc2ErMTk5SDIzeXJEZytzSWVxNHlFTXlmYkFQ?=
 =?utf-8?B?RkdKdjdhVHZGRDZjQU5CaDZZU3U2UzRlajcydXhJVDM5TjU1ZGhZUU1ZTUJ5?=
 =?utf-8?B?UkViOFZEajZuUFVFaHZrT1lkSXBldHFNbU5jdnMvYUhza1pRcWJEZExHL1ZT?=
 =?utf-8?B?R0prYnlGUzRxWUsxWWM3Zyt3OGI3MTZQZ1JqRVZVTlh1V2pTTUMzZzJ5emhP?=
 =?utf-8?B?RGV6TElSUm1yNWhQQTNTaWtPRlBpNC8zSnFES0Z2YXRBUmtLMHdlV1M0RGVz?=
 =?utf-8?B?R0NhWGVCMTNHd1U2TDhVTUdYVURESHdOTnhESEM1Wm05S0Y2RjRtaDZjTDdv?=
 =?utf-8?B?MjNvUUNwc3l2VGdsQ2RqN1ZUTXlIZ3RKaitiM1Q3ODhBY2VPamZBVjRXNTJR?=
 =?utf-8?B?dGdOSlU4TGpodmplSkJ1M1dSSmN4RzJrSDR2VjhKRWJjSXVrSjcxQjZXbksw?=
 =?utf-8?B?cVRzZWF3VE1FS3pNTThDRlhQQlRqTVBPQlgwV2lVZjRNbldGZWkzWmRCRlg3?=
 =?utf-8?B?VXZTb3hmaWRKSUJGYkdzK0c0VGppTzdNQWhlQ09jdW1BQi90SDI2Tk4wVzA0?=
 =?utf-8?B?RVJxT3NvRmdCNGI3S3pDUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ekFUTkZqb1lPSjhtODBla3NWQzU3aWlOOVduY0ZhWWFEU2RGM3dnZ0NMclhF?=
 =?utf-8?B?NnpZd3RQUU94NERTOE92c0RUaVhyVm9zWjlJUmNUM2hrN2I5dXhyNElCNEdZ?=
 =?utf-8?B?bTlsUFhrZUo3Wk51VHg0aDBrQ0NKbnBidGpzSDFDUE9xcHphdUJRVHJwQkN2?=
 =?utf-8?B?eCtJUjFCRkZrY0hzQlJySmZuUTVxQ0xLcFNDek9Bc3NHdytOYzNXSzMwaWFn?=
 =?utf-8?B?ZzlyK3BTdXZ1Ujd6ZU9DZnBHSWgxUTJ6b2N1Qk5ScU1zdkh5ZU1TNlM3eW1y?=
 =?utf-8?B?OERHTlMvd2VkU1o2c0FMbEFxL1hxL0dtb2RnYXNCM2RXVU9VM0FxTFBLZDI4?=
 =?utf-8?B?MWhEeDVPWmMzMDF6MVNYUzNQYkZqODNNTmNYVzAwSk1xM2pkdWczbEtKay81?=
 =?utf-8?B?ODZ4THJwZ296WlRIVkJhdEh5WTZoU2VUcG1vK3JwaklJT1ZWakdWV3lQUnF3?=
 =?utf-8?B?dFJPOGNoSDJRaTlpenVGcVBZMG1COUFoU1RNTWpFd2FhMEk1VjJxWGhocDNR?=
 =?utf-8?B?ZmxHclhHUng3SkZsQUJFTzY4NDNJNWZQZUwvTEF6NVZxcFZ0VnQ3VmNzSGlK?=
 =?utf-8?B?YzRjUkVRZGRRRWd1ZFBPbXFGQWxNdWV6Tkc0NmtEMTI1emYyUVdNTWV2OGpR?=
 =?utf-8?B?dS9sZXFVK08wd21ld3NFWHNwcXExZmpOS0MvcVU1bmw2UUtYOFlXSmxRVmtq?=
 =?utf-8?B?WEJoK1ZMNkR2QmYwT1NrR05DSGNNZmgrVENUeTcxWWNsdE8yUTcxTG5vR3pD?=
 =?utf-8?B?QjNHSmRtMzduSDg3SkUwdW93STVVckVoYnl2OWxNWGlnbGZiVUJaWTdaallC?=
 =?utf-8?B?N3M5M0l0am9ISEJDR0E4V1hzUXBHVnA1MlREZGVla3oxeVZuRlBMTkN4c2Zh?=
 =?utf-8?B?Q1YvaWZqWkVsVUlseGgwWjJkMG5QTitpcGtlUHZtN2JPS1JuQmZPUk9TODcw?=
 =?utf-8?B?RzhpTnNBMEF0VzRRNUNGR0hXSFp4Y3M4K0l6M05HejgvbmVHMDBvcDQvLy8y?=
 =?utf-8?B?b0hwY2t0Y1JlRGE1c09qYmdDSHZQYlVqYXJDeWNRUHRQcmxqS1RlN0xETkFu?=
 =?utf-8?B?NVNFR0RUelgwY2VOMDZTa3VQZFRGT3VnckxDR29GcmN3ajAzeWhmQ3lpallo?=
 =?utf-8?B?aWJoanBGRmNrT1h4RGF3UXptY0tkUnJhRi9xTERCUW1JdHZGYjRNd2w4Vm9K?=
 =?utf-8?B?dGVGekRuWEZCNFl2ZTVNR1RYZ0VYem5PRmw0TW10amNvM0Y0Tmp6TDREdUQw?=
 =?utf-8?B?SHNzdUpvZ2VrTUxDZngwNzlNY2xCbk5YdnlhVXFEL1RZWlc1cDVwNzh6RTBO?=
 =?utf-8?B?ZkNnVnplV2NCTnNtSEJ5VUlncVF1bUVlcWJSekpjbG91cVlYcHgrc00zMnMy?=
 =?utf-8?B?M0p6bDNVd2hBL1ZPeHNuaFdyeFEwbm1EYlREbGh2b3ZneHJSZC9HZnFrbDEy?=
 =?utf-8?B?WVdaWXhLZkZVVHdpZ002R3ZqcURqcmJseTZhSFdQaFY3NUcvaGhnV0tQc29V?=
 =?utf-8?B?NzlBWWYvNnhuL3NyQmdTam01WE1tU0JIUHVHRktmSFQrUlF4QXoxVFFEOXBa?=
 =?utf-8?B?d0Z6OWV3SGdpK2M2bnpyelJVTVdDelFBZWEyV09MOHZNZHNRUjltNlY2bG12?=
 =?utf-8?B?Vmt3ZENWYnhoWCswOEpLK3dlQjZWQ2J6bXVUSU5Genp3dTZjVzY3RVNGdTJn?=
 =?utf-8?B?em5CbzIrN2xvUDNEQUFiUnY5L2M4V2txb29lc1BlZnRlejBuQWlKcXh6Yk5t?=
 =?utf-8?B?TitmZUROdEM2SEEyRFdranVKK05Rb1NYT0R6ZTZiMXQ5QUxkQi9oZmNWWVNy?=
 =?utf-8?B?Zks5a2QzM214b3BCOXkybXU3SVNMUUpBNWNEb3o1UzUxUkc0OGVMVmtIRkkw?=
 =?utf-8?B?RmFoN2NKcFdTMFo4dDlwcGtpd24rMDRsQ0UzZ0s5SlR2aDdtWnBjWVJlcHJl?=
 =?utf-8?B?bHVvekxjMjVzeEhZOWU5d3RjZXB5amtOZm9oZlcrbzZ1ck9tVm91ZTdOc3BU?=
 =?utf-8?B?TmFxbFZDL25pME5DY0JLSnNzVGFUYXhSNjI2RzdoZGdhRi9nSzdOSUNuN0lk?=
 =?utf-8?B?c3pVQTNEVk1HbzZSRjFoekRnYzB2TGRIU2dwYnNxL2FjSVFjSEJQdFJDZXY2?=
 =?utf-8?B?OXBCS2J1WGN0aERFQkxnL2Yza1RkN0hycHdPMXRZUFVMRjUxOHcwbXU1ak5E?=
 =?utf-8?B?anc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67385a93-923f-4095-7a56-08dd5c7dcbbe
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 07:09:11.8368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EZxap7sgKOUtot0YIh+UhdX+fZHk8ZW54tGbgrusKSJNtfGZgsF0LaXJO3e4Kq5KcyS6KXkDZ3+e3yf5inXrG+Tt4Dko1p1Y3zh467C3kqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4984
X-Proofpoint-GUID: 0Ltq4PjQvVREkK0NHa928CFGvnna-1xC
X-Authority-Analysis: v=2.4 cv=ddB63WXe c=1 sm=1 tr=0 ts=67c94a1e cx=c_pps a=yneE0G6ieORTwLKR6pgPXw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=sntlU3ZaAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=cY79GYoYLLl-gvcmQFcA:9 a=QEXdDO2ut3YA:10 a=ZHp1PDvQXKyvBHuofP0A:9 a=QGM12V81bcsjmjO6:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=ImwWUX5h3JJ3gRE9moBe:22 a=xslW_GA4FUbfK35qJ43B:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ovTvWoPLAYki9ohjWKGKTLoQVBgo4XrO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_03,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503060052
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Mar 2025 07:09:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115765

--------------cA2epK7oWI3BbiQRYlNcLTZn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

kindly ping for scarthgap branch

//Changqing

On 2/10/25 10:17, Changqing Li via lists.openembedded.org wrote:
> From: Changqing Li<changqing.li@windriver.com>
>
> License-Update: License year updated
>
> This upgrade include security fix for:
> CVE-2025-24529
> CVE-2025-24530
>
> Release note:
> https://www.phpmyadmin.net/news/2025/1/21/phpMyAdmin-522-is-released/
>
> Signed-off-by: Changqing Li<changqing.li@windriver.com>
> ---
>   .../phpmyadmin/{phpmyadmin_5.2.1.bb => phpmyadmin_5.2.2.bb}   | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_5.2.1.bb => phpmyadmin_5.2.2.bb} (91%)
>
> diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.1.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.2.bb
> similarity index 91%
> rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.1.bb
> rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.2.bb
> index 34b710e885..c98ce4585b 100644
> --- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.1.bb
> +++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.2.bb
> @@ -3,7 +3,7 @@ HOMEPAGE ="http://www.phpmyadmin.net"
>   # Main code is GPLv2, vendor/tecnickcom/tcpdf is under LGPLv3, js/jquery is under MIT
>   LICENSE = "GPL-2.0-only & LGPL-3.0-only & MIT"
>   LIC_FILES_CHKSUM ="file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 \ - 
> file://vendor/tecnickcom/tcpdf/LICENSE.TXT;md5=d0ff7e060074497f34481cf574e8a581 
> \ + 
> file://vendor/tecnickcom/tcpdf/LICENSE.TXT;md5=72bda492a00ee8c4121987c6afdefc07 
> \ 
> file://js/vendor/jquery/MIT-LICENSE.txt;md5=de877aa6d744cc160ff41c26a8e4811f 
> \ "
>   
> @@ -11,7 +11,7 @@ SRC_URI ="https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-la 
> file://apache.conf \ "
>   
> -SRC_URI[sha256sum] = "373f9599dfbd96d6fe75316d5dad189e68c305f297edf42377db9dd6b41b2557"
> +SRC_URI[sha256sum] = "f881819a3b11e653b0212afaf0cc105db85c767715cb3f5852670f7fc36c9669"
>   
>   UPSTREAM_CHECK_URI ="https://www.phpmyadmin.net/downloads/"
>   UPSTREAM_CHECK_REGEX = "phpMyAdmin-(?P<pver>\d+(\.\d+)+)-all-languages.tar.xz"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115323):https://lists.openembedded.org/g/openembedded-devel/message/115323
> Mute This Topic:https://lists.openembedded.org/mt/111095784/3616873
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  [changqing.li@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------cA2epK7oWI3BbiQRYlNcLTZn
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p>kindly ping for scarthgap branch<br>
    </p>
    <p>//Changqing<br>
    </p>
    <div class="moz-cite-prefix">On 2/10/25 10:17, Changqing Li via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1822B7353A1738B4.32551@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

License-Update: License year updated

This upgrade include security fix for:
CVE-2025-24529
CVE-2025-24530

Release note:
<a class="moz-txt-link-freetext" href="https://www.phpmyadmin.net/news/2025/1/21/phpMyAdmin-522-is-released/">https://www.phpmyadmin.net/news/2025/1/21/phpMyAdmin-522-is-released/</a>

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 .../phpmyadmin/{phpmyadmin_5.2.1.bb =&gt; phpmyadmin_5.2.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_5.2.1.bb =&gt; phpmyadmin_5.2.2.bb} (91%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.1.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.2.bb
similarity index 91%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.1.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.2.bb
index 34b710e885..c98ce4585b 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.1.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.phpmyadmin.net">&quot;http://www.phpmyadmin.net&quot;</a>
 # Main code is GPLv2, vendor/tecnickcom/tcpdf is under LGPLv3, js/jquery is under MIT
 LICENSE = &quot;GPL-2.0-only &amp; LGPL-3.0-only &amp; MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263\-file://vendor/tecnickcom/tcpdf/LICENSE.TXT;md5=d0ff7e060074497f34481cf574e8a581\+file://vendor/tecnickcom/tcpdf/LICENSE.TXT;md5=72bda492a00ee8c4121987c6afdefc07\file://js/vendor/jquery/MIT-LICENSE.txt;md5=de877aa6d744cc160ff41c26a8e4811f\">&quot;file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://vendor/tecnickcom/tcpdf/LICENSE.TXT;md5=d0ff7e060074497f34481cf574e8a581 \
+                    file://vendor/tecnickcom/tcpdf/LICENSE.TXT;md5=72bda492a00ee8c4121987c6afdefc07 \
                     file://js/vendor/jquery/MIT-LICENSE.txt;md5=de877aa6d744cc160ff41c26a8e4811f \
 &quot;</a>
 
@@ -11,7 +11,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-lafile://apache.conf\">&quot;https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-la
            file://apache.conf \
 &quot;</a>
 
-SRC_URI[sha256sum] = &quot;373f9599dfbd96d6fe75316d5dad189e68c305f297edf42377db9dd6b41b2557&quot;
+SRC_URI[sha256sum] = &quot;f881819a3b11e653b0212afaf0cc105db85c767715cb3f5852670f7fc36c9669&quot;
 
 UPSTREAM_CHECK_URI = <a class="moz-txt-link-rfc2396E" href="https://www.phpmyadmin.net/downloads/">&quot;https://www.phpmyadmin.net/downloads/&quot;</a>
 UPSTREAM_CHECK_REGEX = &quot;phpMyAdmin-(?P&lt;pver&gt;\d+(\.\d+)+)-all-languages.tar.xz&quot;
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#115323): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/115323">https://lists.openembedded.org/g/openembedded-devel/message/115323</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/111095784/3616873">https://lists.openembedded.org/mt/111095784/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------cA2epK7oWI3BbiQRYlNcLTZn--

