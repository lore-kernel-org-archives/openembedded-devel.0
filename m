Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EA7DC4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 07:28:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9542.1714462094117449839
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Apr 2024 00:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=hfRSoWNm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5850663722=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43U4E5pI026455
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Apr 2024 07:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=c5pemoNxKktKHiTMKiSkKTc/fgkBWePG2EaXgWUPAc8=; b=
	hfRSoWNmZlPBgT8ujRSYe3F+kqGtX4+tP3ZSOCFAAkgceb61Yz+I/409KBpBllu3
	AgRSSWFZIqjyvYi3Ip/N7XFy77MTFslET+Wyb8MmULYQ6LCuLbZC0pEiMQcz+ZyL
	Byr4URiAeea24zszAn7z6CGhP2UQDf4J7CGZMWMUwa2Sm65VjET1LqYA+wAxy8iS
	wqh2t/JjQ+MggdRL+Z7lK6+GYPTV+vu8c5VkOQi7wtJiQhbDzU5M4ivZgIqG3FUj
	cAU93V/F144VfhXBFP08t3S5VFzDARpe2iiMoM5jbrqEUgJSYTxLhFchUgEpihMO
	gnYuM4Im9fxA0gice4QtXw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xrrb6b56d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Apr 2024 07:28:13 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 43U7SCbY028649;
	Tue, 30 Apr 2024 07:28:12 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xrrb6b56c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 07:28:12 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TryhjqdH8vAyfzejAMoJDpuf28VcZ6eOJkELyflJT2H2p0UZFlVm4dqUxxr0HHiRC0kbkycEeoy0gvMww7O1RVS29diOK/G+02gAsqp12+vE9fGQx8F/cw61u1eO2a0afia0fMRKIdlwtMjvlk3Hlmoi1EnzOOi2cx8dNCh+cabJSh2+er/tZl5TcOcgD48reUxAdW4A7i8d9jKyBpKrmsA/Av2ssL8bc97A7rXlKM/ViMbiwdS0xhcm/YpaFH5BXP1bMpKCl5NVhZd6nl+dPnKjA7xZLMHfAYcMcuEd5RqMgBjGar655FxVfZldnucd0VKyl68E3fsp9DOKNOYTtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c5pemoNxKktKHiTMKiSkKTc/fgkBWePG2EaXgWUPAc8=;
 b=a8zg6ELt94vpU2ut5TUXQeAWO9vgsJA+tYuaIZ2aveJpAG4djPafOzoMPwt4b5446zjRRTuPelAaQZUodIOv9co6y0nXaggY05YJtXVfdzIZ3kD/9orNffIAlWysAK1y4Gbb2SGk5U5GpHCvgTIR+SJbfYhoeHeBo8DZlzo8VzEsjbBpGjuPwLrJcqSeeLVTPoV71XMZgDjCrSE4lwM9Zafg7lqNWDw9WNxUpsL3mTMdwwZRbW/ti69VQhqnxqj1WkvTQVk3+MM1OVpmNiQQfe7lMRppTWvrON9btBVDQUgXqF97gMD6OPorLT1U9uN/NGITT57Dc+hIaIBJ7mHFHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by IA1PR11MB6220.namprd11.prod.outlook.com (2603:10b6:208:3e8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 30 Apr
 2024 07:28:09 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b792:3207:f838:98a1]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b792:3207:f838:98a1%4]) with mapi id 15.20.7519.031; Tue, 30 Apr 2024
 07:28:08 +0000
Message-ID: <97b9c07e-0d17-4c9b-9449-212bc9ee78f3@windriver.com>
Date: Tue, 30 Apr 2024 15:28:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][kirkstone][PATCH 2/3] python3-pyyaml-include:
 switch to pytest --automake
Content-Language: en-US
To: Martin Jansa <martin.jansa@gmail.com>,
        "Yu, Mingli" <mingli.yu@eng.windriver.com>, tim.orling@konsulko.com,
        Ross Burton <ross.burton@arm.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20240327071636.2207445-1-mingli.yu@windriver.com>
 <20240327071636.2207445-2-mingli.yu@windriver.com>
 <CA+chaQdkCsa2P-qJ5A-fQ5=n-sAmeHXLooBW3nsbrrLHPgSLjw@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <CA+chaQdkCsa2P-qJ5A-fQ5=n-sAmeHXLooBW3nsbrrLHPgSLjw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR06CA0227.apcprd06.prod.outlook.com
 (2603:1096:4:68::35) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|IA1PR11MB6220:EE_
X-MS-Office365-Filtering-Correlation-Id: fde288ed-5de9-473e-f190-08dc68e71587
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MHBsZHp0SmRTQjJQRXNPZXlzSnRSWEswUmlNRGh6WGo4Q3J2RlU4WHhwMHEw?=
 =?utf-8?B?RlprNmRTR2RJc2cvcUJyRTNpM3JIK3lGc3RvN1VsYWhIOVVGUFZoM04xemJE?=
 =?utf-8?B?bmY3WkdnNUl4MWxlWEFxU3g3OVcxMzd6TnJDeDN1Tmp6THdqbGt1N0Rjd2l1?=
 =?utf-8?B?Q1BBMGloa3NJcE1heGw0amF5cklaYXI1YVRWL3Mzci9lSlc0RnRDb1lqSVE0?=
 =?utf-8?B?OFpQUUdpMlArS3dvMjVQVithMXNZalpTSjI5cFJ2KzRtZ0k0Z25rTGwzUnln?=
 =?utf-8?B?Z1pEK2g5MXg5bjlqc3E3RldmUDVZS3Z2WkFEUGNxSDZCTERQUUFZRVJoVFJI?=
 =?utf-8?B?NUU2LzNIaDJ6b01YNzRoQldmMVVSeXdsWXRSV0RKZWQ3U2RvZkNmV2lSclhS?=
 =?utf-8?B?N0h4R3paMGN6S0Q1VGlILzhxeFZMVmorNXBmWGloUFFiUU45K0wwVlFtSnVR?=
 =?utf-8?B?SlZLUkZiTkdYNzUxMzJ4ZjhxOGk1UXcyUGh1OUlhNTNjRWVEWTdFbG1ub3Rp?=
 =?utf-8?B?Mk8xRWZvY3JnMGhma2dIWEdxbEo2eEg4M1hzR3FnRE9uQjlBeFNSZVN1blU5?=
 =?utf-8?B?dHd2TmxWdEUyUWx6OW9jcS9zQjJORVBsYlhnTGttZTUrK1FNbm01UVhTUlpC?=
 =?utf-8?B?UFpWZzY4ZDl5RDd4T2svdm1TQU0zaFEvbnR6M3JWektGL1ZaOHkzcS9FNXJl?=
 =?utf-8?B?dlhQZXRNOTJoR1ArSFJLSk5BMzVMNzRzdDRWWFoxdFZtTXlVaHFLTC9DMEVO?=
 =?utf-8?B?WHZXMUNtSk9lOHczdmtTY2VBUjVnb0pQKzJibHlNendRQjQrQXdpV2svVUpl?=
 =?utf-8?B?SFA3UkMrOTU2WHZOdUNkMHpBWDBiYUErMTZXSUd6eVZqTVZMNyt1SkFpdk9n?=
 =?utf-8?B?WEtrQ2F5TGNETE1tT0thc1QrOSt0Z3A2RFZwajI2aW1WMDhvV2J2NkJQKzh6?=
 =?utf-8?B?RnF1TWdpaHRHUkFCckpkZHZPUGdHY1dBbnhkbExLei9RTWVPM1Z0UFdxQ2M1?=
 =?utf-8?B?eHFaV3p4WUdwSjZHU3Q5YWJmNjluQTFrVXNMb1Mwd3dLMDBKcjFUQjZ3a2pz?=
 =?utf-8?B?SGNFZlZ5endZbHJLY2UyZEF3UXlQZHlDTk1vQ3czdmpZM0g0cjdvM29QVE1K?=
 =?utf-8?B?Y0N6Q0hWMVphNm1BVEgyN2RxZHFyZ1pmUEY5TTZXUW9UdmxWOUdFdzB3OW1v?=
 =?utf-8?B?SXJ0VHovTkxEWmkwN21nZDhHZTBRU2Y0WWFoOHVKL1llTUUxQzJwcFJzb09q?=
 =?utf-8?B?dzl5YU56TlpDb0tjZTF0VmJDclYvVXJORm5CYTcwRjRkRFBoelFteVdDQ1k1?=
 =?utf-8?B?UkFheWhpbmcrNUtscytMUDkxVHNOM2pVUEFWbGdZV0locWFOd0daTDRtdFNZ?=
 =?utf-8?B?UGQyWW5Hc0kzVk8rWWhSdVFFVmtabzBGak9peWtkSFp1YURmWWNibVdGcTNN?=
 =?utf-8?B?SE5haitFZXp1eGRQd1AzYUZaYTNpTVlyRVJNZFByZnp4QmZXbGE4cnRZcFNo?=
 =?utf-8?B?akYxeEowT3RkY05CNnV4Qk5oZnhFR3ZFclRlbjFCTzlzUHBCMCtQcVlKbHZu?=
 =?utf-8?B?VkFvWVFQWGkwQno3aVR3amJZN3d1azl6Slg5TWs0VkxOZWpEUmZMRllRSnZO?=
 =?utf-8?Q?76AJu585AW21W9MJibg00xG7Me9+LqY+fKHk0rnkm0Cg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cWFJL1FkRjZHQVNEV2d1N1hnWXhheFhlSjhoMFVmcUhUa2VXOS8vZHVxL0JM?=
 =?utf-8?B?c3BDQjFrV0xtU3RBMklJdXVPUGZLdUswVGY2SHhTYXowd1lxcGZUQkoramJJ?=
 =?utf-8?B?RlZjTnRyM1Y1YmJDNlBCYkpJbFlRUmpxRHBLd0h2Yk5xWW1pa0hrcXY2VDhi?=
 =?utf-8?B?NTRVL3JKK3pPYmZ4YW1KNXhUT05UUm8zRUpVQTlrVzBIUmhYVy84VzlpU3hh?=
 =?utf-8?B?NmpReVZNa205VVRGZVR3aXlHVnZqanlTZ21DZTdwSUpLNFR6V3QyejhwMG9x?=
 =?utf-8?B?MFYxZjl3TEJFYnF1MmxvQVNkNjdrY1NSTnF6NzB1azE4Mk11TnRkYkxFalJo?=
 =?utf-8?B?V3RoSG84aXQzaVk3SzRqZytVcFpCK082MkN6QzM0KytVK3lPWUNjQW9ENXI4?=
 =?utf-8?B?Z2pUNlY1eU5GQldwSnVxZzRYUnFKemVYdlBRcEhDY21xOW9aWXMwL1dhS3Fw?=
 =?utf-8?B?M0NlOUVnalRtby9QRGE4MWdCWm45Tld0MElpZHpuclNELzdwb0FySVhhdjRy?=
 =?utf-8?B?RkRaNmFjaTBkblh1NFNQM3d4bzY4OFhTTk5hMVhmWGZXTytmVGMrSThxS3VQ?=
 =?utf-8?B?TEw0cTRDbktVeUFrQy9DdFRpeEJtNEJtSnZyYUNkYW9IMFN4dDlFV3hqQUdH?=
 =?utf-8?B?cEpJRzRXNDhPSzFOQUxlU083bTJoTnRRY3V5dTFMWkNWdFJ0NHp2OUQ5NkZo?=
 =?utf-8?B?YjRMaGRVSGFqVEI4cDU3aUxwZlRMWDBYVkVGVDZQeGxSOTV1NTF6bnBZdnpU?=
 =?utf-8?B?ZzBBZER0bjRmazhnd2RHWHlUY2M0alUrTjV3TXYrSGhuZmZGMUJoVVZFeC9D?=
 =?utf-8?B?V0RGWWx2aVo5TWN0Nm5scFJvMlVrS2RISWY3em1YbVgvQjVFN2VHZVdpejcw?=
 =?utf-8?B?bDdXUHo1NlI1RWNLNnBNMmUycHhneDlxaUNha25BK1ErTVg3VU5ZQTJqN3Fn?=
 =?utf-8?B?Z2ZvN3Q1OURQSEVhbEoyVHBSSWpYYk9ETE9rK3FDNlBaa1VzZDZQaGlwSXBx?=
 =?utf-8?B?TGFnMG9GSjdWaXJ4Z3pvakFQUGFOdGdrNUcwLzhldUFJVis0RWpmR3oya2Vv?=
 =?utf-8?B?U3lDa2JnQnRCaEtXSm8yZWQvRmQzS1hIL1JPWnppUk9yNW9kKzl4bytMYUY0?=
 =?utf-8?B?aG5wYzd5Nzc3UGkzeTdSODZWOEZaeXA1Q3NZdGJsRzZFei8wNnd0UVBYbUZC?=
 =?utf-8?B?aDcrRWZseEUvU0orWDVONXhoS2dwcktqTXQ2a2ZtSlRpS2NpNktpYkpXaTZ5?=
 =?utf-8?B?ZFJBalp4d21BU3hxTHg5amN6U0FoOXdSL0Qra1ZYRTZPdWhiZEptMTZ5alhn?=
 =?utf-8?B?Y3R2RVJ2bDFuN0FWb0UrWE9CUHB0SExiOFhzcko2NTJJaWRjU2d1a1B4SWVa?=
 =?utf-8?B?WFpaeGpkbEt2ejFVNnZzK3ZXd2RKWHR6K2wwZ2x1M2dmMUJEZUZ3QUNBc3Fa?=
 =?utf-8?B?V2pQUzlvUFdhM2wvRmJTdHlSUUR5cytjeThpRUpKTVZRU20yRE5ZTHVjaXpU?=
 =?utf-8?B?eTBSb3V3L1VwK0FBY3owVWNlOEh6UUxPS2FPN3JDQlhUT0FHeS9rajV0RG12?=
 =?utf-8?B?SkhLT0lFUzhqb2xsYXd4WHRPRWU5Z0pZUktvOVROV1lMeHRwMlVvc1BoamEr?=
 =?utf-8?B?dFJjVE9qUHFvYlBIekpQcVNYMXg4UWVodzhEaEpKMlNNVTdKMFJxRkZadVFa?=
 =?utf-8?B?M2NpSk9GaUpvbjhiTHVJdCs0amx2T2p4bms2bk5JY1BWL2ZNN1VFbG95MFUx?=
 =?utf-8?B?Y0dwalcya0dvRy92T0I4c2laeHcyZnVPOFBFUXNVejUwQjZpT2tQVlErdm40?=
 =?utf-8?B?SkkwRnBGcTZyTlpSWHBwbFRvVjVmd3FSMmxZL05FNnE3dzNIaFZqdmdQQlVq?=
 =?utf-8?B?TzRpaVVBdjZ2aU1QSDdoQWx6OXQxWFh0ckM1TzVIb0E2b0E3ZlJITGFwZERR?=
 =?utf-8?B?QVhqRlZyVUEzOW8rbndIRXdmUWRuOUZQNnpMdFMyN1pxaW9yMHM2ZW9CVmho?=
 =?utf-8?B?a2Vvczk4VGxtdTlLZWh1NnBIaDF3N2Rlc3VheUMrdVptMjhtcFVBbGJrMWxL?=
 =?utf-8?B?R3VaNWVwK3ZGTkFzZTc5VEE4REF3MC9VaVZldnVNYy9rZitOOGVhbkRBREpJ?=
 =?utf-8?Q?z7ajQE5az1SxBPxplEM1wVhyc?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fde288ed-5de9-473e-f190-08dc68e71587
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 07:28:08.9414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VxMs6ylYPWQeat3jUpDvegr48+IJKDvKep5mMfx93ioqGaCXiVAgdHBOMirKsWHjHgtwiiCQLDSxd6S0FXga3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6220
X-Proofpoint-ORIG-GUID: 9LBzK5PijKERYZ-DzbnfNt5sN6-sN_uf
X-Proofpoint-GUID: Q6idgELsr6LJmcewE_0XKYOXo2M0dCaZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_03,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300053
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 43U4E5pI026455
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Apr 2024 07:28:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110192



On 4/30/24 15:16, Martin Jansa wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>=20
> On Wed, Mar 27, 2024 at 8:16=E2=80=AFAM Yu, Mingli <mingli.yu@eng.windr=
iver.com> wrote:
>>
>> From: Tim Orling <ticotimo@gmail.com>
>>
>> * Also replace ${PYTHON_PN} with python3
>>
>> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> (cherry picked from commit 182f31a182f6572a3538b875cec7ee761e2da1e6)
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ...
>> diff --git a/meta-python/recipes-devtools/python/python3-pyyaml-includ=
e_1.3.2.bb b/meta-python/recipes-devtools/python/python3-pyyaml-include_1=
.3.2.bb
>> index 9bfaa2194..3a5bd99a7 100644
>> --- a/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2=
.bb
>> +++ b/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2=
.bb
>> @@ -2,7 +2,7 @@ SUMMARY =3D "Extending PyYAML with a custom constructo=
r for including YAML files w
>>   HOMEPAGE =3D "https://github.com/tanbro/pyyaml-include"
>>   LICENSE =3D "GPL-3.0-only"
>>   LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd32239bcb673463ab874e80d4=
7fae504"
>> -DEPENDS +=3D "${PYTHON_PN}-setuptools-scm-native"
>> +DEPENDS +=3D "python3-setuptools-scm-native"
>>   SRCREV =3D "36b6975aa8fc7a6cbf37de40aa2ed6d996b2f7be"
>>
>>   SRC_URI =3D " \
>> @@ -20,9 +20,10 @@ do_install_ptest() {
>>   }
>>
>>   RDEPENDS:${PN} +=3D " \
>> -    ${PYTHON_PN}-pyyaml \
>> +    python3-pyyaml \
>>   "
>>   RDEPENDS:${PN}-ptest +=3D " \
>> -    ${PYTHON_PN}-pytest \
>> +    python3-pytest \
>> +    python3-unittest-automake-output \
>>   "
>=20
> This was now merged to meta-oe kirkstone, but the
> python3-unittest-automake-output isn't available in oe-core kirkstone,
> causing:
> ERROR: Nothing RPROVIDES 'python3-unittest-automake-output' (but
> meta-oe/meta-python/recipes-devtools/python/python3-pyyaml-include_1.4.=
1.bb
> RDEPENDS on or otherwise requires it)
>=20
> python3-unittest-automake-output was added to oe-core in mickledore:
>=20
> openembedded-core $ git log --oneline --
> ./meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb
> db0e82135c python3-unittest-automake-output: upgrade to 0.2
> 961e4f3fc7 python3-unittest-automake-output: add new recipe for ptest
> integration
>=20
> Please revert this (if the newer python3-pyyaml-include works without
> this change) or add python3-unittest-automake-output to kirkstone as
> well.

The python3-pyyaml-include did works without=20
python3-unittest-automake-output, but the python3-pyyaml-include ptest=20
needs python3-unittest-automake-output and I also sent the patch to=20
oe-core(kirkstone)[1].

[1]=20
https://lore.kernel.org/all/20240327072236.2221619-1-mingli.yu@windriver.=
com/T/#mda91919809cf156aba24f099bef65142067cd318

Thanks,

>=20
> Cheers,

