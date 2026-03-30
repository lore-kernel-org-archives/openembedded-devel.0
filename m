Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E37FC981D
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 08:49:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47038.1774860539400379531
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 01:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=KAek89mV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8549bf16ac=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U602up3899474
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 08:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=YkitL77uUZsG9Gv8goNtzu
	VefS2T6hHVp8JXu7bqS78=; b=KAek89mVrn1IRyZIT2cU9SEQGjhsANK18hEqjh
	MVP4svefS7OirTEb4dY+SAx2u2xoeWmz2lNrbXls2tvN5xfWI+/nFQ+N5uC04H3W
	zEoTixRvMXCHRtQwNPe2dLFskJZa1EKBmlldSlXhuquj7pCvKlnnbiQl9RB9duRQ
	c0IjK59dne0sRLAB0JNVKChUjJEVzww8sGR0XINHP+ePMmrg+pElx0811LUutw1o
	05GCjjJ48KqbHQ/QFADTLaTbETcv6ImwCdrbcuDxANFGSM0YnUqRNkazG0m9Lc78
	yoYWqfoifoJW8oN1aRHwQbFrRwD11cLVVVO9NMleZcnRH97g==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010005.outbound.protection.outlook.com [52.101.85.5])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d646vsw0u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 30 Mar 2026 08:48:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XCi0R5WKPTCMBb7bRZAy9cXhqgGiaBPy25VVV1wON4DMO6zVnocmgXIIngoxloWJqvb5GRHP77lMqkIi74d19wSEfcNDXNxLBU3uBcknybltQc/E4RssJilQAvQE/fXvr8CsBt4Ma0qOUixVdLCIZNd8PiAWfDDgAQHfmCoOR6ufKL3WA/cAKNKz90GFI8nvx+oWY1ZCVkhGB+ip9K/d2BSci2eypdaFDsF/PYmpqXurvGmjPwDLDnNbVcKONkT44eoo5kvC3FmLvejEeMnDR+v4NRGExbkWAAppEoX4jUIxpqTMv9OlmZlbT+7x7R6cDiHRfOXkzAUPCXu+OCb8Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YkitL77uUZsG9Gv8goNtzuVefS2T6hHVp8JXu7bqS78=;
 b=IuDoEZz4w3GiQzJkYQLKFS5aQjy16xBs8o5JhfphevsOh5iHcwIqAWTkmyIE2HszLlaV24dZ10P5Vg8zelQ+29w8ep8/UqprJAmTwlvpvnbdOYr8PSMywQM+0BGPVnkX+2fNn0TDuXI1K0Qini6Sa3veA+dduD6bqVlhpk1flN1njOx2SwXarKeHKehV+B1sWrEr8GNpuj9LCNNY3ulT4Pp4BgS5WDvvsNuhrCpjWiJq3JuD/aygw9LdKyGQn0sz3S+5RIK3Oq2hNHUCpceFCM7jt152eRM6sK3exrk+DCGgAjYdHMygwfI77KAG2u+n7i7YL3CsTDr8kpZs007oAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by IA1PR11MB7270.namprd11.prod.outlook.com (2603:10b6:208:42a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 08:48:53 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 08:48:53 +0000
Content-Type: multipart/alternative;
 boundary="------------UyOBVZKVi0m0grYDjleVBXW0"
Message-ID: <e694c6b1-f689-46c8-833f-24ca3aa09374@windriver.com>
Date: Mon, 30 Mar 2026 16:48:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 4/4] libsoup-2.4: remove deprecated recipe
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        openembedded-devel@lists.openembedded.org,
        Khem Raj <raj.khem@gmail.com>
References: <20260330063145.94013-1-changqing.li@windriver.com>
 <20260330063145.94013-4-changqing.li@windriver.com>
 <5fccef59-b730-4b5e-a366-89196d5e326b@gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <5fccef59-b730-4b5e-a366-89196d5e326b@gmail.com>
X-ClientProxiedBy: SL2P216CA0088.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2::21) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|IA1PR11MB7270:EE_
X-MS-Office365-Filtering-Correlation-Id: dc91bf2f-4605-4bee-d513-08de8e392b5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|366016|1800799024|22082099003|56012099003|18002099003|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	mE0UPnzjwB53EvWBrK+M1DjMfhRHCCjGi0dpKqzj76cu81GctG+z69dBoSyNUFKrRNW2paXv5XXHjfXL6eIuTFusIDw5SFZWpT1HGHcg3wz6pMvBe5Zve+7tS3urvI8CnbF4ImhKBq7YgLwW2Js41V++v8qKdV9WDhDg0uYPQlo+6tYJyqVxJ2F/XZzrB+RUj8D91rGqYjnxlFCTMx+WVe8RmJ1dLxyztnuyjuuVyIHj/RgByubKPiynxHnu+9rNo4p+xW9dusR2S0LOH1lJfn61ct7YPyWJb0FtsSIz/MO8NRzgVwCuWX1iRejY6f6usQraE3o2jA69uNH/JXwgc4TkFPeNg/U6v9bB7OvfLvSvBiUORSjkDrvNrSl8xhwrn0FRe/oLIxLbquRCoWEdOMezTq+O/YIhwLaKma1yYrzvqM3jFHgTCpgVeWWr5U03C0M+DdoZcC9GwFM4fYFKY/RmPrNSX4M8DYDiyEwCVswjYBKyhKy9O89/JIAjpPUyO8WhbBTPRRn+k8Zs2XFzxBe4fydayscjll6eBNA3kS8IfFEqxjEtYJwiSZm5Z1c+L2kYTQvopgD9QhujxpgXPAymHpZ2tQBXf0CYBcr1xATdS2nf4dRBonqMK8nOIA6ZF5riOih6mf/arxzYjK3uaf3QiU1uXu/EH9Q2DMfglW5i34XOWpA1AgInKc3Jjo1w
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YjdPdDlMT096WDRHaTg3RDZ1QVIzNnFFc1dZN2VZYXhsUnhpMHRZQjRNTEJX?=
 =?utf-8?B?NkE4SmYzL2IxcXlkc0syekN1UzNreDJ6T0d2K1dlVHdSSEJvQmFaTVc3eXBt?=
 =?utf-8?B?Ny9nRlZGeFNIc0NDb0IvN25hbk5FanpTL0RjOGR1VERJd2EwWjc3TnZtNEk5?=
 =?utf-8?B?d1Q0VlZzTWluK0gybTZWU3k3OVM3cXNMTERtalUraDluYkdYN01yRHlCSGJp?=
 =?utf-8?B?UkJ2aEFaUnN0Ni9LWGlJUUliNlVwcGRZSzJNSTcrOSsyc1p6T3JUZXp2NzBl?=
 =?utf-8?B?RHc0d2dTM1hKUUwzbGRHVDc3VnFqb2xmUDE5RW1CVmlldkZabXNDMWt2QjBs?=
 =?utf-8?B?dndtdzk5ZzZCZ21waXlQOVJ4RDdFMlNEbEhXQzM0ZUJZZDRFc2x1dktxSm15?=
 =?utf-8?B?Q3ZtV1c5RmREYmFNdjAxOENUaWJaMlZFcWo5Z1FKRlZ4YjBWTjB5VVVQTUov?=
 =?utf-8?B?NGxMTFN1eGRkeENHRmU3KzFVY2h1TzcyMXgramIzQTlSaXg0YXhWRzI3VVQz?=
 =?utf-8?B?YzNacGlHUkpQNXY2R2RjOWUrMHAyeDVSWUFuTFlrNjBjMytMQkFpczRMaUxo?=
 =?utf-8?B?NXo2V2ZTU3cwOG5BS3JhQ0d5WHg0eHdEVUJQcXQ1SHN4L3pZTU5GelNLbUJ4?=
 =?utf-8?B?Tm94b1NrWG1ESytCRmEwVlNYY1QzQkRBbWJ6cnFGK3RSQmEwRVFTZWFiMkR6?=
 =?utf-8?B?bGJkaHlSWWd2cmRVeHJPNzF4MVdVRUNNRG1TbEdUaVlXeTNoNTR1V3hKTzlB?=
 =?utf-8?B?aWNGc1Q2M2VJajNwbHpRUVBTc3YrWHVPR2FQVnhaNWxTNXVpUmtKbkdyN1Bq?=
 =?utf-8?B?VithaVJpL2l2cWQ1WmxtazFmeWd5b1NwL3dLUk91cGJqWGFBR1NwSkhQNmRG?=
 =?utf-8?B?amRCREdBV0pzYnp1ank2aWFZa1Z1ckpiblNJdW1HRFdaYjJBc2c5ZlkzaXZx?=
 =?utf-8?B?Sk9CL2prOXhBMFBkbU5QYVZZWmYzRVc3b1VDekEwZU1XSFc0SVM2eUVodVFj?=
 =?utf-8?B?R1UvbkNUWkdUbFFJbzZOQmlnaklEYXg3Q2dRUE9ZVWJHK1lvbkJaczJraWFO?=
 =?utf-8?B?ZWMrdERkdkJHa2QxOVBscTQ2aGhmUCtzMXU2WkNGT1R3Zk1vR0ZNRythS0tV?=
 =?utf-8?B?UjByaWtxdkVzR2pYRDFNYkIrL0k2VlhlbU83cE1jTDAwRTE1QmNnNTk1V2NN?=
 =?utf-8?B?V1Y3WnAxUnE3bTd6dGtOR04yY25OYWpNOWhaK3lpSFZ4cHVlRVJFWVRiSG5j?=
 =?utf-8?B?QjRzRnpNRnBwalgrMVpWUWNBdGhFSXhUZlZxQzFxdEhLTVA3OEZFRE96a0lM?=
 =?utf-8?B?VWJpTHBMMEpVRXVVN0Z2TVI3LzVmL0J4eElEdU1sTFFwNmpwNzlnYW5KNVMw?=
 =?utf-8?B?eXhqY3UxcFpJaXBNdUNwYnhIcUNjcmk1OGY0OUI2VkpmNnZKemJlZEJiYUR5?=
 =?utf-8?B?NVZPZ2ozK1kyL2UrQUV1L0xlZ1FJNmxMQmpycVorcldLbVB4ZjRjQ25FSUE0?=
 =?utf-8?B?YmsyOVJJTU10c09ZNUtybXA1R1hhei80N0d1OTUxYnRJTWpJMm1vdkxNT215?=
 =?utf-8?B?a21BRjJaRURPZ0hBZVI4OFYrNGdEelJrWURUL2l3UnhRd3hBWno2NG16TVpI?=
 =?utf-8?B?WGVsS1RoUzN1UVFQejVIaGNmeUpuM0gzR2czZmRieEN6cG5GRGw3eW9LZFJM?=
 =?utf-8?B?alByMXBEdWlKTkdsOCtUNHZHNE8rWU5lWHM1VG4rNmd1MkpQOXN2VHgvU2gr?=
 =?utf-8?B?em94M00wMEZOSW82TDZ4M1JnS3VEc004czFvU3kxeVFCTGtwWEpyT3NPVXVD?=
 =?utf-8?B?L3FUZUpxNzZvUS8rZXFlMHpmQU8zSUxJRi9BajdRaXNxZ00zUUJ4dGNFZGxC?=
 =?utf-8?B?VmZ3SlNCcDlvRjhkSXd3MU45S3dQSzAxOTBYbEtvRDVmWVBzdG02c295bUNM?=
 =?utf-8?B?RFlyS01wQnpQSkh4UVA2L3VZaHdCbXczQnE4aVFqNWlXNlVRdkY4QlQ1SzBJ?=
 =?utf-8?B?d2ZkRGh5ampxUW8wTmZGTDZ0UXVPTlBLL1pNUTdkWVlLempHRzdKbjB5TTZ2?=
 =?utf-8?B?aTMyNnZEL29nSWUzdkVSN0paZi9JRWthVExlZ1hsRWhrRFo1V3E1cVZBMVIw?=
 =?utf-8?B?S0RtaFUrSzl0TVM0NGZWRjc0UHZmWG9aMkUxL3JDVXBjKzVVMVRYL2YvZXdY?=
 =?utf-8?B?SmdKM1UyWWxTZFBSbDlGSy9iWjFDL3QxUUNXS2JnNDgvdjhYWmFLMDFxSE15?=
 =?utf-8?B?S1kyVUJ0RTl6b1pLeXVIMjYxa2JmNW1QaGVwbEdFcVBDL2tNQjNsZUxKNFZ1?=
 =?utf-8?B?T09oS2JmZ1FzZGZVNWtaK2kzc0ZGcklWeXJ0T0RtS291elpVRG1xdVpOVDJm?=
 =?utf-8?Q?9xKMG9kgrtG/8t7M=3D?=
X-Exchange-RoutingPolicyChecked: 
	Jpg2ghfOUGsZ0FZWJ+Bu/D4u7NioJITQDcyWtXq8HfwYdDRD2tzctCVOeaf59s0YjziWEkyPTCrlHKnV4dQRwCN+JSfUUYXxLqGCQnvhoXPD1JKVWPxkYtjVy2FzgTQzPuOXm6iuXmNgbbT6PJM+DYkxtsJ1N4bRhuEfRy08eny53SN18XzMOOhQhInhz7f3htMY429SzoehBYROkVaK4hvqC8UFMmj747CVBX5gN2k35WuSr4SdgumwclvqIp/WX0KbTFAA3pqmZoYktq8keQvsPmJg3Q14y18I+HwvWJzXkudR9CVhSFOCkyK8pnXfv6bEdn7qflILTXdT4yWwMQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc91bf2f-4605-4bee-d513-08de8e392b5c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 08:48:53.1562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BdNlWwPo+5AOE8EPvUoZIhoQg+JqApIQfS6Hi3rgY0yWOxR1yBZyzTqVg4KpA1TG4p9H8nPfmD23p8/bO+AQXXb/VXt0UP5JU1f40L3Zc8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7270
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Zqjg6t7G c=1 sm=1 tr=0 ts=69ca38f9 cx=c_pps
 a=AENbiTj01OTyMXuKFo/uig==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=Q4-j1AaZAAAA:8
 a=NEAV23lmAAAA:8 a=SFbbONLXAAAA:20 a=GHR8O2WEAAAA:20 a=26qUNFTaAAAA:20
 a=aiIX5UjjAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=V2sgnzSHAAAA:8
 a=A1X0JdhQAAAA:8 a=vggBfdFIAAAA:8 a=xNf9USuDAAAA:8 a=sfOm8-O8AAAA:8
 a=20KFwNOVAAAA:8 a=tqTmtexgmkyMbUNDd7wA:9 a=bUE66KHGuQxueXBa:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=JA-M8tas0c9oY2iTsQIA:9
 a=XBN3jZZqqJdlk05C:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Z31ocT7rh6aUJxSkT1EX:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: UzCQYqbjseqkPfxjFVxAWitLrfRjy29I
X-Proofpoint-GUID: Rfu2aLeWD9aA42beztRVAz2_Jh_ai2N4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2OCBTYWx0ZWRfX3ENsD3vvxCcq
 rkXu7fdoqqvstUSc3WtRKB+rlZ3jZPQuPzek1ClWNNjfinYvp5pMpS4oX/eTP1ZdHdmmZt//7L7
 GoGMixtodCrgy8x+A2XdWD1jSj/rv25+pDRKLDkVohhWssTTKka99Shvk5uKgI/A301P/J/FQ2S
 Fs0XFl8BZ/TrBo/TqhNdcDtZMyg0gFEgAMcF3pKu2FDXxsgB0DMCZQgqOFQsclpZDp2O3ZKvYk/
 VwAPd+f4iy0XC3xt1YqpV38xmqebpLKApNv51m6EroK0cYpAdH/MkMhmUMqee2N588bLEdNe9yt
 rECp+E+7ZChA0YdhQOt93v1A11uScRxGqiyB/Qcffhel96IBYwho9QkpIGBpnlsiDOzv2089+lw
 yDRNLU0HfNtAOY0TzXfepV6SD8NveSobk38waU8QDEfa0QZfIxIceVBHQXfNbuBQjDA6UQJLngF
 i18kTNTEdVtghbammDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 phishscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300068
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 08:49:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125840

--------------UyOBVZKVi0m0grYDjleVBXW0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62U602up3899474

On 3/30/26 15:18, Gyorgy Sarvari wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> Personally I am not against the idea of dropping this, but it looks
> there are a couple of other recipes depending on it:
> https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Dd=
epends%3Alibsoup-2.4
Thanks.=C2=A0 I do missed some recipes.
> (the list has some recipes from the meta-oe repo also, not only 3rd
> party layers)

Do we need to wait all the 3rd party layers to switch to soup3 before=20
remove recipe libsoup-2.4?


There are 4 recipes under meta-opebembeded that depends on libsoup-2.4,=C2=
=A0=20
and I list the status of it below:

meta-networking/recipes-support/strongswan/strongswan_6.0.4.bb:51:PACKAGE=
CONFIG[soup]=20
=3D "--enable-soup,--disable-soup,libsoup-2.4,${PN}-plugin-soup"
meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb:8:DEPENDS =3D=
=20
"gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad=20
gstreamer1.0-rtsp-server json-glib libdaemon libsoup-2.4 jansson"
meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb:10:DEPENDS =3D=20
"libxml2 glib-2.0 libsoup-2.4 intltool-native liboauth gcr3 json-glib"
meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb:14:DEPEND=
S=20
=3D "gtk+3 gdk-pixbuf libsoup-2.4 json-glib gnome-common-native"


For strongswan,=C2=A0 current 6.0.4 actually depends on soup3, this need =
to=20
be fixed,=C2=A0 refer:
https://github.com/strongswan/strongswan/commit/6ddabf52d5f335147601c7c27=
97da21820efafb8

For libtimezonemap,=C2=A0 debian 0.4.6-7 already port to soup3,=C2=A0 wha=
t we used=20
is libtimezonemap_0.4.6.orig.tar.gz, we upgrade to=20
libtimezonemap_0.4.6-7.debian.tar.xz.
Refer: https://github.com/linuxmint/cinnamon/issues/11001

For libgdata, already archived, no maintainer,=C2=A0 it will not support=20
libsoup3 later.
https://gitlab.gnome.org/Archive/libgdata
The one who depends on libgdata:
meta-gnome/recipes-gnome/gvfs/gvfs_1.60.0.bb:63:PACKAGECONFIG[google] =3D=
=20
"-Dgoogle=3Dtrue, -Dgoogle=3Dfalse, libgdata"=C2=A0 =C2=A0disabled by def=
ault
And upstream gvfs already disable google option,=C2=A0 maybe we can remov=
e=20
google option, and disable google option explicitly?
refer:
https://gitlab.gnome.org/GNOME/gvfs/-/merge_requests/266
https://gitlab.gnome.org/Archive/libgdata/-/merge_requests/49


For gstd, the lastest commit is 2 years ago, There is an issue for this:=20
https://github.com/RidgeRun/gstd-1.x/pull/326, but
stil open,=C2=A0 depends on libsoup-2.4 cannot be removed:
https://github.com/RidgeRun/gstd-1.x/tree/master


Regards

Changqing

>
>
> On 3/30/26 08:31, Changqing Li via lists.openembedded.org wrote:
>> remove deprecated libsoup-2.4, no one depends on it now
>>
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ---
>>   .../libsoup-2.4/0001-CVE-2025-32911.patch     |  74 ---------
>>   ...ild-with-libxml2-2.12.0-and-clang-17.patch |  44 -----
>>   ...-Fix-possibly-uninitialized-warnings.patch |  43 -----
>>   ...-http-and-https-aliases-support-test.patch | 145 ----------------=
-
>>   .../libsoup/libsoup-2.4/CVE-2024-52530.patch  | 150 ----------------=
--
>>   .../libsoup-2.4/CVE-2024-52531-1.patch        |  39 -----
>>   .../libsoup-2.4/CVE-2024-52531-2.patch        | 133 ----------------
>>   .../libsoup-2.4/CVE-2024-52532-1.patch        |  37 -----
>>   .../libsoup-2.4/CVE-2024-52532-2.patch        |  43 -----
>>   .../libsoup-2.4/CVE-2024-52532-3.patch        |  48 ------
>>   .../libsoup/libsoup-2.4/CVE-2025-2784.patch   |  56 -------
>>   .../libsoup/libsoup-2.4/CVE-2025-32050.patch  |  29 ----
>>   .../libsoup/libsoup-2.4/CVE-2025-32052.patch  |  32 ----
>>   .../libsoup/libsoup-2.4/CVE-2025-32053.patch  |  39 -----
>>   .../libsoup/libsoup-2.4/CVE-2025-32906.patch  |  71 ---------
>>   .../libsoup/libsoup-2.4/CVE-2025-32907.patch  |  39 -----
>>   .../libsoup/libsoup-2.4/CVE-2025-32909.patch  |  38 -----
>>   .../libsoup-2.4/CVE-2025-32910-1.patch        |  32 ----
>>   .../libsoup-2.4/CVE-2025-32910-2.patch        |  94 -----------
>>   .../libsoup-2.4/CVE-2025-32910-3.patch        |  28 ----
>>   .../libsoup/libsoup-2.4/CVE-2025-32912.patch  |  32 ----
>>   .../libsoup/libsoup-2.4/CVE-2025-32914.patch  |  35 ----
>>   .../libsoup/libsoup-2.4/CVE-2025-4476.patch   |  38 -----
>>   .../libsoup/libsoup-2.4/CVE-2025-46420.patch  |  61 -------
>>   .../libsoup/libsoup-2.4/CVE-2025-46421.patch  |  47 ------
>>   .../libsoup/libsoup-2.4/CVE-2025-4945.patch   | 117 --------------
>>   .../libsoup/libsoup-2.4/CVE-2025-4948.patch   |  38 -----
>>   .../libsoup/libsoup-2.4/CVE-2025-4969.patch   |  37 -----
>>   .../libsoup/libsoup-2.4_2.74.3.bb             |  87 ----------
>>   29 files changed, 1706 deletions(-)
>>   delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/0001-=
CVE-2025-32911.patch
>>   delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/0001-=
Fix-build-with-libxml2-2.12.0-and-clang-17.patch
>>   delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/0001-=
Fix-possibly-uninitialized-warnings.patch
>>   delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/0001-=
Remove-http-and-https-aliases-support-test.patch
>>   delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2=
024-52530.patch
>>   delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2=
024-52531-1.patch
>>   delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2=
024-52531-2.patch
>>   delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2=
024-52532-1.patch
>>   delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2=
024-52532-2.patch
>>   delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2=
024-52532-3.patch
>>   delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2=
025-2784.patch
>>   delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2=
025-32050.patch
>>   delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2=
025-32052.patch
>>   delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2=
025-32053.patch
>>   delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2=
025-32906.patch
>>   delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2=
025-32907.patch
>>   delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2=
025-32909.patch
>>   delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2=
025-32910-1.patch
>>   delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2=
025-32910-2.patch
>>   delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2=
025-32910-3.patch
>>   delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2=
025-32912.patch
>>   delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2=
025-32914.patch
>>   delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2=
025-4476.patch
>>   delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2=
025-46420.patch
>>   delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2=
025-46421.patch
>>   delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2=
025-4945.patch
>>   delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2=
025-4948.patch
>>   delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2=
025-4969.patch
>>   delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.=
3.bb
>>
>> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025=
-32911.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-=
32911.patch
>> deleted file mode 100644
>> index d75594bb4f..0000000000
>> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.=
patch
>> +++ /dev/null
>> @@ -1,74 +0,0 @@
>> -From 52c5859b82fe79f2c32d883e048d218e0d7f2182 Mon Sep 17 00:00:00 200=
1
>> -From: Changqing Li<changqing.li@windriver.com>
>> -Date: Wed, 30 Apr 2025 14:59:55 +0800
>> -Subject: [PATCH] CVE-2025-32911
>> -
>> -CVE: CVE-2025-32911 CVE-2025-32913
>> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/m=
erge_requests/422/commits]
>> -
>> -Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ----
>> - libsoup/soup-message-headers.c | 13 +++++++++----
>> - tests/header-parsing-test.c    | 15 +++++++++++++++
>> - 2 files changed, 24 insertions(+), 4 deletions(-)
>> -
>> -diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-he=
aders.c
>> -index 39ad14a..78b2455 100644
>> ---- a/libsoup/soup-message-headers.c
>> -+++ b/libsoup/soup-message-headers.c
>> -@@ -1454,10 +1454,15 @@ soup_message_headers_get_content_disposition =
(SoupMessageHeaders  *hdrs,
>> -      */
>> -     if (params && g_hash_table_lookup_extended (*params, "filename",
>> -                                                 &orig_key, &orig_val=
ue)) {
>> --            char *filename =3D strrchr (orig_value, '/');
>> --
>> --            if (filename)
>> --                    g_hash_table_insert (*params, g_strdup (orig_key=
), filename + 1);
>> -+                if (orig_value) {
>> -+                        char *filename =3D strrchr (orig_value, '/')=
;
>> -+
>> -+                        if (filename)
>> -+                                g_hash_table_insert (*params, g_strd=
up (orig_key), g_strdup(filename + 1));
>> -+                } else {
>> -+                        /* filename with no value isn't valid. */
>> -+                        g_hash_table_remove (*params, "filename");
>> -+                }
>> -     }
>> -     return TRUE;
>> - }
>> -diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.=
c
>> -index 946f118..752196e 100644
>> ---- a/tests/header-parsing-test.c
>> -+++ b/tests/header-parsing-test.c
>> -@@ -1034,6 +1034,7 @@ do_param_list_tests (void)
>> - #define RFC5987_TEST_HEADER_FALLBACK "attachment; filename*=3DUnknow=
n''t%FF%FF%FFst.txt; filename=3D\"test.txt\""
>> - #define RFC5987_TEST_HEADER_NO_TYPE  "filename=3D\"test.txt\""
>> - #define RFC5987_TEST_HEADER_NO_TYPE_2  "filename=3D\"test.txt\"; foo=
=3Dbar"
>> -+#define RFC5987_TEST_HEADER_EMPTY_FILENAME ";filename"
>> -
>> - static void
>> - do_content_disposition_tests (void)
>> -@@ -1133,6 +1134,20 @@ do_content_disposition_tests (void)
>> -     g_assert_cmpstr (filename, =3D=3D, RFC5987_TEST_FALLBACK_FILENAM=
E);
>> -         parameter2 =3D g_hash_table_lookup (params, "foo");
>> -         g_assert_cmpstr (parameter2, =3D=3D, "bar");
>> -+    g_hash_table_destroy (params);
>> -+
>> -+     /* Empty filename */
>> -+    soup_message_headers_clear (hdrs);
>> -+    soup_message_headers_append (hdrs, "Content-Disposition",
>> -+                                                             RFC5987=
_TEST_HEADER_EMPTY_FILENAME);
>> -+    if (!soup_message_headers_get_content_disposition (hdrs,
>> -+                                                                    =
                                   &disposition,
>> -+                                                                    =
                                   &params)) {
>> -+                    soup_test_assert (FALSE, "empty filename decodin=
g FAILED");
>> -+                    return;
>> -+    }
>> -+    g_free (disposition);
>> -+    g_assert_false (g_hash_table_contains (params, "filename"));
>> -     g_hash_table_destroy (params);
>> -
>> -     soup_message_headers_free (hdrs);
>> ---
>> -2.34.1
>> -
>> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-buil=
d-with-libxml2-2.12.0-and-clang-17.patch b/meta-oe/recipes-support/libsou=
p/libsoup-2.4/0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch
>> deleted file mode 100644
>> index d867e5bc17..0000000000
>> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-build-with-=
libxml2-2.12.0-and-clang-17.patch
>> +++ /dev/null
>> @@ -1,44 +0,0 @@
>> -From ced3c5d8cad0177b297666343f1561799dfefb0d Mon Sep 17 00:00:00 200=
1
>> -From: Khem Raj<raj.khem@gmail.com>
>> -Date: Wed, 22 Nov 2023 18:49:10 -0800
>> -Subject: [PATCH] Fix build with libxml2-2.12.0 and clang-17
>> -
>> -Fixes build errors about missing function prototypes with clang-17
>> -
>> -Fixes
>> -| ../libsoup-2.74.3/libsoup/soup-xmlrpc-old.c:512:8: error: call to u=
ndeclared function 'xmlParseMemory'; ISO C99 and later do not support imp=
licit function declarations
>> -
>> -Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libsoup/-/=
merge_requests/385]
>> -Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> ----
>> - libsoup/soup-xmlrpc-old.c | 1 +
>> - libsoup/soup-xmlrpc.c     | 1 +
>> - 2 files changed, 2 insertions(+)
>> -
>> -diff --git a/libsoup/soup-xmlrpc-old.c b/libsoup/soup-xmlrpc-old.c
>> -index c57086b6..527e3b23 100644
>> ---- a/libsoup/soup-xmlrpc-old.c
>> -+++ b/libsoup/soup-xmlrpc-old.c
>> -@@ -11,6 +11,7 @@
>> -
>> - #include <string.h>
>> -
>> -+#include <libxml/parser.h>
>> - #include <libxml/tree.h>
>> -
>> - #include "soup-xmlrpc-old.h"
>> -diff --git a/libsoup/soup-xmlrpc.c b/libsoup/soup-xmlrpc.c
>> -index 42dcda9c..e991cbf0 100644
>> ---- a/libsoup/soup-xmlrpc.c
>> -+++ b/libsoup/soup-xmlrpc.c
>> -@@ -17,6 +17,7 @@
>> -
>> - #include <string.h>
>> - #include <errno.h>
>> -+#include <libxml/parser.h>
>> - #include <libxml/tree.h>
>> - #include "soup-xmlrpc.h"
>> - #include "soup.h"
>> ---
>> -2.43.0
>> -
>> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-poss=
ibly-uninitialized-warnings.patch b/meta-oe/recipes-support/libsoup/libso=
up-2.4/0001-Fix-possibly-uninitialized-warnings.patch
>> deleted file mode 100644
>> index fcd442c13a..0000000000
>> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-possibly-un=
initialized-warnings.patch
>> +++ /dev/null
>> @@ -1,43 +0,0 @@
>> -From 1159686379184a1c899eabb2174258aba5e0fd79 Mon Sep 17 00:00:00 200=
1
>> -From: Patrick Griffis<pgriffis@igalia.com>
>> -Date: Mon, 20 Sep 2021 15:41:31 -0500
>> -Subject: [PATCH] Fix possibly uninitialized warnings
>> -
>> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/c=
ommit/fb98e9a8c3062c75357b961543af091de2dd5459]
>> -
>> -Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ----
>> - libsoup/soup-websocket-connection.c | 2 +-
>> - tests/samesite-test.c               | 3 +++
>> - 2 files changed, 4 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-webso=
cket-connection.c
>> -index 65c1492..585d45c 100644
>> ---- a/libsoup/soup-websocket-connection.c
>> -+++ b/libsoup/soup-websocket-connection.c
>> -@@ -471,7 +471,7 @@ send_message (SoupWebsocketConnection *self,
>> -     GByteArray *bytes;
>> -     gsize frame_len;
>> -     guint8 *outer;
>> --    guint8 mask_offset;
>> -+    guint8 mask_offset =3D 0;
>> -     GBytes *filtered_bytes;
>> -     GList *l;
>> -     GError *error =3D NULL;
>> -diff --git a/tests/samesite-test.c b/tests/samesite-test.c
>> -index 0b081b2..60c9b8e 100644
>> ---- a/tests/samesite-test.c
>> -+++ b/tests/samesite-test.c
>> -@@ -60,6 +60,9 @@ assert_highest_policy_visible (GSList *cookies, Sou=
pSameSitePolicy policy)
>> -     case SOUP_SAME_SITE_POLICY_NONE:
>> -             expected_count =3D 1;
>> -             break;
>> -+    default:
>> -+            g_assert_not_reached ();
>> -+            break;
>> -     }
>> -
>> -     g_assert_cmpuint (size, =3D=3D, expected_count);
>> ---
>> -2.34.1
>> -
>> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Remove-h=
ttp-and-https-aliases-support-test.patch b/meta-oe/recipes-support/libsou=
p/libsoup-2.4/0001-Remove-http-and-https-aliases-support-test.patch
>> deleted file mode 100644
>> index 0d4139ec08..0000000000
>> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Remove-http-and=
-https-aliases-support-test.patch
>> +++ /dev/null
>> @@ -1,145 +0,0 @@
>> -From 0e3bfa22b23451531caf8cc30b1771ac6a41fcad Mon Sep 17 00:00:00 200=
1
>> -From: Carlos Garcia Campos<cgarcia@igalia.com>
>> -Date: Thu, 11 Feb 2021 10:47:09 +0100
>> -Subject: [PATCH] Remove http and https aliases support test
>> -
>> -Upstream has removed the whole function of http and https aliases
>> -support, this commit partially cherry pick it, only remove the test t=
o
>> -mute the warning:
>> -| ../libsoup-2.74.3/tests/server-test.c: In function 'do_one_server_a=
liases_test':
>> -| ../libsoup-2.74.3/tests/server-test.c:180:17: warning: 'g_socket_cl=
ient_set_tls_validation_flags' is deprecated [-Wdeprecated-declarations]
>> -|   180 |                 g_socket_client_set_tls_validation_flags (c=
lient, 0);
>> -|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> -
>> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/c=
ommit/111ae4ebe7cc2e389573cff5b9ac76509d6cbac0]
>> -
>> -Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ----
>> - tests/server-test.c | 104 ------------------------------------------=
--
>> - 1 file changed, 104 deletions(-)
>> -
>> -diff --git a/tests/server-test.c b/tests/server-test.c
>> -index 8976103..cb7e815 100644
>> ---- a/tests/server-test.c
>> -+++ b/tests/server-test.c
>> -@@ -154,108 +154,6 @@ do_star_test (ServerData *sd, gconstpointer tes=
t_data)
>> -     soup_uri_free (star_uri);
>> - }
>> -
>> --static void
>> --do_one_server_aliases_test (SoupURI    *uri,
>> --                        const char *alias,
>> --                        gboolean    succeed)
>> --{
>> --    GSocketClient *client;
>> --    GSocketConnectable *addr;
>> --    GSocketConnection *conn;
>> --    GInputStream *in;
>> --    GOutputStream *out;
>> --    GError *error =3D NULL;
>> --    GString *req;
>> --    static char buf[1024];
>> --
>> --    debug_printf (1, "  %s via %s\n", alias, uri->scheme);
>> --
>> --    /* There's no way to make libsoup's client side send an absolute
>> --     * URI (to a non-proxy server), so we have to fake this.
>> --     */
>> --
>> --    client =3D g_socket_client_new ();
>> --    if (uri->scheme =3D=3D SOUP_URI_SCHEME_HTTPS) {
>> --            g_socket_client_set_tls (client, TRUE);
>> --            g_socket_client_set_tls_validation_flags (client, 0);
>> --    }
>> --    addr =3D g_network_address_new (uri->host, uri->port);
>> --
>> --    conn =3D g_socket_client_connect (client, addr, NULL, &error);
>> --    g_object_unref (addr);
>> --    g_object_unref (client);
>> --    if (!conn) {
>> --            g_assert_no_error (error);
>> --            g_error_free (error);
>> --            return;
>> --    }
>> --
>> --    in =3D g_io_stream_get_input_stream (G_IO_STREAM (conn));
>> --    out =3D g_io_stream_get_output_stream (G_IO_STREAM (conn));
>> --
>> --    req =3D g_string_new (NULL);
>> --    g_string_append_printf (req, "GET %s://%s:%d HTTP/1.1\r\n",
>> --                            alias, uri->host, uri->port);
>> --    g_string_append_printf (req, "Host: %s:%d\r\n",
>> --                            uri->host, uri->port);
>> --    g_string_append (req, "Connection: close\r\n\r\n");
>> --
>> --    if (!g_output_stream_write_all (out, req->str, req->len, NULL, N=
ULL, &error)) {
>> --            g_assert_no_error (error);
>> --            g_error_free (error);
>> --            g_object_unref (conn);
>> --            g_string_free (req, TRUE);
>> --            return;
>> --    }
>> --    g_string_free (req, TRUE);
>> --
>> --    if (!g_input_stream_read_all (in, buf, sizeof (buf), NULL, NULL,=
 &error)) {
>> --            g_assert_no_error (error);
>> --            g_error_free (error);
>> --            g_object_unref (conn);
>> --            return;
>> --    }
>> --
>> --    if (succeed)
>> --            g_assert_true (g_str_has_prefix (buf, "HTTP/1.1 200 "));
>> --    else
>> --            g_assert_true (g_str_has_prefix (buf, "HTTP/1.1 400 "));
>> --
>> --    g_io_stream_close (G_IO_STREAM (conn), NULL, NULL);
>> --    g_object_unref (conn);
>> --}
>> --
>> --static void
>> --do_server_aliases_test (ServerData *sd, gconstpointer test_data)
>> --{
>> --    char *http_aliases[] =3D { "dav", NULL };
>> --    char *https_aliases[] =3D { "davs", NULL };
>> --    char *http_good[] =3D { "http", "dav", NULL };
>> --    char *http_bad[] =3D { "https", "davs", "fred", NULL };
>> --    char *https_good[] =3D { "https", "davs", NULL };
>> --    char *https_bad[] =3D { "http", "dav", "fred", NULL };
>> --    int i;
>> --
>> --    g_test_bug ("703694");
>> --
>> --    g_object_set (G_OBJECT (sd->server),
>> --                  SOUP_SERVER_HTTP_ALIASES, http_aliases,
>> --                  SOUP_SERVER_HTTPS_ALIASES, https_aliases,
>> --                  NULL);
>> --
>> --    for (i =3D 0; http_good[i]; i++)
>> --            do_one_server_aliases_test (sd->base_uri, http_good[i], =
TRUE);
>> --    for (i =3D 0; http_bad[i]; i++)
>> --            do_one_server_aliases_test (sd->base_uri, http_bad[i], F=
ALSE);
>> --
>> --    if (tls_available) {
>> --            for (i =3D 0; https_good[i]; i++)
>> --                    do_one_server_aliases_test (sd->ssl_base_uri, ht=
tps_good[i], TRUE);
>> --            for (i =3D 0; https_bad[i]; i++)
>> --                    do_one_server_aliases_test (sd->ssl_base_uri, ht=
tps_bad[i], FALSE);
>> --    }
>> --}
>> --
>> - static void
>> - do_dot_dot_test (ServerData *sd, gconstpointer test_data)
>> - {
>> -@@ -1382,8 +1280,6 @@ main (int argc, char **argv)
>> -
>> -     g_test_add ("/server/OPTIONS *", ServerData, NULL,
>> -                 server_setup, do_star_test, server_teardown);
>> --    g_test_add ("/server/aliases", ServerData, NULL,
>> --                server_setup, do_server_aliases_test, server_teardow=
n);
>> -     g_test_add ("/server/..-in-path", ServerData, NULL,
>> -                 server_setup, do_dot_dot_test, server_teardown);
>> -     g_test_add ("/server/ipv6", ServerData, NULL,
>> ---
>> -2.34.1
>> -
>> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-5253=
0.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patc=
h
>> deleted file mode 100644
>> index 04713850e1..0000000000
>> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patch
>> +++ /dev/null
>> @@ -1,150 +0,0 @@
>> -From 4a2bb98e03d79146c729dca52c8d6edc635218ff Mon Sep 17 00:00:00 200=
1
>> -From: Patrick Griffis<pgriffis@igalia.com>
>> -Date: Mon, 8 Jul 2024 12:33:15 -0500
>> -Subject: [PATCH] headers: Strictly don't allow NUL bytes
>> -
>> -In the past (2015) this was allowed for some problematic sites. Howev=
er Chromium also does not allow NUL bytes in either header names or value=
s these days. So this should no longer be a problem.
>> -
>> -CVE: CVE-2024-52530
>> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/m=
erge_requests/402/diffs?commit_id=3D04df03bc092ac20607f3e150936624d4f536e=
68b]
>> -
>> -Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ----
>> - libsoup/soup-headers.c      | 15 +++------
>> - tests/header-parsing-test.c | 62 +++++++++++++++++------------------=
--
>> - 2 files changed, 32 insertions(+), 45 deletions(-)
>> -
>> -diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
>> -index eec28ad..e5d3c03 100644
>> ---- a/libsoup/soup-headers.c
>> -+++ b/libsoup/soup-headers.c
>> -@@ -50,13 +50,14 @@ soup_headers_parse (const char *str, int len, Sou=
pMessageHeaders *dest)
>> -      * ignorable trailing whitespace.
>> -      */
>> -
>> -+    /* No '\0's are allowed */
>> -+    if (memchr (str, '\0', len))
>> -+            return FALSE;
>> -+
>> -     /* Skip over the Request-Line / Status-Line */
>> -     headers_start =3D memchr (str, '\n', len);
>> -     if (!headers_start)
>> -             return FALSE;
>> --    /* No '\0's in the Request-Line / Status-Line */
>> --    if (memchr (str, '\0', headers_start - str))
>> --            return FALSE;
>> -
>> -     /* We work on a copy of the headers, which we can write '\0's
>> -      * into, so that we don't have to individually g_strndup and
>> -@@ -68,14 +69,6 @@ soup_headers_parse (const char *str, int len, Soup=
MessageHeaders *dest)
>> -     headers_copy[copy_len] =3D '\0';
>> -     value_end =3D headers_copy;
>> -
>> --    /* There shouldn't be any '\0's in the headers already, but
>> --     * this is the web we're talking about.
>> --     */
>> --    while ((p =3D memchr (headers_copy, '\0', copy_len))) {
>> --            memmove (p, p + 1, copy_len - (p - headers_copy));
>> --            copy_len--;
>> --    }
>> --
>> -     while (*(value_end + 1)) {
>> -             name =3D value_end + 1;
>> -             name_end =3D strchr (name, ':');
>> -diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.=
c
>> -index 752196e..c1d3b33 100644
>> ---- a/tests/header-parsing-test.c
>> -+++ b/tests/header-parsing-test.c
>> -@@ -358,24 +358,6 @@ static struct RequestTest {
>> -       }
>> -     },
>> -
>> --    { "NUL in header name", "760832",
>> --      "GET / HTTP/1.1\r\nHost\x00: example.com\r\n", 36,
>> --      SOUP_STATUS_OK,
>> --      "GET", "/", SOUP_HTTP_1_1,
>> --      { { "Host", "example.com" },
>> --        { NULL }
>> --      }
>> --    },
>> --
>> --    { "NUL in header value", "760832",
>> --      "GET / HTTP/1.1\r\nHost: example\x00" "com\r\n", 35,
>> --      SOUP_STATUS_OK,
>> --      "GET", "/", SOUP_HTTP_1_1,
>> --      { { "Host", "examplecom" },
>> --        { NULL }
>> --      }
>> --    },
>> --
>> -     /************************/
>> -     /*** INVALID REQUESTS ***/
>> -     /************************/
>> -@@ -448,6 +430,21 @@ static struct RequestTest {
>> -       SOUP_STATUS_EXPECTATION_FAILED,
>> -       NULL, NULL, -1,
>> -       { { NULL } }
>> -+    },
>> -+
>> -+    //https://gitlab.gnome.org/GNOME/libsoup/-/issues/377
>> -+    { "NUL in header name", NULL,
>> -+      "GET / HTTP/1.1\r\nHost\x00: example.com\r\n", 36,
>> -+      SOUP_STATUS_BAD_REQUEST,
>> -+      NULL, NULL, -1,
>> -+      { { NULL } }
>> -+    },
>> -+
>> -+    { "NUL in header value", NULL,
>> -+      "HTTP/1.1 200 OK\r\nFoo: b\x00" "ar\r\n", 28,
>> -+      SOUP_STATUS_BAD_REQUEST,
>> -+           NULL, NULL, -1,
>> -+      { { NULL } }
>> -     }
>> - };
>> - static const int num_reqtests =3D G_N_ELEMENTS (reqtests);
>> -@@ -620,22 +617,6 @@ static struct ResponseTest {
>> -         { NULL } }
>> -     },
>> -
>> --    { "NUL in header name", "760832",
>> --      "HTTP/1.1 200 OK\r\nF\x00oo: bar\r\n", 28,
>> --      SOUP_HTTP_1_1, SOUP_STATUS_OK, "OK",
>> --      { { "Foo", "bar" },
>> --        { NULL }
>> --      }
>> --    },
>> --
>> --    { "NUL in header value", "760832",
>> --      "HTTP/1.1 200 OK\r\nFoo: b\x00" "ar\r\n", 28,
>> --      SOUP_HTTP_1_1, SOUP_STATUS_OK, "OK",
>> --      { { "Foo", "bar" },
>> --        { NULL }
>> --      }
>> --    },
>> --
>> -     /********************************/
>> -     /*** VALID CONTINUE RESPONSES ***/
>> -     /********************************/
>> -@@ -768,6 +749,19 @@ static struct ResponseTest {
>> -       { { NULL }
>> -       }
>> -     },
>> -+
>> -+    //https://gitlab.gnome.org/GNOME/libsoup/-/issues/377
>> -+    { "NUL in header name", NULL,
>> -+      "HTTP/1.1 200 OK\r\nF\x00oo: bar\r\n", 28,
>> -+      -1, 0, NULL,
>> -+      { { NULL } }
>> -+    },
>> -+
>> -+    { "NUL in header value", "760832",
>> -+      "HTTP/1.1 200 OK\r\nFoo: b\x00" "ar\r\n", 28,
>> -+      -1, 0, NULL,
>> -+      { { NULL } }
>> -+    },
>> - };
>> - static const int num_resptests =3D G_N_ELEMENTS (resptests);
>> -
>> ---
>> -2.34.1
>> -
>> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-5253=
1-1.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-1.=
patch
>> deleted file mode 100644
>> index 9de0310c8d..0000000000
>> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-1.pat=
ch
>> +++ /dev/null
>> @@ -1,39 +0,0 @@
>> -From 8331e681c85c3b1893d8d5193783f631bfc07acb Mon Sep 17 00:00:00 200=
1
>> -From: Changqing Li<changqing.li@windriver.com>
>> -Date: Fri, 16 May 2025 13:42:08 +0800
>> -Subject: [PATCH] tests: Add test for passing invalid UTF-8 to
>> - soup_header_parse_semi_param_list()
>> -
>> -CVE: CVE-2024-52531
>> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/m=
erge_requests/407/diffs?commit_id=3D825fda3425546847b42ad5270544e9388ff34=
9fe]
>> -
>> -Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ----
>> - tests/header-parsing-test.c | 11 +++++++++++
>> - 1 file changed, 11 insertions(+)
>> -
>> -diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.=
c
>> -index b811115..cfcc003 100644
>> ---- a/tests/header-parsing-test.c
>> -+++ b/tests/header-parsing-test.c
>> -@@ -836,6 +836,17 @@ static struct ParamListTest {
>> -         { "filename", "t\xC3\xA9st.txt" },
>> -       },
>> -     },
>> -+
>> -+/* This tests invalid UTF-8 data which *should* never be passed here=
 but it was designed to be robust against it. */
>> -+    { TRUE,
>> -+      "invalid*=3D\x69\x27\x27\x93\x93\x93\x93\xff\x61\x61\x61\x61\x=
61\x61\x61\x62\x63\x64\x65\x0a; filename*=3Diso-8859-1''\x69\x27\x27\x93\=
x93\x93\x93\xff\x61\x61\x61\x61\x61\x61\x61\x62\x63\x64\x65\x0a; foo",
>> -+       {
>> -+            { "filename", "i''\302\223\302\223\302\223\302\223\303\2=
77aaaaaaabcde" },
>> -+            { "invalid", "\302\223\302\223\302\223\302\223\303\277aa=
aaaaabcde" },
>> -+            { "foo", NULL },
>> -+       },
>> -+    }
>> -+
>> - };
>> - static const int num_paramlisttests =3D G_N_ELEMENTS (paramlisttests=
);
>> -
>> ---
>> -2.34.1
>> -
>> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-5253=
1-2.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.=
patch
>> deleted file mode 100644
>> index 740c28c016..0000000000
>> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.pat=
ch
>> +++ /dev/null
>> @@ -1,133 +0,0 @@
>> -From 12523a592f1216450d18706bcf6c16e0f1ab0ce0 Mon Sep 17 00:00:00 200=
1
>> -From: Changqing Li<changqing.li@windriver.com>
>> -Date: Fri, 16 May 2025 13:52:37 +0800
>> -Subject: [PATCH] headers: Be more robust against invalid input when
>> - parsing params
>> -
>> -If you pass invalid input to a function such as soup_header_parse_par=
am_list_strict()
>> -it can cause an overflow if it decodes the input to UTF-8.
>> -
>> -This should never happen with valid UTF-8 input which libsoup's clien=
t API
>> -ensures, however it's server API does not currently.
>> -
>> -CVE: CVE-2024-52531
>> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/m=
erge_requests/407/diffs?commit_id=3Da35222dd0bfab2ac97c10e86b95f762456628=
283]
>> -
>> -Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ----
>> - libsoup/soup-headers.c | 45 +++++++++++++++++++++-------------------=
--
>> - 1 file changed, 23 insertions(+), 22 deletions(-)
>> -
>> -diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
>> -index 67905b2..39e8d34 100644
>> ---- a/libsoup/soup-headers.c
>> -+++ b/libsoup/soup-headers.c
>> -@@ -642,8 +642,9 @@ soup_header_contains (const char *header, const c=
har *token)
>> - }
>> -
>> - static void
>> --decode_quoted_string (char *quoted_string)
>> -+decode_quoted_string_inplace (GString *quoted_gstring)
>> - {
>> -+    char *quoted_string =3D quoted_gstring->str;
>> -     char *src, *dst;
>> -
>> -     src =3D quoted_string + 1;
>> -@@ -657,10 +658,11 @@ decode_quoted_string (char *quoted_string)
>> - }
>> -
>> - static gboolean
>> --decode_rfc5987 (char *encoded_string)
>> -+decode_rfc5987_inplace (GString *encoded_gstring)
>> - {
>> -     char *q, *decoded;
>> -     gboolean iso_8859_1 =3D FALSE;
>> -+    const char *encoded_string =3D encoded_gstring->str;
>> -
>> -     q =3D strchr (encoded_string, '\'');
>> -     if (!q)
>> -@@ -689,14 +691,7 @@ decode_rfc5987 (char *encoded_string)
>> -             decoded =3D utf8;
>> -     }
>> -
>> --    /* If encoded_string was UTF-8, then each 3-character %-escape
>> --     * will be converted to a single byte, and so decoded is
>> --     * shorter than encoded_string. If encoded_string was
>> --     * iso-8859-1, then each 3-character %-escape will be
>> --     * converted into at most 2 bytes in UTF-8, and so it's still
>> --     * shorter.
>> --     */
>> --    strcpy (encoded_string, decoded);
>> -+    g_string_assign (encoded_gstring, decoded);
>> -     g_free (decoded);
>> -     return TRUE;
>> - }
>> -@@ -706,15 +701,16 @@ parse_param_list (const char *header, char deli=
m, gboolean strict)
>> - {
>> -     GHashTable *params;
>> -     GSList *list, *iter;
>> --    char *item, *eq, *name_end, *value;
>> --    gboolean override, duplicated;
>> -
>> -     params =3D g_hash_table_new_full (soup_str_case_hash,
>> -                                     soup_str_case_equal,
>> --                                    g_free, NULL);
>> -+                                    g_free, g_free);
>> -
>> -     list =3D parse_list (header, delim);
>> -     for (iter =3D list; iter; iter =3D iter->next) {
>> -+            char *item, *eq, *name_end;
>> -+            gboolean override, duplicated;
>> -+            GString *parsed_value =3D NULL;
>> -             item =3D iter->data;
>> -             override =3D FALSE;
>> -
>> -@@ -729,19 +725,19 @@ parse_param_list (const char *header, char deli=
m, gboolean strict)
>> -
>> -                     *name_end =3D '\0';
>> -
>> --                    value =3D (char *)skip_lws (eq + 1);
>> -+                    parsed_value =3D g_string_new ((char *)skip_lws =
(eq + 1));
>> -
>> -                     if (name_end[-1] =3D=3D '*' && name_end > item +=
 1) {
>> -                             name_end[-1] =3D '\0';
>> --                            if (!decode_rfc5987 (value)) {
>> -+                            if (!decode_rfc5987_inplace (parsed_valu=
e)) {
>> -+                                    g_string_free (parsed_value, TRU=
E);
>> -                                     g_free (item);
>> -                                     continue;
>> -                             }
>> -                             override =3D TRUE;
>> --                    } else if (*value =3D=3D '"')
>> --                            decode_quoted_string (value);
>> --            } else
>> --                    value =3D NULL;
>> -+                    } else if (parsed_value->str[0] =3D=3D '"')
>> -+                            decode_quoted_string_inplace (parsed_val=
ue);
>> -+                    }
>> -
>> -             duplicated =3D g_hash_table_lookup_extended (params, ite=
m, NULL, NULL);
>> -
>> -@@ -749,11 +745,16 @@ parse_param_list (const char *header, char deli=
m, gboolean strict)
>> -                     soup_header_free_param_list (params);
>> -                     params =3D NULL;
>> -                     g_slist_foreach (iter, (GFunc)g_free, NULL);
>> -+                    if (parsed_value)
>> -+                            g_string_free (parsed_value, TRUE);
>> -                     break;
>> --            } else if (override || !duplicated)
>> --                    g_hash_table_replace (params, item, value);
>> --            else
>> -+            } else if (override || !duplicated) {
>> -+                    g_hash_table_replace (params, item, parsed_value=
 ? g_string_free (parsed_value, FALSE) : NULL);
>> -+            } else {
>> -+                    if (parsed_value)
>> -+                            g_string_free (parsed_value, TRUE);
>> -                     g_free (item);
>> -+            }
>> -     }
>> -
>> -     g_slist_free (list);
>> ---
>> -2.34.1
>> -
>> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-5253=
2-1.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.=
patch
>> deleted file mode 100644
>> index cb1f096110..0000000000
>> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.pat=
ch
>> +++ /dev/null
>> @@ -1,37 +0,0 @@
>> -From a693d49bff058fc20a448dc4e7d324ff0dc6597e Mon Sep 17 00:00:00 200=
1
>> -From: Ignacio Casal Quinteiro<qignacio@amazon.com>
>> -Date: Wed, 11 Sep 2024 11:52:11 +0200
>> -Subject: [PATCH 1/3] websocket: process the frame as soon as we read =
data
>> -
>> -Otherwise we can enter in a read loop because we were not
>> -validating the data until the all the data was read.
>> -
>> -Fixes #391
>> -
>> -CVE: CVE-2024-52532
>> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/c=
ommit/6adc0e3eb74c257ed4e2a23eb4b2774fdb0d67be#f1d67ca0386b145ea201cf88d2=
7f72724d7c6715]
>> -
>> -Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ----
>> - libsoup/soup-websocket-connection.c | 5 ++---
>> - 1 file changed, 2 insertions(+), 3 deletions(-)
>> -
>> -diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-webso=
cket-connection.c
>> -index a4095e1..65c1492 100644
>> ---- a/libsoup/soup-websocket-connection.c
>> -+++ b/libsoup/soup-websocket-connection.c
>> -@@ -1140,9 +1140,8 @@ soup_websocket_connection_read (SoupWebsocketCo=
nnection *self)
>> -             }
>> -
>> -             pv->incoming->len =3D len + count;
>> --    } while (count > 0);
>> --
>> --    process_incoming (self);
>> -+            process_incoming (self);
>> -+    } while (count > 0 && !pv->close_sent && !pv->io_closing);
>> -
>> -     if (end) {
>> -             if (!pv->close_sent || !pv->close_received) {
>> ---
>> -2.34.1
>> -
>> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-5253=
2-2.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.=
patch
>> deleted file mode 100644
>> index dcadafe944..0000000000
>> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.pat=
ch
>> +++ /dev/null
>> @@ -1,43 +0,0 @@
>> -From f5b76410de1318f49844dacf6e68692522b6c856 Mon Sep 17 00:00:00 200=
1
>> -From: Ignacio Casal Quinteiro<qignacio@amazon.com>
>> -Date: Wed, 2 Oct 2024 11:17:19 +0200
>> -Subject: [PATCH] websocket-test: disconnect error copy after the test=
 ends
>> -
>> -Otherwise the server will have already sent a few more wrong
>> -bytes and the client will continue getting errors to copy
>> -but the error is already !=3D NULL and it will assert
>> -
>> -CVE: CVE-2024-52532
>> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/c=
ommit/29b96fab2512666d7241e46c98cc45b60b795c0c]
>> -
>> -Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ----
>> - tests/websocket-test.c | 5 ++++-
>> - 1 file changed, 4 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/tests/websocket-test.c b/tests/websocket-test.c
>> -index 5e40cf3..1ec9ff6 100644
>> ---- a/tests/websocket-test.c
>> -+++ b/tests/websocket-test.c
>> -@@ -1331,8 +1331,9 @@ test_receive_invalid_encode_length_64 (Test *te=
st,
>> -     GError *error =3D NULL;
>> -     InvalidEncodeLengthTest context =3D { test, NULL };
>> -     guint i;
>> -+    guint error_id;
>> -
>> --    g_signal_connect (test->client, "error", G_CALLBACK (on_error_co=
py), &error);
>> -+    error_id =3D g_signal_connect (test->client, "error", G_CALLBACK=
 (on_error_copy), &error);
>> -     g_signal_connect (test->client, "message", G_CALLBACK (on_binary=
_message), &received);
>> -
>> -     /* We use 127(\x7f) as payload length with 65535 extended length=
 */
>> -@@ -1345,6 +1346,7 @@ test_receive_invalid_encode_length_64 (Test *te=
st,
>> -     WAIT_UNTIL (error !=3D NULL || received !=3D NULL);
>> -     g_assert_error (error, SOUP_WEBSOCKET_ERROR, SOUP_WEBSOCKET_CLOS=
E_PROTOCOL_ERROR);
>> -     g_clear_error (&error);
>> -+    g_signal_handler_disconnect (test->client, error_id);
>> -     g_assert_null (received);
>> -
>> -         g_thread_join (thread);
>> ---
>> -2.34.1
>> -
>> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-5253=
2-3.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.=
patch
>> deleted file mode 100644
>> index ab6af72291..0000000000
>> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.pat=
ch
>> +++ /dev/null
>> @@ -1,48 +0,0 @@
>> -From d97bb2e340f5a6d7e56a7738403f9d18bc406b70 Mon Sep 17 00:00:00 200=
1
>> -From: Simon McVittie<smcv@debian.org>
>> -Date: Wed, 13 Nov 2024 14:14:23 +0000
>> -Subject: [PATCH 3/3] websocket-test: Disconnect error signal in anoth=
er place
>> -
>> -This is the same change as commit 29b96fab "websocket-test: disconnec=
t
>> -error copy after the test ends", and is done for the same reason, but
>> -replicating it into a different function.
>> -
>> -Fixes: 6adc0e3e "websocket: process the frame as soon as we read data=
"
>> -Resolves:https://gitlab.gnome.org/GNOME/libsoup/-/issues/399
>> -Signed-off-by: Simon McVittie<smcv@debian.org>
>> -
>> -CVE: CVE-2024-52532
>> -Upstream-Status: Backport
>> -[https://gitlab.gnome.org/GNOME/libsoup/-/commit/4c9e75c6676a37b64856=
20c332e568e1a3f530ff]
>> -
>> -Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ----
>> - tests/websocket-test.c | 4 +++-
>> - 1 file changed, 3 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/tests/websocket-test.c b/tests/websocket-test.c
>> -index 2b19a7b..0699a06 100644
>> ---- a/tests/websocket-test.c
>> -+++ b/tests/websocket-test.c
>> -@@ -1300,8 +1300,9 @@ test_receive_invalid_encode_length_16 (Test *te=
st,
>> -     GError *error =3D NULL;
>> -     InvalidEncodeLengthTest context =3D { test, NULL };
>> -     guint i;
>> -+    guint error_id;
>> -
>> --    g_signal_connect (test->client, "error", G_CALLBACK (on_error_co=
py), &error);
>> -+    error_id =3D g_signal_connect (test->client, "error", G_CALLBACK=
 (on_error_copy), &error);
>> -     g_signal_connect (test->client, "message", G_CALLBACK (on_binary=
_message), &received);
>> -
>> -     /* We use 126(~) as payload length with 125 extended length */
>> -@@ -1314,6 +1315,7 @@ test_receive_invalid_encode_length_16 (Test *te=
st,
>> -     WAIT_UNTIL (error !=3D NULL || received !=3D NULL);
>> -     g_assert_error (error, SOUP_WEBSOCKET_ERROR, SOUP_WEBSOCKET_CLOS=
E_PROTOCOL_ERROR);
>> -     g_clear_error (&error);
>> -+        g_signal_handler_disconnect (test->client, error_id);
>> -     g_assert_null (received);
>> -
>> -     g_thread_join (thread);
>> ---
>> -2.34.1
>> -
>> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784=
.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.patch
>> deleted file mode 100644
>> index 106f907168..0000000000
>> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.patch
>> +++ /dev/null
>> @@ -1,56 +0,0 @@
>> -From 2eacbd762332795e00692ddab2515c6da23198d3 Mon Sep 17 00:00:00 200=
1
>> -From: Changqing Li<changqing.li@windriver.com>
>> -Date: Mon, 12 May 2025 14:06:41 +0800
>> -Subject: [PATCH] sniffer: Add better coverage of skip_insignificant_s=
pace()
>> -
>> -CVE: CVE-2025-2784
>> -Upstream-Status: Backport
>> -[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/435/diffs?co=
mmit_id=3D242a10fbb12dbdc12d254bd8fc8669a0ac055304;
>> -https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/442/diffs?com=
mit_id=3Dc415ad0b6771992e66c70edf373566c6e247089d]
>> -
>> -Test code is not added since it uses some functions not defined in
>> -version 2.74. These tests are not used now, so just ignore them.
>> -
>> -Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ----
>> - libsoup/soup-content-sniffer.c |  9 +++----
>> - 1 files changed, 3 insertions(+), 4 deletions(-)
>> -
>> -diff --git a/libsoup/soup-content-sniffer.c b/libsoup/soup-content-sn=
iffer.c
>> -index 5f2896e..9554636 100644
>> ---- a/libsoup/soup-content-sniffer.c
>> -+++ b/libsoup/soup-content-sniffer.c
>> -@@ -612,8 +612,10 @@ sniff_text_or_binary (SoupContentSniffer *sniffe=
r, SoupBuffer *buffer)
>> - }
>> -
>> - static gboolean
>> --skip_insignificant_space (const char *resource, int *pos, int resour=
ce_length)
>> -+skip_insignificant_space (const char *resource, gsize *pos, gsize re=
source_length)
>> - {
>> -+    if (*pos >=3D resource_length)
>> -+            return TRUE;
>> -     while ((resource[*pos] =3D=3D '\x09') ||
>> -            (resource[*pos] =3D=3D '\x20') ||
>> -            (resource[*pos] =3D=3D '\x0A') ||
>> -@@ -632,7 +634,7 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, =
SoupBuffer *buffer)
>> - {
>> -     const char *resource =3D (const char *)buffer->data;
>> -     int resource_length =3D MIN (512, buffer->length);
>> --    int pos =3D 0;
>> -+    gsize pos =3D 0;
>> -
>> -     if (resource_length < 3)
>> -             goto text_html;
>> -@@ -642,9 +644,6 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, =
SoupBuffer *buffer)
>> -             pos =3D 3;
>> -
>> -  look_for_tag:
>> --    if (pos > resource_length)
>> --            goto text_html;
>> --
>> -     if (skip_insignificant_space (resource, &pos, resource_length))
>> -             goto text_html;
>> -
>> ---
>> -2.34.1
>> -
>> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-3205=
0.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patc=
h
>> deleted file mode 100644
>> index c032846ef0..0000000000
>> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch
>> +++ /dev/null
>> @@ -1,29 +0,0 @@
>> -From 5709dfffb6fdc5b66ce001bf82a755ad8ad1d992 Mon Sep 17 00:00:00 200=
1
>> -From: Patrick Griffis<pgriffis@igalia.com>
>> -Date: Mon, 28 Oct 2024 12:29:48 -0500
>> -Subject: [PATCH] Fix using int instead of size_t for strcspn return
>> -
>> -CVE: CVE-2025-32050
>> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/c=
ommit/9bb0a55de55c6940ced811a64fbca82fe93a9323]
>> -
>> -Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ----
>> - libsoup/soup-headers.c | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
>> -index 9707ca0..67905b2 100644
>> ---- a/libsoup/soup-headers.c
>> -+++ b/libsoup/soup-headers.c
>> -@@ -902,7 +902,7 @@ append_param_quoted (GString    *string,
>> -                  const char *name,
>> -                  const char *value)
>> - {
>> --    int len;
>> -+    gsize len;
>> -
>> -     g_string_append (string, name);
>> -     g_string_append (string, "=3D\"");
>> ---
>> -2.34.1
>> -
>> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-3205=
2.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patc=
h
>> deleted file mode 100644
>> index 34bc8113a4..0000000000
>> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patch
>> +++ /dev/null
>> @@ -1,32 +0,0 @@
>> -From f4a67a9a3033586edaee715d40d5992e02d32893 Mon Sep 17 00:00:00 200=
1
>> -From: Patrick Griffis<pgriffis@igalia.com>
>> -Date: Sat, 16 Nov 2024 12:07:30 -0600
>> -Subject: [PATCH] Fix heap buffer overflow in soup_content_sniffer_sni=
ff
>> -
>> -Co-Author: Ar Jun<pkillarjun@protonmail.com>
>> -
>> -CVE: CVE-2025-32052
>> -Upstream-Status: Backport
>> -[https://gitlab.gnome.org/GNOME/libsoup/-/commit/f182429e5b1fc0340505=
10da20c93256c4fa9652#500da7cfde649872c49169be34b03a1c42a53ddb]
>> -
>> -Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ----
>> - libsoup/soup-content-sniffer.c | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/libsoup/soup-content-sniffer.c b/libsoup/soup-content-sn=
iffer.c
>> -index 9554636..eac9e7b 100644
>> ---- a/libsoup/soup-content-sniffer.c
>> -+++ b/libsoup/soup-content-sniffer.c
>> -@@ -504,7 +504,7 @@ sniff_unknown (SoupContentSniffer *sniffer, SoupB=
uffer *buffer,
>> -                     guint index_pattern =3D 0;
>> -                     gboolean skip_row =3D FALSE;
>> -
>> --                    while ((index_stream < resource_length) &&
>> -+                    while ((index_stream < resource_length - 1) &&
>> -                            (index_pattern <=3D type_row->pattern_len=
gth)) {
>> -                             /* Skip insignificant white space ("WS" =
in the spec) */
>> -                             if (type_row->pattern[index_pattern] =3D=
=3D ' ') {
>> ---
>> -2.34.1
>> -
>> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-3205=
3.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patc=
h
>> deleted file mode 100644
>> index 0d829d6200..0000000000
>> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch
>> +++ /dev/null
>> @@ -1,39 +0,0 @@
>> -From d9bcffd6cd5e8ec32889a594f7348d67a5101b3a Mon Sep 17 00:00:00 200=
1
>> -From: Changqing Li<changqing.li@windriver.com>
>> -Date: Mon, 12 May 2025 13:58:42 +0800
>> -Subject: [PATCH] Fix heap buffer overflow in
>> - soup-content-sniffer.c:sniff_feed_or_html()
>> -
>> -CVE: CVE-2025-32053
>> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/c=
ommit/eaed42ca8d40cd9ab63764e3d63641180505f40a]
>> -
>> -Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ----
>> - libsoup/soup-content-sniffer.c | 4 ++--
>> - 1 file changed, 2 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/libsoup/soup-content-sniffer.c b/libsoup/soup-content-sn=
iffer.c
>> -index 967ec61..5f2896e 100644
>> ---- a/libsoup/soup-content-sniffer.c
>> -+++ b/libsoup/soup-content-sniffer.c
>> -@@ -620,7 +620,7 @@ skip_insignificant_space (const char *resource, i=
nt *pos, int resource_length)
>> -            (resource[*pos] =3D=3D '\x0D')) {
>> -             *pos =3D *pos + 1;
>> -
>> --            if (*pos > resource_length)
>> -+            if (*pos >=3D resource_length)
>> -                     return TRUE;
>> -     }
>> -
>> -@@ -682,7 +682,7 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, =
SoupBuffer *buffer)
>> -             do {
>> -                     pos++;
>> -
>> --                    if (pos > resource_length)
>> -+                    if ((pos + 1) > resource_length)
>> -                             goto text_html;
>> -             } while (resource[pos] !=3D '>');
>> -
>> ---
>> -2.34.1
>> -
>> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-3290=
6.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906.patc=
h
>> deleted file mode 100644
>> index c33ebf8056..0000000000
>> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906.patch
>> +++ /dev/null
>> @@ -1,71 +0,0 @@
>> -From 4b8809cca4bbcbf9514314d86227f985362258b0 Mon Sep 17 00:00:00 200=
1
>> -From: Patrick Griffis<pgriffis@igalia.com>
>> -Date: Wed, 12 Feb 2025 11:30:02 -0600
>> -Subject: [PATCH] headers: Handle parsing only newlines
>> -
>> -Closes #404
>> -Closes #407
>> -
>> -CVE: CVE-2025-32906
>> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/c=
ommit/af5b9a4a3945c52b940d5ac181ef51bb12011f1f]
>> -
>> -Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ----
>> - libsoup/soup-headers.c      |  4 ++--
>> - tests/header-parsing-test.c | 11 +++++++++++
>> - 2 files changed, 13 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
>> -index e5d3c03..87bb3dc 100644
>> ---- a/libsoup/soup-headers.c
>> -+++ b/libsoup/soup-headers.c
>> -@@ -185,7 +185,7 @@ soup_headers_parse_request (const char          *=
str,
>> -     /* RFC 2616 4.1 "servers SHOULD ignore any empty line(s)
>> -      * received where a Request-Line is expected."
>> -      */
>> --    while ((*str =3D=3D '\r' || *str =3D=3D '\n') && len > 0) {
>> -+    while (len > 0 && (*str =3D=3D '\r' || *str =3D=3D '\n')) {
>> -             str++;
>> -             len--;
>> -     }
>> -@@ -369,7 +369,7 @@ soup_headers_parse_response (const char          =
*str,
>> -      * after a response, which we then see prepended to the next
>> -      * response on that connection.
>> -      */
>> --    while ((*str =3D=3D '\r' || *str =3D=3D '\n') && len > 0) {
>> -+    while (len > 0 && (*str =3D=3D '\r' || *str =3D=3D '\n')) {
>> -             str++;
>> -             len--;
>> -     }
>> -diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.=
c
>> -index c1d3b33..b811115 100644
>> ---- a/tests/header-parsing-test.c
>> -+++ b/tests/header-parsing-test.c
>> -@@ -6,6 +6,10 @@ typedef struct {
>> -     const char *name, *value;
>> - } Header;
>> -
>> -+static char only_newlines[] =3D {
>> -+        '\n', '\n', '\n', '\n'
>> -+};
>> -+
>> - static struct RequestTest {
>> -     const char *description;
>> -     const char *bugref;
>> -@@ -445,6 +449,13 @@ static struct RequestTest {
>> -       SOUP_STATUS_BAD_REQUEST,
>> -            NULL, NULL, -1,
>> -       { { NULL } }
>> -+    },
>> -+
>> -+    { "Only newlines", NULL,
>> -+      only_newlines, sizeof (only_newlines),
>> -+      SOUP_STATUS_BAD_REQUEST,
>> -+           NULL, NULL, -1,
>> -+      { { NULL } }
>> -     }
>> - };
>> - static const int num_reqtests =3D G_N_ELEMENTS (reqtests);
>> ---
>> -2.34.1
>> -
>> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-3290=
7.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patc=
h
>> deleted file mode 100644
>> index 41dd3ff3f4..0000000000
>> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch
>> +++ /dev/null
>> @@ -1,39 +0,0 @@
>> -From 8158b4084dcba2a233dfcb7359c53ab2840148f7 Mon Sep 17 00:00:00 200=
1
>> -From: Milan Crha<mcrha@redhat.com>
>> -Date: Tue, 15 Apr 2025 12:17:39 +0200
>> -Subject: [PATCH 1/2] soup-message-headers: Correct merge of ranges
>> -
>> -It had been skipping every second range, which generated an array
>> -of a lot of insane ranges, causing large memory usage by the server.
>> -
>> -Closes #428
>> -
>> -Part-of:<https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/452>
>> -
>> -CVE: CVE-2025-32907
>> -Upstream-Status: Backport
>> -[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/452/diffs?co=
mmit_id=3D9bb92f7a685e31e10e9e8221d0342280432ce836]
>> -
>> -Test part not applied since test codes use some functions not in this
>> -version
>> -
>> -Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ----
>> - libsoup/soup-message-headers.c |   1 +
>> - 1 files changed, 1 insertions(+)
>> -
>> -diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-he=
aders.c
>> -index 78b2455..00b9763 100644
>> ---- a/libsoup/soup-message-headers.c
>> -+++ b/libsoup/soup-message-headers.c
>> -@@ -1024,6 +1024,7 @@ soup_message_headers_get_ranges_internal (SoupM=
essageHeaders  *hdrs,
>> -                     if (cur->start <=3D prev->end) {
>> -                             prev->end =3D MAX (prev->end, cur->end);
>> -                             g_array_remove_index (array, i);
>> -+                            i--;
>> -                     }
>> -             }
>> -     }
>> ---
>> -2.34.1
>> -
>> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-3290=
9.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32909.patc=
h
>> deleted file mode 100644
>> index 2f5366348d..0000000000
>> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32909.patch
>> +++ /dev/null
>> @@ -1,38 +0,0 @@
>> -From e6e088e62c10ab91fa2f2ad5c122332aa7cde97c Mon Sep 17 00:00:00 200=
1
>> -From: Changqing Li<changqing.li@windriver.com>
>> -Date: Mon, 12 May 2025 16:55:37 +0800
>> -Subject: [PATCH] content-sniffer: Handle sniffing resource shorter th=
an
>> - 4 bytes
>> -
>> -CVE: CVE-2025-32909
>> -Upstream-Status: Backport
>> -[https://gitlab.gnome.org/GNOME/libsoup/-/commit/ba4c3a6f988beff59e45=
801ab36067293d24ce92]
>> -
>> -Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ----
>> - libsoup/soup-content-sniffer.c | 7 ++++++-
>> - 1 file changed, 6 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/libsoup/soup-content-sniffer.c b/libsoup/soup-content-sn=
iffer.c
>> -index eac9e7b..73d2245 100644
>> ---- a/libsoup/soup-content-sniffer.c
>> -+++ b/libsoup/soup-content-sniffer.c
>> -@@ -227,9 +227,14 @@ sniff_mp4 (SoupContentSniffer *sniffer, SoupBuff=
er *buffer)
>> - {
>> -     const char *resource =3D (const char *)buffer->data;
>> -     guint resource_length =3D MIN (512, buffer->length);
>> --    guint32 box_size =3D *((guint32*)resource);
>> -+    guint32 box_size;
>> -     guint i;
>> -
>> -+    if (resource_length < sizeof (guint32))
>> -+            return FALSE;
>> -+
>> -+    box_size =3D *((guint32*)resource);
>> -+
>> - #if __BYTE_ORDER__ =3D=3D __ORDER_LITTLE_ENDIAN__
>> -     box_size =3D ((box_size >> 24) |
>> -                 ((box_size << 8) & 0x00FF0000) |
>> ---
>> -2.34.1
>> -
>> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-3291=
0-1.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.=
patch
>> deleted file mode 100644
>> index c1dc6860f2..0000000000
>> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.pat=
ch
>> +++ /dev/null
>> @@ -1,32 +0,0 @@
>> -From a7e711d0f162c6edc8acad2a96981d4890784ea3 Mon Sep 17 00:00:00 200=
1
>> -From: Changqing Li<changqing.li@windriver.com>
>> -Date: Mon, 12 May 2025 17:02:55 +0800
>> -Subject: [PATCH] auth-digest: Handle missing realm/nonce in authentic=
ate
>> - header
>> -
>> -CVE: CVE-2025-32910
>> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/m=
erge_requests/417/diffs?commit_id=3De40df6d48a1cbab56f5d15016cc861a503423=
cfe]
>> -
>> -Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ----
>> - libsoup/soup-auth-digest.c |  3 +++
>> - 1 files changed, 3 insertions(+)
>> -
>> -diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
>> -index e8ba990..0ab3499 100644
>> ---- a/libsoup/soup-auth-digest.c
>> -+++ b/libsoup/soup-auth-digest.c
>> -@@ -142,6 +142,9 @@ soup_auth_digest_update (SoupAuth *auth, SoupMess=
age *msg,
>> -     guint qop_options;
>> -     gboolean ok =3D TRUE;
>> -
>> -+     if (!soup_auth_get_realm (auth))
>> -+            return FALSE;
>> -+
>> -     g_free (priv->domain);
>> -     g_free (priv->nonce);
>> -     g_free (priv->opaque);
>> -
>> ---
>> -2.34.1
>> -
>> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-3291=
0-2.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.=
patch
>> deleted file mode 100644
>> index 019a35e3be..0000000000
>> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.pat=
ch
>> +++ /dev/null
>> @@ -1,94 +0,0 @@
>> -From eccfca1074fc485a0b60dfb9c8385429a226bf73 Mon Sep 17 00:00:00 200=
1
>> -From: Changqing Li<changqing.li@windriver.com>
>> -Date: Fri, 16 May 2025 13:19:38 +0800
>> -Subject: [PATCH] auth-digest: Handle missing nonce
>> -
>> -CVE: CVE-2025-32910
>> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/m=
erge_requests/417/diffs?commit_id=3D405a8a34597a44bd58c4759e7d5e23f02c3b5=
56a]
>> -
>> -Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ----
>> - libsoup/soup-auth-digest.c | 45 ++++++++++++++++++++++++++++--------=
--
>> - 1 files changed, 28 insertions(+), 10 deletions(-)
>> -
>> -diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
>> -index 0ab3499..10a8591 100644
>> ---- a/libsoup/soup-auth-digest.c
>> -+++ b/libsoup/soup-auth-digest.c
>> -@@ -132,6 +132,19 @@ soup_auth_digest_get_qop (SoupAuthDigestQop qop)
>> -     return g_string_free (out, FALSE);
>> - }
>> -
>> -+static gboolean
>> -+validate_params (SoupAuthDigest *auth_digest)
>> -+{
>> -+    SoupAuthDigestPrivate *priv =3D soup_auth_digest_get_instance_pr=
ivate (auth_digest);
>> -+
>> -+    if (priv->qop || priv->algorithm =3D=3D SOUP_AUTH_DIGEST_ALGORIT=
HM_MD5_SESS) {
>> -+            if (!priv->nonce)
>> -+                    return FALSE;
>> -+    }
>> -+
>> -+    return TRUE;
>> -+}
>> -+
>> - static gboolean
>> - soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
>> -                      GHashTable *auth_params)
>> -@@ -169,17 +182,22 @@ soup_auth_digest_update (SoupAuth *auth, SoupMe=
ssage *msg,
>> -     if (priv->algorithm =3D=3D -1)
>> -             ok =3D FALSE;
>> -
>> --    stale =3D g_hash_table_lookup (auth_params, "stale");
>> --    if (stale && !g_ascii_strcasecmp (stale, "TRUE") && *priv->hex_u=
rp)
>> --            recompute_hex_a1 (priv);
>> --    else {
>> --            g_free (priv->user);
>> --            priv->user =3D NULL;
>> --            g_free (priv->cnonce);
>> --            priv->cnonce =3D NULL;
>> --            memset (priv->hex_urp, 0, sizeof (priv->hex_urp));
>> --            memset (priv->hex_a1, 0, sizeof (priv->hex_a1));
>> --        }
>> -+    if (!validate_params (auth_digest))
>> -+            ok =3D FALSE;
>> -+
>> -+    if (ok) {
>> -+            stale =3D g_hash_table_lookup (auth_params, "stale");
>> -+            if (stale && !g_ascii_strcasecmp (stale, "TRUE") && *pri=
v->hex_urp)
>> -+                    recompute_hex_a1 (priv);
>> -+            else {
>> -+                    g_free (priv->user);
>> -+                    priv->user =3D NULL;
>> -+                    g_free (priv->cnonce);
>> -+                    priv->cnonce =3D NULL;
>> -+                    memset (priv->hex_urp, 0, sizeof (priv->hex_urp)=
);
>> -+                    memset (priv->hex_a1, 0, sizeof (priv->hex_a1));
>> -+            }
>> -+    }
>> -
>> -     return ok;
>> - }
>> -@@ -359,6 +377,8 @@ soup_auth_digest_compute_response (const char    =
    *method,
>> -     if (qop) {
>> -             char tmp[9];
>> -
>> -+            g_assert (cnonce);
>> -+
>> -             g_snprintf (tmp, 9, "%.8x", nc);
>> -             g_checksum_update (checksum, (guchar *)tmp, strlen (tmp)=
);
>> -             g_checksum_update (checksum, (guchar *)":", 1);
>> -@@ -422,6 +442,9 @@ soup_auth_digest_get_authorization (SoupAuth *aut=
h, SoupMessage *msg)
>> -     g_return_val_if_fail (uri !=3D NULL, NULL);
>> -     url =3D soup_uri_to_string (uri, TRUE);
>> -
>> -+    g_assert (priv->nonce);
>> -+    g_assert (!priv->qop || priv->cnonce);
>> -+
>> -     soup_auth_digest_compute_response (msg->method, url, priv->hex_a=
1,
>> -                                        priv->qop, priv->nonce,
>> -                                        priv->cnonce, priv->nc,
>> -
>> ---
>> -2.34.1
>> -
>> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-3291=
0-3.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.=
patch
>> deleted file mode 100644
>> index bdf4d64ca3..0000000000
>> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.pat=
ch
>> +++ /dev/null
>> @@ -1,28 +0,0 @@
>> -From 74c95d54fe42041fe161cb74c76d942ffd37a5dd Mon Sep 17 00:00:00 200=
1
>> -From: Changqing Li<changqing.li@windriver.com>
>> -Date: Fri, 16 May 2025 13:21:43 +0800
>> -Subject: [PATCH] auth-digest: Fix leak
>> -
>> -CVE: CVE-2025-32910
>> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/m=
erge_requests/417/diffs?commit_id=3Dea16eeacb052e423eb5c3b0b705e5eab34b13=
832]
>> -
>> -Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ----
>> - libsoup/soup-auth-digest.c | 1 +
>> - 1 file changed, 1 insertion(+)
>> -
>> -diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
>> -index 10a8591..6d965d2 100644
>> ---- a/libsoup/soup-auth-digest.c
>> -+++ b/libsoup/soup-auth-digest.c
>> -@@ -66,6 +66,7 @@ soup_auth_digest_finalize (GObject *object)
>> -     g_free (priv->nonce);
>> -     g_free (priv->domain);
>> -     g_free (priv->cnonce);
>> -+    g_free (priv->opaque);
>> -
>> -     memset (priv->hex_urp, 0, sizeof (priv->hex_urp));
>> -     memset (priv->hex_a1, 0, sizeof (priv->hex_a1));
>> ---
>> -2.34.1
>> -
>> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-3291=
2.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912.patc=
h
>> deleted file mode 100644
>> index b3ce9d8bc3..0000000000
>> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912.patch
>> +++ /dev/null
>> @@ -1,32 +0,0 @@
>> -From 0984dddb11daf14fdf5ca24077cd0ebda796439a Mon Sep 17 00:00:00 200=
1
>> -From: Changqing Li<changqing.li@windriver.com>
>> -Date: Fri, 16 May 2025 13:25:32 +0800
>> -Subject: [PATCH] auth-digest: Handle missing nonce
>> -
>> -CVE: CVE-2025-32912
>> -Upstream-Status: Backport
>> -[https://gitlab.gnome.org/GNOME/libsoup/-/commit/cd077513f267e43ce4b6=
59eb18a1734d8a369992?merge_request_iid=3D434
>> -https://gitlab.gnome.org/GNOME/libsoup/-/commit/910ebdcd3dd82386717a2=
01c13c834f3a63eed7f]
>> -
>> -Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ----
>> - libsoup/soup-auth-digest.c | 2 +-
>> - 1 files changed, 1 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
>> -index 6d965d2..f1621ec 100644
>> ---- a/libsoup/soup-auth-digest.c
>> -+++ b/libsoup/soup-auth-digest.c
>> -@@ -156,7 +156,7 @@ soup_auth_digest_update (SoupAuth *auth, SoupMess=
age *msg,
>> -     guint qop_options;
>> -     gboolean ok =3D TRUE;
>> -
>> --     if (!soup_auth_get_realm (auth))
>> -+    if (!soup_auth_get_realm (auth) || !g_hash_table_lookup (auth_pa=
rams, "nonce"))
>> -             return FALSE;
>> -
>> -     g_free (priv->domain);
>> -
>> ---
>> -2.34.1
>> -
>> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-3291=
4.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patc=
h
>> deleted file mode 100644
>> index 9f3bb21a25..0000000000
>> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch
>> +++ /dev/null
>> @@ -1,35 +0,0 @@
>> -From ac844b9fc7945c38ea21fb7cf1a49a5c226d7c9c Mon Sep 17 00:00:00 200=
1
>> -From: Changqing Li<changqing.li@windriver.com>
>> -Date: Mon, 12 May 2025 16:17:20 +0800
>> -Subject: [PATCH] Resolve "(CVE-2025-32914) (#YWH-PGM9867-23) OOB Read=
 on
>> - libsoup through function "soup_multipart_new_from_message" in
>> - soup-multipart.c leads to crash or exit of process"
>> -
>> -CVE: CVE-2025-32914
>> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/m=
erge_requests/450/diffs?commit_id=3D5bfcf8157597f2d327050114fb37ff600004d=
bcf]
>> -
>> -Test code are not added since some functions not aligned with version
>> -2.74.3
>> -
>> -Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ----
>> - libsoup/soup-multipart.c |  2 +-
>> - 1 files changed, 1 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
>> -index a7e550f..dd93973 100644
>> ---- a/libsoup/soup-multipart.c
>> -+++ b/libsoup/soup-multipart.c
>> -@@ -181,7 +181,7 @@ soup_multipart_new_from_message (SoupMessageHeade=
rs *headers,
>> -                     return NULL;
>> -             }
>> -
>> --            split =3D strstr (start, "\r\n\r\n");
>> -+            split =3D g_strstr_len (start, body_end - start, "\r\n\r=
\n");
>> -             if (!split || split > end) {
>> -                     soup_multipart_free (multipart);
>> -                     soup_buffer_free (flattened);
>> -
>> ---
>> -2.34.1
>> -
>> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476=
.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch
>> deleted file mode 100644
>> index 874f62e7ad..0000000000
>> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch
>> +++ /dev/null
>> @@ -1,38 +0,0 @@
>> -From 52a0f9234d384b9dab368835b22e5a5a01542168 Mon Sep 17 00:00:00 200=
1
>> -From: Changqing Li<changqing.li@windriver.com>
>> -Date: Fri, 16 May 2025 14:16:10 +0800
>> -Subject: [PATCH] auth-digest: fix crash in
>> - soup_auth_digest_get_protection_space()
>> -
>> -We need to validate the Domain parameter in the WWW-Authenticate head=
er.
>> -
>> -Unfortunately this crash only occurs when listening on default ports =
80
>> -and 443, so there's no good way to test for this. The test would requ=
ire
>> -running as root.
>> -
>> -Fixes #440
>> -
>> -CVE: CVE-2025-4476
>> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/c=
ommit/e64c221f9c7d09b48b610c5626b3b8c400f0907c?merge_request_iid=3D457]
>> -
>> -Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ----
>> - libsoup/soup-auth-digest.c | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
>> -index f1621ec..a2dc560 100644
>> ---- a/libsoup/soup-auth-digest.c
>> -+++ b/libsoup/soup-auth-digest.c
>> -@@ -229,7 +229,7 @@ soup_auth_digest_get_protection_space (SoupAuth *=
auth, SoupURI *source_uri)
>> -                     uri =3D soup_uri_new (d);
>> -                     if (uri && uri->scheme =3D=3D source_uri->scheme=
 &&
>> -                         uri->port =3D=3D source_uri->port &&
>> --                        !strcmp (uri->host, source_uri->host))
>> -+                        !g_strcmp0 (uri->host, source_uri->host))
>> -                             dir =3D g_strdup (uri->path);
>> -                     else
>> -                             dir =3D NULL;
>> ---
>> -2.34.1
>> -
>> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4642=
0.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patc=
h
>> deleted file mode 100644
>> index c970661694..0000000000
>> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch
>> +++ /dev/null
>> @@ -1,61 +0,0 @@
>> -From 81e03c538d6a102406114567f4f1c468033ce2e4 Mon Sep 17 00:00:00 200=
1
>> -From: Patrick Griffis<pgriffis@igalia.com>
>> -Date: Thu, 26 Dec 2024 18:31:42 -0600
>> -Subject: [PATCH] soup_header_parse_quality_list: Fix leak
>> -
>> -When iterating over the parsed list we now steal the allocated string=
s that we want and then free_full the list which may contain remaining st=
rings.
>> -
>> -CVE: CVE-2025-46420
>> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/m=
erge_requests/421/diffs?commit_id=3Dc9083869ec2a3037e6df4bd86b45c419ba295=
f8e]
>> -
>> - Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ----
>> - libsoup/soup-headers.c | 11 +++++------
>> - 1 file changed, 5 insertions(+), 6 deletions(-)
>> -
>> -diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
>> -index 87bb3dc..9707ca0 100644
>> ---- a/libsoup/soup-headers.c
>> -+++ b/libsoup/soup-headers.c
>> -@@ -528,7 +528,7 @@ soup_header_parse_quality_list (const char *heade=
r, GSList **unacceptable)
>> -     GSList *unsorted;
>> -     QualityItem *array;
>> -     GSList *sorted, *iter;
>> --    char *item, *semi;
>> -+    char *semi;
>> -     const char *param, *equal, *value;
>> -     double qval;
>> -     int n;
>> -@@ -541,9 +541,8 @@ soup_header_parse_quality_list (const char *heade=
r, GSList **unacceptable)
>> -     unsorted =3D soup_header_parse_list (header);
>> -     array =3D g_new0 (QualityItem, g_slist_length (unsorted));
>> -     for (iter =3D unsorted, n =3D 0; iter; iter =3D iter->next) {
>> --            item =3D iter->data;
>> -             qval =3D 1.0;
>> --            for (semi =3D strchr (item, ';'); semi; semi =3D strchr =
(semi + 1, ';')) {
>> -+            for (semi =3D strchr (iter->data, ';'); semi; semi =3D s=
trchr (semi + 1, ';')) {
>> -                     param =3D skip_lws (semi + 1);
>> -                     if (*param !=3D 'q')
>> -                             continue;
>> -@@ -575,15 +574,15 @@ soup_header_parse_quality_list (const char *hea=
der, GSList **unacceptable)
>> -             if (qval =3D=3D 0.0) {
>> -                     if (unacceptable) {
>> -                             *unacceptable =3D g_slist_prepend (*unac=
ceptable,
>> --                                                             item);
>> -+                                                             g_steal=
_pointer (&iter->data));
>> -                     }
>> -             } else {
>> --                    array[n].item =3D item;
>> -+                    array[n].item =3D g_steal_pointer (&iter->data);
>> -                     array[n].qval =3D qval;
>> -                     n++;
>> -             }
>> -     }
>> --    g_slist_free (unsorted);
>> -+    g_slist_free_full (unsorted, g_free);
>> -
>> -     qsort (array, n, sizeof (QualityItem), sort_by_qval);
>> -     sorted =3D NULL;
>> ---
>> -2.34.1
>> -
>> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4642=
1.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patc=
h
>> deleted file mode 100644
>> index 3318093400..0000000000
>> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
>> +++ /dev/null
>> @@ -1,47 +0,0 @@
>> -From 5eb225f02bb35de56cfeedd87bde716bf1cb750b Mon Sep 17 00:00:00 200=
1
>> -From: Patrick Griffis<pgriffis@igalia.com>
>> -Date: Wed, 5 Feb 2025 16:18:10 -0600
>> -Subject: [PATCH] session: Strip authentication credentails on
>> - cross-origin redirect
>> -
>> -This should match the behavior of Firefox and Safari but not of Chrom=
ium.
>> -
>> -CVE: CVE-2025-46421
>> -Upstream-Status: Backport
>> -[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/436/diffs?co=
mmit_id=3D3e5c26415811f19e7737238bb23305ffaf96f66b]
>> -
>> -Test code not added since it included some headers not in version 2.7=
4.3
>> -
>> -Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ----
>> - libsoup/soup-session.c |  8 ++++-
>> - 2 files changed, 85 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/libsoup/soup-session.c b/libsoup/soup-session.c
>> -index 83421ef..8d6ac61 100644
>> ---- a/libsoup/soup-session.c
>> -+++ b/libsoup/soup-session.c
>> -@@ -1189,12 +1189,18 @@ soup_session_redirect_message (SoupSession *s=
ession, SoupMessage *msg)
>> -                                                SOUP_ENCODING_NONE);
>> -     }
>> -
>> -+    /* Strip all credentials on cross-origin redirect. */
>> -+    if (!soup_uri_host_equal (soup_message_get_uri (msg), new_uri)) =
{
>> -+            soup_message_headers_remove (msg->request_headers, "Auth=
orization");
>> -+            soup_message_set_auth (msg, NULL);
>> -+    }
>> -+
>> -     soup_message_set_uri (msg, new_uri);
>> -     soup_uri_free (new_uri);
>> -
>> -     soup_session_requeue_message (session, msg);
>> -     return TRUE;
>> --}
>> -+}
>> -
>> - static void
>> - redirect_handler (SoupMessage *msg, gpointer user_data)
>> -
>> ---
>> -2.34.1
>> -
>> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4945=
.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4945.patch
>> deleted file mode 100644
>> index c9fbdbacc8..0000000000
>> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4945.patch
>> +++ /dev/null
>> @@ -1,117 +0,0 @@
>> -From 3844026f74a41dd9ccab955899e005995293d246 Mon Sep 17 00:00:00 200=
1
>> -From: Changqing Li<changqing.li@windriver.com>
>> -Date: Tue, 8 Jul 2025 14:58:30 +0800
>> -Subject: [PATCH] soup-date-utils: Add value checks for date/time pars=
ing
>> -
>> -Reject date/time when it does not represent a valid value.
>> -
>> -Closes #448
>> -
>> -CVE: CVE-2025-4945
>> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/c=
ommit/8988379984e33dcc7d3aa58551db13e48755959f]
>> -
>> -Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ----
>> - libsoup/soup-date.c  | 21 +++++++++++++++------
>> - tests/cookies-test.c | 10 ++++++++++
>> - 2 files changed, 25 insertions(+), 6 deletions(-)
>> -
>> -diff --git a/libsoup/soup-date.c b/libsoup/soup-date.c
>> -index 9602d1f..4c114c1 100644
>> ---- a/libsoup/soup-date.c
>> -+++ b/libsoup/soup-date.c
>> -@@ -284,7 +284,7 @@ parse_day (SoupDate *date, const char **date_stri=
ng)
>> -     while (*end =3D=3D ' ' || *end =3D=3D '-')
>> -             end++;
>> -     *date_string =3D end;
>> --    return TRUE;
>> -+    return date->day >=3D 1 && date->day <=3D 31;
>> - }
>> -
>> - static inline gboolean
>> -@@ -324,7 +324,7 @@ parse_year (SoupDate *date, const char **date_str=
ing)
>> -     while (*end =3D=3D ' ' || *end =3D=3D '-')
>> -             end++;
>> -     *date_string =3D end;
>> --    return TRUE;
>> -+    return date->year > 0 && date->year < 9999;
>> - }
>> -
>> - static inline gboolean
>> -@@ -348,7 +348,7 @@ parse_time (SoupDate *date, const char **date_str=
ing)
>> -     while (*p =3D=3D ' ')
>> -             p++;
>> -     *date_string =3D p;
>> --    return TRUE;
>> -+    return  date->hour >=3D 0 && date->hour < 24 && date->minute >=3D=
 0 && date->minute < 60 && date->second >=3D 0 && date->second < 60;
>> - }
>> -
>> - static inline gboolean
>> -@@ -361,8 +361,15 @@ parse_timezone (SoupDate *date, const char **dat=
e_string)
>> -             gulong val;
>> -             int sign =3D (**date_string =3D=3D '+') ? -1 : 1;
>> -             val =3D strtoul (*date_string + 1, (char **)date_string,=
 10);
>> -+            if (val > 9999)
>> -+                    return FALSE;
>> -             if (**date_string =3D=3D ':')
>> --                    val =3D 60 * val + strtoul (*date_string + 1, (c=
har **)date_string, 10);
>> -+            {
>> -+                    gulong val2 =3D strtoul (*date_string + 1, (char=
 **)date_string, 10);
>> -+                    if (val > 99 || val2 > 99)
>> -+                            return FALSE;
>> -+                    val =3D 60 * val + val2;
>> -+            }
>> -             else
>> -                     val =3D  60 * (val / 100) + (val % 100);
>> -             date->offset =3D sign * val;
>> -@@ -407,7 +414,8 @@ parse_textual_date (SoupDate *date, const char *d=
ate_string)
>> -             if (!parse_month (date, &date_string) ||
>> -                 !parse_day (date, &date_string) ||
>> -                 !parse_time (date, &date_string) ||
>> --                !parse_year (date, &date_string))
>> -+                !parse_year (date, &date_string) ||
>> -+                !g_date_valid_dmy(date->day, date->month, date->year=
))
>> -                     return FALSE;
>> -
>> -             /* There shouldn't be a timezone, but check anyway */
>> -@@ -419,7 +427,8 @@ parse_textual_date (SoupDate *date, const char *d=
ate_string)
>> -             if (!parse_day (date, &date_string) ||
>> -                 !parse_month (date, &date_string) ||
>> -                 !parse_year (date, &date_string) ||
>> --                !parse_time (date, &date_string))
>> -+                !parse_time (date, &date_string) ||
>> -+                !g_date_valid_dmy(date->day, date->month, date->year=
))
>> -                     return FALSE;
>> -
>> -             /* This time there *should* be a timezone, but we
>> -diff --git a/tests/cookies-test.c b/tests/cookies-test.c
>> -index 2e2a54f..6035a86 100644
>> ---- a/tests/cookies-test.c
>> -+++ b/tests/cookies-test.c
>> -@@ -413,6 +413,15 @@ do_remove_feature_test (void)
>> -     soup_uri_free (uri);
>> - }
>> -
>> -+static void
>> -+do_cookies_parsing_int32_overflow (void)
>> -+{
>> -+    SoupCookie *cookie =3D soup_cookie_parse ("Age=3D1;expires=3D3Ma=
r9    999:9:9+ 999999999-age=3Dmain=3Dgne=3D", NULL);
>> -+    g_assert_nonnull (cookie);
>> -+    g_assert_null (soup_cookie_get_expires (cookie));
>> -+    soup_cookie_free (cookie);
>> -+}
>> -+
>> - int
>> - main (int argc, char **argv)
>> - {
>> -@@ -434,6 +443,7 @@ main (int argc, char **argv)
>> -     g_test_add_func ("/cookies/accept-policy-subdomains", do_cookies=
_subdomain_policy_test);
>> -     g_test_add_func ("/cookies/parsing", do_cookies_parsing_test);
>> -     g_test_add_func ("/cookies/parsing/no-path-null-origin", do_cook=
ies_parsing_nopath_nullorigin);
>> -+    g_test_add_func ("/cookies/parsing/int32-overflow", do_cookies_p=
arsing_int32_overflow);
>> -     g_test_add_func ("/cookies/get-cookies/empty-host", do_get_cooki=
es_empty_host_test);
>> -     g_test_add_func ("/cookies/remove-feature", do_remove_feature_te=
st);
>> -     g_test_add_func ("/cookies/secure-cookies", do_cookies_strict_se=
cure_test);
>> ---
>> -2.34.1
>> -
>> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948=
.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch
>> deleted file mode 100644
>> index b15b8c763d..0000000000
>> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch
>> +++ /dev/null
>> @@ -1,38 +0,0 @@
>> -From dfdc9b3cc73e6fe88cc12792ba00e14642572339 Mon Sep 17 00:00:00 200=
1
>> -From: Milan Crha<mcrha@redhat.com>
>> -Date: Thu, 15 May 2025 17:49:11 +0200
>> -Subject: [PATCH] soup-multipart: Verify boundary limits for multipart=
 body
>> -
>> -It could happen that the boundary started at a place which resulted i=
nto
>> -a negative number, which in an unsigned integer is a very large value.
>> -Check the body size is not a negative value before setting it.
>> -
>> -Closeshttps://gitlab.gnome.org/GNOME/libsoup/-/issues/449
>> -
>> -Part-of:<https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/463>
>> -
>> -CVE: CVE-2025-4948
>> -Upstream-Status: Backport
>> -[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/463/diffs?co=
mmit_id=3Df2f28afe0b3b2b3009ab67d6874457ec6bac70c0]
>> -
>> -Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ----
>> - libsoup/soup-multipart.c | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
>> -index dd93973..ce2fc10 100644
>> ---- a/libsoup/soup-multipart.c
>> -+++ b/libsoup/soup-multipart.c
>> -@@ -214,7 +214,7 @@ soup_multipart_new_from_message (SoupMessageHeade=
rs *headers,
>> -              */
>> -             part_body =3D soup_buffer_new_subbuffer (flattened,
>> -                                                    split - flattened=
->data,
>> --                                                   end - 2 - split);
>> -+                                                   end - 2 >=3D spli=
t ? end - 2 - split : 0);
>> -             g_ptr_array_add (multipart->bodies, part_body);
>> -
>> -             start =3D end;
>> ---
>> -2.34.1
>> -
>> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969=
.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
>> deleted file mode 100644
>> index 7bc3e8da99..0000000000
>> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
>> +++ /dev/null
>> @@ -1,37 +0,0 @@
>> -From a7d0c58608ed830bedfb6b92aea11e00feb55aa9 Mon Sep 17 00:00:00 200=
1
>> -From: Milan Crha<mcrha@redhat.com>
>> -Date: Mon, 19 May 2025 17:48:27 +0200
>> -Subject: [PATCH] soup-multipart: Verify array bounds before accessing=
 its
>> - members
>> -
>> -The boundary could be at a place which, calculated, pointed
>> -before the beginning of the array. Check the bounds, to avoid
>> -read out of the array bounds.
>> -
>> -Closeshttps://gitlab.gnome.org/GNOME/libsoup/-/issues/447
>> -
>> -CVE: CVE-2025-4969
>> -Upstream-Status: Backport
>> -[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/467/diffs?co=
mmit_id=3Db5b4dd10d4810f0c87b4eaffe88504f06e502f33]
>> -
>> -Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ----
>> - libsoup/soup-multipart.c | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
>> -index ce2fc10..a29cdf0 100644
>> ---- a/libsoup/soup-multipart.c
>> -+++ b/libsoup/soup-multipart.c
>> -@@ -108,7 +108,7 @@ find_boundary (const char *start, const char *end=
,
>> -                     continue;
>> -
>> -             /* Check that it's at start of line */
>> --            if (!(b =3D=3D start || (b[-1] =3D=3D '\n' && b[-2] =3D=3D=
 '\r')))
>> -+            if (!(b =3D=3D start || (b - start >=3D 2 && b[-1] =3D=3D=
 '\n' && b[-2] =3D=3D '\r')))
>> -                     continue;
>> -
>> -             /* Check for "--" or "\r\n" after boundary */
>> ---
>> -2.34.1
>> -
>> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/m=
eta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
>> deleted file mode 100644
>> index 68ec576d9b..0000000000
>> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
>> +++ /dev/null
>> @@ -1,87 +0,0 @@
>> -SUMMARY =3D "An HTTP library implementation in C"
>> -DESCRIPTION =3D "libsoup is an HTTP client/server library for GNOME. =
It uses GObjects \
>> -and the glib main loop, to integrate well with GNOME applications."
>> -HOMEPAGE =3D"https://wiki.gnome.org/Projects/libsoup"
>> -BUGTRACKER =3D"https://bugzilla.gnome.org/"
>> -SECTION =3D "x11/gnome/libs"
>> -LICENSE =3D "LGPL-2.0-only"
>> -LIC_FILES_CHKSUM =3D"file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec5=
22ec2"
>> -
>> -DEPENDS =3D "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl"
>> -
>> -SHRT_VER =3D"${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split=
('.')[1]}"
>> -
>> -SRC_URI =3D "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz=
 \
>> -file://0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch \
>> -file://0001-CVE-2025-32911.patch \
>> -file://0001-Fix-possibly-uninitialized-warnings.patch \
>> -file://0001-Remove-http-and-https-aliases-support-test.patch \
>> -file://CVE-2024-52532-1.patch \
>> -file://CVE-2024-52532-2.patch \
>> -file://CVE-2024-52532-3.patch \
>> -file://CVE-2025-32053.patch \
>> -file://CVE-2025-2784.patch \
>> -file://CVE-2024-52530.patch \
>> -file://CVE-2025-32906.patch \
>> -file://CVE-2025-32914.patch \
>> -file://CVE-2025-46420.patch \
>> -file://CVE-2025-46421.patch \
>> -file://CVE-2025-32050.patch \
>> -file://CVE-2025-32052.patch \
>> -file://CVE-2025-32909.patch \
>> -file://CVE-2025-32910-1.patch \
>> -file://CVE-2025-32910-2.patch \
>> -file://CVE-2025-32910-3.patch \
>> -file://CVE-2025-32912.patch \
>> -file://CVE-2024-52531-1.patch \
>> -file://CVE-2024-52531-2.patch \
>> -file://CVE-2025-4476.patch \
>> -file://CVE-2025-32907.patch \
>> -file://CVE-2025-4948.patch \
>> -file://CVE-2025-4969.patch \
>> -file://CVE-2025-4945.patch \
>> -"
>> -SRC_URI[sha256sum] =3D "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a03=
4153df1413fa1d92f13"
>> -
>> -CVE_PRODUCT =3D "libsoup"
>> -
>> -S =3D "${UNPACKDIR}/libsoup-${PV}"
>> -
>> -inherit meson gettext pkgconfig upstream-version-is-even gobject-intr=
ospection gtk-doc
>> -
>> -UPSTREAM_CHECK_REGEX =3D "libsoup-(?P<pver>2(\.(?!99)\d+)+)\.tar"
>> -
>> -GIR_MESON_ENABLE_FLAG =3D 'enabled'
>> -GIR_MESON_DISABLE_FLAG =3D 'disabled'
>> -
>> -PACKAGECONFIG ??=3D ""
>> -PACKAGECONFIG[brotli] =3D "-Dbrotli=3Denabled,-Dbrotli=3Ddisabled,bro=
tli"
>> -# libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards
>> -PACKAGECONFIG[gnome] =3D "-Dgnome=3Dtrue,-Dgnome=3Dfalse"
>> -PACKAGECONFIG[gssapi] =3D "-Dgssapi=3Denabled,-Dgssapi=3Ddisabled,krb=
5"
>> -PACKAGECONFIG[ntlm] =3D "-Dntlm=3Denabled,-Dntlm=3Ddisabled"
>> -PACKAGECONFIG[sysprof] =3D "-Dsysprof=3Denabled,-Dsysprof=3Ddisabled,=
sysprof"
>> -
>> -# Tell libsoup where the target ntlm_auth is installed
>> -do_write_config:append:class-target() {
>> -    cat >${WORKDIR}/soup.cross <<EOF
>> -[binaries]
>> -ntlm_auth =3D '${bindir}/ntlm_auth'
>> -EOF
>> -}
>> -EXTRA_OEMESON:append:class-target =3D " --cross-file ${WORKDIR}/soup.=
cross"
>> -
>> -EXTRA_OEMESON +=3D "-Dvapi=3Ddisabled -Dtls_check=3Dfalse"
>> -
>> -GTKDOC_MESON_OPTION =3D "gtk_doc"
>> -
>> -# When built without gnome support, libsoup-2.4 will contain only one=
 shared lib
>> -# and will therefore become subject to renaming by debian.bbclass. Pr=
event
>> -# renaming in order to keep the package name consistent regardless of=
 whether
>> -# gnome support is enabled or disabled.
>> -DEBIAN_NOAUTONAME:${PN} =3D "1"
>> -
>> -# glib-networking is needed for SSL, proxies, etc.
>> -RRECOMMENDS:${PN} =3D "glib-networking"
>> -
>> -BBCLASSEXTEND =3D "native nativesdk"
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#125832):https://lists.openembedded.org/g/openembed=
ded-devel/message/125832
>> Mute This Topic:https://lists.openembedded.org/mt/118574993/6084445
>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub =
[skandigraun@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--------------UyOBVZKVi0m0grYDjleVBXW0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#ffffff">
    <div class="moz-cite-prefix">On 3/30/26 15:18, Gyorgy Sarvari wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:5fccef59-b730-4b5e-a366-89196d5e326b@gmail.com">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

Personally I am not against the idea of dropping this, but it looks
there are a couple of other recipes depending on it:
<a class="moz-txt-link-freetext" href="https://layers.openembedded.org/layerindex/branch/master/recipes/?q=depends%3Alibsoup-2.4">https://layers.openembedded.org/layerindex/branch/master/recipes/?q=depends%3Alibsoup-2.4</a></pre>
    </blockquote>
    Thanks.&nbsp; I do missed some recipes.&nbsp;&nbsp;
    <blockquote type="cite" cite="mid:5fccef59-b730-4b5e-a366-89196d5e326b@gmail.com">
      <pre wrap="" class="moz-quote-pre">
(the list has some recipes from the meta-oe repo also, not only 3rd
party layers)</pre>
    </blockquote>
    <p>Do we need to wait all the&nbsp;<span style="white-space: pre-wrap">3rd </span><span style="white-space: pre-wrap">party layers to switch to soup3 before remove recipe </span>libsoup-2.4?&nbsp;</p>
    <p><br>
    </p>
    <p>There are 4 recipes under meta-opebembeded that depends on
      libsoup-2.4,&nbsp; and I list the status of it below:</p>
    <p>meta-networking/recipes-support/strongswan/strongswan_6.0.4.bb:51:PACKAGECONFIG[soup]
      = &quot;--enable-soup,--disable-soup,libsoup-2.4,${PN}-plugin-soup&quot;<br>
meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb:8:DEPENDS =
      &quot;gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad
      gstreamer1.0-rtsp-server json-glib libdaemon libsoup-2.4 jansson&quot;<br>
      meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb:10:DEPENDS =
      &quot;libxml2 glib-2.0 libsoup-2.4 intltool-native liboauth gcr3
      json-glib&quot;<br>
meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb:14:DEPENDS
      = &quot;gtk+3 gdk-pixbuf libsoup-2.4 json-glib gnome-common-native&quot;<br>
      <br>
      <br>
      For strongswan,&nbsp; current 6.0.4 actually depends on soup3, this
      need to be fixed,&nbsp; refer:<br>
<a class="moz-txt-link-freetext" href="https://github.com/strongswan/strongswan/commit/6ddabf52d5f335147601c7c2797da21820efafb8">https://github.com/strongswan/strongswan/commit/6ddabf52d5f335147601c7c2797da21820efafb8</a><br>
      <br>
      For libtimezonemap,&nbsp; debian 0.4.6-7 already port to soup3,&nbsp; what
      we used is libtimezonemap_0.4.6.orig.tar.gz, we upgrade to
      libtimezonemap_0.4.6-7.debian.tar.xz.&nbsp;<br>
      Refer: <a class="moz-txt-link-freetext" href="https://github.com/linuxmint/cinnamon/issues/11001">https://github.com/linuxmint/cinnamon/issues/11001</a><br>
      <br>
      For libgdata, already archived, no maintainer,&nbsp; it will not
      support libsoup3 later.<br>
      <a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/Archive/libgdata">https://gitlab.gnome.org/Archive/libgdata</a><br>
      The one who depends on libgdata:&nbsp;<br>
meta-gnome/recipes-gnome/gvfs/gvfs_1.60.0.bb:63:PACKAGECONFIG[google] =
      &quot;-Dgoogle=true, -Dgoogle=false, libgdata&quot;&nbsp; &nbsp;disabled by default<br>
      And upstream gvfs already disable google option,&nbsp; maybe we can
      remove google option, and disable google option explicitly?&nbsp;<br>
      refer:&nbsp;<br>
      <a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/gvfs/-/merge_requests/266">https://gitlab.gnome.org/GNOME/gvfs/-/merge_requests/266</a><br>
      <a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/Archive/libgdata/-/merge_requests/49">https://gitlab.gnome.org/Archive/libgdata/-/merge_requests/49</a><br>
      <br>
      <br>
      For gstd, the lastest commit is 2 years ago, There is an issue for
      this: <a class="moz-txt-link-freetext" href="https://github.com/RidgeRun/gstd-1.x/pull/326">https://github.com/RidgeRun/gstd-1.x/pull/326</a>, but&nbsp;<br>
      stil open,&nbsp; depends on libsoup-2.4 cannot be removed:&nbsp;&nbsp;<br>
      <a class="moz-txt-link-freetext" href="https://github.com/RidgeRun/gstd-1.x/tree/master">https://github.com/RidgeRun/gstd-1.x/tree/master</a></p>
    <p><br>
    </p>
    <p>Regards</p>
    <p>Changqing</p>
    <blockquote type="cite" cite="mid:5fccef59-b730-4b5e-a366-89196d5e326b@gmail.com">
      <pre wrap="" class="moz-quote-pre">


On 3/30/26 08:31, Changqing Li via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">remove deprecated libsoup-2.4, no one depends on it now

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 .../libsoup-2.4/0001-CVE-2025-32911.patch     |  74 ---------
 ...ild-with-libxml2-2.12.0-and-clang-17.patch |  44 -----
 ...-Fix-possibly-uninitialized-warnings.patch |  43 -----
 ...-http-and-https-aliases-support-test.patch | 145 -----------------
 .../libsoup/libsoup-2.4/CVE-2024-52530.patch  | 150 ------------------
 .../libsoup-2.4/CVE-2024-52531-1.patch        |  39 -----
 .../libsoup-2.4/CVE-2024-52531-2.patch        | 133 ----------------
 .../libsoup-2.4/CVE-2024-52532-1.patch        |  37 -----
 .../libsoup-2.4/CVE-2024-52532-2.patch        |  43 -----
 .../libsoup-2.4/CVE-2024-52532-3.patch        |  48 ------
 .../libsoup/libsoup-2.4/CVE-2025-2784.patch   |  56 -------
 .../libsoup/libsoup-2.4/CVE-2025-32050.patch  |  29 ----
 .../libsoup/libsoup-2.4/CVE-2025-32052.patch  |  32 ----
 .../libsoup/libsoup-2.4/CVE-2025-32053.patch  |  39 -----
 .../libsoup/libsoup-2.4/CVE-2025-32906.patch  |  71 ---------
 .../libsoup/libsoup-2.4/CVE-2025-32907.patch  |  39 -----
 .../libsoup/libsoup-2.4/CVE-2025-32909.patch  |  38 -----
 .../libsoup-2.4/CVE-2025-32910-1.patch        |  32 ----
 .../libsoup-2.4/CVE-2025-32910-2.patch        |  94 -----------
 .../libsoup-2.4/CVE-2025-32910-3.patch        |  28 ----
 .../libsoup/libsoup-2.4/CVE-2025-32912.patch  |  32 ----
 .../libsoup/libsoup-2.4/CVE-2025-32914.patch  |  35 ----
 .../libsoup/libsoup-2.4/CVE-2025-4476.patch   |  38 -----
 .../libsoup/libsoup-2.4/CVE-2025-46420.patch  |  61 -------
 .../libsoup/libsoup-2.4/CVE-2025-46421.patch  |  47 ------
 .../libsoup/libsoup-2.4/CVE-2025-4945.patch   | 117 --------------
 .../libsoup/libsoup-2.4/CVE-2025-4948.patch   |  38 -----
 .../libsoup/libsoup-2.4/CVE-2025-4969.patch   |  37 -----
 .../libsoup/libsoup-2.4_2.74.3.bb             |  87 ----------
 29 files changed, 1706 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-possibly-uninitialized-warnings.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Remove-http-and-https-aliases-support-test.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-1.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32909.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4945.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb

diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch
deleted file mode 100644
index d75594bb4f..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 52c5859b82fe79f2c32d883e048d218e0d7f2182 Mon Sep 17 00:00:00 2001
-From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
-Date: Wed, 30 Apr 2025 14:59:55 +0800
-Subject: [PATCH] CVE-2025-32911
-
-CVE: CVE-2025-32911 CVE-2025-32913
-Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/422/commits">https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/422/commits</a>]
-
-Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
----
- libsoup/soup-message-headers.c | 13 +++++++++----
- tests/header-parsing-test.c    | 15 +++++++++++++++
- 2 files changed, 24 insertions(+), 4 deletions(-)
-
-diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers.c
-index 39ad14a..78b2455 100644
---- a/libsoup/soup-message-headers.c
-+++ b/libsoup/soup-message-headers.c
-@@ -1454,10 +1454,15 @@ soup_message_headers_get_content_disposition (SoupMessageHeaders  *hdrs,
-      */
-     if (params &amp;&amp; g_hash_table_lookup_extended (*params, &quot;filename&quot;,
-                                                 &amp;orig_key, &amp;orig_value)) {
--            char *filename = strrchr (orig_value, '/');
--
--            if (filename)
--                    g_hash_table_insert (*params, g_strdup (orig_key), filename + 1);
-+                if (orig_value) {
-+                        char *filename = strrchr (orig_value, '/');
-+
-+                        if (filename)
-+                                g_hash_table_insert (*params, g_strdup (orig_key), g_strdup(filename + 1));
-+                } else {
-+                        /* filename with no value isn't valid. */
-+                        g_hash_table_remove (*params, &quot;filename&quot;);
-+                }
-     }
-     return TRUE;
- }
-diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
-index 946f118..752196e 100644
---- a/tests/header-parsing-test.c
-+++ b/tests/header-parsing-test.c
-@@ -1034,6 +1034,7 @@ do_param_list_tests (void)
- #define RFC5987_TEST_HEADER_FALLBACK &quot;attachment; filename*=Unknown''t%FF%FF%FFst.txt; filename=\&quot;test.txt\&quot;&quot;
- #define RFC5987_TEST_HEADER_NO_TYPE  &quot;filename=\&quot;test.txt\&quot;&quot;
- #define RFC5987_TEST_HEADER_NO_TYPE_2  &quot;filename=\&quot;test.txt\&quot;; foo=bar&quot;
-+#define RFC5987_TEST_HEADER_EMPTY_FILENAME &quot;;filename&quot;
-
- static void
- do_content_disposition_tests (void)
-@@ -1133,6 +1134,20 @@ do_content_disposition_tests (void)
-     g_assert_cmpstr (filename, ==, RFC5987_TEST_FALLBACK_FILENAME);
-         parameter2 = g_hash_table_lookup (params, &quot;foo&quot;);
-         g_assert_cmpstr (parameter2, ==, &quot;bar&quot;);
-+    g_hash_table_destroy (params);
-+
-+     /* Empty filename */
-+    soup_message_headers_clear (hdrs);
-+    soup_message_headers_append (hdrs, &quot;Content-Disposition&quot;,
-+                                                             RFC5987_TEST_HEADER_EMPTY_FILENAME);
-+    if (!soup_message_headers_get_content_disposition (hdrs,
-+                                                                                                       &amp;disposition,
-+                                                                                                       &amp;params)) {
-+                    soup_test_assert (FALSE, &quot;empty filename decoding FAILED&quot;);
-+                    return;
-+    }
-+    g_free (disposition);
-+    g_assert_false (g_hash_table_contains (params, &quot;filename&quot;));
-     g_hash_table_destroy (params);
-
-     soup_message_headers_free (hdrs);
---
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch
deleted file mode 100644
index d867e5bc17..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From ced3c5d8cad0177b297666343f1561799dfefb0d Mon Sep 17 00:00:00 2001
-From: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
-Date: Wed, 22 Nov 2023 18:49:10 -0800
-Subject: [PATCH] Fix build with libxml2-2.12.0 and clang-17
-
-Fixes build errors about missing function prototypes with clang-17
-
-Fixes
-| ../libsoup-2.74.3/libsoup/soup-xmlrpc-old.c:512:8: error: call to undeclared function 'xmlParseMemory'; ISO C99 and later do not support implicit function declarations
-
-Upstream-Status: Submitted [<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/385">https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/385</a>]
-Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
----
- libsoup/soup-xmlrpc-old.c | 1 +
- libsoup/soup-xmlrpc.c     | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/libsoup/soup-xmlrpc-old.c b/libsoup/soup-xmlrpc-old.c
-index c57086b6..527e3b23 100644
---- a/libsoup/soup-xmlrpc-old.c
-+++ b/libsoup/soup-xmlrpc-old.c
-@@ -11,6 +11,7 @@
-
- #include &lt;string.h&gt;
-
-+#include &lt;libxml/parser.h&gt;
- #include &lt;libxml/tree.h&gt;
-
- #include &quot;soup-xmlrpc-old.h&quot;
-diff --git a/libsoup/soup-xmlrpc.c b/libsoup/soup-xmlrpc.c
-index 42dcda9c..e991cbf0 100644
---- a/libsoup/soup-xmlrpc.c
-+++ b/libsoup/soup-xmlrpc.c
-@@ -17,6 +17,7 @@
-
- #include &lt;string.h&gt;
- #include &lt;errno.h&gt;
-+#include &lt;libxml/parser.h&gt;
- #include &lt;libxml/tree.h&gt;
- #include &quot;soup-xmlrpc.h&quot;
- #include &quot;soup.h&quot;
---
-2.43.0
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-possibly-uninitialized-warnings.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-possibly-uninitialized-warnings.patch
deleted file mode 100644
index fcd442c13a..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-possibly-uninitialized-warnings.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 1159686379184a1c899eabb2174258aba5e0fd79 Mon Sep 17 00:00:00 2001
-From: Patrick Griffis <a class="moz-txt-link-rfc2396E" href="mailto:pgriffis@igalia.com">&lt;pgriffis@igalia.com&gt;</a>
-Date: Mon, 20 Sep 2021 15:41:31 -0500
-Subject: [PATCH] Fix possibly uninitialized warnings
-
-Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/commit/fb98e9a8c3062c75357b961543af091de2dd5459">https://gitlab.gnome.org/GNOME/libsoup/-/commit/fb98e9a8c3062c75357b961543af091de2dd5459</a>]
-
-Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
----
- libsoup/soup-websocket-connection.c | 2 +-
- tests/samesite-test.c               | 3 +++
- 2 files changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-websocket-connection.c
-index 65c1492..585d45c 100644
---- a/libsoup/soup-websocket-connection.c
-+++ b/libsoup/soup-websocket-connection.c
-@@ -471,7 +471,7 @@ send_message (SoupWebsocketConnection *self,
-     GByteArray *bytes;
-     gsize frame_len;
-     guint8 *outer;
--    guint8 mask_offset;
-+    guint8 mask_offset = 0;
-     GBytes *filtered_bytes;
-     GList *l;
-     GError *error = NULL;
-diff --git a/tests/samesite-test.c b/tests/samesite-test.c
-index 0b081b2..60c9b8e 100644
---- a/tests/samesite-test.c
-+++ b/tests/samesite-test.c
-@@ -60,6 +60,9 @@ assert_highest_policy_visible (GSList *cookies, SoupSameSitePolicy policy)
-     case SOUP_SAME_SITE_POLICY_NONE:
-             expected_count = 1;
-             break;
-+    default:
-+            g_assert_not_reached ();
-+            break;
-     }
-
-     g_assert_cmpuint (size, ==, expected_count);
---
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Remove-http-and-https-aliases-support-test.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Remove-http-and-https-aliases-support-test.patch
deleted file mode 100644
index 0d4139ec08..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Remove-http-and-https-aliases-support-test.patch
+++ /dev/null
@@ -1,145 +0,0 @@
-From 0e3bfa22b23451531caf8cc30b1771ac6a41fcad Mon Sep 17 00:00:00 2001
-From: Carlos Garcia Campos <a class="moz-txt-link-rfc2396E" href="mailto:cgarcia@igalia.com">&lt;cgarcia@igalia.com&gt;</a>
-Date: Thu, 11 Feb 2021 10:47:09 +0100
-Subject: [PATCH] Remove http and https aliases support test
-
-Upstream has removed the whole function of http and https aliases
-support, this commit partially cherry pick it, only remove the test to
-mute the warning:
-| ../libsoup-2.74.3/tests/server-test.c: In function 'do_one_server_aliases_test':
-| ../libsoup-2.74.3/tests/server-test.c:180:17: warning: 'g_socket_client_set_tls_validation_flags' is deprecated [-Wdeprecated-declarations]
-|   180 |                 g_socket_client_set_tls_validation_flags (client, 0);
-|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/commit/111ae4ebe7cc2e389573cff5b9ac76509d6cbac0">https://gitlab.gnome.org/GNOME/libsoup/-/commit/111ae4ebe7cc2e389573cff5b9ac76509d6cbac0</a>]
-
-Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
----
- tests/server-test.c | 104 --------------------------------------------
- 1 file changed, 104 deletions(-)
-
-diff --git a/tests/server-test.c b/tests/server-test.c
-index 8976103..cb7e815 100644
---- a/tests/server-test.c
-+++ b/tests/server-test.c
-@@ -154,108 +154,6 @@ do_star_test (ServerData *sd, gconstpointer test_data)
-     soup_uri_free (star_uri);
- }
-
--static void
--do_one_server_aliases_test (SoupURI    *uri,
--                        const char *alias,
--                        gboolean    succeed)
--{
--    GSocketClient *client;
--    GSocketConnectable *addr;
--    GSocketConnection *conn;
--    GInputStream *in;
--    GOutputStream *out;
--    GError *error = NULL;
--    GString *req;
--    static char buf[1024];
--
--    debug_printf (1, &quot;  %s via %s\n&quot;, alias, uri-&gt;scheme);
--
--    /* There's no way to make libsoup's client side send an absolute
--     * URI (to a non-proxy server), so we have to fake this.
--     */
--
--    client = g_socket_client_new ();
--    if (uri-&gt;scheme == SOUP_URI_SCHEME_HTTPS) {
--            g_socket_client_set_tls (client, TRUE);
--            g_socket_client_set_tls_validation_flags (client, 0);
--    }
--    addr = g_network_address_new (uri-&gt;host, uri-&gt;port);
--
--    conn = g_socket_client_connect (client, addr, NULL, &amp;error);
--    g_object_unref (addr);
--    g_object_unref (client);
--    if (!conn) {
--            g_assert_no_error (error);
--            g_error_free (error);
--            return;
--    }
--
--    in = g_io_stream_get_input_stream (G_IO_STREAM (conn));
--    out = g_io_stream_get_output_stream (G_IO_STREAM (conn));
--
--    req = g_string_new (NULL);
--    g_string_append_printf (req, &quot;GET %s://%s:%d HTTP/1.1\r\n&quot;,
--                            alias, uri-&gt;host, uri-&gt;port);
--    g_string_append_printf (req, &quot;Host: %s:%d\r\n&quot;,
--                            uri-&gt;host, uri-&gt;port);
--    g_string_append (req, &quot;Connection: close\r\n\r\n&quot;);
--
--    if (!g_output_stream_write_all (out, req-&gt;str, req-&gt;len, NULL, NULL, &amp;error)) {
--            g_assert_no_error (error);
--            g_error_free (error);
--            g_object_unref (conn);
--            g_string_free (req, TRUE);
--            return;
--    }
--    g_string_free (req, TRUE);
--
--    if (!g_input_stream_read_all (in, buf, sizeof (buf), NULL, NULL, &amp;error)) {
--            g_assert_no_error (error);
--            g_error_free (error);
--            g_object_unref (conn);
--            return;
--    }
--
--    if (succeed)
--            g_assert_true (g_str_has_prefix (buf, &quot;HTTP/1.1 200 &quot;));
--    else
--            g_assert_true (g_str_has_prefix (buf, &quot;HTTP/1.1 400 &quot;));
--
--    g_io_stream_close (G_IO_STREAM (conn), NULL, NULL);
--    g_object_unref (conn);
--}
--
--static void
--do_server_aliases_test (ServerData *sd, gconstpointer test_data)
--{
--    char *http_aliases[] = { &quot;dav&quot;, NULL };
--    char *https_aliases[] = { &quot;davs&quot;, NULL };
--    char *http_good[] = { &quot;http&quot;, &quot;dav&quot;, NULL };
--    char *http_bad[] = { &quot;https&quot;, &quot;davs&quot;, &quot;fred&quot;, NULL };
--    char *https_good[] = { &quot;https&quot;, &quot;davs&quot;, NULL };
--    char *https_bad[] = { &quot;http&quot;, &quot;dav&quot;, &quot;fred&quot;, NULL };
--    int i;
--
--    g_test_bug (&quot;703694&quot;);
--
--    g_object_set (G_OBJECT (sd-&gt;server),
--                  SOUP_SERVER_HTTP_ALIASES, http_aliases,
--                  SOUP_SERVER_HTTPS_ALIASES, https_aliases,
--                  NULL);
--
--    for (i = 0; http_good[i]; i++)
--            do_one_server_aliases_test (sd-&gt;base_uri, http_good[i], TRUE);
--    for (i = 0; http_bad[i]; i++)
--            do_one_server_aliases_test (sd-&gt;base_uri, http_bad[i], FALSE);
--
--    if (tls_available) {
--            for (i = 0; https_good[i]; i++)
--                    do_one_server_aliases_test (sd-&gt;ssl_base_uri, https_good[i], TRUE);
--            for (i = 0; https_bad[i]; i++)
--                    do_one_server_aliases_test (sd-&gt;ssl_base_uri, https_bad[i], FALSE);
--    }
--}
--
- static void
- do_dot_dot_test (ServerData *sd, gconstpointer test_data)
- {
-@@ -1382,8 +1280,6 @@ main (int argc, char **argv)
-
-     g_test_add (&quot;/server/OPTIONS *&quot;, ServerData, NULL,
-                 server_setup, do_star_test, server_teardown);
--    g_test_add (&quot;/server/aliases&quot;, ServerData, NULL,
--                server_setup, do_server_aliases_test, server_teardown);
-     g_test_add (&quot;/server/..-in-path&quot;, ServerData, NULL,
-                 server_setup, do_dot_dot_test, server_teardown);
-     g_test_add (&quot;/server/ipv6&quot;, ServerData, NULL,
---
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patch
deleted file mode 100644
index 04713850e1..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patch
+++ /dev/null
@@ -1,150 +0,0 @@
-From 4a2bb98e03d79146c729dca52c8d6edc635218ff Mon Sep 17 00:00:00 2001
-From: Patrick Griffis <a class="moz-txt-link-rfc2396E" href="mailto:pgriffis@igalia.com">&lt;pgriffis@igalia.com&gt;</a>
-Date: Mon, 8 Jul 2024 12:33:15 -0500
-Subject: [PATCH] headers: Strictly don't allow NUL bytes
-
-In the past (2015) this was allowed for some problematic sites. However Chromium also does not allow NUL bytes in either header names or values these days. So this should no longer be a problem.
-
-CVE: CVE-2024-52530
-Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/402/diffs?commit_id=04df03bc092ac20607f3e150936624d4f536e68b">https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/402/diffs?commit_id=04df03bc092ac20607f3e150936624d4f536e68b</a>]
-
-Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
----
- libsoup/soup-headers.c      | 15 +++------
- tests/header-parsing-test.c | 62 +++++++++++++++++--------------------
- 2 files changed, 32 insertions(+), 45 deletions(-)
-
-diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
-index eec28ad..e5d3c03 100644
---- a/libsoup/soup-headers.c
-+++ b/libsoup/soup-headers.c
-@@ -50,13 +50,14 @@ soup_headers_parse (const char *str, int len, SoupMessageHeaders *dest)
-      * ignorable trailing whitespace.
-      */
-
-+    /* No '\0's are allowed */
-+    if (memchr (str, '\0', len))
-+            return FALSE;
-+
-     /* Skip over the Request-Line / Status-Line */
-     headers_start = memchr (str, '\n', len);
-     if (!headers_start)
-             return FALSE;
--    /* No '\0's in the Request-Line / Status-Line */
--    if (memchr (str, '\0', headers_start - str))
--            return FALSE;
-
-     /* We work on a copy of the headers, which we can write '\0's
-      * into, so that we don't have to individually g_strndup and
-@@ -68,14 +69,6 @@ soup_headers_parse (const char *str, int len, SoupMessageHeaders *dest)
-     headers_copy[copy_len] = '\0';
-     value_end = headers_copy;
-
--    /* There shouldn't be any '\0's in the headers already, but
--     * this is the web we're talking about.
--     */
--    while ((p = memchr (headers_copy, '\0', copy_len))) {
--            memmove (p, p + 1, copy_len - (p - headers_copy));
--            copy_len--;
--    }
--
-     while (*(value_end + 1)) {
-             name = value_end + 1;
-             name_end = strchr (name, ':');
-diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
-index 752196e..c1d3b33 100644
---- a/tests/header-parsing-test.c
-+++ b/tests/header-parsing-test.c
-@@ -358,24 +358,6 @@ static struct RequestTest {
-       }
-     },
-
--    { &quot;NUL in header name&quot;, &quot;760832&quot;,
--      &quot;GET / HTTP/1.1\r\nHost\x00: example.com\r\n&quot;, 36,
--      SOUP_STATUS_OK,
--      &quot;GET&quot;, &quot;/&quot;, SOUP_HTTP_1_1,
--      { { &quot;Host&quot;, &quot;example.com&quot; },
--        { NULL }
--      }
--    },
--
--    { &quot;NUL in header value&quot;, &quot;760832&quot;,
--      &quot;GET / HTTP/1.1\r\nHost: example\x00&quot; &quot;com\r\n&quot;, 35,
--      SOUP_STATUS_OK,
--      &quot;GET&quot;, &quot;/&quot;, SOUP_HTTP_1_1,
--      { { &quot;Host&quot;, &quot;examplecom&quot; },
--        { NULL }
--      }
--    },
--
-     /************************/
-     /*** INVALID REQUESTS ***/
-     /************************/
-@@ -448,6 +430,21 @@ static struct RequestTest {
-       SOUP_STATUS_EXPECTATION_FAILED,
-       NULL, NULL, -1,
-       { { NULL } }
-+    },
-+
-+    // <a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/issues/377">https://gitlab.gnome.org/GNOME/libsoup/-/issues/377</a>
-+    { &quot;NUL in header name&quot;, NULL,
-+      &quot;GET / HTTP/1.1\r\nHost\x00: example.com\r\n&quot;, 36,
-+      SOUP_STATUS_BAD_REQUEST,
-+      NULL, NULL, -1,
-+      { { NULL } }
-+    },
-+
-+    { &quot;NUL in header value&quot;, NULL,
-+      &quot;HTTP/1.1 200 OK\r\nFoo: b\x00&quot; &quot;ar\r\n&quot;, 28,
-+      SOUP_STATUS_BAD_REQUEST,
-+           NULL, NULL, -1,
-+      { { NULL } }
-     }
- };
- static const int num_reqtests = G_N_ELEMENTS (reqtests);
-@@ -620,22 +617,6 @@ static struct ResponseTest {
-         { NULL } }
-     },
-
--    { &quot;NUL in header name&quot;, &quot;760832&quot;,
--      &quot;HTTP/1.1 200 OK\r\nF\x00oo: bar\r\n&quot;, 28,
--      SOUP_HTTP_1_1, SOUP_STATUS_OK, &quot;OK&quot;,
--      { { &quot;Foo&quot;, &quot;bar&quot; },
--        { NULL }
--      }
--    },
--
--    { &quot;NUL in header value&quot;, &quot;760832&quot;,
--      &quot;HTTP/1.1 200 OK\r\nFoo: b\x00&quot; &quot;ar\r\n&quot;, 28,
--      SOUP_HTTP_1_1, SOUP_STATUS_OK, &quot;OK&quot;,
--      { { &quot;Foo&quot;, &quot;bar&quot; },
--        { NULL }
--      }
--    },
--
-     /********************************/
-     /*** VALID CONTINUE RESPONSES ***/
-     /********************************/
-@@ -768,6 +749,19 @@ static struct ResponseTest {
-       { { NULL }
-       }
-     },
-+
-+    // <a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/issues/377">https://gitlab.gnome.org/GNOME/libsoup/-/issues/377</a>
-+    { &quot;NUL in header name&quot;, NULL,
-+      &quot;HTTP/1.1 200 OK\r\nF\x00oo: bar\r\n&quot;, 28,
-+      -1, 0, NULL,
-+      { { NULL } }
-+    },
-+
-+    { &quot;NUL in header value&quot;, &quot;760832&quot;,
-+      &quot;HTTP/1.1 200 OK\r\nFoo: b\x00&quot; &quot;ar\r\n&quot;, 28,
-+      -1, 0, NULL,
-+      { { NULL } }
-+    },
- };
- static const int num_resptests = G_N_ELEMENTS (resptests);
-
---
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-1.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-1.patch
deleted file mode 100644
index 9de0310c8d..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-1.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 8331e681c85c3b1893d8d5193783f631bfc07acb Mon Sep 17 00:00:00 2001
-From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
-Date: Fri, 16 May 2025 13:42:08 +0800
-Subject: [PATCH] tests: Add test for passing invalid UTF-8 to
- soup_header_parse_semi_param_list()
-
-CVE: CVE-2024-52531
-Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/407/diffs?commit_id=825fda3425546847b42ad5270544e9388ff349fe">https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/407/diffs?commit_id=825fda3425546847b42ad5270544e9388ff349fe</a>]
-
-Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
----
- tests/header-parsing-test.c | 11 +++++++++++
- 1 file changed, 11 insertions(+)
-
-diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
-index b811115..cfcc003 100644
---- a/tests/header-parsing-test.c
-+++ b/tests/header-parsing-test.c
-@@ -836,6 +836,17 @@ static struct ParamListTest {
-         { &quot;filename&quot;, &quot;t\xC3\xA9st.txt&quot; },
-       },
-     },
-+
-+/* This tests invalid UTF-8 data which *should* never be passed here but it was designed to be robust against it. */
-+    { TRUE,
-+      &quot;invalid*=\x69\x27\x27\x93\x93\x93\x93\xff\x61\x61\x61\x61\x61\x61\x61\x62\x63\x64\x65\x0a; filename*=iso-8859-1''\x69\x27\x27\x93\x93\x93\x93\xff\x61\x61\x61\x61\x61\x61\x61\x62\x63\x64\x65\x0a; foo&quot;,
-+       {
-+            { &quot;filename&quot;, &quot;i''\302\223\302\223\302\223\302\223\303\277aaaaaaabcde&quot; },
-+            { &quot;invalid&quot;, &quot;\302\223\302\223\302\223\302\223\303\277aaaaaaabcde&quot; },
-+            { &quot;foo&quot;, NULL },
-+       },
-+    }
-+
- };
- static const int num_paramlisttests = G_N_ELEMENTS (paramlisttests);
-
---
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.patch
deleted file mode 100644
index 740c28c016..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.patch
+++ /dev/null
@@ -1,133 +0,0 @@
-From 12523a592f1216450d18706bcf6c16e0f1ab0ce0 Mon Sep 17 00:00:00 2001
-From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
-Date: Fri, 16 May 2025 13:52:37 +0800
-Subject: [PATCH] headers: Be more robust against invalid input when
- parsing params
-
-If you pass invalid input to a function such as soup_header_parse_param_list_strict()
-it can cause an overflow if it decodes the input to UTF-8.
-
-This should never happen with valid UTF-8 input which libsoup's client API
-ensures, however it's server API does not currently.
-
-CVE: CVE-2024-52531
-Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/407/diffs?commit_id=a35222dd0bfab2ac97c10e86b95f762456628283">https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/407/diffs?commit_id=a35222dd0bfab2ac97c10e86b95f762456628283</a>]
-
-Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
----
- libsoup/soup-headers.c | 45 +++++++++++++++++++++---------------------
- 1 file changed, 23 insertions(+), 22 deletions(-)
-
-diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
-index 67905b2..39e8d34 100644
---- a/libsoup/soup-headers.c
-+++ b/libsoup/soup-headers.c
-@@ -642,8 +642,9 @@ soup_header_contains (const char *header, const char *token)
- }
-
- static void
--decode_quoted_string (char *quoted_string)
-+decode_quoted_string_inplace (GString *quoted_gstring)
- {
-+    char *quoted_string = quoted_gstring-&gt;str;
-     char *src, *dst;
-
-     src = quoted_string + 1;
-@@ -657,10 +658,11 @@ decode_quoted_string (char *quoted_string)
- }
-
- static gboolean
--decode_rfc5987 (char *encoded_string)
-+decode_rfc5987_inplace (GString *encoded_gstring)
- {
-     char *q, *decoded;
-     gboolean iso_8859_1 = FALSE;
-+    const char *encoded_string = encoded_gstring-&gt;str;
-
-     q = strchr (encoded_string, '\'');
-     if (!q)
-@@ -689,14 +691,7 @@ decode_rfc5987 (char *encoded_string)
-             decoded = utf8;
-     }
-
--    /* If encoded_string was UTF-8, then each 3-character %-escape
--     * will be converted to a single byte, and so decoded is
--     * shorter than encoded_string. If encoded_string was
--     * iso-8859-1, then each 3-character %-escape will be
--     * converted into at most 2 bytes in UTF-8, and so it's still
--     * shorter.
--     */
--    strcpy (encoded_string, decoded);
-+    g_string_assign (encoded_gstring, decoded);
-     g_free (decoded);
-     return TRUE;
- }
-@@ -706,15 +701,16 @@ parse_param_list (const char *header, char delim, gboolean strict)
- {
-     GHashTable *params;
-     GSList *list, *iter;
--    char *item, *eq, *name_end, *value;
--    gboolean override, duplicated;
-
-     params = g_hash_table_new_full (soup_str_case_hash,
-                                     soup_str_case_equal,
--                                    g_free, NULL);
-+                                    g_free, g_free);
-
-     list = parse_list (header, delim);
-     for (iter = list; iter; iter = iter-&gt;next) {
-+            char *item, *eq, *name_end;
-+            gboolean override, duplicated;
-+            GString *parsed_value = NULL;
-             item = iter-&gt;data;
-             override = FALSE;
-
-@@ -729,19 +725,19 @@ parse_param_list (const char *header, char delim, gboolean strict)
-
-                     *name_end = '\0';
-
--                    value = (char *)skip_lws (eq + 1);
-+                    parsed_value = g_string_new ((char *)skip_lws (eq + 1));
-
-                     if (name_end[-1] == '*' &amp;&amp; name_end &gt; item + 1) {
-                             name_end[-1] = '\0';
--                            if (!decode_rfc5987 (value)) {
-+                            if (!decode_rfc5987_inplace (parsed_value)) {
-+                                    g_string_free (parsed_value, TRUE);
-                                     g_free (item);
-                                     continue;
-                             }
-                             override = TRUE;
--                    } else if (*value == '&quot;')
--                            decode_quoted_string (value);
--            } else
--                    value = NULL;
-+                    } else if (parsed_value-&gt;str[0] == '&quot;')
-+                            decode_quoted_string_inplace (parsed_value);
-+                    }
-
-             duplicated = g_hash_table_lookup_extended (params, item, NULL, NULL);
-
-@@ -749,11 +745,16 @@ parse_param_list (const char *header, char delim, gboolean strict)
-                     soup_header_free_param_list (params);
-                     params = NULL;
-                     g_slist_foreach (iter, (GFunc)g_free, NULL);
-+                    if (parsed_value)
-+                            g_string_free (parsed_value, TRUE);
-                     break;
--            } else if (override || !duplicated)
--                    g_hash_table_replace (params, item, value);
--            else
-+            } else if (override || !duplicated) {
-+                    g_hash_table_replace (params, item, parsed_value ? g_string_free (parsed_value, FALSE) : NULL);
-+            } else {
-+                    if (parsed_value)
-+                            g_string_free (parsed_value, TRUE);
-                     g_free (item);
-+            }
-     }
-
-     g_slist_free (list);
---
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch
deleted file mode 100644
index cb1f096110..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From a693d49bff058fc20a448dc4e7d324ff0dc6597e Mon Sep 17 00:00:00 2001
-From: Ignacio Casal Quinteiro <a class="moz-txt-link-rfc2396E" href="mailto:qignacio@amazon.com">&lt;qignacio@amazon.com&gt;</a>
-Date: Wed, 11 Sep 2024 11:52:11 +0200
-Subject: [PATCH 1/3] websocket: process the frame as soon as we read data
-
-Otherwise we can enter in a read loop because we were not
-validating the data until the all the data was read.
-
-Fixes #391
-
-CVE: CVE-2024-52532
-Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/commit/6adc0e3eb74c257ed4e2a23eb4b2774fdb0d67be#f1d67ca0386b145ea201cf88d27f72724d7c6715">https://gitlab.gnome.org/GNOME/libsoup/-/commit/6adc0e3eb74c257ed4e2a23eb4b2774fdb0d67be#f1d67ca0386b145ea201cf88d27f72724d7c6715</a>]
-
-Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
----
- libsoup/soup-websocket-connection.c | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-websocket-connection.c
-index a4095e1..65c1492 100644
---- a/libsoup/soup-websocket-connection.c
-+++ b/libsoup/soup-websocket-connection.c
-@@ -1140,9 +1140,8 @@ soup_websocket_connection_read (SoupWebsocketConnection *self)
-             }
-
-             pv-&gt;incoming-&gt;len = len + count;
--    } while (count &gt; 0);
--
--    process_incoming (self);
-+            process_incoming (self);
-+    } while (count &gt; 0 &amp;&amp; !pv-&gt;close_sent &amp;&amp; !pv-&gt;io_closing);
-
-     if (end) {
-             if (!pv-&gt;close_sent || !pv-&gt;close_received) {
---
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch
deleted file mode 100644
index dcadafe944..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From f5b76410de1318f49844dacf6e68692522b6c856 Mon Sep 17 00:00:00 2001
-From: Ignacio Casal Quinteiro <a class="moz-txt-link-rfc2396E" href="mailto:qignacio@amazon.com">&lt;qignacio@amazon.com&gt;</a>
-Date: Wed, 2 Oct 2024 11:17:19 +0200
-Subject: [PATCH] websocket-test: disconnect error copy after the test ends
-
-Otherwise the server will have already sent a few more wrong
-bytes and the client will continue getting errors to copy
-but the error is already != NULL and it will assert
-
-CVE: CVE-2024-52532
-Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/commit/29b96fab2512666d7241e46c98cc45b60b795c0c">https://gitlab.gnome.org/GNOME/libsoup/-/commit/29b96fab2512666d7241e46c98cc45b60b795c0c</a>]
-
-Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
----
- tests/websocket-test.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/tests/websocket-test.c b/tests/websocket-test.c
-index 5e40cf3..1ec9ff6 100644
---- a/tests/websocket-test.c
-+++ b/tests/websocket-test.c
-@@ -1331,8 +1331,9 @@ test_receive_invalid_encode_length_64 (Test *test,
-     GError *error = NULL;
-     InvalidEncodeLengthTest context = { test, NULL };
-     guint i;
-+    guint error_id;
-
--    g_signal_connect (test-&gt;client, &quot;error&quot;, G_CALLBACK (on_error_copy), &amp;error);
-+    error_id = g_signal_connect (test-&gt;client, &quot;error&quot;, G_CALLBACK (on_error_copy), &amp;error);
-     g_signal_connect (test-&gt;client, &quot;message&quot;, G_CALLBACK (on_binary_message), &amp;received);
-
-     /* We use 127(\x7f) as payload length with 65535 extended length */
-@@ -1345,6 +1346,7 @@ test_receive_invalid_encode_length_64 (Test *test,
-     WAIT_UNTIL (error != NULL || received != NULL);
-     g_assert_error (error, SOUP_WEBSOCKET_ERROR, SOUP_WEBSOCKET_CLOSE_PROTOCOL_ERROR);
-     g_clear_error (&amp;error);
-+    g_signal_handler_disconnect (test-&gt;client, error_id);
-     g_assert_null (received);
-
-         g_thread_join (thread);
---
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch
deleted file mode 100644
index ab6af72291..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From d97bb2e340f5a6d7e56a7738403f9d18bc406b70 Mon Sep 17 00:00:00 2001
-From: Simon McVittie <a class="moz-txt-link-rfc2396E" href="mailto:smcv@debian.org">&lt;smcv@debian.org&gt;</a>
-Date: Wed, 13 Nov 2024 14:14:23 +0000
-Subject: [PATCH 3/3] websocket-test: Disconnect error signal in another place
-
-This is the same change as commit 29b96fab &quot;websocket-test: disconnect
-error copy after the test ends&quot;, and is done for the same reason, but
-replicating it into a different function.
-
-Fixes: 6adc0e3e &quot;websocket: process the frame as soon as we read data&quot;
-Resolves: <a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/issues/399">https://gitlab.gnome.org/GNOME/libsoup/-/issues/399</a>
-Signed-off-by: Simon McVittie <a class="moz-txt-link-rfc2396E" href="mailto:smcv@debian.org">&lt;smcv@debian.org&gt;</a>
-
-CVE: CVE-2024-52532
-Upstream-Status: Backport
-[<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/commit/4c9e75c6676a37b6485620c332e568e1a3f530ff">https://gitlab.gnome.org/GNOME/libsoup/-/commit/4c9e75c6676a37b6485620c332e568e1a3f530ff</a>]
-
-Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
----
- tests/websocket-test.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/tests/websocket-test.c b/tests/websocket-test.c
-index 2b19a7b..0699a06 100644
---- a/tests/websocket-test.c
-+++ b/tests/websocket-test.c
-@@ -1300,8 +1300,9 @@ test_receive_invalid_encode_length_16 (Test *test,
-     GError *error = NULL;
-     InvalidEncodeLengthTest context = { test, NULL };
-     guint i;
-+    guint error_id;
-
--    g_signal_connect (test-&gt;client, &quot;error&quot;, G_CALLBACK (on_error_copy), &amp;error);
-+    error_id = g_signal_connect (test-&gt;client, &quot;error&quot;, G_CALLBACK (on_error_copy), &amp;error);
-     g_signal_connect (test-&gt;client, &quot;message&quot;, G_CALLBACK (on_binary_message), &amp;received);
-
-     /* We use 126(~) as payload length with 125 extended length */
-@@ -1314,6 +1315,7 @@ test_receive_invalid_encode_length_16 (Test *test,
-     WAIT_UNTIL (error != NULL || received != NULL);
-     g_assert_error (error, SOUP_WEBSOCKET_ERROR, SOUP_WEBSOCKET_CLOSE_PROTOCOL_ERROR);
-     g_clear_error (&amp;error);
-+        g_signal_handler_disconnect (test-&gt;client, error_id);
-     g_assert_null (received);
-
-     g_thread_join (thread);
---
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.patch
deleted file mode 100644
index 106f907168..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 2eacbd762332795e00692ddab2515c6da23198d3 Mon Sep 17 00:00:00 2001
-From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
-Date: Mon, 12 May 2025 14:06:41 +0800
-Subject: [PATCH] sniffer: Add better coverage of skip_insignificant_space()
-
-CVE: CVE-2025-2784
-Upstream-Status: Backport
-[<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/435/diffs?commit_id=242a10fbb12dbdc12d254bd8fc8669a0ac055304">https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/435/diffs?commit_id=242a10fbb12dbdc12d254bd8fc8669a0ac055304</a>;
- <a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/442/diffs?commit_id=c415ad0b6771992e66c70edf373566c6e247089d">https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/442/diffs?commit_id=c415ad0b6771992e66c70edf373566c6e247089d</a>]
-
-Test code is not added since it uses some functions not defined in
-version 2.74. These tests are not used now, so just ignore them.
-
-Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
----
- libsoup/soup-content-sniffer.c |  9 +++----
- 1 files changed, 3 insertions(+), 4 deletions(-)
-
-diff --git a/libsoup/soup-content-sniffer.c b/libsoup/soup-content-sniffer.c
-index 5f2896e..9554636 100644
---- a/libsoup/soup-content-sniffer.c
-+++ b/libsoup/soup-content-sniffer.c
-@@ -612,8 +612,10 @@ sniff_text_or_binary (SoupContentSniffer *sniffer, SoupBuffer *buffer)
- }
-
- static gboolean
--skip_insignificant_space (const char *resource, int *pos, int resource_length)
-+skip_insignificant_space (const char *resource, gsize *pos, gsize resource_length)
- {
-+    if (*pos &gt;= resource_length)
-+            return TRUE;
-     while ((resource[*pos] == '\x09') ||
-            (resource[*pos] == '\x20') ||
-            (resource[*pos] == '\x0A') ||
-@@ -632,7 +634,7 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, SoupBuffer *buffer)
- {
-     const char *resource = (const char *)buffer-&gt;data;
-     int resource_length = MIN (512, buffer-&gt;length);
--    int pos = 0;
-+    gsize pos = 0;
-
-     if (resource_length &lt; 3)
-             goto text_html;
-@@ -642,9 +644,6 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, SoupBuffer *buffer)
-             pos = 3;
-
-  look_for_tag:
--    if (pos &gt; resource_length)
--            goto text_html;
--
-     if (skip_insignificant_space (resource, &amp;pos, resource_length))
-             goto text_html;
-
---
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch
deleted file mode 100644
index c032846ef0..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 5709dfffb6fdc5b66ce001bf82a755ad8ad1d992 Mon Sep 17 00:00:00 2001
-From: Patrick Griffis <a class="moz-txt-link-rfc2396E" href="mailto:pgriffis@igalia.com">&lt;pgriffis@igalia.com&gt;</a>
-Date: Mon, 28 Oct 2024 12:29:48 -0500
-Subject: [PATCH] Fix using int instead of size_t for strcspn return
-
-CVE: CVE-2025-32050
-Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/commit/9bb0a55de55c6940ced811a64fbca82fe93a9323">https://gitlab.gnome.org/GNOME/libsoup/-/commit/9bb0a55de55c6940ced811a64fbca82fe93a9323</a>]
-
-Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
----
- libsoup/soup-headers.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
-index 9707ca0..67905b2 100644
---- a/libsoup/soup-headers.c
-+++ b/libsoup/soup-headers.c
-@@ -902,7 +902,7 @@ append_param_quoted (GString    *string,
-                  const char *name,
-                  const char *value)
- {
--    int len;
-+    gsize len;
-
-     g_string_append (string, name);
-     g_string_append (string, &quot;=\&quot;&quot;);
---
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patch
deleted file mode 100644
index 34bc8113a4..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From f4a67a9a3033586edaee715d40d5992e02d32893 Mon Sep 17 00:00:00 2001
-From: Patrick Griffis <a class="moz-txt-link-rfc2396E" href="mailto:pgriffis@igalia.com">&lt;pgriffis@igalia.com&gt;</a>
-Date: Sat, 16 Nov 2024 12:07:30 -0600
-Subject: [PATCH] Fix heap buffer overflow in soup_content_sniffer_sniff
-
-Co-Author: Ar Jun <a class="moz-txt-link-rfc2396E" href="mailto:pkillarjun@protonmail.com">&lt;pkillarjun@protonmail.com&gt;</a>
-
-CVE: CVE-2025-32052
-Upstream-Status: Backport
-[<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/commit/f182429e5b1fc034050510da20c93256c4fa9652#500da7cfde649872c49169be34b03a1c42a53ddb">https://gitlab.gnome.org/GNOME/libsoup/-/commit/f182429e5b1fc034050510da20c93256c4fa9652#500da7cfde649872c49169be34b03a1c42a53ddb</a>]
-
-Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
----
- libsoup/soup-content-sniffer.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libsoup/soup-content-sniffer.c b/libsoup/soup-content-sniffer.c
-index 9554636..eac9e7b 100644
---- a/libsoup/soup-content-sniffer.c
-+++ b/libsoup/soup-content-sniffer.c
-@@ -504,7 +504,7 @@ sniff_unknown (SoupContentSniffer *sniffer, SoupBuffer *buffer,
-                     guint index_pattern = 0;
-                     gboolean skip_row = FALSE;
-
--                    while ((index_stream &lt; resource_length) &amp;&amp;
-+                    while ((index_stream &lt; resource_length - 1) &amp;&amp;
-                            (index_pattern &lt;= type_row-&gt;pattern_length)) {
-                             /* Skip insignificant white space (&quot;WS&quot; in the spec) */
-                             if (type_row-&gt;pattern[index_pattern] == ' ') {
---
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch
deleted file mode 100644
index 0d829d6200..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From d9bcffd6cd5e8ec32889a594f7348d67a5101b3a Mon Sep 17 00:00:00 2001
-From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
-Date: Mon, 12 May 2025 13:58:42 +0800
-Subject: [PATCH] Fix heap buffer overflow in
- soup-content-sniffer.c:sniff_feed_or_html()
-
-CVE: CVE-2025-32053
-Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/commit/eaed42ca8d40cd9ab63764e3d63641180505f40a">https://gitlab.gnome.org/GNOME/libsoup/-/commit/eaed42ca8d40cd9ab63764e3d63641180505f40a</a>]
-
-Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
----
- libsoup/soup-content-sniffer.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libsoup/soup-content-sniffer.c b/libsoup/soup-content-sniffer.c
-index 967ec61..5f2896e 100644
---- a/libsoup/soup-content-sniffer.c
-+++ b/libsoup/soup-content-sniffer.c
-@@ -620,7 +620,7 @@ skip_insignificant_space (const char *resource, int *pos, int resource_length)
-            (resource[*pos] == '\x0D')) {
-             *pos = *pos + 1;
-
--            if (*pos &gt; resource_length)
-+            if (*pos &gt;= resource_length)
-                     return TRUE;
-     }
-
-@@ -682,7 +682,7 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, SoupBuffer *buffer)
-             do {
-                     pos++;
-
--                    if (pos &gt; resource_length)
-+                    if ((pos + 1) &gt; resource_length)
-                             goto text_html;
-             } while (resource[pos] != '&gt;');
-
---
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906.patch
deleted file mode 100644
index c33ebf8056..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 4b8809cca4bbcbf9514314d86227f985362258b0 Mon Sep 17 00:00:00 2001
-From: Patrick Griffis <a class="moz-txt-link-rfc2396E" href="mailto:pgriffis@igalia.com">&lt;pgriffis@igalia.com&gt;</a>
-Date: Wed, 12 Feb 2025 11:30:02 -0600
-Subject: [PATCH] headers: Handle parsing only newlines
-
-Closes #404
-Closes #407
-
-CVE: CVE-2025-32906
-Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/commit/af5b9a4a3945c52b940d5ac181ef51bb12011f1f">https://gitlab.gnome.org/GNOME/libsoup/-/commit/af5b9a4a3945c52b940d5ac181ef51bb12011f1f</a>]
-
-Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
----
- libsoup/soup-headers.c      |  4 ++--
- tests/header-parsing-test.c | 11 +++++++++++
- 2 files changed, 13 insertions(+), 2 deletions(-)
-
-diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
-index e5d3c03..87bb3dc 100644
---- a/libsoup/soup-headers.c
-+++ b/libsoup/soup-headers.c
-@@ -185,7 +185,7 @@ soup_headers_parse_request (const char          *str,
-     /* RFC 2616 4.1 &quot;servers SHOULD ignore any empty line(s)
-      * received where a Request-Line is expected.&quot;
-      */
--    while ((*str == '\r' || *str == '\n') &amp;&amp; len &gt; 0) {
-+    while (len &gt; 0 &amp;&amp; (*str == '\r' || *str == '\n')) {
-             str++;
-             len--;
-     }
-@@ -369,7 +369,7 @@ soup_headers_parse_response (const char          *str,
-      * after a response, which we then see prepended to the next
-      * response on that connection.
-      */
--    while ((*str == '\r' || *str == '\n') &amp;&amp; len &gt; 0) {
-+    while (len &gt; 0 &amp;&amp; (*str == '\r' || *str == '\n')) {
-             str++;
-             len--;
-     }
-diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
-index c1d3b33..b811115 100644
---- a/tests/header-parsing-test.c
-+++ b/tests/header-parsing-test.c
-@@ -6,6 +6,10 @@ typedef struct {
-     const char *name, *value;
- } Header;
-
-+static char only_newlines[] = {
-+        '\n', '\n', '\n', '\n'
-+};
-+
- static struct RequestTest {
-     const char *description;
-     const char *bugref;
-@@ -445,6 +449,13 @@ static struct RequestTest {
-       SOUP_STATUS_BAD_REQUEST,
-            NULL, NULL, -1,
-       { { NULL } }
-+    },
-+
-+    { &quot;Only newlines&quot;, NULL,
-+      only_newlines, sizeof (only_newlines),
-+      SOUP_STATUS_BAD_REQUEST,
-+           NULL, NULL, -1,
-+      { { NULL } }
-     }
- };
- static const int num_reqtests = G_N_ELEMENTS (reqtests);
---
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch
deleted file mode 100644
index 41dd3ff3f4..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 8158b4084dcba2a233dfcb7359c53ab2840148f7 Mon Sep 17 00:00:00 2001
-From: Milan Crha <a class="moz-txt-link-rfc2396E" href="mailto:mcrha@redhat.com">&lt;mcrha@redhat.com&gt;</a>
-Date: Tue, 15 Apr 2025 12:17:39 +0200
-Subject: [PATCH 1/2] soup-message-headers: Correct merge of ranges
-
-It had been skipping every second range, which generated an array
-of a lot of insane ranges, causing large memory usage by the server.
-
-Closes #428
-
-Part-of: <a class="moz-txt-link-rfc2396E" href="https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/452">&lt;https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/452&gt;</a>
-
-CVE: CVE-2025-32907
-Upstream-Status: Backport
-[<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/452/diffs?commit_id=9bb92f7a685e31e10e9e8221d0342280432ce836">https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/452/diffs?commit_id=9bb92f7a685e31e10e9e8221d0342280432ce836</a>]
-
-Test part not applied since test codes use some functions not in this
-version
-
-Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
----
- libsoup/soup-message-headers.c |   1 +
- 1 files changed, 1 insertions(+)
-
-diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers.c
-index 78b2455..00b9763 100644
---- a/libsoup/soup-message-headers.c
-+++ b/libsoup/soup-message-headers.c
-@@ -1024,6 +1024,7 @@ soup_message_headers_get_ranges_internal (SoupMessageHeaders  *hdrs,
-                     if (cur-&gt;start &lt;= prev-&gt;end) {
-                             prev-&gt;end = MAX (prev-&gt;end, cur-&gt;end);
-                             g_array_remove_index (array, i);
-+                            i--;
-                     }
-             }
-     }
---
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32909.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32909.patch
deleted file mode 100644
index 2f5366348d..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32909.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From e6e088e62c10ab91fa2f2ad5c122332aa7cde97c Mon Sep 17 00:00:00 2001
-From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
-Date: Mon, 12 May 2025 16:55:37 +0800
-Subject: [PATCH] content-sniffer: Handle sniffing resource shorter than
- 4 bytes
-
-CVE: CVE-2025-32909
-Upstream-Status: Backport
-[<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/commit/ba4c3a6f988beff59e45801ab36067293d24ce92">https://gitlab.gnome.org/GNOME/libsoup/-/commit/ba4c3a6f988beff59e45801ab36067293d24ce92</a>]
-
-Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
----
- libsoup/soup-content-sniffer.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/libsoup/soup-content-sniffer.c b/libsoup/soup-content-sniffer.c
-index eac9e7b..73d2245 100644
---- a/libsoup/soup-content-sniffer.c
-+++ b/libsoup/soup-content-sniffer.c
-@@ -227,9 +227,14 @@ sniff_mp4 (SoupContentSniffer *sniffer, SoupBuffer *buffer)
- {
-     const char *resource = (const char *)buffer-&gt;data;
-     guint resource_length = MIN (512, buffer-&gt;length);
--    guint32 box_size = *((guint32*)resource);
-+    guint32 box_size;
-     guint i;
-
-+    if (resource_length &lt; sizeof (guint32))
-+            return FALSE;
-+
-+    box_size = *((guint32*)resource);
-+
- #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
-     box_size = ((box_size &gt;&gt; 24) |
-                 ((box_size &lt;&lt; 8) &amp; 0x00FF0000) |
---
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
deleted file mode 100644
index c1dc6860f2..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From a7e711d0f162c6edc8acad2a96981d4890784ea3 Mon Sep 17 00:00:00 2001
-From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
-Date: Mon, 12 May 2025 17:02:55 +0800
-Subject: [PATCH] auth-digest: Handle missing realm/nonce in authenticate
- header
-
-CVE: CVE-2025-32910
-Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/417/diffs?commit_id=e40df6d48a1cbab56f5d15016cc861a503423cfe">https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/417/diffs?commit_id=e40df6d48a1cbab56f5d15016cc861a503423cfe</a>]
-
-Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
----
- libsoup/soup-auth-digest.c |  3 +++
- 1 files changed, 3 insertions(+)
-
-diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
-index e8ba990..0ab3499 100644
---- a/libsoup/soup-auth-digest.c
-+++ b/libsoup/soup-auth-digest.c
-@@ -142,6 +142,9 @@ soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
-     guint qop_options;
-     gboolean ok = TRUE;
-
-+     if (!soup_auth_get_realm (auth))
-+            return FALSE;
-+
-     g_free (priv-&gt;domain);
-     g_free (priv-&gt;nonce);
-     g_free (priv-&gt;opaque);
-
---
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
deleted file mode 100644
index 019a35e3be..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From eccfca1074fc485a0b60dfb9c8385429a226bf73 Mon Sep 17 00:00:00 2001
-From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
-Date: Fri, 16 May 2025 13:19:38 +0800
-Subject: [PATCH] auth-digest: Handle missing nonce
-
-CVE: CVE-2025-32910
-Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/417/diffs?commit_id=405a8a34597a44bd58c4759e7d5e23f02c3b556a">https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/417/diffs?commit_id=405a8a34597a44bd58c4759e7d5e23f02c3b556a</a>]
-
-Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
----
- libsoup/soup-auth-digest.c | 45 ++++++++++++++++++++++++++++----------
- 1 files changed, 28 insertions(+), 10 deletions(-)
-
-diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
-index 0ab3499..10a8591 100644
---- a/libsoup/soup-auth-digest.c
-+++ b/libsoup/soup-auth-digest.c
-@@ -132,6 +132,19 @@ soup_auth_digest_get_qop (SoupAuthDigestQop qop)
-     return g_string_free (out, FALSE);
- }
-
-+static gboolean
-+validate_params (SoupAuthDigest *auth_digest)
-+{
-+    SoupAuthDigestPrivate *priv = soup_auth_digest_get_instance_private (auth_digest);
-+
-+    if (priv-&gt;qop || priv-&gt;algorithm == SOUP_AUTH_DIGEST_ALGORITHM_MD5_SESS) {
-+            if (!priv-&gt;nonce)
-+                    return FALSE;
-+    }
-+
-+    return TRUE;
-+}
-+
- static gboolean
- soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
-                      GHashTable *auth_params)
-@@ -169,17 +182,22 @@ soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
-     if (priv-&gt;algorithm == -1)
-             ok = FALSE;
-
--    stale = g_hash_table_lookup (auth_params, &quot;stale&quot;);
--    if (stale &amp;&amp; !g_ascii_strcasecmp (stale, &quot;TRUE&quot;) &amp;&amp; *priv-&gt;hex_urp)
--            recompute_hex_a1 (priv);
--    else {
--            g_free (priv-&gt;user);
--            priv-&gt;user = NULL;
--            g_free (priv-&gt;cnonce);
--            priv-&gt;cnonce = NULL;
--            memset (priv-&gt;hex_urp, 0, sizeof (priv-&gt;hex_urp));
--            memset (priv-&gt;hex_a1, 0, sizeof (priv-&gt;hex_a1));
--        }
-+    if (!validate_params (auth_digest))
-+            ok = FALSE;
-+
-+    if (ok) {
-+            stale = g_hash_table_lookup (auth_params, &quot;stale&quot;);
-+            if (stale &amp;&amp; !g_ascii_strcasecmp (stale, &quot;TRUE&quot;) &amp;&amp; *priv-&gt;hex_urp)
-+                    recompute_hex_a1 (priv);
-+            else {
-+                    g_free (priv-&gt;user);
-+                    priv-&gt;user = NULL;
-+                    g_free (priv-&gt;cnonce);
-+                    priv-&gt;cnonce = NULL;
-+                    memset (priv-&gt;hex_urp, 0, sizeof (priv-&gt;hex_urp));
-+                    memset (priv-&gt;hex_a1, 0, sizeof (priv-&gt;hex_a1));
-+            }
-+    }
-
-     return ok;
- }
-@@ -359,6 +377,8 @@ soup_auth_digest_compute_response (const char        *method,
-     if (qop) {
-             char tmp[9];
-
-+            g_assert (cnonce);
-+
-             g_snprintf (tmp, 9, &quot;%.8x&quot;, nc);
-             g_checksum_update (checksum, (guchar *)tmp, strlen (tmp));
-             g_checksum_update (checksum, (guchar *)&quot;:&quot;, 1);
-@@ -422,6 +442,9 @@ soup_auth_digest_get_authorization (SoupAuth *auth, SoupMessage *msg)
-     g_return_val_if_fail (uri != NULL, NULL);
-     url = soup_uri_to_string (uri, TRUE);
-
-+    g_assert (priv-&gt;nonce);
-+    g_assert (!priv-&gt;qop || priv-&gt;cnonce);
-+
-     soup_auth_digest_compute_response (msg-&gt;method, url, priv-&gt;hex_a1,
-                                        priv-&gt;qop, priv-&gt;nonce,
-                                        priv-&gt;cnonce, priv-&gt;nc,
-
---
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch
deleted file mode 100644
index bdf4d64ca3..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 74c95d54fe42041fe161cb74c76d942ffd37a5dd Mon Sep 17 00:00:00 2001
-From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
-Date: Fri, 16 May 2025 13:21:43 +0800
-Subject: [PATCH] auth-digest: Fix leak
-
-CVE: CVE-2025-32910
-Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/417/diffs?commit_id=ea16eeacb052e423eb5c3b0b705e5eab34b13832">https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/417/diffs?commit_id=ea16eeacb052e423eb5c3b0b705e5eab34b13832</a>]
-
-Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
----
- libsoup/soup-auth-digest.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
-index 10a8591..6d965d2 100644
---- a/libsoup/soup-auth-digest.c
-+++ b/libsoup/soup-auth-digest.c
-@@ -66,6 +66,7 @@ soup_auth_digest_finalize (GObject *object)
-     g_free (priv-&gt;nonce);
-     g_free (priv-&gt;domain);
-     g_free (priv-&gt;cnonce);
-+    g_free (priv-&gt;opaque);
-
-     memset (priv-&gt;hex_urp, 0, sizeof (priv-&gt;hex_urp));
-     memset (priv-&gt;hex_a1, 0, sizeof (priv-&gt;hex_a1));
---
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912.patch
deleted file mode 100644
index b3ce9d8bc3..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 0984dddb11daf14fdf5ca24077cd0ebda796439a Mon Sep 17 00:00:00 2001
-From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
-Date: Fri, 16 May 2025 13:25:32 +0800
-Subject: [PATCH] auth-digest: Handle missing nonce
-
-CVE: CVE-2025-32912
-Upstream-Status: Backport
-[<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/commit/cd077513f267e43ce4b659eb18a1734d8a369992?merge_request_iid=434">https://gitlab.gnome.org/GNOME/libsoup/-/commit/cd077513f267e43ce4b659eb18a1734d8a369992?merge_request_iid=434</a>
-https://gitlab.gnome.org/GNOME/libsoup/-/commit/910ebdcd3dd82386717a201c13c834f3a63eed7f]
-
-Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
----
- libsoup/soup-auth-digest.c | 2 +-
- 1 files changed, 1 insertions(+), 1 deletion(-)
-
-diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
-index 6d965d2..f1621ec 100644
---- a/libsoup/soup-auth-digest.c
-+++ b/libsoup/soup-auth-digest.c
-@@ -156,7 +156,7 @@ soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
-     guint qop_options;
-     gboolean ok = TRUE;
-
--     if (!soup_auth_get_realm (auth))
-+    if (!soup_auth_get_realm (auth) || !g_hash_table_lookup (auth_params, &quot;nonce&quot;))
-             return FALSE;
-
-     g_free (priv-&gt;domain);
-
---
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch
deleted file mode 100644
index 9f3bb21a25..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From ac844b9fc7945c38ea21fb7cf1a49a5c226d7c9c Mon Sep 17 00:00:00 2001
-From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
-Date: Mon, 12 May 2025 16:17:20 +0800
-Subject: [PATCH] Resolve &quot;(CVE-2025-32914) (#YWH-PGM9867-23) OOB Read on
- libsoup through function &quot;soup_multipart_new_from_message&quot; in
- soup-multipart.c leads to crash or exit of process&quot;
-
-CVE: CVE-2025-32914
-Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/450/diffs?commit_id=5bfcf8157597f2d327050114fb37ff600004dbcf">https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/450/diffs?commit_id=5bfcf8157597f2d327050114fb37ff600004dbcf</a>]
-
-Test code are not added since some functions not aligned with version
-2.74.3
-
-Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
----
- libsoup/soup-multipart.c |  2 +-
- 1 files changed, 1 insertions(+), 1 deletion(-)
-
-diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
-index a7e550f..dd93973 100644
---- a/libsoup/soup-multipart.c
-+++ b/libsoup/soup-multipart.c
-@@ -181,7 +181,7 @@ soup_multipart_new_from_message (SoupMessageHeaders *headers,
-                     return NULL;
-             }
-
--            split = strstr (start, &quot;\r\n\r\n&quot;);
-+            split = g_strstr_len (start, body_end - start, &quot;\r\n\r\n&quot;);
-             if (!split || split &gt; end) {
-                     soup_multipart_free (multipart);
-                     soup_buffer_free (flattened);
-
---
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch
deleted file mode 100644
index 874f62e7ad..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 52a0f9234d384b9dab368835b22e5a5a01542168 Mon Sep 17 00:00:00 2001
-From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
-Date: Fri, 16 May 2025 14:16:10 +0800
-Subject: [PATCH] auth-digest: fix crash in
- soup_auth_digest_get_protection_space()
-
-We need to validate the Domain parameter in the WWW-Authenticate header.
-
-Unfortunately this crash only occurs when listening on default ports 80
-and 443, so there's no good way to test for this. The test would require
-running as root.
-
-Fixes #440
-
-CVE: CVE-2025-4476
-Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/commit/e64c221f9c7d09b48b610c5626b3b8c400f0907c?merge_request_iid=457">https://gitlab.gnome.org/GNOME/libsoup/-/commit/e64c221f9c7d09b48b610c5626b3b8c400f0907c?merge_request_iid=457</a>]
-
-Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
----
- libsoup/soup-auth-digest.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
-index f1621ec..a2dc560 100644
---- a/libsoup/soup-auth-digest.c
-+++ b/libsoup/soup-auth-digest.c
-@@ -229,7 +229,7 @@ soup_auth_digest_get_protection_space (SoupAuth *auth, SoupURI *source_uri)
-                     uri = soup_uri_new (d);
-                     if (uri &amp;&amp; uri-&gt;scheme == source_uri-&gt;scheme &amp;&amp;
-                         uri-&gt;port == source_uri-&gt;port &amp;&amp;
--                        !strcmp (uri-&gt;host, source_uri-&gt;host))
-+                        !g_strcmp0 (uri-&gt;host, source_uri-&gt;host))
-                             dir = g_strdup (uri-&gt;path);
-                     else
-                             dir = NULL;
---
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch
deleted file mode 100644
index c970661694..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 81e03c538d6a102406114567f4f1c468033ce2e4 Mon Sep 17 00:00:00 2001
-From: Patrick Griffis <a class="moz-txt-link-rfc2396E" href="mailto:pgriffis@igalia.com">&lt;pgriffis@igalia.com&gt;</a>
-Date: Thu, 26 Dec 2024 18:31:42 -0600
-Subject: [PATCH] soup_header_parse_quality_list: Fix leak
-
-When iterating over the parsed list we now steal the allocated strings that we want and then free_full the list which may contain remaining strings.
-
-CVE: CVE-2025-46420
-Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/421/diffs?commit_id=c9083869ec2a3037e6df4bd86b45c419ba295f8e">https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/421/diffs?commit_id=c9083869ec2a3037e6df4bd86b45c419ba295f8e</a>]
-
- Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
----
- libsoup/soup-headers.c | 11 +++++------
- 1 file changed, 5 insertions(+), 6 deletions(-)
-
-diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
-index 87bb3dc..9707ca0 100644
---- a/libsoup/soup-headers.c
-+++ b/libsoup/soup-headers.c
-@@ -528,7 +528,7 @@ soup_header_parse_quality_list (const char *header, GSList **unacceptable)
-     GSList *unsorted;
-     QualityItem *array;
-     GSList *sorted, *iter;
--    char *item, *semi;
-+    char *semi;
-     const char *param, *equal, *value;
-     double qval;
-     int n;
-@@ -541,9 +541,8 @@ soup_header_parse_quality_list (const char *header, GSList **unacceptable)
-     unsorted = soup_header_parse_list (header);
-     array = g_new0 (QualityItem, g_slist_length (unsorted));
-     for (iter = unsorted, n = 0; iter; iter = iter-&gt;next) {
--            item = iter-&gt;data;
-             qval = 1.0;
--            for (semi = strchr (item, ';'); semi; semi = strchr (semi + 1, ';')) {
-+            for (semi = strchr (iter-&gt;data, ';'); semi; semi = strchr (semi + 1, ';')) {
-                     param = skip_lws (semi + 1);
-                     if (*param != 'q')
-                             continue;
-@@ -575,15 +574,15 @@ soup_header_parse_quality_list (const char *header, GSList **unacceptable)
-             if (qval == 0.0) {
-                     if (unacceptable) {
-                             *unacceptable = g_slist_prepend (*unacceptable,
--                                                             item);
-+                                                             g_steal_pointer (&amp;iter-&gt;data));
-                     }
-             } else {
--                    array[n].item = item;
-+                    array[n].item = g_steal_pointer (&amp;iter-&gt;data);
-                     array[n].qval = qval;
-                     n++;
-             }
-     }
--    g_slist_free (unsorted);
-+    g_slist_free_full (unsorted, g_free);
-
-     qsort (array, n, sizeof (QualityItem), sort_by_qval);
-     sorted = NULL;
---
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
deleted file mode 100644
index 3318093400..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 5eb225f02bb35de56cfeedd87bde716bf1cb750b Mon Sep 17 00:00:00 2001
-From: Patrick Griffis <a class="moz-txt-link-rfc2396E" href="mailto:pgriffis@igalia.com">&lt;pgriffis@igalia.com&gt;</a>
-Date: Wed, 5 Feb 2025 16:18:10 -0600
-Subject: [PATCH] session: Strip authentication credentails on
- cross-origin redirect
-
-This should match the behavior of Firefox and Safari but not of Chromium.
-
-CVE: CVE-2025-46421
-Upstream-Status: Backport
-[<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/436/diffs?commit_id=3e5c26415811f19e7737238bb23305ffaf96f66b">https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/436/diffs?commit_id=3e5c26415811f19e7737238bb23305ffaf96f66b</a>]
-
-Test code not added since it included some headers not in version 2.74.3
-
-Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
----
- libsoup/soup-session.c |  8 ++++-
- 2 files changed, 85 insertions(+), 1 deletion(-)
-
-diff --git a/libsoup/soup-session.c b/libsoup/soup-session.c
-index 83421ef..8d6ac61 100644
---- a/libsoup/soup-session.c
-+++ b/libsoup/soup-session.c
-@@ -1189,12 +1189,18 @@ soup_session_redirect_message (SoupSession *session, SoupMessage *msg)
-                                                SOUP_ENCODING_NONE);
-     }
-
-+    /* Strip all credentials on cross-origin redirect. */
-+    if (!soup_uri_host_equal (soup_message_get_uri (msg), new_uri)) {
-+            soup_message_headers_remove (msg-&gt;request_headers, &quot;Authorization&quot;);
-+            soup_message_set_auth (msg, NULL);
-+    }
-+
-     soup_message_set_uri (msg, new_uri);
-     soup_uri_free (new_uri);
-
-     soup_session_requeue_message (session, msg);
-     return TRUE;
--}
-+}
-
- static void
- redirect_handler (SoupMessage *msg, gpointer user_data)
-
---
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4945.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4945.patch
deleted file mode 100644
index c9fbdbacc8..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4945.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-From 3844026f74a41dd9ccab955899e005995293d246 Mon Sep 17 00:00:00 2001
-From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
-Date: Tue, 8 Jul 2025 14:58:30 +0800
-Subject: [PATCH] soup-date-utils: Add value checks for date/time parsing
-
-Reject date/time when it does not represent a valid value.
-
-Closes #448
-
-CVE: CVE-2025-4945
-Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/commit/8988379984e33dcc7d3aa58551db13e48755959f">https://gitlab.gnome.org/GNOME/libsoup/-/commit/8988379984e33dcc7d3aa58551db13e48755959f</a>]
-
-Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
----
- libsoup/soup-date.c  | 21 +++++++++++++++------
- tests/cookies-test.c | 10 ++++++++++
- 2 files changed, 25 insertions(+), 6 deletions(-)
-
-diff --git a/libsoup/soup-date.c b/libsoup/soup-date.c
-index 9602d1f..4c114c1 100644
---- a/libsoup/soup-date.c
-+++ b/libsoup/soup-date.c
-@@ -284,7 +284,7 @@ parse_day (SoupDate *date, const char **date_string)
-     while (*end == ' ' || *end == '-')
-             end++;
-     *date_string = end;
--    return TRUE;
-+    return date-&gt;day &gt;= 1 &amp;&amp; date-&gt;day &lt;= 31;
- }
-
- static inline gboolean
-@@ -324,7 +324,7 @@ parse_year (SoupDate *date, const char **date_string)
-     while (*end == ' ' || *end == '-')
-             end++;
-     *date_string = end;
--    return TRUE;
-+    return date-&gt;year &gt; 0 &amp;&amp; date-&gt;year &lt; 9999;
- }
-
- static inline gboolean
-@@ -348,7 +348,7 @@ parse_time (SoupDate *date, const char **date_string)
-     while (*p == ' ')
-             p++;
-     *date_string = p;
--    return TRUE;
-+    return  date-&gt;hour &gt;= 0 &amp;&amp; date-&gt;hour &lt; 24 &amp;&amp; date-&gt;minute &gt;= 0 &amp;&amp; date-&gt;minute &lt; 60 &amp;&amp; date-&gt;second &gt;= 0 &amp;&amp; date-&gt;second &lt; 60;
- }
-
- static inline gboolean
-@@ -361,8 +361,15 @@ parse_timezone (SoupDate *date, const char **date_string)
-             gulong val;
-             int sign = (**date_string == '+') ? -1 : 1;
-             val = strtoul (*date_string + 1, (char **)date_string, 10);
-+            if (val &gt; 9999)
-+                    return FALSE;
-             if (**date_string == ':')
--                    val = 60 * val + strtoul (*date_string + 1, (char **)date_string, 10);
-+            {
-+                    gulong val2 = strtoul (*date_string + 1, (char **)date_string, 10);
-+                    if (val &gt; 99 || val2 &gt; 99)
-+                            return FALSE;
-+                    val = 60 * val + val2;
-+            }
-             else
-                     val =  60 * (val / 100) + (val % 100);
-             date-&gt;offset = sign * val;
-@@ -407,7 +414,8 @@ parse_textual_date (SoupDate *date, const char *date_string)
-             if (!parse_month (date, &amp;date_string) ||
-                 !parse_day (date, &amp;date_string) ||
-                 !parse_time (date, &amp;date_string) ||
--                !parse_year (date, &amp;date_string))
-+                !parse_year (date, &amp;date_string) ||
-+                !g_date_valid_dmy(date-&gt;day, date-&gt;month, date-&gt;year))
-                     return FALSE;
-
-             /* There shouldn't be a timezone, but check anyway */
-@@ -419,7 +427,8 @@ parse_textual_date (SoupDate *date, const char *date_string)
-             if (!parse_day (date, &amp;date_string) ||
-                 !parse_month (date, &amp;date_string) ||
-                 !parse_year (date, &amp;date_string) ||
--                !parse_time (date, &amp;date_string))
-+                !parse_time (date, &amp;date_string) ||
-+                !g_date_valid_dmy(date-&gt;day, date-&gt;month, date-&gt;year))
-                     return FALSE;
-
-             /* This time there *should* be a timezone, but we
-diff --git a/tests/cookies-test.c b/tests/cookies-test.c
-index 2e2a54f..6035a86 100644
---- a/tests/cookies-test.c
-+++ b/tests/cookies-test.c
-@@ -413,6 +413,15 @@ do_remove_feature_test (void)
-     soup_uri_free (uri);
- }
-
-+static void
-+do_cookies_parsing_int32_overflow (void)
-+{
-+    SoupCookie *cookie = soup_cookie_parse (&quot;Age=1;expires=3Mar9    999:9:9+ 999999999-age=main=gne=&quot;, NULL);
-+    g_assert_nonnull (cookie);
-+    g_assert_null (soup_cookie_get_expires (cookie));
-+    soup_cookie_free (cookie);
-+}
-+
- int
- main (int argc, char **argv)
- {
-@@ -434,6 +443,7 @@ main (int argc, char **argv)
-     g_test_add_func (&quot;/cookies/accept-policy-subdomains&quot;, do_cookies_subdomain_policy_test);
-     g_test_add_func (&quot;/cookies/parsing&quot;, do_cookies_parsing_test);
-     g_test_add_func (&quot;/cookies/parsing/no-path-null-origin&quot;, do_cookies_parsing_nopath_nullorigin);
-+    g_test_add_func (&quot;/cookies/parsing/int32-overflow&quot;, do_cookies_parsing_int32_overflow);
-     g_test_add_func (&quot;/cookies/get-cookies/empty-host&quot;, do_get_cookies_empty_host_test);
-     g_test_add_func (&quot;/cookies/remove-feature&quot;, do_remove_feature_test);
-     g_test_add_func (&quot;/cookies/secure-cookies&quot;, do_cookies_strict_secure_test);
---
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch
deleted file mode 100644
index b15b8c763d..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From dfdc9b3cc73e6fe88cc12792ba00e14642572339 Mon Sep 17 00:00:00 2001
-From: Milan Crha <a class="moz-txt-link-rfc2396E" href="mailto:mcrha@redhat.com">&lt;mcrha@redhat.com&gt;</a>
-Date: Thu, 15 May 2025 17:49:11 +0200
-Subject: [PATCH] soup-multipart: Verify boundary limits for multipart body
-
-It could happen that the boundary started at a place which resulted into
-a negative number, which in an unsigned integer is a very large value.
-Check the body size is not a negative value before setting it.
-
-Closes <a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/issues/449">https://gitlab.gnome.org/GNOME/libsoup/-/issues/449</a>
-
-Part-of: <a class="moz-txt-link-rfc2396E" href="https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/463">&lt;https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/463&gt;</a>
-
-CVE: CVE-2025-4948
-Upstream-Status: Backport
-[<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/463/diffs?commit_id=f2f28afe0b3b2b3009ab67d6874457ec6bac70c0">https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/463/diffs?commit_id=f2f28afe0b3b2b3009ab67d6874457ec6bac70c0</a>]
-
-Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
----
- libsoup/soup-multipart.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
-index dd93973..ce2fc10 100644
---- a/libsoup/soup-multipart.c
-+++ b/libsoup/soup-multipart.c
-@@ -214,7 +214,7 @@ soup_multipart_new_from_message (SoupMessageHeaders *headers,
-              */
-             part_body = soup_buffer_new_subbuffer (flattened,
-                                                    split - flattened-&gt;data,
--                                                   end - 2 - split);
-+                                                   end - 2 &gt;= split ? end - 2 - split : 0);
-             g_ptr_array_add (multipart-&gt;bodies, part_body);
-
-             start = end;
---
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
deleted file mode 100644
index 7bc3e8da99..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From a7d0c58608ed830bedfb6b92aea11e00feb55aa9 Mon Sep 17 00:00:00 2001
-From: Milan Crha <a class="moz-txt-link-rfc2396E" href="mailto:mcrha@redhat.com">&lt;mcrha@redhat.com&gt;</a>
-Date: Mon, 19 May 2025 17:48:27 +0200
-Subject: [PATCH] soup-multipart: Verify array bounds before accessing its
- members
-
-The boundary could be at a place which, calculated, pointed
-before the beginning of the array. Check the bounds, to avoid
-read out of the array bounds.
-
-Closes <a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/issues/447">https://gitlab.gnome.org/GNOME/libsoup/-/issues/447</a>
-
-CVE: CVE-2025-4969
-Upstream-Status: Backport
-[<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/467/diffs?commit_id=b5b4dd10d4810f0c87b4eaffe88504f06e502f33">https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/467/diffs?commit_id=b5b4dd10d4810f0c87b4eaffe88504f06e502f33</a>]
-
-Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
----
- libsoup/soup-multipart.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
-index ce2fc10..a29cdf0 100644
---- a/libsoup/soup-multipart.c
-+++ b/libsoup/soup-multipart.c
-@@ -108,7 +108,7 @@ find_boundary (const char *start, const char *end,
-                     continue;
-
-             /* Check that it's at start of line */
--            if (!(b == start || (b[-1] == '\n' &amp;&amp; b[-2] == '\r')))
-+            if (!(b == start || (b - start &gt;= 2 &amp;&amp; b[-1] == '\n' &amp;&amp; b[-2] == '\r')))
-                     continue;
-
-             /* Check for &quot;--&quot; or &quot;\r\n&quot; after boundary */
---
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
deleted file mode 100644
index 68ec576d9b..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ /dev/null
@@ -1,87 +0,0 @@
-SUMMARY = &quot;An HTTP library implementation in C&quot;
-DESCRIPTION = &quot;libsoup is an HTTP client/server library for GNOME. It uses GObjects \
-and the glib main loop, to integrate well with GNOME applications.&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://wiki.gnome.org/Projects/libsoup">&quot;https://wiki.gnome.org/Projects/libsoup&quot;</a>
-BUGTRACKER = <a class="moz-txt-link-rfc2396E" href="https://bugzilla.gnome.org/">&quot;https://bugzilla.gnome.org/&quot;</a>
-SECTION = &quot;x11/gnome/libs&quot;
-LICENSE = &quot;LGPL-2.0-only&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2">&quot;file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2&quot;</a>
-
-DEPENDS = &quot;glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl&quot;
-
-SHRT_VER = <a class="moz-txt-link-rfc2396E" href="mailto:${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}">&quot;${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}&quot;</a>
-
-SRC_URI = &quot;${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
-           <a class="moz-txt-link-freetext" href="file://0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch">file://0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://0001-CVE-2025-32911.patch">file://0001-CVE-2025-32911.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://0001-Fix-possibly-uninitialized-warnings.patch">file://0001-Fix-possibly-uninitialized-warnings.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://0001-Remove-http-and-https-aliases-support-test.patch">file://0001-Remove-http-and-https-aliases-support-test.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://CVE-2024-52532-1.patch">file://CVE-2024-52532-1.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://CVE-2024-52532-2.patch">file://CVE-2024-52532-2.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://CVE-2024-52532-3.patch">file://CVE-2024-52532-3.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://CVE-2025-32053.patch">file://CVE-2025-32053.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://CVE-2025-2784.patch">file://CVE-2025-2784.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://CVE-2024-52530.patch">file://CVE-2024-52530.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://CVE-2025-32906.patch">file://CVE-2025-32906.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://CVE-2025-32914.patch">file://CVE-2025-32914.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://CVE-2025-46420.patch">file://CVE-2025-46420.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://CVE-2025-46421.patch">file://CVE-2025-46421.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://CVE-2025-32050.patch">file://CVE-2025-32050.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://CVE-2025-32052.patch">file://CVE-2025-32052.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://CVE-2025-32909.patch">file://CVE-2025-32909.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://CVE-2025-32910-1.patch">file://CVE-2025-32910-1.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://CVE-2025-32910-2.patch">file://CVE-2025-32910-2.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://CVE-2025-32910-3.patch">file://CVE-2025-32910-3.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://CVE-2025-32912.patch">file://CVE-2025-32912.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://CVE-2024-52531-1.patch">file://CVE-2024-52531-1.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://CVE-2024-52531-2.patch">file://CVE-2024-52531-2.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://CVE-2025-4476.patch">file://CVE-2025-4476.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://CVE-2025-32907.patch">file://CVE-2025-32907.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://CVE-2025-4948.patch">file://CVE-2025-4948.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://CVE-2025-4969.patch">file://CVE-2025-4969.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://CVE-2025-4945.patch">file://CVE-2025-4945.patch</a> \
-&quot;
-SRC_URI[sha256sum] = &quot;e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13&quot;
-
-CVE_PRODUCT = &quot;libsoup&quot;
-
-S = &quot;${UNPACKDIR}/libsoup-${PV}&quot;
-
-inherit meson gettext pkgconfig upstream-version-is-even gobject-introspection gtk-doc
-
-UPSTREAM_CHECK_REGEX = &quot;libsoup-(?P&lt;pver&gt;2(\.(?!99)\d+)+)\.tar&quot;
-
-GIR_MESON_ENABLE_FLAG = 'enabled'
-GIR_MESON_DISABLE_FLAG = 'disabled'
-
-PACKAGECONFIG ??= &quot;&quot;
-PACKAGECONFIG[brotli] = &quot;-Dbrotli=enabled,-Dbrotli=disabled,brotli&quot;
-# libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards
-PACKAGECONFIG[gnome] = &quot;-Dgnome=true,-Dgnome=false&quot;
-PACKAGECONFIG[gssapi] = &quot;-Dgssapi=enabled,-Dgssapi=disabled,krb5&quot;
-PACKAGECONFIG[ntlm] = &quot;-Dntlm=enabled,-Dntlm=disabled&quot;
-PACKAGECONFIG[sysprof] = &quot;-Dsysprof=enabled,-Dsysprof=disabled,sysprof&quot;
-
-# Tell libsoup where the target ntlm_auth is installed
-do_write_config:append:class-target() {
-    cat &gt;${WORKDIR}/soup.cross &lt;&lt;EOF
-[binaries]
-ntlm_auth = '${bindir}/ntlm_auth'
-EOF
-}
-EXTRA_OEMESON:append:class-target = &quot; --cross-file ${WORKDIR}/soup.cross&quot;
-
-EXTRA_OEMESON += &quot;-Dvapi=disabled -Dtls_check=false&quot;
-
-GTKDOC_MESON_OPTION = &quot;gtk_doc&quot;
-
-# When built without gnome support, libsoup-2.4 will contain only one shared lib
-# and will therefore become subject to renaming by debian.bbclass. Prevent
-# renaming in order to keep the package name consistent regardless of whether
-# gnome support is enabled or disabled.
-DEBIAN_NOAUTONAME:${PN} = &quot;1&quot;
-
-# glib-networking is needed for SSL, proxies, etc.
-RRECOMMENDS:${PN} = &quot;glib-networking&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;



-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#125832): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/125832">https://lists.openembedded.org/g/openembedded-devel/message/125832</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/118574993/6084445">https://lists.openembedded.org/mt/118574993/6084445</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:skandigraun@gmail.com">skandigraun@gmail.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------UyOBVZKVi0m0grYDjleVBXW0--

