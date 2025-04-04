Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED5ABC3601A
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 00:33:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.901.1743726820376055186
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Apr 2025 17:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6189ea431a=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533N3SSK012582
	for <openembedded-devel@lists.openembedded.org>; Fri, 4 Apr 2025 00:33:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45sg0q9mjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 00:33:38 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5340XcHH014662;
	Fri, 4 Apr 2025 00:33:38 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2043.outbound.protection.outlook.com [104.47.57.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45sg0q9mjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Apr 2025 00:33:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TFPiurNnzQCmVSsxB1ebtKJzLaIWY5uEviwWsB5XND44OKtpVfMq+HK8/Cicg1Cbiy6kCvDKSSSPmL2SBX/FyGfMXRz9JxwvRB7VCCSZMQw4uT3pnR8JjX8D2Q6XRMVGZXmMU7PpNBI6HCsufDRQIhgO7YcngNklF2WFfXW4GGUhUq3KSGbGnbDMdXYwZ1o16lraqgSA4e8MnsgPeLQSKAiJzMtNsaLGyEUMyQl7+C4AubxfpBYGqPwX4NGQU/4vX7fqFGuLWCWDRFk3Cz0RJJ6hloBIvGBJeupDXDa6pTpAb7WCl+SiDrM5+nhlZZoQxqI0MH2OeosUaUah/m8q8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZGLlVbx0Rfqv7o9BvBZp5CTU0Z1gcRu48jHMuQLRGY=;
 b=DN7Jk7r2vLRd0lLI2LywcI8fx1ufgHRw6eHMTsLECtl0OP0GMNohyQu7GQApKAFqs6P0QJ8Vws11maHYXUoHjuRV5n3NyUjh0ec1sSwWXBQLJP8PK8NOvgFvcE5mEfWCZiM2nU1VHRgxOFnU3GCGOOFwDKYJirMTlGyh0QNg64UCu/+D0oieROwKdbxUFjtu36ZW3GTCTsE0ll/VTnJhUaClPUZjkixxo2vfSZOW5VcJ+QZazzxB1s936cy/c6qQaxGGglPKZw9JIJ7sQuqoKkJvWsNgQ6pxbGURJBkt0KJ19Ap9wlnKBXmbz1bvMFJgGd0bJXQm39GFXH1Sk39sOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SA1PR11MB6758.namprd11.prod.outlook.com (2603:10b6:806:25d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.43; Fri, 4 Apr
 2025 00:33:35 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%7]) with mapi id 15.20.8583.041; Fri, 4 Apr 2025
 00:33:34 +0000
Content-Type: multipart/alternative;
 boundary="------------nFkgyD6iCvWQGqBypPanUVOq"
Message-ID: <c13725c6-ebda-46fc-8241-c15455425cf1@windriver.com>
Date: Thu, 3 Apr 2025 20:33:32 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] valkey: update from 8.0.2 -> 8.1.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250403204412.1686638-1-Randy.MacLeod@windriver.com>
 <CAMKF1sqQBe535z056kEL6RSHqnaAgELjTPRghwfQo_1N+UPkmw@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CAMKF1sqQBe535z056kEL6RSHqnaAgELjTPRghwfQo_1N+UPkmw@mail.gmail.com>
X-ClientProxiedBy: SN1PR12CA0086.namprd12.prod.outlook.com
 (2603:10b6:802:21::21) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SA1PR11MB6758:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a900f05-3636-416e-b34f-08dd73105570
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|4022899009|1800799024|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YlczN3VJNFc1RUlSYUVTUisxQWMwSmc1SlgwQy9OODZBa0xhbXJhZ2s5YnBj?=
 =?utf-8?B?VTVxd1ZHVTUzV0NqSXRoRjRvcEQ4MGZac0FaWDRCWkVWU0E3REMxaTFtVGVG?=
 =?utf-8?B?aE10M0MxdFZhY3k2QlJuaEh3d1dxZW5IY0xCOHFGWmRTdXFFZnlCRzltNDFl?=
 =?utf-8?B?M3BWaDVCY2hBd09kaTZIbHRHYTNybHFQcVdWMC9lczhiZ3dIQXRta2NOcTRY?=
 =?utf-8?B?UXBZaUJKbjZERzZWY3k5RTM4eUc1Mm5nTGN6aktNSWlONUVnN1NTcGNoVnpE?=
 =?utf-8?B?WE5qU2VQSUViKzExOHV1QzM0WnViQ3M3dG5UalFabjdCNFRkbHh3cVJUL2NL?=
 =?utf-8?B?TVVxQ1Jqa1JhYktPUk1FaUFMcXpLdDY3M2c1NUJhQjdPWTNacFdkUGVrOUow?=
 =?utf-8?B?TURHMFdKYzhaYS91d3Zzb1ZNRTBzQ0ZXa0RaN2lZek11TSs3cERHZEg5OGhO?=
 =?utf-8?B?WEFWQ2hVSTdaZnhmZ1lab3EwUUJPUmZkaDlxU24wUjhvYWpkYW1MOVYwV0cx?=
 =?utf-8?B?TExuYUhoL1d2T20wRXhlZ2g5bFQyZ3ZaZlRibEVGaXo5WTFnb2NWYUUwWTk2?=
 =?utf-8?B?NnBrNThQUzduOGtDWTNlUHBzTjZycjVteXQwTnZYNTRzUjhWUW1Vdy9kVXdZ?=
 =?utf-8?B?a1dBMlIzSWJIcVUrSVE4c0RWeTZKTDQ1QXBBV2hMdUl3aGJoUlAzS0w1S3U3?=
 =?utf-8?B?NXpaOVd5UnYyMUdFdXZEcXlyUGFCVU0xZXBTSHViMlJ4NGVkUXhpOCt6YnRv?=
 =?utf-8?B?Wi95SWVJV0NNaGxFdGFOQ1F2UGlGYit4Y1k1b0Jld3EwZHQ0NUQ2djB0cDNt?=
 =?utf-8?B?YVJxM1RaODF5SkZCMHM2Um9ISWZZa1JoNHVCcXVOcDg2S3lrQjh2SEw0NnRB?=
 =?utf-8?B?V3F2Q2ZYWEhjQjhPSFRaR2MxK1NGQzZDSDVscnJqUS9OanJhazJKNkJSenNQ?=
 =?utf-8?B?cUNaTlBCNzhsR1BaMExBeTA2blpvZlhLdFhNcHBMS3kzeVpYdnJDRWdlQlVF?=
 =?utf-8?B?Sm5GUGozNSs2RnZvNDVvU0FROVgzSkxkU2xOcURqVHRTRUNrNWhiNEJhSXhY?=
 =?utf-8?B?MkdDZVpLeWJBcVQxSy9oeXFhcVNJbFcxaHJJWFdNWHpOd2FFVE1SRzFrTTJ6?=
 =?utf-8?B?UHNsOFRTeFRnQjFpTjVxUkVvNDlZU0NIbWhLTGNkWEs4QklsVDNaVE1KN3lU?=
 =?utf-8?B?TGNoSTI3SWxqajFXY3FRcEI3eVJxRURCdlp3TlA2OFd2NTR0a0pwb2xuNmNn?=
 =?utf-8?B?anFRbk95c3JIbEdocDRrNjZHdzgxbFQ0dUp4SWUxdjEzdzZKcS9oRjd3d2k1?=
 =?utf-8?B?Z255SGZkZ1N5M3RROTVWZzV3c1E2RzlJampROHVqRGUrUG1tcU12d1JIdlJI?=
 =?utf-8?B?WVk5VjI4emxBYVl3THUzTXd5dWVlWm9UQk12SERXbEV2dENGSjlnK1p6Kzgr?=
 =?utf-8?B?MUhUMGx4TWs2OG5yKzRkWmVCYjVsbmt5ZGI3SVZrOHhyNzN0bkIvNkJYcGhI?=
 =?utf-8?B?eTF4NVNwU3h3cFNLYlBFUGVCWEFYZnlNRVB2RUZqQlA2enp4ZEJpMmhJM003?=
 =?utf-8?B?OWx4eHNsbGlDbW1pb3hTSnYxVXFEUHM0QzBCdDBWcE5Wbkt3dmRXS3FEclcr?=
 =?utf-8?B?YWdZQmJjazFhc0VXM1grRjFLa1UvbGVNMmhtTTd3QU10Q1hqMUtrWi9DWFFO?=
 =?utf-8?B?S3BqZWlla1hGSUw4MElYcEVBM1Vva3IwV0tSeWp2QnBuQWdnaHpWelZkVWd2?=
 =?utf-8?B?K0pQT05kRklYRnBLazNEdmJyMlRBQUpacElnRmVpQ2xuMFphM2JyaitzZ0hs?=
 =?utf-8?B?cXp0NDFWdHQ4TzBiYmE2M2g5L0pYaUZyYnRaMjhXeDZmYXJ6YW9OQmtmazRS?=
 =?utf-8?Q?6QqyC/cgnsaqE?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Sk5hR2Fvd3hQZUx1eEszbko2aDRqRDFMbTljNjMwMlkvVFhUcjdoKzhwbjNN?=
 =?utf-8?B?U1dlQk8ydHlLTE55WWdOaHkySXREUWJ0bXQ0TjU2c1FKTmhhRzA5N3pwaDBu?=
 =?utf-8?B?a3pnaWNueXhCTVpFSS9xL0xxcThyK1dseEJDYWVmQldGeUd5RUx5ZDBuanY3?=
 =?utf-8?B?YnpwNDhZM0l6OGxkdmJaUi9BVkhPeTBCM1dCTUhNUEpvWUZ1bVdtcDNIVkQ2?=
 =?utf-8?B?ajZPa096NWJ1NDFEaVBDM09vdFlSV0FBU1kxMmtUUVZwWTNBUmw2K0NvWFN0?=
 =?utf-8?B?VVRzWG9XNmw4NzVHT2F4bGg0blBEbTMvUmU5blN6V0dHbDFmK2xNOWVpeTlw?=
 =?utf-8?B?dWREYlBrY2pBL1d3dEE2REdrM3had2ZVMlVRWVhybkRUUnpPYTNDT2NtK1JD?=
 =?utf-8?B?Nk91d05GYUcweDA3cis2WWhtU1pqWWduSlBGRUVFRGtBRlhHU0paYVVrdlVR?=
 =?utf-8?B?T1k3YXJhdzE4VFQ3L3BIazdPOG8zdHJhb0Q3ZmJkVjc1V3hMaVhRcnEyQXp5?=
 =?utf-8?B?RVVyVU85aG1GK1ErTS9WN0ZLbnpZc2tiSmZ4dU1vRW1GNm12bTBuT0dneURs?=
 =?utf-8?B?UE0yWGhLUFZKdHhSR052ZHFCNFhQWnlodDN0cURTZS9ibExYVCtDemphaDhU?=
 =?utf-8?B?YkhzSWFmSWd4dXZzZmdVQUQwMHZUdDlFclgzWmxpWk12L2VOMFZnQm1EeGhl?=
 =?utf-8?B?bGM0VEpuMG1naHVobEhMZU0yMSs5SnRFeFVER3BRbWcrdzIwOVFtY09DRCtB?=
 =?utf-8?B?WDVZRjVzSTVxY1NUKzZyN0piQUdpblZGRlJ0bnZjRFJXWTNhUkFUYUw0QVk3?=
 =?utf-8?B?TDlFbWpYQTkraEhmOUlxYkRBQ1hDR3dndlF4REw4TDBvdEpNeFVkb3ZZd1Vm?=
 =?utf-8?B?VUYrVElWTmFTT0IybDAwckVkQTNNSDJUUU9lYTh3OEhkVFZLa2xLZnFYdllU?=
 =?utf-8?B?UlIxaEh0T0xIL1RWbTh6cnQxdVFuYXJlM3VqSmNGMitkRzdPTUcwMVlUbEdq?=
 =?utf-8?B?MGNQMHlaazZWRDRab3Vnci9uLzhzYk1aL2p0U3FYOGd2S05raVF3OG43alNt?=
 =?utf-8?B?Y2ZXaVI0UGFmbHdkQk8reEtCbHQyekNvZHFFdVdFNysvZFFDeXBJWGVWWUFC?=
 =?utf-8?B?OWFpY3M4VTV6cExORjhRenR1Vm5aZnpUTHU0RmdBWE9NbHFuMzBEUEpkd3gy?=
 =?utf-8?B?dHdMTUVkeW1uY2pCQ1gzQ3RWam5JcDlWSUZSUkR0UGJneHhlaWtBV1VsL2N0?=
 =?utf-8?B?aVNLeW5ockQvWGNReXJKbnVLZjU5SjNkRzhnb3Y5M256dFlVMWdXMUtsNzZ4?=
 =?utf-8?B?b2ZXalMrdjNiNkRpTzhVczhBeVRYNWtPVTJJU09wOHp3OXlhN3I3MngrUjBV?=
 =?utf-8?B?NmhZU1lsYWk0K0l4MUt5eXltYnFDN2dteXhXbjVXTUNBTDdCaGE2Q2I0NmRB?=
 =?utf-8?B?UzJSYWZEei9HRkpyV0tRV20wRlRsYTU3b3JZVVlzTTRRVkNLdkdPL3U2K2Ja?=
 =?utf-8?B?eVpNZUZWcDRiTXBmZkRsTGZtNy92SDZFQ0luZHNLK0ZSYzVuRU56SndRSWp1?=
 =?utf-8?B?L3ZKRWJJTDNxUXBsUXdZbGpiOFRiQms2N1p2NTdYcEZLM2dWeWFDR05adlhr?=
 =?utf-8?B?N3RPemdIbVUzN1hPT2lCOHJPSVE3MnhVN3dSMUgvOGlkT1dFWDllQUE3QXlh?=
 =?utf-8?B?VzlWcmVmMGlLZDFhMHZpZTQ4endHSldIQm1HNXBhOXBRTE1MV3ozU1pkQm5h?=
 =?utf-8?B?RzJwbW9YNSttd2g4RWZXTjlFYVIzYjVmU0svOU9pMU1tMUdORHkrL0RJb0NN?=
 =?utf-8?B?d1NSeFlZZlZMVEE4bHlOY00xZ3kwdUtGclgzbFRIckdUQjRONmlMLzhPa0pL?=
 =?utf-8?B?S3J6cE80OUlkMm9FWmQ3bkh6dG1Ka2wvYnlUYlhKaUVsZWx6V1RMczRhaDht?=
 =?utf-8?B?a0hlczFLOVYyeTJTR3huY2hJSUtoNDI4RnlxWDh4RzNVVUZqN1RtYzZOV1h2?=
 =?utf-8?B?RWNObGF3NFlHOUFIQVVzK21SUmM2dzdKam16bnVmTlZlSC9aeEV0SmN4ckM5?=
 =?utf-8?B?NTJFR3ZvVWszOHlaekdJRFRkenROS3RhM25sSlRwN2lGQ0dzWGpXL2lNYUhY?=
 =?utf-8?B?VTVJK3N1K0pSd3F6SEdNaWRWUUNMczU1Z2lQWG1SRFV0NGc3YlQzM0Nvc3Iv?=
 =?utf-8?B?MFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a900f05-3636-416e-b34f-08dd73105570
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 00:33:34.8615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NTWtZzEP1up6aA1UwNjf2HCegSSiw7c80FjWJ+3n2gAOap3nJtFCQTmEXJZxljtNfKmzgm3sejAiiUKlc6c4bPS2QS+v6gj3eu5HuEILsPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6758
X-Proofpoint-GUID: EH8zKXxLt6q9i-PUrrcDiZVxlb4XSM3z
X-Proofpoint-ORIG-GUID: uOTpudqaaVVVnE4TNpIFAtg9Jp08iIpn
X-Authority-Analysis: v=2.4 cv=G+4cE8k5 c=1 sm=1 tr=0 ts=67ef28e3 cx=c_pps a=iNWIl9VYHPL0lOopq5qx6w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8 a=3YNPhbaYAAAA:8 a=yk6llASYAAAA:8 a=BjMif5yZAAAA:8 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=ZFOE8ug6eZ39Z6BvO2wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ft8miUxMqK0JBpEJOZEA:9 a=aelcVcWkOFZj8Jv9:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=AGsv5QnmE7zQ9uPEcrdh:22 a=djwjnU9VZWk50pS01Q9E:22 a=ftVT4cx30j6SLCxtN1ED:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_11,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504040002
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 00:33:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116554

--------------nFkgyD6iCvWQGqBypPanUVOq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 533N3SSK012582

On 2025-04-03 5:03 p.m., Khem Raj wrote:
>
>
> On Thu, Apr 3, 2025 at 1:44=E2=80=AFPM Randy MacLeod via=20
> lists.openembedded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!eInicRMNhjFgfQKzcuSHuc1F7NDtnyYvxuxHuj-AFqBVGuBTHPt4zA8cD2SioWhdFiA-T=
g7KKX3InaXjzbMJQg$>=20
> <randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
>     From: Randy MacLeod <Randy.MacLeod@windriver.com>
>
>     Release notes:
>     https://github.com/valkey-io/valkey/releases/tag/8.1.0
>     <https://urldefense.com/v3/__https://github.com/valkey-io/valkey/re=
leases/tag/8.1.0__;!!AjveYdw8EvQ!eInicRMNhjFgfQKzcuSHuc1F7NDtnyYvxuxHuj-A=
FqBVGuBTHPt4zA8cD2SioWhdFiA-Tg7KKX3InaXjTQ4EYA$>
>
>     The license file checksum changed because upstream added the line:
>     =C2=A0 =C2=A0SPDX-License-Identifier: BSD-3-Clause
>     Add OECONF to avoid build-time checks for strcase[str|cmp], both of
>     which have been in glibc and musl for > 10 years so it's sensible t=
o
>     default to yes.
>
>
> Why do they fail I wonder

I dug a bit but wanted to get the package update in.

It's not a key package so whatever.


ALSO: I need to resend with a corrected subject line!

It's nano, not valkey - copy pasta!!!

v2 sent.

../Randy


>
>
>     Adjust the patches using devtool and manually munge the
>     Upstream-Status-es.
>
>     Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>     ---
>     =C2=A0.../recipes-support/nano/{nano_8.3.bb
>     <https://urldefense.com/v3/__http://nano_8.3.bb__;!!AjveYdw8EvQ!eIn=
icRMNhjFgfQKzcuSHuc1F7NDtnyYvxuxHuj-AFqBVGuBTHPt4zA8cD2SioWhdFiA-Tg7KKX3I=
naWue17a0g$>
>     =3D> nano_8.4.bb
>     <https://urldefense.com/v3/__http://nano_8.4.bb__;!!AjveYdw8EvQ!eIn=
icRMNhjFgfQKzcuSHuc1F7NDtnyYvxuxHuj-AFqBVGuBTHPt4zA8cD2SioWhdFiA-Tg7KKX3I=
naX6U5-bFQ$>}
>     =C2=A0 | 9 ++++++++-
>     =C2=A01 file changed, 8 insertions(+), 1 deletion(-)
>     =C2=A0rename meta-oe/recipes-support/nano/{nano_8.3.bb
>     <https://urldefense.com/v3/__http://nano_8.3.bb__;!!AjveYdw8EvQ!eIn=
icRMNhjFgfQKzcuSHuc1F7NDtnyYvxuxHuj-AFqBVGuBTHPt4zA8cD2SioWhdFiA-Tg7KKX3I=
naWue17a0g$>
>     =3D> nano_8.4.bb
>     <https://urldefense.com/v3/__http://nano_8.4.bb__;!!AjveYdw8EvQ!eIn=
icRMNhjFgfQKzcuSHuc1F7NDtnyYvxuxHuj-AFqBVGuBTHPt4zA8cD2SioWhdFiA-Tg7KKX3I=
naX6U5-bFQ$>}
>     (75%)
>
>     diff --git a/meta-oe/recipes-support/nano/nano_8.3.bb
>     <https://urldefense.com/v3/__http://nano_8.3.bb__;!!AjveYdw8EvQ!eIn=
icRMNhjFgfQKzcuSHuc1F7NDtnyYvxuxHuj-AFqBVGuBTHPt4zA8cD2SioWhdFiA-Tg7KKX3I=
naWue17a0g$>
>     b/meta-oe/recipes-support/nano/nano_8.4.bb
>     <https://urldefense.com/v3/__http://nano_8.4.bb__;!!AjveYdw8EvQ!eIn=
icRMNhjFgfQKzcuSHuc1F7NDtnyYvxuxHuj-AFqBVGuBTHPt4zA8cD2SioWhdFiA-Tg7KKX3I=
naX6U5-bFQ$>
>     similarity index 75%
>     rename from meta-oe/recipes-support/nano/nano_8.3.bb
>     <https://urldefense.com/v3/__http://nano_8.3.bb__;!!AjveYdw8EvQ!eIn=
icRMNhjFgfQKzcuSHuc1F7NDtnyYvxuxHuj-AFqBVGuBTHPt4zA8cD2SioWhdFiA-Tg7KKX3I=
naWue17a0g$>
>     rename to meta-oe/recipes-support/nano/nano_8.4.bb
>     <https://urldefense.com/v3/__http://nano_8.4.bb__;!!AjveYdw8EvQ!eIn=
icRMNhjFgfQKzcuSHuc1F7NDtnyYvxuxHuj-AFqBVGuBTHPt4zA8cD2SioWhdFiA-Tg7KKX3I=
naX6U5-bFQ$>
>     index d1af89ef8d..1aae49d3b6 100644
>     --- a/meta-oe/recipes-support/nano/nano_8.3.bb
>     <https://urldefense.com/v3/__http://nano_8.3.bb__;!!AjveYdw8EvQ!eIn=
icRMNhjFgfQKzcuSHuc1F7NDtnyYvxuxHuj-AFqBVGuBTHPt4zA8cD2SioWhdFiA-Tg7KKX3I=
naWue17a0g$>
>     +++ b/meta-oe/recipes-support/nano/nano_8.4.bb
>     <https://urldefense.com/v3/__http://nano_8.4.bb__;!!AjveYdw8EvQ!eIn=
icRMNhjFgfQKzcuSHuc1F7NDtnyYvxuxHuj-AFqBVGuBTHPt4zA8cD2SioWhdFiA-Tg7KKX3I=
naX6U5-bFQ$>
>     @@ -13,10 +13,17 @@ RDEPENDS:${PN} =3D "ncurses-terminfo-base"
>     =C2=A0PV_MAJOR =3D "${@d.getVar('PV').split('.')[0]}"
>
>     =C2=A0SRC_URI =3D
>     "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz
>     <https://urldefense.com/v3/__https://nano-editor.org/dist/v$*7BPV_M=
AJOR*7D/nano-$*7BPV*7D.tar.xz__;JSUlJQ!!AjveYdw8EvQ!eInicRMNhjFgfQKzcuSHu=
c1F7NDtnyYvxuxHuj-AFqBVGuBTHPt4zA8cD2SioWhdFiA-Tg7KKX3InaWZXassYg$>"
>     -SRC_URI[sha256sum] =3D
>     "551b717b2e28f7e90f749323686a1b5bbbd84cfa1390604d854a3ca3778f111e"
>     +SRC_URI[sha256sum] =3D
>     "5ad29222bbd55624d87ea677928b3106a743114d6c6f9b41f36c97be2a8e628d"
>
>     =C2=A0UPSTREAM_CHECK_URI =3D "https://ftp.gnu.org/gnu/nano
>     <https://urldefense.com/v3/__https://ftp.gnu.org/gnu/nano__;!!AjveY=
dw8EvQ!eInicRMNhjFgfQKzcuSHuc1F7NDtnyYvxuxHuj-AFqBVGuBTHPt4zA8cD2SioWhdFi=
A-Tg7KKX3InaWTSqt3UA$>"
>
>     =C2=A0inherit autotools gettext pkgconfig
>
>     +EXTRA_OECONF =3D " \
>     +=C2=A0 =C2=A0 ac_cv_func_strcasestr=3Dyes \
>     +=C2=A0 =C2=A0 gl_cv_func_strcasecmp_works=3Dyes \
>     +=C2=A0 =C2=A0 ac_cv_func_strcasecmp=3Dyes \
>     +"
>     +
>     +
>     =C2=A0PACKAGECONFIG[tiny] =3D "--enable-tiny,"
>     --=20
>     2.34.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#116546):
>     https://lists.openembedded.org/g/openembedded-devel/message/116546
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/message/116546__;!!AjveYdw8EvQ!eInicRMNhjFgfQKzcuSHuc1F7NDt=
nyYvxuxHuj-AFqBVGuBTHPt4zA8cD2SioWhdFiA-Tg7KKX3InaVcDBLDnQ$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/112047294/1997914
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1120=
47294/1997914__;!!AjveYdw8EvQ!eInicRMNhjFgfQKzcuSHuc1F7NDtnyYvxuxHuj-AFqB=
VGuBTHPt4zA8cD2SioWhdFiA-Tg7KKX3InaWAaXj1zA$>
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/unsub__;!!AjveYdw8EvQ!eInicRMNhjFgfQKzcuSHuc1F7NDtnyYvxuxHu=
j-AFqBVGuBTHPt4zA8cD2SioWhdFiA-Tg7KKX3InaXrmtBMTA$>
>     [raj.khem@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------nFkgyD6iCvWQGqBypPanUVOq
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 533N3SSK012582

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2025-04-03 5:03 p.m., Khem Raj
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1sqQBe535z056kEL6RSHqnaAgE=
LjTPRghwfQo_1N+UPkmw@mail.gmail.com">
     =20
      <div><br>
      </div>
      <div><br>
        <div class=3D"gmail_quote gmail_quote_container">
          <div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 3, 2025 at
            1:44=E2=80=AFPM Randy MacLeod via <a href=3D"https://urldefen=
se.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!eInicRMNhjFgfQK=
zcuSHuc1F7NDtnyYvxuxHuj-AFqBVGuBTHPt4zA8cD2SioWhdFiA-Tg7KKX3InaXjzbMJQg$"=
 moz-do-not-send=3D"true">lists.openembedded.org</a>
            &lt;randy.macleod=3D<a href=3D"mailto:windriver.com@lists.ope=
nembedded.org" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">w=
indriver.com@lists.openembedded.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">From:
            Randy MacLeod &lt;<a href=3D"mailto:Randy.MacLeod@windriver.c=
om" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-free=
text">Randy.MacLeod@windriver.com</a>&gt;<br>
            <br>
            Release notes:<br>
            &nbsp; &nbsp;<a href=3D"https://urldefense.com/v3/__https://g=
ithub.com/valkey-io/valkey/releases/tag/8.1.0__;!!AjveYdw8EvQ!eInicRMNhjF=
gfQKzcuSHuc1F7NDtnyYvxuxHuj-AFqBVGuBTHPt4zA8cD2SioWhdFiA-Tg7KKX3InaXjTQ4E=
YA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">https:=
//github.com/valkey-io/valkey/releases/tag/8.1.0</a><br>
            <br>
            The license file checksum changed because upstream added the
            line:<br>
            &nbsp; &nbsp;SPDX-License-Identifier: BSD-3-Clause<br>
            Add OECONF to avoid build-time checks for strcase[str|cmp],
            both of<br>
            which have been in glibc and musl for &gt; 10 years so it's
            sensible to<br>
            default to yes.</blockquote>
          <div dir=3D"auto"><br>
          </div>
          <div dir=3D"auto">Why do they fail I wonder <br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>I dug a bit but wanted to get the package update in.</p>
    <p>It's not a key package so whatever. <br>
    </p>
    <p><br>
    </p>
    <p>ALSO: I need to resend with a corrected subject line!</p>
    <p>It's nano, not valkey - copy pasta!!!<br>
      <br>
      v2 sent.<br>
    </p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1sqQBe535z056kEL6RSHqnaAgE=
LjTPRghwfQo_1N+UPkmw@mail.gmail.com">
      <div>
        <div class=3D"gmail_quote gmail_quote_container">
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
            <br>
            Adjust the patches using devtool and manually munge the
            Upstream-Status-es.<br>
            <br>
            Signed-off-by: Randy MacLeod &lt;<a href=3D"mailto:Randy.MacL=
eod@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"mo=
z-txt-link-freetext">Randy.MacLeod@windriver.com</a>&gt;<br>
            ---<br>
            &nbsp;.../recipes-support/nano/{<a href=3D"https://urldefense=
.com/v3/__http://nano_8.3.bb__;!!AjveYdw8EvQ!eInicRMNhjFgfQKzcuSHuc1F7NDt=
nyYvxuxHuj-AFqBVGuBTHPt4zA8cD2SioWhdFiA-Tg7KKX3InaWue17a0g$" rel=3D"noref=
errer" target=3D"_blank" moz-do-not-send=3D"true">nano_8.3.bb</a>
            =3D&gt; <a href=3D"https://urldefense.com/v3/__http://nano_8.=
4.bb__;!!AjveYdw8EvQ!eInicRMNhjFgfQKzcuSHuc1F7NDtnyYvxuxHuj-AFqBVGuBTHPt4=
zA8cD2SioWhdFiA-Tg7KKX3InaX6U5-bFQ$" rel=3D"noreferrer" target=3D"_blank"=
 moz-do-not-send=3D"true">nano_8.4.bb</a>}&nbsp;
            &nbsp; | 9 ++++++++-<br>
            &nbsp;1 file changed, 8 insertions(+), 1 deletion(-)<br>
            &nbsp;rename meta-oe/recipes-support/nano/{<a href=3D"https:/=
/urldefense.com/v3/__http://nano_8.3.bb__;!!AjveYdw8EvQ!eInicRMNhjFgfQKzc=
uSHuc1F7NDtnyYvxuxHuj-AFqBVGuBTHPt4zA8cD2SioWhdFiA-Tg7KKX3InaWue17a0g$" r=
el=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">nano_8.3.bb<=
/a>
            =3D&gt; <a href=3D"https://urldefense.com/v3/__http://nano_8.=
4.bb__;!!AjveYdw8EvQ!eInicRMNhjFgfQKzcuSHuc1F7NDtnyYvxuxHuj-AFqBVGuBTHPt4=
zA8cD2SioWhdFiA-Tg7KKX3InaX6U5-bFQ$" rel=3D"noreferrer" target=3D"_blank"=
 moz-do-not-send=3D"true">nano_8.4.bb</a>}
            (75%)<br>
            <br>
            diff --git a/meta-oe/recipes-support/nano/<a href=3D"https://=
urldefense.com/v3/__http://nano_8.3.bb__;!!AjveYdw8EvQ!eInicRMNhjFgfQKzcu=
SHuc1F7NDtnyYvxuxHuj-AFqBVGuBTHPt4zA8cD2SioWhdFiA-Tg7KKX3InaWue17a0g$" re=
l=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">nano_8.3.bb</=
a>
            b/meta-oe/recipes-support/nano/<a href=3D"https://urldefense.=
com/v3/__http://nano_8.4.bb__;!!AjveYdw8EvQ!eInicRMNhjFgfQKzcuSHuc1F7NDtn=
yYvxuxHuj-AFqBVGuBTHPt4zA8cD2SioWhdFiA-Tg7KKX3InaX6U5-bFQ$" rel=3D"norefe=
rrer" target=3D"_blank" moz-do-not-send=3D"true">nano_8.4.bb</a><br>
            similarity index 75%<br>
            rename from meta-oe/recipes-support/nano/<a href=3D"https://u=
rldefense.com/v3/__http://nano_8.3.bb__;!!AjveYdw8EvQ!eInicRMNhjFgfQKzcuS=
Huc1F7NDtnyYvxuxHuj-AFqBVGuBTHPt4zA8cD2SioWhdFiA-Tg7KKX3InaWue17a0g$" rel=
=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">nano_8.3.bb</a=
><br>
            rename to meta-oe/recipes-support/nano/<a href=3D"https://url=
defense.com/v3/__http://nano_8.4.bb__;!!AjveYdw8EvQ!eInicRMNhjFgfQKzcuSHu=
c1F7NDtnyYvxuxHuj-AFqBVGuBTHPt4zA8cD2SioWhdFiA-Tg7KKX3InaX6U5-bFQ$" rel=3D=
"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">nano_8.4.bb</a><b=
r>
            index d1af89ef8d..1aae49d3b6 100644<br>
            --- a/meta-oe/recipes-support/nano/<a href=3D"https://urldefe=
nse.com/v3/__http://nano_8.3.bb__;!!AjveYdw8EvQ!eInicRMNhjFgfQKzcuSHuc1F7=
NDtnyYvxuxHuj-AFqBVGuBTHPt4zA8cD2SioWhdFiA-Tg7KKX3InaWue17a0g$" rel=3D"no=
referrer" target=3D"_blank" moz-do-not-send=3D"true">nano_8.3.bb</a><br>
            +++ b/meta-oe/recipes-support/nano/<a href=3D"https://urldefe=
nse.com/v3/__http://nano_8.4.bb__;!!AjveYdw8EvQ!eInicRMNhjFgfQKzcuSHuc1F7=
NDtnyYvxuxHuj-AFqBVGuBTHPt4zA8cD2SioWhdFiA-Tg7KKX3InaX6U5-bFQ$" rel=3D"no=
referrer" target=3D"_blank" moz-do-not-send=3D"true">nano_8.4.bb</a><br>
            @@ -13,10 +13,17 @@ RDEPENDS:${PN} =3D &quot;ncurses-terminfo=
-base&quot;<br>
            &nbsp;PV_MAJOR =3D <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:${@d.getVar('PV').split('.')[0]}">&quot;${@d.getVar('PV').split('=
.')[0]}&quot;</a><br>
            <br>
            &nbsp;SRC_URI =3D &quot;<a href=3D"https://urldefense.com/v3/=
__https://nano-editor.org/dist/v$*7BPV_MAJOR*7D/nano-$*7BPV*7D.tar.xz__;J=
SUlJQ!!AjveYdw8EvQ!eInicRMNhjFgfQKzcuSHuc1F7NDtnyYvxuxHuj-AFqBVGuBTHPt4zA=
8cD2SioWhdFiA-Tg7KKX3InaWZXassYg$" rel=3D"noreferrer" target=3D"_blank" m=
oz-do-not-send=3D"true">https://nano-editor.org/dist/v${PV_MAJOR}/nano-${=
PV}.tar.xz</a>&quot;<br>
            -SRC_URI[sha256sum] =3D
            &quot;551b717b2e28f7e90f749323686a1b5bbbd84cfa1390604d854a3ca=
3778f111e&quot;<br>
            +SRC_URI[sha256sum] =3D
            &quot;5ad29222bbd55624d87ea677928b3106a743114d6c6f9b41f36c97b=
e2a8e628d&quot;<br>
            <br>
            &nbsp;UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://urldefe=
nse.com/v3/__https://ftp.gnu.org/gnu/nano__;!!AjveYdw8EvQ!eInicRMNhjFgfQK=
zcuSHuc1F7NDtnyYvxuxHuj-AFqBVGuBTHPt4zA8cD2SioWhdFiA-Tg7KKX3InaWTSqt3UA$"=
 rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">https://ft=
p.gnu.org/gnu/nano</a>&quot;<br>
            <br>
            &nbsp;inherit autotools gettext pkgconfig<br>
            <br>
            +EXTRA_OECONF =3D &quot; \<br>
            +&nbsp; &nbsp; ac_cv_func_strcasestr=3Dyes \<br>
            +&nbsp; &nbsp; gl_cv_func_strcasecmp_works=3Dyes \<br>
            +&nbsp; &nbsp; ac_cv_func_strcasecmp=3Dyes \<br>
            +&quot;<br>
            +<br>
            +<br>
            &nbsp;PACKAGECONFIG[tiny] =3D &quot;--enable-tiny,&quot;<br>
            -- <br>
            2.34.1<br>
            <br>
            <br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            Links: You receive all messages sent to this group.<br>
            View/Reply Online (#116546): <a href=3D"https://urldefense.co=
m/v3/__https://lists.openembedded.org/g/openembedded-devel/message/116546=
__;!!AjveYdw8EvQ!eInicRMNhjFgfQKzcuSHuc1F7NDtnyYvxuxHuj-AFqBVGuBTHPt4zA8c=
D2SioWhdFiA-Tg7KKX3InaVcDBLDnQ$" rel=3D"noreferrer" target=3D"_blank" moz=
-do-not-send=3D"true">https://lists.openembedded.org/g/openembedded-devel=
/message/116546</a><br>
            Mute This Topic: <a href=3D"https://urldefense.com/v3/__https=
://lists.openembedded.org/mt/112047294/1997914__;!!AjveYdw8EvQ!eInicRMNhj=
FgfQKzcuSHuc1F7NDtnyYvxuxHuj-AFqBVGuBTHPt4zA8cD2SioWhdFiA-Tg7KKX3InaWAaXj=
1zA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">https=
://lists.openembedded.org/mt/112047294/1997914</a><br>
            Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lis=
ts.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">openembed=
ded-devel+owner@lists.openembedded.org</a><br>
            Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://l=
ists.openembedded.org/g/openembedded-devel/unsub__;!!AjveYdw8EvQ!eInicRMN=
hjFgfQKzcuSHuc1F7NDtnyYvxuxHuj-AFqBVGuBTHPt4zA8cD2SioWhdFiA-Tg7KKX3InaXrm=
tBMTA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">htt=
ps://lists.openembedded.org/g/openembedded-devel/unsub</a>
            [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" moz-=
do-not-send=3D"true" class=3D"moz-txt-link-freetext">raj.khem@gmail.com</=
a>]<br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------nFkgyD6iCvWQGqBypPanUVOq--

