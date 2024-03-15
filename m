Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8238DC54E58
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 05:25:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13858.1710480331781533651
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Mar 2024 22:25:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=lKTjMFwf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3804134e78=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42F5BMVa010588
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 05:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=acEXmPEuh8mebFwij11
	F373hybN6Ys8bfA+g79QbThs=; b=lKTjMFwfDi5EcRSkZkNOxDhNt8epepSFXiI
	MLV266nQ0wZRDXM4MCBBU/j6L5C4XSvy5iZeIAow8yebm8IkjX1HGusz2O6DsAaD
	bI5SU5j13aj2LOBYEqO+SdwqPZfmC0DpOeXDzND9pBWu/XhZsvqpFHrZoYTriMZG
	XEuNt1+Njc4yMztc5bpw1FtKP9WqxJj2Y02jcEaSePpSkKQWOO/WCP3jzBJQ/6Lk
	7BFE0XrlhiHvnl0zlA0VK72MO5nGhKhMcdXV1041ggMrstsjd6Bv/PVJachi4dr6
	OCEKVwawXdocTj0US8xHFHskI++Fe2jgBxP8j1mD3JxDs+ABV6Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wv9x988e5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 05:25:30 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 42F5PUct031480;
	Fri, 15 Mar 2024 05:25:30 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wv9x988e4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Mar 2024 05:25:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ffol/4LdczJPlfJFdn/qkDOG8duoTUlsQh51EjUCNyLEe6iX6LjDbx68tci6MVCHe38VNmCiW9RbGSjMdMQfCokKqJZr9oCrqsCsm0kcfs0p+bBF2Y5GssYD6MVhFQC1gkjUwCD0AaVzWNwZnwmgRdQPI6Nku6TzE0JVrJ8n2/aLk88huEjCwkpOhjTWyPn9LqSWzJOEJ+thaz+ehEiQDDSFH2UOcoIPQhtjZ4AJ4ClMVGHV4duv0yGsFsZ7j0oKOKBW39A4xdux5ndru42tLL4hYRCot3G20eu2LKbtCYbrORnpg8wBLZV871PG+I2PMXX/TdDwoHifx04e7Lhmig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=acEXmPEuh8mebFwij11F373hybN6Ys8bfA+g79QbThs=;
 b=P1cCVaw3J5T/8q9r5Cj/modex63GCCr4b7syYYw69xa44SUx5DFcS14ufuxL83gkokjPbcU3mAvs+tjza4fFf4Lf++1m06uR23LjreNqYnRcVj6oQKP12yVTSv1GWMCs2I4PttUJ0mrf8HY/Tf6wHRKwo4oKetYlQnkC1tC50IwDhhw/92e4PGrfTIu06gcLZlYFxzN7n/mTIEFYk7zYjpeLUD7TaWbHsWotanYy5xtmk0/0E3CMMT5CVeYP8IVIXrUte0LVeEmeWTUgNvieYLpgNUbscJAi6C17TwaAxuL45sENYV7WIPgJkYhDhqyjysM+54nElNrecS+tyNQjow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by CO1PR11MB4961.namprd11.prod.outlook.com (2603:10b6:303:93::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Fri, 15 Mar
 2024 05:25:26 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::d168:2e49:fb61:dc21]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::d168:2e49:fb61:dc21%7]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 05:25:25 +0000
Content-Type: multipart/alternative;
 boundary="------------wkzTdn9qkPe0QUIo8hNjM81l"
Message-ID: <c36ec560-b59d-4c55-aa0b-a0be5e58cd6d@windriver.com>
Date: Fri, 15 Mar 2024 13:25:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] postgresql: fix a runtime error
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: Changqing Li <changqing.li@eng.windriver.com>,
        openembedded-devel@lists.openembedded.org
References: <20240314072215.6854-1-changqing.li@windriver.com>
 <CAMKF1srgr=EqeoZXiYLjzvjiQ_fH6csQHDayCQXX2rcED8ZVyA@mail.gmail.com>
 <b235f78f-1988-4ea3-b183-20cd9f2cc113@windriver.com>
 <CAMKF1srgiJHYry=2PQgxFXDug5vrwOYqokOVu=32Qi5NPbKE+w@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CAMKF1srgiJHYry=2PQgxFXDug5vrwOYqokOVu=32Qi5NPbKE+w@mail.gmail.com>
X-ClientProxiedBy: TYCP286CA0234.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::6) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|CO1PR11MB4961:EE_
X-MS-Office365-Filtering-Correlation-Id: 822b01c0-80d8-4b60-73eb-08dc44b051b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GUzM4VUfzI4UcsP5g0hUgsjE0qt1zRUR11DNcRuKKonpug5iwCrHvTaNHLateTBHWdJYXdDXoDwiIV9Fo59QKtKp0g3qfr8w5Ab7Uk3MVYSlCuG0YF1rxY1Ny1B/SFiC4P69CgV+oBtU4b+D4T0JytVzlY8zQ6P4ruOkJeyvnmuM8d5LZjLiY3iXEv4XaoaS/0oPXnhI4VDluYAKnPB4O98lfqMa8zOKxDIY2cAohHprMam9rb3zpN4wWgd49ZDy3gTqLbHP5oXBShL8UY3nOqx+EWIHG73nvu/H8qm64nLLN4lPfpgdTOd1lbwmvEmu+lCVFn3p5TPXc2Bm0t7gWy49Y/HFKKcPsRQcF/uAaVsECjhNMKtGVoi6zGNOADm+lFKyAYxYzIZHfgtIGwOa5B3cJt++Eidi/c7Ip8C3xq6FFSSBGCIw8Xi8ofTblsGMpuPqJFFrwpja+VeH6tzbVkajtC8eBFrfUbaZv3rpQ3LQ8kvMKfv2S10Mzg2aUPUq41JguS4pNfHKimm3naKPvG3Tp55X7kU0YFYH84PhODgZp4m/3prLUMn5hPUyPJDE1OjnZybqNeynv3+bUBBplauLQU832Pt9kikhTOhZyhur9iidLzx0xSWVT0shXDQt
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MExwZzh1SlJWcmRNWmJrNmJneTQydDBrL0kwMmpCQjVLWGpJbGt2SDZXTzUw?=
 =?utf-8?B?aitkenE0SFRlb2hDWVNLNHV2aXhCS3pWWUsvdGVONUFDYW8vZ2pra21PeFZE?=
 =?utf-8?B?NjhkbS9pMFFMMDZ1ZWEyRkJMYmJjeG9wTWhRaU0rWWJsaVhhK2hrai9scmJQ?=
 =?utf-8?B?UTFJdWFSeHhkdGJrOXdQRG9KNU04V0lOZVdSQmJTMXhjTzFXcFdGSytVYmhR?=
 =?utf-8?B?dm1uVXVKaEdjZEFsQ1N2U2k5cEk1aW41ZXVSOEpoV1FzeDNKQWRZQTlHWjNw?=
 =?utf-8?B?dnZsYk5TcDFJalFRUkxNaS9yYUtBSTRPMW5Yb1E1Wm5CanUyay9SZUhKUUJK?=
 =?utf-8?B?Y2dQV3BMZXVZUHlyTGZhMThKWkdueVBseEVTUTlwUjJNWU1xQlpSTEt4anJt?=
 =?utf-8?B?emd4dGRMeERMRVQzak40OTN2ZzJuNTJFcHpneTg5UEpsSGVmQWFadVljTzNS?=
 =?utf-8?B?UlVJVytibUd1NmhyWWlUYXhWVkZkWEUvSmxEcFJjU055eTFvN0xhajhSR2Q4?=
 =?utf-8?B?NENrM0NCengyMlA1T2N2L2x2Yk5mbUpXcmljdEJwT0drbXpFU09mZ3Q1bk1u?=
 =?utf-8?B?UVAxQlExc05lRGlKSUxEWURxN2tQc0JaVExsaTNIT25QOGlGQVpRV2MrL3lS?=
 =?utf-8?B?My91cWVaZFVHa011dkVZQStHTjN4dytjWkFkVDZVWk85ZlpJa1FWR2FFaVFJ?=
 =?utf-8?B?aE4vTUpVYWc5U2loSnIxR283a1FIQXBGMm5MRUxiNm9VeVZZbkdWSDgvTUZr?=
 =?utf-8?B?aW1kVHF2bFVvVWRkY3oybGhRTVF0QmhtWm9NeHc5MWpyejVXMjV4TVFsTXp0?=
 =?utf-8?B?akFUWmxKYlJpN0RpRlhkNVpMZlFMazhOV3pab2J5STlha2lDUmc3V2NFUUgv?=
 =?utf-8?B?SDI3QUVzcDVHU1psWDU3ajBncWxuTFJiOGxQQ0d1aUdOa0R5azVDZnBXWVlU?=
 =?utf-8?B?VDE4UHdyWmxBY3V1d2RjcWNiZzNLMUM1WnRVWEYvMURwYmpYS0dQY1NJWXQ0?=
 =?utf-8?B?R0RodnZNdUt1VHRvYjJqZEM5alBtSXIzNFRtVVkyWCsxRWRsZHZ5WFBuRG9K?=
 =?utf-8?B?NUJnN1ZlSzVJRSt2d2VPVGlncVJhWm1ScGx1RkY5TWFmYjlORUxTbCtMdlVX?=
 =?utf-8?B?MDVmZHlIZFhUTEVoL3A3KzJKVTJnbDJvaWd5QmwzNWdpZDlWdUR3THpDTXFi?=
 =?utf-8?B?N0s5d0dxZDc2OWNHeWN6TUhXVkdmaXFjQ3NpeHFERlIzNEZVY2FMMkNOdlBp?=
 =?utf-8?B?T0hlK1VNdzk2cXIyZG9jMkxEWG1CVHcyYTN4cC94UktEcUsxSkJnd3F3ejlz?=
 =?utf-8?B?T05tRlp4NlBZOTd6Z2lBbVQ4cDM0b3JKSHNQZ0haR21hRXFLVGdwUGtXenhh?=
 =?utf-8?B?V2IvL1k3VkM0VzBaaWJmMjFiWDBiVVVmcmJUNUhHbEo1blovdXlEd2dMUThI?=
 =?utf-8?B?Qm9qMlpyVUhSOGw3eUkxaVcwNThmL2pRSHpNVEhQTUpOUFkyS1pSaEtXRTlP?=
 =?utf-8?B?RUw5QytvMStNaXYwUXVzVy9WQUczNVJKRDVEYUw1MjEwZ3M1VEFyMjF3M1RW?=
 =?utf-8?B?WTZTMmM0Z0FoWHk0NzRqTTFvVkxaZnE0SnJaNnYxQVhuUXJQQ3JoSG5FSU5J?=
 =?utf-8?B?cWV6TmNPdEJ3Umx4YmplbWhTWkNHa09qeTF0U2REaUFrY2U4L0NwM2c1NGwy?=
 =?utf-8?B?WHBvenNCRlBqZUhXQkIrMm9PdTN1SmpzWnZLZU5EYXFDNzF0Q24wOUFGVFdI?=
 =?utf-8?B?SEtRckdxWWIvejBNcVlWR0p0QjVicjVGSGRQeXFaSTR4MDRXazJ2RjRpUVdl?=
 =?utf-8?B?SkIxMWxob3dvcFVJdUhKbmhxZUxtQkU3ODFEdmZTdW0xeXBRVVBvZFhNNVpH?=
 =?utf-8?B?Z0JZVlYyKzdjOS9kOFh2M0RrU3BTYVJkRUZhdytOcnRnVkRRSmFFQ3lOanF0?=
 =?utf-8?B?WVFjOUJMNzJPUHhob3VrLzdLWHRydGhLbzdvRWR5Rkh2S3BtbHJaaUdDR2VF?=
 =?utf-8?B?RW03a2JsN3U4cXNReXNidDRPQUUrQ3RqK2pZL25ZSFFpemhOclR5Z3REVmtM?=
 =?utf-8?B?MmZPWndmaEtTQnJtcHlKNlYrWjM0NU5ZQ3Joa2pOd3J1dDVzY2lGalJIUmdZ?=
 =?utf-8?B?L09ZYm5OSnl2SnlFeDNndHRLVDFsVkZHam0zSUY3UXlVL1kzT2EwdjVTNloz?=
 =?utf-8?B?VUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 822b01c0-80d8-4b60-73eb-08dc44b051b8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 05:25:25.8247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLAZH4f/DgAvyrmp7JnlmUwWOmiikr/opjDFnbN9z/0LStXRUu/tf0cBJf+Nzl1enFYz3+37Jii4FEu2nTKySDr0Zkx96/hW+5OHGzR5R1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4961
X-Proofpoint-GUID: q86i-WQe0mjS8BIS7JvXFPbmci7ll6R5
X-Proofpoint-ORIG-GUID: AVSz2kpvl4IS3bJ7_FYothO1hW8hfvHr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-14_13,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403140001
 definitions=main-2403150042
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 05:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109331

--------------wkzTdn9qkPe0QUIo8hNjM81l
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 42F5BMVa010588


On 3/15/24 13:10, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Thu, Mar 14, 2024 at 10:01=E2=80=AFPM Changqing Li
> <changqing.li@windriver.com>  wrote:
>>
>> On 3/15/24 01:12, Khem Raj wrote:
>>
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender=
 and know the content is safe.
>>
>> On Thu, Mar 14, 2024 at 12:22=E2=80=AFAM Changqing Li
>> <changqing.li@eng.windriver.com>  wrote:
>>
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> initdb on target will fail with below error:
>> 2024-03-13 08:40:23.253 UTC [4410] FATAL:  could not load library "/us=
r/lib64/postgresql/dict_snowball.so": /usr/lib64/postgresql/dict_snowball=
.so: undefined symbol: CurrentMemoryContext
>>
>> Refer [1][2], for cross compile, --export-dynamic is assumed as not
>> supported, and cause above error. For oe, both gcc and clang support
>> --export-dynamic, fixed by set LDFLAGS_EX_BE directly
>>
>> [1]https://www.postgresql.org/message-id/79e63515-0f5e-30f4-136d-96e23=
b1a817d%40posteo.de
>> [2]https://github.com/postgres/postgres/commit/9db49fc5bfdc0126be03f4b=
8986013e59d93b91d#diff-49473dca262eeab3b4a43002adb08b4db31020d190caaad159=
4b47f1d5daa810
>>
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ---
>>   meta-oe/recipes-dbs/postgresql/postgresql.inc | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/r=
ecipes-dbs/postgresql/postgresql.inc
>> index 868a2e443..e29a5bef7 100644
>> --- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
>> +++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
>> @@ -35,6 +35,7 @@ LEAD_SONAME =3D "libpq.so"
>>
>>   # LDFLAGS for shared libraries
>>   export LDFLAGS_SL =3D "${LDFLAGS}"
>> +export LDFLAGS_EX_BE =3D "-Wl,--export-dynamic"
>>
>> this will add all the symbols into dynamic symbol table which may not
>> be best scenario, can we just export the ones needed ?
>> perhaps look into using --dynamic-list.
>>
>> Hi, Khem
>>
>> I tried to use --dynamic-list as you recommended and test command "pos=
tgresql_setup initdb",
>>
>> after I added all the symbols in dict_snowball.so, it will report unde=
fined symbols for another lib. I know I can try to
>>
>> add all the symbols for all the libs. but there are nearly 80+ libs ge=
nerated by postgresql. There will be many symbols.
>>
>> And I also worried that, we may missing some symbols since I may canno=
t cover all the runtime cases.
>>
>>  From [2], we can know that postgresql use "-Wl,--export-dynamic" befo=
re.
>>
>> So maybe it is better to still use "-Wl,--export-dynamic" like before?=
 what is your opinion?
>>
> Yes this maybe ok. I would like you to open a discussion upstream as we=
ll.

Do you mean open an discussion about what symbols should in the symbol=20
files?=C2=A0 About the the original issue

"undefined symbol: CurrentMemoryContext", Upstream said that=C2=A0=20
"Cross-compiling isn't really a supported thing".


//Changqing

>
>> Thanks
>>
>> Changqing
>>
>>   inherit autotools pkgconfig perlnative python3native python3targetco=
nfig useradd update-rc.d systemd gettext cpan-base multilib_header
>>
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#109311):https://lists.openembedded.org/g/openembed=
ded-devel/message/109311
>> Mute This Topic:https://lists.openembedded.org/mt/104922226/1997914
>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub =
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--------------wkzTdn9qkPe0QUIo8hNjM81l
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 42F5BMVa010588

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 3/15/24 13:10, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1srgiJHYry=3D2PQgxFXDug5vr=
wOYqokOVu=3D32Qi5NPbKE+w@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Thu, Mar 14, 2024 at 10:01=E2=80=AFPM Changqing Li
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:changqing.li@windriver.=
com">&lt;changqing.li@windriver.com&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">

On 3/15/24 01:12, Khem Raj wrote:

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Thu, Mar 14, 2024 at 12:22=E2=80=AFAM Changqing Li
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:changqing.li@eng.windri=
ver.com">&lt;changqing.li@eng.windriver.com&gt;</a> wrote:

From: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:chan=
gqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

initdb on target will fail with below error:
2024-03-13 08:40:23.253 UTC [4410] FATAL:  could not load library &quot;/=
usr/lib64/postgresql/dict_snowball.so&quot;: /usr/lib64/postgresql/dict_s=
nowball.so: undefined symbol: CurrentMemoryContext

Refer [1][2], for cross compile, --export-dynamic is assumed as not
supported, and cause above error. For oe, both gcc and clang support
--export-dynamic, fixed by set LDFLAGS_EX_BE directly

[1] <a class=3D"moz-txt-link-freetext" href=3D"https://www.postgresql.org=
/message-id/79e63515-0f5e-30f4-136d-96e23b1a817d%40posteo.de">https://www=
.postgresql.org/message-id/79e63515-0f5e-30f4-136d-96e23b1a817d%40posteo.=
de</a>
[2] <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/postgre=
s/postgres/commit/9db49fc5bfdc0126be03f4b8986013e59d93b91d#diff-49473dca2=
62eeab3b4a43002adb08b4db31020d190caaad1594b47f1d5daa810">https://github.c=
om/postgres/postgres/commit/9db49fc5bfdc0126be03f4b8986013e59d93b91d#diff=
-49473dca262eeab3b4a43002adb08b4db31020d190caaad1594b47f1d5daa810</a>

Signed-off-by: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta-oe/recipes-dbs/postgresql/postgresql.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/reci=
pes-dbs/postgresql/postgresql.inc
index 868a2e443..e29a5bef7 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -35,6 +35,7 @@ LEAD_SONAME =3D &quot;libpq.so&quot;

 # LDFLAGS for shared libraries
 export LDFLAGS_SL =3D &quot;${LDFLAGS}&quot;
+export LDFLAGS_EX_BE =3D &quot;-Wl,--export-dynamic&quot;

this will add all the symbols into dynamic symbol table which may not
be best scenario, can we just export the ones needed ?
perhaps look into using --dynamic-list.

Hi, Khem

I tried to use --dynamic-list as you recommended and test command &quot;p=
ostgresql_setup initdb&quot;,

after I added all the symbols in dict_snowball.so, it will report undefin=
ed symbols for another lib. I know I can try to

add all the symbols for all the libs. but there are nearly 80+ libs gener=
ated by postgresql. There will be many symbols.

And I also worried that, we may missing some symbols since I may cannot c=
over all the runtime cases.

From [2], we can know that postgresql use &quot;-Wl,--export-dynamic&quot=
; before.

So maybe it is better to still use &quot;-Wl,--export-dynamic&quot; like =
before? what is your opinion?

</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Yes this maybe ok. I would like you to open a discussion upstream as well=
.</pre>
    </blockquote>
    <p>Do you mean open an discussion about what symbols should in the
      symbol files?&nbsp; About the the original issue&nbsp; <br>
    </p>
    <p>&quot;<span style=3D"white-space: pre-wrap">undefined symbol: Curr=
entMemoryContext</span>&quot;,&nbsp;
      Upstream said that&nbsp; &quot;Cross-compiling isn't really a suppo=
rted
      thing&quot;.<br>
    </p>
    <p><br>
    </p>
    <p>//Changqing<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1srgiJHYry=3D2PQgxFXDug5vr=
wOYqokOVu=3D32Qi5NPbKE+w@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Thanks

Changqing

 inherit autotools pkgconfig perlnative python3native python3targetconfig=
 useradd update-rc.d systemd gettext cpan-base multilib_header

--
2.25.1


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#109311): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-devel/message/109311">https:=
//lists.openembedded.org/g/openembedded-devel/message/109311</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/104922226/1997914">https://lists.openembedded.org/mt=
/104922226/1997914</a>
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

--------------wkzTdn9qkPe0QUIo8hNjM81l--

