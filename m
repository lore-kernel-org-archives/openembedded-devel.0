Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26AD5D6409C
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 09:15:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10744.1765962920280526320
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Dec 2025 01:15:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hQ9HySML;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4446ee20f5=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH1npYc763267
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 01:15:19 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=1mF5b29cvHX99cKzCucAH8T+Pcbo2qadfgf6M+2to4I=; b=hQ9HySMLhM4r
	iySeeh/uB8z8JkIDwqP+R5FbVENRLVRrqpSsxqeM2AEA3a6rzRRdnzWiZ9xLQ9CE
	7WA4oT8geDpU2hy+8Jejnn9khu5JJNcWsJBV2nJp9ZSVHbbHK7xjpQqEiGPyNnOK
	O+GtLEaQPmPo8HWLnZnAfsIyK5ScexxtzSW3Y5sGAUm4awd74x4fd9SkMypuBbIK
	fc77oMiftaZFesRCJXKzidTDZEkTs7/NzJmUH0v9JM3/eqvMOa3D5sndYVuseTH8
	C+8BjBbpDqw9hnSljmv2Cs5iyn4Lx9GwHccMAu5w3fXrS2C/SEj564FReQ3X51ZR
	jr/unsKbtA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010009.outbound.protection.outlook.com [52.101.201.9])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k6j0bhf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 01:15:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aIwoNlZ6Gi0wxCTevhAlqFgFUGZeSWOaWcpiTbbAPIVo3HNkifU1+QN4BuQVhhpEZ77uMa9kpmUMq9YpTpTQusDnRp4suh+7ck55dG095KrFxSJ2sok+VYAuQNOcMS5QW7SmpvUhigWYQIM7mBx8vxr88hn3ARiUhVpib89xNpZIgvjTJzsC4ygIkKelm+ENRibNrQIG5aw0AUR5WMnHgwXUbmg2qdiDK05plEOqaBFo/PuCmwA7OWrPE05U2FhfjBF3y2J6pRY1cZabKa5IctdtkZ9pqgqoS1HGvj9Vxddh5Doz2nv7o89t764RqloBV3oDE0p6Z72t8DS0OH6b0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1mF5b29cvHX99cKzCucAH8T+Pcbo2qadfgf6M+2to4I=;
 b=lwhPHhN/oo+DuqhBAZnKYV2886buQ8j5GqnaRbIKywriiwUliq/gy88xYS4Jycp+LhGO4PIUgPImSOBHw3ZEXDRQxMoaken6E+N6IVi+NYFMZlG6UsyO0Bv4xE/mZ/9+o7NBcBMeGwKw6sPpIyK+cnZD/FjRFOQoBGZfBGzJ9ww34IHzhu3kkIGUprShE7M6Km08OnsxFGWXzeB6emzsx9xgqWWnM7YP0VsE3/XpBmREoCqz4RPmu66YaCaT9/MckYvzhmQERQUnJkikWSaZmyTOXzjC5EoXHpl8Z4IbSECP3/72he9YltHCo5iTSd6XCBhVuWE6sF2zS/oQUoSAKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by IA1PR11MB8787.namprd11.prod.outlook.com (2603:10b6:208:598::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 09:15:17 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%3]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 09:15:16 +0000
Message-ID: <698ee584-671d-4d3a-923f-bf26e85cba7f@windriver.com>
Date: Wed, 17 Dec 2025 17:13:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][krikstone][PATCH] python3-django: fix
 CVE-2025-64459
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        openembedded-devel@lists.openembedded.org
References: <20251217064521.288044-1-haixiao.yan.cn@windriver.com>
 <25185c66-9452-428b-9b33-97f7270d1cde@gmail.com>
Content-Language: en-US
From: Haixiao Yan <haixiao.yan.cn@windriver.com>
In-Reply-To: <25185c66-9452-428b-9b33-97f7270d1cde@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0073.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::18) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|IA1PR11MB8787:EE_
X-MS-Office365-Filtering-Correlation-Id: d0eba014-c171-4a7c-a770-08de3d4ccb00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QXJ6TEM1RWpBanh0MUpMdVRFakdMVk4vN1licDlLWkNIUmhYUkxnc2RKTDFP?=
 =?utf-8?B?Q3pRemtING02Mzhob1pnRWc2dmdMTndieVBuZWcvcUh5L25zNDlRc3cyL3Zz?=
 =?utf-8?B?ZkNpdC91RDJvQzd4c3o2VlI1bXBRRTF0NDErL1FuQW1wRjdzMitTekxmQnA4?=
 =?utf-8?B?cXdYdTlDNHRKOCtaTmo5MXFIcTg1WUFOR2czbVpzT1RXd0VTVTI4M2VoMUNK?=
 =?utf-8?B?TnFzQVVyVFhjRmN4KzdFN2xwS0dVS1l2aXFWVkwrR0Iya05na1ZLZG05dlV5?=
 =?utf-8?B?Z1hIbmNGUUZRYkN3OTQxSU52cG1tbmNRWk1CRzBYakxuMC9qMXdkV0ZqbXc3?=
 =?utf-8?B?UlVaWTl0ZENHcmplY2dzTmpwUlpUSW5XVUt6S2NINTVRRHdCVmJqY1ZSWWpH?=
 =?utf-8?B?N01PaVVKbCszWml1bUk4c254aGpXdzllaGYremh2ZGF4K3plSDhuVVltOUZ0?=
 =?utf-8?B?OVlIWTBjWEcxcDRZWHZiRE5qK3RTQkNqME8zcW9DRFFjSWhnNEdkY1c2Ni9i?=
 =?utf-8?B?MHBlKzJGaEpjZGpBVjd0R0ltcitiUk1JZXRlYlRuR2lSUms3SE14K1ZtQzls?=
 =?utf-8?B?VGNBWENERFpsTWNIT0tOUDRBZ1ArN0V0SXpyWSs1N2NDMDMrRFJDZDQyZmI4?=
 =?utf-8?B?aXlyUkt6Zzd4WDZ4UHVBdXkwVWJXd0JtbEZsSGdGRVhaRWlQL2F3Mk9vcVhY?=
 =?utf-8?B?NDhoL2tHeENaSCtjcEx3ZmpMR2JmcUhCMmpjUEtaUmlhNnFwc1RmdkFXVFdU?=
 =?utf-8?B?VHlaYkNHUUd4WTdLS1BVMzk0ZnJxUU5CSHduZmpycUJBMldWaTlhVkhMSjhq?=
 =?utf-8?B?Nzd5T2xPRGx4ekg3dDEwRWtWa2NIcjRXOUZHYk5aTHBadGpiSFEvcVc2R0Fn?=
 =?utf-8?B?NXpGSUJTNWo1VUU2RklHTmlaVXRHaTRweWhpbWwwaGltcmpPOFlkdlFaM3dx?=
 =?utf-8?B?NzhEaGFIWElMYi8vMG03NHo5VDhnc2tNRjNTdkFmS0ExekhuaDJ2VUM5MC9o?=
 =?utf-8?B?bUM3TmtoLy9BVXdqMUt6MlFQUTVjMm1qQVI5blpoTDQrNHVCalQxQzRvQytm?=
 =?utf-8?B?T2RqeXVVdTZ0SXNUTnc5ZERIekxXZ0Q4U2owOWJ1dnVCVldvMmxPTTZqU3lh?=
 =?utf-8?B?a3U2bGZPTno0QWlZQURLRWNsb0VVNytGcXAxVGs3TmI1d3lSQnJtaGErb3Rv?=
 =?utf-8?B?WFhFQ0lLaXhLa3NSakQ5UGNFd1F0RkhTVXFRNVVNMkkvVXZWVHNkZW05TlYw?=
 =?utf-8?B?cHV4OWp3VnRRTldXQlJOeDYralpzZzBTZUtkU3pXVmNUWEcwcmJkOWIrMU4w?=
 =?utf-8?B?RVg0ajhuVWZoSkduT2VHQ3FpUUM2anlHK1AxZ2lHVmhjQ2FOSlJ3eTgyUitl?=
 =?utf-8?B?N3krTHF0cTVqZG40NkRRY29YdHZtVnlnMGV0c1NZazJSbGR0QVJoRHQxQ3RB?=
 =?utf-8?B?Tnp0WFFNYllZQWFZVDk4Rjhic0Rac3VkSzB0bDAraWlUMHJyR29wV1NpNldW?=
 =?utf-8?B?dFN0M1BHV3FTNVhHZUpjUUl2eUhqNXJYMitEYlVPUFpqaUFQSmpnblJTN0VO?=
 =?utf-8?B?VlhzaFhPRVZMeVBha2xZWS9xakR0TEFxZGVEMzFzR0VtZW5zaVJtK1Q4S1VI?=
 =?utf-8?B?ZS9iei9MU1RROE9Ea2FvTUJkeHRQWHRZS3NkSEdKV2I0b3ppS01hUlZCbUd0?=
 =?utf-8?B?LzJPdkI2aGVCNlRrYjNYSXFQR0djMmZUdHd4OCt5c1VXSVlTSXpLNXZLWEhj?=
 =?utf-8?B?QjdMa1lNbzIvM2VFME5CYWMzYXAvSExjeGYxTk9BYms1eTkvR25jVzVYdlpH?=
 =?utf-8?B?d2F1VUhRajlCQU9PYWI4K29HSk1na0RORlBPNnNCZjVIS1U1RnFKT0k3bHdo?=
 =?utf-8?B?T2dCTEVXK1JuZERSbGV1eml1cVlzTXQrcTJpWWk3dlZLblgydGRyOUpGUVhP?=
 =?utf-8?Q?p3JIf6KyAyXzwGe1qmZL4kkESfQ0QUIj?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MTJBNW4xZ3RzYVUyWERIN1hwTlBRR0lTQ2lHOXArZUt5WGlHcXJjZ0w2eDMw?=
 =?utf-8?B?WU83VzRiWGZLa2haQmY3cUkwaWJrWTByR0xWRXJpandjZi9JUUJKR2dkOUNV?=
 =?utf-8?B?WmxjdnRLWGVDSUdla292R292NlZacEdxTXFSd2JTK2R2QXJsRVl2QXVkLzZC?=
 =?utf-8?B?L3FTTzdTT3NrZ3dod3RHVVQ1SlpEdHFzMmVwN0xCMThuSWs1UFVKVG9WWkds?=
 =?utf-8?B?T2VkK0tpQlhFUUtiT1FYNFJCOGZnLzB2OEs3eFNlUWQ1UVA5V1ZrTGxKT1B4?=
 =?utf-8?B?eHZMZFFKc3lqbG5TQnNnbCtkTFloSUZteHNjaVptVVJNTGtiZzVIOGVlSENJ?=
 =?utf-8?B?VUxaNHB5clFQQ2ZzbHRic3phUys1WmxsWmhwL3hNT2NHOXcyY2lnWkcxM0kw?=
 =?utf-8?B?SlRKRmdnMFFrSTJnN2UxYkVxbEQ5ZUUvVUdvSm1sa0xtNllRLzc1Q2Y2VklB?=
 =?utf-8?B?VlJRTlVlbTNVT3RMWUVGaEZuQ2RwT2tnLzMwYUJZZzhHL0JST3pJZzJKcCtM?=
 =?utf-8?B?WmdXMnQxNVQraTFUak0yaExvTmNpRDc0NzQ4YTd5WHIzWWF6SFczaExIZlox?=
 =?utf-8?B?dkJRaWhPRUVQTTNEQlRTVWRDZ21WTHYvMkswcmtHRHR0Ukd6cnNqSW5KY3c0?=
 =?utf-8?B?Wk9GTjRNSVR0cmFwSkFBT2dxWXpJbnNhNmRhR2N4d0JxL0s1NDdobHZpZjNj?=
 =?utf-8?B?bDRRdzdXU3c5UG9rQmVseWNPTnlWQ0dkVGhjQ2Mzdnl5OFAzK3NJRG12MFN6?=
 =?utf-8?B?cVVES09kOHFwVHprTHJIM3pOYWlUVlVDdnFERDZNZ3p3ajl1ZHVBYkx2dDV1?=
 =?utf-8?B?a0ZwUGJBTjF0K3JoWE0zOE93VlIzVXl6NjVNbE50elIybmJCN0hlL3o4dzZm?=
 =?utf-8?B?dGhBdlcvYkVuT2ZoVEt0ZUVZTnc5Z0dHMnE5WHBUUklwNDF6Z1pha3lUWmtV?=
 =?utf-8?B?dlF6eG9HTzg5Zk9GM29mRmJMYjlWeVBtZ25jSmhpRENyVi9JbzAyTmYvblJW?=
 =?utf-8?B?TndTQy9Iay9XcTBhbzFHUGxlUmlWMnQ4c3BSV1p0N2dTVDNZZU1PdTZtKzJs?=
 =?utf-8?B?VTNTSSttYjI0aTFvL1c3a2xpb2IwbXA2WnJGcy92VUR0bGNVb3RjckhIZFZa?=
 =?utf-8?B?d2plZWVJeHVPN3EyNFdFVWZWdXdLRzUzMXVldnUxbkhSbFp4ZXVLSnFTTkkw?=
 =?utf-8?B?VlpFeFlnemNZeGxrenlYVzhjTkczbzVmMGpyb3o1RzZZSm4yaFZQSHJUZ3Zv?=
 =?utf-8?B?NUd5YktUUy81Nmt0OXQyTll1RXNGOC9SVTEyK3c3TnZXN3JjUmhiYXhLOFYx?=
 =?utf-8?B?anV3SCswWHVYVWVyMGZDUTB5Q1FpRGdYSUZaUEJFMkRyZW5rWG52WnROK1JB?=
 =?utf-8?B?OGtCUUI0OTRMVmprMGNBalJoV25FZXhoQ0JoTGNHM2swemUwb2Fya2VXcDU3?=
 =?utf-8?B?ckZWbmt4VjZ1Q0g0TFZuOW9zb1EwTUtuYkpWRFE4WFF2dTVaLzFVdkkrc3dO?=
 =?utf-8?B?ZVd1ckpUV0M0QW5LQWllZWtCYlE3UWpybFJyWU05SVJoL1JXYS9KSGx6dk80?=
 =?utf-8?B?YTBuRmZYci9LUmpteml2VVZRdk5HMVpQMGE4MFdFOWVOYlhHUkdWYjZnVXE2?=
 =?utf-8?B?aFR5N3dJT3pPMURZZDcyYUdnVUxMKzQ3Q3dPUjFGM3lmKzc1Vk9aRFVKZ1RK?=
 =?utf-8?B?K2d0aHUzWWhrYWx3RVl5dzMxYnFjakhnWnVxT3hBTXozazh1cTM2dzdVVlhX?=
 =?utf-8?B?c29nMTFTRmxaNVlVQmc0N2hiUXU5Qll2VnJaZnhRVGhUQVgxU1gyeVlhWXhj?=
 =?utf-8?B?TkxiMzVtVXFqanJ6UE9FWm8vRFA5M3BCYjdrdkdwa2ZyZzYzRks0WXVvMXk4?=
 =?utf-8?B?TEJCMmhWTmJiQlVBcUxmM00xbEhtVzRyOUNEcGNtcGxHeER3U3Jyc3VWS3FY?=
 =?utf-8?B?TjBaTFdLQVNhYmUwTkd1UTI3bzJ2OEJTWGJUbm1BbjJleDRZUHNWMWI3NWVl?=
 =?utf-8?B?TTg1YXJQeXdpMThMdk9rQklhRG5DRmppYmlMUFZZazdFMHRueWI0MnNHY1dR?=
 =?utf-8?B?UGF3VDJiY1FpL2V4U0twSXdaQ3U4WS9td3hqNVFiMnZOeWtVdFhzREpqTXVY?=
 =?utf-8?B?UlFZODlROHJYM0dqWFZYSEdKOUxQbXh6L3haanVFOXJseXJMZ3poNkRsZVhq?=
 =?utf-8?B?SEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0eba014-c171-4a7c-a770-08de3d4ccb00
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 09:15:16.8328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jb1hWrd44QEjkxNvLGpsBnYwfcVuN2P7jw6a1KWPn/z2bVqLT9eqbY77jQaDUwf7cRwBlWh9A7lqc+4erd7m6svR2gEvmEkbhm0ogN/45Fo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8787
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=ErvfbCcA c=1 sm=1 tr=0 ts=694274a7 cx=c_pps
 a=AhJDvPO6yzy99x9PXTlr3w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=xf3ZNgGT-zGfC4NYLRUA:9
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: 1YbqQGfIKGDdWicCgw-99HdMB5re8QtS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3MiBTYWx0ZWRfX4y6b5J35BprF
 hI+njyJnNM6N3GwE6KWcUA7dNt2nhmMFRqZ/VciqEHSpAajtT7367ahCMoQREWfgBmEq1qjEXiG
 +YsGnNSOaZlViEZ16H0rClXBrvl2yWwRqL/kga7RS0X5hjTYQue9B1nsi+VXYSWJeBe8Z3FLGus
 +5tc6u/1OsVA5Eg2Ugi1GT1XGy/BMiPuqoZhUSWBps6lKvZPMmtXtce6G+rmb0drTCmdcNNxZSY
 YUnlPv6hF0in5QUJj5B7ZnEk4TutNZ2Ak7AwaP2jHdPBQmh5W0RNYx3V7L5BmUDKMXxBAX1MgVt
 xmogo4OPVQanj15TiLYLR7+jDis04c+zWnqdvIawAjQv/q1PyW2Mr9zPCN+eW7yZp3XlVRbFhRe
 AOcJcZljtC1YCfQ4TjgEVPOPxKQw9Q==
X-Proofpoint-ORIG-GUID: bgaCT8KyDkS7jOpNz5yRXHJUNY-8wN9l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170072
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 09:15:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122722


On 2025/12/17 16:31, Gyorgy Sarvari wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On 12/17/25 07:45, Yan, Haixiao (CN) via lists.openembedded.org wrote:
>> +---
>> + django/db/models/query_utils.py | 11 ++++++++++-
>> + tests/queries/test_q.py         |  6 ++++++
>> + 2 files changed, 16 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/django/db/models/query_utils.py b/django/db/models/query_utils.py
>> +index f6bc0bd030de..e612ee8b1a44 100644
>> +--- a/django/db/models/query_utils.py
>> ++++ b/django/db/models/query_utils.py
>> +@@ -52,11 +52,20 @@ class Q(tree.Node):
>> +     # Connection types
>> +     AND = 'AND'
>> +     OR = 'OR'
>> ++    XOR = 'XOR'
>> +     default = AND
>> +     conditional = True
>> ++    connectors = (None, AND, OR, XOR)
> Thank you for this. I think it needs a bit of modification:
> xor support was added in 4.1, so I believe it would be appropriate to
> adapt the patch by omitting this operator from this version of the
> recipe. What do you think?
>
I will remove XOR and sent the v2.

Thanks,

Haixiao


