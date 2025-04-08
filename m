Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92634C36010
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 20:12:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6024.1744143120637095896
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Apr 2025 13:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6193ad70c2=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538Jbe8c009583
	for <openembedded-devel@lists.openembedded.org>; Tue, 8 Apr 2025 20:11:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tug8mhgc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 20:11:59 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 538KBx4P028240;
	Tue, 8 Apr 2025 20:11:59 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tug8mhgb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 20:11:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=APIW6CmJJYNc1NJ9C+YCECx6XfnI0O6VhW2gNTYgqBhZxa6+SJ9C9EFT/mypwrgP7823RW9rr8lxQZ/mHEmpRfYSomK7R+JlMJQyTAQTLeVocRUK6Z2ZgHXjJYlIzHqe0qBzwLXD/GjujRT+V4MVulLe/Gf1OaHh/E5Ad/Xdhguj2aU/YvmaT6TBxzk8/7KbArAGmXVOfngQ0OV8xOvSaP53mMMg5vMQj5h+jLjIzkgIq8kVKmAY0MNlVSE9Aph36jhYoTPLY/v3DG37LDSoJ8oXLQcddavy6wD95ulhJidnwzk6m9iArgFCwwGEGcxgextJZWCFuUmUNT+orxa0IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ipwf3JORAzitMAbsM7qzzMFRMB9RaGiHvrJ5Sb05hWQ=;
 b=OlaeipT47QrXDXEj5hOhxsfp/+XTxyg7qjYSycj0a9y0itGcZW9t1f3h+HXh+dW8i0lNhiklNuMnL1bfireHtR5L1lqwh7lavShB+mJBKuJNtuLyHC+xLdaX2yJ5IJqM8pS32ba/aF1NBVpqQc0T9P8JA2SQZ8RR+OGdOyTNChv8lVdoArOPDtxJRfobTRU+Ike1KJKeIe+9Y2kLVlhUxGFymwnTicYaExHOuqyb5awvT3y+u9JhUUvBLsSWvd24QQWisbqYNfhdRSo72OD4Yuu7e9tK5z/SRjo0nil9x+TA4vbDvUxwBiydOLaGHIy3O5gd/IQlgdAaZ5faHow8Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by CO1PR11MB4915.namprd11.prod.outlook.com (2603:10b6:303:93::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 20:11:56 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%7]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 20:11:56 +0000
Content-Type: multipart/alternative;
 boundary="------------cBd8enS95EO7HS3TEykz8IWC"
Message-ID: <529ff21d-ff78-4f69-9fc5-6d572f9f2b36@windriver.com>
Date: Tue, 8 Apr 2025 16:11:53 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH v2] nano: update from 8.3 -> 8.4
To: Anders Montonen <Anders.Montonen@iki.fi>
Cc: openembedded-devel@lists.openembedded.org
References: <20250404003320.1703471-1-Randy.MacLeod@windriver.com>
 <FC376EA8-6664-4B03-8334-5E852F65545C@iki.fi>
 <18334531BE4E7A16.27826@lists.openembedded.org>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <18334531BE4E7A16.27826@lists.openembedded.org>
X-ClientProxiedBy: SJ0PR03CA0296.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::31) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|CO1PR11MB4915:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a689bc4-423e-43ee-26e1-08dd76d99c66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|366016|1800799024|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QmFCN1ZFV0RFVnJVazB0SGdwb0Izd0YyNER0V3FUakIzb3pIK2NORFRzMkpI?=
 =?utf-8?B?cjBycTFVTk9BOTlFRVZFUXdScXRVbGNPTHh1Um45T3g0SUE2dGp1U1BjbzJu?=
 =?utf-8?B?ZGcvVkFXR2kvY1BTTGhIOUJmb3BaZmgxdXdDa0UzaDdMMXgxZSt4d2hjYlNm?=
 =?utf-8?B?RFprR3RuTzZ4T3RqV2pFSHgvUmV3MGlIZ1VwUm1EOFdCby8rVUhmWDNpL0w0?=
 =?utf-8?B?YUtuNHhORTVDRjJyVWNPWis2RG1xQkF4bFdoa1dFSFpVRGg5L09Mdy9DYk03?=
 =?utf-8?B?K0xUQ090U2QxZkVXamhHaWJwRHRsWWlmM2daM29jNDRWaVI5RGNXbXVqZUl4?=
 =?utf-8?B?Sk9yRUJxdmxuZ1U2RGY5VEsxeWhqUFRhQnpMTXBKQlM1QmMwaFRXYmRQK2pN?=
 =?utf-8?B?MGt3dVB6YStNNVJFMitwZ1drUHQvY1kyNUxGQXdkOGZzZlZuTnZmWUtFK0R0?=
 =?utf-8?B?MjVIQXZGZXhjS2FxeFFtRXZsaHM4NzVRbFk0QkdpcGVPb1JhSGwwVVk1Szdp?=
 =?utf-8?B?VGpTb1N4ekVySkovSkluZ0JSaUZONkVQSm9uZTNMTzFrN0IyTGNSeC9IZnJu?=
 =?utf-8?B?bWQrZEw1OGxkd1BEbWhDT1ZPM0Yvd1B2Mk1EQkEwanhTUnNzaW1lUzUwOEhO?=
 =?utf-8?B?ZXEzZXJCajlzcldRM1lUdTJJTk1qbFJoQ3grdzFWZ01NL3VxSnE0R1AvTG1x?=
 =?utf-8?B?TmF2ZnBsSVJHWktLaXBkamthb2JPNXBnNWQyUDZpdjRCblBMUkN4djdjV3FP?=
 =?utf-8?B?SFlYMGY1QVA2UXUzYXdTcUxJaUh3SmpISXp0Q2llbjZzdzdOOVJyeEUza1Zo?=
 =?utf-8?B?bTV6TDBxUFFaR2IrQUZ2L2VYS05sQThrWDJ5c0FDRVh6OFBOdFlLMThBOTls?=
 =?utf-8?B?bHNyem16cWpsZk83SkhIRHBjOXFWTjRsYlNJWGZuWWpUbEZ0a2U5VW1uTE5v?=
 =?utf-8?B?cDhlckFISzR0eHh2Rm9DNHFRdnNnTU9zV0FoWXlkRUMwT0o0MG1SRmlPNDdS?=
 =?utf-8?B?Z2VmVlRZU2FXSk0yTytMWU15NHBmcU5HQXJsbEFkRStXZzZYRHdMT0ZSTmwz?=
 =?utf-8?B?ajZJNmh2LzNvOGVWM3pJeXVFK1NZeFRlM1Bud2hBTFlqWUl3eWFtM2t1RzlH?=
 =?utf-8?B?QUt1YzZsTE5VRDhaOTkwR3NDYm5ab3JTdEVJSEdQVU82blU3cUpZeU1vSWhG?=
 =?utf-8?B?UmZ4bHpKYTlhRXF3c0xVTGdRbndyazBmMDQzeFdHR2ZEQ1MvYlhpd1EwMDlT?=
 =?utf-8?B?aWxaUVA1eW04TEJNRVpGcTFMZFB3alBVR25oYk8wMHVDMWhyWXJGcDR3dGRM?=
 =?utf-8?B?TkJiVFpVeUdiZlBZbGVtZ3NJWFJLZTZPK290T251bzZQWm9DQlgrWGNYaEJs?=
 =?utf-8?B?ZkowRXc4UVFraE84eXdjQWh4Z3VzYmVyZFVEaWhVZWpOaEtVVDBYL05ERjRT?=
 =?utf-8?B?OVo0cU5vM0w2cDJVZk5WZ0c0cDJYZ2F2NzY1VmhobUc0bkxYTTBBMFlTcGJR?=
 =?utf-8?B?NjB0WFNjb2pDZC9qaWZ2WU5rVGRCVjlSYm8yQkp2Si9pQVpGTXJLcEQ4N2dO?=
 =?utf-8?B?SFd5eXI5UDQ1Q3hkSEN5RDVlMnBtcVNOblEwMGJPMVpzYkhOQWw4NEFQMXB4?=
 =?utf-8?B?TnE0OE5LS0xoWXlDNWFYd1dwR2FoRmpsekg5WTZISEtNMEVJNVNDVWoyYzFF?=
 =?utf-8?B?RE1lTUNyR2pveDBLaVFHa25NMk5mcndsdjMyVlR6T012V2pIelhLb2JLelFu?=
 =?utf-8?B?RmNpUDdqWEswTDg4ZDZBVGYxeVdoYmxDRWNPZHh3RU45czI3N2srSjQ4NnVy?=
 =?utf-8?B?WlVoTjRLdCs5bUo5cWlDaWpPYUxSdThmSitLS1lrczN5UlRvZ2h4S3I4bGxN?=
 =?utf-8?Q?XFGNyL9o+RcMU?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VDZiM0VWTkxUODI2OFNRZyt0L1JnOERycnVWamZLbm5xN2lNVjgwZU1BdjJV?=
 =?utf-8?B?MUp3MUZYekI2cGtPc0VnYjJraTRGKzJoLzM0ai9XdlQveDFhUlFjSnB0U3RX?=
 =?utf-8?B?RG5ZV2J3VXRwaDM2b3pkMElDZUpENzN3UEQ3RmVER2JKeVc2ZHpOZGduSldR?=
 =?utf-8?B?d2RJWWloNlFob3BlRHJaMEtEbmpSLzRMelJsb24vQnhISFp3b0VxTlloZnh4?=
 =?utf-8?B?ZE1XUEExSkNLeGxVME1ndVBwWThxczVCVlVrZUIrSE14VUdpUS92SFFQVmp0?=
 =?utf-8?B?bXo3cEwzRE9KNGxQL1RiRUJGYmU0Y0YweFc2bzRBamRJZmN6bnNzdXhRaTEv?=
 =?utf-8?B?MDIvS2ZUeGVvQ2wxRmxhY0MyeG1kMFhVTk9TT0hLYXo1a1lRbjZxZmRvN09L?=
 =?utf-8?B?Ryt5RHN5bWNwa01JSTBadXBwcVJ1RjdOdURnb21XT3FaMzFtRzkwdjVkc0xh?=
 =?utf-8?B?NnByVGhWQ0xsOUlNd3Jpdi84Rnc5NFNhQW9vcUowUEFBS2tsZFRvR2lWaVVT?=
 =?utf-8?B?UGg0amdEV2dHdUpFVTNBOXp6Q0VNUVB0cUtQdGdILzBZMzlwUnQrczF3V2JV?=
 =?utf-8?B?ejVKNzdFckJveGtTVk1YZVEranNrWndtcXBmcytEaVBJNDZuWlN0NTVvQTQr?=
 =?utf-8?B?OXU3R2EvbXZ3dGdNQ3FkY01JK3hOUzBGdTh3M0xDSjkxY2VkSDJrQ2tZUzlz?=
 =?utf-8?B?cTFEUStJN0hvVEVCc0Q0UEtNRi80L3pmZnM0N0hqc05TdVUveVIxWHg3ZUd0?=
 =?utf-8?B?bjFQald4UmYwZ2RHemJZVHBwSExoeDZLU2JtLzQrODVSL0xBRk10ODRnVWRk?=
 =?utf-8?B?b2NOakZtSUJaQTlMOC90Y1QyRllISjlyZ3pvYTR6VDh1eWgwck1hUTd2aGYw?=
 =?utf-8?B?bGxKQkNmcG1KQmJwYlgybytUOW84aUdCVERqVk5nL281Z0tML254K0E1ZndJ?=
 =?utf-8?B?RktLZmx4TjFndjR3VjBMZEVYWXBhV1l1cXpWV2lpdjNhdUhBRVNHLzdvMUxr?=
 =?utf-8?B?QUdSaEZaNFhNL1JEUERrcGQ2ckdHYUpQUFNzRU1uK2dkcndPR0p5NUM1dnQ3?=
 =?utf-8?B?bi82R2FwbEk0TmVaSGxkYVMrSSthR2ZHdWhFRFhIaE4wUGs2NFBlYy9FNjhM?=
 =?utf-8?B?NjY1WXp1Z0R0UjQ0My9Salg2cU9mVktMWkNIekhZWVZ3YlVZWFRUV1VRV2pE?=
 =?utf-8?B?NWVXa3RvUmg4dXRrMitKS2ZOdGd3dTdDam1hcVB3SjlPbTdTU0lVNDFiOWRl?=
 =?utf-8?B?N0FiSE5rU2UxRjVJbld0dm8yQklrYUF4clBEYVFKbitaNThZWjI1SDRjbzFL?=
 =?utf-8?B?cXNGdjdHWi8zS294SDY3eHROTXgrU0hRWmIxUmg1OUZwRHNTbXk5cG1CM0JB?=
 =?utf-8?B?T0Jrc0VqT3htQ1hJSFRiOE1kdnhld2poYVBTcWJrT0tHTzJ4Mk5BMGt0N2Z5?=
 =?utf-8?B?MmVkLytKTkpBYUtBeGhzdTJIcm44clhQMUpzcVVWQ3lzR09PS1gyV2FLZUh0?=
 =?utf-8?B?OVBYZTJDb3FvVlhSOEwyQWJXRVZBK3dRb0YrSXpBYlhVdkJXMFM4SlVSeTlK?=
 =?utf-8?B?amE2WFdZd1dLd21SdE92R2gzLzk2RWZYWitjWmJCOFFOclhRRGxrZDczVHZh?=
 =?utf-8?B?S2U3NmE1cjh2QTJadk1nWG9BeG9UT0VzZ0hjMUc1ZEJpNE1ORmdQQm1xRkxI?=
 =?utf-8?B?V2xpTDJGUDF5VXI2bG0rLzdmQ3RRNFJpVjFNWDZ2OE0vZGkveEVabTJlb2du?=
 =?utf-8?B?MVdROTlHVzZLY0ZQem5OOEpBR0M0L05Rc0RXUEZOdVMyV094alQ2QkVlLzRF?=
 =?utf-8?B?Vm1FOVpSb3hzY1dvUXBrU2hRYVlYS1dTY2ltR1A2cU9kbi9ZckN3TTZhSDgv?=
 =?utf-8?B?ditIdGhSR1RLTEhvZ0ZaRzEyaG1pdWQxQmEva2pjVmlWbis1alN3RE9vWi9N?=
 =?utf-8?B?c3hmeFNmaXozeXUwd0ZURCtqeDNkdEtIdlVVejBwTmpZMjEyUytwZk9jWmNS?=
 =?utf-8?B?bUgrTTN4MEdZQUU2ZFV4WU85M05weUh1UWhoOWEyVGwrcVNvSnJIOVdTYmNq?=
 =?utf-8?B?cW00K0ozYU9SUEIyRjdybldJY0dNVEdQSHljN0c5ZjE2aWRsMENOa2ZOdTJr?=
 =?utf-8?B?OUgzank0NVNjSFIvT1R4Z2RMNjJad0tmOXkwTWFWdDc3THpaRDRUZGU0TDJR?=
 =?utf-8?B?K0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a689bc4-423e-43ee-26e1-08dd76d99c66
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 20:11:56.2342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tt3lIMlF/knEYL+ERF1gKsUi0eWAHE/6cDIGIFMDyTCmrF+jNLdz4pSC0Tf2x9FgXP2asxSAs7G3q+qA59m0oLPboQft/D5PBiaQQmnLUCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4915
X-Proofpoint-GUID: aH8Fgq0he0pclawbHySNA127OjA0YnZY
X-Authority-Analysis: v=2.4 cv=YJefyQGx c=1 sm=1 tr=0 ts=67f5830f cx=c_pps a=rPWB9DPlu1VaKM/QD/CSBg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=mDV3o1hIAAAA:8 a=BjMif5yZAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=dNsYtpj352d9ffhIQrcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uaMc_peoTw8A:10 a=x45vsIAnUhhwFIQ4I4wA:9 a=zNrvmV5WJxoDZ8kM:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=ftVT4cx30j6SLCxtN1ED:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: UnD5u31jOY9YMY4HFzIHE6qJhE-hYnsN
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_08,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504080140
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 20:12:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116715

--------------cBd8enS95EO7HS3TEykz8IWC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 538Jbe8c009583

On 2025-04-04 8:39 p.m., Randy MacLeod via lists.openembedded.org wrote:
> On 2025-04-04 6:58 p.m., Anders Montonen wrote:
>> Hi,
>>
>>> On 4 Apr 2025, at 3:33, Randy MacLeod via lists.openembedded.org<rand=
y.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>>>
>>> From: Randy MacLeod<Randy.MacLeod@windriver.com>
>>>
>>> Release notes:
>>>    https://lists.gnu.org/archive/html/info-gnu/2025-04/msg00001.html
>>>
>>> The license file checksum changed because upstream added the line:
>>>    SPDX-License-Identifier: BSD-3-Clause
>>> Add OECONF to avoid build-time checks for strcase[str|cmp], both of
>>> which have been in glibc and musl for > 10 years so it's sensible to
>>> default to yes.
>>>
>>> Adjust the patches using devtool and manually munge the Upstream-Stat=
us-es.
>>>
>>> Signed-off-by: Randy MacLeod<Randy.MacLeod@windriver.com>
>>> =E2=80=94
>> The commit message doesn=E2=80=99t fully match the contents, there=E2=80=
=99s no license file changes nor updated patches.
>
>
> Yikes. I can't possibly have messed up that much, can I?
> Anyway, I'll check and send a v3.
>
> Sorry for the noise, I may eventually learn to double, triple check my=20
> work
> before sending commits in the rush to branching.
>

The bug has been reported to the nano tracker:
https://savannah.gnu.org/bugs/?66978

Updating nano isn't that important since the updates are only:

=E2=80=A2 Bracketed pastes over a slow connection are more reliable.
=E2=80=A2 Tabs in an external paste at a prompt are not dropped.
=E2=80=A2 Feedback occurs when the cursor sits on a Byte Order Mark.
=E2=80=A2 The Execute prompt is more forgiving of a typo.


and 3 minor (?) bug fixes.



I'll wait a bit until upstream straightens things out and issue a new=20
release.

../Randy


> ../Randy
>
>
>> Regards,
>> Anders
>>
>>> .../recipes-support/nano/{nano_8.3.bb =3D> nano_8.4.bb}    | 9 ++++++=
++-
>>> 1 file changed, 8 insertions(+), 1 deletion(-)
>>> rename meta-oe/recipes-support/nano/{nano_8.3.bb =3D> nano_8.4.bb} (7=
5%)
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
>>> PV_MAJOR =3D"${@d.getVar('PV').split('.')[0]}"
>>>
>>> SRC_URI =3D"https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.=
xz"
>>> -SRC_URI[sha256sum] =3D "551b717b2e28f7e90f749323686a1b5bbbd84cfa1390=
604d854a3ca3778f111e"
>>> +SRC_URI[sha256sum] =3D "5ad29222bbd55624d87ea677928b3106a743114d6c6f=
9b41f36c97be2a8e628d"
>>>
>>> UPSTREAM_CHECK_URI =3D"https://ftp.gnu.org/gnu/nano"
>>>
>>> inherit autotools gettext pkgconfig
>>>
>>> +EXTRA_OECONF =3D " \
>>> +    ac_cv_func_strcasestr=3Dyes \
>>> +    gl_cv_func_strcasecmp_works=3Dyes \
>>> +    ac_cv_func_strcasecmp=3Dyes \
>>> +"
>>> +
>>> +
>>> PACKAGECONFIG[tiny] =3D "--enable-tiny,"
>>> --=20
>>> 2.34.1
>>>
>>>
>>>
>>>
>
> --=20
> # Randy MacLeod
> # Wind River Linux
> pLK@tY:ATbOf1"dW
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116595):https://lists.openembedded.org/g/openembedd=
ed-devel/message/116595
> Mute This Topic:https://lists.openembedded.org/mt/112076927/3616765
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------cBd8enS95EO7HS3TEykz8IWC
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 538Jbe8c009583

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2025-04-04 8:39 p.m., Randy MacLeod
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:18334531BE4E7A16.27826@lists.op=
enembedded.org">
     =20
      <div class=3D"moz-cite-prefix">On 2025-04-04 6:58 p.m., Anders
        Montonen wrote:<br>
      </div>
      <blockquote type=3D"cite" cite=3D"mid:FC376EA8-6664-4B03-8334-5E852=
F65545C@iki.fi">
        <pre wrap=3D"" class=3D"moz-quote-pre">Hi,

</pre>
        <blockquote type=3D"cite">
          <pre wrap=3D"" class=3D"moz-quote-pre">On 4 Apr 2025, at 3:33, =
Randy MacLeod via lists.openembedded.org <a class=3D"moz-txt-link-rfc2396=
E" href=3D"mailto:randy.macleod=3Dwindriver.com@lists.openembedded.org">&=
lt;randy.macleod=3Dwindriver.com@lists.openembedded.org&gt;</a> wrote:

From: Randy MacLeod <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Ran=
dy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>

Release notes:
  <a class=3D"moz-txt-link-freetext" href=3D"https://lists.gnu.org/archiv=
e/html/info-gnu/2025-04/msg00001.html">https://lists.gnu.org/archive/html=
/info-gnu/2025-04/msg00001.html</a>

The license file checksum changed because upstream added the line:
  SPDX-License-Identifier: BSD-3-Clause
Add OECONF to avoid build-time checks for strcase[str|cmp], both of
which have been in glibc and musl for &gt; 10 years so it's sensible to
default to yes.

Adjust the patches using devtool and manually munge the Upstream-Status-e=
s.

Signed-off-by: Randy MacLeod <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a=
>
=E2=80=94
</pre>
        </blockquote>
        <pre wrap=3D"" class=3D"moz-quote-pre">The commit message doesn=E2=
=80=99t fully match the contents, there=E2=80=99s no license file changes=
 nor updated patches.</pre>
      </blockquote>
      <p><br>
      </p>
      <p>Yikes. I can't possibly have messed up that much, can I?<br>
        Anyway, I'll check and send a v3.<br>
        <br>
        Sorry for the noise, I may eventually learn to double, triple
        check my work<br>
        before sending commits in the rush to branching.</p>
    </blockquote>
    <p><br>
    </p>
    <p>The bug has been reported to the nano tracker:<br>
      &nbsp;&nbsp; <a class=3D"moz-txt-link-freetext" href=3D"https://sav=
annah.gnu.org/bugs/?66978">https://savannah.gnu.org/bugs/?66978</a><br>
      <br>
      Updating nano isn't that important since the updates are only:<br>
    </p>
    <pre style=3D"margin: 0em;">=E2=80=A2 Bracketed pastes over a slow co=
nnection are more reliable.
=E2=80=A2 Tabs in an external paste at a prompt are not dropped.
=E2=80=A2 Feedback occurs when the cursor sits on a Byte Order Mark.
=E2=80=A2 The Execute prompt is more forgiving of a typo.


and 3 minor (?) bug fixes.
</pre>
    <p><br>
      <br>
      I'll wait a bit until upstream straightens things out and issue a
      new release.</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:18334531BE4E7A16.27826@lists.op=
enembedded.org">
      <p>../Randy</p>
      <p><br>
      </p>
      <blockquote type=3D"cite" cite=3D"mid:FC376EA8-6664-4B03-8334-5E852=
F65545C@iki.fi">
        <pre wrap=3D"" class=3D"moz-quote-pre">Regards,
Anders

</pre>
        <blockquote type=3D"cite">
          <pre wrap=3D"" class=3D"moz-quote-pre">.../recipes-support/nano=
/{nano_8.3.bb =3D&gt; nano_8.4.bb}    | 9 ++++++++-
1 file changed, 8 insertions(+), 1 deletion(-)
rename meta-oe/recipes-support/nano/{nano_8.3.bb =3D&gt; nano_8.4.bb} (75=
%)

diff --git a/meta-oe/recipes-support/nano/nano_8.3.bb b/meta-oe/recipes-s=
upport/nano/nano_8.4.bb
similarity index 75%
rename from meta-oe/recipes-support/nano/nano_8.3.bb
rename to meta-oe/recipes-support/nano/nano_8.4.bb
index d1af89ef8d..1aae49d3b6 100644
--- a/meta-oe/recipes-support/nano/nano_8.3.bb
+++ b/meta-oe/recipes-support/nano/nano_8.4.bb
@@ -13,10 +13,17 @@ RDEPENDS:${PN} =3D &quot;ncurses-terminfo-base&quot;
PV_MAJOR =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:${@d.getVa=
r('PV').split('.')[0]}">&quot;${@d.getVar('PV').split('.')[0]}&quot;</a>

SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"https://nano-edito=
r.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz">&quot;https://nano-editor.org/=
dist/v${PV_MAJOR}/nano-${PV}.tar.xz&quot;</a>
-SRC_URI[sha256sum] =3D &quot;551b717b2e28f7e90f749323686a1b5bbbd84cfa139=
0604d854a3ca3778f111e&quot;
+SRC_URI[sha256sum] =3D &quot;5ad29222bbd55624d87ea677928b3106a743114d6c6=
f9b41f36c97be2a8e628d&quot;

UPSTREAM_CHECK_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"https:/=
/ftp.gnu.org/gnu/nano">&quot;https://ftp.gnu.org/gnu/nano&quot;</a>

inherit autotools gettext pkgconfig

+EXTRA_OECONF =3D &quot; \
+    ac_cv_func_strcasestr=3Dyes \
+    gl_cv_func_strcasecmp_works=3Dyes \
+    ac_cv_func_strcasecmp=3Dyes \
+&quot;
+
+
PACKAGECONFIG[tiny] =3D &quot;--enable-tiny,&quot;
--=20
2.34.1




</pre>
        </blockquote>
      </blockquote>
      <p><br>
      </p>
      <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
      <span style=3D"font-size:12pt;font-weight:bold; font-family: 'times=
 new roman'; color:#FFFFFF;">pLK@tY:ATbOf1&quot;dW</span><br>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#116595): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-devel/message/116595">https:=
//lists.openembedded.org/g/openembedded-devel/message/116595</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/112076927/3616765">https://lists.openembedded.org/mt=
/112076927/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.=
openembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/=
g/openembedded-devel/unsub</a> [<a class=3D"moz-txt-link-abbreviated" hre=
f=3D"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------cBd8enS95EO7HS3TEykz8IWC--

