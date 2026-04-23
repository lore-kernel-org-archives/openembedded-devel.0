Return-Path: <wenlin.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F65F9936D
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 11:09:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17088.1776942588979749039
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2026 04:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=lsyqTPjY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8573336654=wenlin.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N2AH7j841382
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 11:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=M9tHnmOyJ/L8bErvsyoya2
	qZXdpnDvFtqtD+UvBAr5Q=; b=lsyqTPjYUU2v4d4tyzSUzdyLsOs6gfGh9Hy1dj
	3Zmkf/uj33Kr3BUkuqIrfrBr6gEbLTzO5SxlIzJT/hm5ZTHAoBrsqqI8kPjowKyJ
	s5YcuBT6+YUtBeKEOfChvPmLhrpkQOvxO6JTvF/01V6TLEMZUbYlumpu5QNs40CK
	3+RRTp0XSem8TfFJhCeaOY+Ozg+HQcrfJEN2E1703vINZlkD57w7Uyol9CZWW4kX
	xhqJm8jxcYW7EAmwfxGdYxaOPsgAvH6IGr1f6we9OoEoxUNfKA4QiKcjOUiWd0+S
	OpIWi0fTUr8sohgtjBHoi1IFxOyPUG/yIo7StsB/uaV9N9Yw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011008.outbound.protection.outlook.com [52.101.52.8])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dq8qc0gpd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Apr 2026 11:09:47 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IYFUP9wRunwNh0eG0hRwYzsnxnGXAzPkhoTXtyc3pH1Z1liNjCD1RW3jHvxCZXin2A8z/reA5UKdZj06KQq+SwsLEivj0qtLDBI8WakR/toszmyvQJpwbUIQvKZyPsmrvC2qfTkzq1XnEGKCrONY1muQCabUPKY+VkNmRlpnW4iXjPksiBDToOx+gZV+u7WkybL1jBPLnKAHqnqT7XvJQWzooPzArKPWvt+vXzcFXu3XPS/Y6n3+2/oUuUopH93M7+0v9iZrnwPxvx/QCeYFry5LtykUfME6WMoDYEZIlfhUbXeVBQ95W6OccyYxKALdOYb79vBm8j/xiimc3EQm8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9tHnmOyJ/L8bErvsyoya2qZXdpnDvFtqtD+UvBAr5Q=;
 b=nTg74M65nRxcq6CFHgFHiDM3UwyLfTPwMQdYHne9MHCl8OqtyX5Z/xsiiM88VeoL8WiEhWERDei79qims/VVH2G0kkDbd7jFvHnOBEtxbgp3YLzE6KAXi2s/rtsVxBHIUoCFPFgD1i3HZzl73Vp1GC3ZWeF4fwxCCzou1iScLjKdLxkjMV0GldbOk/acU8TrQrulnnbB1lJTiw2xPbWxjeZ6X6LaYVxbwDoKGviXSjDsHuDsME2Kg7l7xejO1qYqA/u1Y2GSfHUHjGSu7okt6ClAkPJwAX3OxjVMQAcr9FVS2+SgPsl8CTA/szxN9SjU54QFSq1FK7P/0Wzlueorag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN0PR11MB6058.namprd11.prod.outlook.com (2603:10b6:208:376::19)
 by DM4PR11MB7207.namprd11.prod.outlook.com (2603:10b6:8:111::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Thu, 23 Apr
 2026 11:09:43 +0000
Received: from MN0PR11MB6058.namprd11.prod.outlook.com
 ([fe80::afa6:26f8:72e8:6a11]) by MN0PR11MB6058.namprd11.prod.outlook.com
 ([fe80::afa6:26f8:72e8:6a11%6]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 11:09:43 +0000
Content-Type: multipart/alternative;
 boundary="------------MipoJ5XtQyNpNQJsPnO0NAAK"
Message-ID: <36adcf3e-efcd-4ea5-9f7a-b0c93a44da8a@windriver.com>
Date: Thu, 23 Apr 2026 19:09:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-xfce][PATCH] xfce4-session: Make libpam and systemd
 dependencies conditional
To: Khem Raj <raj.khem@gmail.com>, yi.zhao@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
References: <20260423031717.4186749-1-wenlin.kang@windriver.com>
 <b9fbe190-229f-44ca-acb0-d25f61f52a9f@windriver.com>
 <CAMKF1spJur5cBF18bt7V5OsaPkb1b7fKauEhat-0eTt2c9FUsA@mail.gmail.com>
Content-Language: en-US
From: "Kang, Wenlin" <wenlin.kang@windriver.com>
In-Reply-To: <CAMKF1spJur5cBF18bt7V5OsaPkb1b7fKauEhat-0eTt2c9FUsA@mail.gmail.com>
X-ClientProxiedBy: TYWP286CA0026.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::15) To MN0PR11MB6058.namprd11.prod.outlook.com
 (2603:10b6:208:376::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6058:EE_|DM4PR11MB7207:EE_
X-MS-Office365-Filtering-Correlation-Id: d30a83ca-e872-4125-3642-08dea128d245
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|4022899009|13003099007|8096899003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	QwpXoPNyGnVCWOxZwLU2UKprVwWQP8gZigNcvPQvynCkoFx6rDjC/re0XqwDtBhffEUWs+ZybRdurAvT7ctuv1gLzFMPpzi/ubp0Nb+/stZNJEWFw0XEINw47qXQKu4xCPRAw49GPB8Nannxh2QaownbOHGYH5pNHZA8eXiq3dgYapk9NqiT6slw8gH1MIYCFg/Lym7mmoOPglptOQYHeRLcyitDdBqz/PncOoRm6afBNeMmLKeZblaaGyrquPlzByFiQJXT3Zj74vL9bYDMU5MMBiDxb6ZPAwlr4zu+9xrrcA1sBH+M5/mKc7qy/XbFb22D7sADykI0hMC35p+dGrYe7NccbHqhkWn4Cl16Zqs4X2N7qS8ZqMWHWown471uQyXl9GD4PWJ2FYJX0ZfzSvyTie7hhPGZAFP98/khtpBHTWkv1EXJrgsKTHH3Bsacq3fXIBVoD5Awdd0COZG2dTk7x9fK2utJuTEnFfaGxKDDzPnYuQtvZFD5BSU5B1g0eazEbtShFjhLGqeRrvJ7gDvnNTfjT6A97Fu850tVRbBqbadY/4bkgAeDKh5D+3Zx4OIQEhH5jFiDVS6iSSOIauZ37zUqzx5FNvFPhtX1bmrluDC1oFoezANrSRyjWBMSH1Nk1vFyV4GAUm4zc34oPsjqUhmBhWPzvOsgeeSD9tnizSIPUNjlKq8JsuhVbG+Z
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6058.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(4022899009)(13003099007)(8096899003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ajJwTXIrTVlLL1ZSRWI3SFN4RTNvN0dtVk1BOHlFbzdnSVQ5SmpPZjF0VlhB?=
 =?utf-8?B?OStBZVBsRUh0Mk5WUTY4RU1IbjBnT1RKaWt4UEJHYWxoNEtZVVlDQW03dE5R?=
 =?utf-8?B?ODcxaDJjM1FlM0QxMEExRTFyY09NTlZraVNTTnBLUm84S3dwQ1BBbkoxMXh6?=
 =?utf-8?B?WG1KaE1PNzEra0JxQnNTMmlsZlVzMFFUV1h4MTZYcjNmb2xLSGV2QXc5UHdi?=
 =?utf-8?B?K3Y0WXJWVkN1S1VydWduMGltYU5aWGk0ZkVpa0ZTazZpZWYvdnFYeVlCOGlN?=
 =?utf-8?B?Ym1rVWp3VnFteFVDUHBWNUE1OFM4dnJYZmg5bHZXNE1xaHhkczVWdlUyT3U0?=
 =?utf-8?B?bUZKb1BhTXpJZUhwVUh0Y0hxdnVzcDRYQ2o4aWZCTnZJNUhUZzR2cEpONXRR?=
 =?utf-8?B?eVhOWG43YzBYR0sxT3Z2d2RlcE1JZFR1NVdDQzdjZ1lMZDI2b05QTTNOQzVh?=
 =?utf-8?B?OGxGRTAvTVFvTzlPdjVxeEFVcVczLzZnZzRnZk5NVVQ4R0wrMFRoVGhWTGxk?=
 =?utf-8?B?emJIa0JwQXFPWkJwNjZGUkRwUU5zRlNvUlNyNEwrQmJlKy9JZXdwVGZUOVdj?=
 =?utf-8?B?b1ZSZzNxSWhjYmhRcWZIaVh6dnhib1dSN2pobVR5ZUdKNFFnVG9HbW1WQmJx?=
 =?utf-8?B?S2FoblE2TDRZZERUUXcwQmViWjRtUDBkalJZelIxckVaYWwwd0lSZ2xaTVMw?=
 =?utf-8?B?VmJEc2tyUG1mS2NVeG1FQjYwTnRrenBRL0NGRzV0dGdFQ1ZoL2QxTWFPT2lx?=
 =?utf-8?B?MFVHbkdXc1kxN0hBUkxJdVIyTTBhWVBjdDdyS2Vid3NUN2ZndFJKU1ltS3Jy?=
 =?utf-8?B?cnBIU3hZazBWWVVoU3R6WUFodXBwODRnd1ZEVTNoNTJGckJyKzNKWTliTFlj?=
 =?utf-8?B?OERDWllPQVJ6Ni9HWHlBcllsR3BSRWNCZ05ab2hJcElDa09BMzhDZmtIS2E3?=
 =?utf-8?B?V2M3QmZPd1Z3cFAzcktQMkFQTDgrWFBsQWZQZlhKUEJTQWh6UG9FZU5BN01O?=
 =?utf-8?B?OFNyQ3VueGtjVnlWbXJveGNVY3dJM3JOc1VyM3Ric2dGTDduNVRvZkJhZzFR?=
 =?utf-8?B?aGVBK2wxeFZCa2Qra1lJU080SnRqZTkwQXhTTmJnOUJSVXZqWk82dkU1SG51?=
 =?utf-8?B?SGtDdVlYOTl5L25XRWdzQ3NzZkIzR05hUVlSaG1vcGU4cWpIOERoWXVzQ3Yx?=
 =?utf-8?B?T1lOa3hjK29GM1hmQ05EeU9WdkF2UzBVTkpLV1pkcUpBYUhLdnBJMVRwS051?=
 =?utf-8?B?SmRjTlc4TjZEMytrRkRyUk56UUs4OHZERXVwVzJIcDhvRXJFSzd5SzNScG5G?=
 =?utf-8?B?MEJnRVZ1RVcrclV4aGNuQ01xN0g1emZoRFI2bXZmM21Ec1l5Ync5UVlSVFNx?=
 =?utf-8?B?ZEdlbnNlc01oUVJHaUxsMDU0RVl5TG1lTTViK3hHeWJkUzBQTlJEMkFiV1Rm?=
 =?utf-8?B?SXNoMUJZOVJxTVppMEVjdUlwSjVOdDhyMmxaeHlDMnVZdUFQeXZkRTNNRjU5?=
 =?utf-8?B?SXhSOHJDOGJMRUZmMWtaclpyTVR1Y08xdHdwMlJmUmoySDNGVUhQak5UVEg3?=
 =?utf-8?B?cUs2dlZ5eVNUelBsTTMyb2FFT0lUMmkrWFF5c3RMUTI3NjYrNWRrdi9tUGN4?=
 =?utf-8?B?bnpRd0p0dGxvelNWdUJlOUl1SmNjdUhXbDdHNDBhT28wRHFkYXFqTTdRUDh5?=
 =?utf-8?B?NmhTOVZMbldTZTNzSmRXb0ZhRzNaN3Y2ZUUvUEs3OHN6NWJBbWhhYm1TWktC?=
 =?utf-8?B?VzVJSHFXU1BNQWR5M0xuMHRwZ3FFT1gvZFFtcWRiOGhvUE13bGI3aUpYVW5R?=
 =?utf-8?B?d2dRSTBxdFNzRWp4bWw3SFlxdkE5UHJiZDUxaDZxbGg4Y3FScGZqTWUwMXI4?=
 =?utf-8?B?K2gwR3FlT1p0T3UwTEJiL1B0WllzRk9nQ2NQOGZCRmRyVkhVTm4vS25uc1VS?=
 =?utf-8?B?dyszU1B4NjdPYytoOEpUL3NMUWpxbGx3Tkd1ZGVDVXd6QjVrVEV3V1oxSG9M?=
 =?utf-8?B?ckEwSzcwaERtak13Y2FGV3h3ME5za2dzUVllQ1RxMXB0RExOejgxR1BhMTJP?=
 =?utf-8?B?aFY3SnRiYWpoMW4wTHBSSFc2c3c0dWxtR3Y3WE5tMmlGbEZ3M0x1R2haSFlE?=
 =?utf-8?B?ZVpvanBBSWNBbUVXdk85SFUvcW8wczhrTnp6L25pSVc0Q1NXdEs4VjgxR2dE?=
 =?utf-8?B?bDZFNmtUQTJueEdVYlhGN0Q1OEVZWktNdW9aWFdkOEFVRkNQa0o2elZmY1Jx?=
 =?utf-8?B?NzNUcWt3ZnNMUm1RMHlGYngyeGZZSHAvZUY2cGRLL09mQjQrYTVVUElHbm9o?=
 =?utf-8?B?aC96NU1BdmJ5bVB5S2NpTFhxYTc2RFZIQ3N4ZjZGQmJhK1pwMThPUmVreXc4?=
 =?utf-8?Q?gBpWbE1mKIaqs3Lw=3D?=
X-Exchange-RoutingPolicyChecked: 
	f8z52IUKKcOtchKRlV9sVGrHribyusX6SF+xBuXGhfwh73uUWSz5mrCcbsW/bsP3jqIaNARscJVyMjJU/foOMoHJ7diEacD48cb8FEoHMCBc3Uzf7a+XObREdRBfJMeIJpVM2hGNLbsaq2TB5Cv9/gK8ZYlcyVXJ10CqB2T81+fQnIHjf42XXEV0VfmiWmJX2fbbtyLiP+WwS6olmNm8w+2lwfiIjc1yWMsFKE89JqxCnmvdUZ6RPWM3CtyMTczWORsSXvsvYUEcO72JXY13f3FTazesIYuLLHc1skIX6tE3EbHPEr/ZSj6aGu8A9hnHQPwGMqzN8T0NjmgVwAU6dA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d30a83ca-e872-4125-3642-08dea128d245
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6058.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 11:09:43.5177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8+MpmUL2KRE0bxSDKm5o/De3VaknTIC9MAzvt6K9if3K7tY46esKq0u1nYHoZyzADAFwIBjuH6FR/PaFEvHN5Wm24K6dZeO6CbUEjmUZ0hQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7207
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: hFsjHcVzOeBUQ6A0GpTf6sbyyhC_s24C
X-Proofpoint-ORIG-GUID: N9nM1Jfz8OEf1ynTrYGAf7IjZ-rXICkY
X-Authority-Analysis: v=2.4 cv=EY74hvmC c=1 sm=1 tr=0 ts=69e9fdfb cx=c_pps
 a=56WOIFdoL1k8+DRIoLPNvg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=Q4-j1AaZAAAA:8
 a=ygfikJQSAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=CVjNJq17FUEOH9PH8B0A:9
 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cNx3N8neQfnCpswDsycA:9 a=JRZpd0_uc9CEijd9:21 a=_W_S_7VecoQA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=rfsfOhzgo-V0TFs3tIRs:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExMCBTYWx0ZWRfX1ECyMkpRHwxC
 empK2FymSvZHAj8frTwyJD9M8xQxBw07+8iE+wcm0iL3PXSfqf9R0mnHzcK3G+JgFsOYQQ1Q5Iz
 fJiJr0OpJQMLIFltx/kY8/bsfCYcxBWGnA5dyv6mw5O6b5eTsnyGpJbCWWel+gAEuw9F9qXedIM
 YBxGudG4b2gYQECljU20gaGlCl+vXgluYPhYXf5Xk9VKZ0Y2hSFKsvxpTm2Nkt46BvEHwLlrMJq
 h4WPEuGl5wtJiFugd+q+bOTzK852AqyscU5VBJBo2LO9RfmBRbmU2TjlUAvFzIElkqSp9aoxjUC
 s8pYsnxEKC3g7Up5rslCHoMFfOKyGtYTkd0pF3QqfRi1HmmEdia9NJbnOWRgMEm1tmbl11yKsf3
 9gF1xmHRajrPqWf+nU5eSrq9PY5kHgsz171Gp1SCW4/eZBZ6az/cYCjhvFaUxSTuVKGv0vHvpsF
 SxbJEGgo1zQy1+x1L+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230110
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 11:09:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126574

--------------MipoJ5XtQyNpNQJsPnO0NAAK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 63N2AH7j841382


On 4/23/2026 3:04 PM, Khem Raj wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
>
> On Wed, Apr 22, 2026 at 8:40=E2=80=AFPM Yi Zhao via lists.openembedded.=
org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!drctXgVUzS6YGylZg5JzV8ihkVwXVg8wkeBf01WoY7p6njmQCK8qv-_eJLOd1eB5yRC9u=
osEaS0i2PxcnXcY$>=20
> <yi.zhao=3Deng.windriver.com@lists.openembedded.org> wrote:
>
>     Hi Wenlin,
>
>     On 4/23/26 11:17, wenlin.kang@windriver.com via
>     lists.openembedded.org
>     <https://urldefense.com/v3/__http://lists.openembedded.org__;!!Ajve=
Ydw8EvQ!drctXgVUzS6YGylZg5JzV8ihkVwXVg8wkeBf01WoY7p6njmQCK8qv-_eJLOd1eB5y=
RC9uosEaS0i2PxcnXcY$>
>
>     wrote:
>     > From: Wenlin Kang <wenlin.kang@windriver.com>
>     >
>     > libpam and systemd require the settings below:
>     >=C2=A0 =C2=A0 INIT_MANAGER =3D "systemd"
>     >=C2=A0 =C2=A0 DISTRO_FEATURES:append =3D " pam systemd usrmerge"
>     >
>     > So remove hardcoded libpam and systemd dependencies from DEPENDS.
>     > Add conditional logic to include these dependencies only when
>     > the corresponding DISTRO_FEATURES are enabled.
>     >
>     > Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
>     > ---
>     >=C2=A0 =C2=A0.../xfce4-screensaver/xfce4-screensaver_4.20.2.bb
>     <https://urldefense.com/v3/__http://xfce4-screensaver_4.20.2.bb__;!=
!AjveYdw8EvQ!drctXgVUzS6YGylZg5JzV8ihkVwXVg8wkeBf01WoY7p6njmQCK8qv-_eJLOd=
1eB5yRC9uosEaS0i2BG6dSnq$>
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0| 8 +++++++-
>     >=C2=A0 =C2=A01 file changed, 7 insertions(+), 1 deletion(-)
>     >
>     > diff --git
>     a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2=
.bb
>     <https://urldefense.com/v3/__http://xfce4-screensaver_4.20.2.bb__;!=
!AjveYdw8EvQ!drctXgVUzS6YGylZg5JzV8ihkVwXVg8wkeBf01WoY7p6njmQCK8qv-_eJLOd=
1eB5yRC9uosEaS0i2BG6dSnq$>
>     b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2=
.bb
>     <https://urldefense.com/v3/__http://xfce4-screensaver_4.20.2.bb__;!=
!AjveYdw8EvQ!drctXgVUzS6YGylZg5JzV8ihkVwXVg8wkeBf01WoY7p6njmQCK8qv-_eJLOd=
1eB5yRC9uosEaS0i2BG6dSnq$>
>     > index b95bfc170c..191c49b216 100644
>     > ---
>     a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2=
.bb
>     <https://urldefense.com/v3/__http://xfce4-screensaver_4.20.2.bb__;!=
!AjveYdw8EvQ!drctXgVUzS6YGylZg5JzV8ihkVwXVg8wkeBf01WoY7p6njmQCK8qv-_eJLOd=
1eB5yRC9uosEaS0i2BG6dSnq$>
>     > +++
>     b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2=
.bb
>     <https://urldefense.com/v3/__http://xfce4-screensaver_4.20.2.bb__;!=
!AjveYdw8EvQ!drctXgVUzS6YGylZg5JzV8ihkVwXVg8wkeBf01WoY7p6njmQCK8qv-_eJLOd=
1eB5yRC9uosEaS0i2BG6dSnq$>
>     > @@ -10,7 +10,13 @@ LIC_FILES_CHKSUM =3D
>     "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>     >=C2=A0 =C2=A0XFCE_COMPRESS_TYPE =3D "xz"
>     >=C2=A0 =C2=A0XFCEBASEBUILDCLASS =3D "meson"
>     >
>     > -DEPENDS =3D "dbus-glib garcon gtk+3 libxklavier libxscrnsaver
>     virtual/libx11 xfconf libwnck3 libpam systemd"
>     > +DEPENDS =3D "dbus-glib garcon gtk+3 libxklavier libxscrnsaver
>     virtual/libx11 xfconf libwnck3"
>     > +
>     > +EXTRA_OEMESON +=3D "${@bb.utils.contains('DISTRO_FEATURES',
>     'pam', '', '-Dauthentication-scheme=3Dnone', d)}"
>     > +DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'pam',
>     'libpam', '', d)}"
>     > +
>     > +EXTRA_OEMESON +=3D "${@bb.utils.contains('DISTRO_FEATURES',
>     'systemd', '', '-Dsession-manager=3Dnone', d)}"
>     > +DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
>     'systemd', '', d)}"
>
>
> how did you test it for runtime correctness


I simply tested it using the following steps


1. build:
 =C2=A0 =C2=A0$ echo "IMAGE_INSTALL:append =3D \" xfce4-screensaver\"" >>=
=20
conf/local.conf
 =C2=A0 =C2=A0$ bitbake core-image-minimal-xfce


2. runtime:
 =C2=A0 =C2=A01) boot target:
 =C2=A0 =C2=A0 =C2=A0 $ runqemu slirp

 =C2=A0 =C2=A02) Start xfce4-screensaver and set screen saver theme

 =C2=A0 =C2=A03) Run command to lock screen immediately:
 =C2=A0 =C2=A0 =C2=A0 =C2=A0$ xfce4-screensaver-command --lock

 =C2=A0 =C2=A0 =C2=A0 Then the system immediately enters screen lock stat=
us

 =C2=A0 =C2=A04. Move the mouse or press any key, then the system exits s=
creen lock


>     I think it would be better to use PACKAGECONFIG.
>
>
>
>
>     //Yi
>
>     >
>     >=C2=A0 =C2=A0inherit xfce-app
>     >
>     >
>     >
>     >
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#126568):
>     https://lists.openembedded.org/g/openembedded-devel/message/126568
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/message/126568__;!!AjveYdw8EvQ!drctXgVUzS6YGylZg5JzV8ihkVwX=
Vg8wkeBf01WoY7p6njmQCK8qv-_eJLOd1eB5yRC9uosEaS0i2OrYLgaH$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/118966722/1997914
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1189=
66722/1997914__;!!AjveYdw8EvQ!drctXgVUzS6YGylZg5JzV8ihkVwXVg8wkeBf01WoY7p=
6njmQCK8qv-_eJLOd1eB5yRC9uosEaS0i2PssR6LX$>
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/unsub__;!!AjveYdw8EvQ!drctXgVUzS6YGylZg5JzV8ihkVwXVg8wkeBf0=
1WoY7p6njmQCK8qv-_eJLOd1eB5yRC9uosEaS0i2GhbzOFe$>
>     [raj.khem@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------MipoJ5XtQyNpNQJsPnO0NAAK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 63N2AH7j841382

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 4/23/2026 3:04 PM, Khem Raj wrote:<=
br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1spJur5cBF18bt7V5OsaPkb1b7=
fKauEhat-0eTt2c9FUsA@mail.gmail.com">
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
            <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 22, 2026 at
              8:40=E2=80=AFPM Yi Zhao via <a href=3D"https://urldefense.c=
om/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!drctXgVUzS6YGylZg5J=
zV8ihkVwXVg8wkeBf01WoY7p6njmQCK8qv-_eJLOd1eB5yRC9uosEaS0i2PxcnXcY$" moz-d=
o-not-send=3D"true">
                lists.openembedded.org</a> &lt;yi.zhao=3D<a href=3D"mailt=
o:eng.windriver.com@lists.openembedded.org" moz-do-not-send=3D"true" clas=
s=3D"moz-txt-link-freetext">eng.windriver.com@lists.openembedded.org</a>&=
gt;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              Hi Wenlin,<br>
              <br>
              On 4/23/26 11:17, <a href=3D"mailto:wenlin.kang@windriver.c=
om" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-free=
text">wenlin.kang@windriver.com</a>
              via
              <a href=3D"https://urldefense.com/v3/__http://lists.openemb=
edded.org__;!!AjveYdw8EvQ!drctXgVUzS6YGylZg5JzV8ihkVwXVg8wkeBf01WoY7p6njm=
QCK8qv-_eJLOd1eB5yRC9uosEaS0i2PxcnXcY$" rel=3D"noreferrer" target=3D"_bla=
nk" moz-do-not-send=3D"true">
                lists.openembedded.org</a> <br>
              wrote:<br>
              &gt; From: Wenlin Kang &lt;<a href=3D"mailto:wenlin.kang@wi=
ndriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-=
link-freetext">wenlin.kang@windriver.com</a>&gt;<br>
              &gt;<br>
              &gt; libpam and systemd require the settings below:<br>
              &gt;&nbsp; &nbsp; INIT_MANAGER =3D &quot;systemd&quot;<br>
              &gt;&nbsp; &nbsp; DISTRO_FEATURES:append =3D &quot; pam sys=
temd usrmerge&quot;<br>
              &gt;<br>
              &gt; So remove hardcoded libpam and systemd dependencies
              from DEPENDS.<br>
              &gt; Add conditional logic to include these dependencies
              only when<br>
              &gt; the corresponding DISTRO_FEATURES are enabled.<br>
              &gt;<br>
              &gt; Signed-off-by: Wenlin Kang &lt;<a href=3D"mailto:wenli=
n.kang@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D=
"moz-txt-link-freetext">wenlin.kang@windriver.com</a>&gt;<br>
              &gt; ---<br>
              &gt;&nbsp; &nbsp;.../xfce4-screensaver/<a href=3D"https://u=
rldefense.com/v3/__http://xfce4-screensaver_4.20.2.bb__;!!AjveYdw8EvQ!drc=
tXgVUzS6YGylZg5JzV8ihkVwXVg8wkeBf01WoY7p6njmQCK8qv-_eJLOd1eB5yRC9uosEaS0i=
2BG6dSnq$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">=
xfce4-screensaver_4.20.2.bb</a>&nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp;| 8 +++++++-<br>
              &gt;&nbsp; &nbsp;1 file changed, 7 insertions(+), 1 deletio=
n(-)<br>
              &gt;<br>
              &gt; diff --git
              a/meta-xfce/recipes-apps/xfce4-screensaver/<a href=3D"https=
://urldefense.com/v3/__http://xfce4-screensaver_4.20.2.bb__;!!AjveYdw8EvQ=
!drctXgVUzS6YGylZg5JzV8ihkVwXVg8wkeBf01WoY7p6njmQCK8qv-_eJLOd1eB5yRC9uosE=
aS0i2BG6dSnq$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tr=
ue">xfce4-screensaver_4.20.2.bb</a>
              b/meta-xfce/recipes-apps/xfce4-screensaver/<a href=3D"https=
://urldefense.com/v3/__http://xfce4-screensaver_4.20.2.bb__;!!AjveYdw8EvQ=
!drctXgVUzS6YGylZg5JzV8ihkVwXVg8wkeBf01WoY7p6njmQCK8qv-_eJLOd1eB5yRC9uosE=
aS0i2BG6dSnq$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tr=
ue">xfce4-screensaver_4.20.2.bb</a><br>
              &gt; index b95bfc170c..191c49b216 100644<br>
              &gt; --- a/meta-xfce/recipes-apps/xfce4-screensaver/<a href=
=3D"https://urldefense.com/v3/__http://xfce4-screensaver_4.20.2.bb__;!!Aj=
veYdw8EvQ!drctXgVUzS6YGylZg5JzV8ihkVwXVg8wkeBf01WoY7p6njmQCK8qv-_eJLOd1eB=
5yRC9uosEaS0i2BG6dSnq$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-s=
end=3D"true">xfce4-screensaver_4.20.2.bb</a><br>
              &gt; +++ b/meta-xfce/recipes-apps/xfce4-screensaver/<a href=
=3D"https://urldefense.com/v3/__http://xfce4-screensaver_4.20.2.bb__;!!Aj=
veYdw8EvQ!drctXgVUzS6YGylZg5JzV8ihkVwXVg8wkeBf01WoY7p6njmQCK8qv-_eJLOd1eB=
5yRC9uosEaS0i2BG6dSnq$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-s=
end=3D"true">xfce4-screensaver_4.20.2.bb</a><br>
              &gt; @@ -10,7 +10,13 @@ LIC_FILES_CHKSUM =3D
              &quot;<a class=3D"moz-txt-link-freetext" href=3D"file://COP=
YING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263">file://COPYING;md5=3Db234ee4=
d69f5fce4486a80fdaf4a4263</a> \<br>
              &gt;&nbsp; &nbsp;XFCE_COMPRESS_TYPE =3D &quot;xz&quot;<br>
              &gt;&nbsp; &nbsp;XFCEBASEBUILDCLASS =3D &quot;meson&quot;<b=
r>
              &gt;&nbsp; &nbsp;<br>
              &gt; -DEPENDS =3D &quot;dbus-glib garcon gtk+3 libxklavier
              libxscrnsaver virtual/libx11 xfconf libwnck3 libpam
              systemd&quot;<br>
              &gt; +DEPENDS =3D &quot;dbus-glib garcon gtk+3 libxklavier
              libxscrnsaver virtual/libx11 xfconf libwnck3&quot;<br>
              &gt; +<br>
              &gt; +EXTRA_OEMESON +=3D
              <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:${@bb.uti=
ls.contains('DISTRO_FEATURES','pam','','-Dauthentication-scheme=3Dnone',d=
)}">&quot;${@bb.utils.contains('DISTRO_FEATURES', 'pam', '',
              '-Dauthentication-scheme=3Dnone', d)}&quot;</a><br>
              &gt; +DEPENDS +=3D <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:${@bb.utils.contains('DISTRO_FEATURES','pam','libpam','',d)}">&qu=
ot;${@bb.utils.contains('DISTRO_FEATURES',
              'pam', 'libpam', '', d)}&quot;</a><br>
              &gt; +<br>
              &gt; +EXTRA_OEMESON +=3D
              <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:${@bb.uti=
ls.contains('DISTRO_FEATURES','systemd','','-Dsession-manager=3Dnone',d)}=
">&quot;${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '',
              '-Dsession-manager=3Dnone', d)}&quot;</a><br>
              &gt; +DEPENDS +=3D <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}=
">&quot;${@bb.utils.contains('DISTRO_FEATURES',
              'systemd', 'systemd', '', d)}&quot;</a><br>
              <br>
            </blockquote>
            <div><br>
            </div>
            <div>how did you test it for runtime correctness&nbsp;</div>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>I simply tested it using the following steps</p>
    <br>
    1. build:<br>
    &nbsp; &nbsp;$ echo &quot;IMAGE_INSTALL:append =3D \&quot; xfce4-scre=
ensaver\&quot;&quot; &gt;&gt;
    conf/local.conf<br>
    &nbsp; &nbsp;$ bitbake core-image-minimal-xfce<br>
    <br>
    <br>
    2. runtime:<br>
    &nbsp; &nbsp;1) boot target:<br>
    &nbsp; &nbsp; &nbsp; $ runqemu slirp<br>
    <br>
    &nbsp; &nbsp;2) Start xfce4-screensaver and set screen saver theme<br=
>
    &nbsp; &nbsp; &nbsp;&nbsp;<br>
    &nbsp; &nbsp;3) Run command to lock screen immediately:<br>
    &nbsp; &nbsp; &nbsp; &nbsp;$ xfce4-screensaver-command --lock<br>
    <br>
    &nbsp; &nbsp; &nbsp; Then the system immediately enters screen lock s=
tatus<br>
    &nbsp; &nbsp; &nbsp;&nbsp;<br>
    &nbsp; &nbsp;4. Move the mouse or press any key, then the system exit=
s screen
    lock
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1spJur5cBF18bt7V5OsaPkb1b7=
fKauEhat-0eTt2c9FUsA@mail.gmail.com">
      <div>
        <div dir=3D"ltr">
          <div class=3D"gmail_quote gmail_quote_container">
            <div>&nbsp;</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              I think it would be better to use PACKAGECONFIG.<br>
              <br>
            </blockquote>
            <div><br>
            </div>
            <div><br>
            </div>
            <div>&nbsp;</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <br>
              //Yi<br>
              <br>
              &gt;&nbsp; &nbsp;<br>
              &gt;&nbsp; &nbsp;inherit xfce-app<br>
              &gt;&nbsp; &nbsp;<br>
              &gt;<br>
              &gt; <br>
              &gt;<br>
              <br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              Links: You receive all messages sent to this group.<br>
              View/Reply Online (#126568): <a href=3D"https://urldefense.=
com/v3/__https://lists.openembedded.org/g/openembedded-devel/message/1265=
68__;!!AjveYdw8EvQ!drctXgVUzS6YGylZg5JzV8ihkVwXVg8wkeBf01WoY7p6njmQCK8qv-=
_eJLOd1eB5yRC9uosEaS0i2OrYLgaH$" rel=3D"noreferrer" target=3D"_blank" moz=
-do-not-send=3D"true">
https://lists.openembedded.org/g/openembedded-devel/message/126568</a><br=
>
              Mute This Topic: <a href=3D"https://urldefense.com/v3/__htt=
ps://lists.openembedded.org/mt/118966722/1997914__;!!AjveYdw8EvQ!drctXgVU=
zS6YGylZg5JzV8ihkVwXVg8wkeBf01WoY7p6njmQCK8qv-_eJLOd1eB5yRC9uosEaS0i2PssR=
6LX$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">
                https://lists.openembedded.org/mt/118966722/1997914</a><b=
r>
              Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@l=
ists.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">
                openembedded-devel+owner@lists.openembedded.org</a><br>
              Unsubscribe: <a href=3D"https://urldefense.com/v3/__https:/=
/lists.openembedded.org/g/openembedded-devel/unsub__;!!AjveYdw8EvQ!drctXg=
VUzS6YGylZg5JzV8ihkVwXVg8wkeBf01WoY7p6njmQCK8qv-_eJLOd1eB5yRC9uosEaS0i2Gh=
bzOFe$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">
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

--------------MipoJ5XtQyNpNQJsPnO0NAAK--

