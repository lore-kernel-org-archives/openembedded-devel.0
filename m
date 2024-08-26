Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0285AC5321E
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 08:58:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.48376.1724662693055852358
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Aug 2024 01:58:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=89689f30da=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47Q5f624005665
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 01:58:12 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 417f1k9any-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 01:58:12 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47Q8wBul002945;
	Mon, 26 Aug 2024 01:58:11 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 417f1k9anx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 01:58:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dxrd7l2P7jSotrEnAdn4/949zqQ/kIsPM6rX1Hmhrt/NaBkXvyp4Kd6BhH6HRRf34Zicz01okQYPDo+nJjuFowpmUlf60s/WUaw8pKqW+/2lZPgWr/SuZyd95PEejUjKvY9/kSV3UH/XDe8qFqy8SQs0NjkXl35OHJ26NHy6/nJIiCLYm2AhXbXUHrbBRRLZX1vgGTY4meevwjWVZXdKiCz2XyXaTj5kDBwd0Zn1ioWbFi0TCNpROBImtVdmTE42j/mlQbZneWwxwE0AZPVmoXVmGJnbDQoAyxB1p4pprQqoO4fQMLRbJxNj+2xh3P+p038ujctw+yZe05K+pnuvDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8sEb8uLLZhtHUgWgtmbRUG5sMTwJNfY/b9YAN8PkFY=;
 b=LbK1XkkdjV3JQRVeE3mtVQv/9nBr5mPVGQqS8hqVUFyz4vyzufsZmLoCgySmZFbMNjBp/7hrajMfInDM//WbS2M5k4XItSsHKduuCaOmcHvxwY0LD0xF255R17PXOnpO5FAVNEXA2W7OCWddoxdYkDLge8cHnBipIUpbQ0bJOhISDEhdBE3/t0Z4JbomenLgkMkQvrFSimUE7Tp2zlSVNkaGjYH6uRBLH/dAX/71fCX6kgahk1PpizLqluqSgr5k+Hv6Dnc5JUs47sLqd0Q85NICtmqAKanqN1tIClg4kJnu6P5HUj3HvIbyYmKKlsrEhyEdazZp0AkzomeY5IJtZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by MW3PR11MB4698.namprd11.prod.outlook.com (2603:10b6:303:5a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 08:58:09 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 08:58:09 +0000
Content-Type: multipart/alternative;
 boundary="------------hgF5Si6Oiirr6SNsAp9e9eLK"
Message-ID: <f2d28f64-7cd4-49b4-b513-faf6300f377a@windriver.com>
Date: Mon, 26 Aug 2024 16:58:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [scarthgap][meta-python][PATCH] python3-h5py: fix compile
 error with gcc 14
To: Steve Sakoman <steve@sakoman.com>
References: <17E3305CDD83A97F.29563@lists.openembedded.org>
Content-Language: en-US
Cc: openembedded-devel@lists.openembedded.org
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <17E3305CDD83A97F.29563@lists.openembedded.org>
X-ClientProxiedBy: TYCP286CA0071.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::15) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|MW3PR11MB4698:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a79aaed-863b-4297-022f-08dcc5ad3512
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QzVzL1lKdnlMUW5IdmR6UHQzRU9LUHZ6bHJRa0xIR1hjZHVUbXZwSXltSExn?=
 =?utf-8?B?VUlTYmtaMmg1QTB0ZFlaNTFGVnNwQnZOeGQvZXNBOElCZVA1TTYyeElyOWN4?=
 =?utf-8?B?ZjdRQno3ZlBLbjE4dU1kcmljc0NjWVlKRGVRSGNXanFtVEl3V0RJWURrSHB1?=
 =?utf-8?B?bGpocTdScWNXS1BvUXJpd1RzSUFBNi9YRWdyaW5EeWRDcnFvSXRxTDAxQUMx?=
 =?utf-8?B?SGdiWTkxZXNxdjg1cyt3d0E3dk50NlR3VFpWdnBTU1FDYjNwaFlVbnBwbVBI?=
 =?utf-8?B?bEhyak5IaVdjOW5Td09TeTFrdUpycXlROCt0Q3Fob0pTTW54WFRwQ0ZBRitU?=
 =?utf-8?B?WS83ZVd0RFdqQXBOU2dZSXdGaU1zblc0OHJ6MTMrNDJQT0dLRlZEaWZGcG9x?=
 =?utf-8?B?ZnRVR2xLUnpnck1EWWZjcmt0MkQvRVRkdjJGU2JiRFpTOGtrN3B6NTh5SHRR?=
 =?utf-8?B?Mm1lRXBSZW1jRlRocUIvTzBucm5vbmdNQmJZTmVMcENlRzc5bmdxMFZWdjRt?=
 =?utf-8?B?dmJtREppdUlFRGJtdmRCazVWUnAyV0pXdU94VjVyWWVlUUpBcUFaRloxRkE3?=
 =?utf-8?B?T0xwa01mTitHenZyUFMzMEc0TFdFcFlwWnExNG1PK21ra05odTBycUZSaXlW?=
 =?utf-8?B?cmpUM2dHbGdpMTZlTFpUbXJnT2c0NmhxZWFiUDViYm5BQ1JEY0FjTTNoRkZY?=
 =?utf-8?B?Z1dZME40cy9VQWFHNlEzU3IrNDUxTXVvUWU5ckNVakM3dXpIRFpmV0kxbmdU?=
 =?utf-8?B?OE0vS0ZpWE1wSjdQdy9sRFM4VzVuNy91U2ovTS9hN2lHRlpmTXhtbUM2VTNn?=
 =?utf-8?B?dmNGd0Noa2duVUZKMVppd2VqU1g0UlREaENIb2Q1a05kRDI2bDE2N0ZzK0VK?=
 =?utf-8?B?RnBsQjdjM2tkRlRhdWhlMTVpQzMxbnNUTVBJbHBPOXVSYVZ6eVIxcEdkWDND?=
 =?utf-8?B?YTN3VXdHeGZ6cTlCbmY1a0hPNGRucnhLaXhETnhIWXYrelJFZDBEMGJLMGtv?=
 =?utf-8?B?N05BdmhLSXRVQXp2c3krd042Q094aU95L2REaEJDK3B0Vlo1eFA0enBmc0NV?=
 =?utf-8?B?S3R5cTdROVIvVHAvUmNzQ1lkYUhhbXk0MlNSUnVmL1lZWEZIZU85U0JnSFM0?=
 =?utf-8?B?LzgxSUdMdm1rNmo0MGJsUDEvVTBjamx2NWNLVUlERjlQbkg3SmxuSUhxUjdZ?=
 =?utf-8?B?Q0dTb0lyaWxnaC9IZXh6dFE2MzM0bC9UNTIrUDBsb3hBZERPc0FtcjhsbFFM?=
 =?utf-8?B?QWZZUTJqbG93T1hwT21ZMmpNNS91T0xYd3dRTUVTQ0RLWm9NNkhJZExlYlNw?=
 =?utf-8?B?b2VheXhGTjZoVWxFNVYzcHd3cTBqOFVORnJGWHdZN1AydlpLcG5YTWtEYUlL?=
 =?utf-8?B?UWZWYTBxdTJlR1A2dmFPMXUyVFVoeUVWdkc4Q1FjalR0S1JjNXJkTlM1NWll?=
 =?utf-8?B?Y2NxVDZDUkl6NDVmM0pQRTl3N0JSOHJDN2RuZWVrcjVpeGRDdnh6Mkw5TmhU?=
 =?utf-8?B?UHhQVkFxMEZKS2VJdnNZbzlQVzl4T25ja0RIcStzRzd3NnlsYlZLOXdzc0xG?=
 =?utf-8?B?ZVJ3R1ZYdkx1QzNLaCtEOWVibWFEM3lrWVlzMWhFdTEveE5GaThLUG9VdlZJ?=
 =?utf-8?B?L2F3ZkZpOWEyc3JuanJIckFVWkE0Y3RqNmVxYXRHNFE0aTlORk9BdmZpb1Nk?=
 =?utf-8?B?TlovODdQMUovSXNZMktQMTdDb1Nadi9OS1p2Yy9iSmxrTHp4QVNkMjJGWk1u?=
 =?utf-8?Q?GdMf6BmUQ0m8EPXAXU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?KzR3eVIvVXRkNGpDVVkycEdWbWdsclFBbTNZTWZWbGJHMEtLdXRac2g2UW1z?=
 =?utf-8?B?Tkw0MzMzNnZZc0dYUGFDUWJQa1p0VlpjR3NoMEhxeHRpT3pnM2F6c0dHcGFD?=
 =?utf-8?B?bldnckczb2lFZGgzSEZzNWdKTFY3SWhsdE41TU5ybEFpY3E2ZHZOR2xjYmY1?=
 =?utf-8?B?c09wOE40aGhxYWN1UTVMb3loSmlJdlJuc0hhMmJLU0MxVFNoYXhQc3EycjN3?=
 =?utf-8?B?YlNidE5Lbkt1NEs3Q01xNEM0bU5JTUZmbEdsNS9ONWc5SkdZZkhZNitMc0tj?=
 =?utf-8?B?WjVSUy9HUjNNdkI1NTkzY3dOMjdVTkt3L0JoU0hxbitYbFRNNklXcHdFeVhP?=
 =?utf-8?B?L3ArdGpBeTdLZEZqc2puZUovNWViQzN1NEVhaW9haDZaTmY3SG52NVhVc2Jj?=
 =?utf-8?B?ZGJvUWk1MThYV1BkdEZiSGpnbG1UWUM3K2xnNXlXS1l0UnVjN1lUdkVqTTNB?=
 =?utf-8?B?alpIcTFUa0lxZ05lbDgrdThhb1VBNGR3MHJvdmRITCtFa3NoM25iK0xoQ1U0?=
 =?utf-8?B?ZEpHOHhyakJXVm95T09yVG5wdGJrWUpFRDhhVlJXSWpVWUZTN2JTZ3FKaTFx?=
 =?utf-8?B?RWFsam1INWNlUldlSDFaNFdwV05hamVSU3psZmRaekhtQmZxYTRUSmQvaDdD?=
 =?utf-8?B?dnNQNGtmbjdmVGo2dmtRUjNYcndkUnM1eXhPSUVFMFRVZDZPalIyUVJRUDZX?=
 =?utf-8?B?TUFmNFBQZDVwemk1Z3dvYmt0a2xQT0piakRORlN4OHlraEp2b2ZKek44UWlS?=
 =?utf-8?B?aTYzZGFpZ2pNTDRDSG82TDZBWk1JQTRmUTlsWlh1dEhJYVNjTUhOUjVkYkFu?=
 =?utf-8?B?SFJtT1FqOFd3RFp1NU1sODZId28wa0JoYUxNN3lFNTdIc0IvU2tyMlBmVENr?=
 =?utf-8?B?TUh4N1lNVjdJY0Vmekw1RkVUYldmb2RjWTFlRHNya0NjaTJtYS8vQWxWM2FK?=
 =?utf-8?B?NGVPRkVjWWtQQkxJVWo1dEJ6cng4dEp0azAzQjZZR3A2MUNmdTNzSVo1RHZx?=
 =?utf-8?B?N29GRjBiaUp1TU5YSElZY3FxMEFWMkh1YVVqZk1udE41SlVEN1Z4ZnFVeW8v?=
 =?utf-8?B?Ni9xVjdOY2NYdHM5Z0Z5cWFPK04yM2JZeVpEUW94SEdtRnN6TVQ2VytQWjlU?=
 =?utf-8?B?V1VId2Jjc24rbGxYWW5FTmQ3bUxNQk03YTRmUzliZUwzc05Bc1I3SWlZQWE4?=
 =?utf-8?B?WmNYVkROOWNYbHU4amtETFhYS0VKMWo4eHVhenNkYkhFSU95MnEyMUZnRllH?=
 =?utf-8?B?Wi9SVXo3bGtIQ2VqYmRTcnB2NXc4SGwvbU1jU2s0YjE5ZFFhQjhZWDhmUmJM?=
 =?utf-8?B?OWdmM04vemxkY2RZMlVBTVNUSDhDblJjWXhRWjhXNnJRcFJaRmdjNWFIeldW?=
 =?utf-8?B?aU16SHpEenVhblM1NDhpbjkzY1d6MzZ0SHJqT1o5OVFYQUs3YmlmYy9FVkFE?=
 =?utf-8?B?M042bXRYTXRjNFdJQUtsaENzMXpxMkJxMWhuS3F3YndYM2JQSUViQVRlRDNJ?=
 =?utf-8?B?SjNINWJQSHkzalZ5dzNlbFVFQ2x6T2VlditteGdvcVgrM21lSmltUUN2UUNV?=
 =?utf-8?B?Zno0a2I5clV5UlpVQUxSLzNCbHVkcStTVU5uVms0ODlRZ0lobXVTelVvdXMy?=
 =?utf-8?B?KzdVNG1XZXYrTEVlT1VrblhpYVZ4Z3gwUks2Y0hhSnZsVjExMXN4d3g5UlZp?=
 =?utf-8?B?Y0k4OEJHTnBSRUFRRzdJaVNCYWFNMGthRWd1ajByL3ZSbDQzOFppM1kzdndG?=
 =?utf-8?B?cjJDT1VRRlZoY2gzeDFoUVlxWFdoaGVPZ1RBRDhEYVorUkljQW54RjV6NG5T?=
 =?utf-8?B?VGx6ald6VThhdkNGdmhFRk5vZW9oUTAwZkZ6OElhSHg1UWEySmR4eW5EdmFw?=
 =?utf-8?B?WmtheS9TVXRtWVpoREM2amliSDBoZjkvRHh6c0x2bUhkcFAyYzVnOUVWT3hZ?=
 =?utf-8?B?WVlUR1pMUVhSdTUzbHkwV0lvKzJBMFdBWitsRXlKYXQ4SE92ZVJBN004N1Zx?=
 =?utf-8?B?dEtuZXA0SE9qckdSTmV1TjFmZTlTSmdjckxZbXlhRGZidWFhdHpTNnpyVUgy?=
 =?utf-8?B?dFo3T3J6MTBSTFdvVVAxRUZHSFBVVHRkTWwveVpTS09jOWpCUjh1TVNFa0V0?=
 =?utf-8?B?NGJYOVdFbDBDcElKbUtsRUE1NlZLb2JaQkhERHFmNlNucUZzczFzMTVBc3hp?=
 =?utf-8?B?a0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a79aaed-863b-4297-022f-08dcc5ad3512
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 08:58:09.1130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RMEUU6ePvOpDNhs5vr1rATtMou2aJuynIOeQ7B7sNK6qlxuivYxs1qrlgvUd9+o9INpWFzQvmO0RofJjtnH3Y8KNeJgC4t2+5K3It0+vi2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4698
X-Proofpoint-ORIG-GUID: _RMDDPwTjwv_RmBpF_gc6l4WNjQPX_FW
X-Authority-Analysis: v=2.4 cv=McQ+uI/f c=1 sm=1 tr=0 ts=66cc43a4 cx=c_pps a=PK5aExQQjalka8oDlC/sVA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=Ph7BvYL4AAAA:8
 a=NEAV23lmAAAA:8 a=XuAr4unSB9Z5LCgKHw8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=0crNdkKdb2xQ4x-hXHcA:9 a=ewEKQnw16KJ7vGWo:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=T1a-OTYGVawA:10 a=ImwWUX5h3JJ3gRE9moBe:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=TWddve_nIpLM7fnHv7Ho:22
X-Proofpoint-GUID: ckaa5I5d-ogT4R2ad7S2iVqFhoPQVuGp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-26_06,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1011
 mlxscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408260070
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 08:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111940

--------------hgF5Si6Oiirr6SNsAp9e9eLK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 47Q5f624005665

ping for scarthgap branch,=C2=A0 master not need this patch.

//Changqing

On 7/18/24 11:17, Changqing Li via lists.openembedded.org wrote:
> From: Changqing Li<changqing.li@windriver.com>
>
> Backport two patches to fix following compile error:
>
> h5py/h5l.c: In function =E2=80=98__pyx_pf_4h5py_3h5l_9LinkProxy_12get_v=
al=E2=80=99:
> h5py/h5l.c:8152:107: error: passing argument 4 of =E2=80=98__pyx_f_4h5p=
y_4defs_H5Lunpack_elink_val=E2=80=99 from incompatible pointer type [-Win=
compatible-pointer-types]
>   8152 |       __pyx_t_2 =3D __pyx_f_4h5py_4defs_H5Lunpack_elink_val(__=
pyx_v_buf, __pyx_v_buf_size, (&__pyx_v_wtf), (&__pyx_v_ext_file_name), (&=
__pyx_v_ext_obj_name)); if (unlikely(__pyx_t_2 =3D=3D ((herr_t)((herr_t)-=
1L)))) __PYX_ERR(1, 187, __pyx_L5_error)
>        |                                                               =
                                           ~^~~~~~~~~~~~~~~~~~~~~~~
>        |                                                               =
                                            |
>        |
>
> Signed-off-by: Changqing Li<changqing.li@windriver.com>
> ---
>   ...001-Use-libc.stdint-instead-of-numpy.patch | 27 ++++++++++++++++++=
+
>   ...ast-arguments-to-H5Lunpack_elink_val.patch | 27 ++++++++++++++++++=
+
>   .../python/python3-h5py_3.10.0.bb             |  5 +++-
>   3 files changed, 58 insertions(+), 1 deletion(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-h5py/0=
001-Use-libc.stdint-instead-of-numpy.patch
>   create mode 100644 meta-python/recipes-devtools/python/python3-h5py/0=
002-Properly-cast-arguments-to-H5Lunpack_elink_val.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-Use-=
libc.stdint-instead-of-numpy.patch b/meta-python/recipes-devtools/python/=
python3-h5py/0001-Use-libc.stdint-instead-of-numpy.patch
> new file mode 100644
> index 000000000..3c55fa697
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-h5py/0001-Use-libc.st=
dint-instead-of-numpy.patch
> @@ -0,0 +1,27 @@
> +From 434e1bf4ab9fa53ec1293cde86f4dbec6784e50f Mon Sep 17 00:00:00 2001
> +From: Orion Poplawski<orion@nwra.com>
> +Date: Thu, 22 Feb 2024 08:41:17 -0700
> +Subject: [PATCH 1/2] Use libc.stdint instead of numpy
> +
> +Upstream-Status: Backport [https://github.com/h5py/h5py/pull/2382/comm=
its/387a22b8c1513800c0401f496b4ed512c1639798]
> +Signed-off-by: Changqing Li<changqing.li@windriver.com>
> +---
> + h5py/api_types_ext.pxd                   | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/h5py/api_types_ext.pxd b/h5py/api_types_ext.pxd
> +index 91acb128..55a239f5 100644
> +--- a/h5py/api_types_ext.pxd
> ++++ b/h5py/api_types_ext.pxd
> +@@ -20,7 +20,7 @@ from libc.string cimport strlen, strchr, strcpy, str=
ncpy, strcmp,\
> + ctypedef long size_t
> + from libc.time cimport time_t
> +
> +-from numpy cimport int8_t, uint8_t, int16_t, uint16_t, int32_t, uint3=
2_t, int64_t, uint64_t
> ++from libc.stdint cimport int8_t, uint8_t, int16_t, uint16_t, int32_t,=
 uint32_t, int64_t, uint64_t
> +
> + IF UNAME_SYSNAME !=3D "Windows":
> +     cdef extern from "unistd.h":
> +--
> +2.25.1
> +
> diff --git a/meta-python/recipes-devtools/python/python3-h5py/0002-Prop=
erly-cast-arguments-to-H5Lunpack_elink_val.patch b/meta-python/recipes-de=
vtools/python/python3-h5py/0002-Properly-cast-arguments-to-H5Lunpack_elin=
k_val.patch
> new file mode 100644
> index 000000000..0f77f745a
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-h5py/0002-Properly-ca=
st-arguments-to-H5Lunpack_elink_val.patch
> @@ -0,0 +1,27 @@
> +From 9ed4f80fd482e135119086fb2015ca97dce306ae Mon Sep 17 00:00:00 2001
> +From: Orion Poplawski<orion@nwra.com>
> +Date: Thu, 15 Feb 2024 20:47:50 -0700
> +Subject: [PATCH 2/2] Properly cast arguments to H5Lunpack_elink_val
> +
> +Upstream-Status: Backport [https://github.com/h5py/h5py/pull/2380/comm=
its/704e13ac83b42898514610c4df9f32f367e767e4]
> +Signed-off-by: Changqing Li<changqing.li@windriver.com>
> +---
> + h5py/h5l.pyx         | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/h5py/h5l.pyx b/h5py/h5l.pyx
> +index 60b252fa..af725bdb 100644
> +--- a/h5py/h5l.pyx
> ++++ b/h5py/h5l.pyx
> +@@ -184,7 +184,7 @@ cdef class LinkProxy:
> +             if info.type =3D=3D H5L_TYPE_SOFT:
> +                 py_retval =3D buf
> +             else:
> +-                H5Lunpack_elink_val(buf, buf_size, &wtf, &ext_file_na=
me, &ext_obj_name)
> ++                H5Lunpack_elink_val(buf, buf_size, &wtf, <const char =
**>&ext_file_name, <const char **>&ext_obj_name)
> +                 py_retval =3D (bytes(ext_file_name), bytes(ext_obj_na=
me))
> +         finally:
> +             efree(buf)
> +--
> +2.25.1
> +
> diff --git a/meta-python/recipes-devtools/python/python3-h5py_3.10.0.bb=
 b/meta-python/recipes-devtools/python/python3-h5py_3.10.0.bb
> index 8a9158525..d557a8188 100644
> --- a/meta-python/recipes-devtools/python/python3-h5py_3.10.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-h5py_3.10.0.bb
> @@ -7,7 +7,10 @@ LIC_FILES_CHKSUM =3D"file://LICENSE;md5=3D113251d71fb0=
384712c719b567261c5c"
>   SRC_URI[sha256sum] =3D "d93adc48ceeb33347eb24a634fb787efc7ae4644e6ea4=
ba733d099605045c049"
>  =20
>   SRC_URI +=3D"file://0001-setup_build.py-avoid-absolute-path.patch \ -=
=20
> file://0001-Fix-Cython-3-compatibility.patch"
> +file://0001-Fix-Cython-3-compatibility.patch  \
> +file://0001-Use-libc.stdint-instead-of-numpy.patch  \
> +file://0002-Properly-cast-arguments-to-H5Lunpack_elink_val.patch  \
> +"
>  =20
>   inherit pkgconfig pypi setuptools3
>  =20
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111389):https://lists.openembedded.org/g/openembedd=
ed-devel/message/111389
> Mute This Topic:https://lists.openembedded.org/mt/107411257/3616873
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  =
[changqing.li@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------hgF5Si6Oiirr6SNsAp9e9eLK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 47Q5f624005665

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#cceed0">
    <p>ping for scarthgap branch,&nbsp; master not need this patch.</p>
    <p>//Changqing<br>
    </p>
    <div class=3D"moz-cite-prefix">On 7/18/24 11:17, Changqing Li via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:17E3305CDD83A97F.29563@lists.op=
enembedded.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">From: Changqing Li <a class=3D=
"moz-txt-link-rfc2396E" href=3D"mailto:changqing.li@windriver.com">&lt;ch=
angqing.li@windriver.com&gt;</a>

Backport two patches to fix following compile error:

h5py/h5l.c: In function =E2=80=98__pyx_pf_4h5py_3h5l_9LinkProxy_12get_val=
=E2=80=99:
h5py/h5l.c:8152:107: error: passing argument 4 of =E2=80=98__pyx_f_4h5py_=
4defs_H5Lunpack_elink_val=E2=80=99 from incompatible pointer type [-Winco=
mpatible-pointer-types]
 8152 |       __pyx_t_2 =3D __pyx_f_4h5py_4defs_H5Lunpack_elink_val(__pyx=
_v_buf, __pyx_v_buf_size, (&amp;__pyx_v_wtf), (&amp;__pyx_v_ext_file_name=
), (&amp;__pyx_v_ext_obj_name)); if (unlikely(__pyx_t_2 =3D=3D ((herr_t)(=
(herr_t)-1L)))) __PYX_ERR(1, 187, __pyx_L5_error)
      |                                                                  =
                                        ~^~~~~~~~~~~~~~~~~~~~~~~
      |                                                                  =
                                         |
      |

Signed-off-by: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 ...001-Use-libc.stdint-instead-of-numpy.patch | 27 +++++++++++++++++++
 ...ast-arguments-to-H5Lunpack_elink_val.patch | 27 +++++++++++++++++++
 .../python/python3-h5py_3.10.0.bb             |  5 +++-
 3 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-h5py/0001=
-Use-libc.stdint-instead-of-numpy.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-h5py/0002=
-Properly-cast-arguments-to-H5Lunpack_elink_val.patch

diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-Use-li=
bc.stdint-instead-of-numpy.patch b/meta-python/recipes-devtools/python/py=
thon3-h5py/0001-Use-libc.stdint-instead-of-numpy.patch
new file mode 100644
index 000000000..3c55fa697
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-h5py/0001-Use-libc.stdi=
nt-instead-of-numpy.patch
@@ -0,0 +1,27 @@
+From 434e1bf4ab9fa53ec1293cde86f4dbec6784e50f Mon Sep 17 00:00:00 2001
+From: Orion Poplawski <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:=
orion@nwra.com">&lt;orion@nwra.com&gt;</a>
+Date: Thu, 22 Feb 2024 08:41:17 -0700
+Subject: [PATCH 1/2] Use libc.stdint instead of numpy
+
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://github.com/h5py/h5py/pull/2382/commits/387a22b8c1513800c0401f496b4e=
d512c1639798">https://github.com/h5py/h5py/pull/2382/commits/387a22b8c151=
3800c0401f496b4ed512c1639798</a>]
+Signed-off-by: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+---
+ h5py/api_types_ext.pxd                   | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/h5py/api_types_ext.pxd b/h5py/api_types_ext.pxd
+index 91acb128..55a239f5 100644
+--- a/h5py/api_types_ext.pxd
++++ b/h5py/api_types_ext.pxd
+@@ -20,7 +20,7 @@ from libc.string cimport strlen, strchr, strcpy, strnc=
py, strcmp,\
+ ctypedef long size_t
+ from libc.time cimport time_t
+=20
+-from numpy cimport int8_t, uint8_t, int16_t, uint16_t, int32_t, uint32_=
t, int64_t, uint64_t
++from libc.stdint cimport int8_t, uint8_t, int16_t, uint16_t, int32_t, u=
int32_t, int64_t, uint64_t
+=20
+ IF UNAME_SYSNAME !=3D &quot;Windows&quot;:
+     cdef extern from &quot;unistd.h&quot;:
+--=20
+2.25.1
+
diff --git a/meta-python/recipes-devtools/python/python3-h5py/0002-Proper=
ly-cast-arguments-to-H5Lunpack_elink_val.patch b/meta-python/recipes-devt=
ools/python/python3-h5py/0002-Properly-cast-arguments-to-H5Lunpack_elink_=
val.patch
new file mode 100644
index 000000000..0f77f745a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-h5py/0002-Properly-cast=
-arguments-to-H5Lunpack_elink_val.patch
@@ -0,0 +1,27 @@
+From 9ed4f80fd482e135119086fb2015ca97dce306ae Mon Sep 17 00:00:00 2001
+From: Orion Poplawski <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:=
orion@nwra.com">&lt;orion@nwra.com&gt;</a>
+Date: Thu, 15 Feb 2024 20:47:50 -0700
+Subject: [PATCH 2/2] Properly cast arguments to H5Lunpack_elink_val
+
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://github.com/h5py/h5py/pull/2380/commits/704e13ac83b42898514610c4df9f=
32f367e767e4">https://github.com/h5py/h5py/pull/2380/commits/704e13ac83b4=
2898514610c4df9f32f367e767e4</a>]
+Signed-off-by: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+---
+ h5py/h5l.pyx         | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/h5py/h5l.pyx b/h5py/h5l.pyx
+index 60b252fa..af725bdb 100644
+--- a/h5py/h5l.pyx
++++ b/h5py/h5l.pyx
+@@ -184,7 +184,7 @@ cdef class LinkProxy:
+             if info.type =3D=3D H5L_TYPE_SOFT:
+                 py_retval =3D buf
+             else:
+-                H5Lunpack_elink_val(buf, buf_size, &amp;wtf, &amp;ext_f=
ile_name, &amp;ext_obj_name)
++                H5Lunpack_elink_val(buf, buf_size, &amp;wtf, &lt;const =
char **&gt;&amp;ext_file_name, &lt;const char **&gt;&amp;ext_obj_name)
+                 py_retval =3D (bytes(ext_file_name), bytes(ext_obj_name=
))
+         finally:
+             efree(buf)
+--=20
+2.25.1
+
diff --git a/meta-python/recipes-devtools/python/python3-h5py_3.10.0.bb b=
/meta-python/recipes-devtools/python/python3-h5py_3.10.0.bb
index 8a9158525..d557a8188 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_3.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_3.10.0.bb
@@ -7,7 +7,10 @@ LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E" =
href=3D"file://LICENSE;md5=3D113251d71fb0384712c719b567261c5c">&quot;file=
://LICENSE;md5=3D113251d71fb0384712c719b567261c5c&quot;</a>
 SRC_URI[sha256sum] =3D &quot;d93adc48ceeb33347eb24a634fb787efc7ae4644e6e=
a4ba733d099605045c049&quot;
=20
 SRC_URI +=3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file://0001-setu=
p_build.py-avoid-absolute-path.patch\-file://0001-Fix-Cython-3-compatibil=
ity.patch">&quot;file://0001-setup_build.py-avoid-absolute-path.patch \
-            file://0001-Fix-Cython-3-compatibility.patch&quot;</a>
+            <a class=3D"moz-txt-link-freetext" href=3D"file://0001-Fix-C=
ython-3-compatibility.patch">file://0001-Fix-Cython-3-compatibility.patch=
</a> \
+            <a class=3D"moz-txt-link-freetext" href=3D"file://0001-Use-l=
ibc.stdint-instead-of-numpy.patch">file://0001-Use-libc.stdint-instead-of=
-numpy.patch</a> \
+            <a class=3D"moz-txt-link-freetext" href=3D"file://0002-Prope=
rly-cast-arguments-to-H5Lunpack_elink_val.patch">file://0002-Properly-cas=
t-arguments-to-H5Lunpack_elink_val.patch</a> \
+&quot;
=20
 inherit pkgconfig pypi setuptools3
=20
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#111389): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-devel/message/111389">https:=
//lists.openembedded.org/g/openembedded-devel/message/111389</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/107411257/3616873">https://lists.openembedded.org/mt=
/107411257/3616873</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.=
openembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/=
g/openembedded-devel/unsub</a> [<a class=3D"moz-txt-link-abbreviated" hre=
f=3D"mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </body>
</html>

--------------hgF5Si6Oiirr6SNsAp9e9eLK--

