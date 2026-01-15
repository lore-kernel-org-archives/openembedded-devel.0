Return-Path: <Liyin.Zhang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9321CD3CCB2
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 06:01:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29693.1768456860551758588
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 22:01:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=U4BsUWjF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=54758dffb4=liyin.zhang.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F5P1AI057648
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 22:01:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=gzPEWR/fGQk3mZEsZJMCOKHUgpFhdCeSZeicFUgstdg=; b=U4BsUWjFrWgX
	krBW/bozwLRtLRzDWvr56RP7unntgUjpb9PHA298UXHc1OKUtuvIH3t/bBMKfmlv
	szGxGb0EZ9vRNzIdsW6mzH8U4pFdFT23vEaoDQtHuuYYWX/gUZ2VdA020v/cFsRn
	qk1TBvz6jkKcKqu5Bz11wcftmClMLSc0wfrBuapHkWMP/LDjOhVtwYzt7O9Bd3QV
	CccDKQ/1OilYOCNHX6WCe6d5Inh/QVEmjfBf1jjBL71Pxj4+XcU9RIHOEbLFNYgd
	9Q7Ye8Fd0sgfx7c+m+0KZZpPuJl7JSjeUB7axOLEhFeRNjsAApkhdvBxTN7SAqyI
	5FtiECzi3Q==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011044.outbound.protection.outlook.com [40.93.194.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkjx0wc6k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 22:00:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sRe9OOsfWRs1i3eCbJBVJhYmAwr1tAVOFcW4H4G02Zkx8Cmde2YqN8IPhIrzhcE1jbQXAE2n9X6v5d1sJeSSb1frOBqgt62FXcCuY9LE/Scjp2bshGl3B7umV5uqLKAIyfV6CO2ml8ucS5aoZyefRfdKRZqmI97yBIF1WGZgZ2fuPbU+pzW9B7sj/+akl4u47W4WgYkKlHg5PoNdJWDf22+uyJ2/REfQjDYKgM7NRb+jW3aCb62p4lF48gLagDV7QEtR2txzbf1L2oh7PmnulgoimXEb/RNng5yXO6zWUZvDL4fIKQh0Qd7snlAP5SQHr1FU3DnsBdCa84pSGnlOSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzPEWR/fGQk3mZEsZJMCOKHUgpFhdCeSZeicFUgstdg=;
 b=je9TCMw7rpNovq5mtOn+7xPh49lLWFCwwZAcdG4JqmYaGgo5sqqP3XJ1xzjM/FDuPmNjkgE8v+nu/1YXvAtInLyUiTsJmelzS8Jc3HKyBh0WN3XoyPz8Ctn/QKFmIjriAVtKDbdJfftQttfluFfQv42+YKy3sizVwi1W0/tzFU7geojBBfhJ3kHXDQgi3qtFvX9sh6vnyLovBkYtgdn13YmKVl+umOycwVSB3cxpU32neNcb9m+ssvaLiuxt/2WlaF21wYX1aMadKRkHolnD1mybRBIazyph7iKINIEzJhEC5TZfQ1YOhUmlo5nwFpVyzJKcQh7+5AHoKji0Kinl4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by BN9PR11MB5274.namprd11.prod.outlook.com (2603:10b6:408:133::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 06:00:57 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 06:00:57 +0000
Message-ID: <a56cfecb-0374-454c-90ee-7aa56a2b9cc6@windriver.com>
Date: Thu, 15 Jan 2026 14:00:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-networking][scarthgap][PATCH 1/2] tcpreplay: fix
 CVE-2025-51006
To: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20250925091953.3935644-1-archana.polampalli@windriver.com>
Content-Language: en-US
From: "Zhang, Liyin (CN)" <liyin.zhang.cn@windriver.com>
In-Reply-To: <20250925091953.3935644-1-archana.polampalli@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TY1PR01CA0193.jpnprd01.prod.outlook.com (2603:1096:403::23)
 To CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|BN9PR11MB5274:EE_
X-MS-Office365-Filtering-Correlation-Id: 4217c8a4-3c08-450f-c3e9-08de53fb7331
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|4022899009|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dk92bUtpN0wwc2I4OEdWbGtCOVc0NGNyNXNvbTV0Z29KT1NxQmFzSFB6ZjF5?=
 =?utf-8?B?KzdtNjZVdk9sZGhtUklDbXY2cTJKc3RBL0kvTGtwcGFIV1E5VkhTUTRYaFQ3?=
 =?utf-8?B?TkUyM3o5bUIxWjhtYkFlK0paUWs5LzJzMEhzbzY2VWhBU2Y2ODhGV1pweUJP?=
 =?utf-8?B?VzhxTzMxVjlXU1FnZXU2cVhpVlBpREpCY012ZEpjYlRheXlOc002STVxYTBV?=
 =?utf-8?B?TFo3anVwVU9Tc3hBdllSUlBYTzEyeFF3T0taWlU2eHJZQ0Q5S3VTYy84NWdX?=
 =?utf-8?B?RmRFR0g2OFJablhtc1dBK0JtcEdVaUtMQlZuYUVRZ0ZPZWZEcGlCVUJDbVBH?=
 =?utf-8?B?UDFMMm1EV2N3TTdyb3lxMWtvakx1L1pFMlNWVEJmZzg0aEw2L3lVR2ZEYVFy?=
 =?utf-8?B?NTEzb09vSWU2cnkwQkxJMzZSc1VnZEJUOWhKT3ZnQ1gycDZPNmhZUTNzNTRE?=
 =?utf-8?B?Qzg5cndBVGpJZUxCblEyVTZGWmREU1AyYTdia0NZVWhmSVFjTkhKRGdLUG5F?=
 =?utf-8?B?d2ZWUmpkejdvLzhtT2dGUHNOKzlBSlRXODJBSjVvaER5NU0wN1o2UlBrdXJK?=
 =?utf-8?B?MDZraVBETjltNG9qemVpWjFPZlprMnI5cUFtTk1hODZiK0x3N1hEY3hnY2NO?=
 =?utf-8?B?NWk4TFpzRzN4UzF1SlJmWGw2bDBVbDFVdGRHanRHZDFWRkhWVElnN3ZzQ3Ru?=
 =?utf-8?B?dlJFaFhxaXZEdXhXV0U1SmtCSFNHSkt4NFVDTHJGcER0N3BxM3Bjbmp2NFQ2?=
 =?utf-8?B?VElYOU1VNE9QK1BKN2VIamhkcW85b0luTTlQd09HbmQvWEFTVEZDY0JNZk1k?=
 =?utf-8?B?dnk5VXVJaWF4SWlkVzVtczVoaW81djR1M28wZTRuYVhHSHdQZjI0U2FQYlY4?=
 =?utf-8?B?ZGdPTW91bUlEOWRsOEVYTEZWZ3hsUkQ0Qm5tM2YwSVUvVkZLUW56cmEwc0Rk?=
 =?utf-8?B?R0N5ajdkcVBKd2tLRVYwTVBKbVUyTjZIUUV0YkdTajhubTV4TEpvcFJPR0xG?=
 =?utf-8?B?QlZ6cG80dmo1R29FQU9hTUpVTEJQVFU2Um5oNkJvMXN5SG05UVh2azBrTTcv?=
 =?utf-8?B?Vms4WWoybzVsRHQ2clFDMS9MSmtWWG4rNDhUY3A4dXF5bXFoWmdPQUVvbnlh?=
 =?utf-8?B?NURKUVBDVXlFWVR6Vmc2WVBycXZUU3c5aWRjaVVXWFIraUVZR09aRStFZHVW?=
 =?utf-8?B?dG9JdGVZbnh2TjNiQ2Z5aFY0UUNxeWVoSWI0ZTJzL1VLR3BERXZ4eEJwZC9j?=
 =?utf-8?B?REZDNE1lTTRMSDF1TmZRRDRWdkRKL0wya0RRVkQ2V1N4RXpIY3NLZk92bzMv?=
 =?utf-8?B?QmJ0bnN3YUcxYXl3M1ptNVhkdDBNSXVBNDVaUlZ1QTcydHlESEtVMjJTQklm?=
 =?utf-8?B?YXF6MEVSdi9UaUtidytrRGZkQTBzQ3A1ZGRmcHpBWTQ1azhsSlNIYXNOOVc0?=
 =?utf-8?B?M3NtWFNnSitueC9tcEtuTC9RR3BhQ3YwZSsyeGVaVUVTS3NrckQ2NXBNYURz?=
 =?utf-8?B?K1pmVEovVXY1UVVmYWpISXN2bnJEOVB4YmI1ZTh2dVZEUkpuVnR6Mmd2TENz?=
 =?utf-8?B?UkJXeFpyQm0wdk5CdFh6RkZYd2ZrRGlwd09zOGZuOEZ4cHJFVVRNdy9haXlN?=
 =?utf-8?B?UFppQ3pQTFFYVkdiU2crZGVCWHAzd2FaYnRvbTJBL2hrMDFNTWFyLzdoTFV4?=
 =?utf-8?B?Vk5OQkcwQ2paQ0VhSEpuaTZ6R3VOUlROMXpGbThwRzZzNG9hYjVoQnRXaEFL?=
 =?utf-8?B?b2Rvc3RQMWJjdjNHS2VXaklhTlh5dmdHNE1tR01BdGVuZ1VJczBjWWpYNFNE?=
 =?utf-8?B?M0ZHWGc4V29IbGFwMUdtazk1QzRVbEpjMU5IZEh1a0MvVW1hUkg5M2hsZllU?=
 =?utf-8?B?OW93c3pneUlyZU9YUkpwYjFOZnZHUUFLMTJ2K1JOa050TENKc2MwY0o0V1RT?=
 =?utf-8?B?eDBMNzJjOWdRUmVueThrNHYzTjBDVjN4NnlBY2NsZnFjeGQxWVNWUVlUeENn?=
 =?utf-8?B?d1VpaEkrcHRUK1FnYk5sc0ViVWhDdkkrZ2d3UGkrVk1xQWV4V2pCSjZuZjV6?=
 =?utf-8?B?Y0NvZ2ZpcUMxSHdkaTRlRlBmN2xFb1JONUNLTjVIUk9SVm5YaDZWVWNnVXV4?=
 =?utf-8?Q?p8mybmgLiyh1JK5FvPrxQYa7w?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR11MB8430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WGtBOUJKUGRSNk1KL3dCaUtqa0VxbndpNW0wQitnZTlNUFlEYVAyUjNvbldQ?=
 =?utf-8?B?VENNei9ZQjV1N0hEZlZuSS9oT0t3dW9YcXFnNWwwNEFqRlErcWZLYTFkK0Z2?=
 =?utf-8?B?SFFzeTRUdW8vS3Y3L1MraUNiRDJTTWxBTlU5eEZPQnhFajE0dGVlZUc1T0Vl?=
 =?utf-8?B?a09PRGRvNkIwTmFhcytsc1ErVnR4MDlzNEQrRm1veUkxSHFISmg2TkI3amVi?=
 =?utf-8?B?WWhVN1hQQWwyeEhXSTZvSnBvcCtFYmdBeUdWbVErczV0Zlo3V1hBSElid2I2?=
 =?utf-8?B?ZGM1UE5sRE43Z1VzV0NyRXRVdXVkRW40SzZLeEZveENjV2VINXpVQ2pmNFo5?=
 =?utf-8?B?azlCR0xVQ0dZQUdrQTBPUWRZaHV2TUtNRUJNbW9kVHVyVklGRzNQUVIxL1Ez?=
 =?utf-8?B?VFRGL2dmNnJXUEFFWHZEL1VKMWJvV3EzUnpwRmZyemtRYlhoYmxsZmlOeTFW?=
 =?utf-8?B?dlhEaEdJNVh5MWhBY3hjODQzVHA4K2NYNmRQR1Fhd2t1YzVZN3VvT0dyV3lO?=
 =?utf-8?B?cEhabzRYaG5nTXE4YUxiR3Y2dzk1d1djSEFraGpKT3VyL01JcU1MMStKWUZj?=
 =?utf-8?B?V0pJZVdyTUdnOWRPc2x5dDdmOFBrLzYvdlgva3ZiYlVhSGlpMUk1cWQyVHpW?=
 =?utf-8?B?c0xuV1MzakpzU1ZsVmw0Skt0NnduZDNremp1ZCt6bHB4bGlmNFdGLy9aK3A1?=
 =?utf-8?B?bWp6b3ZRRGs5aUhpT1hnVXZGeTFhMEo3R2V5SWRHeGJmWVZ3Tyt4L3lVVWZF?=
 =?utf-8?B?dlUzVm5zRktkQ3ZpWllOcmk3WW93Y3dKeFlWTmR1azJ2TzdPNHFzY3E0WDJE?=
 =?utf-8?B?MlNzT0VDaVBvR010ZERBeEJYZHgzZlRXVTI3RU53WTl2RXJKem5KcHhpRWhP?=
 =?utf-8?B?RUkyNUF5RU1LcnM2bzkzQkRXL0lPMVBBZEdHV2FralRPdGI0dEVVWjhzeGJH?=
 =?utf-8?B?bDRSOGlpYkNHYnk4TGxtVjI0ZDZwYXI4TlBZcUw4ZlJLc3V1d3dKWUVsNUtK?=
 =?utf-8?B?N3dXZklIaDdMbUpXKzJnRGhTWmV1UGFtQ0UyWHJ1RW9UaWlJYlJQTVp4dUd2?=
 =?utf-8?B?WHhoL2U0NExyQzRBY3pab2RVdnJDbVRwdVg5RDMxZG1EeUVQRHkzNXZqLzVY?=
 =?utf-8?B?TUFQSWpBSVhjK2tsUzVrSm8wNVl0VmhiWnVTT0ZiSVNRdTY5blk0Y3F3RDJw?=
 =?utf-8?B?OUxhcUJYS2w3NWZRdkxVSit0TUVmc0tlTnJSVk9MNzlXVlB0NkVRUG9pSmhB?=
 =?utf-8?B?aDV3RXBIOFpabWVkaDNOM2dielNDOS9abmUzRTJyYnRIZUJpVkwrWU1UY0VB?=
 =?utf-8?B?Mmp1SjhNaktxMXYwdlpnUXB5K0ErZXdkU2xJK2VmTWRIRzl3alJtc1NGMEJx?=
 =?utf-8?B?ZHhQVXpDb0pmK1hCTVpWUnRNRlZaeENvRXpWOUFUbkNGSmd3R2NCZ1JQM0o3?=
 =?utf-8?B?UUtCWEFjNEhHWFc2dXMzTlJEQ3ZTV2lQTnpQU3plcG0ySEdweE9QQ0ZDL0ZH?=
 =?utf-8?B?OEM1T3o5QXZaNGdKaHhBNC81KzdoeGdNVHE4UTNKL05HSC9XaGpFa3BqZ2Yz?=
 =?utf-8?B?eHcxMDRJZER2ZGtzemFlZlNwQ1AyNUNEbzcvK0FPMS9IMTNoYXY2dDQ1dDZY?=
 =?utf-8?B?bFNBY21GY0JUdDQxeFRZdy9KanluTDZzYXNVQW5RbEVqR1dLWldXU1J0WkVX?=
 =?utf-8?B?VFBSODFVZ053UGsvZHlRUEpCTUFuSEp5MVl6M3ZiMmVpOVpiaWNIMVo0UzRF?=
 =?utf-8?B?UmU4WFQ5My8wcDFQV1JaaG4xRWd2amsvRStNU3FPZnBSQ2JUa0h3RC9HM0Mr?=
 =?utf-8?B?WkhRam5JenQ3UU5WSE1xNU9oYVc0NFFvNXBiK0NKUFo5YTRUWHY2NEdOVXJK?=
 =?utf-8?B?NmNVTWRFS3JKZEd1MXdyL3Q5WWNteFJsWlZLVXdEYmthNUdjeW80K0FXVUda?=
 =?utf-8?B?SDZWTnVlRTIzSWdqZkRJd0lBQm13UC84Rm4zMmpnL0RQR0xMUWhRUkVNWVZY?=
 =?utf-8?B?MFlRakYvdmhrTFJZQXY3OU5lWVhpc2tmUzFaY0U5RmFKNlNQTGVHNHNaM25B?=
 =?utf-8?B?S0tnKzJhVEh6SmMrRGNDblRGbDlyTnFaaDhDN3I1Tk0rWnUzeUNQMGYycFRY?=
 =?utf-8?B?d1dqNEdlNkVrMVNweFAzTC9ieTljaGZ2NWdza2RJSHVTc3liU0piK3Vjc1Ri?=
 =?utf-8?B?K2V1S29XVjJHUG5SeE03eW01T0RzRVltaG9qUThFUkxFRGRhYXFjUDF1ay9F?=
 =?utf-8?B?Si9EN3lEb2JMaGlBOFJZUC96Z21yYThhbGh0SDFCWDBqZE9CUkc0TGNhMkxR?=
 =?utf-8?B?QS9nT3laWFdOTHV6U29ndmtGeUVCRWo0VzBIbnh6anVXcHZYcXZ3RGZFUWV5?=
 =?utf-8?Q?SuqWikxAu3Qo+ZIk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4217c8a4-3c08-450f-c3e9-08de53fb7331
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 06:00:56.9945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e1ZG+Li9ATvoqEXTryyOoWzhPAVjzUZoiQMHxA1kEL9I0dI4dPT1X1NfqTW651ALOWdq7mqbvZdtEiHdXm2Y+veGcwTOOb4sKTRxF6eH6ys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5274
X-Proofpoint-GUID: vgHiwQaKwzTXXNjX58_IMYA6yaxRZHKA
X-Authority-Analysis: v=2.4 cv=e5ULiKp/ c=1 sm=1 tr=0 ts=6968829c cx=c_pps
 a=IGlUesXJXvI2YQKUC5af4g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=Q-fNiiVtAAAA:8 a=jduRam-Nba4SVa1jhrUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDAzNiBTYWx0ZWRfXy1o94oxkY+xF
 CQDhBpcpXHzSLT1SmoYi9IiR64xJU5NIfz/WWw4Anbdn5vq1R0xco4lOCzeqCfyjYj0bJmB+i2+
 y7NfbK44MBAS4XU71bYI5uRmHWxmGWPh04lbIHQm3AENQe3go8C2xmKG8RuVnAWYMe5fRpVF1/j
 MkBpkNumXR282ffW9nOM/ENkOZS72Z3bVaiQJLnaVlziFKnrd55buGDPTFgJELYltHsLoUMUEI0
 XvWba2bAKLSKvMnVdWRGrGkwoeY1IM3giUCJJzC7D+XvGxtj+nfq1v+4IFYQTA83jFyrGK1KGID
 P7l/RoazXwGSt3J5gf3My1NvOxD81CU3j1GvM1Zaqg2V2ryakROqhDxI6HnrT0vYpzYlzp13UvQ
 ny9Hwsm1nybCSldCo0NYSV91o9W3J2fi5ZenfAz/YmvXWI358T31ZZkm9qWNxPRMS4xZkktzvY2
 Rl+58S5qcx87xM/oNTg==
X-Proofpoint-ORIG-GUID: vgHiwQaKwzTXXNjX58_IMYA6yaxRZHKA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_01,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150036
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60F5P1AI057648
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 06:01:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123489

Hi,

It appears that this patch was missed on scarthgap.

The original author had already sent an earlier version of this patch=20
before this one. It may have been due to missing branch information. Two=20
minutes later, they replied =E2=80=9CKindly ignore this patch=E2=80=9D to=
 both of the=20
original patches (CVE-2025-51006 and CVE-2025-9157), and then resent=20
this revised version.

What is odd is that the patch for CVE-2025-9157 was correctly merged=20
into scarthgap, while CVE-2025-51006 appears to have been missed.

Could anyone please help confirm this issue and merge the patch for=20
CVE-2025-51006?

Thanks,

Liyin

On 9/25/2025 5:19 PM, Polampalli, Archana via lists.openembedded.org wrot=
e:
> From: Archana Polampalli <archana.polampalli@windriver.com>
>
> Within tcpreplay's tcprewrite, a double free vulnerability has been ide=
ntified
> in the dlt_linuxsll2_cleanup() function in plugins/dlt_linuxsll2/linuxs=
ll2.c.
> This vulnerability is triggered when tcpedit_dlt_cleanup() indirectly i=
nvokes
> the cleanup routine multiple times on the same memory region. By supply=
ing a
> specifically crafted pcap file to the tcprewrite binary, a local attack=
er can
> exploit this flaw to cause a Denial of Service (DoS) via memory corrupt=
ion.
>
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
>   .../tcpreplay/tcpreplay/CVE-2025-51006.patch  | 97 ++++++++++++++++++=
+
>   .../tcpreplay/tcpreplay_4.4.4.bb              |  1 +
>   2 files changed, 98 insertions(+)
>   create mode 100644 meta-networking/recipes-support/tcpreplay/tcprepla=
y/CVE-2025-51006.patch
>
> diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-20=
25-51006.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-=
2025-51006.patch
> new file mode 100644
> index 0000000000..a55ac8c314
> --- /dev/null
> +++ b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-5100=
6.patch
> @@ -0,0 +1,97 @@
> +From 868db118535a646a8a48c957f1e6367069be1aa7 Mon Sep 17 00:00:00 2001
> +From: Fred Klassen <fred.klassen@broadcom.com>
> +Date: Wed, 9 Jul 2025 21:01:12 -0700
> +Subject: [PATCH] Bug #902 juniper: added safeguards Protect against in=
valid or
> + unsupported Juniper packets.
> +
> +Notes:
> +
> +- only Ethernet packets are currently supported
> +- was unable to recreate the original bug, but areas where hardening w=
as required
> +
> +CVE: CVE-2025-51006
> +
> +Upstream-Status: Backport [https://github.com/appneta/tcpreplay/commit=
/868db118535a646a8a48c957f1e6367069be1aa7]
> +
> +Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> +---
> + .../plugins/dlt_jnpr_ether/jnpr_ether.c       | 33 +++++++++++++++++-=
-
> + .../plugins/dlt_jnpr_ether/jnpr_ether.h       |  2 ++
> + 2 files changed, 33 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c b/src/tcp=
edit/plugins/dlt_jnpr_ether/jnpr_ether.c
> +index 9642a2c..671d5c0 100644
> +--- a/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c
> ++++ b/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c
> +@@ -202,8 +202,12 @@ dlt_jnpr_ether_parse_opts(tcpeditdlt_t *ctx)
> + int
> + dlt_jnpr_ether_decode(tcpeditdlt_t *ctx, const u_char *packet, int pk=
tlen)
> + {
> ++    int extensions_len =3D 0;
> +     int jnpr_header_len =3D 0;
> +     const u_char *ethernet =3D NULL;
> ++    const u_char *extension;
> ++    u_char dlt =3D 0;
> ++    u_char encapsulation =3D 0;
> +     jnpr_ether_config_t *config;
> +
> +     assert(ctx);
> +@@ -228,9 +232,10 @@ dlt_jnpr_ether_decode(tcpeditdlt_t *ctx, const u_=
char *packet, int pktlen)
> +     }
> +
> +     /* then get the Juniper header length */
> +-    memcpy(&jnpr_header_len, &packet[JUNIPER_ETHER_EXTLEN_OFFSET], 2)=
;
> ++    memcpy(&extensions_len, &packet[JUNIPER_ETHER_EXTLEN_OFFSET], 2);
> +
> +-    jnpr_header_len =3D ntohs(jnpr_header_len) + JUNIPER_ETHER_HEADER=
_LEN;
> ++    extensions_len =3D ntohs(extensions_len);
> ++    jnpr_header_len =3D extensions_len + JUNIPER_ETHER_HEADER_LEN;
> +
> +     dbgx(1, "jnpr header len: %d", jnpr_header_len);
> +     /* make sure the packet is big enough to find the Ethernet Header=
 */
> +@@ -245,6 +250,30 @@ dlt_jnpr_ether_decode(tcpeditdlt_t *ctx, const u_=
char *packet, int pktlen)
> +     /* jump to the appropriate offset */
> +     ethernet =3D packet + jnpr_header_len;
> +
> ++    /* parse the extension header to ensure this is Ethernet - the on=
ly DLT we currently support */
> ++    extension =3D packet + JUNIPER_ETHER_HEADER_LEN;
> ++    while (extension  < ethernet - 2) {
> ++        u_char ext_len =3D extension[1];
> ++        if (extension[0] =3D=3D JUNIPER_ETHER_EXT_MEDIA_TYPE)
> ++            dlt =3D extension[2];
> ++        else if (extension[0] =3D=3D JUNIPER_ETHER_EXT_ENCAPSULATION)
> ++            encapsulation =3D extension[2];
> ++        if (dlt !=3D 0 && encapsulation !=3D 0)
> ++            break;
> ++        extension +=3D ext_len + 2;
> ++    }
> ++
> ++    if (extension > ethernet) {
> ++        tcpedit_seterr(ctx->tcpedit, "Extension to long! %d", extensi=
on - ethernet);
> ++        return TCPEDIT_ERROR;
> ++    }
> ++
> ++    if (dlt !=3D DLT_EN10MB || encapsulation !=3D 14) {
> ++        tcpedit_setwarn(ctx->tcpedit, "packet DLT %d and extension ty=
pe %d not supported",
> ++            dlt, extension);
> ++        return TCPEDIT_WARN;
> ++    }
> ++
> +     /* let the en10mb plugin decode the rest */
> +     if (tcpedit_dlt_decode(config->subctx, ethernet, (pktlen - jnpr_h=
eader_len)) =3D=3D TCPEDIT_ERROR)
> +         return TCPEDIT_ERROR;
> +diff --git a/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.h b/src/tcp=
edit/plugins/dlt_jnpr_ether/jnpr_ether.h
> +index 4875350..90c12b4 100644
> +--- a/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.h
> ++++ b/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.h
> +@@ -33,6 +33,8 @@ extern "C" {
> + #define JUNIPER_ETHER_L2PRESENT 0x80
> + #define JUNIPER_ETHER_DIRECTION 0x01
> + #define JUNIPER_ETHER_EXTLEN_OFFSET 4
> ++#define JUNIPER_ETHER_EXT_MEDIA_TYPE 3
> ++#define JUNIPER_ETHER_EXT_ENCAPSULATION 6
> +
> + int dlt_jnpr_ether_register(tcpeditdlt_t *ctx);
> + int dlt_jnpr_ether_init(tcpeditdlt_t *ctx);
> +--
> +2.40.0
> diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.=
bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
> index a784190868..04f3ee1c2d 100644
> --- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
> +++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
> @@ -15,6 +15,7 @@ SRC_URI =3D "https://github.com/appneta/${BPN}/releas=
es/download/v${PV}/${BP}.tar.
>       file://CVE-2023-43279.patch \
>       file://CVE-2024-22654-0001.patch \
>       file://CVE-2024-22654-0002.patch \
> +    file://CVE-2025-51006.patch \
>   "
>  =20
>   SRC_URI[sha256sum] =3D "44f18fb6d3470ecaf77a51b901a119dae16da5be4d414=
0ffbb2785e37ad6d4bf"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119858): https://lists.openembedded.org/g/openembed=
ded-devel/message/119858
> Mute This Topic: https://lists.openembedded.org/mt/115427305/8826801
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[Liyin.Zhang.CN@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

