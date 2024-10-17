Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC120D21261
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 09:03:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.44864.1729155798711404539
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Oct 2024 02:03:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0020234d96=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49H5u6OQ027621
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Oct 2024 09:03:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42a3dd9qmd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Oct 2024 09:03:17 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49H93HFa012131;
	Thu, 17 Oct 2024 09:03:17 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42a3dd9qmc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 09:03:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZnkG293t0QSKLyhKmeN1KFJXuzsGAfadXy0D/CnIBpYDjVXkDP4Ze6lVn8Jzo2tNpD1aNAbJeGsrmy8sgqKo2/wIW52hedxSu0Xv1ZZP2dQdrZz1xw5dH4z4K76VNPh0xp7f2XsxrKJF1XBDoxPTOUAmcfHTfTnwL2eVwDy+eL9z6YsXofEFyR395WVNJzbf2P83BWgohXJ8sYbojSpwwZ0dD0pgZnSn5G9k1aO8E0CrRGH/JMi7JUo72kCmZVlJsLjX3zqpMsEtu5yG7DZud/PwRMHGEWOhqBRrx+XsSVZ49aniB9ab0mExU3322FW5H9Be2y2eU0KV3epS1h8SBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mRIK7nWgKRaijKwEnKiy+g9F0YF+zNuDPtfGmv4ZRiU=;
 b=cAR9L0y81s1plOhMByz2RLesb6A57hBIBz1cEZzKjStO/qUadAGNpZteaULHvkCi5nG6+GPFUixJxL+mXvac3JqqJGT03bwgEvLKOZ3l8Uwtu3sNLt1nGbpzCwg466AMz7dtPEKOLv8c3vQnhaVUXFycAZ7cUhb+d167KkQaWk12w8dHeoJU0ohsMc+MGYnApNMZ5OE3eh6nBhXnQP/9iowy7/eNypmnjefGrfBifAlaP5BMPQDEiOCAPT5/zn80ANM3jcL2IENRChmQN2WEze+HNk/nT7o37Wp1edqiwggXvQ5QjjPP2WbZxRQOJRwuKFOk8jLYIbtwQsglM8Gr7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CY8PR11MB7732.namprd11.prod.outlook.com (2603:10b6:930:71::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Thu, 17 Oct
 2024 09:03:13 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976%6]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 09:03:13 +0000
Message-ID: <e35926d2-08b5-4b3f-bf57-6af09d7652e8@windriver.com>
Date: Thu, 17 Oct 2024 17:03:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 2/3] tomlplusplus: Add ptest support
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: "Yu, Mingli" <mingli.yu@eng.windriver.com>,
        openembedded-devel@lists.openembedded.org
References: <20241012100147.618578-1-mingli.yu@windriver.com>
 <20241012100147.618578-2-mingli.yu@windriver.com>
 <CAMKF1sp_GqfxcDnExPfi+sh6PuyrZoQpOrf48mYqfiC_sjr61Q@mail.gmail.com>
 <5fa70fce-33a6-477d-a988-0e4063e5d0e1@windriver.com>
 <CAMKF1soKVFA=z9HG6AkKO9wudOTjUCXFgry46EtRkwFdsQkufA@mail.gmail.com>
 <17FE3E9DA0225DA0.4702@lists.openembedded.org>
 <824f78eb-9de1-459b-b934-73adf806f7ef@windriver.com>
 <CAMKF1srL9Vx=GTm8Man9MXKKgHmv+orud-MsCAG10fWZU93y9w@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <CAMKF1srL9Vx=GTm8Man9MXKKgHmv+orud-MsCAG10fWZU93y9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR06CA0203.apcprd06.prod.outlook.com (2603:1096:4:1::35)
 To CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|CY8PR11MB7732:EE_
X-MS-Office365-Filtering-Correlation-Id: d3d3410e-d37e-4d79-b9e4-08dcee8a87da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|4022899009|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?a2FQbHRDNTg4aFh2Sit0U2VEckRDT2tBSU0xL1BzK2dUQnM5bzdHNDdUSVlh?=
 =?utf-8?B?Nk9QUkpGRk55bDZnVDZCWUxKUkM1WnFheEpkVGtYWVgyZlRrNnZUTkFMSGZR?=
 =?utf-8?B?RzJwdzN2OUhubVFTVjExS1oyZnA1cnUvUGpLWVNvUGYwQWJaU3YzWkphZ3JO?=
 =?utf-8?B?ci9JUGVsVGQwYk5KbGIwaUpiakdmNytPTmVuVER1RkQ2UnVoNnVNdzZvQW1G?=
 =?utf-8?B?cVFRcTFyUW56SG5QaXJoeFhuVDR4cW43aUpUZml2TjVydFJoR3JEQVNBMTBl?=
 =?utf-8?B?T3NramhpdXhFb096U3NZajFhaDZmK2hiQlNONytYWmhQSE5SeUtRSXpVNkto?=
 =?utf-8?B?RG1EUkZTV0NDYkFseWphbXlCWWU1TVFic29mQTA2dS9ZR0lBTmJMRXRiVE5y?=
 =?utf-8?B?YTR5OTJRU1dtQktldkJRK0xpYmY2aGRQQnFxenBYQVNOL1o1d3ZaMzg0ME5z?=
 =?utf-8?B?d29wTlVKb2Q4aDVRTVNhd1BZWXJNSzlhKzJjUmxmdlJjMTFaN2hxR1ZIRnBz?=
 =?utf-8?B?ZXUzdUcxK0srZEV3aHl4MkpybGhKdVBudkV4RnYrNTV6K2FiL1ltQkpDN0h2?=
 =?utf-8?B?a0V4UG9ZTlZNOG9yY2IzTGdmMEltdVRyT0FHYmxWVHhpMHVZVVpjbnAvZnNB?=
 =?utf-8?B?czdxdkNKVEhWOERWS3ZqbndqTUh1dGVFNXdpWDYvU0I2OFhMSWZoT0Jsb2Yr?=
 =?utf-8?B?UzM0VDlrL2J6WE1xamdteFQ2VHdHMURYRkpvQjk3MmtZZnI3aGpoSjBXV3RJ?=
 =?utf-8?B?dzgrK3I1b2IxVDJkbjlMZTBHbXlYRnNTQVplSFE1YTVKbmlXRy9hcEJRdTJQ?=
 =?utf-8?B?SDFKc1dZTzgwNUVBTlQ5MS9xQUUyTUtHek1Nc0UreHI3MGJCVStWdk5DQlNY?=
 =?utf-8?B?REJiM2w2eXFnZzJFNFB4czl5V3VmcUI5TW9ZKzNIS1lFTWpwMXI5cXUxR21M?=
 =?utf-8?B?bDFvcGxtRFJqdXN4MytaWmM3K3FXTXBtSTdjbHIxb1lRbkd1cHhxdVRHdEM5?=
 =?utf-8?B?RGc4a2dBN3BMb0hKc1dMMWpWbTVlZEZsSWQ1SlY2ZzExRG5BdUxBTmFzYzkx?=
 =?utf-8?B?a2gxY0JSS1hpTUtPT0E3a0hWQnpLaE5MZ1h4Zk9sZndPYXJTZXF4NmI4NmFH?=
 =?utf-8?B?b1NucUUyVTNIZXdpNm1WNWZOeVJFb2VtWFJoSnk1aEVDV0dSR3lMYkpwNm5p?=
 =?utf-8?B?Q1o5SkJVMmJXQndHOHRwcFFNS3l4a2MrQUpwcWxvakZNT2pSdTFlV1NGNG4w?=
 =?utf-8?B?ZTY3Zjc4SWVHK3QwdVp1QVpaa1FNb1BYQmRvY1JKQTBYTzFEWFNUSTdLSVgr?=
 =?utf-8?B?U3Y1UUtLN3dDRG5ia3g3VTJoeWZQMEFEU1BGSjdvVkpGUEswZWlzeVZITUNT?=
 =?utf-8?B?VnVUemVlN05FdUJmUy9va25HMDVENHdHNkxmT1l5eEhIcXdrUXIrem9lSVZM?=
 =?utf-8?B?ZjNaMEFmOHBRcmVxalJHdzFRRlljMjZnR3FhaWl2QWt5THZ0YzJraDUxTGdu?=
 =?utf-8?B?QlZsWGx1RVFhTS9EYmZFQ1NBaU1RdTROMVZhQXJraXNXaE1neTZuaVJ4MDVI?=
 =?utf-8?B?MjFSZFlaRXJqbFBpd2NWUm5PcWRaL1lFY1hxaFlkTnlva0svNTU1NlhOWXFk?=
 =?utf-8?B?TG16cFBkWEVreG1rWGRjUlFTRVlzZzM5WTFYbDQrblBQbnI0WmJqNm9lcXB6?=
 =?utf-8?B?YjdCRGRld3JDVnMySENXanluTlNBcTVDMTR5UjNONzJsQTBDZWVJYzhnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bDV6T0tEMmIvbHZ5TkdsSGZ6ZlZocFNlZ1ltQnpDQTF5T0l5TDl5SFI1M0pL?=
 =?utf-8?B?dDYwKzIzQ05BQTBWeFliSmwzNWJnRFJpbGRUcVlWaGI5dXgwczF1QytEVW9X?=
 =?utf-8?B?aU1PeVl1anppU01iOEd0TVY0TnZXdWNQMTFHS2ZnQVVJNXcwMFQ3MDZ2RlJ5?=
 =?utf-8?B?UVhiQ1NORUVid0FaUGQwU1liOFM4UFVVR3ExZXhKcUVFTXdkNHRhSS90NUYy?=
 =?utf-8?B?alZCTGtndzl4QnY0Y2NSNVFrUElSM1FSSVh6QU9BeE9KTlphMDlkTzBvaHJx?=
 =?utf-8?B?NTMxdFFTMXppVUJFRlorOEVuaHJvemp1VU9ha1RFV1FtTTVxb0E2UlQrV2NQ?=
 =?utf-8?B?YnpXaDQ4a0U5S0s5SXdnZFNpcy9lWThwelNYZWwySFdYWFU5Vm9IV2JjY2Jh?=
 =?utf-8?B?c2RQclk1dkFGUFZjTURwS2RtK3RMbjUwQklydDd5azBkU0hTRGRyYkxkNFQz?=
 =?utf-8?B?VGs1dmRZQWNWc1pzd2hXSWNIR2QzdkNUNExVZStOVy9aMTE0SEJyNUxMVmJX?=
 =?utf-8?B?WXRFV05iWVFlZGF1V3ptVmZtdEZubGVYVTlMVEd4Y1FPTHlGZnFRbWtzeGhq?=
 =?utf-8?B?Q0EzanYzVW8wSWlCQVFNVVNoS2FDN2Z3Sy9MeDRKei8zTGtvZ1M5VVJ4NDVq?=
 =?utf-8?B?cDZKRG82ZUR6NmZlMWlOS3B4VEJKbGdhaWxSRnZBdXlOZnRFY3FNWjlQb1A5?=
 =?utf-8?B?QjlEUk53OEZCMmg3MXNreDYxOEp6TXJTeHFzRWdSTjRlZ3VXM2VNYkplbS9t?=
 =?utf-8?B?T25CMG5FQXhkdnMrY2JkdlR6ZURMbVZJZUI4YUZCS3NJSjNpN0hVbFNtTlRV?=
 =?utf-8?B?V2xuVDhuM2hsWFk5R3h2YkhVT1VIbmV1MjdNNzlEdXd4OHE5K0JiUGxXWXRU?=
 =?utf-8?B?R2xnVDZ2aDROUUhrbHVZaDdNaFI3K1RrWGsxaG4xU2M5a1BQYjVsYUliSVBp?=
 =?utf-8?B?YitUVTRVUmZEK2R2YW5iZ3U2ckpkcjRwRkJzNUNqMElyTVR5QjVPZklTZDVo?=
 =?utf-8?B?a2x5LzZhQVNxbmJnRk9MK2dqNFdVR202b3N4YjdERzlKQ3B6bXFKY1hCckQ2?=
 =?utf-8?B?T3BkUStUbXhiblJId0xzT0N4WklyWDVrQVpUdUpkSllMWEUvRmhVaEpoQWw3?=
 =?utf-8?B?M2lsQWZSRzI3M0FuMmlEN1FNOHlWUFYzaVpTQ0ZXdXladDJ5Z2JVVEZDemQ0?=
 =?utf-8?B?OU9mQXZpUFVUdkRITXRjc0dDUVVPS3FKNEN4RU9lcjBmNFR1U1hWTUI2U2Zo?=
 =?utf-8?B?RjUyRnBpcEkyYktwYk4ydlFEcGhGeHlFMWc4TUxWa28wWk9PT1pkYVN6am8y?=
 =?utf-8?B?V2toeFFIWTEzZUIwSHBzQWFxWVhxY0ZjcG15U0ZGUzVnNUFUdkFjNFFGS2xi?=
 =?utf-8?B?WVZISDc5bXBGTlpnMXFadGJ1Q0dJUkdoNjNMUEpNZjEvOWlMb3czSDRKNDV5?=
 =?utf-8?B?TW43RExJVFgwVGptS2Y0d1VlbVJQN2RxMHc4ZmtMSG9CWnVrOFJncm1yalE2?=
 =?utf-8?B?YlU3UmplcGdmc1pZT1NwWTdKanNLQmN2TElYSVZodEQwWjVidFJaSDVmUTVV?=
 =?utf-8?B?Z2lqd3ptSXE2RHQ4QVlsTnlsWmRoNDBGQXRVZTgwZXp4Q0FlaGYvNTBhNHZS?=
 =?utf-8?B?L3RxQUt2SFppMzlPOGdLT1lWbno0Y2JwVklWdW9PbVRJMFIxaVFIWTMrTFBr?=
 =?utf-8?B?NEgwM1NRMUdZOGtqQXAyWmR2eklFcmtYZGVreHJhcy9pb3E0VmtZUE5iRWg5?=
 =?utf-8?B?TEMyZzdyQW1jU1E1TkZEaTRNeVVHOGh6eCs1TStMSDV4Mm5leUsyL2RnWXdh?=
 =?utf-8?B?VkdQMEhxcXQvelVGc3JxMUdFczJ4N3BaRE9LVDFWYjhCaXhjV1MrM2FqUFVm?=
 =?utf-8?B?ODF3QnpTQnd1WXp3M0tQNThwdVhSV25UUUw1NGVFVXRmdEcxYnFibytGb1Yr?=
 =?utf-8?B?Ui9sUzZhSjlQQ1k3MDZPMXRKNFhNSzVlWnRISlllcTRQdDROWHFyN3RiNFVp?=
 =?utf-8?B?WGtON0t1U1VWb3pHcFhUQ2VhTFVnR3U3RE0zd2xxVzhWblNiTWJBZVRJTTNP?=
 =?utf-8?B?MDAvNFFWZCt6WlpBRW9IempxbkNabFBRdlNLaDkxbllLcDRZUk9TSE9lYy9X?=
 =?utf-8?Q?S2w7XsTw6EtTCoiWYO2ecv2/c?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d3410e-d37e-4d79-b9e4-08dcee8a87da
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 09:03:13.4695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UdRIN7gzhuLyTukecC0qdmRhqh+FJn9OwAW9uiX2GnGunvnh69oZbcaYCrJVqOVVX8/vpJpzJwH4JVh+z0i7wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7732
X-Proofpoint-GUID: -DFJ-y2NOLSmllknyKfxlRpjafU8-qFn
X-Authority-Analysis: v=2.4 cv=EqyArjcA c=1 sm=1 tr=0 ts=6710d2d5 cx=c_pps a=CmjB6Nkc3E8pi8fe8piFzA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=l1-WZR0qAAAA:8
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8 a=Jbc9k1ebDsdXuXszclYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Qm0ypj1B_joA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=J0NmAbttn3WFok5z7_lE:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: NshkkVDKqjxekCFTryg3Dzg-g-Fz6M9o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-17_08,2024-10-17_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 mlxscore=0 priorityscore=1501
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410170060
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 49H5u6OQ027621
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Oct 2024 09:03:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112964



On 10/17/24 15:40, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>=20
> On Thu, Oct 17, 2024 at 12:35=E2=80=AFAM Yu, Mingli <mingli.yu@windrive=
r.com> wrote:
>>
>>
>>
>> On 10/14/24 14:42, Yu, Mingli wrote:
>>>
>>>
>>> On 10/14/24 10:36, Khem Raj wrote:
>>>> CAUTION: This email comes from a non Wind River email account!
>>>> Do not click links or open attachments unless you recognize the send=
er
>>>> and know the content is safe.
>>>>
>>>> On Sun, Oct 13, 2024 at 7:31=E2=80=AFPM Yu, Mingli <mingli.yu@windri=
ver.com>
>>>> wrote:
>>>>>
>>>>> Hi Khem,
>>>>>
>>>>> On 10/14/24 00:18, Khem Raj wrote:
>>>>>> CAUTION: This email comes from a non Wind River email account!
>>>>>> Do not click links or open attachments unless you recognize the
>>>>>> sender and know the content is safe.
>>>>>>
>>>>>> ptests seems to be failing for qemux86-64 -
>>>>>> https://snips.sh/f/PWrmTR3-bm
>>>>>
>>>>> I didn't reproduce the issue locally as below:
>>>>>
>>>>> root@qemux86-64:/usr/lib64/tomlplusplus/ptest# ./run-ptest
>>>>> PASS: tomlplusplus_odr_test
>>>>> PASS: tomlplusplus_tests
>>>>
>>>> Did you build and run with meta-oe-image-ptest-tomlplusplus ?
>>>> secondly, I ran with image built with clang compiler
>>>
>>> Yes, I have tested with "$ bitbake meta-oe-image-ptest-tomlplusplus
>>> -ctestimage" and it succeeded as below:
>>> $ bitbake meta-oe-image-ptest-tomlplusplus -ctestimage
>>> [snip]
>>> Output from runqemu:
>>> runqemu - INFO - Received signal: 15
>>> runqemu - INFO - Cleaning up
>>> runqemu - INFO - Host uptime: 10209822.71
>>>
>>> tput: No value for $TERM and no -T specified
>>>
>>> RESULTS:
>>> RESULTS - parselogs.ParseLogsTest.test_get_context: PASSED (0.00s)
>>> RESULTS - parselogs.ParseLogsTest.test_parselogs: PASSED (2.02s)
>>> RESULTS - ping.PingTest.test_ping: PASSED (0.01s)
>>> RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectfail: PASSED (=
0.36s)
>>> RESULTS - ssh.SSHTest.test_ssh: PASSED (0.50s)
>>> RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectsuccess: SKIPP=
ED
>>> (0.00s)
>>> SUMMARY:
>>> meta-oe-image-ptest-tomlplusplus () - Ran 6 tests in 2.892s
>>> meta-oe-image-ptest-tomlplusplus - OK - All required tests passed
>>> (successes=3D4, skipped=3D1, failures=3D0, errors=3D0)
>>> NOTE: Tasks Summary: Attempted 1430 tasks of which 1429 didn't need t=
o
>>> be rerun and all succeeded.
>>>
>>>
>>> $ tail -2 conf/local.conf
>>> TOOLCHAIN =3D "clang"
>>> IMAGE_CLASSES +=3D "testimage"
>>>
>>> Could you help to provide your local.conf to help to reproduce the is=
sue?
>>
>> Or could you help to provide the reproduce steps based on poky?
>=20
> You might need couple of more entries
> TC_CXX_RUNTIME ?=3D "llvm"
> RUNTIME ?=3D "llvm"
>=20
> and add ld-is-lld to DISTRO_FEATURES and see if that helps to reproduce=
 it

Still can't reproduce locally.
Paste my steps below to help to check if I miss something.
1, mkdir -p /build/builds
2, cd /build && git clone git://git.yoctoproject.org/poky
3, git clone git://git.openembedded.org/meta-openembedded
3, git clone https://github.com/kraj/meta-clang.git
4, cd /build/poky
5, . oe-init-build-env ../builds/my-build
6, Add below layers into conf/bblayers.conf
/build/meta-openembedded/meta-python
/build/meta-openembedded/meta-oe
/build/meta-clang
7, add below config into conf/local.conf
TOOLCHAIN =3D "clang"
TCLIBC =3D "musl"
IMAGE_CLASSES +=3D "testimage"
TC_CXX_RUNTIME ?=3D "llvm"
RUNTIME ?=3D "llvm"
DISTRO_FEATURES:append =3D " ld-is-lld"

$ tail -7  conf/local.conf
CONF_VERSION =3D "2"
TOOLCHAIN =3D "clang"
TCLIBC =3D "musl"
IMAGE_CLASSES +=3D "testimage"
TC_CXX_RUNTIME ?=3D "llvm"
RUNTIME ?=3D "llvm"
DISTRO_FEATURES:append =3D " ld-is-lld"

8, bitbake meta-oe-image-ptest-tomlplusplus && bitbake=20
meta-oe-image-ptest-tomlplusplus -ctestimage

Thanks,

>=20
>>
>> Thanks,
>>
>>>
>>> Thanks,
>>>
>>>>
>>>>>
>>>>> Anyway, I will look into this then.
>>>>>
>>>>> Thanks,
>>>>>
>>>>>>
>>>>>> bitbake meta-oe-image-ptest-tomlplusplus
>>>>>> bitbake meta-oe-image-ptest-tomlplusplus -ctestimage
>>>>>>
>>>>>> On Sat, Oct 12, 2024 at 3:01=E2=80=AFAM Yu, Mingli via lists.opene=
mbedded.org
>>>>>> <mingli.yu=3Deng.windriver.com@lists.openembedded.org> wrote:
>>>>>>>
>>>>>>> From: Mingli Yu <mingli.yu@windriver.com>
>>>>>>>
>>>>>>>     # ./run-ptest
>>>>>>> PASS: tomlplusplus_odr_test
>>>>>>> PASS: tomlplusplus_tests
>>>>>>>
>>>>>>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>>>>>> ---
>>>>>>>     .../recipes-devtools/tomlplusplus/files/run-ptest | 12 ++++++=
++++++
>>>>>>>     .../tomlplusplus/tomlplusplus_git.bb              | 15
>>>>>>> +++++++++++++--
>>>>>>>     2 files changed, 25 insertions(+), 2 deletions(-)
>>>>>>>     create mode 100755
>>>>>>> meta-oe/recipes-devtools/tomlplusplus/files/run-ptest
>>>>>>>
>>>>>>> diff --git a/meta-oe/recipes-devtools/tomlplusplus/files/run-ptes=
t
>>>>>>> b/meta-oe/recipes-devtools/tomlplusplus/files/run-ptest
>>>>>>> new file mode 100755
>>>>>>> index 000000000..4f682c5eb
>>>>>>> --- /dev/null
>>>>>>> +++ b/meta-oe/recipes-devtools/tomlplusplus/files/run-ptest
>>>>>>> @@ -0,0 +1,12 @@
>>>>>>> +#!/bin/sh
>>>>>>> +
>>>>>>> +cd tests
>>>>>>> +for atest in tomlplusplus_* ; do
>>>>>>> +    rm -rf tests.log
>>>>>>> +    ./${atest} > tests.log 2>&1
>>>>>>> +    if [ $? =3D 0 ] ; then
>>>>>>> +        echo "PASS: ${atest}"
>>>>>>> +    else
>>>>>>> +        echo "FAIL: ${atest}"
>>>>>>> +    fi
>>>>>>> +done
>>>>>>> diff --git
>>>>>>> a/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
>>>>>>> b/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
>>>>>>> index 0e8202bdc..245c309a2 100644
>>>>>>> --- a/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
>>>>>>> +++ b/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
>>>>>>> @@ -3,7 +3,9 @@ HOMEPAGE =3D "https://github.com/marzer/tomlplusp=
lus"
>>>>>>>     LICENSE =3D "MIT"
>>>>>>>     LIC_FILES_CHKSUM =3D
>>>>>>> "file://LICENSE;md5=3D90960f22c10049c117d56ed2ee5ee167"
>>>>>>>
>>>>>>> -SRC_URI =3D
>>>>>>> "git://github.com/marzer/tomlplusplus.git;protocol=3Dhttps;branch=
=3Dmaster"
>>>>>>> +SRC_URI =3D
>>>>>>> "git://github.com/marzer/tomlplusplus.git;protocol=3Dhttps;branch=
=3Dmaster \
>>>>>>> +           file://run-ptest \
>>>>>>> +"
>>>>>>>
>>>>>>>     PV =3D "3.4.0"
>>>>>>>     SRCREV =3D "30172438cee64926dc41fdd9c11fb3ba5b2ba9de"
>>>>>>> @@ -11,4 +13,13 @@ S =3D "${WORKDIR}/git"
>>>>>>>
>>>>>>>     DEPENDS =3D "cmake-native"
>>>>>>>
>>>>>>> -inherit meson
>>>>>>> +inherit meson ptest
>>>>>>> +
>>>>>>> +EXTRA_OEMESON +=3D
>>>>>>> "-Dbuild_tests=3D${@bb.utils.contains("DISTRO_FEATURES", "ptest",
>>>>>>> "true", "false", d)} \
>>>>>>> +"
>>>>>>> +
>>>>>>> +do_install_ptest () {
>>>>>>> +    install -d ${D}${PTEST_PATH}/tests
>>>>>>> +    cp ${B}/tests/tomlplusplus_odr_test ${D}${PTEST_PATH}/tests
>>>>>>> +    cp ${B}/tests/tomlplusplus_tests ${D}${PTEST_PATH}/tests
>>>>>>> +}
>>>>>>> --
>>>>>>> 2.34.1
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#112847): https://lists.openembedded.org/g/openemb=
edded-devel/message/112847
>>> Mute This Topic: https://lists.openembedded.org/mt/108964413/3618448
>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [mingli.yu@eng.windriver.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>

