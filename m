Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA0EAD5E372
	for <webhook@archiver.kernel.org>; Sat,  9 Nov 2024 13:56:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.17033.1731160567632153311
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Nov 2024 05:56:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1043947ab9=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A9DA2ll029504
	for <openembedded-devel@lists.openembedded.org>; Sat, 9 Nov 2024 05:56:07 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42t84pr15u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 09 Nov 2024 05:56:06 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4A9Du6fJ029867;
	Sat, 9 Nov 2024 05:56:06 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2045.outbound.protection.outlook.com [104.47.58.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42t84pr15s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 09 Nov 2024 05:56:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mzLAkCPQTv7Axl8yGjZxTUZZGBwwoD7LTmaMb88qvxc9wxD7bsZ4cGP3KuVHbI2qC40Z8jcDl6mol35sEgXrh5GaUGazvIxjwsPmwTEE9CiXOQgVUIOC5s/h6j/cxwQCXvyGRxvhlFpz7erfPfMpo8BTf/hoZh+kpBg1Jx9Fv0CkhGxXtO5w0PiUHbISu0FFXdvfiq93BH0D8KN3fa581keXNLQNCJmC9z0y60WOXvX+Bnj3ewVXbufrkAXNMVWL8XnPGRZQFuBcyPHH7jjthVUDKc0I4cs6oYs+U3Tq24w0uaAMbw+d8TBedRoB/BP4xw4RfEUTGw0WuWCLc6U4Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0PwfrEPCg/DHQabibXGQdEsCXrNbOK56QutzDSG+pzY=;
 b=k/OLaoiWT6PR5/gXCyrXXiPFhnBeO1ki1LeURYBhhBqicXWFaIVJ0FAXAuNjsUVWPAvClKMf2yTOaFAXxU1HXo82bWn39Qf/Mz+ISYuIuNzZn/Z3R5au8Hmk+DMnRRylYw9AWPGJPMs90a67R9zcubBJ62hQ0Qv6SKyQccpTWPuI0M5snH2wRUVF6RJxabb9A257XqBjaEgGvukkI+d0EM8qJ86rnXZWmTeSmaSvOo889RbvxJcuupzqtYjALLdEv5PZIIjuvmVIrYEPTeUJpvnyAAM0hyxNqLPqnROEo8fll3WjBAJawsx7RMmGYYA0kVah99SCTZ9omoB1DJQrXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CH3PR11MB8546.namprd11.prod.outlook.com (2603:10b6:610:1ae::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.22; Sat, 9 Nov
 2024 13:56:04 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%4]) with mapi id 15.20.8114.028; Sat, 9 Nov 2024
 13:56:04 +0000
Content-Type: multipart/alternative;
 boundary="------------U5WV0Am3TIbtfr4I0aI0kekR"
Message-ID: <618765bd-fbef-4207-b882-597be23f8162@windriver.com>
Date: Sat, 9 Nov 2024 21:56:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v3] parallel: Add recipe for GNU Parallel
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20241106110311.1657900-1-peng.zhang1.cn@windriver.com>
 <DB5PR02MB10213B19461D7A24EC043E886EF5D2@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Language: en-US
From: "Zhang, Peng (Paul) (CN)" <peng.zhang1.cn@windriver.com>
In-Reply-To: <DB5PR02MB10213B19461D7A24EC043E886EF5D2@DB5PR02MB10213.eurprd02.prod.outlook.com>
X-ClientProxiedBy: SG2PR03CA0108.apcprd03.prod.outlook.com
 (2603:1096:4:7c::36) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|CH3PR11MB8546:EE_
X-MS-Office365-Filtering-Correlation-Id: 9db9d8da-33ce-45d5-c320-08dd00c64025
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SjlrRk42ZXFXN2k3VGhob2JnekYrS0JFUHJFWmZVeWc3cHU5akxoVk0vSjNz?=
 =?utf-8?B?ZE5YVDRIUHNjQk84Q1JUb0l2SjlPY08zSHd0OHUxUk9wWnY0TzBIckY1WExv?=
 =?utf-8?B?UzRsVjJHTGp2NWxyQmljYkMrSGFaZFpSenlyMjd6aHhXMHJuNmx5WjExeWRP?=
 =?utf-8?B?QXpxVVFaTm1UU2tML0d0TmpTRHdhR3B3ak9ZaWF0cGFLNm8rcmxCT3hINzdW?=
 =?utf-8?B?RXhVblZFd1FkbUllVkxxVStka0pqNDZQSnpZdWJpTVN5L1pLZXZ2dnZKTkJG?=
 =?utf-8?B?a0xXT3IwMVhsZEJHSE84NkpzOEpjOXNTNTlXMWoyQ1gvbEtPVmNDejl2bG5m?=
 =?utf-8?B?cnIxRTU0UGR5L0lRY0JVVzR1RFhIMWplUFF6SzM3RVpEODM4L3Q3T2ZaUmZE?=
 =?utf-8?B?WitCNXJNMmZxeFpWb0tnTlRWVUQyVldlaTh4TnNnTEFadXUxbVgrYWF2Zlln?=
 =?utf-8?B?WFByWlM5NkhTbWhlOVh1aGFlcWRJNjBwVWNDL1VLS1drWmwrbmIyZTAvZXgx?=
 =?utf-8?B?U3owUmhqUXg2M2FyYXBmc0hPRnlLNWdjUm5KeXNFQk9DTWpYdnRjL0M2Nkxv?=
 =?utf-8?B?MGJWUWhZdytpakFiU2JrMFc3ampIQW1Ta2FvblU4U3FzUlhKVlQxTWw5YkpY?=
 =?utf-8?B?em54V1AyaDd1dFlIT1YrdHR2SU5YbEFPckdJR0hlQnVQUW81bVhPZSs5L0dn?=
 =?utf-8?B?MlkvOWdxRzNUaHhtWDFkb0crWEpRVWN1N0xaenpTTkRCcEhFU2pOdVFSOGs4?=
 =?utf-8?B?V3NUYXFuUnc2Zy80cCtVVitsUTRLYkJ3Rm90dEs3M2MxcTVwcnBvVHM2WlU4?=
 =?utf-8?B?ZUNyaU9ENjFPWG5FbUdVT24vcEc3Yi9xd0ZTZG9pMnJKVDRtOUNwR0NLWDU0?=
 =?utf-8?B?cFZHTkswbzZEOFVFU2lHU1RYaTBPejJ1Vmo0LzRCSjQxQWtjYTVlRS9vRHRx?=
 =?utf-8?B?Ky9KRkVuSEU0aVN2K0pLSTd6SUF3L3cxcWJrYzhQSlRiaHdjSHJ0Qjl6Y0xW?=
 =?utf-8?B?Ums1V3BqTmRQWDN6bjBlR3ZaMUYwY0RxZVE3REFWSzdYT2lCbjBneVAzQW1u?=
 =?utf-8?B?U000bURxOUpPakU2RWxveE8weHB5MVdJN1BiVkZwUHo4ejMzTXl4RUtzN3k2?=
 =?utf-8?B?dndjZ1BTeTJsdHBaOStPKzYrQUlkS2pSVjZGQkliL1hxSTJpVlZvWVJmeEFi?=
 =?utf-8?B?VTBKU0dIL2hmUUJNYlFFaFFNWU8yQXd1NHc0NXpzbHdPQ3lQOXNvZ3BpSFBu?=
 =?utf-8?B?WnpOaWdMZ2IvbVd0ZnBzZ1BxRUV4SmUxWkcxcnh4RVo3UE8yNXFiMzYwbTZ5?=
 =?utf-8?B?dVVVSzZmTmFUdWtpdWV5bWhEZjZ1WHRUMHZDV0tPSTF1Z0F6d3JrWmwrTi84?=
 =?utf-8?B?KzBGbXZxK1RpRXBoMUw2Q25UUk5JOHBHZXdnbG9FWjBxL0MydVlXWnNjZUpF?=
 =?utf-8?B?eTk1cXIrdHkxRXVFWUhzNFZqRTdUWUQ0NjI5OFZLdzdQWnJNSmQ1ZFk3TGQ3?=
 =?utf-8?B?UmJ2eGcxUnlTZjVnWlJ2TUVkUVltbXUyQVBFWjRwUG9qVWRXY094VjhnanZ0?=
 =?utf-8?B?cC9Udk9HOFlQdE56MFo3WGJaSmFVbGk1VWJhWmxzbU5qTG9PSDZrNGQzdWhz?=
 =?utf-8?B?K0xXYXpzSWtnbTd5QU1XTjdqeEV4ODNIK2dvUEYySzYxa1paNXlYcTVDSUdU?=
 =?utf-8?B?amh1NDVxWmxCVzdZWUNVOUZ5NFFOd1dsVDM4VFYvRGRNNzNrZ0kxZG5BPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cnZRWExybXAzRS9GaWdRbTRoVGdGRUI4Q0g5QlpyL2Y1aFRaSEpVMnRYV2xz?=
 =?utf-8?B?Zks0eUVrbUlPRTFuVE9UT2IyUlM1d0VBemxCcHFWeUNNdDRqVk0rQ1V0bkNw?=
 =?utf-8?B?ZmQrUFpPU081Y1J2Qk50MUNmRmJXbko2OWhjM252a0RPK1M0U2FONU9HK1Zu?=
 =?utf-8?B?YUJ3RzgzUjBGbk9xRWg2ekc1TjZ4ZXVaRTBHSjFjNzNselJaQ0hoTXE1RTlC?=
 =?utf-8?B?M3JsZFNJTE1yQVZtWDRaY1kyV1p5bHRkOE8vTG1LR2t2SS9IVHFBbndTak5r?=
 =?utf-8?B?dTdHRlpjUjJpa1lDbDJIZHJXdHoybHNveTEvK1J2ZUxweVFUV2FWa2NJZDNS?=
 =?utf-8?B?ek9SOHdTb3NEUU9JNVZYZGREOU04dlpxK2Q5Z2kveWhkOVNnbTFSakNpT2x4?=
 =?utf-8?B?cG5CNkkyemFXQnJscWVkV2ZFdm1SVS93N0lRT3cwcUhSZkdSVUlReWd1RDdQ?=
 =?utf-8?B?ZXB5bjBrVElSTFFQZjlFb1lsanRDWENNeWMydWQwSklFK0hOVGtmdlJXMFpl?=
 =?utf-8?B?MjhWeTdWZUpqd3ZvNm5oaThsaHo5UWoveVNDU1JuTUJVUWs5cUpHT0s3aXlE?=
 =?utf-8?B?dy9oUkZtd1R4RUxadHYyN1VPWUwwVFpkL3BsTTU4WGZNMTJrcnpWMk9Jb0tJ?=
 =?utf-8?B?anNmNThBSlphb2FvdW04QWNEVlUrM1VnZkg2T044QVhUSUZBNjlMdC9mTXlF?=
 =?utf-8?B?YUswM0VNZEJkSnlwZHNLdEM4K0Nlck03MDVmTXplZ2Y3bXZNRkZ3NGc4cHQx?=
 =?utf-8?B?dkVodGgvdjhZb081NEhZbWhDc1ZaM0ZhTnVWOVFPb0lyWExJeGdmZzdmeWVk?=
 =?utf-8?B?OUFaZmNOV0RrNmI2QnQwQTNYYytVWUR5eGtEek9DYWRDdVF0c2JuNWZzZ1Bp?=
 =?utf-8?B?cno1dW1lZStUQmI3UlNsdWdYTXYza0V2K2IzUXAwVTAwYnpGTFh5MWtVei9k?=
 =?utf-8?B?eXVncFJlSnZMb25sVFBxSUdwQmxZQktCS2x3VmcwVEtDR0s5UnRMMHhHZE9D?=
 =?utf-8?B?d0s3THBTNTV1YnRhU3p2Mys2M0JKaVVMQWFGRkpnQ0FRb3RWWHp5UGpVZzE3?=
 =?utf-8?B?NThidURyMkJUOUt1WWpMNisvRFEyNjFkaSszVUFpWUFnRGNNQzcwSjFEc3g1?=
 =?utf-8?B?WXp4Z2I1aVYzZGZwUWFEd3R5eEp4eFVmSHFPNGRubUYxNDZrT2p0bXRFdlhJ?=
 =?utf-8?B?YU9MbW0rZDJiM0x2RUV5eitPclQ0eCtrYUx4end0aDYwS0JmUnAycTZmN2hK?=
 =?utf-8?B?ZE01TWRWTGZBa3Vxb1Z6WTJwcm05a2JTT1YvS1RNdFVyQzk3a1hUYkh5OHh5?=
 =?utf-8?B?ZHFsaHRadUozNFRxc3h4Y0lSK3V6QUNad25xcFQzY2lvMFJnM2luZ1ZiSVdE?=
 =?utf-8?B?VXBlazkreUpLTXNMY2dYcXN1WHRIWDhQMVZZMkFRWG04ZFY3QzhzeEYyc016?=
 =?utf-8?B?cXRZT081K0syL0VmaGNXa2VsanB0ZXJwNms4NFBPTVgzY0N0SHVmRURyMm96?=
 =?utf-8?B?dWZHUnRtSy91cDFydzM0M01ON256SU1teVdiT1ZXQmxKYXdHUW5ub1NTdGhQ?=
 =?utf-8?B?b0FpYlVUUE9VQldSOG03MERYYzcxZFM4RTRRb0NsUHQwTVhKNFpPNGVuQzhl?=
 =?utf-8?B?MnlPWldyeTZrOFNvZE0wenZlNzJWdC9idi9LT09nZlVWbnJTUXI5MlZkL000?=
 =?utf-8?B?MG9Fb0J2UVEvUkRVaHBEZG96Zk4wK05PWFlPTmRacFRtQkNGUjdYMXFRc2Ux?=
 =?utf-8?B?WFp6R2lobUd6Z2hpOHl6UUZ2M0tJUjFuSVB1VklwNi9tbm5iVm5KYnpRUmtZ?=
 =?utf-8?B?VEZybnhGdUNtTU1mZlpqb1BzbkVtQ28xWkZLaWIwalcxck4ybnk0MVVmN09x?=
 =?utf-8?B?eTdnU1B1WXRqVnlWQU1PUzIvWlAvUXMyeUFRb1dzaU1meGMyZVhUeG5LODlv?=
 =?utf-8?B?dFJWemczRmpCVXhQYVFXcmI1WFljTUt3RGpkU1ZuRU4yV2ZuQ0xoM3lqaURI?=
 =?utf-8?B?RWFLcGpJeDU5NGhnRmsvZzQzejcza2dHY0NueHhtMWJmK3Zna3JwaHBxNFdY?=
 =?utf-8?B?ck9yMlg3QmRWRndpT0RGU2ovanp0MXFJeERSZlhpR0h4VWk2bnpJVVhuN21P?=
 =?utf-8?B?bVJ6MFovbGkrSHYySm9rVUFQaG1Jc0FRTjZXUFhaeHZkaXJKckdDbTd2dUV1?=
 =?utf-8?B?OHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9db9d8da-33ce-45d5-c320-08dd00c64025
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2024 13:56:03.9458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dN3/kDOxyy3t8t9rv9lneK67aUAbgT24pNDTVqnBZgWmiiy9DAJ0FxFFA4p7Almd7PqGAKMhEVA8ZiA2sFPMyOI6sVifvhsL4R/7qi6FHSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8546
X-Authority-Analysis: v=2.4 cv=IrVMc6/g c=1 sm=1 tr=0 ts=672f69f7 cx=c_pps a=Syk5hotmcjzKYaivvMT4gg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=mDV3o1hIAAAA:8 a=pvMDp3u_R022nOoFEWQA:9 a=QEXdDO2ut3YA:10 a=UqCG9HQmAAAA:8 a=UBFVfQAFWYhimOpKR3UA:9 a=VFdSsYqqKf5njO1E:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=T1a-OTYGVawA:10 a=ImwWUX5h3JJ3gRE9moBe:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 6aQcn8IxjhYNQ6IkG6wKpo1QncFy8nVB
X-Proofpoint-GUID: DlngvFvHMKJcsSCAJaT_6mkT_lmJimFR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-09_13,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411090119
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 09 Nov 2024 13:56:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113773

--------------U5WV0Am3TIbtfr4I0aI0kekR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/8/2024 7:04 PM, Peter Kjellerstedt wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
>> -----Original Message-----
>> From:openembedded-devel@lists.openembedded.org <openembedded-devel@lists.openembedded.org> On Behalf Of Zhang, Peng (Paul) (CN) via lists.openembedded.org
>> Sent: den 6 november 2024 12:03
>> To:openembedded-devel@lists.openembedded.org
>> Subject: [oe] [meta-oe][PATCH v3] parallel: Add recipe for GNU Parallel
>>
>> From: Zhang Peng<peng.zhang1.cn@windriver.com>
>>
>> This recipe adds the parallel package, a shell tool for executing jobs
>> in parallel using one or more computers.
>>
>> Signed-off-by: Zhang Peng<peng.zhang1.cn@windriver.com>
>> ---
>>   .../parallel/parallel_20241022.bb             | 29 +++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>   create mode 100644 meta-oe/recipes-extended/parallel/parallel_20241022.bb
>>
>> diff --git a/meta-oe/recipes-extended/parallel/parallel_20241022.bb b/meta-oe/recipes-extended/parallel/parallel_20241022.bb
>> new file mode 100644
>> index 000000000..e3cf0a6a7
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/parallel/parallel_20241022.bb
>> @@ -0,0 +1,29 @@
>> +SUMMARY = "GNU Parallel - A shell tool for executing jobs in parallel using one or more computers"
>> +DESCRIPTION = "GNU Parallel is a command-line tool for executing jobs in parallel on one or more computers. \
>> +It allows users to run multiple commands simultaneously, making it easier to process large batches of tasks."
>> +
>> +HOMEPAGE ="https://www.gnu.org/software/parallel/"
>> +LICENSE = "CC-BY-SA-4.0 & GFDL-1.3-or-later & GPL-3.0-or-later"
>> +
>> +LIC_FILES_CHKSUM ="file://LICENSES/GPL-3.0-or-later.txt;md5=8da5784ab1c72e63ac74971f88658166 
>> \ + 
>> file://LICENSES/CC-BY-SA-4.0.txt;md5=7130783469368ceb248a4f03e89ea4b8\ 
>> + 
>> file://LICENSES/GFDL-1.3-or-later.txt;md5=e0771ae6a62dc8a2e50b1d450fea66b7\ 
>> +"
>> +
>> +SRC_URI ="https://ftp.gnu.org/gnu/parallel/parallel-${PV}.tar.bz2"
>> +SRC_URI[sha256sum] = "6de22bf1c67f7f316670d21ed1a2a32f1214dfbd3e420939ba937925c0a57a12"
>> +
>> +inherit autotools bash-completion
>> +
>> +DEPENDS += "perl"
>> +
>> +RDEPENDS:${PN} += "perl \
>> +        perl-module-ipc-open3 \
>> +        perl-module-getopt-long \
>> +        perl-module-file-temp \
>> +        perl-module-filehandle \
>> +        perl-module-file-glob \
>> +"
>> +do_install:append() {
>> +    rm -rf ${D}${datadir}/zsh
>> +}
>> --
>> 2.34.1
> Based on the above, and a corresponding recipe we have, I would
> suggest the following instead:
>
> SUMMARY = "GNU Parallel - A shell tool for executing jobs in parallel using one or more computers"
> DESCRIPTION = "GNU Parallel is a command-line tool for executing jobs in parallel on one or more computers. \
> It allows users to run multiple commands simultaneously, making it easier to process large batches of tasks."
> HOMEPAGE ="https://www.gnu.org/software/parallel/"
>
> LICENSE = "CC-BY-SA-4.0 & GFDL-1.3-or-later & GPL-3.0-or-later"
> LIC_FILES_CHKSUM = " \
>      file://LICENSES/CC-BY-SA-4.0.txt;md5=7130783469368ceb248a4f03e89ea4b8\
>      file://LICENSES/GFDL-1.3-or-later.txt;md5=e0771ae6a62dc8a2e50b1d450fea66b7\
>      file://LICENSES/GPL-3.0-or-later.txt;md5=8da5784ab1c72e63ac74971f88658166 \
> "
>
> SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2"
will change in v4 version
>
> SRC_URI[sha256sum] = "6de22bf1c67f7f316670d21ed1a2a32f1214dfbd3e420939ba937925c0a57a12"
>
> inherit autotools bash-completion
>
> PACKAGES += "${PN}-zsh-completion"
>
> FILES:${PN}-zsh-completion = "${datadir}/zsh"
will add in v4 version
>
> RDEPENDS:${PN} = " \
>      perl \
>      perl-module-file-basename \
>      perl-module-file-path \
>      perl-module-file-temp \
>      perl-module-getopt-long \
>      perl-module-io-select \
>      perl-module-ipc-open3 \
>      perl-module-posix \
>      perl-module-symbol \
>      perl-module-thread-queue \
>      perl-module-threads \
>      perl-module-threads-shared \
> "
I think the DEPENDS += "perl" is necessary to add into recipes, because 
the parallel build depends on perl.
for RDEPENDS, i insist the my sets, after testing, RDEPENDS your 
provided is not make parallel run normal in target.
> BBCLASSEXTEND = "native"

I think "parallel" is more often using on targets. but i will add this 
config in v4 version.

Thanks very much

//Peng

>
> //Peter
>
--------------U5WV0Am3TIbtfr4I0aI0kekR
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 11/8/2024 7:04 PM, Peter
      Kjellerstedt wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:DB5PR02MB10213B19461D7A24EC043E88=
6EF5D2@DB5PR02MB10213.eurprd02.prod.outlook.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">CAUTION: This email comes from=
 a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">-----Original Message-----
From: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openembedded-dev=
el@lists.openembedded.org">openembedded-devel@lists.openembedded.org</a> <a=
 class=3D"moz-txt-link-rfc2396E" href=3D"mailto:openembedded-devel@lists.op=
enembedded.org">&lt;openembedded-devel@lists.openembedded.org&gt;</a> On Be=
half Of Zhang, Peng (Paul) (CN) via lists.openembedded.org
Sent: den 6 november 2024 12:03
To: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openembedded-devel=
@lists.openembedded.org">openembedded-devel@lists.openembedded.org</a>
Subject: [oe] [meta-oe][PATCH v3] parallel: Add recipe for GNU Parallel

From: Zhang Peng <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:peng.zha=
ng1.cn@windriver.com">&lt;peng.zhang1.cn@windriver.com&gt;</a>

This recipe adds the parallel package, a shell tool for executing jobs
in parallel using one or more computers.

Signed-off-by: Zhang Peng <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:peng.zhang1.cn@windriver.com">&lt;peng.zhang1.cn@windriver.com&gt;</a>
---
 .../parallel/parallel_20241022.bb             | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-extended/parallel/parallel_20241022.bb

diff --git a/meta-oe/recipes-extended/parallel/parallel_20241022.bb b/meta-=
oe/recipes-extended/parallel/parallel_20241022.bb
new file mode 100644
index 000000000..e3cf0a6a7
--- /dev/null
+++ b/meta-oe/recipes-extended/parallel/parallel_20241022.bb
@@ -0,0 +1,29 @@
+SUMMARY =3D &quot;GNU Parallel - A shell tool for executing jobs in parall=
el using one or more computers&quot;
+DESCRIPTION =3D &quot;GNU Parallel is a command-line tool for executing jo=
bs in parallel on one or more computers. \
+It allows users to run multiple commands simultaneously, making it easier =
to process large batches of tasks.&quot;
+
+HOMEPAGE =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"https://www.gnu.or=
g/software/parallel/">&quot;https://www.gnu.org/software/parallel/&quot;</a=
>
+LICENSE =3D &quot;CC-BY-SA-4.0 &amp; GFDL-1.3-or-later &amp; GPL-3.0-or-la=
ter&quot;
+
+LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file://LIC=
ENSES/GPL-3.0-or-later.txt;md5=3D8da5784ab1c72e63ac74971f88658166\+file://L=
ICENSES/CC-BY-SA-4.0.txt;md5=3D7130783469368ceb248a4f03e89ea4b8\+file://LIC=
ENSES/GFDL-1.3-or-later.txt;md5=3De0771ae6a62dc8a2e50b1d450fea66b7\+">&quot=
;file://LICENSES/GPL-3.0-or-later.txt;md5=3D8da5784ab1c72e63ac74971f8865816=
6 \
+    file://LICENSES/CC-BY-SA-4.0.txt;md5=3D7130783469368ceb248a4f03e89ea4b=
8\
+    file://LICENSES/GFDL-1.3-or-later.txt;md5=3De0771ae6a62dc8a2e50b1d450f=
ea66b7\
+&quot;</a>
+
+SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"https://ftp.gnu.org=
/gnu/parallel/parallel-${PV}.tar.bz2">&quot;https://ftp.gnu.org/gnu/paralle=
l/parallel-${PV}.tar.bz2&quot;</a>
+SRC_URI[sha256sum] =3D &quot;6de22bf1c67f7f316670d21ed1a2a32f1214dfbd3e420=
939ba937925c0a57a12&quot;
+
+inherit autotools bash-completion
+
+DEPENDS +=3D &quot;perl&quot;
+
+RDEPENDS:${PN} +=3D &quot;perl \
+        perl-module-ipc-open3 \
+        perl-module-getopt-long \
+        perl-module-file-temp \
+        perl-module-filehandle \
+        perl-module-file-glob \
+&quot;
+do_install:append() {
+    rm -rf ${D}${datadir}/zsh
+}
--
2.34.1
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
Based on the above, and a corresponding recipe we have, I would
suggest the following instead:

SUMMARY =3D &quot;GNU Parallel - A shell tool for executing jobs in paralle=
l using one or more computers&quot;
DESCRIPTION =3D &quot;GNU Parallel is a command-line tool for executing job=
s in parallel on one or more computers. \
It allows users to run multiple commands simultaneously, making it easier t=
o process large batches of tasks.&quot;
HOMEPAGE =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"https://www.gnu.org=
/software/parallel/">&quot;https://www.gnu.org/software/parallel/&quot;</a>

LICENSE =3D &quot;CC-BY-SA-4.0 &amp; GFDL-1.3-or-later &amp; GPL-3.0-or-lat=
er&quot;
LIC_FILES_CHKSUM =3D &quot; \
    <a class=3D"moz-txt-link-freetext" href=3D"file://LICENSES/CC-BY-SA-4.0=
.txt;md5=3D7130783469368ceb248a4f03e89ea4b8\">file://LICENSES/CC-BY-SA-4.0.=
txt;md5=3D7130783469368ceb248a4f03e89ea4b8\</a>
    <a class=3D"moz-txt-link-freetext" href=3D"file://LICENSES/GFDL-1.3-or-=
later.txt;md5=3De0771ae6a62dc8a2e50b1d450fea66b7\">file://LICENSES/GFDL-1.3=
-or-later.txt;md5=3De0771ae6a62dc8a2e50b1d450fea66b7\</a>
    <a class=3D"moz-txt-link-freetext" href=3D"file://LICENSES/GPL-3.0-or-l=
ater.txt;md5=3D8da5784ab1c72e63ac74971f88658166">file://LICENSES/GPL-3.0-or=
-later.txt;md5=3D8da5784ab1c72e63ac74971f88658166</a> \
&quot;

SRC_URI =3D &quot;${GNU_MIRROR}/${BPN}/${BP}.tar.bz2&quot;</pre>
    </blockquote>
    will change in v4 version<br>
    <blockquote type=3D"cite" cite=3D"mid:DB5PR02MB10213B19461D7A24EC043E88=
6EF5D2@DB5PR02MB10213.eurprd02.prod.outlook.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

SRC_URI[sha256sum] =3D &quot;6de22bf1c67f7f316670d21ed1a2a32f1214dfbd3e4209=
39ba937925c0a57a12&quot;

inherit autotools bash-completion

PACKAGES +=3D &quot;${PN}-zsh-completion&quot;

FILES:${PN}-zsh-completion =3D &quot;${datadir}/zsh&quot;</pre>
    </blockquote>
    will add in v4 version<br>
    <blockquote type=3D"cite" cite=3D"mid:DB5PR02MB10213B19461D7A24EC043E88=
6EF5D2@DB5PR02MB10213.eurprd02.prod.outlook.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

RDEPENDS:${PN} =3D &quot; \
    perl \
    perl-module-file-basename \
    perl-module-file-path \
    perl-module-file-temp \
    perl-module-getopt-long \
    perl-module-io-select \
    perl-module-ipc-open3 \
    perl-module-posix \
    perl-module-symbol \
    perl-module-thread-queue \
    perl-module-threads \
    perl-module-threads-shared \
&quot;
</pre>
    </blockquote>
    <div data-slate-node=3D"element" style=3D"position: relative;"><span da=
ta-slate-node=3D"text"><span data-slate-leaf=3D"true" data-sent-id=3D"eLZ3o=
vEgyz"><span data-slate-string=3D"true">I
            think the DEPENDS +=3D &quot;perl&quot; is necessary to add int=
o
            recipes, because the parallel build depends on perl.</span></sp=
an></span></div>
    <div data-slate-node=3D"element" style=3D"position: relative;"><span da=
ta-slate-node=3D"text"><span data-slate-leaf=3D"true" data-sent-id=3D"Vd2dx=
EYMRB"><span data-slate-zero-width=3D"n" data-slate-length=3D"0">
          </span></span></span></div>
    <div data-slate-node=3D"element" style=3D"position: relative;" data-sla=
te-fragment=3D"JTVCJTdCJTIydHlwZSUyMiUzQSUyMnBhcmFncmFwaCUyMiUyQyUyMmNoaWxk=
cmVuJTIyJTNBJTVCJTdCJTIyaWQlMjIlM0ElMjJlTFozb3ZFZ3l6JTIyJTJDJTIycGFyYUlkeCU=
yMiUzQTQlMkMlMjJzcmMlMjIlM0ElMjJJJTIwdGhpbmslMjB0aGUlMjBERVBFTkRTJTIwJTJCJT=
NEJTIwJTVDJTIycGVybCU1QyUyMiUyMGlzJTIwbmVjZXNzYXJ5JTIwdG8lMjBhZGQlMjBpbnRvJ=
TIwcmVjaXBlcyUyQyUyMGJlY2F1c2UlMjB0aGUlMjBwYXJhbGxlbCUyMGJ1aWxkJTIwZGVwZW5k=
cyUyMG9uJTIwcGVybC4lMjIlMkMlMjJkc3QlMjIlM0ElMjIlRTYlODglOTElRTglQUUlQTQlRTQ=
lQjglQkElRTUlOUMlQTglRTklODUlOEQlRTYlOTYlQjklRTQlQjglQUQlRTYlQjclQkIlRTUlOE=
ElQTBERVBFTkRTJTJCJTNEJUUyJTgwJTlDcGVybCVFMiU4MCU5RCVFNiU5OCVBRiVFNSVCRiU4N=
SVFOCVBNiU4MSVFNyU5QSU4NCVFRiVCQyU4QyVFNSU5QiVBMCVFNCVCOCVCQSVFNSVCOSVCNiVF=
OCVBMSU4QyVFNiU5RSU4NCVFNSVCQiVCQSVFNCVCRSU5RCVFOCVCNSU5NiVFNCVCQSU4RXBlcmw=
lRTMlODAlODIlMjIlMkMlMjJtZXRhZGF0YSUyMiUzQSUyMiUyMiUyQyUyMm1ldGFEYXRhJTIyJT=
NBJTVCJTVEJTJDJTIydGV4dCUyMiUzQSUyMkklMjB0aGluayUyMHRoZSUyMERFUEVORFMlMjAlM=
kIlM0QlMjAlNUMlMjJwZXJsJTVDJTIyJTIwaXMlMjBuZWNlc3NhcnklMjB0byUyMGFkZCUyMGlu=
dG8lMjByZWNpcGVzJTJDJTIwYmVjYXVzZSUyMHRoZSUyMHBhcmFsbGVsJTIwYnVpbGQlMjBkZXB=
lbmRzJTIwb24lMjBwZXJsLiUyMiU3RCU1RCU3RCUyQyU3QiUyMnR5cGUlMjIlM0ElMjJwYXJhZ3=
JhcGglMjIlMkMlMjJjaGlsZHJlbiUyMiUzQSU1QiU3QiUyMmlkJTIyJTNBJTIyVmQyZHhFWU1SQ=
iUyMiUyQyUyMnBhcmFJZHglMjIlM0E1JTJDJTIyc3JjJTIyJTNBJTIyJTIyJTJDJTIyZHN0JTIy=
JTNBJTIyJTIyJTJDJTIybWV0YWRhdGElMjIlM0ElMjIlMjIlMkMlMjJtZXRhRGF0YSUyMiUzQSU=
1QiU1RCUyQyUyMnRleHQlMjIlM0ElMjIlMjIlN0QlNUQlN0QlMkMlN0IlMjJ0eXBlJTIyJTNBJT=
IycGFyYWdyYXBoJTIyJTJDJTIyY2hpbGRyZW4lMjIlM0ElNUIlN0IlMjJpZCUyMiUzQSUyMmVic=
kRQV2czcGUlMjIlMkMlMjJwYXJhSWR4JTIyJTNBNiUyQyUyMnNyYyUyMiUzQSUyMmZvciUyMFJE=
RVBFTkRTJTJDJTIwaSUyMGluc2lzdCUyMHRoZSUyMG15JTIwc2V0cyUyQyUyMGFmdGVyJTIwdGV=
zdGluZyUyQyUyMFJERVBFTkRTJTIweW91ciUyMHByb3ZpZGVkJTIwaXMlMjBub3QlMjBtYWtlJT=
IwcGFyYWxsZWwlMjBydW4lMjBub3JtYWwlMjBpbiUyMHRhcmdldC4lMjAlMjIlMkMlMjJkc3QlM=
jIlM0ElMjIlRTUlQUYlQjklRTQlQkElOEVSREVQRU5EUyVFRiVCQyU4QyVFNiU4OCU5MSVFNSU5=
RCU5QSVFNiU4QyU4MSVFNiU4OCU5MSVFNyU5QSU4NCVFOCVBRSVCRSVFNyVCRCVBRSVFRiVCQyU=
4QyVFNyVCQiU4RiVFOCVCRiU4NyVFNiVCNSU4QiVFOCVBRiU5NSVFRiVCQyU4QyVFNCVCRCVBMC=
VFNiU4RiU5MCVFNCVCRSU5QiVFNyU5QSU4NFJERVBFTkRTJUU1JTlDJUE4JUU3JTlCJUFFJUU2J=
UEwJTg3JUU0JUI4JUFEJUU1JUI5JUI2JUU2JUIyJUExJUU2JTlDJTg5JUU0JUJEJUJGJUU1JUI5=
JUI2JUU4JUExJThDJUU4JUJGJTkwJUU4JUExJThDJUU2JUFEJUEzJUU1JUI4JUI4JUUzJTgwJTg=
yJTIyJTJDJTIybWV0YWRhdGElMjIlM0ElMjIlMjIlMkMlMjJtZXRhRGF0YSUyMiUzQSU1QiU1RC=
UyQyUyMnRleHQlMjIlM0ElMjJmb3IlMjBSREVQRU5EUyUyQyUyMGklMjBpbnNpc3QlMjB0aGUlM=
jBteSUyMHNldHMlMkMlMjBhZnRlciUyMHRlc3RpbmclMkMlMjBSREVQRU5EUyUyMHlvdXIlMjBw=
cm92aWRlZCUyMGlzJTIwbm90JTIwbWFrZSUyMHBhcmFsbGVsJTIwcnVuJTIwbm9ybWFsJTIwaW4=
lMjB0YXJnZXQuJTIwJTIyJTdEJTVEJTdEJTVE"><span data-slate-node=3D"text"><span=
 data-slate-leaf=3D"true" data-sent-id=3D"ebrDPWg3pe"><span data-slate-stri=
ng=3D"true">for
            RDEPENDS, i insist the my sets, after testing, RDEPENDS your
            provided is not make parallel run normal in target. </span></sp=
an></span></div>
    <blockquote type=3D"cite" cite=3D"mid:DB5PR02MB10213B19461D7A24EC043E88=
6EF5D2@DB5PR02MB10213.eurprd02.prod.outlook.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
BBCLASSEXTEND =3D &quot;native&quot;</pre>
    </blockquote>
    <p>I think &quot;parallel&quot; is more often using on targets. but i w=
ill add
      this config in v4 version. <br>
    </p>
    <p>Thanks very much <br>
    </p>
    <p>//Peng<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:DB5PR02MB10213B19461D7A24EC043E88=
6EF5D2@DB5PR02MB10213.eurprd02.prod.outlook.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

//Peter

</pre>
    </blockquote>
  </body>
</html>

--------------U5WV0Am3TIbtfr4I0aI0kekR--

