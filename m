Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E58DC25B78
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 02:07:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6104.1716430050010065093
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 May 2024 19:07:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=58736b22d2=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44N0rd18016379
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 May 2024 02:07:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y9ums81ca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 May 2024 02:07:29 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 44N27SXT018289;
	Thu, 23 May 2024 02:07:28 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y9ums81c9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 02:07:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BK7gdhhxcdo2sCNOTFfWcT2IBfYdd1C6YbWizkxRVOaeI94blYjnvuzaoR4xXynukhJWp0SuwSDvSX/KO42bOc1ELAaKWB7J5EsMJb5pxae6oqo0173ukkihGUFw6jE8V5tzESC906BnrQDmXlrYC6TCZdrJwWa4FFLo8MzIHCcaw/YwhLO1lyz6BuS0yyQBuOiNH3MGG+ol9sIJOPOqWNWFi1JPfVyZ8zKjacNItj9swgjEgRRuc8ll7y9OUUZuk+pI4emUd0qs5m6cl7JmO3omPxodVnqvoWSUtFSvA4SuxITajJbnan9JbYysOSLAoKv8UsDc9kfKTltvDb6JsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocL54HcLxv+byiUcuhFLRxYlKi2E5Yw4T+LFn14XxN8=;
 b=TSZlRtn6U6GzMz+IclwNxxm1Fun12fC3tr+c2t+Ii9xQYjYZIJTbrgJ/ChZ3nDx+7/KR4O7CfQlYd5xkN52jg5r+gmx+QM32buJLNMidgLiZN8SxFnrPPCbhXnPWP0m5r1Y9+4LvXO490iBG1Eo2TImh5QHggxImZXo5f0uTwKyhAf7apElL4DGkvIun8/W2U+MtblCOih1J90otJBTB5V7Jkizp8gZYnRJkD6mxHnbbEvfN/9E2RrByBRU8PxfE5tLNqY/wf7eBNYqd9DzbeiMNAS4DXZr8Yp94scu2ZvtFFBaJppRnBQ5Wos/OI/JCTQlJJT0NQCeAJFkJ90fhFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DS0PR11MB8687.namprd11.prod.outlook.com (2603:10b6:8:1be::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Thu, 23 May
 2024 02:07:24 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 02:07:24 +0000
Content-Type: multipart/alternative;
 boundary="------------GB5gUhcKWJoBThnTuNfZrdRa"
Message-ID: <e2ff382c-8c1b-4e77-af83-9232c712021e@windriver.com>
Date: Thu, 23 May 2024 10:07:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [master][meta-oe][PATCH V2] fuse3: remove sysv init script
 and install fuse kernel module explictly
To: Khem Raj <raj.khem@gmail.com>, changqing.li@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
References: <20240523015510.1988259-1-changqing.li@windriver.com>
 <CAMKF1soJhcOmVx_XY68_-=FFEpvneAgeVNea47sDuRMbySknfA@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CAMKF1soJhcOmVx_XY68_-=FFEpvneAgeVNea47sDuRMbySknfA@mail.gmail.com>
X-ClientProxiedBy: TY1PR01CA0186.jpnprd01.prod.outlook.com (2603:1096:403::16)
 To DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DS0PR11MB8687:EE_
X-MS-Office365-Filtering-Correlation-Id: 29b1cb60-2cfc-4ec4-f2e4-08dc7acd1654
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZGVxaXJyWjV4eEUzSzZLQy9UMEgyMDZVSnd1c3Nna25CWUwzMy9BU01hbU5O?=
 =?utf-8?B?ODBJMnVJNGE4bVNXMC9OSlAwTzJvTGJrOGJSSzg0SllBQXdoQnlCNjNMb2tw?=
 =?utf-8?B?Rnd2ZWd2THlHWXloWFRzYUZUSXdUUEtMb1BjQW82Uk8rTG9qQ0FwbXBORVh5?=
 =?utf-8?B?cFdHR0RpVTdkTnoyc080ZEJjVFRSbmxxVEF5bHc4aEFuMGlXUzlHeUtxbERl?=
 =?utf-8?B?ZUNqU3cvNGRHSnAzMTl6c0MxdmE1Y1dvdjZwcHR6UlJMdGdWdjZtdzZvUWhU?=
 =?utf-8?B?U25BRlAyeWhSWjJmQjlvOWlFMVM4SkVid2dJZlNtcEJ4YkVWV3NEeS8rYjNL?=
 =?utf-8?B?T0plR1JOZkVJWU9hcWdmS0dEYXZDMG9udVNWUWxjQTRGQ1k5THhaVEVRcjZM?=
 =?utf-8?B?ZU0xT0VkVGhyQ2dTMlYyNG9BUG43VGVsQ0UvVkROYmdZK25xQ0V4OXdJNjRB?=
 =?utf-8?B?MUhCVEZaRzBOMC9kZjVyZUtjem5jTUkxY21rVEh4ajIwOWRnSUR3cWFDNXZJ?=
 =?utf-8?B?TE1OaXJMZ0pZbklTZHM2eThqTjhUKzVnU3AydzByUGZJVkYrVElkaFJaSlha?=
 =?utf-8?B?cnhLS3cveVBGOVZ1UXUrSkF3aU12d01YQkRpbzJUd0h5d2JTVzF6QTJVazRl?=
 =?utf-8?B?UURrK2c4eGdHUkJ5NnVjSmltenBKU3hOcFZ1TStjZFh4bmlkMG5pblJKbkVB?=
 =?utf-8?B?N2lpZmkzM0lzeGZUemgyOE1vZVZ5U1lla250YUYvbWNOS1JZbnoyQksrMXN5?=
 =?utf-8?B?SXpEcUlsWHo4enh4WWdBNWFRSGptOWZEa1ZxRk0vM1BPY2UrTWFXZXdqdmZs?=
 =?utf-8?B?cHBNNGc2UjNnYXVaSGh4U3lHN1MrWm83NktMRHloOXlnM2FBcWR3TXdPS3Jn?=
 =?utf-8?B?OVhGM2MrejBkNmVDakh2WEUvQ1JTVU1JLzRFUnB5bVR3R3FHZWM0b29CcEY3?=
 =?utf-8?B?SDNTbDRjQXVmZGEyVGFObVFQVWxBR3Jzcmp5RXRuMVVkTWc0eCtncWxORFVt?=
 =?utf-8?B?RUhTQTdZaHprdmlNUGFIMU9vendESU8zdXlDWFd6OXJ1cXpUbzVwdzdEL1hm?=
 =?utf-8?B?MitON29WN1BVWHFjTnhGelc1NTE3L0xYbkZXYURNVGhvNTFaaXBrWGordUZX?=
 =?utf-8?B?c21YekRPRko1WDFWUnNXUjNQNVVyNmg1dmJRdlJvWmhyQUs5MktZRUwxTmg3?=
 =?utf-8?B?cWp6Zk9ubkx3cDBXbStST2ZJSnlzbGkrKzgrMU1NMm1hdllmQjBCZGJEWmFl?=
 =?utf-8?B?N0U3ZjJLTHJRU3lNd3J2eHIwSmY2WGwveVJGdmM0bFA2NGp6TDVjNlVtbzdv?=
 =?utf-8?B?ZkhlVlVRZ2lVb2EzNFdHY1VPVW51N2QvNS9HOUhlNVRndkRRMWhTVS9jQmFK?=
 =?utf-8?B?OFBWRWN2OG5ZR1RjQUxzMjhwSmtEUUdaQ2I4Q3NsZjVGS0ZoTktVc2pORE8x?=
 =?utf-8?B?b2pBVlZiSXd1YVVxSjc0eWN2REhSdmhaMTBlK3dNS0lRRUhSUFVReTFMbkpX?=
 =?utf-8?B?UlVxQkVhNndWZ3lJcHI3MVQ0a3JxbHhNU2U5ZVBKWXh1U1FoWmpFNktpOTc0?=
 =?utf-8?B?TE1NWTVvNzltUnZwVFloVzdOb2wzZ3JJV0lTaTRLNE1yYXc1RE1CakVZd3hm?=
 =?utf-8?Q?W/6q1e71E8VdAhTxcGRsUXRQm0X6xMnXCMLU4wfp3e5I=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RHdNSG5EL0hZRlprSko1d29YR3hZQWcxK2p3cUFQdndJMEZnZjJ1RVdMNWZ3?=
 =?utf-8?B?aWorUXg0WXVCd0o3R3lGTkVkbXMyK2pIWUdFTkdxQjVtV0kyZi9wZ0JmWm5R?=
 =?utf-8?B?aEhrejhNOGFJanVseEowaU1ycHlHSWFWZTUrQW9UZjdtN01VRWNOVFplc3RF?=
 =?utf-8?B?aDByaWU5M1JIKzhIOHgwMHlQd05tMUx0bkxmNEIydDlBM1lqb1cxdDJxcjJP?=
 =?utf-8?B?TFNySnhFS0UvS3g4MmJxWGoxQ0NvSUdNR0NuZ1h4dThtaTZOUnhWOGU0Mkl2?=
 =?utf-8?B?MER0VFRYaGlQVWRXbWlJNmRCNUtEaWhLQ2hSOHF1NDZmeDlGTFNRQVJZcGU4?=
 =?utf-8?B?aENMRzdBUDFvZ3UyM0JsaG5qTEJZdHpVTzNOQXVsUkxvbFplVXlvS2UzNGtu?=
 =?utf-8?B?OGxqM2tUb3hRbUdqR3lBUkJWbEtlZWtucnV3TlV3WWdJTzMvbUZZcEhhR0lv?=
 =?utf-8?B?WW1ydEJHQ3FPN0lRQVcrUlJ5dWJ2bUlvSXpzbDJCckJ3TXo4bTFvdy9jNDlD?=
 =?utf-8?B?b3pDOGxOQTNlT1RwenF3d040cndCWUFIS01HNDNzei9TbzF5NXhqVWdKWXRl?=
 =?utf-8?B?QkJ0YzI5Ky9VbUxQVzBVdFhzWXJiZWlFL3VLQXRxajhleGZCbTZHcHBOSjBa?=
 =?utf-8?B?YTFRbUxaT3Nsbkd5NEFwVE44THI2L3BRd1NNNXJ5b3BFL2FzWHRaQ0lrL051?=
 =?utf-8?B?V3RpYWcya2hlUGtTcEk0WWppQUR4ZXpqaldhV2VKMmdiMENKSlBHZk1WY3Vn?=
 =?utf-8?B?UE5McWJTY2d5T1FERW13SHUyME1rT0hBcDFQdUloaUpwU3dzZG1Ycll0WXM4?=
 =?utf-8?B?RWNvZEt2TmxDOHdTK0wzV0JLb2hzcUV1ZFZVU3BocDZNTUhaMEc2b2M3ZjBr?=
 =?utf-8?B?d3VFU01aYVh0Vmk4ODNOVUk4TzZRZXBnNktYaEM0SEdQU3RJU3BsVWRLRExV?=
 =?utf-8?B?anRoT0w3QkdMNzNQaER6TlZpVjlhejZEWGhXT2pZOTNncUpGYWU3ME9sSWtG?=
 =?utf-8?B?UkwxQmVUazhPZkswYThmczE2eFdxVUZZdFdJekVZQktWYzNNcFBkUUg0cStW?=
 =?utf-8?B?Tm5tMWV0bzNhaWJiZU5GajZibnpyTWJYdVhjTG1hM0tRaHpva0tlbGZ6WnFF?=
 =?utf-8?B?bmVuais3SFdOZXNNRDdHQWJSWHJYOU5mR0NIY0pnbThTVWtYY1dnTFY2SStD?=
 =?utf-8?B?QndqaW5GNlNlaHVmNENqc01SREdpQlBmd29MOWFkc3BkaTIyRGJMOTJoaURS?=
 =?utf-8?B?bVg2ZXhVTXBIVzlIeGtTb0F2SDU0Q3NlbUY2alpidmtnUzJ2TkhBaTBCV0hH?=
 =?utf-8?B?aForem96SHRSbTk2VE1wa1NtM1FmZndrSVJSWUJCNk1NR21VNEk0Tms1emZV?=
 =?utf-8?B?ZVF2akVTMXNHU2hvbVNiMUZXTUgxNlZydGE0dVhsaWRoU3k5UENnQ2F2QklS?=
 =?utf-8?B?NkMvY3dpTU9XU2VNYTJrOElzZkRZN0dtYlFmYTVWd2hnK04zV0hGMFdvYk5o?=
 =?utf-8?B?M0VjR1JSR0RpWStkbVhWR00xeEh3QjMvR0Z2ZDBoNW9JRlVRNWg3M1Jjd1ZO?=
 =?utf-8?B?WExvcU9ZYkpnRzVDb2dzOThIYnRySHgwQ1ZRQkc3bHcxK1JFaHNTaTBLaG0v?=
 =?utf-8?B?TGlRUEdJV2dwOUM2UVdwc1NEeWNZMXhQMEd0MUNEb1VoMW9MMm9LZWJCb0ZQ?=
 =?utf-8?B?V3QxdlRIWkNJbkxqVlVhd0paYXA3MUFtR0hYbGRFbTFWbnNLMVdRd2VJTUU5?=
 =?utf-8?B?Q1FFYU9CRWxJNGlEbDE1ZXNDcm9KMVRrMjNJaXQ0ZHd1MjdNREtoekVFVTM5?=
 =?utf-8?B?MFp2TzlIUHFUYSt5RDhWM1ZqSEFvSG9aQnBMM0lPOWNBM0srN3kvTndsTWFk?=
 =?utf-8?B?d2NueWg2cHdieW1rb1VYR3RhZ0Naa1B6VG0wdjFrZ3dtTURzaEY3TGJ6cHA3?=
 =?utf-8?B?MUNBWk5zc1FTOXp3SzhFa0xKK3hKRWlnYytoaStheWloLzgrUkQ4KzVtRm5E?=
 =?utf-8?B?a1BqblErMlBZUERZbnljTzJnSUtZcVZZZVQvWHRUcTJvNUNZQjZBckxzOHZ5?=
 =?utf-8?B?REt2UEhZRUdCNS9rb3BxbkpiRDlTZHgyLzRJZUxQamRRdldLekRoczhqaXl6?=
 =?utf-8?B?djBXb1pTNVJiOGpoeG9FWE55OUhZM0g4RGMxVjhMbFpReFNISk5qWHdCZThY?=
 =?utf-8?B?VVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29b1cb60-2cfc-4ec4-f2e4-08dc7acd1654
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 02:07:24.3687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iwuCxxoK8/Dat70j/ApCruutkxlwCz29ox/+tfpry6Ml9aAgdmUARkO23cuYIkI2JNbaytQBmPlxhGO/i/fBmCNGtYX0IeTsZLaSBuXrUs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8687
X-Proofpoint-GUID: DXl_pwvylEjkA4Q9MdgeQ_aGjQEIYyi_
X-Proofpoint-ORIG-GUID: IKdNz_EOWHP_aiHPIZY3YFrpoJqC6Iq6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_14,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 phishscore=0 mlxlogscore=999 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405230013
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 May 2024 02:07:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110494

--------------GB5gUhcKWJoBThnTuNfZrdRa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 44N0rd18016379


On 5/23/24 09:56, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Wed, May 22, 2024 at 6:55=E2=80=AFPM Changqing Li via
> lists.openembedded.org
> <changqing.li=3Deng.windriver.com@lists.openembedded.org>  wrote:
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> For systemd, there is not a fuse.service since systemd provides
>> sys-fs-fuse-connections.mount to mount the fuse control filesystem, so
>> instead, only fuse3.conf is added to modules-load.d to load the requir=
ed
>> fuse kernel module.
>>
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ---
>>   meta-oe/recipes-support/fuse/fuse3/fuse3.conf |  1 +
>>   meta-oe/recipes-support/fuse/fuse3_3.16.2.bb  | 15 +++++++++++++++
>>   2 files changed, 16 insertions(+)
>>   create mode 100644 meta-oe/recipes-support/fuse/fuse3/fuse3.conf
>>
>> diff --git a/meta-oe/recipes-support/fuse/fuse3/fuse3.conf b/meta-oe/r=
ecipes-support/fuse/fuse3/fuse3.conf
>> new file mode 100644
>> index 000000000..a517c488f
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/fuse/fuse3/fuse3.conf
>> @@ -0,0 +1 @@
>> +fuse
>> diff --git a/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb b/meta-oe/re=
cipes-support/fuse/fuse3_3.16.2.bb
>> index 307544bf3..b799b2c6b 100644
>> --- a/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb
>> +++ b/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb
>> @@ -27,6 +27,7 @@ inherit meson pkgconfig ptest
>>
>>   SRC_URI +=3D " \
>>       file://run-ptest  \
>> +file://fuse3.conf  \
>>   "
>>
>>   RDEPENDS:${PN}-ptest +=3D " \
>> @@ -78,6 +79,20 @@ FILES:fuse3-utils =3D "${bindir} ${base_sbindir}"
>>   DEBIAN_NOAUTONAME:fuse3-utils =3D "1"
>>   DEBIAN_NOAUTONAME:${PN}-dbg =3D "1"
>>
>> +SYSTEMD_SERVICE:${PN} =3D ""
>> +
>>   do_install:append() {
>>       rm -rf ${D}${base_prefix}/dev
>> +
>> +    # systemd class remove the sysv_initddir only if systemd_system_u=
nitdir
>> +    # contains anything, but it's not needed if sysvinit is not in DI=
STRO_FEATURES
>> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'false', '=
true', d)}; then
>> +        rm -rf ${D}${sysconfdir}/init.d/
>> +    fi
>> +
>> +    # Install systemd related configuration file
>> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'fa=
lse', d)}; then
>> +        install -d ${D}${sysconfdir}/modules-load.d
>> +        install -m 0644 ${WORKDIR}/fuse3.conf ${D}${sysconfdir}/modul=
es-load.d
> This should be UNPACKDIR instead of WORKDIR here.

Thanks. Will send a V3 and fix this.

Regards

Sandy

>
>> +    fi
>>   }
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#110492):https://lists.openembedded.org/g/openembed=
ded-devel/message/110492
>> Mute This Topic:https://lists.openembedded.org/mt/106255586/1997914
>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub =
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--------------GB5gUhcKWJoBThnTuNfZrdRa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 44N0rd18016379

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#cceed0">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 5/23/24 09:56, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1soJhcOmVx_XY68_-=3DFFEpvn=
eAgeVNea47sDuRMbySknfA@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Wed, May 22, 2024 at 6:55=E2=80=AFPM Changqing Li via
lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:changqing.li=3Deng.wind=
river.com@lists.openembedded.org">&lt;changqing.li=3Deng.windriver.com@li=
sts.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
From: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:chan=
gqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

For systemd, there is not a fuse.service since systemd provides
sys-fs-fuse-connections.mount to mount the fuse control filesystem, so
instead, only fuse3.conf is added to modules-load.d to load the required
fuse kernel module.

Signed-off-by: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta-oe/recipes-support/fuse/fuse3/fuse3.conf |  1 +
 meta-oe/recipes-support/fuse/fuse3_3.16.2.bb  | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-support/fuse/fuse3/fuse3.conf

diff --git a/meta-oe/recipes-support/fuse/fuse3/fuse3.conf b/meta-oe/reci=
pes-support/fuse/fuse3/fuse3.conf
new file mode 100644
index 000000000..a517c488f
--- /dev/null
+++ b/meta-oe/recipes-support/fuse/fuse3/fuse3.conf
@@ -0,0 +1 @@
+fuse
diff --git a/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb b/meta-oe/recip=
es-support/fuse/fuse3_3.16.2.bb
index 307544bf3..b799b2c6b 100644
--- a/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb
+++ b/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb
@@ -27,6 +27,7 @@ inherit meson pkgconfig ptest

 SRC_URI +=3D &quot; \
     <a class=3D"moz-txt-link-freetext" href=3D"file://run-ptest">file://=
run-ptest</a> \
+    <a class=3D"moz-txt-link-freetext" href=3D"file://fuse3.conf">file:/=
/fuse3.conf</a> \
 &quot;

 RDEPENDS:${PN}-ptest +=3D &quot; \
@@ -78,6 +79,20 @@ FILES:fuse3-utils =3D &quot;${bindir} ${base_sbindir}&=
quot;
 DEBIAN_NOAUTONAME:fuse3-utils =3D &quot;1&quot;
 DEBIAN_NOAUTONAME:${PN}-dbg =3D &quot;1&quot;

+SYSTEMD_SERVICE:${PN} =3D &quot;&quot;
+
 do_install:append() {
     rm -rf ${D}${base_prefix}/dev
+
+    # systemd class remove the sysv_initddir only if systemd_system_unit=
dir
+    # contains anything, but it's not needed if sysvinit is not in DISTR=
O_FEATURES
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'false', 'tru=
e', d)}; then
+        rm -rf ${D}${sysconfdir}/init.d/
+    fi
+
+    # Install systemd related configuration file
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false=
', d)}; then
+        install -d ${D}${sysconfdir}/modules-load.d
+        install -m 0644 ${WORKDIR}/fuse3.conf ${D}${sysconfdir}/modules-=
load.d
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
This should be UNPACKDIR instead of WORKDIR here.</pre>
    </blockquote>
    <p>Thanks. Will send a V3 and fix this.</p>
    <p>Regards</p>
    <p>Sandy<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1soJhcOmVx_XY68_-=3DFFEpvn=
eAgeVNea47sDuRMbySknfA@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+    fi
 }
--
2.25.1


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#110492): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-devel/message/110492">https:=
//lists.openembedded.org/g/openembedded-devel/message/110492</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/106255586/1997914">https://lists.openembedded.org/mt=
/106255586/1997914</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.=
openembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/=
g/openembedded-devel/unsub</a> [<a class=3D"moz-txt-link-abbreviated" hre=
f=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------GB5gUhcKWJoBThnTuNfZrdRa--

