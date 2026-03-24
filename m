Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D4CF532F1
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 08:21:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15205.1774340488121038578
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 01:21:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=a591FrzZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7543dbf287=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O4tKhw1916040
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 01:21:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=y+1BG/VlFG+EPK7zonyh3Mo4iEKEaOxfyhQkbJYxa1I=; b=a591FrzZMG6g
	r1O1k7VNazdPZlUdvXfW/tAKfSK0SuCb4BQU4PijTO4bvb0jr6VQ4qa83I4xg68H
	nb6Pc83gPWylPetAHw0bEXaTXzlvLae86bYJ6/9kZUrenXLJDgW7CDWO9YeuK7kN
	GPi5+zR85tgM6d/5VPaLbCxXtY7v4pZHmgAtGFoFs6G+3GpzscxE3ay67+OPLP0K
	Q2R5F9kK/YS6tQy3Igk4WQiJRHdY8ojrqnIpGjN9/t7aR4OHw+1Bk/57Qjh1xjmF
	5VBDspDrvmbVgc2bMdC6oKXrmZCN7IJH43sbVaU6+hdWhAZEbVnxTG6uQglSfg9s
	gXvqIiPoTg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012051.outbound.protection.outlook.com [52.101.53.51])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1pkyavu8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 01:21:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uw4/op7sBxkzGpaeUeoej+ch3YPtP+2zejnWcGNix+t+A2glbMxKb/WBl4FtbzQbc8NSQK29autWZyHxl8klbxMsUh7xvyactowwyNSLobJ2zm7RZhKPCZGH3JqU3JSkQiZewwCNh32ECGphbHkihRcEygjjgq7S7RHZFV1UnY2ES1RDohYZULp5q8QGkEEvFweOByTclw1s6VdN9CyN9Ufv088HOTbbv0r4B7pprkSQqXL97gLFn6QLA7VEFyro/1dVi2FgXPWsMb5T/phOCLX6seQyO9jckdgBnG3hi70pD6yXzSIZp9TWAL0GYTy5wkQ4I9BzEgwyqsWGE5bJ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+1BG/VlFG+EPK7zonyh3Mo4iEKEaOxfyhQkbJYxa1I=;
 b=n94/SSU9T5tAOjcqWdgY+ynRWHFPJMSiGBCeo8ZCgrmTo9LhK5zc22w1aI/yMdBMHAP3wii6CQfq0SZQ39VhaIcCcSfVWf5PAHt+DUUKbzLBJktAE4mN+Z9qN0NA0OmcCxzu995C0P8L2ZoEUS7sfnhIg6vuevb1NLNZ5OSwwzrnFKkC2ViSBd/IlRNZQ0NznihfC6P/dNkHMkbTqJylRkBnvbM8+jjpmRN3z2Mc82LB13N+Ius9BTzy/XDZpmG3V2/6z1fSCtNDcjEP34V11nE8znCmasrDXe/QlkKp0rn1HM+hWZlYjRzDYkEnohd86PnE/yZNcszhLV28sGf3tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by MW6PR11MB8440.namprd11.prod.outlook.com (2603:10b6:303:242::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Tue, 24 Mar
 2026 08:21:24 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::89ea:ecfa:c345:3fc6]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::89ea:ecfa:c345:3fc6%4]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 08:21:24 +0000
Message-ID: <40b1e7b8-58cf-42ad-840f-d2ef0d9a10ad@windriver.com>
Date: Tue, 24 Mar 2026 16:21:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][PATCH] postgresql: add ptest support
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        openembedded-devel@lists.openembedded.org
References: <20260324071621.3104812-1-guocai.he.cn@windriver.com>
 <b5a48fa9-8a5e-4530-89d9-4c7d939c4b45@gmail.com>
 <8b2343c3-f3de-442a-8e9a-548afdfa5c1c@windriver.com>
 <1a786966-d0f3-48de-80b4-08eeb25dec58@gmail.com>
Content-Language: en-US
From: "He, Guocai" <guocai.he.cn@windriver.com>
In-Reply-To: <1a786966-d0f3-48de-80b4-08eeb25dec58@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2P216CA0179.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::14) To CO6PR11MB5586.namprd11.prod.outlook.com
 (2603:10b6:5:35d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:EE_|MW6PR11MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a8066a2-3f2c-42a5-1329-08de897e562c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|4022899009|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	PrsUQkIZhQ0vqK9NUi41wQewpKjQnIaq5oQT7QKBBaMVq83Sn+gE1hY+PkwhoA5hrQge+yHRLhF7aO4V3SnHHnPSfXx+BCfJ0jk1951LAuNpzn7gAZ0PqtCRvawR5vycfhnoeVyV3Llr62i6VE4MK0zzGTtMc50HFjQZ5xbe1SgwOeey/ZwLoYF4166gUFeYZyPAFtCRqohMpq+6UDtzvODYnPjlHUxHOEhp27mfRFeRiYhosLfFBiZ9rtYwQV7BN3JQI541nXSzaucRktS3Syuun+ACulm6vsBf5b43YQU+AvFLQkSceM5ERNxNq6qalXPlT1xmQrkzL6TyAGRbf/Yhun1GAkRZl52O7dcgbjFhhgaVB7S6L8QNn0etblifZg8/tKXAm+5ISHhPPYoF8whlYLxMJY/zUCN5PHLpMm27+wwzQaRoPI5oTMdJFeJcPXZ12bmyQIRyg5IvucUiJMHt491SBl5nNUzaOwpGHfMUDO3WoM1dwOzcJpirZaE2spiYnaTSsV5jIpQ+5/vYuJyiwUZyv63Pi392ecFrXOlvz3lUr//4r50TFrZsEfreeDd1pF6qCQYsveqvxaOMC8oiYSFX1KoC5Y3nYjhpEjimauVxXqQ5vZ6W5g0MBZF+SlL5NvdkX3sxk73DFO7oD+ZDdkAIeGgRqP2uHUpM0rCNPmWlqFbER8iSgHVCpgUH
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(4022899009)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MUNUY2hLQjZraDZ3VEZ0UE1LemtMME9kcXVVaStPcnlJNlJ0c09aOHU3djBv?=
 =?utf-8?B?dEU2RUVUSng3TURnaGxuVndGUTcvNVQ5Y29jT0tsYWVlak1nMFpkNEp3YTFQ?=
 =?utf-8?B?THhEOGFlL0NVWGF1VUNzd1Z0TnI2bVFyQ3dLbnEvK3RYWkZQbVI4WEViUGg3?=
 =?utf-8?B?NlhOUzU3WmpCTWcyQXBIWkl2MktNL3h0U1JMTDF6aHU1RFpsNmdhVEMwMkds?=
 =?utf-8?B?NWdSQVpOZFYxSTI4UHFDMnZzWWpxNW1rbGh5S041Uis1Tk9paXErZUh6YkI1?=
 =?utf-8?B?ZTlTWVdPVU1CcHBhZDFFREZpUjhqZDdlSEI4NCtOSkQ1MmN5dkQ1NEhzSUNs?=
 =?utf-8?B?RURnYUEydm1qTDByY2wrSzBQckV6OEJseGlOMmVleDRWK1JMTGNsTllIcXIx?=
 =?utf-8?B?dVRzUEI3K3VYOVFqNkQvL2YvazlTb1Z3dFBhQk8zUmM5Q2hpWUtKNzRoOFJD?=
 =?utf-8?B?dEF5dkpDK1RWbTgrUy9MT3ZaM0FqRlluRGQ0Tk5RWHNNRnJGL0NBVVpZME12?=
 =?utf-8?B?UzdUc09wQm1UWFd4YmVNQnlueWJUWjBScFE5dEpLenRhTGxFTlQraWxCUWNW?=
 =?utf-8?B?aThxUzl0cVJOMXh3bmpkQlJMZTVLUE9FR0lVRVYrZWFHVm9DM3Z3YnRqK0dz?=
 =?utf-8?B?VmN4V1AyNjFQY2labk1wSGtjb2tES3BsSDZiOHdvWmVvWGg4VlQybWJHeEpV?=
 =?utf-8?B?dTM5TytrN3pva3BjOWxMb3lmVExJdXZWNG5Ta0tXaUE0Z2pRT3JuaHhFNkhT?=
 =?utf-8?B?b25tY2V6RWI3VDBxYTlrdVkyMEtsK1IzNDg4TXF3VHNoZThURjdkVUZvcHQ3?=
 =?utf-8?B?bFBQNGxLZHEyamVocm9KQUdxOTcvOVVhaTE5NmlxbnhydXBEbGZRWmRScDAr?=
 =?utf-8?B?aGh2ZFNsRmZCci9NMmVWUyszRXFiRVRBa1dKdjU4WXZHeGdpenpzdnFuQlBq?=
 =?utf-8?B?ODRtTk1jbVJZOXc2aDNsSEhYQ2k3WjVJNTZlQy84T2djUDBDV3dmd2FhV2xM?=
 =?utf-8?B?U0o2cXJvVjNhZkltU2w3Qzg3dEFCSkxXRkk0WGF6L3dhQ3pKT0J4YXQ0dXYv?=
 =?utf-8?B?UWR0eElaei92Y0hXSXZpeUNvRFZ1UWhTaGcyc0Zpd3RIYjYrOExWWFpJVENC?=
 =?utf-8?B?UHo1OVBYSlRpNGZRNG91S0l3azFleUZyNGlXSm42dm5ZYW5malowaHpJKzAz?=
 =?utf-8?B?cSs0WTNNSkVKZ0c5U3I1dXYvUXNwNWFqdmJtRUgvYVBnTlFnMURDTVcrZ1Ev?=
 =?utf-8?B?dU1jMFNHbmFUQUJZYWtvSG55OTVkUER5RUVkSnF0ZWdUOE1wdTZwOVZBWU11?=
 =?utf-8?B?ZUp5WXREWkptN3U4eFpOOWtmMVlEdms4alA4NzNtc1JqN3B1Z1FRSlpxU3RC?=
 =?utf-8?B?SEZTc2pYeTZnaEVyRzcrbmd6VlhHMlpvbzlWWHVmWFdDSFV0NVFYVnBRQTRG?=
 =?utf-8?B?UWNXODQ3VUl6cmtaeGpKRUJDYWdmYW1pY0NJNjZtMlk5ay92d005Y3JCWlZ3?=
 =?utf-8?B?TWdwb1VBdGFJOGxIMGxmbkJaZUpaQlMzQnNjN1pnRUlVeU4xTldUVkFQdDRm?=
 =?utf-8?B?dlZYTWhuSnFmdVFUajFmNnA4MFZ4TEZKbzlEMVBTZXhWSHdIWjRCeWI4WGFw?=
 =?utf-8?B?ci9WUllicW1OMDFFUHB3UU1Td2NuOWhNa0tHTC9wVTV1ci9UMWFHYjFmSG9Q?=
 =?utf-8?B?dEZSWEpLRWdlMFY1N0lhaDZHcDJQV1M0VWozSEdlZEREdmZRSWRmSUxLQ1ph?=
 =?utf-8?B?TnZsRHV4ZGdNK3cyZkU0cG1XSDkvS3pnMUV3QXJ3eWdZN2xwY0o1S2QwSlBo?=
 =?utf-8?B?QlM2cUh2eWVRTyttSEpSL1pHcFpZaUhYcERyY056TG1IUVVrS3lCL2hSL3Fw?=
 =?utf-8?B?SkVZdWttYUJ0UzI5dWg5cFRXdjAvQ2N4TzE5MFl6WEkvcWVnRjFQOEdJaHN6?=
 =?utf-8?B?bDczSEprMTBGM2hDb3FGVGFEMk16T1JMNU5RcnVOSUZaMjYrVWU1NmZ0NzdW?=
 =?utf-8?B?ZE9uUklTdmhpRDRxNFlYVzVzR3h5N1ZhTS95Y3RGTm9HZmpiS0JpbmNMeHFU?=
 =?utf-8?B?ckhWT1VNdDJYbmxzNU1SWjIrV2dUaDNubksyZUFrOFVlN0hFM1FtZ2dDRSs4?=
 =?utf-8?B?NTdqdXlUcWkzd3NqUkRpN1FFcXZoOFdJemVhVnF1UmdYYWR4QytMY3Qxd1Vh?=
 =?utf-8?B?RWt2eFlNWmxjZkVZUEo5RFp1SHdhQlZ2SitnWnRoaUFpREU5SEI4U1Nwa3BW?=
 =?utf-8?B?dDBTRHdLaURsZE9nWmdneUpFZ0RiLzFkQ0djK2tBMHZkcVlvaURrbVVuOFhY?=
 =?utf-8?B?MXUzOWdyQmlNbllGTzliV2g0MXJUQlFsNzhQSVRHWGd6TVdNZFhVaWI3di9B?=
 =?utf-8?Q?iPZMxRKLwA1gh5pg=3D?=
X-Exchange-RoutingPolicyChecked: 
	wTV4e6D88otx13YAEVp3mQFK053n3PERoDOAyi+FLaoC6bR1OzFHk+USlrE+iC9XOzoE+5zk7Ip0jE7/QC6DITh6sei9AmvgvDVqen+Ql288PE2TeHDnzTIoL85IXjCq5t9SmmAzJf+2Xoy0q/Mk24PVkCws/alLE2V9mIrSnazDjylrOvQJ9HTiOqkuJKEiFH7V+HwfeM6oe+VB62jflCoEGb2/32UO+ADu9dwD9z4FfsKOAFiXE/KLacazwb6fZgw0n9Bjqmuox5zzpeGJZO669v9UQrTbSQtsnimOYLHeWjY0i+S9eWEJuhzyZRRunPTVLl5wviVrhf3nZr+JgA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a8066a2-3f2c-42a5-1329-08de897e562c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 08:21:24.2442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zNbSAxobSp5T2cVWZuOfnswYQLT+IYGJ5PvgJKrShwTJwy47G+6ahExWRnBm6pDwSxk8x8nhJR0RE1TzAYPSx6RHUzoaW1k2Vxb2T8tUDK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8440
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA2NyBTYWx0ZWRfXzHWEYUDOh4f8
 EFwUnShC5neRhSEclCAmOwKpZGQPAEcoxQ/nOSAqXv25Do/kyIYmAbCFWlBpTDnPV+J2GFxQE0f
 YkxTxR3rDjIK7FKhnQquyRg8jdDfnCPyPeysIFv5RSZMHBe6H/0mtZ7mJwVIdRTopUJdp7+sdql
 qGUGCN3yUPDPG3TmbVSle8rjIZHFpWLkQm9RdA/PrGbfzsi9N7oewnL2f0BRzgvu3j9yfuJeUbT
 7kKez/vm5q5VG729RQJlANJVzQgqtY4J29imnH1XXqHStkVwJJ9o2x6yVZGsWHxDljOgVWfVQEo
 gHAs/tbxNOfazzUnaonPHlGY9lq7Yge64gM0M8Iqu/k5jjw3BFKDHtbRNDzT2AsoawCqy+wGi/G
 BNGwQVFN15Oe4DJN5/Gr5tyeB/Fy/woFd3OKtPHLpBBLdRlmWghhbcbwl8ZcTkqRcT3E12W2lYb
 9hJqmcmhrFE13XivTMg==
X-Proofpoint-ORIG-GUID: 0EZ8I-LrdK3KA9C_lLQ8qtIfmIqrTOlQ
X-Authority-Analysis: v=2.4 cv=Scr6t/Ru c=1 sm=1 tr=0 ts=69c24987 cx=c_pps
 a=Q0mMAVO0nY0JadJ+SMvTrQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=epTmVMiNAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=xcwSGfTV8jKNgvCKI9YA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: FakAYACSd311_4NrA-4lyrepYRDsrlGF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240067
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 08:21:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125547


On 3/24/26 16:16, Gyorgy Sarvari wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On 3/24/26 09:05, guocai he via lists.openembedded.org wrote:
>> On 3/24/26 15:36, Gyorgy Sarvari wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>>>
>>> On 3/24/26 08:16, guocai he via lists.openembedded.org wrote:
>>>> From: Guocai He <guocai.he.cn@windriver.com>
>>>>
>>>> Add ptest infrastructure to run the PostgreSQL standard regression test
>>>> suite (pg_regress) on the target system.
>>>>
>>>> Test logs:
>>>> root@qemux86-64:~# ptest-runner postgresql
>>>> START: ptest-runner
>>>> 2026-03-24T02:42
>>>> BEGIN: /usr/lib64/postgresql/ptest
>>>> ......
>>>> ......
>>> I'd like to ask just one confirmation question about this "....." here
>>>
>>> Is the output machine parseable, i.e. do the results have PASS:/FAIL:
>>> prefix, at least as a final summary?
>>> The run-ptest script doesn't seem to do such conversion, so I'm just
>>> curious if the output is usable out of the box.
>> if one case fail, the logs like:
>>
>> .......
>>
>> not ok 78    + triggers                                38360 ms
>>
>> ......
>>
>> # 1 of 224 tests failed.
>>
> Thanks. The problem with this is that it will always show up as a
> failure on the autobuilder, because it can't parse any results - the
> logparser looks explicitly for PASS: and FAIL: patterns at the start of
> the output to detect passing/failing tests.
>
> Most frequently this is done by sed commands in the run-ptest script,
> converting the test output to something ptest-compatible. But at the
> least, could you please add a summary to the end of the run-ptest
> script, something like
>
> if [ "${RESULT}" == "0" ]; then
>    echo PASS: all tests passed
> else
>    echo FAIL: some tests failed
> fi
>
> This would allow automatic evaluation of the results.

Thanks.

I will send V2 after updated.

>
>>>
>>>> All 224 tests passed.
>>>> waiting for server to shut down.... done
>>>> server stopped
>>>> DURATION: 853
>>>> END: /usr/lib64/postgresql/ptest
>>>> 2026-03-24T02:56
>>>> STOP: ptest-runner
>>>> TOTAL: 1 FAIL: 0
>>>>
>>>> Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
>>>> ---
>>>>    .../include/ptest-packagelists-meta-oe.inc    |  1 +
>>>>    .../recipes-dbs/postgresql/files/run-ptest    | 53 +++++++++++++++++++
>>>>    meta-oe/recipes-dbs/postgresql/postgresql.inc | 42 ++++++++++++++-
>>>>    3 files changed, 95 insertions(+), 1 deletion(-)
>>>>    create mode 100644 meta-oe/recipes-dbs/postgresql/files/run-ptest
>>>>
>>>> diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
>>>> index 4de602ac1c..0e395db48a 100644
>>>> --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
>>>> +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
>>>> @@ -76,6 +76,7 @@ PTESTS_SLOW_META_OE = "\
>>>>        fftw \
>>>>        libusb-compat \
>>>>        mariadb \
>>>> +    postgresql \
>>>>        re2 \
>>>>        rocksdb \
>>>>    "
>>>> diff --git a/meta-oe/recipes-dbs/postgresql/files/run-ptest b/meta-oe/recipes-dbs/postgresql/files/run-ptest
>>>> new file mode 100644
>>>> index 0000000000..004cf2ba87
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-dbs/postgresql/files/run-ptest
>>>> @@ -0,0 +1,53 @@
>>>> +#!/bin/sh
>>>> +#
>>>> +# PostgreSQL regression test runner for ptest
>>>> +#
>>>> +# This script initializes a temporary PostgreSQL database cluster,
>>>> +# starts a server instance, and executes the standard regression test
>>>> +# suite via pg_regress against the installed PostgreSQL binaries.
>>>> +#
>>>> +
>>>> +set -e
>>>> +
>>>> +PGDATA=/tmp/ptest_pgdata
>>>> +PTEST_PATH=$(dirname "$(readlink -f "$0")")
>>>> +TESTDIR="${PTEST_PATH}/test"
>>>> +PGBIN=$(pg_config --bindir)
>>>> +PKGLIBDIR=$(pg_config --pkglibdir)
>>>> +
>>>> +cleanup() {
>>>> +    su - postgres -c "pg_ctl -D ${PGDATA} stop -m immediate" 2>/dev/null || true
>>>> +    rm -rf "${PGDATA}"
>>>> +}
>>>> +trap cleanup EXIT
>>>> +
>>>> +# Initialize the database cluster
>>>> +rm -rf "${PGDATA}"
>>>> +su - postgres -c "${PGBIN}/initdb -D ${PGDATA} --no-locale" || exit 1
>>>> +
>>>> +# Start the server
>>>> +su - postgres -c "pg_ctl -D ${PGDATA} -l ${PGDATA}/logfile start -w -t 120" || exit 1
>>>> +
>>>> +# Ensure the test directory is writable by the postgres user for
>>>> +# regression output files (regression.out, regression.diffs, results/).
>>>> +chown -R postgres:postgres "${TESTDIR}"
>>>> +
>>>> +# Prepare the tablespace test directory
>>>> +mkdir -p "${TESTDIR}/testtablespace"
>>>> +chmod 0700 "${TESTDIR}/testtablespace"
>>>> +chown postgres:postgres "${TESTDIR}/testtablespace"
>>>> +
>>>> +# Run the regression tests.
>>>> +# --dlpath points to the standard PostgreSQL package library directory
>>>> +# where regress.so and contrib modules (autoinc.so, refint.so, etc.)
>>>> +# are installed, so that CREATE FUNCTION ... AS tests can locate them.
>>>> +su - postgres -c "cd ${TESTDIR} && \
>>>> +    ${TESTDIR}/pg_regress \
>>>> +        --inputdir=. \
>>>> +        --bindir=${PGBIN} \
>>>> +        --dlpath=${PKGLIBDIR} \
>>>> +        --max-concurrent-tests=20 \
>>>> +        --schedule=parallel_schedule"
>>>> +RESULT=$?
>>>> +
>>>> +exit ${RESULT}
>>>> diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
>>>> index 040b3d5e34..dfc624f07e 100644
>>>> --- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
>>>> +++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
>>>> @@ -29,6 +29,7 @@ SRC_URI = "https://ftp.postgresql.org/pub/source/v${PV}/${BP}.tar.bz2 \
>>>>        file://postgresql.pam \
>>>>        file://postgresql-setup \
>>>>        file://postgresql.service \
>>>> +    file://run-ptest \
>>>>    "
>>>>
>>>>    LEAD_SONAME = "libpq.so"
>>>> @@ -37,7 +38,7 @@ LEAD_SONAME = "libpq.so"
>>>>    export LDFLAGS_SL = "${LDFLAGS}"
>>>>    export LDFLAGS_EX_BE = "-Wl,--export-dynamic"
>>>>
>>>> -inherit autotools pkgconfig perlnative python3native python3targetconfig useradd update-rc.d systemd gettext perl-version multilib_header
>>>> +inherit autotools pkgconfig perlnative python3native python3targetconfig useradd update-rc.d systemd gettext perl-version multilib_header ptest
>>>>
>>>>    CFLAGS += "-I${STAGING_INCDIR}/${PYTHON_DIR}"
>>>>
>>>> @@ -184,6 +185,45 @@ do_compile:append() {
>>>>        done
>>>>    }
>>>>
>>>> +do_compile_ptest() {
>>>> +    oe_runmake -C src/test/regress all
>>>> +}
>>>> +
>>>> +do_install_ptest() {
>>>> +    mkdir -p ${D}${PTEST_PATH}/test
>>>> +
>>>> +    # Install pg_regress binary
>>>> +    install -m 0755 ${B}/src/test/regress/pg_regress ${D}${PTEST_PATH}/test/
>>>> +
>>>> +    # Install test schedules and resultmap
>>>> +    for f in parallel_schedule serial_schedule resultmap; do
>>>> +        [ -f ${S}/src/test/regress/$f ] && install -m 0644 ${S}/src/test/regress/$f ${D}${PTEST_PATH}/test/
>>>> +    done
>>>> +
>>>> +    # Install SQL, expected, input, output, and data files
>>>> +    for d in sql expected input output data; do
>>>> +        if [ -d ${S}/src/test/regress/$d ]; then
>>>> +            cp -r ${S}/src/test/regress/$d ${D}${PTEST_PATH}/test/
>>>> +        fi
>>>> +    done
>>>> +
>>>> +    # Install the regress test shared library into the standard PostgreSQL
>>>> +    # package library directory (PKGLIBDIR) alongside contrib modules such
>>>> +    # as autoinc.so and refint.so. This allows pg_regress --dlpath to
>>>> +    # resolve all required shared libraries from a single location.
>>>> +    install -d ${D}${libdir}/${BPN}
>>>> +    install -m 0755 ${B}/src/test/regress/regress.so ${D}${libdir}/${BPN}/
>>>> +
>>>> +    # Install run-ptest
>>>> +    install -m 0755 ${UNPACKDIR}/run-ptest ${D}${PTEST_PATH}/
>>>> +
>>>> +    # Set ownership to postgres user for running tests
>>>> +    chown -R postgres:postgres ${D}${PTEST_PATH}
>>>> +}
>>>> +
>>>> +RDEPENDS:${PN}-ptest += "${PN} ${PN}-client ${PN}-contrib perl"
>>> ${PN} is part of this RDEPENDS implicitly, no need to add it separately
>>> (granted, it also does no harm by being here)
>>>
>>>
>>>> +FILES:${PN}-ptest += "${libdir}/${BPN}/regress.so"
>>>> +
>>>>    # server needs to configure user and group
>>>>    usernum = "28"
>>>>    groupnum = "28"
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#125545): https://lists.openembedded.org/g/openembedded-devel/message/125545
>>>> Mute This Topic: https://lists.openembedded.org/mt/118479820/6084445
>>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>
-- 
Thanks
Guocai


