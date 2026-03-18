Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23AF1FCD0DA
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 08:28:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9221.1773822530910286585
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Mar 2026 01:28:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=UCIUNB6M;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=753792e7cf=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I4QQ6Y2901035
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 08:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=rRUKNp5IH09OHJO3Ia0JMjLYTCADY7J6ZfvbbVmk9Jg=; b=UCIUNB6MAoRB
	Kt0JUkvzoa6eY/sPy+1A1RWjAWfQiDmn3XQtZCdNhJgkQSN0PpZB5+vJLPKrcmq7
	ALyRbfmyP7UegFBsWZNsUM2turuBwM9520i2Z0CqIhRkaVKNOBV6Pga4oLR0Gw0u
	7jNAJ3I4YWuy2G2flumuaRiDTQrTO001i5mMC7RyzvD7BrpbvkQ4bzR8lh5paqoH
	K68TOKsagh1LKvkKoqSPc8sRmymubfRT7t1yYDX59aupvKYkZcupQZyXZNDvvfzw
	dJ6q4XOflXYYP1CByNlMhhbhC5sysYUfzQIO476nJ46kNnjluJL+IJ8tOhb2c+zE
	eH9ZWeJVuQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010041.outbound.protection.outlook.com [52.101.56.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cy9ans1yn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Mar 2026 08:28:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9ULxa1fQj0IruW3CtP0tVAiR9JIjhItuaVNzsYWfcwasJU5h1JTOWzHlJA9wBHy+51dnN7P3GX20ZpmbVUcvj4o2iKU2k2aURCXR6G/lk84Szd2vWb+eUAScy3sKpAk+v3EBUYp6Uo3crMrpaJmgleqpj8Jv4K6iaH73NcCVSA9tEU19nbD1ejYu0f4S8IA4B2kuq7+NAffvl5z3c5FtYmAXAqerWyUPAltxl5huT2rKGZXkD36n3EYkaOJKyJhKnqJ8Eds/LFkrJOPnyxaU8E9jD82Bij98zGc0yCI0m6SETp17JNXaT9joH3fLpt7/ZomVNhrTWPIMVUkth5OMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRUKNp5IH09OHJO3Ia0JMjLYTCADY7J6ZfvbbVmk9Jg=;
 b=LVvWr/dPyzBPxllq8fhBsNengb/YAZQUUTK5KvcEkms8iuDQsBZ4dl1xlmw+ixqFMIC3vRh0WTJvxl4giOrs19/s66F2S8AiJLzxFASBhe78HgzjieSL71RRBV4LNIiEee6dzwQTCTasyvhEEKlZs2ZS5rC3wxy/wBsF+Xz8ZTzQWE9hEpp/r45AVtIo2/qeS8eemRn+m4aL4Dgd52RCnnR9oPewApkgRinB6em4CTwz4u82JPOmBuJaL3ge4/k6FHQ6zf951PV51oOriT6F6TKKeQ0DEr4TKl37zjjbh6ikx32pj5JoqNqv3HCYrUPuESdF6EhIEg3Rmr11VCNoWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by CY5PR11MB6413.namprd11.prod.outlook.com (2603:10b6:930:37::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Wed, 18 Mar
 2026 08:28:44 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 08:28:44 +0000
Message-ID: <3b98da19-c5c5-474c-9715-3d62fc59d0b9@windriver.com>
Date: Wed, 18 Mar 2026 16:28:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] dlt-daemon: upgrade 2.18.10 to 3.0.0
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        openembedded-devel@lists.openembedded.org
References: <20260316083826.1550599-1-changqing.li@windriver.com>
 <20260316083826.1550599-6-changqing.li@windriver.com>
 <64b43660-a810-4ea1-a1b3-3015a0c47e1d@gmail.com>
 <9e353be2-26c5-46c4-8cdf-4ea33d24ac8a@gmail.com>
 <9e4de336-1673-4ff8-90fc-878f99ff4888@windriver.com>
 <cee29eab-457e-481e-857d-f552117fdc4d@gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <cee29eab-457e-481e-857d-f552117fdc4d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0204.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::8) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|CY5PR11MB6413:EE_
X-MS-Office365-Filtering-Correlation-Id: 2791b3bb-c456-4936-5475-08de84c85e22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	nwO0RWFcAXknq74vPmDICe38KIirAwQQfcCW0mcYH7dzsZRc+yqi4BdrdZH/TgBzOOoyeoVpwEH0s/gZ6mqP2yAH6MZDjPEabuE2sM4amiizCwowR8PV6lxNXg/tf482KPiTFlJYKTRQfQ9C+1CpJ32NsaXD78oyRR6cJwdJGIrT+qlS5EPZEA9pQjC7Z3X+Z7Wm9ZCfem5M76IEGIYkysKlry2T3CFTq2XyMBhThwlQwTgNbIzURtKcucXhA7kSmPojsDT2U51OGTlaAPJ1PGZYWJDZZMS5H2295bD3RZxSyIlu7oKP5BMnZkx84AsE37NJJW1jzizUHu43UqB6GWbuNV/3W2vLO2Ae28UGqIvrhzAIWV0T3Esi3uYRjaefXx+FQ3+aAReJNyOPeAq8eJdb+oWHAOFBV9T7rgVjGavbUlENhI+vz5pP/psj6fJmmwZf57AOZEn02QdsJ90fP6vGm7uXXy3U4p7SXdSAF98futXJYRfutqqHwiWfnI/SZi68IzVGRCW1AqoPTQTJr70rdtBiyI5h35eylaxFKoQ70bU0R5ez6onVTvrOr3hJIejKIMLyI6mKmAQdN2mLj2ym6hKXx4D8W2VAJLpz1ly2goyqsD9dSM6jfji1K4SembP23pKZjm47IeeTAnsnZdHw8JGFy2PrSiB+CLLbI8MR3UHPbCsELL6BZQTIdT+eStmYcZfzmRKkoXrjdMLSOFacEqulF1jl7nM60JfJZ6PKYY2YzY6r89YqmszSzYPu
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T3lrZzN5RmU5ei8vakhaUS91dGIrMll1QVRuMHlBWDBKaytXODNaQ0tjLzlj?=
 =?utf-8?B?eWNiU2NtL1psVWQ2S2Q1MmtjU1RrUUhSc2kxR25lS1hFSW9hT2tiTHplMGNw?=
 =?utf-8?B?QTNoN3RzcHBqdVdnWEdQTlkxVjVPOFVQK0N5Q1FqVWtLTmVEa0xMb1htZTRD?=
 =?utf-8?B?V1h3MDNmUVBtdmMyYkVDMkx3VWxGN25Ec1lEYXBoOGQzeXlFd0ZVbnZBazRa?=
 =?utf-8?B?L3FmY3ArU08vZ1ZnR0M0MjVId1VUaDVESUpBeDhkRUYxeXpPTDNrQ1JaUWtr?=
 =?utf-8?B?RjFuQ2FKOXl3UVRiSGhoWlAxR003cGhHTzNxYTNDK09NWjhUV1lEM3Zqc2RD?=
 =?utf-8?B?NWRpNmJIaWw4RVk5a2RVdFZjaE9RcGFVTkQ3TnhqV2NEY3lnQ1RERnZHdGMy?=
 =?utf-8?B?dlRZYTBwS0d0TS8zS2pZSDVucFJxL3VBeUxMd1gwdFFPWXFud25KZkdQWE52?=
 =?utf-8?B?ZEQrOHhXZnZ5U0xZNjYxZWFQVVpGcnFPUnFuMEZ5MVBDQTR0b3NiVGVLd21E?=
 =?utf-8?B?MTR2bEFqZGZoeXFDekZMUCthRWFCMTNzMm92cGRYa3M5cjd5R2hLbzViK1hI?=
 =?utf-8?B?cHdNaDUyOVdKWlNiRG9UOG51RzNMSHA4YnE3T1ZUZmJTNERYeFNDZU5mWjh2?=
 =?utf-8?B?cStQQWNkMFpoKzJNRWpuZWpEVzhSUjRqOUo2RnZUMDRxT1QveWh5a0pvbllK?=
 =?utf-8?B?cmc1dW9EUW9HRFcyaXBxTFcybm43ZEZJclNQVFhldEtiRU5yN1kvRzFMT1RV?=
 =?utf-8?B?RDZ1MVVpQ0FMTU85Y3NOSm5qRGpRbVZ1OWZkT21hTHVhdVpyWTI3OCtFaVNS?=
 =?utf-8?B?ZUFEM1lPVy9sMHd6UWllYlhzdThlSUNtU3V6NWdtVUdiUnp3RmNpYlRFSjlv?=
 =?utf-8?B?R0V5ajFsRXFCUEQyT1J5T1gxcUI4RUdrOUI1dUZMSG9HM05qM29oV1VGVDJB?=
 =?utf-8?B?eGJaTWEzR00zL1dKNHZVYjhSN3RxOGJ6bVIwRjU5elZmZC9udFliL2o0OWUw?=
 =?utf-8?B?QldkbmFFdDhGWjRqL2FwMmEwZFN2SmVpVlpHZy9NKzhTVldmWDJqc0ZoNnRK?=
 =?utf-8?B?a0hraW1JL2dWUWVvbTltdUkwYnhYYzhQR3puRkt3dmhYNkExM1Y4VSs5TXgx?=
 =?utf-8?B?bzd5QWZEZ0ZqVTlwS3B2T3BxeU5nTXowUTZmdlRQeWZXS2toQ3FwZXRvVjNK?=
 =?utf-8?B?c1BhWmpHYlZSVjhnaEd1USthdWJkSnlTUWxnRmduekhadndWelFkUFRObmo4?=
 =?utf-8?B?YXMyRzNrK2RlSFNGOXhlR2NXMHpLS0FRbm5VN1d3enVTZ1FOZTFMWHdFM001?=
 =?utf-8?B?WGZVSncxVlNjbUF0L2dxaWdrcVlCY0R3VTdYc09odGJSSHJITWNZbkh1WnNR?=
 =?utf-8?B?UW0rZ2VOVlZZTElyNG1lS2kyTWZQME1tWXZwSTBuQVdCNjFKTFQ2L1I4Mi9C?=
 =?utf-8?B?ajhZNmh0eFRYUVpJU283MGV0NVA2M01UZXhodlovbGUrTElxbllNbGhzVXNm?=
 =?utf-8?B?VGI5RnFrMlBUc1l1NFJDUGNKaGJOUEs1NEhnRHBUOGF6U25qQy84TlZQMjls?=
 =?utf-8?B?Nk5ZVUNXdG53dTRHdjBwZmEza2l2NEwrOWJKaUZzKzNLMHdYNHMyTDVwMk1z?=
 =?utf-8?B?T2V4UDNBUWFCb1ZVdEY1dEFTQys4SEM0TW80bkpwZjUrNC82UmN5WGIxSVRU?=
 =?utf-8?B?MGw3WW1uMkVMcFNpdDkwUTBOWW9Fd2Jic0Z4Mm1jVDNjeVNGTzFFbDJwczdt?=
 =?utf-8?B?QktSRFRWOHBSZ0d1UnJJZmlhVHhCOEt2M2pYWStHbVF5Y1ZEYWVJOHNoR09K?=
 =?utf-8?B?ekJjeE1ONFZQeTA2OERGTkp6NWlLalVBcmE0NnA3RE1VcEpURUNNZjdYZGdS?=
 =?utf-8?B?VExOZFI1V0JubUNPMWlnMDVvVFYyVDh6MW1wWEZ4cEZxM1lSLzVrWVUwTlVO?=
 =?utf-8?B?RXg5V1g4OVRCZFRpTXQxYWJZam9yOG91dU5WSHZleC8xcFZVekJiZVlPVU96?=
 =?utf-8?B?eXo2N3hldy9nWUVCUjZOR2FOd3JXVmJiTFBqOXNOQW93ZElyY3NLRGxWQVph?=
 =?utf-8?B?MUZoS0dmTWUyZU5hWEt1SHhIMVBGeTNwUkQ0WUxReUtaYW9xODVndkFwUXBY?=
 =?utf-8?B?Y2E3eWhUaXVhWHNXM3g0ZUFFNVZwRllxMjF3ZXBocnZPVnc2S3F5dHoyUHYw?=
 =?utf-8?B?MGN4NUtQdVYxeE5TaHJzVHYxTy9ITlQwOEJqTy8zU2IxYlNPVjJVeVd5VE9P?=
 =?utf-8?B?a2FkYjlDV2taUHMwSGJ3U1FIYk1tZXVEUG1Sd0k3TEhyZnUvOFE2K1Jkam1O?=
 =?utf-8?B?WUFiQ1JrM0hSL1Y5dEtQYVlQN09BakRpd252aDZMYUg1SlozY2d5UjNWUkZr?=
 =?utf-8?Q?/8HeaZNgwwA8ZFHk=3D?=
X-Exchange-RoutingPolicyChecked: 
	tKbW4sIWv2Fkk3dFcCyJtjozgoakpzmiCcbhIHuCz9cS6y4iWwYD83qIM2O4Dlb0v9dr5cG187JYQl4OZpN6UA3U58oGPe0jNK/m2Ec8Km3IoVx4FUHPQYLRQpa11LPadcVK9WVc58sakFKqULUDxN2c2R+/FBXg80k10wn0GZU3SNjg8W4GKa2IYn0jVLDd58O9SvAyE/X7Oy0fvGLrSsnQDjziMEOwpGdgLzDKeqHYyxI7TwuNyrre1caFLGabPECampW5E5IZeY24FgdyfzmJbxmqi8qPjeKSD8qo5C+xoA0F87O7JiMT+bdDSar1GdGbQvzxoHiLN25qZ0dVOQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2791b3bb-c456-4936-5475-08de84c85e22
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 08:28:44.3191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VntDZJkj662x+M4txkUyJ4B9XD9qM02U4c/f+5XHl+OLwoF5st12HpFpfaMWYJXfIEfWB9nLwv+zsAG8x4u6gmBYZD8vK0QLayVCP4ZRyz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6413
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=IrMTsb/g c=1 sm=1 tr=0 ts=69ba6241 cx=c_pps
 a=XYu8HXWfxIrayFrXgJv6cg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=XMC4lU5bAAAA:20 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=yQWv8PSJVmcWvK8vhYgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: i3LIQISsQM1lT7RwTOMu5AtUeRq7Qe1d
X-Proofpoint-GUID: BQ0FI_vECJ3Fe_e-GL7REjRK2TR3uq8u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA3MSBTYWx0ZWRfX1wDADk3xPNpY
 QWKK+j7maFa6YlK62GIdzva61HiLR24NyAZOoimyrIMCFCsvpISx9oKlQeIZNvqMSadA7nYoVND
 L3j2hdOMOow6e+IhWMC/rn2/wiHsdxp9/BBepr4H0aGpkDQjOFI/XN/ZzJuiH1JA8kmIV40vdU3
 VzNF8hba79WjsT1jli9+RYlbrnh/ZGtyVGtnmwo8LlQBB1oJF3H6AMTjqEHzZgEXNgWN0knLxFp
 SaQwaMuFoIjvSlPfaMYtms9MPgnLwN1WUk7BVEUvx5JRIDGLf1C1rW8Eglsc25boJ0bolWuBbLj
 1atZYx9/4BrH/OUOTf8Fdoszr+9+CI2GuHWwD023CkWYLyd+vQjRuvRqq0oUNEYSCFGlB49gGWK
 VJHtSIDGaqGwYJY720l28R1rMcgEybKQYp1mO7dMXA2RmRFjdcSKWsG8StIoWH+d3RbBuOAsMSP
 2gjJ6ITxsMdCf2h0Khw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180071
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62I4QQ6Y2901035
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 08:28:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125351


On 3/17/26 18:33, Gyorgy Sarvari wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On 3/17/26 10:25, Changqing Li wrote:
>> On 3/16/26 19:29, Gyorgy Sarvari wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
>>>
>>> On 3/16/26 09:57, Gyorgy Sarvari wrote:
>>>> On 3/16/26 09:38, Changqing Li via lists.openembedded.org wrote:
>>>>> Changes:
>>>>> https://github.com/COVESA/dlt-daemon/releases
>>>>>
>>>>> Remove patches already in 3.0.0:
>>>>> 544.patch
>>>>> 567.patch
>>>>> 0001-CMakeLists-txt-make-DLT_WatchdogSec-can-be-set-by-user.patch
>>>>> 0003-allow-build-with-cmake-4.patch
>>>>>
>>>>> Add 3 patches to fix build failures
>>>>> 0001-Fix-compile-failure-related-to-gzlog.patch
>>>>> 0001-Fix-kinds-of-build-failure.patch
>>>>> 0001-Fix-build-failures.patch
>>>>>
>>>>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>>>> ---
>>>>>    .../glib-2.0/glibmm-2.68_2.86.0.bb            |   4 +-
>>>> Is this glibmm change intentional in this patch?
>>>>
>>>>
>>> It seems that there are some compilation failures (different errors w=
ith
>>> different libc implementations):
>>>
>>> musl:
>>> https://gist.github.com/OldManYellsAtCloud/9ec67b1fae3daa99f2a8d20bab=
a3a19a
>> after research,  this is reproduced since systemd init manager used, s=
o
>> the PACKAGECONFIG is different.
>>> glibc:
>>> https://gist.github.com/OldManYellsAtCloud/4cd6a4d28156eb486efff83381=
394913
>> I cannot reproduce this.   strrchar return char* is aligned with retur=
n
>> type. seems should not have this error.
>>
>> I build with sysvinit + musl , systemd + musl , sysvinit+glibc , syste=
md
>> +glibc with V2 patch, all can build successfully.
>>
>> //Changqing
>>
>
> Did you try it with glibc 2.43[1] in oe-core? That error indicates a
> failed new restriction that came with this version
>
> [1]:
> https://git.openembedded.org/openembedded-core/commit/?id=3Df791d6c5287=
0f3571e740ff7818d45bb0a717934

Thanks.=C2=A0 Indeed it is related to 2.43.

//Changqing


