Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12092F36BA6
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 03:15:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.148408.1775790926951378930
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 20:15:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=SK4gCQDz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8560f89f52=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A0QMZE1428259
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 03:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=A+VK/zA1ntEciuOBN98dFf
	+URhdGDBTK136s0NzY0/Y=; b=SK4gCQDzeo9qB6GTOG4TMtRYKS12b8fx7hqzpu
	UAnu+Ju7/BEzQwFwnRZdnSDBQXzxe9NfH3svsCFJnexsvEHVd/nkpHGjkt9eyf6W
	nB7fGHlr0S56utZ7GMcGcvSEwcWRewOH3T/dhh8BVCueBIjKxvWdcr/c2oYfOQ91
	Sg+X7jxCBgoXvqwaclETIJWeCM0Yln3DcNE6fnkNeL1pYXObCaH+qL+etJwDwVIy
	ZURzrbwcbPsZyYsFYx97nFXBgg0XfJe1wW+Tz+kY8CxdFba/oP3aLsQ8tDOVZAYO
	d56EPU6s3ic/A9nrwf/hw2h/C4glro7RwAg0UtsBKyNcN0Lw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013058.outbound.protection.outlook.com [40.93.196.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrqn1rn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 10 Apr 2026 03:15:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WdbD2qp9KjPvfT//C/9UorBMvZ7xjL227xR3YZQrXNsW/Twt7ezjKtwYDDQMHPydCFxkuuyt3ACbtdx4Yj1jB5iDITBWhTJWed54ObOrgN61wGyJs8oUk/OkoVBUKisUFJ/IKn0v4T5Y2tZNM4NTVIT7kxZv6aOgd8fh2EYN7dqqeT/rzIF/KVIvF13DbkRlo46UIr3vJIR5A8y/2fTn2Q8oPUQZJiZ9JnxVKKGpVcBX4pKZC3QvQ1jhZxSaWgC3Y6N64pyXbuOVOeUFTorf5Oc8DPGwhyaFoe1lsMRHpNgYoImOCIICjduxeKVa917I6R3hEBwGH2FOe/RNLzXaxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+VK/zA1ntEciuOBN98dFf+URhdGDBTK136s0NzY0/Y=;
 b=jbCBTcHzGt2TPng2jnswe/7SfYWQePXdi6ziVALwOGMceNplE52aYEjorine/a3+w+YN/E6HhSEOh6ZyNUjUn+KQsK4FnGZqGwkgulkx9U1YeTgauVool/YGlvSRVPqYgZ6PMoOmcG8qsaxmci7o5ytHfKNrvreDJvoVovqkOtyI6ua64XR8wo45OU1ApoqQWZNeuOeIyCxf/mHJVf/ri0/T3qXpsrgurAYyfsNi2uz4oBCz2eZeCFZ7CBSuLIPpWkKKx/A7qEjtSoqDXICrdAsy5KsyNmN4yIrOEkwIVxdtvPIC6OvuPJcxIJzhuChbHiKLXj5KK26vsBiieMiZ/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by DS7PR11MB8854.namprd11.prod.outlook.com (2603:10b6:8:256::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.11; Fri, 10 Apr
 2026 03:15:23 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9769.017; Fri, 10 Apr 2026
 03:15:23 +0000
Content-Type: multipart/alternative;
 boundary="------------IaNNqIJPE46ybHSUGW8NHJZI"
Message-ID: <055fcf97-5a7e-4b91-a6b6-5d384d1f7784@windriver.com>
Date: Fri, 10 Apr 2026 11:15:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH] python3-pytest-codspeed: upgrade 3.0.0
 -> 4.3.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20260409103446.3079100-1-peng.zhang1.cn@windriver.com>
 <CAMKF1sqPxJ7dAP-pWc6tR3wozBFWp3+Av0w11basE146oeYV1Q@mail.gmail.com>
From: Peng Zhang <peng.zhang1.cn@windriver.com>
Content-Language: en-US
In-Reply-To: <CAMKF1sqPxJ7dAP-pWc6tR3wozBFWp3+Av0w11basE146oeYV1Q@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0188.apcprd04.prod.outlook.com
 (2603:1096:4:14::26) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|DS7PR11MB8854:EE_
X-MS-Office365-Filtering-Correlation-Id: 40af0693-1b4a-45c9-be72-08de96af6766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|4022899009|13003099007|8096899003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	cX03O2hA/2LzP8uq090v1JEQ7tgEWQ7AEBsbnkIT9wmZ1TviEnIZ8lSVsNTIZTv3ugNXk3thqIeHVRddJa3DQKeGzHBAN0eeTp3j1Nb3bP9CQSc1OBuNqErIaxp8xGNbdodaGDbb2av/fq9YvGN0tRrTLGmoOWvva9Df45WfgDIxliX4hRpc2JJO1zvxGHe9dL/8cW44lAvwFTsvBSEoM07IcN19JR3NS0cTRsfCzLD5UoG+PeppBREq3iIRuAVs5ryDX40s9+sB1z+yghwhNsqI/UZRiyDiiXOj8D3iXUxOJuQHDLh5dZhVAQYQKEgaq+Lbjqv2sLRPFBeXU2avnnmC1j/sQnCu4/d5AnqHUqklhBy8/OhPFqQI+qYgDEwkIKt+H0nwTF9KUPNXRM9FIH5tjc1JMTG1cz5KUqyQXxPtPsGN1nq3TKxQS5vu2FnyTV6uKpqiRctOF6hOX/TvOVaayrk31Gh1Wbae1Jh6UlTH8tDqFAtdJmCm+IVz7i/bpioXOUrNySV42+M9B0gSxn/xMRVXp/+5Hog+uq9rbNdz+6V21bI1KjzzXga9CyPTle/BdLEUpJgznyB7bXJqZRk2Oi84aYAzP0MMRmyrp+DxohNfP/MpFIAPj+itoNtoZhemxzVNilnI5gYXwpiXUpfhc5CMOOPjmX/jJpPvo9o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009)(13003099007)(8096899003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?amVGSnU4QUNDUjdPcHFCNmlDcmdRZFFWUTdLb2tHeml5MzZzMU5YRVYyUkxi?=
 =?utf-8?B?Nm1YWFRFQ1R0aUE1RmFPV3pOazkxQ3JxWnBZbytmSW5RWG9lOXVHdU52Wm50?=
 =?utf-8?B?RldvaE84MU5jVStVYWo2anptaTRsOE9oSzFpOHdZNmxFZWVhdE1kUzhFOW1i?=
 =?utf-8?B?WTAwTmNvZmtabEJUQzhFcjc5cWczUHZrdzBlT24zSE9yMENjWUgxNm9ENmwy?=
 =?utf-8?B?empDNkVONXFDYjNpUFplWGQ1SFVIRW5IWG12RXl5b0l0eW5LQjVyRDEreWt1?=
 =?utf-8?B?TUxSZko0MlY0Y0htSXUyU0tDb0RMOXpmY09ySzJDL3duNTB3MnIrQnlvYVVy?=
 =?utf-8?B?dXkwcWoxMnN2MXFpSndwZndXOEYzcTl5UXNaNDdMelA1cmF5Nk5lOFFGSm03?=
 =?utf-8?B?U3JPdmlPQ0JKRDU2TXRRZDJ6MHFYTUpmOXEvWnJFMngvNXVYK3BkZXYxWjdZ?=
 =?utf-8?B?Szh2Sk1JMmNaWWRGWU11RVdYSTNkZkJwVXZJZWpJTnVYSUx0aXJ0ZFFpSllO?=
 =?utf-8?B?VkV0amFtYlQ0WWFJdTVTSE1Va0VWYU8rdndORGlKTWVpTWtCL0Z4Y2xKODVo?=
 =?utf-8?B?Y0hKVlhxQ0V2MDU1Sjd3TWpET3U3d2pEWExEVEdrekx1T3BqS0prWEtPOHh0?=
 =?utf-8?B?dmt2elhhWGF4Qy95RXJ2K25KY2p0VzF3cGdoQ0poMVJWMGVqL2lUbFNoYzZh?=
 =?utf-8?B?QUVwUlRiV3QvY1pwZHJoSFJYbWlVUUw0dnU5a3dsNW4vaFhpNy81SCs3LzU5?=
 =?utf-8?B?YUZFRnZBdCtGZDVEc1FaRzhrYSs3ZkNKV2ErWHJkNUVidlFPQ2RQS2p6SDZh?=
 =?utf-8?B?d0xrRTYzK3VPa3F4UzJZRThZRjE5dkYwTEtWeGVMYmZXUmlWcU9YdGNHUWt6?=
 =?utf-8?B?M3gxemtjY1AvVmJMN2dTN0FwVW5hWGZnQ2FPK3gwMmdVaXdnaVV4dFgrZTJO?=
 =?utf-8?B?cHlSR09Xd2hETG9OSjVyZDJJUWFtWE4zWXNBb2JRbFQvdk9EVHp1SVZsSnRM?=
 =?utf-8?B?WEUzODhGSElpdnM2MEdJdHMwOGVxYkRtdjRWajBQTWJPcnZwN0ZPL1o4Ykpk?=
 =?utf-8?B?NnJMMlc1Wnp2M3BWUG9jRXhSTVhyWlh6ZSt6TGkzUUtkVW5ucEUvL05ZWXJ0?=
 =?utf-8?B?UW94WW96TWJOc09LTHNxZ0l0aUtuRzRsZG9heklaMlhGV1lWVnB4b2ZmSlA1?=
 =?utf-8?B?QnViOXBpL2VRYzhFOTZLQUgxSkJ3QjhLOVcreEZCaDFYOUhDK0Eydk1yNUFX?=
 =?utf-8?B?UTNSa1NHTUFhemJZOXZabG9oOEFkdzh2dERqRGR2cHlGcG1Yb2xxOS9yUThM?=
 =?utf-8?B?aUdCU3NTb3kyQk13aWRDSEhHb2dyTldzM0RJQkNJM01qTFd0VW4va1JucFMv?=
 =?utf-8?B?Q09vRkdTQ3ZwRUxHYzM4Qzh0cWV2OVdyUTdTdjd5YWgvTGlIYmxrMXhyWmdm?=
 =?utf-8?B?c205RU9vRU5iQjR0WG9PcC83cDdVSXByTFdvcmZUc2c5R2F5cXNVendzOUlQ?=
 =?utf-8?B?SlpES2FUMnBFdVlRSWtCTGpQV05Dazh5bnp4eTlZamZxVkU5NURyVENTZTJL?=
 =?utf-8?B?ajk0SHVaelhibXZic0hTbTkvUitXNmdmYWhDaU0raWRvYTRPYWErVDlYSjhJ?=
 =?utf-8?B?UGUrTXlhTXNlbE5mbGk1Y056alo2T1FwNEUrSGdDa1A0OVJCZ2VoWThOUDMw?=
 =?utf-8?B?c2dvUFg4Rjg0czNFSlllMFVPTzlBVUZ3N3hWWVlaOHBLbEdIV2FUNHpjRjdo?=
 =?utf-8?B?OFF4ZDJDbkFncnJYeEpCVTZGZVdOZjloZ1pHS1ZacjJTRUUzWG1Ob0JweVlW?=
 =?utf-8?B?bTc2enlXMDU5M0FOcHdKMGZQemJrWnlFU0plaDJCalRKRWc3TkxqbWhiek5q?=
 =?utf-8?B?bnR0Tzd3SW1ZNGNyMTFHVzEzZFQ5QjhBVzFIa09xUk5WUXJ2ZHN2ZVZvUVBH?=
 =?utf-8?B?bkZzM2Z2TG1PeVFjNFFwdzhaTTJLTXJPc0hpaGpYOXk0d0E1ZkNZanBpaG1S?=
 =?utf-8?B?NGo4akVLVU43blI0aFJ5UkF3UmkxVzAvcU1wTVM5a3piNEw5ZkRSL0VGTlpq?=
 =?utf-8?B?ai9NdFNveGVPd1FwTld6SmxhTjVST2hIWGtkNTBiTjRQdjhWZHFMRXh3SXc3?=
 =?utf-8?B?ajczVUVKcmc5TmFPZWVwdi9zNFc4VjRzd2J2K3VSck9QbGM5QVRMSFI0enU2?=
 =?utf-8?B?enBJZEJlNDc0T1YvenlERHcySnhxMjhHMWtxbFAyZlVHaFBjYnlUVHVIOHlp?=
 =?utf-8?B?bVBpYnFPR3ZSRzR0dHhMelFaRU1BejBuckMyNUJPWW1RbGxaR2JhYzF6VTlx?=
 =?utf-8?B?QWR5K3BGOXMyeEdQSzdmbEV6SUh3UCt0TVVhM1l5bjQyekJSUVRjMHN3VFZC?=
 =?utf-8?Q?cxdpLTHVQYLxtk90=3D?=
X-Exchange-RoutingPolicyChecked: 
	NPCjo218Pg9CtHFWQzonQB7FmOhiWGnFCVLh5EWdNW1vHMlstCLittZOej8yiiLFL7KCJv/Ul3GSDglZW++R9qvKdTnE/w2h1mW2cjAT4po1Brb3bP5DdKITKEWaJmU8Jf+BvpR1oQHgvxe+g28dUdcLmR4We287i5RRMYLMZ6e25jPZkjN8xAddaawYKji7Gt6bW4iYaDiDn1Dk/AwfLNBonXOwPriDDV0fLwtFZaC0tbBmvKI91k0MzSQa9lE6FhiCM0pzVSHefubXKt69IdfPY6+aFWruimK/geG2pG67vPc4l7bpZa3ub5NZq+xhy2GOxy63tQtvqWHC4RY74A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40af0693-1b4a-45c9-be72-08de96af6766
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 03:15:23.3259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+v6qOQJhxV/lpX/WcWkU54/1GLxc8jTnp8MvCPS+igUhq5zdP4YQIVmx38dCYH1XeS2Y7WAUydnyKFchztRLLFBDSjjFY6mBZCMejeHFNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8854
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=RPCD2Yi+ c=1 sm=1 tr=0 ts=69d86b4d cx=c_pps
 a=5YU8ENXygJz5UkgxsLF+dA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=Q4-j1AaZAAAA:8
 a=e_rVToSkAAAA:8 a=L27hKlPSAAAA:20 a=0zhiEtMHAAAA:8 a=yqlMzxAxAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=e9h48HxULIEk5eoM1_IA:9 a=lqcHg5cX4UMA:10
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=b73Bf4Gay2bj7im14DkA:9
 a=fo0JTEAiRfk5N7RZ:21 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=-apfV7JZ--ObHKUXg5fw:22 a=v7CeC1Rd8Ef7gCqLsajQ:22 a=LsaQmJBP5CD7zixGX6Do:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: 4rr5hg8ewrucGvMxQwBl-CKrZKEw51ec
X-Proofpoint-GUID: F4ySWOJrhy-eZ633shMfyjQCvWfZ1PZa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAyNyBTYWx0ZWRfXzQtFHQjzqpd3
 S08vdPJibCxN6PHRFgIJrL7F9a7+gh7OFfSdjhtv/CH/H6m+IBsKIjYVO+M93mzTmbSv7KoZ6nn
 XRuiHfNVfmKx1SGSiRLKhiFZhHYA11RaUvm3RWdtklHq0WBLJ+pGkK2GNHokGn4i8KSEbiC1jwp
 SJonecrSfBT0Jy7zZMBJhgsv1OBqlfibvMqidj1vT+uY5grQnSWbh43OTdGd07q59xlf+E7Ij92
 txNzNNmsrX9wCBm/Dq0xjUHd66tyN3JAZqJg97aeDkr1CUJPHl6qnzbOyHReO0qdOJRX/l4xHy1
 XqhLdBRvc8VGXRTbEKYyklrCJujsVyfg1RV5C00LK9j7ntlhJG50Qrz9lA91dArwLskRze3OSmS
 Bh8grkAL4AovJCuRr/LyTN+cn1AxmS5qGZKV3jmhgvqqgJLegARl+U+kLcit5pUzgzl+10znYA9
 2l5n3ZuwyC94aPD3uEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100027
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 03:15:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126211

--------------IaNNqIJPE46ybHSUGW8NHJZI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 63A0QMZE1428259


On 4/10/26 02:21, Khem Raj wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
>
> On Thu, Apr 9, 2026 at 3:35=E2=80=AFAM Zhang, Peng (Paul) (CN) via=20
> lists.openembedded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!Y93IzX9MCqigikKUdMsmIrKtu9GHDyPtK85VSdxtHq-8btpauB_FfpZvLMZytrcIFv3zm=
bVJ9xveaqV5LzPEgC6-$>=20
> <peng.zhang1.cn=20
> <https://urldefense.com/v3/__http://peng.zhang1.cn__;!!AjveYdw8EvQ!Y93I=
zX9MCqigikKUdMsmIrKtu9GHDyPtK85VSdxtHq-8btpauB_FfpZvLMZytrcIFv3zmbVJ9xvea=
qV5L9XCSEZA$>=3Dwindriver.com@lists.openembedded.org>=20
> wrote:
>
>     From: Zhang Peng <peng.zhang1.cn@windriver.com>
>
>     Add python3-cffi-native to DEPENDS since v4.0.0 introduced
>     CodSpeedHQ/instrument-hooks which uses cffi FFI bindings at
>     build time.
>
>     Changelog:
>     https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v4.3.0
>     <https://urldefense.com/v3/__https://github.com/CodSpeedHQ/pytest-c=
odspeed/releases/tag/v4.3.0__;!!AjveYdw8EvQ!Y93IzX9MCqigikKUdMsmIrKtu9GHD=
yPtK85VSdxtHq-8btpauB_FfpZvLMZytrcIFv3zmbVJ9xveaqV5L_QzfMJx$>
>     https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v4.2.0
>     <https://urldefense.com/v3/__https://github.com/CodSpeedHQ/pytest-c=
odspeed/releases/tag/v4.2.0__;!!AjveYdw8EvQ!Y93IzX9MCqigikKUdMsmIrKtu9GHD=
yPtK85VSdxtHq-8btpauB_FfpZvLMZytrcIFv3zmbVJ9xveaqV5LxSOBlIq$>
>     https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v4.1.1
>     <https://urldefense.com/v3/__https://github.com/CodSpeedHQ/pytest-c=
odspeed/releases/tag/v4.1.1__;!!AjveYdw8EvQ!Y93IzX9MCqigikKUdMsmIrKtu9GHD=
yPtK85VSdxtHq-8btpauB_FfpZvLMZytrcIFv3zmbVJ9xveaqV5L9DPCsWu$>
>     https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v4.1.0
>     <https://urldefense.com/v3/__https://github.com/CodSpeedHQ/pytest-c=
odspeed/releases/tag/v4.1.0__;!!AjveYdw8EvQ!Y93IzX9MCqigikKUdMsmIrKtu9GHD=
yPtK85VSdxtHq-8btpauB_FfpZvLMZytrcIFv3zmbVJ9xveaqV5LxXnEFjK$>
>     https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v4.0.0
>     <https://urldefense.com/v3/__https://github.com/CodSpeedHQ/pytest-c=
odspeed/releases/tag/v4.0.0__;!!AjveYdw8EvQ!Y93IzX9MCqigikKUdMsmIrKtu9GHD=
yPtK85VSdxtHq-8btpauB_FfpZvLMZytrcIFv3zmbVJ9xveaqV5L5eH3drR$>
>     https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v3.2.0
>     <https://urldefense.com/v3/__https://github.com/CodSpeedHQ/pytest-c=
odspeed/releases/tag/v3.2.0__;!!AjveYdw8EvQ!Y93IzX9MCqigikKUdMsmIrKtu9GHD=
yPtK85VSdxtHq-8btpauB_FfpZvLMZytrcIFv3zmbVJ9xveaqV5L6kbALYb$>
>     https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v3.1.2
>     <https://urldefense.com/v3/__https://github.com/CodSpeedHQ/pytest-c=
odspeed/releases/tag/v3.1.2__;!!AjveYdw8EvQ!Y93IzX9MCqigikKUdMsmIrKtu9GHD=
yPtK85VSdxtHq-8btpauB_FfpZvLMZytrcIFv3zmbVJ9xveaqV5L10P-0mL$>
>     https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v3.1.1
>     <https://urldefense.com/v3/__https://github.com/CodSpeedHQ/pytest-c=
odspeed/releases/tag/v3.1.1__;!!AjveYdw8EvQ!Y93IzX9MCqigikKUdMsmIrKtu9GHD=
yPtK85VSdxtHq-8btpauB_FfpZvLMZytrcIFv3zmbVJ9xveaqV5L3poBRYS$>
>     https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v3.1.0
>     <https://urldefense.com/v3/__https://github.com/CodSpeedHQ/pytest-c=
odspeed/releases/tag/v3.1.0__;!!AjveYdw8EvQ!Y93IzX9MCqigikKUdMsmIrKtu9GHD=
yPtK85VSdxtHq-8btpauB_FfpZvLMZytrcIFv3zmbVJ9xveaqV5L1X9sTQh$>
>
>     Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
>     ---
>     =C2=A0...est-codspeed_3.0.0.bb
>     <https://urldefense.com/v3/__http://est-codspeed_3.0.0.bb__;!!AjveY=
dw8EvQ!Y93IzX9MCqigikKUdMsmIrKtu9GHDyPtK85VSdxtHq-8btpauB_FfpZvLMZytrcIFv=
3zmbVJ9xveaqV5L76HcPgr$>
>     =3D> python3-pytest-codspeed_4.3.0.bb
>     <https://urldefense.com/v3/__http://python3-pytest-codspeed_4.3.0.b=
b__;!!AjveYdw8EvQ!Y93IzX9MCqigikKUdMsmIrKtu9GHDyPtK85VSdxtHq-8btpauB_FfpZ=
vLMZytrcIFv3zmbVJ9xveaqV5L_IjYnWy$>}
>     | 4 ++--
>     =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>     =C2=A0rename
>     meta-python/recipes-devtools/python/{python3-pytest-codspeed_3.0.0.=
bb
>     <https://urldefense.com/v3/__http://python3-pytest-codspeed_3.0.0.b=
b__;!!AjveYdw8EvQ!Y93IzX9MCqigikKUdMsmIrKtu9GHDyPtK85VSdxtHq-8btpauB_FfpZ=
vLMZytrcIFv3zmbVJ9xveaqV5L49GvIkj$>
>     =3D> python3-pytest-codspeed_4.3.0.bb
>     <https://urldefense.com/v3/__http://python3-pytest-codspeed_4.3.0.b=
b__;!!AjveYdw8EvQ!Y93IzX9MCqigikKUdMsmIrKtu9GHDyPtK85VSdxtHq-8btpauB_FfpZ=
vLMZytrcIFv3zmbVJ9xveaqV5L_IjYnWy$>}
>     (72%)
>
>     diff --git
>     a/meta-python/recipes-devtools/python/python3-pytest-codspeed_3.0.0=
.bb
>     <https://urldefense.com/v3/__http://python3-pytest-codspeed_3.0.0.b=
b__;!!AjveYdw8EvQ!Y93IzX9MCqigikKUdMsmIrKtu9GHDyPtK85VSdxtHq-8btpauB_FfpZ=
vLMZytrcIFv3zmbVJ9xveaqV5L49GvIkj$>
>     b/meta-python/recipes-devtools/python/python3-pytest-codspeed_4.3.0=
.bb
>     <https://urldefense.com/v3/__http://python3-pytest-codspeed_4.3.0.b=
b__;!!AjveYdw8EvQ!Y93IzX9MCqigikKUdMsmIrKtu9GHDyPtK85VSdxtHq-8btpauB_FfpZ=
vLMZytrcIFv3zmbVJ9xveaqV5L_IjYnWy$>
>     similarity index 72%
>     rename from
>     meta-python/recipes-devtools/python/python3-pytest-codspeed_3.0.0.b=
b
>     <https://urldefense.com/v3/__http://python3-pytest-codspeed_3.0.0.b=
b__;!!AjveYdw8EvQ!Y93IzX9MCqigikKUdMsmIrKtu9GHDyPtK85VSdxtHq-8btpauB_FfpZ=
vLMZytrcIFv3zmbVJ9xveaqV5L49GvIkj$>
>     rename to
>     meta-python/recipes-devtools/python/python3-pytest-codspeed_4.3.0.b=
b
>     <https://urldefense.com/v3/__http://python3-pytest-codspeed_4.3.0.b=
b__;!!AjveYdw8EvQ!Y93IzX9MCqigikKUdMsmIrKtu9GHDyPtK85VSdxtHq-8btpauB_FfpZ=
vLMZytrcIFv3zmbVJ9xveaqV5L_IjYnWy$>
>     index 0789e9f548..05c05e1048 100644
>     ---
>     a/meta-python/recipes-devtools/python/python3-pytest-codspeed_3.0.0=
.bb
>     <https://urldefense.com/v3/__http://python3-pytest-codspeed_3.0.0.b=
b__;!!AjveYdw8EvQ!Y93IzX9MCqigikKUdMsmIrKtu9GHDyPtK85VSdxtHq-8btpauB_FfpZ=
vLMZytrcIFv3zmbVJ9xveaqV5L49GvIkj$>
>     +++
>     b/meta-python/recipes-devtools/python/python3-pytest-codspeed_4.3.0=
.bb
>     <https://urldefense.com/v3/__http://python3-pytest-codspeed_4.3.0.b=
b__;!!AjveYdw8EvQ!Y93IzX9MCqigikKUdMsmIrKtu9GHDyPtK85VSdxtHq-8btpauB_FfpZ=
vLMZytrcIFv3zmbVJ9xveaqV5L_IjYnWy$>
>     @@ -3,8 +3,8 @@ HOMEPAGE =3D "https://codspeed.io/
>     <https://urldefense.com/v3/__https://codspeed.io/__;!!AjveYdw8EvQ!Y=
93IzX9MCqigikKUdMsmIrKtu9GHDyPtK85VSdxtHq-8btpauB_FfpZvLMZytrcIFv3zmbVJ9x=
veaqV5L8z989Mw$>"
>     =C2=A0LICENSE =3D "MIT"
>     =C2=A0LIC_FILES_CHKSUM =3D
>     "file://LICENSE;md5=3D2856cbe664e8843cd4fd4c1d1d85c2c3"
>
>     -DEPENDS =3D "python3-hatchling-native"
>     -SRC_URI[sha256sum] =3D
>     "c5b80100ea32dd44079bb2db298288763eb8fe859eafa1650a8711bd2c32fd06"
>     +DEPENDS =3D "python3-hatchling-native python3-cffi-native"
>
>
> its inheriting python_hatchling, which should automatically add=20
> python3-hatchling-native to DEPENDS. Remove
> it here.

v2 send, removed, thanks

//peng

>     +SRC_URI[sha256sum] =3D
>     "5230d9d65f39063a313ed1820df775166227ec5c20a1122968f85653d5efee48"
>
>     =C2=A0inherit pypi python_hatchling
>
>     --=20
>     2.34.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#126187):
>     https://lists.openembedded.org/g/openembedded-devel/message/126187
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/message/126187__;!!AjveYdw8EvQ!Y93IzX9MCqigikKUdMsmIrKtu9GH=
DyPtK85VSdxtHq-8btpauB_FfpZvLMZytrcIFv3zmbVJ9xveaqV5LybAfDQX$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/118739978/1997914
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1187=
39978/1997914__;!!AjveYdw8EvQ!Y93IzX9MCqigikKUdMsmIrKtu9GHDyPtK85VSdxtHq-=
8btpauB_FfpZvLMZytrcIFv3zmbVJ9xveaqV5L5IUoZYb$>
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/unsub__;!!AjveYdw8EvQ!Y93IzX9MCqigikKUdMsmIrKtu9GHDyPtK85VS=
dxtHq-8btpauB_FfpZvLMZytrcIFv3zmbVJ9xveaqV5L9bsFgzW$>
>     [raj.khem@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------IaNNqIJPE46ybHSUGW8NHJZI
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 63A0QMZE1428259

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 4/10/26 02:21, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1sqPxJ7dAP-pWc6tR3wozBFWp3=
+Av0w11basE146oeYV1Q@mail.gmail.com">
     =20
      <strong>
      </strong>
      <div style=3D"border:solid #9c6500 1pt;padding:2pt;background:#fcfc=
03"><strong><class=3D"msonormal" style=3D"line-height:11pt"><span style=3D=
"font-size:11pt;color:#000">CAUTION: This email
              comes from a non Wind River email account!</span></class=3D=
"msonormal"></strong><br>
        <class=3D"msonormal" style=3D"line-height:10pt3"><span style=3D"f=
ont-size:10pt;color:#000">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class=3D"msonormal"></div>
      <div>
        <div dir=3D"ltr">
          <div dir=3D"ltr"><br>
          </div>
          <br>
          <div class=3D"gmail_quote gmail_quote_container">
            <div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 9, 2026 at
              3:35=E2=80=AFAM Zhang, Peng (Paul) (CN) via
              <a href=3D"https://urldefense.com/v3/__http://lists.openemb=
edded.org__;!!AjveYdw8EvQ!Y93IzX9MCqigikKUdMsmIrKtu9GHDyPtK85VSdxtHq-8btp=
auB_FfpZvLMZytrcIFv3zmbVJ9xveaqV5LzPEgC6-$" moz-do-not-send=3D"true">
                lists.openembedded.org</a> &lt;<a href=3D"https://urldefe=
nse.com/v3/__http://peng.zhang1.cn__;!!AjveYdw8EvQ!Y93IzX9MCqigikKUdMsmIr=
Ktu9GHDyPtK85VSdxtHq-8btpauB_FfpZvLMZytrcIFv3zmbVJ9xveaqV5L9XCSEZA$" moz-=
do-not-send=3D"true">peng.zhang1.cn</a>=3D<a href=3D"mailto:windriver.com=
@lists.openembedded.org" moz-do-not-send=3D"true" class=3D"moz-txt-link-f=
reetext">windriver.com@lists.openembedded.org</a>&gt;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              From: Zhang Peng &lt;<a href=3D"mailto:peng.zhang1.cn@windr=
iver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-lin=
k-freetext">peng.zhang1.cn@windriver.com</a>&gt;<br>
              <br>
              Add python3-cffi-native to DEPENDS since v4.0.0 introduced<=
br>
              CodSpeedHQ/instrument-hooks which uses cffi FFI bindings
              at<br>
              build time.<br>
              <br>
              Changelog:<br>
              <a href=3D"https://urldefense.com/v3/__https://github.com/C=
odSpeedHQ/pytest-codspeed/releases/tag/v4.3.0__;!!AjveYdw8EvQ!Y93IzX9MCqi=
gikKUdMsmIrKtu9GHDyPtK85VSdxtHq-8btpauB_FfpZvLMZytrcIFv3zmbVJ9xveaqV5L_Qz=
fMJx$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">http=
s://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v4.3.0</a><br>
              <a href=3D"https://urldefense.com/v3/__https://github.com/C=
odSpeedHQ/pytest-codspeed/releases/tag/v4.2.0__;!!AjveYdw8EvQ!Y93IzX9MCqi=
gikKUdMsmIrKtu9GHDyPtK85VSdxtHq-8btpauB_FfpZvLMZytrcIFv3zmbVJ9xveaqV5LxSO=
BlIq$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">http=
s://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v4.2.0</a><br>
              <a href=3D"https://urldefense.com/v3/__https://github.com/C=
odSpeedHQ/pytest-codspeed/releases/tag/v4.1.1__;!!AjveYdw8EvQ!Y93IzX9MCqi=
gikKUdMsmIrKtu9GHDyPtK85VSdxtHq-8btpauB_FfpZvLMZytrcIFv3zmbVJ9xveaqV5L9DP=
CsWu$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">http=
s://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v4.1.1</a><br>
              <a href=3D"https://urldefense.com/v3/__https://github.com/C=
odSpeedHQ/pytest-codspeed/releases/tag/v4.1.0__;!!AjveYdw8EvQ!Y93IzX9MCqi=
gikKUdMsmIrKtu9GHDyPtK85VSdxtHq-8btpauB_FfpZvLMZytrcIFv3zmbVJ9xveaqV5LxXn=
EFjK$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">http=
s://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v4.1.0</a><br>
              <a href=3D"https://urldefense.com/v3/__https://github.com/C=
odSpeedHQ/pytest-codspeed/releases/tag/v4.0.0__;!!AjveYdw8EvQ!Y93IzX9MCqi=
gikKUdMsmIrKtu9GHDyPtK85VSdxtHq-8btpauB_FfpZvLMZytrcIFv3zmbVJ9xveaqV5L5eH=
3drR$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">http=
s://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v4.0.0</a><br>
              <a href=3D"https://urldefense.com/v3/__https://github.com/C=
odSpeedHQ/pytest-codspeed/releases/tag/v3.2.0__;!!AjveYdw8EvQ!Y93IzX9MCqi=
gikKUdMsmIrKtu9GHDyPtK85VSdxtHq-8btpauB_FfpZvLMZytrcIFv3zmbVJ9xveaqV5L6kb=
ALYb$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">http=
s://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v3.2.0</a><br>
              <a href=3D"https://urldefense.com/v3/__https://github.com/C=
odSpeedHQ/pytest-codspeed/releases/tag/v3.1.2__;!!AjveYdw8EvQ!Y93IzX9MCqi=
gikKUdMsmIrKtu9GHDyPtK85VSdxtHq-8btpauB_FfpZvLMZytrcIFv3zmbVJ9xveaqV5L10P=
-0mL$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">http=
s://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v3.1.2</a><br>
              <a href=3D"https://urldefense.com/v3/__https://github.com/C=
odSpeedHQ/pytest-codspeed/releases/tag/v3.1.1__;!!AjveYdw8EvQ!Y93IzX9MCqi=
gikKUdMsmIrKtu9GHDyPtK85VSdxtHq-8btpauB_FfpZvLMZytrcIFv3zmbVJ9xveaqV5L3po=
BRYS$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">http=
s://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v3.1.1</a><br>
              <a href=3D"https://urldefense.com/v3/__https://github.com/C=
odSpeedHQ/pytest-codspeed/releases/tag/v3.1.0__;!!AjveYdw8EvQ!Y93IzX9MCqi=
gikKUdMsmIrKtu9GHDyPtK85VSdxtHq-8btpauB_FfpZvLMZytrcIFv3zmbVJ9xveaqV5L1X9=
sTQh$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">http=
s://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v3.1.0</a><br>
              <br>
              Signed-off-by: Zhang Peng &lt;<a href=3D"mailto:peng.zhang1=
.cn@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"mo=
z-txt-link-freetext">peng.zhang1.cn@windriver.com</a>&gt;<br>
              ---<br>
              &nbsp;...<a href=3D"https://urldefense.com/v3/__http://est-=
codspeed_3.0.0.bb__;!!AjveYdw8EvQ!Y93IzX9MCqigikKUdMsmIrKtu9GHDyPtK85VSdx=
tHq-8btpauB_FfpZvLMZytrcIFv3zmbVJ9xveaqV5L76HcPgr$" rel=3D"noreferrer" ta=
rget=3D"_blank" moz-do-not-send=3D"true">est-codspeed_3.0.0.bb</a>
              =3D&gt;
              <a href=3D"https://urldefense.com/v3/__http://python3-pytes=
t-codspeed_4.3.0.bb__;!!AjveYdw8EvQ!Y93IzX9MCqigikKUdMsmIrKtu9GHDyPtK85VS=
dxtHq-8btpauB_FfpZvLMZytrcIFv3zmbVJ9xveaqV5L_IjYnWy$" rel=3D"noreferrer" =
target=3D"_blank" moz-do-not-send=3D"true">
                python3-pytest-codspeed_4.3.0.bb</a>} | 4 ++--<br>
              &nbsp;1 file changed, 2 insertions(+), 2 deletions(-)<br>
              &nbsp;rename meta-python/recipes-devtools/python/{<a href=3D=
"https://urldefense.com/v3/__http://python3-pytest-codspeed_3.0.0.bb__;!!=
AjveYdw8EvQ!Y93IzX9MCqigikKUdMsmIrKtu9GHDyPtK85VSdxtHq-8btpauB_FfpZvLMZyt=
rcIFv3zmbVJ9xveaqV5L49GvIkj$" rel=3D"noreferrer" target=3D"_blank" moz-do=
-not-send=3D"true">python3-pytest-codspeed_3.0.0.bb</a>
              =3D&gt; <a href=3D"https://urldefense.com/v3/__http://pytho=
n3-pytest-codspeed_4.3.0.bb__;!!AjveYdw8EvQ!Y93IzX9MCqigikKUdMsmIrKtu9GHD=
yPtK85VSdxtHq-8btpauB_FfpZvLMZytrcIFv3zmbVJ9xveaqV5L_IjYnWy$" rel=3D"nore=
ferrer" target=3D"_blank" moz-do-not-send=3D"true">
                python3-pytest-codspeed_4.3.0.bb</a>} (72%)<br>
              <br>
              diff --git a/meta-python/recipes-devtools/python/<a href=3D=
"https://urldefense.com/v3/__http://python3-pytest-codspeed_3.0.0.bb__;!!=
AjveYdw8EvQ!Y93IzX9MCqigikKUdMsmIrKtu9GHDyPtK85VSdxtHq-8btpauB_FfpZvLMZyt=
rcIFv3zmbVJ9xveaqV5L49GvIkj$" rel=3D"noreferrer" target=3D"_blank" moz-do=
-not-send=3D"true">python3-pytest-codspeed_3.0.0.bb</a>
              b/meta-python/recipes-devtools/python/<a href=3D"https://ur=
ldefense.com/v3/__http://python3-pytest-codspeed_4.3.0.bb__;!!AjveYdw8EvQ=
!Y93IzX9MCqigikKUdMsmIrKtu9GHDyPtK85VSdxtHq-8btpauB_FfpZvLMZytrcIFv3zmbVJ=
9xveaqV5L_IjYnWy$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true">python3-pytest-codspeed_4.3.0.bb</a><br>
              similarity index 72%<br>
              rename from meta-python/recipes-devtools/python/<a href=3D"=
https://urldefense.com/v3/__http://python3-pytest-codspeed_3.0.0.bb__;!!A=
jveYdw8EvQ!Y93IzX9MCqigikKUdMsmIrKtu9GHDyPtK85VSdxtHq-8btpauB_FfpZvLMZytr=
cIFv3zmbVJ9xveaqV5L49GvIkj$" rel=3D"noreferrer" target=3D"_blank" moz-do-=
not-send=3D"true">python3-pytest-codspeed_3.0.0.bb</a><br>
              rename to meta-python/recipes-devtools/python/<a href=3D"ht=
tps://urldefense.com/v3/__http://python3-pytest-codspeed_4.3.0.bb__;!!Ajv=
eYdw8EvQ!Y93IzX9MCqigikKUdMsmIrKtu9GHDyPtK85VSdxtHq-8btpauB_FfpZvLMZytrcI=
Fv3zmbVJ9xveaqV5L_IjYnWy$" rel=3D"noreferrer" target=3D"_blank" moz-do-no=
t-send=3D"true">python3-pytest-codspeed_4.3.0.bb</a><br>
              index 0789e9f548..05c05e1048 100644<br>
              --- a/meta-python/recipes-devtools/python/<a href=3D"https:=
//urldefense.com/v3/__http://python3-pytest-codspeed_3.0.0.bb__;!!AjveYdw=
8EvQ!Y93IzX9MCqigikKUdMsmIrKtu9GHDyPtK85VSdxtHq-8btpauB_FfpZvLMZytrcIFv3z=
mbVJ9xveaqV5L49GvIkj$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-se=
nd=3D"true">python3-pytest-codspeed_3.0.0.bb</a><br>
              +++ b/meta-python/recipes-devtools/python/<a href=3D"https:=
//urldefense.com/v3/__http://python3-pytest-codspeed_4.3.0.bb__;!!AjveYdw=
8EvQ!Y93IzX9MCqigikKUdMsmIrKtu9GHDyPtK85VSdxtHq-8btpauB_FfpZvLMZytrcIFv3z=
mbVJ9xveaqV5L_IjYnWy$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-se=
nd=3D"true">python3-pytest-codspeed_4.3.0.bb</a><br>
              @@ -3,8 +3,8 @@ HOMEPAGE =3D &quot;<a href=3D"https://urlde=
fense.com/v3/__https://codspeed.io/__;!!AjveYdw8EvQ!Y93IzX9MCqigikKUdMsmI=
rKtu9GHDyPtK85VSdxtHq-8btpauB_FfpZvLMZytrcIFv3zmbVJ9xveaqV5L8z989Mw$" rel=
=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">https://codspe=
ed.io/</a>&quot;<br>
              &nbsp;LICENSE =3D &quot;MIT&quot;<br>
              &nbsp;LIC_FILES_CHKSUM =3D
              <a class=3D"moz-txt-link-rfc2396E" href=3D"file://LICENSE;m=
d5=3D2856cbe664e8843cd4fd4c1d1d85c2c3">&quot;file://LICENSE;md5=3D2856cbe=
664e8843cd4fd4c1d1d85c2c3&quot;</a><br>
              <br>
              -DEPENDS =3D &quot;python3-hatchling-native&quot;<br>
              -SRC_URI[sha256sum] =3D
              &quot;c5b80100ea32dd44079bb2db298288763eb8fe859eafa1650a871=
1bd2c32fd06&quot;<br>
              +DEPENDS =3D &quot;python3-hatchling-native python3-cffi-na=
tive&quot;<br>
            </blockquote>
            <div><br>
            </div>
            <div>its inheriting python_hatchling, which should
              automatically add python3-hatchling-native to DEPENDS.
              Remove</div>
            <div>it here.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>v2 send, removed, thanks</p>
    <p>//peng</p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1sqPxJ7dAP-pWc6tR3wozBFWp3=
+Av0w11basE146oeYV1Q@mail.gmail.com">
      <div>
        <div dir=3D"ltr">
          <div class=3D"gmail_quote gmail_quote_container">
            <div>&nbsp;</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              +SRC_URI[sha256sum] =3D
              &quot;5230d9d65f39063a313ed1820df775166227ec5c20a1122968f85=
653d5efee48&quot;<br>
              <br>
              &nbsp;inherit pypi python_hatchling<br>
              <br>
              -- <br>
              2.34.1<br>
              <br>
              <br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              Links: You receive all messages sent to this group.<br>
              View/Reply Online (#126187): <a href=3D"https://urldefense.=
com/v3/__https://lists.openembedded.org/g/openembedded-devel/message/1261=
87__;!!AjveYdw8EvQ!Y93IzX9MCqigikKUdMsmIrKtu9GHDyPtK85VSdxtHq-8btpauB_Ffp=
ZvLMZytrcIFv3zmbVJ9xveaqV5LybAfDQX$" rel=3D"noreferrer" target=3D"_blank"=
 moz-do-not-send=3D"true">
https://lists.openembedded.org/g/openembedded-devel/message/126187</a><br=
>
              Mute This Topic: <a href=3D"https://urldefense.com/v3/__htt=
ps://lists.openembedded.org/mt/118739978/1997914__;!!AjveYdw8EvQ!Y93IzX9M=
CqigikKUdMsmIrKtu9GHDyPtK85VSdxtHq-8btpauB_FfpZvLMZytrcIFv3zmbVJ9xveaqV5L=
5IUoZYb$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">
                https://lists.openembedded.org/mt/118739978/1997914</a><b=
r>
              Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@l=
ists.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">
                openembedded-devel+owner@lists.openembedded.org</a><br>
              Unsubscribe: <a href=3D"https://urldefense.com/v3/__https:/=
/lists.openembedded.org/g/openembedded-devel/unsub__;!!AjveYdw8EvQ!Y93IzX=
9MCqigikKUdMsmIrKtu9GHDyPtK85VSdxtHq-8btpauB_FfpZvLMZytrcIFv3zmbVJ9xveaqV=
5L9bsFgzW$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D=
"mailto:raj.khem@gmail.com" target=3D"_blank" moz-do-not-send=3D"true" cl=
ass=3D"moz-txt-link-freetext">raj.khem@gmail.com</a>]<br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              <br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------IaNNqIJPE46ybHSUGW8NHJZI--

