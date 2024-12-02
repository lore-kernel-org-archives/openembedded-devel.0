Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE211D4979E
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 05:35:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.167853.1733117743351664732
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Dec 2024 21:35:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2066b44c8d=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B251rDL016411
	for <openembedded-devel@lists.openembedded.org>; Sun, 1 Dec 2024 21:35:43 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 437xv7segv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 01 Dec 2024 21:35:42 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4B25ZgWI031678;
	Sun, 1 Dec 2024 21:35:42 -0800
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2047.outbound.protection.outlook.com [104.47.56.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 437xv7segu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 01 Dec 2024 21:35:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=laVyJvDnSPWeACQfpEsxSxHxWAIFtMd1cafYyox3xq9O61DdcC350mktBesbaQ4F0G27h6qVDJdNZiw0U1/4RQVj/Yw9I6T7kPgTF60rQuDGwJZiccHSfUn86FggRz6mGjIjMbdQc3SI833zEjgYqkDP5dcYxPgpRj9pPRWMNYqZOY/dlLxmrVcwZC2DWWE7RoUXf5CYyL/hgWac9ojJ4PpG9S8EMNm8Yg7KTPs0m9l7gC6lbSCnZRr6U+CqP26YfMwZlOYfgHdBzjttUZqkSc1PBQ9BGYCz0PLgd8kt/S4zPnlWRip6E+qwq21HM0NIHPtJ0jKHs4l2kmYNqIjwdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HsKb1HK4zRbXVnnIqcSCDMzSnCQ2F0GeFxX5RkRdrbg=;
 b=EJFZQx/axfsr5+XeKhH8/+3zCnc32fEyBoKxP/uM6/LZT0Ql/ijdoI9dbdmOLHjZHM2HgJ3IDYNkLHsmRy2YYBJZ+tj/rg2JzpxDpruiJO1BPBgAgWNaJoRnDROPuw7d7hjWt/G5P5MTe14cLbUGce+1jOjlTKSHwnhzsJaThSulcZvwPZKvqD4UrMMh7Mmyygln77eaEVNi+htK9o/QahNiCgU0CgXdgZp12BynWhTJsECtdnSQHe7DXeY49EHmoG+0CCXWWM8ZU4Aka+IUX1PdwEr4XIxGr2gOKNZ8R2GSaAyBhBMqa4LpdYeMV6WG5K96V7Tg0ZycdGVGI9b6Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB7641.namprd11.prod.outlook.com (2603:10b6:510:27b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 05:35:27 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 05:35:27 +0000
Message-ID: <abaf94d8-0f87-4011-81fa-e2aa688e011d@windriver.com>
Date: Mon, 2 Dec 2024 13:35:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to RDEPENDS
To: peter.marko@siemens.com,
        "peter.kjellerstedt@axis.com" <peter.kjellerstedt@axis.com>,
        Yi Zhao <yi.zhao@windriver.com>, Yi Zhao <yi.zhao@eng.windriver.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20240922073618.1359707-1-yi.zhao@windriver.com>
 <DB5PR02MB102135305A71D2997E959868FEF6F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <202aa218-94f5-46bb-a514-6118ad457078@windriver.com>
 <DB5PR02MB1021337FE7EFF0AE0B9BC1CB7EF772@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <AS1PR10MB56979DF6B1DA72BE50B9D217FD772@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <180D44A5BB7DBFF8.7301@lists.openembedded.org>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <180D44A5BB7DBFF8.7301@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TY2PR0101CA0039.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::25) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB7641:EE_
X-MS-Office365-Filtering-Correlation-Id: bd2c95cd-c4c0-4bff-bd46-08dd1293205b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|4022899009|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z0d4MFBhVkNsRWNjUVhSNFlOaHU0MFhlWkd6Y3RNS090N0N3U0pBdE40Qkhh?=
 =?utf-8?B?dllQeHN3ZU5kWnBlT1lldzNsaXIyR1BIVHF1N0ZIejF5ZkpCemI2M1BzaS91?=
 =?utf-8?B?aklWSEpOclo1STRTRDh4RE1VbG9KbDdnTkN1dnZuVkxIQ3N6eHExVTZRMTlu?=
 =?utf-8?B?bDZtWUZKZmxtWEUvRUZlQ1lyM25zMXlTd2psZkxRYjQvMTh2MlVWbnExbGJK?=
 =?utf-8?B?cnR4TUlUUWFrTXBYUnBnWmQ4cU9oWGFhaGR5NVZ5c09TWkRUWHBldWhuczlP?=
 =?utf-8?B?VVRQY3pRM1p1MmhwZGQ3VEYybE9HUFZvazJhTHBaWURnQkpQcUZiRElzemlj?=
 =?utf-8?B?Qm5yMGFrcjY4L1hNU3dkVmU0ZG5kMCtaa2t1MHluOFVQcXBrSjZ0UG9tWmZt?=
 =?utf-8?B?ZGpsb0s3aGxQNXhkM2s5YkdMNit2MHFNTlpkWnhRUHc3MGFGK2RCNWRFRzll?=
 =?utf-8?B?TjJHQzh0TFlEak01ZkpyVE16Ukg5Yk5RcVpvNnFXQmh6d2YvQ25iT3hhKy9Y?=
 =?utf-8?B?M2d3NXBEeFJLektJaDkxOTErQXM3UW8vb3NTNDJaMW16SVpTdThIcWFSWWMy?=
 =?utf-8?B?Nm1Ba2RjeHgyK1IyNDBYbWI1RGNvNmZqQVlFU0hSRFg1aHNyZGZHTTR0Y1R1?=
 =?utf-8?B?YmZXMnVSUUY5VzZKYzBqdjRLMmg4bFVKU2p4c2dZdVhoanE2cmVYRDF6SzMy?=
 =?utf-8?B?TnVQUXNlMWgvbFAxVXZ0dExNYStXMzUwejkwL0RaS3YxdTN6YlFXZmU3dkhX?=
 =?utf-8?B?aFFJZVk0UmtVQXNKNzhXMFdGZnJkQnBwR28rRDF3aUdEWTZmNjluNVVhYXpu?=
 =?utf-8?B?VUV1ZENRZzhOS09PdjZMZ1RZRFY3ZEtUMDQrS1gxdkRyTTJRUnJJNm44ajhu?=
 =?utf-8?B?NHhCY2xiY3VSaVJ5SEJYSjQ0WkI5NDZRRGc0S2dMRUZwajJEMTV3RTBEa1Ry?=
 =?utf-8?B?eEdqRm41ZHhMSDd5aWZSdlY2L3M1Z2c4RTZveXJ3ZFRBVEFYallSeVR2UmhS?=
 =?utf-8?B?TFNFRGl2MW54VWFQR20yZ0p3STB3MytCUFZVVUVQNWErQ3J1L0xOYmhZN1Qz?=
 =?utf-8?B?NGNHenNEeFc3MEtvbXlWTzYwaXhINGRCY0kzVWk5eEd4NGRzQ2JTUyswM0FV?=
 =?utf-8?B?TngvYkZiV2ZQVDRZYzlheWppaU1JNmF4MjhFQ0hhY1pFeWx0YTNmeDVVMVU0?=
 =?utf-8?B?Mk1oV3hOS0RZTTE3OVhTVjN2T3AvY3hYYk12VCtiRTNtbXlmR2t1SDMyMXAv?=
 =?utf-8?B?N1JESjJCQlk5eWVnWUVKQjdhNjk1UXhyZFZqcjFTT01lSU0wNjBUU2IyS0FZ?=
 =?utf-8?B?Z2l2YlFaMnM4SlJSZ2JiNmYzU2lyaGd3VDROazF4L2xzazBBakFNaG1aRW1D?=
 =?utf-8?B?cU45TXZ0OGFhb2g0UjlwUGpaWUsvMWdkdElQZ0VkTVpzSFBxWVlvSG5HWC92?=
 =?utf-8?B?WFgvS2I3eGFnZ2VFSGVTdzcrVjluK3E1cUQvcE9Qb1hJT2QrRVUreENqeWR4?=
 =?utf-8?B?WmhrSFZYU2ZjcWQ3blBQZk8rR21kSlZpeFVCbzc5T3pxMlowMEE5T2RUckhu?=
 =?utf-8?B?UnZhTEhha3J5dE9mZ09xd1Q4NUVZZjhxUk0vbTRQYThrTjk4NUNlM1Q4MTZ5?=
 =?utf-8?B?ek8vR3pwT1hoY05zWmZNOFk4WVk1QjZnbm1XVGpBMkMrZHhtUDB6VjhnRHJU?=
 =?utf-8?B?QzVES3h3NnRYd0owdnMrbndGSGhKNytURkdwVlVoYWlSS1lpNys2V2hnMnRY?=
 =?utf-8?Q?yU65BF+X8b7nRB5cn8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TDdHRnZ2Zk5LWlArQzBmZGlFOTR3ODUwR3YrWTd5UUdXcXZKSzd1KytoN3dp?=
 =?utf-8?B?TFlhRmZucDhURDRGaUhTdjVSR3Z2UG5sT0libmxSdmlidGNKVmJKN1QrdHhX?=
 =?utf-8?B?TTFkY2E1U0l2MnpxRTVJMGFyRVpGOHpMSmVxYmVUVjE1VnFXRFRTKy9IUlpH?=
 =?utf-8?B?VTNoWnpXN1Jvc09pRGhiSmVGRlB1Si91bmZGdlRvUUdST3NzTEIrQ1pxRm16?=
 =?utf-8?B?b09QcFAxdHR6SEI5UlV5Y1dCSzBNZ3NKanFWbDRGaVBhWUxKcWFJUW1STVg1?=
 =?utf-8?B?cGIyWXRTRVRRMWdZcVZZSDZOSkpqVFhwOHBhdVpZZHFwZHZFc0hPQmZZeVpn?=
 =?utf-8?B?dGpXaHB4UWRtcER3MmI5TEFaSk04Uk5LeVdoQlJmQWYzSjlKZUFCSkVxMmFC?=
 =?utf-8?B?Q2ZhSWFqVHJpeExsMGRZVXJFZkgxY1FNZE1DaEc4R0FRODIwcllGY0FnQ25p?=
 =?utf-8?B?Q2xUaWEzY2VtamtKYURQMWxMS1Ayc3dZNkdBb085Y2RSTzlkbjJaSDB5M2Va?=
 =?utf-8?B?bWRYaFJqUStBYXFGS1JWdkxGTzFkSUErZ0dFVy9xK25hTEJXNzR5OTIzMmEz?=
 =?utf-8?B?Wm90K1ZIVGtZRlFPNFZ6RktFN040L2VlV3R3bVphcVZ6MWRyZFRZRlVJOXRy?=
 =?utf-8?B?SDRwc254U3laR0lZZ2NONGphdy9WWTJ6alY0c00wM2JSR3dWcDEwa2V2eTda?=
 =?utf-8?B?UjZNWXg5a1djbmQ3bmE1NmNPMk9WdkFFeFVMTG0yMUpDNnZwczdtR2dMOHQv?=
 =?utf-8?B?ZytxbXIwYTNBTTMyWEhZWndVRkx5MlJ0UlBEVjV2Sm8yaEZxYzY1M29VL1hK?=
 =?utf-8?B?cUwzMXhTVXFDUjNVRFlxWXZHMTJieVVlbjRDa2hKK2xwSEVMeWdrVXoyQ3BI?=
 =?utf-8?B?c2xFZVV6WCtDbWloZjNsa2FwMVF0dXpSQTZ6YkMyTngybjZpek9rQ1NXcUxG?=
 =?utf-8?B?VVRxUGI0L25UblVvcEcwelp3TDFmTjgzSDBHVEdtSU51N0drQnhrZkhkTGMr?=
 =?utf-8?B?YmF0cytBbm5PbVdhZ2UrdzUyVWdSbklaU08yanc2aW55VXN2cFprRm9mTXg1?=
 =?utf-8?B?YUJLb1FXYmM5M1FFR2dYS3IzTnp0Nnh4Rjg1WTNCakdFZmJEYWNBU2V3YTI1?=
 =?utf-8?B?UUgrUE03Vld4WHc5N25nSkwyT0J2eXJScnB1V1BEK1cza2JVMEQ4S2F3VUxI?=
 =?utf-8?B?dFFsOE5kMEdpc01mQXNzSmp3VWRRbFNtWFhkVzY3OXRiYXd1cUtXem41Tzkw?=
 =?utf-8?B?ZGE3cE1FSmJyNDc0V3JudkpVamlaZFozSUdhS2hQUmY5bG83NXBKZXZocllR?=
 =?utf-8?B?YXpma1l4aUFMQmNlZkRwd1BpSit1VEQxa2FhaHNIR2dsT0hGU3VjdDVkNGF6?=
 =?utf-8?B?ZUJwMGV3TEhiclBlMThpS3ZOS0Q3bWlxbnl6OVBzU1VGSkFoTnN0SHE2cEZ1?=
 =?utf-8?B?SFpyd3kxN3hXNVV1cDc0NXBMS2ozdW5iZEpQay8zSTI0dXVHRHNjWWU5aU1L?=
 =?utf-8?B?SW05WmFVWjB2N1dvUjVob1Y0c01GM0xpenJUNVNBNGJCb3c0NUxxOGNKSkpK?=
 =?utf-8?B?cmo1RCszcnlWK2dIMjJpZ0U4TkFuUHpDdXNSMThjRFFGcXlQNDBJTmoyUUkx?=
 =?utf-8?B?UnlOdzJqSkQrTmNjMzAyK2QrWEdVdWN3YndFSEdkMzZrbTVJT2ZPNTV6VXFq?=
 =?utf-8?B?TTEwTktFMjNsK3lRRDRNa1dKMFhHZFdWenNYUmIreDB6dnJNUHIxNmpCNysr?=
 =?utf-8?B?b3lXRHMxK1dzL3ZWZVFhQVEvRmZQM01XK2NBcW0rZWtOOWN0Zlg1NTZkQTJl?=
 =?utf-8?B?d1dPWHM5OEQxTEhOT0JHK1pQTitSa2p6UDN5c2NCUkpFVElRTGcvWTE3ZWw0?=
 =?utf-8?B?WjNMOFZya3B3MXVoQzIwTFQzMXljbjdVbEJ3WXJaZEg1M3dIcDRqVVhLYXJm?=
 =?utf-8?B?NUppT1U0TFBlQ0VVd3doWDE3b0VBeTdVd2hMejU3dGIvYW53SUFuSnhSQlN1?=
 =?utf-8?B?RVREalRHb1prdktEd1RlRnJkS0RGdTJuWW0vV0wyK3gvaEEzdnJ1b2VaMEU5?=
 =?utf-8?B?WU1UTWFVRlU2UVRycktmaFliMVJqVE8zMUNKM1pseGhyRVE2aDFGcjJCTkRM?=
 =?utf-8?Q?CETL0bPgpeSnX3QBZwIffSrqV?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd2c95cd-c4c0-4bff-bd46-08dd1293205b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 05:35:27.1020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7szxgyFVzKlDpJ+3/qJ8g87uooYBXlia1afQw675TwkrEv1K+MaWzj6hk5+rXv/Q8+lcN0T1TaPIoqrsc3IRGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7641
X-Proofpoint-GUID: DtSIIWiDpr_gGZRWo6BXRkObFr75_92k
X-Authority-Analysis: v=2.4 cv=RpA/LDmK c=1 sm=1 tr=0 ts=674d472e cx=c_pps a=e6lK8rWizvdfspXvJDLByw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10
 a=NEAV23lmAAAA:8 a=MO2eYF9NAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=3-RhneuVAAAA:8 a=4Jz-tj0HIe-pyuF7uqEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=P0Bp-009Bj7CKDYx-y5u:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: -xqZhnHfULYvouNtQZemHVBcziVotB14
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-02_02,2024-11-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2412020048
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4B251rDL016411
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Dec 2024 05:35:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114134

Before we rework the abseil-cpp and protobuf recipes, a possible=20
improvement for this patch is that we list the needed libraries in=20
RDEPENDS manually.

Regards,
Qi

On 12/2/24 13:21, Chen Qi via lists.openembedded.org wrote:
> I'll explain in more details what the problem is and why this patch is=20
> correct, given the current status of abseil-cpp recipe.
>
> In protobuf's abseil-cpp.cmake file, there's a hardcoded list of absl=20
> targets used by protobuf:
> https://github.com/protocolbuffers/protobuf/blob/main/cmake/abseil-cpp.=
cmake#L56=20
>
>
> This value in turn is parsed and used to replace the=20
> @_protobuf_PC_REQUIRES@ in protobuf.pc.cmake.
>
> Here's the generated probobuf.pc file's contents:
> """
> $ cat=C2=A0 ../build/protobuf.pc
> prefix=3D/usr
> exec_prefix=3D/usr
> libdir=3D/usr/lib64
> includedir=3D/usr/include
>
> Name: Protocol Buffers
> Description: Google's Data Interchange Format
> Version: 25.3.0
> Requires: absl_absl_check absl_absl_log absl_algorithm absl_base=20
> absl_bind_front absl_bits absl_btree absl_cleanup absl_cord=20
> absl_core_headers absl_debugging absl_die_if_null=20
> absl_dynamic_annotations absl_flags absl_flat_hash_map=20
> absl_flat_hash_set absl_function_ref absl_hash absl_layout=20
> absl_log_initialize absl_log_severity absl_memory absl_node_hash_map=20
> absl_node_hash_set absl_optional absl_span absl_status absl_statusor=20
> absl_strings absl_synchronization absl_time absl_type_traits=20
> absl_utility absl_variant utf8_range
> Libs: -L${libdir} -lprotobuf
> Cflags: -I${includedir} -DPROTOBUF_USE_DLLS
> Conflicts: protobuf-lite
> """
>
> Let me use "absl_hash" and "absl_absl_log" in the above list as example=
s.
>
> """
> $ find ../../../abseil-cpp/20240116.2/packa
> ges-split/ -name "libabsl_hash.so.*"
> ../../../abseil-cpp/20240116.2/packages-split/libabsl-hash/usr/lib64/li=
babsl_hash.so.2401.0.0=20
>
> ../../../abseil-cpp/20240116.2/packages-split/abseil-cpp-dbg/usr/lib64/=
.debug/libabsl_hash.so.2401.0.0=20
>
> $ find ../../../abseil-cpp/20240116.2/packa
> ges-split/ -name "libabsl_absl_log.so.*"
> $
> """
>
> See? The current package splitting of abseil-cpp does not match what=20
> protobuf assumes. And I thinks protobuf's assumption is correct,=20
> because there's really a absl_absl_log.pc file generated by abseil-cpp.
>
> And there's the contents and location of absl_absl_log.pc:
> """
> $ cat=20
> ../../../abseil-cpp/20240116.2/packages-split/abseil-cpp-dev/usr/lib64/=
pkgconfig/absl_absl_log.pc
> prefix=3D/usr
> exec_prefix=3D${prefix}
> libdir=3D/usr/lib64
> includedir=3D/usr/include
>
> Name: absl_absl_log
> Description: Abseil absl_log library
> URL: https://abseil.io/
> Version: 20240116
> Requires: absl_log_internal_log_impl =3D 20240116
> Libs: -L${libdir}
> Cflags: -I${includedir} -DNOMINMAX
> """
>
> And there's the contents for the absl_log_internal_log_impl:
> """
> $ cat ../../../abseil-cpp/20240116.2/packag
> es-split/abseil-cpp-dev/usr/lib64/pkgconfig/absl_log_internal_log_impl.=
pc
> prefix=3D/usr
> exec_prefix=3D${prefix}
> libdir=3D/usr/lib64
> includedir=3D/usr/include
>
> Name: absl_log_internal_log_impl
> Description: Abseil log_internal_log_impl library
> URL: https://abseil.io/
> Version: 20240116
> Requires: absl_log_internal_conditions =3D 20240116,=20
> absl_log_internal_message =3D 20240116, absl_log_internal_strip =3D=20
> 20240116, absl_absl_vlog_is_on =3D 20240116
> Libs: -L${libdir}
> Cflags: -I${includedir} -DNOMINMAX
> """
>
> We can then find the absl_log_internal_conditions library:
> """
> $ find ../../../abseil-cpp/20240116.2/packages-split/ -name=20
> "*absl_log_internal_message*"
> ../../../abseil-cpp/20240116.2/packages-split/libabsl-log-internal-mess=
age/usr/lib64/libabsl_log_internal_message.so.2401.0.0=20
>
> ../../../abseil-cpp/20240116.2/packages-split/abseil-cpp-dev/usr/lib64/=
libabsl_log_internal_message.so=20
>
> ../../../abseil-cpp/20240116.2/packages-split/abseil-cpp-dev/usr/lib64/=
pkgconfig/absl_log_internal_message.pc=20
>
> ../../../abseil-cpp/20240116.2/packages-split/abseil-cpp-dbg/usr/lib64/=
.debug/libabsl_log_internal_message.so.2401.0.0=20
>
> """
>
> What does all above mean? It means that abseil-cpp is not splitted=20
> reasonably. This could be proven by the absl_absl_log.pc file as=20
> described above.
>
> So, given the current situation of abseil-cpp, Yi's solution is=20
> correct. Before abseil-cpp is re-splitted according to its pc files,=20
> which then could possibly lead to automatic parsing of the protobuf.pc=20
> file to add extra RDEPENDS automatically in protobuf recipe, we need=20
> to have Yi's solution. And we need to use RDEEPNDS instead of=20
> RRECOMMENDS (see the 'Requires' directive in corresponding .pc files).
>
> Regards,
> Qi
>
> On 10/1/24 20:42, Peter Marko via lists.openembedded.org wrote:
>>> -----Original Message-----
>>> From: openembedded-devel@lists.openembedded.org <openembedded-
>>> devel@lists.openembedded.org> On Behalf Of Peter Kjellerstedt via
>>> lists.openembedded.org
>>> Sent: Tuesday, October 1, 2024 14:00
>>> To: Yi Zhao <yi.zhao@windriver.com>; Yi Zhao=20
>>> <yi.zhao@eng.windriver.com>
>>> Cc: openembedded-devel@lists.openembedded.org
>>> Subject: Re: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to
>>> RDEPENDS
>>>
>>>> -----Original Message-----
>>>> From: Yi Zhao <yi.zhao@windriver.com>
>>>> Sent: den 25 september 2024 04:17
>>>> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Yi Zhao
>>> <yi.zhao@eng.windriver.com>
>>>> Cc: openembedded-devel@lists.openembedded.org
>>>> Subject: Re: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to
>>> RDEPENDS
>>>>
>>>> On 9/24/24 03:02, Peter Kjellerstedt wrote:
>>>>>> -----Original Message-----
>>>>>> From: openembedded-devel@lists.openembedded.org <openembedded-
>>> devel@lists.openembedded.org> On Behalf Of Yi Zhao
>>>>>> Sent: den 22 september 2024 09:36
>>>>>> To: openembedded-devel@lists.openembedded.org
>>>>>> Subject: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to
>>> RDEPENDS
>>>>>> Since commit[1], the libraries of abseil-cpp have been splitted in=
to
>>>>>> separate packages. When protobuf is installed into the image,=20
>>>>>> only 48
>>>>>> abseil libraries are installed as runtime dependencies. But the=20
>>>>>> output
>>>>>> of 'pkg-config --libs protobuf' lists 66 abseil-cpp libraries are
>>>>>> required. Add abseil-cpp to RDEPENDS to ensure that all required
>>>>>> abseil-cpp libraries are installed.
>>>>>>
>>>>>> [1] https://git.openembedded.org/meta-
>>> openembedded/commit/?id=3Ddd6421e65eb75c35a904f4b487ba022075035
>>> ecc
>>>>>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>>>>> ---
>>>>>> =C2=A0=C2=A0 meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb =
| 2 ++
>>>>>> =C2=A0=C2=A0 1 file changed, 2 insertions(+)
>>>>>>
>>>>>> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
>>> b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
>>>>>> index cc5204de4..354b3213a 100644
>>>>>> --- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
>>>>>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
>>>>>> @@ -106,6 +106,8 @@ FILES:${PN}-lite =3D "${libdir}/libprotobuf-
>>> lite${SOLIBS}"
>>>>>> =C2=A0=C2=A0 # CMake requires protoc binary to exist in sysroot, e=
ven if it=20
>>>>>> has wrong
>>> architecture.
>>>>>> =C2=A0=C2=A0 SYSROOT_DIRS +=3D "${bindir}"
>>>>>>
>>>>>> +RDEPENDS:${PN} =3D "abseil-cpp"
>>>>>> +RDEPENDS:${PN}-lite =3D "abseil-cpp"
>>>>> This defeats the whole purpose of splitting up the abseil
>>>>> libraries. What triggered this change? Was it an actual
>>>>> runtime error, or were you only looking at the output
>>>>> from pkg-config --libs protobuf?
>>>>>
>>>>> Since the .pc files are in the protobuf-dev package, which
>>>>> depends on the abseil-cpp-dev package, all abseil libraries
>>>>> should be available if you are actually building on target
>>>>> or with an SDK.
>>>> Our customer reported this issue. Here is his description:
>>>> The abseil libraries will be included in the SDK, but not on the=20
>>>> target.
>>>> The application is building with SDK. The yocto build is adding=20
>>>> protobuf
>>>> to the image (no explicit abseil libraries are added). If an=20
>>>> application
>>>> then are built using the SDK it can not be executed on target as
>>>> libraries are missing.
>>> Can we at least change the dependency to a recommendation so
>>> that it can be avoided via BAD_RECOMMENDATIONS? Because as it
>>> is, it penalizes everyone that use protobuf for the case where
>>> one provides an SDK with protobuf.
>>>
>>> My suggestion would be to change it to:
>>>
>>> # Recommend abseil-cpp so that all its libraries are installed in cas=
e
>>> # protobuf is provided as part of an SDK. Everyone else should add
>>> # BAD_RECOMMENDATIONS +=3D "abseil-cpp" to their configuration.
>>> RRECOMMENDS:${PN} =3D "abseil-cpp"
>>> RRECOMMENDS:${PN}-lite =3D "abseil-cpp"
>>>
>> I think that's also not the right way to do this.
>> Adding unnecessary stuff to release images to satisfy SDK needs is=20
>> wrong.
>>
>> I also wonder if the problem is not at the SDK level.
>> If you build an sdk, there is explicitly installed package base and=20
>> additional required dependencies of those packages.
>> The dependencies may not be complete and fully usable, only their=20
>> parts sufficient for the explicitly installed stuff is present.
>> Are the sdk users assuming that full abseil-cpp is installed and thus=20
>> using also parts not needed for protobuf?
>> The proper solution would be probably to include abseil-cpp=20
>> explicitly in SDK used in that way.
>>
>> Peter
>>
>>>> //Yi
>>>>
>>>>>> =C2=A0=C2=A0 RDEPENDS:${PN}-compiler =3D "${PN}"
>>>>>> =C2=A0=C2=A0 RDEPENDS:${PN}-dev +=3D "${PN}-compiler"
>>>>>> =C2=A0=C2=A0 RDEPENDS:${PN}-ptest =3D "bash
>>> ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-protobuf',=20
>>> '', d)}"
>>>>>> --=20
>>>>>> 2.25.1
>>>>> //Peter
>>> //Peter
>>
>>
>>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114133): https://lists.openembedded.org/g/openembed=
ded-devel/message/114133
> Mute This Topic: https://lists.openembedded.org/mt/108587631/3618072
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[Qi.Chen@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


