Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E562E7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 06:53:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14477.1733986436501066315
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Dec 2024 22:53:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=207665b5af=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC5emBb010241
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 06:53:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cwy3n73e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 06:53:55 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BC6rsnT018347;
	Thu, 12 Dec 2024 06:53:54 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cwy3n73d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 06:53:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDuE7rwUyY+HFUY/WZBNI4dmii9dvdfsHMQ7Wgpgxq+FX3XJJLQ/K5XTP0WVh6IGDUM+GTf1H410DutNVoFdcMO1MZkPmgnrp48F4pNmCzKDbR5vtCwwDM/pRvuj4kGt6Ey6feyVssjohPcY/85r+EgzC6e9T+DpQo2ekxmTSea8NnuM20xZ7g9ZLP7PNCYRJnA91xkL0BsmknKhoEL+OWIxoeA63guiWG2QGweXhTtw2XuKsgjUqBvKkqVY5vgja/gNmfUJC1ZPsTHZO3a3gODauvAXQ0uFO5UfXnsvd6P23AJ3sr3Lwn/gq7WgQ3obvMIGwb4ElL85hFhVWEXi1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uuWqsG2jbQPt+tvgKA11DAfKWWn8vz93i0k1a6XvTxY=;
 b=XTtZ3uNGSDEBWl6uQaUPNI8fMPbeUxhrXO2wZxLlR3xphB0b3iDfab52MDz6ftWmI43d/0PMxnBp3UOg6li6RKuSgINlnPvHp4NgSF+HSpZY90QQc9/3yQvN0DKhuLtGyXUOjwW1OxLhlIS5lvDxkM8D4HWP34B9Y9aOUElpPR2niRjSdN8FGi/A6/NKPL9xyHoN3jSCEEEu5dOVPSIFBTQ38WqCWPtE1E7ocPc8TJivFjPL4Me1CyhgcxEzrB24VlJC1JfFCkESEXFKqCbJlwyw5IYwz+ynOMvVGn2B0yEarEaBVL8pTBoZNwdAt+xzW4Etahk00558q96iWv1rYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by CH3PR11MB8139.namprd11.prod.outlook.com (2603:10b6:610:157::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.14; Thu, 12 Dec
 2024 06:53:50 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%7]) with mapi id 15.20.8093.018; Thu, 12 Dec 2024
 06:53:50 +0000
Content-Type: multipart/alternative;
 boundary="------------0djYvjSYJ9QMp6mygHG0Ih9u"
Message-ID: <6f108edf-a626-45da-9a2f-b3ac838eec86@windriver.com>
Date: Thu, 12 Dec 2024 14:53:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] nodejs: upgrade 22.11.0 -> 22.12.0
To: Khem Raj <raj.khem@gmail.com>, martin.jansa@gmail.com
Cc: "J. S." <schonm@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20241204045407.2978-1-schonm@gmail.com>
 <CA+chaQdXHkju6U1355phTU64K6MMR+DrwBbXjyGTsiH+w-j=+A@mail.gmail.com>
 <34fde8bf-eeee-4900-b5ee-24849eebce9e@windriver.com>
 <CA+chaQc-T7-i6Ju9qiyaQVeR6a9gkonmyAXB4M3dVf1WiuRsFA@mail.gmail.com>
 <CABTo8gA3Y=fPX2K1sYFxtMxtUrExvKcHxY2D0VfsR71=V835=g@mail.gmail.com>
 <CA+chaQehE5=0phBadO=bg7Finw8AKHcsNW489N+07VutfHp_LQ@mail.gmail.com>
 <CAMKF1srzH5zXm-5GwpfcZzVSzBaNP2NE0_VKNH_zZOf1A1nuvA@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CAMKF1srzH5zXm-5GwpfcZzVSzBaNP2NE0_VKNH_zZOf1A1nuvA@mail.gmail.com>
X-ClientProxiedBy: SI2PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:194::22) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|CH3PR11MB8139:EE_
X-MS-Office365-Filtering-Correlation-Id: 94d0d024-bda6-465d-f2ec-08dd1a79bb9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|4022899009|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QUcvbHBraktBb2RXd2k1RFFzRlNFVERyN1UxMG5QSFpRNHNHc3RDM3lMUkYw?=
 =?utf-8?B?Z09ncG42VkNtOURiMkNwVHMzcVZjTm03Z0d4bE82aU42YVNDaUdvS3gyckY3?=
 =?utf-8?B?Rkw1UVBhTTNLNkFwZzdqcGVTZ0xaZDdkbXAzVDJTZ2JGbTY0UWpBK1ZOWTFl?=
 =?utf-8?B?S0Vaajl3a0ZhMEUwdXhtNHYwd1RhTnl3UytOZ2ZEZXdmK2M3NVRsaFJ2eDJB?=
 =?utf-8?B?Wk5LcUQ5cVAwWlZRenBqejhvblhwTHhxMUV3NWRYczFYRG9ra2FEcitLQ1lF?=
 =?utf-8?B?bDErbFcrdURvdWVlT25VakRLTDZoWERHRDM5RndtQWxJNTVRbnJub2trUFBP?=
 =?utf-8?B?L1NSdHhJSzB1RTdybHp5U0MwMkVVb0l1MmpJVXBKWXB1VzNSYU5ReTFHQjhm?=
 =?utf-8?B?alpjZ2x2WEVFOEthbTBqai9aV01IaG9vMHFWdHdQVmxhTk8zeWRKcmdSeDBV?=
 =?utf-8?B?R1ZjQnFCMWNQSjdOTUVHL1ZNS3BXbTEydnNJSHhDWGVVUGNQdUdnWVpyL1ZS?=
 =?utf-8?B?bU94cTNVUWU5UVlUaDUwVG5FUzRZYUl3eldkOU1yYVlITFpLNTAxazBDWEEv?=
 =?utf-8?B?SDAzaTQvZXhXR0h0SXVPNWV3V2ZJZkV6VlM4MVdEb1hydkZtL0pLVjR3cUJF?=
 =?utf-8?B?cnRDUW0rZXVwRFp6NkJpTmtJTXdMU0had2QvTEd0SGtzaklnRlNuTExhVko1?=
 =?utf-8?B?YWZrVy9mVklTdndKSitVdFF5YTZJVEU5OUZKMjMyZXhRM3kvVUZkV0RPajAz?=
 =?utf-8?B?SWZNZjgzd3V3M29tN2gxalRUVi93UzVBemVMeHdoOFFHMXk2Ykd3d3crWGRo?=
 =?utf-8?B?RmtWMVk3bGVFNkFpNlM2MFNDeGFNZGdxVWlZSlM1Y0toZHBtUG9uekdiTGE5?=
 =?utf-8?B?d3NQTHlyakkvVG9kakRJZi9zY1VKOG50bEUzdW1BaHB4V2UyWFYyMnljZUsy?=
 =?utf-8?B?M1dTMEpZSUxXTkd1Z0ViREhoU1U3c0NWY0FPRXl6YkFCa0FQenR3RTlaeldO?=
 =?utf-8?B?Z3E1VGtWUHFQTVdVcElWbzJtajNrQlN3QWtSNUJsTlFpZjZVK0tMeGNiSERT?=
 =?utf-8?B?SjFJdlMydXNGaUtiVWhvVXRJeFk2VFAzajQ3VnBOMDBBNTA2ZzFqbFdCR2dM?=
 =?utf-8?B?dGFQSkpnYzRIbVplZFdQQ2RTUVpsdUpZR3I0SEo5MGYzT2NDay9PUUhTblR5?=
 =?utf-8?B?MzlETG10bjQwckJOMFl4dzkwSkdFSWhaWGdRTys3THV5RVVHMThKaXZWR09M?=
 =?utf-8?B?WUI3OEZ6VUdqMjlKZk9jMXc3YkdSRDllZ3RqYUlXQllnRG10T3FkQ1pTMzlw?=
 =?utf-8?B?WnF6YUdodkZ4QjZWbTFScGtTMm5LTG1qMnAxczVNd0UxUWFZRXRBMEt0RWZ1?=
 =?utf-8?B?dWxFazR4Q0VrckxseENXd3IvZGw2ZnNJT211TDUzVUFmZkppS3ZFVEx1RDZk?=
 =?utf-8?B?dUxoSERXaFNlWTBHNk1PVXNHZllNbkNadnBWRENGVHorSW1tdi9Ka2w4YW90?=
 =?utf-8?B?Zk14djBCb0E3eUdaUUpFaWNReW54UExudnlWWEdNUXRwVG9KRmhEYkUrVjhC?=
 =?utf-8?B?dEVSNEFnRFZTbUlPY0I1RjMzRlpDbU5XbjNMR3BwYjFraE1DZnVUREs3Mlly?=
 =?utf-8?B?QmZUSDJYMi84MFpEcGJCUFVjeU83b3ozRDlqRDNCWTdOM2FUU0I1aFRkb0pH?=
 =?utf-8?B?QUs0WFEyWUpBaWV5Rk5MTE9ZYjVxUnR3aE93Mk02Nmc0N2xqVUozbnlSSDNH?=
 =?utf-8?Q?daxiJE9W4a/L/a5n68=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dkQxNWNzdVZvZG1uaks5THY0K3lLb0gwZnE1emo1UHpzWm4rM0JwTmJIQmVH?=
 =?utf-8?B?aTVxT0VFT002OW16aklIQWVsb3ZYbEZaOXdCbGR4T1RYTkpSVTFWSnFieEsw?=
 =?utf-8?B?SXZIdGREOXMybTVJY3RKaFI2K01GbG55S2R0Q01NVldoWGZzY2VOcU4xZmdV?=
 =?utf-8?B?dHhmMzJLRG0vQXhVN0t1eDlEM1BWdmdvNkpIL3VMa1FWRVNSSXI2YThYTUV1?=
 =?utf-8?B?VElSV2k1WkZTSWkwSmIyZ2xwaDRYK1NvRXpsTWhLRkNBbXZuMUN3ZWgxVng4?=
 =?utf-8?B?bzRBbENzMEJSRG5vNE1zTVhuNTVTTDdUTUQraUZlOWZtdjVJYkQ1TUhYR0Uz?=
 =?utf-8?B?ZERQclNrMERyZFFkdDJqTjY2WXVId0REaUozbmhUY0EwSkEweVBLbWVTblh0?=
 =?utf-8?B?WWFtdlFyMHhudGo5VnVXNkFpbnNmYi83R0xUM05nemlpNWtjU2hBQitTdzNv?=
 =?utf-8?B?MzgzT0VpUjhMOFpxazBUaTZubnRlWFovM2luNEh3a2hRWGU2NGJWenZhb1g4?=
 =?utf-8?B?aVpJL1RsazVqTTBadUZKKzduTEZuWTJSaGd0RzQzNmZySUhoemZYcnNpUlVs?=
 =?utf-8?B?V3BkV0Zjd1JUTUJ0bjJBR0JBYitQa1NTY1BpTGhVOE9PZk9BVlFxUXB3bXV6?=
 =?utf-8?B?YjlqZ3poSy9HN3BKUWZIdzNBV3NKYUVOVFRjaVpHU3drY0NQWExwVmtlREVF?=
 =?utf-8?B?dEtHM3UyZ2FPRmVwUFRDT3BnUTZUSGwrZHA0K0ZFRFk2bldYemRjNE1UL3hC?=
 =?utf-8?B?bkpZUXA2ZFc4b2J0TFh2ZEI0aGRRMWUyRnd2WXRCdG93djBSdEpibThyWC8w?=
 =?utf-8?B?NHVuU2xhQUxZdjNsYVRXTGpyb21od3FlOGJKekFZU21oNFVBd2hvMFJCallD?=
 =?utf-8?B?bnRjaXFONHNNL00zT3RtbTFud29KM21Hd2h0M05hYjdBZzJ6NDdpSVBjRFdV?=
 =?utf-8?B?ejNGdlNpS2E4UnZNM205ZUt1d21Sek5Wd3l0T1Z5VDhFbHNyNkRpT1d1TnpX?=
 =?utf-8?B?TUdWZkg3bHlSZ3N3RHFTSjU1d05Lb2hrcXdhOVJJWHNBeHBtYVZEM1lPbzZ3?=
 =?utf-8?B?N3h5YnRJSEFIUXNBOHk0U0diUjNYN1pjN0xZSWl2bmxEVmd5VG4vL0xTeTlG?=
 =?utf-8?B?dXdvemdDa0k0eE42SStXRXh3RWhnaWtWOVRVRlNsTmN5aFlRYVF3WUZvcjB5?=
 =?utf-8?B?M3FMeEJoQzczQmlkRExiZ0pLL0xpRWRKdkVURm0zQkFVbzFZRGk0V2tKQzhR?=
 =?utf-8?B?ZWJTeTZJWTVPYUN6QnhWU3ZjNjUvNmhKUmptV0h5Qk5WWlk0WkZIeUJLaFYw?=
 =?utf-8?B?RjUxRG9hdUFFTU5mN0Qza2VQa3I1K0ZIL1RiWmExNnlEeDZINXVYOG5xVEpI?=
 =?utf-8?B?bFppWENycTFuSnVWV29URjIrcjhHL1FqSGlwaUVyd053bWxqYmowLzdiaUpK?=
 =?utf-8?B?SzI2c2lyQVdYV3hsMHN3TXlxZnR6TFAvUGpRY3E5Y0U1OFBua2U1Wm9zTStX?=
 =?utf-8?B?aGRIV0VLOFkrdFZyMFg2SUFZRGQ4Q2pVM3pIRDFxQ2h0REs4RnJyMW1kOWhj?=
 =?utf-8?B?SEZ5d0JLQnA0SzVyUjd0Q0V2RllmTi8xSDcwUkJZVXJiUEpHUllXMUQrMnVO?=
 =?utf-8?B?ZWhqQTFpcUE1OHFRYVE5YnNaWXdaQU9uNUY4azIrVjhsZlgvRDIxMHVCOUw4?=
 =?utf-8?B?SVE1Ynh3aDRnam51SGRsMFZpQk9oQUFjTEJEWVVwbjZ0RVNaUXljVm9FRS82?=
 =?utf-8?B?RXpZMHlHSFQycEJ4cUVaZ0Uvb29VUHI3dVpTOERxUHFob0w0WktLNmxRbmV0?=
 =?utf-8?B?dElSbVNINGkzWDJtczh5NkR6dXp3OTNqT0EzaXRjVTl4ZFhoRTY5NmtvaW1k?=
 =?utf-8?B?MzB6THZ5RklMVk9PdW0yTWJzQk05dmVFMU5kMGNxMVhPK2dtcnQ1c0VGQVA3?=
 =?utf-8?B?YWFkZ2h0QVZQMXdpT0ZPdU01T0s3K2Q0MXBUTWZJUFFwQS9OVDh6QzNNT3Ix?=
 =?utf-8?B?b3FZYW1RMkhrSEhxYVU5Q1ZZOW9mQTZqYWN3VFFPeEtPTmVaUm1XRWxlcDR0?=
 =?utf-8?B?d1hPOUtnY1ZFU1RXa0YwS2FGY1VVVExvMXU4U2ptVERXT2RUNVN0bi90VGcr?=
 =?utf-8?B?dU5RUDdxcU5jc1VjeFVLZXl5M2FSRHk4ajhGMGE3eldqdjh6cUhvaTl3Vzkw?=
 =?utf-8?B?U0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d0d024-bda6-465d-f2ec-08dd1a79bb9f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 06:53:50.0884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l5t1egmvm2gfu0HReTwVApclHAXhorvMxMjJQ1OLf4ewPoxmugVIRWao+k4g5YDIRwKlkSUqWRUtM74ur3BE8R6wASKQYpcfTJ80puZlRL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8139
X-Proofpoint-GUID: RnD5sqZvKdGnvvzimSwuX_5iTnjiWD78
X-Proofpoint-ORIG-GUID: yABBxWx64TSMcdiGbyRn3A9jeNUOzB8V
X-Authority-Analysis: v=2.4 cv=D7O9KuRj c=1 sm=1 tr=0 ts=675a8883 cx=c_pps a=t4e0UQJdoJrPmzgCWb9hsw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=mDV3o1hIAAAA:8
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8 a=-LCu6K_DAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=I4CVGJvf7NkWeWEdnR4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=V6ZpodWEruQA:10 a=estwG2eNYqAOIwiJ3NUA:9 a=dtDbREWpXAjFk15V:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=T1a-OTYGVawA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-12_02,2024-12-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412120046
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 06:53:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114289

--------------0djYvjSYJ9QMp6mygHG0Ih9u
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4BC5emBb010241


On 12/12/24 07:31, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Wed, Dec 11, 2024 at 4:36=E2=80=AFAM Martin Jansa via
> lists.openembedded.org<martin.jansa=3Dgmail.com@lists.openembedded.org>
> wrote:
>> It doesn't fail for me with:
>> g++: error: unrecognized command line option =E2=80=98-std=3Dgnu++20=E2=
=80=99; did you
>> mean =E2=80=98-std=3Dgnu++2a=E2=80=99?
> This seems to be the host compiler being too old  < gcc10 see
> https://gcc.gnu.org/projects/cxx-status.html#cxx20
>
> nodejs20+ expects atleast gcc10 these days see
> https://github.com/nodejs/node/pull/46806
>
>> was it target nodejs or nodejs-native failing for you? I'm using
>> reasonably new host OS (ubuntu 20.04, 22.10, gentoo) with new enough
>> gcc to recognize gnu++20.
>>
>> It seems to be added since v22.2.0 already with
>> https://github.com/nodejs/node/pull/52838
>> https://github.com/nodejs/node/commit/e4b187433de1f71019f248b94b11fcdd=
6f22c359
>>
>> Did previous 22.11 build for you?

Thanks all.=C2=A0 Yes,=C2=A0 my host gcc is lower than gcc10. with gcc10+=
, it can=20
build successfully now.

//changqing

>> For the host-user-contaminated issues I've reported I've verified that
>> reverting libuv upgrade (as in
>> https://git.openembedded.org/meta-openembedded-contrib/commit/?h=3Djan=
sa/nodejs&id=3Dec3963c2ec7387e3771364a1bdddea963b3ef075)
>> avoids this issue again, but I'm still trying to narrow it down a bit
>> or find some small reproducer to more easily debug pseudo (and I'm
>> currently failing even to capture full pseudo logs with PSEUDO_DEBUG
>> env variable).
>>
>> So I don't mind keeping this version in master (if nobody else suffers
>> from these host-user-contaminated issues) unless revert to 22.11 fixes
>> the nodejs build for changqing (which doesn't seem likely to me).
> I think we need to fix pseudo and it might be best of all, reverting
> will only buy
> limited time.
>
>> Regards,
>>
>> On Wed, Dec 11, 2024 at 11:18=E2=80=AFAM J. S.<schonm@gmail.com>  wrot=
e:
>>> If it is easier to send a patch to revert to nodejs 22.11.0 I wouldn'=
t oppose.
>>>
>>> On Wed, Dec 11, 2024 at 3:05=E2=80=AFAM Martin Jansa<martin.jansa@gma=
il.com>  wrote:
>>>> On Wed, Dec 11, 2024 at 4:49=E2=80=AFAM Changqing Li<changqing.li@wi=
ndriver.com>  wrote:
>>>>>
>>>>> On 12/7/24 22:08, Martin Jansa wrote:
>>>>>
>>>>> CAUTION: This email comes from a non Wind River email account!
>>>>> Do not click links or open attachments unless you recognize the sen=
der and know the content is safe.
>>>>>
>>>>> This seems to reintroduce io_uring support in embedded libuv from:
>>>>> https://github.com/nodejs/node/pull/55114/files
>>>>>
>>>>> I cannot reproduce this issue since I cannot even compile nodejs su=
ccessfully,
>>>>>
>>>>> poky master qemux86-64,  do_compile failed with error:
>>>>>
>>>>> g++: error: unrecognized command line option =E2=80=98-std=3Dgnu++2=
0=E2=80=99; did you mean =E2=80=98-std=3Dgnu++2a=E2=80=99?
>>>>>
>>>>> which leads to the same issues as previous nodejs upgrade in:
>>>>> https://lists.openembedded.org/g/openembedded-devel/message/105583
>>>>> https://git.openembedded.org/meta-openembedded/commit/?id=3Dd084539=
78c31ee41d28206c6ff198d7d9d701d88
>>>>> https://git.openembedded.org/meta-openembedded/commit/?id=3D0d9351e=
9290f6750e44ab52536bbe9268d5afac3
>>>>> https://git.openembedded.org/meta-openembedded/commit/?id=3D7bb2862=
8991ec9be9610540401f7c6cc4c19997f
>>>>>
>>>>> pseudo still doesn't support io_uring:
>>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15244
>>>>>
>>>>> calling chown in hundreds recipes to work around pseudo limitation
>>>>> doesn't seem good work around.
>>>>>
>>>>> The UV_USE_IO_URING variable still exists in code (even after its
>>>>> documentation was removed in:
>>>>> https://github.com/louwers/node/commit/2b298e132d2f681270e9f3d5eb31=
34914653d2e1
>>>>>
>>>>> I think the problem reproduces since io_uring support is enabled ag=
ain by default in above commit, which is in 22.12.0.
>>>>>
>>>>> for now, UV_USE_IO_URING should still work, we can use export UV_US=
E_IO_URING=3D0 to disable io_uring, but as the doc
>>>>>
>>>>> said maybe UV_USE_IO_URING will be removed in the future version. s=
o another option is to add a patch to disable io_uring like
>>>> Yes, unfortunately UV_USE_IO_URING doesn't avoid this issue.
>>>>
>>>> The old minimal reproducer I was using before (com.webos.app.minimal=
)
>>>> doesn't trigger this now, only some other similar apps. I'm trying t=
o
>>>> find out which exact call triggers this (as it might be faster to
>>>> figure out than bisecting nodejs).
>>>>
>>>>> this:https://git.openembedded.org/meta-openembedded/diff/meta-oe/re=
cipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.=
patch?id=3D0d9351e9290f6750e44ab52536bbe9268d5afac3
>>>>>
>>>>> ) but it doesn't seem to work.
>>>>>
>>>>> It's failing because the
>>>>> 0001-deps-disable-io_uring-support-in-libuv.patch patch restored in=
:
>>>>> https://git.openembedded.org/meta-openembedded/diff/meta-oe/recipes=
-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch=
?id=3D6652b031d7d4d9cabf16d481f3b82115f7d8e15a
>>>>> is wrong (it adds
>>>>> meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-s=
upport-in-libuv.patch
>>>>> inside nodejs source instead of patching deps/uv/src/unix/linux.c).
>>>>>
>>>>> Yes,  this patch is added wrongly.
>>>> Should I send a patch to just remove it (as it didn't do anything
>>>> useful in this form) or wait a bit more until we have a complete fix=
?
>>>>
>>>>> //Changqing
>>>>>
>>>>> I've restored the patch properly in:
>>>>> https://lists.openembedded.org/g/openembedded-devel/message/114222
>>>>> but it still isn't enough and recipes fail in do_package or
>>>>> do_package_qa (depending on UID used on host).
>>>>> Reverting to 22.11.0 avoids the issue. Anyone else seeing this?
>>>>>
>>>>> +Changqing Li
>>>>>
>>>>>
>>>>>
>>>>> On Wed, Dec 4, 2024 at 5:54=E2=80=AFAM J. S. via lists.openembedded=
.org
>>>>> <schonm=3Dgmail.com@lists.openembedded.org>  wrote:
>>>>>
>>>>> License-Update: Add JSON parsing library under MIT license.
>>>>>    https://github.com/nodejs/node/pull/56040/commits/27bcd103e775e0=
0eb8d03ac37052bbd4ccb6d239
>>>>>
>>>>> Drop backported patch fix-build-with-icu-76.patch.  It is already
>>>>> integrated in this versionhttps://github.com/nodejs/node/pull/56040=
/commits/c3ca978d9c73d1a96f4d5c7bfa3c10ce786b8fe9
>>>>>
>>>>> Changelog:https://github.com/nodejs/node/blob/main/doc/changelogs/C=
HANGELOG_V22.md#22.12.0
>>>>>
>>>>> Signed-off-by: Jason Schonberg<schonm@gmail.com>
>>>>> ---
>>>>>   .../oe-npm-cache                              |  0
>>>>>   ....11.bb =3D> nodejs-oe-cache-native_22.12.bb} |  0
>>>>>   .../nodejs/nodejs/fix-build-with-icu-76.patch | 29 --------------=
-----
>>>>>   .../{nodejs_22.11.0.bb =3D> nodejs_22.12.0.bb}  |  5 ++--
>>>>>   4 files changed, 2 insertions(+), 32 deletions(-)
>>>>>   rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-22.11 =3D=
> nodejs-oe-cache-22.12}/oe-npm-cache (100%)
>>>>>   rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_22=
.11.bb =3D> nodejs-oe-cache-native_22.12.bb} (100%)
>>>>>   delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/fix-bui=
ld-with-icu-76.patch
>>>>>   rename meta-oe/recipes-devtools/nodejs/{nodejs_22.11.0.bb =3D> no=
dejs_22.12.0.bb} (97%)
>>>>>
>>>>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.11/=
oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.12/oe-n=
pm-cache
>>>>> similarity index 100%
>>>>> rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.11/o=
e-npm-cache
>>>>> rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.12/oe-=
npm-cache
>>>>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native=
_22.11.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.12.=
bb
>>>>> similarity index 100%
>>>>> rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_=
22.11.bb
>>>>> rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22=
.12.bb
>>>>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/fix-build-with-=
icu-76.patch b/meta-oe/recipes-devtools/nodejs/nodejs/fix-build-with-icu-=
76.patch
>>>>> deleted file mode 100644
>>>>> index e8501bcdb..000000000
>>>>> --- a/meta-oe/recipes-devtools/nodejs/nodejs/fix-build-with-icu-76.=
patch
>>>>> +++ /dev/null
>>>>> @@ -1,29 +0,0 @@
>>>>> -From 54299ac3a3d4e4520b8604dce43c2584092ccde2 Mon Sep 17 00:00:00 =
2001
>>>>> -From: Michael Cho<michael@michaelcho.dev>
>>>>> -Date: Sun, 27 Oct 2024 10:08:07 -0400
>>>>> -Subject: [PATCH] build: fix building with system icu 76
>>>>> -
>>>>> -ICU 76 decided to reduce overlinking[^1] thus `icu-i18n` will no l=
onger
>>>>> -add `icu-uc` when linking to shared libraries. This results in und=
efined
>>>>> -symbols/references when trying to build with system ICU 76.
>>>>> -
>>>>> -[^1]: unicode-org/icu@199bc82
>>>>> -
>>>>> -Upstream-Status: Backport [https://github.com/nodejs/node/commit/8=
1517faceac86497b3c8717837f491aa29a5e0f9]
>>>>> ----
>>>>> - configure.py | 2 +-
>>>>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>> -
>>>>> -diff --git a/configure.py b/configure.py
>>>>> -index a5f47af1748903..a4e210261e2e76 100755
>>>>> ---- a/configure.py
>>>>> -+++ b/configure.py
>>>>> -@@ -1879,7 +1879,7 @@ def icu_download(path):
>>>>> -   elif with_intl =3D=3D 'system-icu':
>>>>> -     # ICU from pkg-config.
>>>>> -     o['variables']['v8_enable_i18n_support'] =3D 1
>>>>> --    pkgicu =3D pkg_config('icu-i18n')
>>>>> -+    pkgicu =3D pkg_config(['icu-i18n', 'icu-uc'])
>>>>> -     if not pkgicu[0]:
>>>>> -       error('''Could not load pkg-config data for "icu-i18n".
>>>>> -        See above errors or the README.md.''')
>>>>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb b/me=
ta-oe/recipes-devtools/nodejs/nodejs_22.12.0.bb
>>>>> similarity index 97%
>>>>> rename from meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb
>>>>> rename to meta-oe/recipes-devtools/nodejs/nodejs_22.12.0.bb
>>>>> index 8cbf53978..194df4c33 100644
>>>>> --- a/meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb
>>>>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.12.0.bb
>>>>> @@ -1,7 +1,7 @@
>>>>>   DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
>>>>>   HOMEPAGE =3D"http://nodejs.org"
>>>>>   LICENSE =3D "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2=
.0 & Apache-2.0"
>>>>> -LIC_FILES_CHKSUM =3D"file://LICENSE;md5=3D25e89142a2f4b075904a9986=
c45fbdb2"
>>>>> +LIC_FILES_CHKSUM =3D"file://LICENSE;md5=3D0bd28a461eccad39f85a29e3=
3e8f879f"
>>>>>
>>>>>   CVE_PRODUCT =3D "nodejs node.js"
>>>>>
>>>>> @@ -28,7 +28,6 @@ SRC_URI =3D"http://nodejs.org/dist/v${PV}/node-v$=
{PV}.tar.xz \=20
>>>>> file://0001-deps-disable-io_uring-support-in-libuv.patch \=20
>>>>> file://0001-positional-args.patch \ file://0001-custom-env.patch \=20
>>>>> - file://fix-build-with-icu-76.patch \ file://run-ptest \ "
>>>>>   SRC_URI:append:class-target =3D " \
>>>>> @@ -37,7 +36,7 @@ SRC_URI:append:class-target =3D " \
>>>>>   SRC_URI:append:toolchain-clang:powerpc64le =3D " \
>>>>>              file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.p=
atch  \
>>>>>              "
>>>>> -SRC_URI[sha256sum] =3D "bbf0297761d53aefda9d7855c57c7d2c272b83a7b5=
bad4fea9cb29006d8e1d35"
>>>>> +SRC_URI[sha256sum] =3D "fe1bc4be004dc12721ea2cb671b08a21de01c69769=
60ef8a1248798589679e16"
>>>>>
>>>>>   S =3D "${WORKDIR}/node-v${PV}"
>>>>>
>>>>> --
>>>>> 2.43.0
>>>>>
>>>>>
>>>>>
>>>>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#114278):https://lists.openembedded.org/g/openembed=
ded-devel/message/114278
>> Mute This Topic:https://lists.openembedded.org/mt/109914816/1997914
>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub =
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--------------0djYvjSYJ9QMp6mygHG0Ih9u
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4BC5emBb010241

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#cceed0">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 12/12/24 07:31, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1srzH5zXm-5GwpfcZzVSzBaNP2=
NE0_VKNH_zZOf1A1nuvA@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Wed, Dec 11, 2024 at 4:36=E2=80=AFAM Martin Jansa via
lists.openembedded.org <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:=
martin.jansa=3Dgmail.com@lists.openembedded.org">&lt;martin.jansa=3Dgmail=
.com@lists.openembedded.org&gt;</a>
wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
It doesn't fail for me with:
g++: error: unrecognized command line option =E2=80=98-std=3Dgnu++20=E2=80=
=99; did you
mean =E2=80=98-std=3Dgnu++2a=E2=80=99?
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
This seems to be the host compiler being too old  &lt; gcc10 see
<a class=3D"moz-txt-link-freetext" href=3D"https://gcc.gnu.org/projects/c=
xx-status.html#cxx20">https://gcc.gnu.org/projects/cxx-status.html#cxx20<=
/a>

nodejs20+ expects atleast gcc10 these days see
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/nodejs/node=
/pull/46806">https://github.com/nodejs/node/pull/46806</a>

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
was it target nodejs or nodejs-native failing for you? I'm using
reasonably new host OS (ubuntu 20.04, 22.10, gentoo) with new enough
gcc to recognize gnu++20.

It seems to be added since v22.2.0 already with
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/nodejs/node=
/pull/52838">https://github.com/nodejs/node/pull/52838</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/nodejs/node=
/commit/e4b187433de1f71019f248b94b11fcdd6f22c359">https://github.com/node=
js/node/commit/e4b187433de1f71019f248b94b11fcdd6f22c359</a>

Did previous 22.11 build for you?</pre>
      </blockquote>
    </blockquote>
    <p>Thanks all.&nbsp; Yes,&nbsp; my host gcc is lower than gcc10. with=
 gcc10+,
      it can build successfully now.</p>
    <p>//changqing<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1srzH5zXm-5GwpfcZzVSzBaNP2=
NE0_VKNH_zZOf1A1nuvA@mail.gmail.com">
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
For the host-user-contaminated issues I've reported I've verified that
reverting libuv upgrade (as in
<a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedded.org/m=
eta-openembedded-contrib/commit/?h=3Djansa/nodejs&amp;id=3Dec3963c2ec7387=
e3771364a1bdddea963b3ef075">https://git.openembedded.org/meta-openembedde=
d-contrib/commit/?h=3Djansa/nodejs&amp;id=3Dec3963c2ec7387e3771364a1bddde=
a963b3ef075</a>)
avoids this issue again, but I'm still trying to narrow it down a bit
or find some small reproducer to more easily debug pseudo (and I'm
currently failing even to capture full pseudo logs with PSEUDO_DEBUG
env variable).

So I don't mind keeping this version in master (if nobody else suffers
from these host-user-contaminated issues) unless revert to 22.11 fixes
the nodejs build for changqing (which doesn't seem likely to me).
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
I think we need to fix pseudo and it might be best of all, reverting
will only buy
limited time.

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
Regards,

On Wed, Dec 11, 2024 at 11:18=E2=80=AFAM J. S. <a class=3D"moz-txt-link-r=
fc2396E" href=3D"mailto:schonm@gmail.com">&lt;schonm@gmail.com&gt;</a> wr=
ote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">
If it is easier to send a patch to revert to nodejs 22.11.0 I wouldn't op=
pose.

On Wed, Dec 11, 2024 at 3:05=E2=80=AFAM Martin Jansa <a class=3D"moz-txt-=
link-rfc2396E" href=3D"mailto:martin.jansa@gmail.com">&lt;martin.jansa@gm=
ail.com&gt;</a> wrote:
</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">
On Wed, Dec 11, 2024 at 4:49=E2=80=AFAM Changqing Li <a class=3D"moz-txt-=
link-rfc2396E" href=3D"mailto:changqing.li@windriver.com">&lt;changqing.l=
i@windriver.com&gt;</a> wrote:
</pre>
            <blockquote type=3D"cite">
              <pre class=3D"moz-quote-pre" wrap=3D"">

On 12/7/24 22:08, Martin Jansa wrote:

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

This seems to reintroduce io_uring support in embedded libuv from:
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/nodejs/node=
/pull/55114/files">https://github.com/nodejs/node/pull/55114/files</a>

I cannot reproduce this issue since I cannot even compile nodejs successf=
ully,

poky master qemux86-64,  do_compile failed with error:

g++: error: unrecognized command line option =E2=80=98-std=3Dgnu++20=E2=80=
=99; did you mean =E2=80=98-std=3Dgnu++2a=E2=80=99?

which leads to the same issues as previous nodejs upgrade in:
<a class=3D"moz-txt-link-freetext" href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/105583">https://lists.openembedded.org/g/op=
enembedded-devel/message/105583</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedded.org/m=
eta-openembedded/commit/?id=3Dd08453978c31ee41d28206c6ff198d7d9d701d88">h=
ttps://git.openembedded.org/meta-openembedded/commit/?id=3Dd08453978c31ee=
41d28206c6ff198d7d9d701d88</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedded.org/m=
eta-openembedded/commit/?id=3D0d9351e9290f6750e44ab52536bbe9268d5afac3">h=
ttps://git.openembedded.org/meta-openembedded/commit/?id=3D0d9351e9290f67=
50e44ab52536bbe9268d5afac3</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedded.org/m=
eta-openembedded/commit/?id=3D7bb28628991ec9be9610540401f7c6cc4c19997f">h=
ttps://git.openembedded.org/meta-openembedded/commit/?id=3D7bb28628991ec9=
be9610540401f7c6cc4c19997f</a>

pseudo still doesn't support io_uring:
<a class=3D"moz-txt-link-freetext" href=3D"https://bugzilla.yoctoproject.=
org/show_bug.cgi?id=3D15244">https://bugzilla.yoctoproject.org/show_bug.c=
gi?id=3D15244</a>

calling chown in hundreds recipes to work around pseudo limitation
doesn't seem good work around.

The UV_USE_IO_URING variable still exists in code (even after its
documentation was removed in:
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/louwers/nod=
e/commit/2b298e132d2f681270e9f3d5eb3134914653d2e1">https://github.com/lou=
wers/node/commit/2b298e132d2f681270e9f3d5eb3134914653d2e1</a>

I think the problem reproduces since io_uring support is enabled again by=
 default in above commit, which is in 22.12.0.

for now, UV_USE_IO_URING should still work, we can use export UV_USE_IO_U=
RING=3D0 to disable io_uring, but as the doc

said maybe UV_USE_IO_URING will be removed in the future version. so anot=
her option is to add a patch to disable io_uring like
</pre>
            </blockquote>
            <pre class=3D"moz-quote-pre" wrap=3D"">
Yes, unfortunately UV_USE_IO_URING doesn't avoid this issue.

The old minimal reproducer I was using before (com.webos.app.minimal)
doesn't trigger this now, only some other similar apps. I'm trying to
find out which exact call triggers this (as it might be faster to
figure out than bisecting nodejs).

</pre>
            <blockquote type=3D"cite">
              <pre class=3D"moz-quote-pre" wrap=3D"">this: <a class=3D"mo=
z-txt-link-freetext" href=3D"https://git.openembedded.org/meta-openembedd=
ed/diff/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring=
-support-in-libuv.patch?id=3D0d9351e9290f6750e44ab52536bbe9268d5afac3">ht=
tps://git.openembedded.org/meta-openembedded/diff/meta-oe/recipes-devtool=
s/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch?id=3D0d=
9351e9290f6750e44ab52536bbe9268d5afac3</a>

) but it doesn't seem to work.

It's failing because the
0001-deps-disable-io_uring-support-in-libuv.patch patch restored in:
<a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedded.org/m=
eta-openembedded/diff/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-di=
sable-io_uring-support-in-libuv.patch?id=3D6652b031d7d4d9cabf16d481f3b821=
15f7d8e15a">https://git.openembedded.org/meta-openembedded/diff/meta-oe/r=
ecipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv=
.patch?id=3D6652b031d7d4d9cabf16d481f3b82115f7d8e15a</a>
is wrong (it adds
meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support=
-in-libuv.patch
inside nodejs source instead of patching deps/uv/src/unix/linux.c).

Yes,  this patch is added wrongly.
</pre>
            </blockquote>
            <pre class=3D"moz-quote-pre" wrap=3D"">
Should I send a patch to just remove it (as it didn't do anything
useful in this form) or wait a bit more until we have a complete fix?

</pre>
            <blockquote type=3D"cite">
              <pre class=3D"moz-quote-pre" wrap=3D"">
//Changqing

I've restored the patch properly in:
<a class=3D"moz-txt-link-freetext" href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/114222">https://lists.openembedded.org/g/op=
enembedded-devel/message/114222</a>
but it still isn't enough and recipes fail in do_package or
do_package_qa (depending on UID used on host).
Reverting to 22.11.0 avoids the issue. Anyone else seeing this?

+Changqing Li



On Wed, Dec 4, 2024 at 5:54=E2=80=AFAM J. S. via lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:schonm=3Dgmail.com@list=
s.openembedded.org">&lt;schonm=3Dgmail.com@lists.openembedded.org&gt;</a>=
 wrote:

License-Update: Add JSON parsing library under MIT license.
  <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/nodejs/no=
de/pull/56040/commits/27bcd103e775e00eb8d03ac37052bbd4ccb6d239">https://g=
ithub.com/nodejs/node/pull/56040/commits/27bcd103e775e00eb8d03ac37052bbd4=
ccb6d239</a>

Drop backported patch fix-build-with-icu-76.patch.  It is already
integrated in this version <a class=3D"moz-txt-link-freetext" href=3D"htt=
ps://github.com/nodejs/node/pull/56040/commits/c3ca978d9c73d1a96f4d5c7bfa=
3c10ce786b8fe9">https://github.com/nodejs/node/pull/56040/commits/c3ca978=
d9c73d1a96f4d5c7bfa3c10ce786b8fe9</a>

Changelog: <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/=
nodejs/node/blob/main/doc/changelogs/CHANGELOG_V22.md#22.12.0">https://gi=
thub.com/nodejs/node/blob/main/doc/changelogs/CHANGELOG_V22.md#22.12.0</a=
>

Signed-off-by: Jason Schonberg <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:schonm@gmail.com">&lt;schonm@gmail.com&gt;</a>
---
 .../oe-npm-cache                              |  0
 ....11.bb =3D&gt; nodejs-oe-cache-native_22.12.bb} |  0
 .../nodejs/nodejs/fix-build-with-icu-76.patch | 29 -------------------
 .../{nodejs_22.11.0.bb =3D&gt; nodejs_22.12.0.bb}  |  5 ++--
 4 files changed, 2 insertions(+), 32 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-22.11 =3D&gt; no=
dejs-oe-cache-22.12}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_22.11.bb =
=3D&gt; nodejs-oe-cache-native_22.12.bb} (100%)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/fix-build-with=
-icu-76.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_22.11.0.bb =3D&gt; nodejs=
_22.12.0.bb} (97%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.11/oe-npm=
-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.12/oe-npm-cac=
he
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.11/oe-npm-=
cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.12/oe-npm-ca=
che
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.11=
.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.12.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.11.=
bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.12.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/fix-build-with-icu-76=
.patch b/meta-oe/recipes-devtools/nodejs/nodejs/fix-build-with-icu-76.pat=
ch
deleted file mode 100644
index e8501bcdb..000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/fix-build-with-icu-76.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 54299ac3a3d4e4520b8604dce43c2584092ccde2 Mon Sep 17 00:00:00 2001
-From: Michael Cho <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:mich=
ael@michaelcho.dev">&lt;michael@michaelcho.dev&gt;</a>
-Date: Sun, 27 Oct 2024 10:08:07 -0400
-Subject: [PATCH] build: fix building with system icu 76
-
-ICU 76 decided to reduce overlinking[^1] thus `icu-i18n` will no longer
-add `icu-uc` when linking to shared libraries. This results in undefined
-symbols/references when trying to build with system ICU 76.
-
-[^1]: unicode-org/icu@199bc82
-
-Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://github.com/nodejs/node/commit/81517faceac86497b3c8717837f491aa29a5e=
0f9">https://github.com/nodejs/node/commit/81517faceac86497b3c8717837f491=
aa29a5e0f9</a>]
----
- configure.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.py b/configure.py
-index a5f47af1748903..a4e210261e2e76 100755
---- a/configure.py
-+++ b/configure.py
-@@ -1879,7 +1879,7 @@ def icu_download(path):
-   elif with_intl =3D=3D 'system-icu':
-     # ICU from pkg-config.
-     o['variables']['v8_enable_i18n_support'] =3D 1
--    pkgicu =3D pkg_config('icu-i18n')
-+    pkgicu =3D pkg_config(['icu-i18n', 'icu-uc'])
-     if not pkgicu[0]:
-       error('''Could not load pkg-config data for &quot;icu-i18n&quot;.
-        See above errors or the README.md.''')
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_22.12.0.bb
similarity index 97%
rename from meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_22.12.0.bb
index 8cbf53978..194df4c33 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.12.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D &quot;nodeJS Evented I/O for V8 JavaScript&quot;
 HOMEPAGE =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"http://nodejs.or=
g">&quot;http://nodejs.org&quot;</a>
 LICENSE =3D &quot;MIT &amp; ISC &amp; BSD-2-Clause &amp; BSD-3-Clause &a=
mp; Artistic-2.0 &amp; Apache-2.0&quot;
-LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file://L=
ICENSE;md5=3D25e89142a2f4b075904a9986c45fbdb2">&quot;file://LICENSE;md5=3D=
25e89142a2f4b075904a9986c45fbdb2&quot;</a>
+LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file://L=
ICENSE;md5=3D0bd28a461eccad39f85a29e33e8f879f">&quot;file://LICENSE;md5=3D=
0bd28a461eccad39f85a29e33e8f879f&quot;</a>

 CVE_PRODUCT =3D &quot;nodejs node.js&quot;

@@ -28,7 +28,6 @@ SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"=
http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz\file://0001-deps-disable=
-io_uring-support-in-libuv.patch\file://0001-positional-args.patch\file:/=
/0001-custom-env.patch\-file://fix-build-with-icu-76.patch\file://run-pte=
st\">&quot;http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-deps-disable-io_uring-support-in-libuv.patch \
            file://0001-positional-args.patch \
            file://0001-custom-env.patch \
-           file://fix-build-with-icu-76.patch \
            file://run-ptest \
            &quot;</a>
 SRC_URI:append:class-target =3D &quot; \
@@ -37,7 +36,7 @@ SRC_URI:append:class-target =3D &quot; \
 SRC_URI:append:toolchain-clang:powerpc64le =3D &quot; \
            <a class=3D"moz-txt-link-freetext" href=3D"file://0001-ppc64-=
Do-not-use-mminimal-toc-with-clang.patch">file://0001-ppc64-Do-not-use-mm=
inimal-toc-with-clang.patch</a> \
            &quot;
-SRC_URI[sha256sum] =3D &quot;bbf0297761d53aefda9d7855c57c7d2c272b83a7b5b=
ad4fea9cb29006d8e1d35&quot;
+SRC_URI[sha256sum] =3D &quot;fe1bc4be004dc12721ea2cb671b08a21de01c697696=
0ef8a1248798589679e16&quot;

 S =3D &quot;${WORKDIR}/node-v${PV}&quot;

--
2.43.0




</pre>
            </blockquote>
          </blockquote>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#114278): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-devel/message/114278">https:=
//lists.openembedded.org/g/openembedded-devel/message/114278</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/109914816/1997914">https://lists.openembedded.org/mt=
/109914816/1997914</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.=
openembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/=
g/openembedded-devel/unsub</a> [<a class=3D"moz-txt-link-abbreviated" hre=
f=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------0djYvjSYJ9QMp6mygHG0Ih9u--

