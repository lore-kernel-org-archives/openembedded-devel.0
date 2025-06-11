Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED51C61DB2
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 00:58:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3451.1749603491109853922
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jun 2025 17:58:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8257fd9919=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B0nI8r001103
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 17:58:10 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474mxm3jq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 17:58:10 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55B0w9Ft014382;
	Tue, 10 Jun 2025 17:58:09 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2042.outbound.protection.outlook.com [40.107.244.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474mxm3jq5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 17:58:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RKxtpVy0X1DdfX9bn9nJtJGu3krbxId2/CNX8JqNEQ6OVZ+xiev2ICDCVi5xmj+k+S6mIgoQIW1jM5tNkjt2eLaUfuqF5JzBv3ySvrTZfWAHMde9PDs/3mJdt8N17H2APaShyMjI6sGt9Y7087RidJgh3mraCVHtJrrgVPxZG9Sx8V3lom1le+nfg+e4l4H9wyZp30tyu6GAzydc9jD8C9zAbDWuJ9zXHP3MNOfGvgJGsGWN3VB9AK8Y1Bl4Mn5llquhrX3mW8CZ+6FVFieW+5/XUmTtCH+arfmYLAYMmV03efF3SfQ0S+Wpb9YRXO762iZ2H7OWuZOtAe9zLHecDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=InXYA4kXnpy8BScKsVdAoRB9OEXqP5y4WvwM7U9j6eg=;
 b=ijV3uA5AtQ/tNtJlCK2KJEOhbVZ+B5lzcok51vLW1gVIzpH5zVNWeSkqEH6Q8deZk5FPF2pWojwzZ6e10Pg7kiLbFMlWjAlS+gfzZndXkiVrDy8HL3iOX3s24V85LCTxPRFupGVyj12cY2+FDd8jVftmbZxcpoEFpt2GHZY4PnSBAyuIULkxVtQuQFXS4xd+cF2t7Vh4I1nBpZl8AinOU8PE8eHbhHz1v7kgrZG6VlpojFIioBMQQPsLRFkBCcagwG+et13D79oz7YNrrZFJH6zcpovZ6x2kvg+LunecFE86M32suBQmlk7olsvbxP49w3hAxoJ+zEOhYRhy8Ej6Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH8PR11MB7022.namprd11.prod.outlook.com (2603:10b6:510:222::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.24; Wed, 11 Jun
 2025 00:58:05 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.8813.021; Wed, 11 Jun 2025
 00:58:05 +0000
Content-Type: multipart/alternative;
 boundary="------------1mzjkmbnORGv73usBz2kf3z6"
Message-ID: <c7b99c1b-7758-419e-b47a-6a810ce0585e@windriver.com>
Date: Wed, 11 Jun 2025 08:58:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [scarthgap][meta-oe][PATCH] abseil-cpp: upgrade 20240116.2
 -> 20240116.3
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        openembedded-devel@lists.openembedded.org
References: <1827F55A89124964.16252@lists.openembedded.org>
 <759ac1dd-2bef-44b0-9f73-dc8324d5f029@windriver.com>
 <1d90b516-69ae-4028-9b8d-dfbc38a9f91d@gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <1d90b516-69ae-4028-9b8d-dfbc38a9f91d@gmail.com>
X-ClientProxiedBy: TY4P301CA0028.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::10) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH8PR11MB7022:EE_
X-MS-Office365-Filtering-Correlation-Id: 17996d78-68e0-4fa9-e596-08dda8830601
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|1800799024|376014|366016|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?K3hod0dIZ09YQ2FvMFdCQUtBQllYMEYweitTRURHMFVod1g5VVVWV2N1aytt?=
 =?utf-8?B?S3NKckNPc1lieEFTa0lkZ0JmQXE4RnA4U0NYeDZtc0orRHFQUDFGZWo5cW5J?=
 =?utf-8?B?RzRSV3ppRWphRzZwV1VHdmVwRFU0VE1WanZVZjhRMko2cXl4SThEUW1JVXl0?=
 =?utf-8?B?TnovSm13bHQ5R3BNajJyMkRlVVZMR2pydEpRWW5FTHlNdHdRZ3R1bWZ1d3Er?=
 =?utf-8?B?cnZ3dlJSUUg5SVc1NWg4R3ZZWVF4T3pVYkZkUklYeFFWZnB2MXViTnE2b0ZQ?=
 =?utf-8?B?V3V6Q29oN3BqbS8ra2tMN00yUVJhdnEzTDd4bzdTc1hXbFozSnlGbGVWQm9J?=
 =?utf-8?B?ZnJmZDVhNElLR3VQZVJlRGF4ait0R1NzQ1BVVXhSNm5keVRLNlRHVENyV1Bq?=
 =?utf-8?B?OUVNM2N1MUVEYS8yYjl4V3dhSENQUm5neUViV3F1TnhQOEZTVmFKRTgxb0V3?=
 =?utf-8?B?ZTZKeTUzWDhOM3Q4aXhvMmtkSEYvczVpdk5qSDJDRkFXOEFjODFwOWphTCs4?=
 =?utf-8?B?WGlFL1pHRnpwUDV5RFpWTEowMjRwM1d0U2pKSWtjK1FGM01yNU5SSkxSQ1Jt?=
 =?utf-8?B?VGJoeERkSkZqV3hiVmhyQWFNQVdYS3RrNlBTa3dUVlJWVHVIR09nc3F5bzYr?=
 =?utf-8?B?cnh5aWhnMkZNWTNIWS9mMWVUQWQ3L3JBOG45eDVzZWNZUVVOUW1zVStDdXRo?=
 =?utf-8?B?M0cyM2duMHZ6OCt4bFhweGxmaisxbnBIV2VXdjRHUytPWUV5eDFzVE1tc0ZB?=
 =?utf-8?B?YTVYaFpRNGJ6WUJPZ2JCWVVaQmo3ejcraXluWGRWRnFvRmZMNTk3amlkTjJi?=
 =?utf-8?B?WE9kS1F4eWJUemZia0dDbmQrclZLaXpSaGVtTkN4SWtHNXRjbkN5Z0xtNjJo?=
 =?utf-8?B?bmV2dTJMT1p3cHpTUXQyc0NJaGlQOHJySjJpbC81R1NKenFneVRFM3BrVlpZ?=
 =?utf-8?B?cTNzV2p2cFY2UnJ6aDN1bGwycUxoOHN2SmJWbFNqQUFhVW9ieE9JWGJsRDlz?=
 =?utf-8?B?Ymd1MkJiV0xaZ1d2MW9xSkFJMnVkWHlCeUFOZW00VFg2dG9NeTFNR0xtQ0Vp?=
 =?utf-8?B?WG9pVzIyUlkxTDhMVTRmZFF2dENNY1Jhb01IOFR0RnFKeUxDaE56MWx1dFlu?=
 =?utf-8?B?RTROYTNPZlNTUmZTZzc4M0M1cE9BREsrZThWcUFmVnkxd2V1UlZRNXdFL3pj?=
 =?utf-8?B?aERIby8wRVJ0QjkyNWF4b1l3SEtER2F1eklHSVpoMy9TR0lnZDBVVkZaNnVM?=
 =?utf-8?B?Vk9mVk1LY1FST3ZBeVRtSEF1bXJGRDRKM3VnNmVxMmJsc2VRREFyTys1ZWdE?=
 =?utf-8?B?cFR5T04wZDRvVFNRNFJvUEo2MjltY0hpajBuZGx1K2xESDhXY2FBMGpGTGty?=
 =?utf-8?B?WnIzZW5tKzNNT0ZEaENuZEJYRlJEUndQOXhhR2VxdndCQm5yWUhBWUFKN1Fx?=
 =?utf-8?B?TElnMVhaR2N2RjNNbFR1K0NDWDlqdmREWnNXL3JuSUdIWG5vK2ZacDI2SlZ3?=
 =?utf-8?B?SWtzUmFJa0RFOW5NWHdkRC9hSDBOVFVQLy9CMjZpS0tnbmMvTWUzdVhGNDBE?=
 =?utf-8?B?bGdlRU9rb1FjUklzaHdIZWt1VE1zVDFyWkxuNVJUMUFueklzeE5vaWtxMm00?=
 =?utf-8?B?a2RWbll2eWw2c29IOHErNzZCQmtaSmd4cjVkTjlKWGhFVkk0WWxnM0plQkti?=
 =?utf-8?B?NE9sdXJHNXlWLzhNRmRsSTlMZ3I2bmhIRGFnUmlMUlhRTFVOekpsQ3ZZa1lT?=
 =?utf-8?B?Q054N3lhZ2IrWUI5UEhEaXl4WkRaaWw4U2lwRE0vaWhkRTFQU3E5UUlQSW5a?=
 =?utf-8?B?SlZoOStwNTRLVUxUUUdqdVV3WkZaTElhb1lTdDhyOVhFTFl0OUtJUzI5V2dj?=
 =?utf-8?Q?OyDrjnWpDCDr9?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NS9RTlhncXNGWlB2c29BVFNXQ2R1aHMxVjRobENCYUFkb1Raa3lvcXdCTkM1?=
 =?utf-8?B?U0xHUUFuRTUwVk9CMGJma3VBK0dpMFN2ajFsUFF6bFJZWVJEYzh6ZVhTaWpj?=
 =?utf-8?B?bzEyQnVOR01ZZnppZ0hiTkh0ZzJwVUxXR29OUDVNcGtCSTRYMm1QTkxnMWts?=
 =?utf-8?B?T01WYTBadG5mWng3VHFXNDlWMlJpeWM0L1dDcmZ4dlRkOVk1cm9GRCtTRnor?=
 =?utf-8?B?TFMwWGVGaFEzU3ZWbkdtN2RUcEprNEFUcTlReWlhcmVIeUVaYzJsOHdJMXBj?=
 =?utf-8?B?WENVVE95b2xJTktlbkFGY0lpQXpZWUU3UjNGZjVFeXEzUVJvUFBZUUFZVm9E?=
 =?utf-8?B?S0w5SFJ2RXJZZ0haRTducUJPbkN4VGU5bGdQcmpsbGtTMGpSRnhpbDlPcEpV?=
 =?utf-8?B?ZVdwb0ppYkQxUzFXUjF6K0QvS241QkNsR2NFbTR4RXB3bmEzbzI1Q1N5RVdl?=
 =?utf-8?B?NkRUNUFQcUVUeUI5VThlVkpOenEvODUvelMxNlM0TzFLVVdvWTRLYmd4aUkx?=
 =?utf-8?B?Q0FxV3JMdHhBdi9BRnliS09IMkhyOUtnSHB4aVNlUCtCSUdSYmZVY1dBNWY5?=
 =?utf-8?B?cmdaWm5waFRiOHFRNm1LdXlON3lBbVZWMlRiZUdoM3lTM21nTjY1RzZDTndO?=
 =?utf-8?B?aEhEZldXZVNJN0NKOEhHenhYMEhtTUlJR2JubGI4Y3dudVRDWGhkSUJybGRI?=
 =?utf-8?B?Qng3RXU2S1lyUG91My9VbjNZQk90WnZodklvY2pwdlNwSVFSY3lkbDBvLytu?=
 =?utf-8?B?M2ZTV3FNU1lkK2RaRDloMHQzc3NSSkt5cG1DYitPa2RyUlowdXd3VFlyWHRo?=
 =?utf-8?B?aXVKZkVKWlVrcFVocWgwNWwyd25mZTlTeEZpbjVrakQ5MHNtaGo4Yi9mL0Va?=
 =?utf-8?B?RGFhdVZqUWdud1pnYWR4aVArN2IwaC9TNnZ1RUVIT0wxbUJJK3JtRktsVjBW?=
 =?utf-8?B?SjR5T0xLRXp1R0RNYmpnbkhGOTVsbERnNnNqdFhrNGVMM0ZRMUlRQlducW5P?=
 =?utf-8?B?SURMZktqRUJVTk1zRnJjNUZrejJKTHdxT1M1OXp3QTA5S2czZlMvTXZoclEr?=
 =?utf-8?B?NTd2aXI0RU9QbENKV3VoTFdQdHhUV1hXdWk1T05yaVRWb2ErQ1Rrdm5VMW56?=
 =?utf-8?B?NzlGSCtNY2J1V1BJMGJ5bjY2UHl1Rkt4SXpRV2ZmWjBpN1Z2a2YxMzVQZzZn?=
 =?utf-8?B?ZjFUcHdRT2JmWEhVc0JFckJXMjVmS2hBRGRTNUtWeSt3Z1VObHBKaW4vVDRu?=
 =?utf-8?B?cUR0L0tJZENkcitDZ2dYaVN5aEN6elFKN1lDK2MzTjl3MEgvMHVxOUI5a0My?=
 =?utf-8?B?L1VweFBTNVNYYWVsWGJCb0JmbGNyZTlzeVRjL3lxM0c5MFJ0eFlFZ1hoQ3VE?=
 =?utf-8?B?WE40dGRRTVRLYUNXKzY1Q0lGWVduM1pmL3VuN0pCYkdOaldyL2VON3RTZ0lu?=
 =?utf-8?B?T3piZEhGK1I5NENFUG8reGZwUzhJeitRRHNCVDV5cnhmeUQxSGE2L2lwWFhp?=
 =?utf-8?B?LzRXK0RmTFNWVjI1VmptbW41alpKNWttNVR1d0pXV2xRYjBKREVJQUdydzhY?=
 =?utf-8?B?MzMwSUxuUFFNQVhJS29YdS9hSFlHWFV4SitjdnMvdkQ4SER2U0kwMThJZldC?=
 =?utf-8?B?anowU1M4bUV0ZTZORS85bElYSy9tM2NDeDJUTTQ2Nkd1bWl0SG9XSGhmRXJD?=
 =?utf-8?B?S01ZaW4zVkljQkwzV2ZQb3J3eHloTlRnOEpTb2gzYUtZNVdhdFYvdlNNSjky?=
 =?utf-8?B?aWpvUDJRNWlHQk92M0JQbDNzTnBSdWs3S1d0ZEx4cS9HL3hEcjVTcy93aDdS?=
 =?utf-8?B?VGlkRDc3SXdWbzlxZS9jSERYQW8wUXlDeUs2andRSWpqTjVEQnIrd2ljR0NE?=
 =?utf-8?B?Q3ZHcXZuRnBHUTZ4aFRVZVZyZk1oSzVBZXAvWFdndWZ3ci9LT1YweEFieTJ3?=
 =?utf-8?B?S1FnaFo0UGNpQ2draWU2Q2JHaVlzd3dhNlUrMm9iM1VWcVk0My9wTTFzU2lO?=
 =?utf-8?B?K3VMeVBnYjFjNURrQzdkSGhsVDgyVks4WHBLd0RFR0xwUWNJaGZkUGV4eFhx?=
 =?utf-8?B?MGJSdi9WTGY2ay9xQS9iUDdGT2VwTVI5MzdrM2gwNXZBUU1lZ0ZTSXkyUkRq?=
 =?utf-8?B?WVo3SklCcmxFenRUVnFzWTcrRzJqU0g4L2xlbnZBSG5wejgrL3BMN2R0eG5Z?=
 =?utf-8?B?S2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17996d78-68e0-4fa9-e596-08dda8830601
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 00:58:05.4193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OndkEa40jKpS80EM+gXNpoq9lGE5ovK48Xpviaw12HV5ulDnFfZ1NejTsA2RDQOc4XuTs7ZgfT9zoDsUVRO1ofExijbhbYuI5wjRzGVXySM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7022
X-Proofpoint-GUID: UQ_Zv4qEzGOub0ciz15mjsyiXg64uIwK
X-Authority-Analysis: v=2.4 cv=L74dQ/T8 c=1 sm=1 tr=0 ts=6848d4a2 cx=c_pps a=L/hALDhYQ2kaG+m2YXDVcg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=LD0U8TpTg8X4cr7UNlAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=yj-aMKAYKbz0kkd27lYA:9 a=OFFnMDhRNmP2W0L0:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDAwNiBTYWx0ZWRfXwoczOgty5jbC PJauG1epb4xSWDWGG2KDnkXYJH1nnMDrBUfxFmjhl4dNvo8YcVh25ODKU3udG3yNkdgNYw6bMk0 ZnxijWaTiR45zKI6/tj2TLlu06gYMZL6iOWVg5W+cUj7PhtljqVE4K31+EfPlsm8xF6Of4F7lw1
 hNbat23LvQs8SWQccDftlHLJTYq8LX/lCnr7jrqmSCR15hSIU/2cqIB95VDjIl2lwD9tB5OPs79 y/FvkK2zcnsRToAuhvekNUFlaRL+URtsbtxsKBAUsoh3cQsSzQ/iuFCLjDhBbJPwIxvJf56pxWP Bf+q6OwSrAqVa8/VzRlauQlEVbM7HQzE2VPJb6KlUuD4ov5shhGjPdLuXcTDCkihCw7VHfeQHaa
 ldiorrPk1bHYXj713bcS/YSawtLU5iA5mlL4bHdFiPBb2n0kYIpt4u3gXQ/OFh65NIGaD9g6
X-Proofpoint-ORIG-GUID: WFw7iwE7_TIbkPBqWtvrQxNl6qlabMeW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_11,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506110006
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jun 2025 00:58:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117881

--------------1mzjkmbnORGv73usBz2kf3z6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55B0nI8r001103


On 6/10/25 14:49, Gyorgy Sarvari wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On 6/10/25 05:37, Changqing Li via lists.openembedded.org wrote:
>> ping
>>
> Is this the correct submission you wanted to ping? This has been part o=
f
> Scarthgap since March:
> https://git.openembedded.org/meta-openembedded/commit/?h=3Dscarthgap&id=
=3D48980f26fe804e50c41d76decfc06492eb0f7b1c

Sorry,=C2=A0 this should be my fault,=C2=A0 maybe I checked the wrong bra=
nch.=C2=A0=20
Please ignore this ping and thanks.

//Changqing

>
>> On 2/27/25 12:12, Changqing Li via lists.openembedded.org wrote:
>>> From: Changqing Li<changqing.li@windriver.com>
>>>
>>> This upgrade include security fix for CVE-2025-0838, refer:
>>> https://github.com/abseil/abseil-cpp/releases?page=3D1
>>>
>>> git log:
>>> 54fac219 (tag: 20240116.3) Fix potential integer overflow in hash con=
tainer create/resize (#1812)
>>> d7aaad83 (tag: 20240116.2) Abseil LTS Branch, Jan 2024, Patch 2 (#165=
0)
>>> 2f9e432c (tag: 20240116.1) Prepare 20240116.1 patch for Apple Privacy=
 Manifest (#1623)
>>>
>>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>>> ---
>>>   .../{abseil-cpp_20240116.2.bb =3D> abseil-cpp_20240116.3.bb}      |=
 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>   rename meta-oe/recipes-devtools/abseil-cpp/{abseil-cpp_20240116.2.b=
b =3D> abseil-cpp_20240116.3.bb} (97%)
>>>
>>> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.=
2.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.3.bb
>>> similarity index 97%
>>> rename from meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.2=
.bb
>>> rename to meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.3.b=
b
>>> index 87ab239311..11f4f3f9b7 100644
>>> --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.2.bb
>>> +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.3.bb
>>> @@ -7,7 +7,7 @@ SECTION =3D "libs"
>>>   LICENSE =3D "Apache-2.0"
>>>   LIC_FILES_CHKSUM =3D"file://LICENSE;md5=3Ddf52c6edb7adc22e533b2bacc=
3bd3915"
>>>
>>> -SRCREV =3D "d7aaad83b488fd62bd51c81ecf16cd938532cc0a"
>>> +SRCREV =3D "54fac219c4ef0bc379dfffb0b8098725d77ac81b"
>>>   BRANCH =3D "lts_2024_01_16"
>>>   SRC_URI =3D "git://github.com/abseil/abseil-cpp;branch=3D${BRANCH};=
protocol=3Dhttps \
>>>              file://0001-absl-always-use-asm-sgidefs.h.patch         =
     \
>>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#117858):https://lists.openembedded.org/g/openembed=
ded-devel/message/117858
>> Mute This Topic:https://lists.openembedded.org/mt/113564155/6084445
>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub =
 [skandigraun@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--------------1mzjkmbnORGv73usBz2kf3z6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/10/25 14:49, Gyorgy Sarvari wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1d90b516-69ae-4028-9b8d-dfbc38a9f91d@gmail.com">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On 6/10/25 05:37, Changqing Li via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
ping

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Is this the correct submission you wanted to ping? This has been part of
Scarthgap since March:
<a class="moz-txt-link-freetext" href="https://git.openembedded.org/meta-openembedded/commit/?h=scarthgap&amp;id=48980f26fe804e50c41d76decfc06492eb0f7b1c">https://git.openembedded.org/meta-openembedded/commit/?h=scarthgap&amp;id=48980f26fe804e50c41d76decfc06492eb0f7b1c</a></pre>
    </blockquote>
    <p>Sorry,&nbsp; this should be my fault,&nbsp; maybe I checked the wrong
      branch.&nbsp; Please ignore this ping and thanks.</p>
    <p>//Changqing<br>
    </p>
    <blockquote type="cite" cite="mid:1d90b516-69ae-4028-9b8d-dfbc38a9f91d@gmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 2/27/25 12:12, Changqing Li via lists.openembedded.org wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

This upgrade include security fix for CVE-2025-0838, refer:
<a class="moz-txt-link-freetext" href="https://github.com/abseil/abseil-cpp/releases?page=1">https://github.com/abseil/abseil-cpp/releases?page=1</a>

git log:
54fac219 (tag: 20240116.3) Fix potential integer overflow in hash container create/resize (#1812)
d7aaad83 (tag: 20240116.2) Abseil LTS Branch, Jan 2024, Patch 2 (#1650)
2f9e432c (tag: 20240116.1) Prepare 20240116.1 patch for Apple Privacy Manifest (#1623)

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 .../{abseil-cpp_20240116.2.bb =&gt; abseil-cpp_20240116.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/abseil-cpp/{abseil-cpp_20240116.2.bb =&gt; abseil-cpp_20240116.3.bb} (97%)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.2.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.3.bb
similarity index 97%
rename from meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.2.bb
rename to meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.3.bb
index 87ab239311..11f4f3f9b7 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.2.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.3.bb
@@ -7,7 +7,7 @@ SECTION = &quot;libs&quot;
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915">&quot;file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915&quot;</a>

-SRCREV = &quot;d7aaad83b488fd62bd51c81ecf16cd938532cc0a&quot;
+SRCREV = &quot;54fac219c4ef0bc379dfffb0b8098725d77ac81b&quot;
 BRANCH = &quot;lts_2024_01_16&quot;
 SRC_URI = &quot;git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
            <a class="moz-txt-link-freetext" href="file://0001-absl-always-use-asm-sgidefs.h.patch">file://0001-absl-always-use-asm-sgidefs.h.patch</a>             \

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#117858): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/117858">https://lists.openembedded.org/g/openembedded-devel/message/117858</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/113564155/6084445">https://lists.openembedded.org/mt/113564155/6084445</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:skandigraun@gmail.com">skandigraun@gmail.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------1mzjkmbnORGv73usBz2kf3z6--

