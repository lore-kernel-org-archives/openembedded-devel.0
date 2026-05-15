Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 398CFCD343F
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 05:55:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28861.1778824528391041605
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 May 2026 22:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lF+0Dvyp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9595c36ec5=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F3wbFe1433873
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2026 22:55:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=3DGb20CwS0w9Jfx/NJtCnuA2y8tjtVB6e2YVZuP7WS4=; b=lF+0DvypBcbp
	+UbCx6cxEtAUq5CmSlkqNNYSvyJRl1R2M291ixFgB2NvlRDIoSkAjy0qCUhusho3
	KfNOBud5wUtJK7lje4XxAeN0vFnHL7YvGhOeyqLJicNlNGTpJng5r0/jiIdKEAQi
	H26IFlL7eHfL9AO4tt6RiYAItIfe9JDdoIP1aNX45+6T6PNBNViq9o9W+anV2GaW
	N161KNlGLgDi3zjgvIA8Ny5ro3uNnlpxNXimZgXBL6LzHCBdinSLjJF2L7jYh673
	JwEsGr8wCNVySkv8HrurzVDj3Zs89vxIX43JaM7C1zvPnrgtp374K0mxKrY/roHT
	EWMCMe8PjQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012011.outbound.protection.outlook.com [40.107.209.11])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e5m688g35-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2026 22:55:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MKlnEzLKeldY0GizuxTt+hgvBrH9XLNCEy3h5XNjSzfo6vTUIx3ILbcuQ9FAaojKsIwSle2Sb0gXR67fLQh7aVXgC56GASKc/mRSF2YNv11zMXrJgRy2HSz2AA41eKyceDzj9hEHVTEbde+2xjtuchaQcz5eNdq1Vfw4ME45fEdn7pJVWgd5vpJdf1Z/SxRDE93zklJ0T0Y3S03e+voGpRXLMxZ9GVakLrDW5+DCfzehxGxYfzx4nxc7DJzDaxBCnjOwYsPhVCC8EkCFwI2E8bF+9Fn04h5z4baPMpj7v07/ZEkID041dr/MJJDGqqoj0EBvlF7nn1kofwftAWJlPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3DGb20CwS0w9Jfx/NJtCnuA2y8tjtVB6e2YVZuP7WS4=;
 b=HoXRanQA0KyEFOXSIo5NBG72ui0mikWuqIRYtkNM0E8JQ2wJpG+UgRBS/8dPRHTUoLqySYfxvRh8FCKbsGSiv3FYybPI2wd0ux0bUm2qYv07jF7O9mPM6L9W1oKPQwhk5E3Y0v0x7RAPovzHLH016efzvjI+Ocxkf1ctWurIHdkPcP1MneAS4IX2g/CYZerj4qcwY4t7pCDSVii7DqMw7Ahary1gXJMq0ioV9IIgWdIkHDZv/zTfsAg2LJvWlNRGF65h4wBMEJLYEiehfh7KV9vI1uh6Aji0NYbDnngdiXidUMqGzGdM8wR+LpL/kKkeBT52L2Bn88Z6h+EcmsUbNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7621.namprd11.prod.outlook.com (2603:10b6:8:143::16)
 by SA1PR11MB6613.namprd11.prod.outlook.com (2603:10b6:806:254::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 05:55:24 +0000
Received: from DS0PR11MB7621.namprd11.prod.outlook.com
 ([fe80::b070:218b:b122:bf1a]) by DS0PR11MB7621.namprd11.prod.outlook.com
 ([fe80::b070:218b:b122:bf1a%6]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 05:55:23 +0000
Message-ID: <420b0723-0ec7-484c-a5e2-9de3c279b36f@windriver.com>
Date: Fri, 15 May 2026 13:55:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 2/2] 7zip: update CVE_STATUS for
 fixed-version
To: openembedded-devel@lists.openembedded.org
References: <20260515054814.107161-1-hongxu.jia@windriver.com>
 <18AFA7182C9F01E9.2716283@lists.openembedded.org>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <18AFA7182C9F01E9.2716283@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR03CA0125.apcprd03.prod.outlook.com
 (2603:1096:4:91::29) To DS0PR11MB7621.namprd11.prod.outlook.com
 (2603:10b6:8:143::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7621:EE_|SA1PR11MB6613:EE_
X-MS-Office365-Filtering-Correlation-Id: ad8a370e-be20-45e0-8549-08deb2468e4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|1800799024|366016|4143699003|18002099003|56012099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info: 
	wMv4Z6hesJ4wYMZaklkYwdMsZmTYpDkbWE0oTYcR0/mnGghmeMSYjBX0T5whLW+JewB8vGjX9KY3hTBUEkfrxU9kdvTv8Z3hyLvkk8TWUUHkGgOM+GROVX88wPA/5hJgS5Oni/GshKO5QUgej378snJ9O/jU5L7Ug528cCeapAn4RBWgMoTdDAsBCF5pLi7xvcEPUW8RA+hKg3u2cXMdFyygziDKwX1K7/t9+iZnMgkqzGaWXUZjad67cWbZ20WcOqsins4diMmy4mUq6vzQOHhn2sIJHtb4rWf3g8QfjT07Jv29kjt4/jHoJ4qQL/dVrQ+l1GZiDFLyuyJuMv71xj6O9V4bokhJAVpzECK74kRrFTcMsE9LvVi1ltJIkl5pepdBjsIB4bf/3rXMtsLczTsW2b3a85V/rNkJI2dsirHlFmdPSlKUj86ls8RD00uvblTyPPJAPpFFQVUQmEd21okz/Mo9jpuVHzZ5RssP5ZIZOsT2XG9JvK2/o38uoWGAVUudvF7LMTCJhPRst0Tge0XJDa48THyIiHRiYsuS2IuVTDKDRMNyPEhbYk//v++oFkqdxairp5teR1nT0G+H0qZHm9Las6ifFWDUDCy9H8PMaY8bg9t339eyzLJ3XeFDQMESBNDoRSk8puMDIPVfjg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7621.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(366016)(4143699003)(18002099003)(56012099003)(22082099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?andhbUt6U2pnWFV2Mm42c255Rkh1WVFuOGZ4NEVZT0pYajBrYVdLdjNGd05L?=
 =?utf-8?B?V0pvWG1GL01BVVpSVlBveExvUnVKSzBlV1BCK3p3cnN3SXk0K1ZzNHc1NmMy?=
 =?utf-8?B?ZTNpVm9hUG9RUU41STI1S2tYdmJ5QWhRbkk0bTdZSDVFZUMwZ2E4TkxwaWlP?=
 =?utf-8?B?NlNtV3djNWJLbnRvN1B0dk03bDJtRGt4aGRhV1lacUZaZzgxR0pHVTczWTJ1?=
 =?utf-8?B?TzhUQnNtQVpRQXh2Y2FOZ2hac01qSlVxOGVlZ2lmMzFqNitXSUhIRjdZSHZq?=
 =?utf-8?B?bG1rYUc1cEh3Z1FVdEtOckk2bTZZWld5S2xnOWsvcUlFTU4rTlFNS29ENms5?=
 =?utf-8?B?QlhnSGcwTUdDZVViWmV0QVc0OVhiajRlZXl3RzRCNkIveXNSeU0zc05BdXIv?=
 =?utf-8?B?d0ZMQkVzQjA4UHBhSGFpOWZoWDJ6cWlOeW15Z2x0NUJDMFRudGZrbTFMV29y?=
 =?utf-8?B?KzMxMUZlR1JwQklqZ3p1TlRKQ01PYW5TdEpSRmp0WDk1bTBnRElJSzRmelZC?=
 =?utf-8?B?bStCQk55NVIwUEJOUGhDMXZUVTFhRERqamFPMkxLY3AzRlhSamx3eEYxV01N?=
 =?utf-8?B?ZWx2cm5kSWRaYU9TQzludUNuekJlcUhBN3VBWTEwR29rV3JNVXBaa1hKdjk1?=
 =?utf-8?B?VzFyUzlhT3Bqbmt2bTA3TEFmd1VJbmYxTExZZ1JIcHJXMGJjU280czNvQ2Rh?=
 =?utf-8?B?MFJMMWlqMThQd2F6Tk9wMWFJYTI1clpzd1NiN1hIaUVBdXhyOWNncnp0QjNT?=
 =?utf-8?B?SDVQWTJSRVlNdEt4cTBFWXVkRnZTZkRXSlVVaW9JbURrMkhLNGVDakJoWSt1?=
 =?utf-8?B?SFRUQ2tMbS80S201RGhuZERFcVB3QVM0ZXZVanpxSUh5dDlackJicWx2R0pM?=
 =?utf-8?B?RUsweisremI5QTlBQmNaZktwdGRNdVFyK1RsakF1emYrS3JmdjBWZDhoNHdj?=
 =?utf-8?B?cmcxS0N2bk90dmZSYjc4ZE9qM2RqaGh1SGc0eXg2R2ZnMEF1aGFmYkdVL280?=
 =?utf-8?B?d0oyMGxnTHdRMDhJeDJxVmhSU0wvVlZrVkJzMFdHZ2s0SlZOTkEwaG9FdVlT?=
 =?utf-8?B?TTg2L1Z3U2FVTmRwOFgwUnAwZlZ1TlRod2NHK2JWSStRYWc1L0REYXdjcDh3?=
 =?utf-8?B?WXhncnRlSlhZemJmekh2UkRLY0pKUDFWT1NLQ25lYTNER05uM2t5UlVzbSsz?=
 =?utf-8?B?ZkhIV0pKeGFVK1pqeGdObEpyOWU0ZEtPeE02aTloN1lHT011RTAyVlpIQVpW?=
 =?utf-8?B?c0cxWlAyNFNCcE1maXMreTl1M2U2SklKNWxUWHh4bGg3QW5QZklXeUdqcG80?=
 =?utf-8?B?eEZKUm5HRVluQVo2YVA1RExnd1QrU0JnODhmbG95d1cxR1pFSXJZdjRTVVpz?=
 =?utf-8?B?bTd3UWRRbEJOdGdLV1FIYzk5UGdEcFY4bmVGR3g2M2FEY25qUGlwQkcybzA2?=
 =?utf-8?B?eklMbitzeUpscHplMWgxWnhLRXFMandWbllCa3dRUmdDVEdoRlAwMElka0pz?=
 =?utf-8?B?Yk5jVkZUQlhadm9KMW9qQnNLRjZkOWl4TWFIeDJpaHgvSXk4eUxtcGJKMjhF?=
 =?utf-8?B?L1ZjbjJnckttQTl5eXVxMmdHa3FMTW1uQ0pXNGl3cnVqN3Zaa2F3alFaS2Nq?=
 =?utf-8?B?R3RpUURQZ0swa3FodVZyN213L3B1S3pzQkJLYVQwc3hRUkpwZGhsc0FDeE9r?=
 =?utf-8?B?YjY1Z0ZZTVMvaXZEZTl2NkZDN2p0bjRFQm9ubGFZNG4zSi9laHBLeTJkcVNz?=
 =?utf-8?B?RGxxcFl4dG1Dc21kU0tXL2lqeE96ZUpxTEZubisrL3VBc0EyWGdXdmcvWjZT?=
 =?utf-8?B?MTRYMHhYOFZYdzBBUFBiQTBKV1paMjlzWXZJdUU2bjhVMlRwZ2RSZlk5WGR2?=
 =?utf-8?B?U1VvUmN5ajFKazE2T2hRN3FtREZUemhkaUNndnI3dWRTNzdySVpia2hBMURU?=
 =?utf-8?B?bzVrbFVwRW5CQTdRQnNUMUNsbyt3b0orTkxKZ05rc3Z4WFFlV1Jva2tvSGto?=
 =?utf-8?B?c254eWdOZWFnR0E4Yy9HQ1l3dzFHcHVINndLMzFTNXJzZTV5UDFwb2QydDhk?=
 =?utf-8?B?Y2JiMkdzN25BOTBSKzNHUW1wODMwVDhQcEJuNC9NUStXa2FESFVPVGNUbXY2?=
 =?utf-8?B?Tm01WU9TM3B6LzBsUVp0SWVzS2JEeWJYZUM2M0JRMnhoN3k3dG9Mdnl6MkRK?=
 =?utf-8?B?aWJmZ0FYb0NUbk5zZ2Y1V29OdmdBbU83QmkrajFTMGFiUHNPZXM1QWpYai91?=
 =?utf-8?B?QWVURUwwVDd1bkd4OGZ3RHBibXY4aDVmaDRHN0d1TVlveVhGZWZMMGQxWHVy?=
 =?utf-8?B?U2o1dW9yU3BDWE5vbzVJM3JkRnVXc05Ed0NUWUtSWEtSZm9JRlU4ODZZWkZH?=
 =?utf-8?Q?HNsONL+1vihavbaQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	oz4Ltb2lWWapYfqEC+JnKMwzUafLNbfUiuqB3oFKkgGv1+oFWzSUWJX8/ewhUbT8jfteL+oSM7RemPHXD8l4zLpvYNRGA217dCXpz9GtrmIwZKrXFSWdvX/pi5mrI9IYSUvG4Ie6DHBaSnnSNbL4LDnQBKDEPiE44osTxs92yVabIF4bkp8/H6KIr5AkYibvPHdRrK20Q1kMTcPUua2s2zjnb/nfhTwZTmObAldExqUQ4X8yWeJFr+SqCDy7NmmF2K2fkGEQrdWvIuF4gZ5ywFriG3r6ogQRDyNVXXYHgWdR1tMkQ8XX22MA6St1tpLdK42xwOOjzeWtwvTPh23B9A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad8a370e-be20-45e0-8549-08deb2468e4c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7621.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 05:55:23.9273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rcX3cFtm52lGfp6tcco5G15LJEAp6Bdht97uWNo/0/mJwg+KwlFtMJsfe5+I+D8pILBLEUjrgdhALlEGbXs7kz/RrLaIza6myv5lLA5Unac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6613
X-Proofpoint-ORIG-GUID: JQm24hcWbEpQLNLUDTW7e796i2dSfSyM
X-Authority-Analysis: v=2.4 cv=GoZyPE1C c=1 sm=1 tr=0 ts=6a06b54f cx=c_pps
 a=q3M5bEXgJc9IxHNyMLvWsA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=PYnjg3YJAAAA:8 a=FP58Ms26AAAA:8 a=fZPMF-2OAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=TSbLfRz4HL6ul95J9WEA:9 a=QEXdDO2ut3YA:10
 a=O9lCZVmNj_uBxb2n18d4:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: JQm24hcWbEpQLNLUDTW7e796i2dSfSyM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA1NSBTYWx0ZWRfXxwKxup3Oj/gG
 fucJvaNKqYd3zmBLtL/3dHYBSWDtPqjMiaHUjQZjH8e1gJR2Ain8dddrvIVo5AeshYF6j4MUanG
 YPH4TEgZb3tdoH0agYnotIE9brgO8prGXGwKzPhbfOMwjeZWsJzrZracku+BXS5klGfAXS4Zuwv
 9frCCVbo5Qvq9O+YgiK7TdkgSBtdWMFfCLA7dSupwsVOsKzaOTP3HgLVMAo5+kHGUW6US/9WhcZ
 rb/qPXhAtS4BB4g1nk5BUkulthw5msa/ftdsVcJOEwEkW12T2drXnQ2XW+fXmp7sZgmMn5X/01U
 YYKh0fvvRdnWMl27cDYZ2g/cr9ParA2uI8vSmbIJ6kgsQfKnmCEKvjfrxrGikgUdfOy+BxMPjwV
 HB9ZZi4f8UxY7Ez5wZHfrHauFIfB5+xgWvUmOlGg1Idh9/mhG9bhLTO5xtbEwWiSdT7NbaPCqMf
 MZFDuAHfPQgwip4kyfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150055
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2026 05:55:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127002

On 5/15/26 13:48, hongxu via lists.openembedded.org wrote:
> These CVEs was fixed in current 7zip version
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta-oe/recipes-extended/7zip/7zip_26.01.bb | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/meta-oe/recipes-extended/7zip/7zip_26.01.bb b/meta-oe/recipes-extended/7zip/7zip_26.01.bb
> index 61be89c7ba..3fc3037bcc 100644
> --- a/meta-oe/recipes-extended/7zip/7zip_26.01.bb
> +++ b/meta-oe/recipes-extended/7zip/7zip_26.01.bb
> @@ -68,3 +68,15 @@ RPROVIDES:${PN} += "lib7z.so()(64bit) 7z lib7z.so"
>   RPROVIDES:${PN}-dev += "lib7z.so()(64bit) 7z lib7z.so"
>   
>   BBCLASSEXTEND = "native nativesdk"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-47111
> +CVE_STATUS[CVE-2022-47111] = "fixed-version: The issue was found in 7-Zip 22.01. Some later versions are unaffected."
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-47112
> +CVE_STATUS[CVE-2022-47112] = "fixed-version: The issue was found in 7-Zip 22.01. Some later versions are unaffected."
> +# https://sourceforge.net/p/sevenzip/patches/417/
> +# https://www.appsecure.security/vulnerability-database/cve-2023-40481
> +CVE_STATUS[CVE-2023-40481] = "fixed-version: That bug was fixed in v23.00."
> +# https://www.appsecure.security/vulnerability-database/CVE-2023-52168
> +CVE_STATUS[CVE-2023-52168] = "fixed-version: A high-severity vulnerability identified in the NtfsHandler.cpp NTFS handler of 7-Zip prior to version 24.01."
> +$ https://www.appsecure.security/vulnerability-database/CVE-2023-52169

Sorry for the typo, please drop this and use v2 to instead

//Hongxu

> +CVE_STATUS[CVE-2023-52169] = "fixed-version: Relates to the NtfsHandler.cpp NTFS handler in 7-Zip, affecting versions prior to 24.01."
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127000): https://lists.openembedded.org/g/openembedded-devel/message/127000
> Mute This Topic: https://lists.openembedded.org/mt/119325752/3617049
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [hongxu.jia@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


