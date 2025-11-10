Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96509CCFA13
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 11:34:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46130.1762774474343389042
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 03:34:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=UDuTkEC7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=340974e612=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA5eFVI1170453
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 03:34:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=jSLA5o/EkcppAXh4hhZtkR
	AWyEjcbNjdPV0RMX6hqns=; b=UDuTkEC7L9Cz61b+74qNjFaNsiDdQwqJcxaIQd
	ZdWKOoJkPqn3p5YF9kVhChSYJpKiFdqY2WNycNjsZ7uSYXTThRH0OkaHFcQ76rYo
	m1C32RxIsPkYpEVQEA7YWhos7Oh4xjXF8jxwgtyEmo9LnEHkDnhDy/cKtI0A83eu
	N3Hzv6pZThhxktPHZMDTm+u07bPvhdF3ohBxvURyTSjQmhVoMoYTjamVzKRsnxMv
	QyVOt3IXtvSXDTrFK7f2u1o0yCCgRPjwIXyqNZTSG2bs0xHIZm2/zf/RyGXy7hkX
	4jsechUYkjuJ3tV46sFofKWq0CXkxv7jzZB07q5TI0aacSrw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010022.outbound.protection.outlook.com [52.101.193.22])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aa2131m5b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 03:34:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vp5176HMmlONJsh87dOJ9H+UUbkbpXveuHP9DmLblk7crCDK8ahayXGbsNADn1aeqn0hmuGYpr+cXITj+jk/lTc3r/kF0kdz2c0n75IR3pVXwL7NwN4HEwEk1C9dydvalzJ2uH9uvx1PbIlRwmfKP2KCfXLChUFXPBRnwKe6CGy2syqdjHJXrSl6qLJxvXCk8R8PIb9glLV0XcTzM2fQkxIN/Tcz+KkP+kyfpv1z/tgs1oVvt67d5tKopDuCbr3QFkcVB+3B7N6brSYD1OZqG/Df0nmCvNTPJLBs/TfqmTiHvKkLSd4JvpgCvbvKlszx5vOPjIANx+B4Srvy+X+JJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSLA5o/EkcppAXh4hhZtkRAWyEjcbNjdPV0RMX6hqns=;
 b=xGsiiFEMPsP9YTpVuw9hpj62Z+ZNLKVIphSVmSioZhOeymC98kyfMAQgUnRnaV3HAKNSLnL/29dk8CLPrOS2UqC19f8IfWBYnpLLRyWTxhw8H+VhTbH8o+6VSC+HvWZbnoyf9mqDrrpj6WF5H+Q9If5FIM5BziVUMLxcIOOE3PTcY5AiWipvQsyzFSBrz2Cafwy9NMoVaf+vGabiV4kr3Z/ejddCm9qa2uhuePhVHfDa27sOY3YgrYTZIt0nZs2oFtUvQU9nHL0YCAoBMjWubtsxR1TUESvMvqYSK7VmyiYZTJyuNNldkA0uipzuDiMvn56UbGu6Si/so1rGT1h+vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH0PR11MB5192.namprd11.prod.outlook.com (2603:10b6:510:3b::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Mon, 10 Nov 2025 11:34:29 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 11:34:29 +0000
Content-Type: multipart/alternative;
 boundary="------------7fT0FqShRO5iRZP0nrdhN8AW"
Message-ID: <0046fab1-1d12-4e64-a975-83db90add6c1@windriver.com>
Date: Mon, 10 Nov 2025 19:34:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-xfce][PATCH] menulibre: add UPSTREAM_CHECK_URI
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-devel@lists.openembedded.org
References: <20251108141838.259595-1-yi.zhao@windriver.com>
 <CAMSfU+7HK8QKBFjpCRt1J2aNLWjPN0Xzc_ObzY7Nqx4KWo0=Zg@mail.gmail.com>
 <26b4e765-9fd2-47d6-8ee1-639c253c0df6@windriver.com>
 <CAMSfU+6bojSf344BChguojV7nhwP7=Q8yiK0YwOTkteT25RicQ@mail.gmail.com>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <CAMSfU+6bojSf344BChguojV7nhwP7=Q8yiK0YwOTkteT25RicQ@mail.gmail.com>
X-ClientProxiedBy: SI2PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::22) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH0PR11MB5192:EE_
X-MS-Office365-Filtering-Correlation-Id: 9052cbe4-457b-46f0-31d8-08de204d1b65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|1800799024|376014|366016|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Umx4c0E0eUd3YmNPVUYyUkJ0dVNnQ0p1MHMzVjFDeXZaeWZ6OVNsUGZmUW9l?=
 =?utf-8?B?YXQyVTE3OFlVWGErdXdWWU9GQnVWVzJ0MUFwY1orZmNHWUVrVVdWZTRobXVO?=
 =?utf-8?B?RzRldGZldFF6K05vY0NkQlRmcEZOWnZTTTkvZ013WUN6eWRFb1FMcy9Lb2sy?=
 =?utf-8?B?and6VVRodTVUMjVVZWtLeHQzMElqWS9WNXhiNnVTck9MMW5SSStqZStrUFZw?=
 =?utf-8?B?RlkyRzhXS1Zidm5ERHArV0xBcDJtMk8wNjAwaFJ6Sjl6S0hraVEyL1Zkallr?=
 =?utf-8?B?SkI1QTBQTGlVejlZZG9rTi9Dd0w5b0pIZVNKdXdzaXJwdWRaZUxycE8yMTNm?=
 =?utf-8?B?L3pHcCs3ZnBXcnBTdHpnazdNUGFVbjBkeW5VTkxvQ3Q5Rm1sNWM0Y1Flb0ln?=
 =?utf-8?B?U3M4UnRKNzQ5RE1UbC9IZDNHYWk4RHRDTkdnUWMvVkxPRWJVZE5HOFRmY0ZN?=
 =?utf-8?B?MlBySERScFcwbHd1Q1hsZW1MUEtRSXdoUHp5bUdOTTlXTkRQSlJqSDE5cDUz?=
 =?utf-8?B?NEhhbWNCeW1jV3lweDFqdlFURUNlRjFHVzlscE9zd1kzYm1hR3RlUkxHbXFN?=
 =?utf-8?B?T2FaVFM5aG0xY05ZS1FFNll4VVUvU2VmR01acDllZ0UzWDNyY2VzelVyelNx?=
 =?utf-8?B?ZFFPZTI5UzJyOEwwQ1BuY0REd0VwMkFJM0RPME13dmxrS09ySi9qdGFOQ1Rz?=
 =?utf-8?B?c3BSSCtXdkJGRk1XWEVnVkhwQ3ovY0JrbmtqU0JZTkpaQmthbGh6eTc5TnZi?=
 =?utf-8?B?VjIwZkxRVnVzRUE1ZEtKc2tTMHhiWDlsOGJtcU5ZcnI1QTU2Y1k3SzNRUGZD?=
 =?utf-8?B?Z2JoV2dubXN3V1RmeXRKNUZDYTJVSWFUSjJENFdsYW5uOHhFUTRValZ4U2pq?=
 =?utf-8?B?S1BPcGxoM2tRUDY3Y0xMMk1NdXlUcDVDYXQvcjRDU1l0Q0VvaTdLMzZhUVJQ?=
 =?utf-8?B?RTJXMFVid1ZUajYyS0swZUF0Ly9JQ1E4bnh2ZktxNGttcUpmY1BLdjdJUjdP?=
 =?utf-8?B?QWJJOSt0ZWtVQndwUUhLRVBidW9pNzVSY2FGLzg5c2I2c01BU3NmSUE5RkxG?=
 =?utf-8?B?cHhyZW1LcVFqYzZoZ3hJUUwvenY4b1pJelhkZ1ZwVFlqRTduRXRDTVhiRU1H?=
 =?utf-8?B?T2VVK1VJQ2FuMnllejlPYU1JbitvVnltNHZLYUJmNVlISlJOY1hYRTZXbDNm?=
 =?utf-8?B?amdKRjlEZkwrOGd6YzBOZFZPL3h6QSt6eGdDSTNhNHJQQjI3NDdEbjM0dDlm?=
 =?utf-8?B?M3JjczR4VWtHL0thRW9MZ3A1S08yL05oeG1NTkY4YUgwSjJQWVZlN2o1a01v?=
 =?utf-8?B?eU1udGdLK2g5R1VZcHM4SjhMWWtLWVBCSEg2QXl0QW9UKzdISHU4THVXLzcw?=
 =?utf-8?B?Y00rU3ZLYk1hWXdLUmcyUEZ0dXp4bEpDOVVZVktDcTZCKzRhQS9ldE1FbFJD?=
 =?utf-8?B?bnZlMXlRMUVwUDYyN1hVWldOR3FPbW9BMmFxdEhxdm03eVB0Vm11MSt6OTBD?=
 =?utf-8?B?V3B0NHdacmlrakRFV0E1QWRSQ2h3b0FjMEJGa3dEZUszaDlkVXFuOGs3ZFA5?=
 =?utf-8?B?bDhCS1cweks1Z1VlSXEydVAwVDREMlVXSmw0Vy9jdGYvcDRxQldhNDY5MFhZ?=
 =?utf-8?B?Q2VMMGlLRnpmU21JVGp1ellORFhEdG5HUFprMFNucUt5S2w0R0NOUjVxQVg4?=
 =?utf-8?B?Ukx6V09EK2JKM1J1cFpneGlMQjg3cHdncmhUbGpmWmZ4Z0VURHdybFFmS3Fl?=
 =?utf-8?B?VWRsT0lPallmZXhscWJDSFpXcVY4ZjJyTy9jc3hEQnlwQ09WRFVHaVplZW9I?=
 =?utf-8?B?V2xrVmY4T2ZlZ0ZPTnFXT1ZuVHE4RXRua1RzSTdDd1JvdUZ1RUE3dHZYT080?=
 =?utf-8?B?b3ZJQXNXRVN4dlR6UTVOQkMwVitCTFFvQVRmbW5SSW9Bemc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OGFsZGd2ckhjdTBBeTJvSGJXb1UrN1NHSU5jUG1kWGE2bDdKeG9rM25GSzQ1?=
 =?utf-8?B?ZzY4M05PaTMzQzFyTmtZQ2R3Q0RqRld0WmkwTDhuK3c2WnJzWlBJSGlzQmZN?=
 =?utf-8?B?eEtGUUV0SmdQV1FJb2VSRTFTNEZwN21JWFJxZlZVREs5Ty83TEsxelphT2ts?=
 =?utf-8?B?cHpBRStIZktCMmJrMmw3NHh6VlQvL2xZa3cwR0s0bjl5ZkFlZFpRYWt2QU9Q?=
 =?utf-8?B?NEhYcDBmL1pML1BLZHo1bTRXQjhuRGRwdDMwdE1WWWtCUGswejJTNzBWTU1J?=
 =?utf-8?B?QTZ6dzhnQWRaWjdrUytlSmNkNHFobjVTSkZwaDRCUVhNUUozVDVlNWpsLzRE?=
 =?utf-8?B?enBDSStpUWNGdzBocDZUT0dCTGExQkplK2wzOTVtNEVMTzhhTCttdHozeHc4?=
 =?utf-8?B?RWd2WlhSRU94eFNqNzU4WHNTTysyT0xMUDNzOGR5NURySjZQNUs1Y3JiclZY?=
 =?utf-8?B?U1JNVituQTFjeEdMUjd3b2tqTWQ4Tm1aNmp1Ti8wNGcySGhFdWxIaHp1TUhn?=
 =?utf-8?B?WVBFeG5GQm9OYnZWK1lRY1JIaFpWTXkwcmZtMFNFQ3YrenhQYzBqVVdJTHI0?=
 =?utf-8?B?bWpxbDRBZkozMFF6U0d0d0RqTkwwN2Q0RHNOeS9MU1ZDekhhYm9pSkZqUlo2?=
 =?utf-8?B?K0NDdUI1dW9MLzdvV3ViYXdQK0Exck1RRGRGRXNNYjBuLzJnUDRScWgyR0xw?=
 =?utf-8?B?VG10cE45Qk04akFyOVN1Z2lwaFJoT2tlZnMzV1paUk8rQStxbXlTQkFmQUhh?=
 =?utf-8?B?bHpZK3dOeDFkTkRQcnlPUUpEUW5kMm5FS1VGd0FVWENJNkM4ejgwTVlhcGNn?=
 =?utf-8?B?OUs4WmhKaWRBK2hoRmtnaHIrb3pONk8rVm1OSitUcDhZamwrWGQzNTRIby9H?=
 =?utf-8?B?dkNyNHVSSWVZUjIzUEd1eDlFSDN1UUt3VGUwZEJBVm8vNVQ0SlorM3VrTXY2?=
 =?utf-8?B?aldpRllGTEI2T3NxQUVBMmh3Smtod2ZTWStQWENFZEYrTEFhUXhHY0ZTbm9Y?=
 =?utf-8?B?WlJwckhPTHBrZmh0cHhiZWZGcUoyQTFjT2E2aUNIOEVPY0Fxa3pSK3dFbEFC?=
 =?utf-8?B?cVRqSm10R3RobW4zOEhDSlhCZ2R0N3h5bmRabTNRalFpUUFYd0JabWdycUZl?=
 =?utf-8?B?aFNNZnpzMTRSalU3TUJiai9XQW55WTJ2NU42Z1FEdXEyam01NHVJVDduQTBQ?=
 =?utf-8?B?Z2lOWnhVWHd3VEVZamd2L3dhMUQ1QkdqNjRpR3NrY2prbHZ3MjBoWkR3WnRL?=
 =?utf-8?B?eTMwQ05zb0R2Sk5TOW9kNFBUc1l0S21tVG5oVlhuR3VtVkZ4NThLV28vMWZH?=
 =?utf-8?B?bnpJZU8wYStTcHlvakdYTTNoQi9GalR3Zmg0aSs1NUFFcW1NU2czZTFKdFdQ?=
 =?utf-8?B?TjE2aGtaQkQzZU1MNHRVaVNOUHhuUVpQUnFtWktYRWp0RzEzeC9JcHBZSm43?=
 =?utf-8?B?Q2tkZ3duckZVZ1RoaDNhV2ZBOXdGTGZpQzBMbzUvckhTMFJXRGYzMXNIelE4?=
 =?utf-8?B?emdMcUNMTmViV2xLanNjTmQyZ210cjRaTVlBcmFabm9RK25yOVRXTGVLOUZE?=
 =?utf-8?B?S1p4QWRlMDdFNGswdUZPVjRoMUtKNzdSZXB4VWdDcHNjdU92Qmd0N2tjRmxM?=
 =?utf-8?B?dG91K0hQcUdNaVJzdnN5dmxncnh3SElwL2RHVk03S2tqcnNNbU96akhNTkxk?=
 =?utf-8?B?cnRONFRnZnhmSXNxSVZDbTVWaVp5bEQ4SUxBTEFadXdJYy9sSVBTZzdPV1hZ?=
 =?utf-8?B?T25qOWE1N0NqUXVTbVpha0FERElvSTlLT0kwdUMyZVc2U29tZ2pwM3JoN2FL?=
 =?utf-8?B?RG1HcDg4MGZpNTNLTGRhb0JNbUgzcGptVFJ2aVlaSjNZeSt6clpVVHdFM2Fr?=
 =?utf-8?B?ZXkzVUR6TzNYbU4rOVpteWNkRVBLL0g3OVhhU2hUMU5BOEZDU3RWNzQ1K25x?=
 =?utf-8?B?QVV0S2ZVcjVVTElxZWNtbkU3dmtsbkwxZ0ZnUW5helNRVXpKUU5zZnR6cWJu?=
 =?utf-8?B?NXBHeVlzZkRZaEpoNTNJbmcwNFFWM3VOVUcyYSthYlFLMmdvTXRNLytsT0hI?=
 =?utf-8?B?V3pVSGhUdlUrYTRRaXpnQ0M3UEtFMW9JUy82ZUFVRmE1bmFRbGpuSVk0RHZL?=
 =?utf-8?Q?5WnB8H3OeYd2C+rEBvqaKvq6u?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9052cbe4-457b-46f0-31d8-08de204d1b65
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 11:34:29.2945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IehRD8b37sqayt7UoKCiO2uYabM97Np/lw/yi039bzNKS2RG58JzNtFvl+J5fA7q9allCCQ3VZWOfwUdMJug7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5192
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDEwMSBTYWx0ZWRfXwEd5BzLOnilL
 IHDMEzN7KGmVLOHdTSQRO9cylUuJfiht6URyL0L8TpMulhzL8WglxhfNNLM62jUFkbD+fl6Jo6j
 7EGpMDgp2+xV5AgbVUdIJXWhW/t69J2BS8UyeuqCwqtoWA3S7ktUwsusM4D1r3eNBFfCoxkOY6W
 /k3REpyggvU/ZQzVGNu64wWsNGA38d7m/PWeCRet/sK5gfA3ZxWe5m7vINdzPte4kKJsC1wbO0O
 hGLpx7KovadOegG65EycE/bvSUIEOqP6TBZ3FKSTBsdVXG75HzD+pqvhUMewCOuklt80Dhc4JmN
 cTNTj4ol/VnCoTjPfCpVfmvmGAhkqKm8dj7Yg+zeOjAdY483j6ZxgfJHTAINhGtrjXIrBOyreZS
 Ne11wI9NkbeOcQJAynXtsqMpTPhWMg==
X-Proofpoint-ORIG-GUID: IQ6oeSAzv_mSGmtexVsw0yVbPOOITCgG
X-Authority-Analysis: v=2.4 cv=XPA9iAhE c=1 sm=1 tr=0 ts=6911cdc9 cx=c_pps
 a=vOU3FABhAvw2ezUnG/KEAA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=0zhiEtMHAAAA:8 a=NEAV23lmAAAA:8 a=3XTq0bYtAAAA:8
 a=t7CeM3EgAAAA:8 a=oMVOee99aoSdyo2GsVYA:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=Ynz2B5PJOrKKQpWZ7PcA:9
 a=d2kxb4lJkl8dEuw6:21 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=v7CeC1Rd8Ef7gCqLsajQ:22 a=iu7uZdF6-_ttV6dDy8O2:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=XEML4NSlLLheEyuNP6hX:22
X-Proofpoint-GUID: nBzjgMffMfqTaIq0ufhKJmr7iI_01LnV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100101
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 11:34:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121458

--------------7fT0FqShRO5iRZP0nrdhN8AW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5AA5eFVI1170453


On 11/10/25 16:17, Yoann Congal wrote:
>
>
> Le=C2=A0lun. 10 nov. 2025 =C3=A0=C2=A009:08, Yi Zhao <yi.zhao@windriver=
.com> a =C3=A9crit=C2=A0:
>
>
>     On 11/10/25 15:55, Yoann Congal wrote:
>>
>>
>>     Le=C2=A0sam. 8 nov. 2025 =C3=A0=C2=A015:18, Yi Zhao via lists.open=
embedded.org
>>     <https://urldefense.com/v3/__http://lists.openembedded.org__;!!Ajv=
eYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-=
L7ZA15JdzRmFLAvPgmRlNwcN40j7$>
>>     <yi.zhao=3Deng.windriver.com@lists.openembedded.org> a =C3=A9crit=C2=
=A0:
>>
>>         Add UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX to check the
>>         correct
>>         latest stable verison.
>>
>>         Before the patch:
>>         $ devtool latest-version menulibre
>>         INFO: Current version: 2.4.0
>>         INFO: Latest version:
>>
>>         After the patch:
>>         $ devtool latest-version menulibre
>>         INFO: Current version: 2.4.0
>>         INFO: Latest version: 2.4.0
>>
>>         Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>         ---
>>         =C2=A0meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb
>>         <https://urldefense.com/v3/__http://menulibre_2.4.0.bb__;!!Ajv=
eYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-=
L7ZA15JdzRmFLAvPgmRlN81Wey67$>
>>         | 3 +++
>>         =C2=A01 file changed, 3 insertions(+)
>>
>>         diff --git
>>         a/meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb
>>         <https://urldefense.com/v3/__http://menulibre_2.4.0.bb__;!!Ajv=
eYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-=
L7ZA15JdzRmFLAvPgmRlN81Wey67$>
>>         b/meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb
>>         <https://urldefense.com/v3/__http://menulibre_2.4.0.bb__;!!Ajv=
eYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-=
L7ZA15JdzRmFLAvPgmRlN81Wey67$>
>>         index 71d3ab4d29..4c52249fed 100644
>>         --- a/meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb
>>         <https://urldefense.com/v3/__http://menulibre_2.4.0.bb__;!!Ajv=
eYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-=
L7ZA15JdzRmFLAvPgmRlN81Wey67$>
>>         +++ b/meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb
>>         <https://urldefense.com/v3/__http://menulibre_2.4.0.bb__;!!Ajv=
eYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-=
L7ZA15JdzRmFLAvPgmRlN81Wey67$>
>>         @@ -15,6 +15,9 @@ REQUIRED_DISTRO_FEATURES =3D "x11
>>         gobject-introspection-data"
>>         =C2=A0SRC_URI =3D
>>         "https://github.com/bluesabre/${BPN}/releases/download/${BP}/$=
{BP}.tar.gz
>>         <https://urldefense.com/v3/__https://github.com/bluesabre/$*7B=
BPN*7D/releases/download/$*7BBP*7D/$*7BBP*7D.tar.gz__;JSUlJSUl!!AjveYdw8E=
vQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15=
JdzRmFLAvPgmRlN4rVMobI$>"
>>         =C2=A0SRC_URI[sha256sum] =3D
>>         "d906acf9cc13b0e15b8e342ae9aab8b0680db336a382d0c42f5d5f465f593=
c9f"
>>
>>         +UPSTREAM_CHECK_URI =3D
>>         "https://github.com/bluesabre/menulibre/releases
>>         <https://urldefense.com/v3/__https://github.com/bluesabre/menu=
libre/releases__;!!AjveYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNq=
brXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN2yK_rrE$>"
>>         +UPSTREAM_CHECK_REGEX =3D
>>         "releases/tag/menulibre-(?P<pver>\d+(\.\d+)+)"
>>
>>
>>     Have you thought about using the=C2=A0github-releases class?
>>     https://git.openembedded.org/openembedded-core/tree/meta/classes-r=
ecipe/github-releases.bbclass
>>     <https://urldefense.com/v3/__https://git.openembedded.org/openembe=
dded-core/tree/meta/classes-recipe/github-releases.bbclass__;!!AjveYdw8Ev=
Q!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15J=
dzRmFLAvPgmRlN7VVUaMq$>
>
>     It doesn't work because the website address doesn't conform to the
>     format in github-releases.bbclass:
>
>     --2025-11-10 16:04:14--
>     https://github.com/menulibre/menulibre/releases/
>     <https://urldefense.com/v3/__https://github.com/menulibre/menulibre=
/releases/__;!!AjveYdw8EvQ!dHTbQ7Kp14mZBv7gZKyZkT0Yhc5H0VJqyfn0nlF4K9GWBb=
HROi76tYsjRpFNjE8OLXHeuZEt3O-ICfIpm7ugk4UigtnL$>
>     Resolving github.com
>     <https://urldefense.com/v3/__http://github.com__;!!AjveYdw8EvQ!dHTb=
Q7Kp14mZBv7gZKyZkT0Yhc5H0VJqyfn0nlF4K9GWBbHROi76tYsjRpFNjE8OLXHeuZEt3O-IC=
fIpm7ugk4dPIRYv$>
>     (github.com
>     <https://urldefense.com/v3/__http://github.com__;!!AjveYdw8EvQ!dHTb=
Q7Kp14mZBv7gZKyZkT0Yhc5H0VJqyfn0nlF4K9GWBbHROi76tYsjRpFNjE8OLXHeuZEt3O-IC=
fIpm7ugk4dPIRYv$>)...
>     20.205.243.166
>     <https://urldefense.com/v3/__http://20.205.243.166__;!!AjveYdw8EvQ!=
dHTbQ7Kp14mZBv7gZKyZkT0Yhc5H0VJqyfn0nlF4K9GWBbHROi76tYsjRpFNjE8OLXHeuZEt3=
O-ICfIpm7ugk1TxdIep$>
>     Connecting to github.com
>     <https://urldefense.com/v3/__http://github.com__;!!AjveYdw8EvQ!dHTb=
Q7Kp14mZBv7gZKyZkT0Yhc5H0VJqyfn0nlF4K9GWBbHROi76tYsjRpFNjE8OLXHeuZEt3O-IC=
fIpm7ugk4dPIRYv$>
>     (github.com
>     <https://urldefense.com/v3/__http://github.com__;!!AjveYdw8EvQ!dHTb=
Q7Kp14mZBv7gZKyZkT0Yhc5H0VJqyfn0nlF4K9GWBbHROi76tYsjRpFNjE8OLXHeuZEt3O-IC=
fIpm7ugk4dPIRYv$>)|20.205.243.166
>     <https://urldefense.com/v3/__http://20.205.243.166__;!!AjveYdw8EvQ!=
dHTbQ7Kp14mZBv7gZKyZkT0Yhc5H0VJqyfn0nlF4K9GWBbHROi76tYsjRpFNjE8OLXHeuZEt3=
O-ICfIpm7ugk1TxdIep$>|:443...
>     connected.
>     HTTP request sent, awaiting response... 404 Not Found
>     2025-11-10 16:04:14 ERROR 404: Not Found.
>
>     INFO: Current version: 2.4.0
>     INFO: Latest version:
>
>
>     There is no https://github.com/menulibre/menulibre/releases/
>     <https://urldefense.com/v3/__https://github.com/menulibre/menulibre=
/releases/__;!!AjveYdw8EvQ!dHTbQ7Kp14mZBv7gZKyZkT0Yhc5H0VJqyfn0nlF4K9GWBb=
HROi76tYsjRpFNjE8OLXHeuZEt3O-ICfIpm7ugk4UigtnL$>
>     , but https://github.com/bluesabre/menulibre/releases
>     <https://urldefense.com/v3/__https://github.com/bluesabre/menulibre=
/releases__;!!AjveYdw8EvQ!dHTbQ7Kp14mZBv7gZKyZkT0Yhc5H0VJqyfn0nlF4K9GWBbH=
ROi76tYsjRpFNjE8OLXHeuZEt3O-ICfIpm7ugkzVr9lqV$>
>
>
> You can maybe override=C2=A0GITHUB_BASE_URI and get the=C2=A0UPSTREAM_C=
HECK_*=20
> variable "for free"?

Besides GITHUB_BASE_URI, UPSTREAM_CHECK_REGEX also needs to be overriden=20
because it also doesn't match the regex in the class.
This means that we still need to add two more lines of modification even=20
if we inherit the bbclass. I don't think this makes any sense.


//Yi


>
>     //Yi
>
>>         +
>>         =C2=A0do_compile[noexec] =3D "1"
>>
>>         =C2=A0do_install:append() {
>>         --=20
>>         2.34.1
>>
>>
>>         -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>         Links: You receive all messages sent to this group.
>>         View/Reply Online (#121387):
>>         https://lists.openembedded.org/g/openembedded-devel/message/12=
1387
>>         <https://urldefense.com/v3/__https://lists.openembedded.org/g/=
openembedded-devel/message/121387__;!!AjveYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbW=
E8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN8KIZAVT$>
>>         Mute This Topic:
>>         https://lists.openembedded.org/mt/116187911/4316185
>>         <https://urldefense.com/v3/__https://lists.openembedded.org/mt=
/116187911/4316185__;!!AjveYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzw=
RhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN6CRz5Io$>
>>         Group Owner: openembedded-devel+owner@lists.openembedded.org
>>         <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>>         Unsubscribe:
>>         https://lists.openembedded.org/g/openembedded-devel/unsub
>>         <https://urldefense.com/v3/__https://lists.openembedded.org/g/=
openembedded-devel/unsub__;!!AjveYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7=
MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN-vzl8RS$>
>>         [yoann.congal@smile.fr]
>>         -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>>
>>     --=20
>>     Yoann Congal
>>     Smile ECS
>
>
>
> --=20
> Yoann Congal
> Smile ECS
--------------7fT0FqShRO5iRZP0nrdhN8AW
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5AA5eFVI1170453

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 11/10/25 16:17, Yoann Congal wrote:=
<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMSfU+6bojSf344BChguojV7nhwP7=3D=
Q8yiK0YwOTkteT25RicQ@mail.gmail.com">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr"><br>
        </div>
        <br>
        <div class=3D"gmail_quote gmail_quote_container">
          <div dir=3D"ltr" class=3D"gmail_attr">Le&nbsp;lun. 10 nov. 2025
            =C3=A0&nbsp;09:08, Yi Zhao &lt;<a href=3D"mailto:yi.zhao@wind=
river.com" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">yi.zh=
ao@windriver.com</a>&gt;
            a =C3=A9crit&nbsp;:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <p><br>
              </p>
              <div>On 11/10/25 15:55, Yoann Congal wrote:<br>
              </div>
              <blockquote type=3D"cite">
                <div dir=3D"ltr">
                  <div dir=3D"ltr"><br>
                  </div>
                  <br>
                  <div class=3D"gmail_quote">
                    <div dir=3D"ltr" class=3D"gmail_attr">Le&nbsp;sam. 8 =
nov.
                      2025 =C3=A0&nbsp;15:18, Yi Zhao via <a href=3D"http=
s://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!bKY=
-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmF=
LAvPgmRlNwcN40j7$" target=3D"_blank" moz-do-not-send=3D"true">lists.opene=
mbedded.org</a>
                      &lt;yi.zhao=3D<a href=3D"mailto:eng.windriver.com@l=
ists.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true" class=3D=
"moz-txt-link-freetext">eng.windriver.com@lists.openembedded.org</a>&gt;
                      a =C3=A9crit&nbsp;:<br>
                    </div>
                    <blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">A=
dd
                      UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX to
                      check the correct<br>
                      latest stable verison.<br>
                      <br>
                      Before the patch:<br>
                      $ devtool latest-version menulibre<br>
                      INFO: Current version: 2.4.0<br>
                      INFO: Latest version:<br>
                      <br>
                      After the patch:<br>
                      $ devtool latest-version menulibre<br>
                      INFO: Current version: 2.4.0<br>
                      INFO: Latest version: 2.4.0<br>
                      <br>
                      Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zha=
o@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-=
txt-link-freetext">yi.zhao@windriver.com</a>&gt;<br>
                      ---<br>
                      &nbsp;meta-xfce/recipes-apps/menulibre/<a href=3D"h=
ttps://urldefense.com/v3/__http://menulibre_2.4.0.bb__;!!AjveYdw8EvQ!bKY-=
Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFL=
AvPgmRlN81Wey67$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true">menulibre_2.4.0.bb</a> |
                      3 +++<br>
                      &nbsp;1 file changed, 3 insertions(+)<br>
                      <br>
                      diff --git a/meta-xfce/recipes-apps/menulibre/<a hr=
ef=3D"https://urldefense.com/v3/__http://menulibre_2.4.0.bb__;!!AjveYdw8E=
vQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15=
JdzRmFLAvPgmRlN81Wey67$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-=
send=3D"true">menulibre_2.4.0.bb</a>
                      b/meta-xfce/recipes-apps/menulibre/<a href=3D"https=
://urldefense.com/v3/__http://menulibre_2.4.0.bb__;!!AjveYdw8EvQ!bKY-Z8hD=
PZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPg=
mRlN81Wey67$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tru=
e">menulibre_2.4.0.bb</a><br>
                      index 71d3ab4d29..4c52249fed 100644<br>
                      --- a/meta-xfce/recipes-apps/menulibre/<a href=3D"h=
ttps://urldefense.com/v3/__http://menulibre_2.4.0.bb__;!!AjveYdw8EvQ!bKY-=
Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFL=
AvPgmRlN81Wey67$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true">menulibre_2.4.0.bb</a><br>
                      +++ b/meta-xfce/recipes-apps/menulibre/<a href=3D"h=
ttps://urldefense.com/v3/__http://menulibre_2.4.0.bb__;!!AjveYdw8EvQ!bKY-=
Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFL=
AvPgmRlN81Wey67$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true">menulibre_2.4.0.bb</a><br>
                      @@ -15,6 +15,9 @@ REQUIRED_DISTRO_FEATURES =3D &quo=
t;x11
                      gobject-introspection-data&quot;<br>
                      &nbsp;SRC_URI =3D &quot;<a href=3D"https://urldefen=
se.com/v3/__https://github.com/bluesabre/$*7BBPN*7D/releases/download/$*7=
BBP*7D/$*7BBP*7D.tar.gz__;JSUlJSUl!!AjveYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8=
O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN4rVMobI$" rel=
=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">https://github=
.com/bluesabre/${BPN}/releases/download/${BP}/${BP}.tar.gz</a>&quot;<br>
                      &nbsp;SRC_URI[sha256sum] =3D
                      &quot;d906acf9cc13b0e15b8e342ae9aab8b0680db336a382d=
0c42f5d5f465f593c9f&quot;<br>
                      <br>
                      +UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://ur=
ldefense.com/v3/__https://github.com/bluesabre/menulibre/releases__;!!Ajv=
eYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-=
L7ZA15JdzRmFLAvPgmRlN2yK_rrE$" rel=3D"noreferrer" target=3D"_blank" moz-d=
o-not-send=3D"true">https://github.com/bluesabre/menulibre/releases</a>&q=
uot;<br>
                      +UPSTREAM_CHECK_REGEX =3D
                      &quot;releases/tag/menulibre-(?P&lt;pver&gt;\d+(\.\=
d+)+)&quot;<br>
                    </blockquote>
                    <div><br>
                    </div>
                    <div>Have you thought about using
                      the&nbsp;github-releases class?</div>
                    <div><a href=3D"https://urldefense.com/v3/__https://g=
it.openembedded.org/openembedded-core/tree/meta/classes-recipe/github-rel=
eases.bbclass__;!!AjveYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqb=
rXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN7VVUaMq$" target=3D"_blank" moz=
-do-not-send=3D"true">https://git.openembedded.org/openembedded-core/tree=
/meta/classes-recipe/github-releases.bbclass</a></div>
                  </div>
                </div>
              </blockquote>
              <p><span lang=3D"en"><span><span>It doesn't work because th=
e
                      website address doesn't conform to the format in
                      github-releases.bbclass:</span></span></span></p>
              <p>--2025-11-10 16:04:14--&nbsp; <a href=3D"https://urldefe=
nse.com/v3/__https://github.com/menulibre/menulibre/releases/__;!!AjveYdw=
8EvQ!dHTbQ7Kp14mZBv7gZKyZkT0Yhc5H0VJqyfn0nlF4K9GWBbHROi76tYsjRpFNjE8OLXHe=
uZEt3O-ICfIpm7ugk4UigtnL$" target=3D"_blank" moz-do-not-send=3D"true">htt=
ps://github.com/menulibre/menulibre/releases/</a><br>
                Resolving <a href=3D"https://urldefense.com/v3/__http://g=
ithub.com__;!!AjveYdw8EvQ!dHTbQ7Kp14mZBv7gZKyZkT0Yhc5H0VJqyfn0nlF4K9GWBbH=
ROi76tYsjRpFNjE8OLXHeuZEt3O-ICfIpm7ugk4dPIRYv$" target=3D"_blank" moz-do-=
not-send=3D"true">github.com</a>
                (<a href=3D"https://urldefense.com/v3/__http://github.com=
__;!!AjveYdw8EvQ!dHTbQ7Kp14mZBv7gZKyZkT0Yhc5H0VJqyfn0nlF4K9GWBbHROi76tYsj=
RpFNjE8OLXHeuZEt3O-ICfIpm7ugk4dPIRYv$" target=3D"_blank" moz-do-not-send=3D=
"true">github.com</a>)...
                <a href=3D"https://urldefense.com/v3/__http://20.205.243.=
166__;!!AjveYdw8EvQ!dHTbQ7Kp14mZBv7gZKyZkT0Yhc5H0VJqyfn0nlF4K9GWBbHROi76t=
YsjRpFNjE8OLXHeuZEt3O-ICfIpm7ugk1TxdIep$" moz-do-not-send=3D"true">20.205=
.243.166</a><br>
                Connecting to <a href=3D"https://urldefense.com/v3/__http=
://github.com__;!!AjveYdw8EvQ!dHTbQ7Kp14mZBv7gZKyZkT0Yhc5H0VJqyfn0nlF4K9G=
WBbHROi76tYsjRpFNjE8OLXHeuZEt3O-ICfIpm7ugk4dPIRYv$" target=3D"_blank" moz=
-do-not-send=3D"true">github.com</a>
                (<a href=3D"https://urldefense.com/v3/__http://github.com=
__;!!AjveYdw8EvQ!dHTbQ7Kp14mZBv7gZKyZkT0Yhc5H0VJqyfn0nlF4K9GWBbHROi76tYsj=
RpFNjE8OLXHeuZEt3O-ICfIpm7ugk4dPIRYv$" target=3D"_blank" moz-do-not-send=3D=
"true">github.com</a>)|<a href=3D"https://urldefense.com/v3/__http://20.2=
05.243.166__;!!AjveYdw8EvQ!dHTbQ7Kp14mZBv7gZKyZkT0Yhc5H0VJqyfn0nlF4K9GWBb=
HROi76tYsjRpFNjE8OLXHeuZEt3O-ICfIpm7ugk1TxdIep$" moz-do-not-send=3D"true"=
>20.205.243.166</a>|:443...
                connected.<br>
                HTTP request sent, awaiting response... 404 Not Found<br>
                2025-11-10 16:04:14 ERROR 404: Not Found.<br>
                <br>
                INFO: Current version: 2.4.0<br>
                INFO: Latest version:&nbsp;</p>
              <p><br>
              </p>
              <p>There is no&nbsp;<a href=3D"https://urldefense.com/v3/__=
https://github.com/menulibre/menulibre/releases/__;!!AjveYdw8EvQ!dHTbQ7Kp=
14mZBv7gZKyZkT0Yhc5H0VJqyfn0nlF4K9GWBbHROi76tYsjRpFNjE8OLXHeuZEt3O-ICfIpm=
7ugk4UigtnL$" target=3D"_blank" moz-do-not-send=3D"true">https://github.c=
om/menulibre/menulibre/releases/</a>
                , but <a href=3D"https://urldefense.com/v3/__https://gith=
ub.com/bluesabre/menulibre/releases__;!!AjveYdw8EvQ!dHTbQ7Kp14mZBv7gZKyZk=
T0Yhc5H0VJqyfn0nlF4K9GWBbHROi76tYsjRpFNjE8OLXHeuZEt3O-ICfIpm7ugkzVr9lqV$"=
 target=3D"_blank" moz-do-not-send=3D"true">https://github.com/bluesabre/=
menulibre/releases</a></p>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>You can maybe override&nbsp;GITHUB_BASE_URI and get
            the&nbsp;UPSTREAM_CHECK_* variable &quot;for free&quot;?</div=
>
        </div>
      </div>
    </blockquote>
    <p>Besides GITHUB_BASE_URI, UPSTREAM_CHECK_REGEX also needs to be
      overriden because it also doesn't match the regex in the class.<br>
      This means that we still need to add two more lines of
      modification even if we inherit the bbclass. I don't think this
      makes any sense.</p>
    <p><br>
    </p>
    <p>//Yi</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAMSfU+6bojSf344BChguojV7nhwP7=3D=
Q8yiK0YwOTkteT25RicQ@mail.gmail.com">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote gmail_quote_container">
          <div>&nbsp;</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <p><br>
              </p>
              <p>//Yi</p>
              <blockquote type=3D"cite">
                <div dir=3D"ltr">
                  <div class=3D"gmail_quote">
                    <div>&nbsp;</div>
                    <blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                      +<br>
                      &nbsp;do_compile[noexec] =3D &quot;1&quot;<br>
                      <br>
                      &nbsp;do_install:append() {<br>
                      -- <br>
                      2.34.1<br>
                      <br>
                      <br>
                      -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
                      Links: You receive all messages sent to this
                      group.<br>
                      View/Reply Online (#121387): <a href=3D"https://url=
defense.com/v3/__https://lists.openembedded.org/g/openembedded-devel/mess=
age/121387__;!!AjveYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy=
1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN8KIZAVT$" rel=3D"noreferrer" targe=
t=3D"_blank" moz-do-not-send=3D"true">https://lists.openembedded.org/g/op=
enembedded-devel/message/121387</a><br>
                      Mute This Topic: <a href=3D"https://urldefense.com/=
v3/__https://lists.openembedded.org/mt/116187911/4316185__;!!AjveYdw8EvQ!=
bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15Jdz=
RmFLAvPgmRlN6CRz5Io$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-sen=
d=3D"true">https://lists.openembedded.org/mt/116187911/4316185</a><br>
                      Group Owner: <a href=3D"mailto:openembedded-devel%2=
Bowner@lists.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true"=
>openembedded-devel+owner@lists.openembedded.org</a><br>
                      Unsubscribe: <a href=3D"https://urldefense.com/v3/_=
_https://lists.openembedded.org/g/openembedded-devel/unsub__;!!AjveYdw8Ev=
Q!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15J=
dzRmFLAvPgmRlN-vzl8RS$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-s=
end=3D"true">https://lists.openembedded.org/g/openembedded-devel/unsub</a=
>
                      [<a href=3D"mailto:yoann.congal@smile.fr" target=3D=
"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">yoann.c=
ongal@smile.fr</a>]<br>
                      -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
                      <br>
                    </blockquote>
                  </div>
                  <div><br clear=3D"all">
                  </div>
                  <br>
                  <span class=3D"gmail_signature_prefix">-- </span><br>
                  <div dir=3D"ltr" class=3D"gmail_signature">
                    <div dir=3D"ltr"><font face=3D"Raleway, regular">Yoan=
n
                        Congal</font>
                      <div><font face=3D"Raleway, regular">Smile ECS</fon=
t></div>
                    </div>
                  </div>
                </div>
              </blockquote>
            </div>
          </blockquote>
        </div>
        <div><br clear=3D"all">
        </div>
        <br>
        <span class=3D"gmail_signature_prefix">-- </span><br>
        <div dir=3D"ltr" class=3D"gmail_signature">
          <div dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</=
font>
            <div><font face=3D"Raleway, regular">Smile ECS</font></div>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------7fT0FqShRO5iRZP0nrdhN8AW--

