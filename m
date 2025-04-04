Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70BFFC36014
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 14:39:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.13162.1743777587754096856
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 07:39:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6189ea431a=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5347vgSD029985
	for <openembedded-devel@lists.openembedded.org>; Fri, 4 Apr 2025 07:39:47 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45sg1uaby8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 07:39:47 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 534Edkir029149;
	Fri, 4 Apr 2025 07:39:46 -0700
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2177.outbound.protection.outlook.com [104.47.73.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45sg1uaby7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Apr 2025 07:39:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IM17kNVtQKi6wUBnjcluYpSjJhBgg6yTfg4tCXOBj6nis5SQnkFTtGoXwRJJ5/KFQILkzJQ8O5zbzAXibKo81BhV4psr6eUJLEtZ8cdW/6iuigrTWefFYGmbVYA/nHp1yx79t1gGNGgUWd/nry1YtRce2P5LP6O6So0xDGf7sOiHICjyzvgWsGKCEODNkHI2Qbs6qpBgicYbI2cMlhExKYU5rVXP9wD7LIrncpZjIjFoNtJIwPg/ihqtCH2bAnUXUwaY28seoLX12eZIM2hsYOetnjpxgF/ktr/RgIZ8nHqAcldHvL6YbAJu9B6KEh229XA0Pn77Z5w5pkRh354OoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPLJ7w28VEarjam6IV3+2w+uL1AX53mj52/6Kg+G0Gs=;
 b=TkL8zxkj6NaRDaLH1jHYLFcDxe/6dS/ki6JyW/bAHaQ72xb/vJshEx7jfeTP2JGNeJQz5DG/azPpWMr927eGY7gBZpy1REV9uF+hP3mqj5ar/sFgkwlcyFUpfWy+Uv5ttrS5hfoC4gvLpR/dktkxHm8gvT99Iwq+MWppNcxzdHNNsheRjZQYH/Nz9alUrsoM3qaffT8ZgMtCv5WLhfcSwGT+Sq7PYRthwqSsLPEq81C6wbtQINwc7tFR5fwDUxXXzxaO0WKV0AYteKx2ti1yA4Ua9YzjiuW8Gri/LY4I0YZ96ezEp778KkrAPk9aeOJClgqg+Q7PppJT9bRrC7179g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by PH7PR11MB6674.namprd11.prod.outlook.com (2603:10b6:510:1ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 4 Apr
 2025 14:39:44 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%7]) with mapi id 15.20.8583.041; Fri, 4 Apr 2025
 14:39:43 +0000
Content-Type: multipart/alternative;
 boundary="------------pXrhij4WHOPyQ4zcLEJlHsBi"
Message-ID: <8a4ec48b-65ce-4d10-93cd-1cfaca18493b@windriver.com>
Date: Fri, 4 Apr 2025 10:39:41 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] valkey: update from 8.0.2 -> 8.1.0 (Actually nano)
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250403204412.1686638-1-Randy.MacLeod@windriver.com>
 <CAMKF1sqQBe535z056kEL6RSHqnaAgELjTPRghwfQo_1N+UPkmw@mail.gmail.com>
 <c13725c6-ebda-46fc-8241-c15455425cf1@windriver.com>
 <CAMKF1sory-jGJB3QuboBfr9-9HP6VVWB_R-DmL+zxnSE9fVE2A@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CAMKF1sory-jGJB3QuboBfr9-9HP6VVWB_R-DmL+zxnSE9fVE2A@mail.gmail.com>
X-ClientProxiedBy: BYAPR07CA0075.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::16) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|PH7PR11MB6674:EE_
X-MS-Office365-Filtering-Correlation-Id: 556f546f-2d09-4201-def1-08dd738689ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|4022899009|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ODM3N1FGM2FnemQ4cDRzZTVOWWZMUjMyc3JZb1gzeHB0UlBXeGJDZWpPTHBK?=
 =?utf-8?B?ZzV4eFV4endYMi9VSUpyVGRCdFRrMWduQVF5WllEL0JPamd6QkhUS1pESHFF?=
 =?utf-8?B?cmxRNnByYUtNdzJ5TU54Ykk3ZDRWYlJyUGRCSFYxZ0pmOGxxR1BUb1BrQlJH?=
 =?utf-8?B?YmhzWDFnLzczSWdBd0F4ajEyT2JoakZZUmI3ZnQwZnpQZnRabXlzbGtybWNz?=
 =?utf-8?B?eTZkaFV0NlJ3VGYxdFJOb2taOXNQbW5tQjVFNGJHUnY2alVscnAxSzlwSFVN?=
 =?utf-8?B?dGFPVGh3ZXo1a3JOdklIaTd0eHV4VEY5c0NMaWY1TXhxM3FuMnRQQmo1MVZy?=
 =?utf-8?B?czJVYXh6SWZ6ZmNtNWY0bWl5UU0yWGhyYkl0TXA4OXBwMTUya2NJSzgveGZL?=
 =?utf-8?B?d3lxWTZzV1Z2OE5aa1RQRHJiRWt0Uk1NVVBhNUIvNlZhUzF1OEd1WksyUkxN?=
 =?utf-8?B?YVJmcnhlRXFxanNEVmhuZWVFQTBFSFVwc1kzbG8vcFFBQittUVg2Yk1nZW5F?=
 =?utf-8?B?cnVIQXZDL1BZemg5SkFvWTNWUjY2TEtRQlhmNTlNM3AyUnR2dHBBOG5KSE1k?=
 =?utf-8?B?OU95SVZTeGVFNmJYS2dyLzJHRjA3d2FhR2NFS0xMRkdjb3QzbzBkM1BPQjVJ?=
 =?utf-8?B?K3A0WHB3UXJ5ZVRoSjYxMlkvaExwazRlRWFWN282VGh6VEFxcjBydHNuVmtL?=
 =?utf-8?B?ZFNZWjFML3dzbER1dENUMk4xZVB6VmZLdGR0aC9qVmZJWWdqcTRMQXhrbkJY?=
 =?utf-8?B?WGlIVzBKNHQ5bEdkaGFYcmg5VXIvL3dadWJtdWJKMVBReitHcVlRSzlsUlhi?=
 =?utf-8?B?QlFTSkhpWEtBY3R5MVFoSTA3SUJyUWVTZXRvZThnTEsvUDBUTkNtN2E0dnJC?=
 =?utf-8?B?RTRRZ0VxRXNPTHROL0h3MFVDY25kZ1VOL1owSzZFdWpoV01NeEtBZkVJVy9Q?=
 =?utf-8?B?b3hzN1lOS00vWGpSbG5sZk9GS1hDaUtuUlRHZGVVMlhxcnlJWnRndHI3SDE1?=
 =?utf-8?B?dU1EVnB4bDVDbzN0ZmRqSUNoNnZqT1FENCtaZTJvdDRGTGtBSXg1Z0tzT1VS?=
 =?utf-8?B?NmtJYnRSNXlSNUxiUGl1MUFIdXU2cG91VXRhV0lxZEZwTG5IcmtJQVZyNlV6?=
 =?utf-8?B?OHdOWTRoeldPN1BPSEtnc0IycWU4V3d3eGQ2Rkx1NERKZmhONXRxRG9xanJJ?=
 =?utf-8?B?WENZUHV1aWVHYTNXQitMS2pVR2JwakptY3RzOXRXaFpKbkp1TUlpME1GenVI?=
 =?utf-8?B?d3FZTG13MmxRa2o0RkFQM0dQT3o3NElVU1ZWK2VaOHhoM0wyRlYvOGtETndX?=
 =?utf-8?B?RVZQRG1qY3djMm1kbTdrUnFweXN2YTdiOWFTTmdYNkRFVjFHN1ZaUHJpU3Ro?=
 =?utf-8?B?NlYxR3h0d3RnSFQ0MklPMlcyNjVPbWVpWXNNcXZoRmdKbENtTFBHcUt1b3hK?=
 =?utf-8?B?b1B5ZnQ1M0E0a0pNR2lVWGZMdVZvQUxIRFREMy95eTBRQU9jc1czN05SUnRa?=
 =?utf-8?B?YUo3V2JzdHdVQkZ6RlI3c28valZRUGphVVJuUWVqUEd3OEVQNWpkWDFCVmxW?=
 =?utf-8?B?bkg4ZHVGcWZwQWcxdVZIVVBESHFnOHBBMWh1NENiRmorRnpIWlhicHBDeSs0?=
 =?utf-8?B?eVlMS1MrMXhjZktYd3JJY01HQ0tSUFdMby9MdWNzdGFmeWFVVUhmeTU1UGRU?=
 =?utf-8?B?dnpxZnFMd1FQQkkxMVZqQWlWdUoveUFWSG1FcW51MVUwM3FBZ2xnMXp4R1Nm?=
 =?utf-8?B?Yy9XYW9zUXpjQjhQak9TMDRtSzUwb3hZdXljaS82ZWkwRkJmbG1zUXBxa1hJ?=
 =?utf-8?B?bVlUZEU0ZmtEUmRHVU81dz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(4022899009)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QlgvcEYxMTFqNEZadWpCLzRBbU0ySFV4bW9qellxZG1oRmh3MFRqWFJNSCtH?=
 =?utf-8?B?Ri92QXp2VmE2VVV5MVJwVUJMQ3FWcGNKZlYwakF1R090Uk4wU0ZCSWpaWkY5?=
 =?utf-8?B?V3lvS2pFdGRqdDgzcUdKNjZYd0xSeWs0eHl2YXZKcDdTbFZudG9PaGNYR0J1?=
 =?utf-8?B?LzFXL3dsNktLL3R0QlhzbjlvTTlFSEVCWWZRd0hQMHlqdEUxTTJhOTZnU0o4?=
 =?utf-8?B?amR2RVhQRTgyeFExbVNFWHJvamdqWUhTS1ZacUpDZlNYVFA5eXFVQmszOVVE?=
 =?utf-8?B?cFd4RDN1MGRDSmRndmY4Q1dFUEFqQ0l4WUJnRFk2YTRYYXVkTzZTd3grRHZ4?=
 =?utf-8?B?cVJVSEdOQ21WS3poMFV2UEQ1dnA0VE9JTkQwcjVwMXFhVUFlVXNtZGJLTGVP?=
 =?utf-8?B?aHBOV0ExdmdkTm5XWkpLQWJkSW9wOFI0YS9kZFVkM09lcm9YNE9BbEFhU2U1?=
 =?utf-8?B?Q0tNWXZpNVM5UitybldpMXgxdW9FMDVCZWI4cFFZSW95V3c4blZDR3U0SEpH?=
 =?utf-8?B?bjgzYW5FNmh5R2RQWldISW9YV3hIN2hlbHZselo4YjBUY0lRS01hcXExU3lz?=
 =?utf-8?B?UGw0WkFpTlA2NkJGeWl3WUlTanBGY0YxQjZ6akFRbWZMMWhhWTVLbWY3bnJ4?=
 =?utf-8?B?Uk1IRzg4Q0FJL3ZEM1AwSUFranEyTkl1RURzdWh3U1FaWm9jZi9xM1FvL1VY?=
 =?utf-8?B?UW0vblp5M1ZTK0hNbjVzWUcwaG15eEJrU0hEYTVISzJoUHJDcWtQQU1WZUlp?=
 =?utf-8?B?T3V1bytoakIwQzdzNU5BN1NnSTg5Ymt6ajVwNmJrZmk4b1VWbDhRaDRWY0kr?=
 =?utf-8?B?Q0RKamJHQno4MFR6Z2wxbjkxcVF5M2wzN0Q5MVdkZU5adXJncVMxZGUxaWpE?=
 =?utf-8?B?YVl1M3NubHpZOFIyRWdmTmtYc0VHdlIyQlFpUDUxY2UrVFIzeGV5MFJjZkhN?=
 =?utf-8?B?RmR3NFhPN2k4YTl3SXVWSkVhWTlFcVZ2RVJoZ1hSWDAxdklETFhreGlPd3ov?=
 =?utf-8?B?S0YrVzFsMWZlQ3dKRllRYWtLWDRxcU5IQ0FTN0Q4VkRvSDR0ejRKeUNuOEJp?=
 =?utf-8?B?MHY3YlhseHFhZ0pkUkFvZmdzR2ZLaWI2eHNyRGlNb3cybWpmMmJrbFRVRU1u?=
 =?utf-8?B?clpSOWp4Z2RWL2lWblZvcERJbWNXWkFyWVZWTUpwS3RDYTdCMU5YSERIQjlI?=
 =?utf-8?B?TUovYmNsdTExNjlVSWRtVnNCZnJlZ2xjSmJMd0d0Q09JTXo3R3Y5dFcvQ2RI?=
 =?utf-8?B?aFFaWTVSSTV0eFJxKys1YTFmckVMMFdRMzBVb21lMWF4UGhGVlVEVi83QklW?=
 =?utf-8?B?TWNROWpDeWVqaFhxVVdYTlBEc1dpOCttbitTYVd4RmovRWJRWVV1M3FOeStF?=
 =?utf-8?B?U0NXWWQ5dWF6YkZNN3p6ZnlyNDBrWWo5ZFZOUml0OUMwL2E0SEpnLzh2UmFh?=
 =?utf-8?B?QldwN1FSQ2tkNGRGMFYwTWMzWVVoSXdBUUJwcU1ZbmIyOHNERnFhOCtUa1U3?=
 =?utf-8?B?dFF5alJQclVjc0U4QzlHVENoUkxEQk93Z29SNmVjc0ZqRitrQklGOHVEY0Nr?=
 =?utf-8?B?dnBOcXljZ2daM1E1UTd6RVR2cnRMNURoT3lXNExraU5MOG93UFpsZEVQOXJn?=
 =?utf-8?B?dy9QVEJyYXMzMEQ4QmhNVFZIelo2aVVLKzE4RE90ck9JU2NLaEVDWitOeXlK?=
 =?utf-8?B?bXpEQUJGdEZNZWpSTEJFVGZhYnd4ZzA0V2tRd3dZVmROTUYwNEk2bFMxYy90?=
 =?utf-8?B?T1NheVczV2ErcGZrZ3FvcFdVTjJMYk1BUFY0YTlCT25PQWM1bmdLREhTZS9m?=
 =?utf-8?B?RkFwWVh0RVc5dkluaU55QThtNG90eVgyN0VYcjloT2NTbzdYaVNsWjdOUnQ5?=
 =?utf-8?B?RFR5a1RtZTBuMEhlSVRiR3I2cTdmejgxV2xUYjd2OHk1L0VPTHYyZEQvd3or?=
 =?utf-8?B?MW1CVFR1eGd1ZmNLWUZkWmxGUFFMVlliUDRuSkNYQU9Cbm02VHc0dGN3WlBJ?=
 =?utf-8?B?aGs3RW1LU0pTMlZYVERUOFZLbE5qcmNVa0duaWpwTlAwY3lNbkZzL3Z6RTJE?=
 =?utf-8?B?VmYySDJsU081Umg3UUhXcG1BbUl5RE15OG5rVGh3aGRBQkhsdU8vQllGSnFk?=
 =?utf-8?B?dVpzZXNxeml4aDcvTWEreTN4eFBaVmk0UkR5NzI1aWZVRndGMHBLRk1GUVc4?=
 =?utf-8?B?N2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 556f546f-2d09-4201-def1-08dd738689ec
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 14:39:43.5129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IBH1nXG9t8zDclMvMmGtnyMs+V7Y/nLQ2CswMkRXsaqfzMMc77ett6xhkZO05dNhpLmRLPPNdnFBM7YxrtkgVfLMReliMqfRGke+xgfhvhY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6674
X-Proofpoint-ORIG-GUID: rBqKXrqH2xwsJDqDodgqh5FUkFkHGNOG
X-Authority-Analysis: v=2.4 cv=Aqnu3P9P c=1 sm=1 tr=0 ts=67efef33 cx=c_pps a=VBfpofCtJTW4YIct4dFqXg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=NEAV23lmAAAA:8 a=mDV3o1hIAAAA:8 a=BjMif5yZAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=ZqophNzgMfHFeH1gZOMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FTSR9ir-D6rYDQp7eVoA:9 a=Saxo_beJJwAGavIa:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=ftVT4cx30j6SLCxtN1ED:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: z2ucZ22zR7SRQT_VF6-Zb_sVnKfKemG-
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_06,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504040101
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 14:39:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116587

--------------pXrhij4WHOPyQ4zcLEJlHsBi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5347vgSD029985

On 2025-04-03 8:56 p.m., Khem Raj wrote:
> On Thu, Apr 3, 2025 at 5:33=E2=80=AFPM Randy MacLeod
> <randy.macleod@windriver.com> wrote:
>> On 2025-04-03 5:03 p.m., Khem Raj wrote:
>>
>>
>>
>> On Thu, Apr 3, 2025 at 1:44=E2=80=AFPM Randy MacLeod via lists.openemb=
edded.org<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>>> From: Randy MacLeod<Randy.MacLeod@windriver.com>
>>>
>>> Release notes:
>>>     https://github.com/valkey-io/valkey/releases/tag/8.1.0
>>>
>>> The license file checksum changed because upstream added the line:
>>>     SPDX-License-Identifier: BSD-3-Clause
>>> Add OECONF to avoid build-time checks for strcase[str|cmp], both of
>>> which have been in glibc and musl for > 10 years so it's sensible to
>>> default to yes.
>> Why do they fail I wonder
>>
>> I dug a bit but wanted to get the package update in.
> I looked a bit and it seems that gnulib got updated
> https://git.savannah.gnu.org/cgit/nano.git/commit/?id=3Dc7033324a9e31d7=
b00454db04496880e889d32f0
Thanks.
>
> which perhaps added new logic which is not working in cross compile may=
be ?

Lots of strcase* changes:

=E2=9D=AF gl --grep strcase=20
4631e9b4d5d3bd5ba42864c7001cf3509a00c7b3..f1daedcb4c6c653dfc2936847dfe55f=
5a076d94b
706178a93b=C2=A0=C2=A0 2025-02-21=C2=A0=C2=A0 getlocalename_l-simple: New=
 module.
e21236c305=C2=A0=C2=A0 2025-02-20=C2=A0=C2=A0 *_l: Fix mistake.
439b7f4de8=C2=A0=C2=A0 2025-02-17=C2=A0=C2=A0 strcasecmp, strncasecmp: Fi=
x compilation error=20
on MSVC.
9b269e666a=C2=A0=C2=A0 2025-02-16=C2=A0=C2=A0 strcasecmp_l: Add tests.
6fafa36c51=C2=A0=C2=A0 2025-02-16=C2=A0=C2=A0 strcasecmp_l: New module.
a8fa6e6314=C2=A0=C2=A0 2025-02-16=C2=A0=C2=A0 strcasecmp, strncasecmp: Wo=
rk around Solaris,=20
Cygwin bug, part 3.
ff91cd3ce3=C2=A0=C2=A0 2025-02-16=C2=A0=C2=A0 strncasecmp: Work around So=
laris, Cygwin bug,=20
part 2.
557f0e4958=C2=A0=C2=A0 2025-02-16=C2=A0=C2=A0 strncasecmp: Work around So=
laris, Cygwin bug.
fc6bec11ff=C2=A0=C2=A0 2025-02-16=C2=A0=C2=A0 strcasecmp: Add tests.
9980b9e526=C2=A0=C2=A0 2025-02-16=C2=A0=C2=A0 strcasecmp: Work around Sol=
aris, Cygwin bug.
6abed08f2c=C2=A0=C2=A0 2025-02-16=C2=A0=C2=A0 strcasecmp, strncasecmp: Fi=
x header reference.
f656293f0e=C2=A0=C2=A0 2025-02-16=C2=A0=C2=A0 c-strcasecmp, c-strncasecmp=
: New modules.
c17d70aaae=C2=A0=C2=A0 2025-02-16=C2=A0=C2=A0 strings-h: Don't declare st=
rcasecmp,=20
strncasecmp without the module.
b2927d1b1f=C2=A0=C2=A0 2025-02-16=C2=A0=C2=A0 strcasecmp, strncasecmp: Ne=
w modules.

=E2=9D=AF gl=20
4631e9b4d5d3bd5ba42864c7001cf3509a00c7b3..f1daedcb4c6c653dfc2936847dfe55f=
5a076d94b=20
| wc -l
435

=E2=9D=AF gl --grep strcase=20
4631e9b4d5d3bd5ba42864c7001cf3509a00c7b3..f1daedcb4c6c653dfc2936847dfe55f=
5a076d94b=20
| wc -l
13

The old commit id was on:
=E2=9D=AF git branch -a --contains 4631e9b4d5d3bd5ba42864c7001cf3509a00c7=
b3
* master
 =C2=A0 remotes/origin/HEAD -> origin/master
 =C2=A0 remotes/origin/master
 =C2=A0 remotes/origin/stable-202501


I'm busy today but sometime next week,

I'll learn about gnulib, re-work this update and report the problem to=20
upstream to gnulib devs if needed..

../Randy


>
>
>
>> It's not a key package so whatever.
>>
>>
>> ALSO: I need to resend with a corrected subject line!
>>
>> It's nano, not valkey - copy pasta!!!
>>
>> v2 sent.
>>
>> ../Randy
>>
>>
>>> Adjust the patches using devtool and manually munge the Upstream-Stat=
us-es.
>>>
>>> Signed-off-by: Randy MacLeod<Randy.MacLeod@windriver.com>
>>> ---
>>>   .../recipes-support/nano/{nano_8.3.bb =3D> nano_8.4.bb}    | 9 ++++=
++++-
>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>   rename meta-oe/recipes-support/nano/{nano_8.3.bb =3D> nano_8.4.bb} =
(75%)
>>>
>>> diff --git a/meta-oe/recipes-support/nano/nano_8.3.bb b/meta-oe/recip=
es-support/nano/nano_8.4.bb
>>> similarity index 75%
>>> rename from meta-oe/recipes-support/nano/nano_8.3.bb
>>> rename to meta-oe/recipes-support/nano/nano_8.4.bb
>>> index d1af89ef8d..1aae49d3b6 100644
>>> --- a/meta-oe/recipes-support/nano/nano_8.3.bb
>>> +++ b/meta-oe/recipes-support/nano/nano_8.4.bb
>>> @@ -13,10 +13,17 @@ RDEPENDS:${PN} =3D "ncurses-terminfo-base"
>>>   PV_MAJOR =3D"${@d.getVar('PV').split('.')[0]}"
>>>
>>>   SRC_URI =3D"https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.ta=
r.xz"
>>> -SRC_URI[sha256sum] =3D "551b717b2e28f7e90f749323686a1b5bbbd84cfa1390=
604d854a3ca3778f111e"
>>> +SRC_URI[sha256sum] =3D "5ad29222bbd55624d87ea677928b3106a743114d6c6f=
9b41f36c97be2a8e628d"
>>>
>>>   UPSTREAM_CHECK_URI =3D"https://ftp.gnu.org/gnu/nano"
>>>
>>>   inherit autotools gettext pkgconfig
>>>
>>> +EXTRA_OECONF =3D " \
>>> +    ac_cv_func_strcasestr=3Dyes \
>>> +    gl_cv_func_strcasecmp_works=3Dyes \
>>> +    ac_cv_func_strcasecmp=3Dyes \
>>> +"
>>> +
>>> +
>>>   PACKAGECONFIG[tiny] =3D "--enable-tiny,"
>>> --
>>> 2.34.1
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#116546):https://lists.openembedded.org/g/openembe=
dded-devel/message/116546
>>> Mute This Topic:https://lists.openembedded.org/mt/112047294/1997914
>>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>>> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>> --
>> # Randy MacLeod
>> # Wind River Linux


--=20
# Randy MacLeod
# Wind River Linux

--------------pXrhij4WHOPyQ4zcLEJlHsBi
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5347vgSD029985

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2025-04-03 8:56 p.m., Khem Raj
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1sory-jGJB3QuboBfr9-9HP6VV=
WB_R-DmL+zxnSE9fVE2A@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">On Thu, Apr 3, 2025 at 5:33=E2=
=80=AFPM Randy MacLeod
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:randy.macleod@windriver=
.com">&lt;randy.macleod@windriver.com&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">On 2025-04-03 5:03 p.m., K=
hem Raj wrote:



On Thu, Apr 3, 2025 at 1:44=E2=80=AFPM Randy MacLeod via lists.openembedd=
ed.org <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:randy.macleod=3D=
windriver.com@lists.openembedded.org">&lt;randy.macleod=3Dwindriver.com@l=
ists.openembedded.org&gt;</a> wrote:
</pre>
        <blockquote type=3D"cite">
          <pre wrap=3D"" class=3D"moz-quote-pre">From: Randy MacLeod <a c=
lass=3D"moz-txt-link-rfc2396E" href=3D"mailto:Randy.MacLeod@windriver.com=
">&lt;Randy.MacLeod@windriver.com&gt;</a>

Release notes:
   <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/valkey-i=
o/valkey/releases/tag/8.1.0">https://github.com/valkey-io/valkey/releases=
/tag/8.1.0</a>

The license file checksum changed because upstream added the line:
   SPDX-License-Identifier: BSD-3-Clause
Add OECONF to avoid build-time checks for strcase[str|cmp], both of
which have been in glibc and musl for &gt; 10 years so it's sensible to
default to yes.
</pre>
        </blockquote>
        <pre wrap=3D"" class=3D"moz-quote-pre">
Why do they fail I wonder

I dug a bit but wanted to get the package update in.
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">I looked a bit and it seems =
that gnulib got updated
<a class=3D"moz-txt-link-freetext" href=3D"https://git.savannah.gnu.org/c=
git/nano.git/commit/?id=3Dc7033324a9e31d7b00454db04496880e889d32f0">https=
://git.savannah.gnu.org/cgit/nano.git/commit/?id=3Dc7033324a9e31d7b00454d=
b04496880e889d32f0</a></pre>
    </blockquote>
    Thanks.<br>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1sory-jGJB3QuboBfr9-9HP6VV=
WB_R-DmL+zxnSE9fVE2A@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

which perhaps added new logic which is not working in cross compile maybe=
 ?</pre>
    </blockquote>
    <p>Lots of strcase* changes:<br>
    </p>
    <p>=E2=9D=AF gl --grep strcase
4631e9b4d5d3bd5ba42864c7001cf3509a00c7b3..f1daedcb4c6c653dfc2936847dfe55f=
5a076d94b<br>
      706178a93b&nbsp;&nbsp; 2025-02-21&nbsp;&nbsp; getlocalename_l-simpl=
e: New module.<br>
      e21236c305&nbsp;&nbsp; 2025-02-20&nbsp;&nbsp; *_l: Fix mistake.<br>
      439b7f4de8&nbsp;&nbsp; 2025-02-17&nbsp;&nbsp; strcasecmp, strncasec=
mp: Fix compilation
      error on MSVC.<br>
      9b269e666a&nbsp;&nbsp; 2025-02-16&nbsp;&nbsp; strcasecmp_l: Add tes=
ts.<br>
      6fafa36c51&nbsp;&nbsp; 2025-02-16&nbsp;&nbsp; strcasecmp_l: New mod=
ule.<br>
      a8fa6e6314&nbsp;&nbsp; 2025-02-16&nbsp;&nbsp; strcasecmp, strncasec=
mp: Work around
      Solaris, Cygwin bug, part 3.<br>
      ff91cd3ce3&nbsp;&nbsp; 2025-02-16&nbsp;&nbsp; strncasecmp: Work aro=
und Solaris, Cygwin
      bug, part 2.<br>
      557f0e4958&nbsp;&nbsp; 2025-02-16&nbsp;&nbsp; strncasecmp: Work aro=
und Solaris, Cygwin
      bug.<br>
      fc6bec11ff&nbsp;&nbsp; 2025-02-16&nbsp;&nbsp; strcasecmp: Add tests=
.<br>
      9980b9e526&nbsp;&nbsp; 2025-02-16&nbsp;&nbsp; strcasecmp: Work arou=
nd Solaris, Cygwin
      bug.<br>
      6abed08f2c&nbsp;&nbsp; 2025-02-16&nbsp;&nbsp; strcasecmp, strncasec=
mp: Fix header
      reference.<br>
      f656293f0e&nbsp;&nbsp; 2025-02-16&nbsp;&nbsp; c-strcasecmp, c-strnc=
asecmp: New
      modules.<br>
      c17d70aaae&nbsp;&nbsp; 2025-02-16&nbsp;&nbsp; strings-h: Don't decl=
are strcasecmp,
      strncasecmp without the module.<br>
      b2927d1b1f&nbsp;&nbsp; 2025-02-16&nbsp;&nbsp; strcasecmp, strncasec=
mp: New modules.</p>
    <p>=E2=9D=AF gl
4631e9b4d5d3bd5ba42864c7001cf3509a00c7b3..f1daedcb4c6c653dfc2936847dfe55f=
5a076d94b
      | wc -l<br>
      435<br>
      <br>
      =E2=9D=AF gl --grep strcase
4631e9b4d5d3bd5ba42864c7001cf3509a00c7b3..f1daedcb4c6c653dfc2936847dfe55f=
5a076d94b
      | wc -l<br>
      13<br>
    </p>
    <p>The old commit id was on:<br>
      =E2=9D=AF git branch -a --contains
      4631e9b4d5d3bd5ba42864c7001cf3509a00c7b3<br>
      * master<br>
      &nbsp; remotes/origin/HEAD -&gt; origin/master<br>
      &nbsp; remotes/origin/master<br>
      &nbsp; remotes/origin/stable-202501<br>
      <br>
    </p>
    <p><br>
      I'm busy today but sometime next week,<br>
    </p>
    <p>I'll learn about gnulib, re-work this update and report the
      problem to upstream to gnulib devs if needed..</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1sory-jGJB3QuboBfr9-9HP6VV=
WB_R-DmL+zxnSE9fVE2A@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">



</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">It's not a key package so =
whatever.


ALSO: I need to resend with a corrected subject line!

It's nano, not valkey - copy pasta!!!

v2 sent.

../Randy


</pre>
        <blockquote type=3D"cite">
          <pre wrap=3D"" class=3D"moz-quote-pre">
Adjust the patches using devtool and manually munge the Upstream-Status-e=
s.

Signed-off-by: Randy MacLeod <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a=
>
---
 .../recipes-support/nano/{nano_8.3.bb =3D&gt; nano_8.4.bb}    | 9 ++++++=
++-
 1 file changed, 8 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-support/nano/{nano_8.3.bb =3D&gt; nano_8.4.bb} (7=
5%)

diff --git a/meta-oe/recipes-support/nano/nano_8.3.bb b/meta-oe/recipes-s=
upport/nano/nano_8.4.bb
similarity index 75%
rename from meta-oe/recipes-support/nano/nano_8.3.bb
rename to meta-oe/recipes-support/nano/nano_8.4.bb
index d1af89ef8d..1aae49d3b6 100644
--- a/meta-oe/recipes-support/nano/nano_8.3.bb
+++ b/meta-oe/recipes-support/nano/nano_8.4.bb
@@ -13,10 +13,17 @@ RDEPENDS:${PN} =3D &quot;ncurses-terminfo-base&quot;
 PV_MAJOR =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:${@d.getV=
ar('PV').split('.')[0]}">&quot;${@d.getVar('PV').split('.')[0]}&quot;</a>

 SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"https://nano-edit=
or.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz">&quot;https://nano-editor.org=
/dist/v${PV_MAJOR}/nano-${PV}.tar.xz&quot;</a>
-SRC_URI[sha256sum] =3D &quot;551b717b2e28f7e90f749323686a1b5bbbd84cfa139=
0604d854a3ca3778f111e&quot;
+SRC_URI[sha256sum] =3D &quot;5ad29222bbd55624d87ea677928b3106a743114d6c6=
f9b41f36c97be2a8e628d&quot;

 UPSTREAM_CHECK_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"https:=
//ftp.gnu.org/gnu/nano">&quot;https://ftp.gnu.org/gnu/nano&quot;</a>

 inherit autotools gettext pkgconfig

+EXTRA_OECONF =3D &quot; \
+    ac_cv_func_strcasestr=3Dyes \
+    gl_cv_func_strcasecmp_works=3Dyes \
+    ac_cv_func_strcasecmp=3Dyes \
+&quot;
+
+
 PACKAGECONFIG[tiny] =3D &quot;--enable-tiny,&quot;
--
2.34.1


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#116546): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-devel/message/116546">https:=
//lists.openembedded.org/g/openembedded-devel/message/116546</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/112047294/1997914">https://lists.openembedded.org/mt=
/112047294/1997914</a>
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
        <pre wrap=3D"" class=3D"moz-quote-pre">--
# Randy MacLeod
# Wind River Linux
</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------pXrhij4WHOPyQ4zcLEJlHsBi--

