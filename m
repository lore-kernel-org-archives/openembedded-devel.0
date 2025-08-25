Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 561D0CA0EED
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 04:54:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.32017.1756097688986788026
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Aug 2025 21:54:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cGTAfgGQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=033242f007=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57P4HdIH2646094
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 Aug 2025 04:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=GzeLgr+PBhqEsy9GNhj6UcqEntfBCj38asxAr7URe6U=; b=cGTAfgGQR7Iq
	T5YGbBqABGlwSwA7EsXgezOY/ycgDPiWsAs4R8EHv9apf0M6d+xKjkzgbgYmqX/e
	Gcq3UA4bVgWeGQeU4oCn+sNWVGc/+PGwcpck0GdrC+lf3JytiHxxF/y0/S3ffYS4
	Qz3SvW8zBVze9Uo6q9N82znB/AeHaBVvxI0Ne4rT3nSEGo7l6A9sf4JLjuz9PBiL
	V2wZUU5KCeFLCyuQZrvFWztUBr6PD/fg9YXdC/KMNi7xvZ0iSsnHVy+/7c/ouMJp
	h0bnIsWdU8d9NpCHKR6TVGNo3ZBrYbgyyCjktht6z3Ffl5kQGKJIP2DVBmfcflz1
	Sa31IHm3nA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48q4m3seyn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 Aug 2025 04:54:47 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jDHJiC/DCDKqli/1D40IkxCe5NLExop9ib3aXz9E1qOjHh01+yXdadAGq+e4NR8yliBqU4fkLfXujIJo0KJKUqEFKZcAHl3I+fIKxFjz5RU2aUOVGd4wyJg/sr5Ije5DMHPGp82oplXma/7RPgo09ysr2tm8FPu1W5tmzYRkpsz+84jmtgis4VZk6qan+Mkt/e54hFjttS95BSgYfw0f2OU+IcvazZh8Ot8Aezv9qVEqVi9cl1a+6aifVZYcSfac9jHhTRjwe927s0IIeLAL9zjhr32z8eZ+WpISrgohr2iWYL61/mHF7HzyjHwU2eCtnvAwIyNJ4t28rMU3QQNPZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GzeLgr+PBhqEsy9GNhj6UcqEntfBCj38asxAr7URe6U=;
 b=Z5Bq5/vZ5lhG2TlmnaTpxhmKKOfL4JFvbV21qIHl9krYoQBLVsaRuuR9STeQEmd5Djl6S1FYDNGpME8Yggs+mFoDjekqlxATx4BpfxgRuP9PVOoXRdgbHD6EsEejLMyZ+ySOx54oBJTaom9hPbKpgIMPhtTPWxIrOAL21ZcEZGEBIhwnlYyRzGl0ienEOmUhhQZhBnpECIVRb5ciCqlo5C5p/0u0aITEyD7PBjmdNUdryRUhvJCBkxRr+pXJhs4XHA8dilLq2jfn/Sb/3/F6Ff1pwN4MVIhpozvnLbKcHEz66xteFnSx7e03Qg7+9WN7XSSldzGiI8l3kFgu2T+4Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by LV3PR11MB8555.namprd11.prod.outlook.com (2603:10b6:408:1b0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Mon, 25 Aug
 2025 04:54:44 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%6]) with mapi id 15.20.9052.017; Mon, 25 Aug 2025
 04:54:44 +0000
Message-ID: <a8d049d4-8c07-46dc-9ca5-772b56405a2d@windriver.com>
Date: Mon, 25 Aug 2025 12:54:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][walnascar][PATCH 1/2] protobuf: upgrade from 5.29.4
 to 5.29.5
To: openembedded-devel@lists.openembedded.org
References: <20250806081346.2626482-1-Qi.Chen@windriver.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20250806081346.2626482-1-Qi.Chen@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SEWP216CA0005.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b4::11) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|LV3PR11MB8555:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f7a703c-e52f-40a3-fa6f-08dde3938297
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|4022899009|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?L2pvbjVDK09BYzB6elYxK09NTXQ2d2NkQ1RmQ25NWlpaSlg3V0prMHlnZWxz?=
 =?utf-8?B?NFhocFVWM0lxL3FsRzNnVno0eDdGdW9WN1JjQUVlZHJBbE9HdzlGekdpVWR4?=
 =?utf-8?B?dkdjVXRORG1OU0xHenk2bXMzTmpRdm1IbWY1NG0vdkh3YW90MzlkK0FibzFL?=
 =?utf-8?B?S1RYbUdUTUZ1SDJKQ3JyUGtRWkI4K1IxNUZBY2VOZWg2cjR3NlBydHA1bUY0?=
 =?utf-8?B?ZVpISGl3WUZwTDE4M1ZhT0hjdGxOSE1RNUVFczAyWnV5SzJDeDNIQ1c4OWk4?=
 =?utf-8?B?ZVRHcTRLV3cvMURkVld5WTdpZHFtejVQTVdka2tZZCtlZFkzcDBSM0VsMXlS?=
 =?utf-8?B?MkN5eTJGc1lvZkNzRFdFdnYvL2JSYmd2MldFR0lHcUZVVW1IRlJxT3FmWW45?=
 =?utf-8?B?NnRtYnlOVEJrSTdhNWFxdm1xUjR6WnJYMUE4RFFmbk5IL2RYZGlFeDB3RjJZ?=
 =?utf-8?B?eDVMYmRPa0xRNEVrcmRwQUo5bnA3WlNWYVJtSzBKN2habGx6Mk1Ec3NHWWVk?=
 =?utf-8?B?ZmdUYzUxOHIyQ293bHJ1ZnFRS3h1ME16Rk9yVU42RDdiUnhFZkV4Q2YvQVI0?=
 =?utf-8?B?TzBmZHlvblExUEFiejNEbGl2UVk5R3oxWFJpY3ZGT0kvQStHa2F5SHdFR3VV?=
 =?utf-8?B?QnVGRVFVdXhGV2NOVWlRQzdVSTFhQjlkUlVSMldSSTdJT0xScDFhZnl1RkVt?=
 =?utf-8?B?R0VWRkx0aGlkb2p6Q2EzMFBMdzIrT0U5cTVuQ0ZtWVBrSk5UMmx1eTNwbTc5?=
 =?utf-8?B?TmhYVUZnQ2thbEtNajh3L0RUZEk0NE9KcnAweGowN0NPS0NuVUIrczFramJl?=
 =?utf-8?B?STM3b1ZsZFNGS284WXhmdk9SSm1GSzA5Uk1jZmdFcG8wb0o2Yy9vNDJVb01l?=
 =?utf-8?B?STR3WXIwWmxXcjB3NktJVjR5NWdhVGdpOGU3RXBYN1doMmFKNFQ5QmFIczRv?=
 =?utf-8?B?eHl4NmIwckJQdGJ2RFZvMUVKNnRXN0VBL1lZUjc4UjNJWkdjcU10RU1ZbWV4?=
 =?utf-8?B?TVhiK0pUUXBnNnRER0wwZDFFVTJBRzEvdWc3YXdaSWJVSERXNk5ZWlFIL3ZX?=
 =?utf-8?B?a3ZrMStrTWhsQ2pyVGNoOCt4RFBRTnRTalBJVFJySm4ycXBVQ3RyMXMwNEk5?=
 =?utf-8?B?Sk40Z1VlRFBvK3MrKzdvVzQ0OVRyRitnTzMyVHYrOXBpQkIyQ0kwSjdxYlNN?=
 =?utf-8?B?RksyV08xVm9LclN4RzV0U05kRW5JWnlFenEvWS9la1l5a2RrbmxJUnZ4UVd1?=
 =?utf-8?B?a0hzSG16NW03ZkM2TkJ2eVNESUdmSmR1aWJGVHY0b2ZpZzZsUXRWVW9Xcnd2?=
 =?utf-8?B?STFlMEN4dHoyNlZubUFjb3pqM1pwR2p4UHVxL0hVMFB4SU1xV3hPZnp2QUNB?=
 =?utf-8?B?aVBTMmVXYUhadWk0T1ljNXpIRUtQdUZpaWJjdmI4em95cG9Ka214aXQ3L0JX?=
 =?utf-8?B?WFQ0MWdyL3lqdFZKOW12QTFZSzV3aUlyQ09NUGZaNi9vcS9GYU5Ob1dXaUNW?=
 =?utf-8?B?dTNsU0dpZFp3TjlwWnJxVzZ2ZWo2V3pDdHBOMmhFTERLc1VkTFlnNWNUNGI5?=
 =?utf-8?B?MEhWNlR0RElSbW1yak9DZE9ZMUM0SVdTYWJFWEprSTVSNEtpL0N2OXBiK0J4?=
 =?utf-8?B?RHk1ZGdZOHdpZUFvTldOaGc0V05QNUlOZFJpdTJhdmJxZEFOZGNvZ3Z6b0d2?=
 =?utf-8?B?YnkvUlZ2ZkMzTHhHZHdkYlBLYkxuc3U0SSswZUY2MlpDMy84MTlSdllZTDNs?=
 =?utf-8?B?VDY2K1dQcXd6OU11Uk9ZT2VYM0ZIN0sxUXlWSEx0NElPcFhCanRmV3FFV1Bi?=
 =?utf-8?B?blFXSjBuRzI2cXJFdmFMQUNGcm1oK2k3b09UZm56RjZvUlRxRXlTcm9zbWVi?=
 =?utf-8?Q?RkY+AuoXVqTVF?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WU1vUzRpam83bnI2V053VTVVOElTNEtYNWVPN0RFMU16dzBjN0tUcndwQmVM?=
 =?utf-8?B?dU5Lazkxb285aEJIVkJra0VQWUNwdHNFaDNuaE4zVzZqMXRWV05hcUg0WVhG?=
 =?utf-8?B?eVNJK1F2aUFyT09QNm5NajVsWjdrNlU2Z3pWTUlydGdrQXdhWUVQbzBTT0d6?=
 =?utf-8?B?aEFnRlVQNG91dnh1ejVvZWljM2VyMVlvSnk3RkRtc3UrMjhpRjRNRzRwZWtt?=
 =?utf-8?B?T2VoT1M4Y0YxUTZKRVdrSGdQS01sUXBFVGFTY3loUDVsaHNMOXJqWE5YcURt?=
 =?utf-8?B?eWFkS3ZpWWNPUUM1bVM0NW5LQXRLdmI5bHBma3hwcDlzL3R0U0E2UytWMnNV?=
 =?utf-8?B?cWpnb0VOU3hNMzROTUJ3S0lSeHdURkhLYUkveWdOTlB6dnZqSzlSZy9HR3hl?=
 =?utf-8?B?K2lQZ0ZnZ0dXUFlKdFJOYWdwV1ZDV3JtMUM5WnJ5SnZnTGs3K0Iwd2NyL0lF?=
 =?utf-8?B?NjlYdXBYbjNySm5GbnJsaFB4b0dLdkRCK2hVa3hoRGNJRTN5UUtXSGxYa2FE?=
 =?utf-8?B?Umk3QUJzazJTaDZtU3BSWEpYYXNDV1c0NEZkWWg1VUppTWFRL3RES0EvRjhq?=
 =?utf-8?B?NmI2czdxNGJLNldOVGZKbE5hejRYNGFkU2R4enV2WmxwZllhK1BnRVVQaUNO?=
 =?utf-8?B?UFNzeXJMVUtFRUxsajJqNFRuYklGOXBHSmxRNkREcEtML2RBMkE3RTlVbFNQ?=
 =?utf-8?B?RjZDU0FJRk9DRXhtc3k5L2JOTFRTVjBqWVJoaGErWDBIcVh5WXhPb01reENP?=
 =?utf-8?B?K0FuclhpL3lrcis3MnZxbUJUS1ZvOTVjcWYyckdwbGlwSWFkZDVYWHNVZkRW?=
 =?utf-8?B?RGNrV0NWTW13ZVVkeGgzaE80T1BUMnBXRy9UQ2FnTFM3azdoZ0pNT0Rza284?=
 =?utf-8?B?aG5ablZuRDdGcFFyczJpTG5VUmdmdUp0c2dDTzFHckFIMFZQb201NHVDditG?=
 =?utf-8?B?dWN0WWZ5Mk96SWkraVFIaE5NejlpRnRRdUNuRXl4ZTI5dDJ1dnMvbkltL0Jl?=
 =?utf-8?B?ZVdLZk51VThLV1F6ZitWRWd2Z0hOOSs3OHNzY3FjTGxHM3p5VE5LVTdCVEIy?=
 =?utf-8?B?eWNVRE1RWXY2OGNnaFVHWERxai90WFhOeFBlOWpyb2JVbmcyNFZxNFZaWkhk?=
 =?utf-8?B?cHNWQVE0K2JNSlp2OWpDcXgzL0pJR2N2VWZzbDJVeTVBMzdCQUdQQk4rN0hB?=
 =?utf-8?B?M2k1UDZyd0MxWXcyUHFzSCtsSjA1Z0FiaW1QM2hDb1hQbzlTK3BGN1JlRGw0?=
 =?utf-8?B?dk1EVGNqWVltRldvOUEwK0dPenZQWWIzNlZNMzgyQzdGYnhjV3E0eThVNXZy?=
 =?utf-8?B?ZXlNTDhPZzZVTHpwV0FvL2MxU25JWTBkK2RXbTJyeDhQVjl6bXBPd0RrMnhS?=
 =?utf-8?B?SnlGTEdDeU5JUk83V3dBV1BNUjc0OUZuSlU0dnE2RndFUktvOWpFR01sQzMx?=
 =?utf-8?B?U21HRm5RdzBMdmNFakFBQnQrSWdITmY4YWRVWHkxRFpGL0JpZVkraXVqTVRm?=
 =?utf-8?B?K21HVXc2UlNFaGx3K2krTjlMazlNWUZUUjIzU1ZDeXQvaHBlNFlvRGpTbzN6?=
 =?utf-8?B?bVdtU3J0MFJScFpEelN1VWlTSjNJV2RRZm1iZ3hLLzBMdG5pWVpROW1wekJJ?=
 =?utf-8?B?ZkprNVF6czFaUHVJcHpXVkVUd20xU0M2SzBTY3ZRbmR5R2lDeU44YUwxajkx?=
 =?utf-8?B?SUhNamFiSE5XUFJTREF5UE8yODExWkJVa1o0bVoxZ3pvY3RZM1NITmpaVGhF?=
 =?utf-8?B?SmF3QTB2Znpia2IrMWtPRDVCTm1yVllRK2thbGZ5a1FENVNSR2VrSGR0OXY1?=
 =?utf-8?B?S2xONERxUkN5eGl0RWo4elJOTTFFZGJrbWhqREM1d1E2N2F5dFpZdWlTZmJD?=
 =?utf-8?B?d0xNT0tyYk9ZMlBSRjRYWVV5b2ZVSlkrUzN1RUtGbm9Jajd0VngvYWlvcjZ0?=
 =?utf-8?B?clRQVmFVaHNacENCK3JyZ05hQUZvRldWY043dFZWbW1zRm91T0RsbWdhdktk?=
 =?utf-8?B?dDJGKzFrMEhtbmtEMlcrcjQ2R0JkWUs5bjBXMXovc0lQNWExUEFPZENReG95?=
 =?utf-8?B?NFVHSHN4UkJYazVzVHhlOGpqQ1hLRm5pMC9saFZxVnJlU29Cd0ovSEVtZUVX?=
 =?utf-8?Q?rFYFPwUMOExp83Q3yCV4i3h+r?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f7a703c-e52f-40a3-fa6f-08dde3938297
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 04:54:44.8202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lo3UxYh7kV92b1zvSjdZDCUEj2msKsNmv7L9K1P85wnvKAiL9k68UUZ8YcWqMveyRzwNxlGGmzykhReYyOQlDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8555
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDA0MCBTYWx0ZWRfX/VuvoKvdbV4l
 FUGGDOZa9pHvXQE072zvW40Q/ghnbzlrW6iUe0Lq9frb07UITDscfAFT2JD628fnP0y7OFFsGZs
 VsU1qBu2FxET8yExOonE0uIs6qTecD7F1xSGF4+TSsDY3ETSzIealCvnWSMN8YyLLTmyThxfXA3
 mdY/YDXPdrD8Bqh55rn6dodUdfnPL9rr0eJ0ocH4f95Z1V074Bk3nkKfBLMPZgLudosfyD51XeI
 lVvqFWN+aTysmZdkRfFhLhXKfukv1KspZP5SeD3SDZ7IOFasSFSxOIUwW75QPmPMJrNdk9XIEHu
 DoJhFgMyaBWZNcGCanylfH7Pbg3/KU/QetMpcjcONd7A5iipK0QeVm7E8GedEc=
X-Proofpoint-ORIG-GUID: 5DAtY2LOXIarVO0_yf8NNz7DfCxOAtZC
X-Proofpoint-GUID: 5DAtY2LOXIarVO0_yf8NNz7DfCxOAtZC
X-Authority-Analysis: v=2.4 cv=CcwI5Krl c=1 sm=1 tr=0 ts=68abec97 cx=c_pps
 a=O4piY6ms2OEsn3JBuHrpGQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=NEAV23lmAAAA:8 a=nQnj-N-2p8cSofkvP60A:9
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Aug 2025 04:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119088

Ping

On 8/6/25 16:13, Chen Qi via lists.openembedded.org wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> This is a small version bump. It includes to following two
> commits to fix CVE-2025-4565.
>
>    05ba1a810 Add recursion depth limits to pure python
>    1ef3f01c4 Internal pure python fixes
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   .../protobuf/{protobuf_5.29.4.bb => protobuf_5.29.5.bb}         | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-oe/recipes-devtools/protobuf/{protobuf_5.29.4.bb => protobuf_5.29.5.bb} (99%)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_5.29.5.bb
> similarity index 99%
> rename from meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
> rename to meta-oe/recipes-devtools/protobuf/protobuf_5.29.5.bb
> index 30b805e6b1..88a979d0af 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_5.29.5.bb
> @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = " \
>   DEPENDS = "zlib abseil-cpp jsoncpp"
>   DEPENDS:append:class-target = " protobuf-native"
>   
> -SRCREV = "1be1c9d0ea6efa2a25bd7b76186844d1669be78a"
> +SRCREV = "f5de0a0495faa63b4186fc767324f8b9a7bf4fc4"
>   
>   SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=29.x;protocol=https \
>              file://run-ptest \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118887): https://lists.openembedded.org/g/openembedded-devel/message/118887
> Mute This Topic: https://lists.openembedded.org/mt/114562670/7304865
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


