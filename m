Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B86DC36005
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 07:03:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.42260.1745823722955811453
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 00:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6213994147=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S4js6C022226
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 07:02:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468mq1akan-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 07:02:01 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53S6wIk4028997
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 07:02:01 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2049.outbound.protection.outlook.com [104.47.73.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468mq1akam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 07:02:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kadmfdDv5SAF5zabPUkNcnXuy5vK/LAhtPEu2IpbWwdS1Fput/f53QH936edzeZfJVultzoCVuaRM651kf5Enhwca5C/U5hyqJnwZPJcwrhqhgyGtiYuz9PR5kDvp0PXKNbFE90WKjvaCcoR7Kdis+zt2HLlFBFPhSKq5b0JJIO3BMh9KSxnGRc4xybyi4cnDA5OQIH1F1lPp1MsyeWVQQiohm1KnNj3ThoihutZDnoBse1wQuxU2b718s81uUCAu+fNMGUDB3twZajdUiWRjbKWcMNhrO/aZ1Qx+j0dcnutoOMSg5t8R72ml4APpOq5wMo2SMEFak9rnsWUr4hAyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nT807dwLplYx/Ti9hR2Y5vuURRc81r7uHGt65JFpr64=;
 b=oyR1hTLm/S9gfun26EhhAdkJlCPwRDG1gZVezSgADci/ClXP702uQtiQGJ7IryiouqAkOiK2xO9kC6XLW9m0jArX1jKqVFFk2uI6a8SDwCGzozaAOlFZZsfhCKkBf0fF8dhHVJIirNRvOZnjXcelm2889UlTT6mj7eNGEhI+NrckRcpfCl7dpdRwxyG3NL3wWB3jBEUz/rDjTiJO/G4AkNRRp//i8kggx7AjIN4NRVmjZ3E5a2IU5VEM0sMcjjF9i8LvO798H0M6WUFt3L8I1jFJxknhei1AJ2ZQpjmkLxC/fAwwe++kI+vUowsR6OtC5UZuaZH+vW8ZxZS/LvLMng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by BL4PR11MB8847.namprd11.prod.outlook.com (2603:10b6:208:5a7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Mon, 28 Apr
 2025 07:01:59 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%4]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 07:01:51 +0000
Message-ID: <aef06223-30d2-4983-8700-ce8aa777ceff@windriver.com>
Date: Mon, 28 Apr 2025 15:03:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH] lmsensors: Fix build without sensord
To: Leonard Anderweit <l.anderweit@phytec.de>,
        openembedded-devel@lists.openembedded.org
Cc: y.moog@phytec.de, upstream@lists.phytec.de
References: <20250424125034.73053-1-l.anderweit@phytec.de>
Content-Language: en-US
From: Haixiao Yan <haixiao.yan.cn@windriver.com>
In-Reply-To: <20250424125034.73053-1-l.anderweit@phytec.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGXP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::31)
 To CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|BL4PR11MB8847:EE_
X-MS-Office365-Filtering-Correlation-Id: 18a8f9e9-50e9-4e12-85a6-08dd86228ceb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TVZrcXprUEpXT1lGdHVhQU5Fb1JnZkVGY3lGZ3BJVU45MFJlSmhITUR1NEgr?=
 =?utf-8?B?eUFPRkJRYXVvcWhkUjlTNmMyaHZIK3hEOEJqUHphZnExWTVlUkZySGJHNTlP?=
 =?utf-8?B?R2J3MjhYNG9kVnY1aUkycnF0ejVSWXk0YWk5N1Y2Sm1FTm5vZjBtZnJHTzRx?=
 =?utf-8?B?ZGpUSDBLdHZrK2ppeXVoY3FUcE9RL2xhb1hRNWthc3ovUC8wSUVHUVM3L2x3?=
 =?utf-8?B?Tzhhckd4SHBUbnRDelJqaHhqY1QrVHFaNXFwN0RXajg1MyswOG1BMndvclFv?=
 =?utf-8?B?Y1JLMHFGL3N3ZE1Ja1R5L1NOYnUyT2FIUXAzVEx5YkJBZFJ5VlA4R1BvdGY4?=
 =?utf-8?B?bkxSQnN2eG04elQrdWJReGR5akZZWTdPMEM4WEdXaXppZDdQR3lNcXJaMTlW?=
 =?utf-8?B?bWpCUlVPSUYvUXhhMXdiZis1TlVhb01DSUw5S0lqSzRvaC82N09IZXdOM2dN?=
 =?utf-8?B?b0tJMG5qbzF5ZnJZVDlsVFZhNnZyNjhxRk1INEM3VTArVXNGNUpZSldDTmNI?=
 =?utf-8?B?M3V4cEwxQU5OOVVWZ2tTaC9SU215aHE5a3p1dTFTd2JqMHJjSjRZTkR5VnM2?=
 =?utf-8?B?eWdWRzU3RVJZN2hFcjV1ZDBLeGppam96cEw1SGVVS3JNOWI0ZkFqMm9XMmYz?=
 =?utf-8?B?alpCcTMxN1Y5Ynp3ZXplRUp2Y3VoL0ZGNWpZd24rSllUQVhVWlBVWG5Uamh0?=
 =?utf-8?B?dDY4eUdnRnNUdlJJOTRjakhmSkZwN1kzd0F3MFFhb05UK2J4VTU4cEJ3ZWtD?=
 =?utf-8?B?alVUR29mb2I2SzFDY2xZWDhYL1VpWk9HOUtSMVVSd01zWHVnY1VoVHVyR0dm?=
 =?utf-8?B?OTdqaUtqbVo5OTBlVWxKOURrTm0wM0pVRGt0aktiUG1NZU5aeFBsMEhNZDZB?=
 =?utf-8?B?ZFlPdUVZeUVmNkZZdVk1ZkEvMzB5U0w4LzhCbURVR29La2VQS0FUZGFkRHdV?=
 =?utf-8?B?OE1aUmd5RThTZHJnZzhVbUNTMmFXK1R3MUJKRGxxYm5EeG50enMybzVuelZS?=
 =?utf-8?B?c0hvdkQ2K0ZSVC90dnhhNDVjbHlDc3RtUHllRFJGTTFDTk9vejVxNC9LY0tr?=
 =?utf-8?B?eklwSjZ2aEx1VjQwelI1YndGQ2ZvWWhnMzRXS1U0Wis0LzZFQzJmb3VEUk01?=
 =?utf-8?B?aU9Pd0I5MUxONXhSN2RsM3dUVmx3UGdiNStic2lUSGlGN2Y2RUFmVHFaMmQ5?=
 =?utf-8?B?bDFPYmtCV0NwdWN2YWd5eFdlSnBubUdNNEtwaExuRmppSUN0YUJXYmhBelli?=
 =?utf-8?B?MmxKQ1dHbUFuQnl4OG1IUVkrVmxwNmE5QmxqTmxPTmlhTEYreGxLeHFxOVpO?=
 =?utf-8?B?UCtlOWFHbkxFeEdUdS9SY3ZVVCtxOFZNL3FlTlJUREEvcGdlVDhFbldmU2tR?=
 =?utf-8?B?eVFJcmpoUzVjSFRkNDVZaCtiNXcvMm5RZzhTZ0FtUVMza1BkenU0dnNqUUxi?=
 =?utf-8?B?N1JpYmhRK3M4MXZMN0hPa2pHaXBOcFpyUlpDbEg5RHVXLzk3YTlOMTJyYVNn?=
 =?utf-8?B?S3pKSU0xQVc2SjdmMHM1Q0FVTmpBVElHSkxzd1ZOTWw3RFc3a3YrNHdBNEJI?=
 =?utf-8?B?eGUrQlNGblJxVCthYm8zeEhPWlYrL0tGR3o0QVFrZm82SC9WVFVTMHBtMjRz?=
 =?utf-8?B?cnlHejFiZURPeEZIUDdQNWQ1TjFyUjlDVEl6alZYMHdHTENRWEd4K0hHbE84?=
 =?utf-8?B?a3gxWmU0dnpMUFVYdWtVbHBnalNSNDlvT0VBbDRJekxPOXBZRC9kaTRGd1BZ?=
 =?utf-8?B?K3pQOGo5ZklJV0pscTlnNW13Sjc0czQ3VENjMVJSTjZpUHlSQXJTWXlGMGR1?=
 =?utf-8?B?Uk9yQytDUnp6NVA0bndvSXB0Q1orTHJQd2JRelJWZnBaV3B4UFczbWpCRW9U?=
 =?utf-8?B?cG9ZMXhTczN2SkFSS2FIUmVqcGdsYk0vZUhsYUcwZlFZREE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QUQxeE1BYWNkSXMrKzdtb3JBbnV2RlNMRUlvV3VQN0EzMEM1ZGh3RHAwRVNB?=
 =?utf-8?B?dC9ZNlpYaVBOYlNyaTFWV1ZVZG9WSHJtMUlTQ3pyaHFSdm1XcmdzaE1uT1dL?=
 =?utf-8?B?bkREQW1UMUFva1IwTkZ4T3hPV0RkZy8zY2haUWlsU1RnanVqSWJ4MElXMFU1?=
 =?utf-8?B?ZkkvSFFsRmsxL2Z6aGIwYi95TkMwRTZxVUxBZ2xrZUtpenNCSU95SFJuNWZw?=
 =?utf-8?B?Y3grT1NJc0Vyb1BSbys0TG4rQThjTWRhVFRrckpjQVN0UmhhMTdKRzJnWCtW?=
 =?utf-8?B?bkR5QVRPemRzUHRPVExoZi9hZS9RalBXU2lkanJpdHBRMUFUY1ViQklCZHF6?=
 =?utf-8?B?WVRTbm1ScGxRaEZjZ01BT1dmdzJ1NXA5Z2VnVWM4VVBEdVBMNWNXNGdhMGNT?=
 =?utf-8?B?ZXpzVHlIUHNvOHRWanlRVE91WlVmZ2JoM2Vja2JxdXEvSndlM2dKaEw3VXJI?=
 =?utf-8?B?YlZPWk5UYkl6dEFhSklFQVhpTlVvVlJpc1BEKzVVa2JBbEt1S3hHZVo5bE5u?=
 =?utf-8?B?alR6aGVqejFLZHRJUEhOOE5VdGh5b1RkL2pvZ1ZsbEIvZWtoSGcyRjQ3ZHZ6?=
 =?utf-8?B?MGVZbllkZXpVYjBEYi9YOURqVWc3S25nVzN1WHlhSmY1d0RzSFc5TmpYMVNM?=
 =?utf-8?B?L3dSei9ieU5TV3hSamw0dEZiaVUrWUNTR0xyd3FSZnI3Y0NBbDV1RmdCLy85?=
 =?utf-8?B?TXB3VFFxZitOdUlhRDN3YU1lazZpaWNPV1l3OCtLVTdud1RFTmQ5UjUydmFn?=
 =?utf-8?B?U0w1bnIwTUQyUGFwdGYzSndKdHhLOHhOSDdqTkFYR01TaTlzd2NZZUIvUDlj?=
 =?utf-8?B?bkhYVTBqeDh5bWI1RVhackFNc212aklLSVZJanZibnp2R1FlUXN3VG9WK3p6?=
 =?utf-8?B?YWN0N3lZbjR3UUxjRG5UQkpJY29PMXBweVEzQlErZWhvVmRPdUZkdnp3cHly?=
 =?utf-8?B?Vm1UMWZkWDRqMGdQQU9qVU9rQ2wxN3ZkNkhBR1N4ZXJ4V20yOGNMMGlEZ3No?=
 =?utf-8?B?OGN5TjJ2TWh1S0c3SHJacTBVeEtNTHJXZ0xtSG4xeDBFSzh5NU1MaGp1Yjha?=
 =?utf-8?B?YVYrbjcrSFo2VVAvMHJNdjlyVURvTDk5Si9DL2Nya3RYOWk5eEx1Y3JrRFNF?=
 =?utf-8?B?S3Y0WWtKTjM3bWxIaElWR1hZL0RDUzJ0NVR6OTFTTlZXR1hMWWt4dmxrd3pR?=
 =?utf-8?B?SXduUXJFdkRnWFVKOXhLTjBpZ3NZREdkblhITnpNUzlNVU94VTY1ZnM3M3Q5?=
 =?utf-8?B?anBVVUsweVlsZ3JyTE92ODRiUjdJMUpNR214YlRndlBDajd5T3FqOFdrZ0ZR?=
 =?utf-8?B?TzN0NGxZRlhzeCtuY004MjV3c2xBZmE1YnpIVWpZejNqUlVmQjZtZ0hxQmRt?=
 =?utf-8?B?UWZLOVg0V01FSlN3QlNiQmU4Yjhab3JRdjVDZk9OMUVtSFJaTnBLVlVRSHhK?=
 =?utf-8?B?R01KbkZoKzVudHZrL2kvamJTUWcyd2VPc3hDbEI4cUtCWHU3UGdyQW1GM285?=
 =?utf-8?B?YW1PcEJJNmNRSzlTQlVSVVFnQnFvdXhvTGJJUXltM0c3MnRyYy9DVjZWWWpR?=
 =?utf-8?B?TlJESWZtZ1ZPZytPZDBscHRpNFQ2SFpnWURvQzlSZVJSUlZnbndKQ1U3Rklz?=
 =?utf-8?B?WWQxMWMzZUhiY3lDemU3eGlMWmZKS0ZPbkdOeHBmdzVoYVR4Y2FEYzFaSUJa?=
 =?utf-8?B?bmRIRXJXQWxDMVcyb2pNTmZFWThEYlBUTzl0VVV2d0tPaHhacXlhYUtiVUVh?=
 =?utf-8?B?WUsvb2VQamZXRGRiNHFqUk5yQ0E0ODVGNU1YaVpQN1NraDBPT0VUK3BHc3pV?=
 =?utf-8?B?ZTZjbjEvUms1NkZ5M3ZXUXVRdS90dUdIamJSRlJJdXNJcFJnMENZejV4YSth?=
 =?utf-8?B?UElWcW5raE1UZXU5anR5ckVlWFhvd09oS0V2Q0tBQldIeU5Xd2Npd1hmQndT?=
 =?utf-8?B?ZUtoazljRVA4UEdybnNmSkNVUm9IakNGOEdya0l0UTQ1UDFORjRST3VPVXVB?=
 =?utf-8?B?WEVTN2tMV29TUEt0MXdwL3JXTjcyb2F6d2N6TE8zN1A3M0l2WUZMY1d3WEdx?=
 =?utf-8?B?T2d1c0Q5MlZpMVNPT1lqUk1hZVFqRjNtb3M4ajQ0Z1Y0akpNWTJHMlg3eXQr?=
 =?utf-8?B?dHA4OXBNU2xsWEJSdnNzUTM0OGhLWUN3amlsMWI3cjUwWFltRDNXL1VCb1ZK?=
 =?utf-8?B?enc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a8f9e9-50e9-4e12-85a6-08dd86228ceb
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 07:01:51.1515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BprVLXVr3j52tGVcTSjor/BxWDXp8iblbo7krf+Vg3vmqTFqsbm0T7W3cdm2nx5Amr6rJHnkd6X59KOcAB6XC8Q3pcYi9agmh2U6HFv2IsI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8847
X-Authority-Analysis: v=2.4 cv=KsNN2XWN c=1 sm=1 tr=0 ts=680f27e9 cx=c_pps a=0XndbtkAAnsFgPxdSZG6GA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=H6sEV9J1AIHkie3rJ_cA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: SJGX8ekF-PD2Nz3TWcrdTATw3bG7tR6H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA1NyBTYWx0ZWRfXxn4cYKM/rueN qaEA94MGCN6RXOLkub1nGDRBhpCPRpGxHHtabWG4i9hCWKUMWaZHkmbqCkdqlo+xEP0Po3pvDM4 59Ga55ONL0wL9NVWxdhjYzvOc+Laux816gF6axHSG38rxs9l7FSANK6IcXR2G5lD9MqxWdZBJOb
 p051yJy6pHMrN+ZiKOOFN0DS9VK7xybL9R/6/1Aly7Ky+kaW8gCFNaqnNwUthlQZpeNYjWFJ3Wp ZD2UX0u2fmE12mMktazHbd7kz+WhX8jQWc0J/DE8ZtiQ2z4J5Et9SUg1kfN1F+QpfFvVV4Nvum0 FSuzmYpL0lL4CU9Y3zSNBfnUvv027AtVNEUI17oOmZrlE8N16C84AEGxrDiNHvB/ovTwPLj5mNG
 FCqFHtC7L8DRApOPe8CWqgyVi/6pT3YN4ixKM/Hf5ZIoblSTIfWC1zGtPGI8LWaXX6SEr8AL
X-Proofpoint-GUID: DmyoiD6HQmLR4OKq_kSFDs-qAjXAe2Re
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504280057
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 07:03:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117181


On 2025/4/24 20:50, Leonard Anderweit wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> When building with sensord disabled (PACKAGECONFIG = ""), do_install
> would fail because it tried to build sensord which was skiped in
> do_compile.
> Error log:
> make: *** No rule to make target 'rrd.h', needed by 'prog/sensord/rrd.rd'. Stop.
>
> Avoid building sensord in do_install by explicitly setting PROG_EXTRA.
>
> Fixes: 86b20b84ec27 (lmsensors: Clean stale files for sensord to avoid
> incorrect GCC header dependencies)
>
> Signed-off-by: Leonard Anderweit <l.anderweit@phytec.de>
> ---
>   meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
> index 9b072d70b20e..4df03420ae8f 100644
> --- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
> +++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
> @@ -49,7 +49,8 @@ S = "${WORKDIR}/git"
>   EXTRA_OEMAKE = 'EXLDFLAGS="${LDFLAGS}" \
>           MACHINE=${TARGET_ARCH} PREFIX=${prefix} MANDIR=${mandir} \
>           LIBDIR=${libdir} \
> -        CC="${CC}" AR="${AR}"'
> +        CC="${CC}" AR="${AR}" \
> +        PROG_EXTRA="sensors ${PACKAGECONFIG_CONFARGS}"'
>
>   do_configure:prepend() {
>       sed -i -e 's:^#\(PROG_EXTRA\):\1:' ${S}/Makefile
For this fix,

do_configure:prepend() {
      sed -i -e 's:^#\(PROG_EXTRA\):\1:' ${S}/Makefile

is no longer needed.

Thanks,
Haixiao

> @@ -60,7 +61,7 @@ do_compile() {
>       sed -i -e 's/\$(LIBDIR)$/\$(LIBDIR) \$(LDFLAGS)/g' ${S}/Makefile
>       sed -i -e 's/\$(LIBSHSONAME) -o/$(LIBSHSONAME) \$(LDFLAGS) -o/g' \
>                   ${S}/lib/Module.mk
> -    oe_runmake user PROG_EXTRA="sensors ${PACKAGECONFIG_CONFARGS}"
> +    oe_runmake user
>   }
>
>   do_install() {
> --
> 2.43.0
>

