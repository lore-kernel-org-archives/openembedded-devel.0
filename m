Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B0CCDE000
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 14:10:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12160.1782396603985142735
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 07:10:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bpoF++vu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=06364edfb8=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PC1vun1210119
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 14:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=++mey6ohzQI4k1k2S/T0Zu
	45SKby4i6Kk8lUlGafBhI=; b=bpoF++vuq608qBxuH9SnbEOXRYK1HF1s/omI5J
	8XdAaCT9yjEcBO6UZkHcYRI03oq0orE4VVTZBzmdzYhIGHRCOs2c9XZbzwXOe9wE
	h0ysiA1vbv3RBHhWIJ0ntzZfyuwVCW4RHNVM7d1l0/3iaf4IgnKQgRB1DgmewRLh
	BNZ4qSbjtEyIEGmhMwq8UdV5KW81/xD/ujgXmNca088ffyCdzT/qH8W4dUCYAKnz
	dOq2N5ZuSwPWIfigPkfEyg54wgMKeel7/nqjHBVjHbGISC+PXBOFSgo3cnJzElN/
	LlRqbK4lPiHAu/KQ+B/lgHHjr9RxdMqcHelxKCOwykTesDWQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013058.outbound.protection.outlook.com [40.93.196.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f0t2c8rm2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 14:10:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y2myXMqT0vugWiKKVWWCHbY61vUViTJVdiolt7a4hh3bSgU0EWzKUqsOHw0csBDkegjJ/eGPzMSs14zFfT6nygFikoYW9RVKlp7QUXaakBWhH7YcA4Z1HohcetMkMOO0dIs7edEPzw8YIQsTXkRu/iBzY7qPKEQ+TL6mPg2vhLhmXOcvhLPU2sEXdQtr9RN9PhtcnW1CZ6aYZu231RLN8HwqX8KdVygnnAiWhfvtU0HHUGJsSm3GbanO6hw8Mcl1HEBneQhDU740pg9lN3giFoEZE770hnt0nUjE3JBTKb6Auhx9XmgaNMlt+vb88IXf1L5QigR8xcRXoWt98XZBmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++mey6ohzQI4k1k2S/T0Zu45SKby4i6Kk8lUlGafBhI=;
 b=LkatP15QIRcSUojYUCno5Ek5POawqxcbIwioFV7sVqZP/NbxfKRtnwJm/DZNmYKmjLgC4kpUry/cpRR/WHfoX8pxR3+Q7kIYNVy86dTnsjxcyyqb9QT4f6Kf6IssWepAfz0uWRoXywUhhKNecBRXnpw+Sp0LVknxr3ErAGYyqAqSyqam0sFKo7L4D5CUJSHyNUV6LIufsT3Rt2c+qfAf1yvDsUN4x1mSOGoMJTEaPBy+kJZhNk6N3AqC0WB/qQZ79bsAiEDjiTDxJ4Y2V5WYDuivoExLyzQUbec2jIorKx8uC0xxTf0uF61ca9yV37sc839gyl3F1O28CpkBBFzr+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by PH8PR11MB9950.namprd11.prod.outlook.com (2603:10b6:510:3d7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Thu, 25 Jun
 2026 14:10:00 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%4]) with mapi id 15.21.0159.012; Thu, 25 Jun 2026
 14:09:59 +0000
Content-Type: multipart/alternative;
 boundary="------------NBVGPiQ1wu9sxkIopXRaHxt6"
Message-ID: <ef52e2b5-5153-4f01-89f8-cc56b59481da@windriver.com>
Date: Thu, 25 Jun 2026 10:09:58 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-webserver][PATCH] meta-webserver/README.md: update broken
 Yocto reference manual URL
To: Sandeep J <Sandeep.J@windriver.com>,
        openembedded-devel@lists.openembedded.org
Cc: Shiva.Komati@windriver.com
References: <20260625045254.1841772-1-Sandeep.J@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20260625045254.1841772-1-Sandeep.J@windriver.com>
X-ClientProxiedBy: YT4PR01CA0249.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::16) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|PH8PR11MB9950:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ec76a49-1dee-4590-ab61-08ded2c37154
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|8096899003|13003099007|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	SUWk2LvsYcpJ7FhtVoEdOaWwsprShrblRBFqA35PaQcxPra284d5WtEQSreglJe6AanCMDuufap4HS4fhe1iS4M1XuEh3TG7OF2wRJd1KkIc42KQGML2lFknbP9p+59mdA4ZmNfcne5b8jrX1eDM+Fp7mDvNskFP/YD2V/eFe9nXgvPe2XKf1N25EgTmNTMYnG0NUqetvmQkLNG/ogtCpuQOUAujL1vefjkF0PhJ2wiwlrRRJf2Q0k4FEIlXYhtfmr/zYAb1dB2YONQOuI4PhyQjz3O7iDWZDjoRC8ejInD/a8UZPFY8jPvGXL6SCSA9dqx2N2NpmeRlgpghQ2BEeRxwuM4RVA/GbXF5lo3kbkH+iqs59dk2PUEdDsFa3/2kN3grpZonmFCh5wUbZFXYH4IWLDxKCG0p/hZYLEv7eHkWBxtlDeSlMzRyfRRwZ6H12m0kpWgAk0o8Ex8GHbI6X5YETu9LI7+bsIVaOXjRIo3onsbUp15050A2ebrPyeC7ZvB8/oyZnhfcrTE87y4BubrUCjxJ/m50mTlkWrTiPN5BCOLgnFxRGoaSd9wPYYRog9bsdZ2EtCcnuhxt5tDETnw2xFL8AQ4P3Q99RL9a+m6N0TlZ2lXzoXSL3FOMC1yz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(8096899003)(13003099007)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UFl3eG05RTRJVkhkNVhod0J5WXlxY1ZXV1RrS0tnV0FzTDJ5a3I1ZzQrSm4x?=
 =?utf-8?B?YUdSSGxJcWtVWjhmV254ZnpYbXlIRWNudndOVFh2VFpyRW1ZR215MTB2OHVT?=
 =?utf-8?B?Z0h2OWxhdlcvU2RsamZLY2YxVUU5RWo2MXM4YUk0aGhsNng0RkQrb1lUcDVw?=
 =?utf-8?B?cGhZcS9ObXdIdWUzdUpnZjN5WDhWZEExNytLR3ZTQ3g5dWpQbVB5U3lteWg4?=
 =?utf-8?B?WEdTTERGc2h5M1BTY2d4TFRBSm5nQk1VL3J6UExRaFd6MzkvNENIMmpUQUJs?=
 =?utf-8?B?b2FCaFBTenUxWC9obWVXYWVoRGs5T1d5VmY0Sk8rb2JTdDkzNkZKNEFLRkZH?=
 =?utf-8?B?c2RQY0tiNUVPS0xad240ZllyaEYvSG85UzdYNldlNnBCWVUxOEp2SlVGTmIv?=
 =?utf-8?B?bGZCRjFTc2RPeExQZ3dmM013a1dJMXNnQ1BGY1FGYVp3M0FvYUxYTTRjMWtU?=
 =?utf-8?B?OFFFeDF5NnJjL0FCWTFWdnF6V0F6THNWMW02S1NwT0M1Nlh2TnZXaDNxR1hX?=
 =?utf-8?B?dDBRdlJoeDFZZXQxczlWaXNUVGhwV3lBMzRCV0N4bW1nS3JrWlhEQnhLeDQz?=
 =?utf-8?B?ZDNpYStrMm5VaWV6ZjZjN2FHWGZWQ29NcmZULzFMRE5ocUlUbjFUL09raFlP?=
 =?utf-8?B?b3VRYm8vUENVV1YyYTFHVUxjemp5L3hkM2RjNG8xZjZIcm56bjBJa1ZraGFT?=
 =?utf-8?B?anlCMTZITGk2VU5yK2JkNDU2amU0NzY2dXErV1ByL1F1SU9YU0ZGQkN6WjVW?=
 =?utf-8?B?OUlBbytVdS9SQVpPclp6WER0S0tvc1dUZk9KTUtsNEh0a2dsNW1qU095cUph?=
 =?utf-8?B?OWlWVDNjdlljYk5DeWFob0U1TDc3UU9tTGw4cnp6SmxsUENWZU9JTy9IMDlw?=
 =?utf-8?B?dHRuY3dJQ1psMUwzTXc2Zys2eXFjUlFUMkhhazVBTU90ZjRUNlVMbW1hR2Jy?=
 =?utf-8?B?UDVMVEwreGFxZnVPTUNCZ2xMbzdzUnVCOGJIalJ5d0x5NXFOQ2s0dDFsYnV0?=
 =?utf-8?B?Vzh2K0xjUzBYaHdQRDJmWkR1Y0ZlUnAvbVFvekJtWU9SL3hxLy9naDFSRHhn?=
 =?utf-8?B?VDdZL3hXMGNvbEhoY2d5WEs3SUNJTFNtcW1sTFNpNkZyMTgwYytrN3B3TDht?=
 =?utf-8?B?VFA5ajdTRDhOZDVLVHI4dUlIalJxOTlwOEYyKzVjdGp0V3p3RGFTem9vOEtp?=
 =?utf-8?B?UmplZjR5dUdSU2trK0sxbjR2ekxoQllTdVpvay9weTVib3VpenZxYU5hSjZ4?=
 =?utf-8?B?QzAxVFRzY3BNWmJLUWU0ZUlJYi9ORC9lNktiNUluRlEzSm9jaytsYk5oTWRl?=
 =?utf-8?B?blozOW45QTRXZ1ord0Z0RXRPNUtxSlRRTnRmTmNDNHVkS0xyeXZlUmd4U3FH?=
 =?utf-8?B?QWYzN04yRWR2My9WbWpEQ1JtZDNKN2tENFZFcHNqdmEvRUVJbnJXRzZxZTFU?=
 =?utf-8?B?eXJ6RVlmVVBHbHljekJwVDhWYTFSZHIwV2V4eUFqWDJ2L0JEQXM3TWptY0RU?=
 =?utf-8?B?T3piVGlWSTQySDV0L3ZxKzk1N0JWa2IzMjBCdnlIeFZEYllXcXU5TEFVTnJy?=
 =?utf-8?B?bUg2elZpQldHYXBPUTdPdWdWKytnbXhKOTlxeDFrMGpUY1BHV1JzSTVkRWZK?=
 =?utf-8?B?eFZJbCtEMlF6elBwODhWeWRvcWNBM2Qyc0M0RS9VYUVnSmNwdXdzSGdSMWpt?=
 =?utf-8?B?ckpPMWJ3ckVFWE12Qnp6bkl4RjdUcEdubVFzN3ZuUFdHOFFialVBKy9OUDBE?=
 =?utf-8?B?aGhGYnRuNEhGOFJmRmFQNy8yK1VQSTJQZEJJSCsrNU1UQ045Q0duazB1S29u?=
 =?utf-8?B?RnMzV1ZHVXFQaGhVZGIxMUhqdFhjRlFwZCtyd2ljSjRVblBJOWdhaktYbFZt?=
 =?utf-8?B?aHd6SlhRSllJakdrN0x4UXY2UWw5OFh4RHhlS2VwYUl5UVc0VVNkY1E1ZUNo?=
 =?utf-8?B?RmxMWE5aeEs4NzUzbTdQeVNnMjBZUE5ET2djUE9ZVXFUckJySm1KVUpjY0U3?=
 =?utf-8?B?ZE5MTU5xUGt0R1JKWDMremZrN0taazlZRjRpZjlDV0VQUGF0WTMxTmVTdlRL?=
 =?utf-8?B?a1pHTzVpUkk4ZER3SEtGQ1l0dHFNNWcwZTRaTHoxNk5BcEdjQzhIakpaVnFD?=
 =?utf-8?B?c2RKVGMxbk1MYWdGK0t3MjY1eWlEV3N2bDk1cHpaaW4vRzRKRWp1VmpBdTZo?=
 =?utf-8?B?TTdmNkY1RER2NlljYlJZdGtkZVEzajdlZ2l2aUhNZWRlRG9hV1dWYmxmc0xv?=
 =?utf-8?B?aXh1MVdNWElmS09WTlFrQzZZSklxRE9nczk2WVRubkNDK3U3UEY0OE11RUJk?=
 =?utf-8?B?b3NvM1dGaVp4d05JNWtmMEJuZk5vdUx5VW1MRUxRUTlKdW1mSDNDQ3paNnl6?=
 =?utf-8?Q?okah0GbOyusiCTYM=3D?=
X-Exchange-RoutingPolicyChecked: 
	jjvGOz4WVZVLy6XbNXMyZqtqjNy5ks2YzZreSOj11p39BkG8r6iVmF7pqPTHYVwsTNozaBlbGfJ+5DaL2GtJjfE4MgJ5D1xkUJN9nAR6rT1hll2lDSRf3CuMcRg9ufNq234F5O176jAm/X/P72MZQHjFG6Wjdl8/IIcIjSyn+K7k0VC6mX2zA3FQfontq1PoBJpIQf1pfd0X6ygzOJg2AaH05sb1rnuWLW/rwU+7cqUV8xPSuwSZhraa14CmHCIF0ZRlkCfK7jCfJfyh2m27yKkfIvLC932DNpIyPgdS6nFlcyIoeebCUo9fKigFMvFyEpzbLkSqonITTNLz0UclQw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec76a49-1dee-4590-ab61-08ded2c37154
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 14:09:59.6839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0RVVzKjq1vi9XDSpdGQ0oHiWChdrMggJFKT5m4Bh7IM9x+L+DebEef401iJmkkevRpnAihjpRMaoN7VBprfnazWpY4Z+Gh9/R2Bi8mPxfgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9950
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEyMSBTYWx0ZWRfXzx7G4aYHVin2
 dJjP4FJb4HNDzeYtLBaHzqCHV82cYjTnVJnyDMqosOBdhACaCMn1s8Jf2E2UhajEr45kfoZKPLj
 +EAmXhr4OGYrVPgTh78IqSt7dz6G93kV57mCAN+1t81VdzdeH69ROa6BpsqW0esmfvcQEpbNZmZ
 shVrziCgXcrzbthsPmkS8cn8eViLSVoZ3eLUHFNDdgymHG8MysOarR0apIMrcvL6xEuabHONKEy
 Fh8bxqyHj6HEsrT+K9ydYIWDG1iI7xcELrqM8EHWvrQH0kx8vRvscQ8X4RrtpYoPa7/6fGOLcUo
 r/tOmYE6CybPjYn2zhGT9RUcdxg6F4CZtIQO9JBc9p1+kLqCRWxIb69hpL0leFbAfLb6qRCGw7Y
 BbAcVS76NuVcXxILtIz4mvBIrxY2DAhCId1eEiS5NVYf7iiHhC3GNSqhSItlZpTrSERMla/OUh6
 IcyGOgBMuLLAzctdXaw==
X-Proofpoint-GUID: e5ICaneds1TC2fSd5bdfKFXkokTm40vD
X-Proofpoint-ORIG-GUID: e5ICaneds1TC2fSd5bdfKFXkokTm40vD
X-Authority-Analysis: v=2.4 cv=U4Oiy+ru c=1 sm=1 tr=0 ts=6a3d36ba cx=c_pps
 a=5YU8ENXygJz5UkgxsLF+dA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=iGHA9ds3AAAA:8
 a=t7CeM3EgAAAA:8 a=9uCJK1MRF9m1_WvcIE4A:9 a=QEXdDO2ut3YA:10
 a=HPCHruN68qoECyIU7zUA:9 a=g4qSLyqsyf6Gepva:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEyMSBTYWx0ZWRfX1k7vZvFx3e1y
 YlztoVGUnUH+PxvCG0Z1B18EvQQ8v9DugKfWE/8ZyR+g3ThLH2aAvc7GiZ/UohGOAa2Y2TA7A8l
 4MEAuyVspw6vEkg52Z0NfOyzL5KVQJgcYgKtDqB2uY11kivbFneR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1011
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250121
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 14:10:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127781

--------------NBVGPiQ1wu9sxkIopXRaHxt6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-06-25 00:52, Sandeep J wrote:
> Update old URL:
>     http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-PACKAGECONFIG
> to:
>     https://docs.yoctoproject.org/ref-manual/variables.html#term-PACKAGECONFIG
>
> Signed-off-by: Sandeep J<Sandeep.J@windriver.com>
> ---
>   meta-webserver/README.md | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-webserver/README.md b/meta-webserver/README.md
> index 17c7c76d94..565269648d 100644
> --- a/meta-webserver/README.md
> +++ b/meta-webserver/README.md
> @@ -43,7 +43,7 @@
>     to the PACKAGECONFIG value for the php recipe in order to enable it.
>     See here for info on how to do that:
>   
> -http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-PACKAGECONFIG
> +https://docs.yoctoproject.org/ref-manual/variables.html#term-PACKAGECONFIG
>   
>   
>   Maintenance

Ship it.

-- 
# Randy MacLeod
# Wind River Linux

--------------NBVGPiQ1wu9sxkIopXRaHxt6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <head>

    
  </head>
  <body>
    <div class="moz-cite-prefix">On 2026-06-25 00:52, Sandeep J wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260625045254.1841772-1-Sandeep.J@windriver.com">
      <pre wrap="" class="moz-quote-pre">Update old URL:
   <a class="moz-txt-link-freetext" href="http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-PACKAGECONFIG">http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-PACKAGECONFIG</a>
to:
   <a class="moz-txt-link-freetext" href="https://docs.yoctoproject.org/ref-manual/variables.html#term-PACKAGECONFIG">https://docs.yoctoproject.org/ref-manual/variables.html#term-PACKAGECONFIG</a>

Signed-off-by: Sandeep J <a class="moz-txt-link-rfc2396E" href="mailto:Sandeep.J@windriver.com">&lt;Sandeep.J@windriver.com&gt;</a>
---
 meta-webserver/README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/README.md b/meta-webserver/README.md
index 17c7c76d94..565269648d 100644
--- a/meta-webserver/README.md
+++ b/meta-webserver/README.md
@@ -43,7 +43,7 @@
   to the PACKAGECONFIG value for the php recipe in order to enable it.
   See here for info on how to do that:
 
-  <a class="moz-txt-link-freetext" href="http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-PACKAGECONFIG">http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-PACKAGECONFIG</a>
+  <a class="moz-txt-link-freetext" href="https://docs.yoctoproject.org/ref-manual/variables.html#term-PACKAGECONFIG">https://docs.yoctoproject.org/ref-manual/variables.html#term-PACKAGECONFIG</a>
 
 
 Maintenance
</pre>
    </blockquote>
    <p>Ship it.</p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------NBVGPiQ1wu9sxkIopXRaHxt6--

