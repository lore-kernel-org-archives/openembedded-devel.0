Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8FA8CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 08:02:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7236.1758700934504702346
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 01:02:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TqEldhLu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1362298a6f=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58O5jEYu4072412
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 01:02:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=SLVN8VeKDwz3RacH89yhEDQjBG/9mJO7uyyxQ2T9Oew=; b=TqEldhLujeA8
	HIgK5dThFZ6ljbjqn0U7H8P6lw6opc8uNx3g36jWL18cP8kRo8pnziIh5WhNP1l0
	Aj4u3pwgHVrleLBLgcvKkIys81GFjh4jQD99xKHRw1Y60AA5FRBwkXXxz78qphCf
	WxhN2xiBN3SXX2AJjo8DTrYb+aPdaVs6gA1vf1UKY2u6DxBg0gaJW3N5xPUMfCMa
	ZnC9QKVHw2zGqvRX/uC1oA5NocFh/ob/7rm1phBVQh5ufX1Aji2tJjSFVDbm3BYw
	UgmMZQZRddwxE83aZPEqk6tQdN42O24+7ec6Z+Fg1sefRbE62eIQeGcsEKxwyLOf
	e+llLIER4w==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011021.outbound.protection.outlook.com [52.101.52.21])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499usfm7ax-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 24 Sep 2025 01:02:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSPth+09p5J6FIdqFVfk+KskOnClynVXoinGzQpH4r8xwy5QWtAI/r1eGmoURXJEk2XyHfNS9AK/yO1jeCOgFEZ9n6KG7SWPZCkJc8AB/RTOkEWg5fK9tY/w/EKaXnmb+sMtsw3uCFvXCjhiBOLX0SzAGOjKRYmJkq4VCIUADPCUSL1WEvHh8MFzMMtuk5u5I4Dx8Ttvm1s2Izj85u4Tp8K3LU2sU/LYyO2Udwfha4ttusKgmNr4tX3AbeQ0Fl2+8Ct9o00YCA1Sk6uMQN7WktyHJL5kPf6OhWCMXRXP9L+tKfVNcYfc8gvOebGu489PYJOtMsaIF7Kzn8LTr5gidA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLVN8VeKDwz3RacH89yhEDQjBG/9mJO7uyyxQ2T9Oew=;
 b=BTzBctU3FuiOQJa1Ybcrf2ydeY8bxhsmooqvKdYvMP4clvYBgluak5584H2HKDlgWMMOjRCMFh7W2OxSQX789MGCisXCW/2nX8RbZR/anQzCRamgnaKK8gLoYDR9zRb6Ou/GflQRpSub2KkWGmUWp4QanijHXcOYe9yHZcBTxBhCtrXZc/zWZtOKZHEuWGIp1JaeH6JikbyJAYeFh0UUsJ/Ck9ZRugx8u3eYKB/PCTJO0fw9a81czfuS63n4zcvi9Ix7U5qNAvIWUULxOY+nMPO8T8BmTEGuSEH4rrdksUrtoFmkmSE5DVxuVgtJCKEbGPtvnT+ZmeuFfaH2Cmr+hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH3PR11MB7299.namprd11.prod.outlook.com (2603:10b6:610:14b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Wed, 24 Sep
 2025 08:02:10 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9137.016; Wed, 24 Sep 2025
 08:02:10 +0000
Message-ID: <d09b1bc7-3c18-47f8-a7eb-3cc6e88b5bb1@windriver.com>
Date: Wed, 24 Sep 2025 16:02:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][walnascar][PATCH 0/6] cherry-picks from master
 branch
To: ankur.tyagi85@gmail.com, openembedded-devel@lists.openembedded.org
References: <20250924075643.2047506-1-ankur.tyagi85@gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20250924075643.2047506-1-ankur.tyagi85@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4PR01CA0074.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::18) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH3PR11MB7299:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fb3b18a-1115-442a-fe87-08ddfb40a9d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YmZ5ZCt0bjI4RjYxRG40WGo3SmE4WGh0Z2JGMmxPMlpZZUNhV2t3K25mRnFp?=
 =?utf-8?B?UW5ISENHMlk0OFhEdURHK3pRamxuZE4wT0xZZ0hxSm9QQ2FUVnY4SEN1ZmRD?=
 =?utf-8?B?dFNRdE1FTjVJeG9TRzVSa3E3VHhqckJpWkk3K3FvRTRQTHVPWXpvOGVua1h2?=
 =?utf-8?B?VVpCTngwY3FLdklBZDZnMGZGZTI3MzZGa3YyY0p6NWpTN004STZwTUlKNUtD?=
 =?utf-8?B?b256TVViOUVGZDY0ZjZ2T05BZE1EdERocjFBNmFaSXA2TFovQUJQR2MrVitp?=
 =?utf-8?B?VDVYSHhGYi9vekdwVkNhSXMvZlFqb3NnQkQ4QytISEZXODNCTzhKUjdGQTlT?=
 =?utf-8?B?SWh3TkpnbWlpTzMzenFXRzNnbVlFNExWclpmTGpnb0J4Z2dVL0I5cmVyVWxQ?=
 =?utf-8?B?YXFRTzdBUGRKdDIrblllMXI0djI4ZlhxYjRnbjBteUg2SGFybFlXUUhldUxq?=
 =?utf-8?B?SVpxTncwNVhkak9COWtkVWc1SmNwZ0ZCTFV6em5RaXd3Z1pObmMxS3l0alpC?=
 =?utf-8?B?RmRWYTEwU1pPQ3pSSDNQUll5Z0NoUHNob2tuQWREbVBxRExMU1F4Qk4rUXNO?=
 =?utf-8?B?VGw2cDFaRHo3OGxxSUk2UFoyUlBTNXRLblUwUzR1ZkMyRWQxazIyYTh6VlAr?=
 =?utf-8?B?Znk4aG5lMlI3WVpVM3h6ZXpBaW1CVjh0VHBJclVwell6U3Vxem85Z2J3cmpw?=
 =?utf-8?B?dEZKYWpHYWloRFA3VXdqSVVsL0hvYzBudktMOVd0VHdvbm5ZRWlGWHNTRkdm?=
 =?utf-8?B?NXAzSUh4eFFvQlJib2RPWGMrRGxzNS8rN0lGMllCdVRHUDQwc09JUmRobGhG?=
 =?utf-8?B?TEFjY2x5dlBBbFI0dm9FRTNsR1B0ZTI0bENsK2diZ0JuckZJQndwd0JKWWg0?=
 =?utf-8?B?T0JjWU9mYUFwVEgwNENaSGYyRC9MSUFla1QvK3I4ZjE0Q2JuVGZ4UFVUTGFk?=
 =?utf-8?B?RmlkbW1kN1o0NGtqMFJURndJamRUNEh6dzRjb0NzZTBhMEZrZTkzVjBkNGZW?=
 =?utf-8?B?Szkwb3ZoVlduSmJod296UVJtb0RhOUJhTVYraWlMejIzQzI4UHhoS3NTZnFo?=
 =?utf-8?B?NTk0VG1YUFBZVW1CVnNVb1VGYW9Jc0hQZmJ4amQzVkVFdHhJcEZDWjJtUjlF?=
 =?utf-8?B?dFZ6U2N5a01zN1FuL0RRRWJ0N0haN1hFVWJBOHl1dm5lcGx6a2syS0MrZnNO?=
 =?utf-8?B?RUxGQ0lVVzdkRE9KOVQrQ1J2ZDZ3WUFZUFU3ME5tNWtidkF4QS9HQlE0aWl1?=
 =?utf-8?B?TUdPTzVZb2hHZG9pdkRFdy9KM3ZVSE1uUDcvZFRzejBtQkhFUzV4Y0dlcUNK?=
 =?utf-8?B?YktPa2ExR1BzYVlEVmhib0U2bFR5OS8zOTE0RUhYSStUZUxOZlRVbVFFeG9x?=
 =?utf-8?B?bzhGRDA0UVlTMzZsUXg4a1d5ek9SNVN5c2xBckEwaVFxdlZtZGVnS2JyWFJP?=
 =?utf-8?B?SnRqOThKb2l6VmhIZjRzcCtMd2EwNnpJelRIZnRaMFl1MlNLY296T0FZMEJl?=
 =?utf-8?B?RHl0Um5ZTUZ2dTZBSkZPdG1uSFNBdmdENXlpcDIwc3M3THowb1Rza1I1WC9D?=
 =?utf-8?B?ZStHS0VBdVlhQ0poYVVCdGdqYTJ4djJSbTkzcFVHVEo3WFVqRTJyOVhlMURF?=
 =?utf-8?B?ZW15N1RJcVc0V0dmVWdIbzNJV1lGdDR2TSs0bG9KR3dPV2lLdkxmQktHaEhC?=
 =?utf-8?B?U3lRL2R1bnJHQks4N3laUkd3VkU3TE9oSnlHeFhnc3lpZ1pWeDdOdlkycXJ3?=
 =?utf-8?B?Y25NTDNBbTEwK2JYRHBPdnQ3QWlKekMrbFJsdW53S05MRjQrVUk5T2FOc0FD?=
 =?utf-8?B?SHBZZEphTzhyeFVyRWdrbW5YWUtJWDkwK1hjRTZyaVRwak5sc0NqWWh3L3cx?=
 =?utf-8?Q?RoJDi6612AodW?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YnY4V3ZRRWJFbkI5ZDROdVovSVFLRlRIODdIb2ltV3hJVDhXaGRKYmU2THpn?=
 =?utf-8?B?RnhiN3RrVlR5aThGMUpuNmJjOTEvcnd6eENZUjBYNjltQ2s2bE5CRVlkbUZj?=
 =?utf-8?B?UW9YR3kzT1FWYk82QUc5bTZPNkd1cUFBRms4MkdiR1FTSUUwazlIZEhqS04y?=
 =?utf-8?B?aFUrRnR5RnQwNHB6dk5mQ0ZtQnprUVBWdWYvSnl5c0J5OWRKcllPdVRoUkg2?=
 =?utf-8?B?UmE5c0ZxZXYrRmpadE05NlV0Nm9rUUg1dElIUUg4YlFLT25EZmJSTzZTS2tF?=
 =?utf-8?B?V0Vod1JxTDlHQ0dpZjJrYkhTdHhudXU4OENkQmZ0WnIrQ3Zwd1l5VS9ha2Vo?=
 =?utf-8?B?RnNGWDQ0dVJnTlc5YnVNWXM0aGwrdm03RmFGUCtycjE1c2h1SFM5dGZsanN3?=
 =?utf-8?B?bkhlZnZ0V3lObldtN3VjMkpLa09tdVFmUG5oVlF6a3c3Y3lSK2w1R0JWL1RL?=
 =?utf-8?B?bnFiWDdiUWxUazZVYTFMbkg4RXdabC8xdUFDUHlCbzk4U1E4V3p5eWJ3Y283?=
 =?utf-8?B?MGpzaDd5NlU5dEROMnlkR29tTmkrZmIrQzJUMmp6aTJEbElLOHVqUVdZTnAx?=
 =?utf-8?B?elVGTXNsM3IvRDN0TXJpTlF0YlhnZU1FTXNMemJwSHRFcjN5dUNJb1Y3V3ZO?=
 =?utf-8?B?UjNiTVM3MmF6Yzl4WkloQkszMENJZU5rSlN0Nm5aT2gybVhTb0JFa3drSzVD?=
 =?utf-8?B?bkdINU1ZZjIzT1Z0Qm1VOVJrN2FXNnV6WWpaQXpLZTR5ZGdRbkhyVlB6cThY?=
 =?utf-8?B?dGVJZ04rQnE0dDVmWGF3RGU1UzVRV2VRcWFKc1p0M3JuUFFnbGRST1lKdzJP?=
 =?utf-8?B?RExjMzU2dGswcDVDQ2lsNkl2MkhNcUZHT2RNTGM0akJGM1VFbDEySjBaYllY?=
 =?utf-8?B?b3Y2bGRhWFF5MGp5RXVlU3ZSZmdjM0wya2kzYUk2TWl3OU1Yd0FUV0hOSUIx?=
 =?utf-8?B?c3lpeEpYcjFzZG80Qy9helQzNlBaVjNtNmhSNXhVYkwzL09vbzl0SURSZ05h?=
 =?utf-8?B?alNyVlpWTU9ZQ3pIQnMyV01PSGNsbUdvQTRTV1FKL2phdWVCQXk4M2Y4eDNZ?=
 =?utf-8?B?L2ZuaS9GaG9pVlJ0NWR5OHRVYmcrM0lXU0tlNlZpMHF6R3hBQ08zakhydUsr?=
 =?utf-8?B?bUZObXl3SnhBbncvRjdtc05TRXNOOU81a2I2WmNScjhkWEx1M0srR3hvWE9T?=
 =?utf-8?B?THI2eXNSTk1qMlJUYzFRbnJTa2VqWGY2MmxVc2YxWmY2L01KT25rMi94cXdM?=
 =?utf-8?B?aEhBd0lncWViK041QVRJS1ZRQUhQbG1FMzZQdEpMUzBxcVMyK2pIcmdDRE9P?=
 =?utf-8?B?RmdONXprdUJRQmlObGc3NXVZdW9VUmVmU0FvNk9OK1JOd0pHMkxHWE1aSVl3?=
 =?utf-8?B?Zis5SitHdXBvbWo4WHZoNVhJMmtORnQzR2QydmVhQmtpUmZOdW9oOXJLK2Y5?=
 =?utf-8?B?QUFscllTUmpWQzNjZWhvdzZlWkRuZlJVK0tLNU45Lys0Q1R1VXN6VkJDRkpw?=
 =?utf-8?B?ZzJCTktWOTlBSzZBVFN6WWdnbnlIT3MxUmFEb25reitKT0VLMHp6YU1CTlRX?=
 =?utf-8?B?bWRtMXJxYk1KT29hSEFWVkY2VmdwQVQ1M0lGMTB6VFEyc0JLRElaZUNkanZ5?=
 =?utf-8?B?SDZEQjdadkwzM0ZKTGJqM2pkSmJucitsOWpob290a29MdS9OT0hxSVNaTndk?=
 =?utf-8?B?ZU9GMlRBMGJwTStSZXlYS09xRGxyZU1qUVRSZVJjcWttK2xwekRKVWpwV2ZK?=
 =?utf-8?B?d1h6WHRKVEFHbmRuMzV4ZTFVVmE2MEtUb3dKQ241a2RwSGpZdkhGaXpCS3dt?=
 =?utf-8?B?ZDkxZVpXNXg5bGRsNnNHNHMyZmlMOVg1VVJjSFhVUTFHWjdaOEpnM3pPSHkx?=
 =?utf-8?B?Vzg0VmRhdjkva016LzJqZmFHeGpxZ0VUdkpDeGFFQUhUbnJuQ2lPa3VGcFpu?=
 =?utf-8?B?Nk42ZEtGVFpwMzZhYjYrdmpZQ2MzdHI3ZTFpM25uSW50THBFblplc2pxRGpX?=
 =?utf-8?B?SkZ3NEk1V0RWdXU0UHNVTGI5RGo3bm94QTlFWUl3Wi9MQmpXbnNNQURmNkda?=
 =?utf-8?B?OVRiTjU1TlB3UlNPTFdVTUhlQytXcmdPWFRvOVJmcUZBTm12eU5FMVpjeFk1?=
 =?utf-8?Q?irCXqXlickLxQBfsnumUitjOz?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb3b18a-1115-442a-fe87-08ddfb40a9d7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 08:02:10.3643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bYJyc+kxy4uufeGqCQc5iibmeLHaH4OXOUhMEO9ck1U5Yymh0FK5NdnbOp41laQWnYNaFqrdGauqnV7kZ8Ea1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7299
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI0MDA2NyBTYWx0ZWRfX8bwoppq7Spio
 wbErvTeR2Q1qIuX2jP6WYz5/JOiPtnXhfAScCgB1iIOcwIZZjwPGkQPbbH4/GeyfANkLj4V0LPs
 OEf5AO50YNKhK7mphAWY/9RtLMPGngEGGnai9dxZ+U7tqRtsc8TusAyNvyuYXyvrBTtMnkZDMrt
 WQOIx3gmg/3m9Tln7CCD/Zrk1L1/vRUXy0zlMJSM5HV7/15FerWzrnnPZvEhAS2gC2obM36K3CV
 vZXBIAg+c61AQa8XUH69A5MFWyuWqYPp+UKtc06zGSiuBRxOkb9PCQmKSBvgxO4N7fPyvsa+MeG
 trCItTUd14GJuk4eQDgd3SG+4mjCNy9zP9Gj1YaA06SF8cB7KhieD2DYQwVjV0=
X-Authority-Analysis: v=2.4 cv=DrxW+H/+ c=1 sm=1 tr=0 ts=68d3a586 cx=c_pps
 a=4NR8cDhszsP7ZiL8l4sOGg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=azwIJmg8KT6tmlBM01QA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: WNj0B1R_QqTqzDRinLNIUC6xQO8aFndg
X-Proofpoint-GUID: Zg5n2FrMmd9zfcVrUaAJOzaOvwaEXQPk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 08:02:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119762

There are a few major version upgrades in this series.

Regards,
Qi

On 9/24/25 15:56, Ankur Tyagi via lists.openembedded.org wrote:
> Trying to keep recipes in the walnascar branch updated with useful fixes
> from the master branch.
>
> I intend to submit patch series for each sub-folder, this series is for
> the recipes inside "meta-oe/recipes-bsp".
>
> I have tried to carefully review the change logs and commit logs while updating
> recipe versions.
>
> Did basic validation by building against qemux86-64 and qemuarm64
> machine targets.
>
> Changqing Li (1):
>    lsscsi: upgrade to version 0.32
>
> Gyorgy Sarvari (1):
>    ledmon: upgrade 0.97 -> 1.1.0
>
> Mikko Rapeli (2):
>    fwupd: update to 2.0.12
>    fwupd-efi: update from 1.6 to 1.7
>
> Wang Mingyu (2):
>    bolt: upgrade 0.9.6 -> 0.9.10
>    flashrom: upgrade 1.5.1 -> 1.6.0
>
>   .../bolt/{bolt_0.9.6.bb => bolt_0.9.10.bb}    |   2 +-
>   ...-meson-Add-options-pciutils-ftdi-usb.patch |  17 ++-
>   .../{flashrom_1.5.1.bb => flashrom_1.6.0.bb}  |   2 +-
>   ..._binary.py-Use-env-to-detect-python3.patch |  23 ---
>   .../{fwupd-efi_1.6.bb => fwupd-efi_1.7.bb}    |   5 +-
>   ...certs.py-use-usr-bin-env-for-python3.patch |  28 ++++
>   ...-reduce-lzma-compression-level-from-.patch |  47 ++++++
>   meta-oe/recipes-bsp/fwupd/fwupd_1.9.25.bb     | 134 ------------------
>   meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb     |  93 ++++++++++++
>   .../ledmon/0001-fix-build-with-clang.patch    |  90 ------------
>   ...nclude-sys-select.h-and-sys-types.h.patch} |  27 ++--
>   .../{ledmon_0.97.bb => ledmon_1.1.0.bb}       |  10 +-
>   .../lsscsi/{lsscsi_030.bb => lsscsi_0.32.bb}  |   6 +-
>   13 files changed, 197 insertions(+), 287 deletions(-)
>   rename meta-oe/recipes-bsp/bolt/{bolt_0.9.6.bb => bolt_0.9.10.bb} (92%)
>   rename meta-oe/recipes-bsp/flashrom/{flashrom_1.5.1.bb => flashrom_1.6.0.bb} (89%)
>   delete mode 100644 meta-oe/recipes-bsp/fwupd/fwupd-efi/0001-efi-generate_binary.py-Use-env-to-detect-python3.patch
>   rename meta-oe/recipes-bsp/fwupd/{fwupd-efi_1.6.bb => fwupd-efi_1.7.bb} (90%)
>   create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd/0001-build-certs.py-use-usr-bin-env-for-python3.patch
>   create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd/0001-fu-lzma-common.c-reduce-lzma-compression-level-from-.patch
>   delete mode 100644 meta-oe/recipes-bsp/fwupd/fwupd_1.9.25.bb
>   create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb
>   delete mode 100644 meta-oe/recipes-bsp/ledmon/ledmon/0001-fix-build-with-clang.patch
>   rename meta-oe/recipes-bsp/ledmon/ledmon/{0002-include-sys-select.h-and-sys-types.h.patch => 0001-include-sys-select.h-and-sys-types.h.patch} (56%)
>   rename meta-oe/recipes-bsp/ledmon/{ledmon_0.97.bb => ledmon_1.1.0.bb} (79%)
>   rename meta-oe/recipes-bsp/lsscsi/{lsscsi_030.bb => lsscsi_0.32.bb} (63%)
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119755): https://lists.openembedded.org/g/openembedded-devel/message/119755
> Mute This Topic: https://lists.openembedded.org/mt/115408371/7304865
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


