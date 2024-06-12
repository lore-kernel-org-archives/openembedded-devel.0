Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D94C27C53
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 06:54:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5397.1718175274631752568
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 23:54:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6893ecd054=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45C5I6wt029522
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 23:54:34 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ymjk2bmyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 23:54:33 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45C6sXtx001459;
	Tue, 11 Jun 2024 23:54:33 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ymjk2bmyw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 23:54:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZBX5aKLD6u2qoVV6b7KQ8CqXrS+HR7Zf8BkfLdPfuBYVAkGG6Z1xh0mkCDWZbf+IIiRaqptY2rcm2iy19yR7OOD66U0Co4AvmFEROtvvj28P4NXz7vjcue8B6FY1Q7A9T+Kdnnq6txw6uTP1fJQwilhwtQ/z73MSW6+lQs0f7lwe4snzI7ySmd5c+W0P69u3mXDSZy4KkFfXVPISB5kxoPoizCj22YRBhbprCsu+LOv3tS0drlo5le1sE4oZFINhs/yhWwuougVfaf8TE27lSxlmOBvUY1bvvpJ++gZie0EpwVUDowuQ8Dm08IBBwH8btV7+WMmoOsPGW38PE6rcOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RxkyTXUwKOUMprJ5a62f9dmx4oeppVdPaVZvLoxRT0o=;
 b=NZU7CCtEbQdQovfcQSAEDpI4+VCv7eYgQsFGQAnScRyp+wrgyhu3PyG96MQ8vLQAC/PS9yNGGinDXZUiOtVgPDCoLqCPgUwoojHBPRTXb/X+SIes7rnaSZV46R4rp5xdpQi7BAZ0341eJvi8nimJf+4K8kv76/OnXbxamx6B3PThfKky7zdINe8yYMsdjDIZ8Relj8w1+YhvZmZUVhtrU+DranGAIBal6l8d3z5tFd+k/0AYE2BXeFemxS4kr8G4/UkGTB/0j2UWrb5YoT0NnMfwbGImQSrglrrwuY8mwH8blH6fxmMFw1W2eQFCS6Vn0F1PMw8Z5HjQIx0JRY5YTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB8264.namprd11.prod.outlook.com (2603:10b6:806:26c::17)
 by PH7PR11MB6929.namprd11.prod.outlook.com (2603:10b6:510:204::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 06:54:29 +0000
Received: from SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569]) by SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569%7]) with mapi id 15.20.7633.036; Wed, 12 Jun 2024
 06:54:29 +0000
Content-Type: multipart/alternative;
 boundary="------------b0Fd7nMl0lB4OopmpHV5fWh1"
Message-ID: <4c0e4697-a2c1-4fcc-a89a-3b9ffe3c2d83@windriver.com>
Date: Wed, 12 Jun 2024 14:54:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-xfce][PATCH] xfwm4: fix gcc
 -Wincompatible-pointer-types
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20240610113822.3231543-1-kai.kang@windriver.com>
 <CAMKF1soPwSJAk7=+3c1p4hzb3yrCMYYXKHWoPiLQwJVUjxgRTQ@mail.gmail.com>
Content-Language: en-US
From: Kai <kai.kang@windriver.com>
In-Reply-To: <CAMKF1soPwSJAk7=+3c1p4hzb3yrCMYYXKHWoPiLQwJVUjxgRTQ@mail.gmail.com>
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To SN7PR11MB8264.namprd11.prod.outlook.com
 (2603:10b6:806:26c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8264:EE_|PH7PR11MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: d145e4f1-081d-4829-d049-08dc8aac8165
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230032|376006|366008|1800799016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y3hoM011OXFnY1F3OUhhZnZ5YXF3MHd5cmVkdW9sYzVTdmgreU9UN1ZBMFZF?=
 =?utf-8?B?aDJ4SEFuZCtuLyt4MVlRUjZSQzFZTGRuNUdHeVY3QUZGK2Q4aFZHQUdXRGky?=
 =?utf-8?B?Y2wzeVUzZTdrZlUvOUZhbWN2WUpLN05LOWloNXgzYTE0R2hYd2NTdmlrMW9w?=
 =?utf-8?B?enBUKzNTTnpoZlZYVGozL2k3cHN4V1k2TlBJemtidHF6S1lPY0ppTWRNNHlO?=
 =?utf-8?B?QmtLbjBuYVM2enFTR1lGVVF5YUJCNWlhMEZuUTVzR0RSOENqTGNlTVJzOVVq?=
 =?utf-8?B?Q3lhc3YrNDZNUFBjRThNRlFENEx2MyttR0cxYXRUWkNGK05nUXJsNW1ad3JS?=
 =?utf-8?B?eWFxV1B1bGZRWS95dG1UOEhKS2x2Z2VENE9hbjhHL1B5WWh2TktMZWdiNk9r?=
 =?utf-8?B?T2JrNFhweHcvTFcyY3pJTDVkSk40WUNCZHloSkNmWkNaUVJ2YW0xWDh6VGFs?=
 =?utf-8?B?TG5TWjNMTkhJalZBZGNOVllpVGlSVFJ3Yy9Nb2RHRzJCck96UzQ4Y0lybnZX?=
 =?utf-8?B?V1g5L3dBUDMybUM2a0hRM2pYSXQ2dTBJaW0ycEZTZ0ovUWlzNGVIWGpqMVZx?=
 =?utf-8?B?QWVVOVB0bG1Sby9FSDBFcjg3cS9oQ2hoYTNrZ1BmU2tXZEN1SXdrZDlJT3d5?=
 =?utf-8?B?eUdhOE5KLzNzWjdGYW5sRW9EUEdiN2lPS2xSSDROcjErZVBmV1FkZnF5VTU2?=
 =?utf-8?B?T2ZQRlhTVTd6bFp0MGVVeHNXakpONGtwejJOS0F4YS9LbkJHS0J4eFI4WHBn?=
 =?utf-8?B?ZWtIa1VLVFR4QnJYQU96UkxrY0JXK0s1SW5sck9TTEdVUG13MG9WbEQ1K0p1?=
 =?utf-8?B?YlYzdmtRcFNTbnE4M04zRU1Gd1g5WjgxTnRqbTRoM0NteVZ3L2VOWnhERG41?=
 =?utf-8?B?cmFoci9FY3MyaUYwL0xIblZTNmc4OVhYSTFuWms1Tnd4ZDExZ1RMRUhMa1Qr?=
 =?utf-8?B?UjZ5UTZReXUyZU9FUkw4anVnVUhVSjBETytmeVhmRXBQcUs4citNZzNXY1dV?=
 =?utf-8?B?NkoxWS9TTXgzbmFsaUVuREpUM1djTWtxSWphWXhSanJ0bUIwQXA0RlNDT3c0?=
 =?utf-8?B?eXI1ZnZMeWpXYlJEcHdCNW1GSFhnNVVZSW83WldORnFsc0hiaGVlZ2xwNW82?=
 =?utf-8?B?bS9KNjlnOUh6THZ0WEs4MldhSVAxenVvY2RWNVZsYjJsTE5kQXROS0lJcnNI?=
 =?utf-8?B?N3hqOG1EcHJYc2J2Zmxud3FDUy9HWjFFSHVDem0yQnpSOVYrQlNaTjd0Vkg0?=
 =?utf-8?B?OXJqblVHemVrT3hUSi9IbUlITDljZk16dHZPODRreU5qN1ZaeFRUU0MvdWJ2?=
 =?utf-8?B?L01Pd212RVN5ZDRRcW55SW4rRnBXbkhndXkvMTY2L2xmK2E4WUZnbitxSlFR?=
 =?utf-8?B?b1hqSkdDbWJBRnI3akdQZDVYYzdzeXphcDZueFBTdzhKd2pYa0F6VlJncXZT?=
 =?utf-8?B?VFRKdm1TMmFzWjBOeWlCVW11SlNSb1RNMTNWYmlvZk8xVGZmZ3N1RzdnMWZh?=
 =?utf-8?B?dlZrSHg4L0JYOFlCVWtvVitNc25SejhqMWV6UVJkZnFOZjBMOU0yN293U0R4?=
 =?utf-8?B?cUhwRW5LZjZzc2lzMTZyK2FjYUNLSnFHYTRhN1ZkSmFmelYrdGVtOFIwOUFt?=
 =?utf-8?B?YXNWMHVVY0huNFcwV3V5WWY5aUgvNEZoTy9hVnJNUjBLVjdCU2FZUHNQQ0h2?=
 =?utf-8?B?U3pkOUNVN0V4Ulk4b2tkWDhDK1hMTFdnSTRWRldRak5PVllycnRBc2FnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8264.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(376006)(366008)(1800799016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OEIxTTcwME9MVUpZcWdpbjU1dDBGQnFCMUFxUm5ES2tKZ08vMjlNZlNxK2tS?=
 =?utf-8?B?c3B3Q1ZEbnlpNGo5OTZhUFRBWDgyK1RLeWwyeVNGeGYrMG1nL1BraEdUSXR4?=
 =?utf-8?B?Y0NLRmRwSW5hWFhOWW13MkpHVU16cEdnWEk5TmZJS2E3UGUvaVp6R2E1aGI4?=
 =?utf-8?B?TUgwQmpiT2JHUHNFYTMzempFcTVIN0kyYzFyZWZ3SW4yN0F1SHQ5QWpFOU9M?=
 =?utf-8?B?Tkx3L0s0UC9TcEFURE5Yby8rUkc4bzVVTUJtbS9rUmJBSFpHRUNhdjd6TThm?=
 =?utf-8?B?a1JlSjZxakJYekx0M1lRYmVNODlOZFJlcS9vZUpQc01DYTdZSnFHeC9QeUh3?=
 =?utf-8?B?VHcxY1liWlJtNmd2L2FlRHltNFYvbnRwR1NtSitJR0VQTnRSRWI5cnowcmVt?=
 =?utf-8?B?TTlmWm9DWkZRUjdiQ1k4ZmRHamZOVkwycy9jMS9CQStaYmRidnJBQXg3MzRv?=
 =?utf-8?B?WGpoREZZNGZiNEo3bE1FdHJvNVIxWnJGQlpoOWxvZ3RxUkJ0M0dadkU5cEtl?=
 =?utf-8?B?b0EybUwvSzgxQ2NnUGhrVFl0SFBSTEdIMTFvUEppKzV1Tjh1eTYvYkpPVGNO?=
 =?utf-8?B?MVRxVWIvMDFxRGRIMU4wL09ibGY4L011LzMyNDNwa3ZFUHk1ZzNiakxoekUx?=
 =?utf-8?B?SytDL0ZOM0phYmdPSVZ0Vm9VTmhiWjduTHpRMWQ5QURhWEpXSTk1MFZ3Mjha?=
 =?utf-8?B?aXFJYjh0NzJTcU1NeDlaQVltenB0NWxqZCtEV00rWXZYWmh0ZWlCODJUU3V4?=
 =?utf-8?B?cGxLT1NoWmE2UU12VTRjUFBJS3Y5bFBzK05wbTUvOGV2ODV1WVhnVkhGUGJD?=
 =?utf-8?B?Q2taYktudGdKaHhUTGhVZkYyQ0phVXNZaTlCa3V3L3Fuelovc1dWcXAza0JG?=
 =?utf-8?B?c2ZiTmx0R2RCRGsxdVBvRUF2UFNIbXpkYm5JNGlOV01ibkNGZ0FsNmNUVkdG?=
 =?utf-8?B?eGsvUThHL3IwUTUzL2d2ajd6K2JtN2ZjL0FtNlBxbElSemx4QzZUWFAyci8x?=
 =?utf-8?B?SlM4U3dzQ0lYU0R3Y3RIT0diMkFuVFRaRnAxcllIQlB1ZVV5TXZaVWxkL1Nq?=
 =?utf-8?B?VVNscGh6UGxrazZ5SmhNeHNWTVJQaFhacHZyZ0RYMFptTTlUdWZDaFZKdkpT?=
 =?utf-8?B?ZDZ4cHM4aFkzQ3RBTkRKR2l2eG1UVjhBOTFVMjhmMExqbUdhY0ZZK1lwdzIr?=
 =?utf-8?B?eE1lOW9VZTB3SGlvZjJFTDZMZlFsN1dFTVNiQUtmM3duWGlZUDIyblpUaUov?=
 =?utf-8?B?NzQ0d0thU1NJdy9PdnNUTzZmTXcrdHlITjczTHJSUkRPWWdxOGJ1cFdNeDZD?=
 =?utf-8?B?ODR0ZTdUeTFSRXFVRjgwVHpRSk9BUjdFaHBWd3M5dWYxYmErNUhJckhJcmpj?=
 =?utf-8?B?cjR4dkhXOGZ3NDlpUktTdFR2REJCZUxNZ0NtZDVEbzNZZzlqL210bzZESHJa?=
 =?utf-8?B?NHA4RW83dExMQ1NhUzVlYUlvb3d1N0thQStwUGp1OFlURERKN3htcDFmWkQw?=
 =?utf-8?B?RjQyZGM1dEtBVE9WNUs5UVd3YTQwMnViUFBLK0JtTUxWamJXanNJQTZvV2ky?=
 =?utf-8?B?SlhBSkZLNExSdkExengyM0t5Snp1NEx2NEpZNjZkNVdlbzRYZkIwVmtQTFdF?=
 =?utf-8?B?RnpKdkdqMHlJRkhlWVFXT2w4NnY2V0VTeHVQcCsrdHNJVlQvZFoxTVhVNXVF?=
 =?utf-8?B?R050YjRPUDVkRXlzcGZPdWVlRm16dE1wMDV3MWNwbVQ5c2tQbzFuMlRCKzVs?=
 =?utf-8?B?TEVFd1BFUXZqUDdIU2wxTUJXa1ZYOUdXYWtMelhVbVpSODFGZmtFdkRISmZ3?=
 =?utf-8?B?TElVSDU1TlhjaTA0RkVaZUM2aEoyM3lVL0tNeis0cVBYaFFGNVhIY1pvS3dE?=
 =?utf-8?B?QVU5NGpDMFBVRXpPM2l0SUp6dU02Rys2Q1A1NHV3ay82ZGt6WWFMU3hIeGQz?=
 =?utf-8?B?OW4xQlpNN0lKWG5ITTQxZmlWSytXWWk1b09CZk80TjBZd1BkRDNZQmpKNVRm?=
 =?utf-8?B?eEQ1ZHg3UzNsRTUyTmw2Z1lpSWtxcVNYZXMvejJROTN2S1JFeUxXV2Exbytw?=
 =?utf-8?B?WjZra25WVVpTSElLbHdpOXpxNkZLdW5MQndqSmplN0JlTVpheHJrMjJJWkc3?=
 =?utf-8?Q?zowKHWAVFTsYbU4dF2IJTazSK?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d145e4f1-081d-4829-d049-08dc8aac8165
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 06:54:29.2780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5WRNCo2mAIQZZUviy6JqH7Mqp5B9y6C3frTUvdVGPEukfgi/zDBE6DdE1MlPHWIPoaeW4Xi5lZNWScsld+7Tfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6929
X-Proofpoint-ORIG-GUID: uURC1VqpBCAOGygHyIVW0LKVH4kC0FG1
X-Proofpoint-GUID: fxSMb1wZH9UvfeeIbLJHuUp9m0KwrH9-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_03,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406120048
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 06:54:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110881

--------------b0Fd7nMl0lB4OopmpHV5fWh1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 45C5I6wt029522

On 6/11/24 14:08, Khem Raj wrote:
> On Mon, Jun 10, 2024 at 4:38=E2=80=AFAM Kai Kang via lists.openembedded=
.org
> <kai.kang=3Dwindriver.com@lists.openembedded.org>  wrote:
>> From: Kai Kang<kai.kang@windriver.com>
>>
>> Fix xfwm4 incompatible pointer type error with gcc option -Wincompatib=
le-pointer-types:
>>
>> | ../../xfwm4-4.18.0/src/startup_notification.c:139:57: error: passing=
 argument
>>        2 of 'sn_startup_sequence_get_last_active_time' from incompatib=
le pointer type
>>        [-Wincompatible-pointer-types]
>> |   139 |     sn_startup_sequence_get_last_active_time (sequence, &l_s=
ec, &l_usec);
>> |       |                                                         ^~~~=
~~
>> |       |                                                         |
>> |       |                                                         long=
 int *
>>
>> Signed-off-by: Kai Kang<kai.kang@windriver.com>
>> ---
>>   ...-fix-incompatible-pointer-type-error.patch | 34 +++++++++++++++++=
++
>>   meta-xfce/recipes-xfce/xfwm4/xfwm4_4.18.0.bb  |  2 ++
>>   2 files changed, 36 insertions(+)
>>   create mode 100644 meta-xfce/recipes-xfce/xfwm4/xfwm4/xfwm4-fix-inco=
mpatible-pointer-type-error.patch
>>
>> diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4/xfwm4-fix-incompatible=
-pointer-type-error.patch b/meta-xfce/recipes-xfce/xfwm4/xfwm4/xfwm4-fix-=
incompatible-pointer-type-error.patch
>> new file mode 100644
>> index 000000000..eb8fa7c43
>> --- /dev/null
>> +++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4/xfwm4-fix-incompatible-pointe=
r-type-error.patch
>> @@ -0,0 +1,34 @@
>> +Fix xfwm4 incompatible pointer type error:
>> +
>> +| ../../xfwm4-4.18.0/src/startup_notification.c:139:57: error: passin=
g argument 2 of 'sn_startup_sequence_get_last_active_time' from incompati=
ble pointer type [-Wincompatible-pointer-types]
>> +|   139 |     sn_startup_sequence_get_last_active_time (sequence, &l_=
sec, &l_usec);
>> +|       |                                                         ^~~=
~~~
>> +|       |                                                         |
>> +|       |                                                         lon=
g int *
>> +| In file included from .../usr/include/startup-notification-1.0/libs=
n/sn.h:32,
>> +|                  from ../../xfwm4-4.18.0/src/startup_notification.c=
:33:
>> +| .../usr/include/startup-notification-1.0/libsn/sn-monitor.h:84:79: =
note: expected 'time_t *' {aka 'long long int *'} but argument is of type=
 'long int *'
>> +|    84 |                                                            =
time_t            *tv_sec,
>> +|       |                                                            =
~~~~~~~~~~~~~~~~~~~^~~~~~
>> +
>> +Upsteam-Status: Submitted [https://gitlab.xfce.org/xfce/xfwm4/-/issue=
s/790]
>> +
> there is a typo here it should be Upstream

Sorry for the typo. And finally I find that a patch of=20
startup-notification in oe-core
which is backported from maillist causes the issue. I'll update=20
Upstream-Status with that.

Regards, Kai

>
>> +Signed-off-by: Kai Kang<kai.kang@windriver.com>
>> +
>> +---
>> + src/startup_notification.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/src/startup_notification.c b/src/startup_notification.c
>> +index 2a08cad..05434ca 100644
>> +--- a/src/startup_notification.c
>> ++++ b/src/startup_notification.c
>> +@@ -136,7 +136,7 @@ sn_collect_timed_out_foreach (void *element, void=
 *data)
>> +
>> +     sequence =3D element;
>> +     ctod =3D (CollectTimedOutData *) data;
>> +-    sn_startup_sequence_get_last_active_time (sequence, &l_sec, &l_u=
sec);
>> ++    sn_startup_sequence_get_last_active_time (sequence, (time_t *)&l=
_sec, &l_usec);
>> +     tv_sec =3D l_sec; tv_usec =3D l_usec;
>> +
>> +     elapsed =3D ((double) ctod->now - (tv_sec * G_USEC_PER_SEC) - tv=
_usec)
>> diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.18.0.bb b/meta-xfce/=
recipes-xfce/xfwm4/xfwm4_4.18.0.bb
>> index 839f1c870..2770829e9 100644
>> --- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.18.0.bb
>> +++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.18.0.bb
>> @@ -8,6 +8,8 @@ inherit xfce update-alternatives features_check
>>
>>   REQUIRED_DISTRO_FEATURES =3D "x11"
>>
>> +SRC_URI +=3D"file://xfwm4-fix-incompatible-pointer-type-error.patch"
>> +
>>   SRC_URI[sha256sum] =3D "92cd1b889bb25cb4bc06c1c6736c238d96e79c1e706b=
9f77fad0a89d6e5fc13f"
>>
>>   PACKAGECONFIG ?=3D " \
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#110796):https://lists.openembedded.org/g/openembed=
ded-devel/message/110796
>> Mute This Topic:https://lists.openembedded.org/mt/106590506/1997914
>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub =
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Kai Kang
Wind River Linux

--------------b0Fd7nMl0lB4OopmpHV5fWh1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 45C5I6wt029522

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 6/11/24 14:08, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1soPwSJAk7=3D+3c1p4hzb3yrC=
MYYXKHWoPiLQwJVUjxgRTQ@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Mon, Jun 10, 2024 at 4:38=
=E2=80=AFAM Kai Kang via lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:kai.kang=3Dwindriver.co=
m@lists.openembedded.org">&lt;kai.kang=3Dwindriver.com@lists.openembedded=
.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
From: Kai Kang <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:kai.kang=
@windriver.com">&lt;kai.kang@windriver.com&gt;</a>

Fix xfwm4 incompatible pointer type error with gcc option -Wincompatible-=
pointer-types:

| ../../xfwm4-4.18.0/src/startup_notification.c:139:57: error: passing ar=
gument
      2 of 'sn_startup_sequence_get_last_active_time' from incompatible p=
ointer type
      [-Wincompatible-pointer-types]
|   139 |     sn_startup_sequence_get_last_active_time (sequence, &amp;l_=
sec, &amp;l_usec);
|       |                                                         ^~~~~~
|       |                                                         |
|       |                                                         long in=
t *

Signed-off-by: Kai Kang <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>
---
 ...-fix-incompatible-pointer-type-error.patch | 34 +++++++++++++++++++
 meta-xfce/recipes-xfce/xfwm4/xfwm4_4.18.0.bb  |  2 ++
 2 files changed, 36 insertions(+)
 create mode 100644 meta-xfce/recipes-xfce/xfwm4/xfwm4/xfwm4-fix-incompat=
ible-pointer-type-error.patch

diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4/xfwm4-fix-incompatible-po=
inter-type-error.patch b/meta-xfce/recipes-xfce/xfwm4/xfwm4/xfwm4-fix-inc=
ompatible-pointer-type-error.patch
new file mode 100644
index 000000000..eb8fa7c43
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4/xfwm4-fix-incompatible-pointer-t=
ype-error.patch
@@ -0,0 +1,34 @@
+Fix xfwm4 incompatible pointer type error:
+
+| ../../xfwm4-4.18.0/src/startup_notification.c:139:57: error: passing a=
rgument 2 of 'sn_startup_sequence_get_last_active_time' from incompatible=
 pointer type [-Wincompatible-pointer-types]
+|   139 |     sn_startup_sequence_get_last_active_time (sequence, &amp;l=
_sec, &amp;l_usec);
+|       |                                                         ^~~~~~
+|       |                                                         |
+|       |                                                         long i=
nt *
+| In file included from .../usr/include/startup-notification-1.0/libsn/s=
n.h:32,
+|                  from ../../xfwm4-4.18.0/src/startup_notification.c:33=
:
+| .../usr/include/startup-notification-1.0/libsn/sn-monitor.h:84:79: not=
e: expected 'time_t *' {aka 'long long int *'} but argument is of type 'l=
ong int *'
+|    84 |                                                            tim=
e_t            *tv_sec,
+|       |                                                            ~~~=
~~~~~~~~~~~~~~~~^~~~~~
+
+Upsteam-Status: Submitted [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://gitlab.xfce.org/xfce/xfwm4/-/issues/790">https://gitlab.xfce.org/xf=
ce/xfwm4/-/issues/790</a>]
+
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
there is a typo here it should be Upstream</pre>
    </blockquote>
    <p>Sorry for the typo. And finally I find that a patch of
      startup-notification in oe-core<br>
      which is backported from maillist causes the issue. I'll update <sp=
an style=3D"white-space: pre-wrap">Upstream-Status with that.</span></p>
    <p><span style=3D"white-space: pre-wrap">Regards,
Kai
</span></p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1soPwSJAk7=3D+3c1p4hzb3yrC=
MYYXKHWoPiLQwJVUjxgRTQ@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+Signed-off-by: Kai Kang <=
a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:kai.kang@windriver.com">=
&lt;kai.kang@windriver.com&gt;</a>
+
+---
+ src/startup_notification.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/startup_notification.c b/src/startup_notification.c
+index 2a08cad..05434ca 100644
+--- a/src/startup_notification.c
++++ b/src/startup_notification.c
+@@ -136,7 +136,7 @@ sn_collect_timed_out_foreach (void *element, void *d=
ata)
+
+     sequence =3D element;
+     ctod =3D (CollectTimedOutData *) data;
+-    sn_startup_sequence_get_last_active_time (sequence, &amp;l_sec, &am=
p;l_usec);
++    sn_startup_sequence_get_last_active_time (sequence, (time_t *)&amp;=
l_sec, &amp;l_usec);
+     tv_sec =3D l_sec; tv_usec =3D l_usec;
+
+     elapsed =3D ((double) ctod-&gt;now - (tv_sec * G_USEC_PER_SEC) - tv=
_usec)
diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.18.0.bb b/meta-xfce/rec=
ipes-xfce/xfwm4/xfwm4_4.18.0.bb
index 839f1c870..2770829e9 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.18.0.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.18.0.bb
@@ -8,6 +8,8 @@ inherit xfce update-alternatives features_check

 REQUIRED_DISTRO_FEATURES =3D &quot;x11&quot;

+SRC_URI +=3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file://xfwm4-fix=
-incompatible-pointer-type-error.patch">&quot;file://xfwm4-fix-incompatib=
le-pointer-type-error.patch&quot;</a>
+
 SRC_URI[sha256sum] =3D &quot;92cd1b889bb25cb4bc06c1c6736c238d96e79c1e706=
b9f77fad0a89d6e5fc13f&quot;

 PACKAGECONFIG ?=3D &quot; \
--
2.34.1


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#110796): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-devel/message/110796">https:=
//lists.openembedded.org/g/openembedded-devel/message/110796</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/106590506/1997914">https://lists.openembedded.org/mt=
/106590506/1997914</a>
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
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------b0Fd7nMl0lB4OopmpHV5fWh1--

