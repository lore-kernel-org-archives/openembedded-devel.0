Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2712CD37AC
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 01:44:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26024.1778809445923815017
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 May 2026 18:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=IHmY1AL8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=95954df25a=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F1F7sJ782576
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2026 01:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=+POy0bQbux6csF04fDic90YJ8SkueFxvJJjMH3a+0PY=; b=IHmY1AL8fq9P
	pB4I8W9fPjLY8zZ9FSCsOKiwLlMZRngZztdsvNavmtXX/4wV4H3Z7qsvf+0SEXG5
	c/8BjDfvHP0NBE5nmWlqyrOykOdVde5P8tRlXt/fr8rQiwTMdqcH+wg3vzNQ79Rw
	X/A0430W+OXSCwMJFOQdJQNfVciZRT90AuR2jnoxH9iRWYPK7zh5+shW0RznhLY8
	u2dIPCFPZFgSy49FRXCvd1COERrjPoL/8vS7yVgB27/tEaF1B6Lv1fB40tS0dbSf
	3geNiAHLKiBsynUVdQY53a7dkVQTV9Xh2uAM0DzGHLI5VX4ew2bNlOC2FqUCIsxy
	LhFdrzPdTA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011004.outbound.protection.outlook.com [40.107.208.4])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e5m6b0ac4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 15 May 2026 01:44:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LOfxApJpRyj0Q8dliuOcUyMBJiUgKhLUtKR1pZUHXHfISZcI/zP0ZGvm4UGsUjzVAkY7ZryWBA7gUP/mQuybGAHTObxDO8lVKQJbrOZ3+frbblQAdr10/Y0TqaWU3KAn6jvowcxh+KmBSIirKTyIK9V99UGov7Fc6KF583ZwGEJah6TcFFKTWen7fV5eHr+D62ojOnWycQBc11WSXIF4v2TwHn1uYmAkJ2+QUbXRmlnF/wQ6oM0Q45EcqkQlpuCTOToLdpKO3Sx+0YDlTEW16lWw3zWk452iWz973x9dV0XcunNlEIOsmB0iIP49gNj2NMy6pyRTz+zZ+WwFK5NE8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+POy0bQbux6csF04fDic90YJ8SkueFxvJJjMH3a+0PY=;
 b=epATZfVtZd0gu5uW7A+MfQGwZ3gkhDOChhstRcu4HzvASQ3IRYRyM76zLbVrLhkHOePfiKHMndaxmnJfF5WBjgi21bya0fHzdJVr/LPl62Z2w9N/YaBXIf4M/6PW33pL56YnV5qIe+pO8iGMQ2Xw5kiWAr+PAFNQo+8OOAsXbqAcyNzZ5eq0vmG0ZhtcYoAzwo+Ur5P+X4hAWgpyImWwQrnvSFSBsQu9SRzZd/DzvgPTYY/B1cSBCwt+nYp2vg0DMM5xtNfABzN3cWiwhDFhsmZXimSvZ54DnXxnFpk01jUY8LIeKFzYpTVDdrCKhNmAg4yrCQbBlyo2W9chNooTNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SA1PR11MB6870.namprd11.prod.outlook.com (2603:10b6:806:2b4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Fri, 15 May
 2026 01:44:01 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 01:44:01 +0000
Message-ID: <40b403e9-44ef-4caf-89cb-47f22f7ce820@windriver.com>
Date: Fri, 15 May 2026 09:43:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH V2] postfix: upgrade 3.10.9 ->
 3.11.2
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
References: <CAMKF1sr-mFccrpOTJ3yVitujsrkCCJyS+SFdPyki8Wo0vk+TCA@mail.gmail.com>
 <18AF5238DBAFD59C.2716283@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <18AF5238DBAFD59C.2716283@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TP0P295CA0013.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::18) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SA1PR11MB6870:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d765b21-45f3-4e84-0f15-08deb223703f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|4022899009|366016|4143699003|56012099003|18002099003|11063799003|3023799003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	RvU5XCn8tCxzm9UMH2B8vixo/KhfIa+Adh/9Kx++5y3ZwoYTEIkoX4sVrYBNKzjzyr6XX60vJGFAXILMuc2gjEM7CNpoYtzNL772MmcmaefWEo4kZ7Jn632m+JykpzqiKr3RgJtbxvXe9QyGhTYc+2qKhZhNBG/f7lX0Fm0TIILh8uC1IL5qmLDEgr3Qqn+KTK4Qc6PwxtbNwv50hyANJSourv5EmH6hAH+7vxLF1Mf3FYQRJiSECV3co9+jp0TJFYtb5ir777+dzEH2DH5brIYZy9Gcx5yPigQl4dJuMJn5fwQo6/GKR7FqQUYE/Bm83FCSiJ3uvSlsTRsBTzdFx6FlrSOQJwAW8p1BnG9xgDvuC6IP0VCMp2N+J833/b0LuuHyCVtG+/ePdVCuxEAL+oOX8xgl+6/JSYvPx7FaVe5o9l3VOHzXviB2NJa5YBCkv9tD88fcZnGb3YlNHhUWyp+4+sYK9BMFIqWF2AK3vunjiGlc6G3U0lhokmCwBcmRpN5aB+sQERwtPyqPjbw3L1A02JsYV88EFkDx+3Iz5DxcHnOIyXQLlEAuFt5ko9mPmSVORQi3EVP8HxZcWuoLj1nMaeKIW2G8B7sH20tmzmfUY2USFU2szBCc9zvrkwERAqs9Gi07ailycXW2CeTHMg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016)(4143699003)(56012099003)(18002099003)(11063799003)(3023799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NW5UVGdTaTdXdExXUkV0MWJ4cWpielg1WWkrVWdGekEreXFyZjdVdnVXeEQ4?=
 =?utf-8?B?M2xTT1ljcGlvaCt1ZWo0TExndURQWjk2VVR1UTNEQUVYbmxpM0Fncktac0k5?=
 =?utf-8?B?NExtMXVYSEs4OGtpNEg4b0dTMmxMNlVOUEg1ZTI1c1k4MEZOZW5Nd3JrV1NY?=
 =?utf-8?B?cjFPM01QcnZuNFFmejZtdmNBRTVJZjJ0dzVGbk81Tmk5eU94M1RkakcxbnNr?=
 =?utf-8?B?VmlwM29yemxDRmRsZ2lBOTZnb2E3aWhJTlJkOEFWbEZtUUhjTjRYWFlDTHh4?=
 =?utf-8?B?QUwyVGNoZFk4NElDay9FS2NRZngzRGdVdW8zSjRkeXJzNTJoc3E5WXUzaWlM?=
 =?utf-8?B?V1lhajF4emhuU2NHQjIrVUNzTjRFcnBPUzZYTmpZNDRNZVlMM0xBZWZvSGd5?=
 =?utf-8?B?Rk1aN04xNHBiMkJyYkVZRTJlczVYYnJZaDAwQ2dtVnYrS3JaTmRzMDdoOXB0?=
 =?utf-8?B?R1pWNzB3VHQzZVpUd3RTNDlNY0hoc3prNFlqdC9lY01aU1dUVDdrQlMvdFFP?=
 =?utf-8?B?Y1dMWS8rcUVkS2dId1o3eDlxMHFWckVRQUJmbTRZT3YybjdGcU1TR2l3MUU2?=
 =?utf-8?B?ZzVSWDVTcjJNVlkvYlNNZXJrRlg3SloyZzgzY2p6M3I0ZEJRVDFBWTQwK3Fv?=
 =?utf-8?B?cW9XZU9oTzJrelNTWkYwWEhWSTJBV3MwVHlVMEUvVmZoa25wR0ZzWlQzYVFH?=
 =?utf-8?B?Q1IveG02blhRUFZvTUE4QUlXSXpTcG5iTlVwcG1rbTFwQUtXV1czWVZPN1ZQ?=
 =?utf-8?B?MDllalY1RCtYTFZyekM3emJ0L2FDYWtSajNUQnU1OU1yb3lDMVBMSWQ4TkhY?=
 =?utf-8?B?SnlqMDRJZU9TdzIyWW0vc2VOdzErSlNaM01uZlY1NmtCT3c0LzV5ZC9jSklh?=
 =?utf-8?B?Mm10R3JYODBNLzMyVng2MGpGYkZxNUpQc3BrcHk2b1VUS3k0aHdkbDNOZzlK?=
 =?utf-8?B?aUtXV281bkJjQnZlMjVrandBV3pVeVd5aVVyR2I0RE1PVFROZDYwQ3ppQ2hF?=
 =?utf-8?B?Zzl0WSt6dkhrWGpuaFMyK2h4R2JrdFlleGw5R1JNaFdTOWVIc0pQQlJBU21N?=
 =?utf-8?B?NnhnVjdOM0dPZmV3NHA4ZlZIbU9IUzZvQjZReHk0R2dydEFCZW1ITkp3d1d4?=
 =?utf-8?B?ai9qZlZQL3hDdjZrMVE5M0QvS01aT1JwUFE1RzFIbkxmNDJaRHVGMVZEK09z?=
 =?utf-8?B?OXRGQXNjTUN2UnpVYnBhSmkzbFZodmw1aHBMaTRoTzB6d0pyaUpVdGxJcHkz?=
 =?utf-8?B?TWU5T0h5bVRsaVhVMnd2UTdLUExoaWhPeER3OXVHVllzVlhzNkY1WlhnS1J0?=
 =?utf-8?B?RXdpY2VSVkFNSGJVTWMwWGdIV0NOWWdRS2lxU2xnbnJ6V0p1cVdyUWd4czZH?=
 =?utf-8?B?QzhrNGJjOXZpR3BFbHdidHhDYXdzNklTQmw1NTRWODZGbEo5aVV4MGNNWXpB?=
 =?utf-8?B?QWw1M0pGeXF3OHAzVXdZY3RrSzFWaVpNZlVJeWF5U1BWM3N0UHNLZUhkY2cz?=
 =?utf-8?B?bFh4UVNic1V6OVh4OFkwcy9TVEd1d2hzcEJSaDNnU0hoMmZCb1JNRUdVR0dw?=
 =?utf-8?B?d0xHSDUvS0RRRFh3MWNsZlJ0RWhJbEVHN3RRWnhWYlNJQUtibWp1Nk41NnBp?=
 =?utf-8?B?dnZTQkEyZXp2VE43YXRRZ1lFNk1YTWJjcHF6ZytqQ2JQc1BBaVNtb3RzajRj?=
 =?utf-8?B?OUovazRpaDFmQzdoMklkR2l5YVZwYnZNQnBlYUx0RTBuUVpmM0Z0NnVRYi9J?=
 =?utf-8?B?Y3JDOUIvcVVPSk03WE5HbHFwZkpCSFNUZGVQT29pak5Yd3hYRmpGNkl1ZFVk?=
 =?utf-8?B?S0hSU1lCRm0rTWxmbnFsSzFLVUVXMUcxTnVzT0p1SXVpem1yWWJOanRteita?=
 =?utf-8?B?dVU1UnV3L21XYUhnTnB0akFXTzZNWUZDV29zK3FUbTlsWEhGcDhmaE9IZ0Vy?=
 =?utf-8?B?ajlDelVMQmFFUDB3S0dLLzd5SWpsZFlQVHpMbW1PUXJiUUN6SGwrT2NiQ3BX?=
 =?utf-8?B?d0l6b0ZZSmVsWmVramV2UDdXLzZHQ3FEVVJVa3ArbjVKck82ZWIyZTZ3Slhl?=
 =?utf-8?B?S2U3aEhGK1IxOFBIMVc2TkJ5dEkwTnJtUXQ1MVZKZHl1ZlhvbE9HMkh3UndW?=
 =?utf-8?B?WlRSRTB3d2FzRG5RcFBIYzJYcTIzU1NucG0yOHYreUNaUDNNaHNZOXJrbVhr?=
 =?utf-8?B?WmxnTkRGRndKVDFmMlhUOEVOMmVBZUFjZzdYRlJEdXR3OTgwUmVBQkRzT00x?=
 =?utf-8?B?QStUYjZXSGF1ZXVBOUY3OEpBazlrbTBKSkJtd1EwZlVvcEpPZDVOODB5Y2hp?=
 =?utf-8?B?VzQvTTB4RkxhejcrMXNUa3BvT241bEkybGphay9PUzVtNjlzMTZDZkNzWG9M?=
 =?utf-8?Q?cQ/ovQbEkGHDujIg=3D?=
X-Exchange-RoutingPolicyChecked: 
	CqDdwIDOo90hoINTitU8EekfDiKTat7vZqbrWu19DW/IKDGc7lFHrDU/9gQG92ty44OBZWBSMsBmOVOTNaAiPNSi6tPhuaxOuqnNTnCRzmzqGSYXFrZ264s0QsbhlKlxmClpgVWpUNJ5YqrPM/GzsX3Ywvkxefk/Z4VPso/+TqFJWTTyf3mbPcI/yVPSA6UxEGM8UgmZf/eR7cR/o+FyLS7tMGcobFNJGIgSnsj5kaFgp1NA+hD24uVfkoaxjfXQlZoHl/pHQxDGnPc2q8bQD/WVW1nW9aJakCePX1cKBhfjFx/jluPIgkuMag2hEgSFZBgQ9OzCWxmscIJZk67DjA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d765b21-45f3-4e84-0f15-08deb223703f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 01:44:01.1424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1EqvTIpRBQwH2wvFEkfuTJhVmuwgu1sij/cy1b4o1BE2SjvTqFmuQCu15QLiO0yXq5UM0hgTW0xM/v3VdNkgPoFN1/DbUK9tNNP6+wfR2c0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6870
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDAxNCBTYWx0ZWRfX7dxEtzgjy9q1
 TcOGFcGamr2I+aQ0oSzS3i6ZJzHiLfm16+oaegDr9HQaKG+n1c/oDtOTQml4SNR33vOUFP+H6o/
 J55rqPU8whgt02LhFJj17ujxHxVnnTM4oRYoSdGvJpboxoIhFl3Rjy5kiiLniM8oplhy1lUdlFv
 G7ZkQ47fApEe5ZFfTtwQNWknsKkqLMNCLONTX291Vm66LtkR1u5Fj8p/rgIi5ip6ciLueVelvMl
 hPvosOEvYmep7WfzMQPHeJ6oUrZTewvSuVGJUsANTvxzRPzTJPN35x4qqQ4HR8J9QB0bovhdX4b
 Fe1Xt/Pp2nneisnYQc2RBd1q4e8PDsMvhtgFPHWxiI7gqGQBjc7eJiU5fxrw+1CkW2DAukX6iwF
 4dTvH2zRS83MQuquMFMvvoj6Ycijgs0G0HeX2hiaozvsu+9WN0r2QOOtZ9NV61wtzcxf0YeR0d2
 nWfUxwikXgmtCNKbPyA==
X-Proofpoint-GUID: wXaYm48iWNerKt9fNpSBfFz0pClQwPZz
X-Proofpoint-ORIG-GUID: 0csUrOSb2AG7_mRcHWeL2X64q13zS1Sr
X-Authority-Analysis: v=2.4 cv=PN0/P/qC c=1 sm=1 tr=0 ts=6a067a64 cx=c_pps
 a=4d7Nl6fXTlayLABBLko2Iw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=Q4-j1AaZAAAA:8 a=VJYubktbAAAA:8 a=gmDo1nssAAAA:8 a=e1GkridNAAAA:8
 a=t7CeM3EgAAAA:8 a=omOdbC7AAAAA:8 a=pGLkceISAAAA:8 a=6tyNCUPVNq2SkxnI80kA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=OqWDEjY5HwswFcA5adJo:22 a=DmCNEmdWNTAeIjfGWauO:22 a=6ft9yNkZjdd813gQxDxM:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_06,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150014
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64F1F7sJ782576
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2026 01:44:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126994

Hi, Khem

This is a kind remind.=C2=A0 This is the patch rebased on latest master=20
branch,=C2=A0 and sorry this actually should be V3.

but I noticed the old V2 patch is on the master-next:

https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&id=
=3D537241aa1fd027a1ab946955d78b68a56e8896c8

Regards

Changqing

On 5/14/26 11:51, Changqing Li via lists.openembedded.org wrote:
>   * Refresh patch to mute patch-fuzz
> * Remove 0001-makedefs-Account-for-linux-7.x-version.patch
> * This upgrade include the following commit, which make postfix can
>    compile on latest stable ubuntu 26.04, which have Linux 7.x kernel
>
>    Postfix works on Linux 7.x kernels. Frank Scheiner. Files:
>          makedefs, util/sys_defs.h.
>
> Changes:
> https://www.ftp.saix.net/MTA/postfix/official/postfix-3.11.2.HISTORY
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   .../postfix/files/0001-Fix-makedefs.patch     | 25 ++++++++----------=
-
>   ...tconf-to-a-variable-for-cross-compil.patch |  9 +++----
>   ...tive-compiler-to-build-makedefs.test.patch | 17 ++++++-------
>   .../postfix/files/0004-Fix-icu-config.patch   |  9 +++----
>   ...sl-and-lresolv-to-SYSLIBS-by-default.patch | 11 +++-----
>   .../{postfix_3.10.9.bb =3D> postfix_3.11.2.bb}  |  3 +--
>   6 files changed, 29 insertions(+), 45 deletions(-)
>   rename meta-networking/recipes-daemons/postfix/{postfix_3.10.9.bb =3D=
> postfix_3.11.2.bb} (98%)
>
> diff --git a/meta-networking/recipes-daemons/postfix/files/0001-Fix-mak=
edefs.patch b/meta-networking/recipes-daemons/postfix/files/0001-Fix-make=
defs.patch
> index 785fe87452..4e187849dc 100644
> --- a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.p=
atch
> +++ b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.p=
atch
> @@ -1,4 +1,4 @@
> -From e4197bc1f431fd7e555a31e6f7f1e020b4ec8f4c Mon Sep 17 00:00:00 2001
> +From 51e29c0a1d98948118e5135bb817a96811105d39 Mon Sep 17 00:00:00 2001
>   From: Li xin <lixin.fnst@cn.fujitsu.com>
>   Date: Fri, 19 Jun 2015 16:45:54 +0900
>   Subject: [PATCH] Fix makedefs
> @@ -19,10 +19,10 @@ Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
>    1 file changed, 11 insertions(+), 16 deletions(-)
>  =20
>   diff --git a/makedefs b/makedefs
> -index a740e41..28fb128 100644
> +index d5103ce..9713327 100644
>   --- a/makedefs
>   +++ b/makedefs
> -@@ -230,9 +230,6 @@ echo "# pie=3D$pie"
> +@@ -232,9 +232,6 @@ echo "# pie=3D$pie"
>   =20
>    # Defaults for most sane systems
>   =20
> @@ -32,7 +32,7 @@ index a740e41..28fb128 100644
>    ARFL=3Drv
>   =20
>    # Ugly function to make our error message more visible among the
> -@@ -563,12 +560,12 @@ case "$SYSTEM.$RELEASE" in
> +@@ -608,12 +605,12 @@ case "$SYSTEM.$RELEASE" in
>    		case "$CCARGS" in
>    		 *-DNO_DB*) ;;
>    		 *-DHAS_DB*) ;;
> @@ -48,8 +48,8 @@ index a740e41..28fb128 100644
>    		    else
>    			# No, we're not going to try db1 db2 db3 etc.
>    			# On a properly installed system, Postfix builds
> -@@ -577,12 +574,12 @@ case "$SYSTEM.$RELEASE" in
> - 			echo "Install the appropriate db*-devel package first." 1>&2
> +@@ -623,12 +620,12 @@ case "$SYSTEM.$RELEASE" in
> + 			echo "Alternatively, build with CCARGS=3D\"-NO_DB ...\"" 1>&2
>    			exit 1
>    		    fi
>   -		    SYSLIBS=3D"-ldb"
> @@ -63,7 +63,7 @@ index a740e41..28fb128 100644
>    		    do
>    			test -e $lib/lib$name.a -o -e $lib/lib$name.so && {
>    			    SYSLIBS=3D"$SYSLIBS -l$name"
> -@@ -602,7 +599,7 @@ case "$SYSTEM.$RELEASE" in
> +@@ -648,7 +645,7 @@ case "$SYSTEM.$RELEASE" in
>    		       if [ `expr "X$CCARGS" : "X.*-DNO_EPOLL"` -gt 0 ]
>    		       then
>    			   :
> @@ -72,7 +72,7 @@ index a740e41..28fb128 100644
>    		       then
>    			   echo CCARGS=3D"$CCARGS -DNO_EPOLL"
>    		       else
> -@@ -626,8 +623,6 @@ int     main(int argc, char **argv)
> +@@ -672,8 +669,6 @@ int     main(int argc, char **argv)
>    }
>    EOF
>    			   ${CC-gcc} -o makedefs.test makedefs.test.c || exit 1
> @@ -81,7 +81,7 @@ index a740e41..28fb128 100644
>    			   rm -f makedefs.test makedefs.test.[co]
>    		       fi;;
>    		esac
> -@@ -644,12 +639,12 @@ EOF
> +@@ -690,12 +685,12 @@ EOF
>    		case "$CCARGS" in
>    		 *-DNO_DB*) ;;
>    		 *-DHAS_DB*) ;;
> @@ -97,8 +97,8 @@ index a740e41..28fb128 100644
>    		    else
>    			# On a properly installed system, Postfix builds
>    			# by including <db.h> and by linking with -ldb
> -@@ -657,12 +652,12 @@ EOF
> - 			echo "Install the appropriate db*-devel package first." 1>&2
> +@@ -705,12 +700,12 @@ EOF
> + 			echo "See: https://www.postfix.org/NON_BERKELEYDB_README.html#buil=
d-conf" 1>&2
>    			exit 1
>    		    fi
>   -		    SYSLIBS=3D"-ldb"
> @@ -112,6 +112,3 @@ index a740e41..28fb128 100644
>    		    do
>    			test -e $lib/lib$name.a -o -e $lib/lib$name.so && {
>    			    SYSLIBS=3D"$SYSLIBS -l$name"
> ---
> -2.25.1
> -
> diff --git a/meta-networking/recipes-daemons/postfix/files/0002-Change-=
fixed-postconf-to-a-variable-for-cross-compil.patch b/meta-networking/rec=
ipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-c=
ross-compil.patch
> index d46efb95cb..a74c46fa92 100644
> --- a/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-p=
ostconf-to-a-variable-for-cross-compil.patch
> +++ b/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-p=
ostconf-to-a-variable-for-cross-compil.patch
> @@ -1,4 +1,4 @@
> -From 953719878466c55572294f42e85127bda5d34999 Mon Sep 17 00:00:00 2001
> +From ce8deeaac8ca5d7329e1923790a1f35798953799 Mon Sep 17 00:00:00 2001
>   From: Li xin <lixin.fnst@cn.fujitsu.com>
>   Date: Fri, 19 Jun 2015 17:14:58 +0900
>   Subject: [PATCH] Change fixed postconf to a variable for cross-compil=
ing
> @@ -12,10 +12,10 @@ Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
>    2 files changed, 11 insertions(+), 9 deletions(-)
>  =20
>   diff --git a/Makefile.in b/Makefile.in
> -index a37f89f..17cb64b 100644
> +index 8d7501a..d2a85e8 100644
>   --- a/Makefile.in
>   +++ b/Makefile.in
> -@@ -22,7 +22,7 @@ META	=3D meta/main.cf.proto meta/master.cf.proto met=
a/postfix-files \
> +@@ -23,7 +23,7 @@ META	=3D meta/main.cf.proto meta/master.cf.proto met=
a/postfix-files \
>    EXPAND	=3D sed -e "s;\$${LIB_PREFIX};$(LIB_PREFIX);" \
>    	    -e "s;\$${LIB_SUFFIX};$(LIB_SUFFIX);"
>    SHLIB_DIR_OVERRIDE =3D \
> @@ -102,6 +102,3 @@ index 563ee27..00d4651 100644
>        "daemon_directory =3D $daemon_directory" \
>        "data_directory =3D $data_directory" \
>        "command_directory =3D $command_directory" \
> ---
> -2.25.1
> -
> diff --git a/meta-networking/recipes-daemons/postfix/files/0003-makedef=
s-Use-native-compiler-to-build-makedefs.test.patch b/meta-networking/reci=
pes-daemons/postfix/files/0003-makedefs-Use-native-compiler-to-build-make=
defs.test.patch
> index 6f8e3e84da..201b4741de 100644
> --- a/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-n=
ative-compiler-to-build-makedefs.test.patch
> +++ b/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-n=
ative-compiler-to-build-makedefs.test.patch
> @@ -1,4 +1,4 @@
> -From a8ec63a71361ccd3f6d2959c4c87b7824282b291 Mon Sep 17 00:00:00 2001
> +From fc51d9145210350577fdb29a9b0680df779ae347 Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Sat, 26 Aug 2017 10:29:37 -0700
>   Subject: [PATCH] makedefs: Use native compiler to build makedefs.test
> @@ -13,10 +13,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>    1 file changed, 5 insertions(+), 5 deletions(-)
>  =20
>   diff --git a/makedefs b/makedefs
> -index 28fb128..313b401 100644
> +index 9713327..e879832 100644
>   --- a/makedefs
>   +++ b/makedefs
> -@@ -622,7 +622,7 @@ int     main(int argc, char **argv)
> +@@ -668,7 +668,7 @@ int     main(int argc, char **argv)
>        exit(0);
>    }
>    EOF
> @@ -25,7 +25,7 @@ index 28fb128..313b401 100644
>    			   rm -f makedefs.test makedefs.test.[co]
>    		       fi;;
>    		esac
> -@@ -865,7 +865,7 @@ int     main(int argc, char **argv)
> +@@ -914,7 +914,7 @@ int     main(int argc, char **argv)
>        exit(0);
>    }
>    EOF
> @@ -34,7 +34,7 @@ index 28fb128..313b401 100644
>    		   ./makedefs.test 2>/dev/null ||
>    			CCARGS=3D"$CCARGS -DNO_SIGSETJMP"
>    		   rm -f makedefs.test makedefs.test.[co]
> -@@ -903,7 +903,7 @@ int main(int argc, char **argv)
> +@@ -952,7 +952,7 @@ int main(int argc, char **argv)
>    				  &error) !=3D 14);
>    }
>    EOF
> @@ -43,7 +43,7 @@ index 28fb128..313b401 100644
>    			$icu_ldflags >/dev/null 2>&1
>    		    if ./makedefs.test 2>/dev/null ; then
>    			CCARGS=3D"$CCARGS $icu_cppflags"
> -@@ -1024,7 +1024,7 @@ int     main(void)
> +@@ -1088,7 +1088,7 @@ int     main(void)
>        exit(ferror(stdout) ? 1 : 0);
>    }
>    EOF
> @@ -52,7 +52,7 @@ index 28fb128..313b401 100644
>        ./makedefs.test || exit 1
>        rm -f makedefs.test makedefs.test.[co]
>    }
> -@@ -1180,7 +1180,7 @@ int     main(void)
> +@@ -1245,7 +1245,7 @@ int     main(void)
>        exit(ferror(stdout) ? 1 : 0);
>    }
>    EOF
> @@ -61,6 +61,3 @@ index 28fb128..313b401 100644
>    	parm_val=3D`./makedefs.test` || exit 1
>    	rm -f makedefs.test makedefs.test.[co]
>    	eval ${parm_name}=3D\""\$parm_val"\"
> ---
> -2.25.1
> -
> diff --git a/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu=
-config.patch b/meta-networking/recipes-daemons/postfix/files/0004-Fix-ic=
u-config.patch
> index 0660ee098e..daf5c7089e 100644
> --- a/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config=
.patch
> +++ b/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config=
.patch
> @@ -1,4 +1,4 @@
> -From 404150f53bb49af987d7338a808f47fdbd50ba7f Mon Sep 17 00:00:00 2001
> +From b63facf538af99e7c79ebee8d41abd52e7d5ee5e Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Sun, 16 Jan 2022 11:21:54 +0800
>   Subject: [PATCH] Fix icu config
> @@ -18,10 +18,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>    1 file changed, 1 deletion(-)
>  =20
>   diff --git a/makedefs b/makedefs
> -index 313b401..e5db212 100644
> +index e879832..f9c132e 100644
>   --- a/makedefs
>   +++ b/makedefs
> -@@ -906,7 +906,6 @@ EOF
> +@@ -955,7 +955,6 @@ EOF
>    		    ${BUILD_CC-gcc} -o makedefs.test makedefs.test.c $icu_cppflags=
 \
>    			$icu_ldflags >/dev/null 2>&1
>    		    if ./makedefs.test 2>/dev/null ; then
> @@ -29,6 +29,3 @@ index 313b401..e5db212 100644
>    			SYSLIBS=3D"$SYSLIBS $icu_ldflags"
>    		    else
>    			CCARGS=3D"$CCARGS -DNO_EAI"
> ---
> -2.25.1
> -
> diff --git a/meta-networking/recipes-daemons/postfix/files/0005-makedef=
s-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch b/meta-networking/reci=
pes-daemons/postfix/files/0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-b=
y-default.patch
> index 1571aa844d..c2e640d6ff 100644
> --- a/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-l=
nsl-and-lresolv-to-SYSLIBS-by-default.patch
> +++ b/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-l=
nsl-and-lresolv-to-SYSLIBS-by-default.patch
> @@ -1,4 +1,4 @@
> -From 25e7d1a9bc64f39666eb0e2b9b175773615e28d2 Mon Sep 17 00:00:00 2001
> +From fb5b16db0282b5d80edb0ccc6f0f197a7f663610 Mon Sep 17 00:00:00 2001
>   From: Yi Zhao <yi.zhao@windriver.com>
>   Date: Fri, 12 Oct 2018 12:38:02 +0800
>   Subject: [PATCH] makedefs: add -lnsl and -lresolv to SYSLIBS by defau=
lt
> @@ -14,10 +14,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>    1 file changed, 2 insertions(+), 20 deletions(-)
>  =20
>   diff --git a/makedefs b/makedefs
> -index e5db212..b00049b 100644
> +index f9c132e..5ebef5b 100644
>   --- a/makedefs
>   +++ b/makedefs
> -@@ -577,16 +577,7 @@ case "$SYSTEM.$RELEASE" in
> +@@ -623,16 +623,7 @@ case "$SYSTEM.$RELEASE" in
>    		    SYSLIBS=3D"$SYSLIBS -ldb"
>    		    ;;
>    		esac
> @@ -35,7 +35,7 @@ index e5db212..b00049b 100644
>    		# Kernel 2.4 added IPv6
>    		case "$RELEASE" in
>    		2.[0-3].*) CCARGS=3D"$CCARGS -DNO_IPV6";;
> -@@ -655,16 +646,7 @@ EOF
> +@@ -703,16 +694,7 @@ EOF
>    		    SYSLIBS=3D"$SYSLIBS -ldb"
>    		    ;;
>    		esac
> @@ -53,6 +53,3 @@ index e5db212..b00049b 100644
>    		SYSLIBS=3D"$SYSLIBS -ldl"
>    		: ${SHLIB_SUFFIX=3D.so}
>    		: ${SHLIB_CFLAGS=3D-fPIC}
> ---
> -2.25.1
> -
> diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.10.9.bb =
b/meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb
> similarity index 98%
> rename from meta-networking/recipes-daemons/postfix/postfix_3.10.9.bb
> rename to meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb
> index 633e4a7a0d..894e58261b 100644
> --- a/meta-networking/recipes-daemons/postfix/postfix_3.10.9.bb
> +++ b/meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb
> @@ -26,11 +26,10 @@ SRC_URI =3D "http://ftp.porcupine.org/mirrors/postf=
ix-release/official/postfix-${P
>              file://0003-makedefs-Use-native-compiler-to-build-makedefs=
.test.patch \
>              file://0004-Fix-icu-config.patch \
>              file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-de=
fault.patch \
> -           file://0001-makedefs-Account-for-linux-7.x-version.patch \
>              file://0001-Fix-build-with-musl.patch \
>              "
>  =20
> -SRC_URI[sha256sum] =3D "d4b4daab0af2e0c16c0d2d5ac3c7680d5ebd2001ea054f=
7f2a601c759801bc13"
> +SRC_URI[sha256sum] =3D "daed65b08c9288cdb386a914f3e52cdddd44935407b5ce=
5aee8bcc3aa4207778"
>  =20
>   UPSTREAM_CHECK_URI =3D "https://www.postfix.org/announcements.html"
>   UPSTREAM_CHECK_REGEX =3D "postfix-(?P<pver>\d+(\.\d+)+)"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126984): https://lists.openembedded.org/g/openembed=
ded-devel/message/126984
> Mute This Topic: https://lists.openembedded.org/mt/119308741/3616873
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[changqing.li@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

