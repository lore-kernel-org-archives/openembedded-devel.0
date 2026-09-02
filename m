Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC750C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 21:01:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5959.1788382893436750375
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 14:01:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=N8tYCLuE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3705c4c712=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KILs2663967
	for <openembedded-devel@lists.openembedded.org>; Wed, 2 Sep 2026 21:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=HF4bIDg85irvH1M+vJYqWK
	KlVo9oLIf3dQdY3YSu+8E=; b=N8tYCLuEEbwJj3FiUU4w+DuBlRLEgSJi5lfPtZ
	O/eZNdZJKYtkdxbWs2V1+hVXcJEnm2Izh76FgZ40TnS2X8YV6CFQodPgyoay2RXT
	6IOFTju/bxW7+5h6Qmu558qUDw34GbkVjFm5P0d91FDJUVCvBv+NRyzREZ9iJmeu
	VLGAMcxI1K38hYvbaFpHZNtfjcrC0GSFt0YPqXIsxhI/L+e9k8yuGk0Kvl4hkOIx
	KDtiv/GevdvPotNuJnz0bhLGU0acFt2VcsSneUJWzPuUy1irEVI3x1aMyiz2bGYS
	EjfDw5e4uJjrck0jaPKAuVVYUKjC6OImvkcBShtQI3rDHFfQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022080.outbound.protection.outlook.com [40.93.195.80])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gbpd7y45s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 21:01:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CK5jVj/edGV306hPURcOzhoZCO2UAVOdYhYyWnhUa93ReAdtGJvlStEL01CBOnEYYOGs8VYkQNcOjKDV9ba55vmXRRx1fCaYCTugiYltuTvsf1l962Iz5tp3n8UY8oV1zGunZsAz6OtFpUohBxYTrHFhB7a3PDyqAAdE70fP5Ph1XteUZtvrOWZTmCvTOqtThjbcJ7GlCS3d4Ec11pif2TCVLiB5PHUlEoJYXJXLOvcZcFTimwPT8moDssUr8P0KXZGmdJGFW60LxyI/jbjpuhj9mSGQ/izrLqYcGuuuQsZkW26cgtIr/t8qQtGF1k4/ClZG2EEUR7ZNh0IsnnALJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HF4bIDg85irvH1M+vJYqWKKlVo9oLIf3dQdY3YSu+8E=;
 b=ooEKKuNHJPzkS2Qzw8rfRlE8gIP7Kdys/TMUgER++yGSjHW9N3H794VOGS1O4LbJ6F4xR4vFZvBiyZ74nJyuEyUx8sBz78pD6ZjK0O/yr3TTKRrEwmjkbCEWU5+G9j10MoxPkD6ZNv0Jzmd7xLhHp1AOyO/AiiJjd+vURlD4bCDhabQQVSSo4eIAoq829RldJTT7Wvvhso/YpDHW2AJEe2kv05Pn4QUuelGcj62H7KMFPU2KW7s4YrOnB5pGweOVOT9WJgHbbnq+2A/S/VKj7l6jLj8LhOoQ11ACeQBRvY9osheKoy2PR+rF/Ouy/d7FnZRWiaHC/oUn86sxoELqmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by PH8PR11MB9853.namprd11.prod.outlook.com (2603:10b6:510:3c4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 21:01:28 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 21:01:28 +0000
Content-Type: multipart/alternative;
 boundary="------------G0YajZQQoUWq0pQvKTtoecZr"
Message-ID: <f243c46c-9774-4557-8f6b-dd514d84a536@windriver.com>
Date: Wed, 2 Sep 2026 17:01:17 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][wrynose][PATCH] thrift: fix CVE-2026-58662
From: Randy MacLeod <randy.macleod@windriver.com>
To: anuj.mittal@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org,
        abhishek.bachiphale@windriver.com
References: <20260901090727.1384945-1-Abhishek.Bachiphale@windriver.com>
 <9da89134-bce4-4777-9bc2-36c0930c90d4@windriver.com>
Content-Language: en-CA
In-Reply-To: <9da89134-bce4-4777-9bc2-36c0930c90d4@windriver.com>
X-ClientProxiedBy: JN3P275CA0130.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:d0::9)
 To CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|PH8PR11MB9853:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a47fe07-ee5f-46a8-b27e-08df09355b48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003|8096899003;
X-Microsoft-Antispam-Message-Info: 
	xb2ONBOSwwSoG2OGLSEuxv3ueMiXjvUcYaCCR2PzhHaII4MewLGYlC9dux+gtaHeHFRzs0PycJbNIDC83Nuu+dOQnGd0iUdIf18cHSf+rXK85J7wHbx6wWxZoRkrmkHTRv3ugM6ZHIRz+93R7CGnggd2lm2/2hcaPVetzFNl8ANGn37oBKsZyVohSHFGeAHIoxdjFnON5iKcBV4Z0T0AHf82q+TXw7uVzAvHvvK0Q/NousW3a7IFk4lv4T4X2ebmirNlkFstNDPJO6Yix5elpPHqIP3OivzQu4ymV0DmanMIDaC6aIQNNuQu2GHqy35Pm9m3xrxFtyvMdGdcvZNh4WOxu3aKa1PQ8AsBELrq/HGSwOdXDVFWcOgS54FQ0Knnl+koUcaXqWhAsTqiKM3pEfEXrQK80oqhCWFL+f00vl97B/I/H8z/rrtl0ER26wFCLMBDehqyCfw+tSyA06XMyCReFRSttcAnL0rMqrSISXQ7p48eYNYo6+H5v8wJnRYCmb9hlsF1cxYPs4XIP1hfL5/y0w7obpQZjt+uTjcNKITnXO3aMKB7Uu6KrhZJetMzGIdcTmc/o1ZSryO+oIY1aAsNl6j29PE6Ur1e7g5jkWde7bC8hmcIyH61TCBZYIvMY/WuT8wOO6hYhcd9FiSeaw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003)(8096899003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q0lJR0NPc1NYeDRlSkJROTFoQWsyWHliNGoyV3I5bXptOGllZ2NwMTZxOFJV?=
 =?utf-8?B?Zm1vNE15dDJUeCtSQlVheW1kaXdXMFpudWVhUmVncnNoNEptcmlxZXI4T01l?=
 =?utf-8?B?Qm1jWTg0OUNKNVlob2sramNUUHF1QnIrem5JMjUzRmdjTTFIZlR4MCt0K290?=
 =?utf-8?B?YjY5T1Q3QngyZVNtZjFkSFVua2M3czZib2ozZWJ3S2o4SzFPMWJqMUxHWnRi?=
 =?utf-8?B?NHdGRkZHdE1Mam1pWWdEL01ETHdVRWVGTy9SZnFuL2srbDZJa0lZM3kwcU5X?=
 =?utf-8?B?MmZ4QjhDNmNBaDR6Y3lJeFIwc0w0RjFjSFNSbU4zYWdiRFJxRVdFZ3pCMnVs?=
 =?utf-8?B?OVZZL3haeTl5Wno2aW9mRVRQYmlBeEVmTWErRVVlL0xUL09qRURZT2syMUNR?=
 =?utf-8?B?dHMzdEw1ditNQTYxUFowNnp3a3ljNWlHYVJ0blhQZ2VXMzVXbWs3ekZoUjBZ?=
 =?utf-8?B?R3RSbGpESUYyaGdUeEFFZVNlM2w5WTdHK1l3ME9GMUo0T09RZlNzTlgvK05D?=
 =?utf-8?B?SkRBek8vTmdoTnppWUJBNVcrTHlpcTdndEVGU2RNY3VGdHVHWG9PUnR6SFdL?=
 =?utf-8?B?RUJtWFZuYUF1N21McjFHRnNxQ2doaHZUYzBMSnVuWlBOM1R3UTFiaUZNL3Nm?=
 =?utf-8?B?RU53WUdady9aeTM3cmhFKzRYQWZ1NVl1Ti8rQVVoUUxyR3JpQVRSSXRETWln?=
 =?utf-8?B?elFiLzJLZDE2Z1BTazdzaGhoNTVSWWl1UzE2RFcxVGpNbk5yR2N3eW00Z3FU?=
 =?utf-8?B?aU1LS2dFODROLys5d1RKYXFwQUxBYnJBcmFxdkhCTXdSZzBBRTdXVG1WTUMx?=
 =?utf-8?B?SllVNlZubmxzVkk5emFxQ2hYVCtXVVplYkRmNTZCTkI0TTI0T1FpQjZFSzdx?=
 =?utf-8?B?YjN3RC9wLytCTC9ZdFJzRmlsNTdwMlVHYmcySGFDYUlLU2tqVGlIVU9qc0xG?=
 =?utf-8?B?MHNTVVE2dC9adldxcjlpSDNLNDREL29taTh0MWozOTNkcXU4ZXVLbTI4UHZU?=
 =?utf-8?B?SkdTb0VaKytOMWRjYTdqSStWeG1MZ1B6QTN4cFRKc3l0ajB3dzlGYzcyYU9p?=
 =?utf-8?B?c3Bxa0gvTW9QOS8rKzRtSGc3THpHODBUc2NGKzE3SUViMFg2YWVna3JpUitm?=
 =?utf-8?B?aTh6TlptRldKTWh3ek9JamI0NlFSNzZ4OXNMVzA0WkRCNWh3aGhIRjVBd2t6?=
 =?utf-8?B?MzltS0hGNmtOOTNjbmpHZ20xMDRSajFzUGVINUk2LzkvSlhFNzJ0RTZsblln?=
 =?utf-8?B?NlExTlNmOW9OcHZPQ3ZjV0FPVTJUQjU3OVZkTUUwSkZXdjRDemFqa0lSZklr?=
 =?utf-8?B?Mkk5QWRmMUFEOTZQSFd4aHpxcXZtejBLVGdZN1IvRGFXYjhKTXMrb3J3N3ZY?=
 =?utf-8?B?bHhFWURSSVRRSFdjeTgxZi9yYk13NExxT2JPOEZqS3BLM3RibFdJeWJCY25t?=
 =?utf-8?B?dHlBT2dwTS9adzdJRGhzeC9Jd2QvY3RWUmFQa25rV2FtZlp1SE9xWWx5SE9B?=
 =?utf-8?B?UkRFemlLTjN2akhLalVDV1hTQ04xcDBFbTFtc05odzlsSDRKU3BRVUo3L1NU?=
 =?utf-8?B?N21XK3pzQlE0OGNIOVZqZTRDNThyaXlSRVBQTzdwdUNjaTNGb0Z2djlGem9q?=
 =?utf-8?B?ZFU1cTRXZ3lUWndiVWIvOVVjWG80azBpZ3MwL2tMVDE1TlIvbjJ4bHJMQjdE?=
 =?utf-8?B?cGl0Q3ZWZjdMd1FubkN1TWg5R3ArUWM2ZjQrRDVXeHJOV21Bclp6S0UvbmFY?=
 =?utf-8?B?RGxNVUIvMjQwN1MyVUc1VC8vTXVaaEFHamczeitNRWZwQmRtbVMrNWJnOVQr?=
 =?utf-8?B?WDVkclIxd29oSzhOMWhZODBvNlJNWlBvbTRyQUoxS1R5TTd3Qjdzb1NHbnpT?=
 =?utf-8?B?WHFrd0cvRVlMejlNS3F0dmgrTjBoM1NnMXk2NjVwbndqRVNqdVZIckdCMTgx?=
 =?utf-8?B?OWMyczdiYW56T0NicFBtTjMwbktIOU4yZStSUHBSNzJHdjVUdnYzVHh5RVRz?=
 =?utf-8?B?M1R4dktyVEtlV0VqV0tTeExuVXFwa2Z5bDFPYjlFWWVMR3N5UGlMb2pNQTdq?=
 =?utf-8?B?K2ZCSUdjbzF0Z3JhbGdhY0RMY2M1djY0LzVVZWxWNnl1STlweHk0UTBDSjFP?=
 =?utf-8?B?NjcvT0ZCZ1N3RzVBMFkyeCtxNmlmQW54akM0YlZRY0tqNUhYQnRwYUM1SE8z?=
 =?utf-8?B?akZyc0xnR1dIMlhLUlVrUWxmRGRzb2l1NzA2K0drdjEzeDN5cWRCSWlKYkJz?=
 =?utf-8?B?ZnhXMGx1Q1cxY2pyeCtBa2hMd0lMTkJvWUdmZTVRaXNMWG9WdGhGekMwUWg1?=
 =?utf-8?B?WjR6bENMVUlRTEMwOHppNEFQdEdqWWRudzREenNDVVJORUpiNGtjQWJjTkdK?=
 =?utf-8?Q?8WB1P182Xr53iLpI=3D?=
X-Exchange-RoutingPolicyChecked: 
	wVY7m83dzm38hWAASFumGTBpdcy5aQVhGNZDNpyE6be8RVHoRjEO8ixNfrXG4okCsR0oDUzSemJ1WPCvCcFGyiWz5ikgf6I+oIzJMS3s9LHpw+eYeYh2XOhrLwt8UNqUCc/jwzzY34C39wGVt5KEEir7M835fML7KAJo1NrQKIEw0hmMXSfzoKSwwpBOuQiyz4QY9eMXW28b+NcGcSM7JJ3Hpfv6OL3Sx58majwKqGqpcQt2AC0NcCae82BE/OVRH6TxlV0PQR/sXrowfI4N6LMsuer/7EPCD/LeouowGZktNv3xHYcp2iwZ8mrpTNwjDDXqIygLjxsjljtLlCmarQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a47fe07-ee5f-46a8-b27e-08df09355b48
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 21:01:28.3575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MVDropRD1m7IbKwhNm47VHuTAwpEkRpCTEFlIeBlC/66ng05PpYpIcdd6nOpM5kxfBy2v1NIehy7FYqFKPnZzF70aizISmqRwd+kR3evImA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9853
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Ie63n2qa c=1 sm=1 tr=0 ts=6a988eac cx=c_pps
 a=mu652P9qVXFiHaHDVbjfEQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=jRn7YXogKy1yxfwXXhMA:9
 a=QEXdDO2ut3YA:10 a=t7CeM3EgAAAA:8 a=LVJfk4VKPvh_kARkXAIA:9
 a=Q9EzNQRhsWyK8yLI:21 a=_W_S_7VecoQA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE4NSBTYWx0ZWRfX+eSxgB1pxbYY
 MQ0113MB20eZ4alEbp2k7Oxf9S0k7dpQ5DM/JOt/WBBuk+9n0+QxSW7rQIW0Uj2iv17L6zj/35n
 ZNQ2ZPiWZU/iJ+E/SF5QD6UnVRy5xKnOg2x9tVzhUY/WTuYxvuwagMtSLT/+WqY8APQ0gjKVarH
 BOCeopgvIeduxxcouOjzWqY9vZ8kB2Xe6Q4xMKovZQEgyl5C1TvvGcnMMcVMKtZ767mo/piDfSx
 eJW/zPNORAISM5KznkvlNmv2GsQy+tkn4ig2rAm8vErFNjFSaHla+dp9qMSDY4JEuWdQqk66oZA
 zZyxTb4Gkln6b2Smc9Kkj6fLwm0IMPBFlR9Jp2sRsSXQt8bpJVxSboEaw8huZUQDeL5GaDjFUyb
 2oXwc1M2Ehwizbv8jlurZJQbX/mGHzMAzj7tedJjTd2MtK/gJDwRrsk2mKpXGwnjBIMaO4s0e57
 4HRhBEoWoTaOPzMotgg==
X-Proofpoint-ORIG-GUID: XB7eFV3jMO-gwqSLJbjbMBUEoGVoWZoD
X-Proofpoint-GUID: kN89RVPU5gm56uq_SkX3T10OIJoHr9Ii
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE4NSBTYWx0ZWRfX5AhzjfS7gwL2
 9/Ss2jv6u6sc7nh5p51NJ56jGE7Nts1OfwedBD1Lz9lqN+Nm/CtyJuS2VFFehYhE5iAYKFojyNA
 cHGhj6aXDbBgkuixXINAb1KGCl6yYNKTQdxU0ksxz3bOCd+DXRuv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020185
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 21:01:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129702

--------------G0YajZQQoUWq0pQvKTtoecZr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-09-02 16:54, Randy MacLeod wrote:
> Anuj,
>
> It seems like you missed this one.
> It still applies to wrynose HEAD for me and seems like a good backport.
>
> ../Randy

Oops that was just sent yesterday.
Sorry for the noise Anuj.

-- 
# Randy MacLeod
# Wind River Linux

--------------G0YajZQQoUWq0pQvKTtoecZr
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <head>

    
  </head>
  <body>
    <div class="moz-cite-prefix">On 2026-09-02 16:54, Randy MacLeod
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:9da89134-bce4-4777-9bc2-36c0930c90d4@windriver.com">
      <div class="moz-cite-prefix">Anuj,&nbsp;</div>
      <div class="moz-cite-prefix"><br>
      </div>
      <div class="moz-cite-prefix">It seems like you missed this one.&nbsp;<br>
        It still applies to wrynose HEAD for me and seems like a good
        backport.<br>
        <br>
        ../Randy</div>
    </blockquote>
    <p>Oops that was just sent yesterday.<br>
      Sorry for the noise Anuj.</p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------G0YajZQQoUWq0pQvKTtoecZr--

