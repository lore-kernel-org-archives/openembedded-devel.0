Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6483C001DE
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 10:49:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8584.1692355745128574356
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Aug 2023 03:49:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=D75unMW3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7594b91f67=narpat.mali@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37IAN57A021841
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Aug 2023 10:49:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=ymVTyqegIF5mC98fxzFrb327FgfStemB5xUzEgRXxXU=; b=
	D75unMW3S6ssgaSJw0UemSCoaLmCvn7R+ukdGwiDT9PoUBUUJfVxJR9ot4mhq1cD
	pYI8IMpG6U4WvGlPrFZcA7BD9lCltVkIQS8Xs/XIirOKLDd4XNZ05J9fQY6i5nvl
	Zf5cRuPig7dpPzG3WoaEPvf3M51Z1Dh1I7qwCUD+QHYWtBYRhunkXiE+lNUzKNI9
	K3/sqYXUjOKpJc9bc01M71N8/V7eWE92d4QjNzwzWTakCxAZ2H6VXb32H98XoJjw
	PxMizyQZ0+X6ZqO5OCNtI/bLTXx5BfZcAXGdIKz3aFdlswAQG+unfa7oytGCv9xp
	AWkfSp0OUbRn1t+9iNMW6g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3se125wtua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Aug 2023 10:49:03 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 37IAn3db022839
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Aug 2023 10:49:03 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3se125wtu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Aug 2023 10:49:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lt7Bru3QB4agusB1uOMlwin+/3QEB6em/gq9ZWYiQTutkG12+qg31T2huR3HIH9kSuuxZtzFXrN+8KE1EHZEAVWQF/qTuarWyoP2pkpB6fI8DGkE/wWmo2jvanXzNP/+NsH17kFO8SbvnGsxv9CJd7usa/btS+VW2Z+LNO4IrULm6sJnxh5y3a2o8+96I4VMqeeNFzLDTcI3b1yXJo0CZ84d1pKy/BMPSEUTH4zhM73CHFhAg84PBK5aezOfoR/6c2qfnDbDnjPl0W37BzIf7Co8E+VKB33Alp4jyKVy9VEVnpl9q2/9lfGTZO1kQZVxIFvKBHePIVJ7W/IiTXrbmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymVTyqegIF5mC98fxzFrb327FgfStemB5xUzEgRXxXU=;
 b=cZw4Z4SRRakkyEeAE1YotYBfEoHJXxdcZp6/JT4MAtbnaaVr4LvRhbAszRnwmzDxumHlhum/oc3cjYvImSJd47gNDDiWoJfMO55YJ8aZYni9Q9j86//GPEXzYYn+UrqPjPjJQC6ogFU6aBYc+9mMiGyL9WvHYIWW34xkQ3RzSb37NnFRW1RaP8XCBWLI/zcsYXqmOCheZgr6UaMzxsou61Xr/N7plbSV1vQzKj2Gx5r2oTvtkHLxDwL2lxhHye+1Om+/MtJPn5k5DLzMFS+JEQzCwWsNGi00weeikWEb0xI9XG1iFAAm2iIprk6i0iTXkr5vnSOstoZS/oZUgmzkgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by IA0PR11MB8417.namprd11.prod.outlook.com (2603:10b6:208:48d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Fri, 18 Aug
 2023 10:48:58 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::219e:cc26:ef6d:1b4a]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::219e:cc26:ef6d:1b4a%4]) with mapi id 15.20.6678.031; Fri, 18 Aug 2023
 10:48:57 +0000
Message-ID: <a34ea9a3-6b9d-c597-ec42-dd6059af6e78@windriver.com>
Date: Fri, 18 Aug 2023 16:15:59 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [oe] [meta-python][kirkstone][PATCH v2 1/1] python3-django: fix
 CVE-2023-36053
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
Cc: hari.gpillai@windriver.com
References: <1775F9EAE6BF3212.27447@lists.openembedded.org>
From: "Mali, Narpat" <narpat.mali@windriver.com>
In-Reply-To: <1775F9EAE6BF3212.27447@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0147.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::32) To DM4PR11MB5550.namprd11.prod.outlook.com
 (2603:10b6:5:38b::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5550:EE_|IA0PR11MB8417:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d6498a6-895d-4c52-d308-08db9fd8b97b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bMv5VuLte5a/390CCX4qw6XG5K4p6RRnGTN7FLDzKf3ROpyBnOMyMp62TVTYrSlWDJXnlooCTrlNBkkOBg/HF5uV+tw160beTpqx3ovTpu6rIqu4s2PrKi0V5iMzg7HiQ+uxe42pINfxR+Y0qAExcJ8HtuDluAlhThv0B2s3yRGM4hKYkv6iqJlUTgOhzcaK/i4jr+2VFte5BSqsSTH/6NbmouorV6OWxi10NtyMuYn/3Sgzm9vlCnszkw8cFX3C1MwtBO4nGvFzHt9JcdZuPA+cR/TPuZ3fjn8MZH2fpY1n4RySgtUh3FCFWxjjYPVNJ1jcD97e3AtnnM/thuLzvi5l74W1xyUoiuT0SwR3+24JRA/kfsO2OC8zNCNrXh3UWD0Viw+Xw6FLtalvEYbAQ3WCKEQ2gIRukeVmm3mU6TTGiajZjWYm7kDN1UinfEEMDFUVUQfwiL3cu3wl3MOhcQhqkHWLrvFohfCHslF2Awcb4R8Qwe66CHmhtF889jZYfbm1hiRvB+x0C9+aqYiIFd1sA/+iveRuIcePugWchXnrboxcju6YLuzkLxFF9vu5gFBkupj/hLHaHcoggV6C3AxOb7bw734Fr5AQleYhuRRmQ/wOwMmOpm8BElDjreDwJtH63JskKuxs9WQHIHnVYcdtMSexy3Aez2Hbq458WUg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(366004)(39850400004)(396003)(451199024)(1800799009)(186009)(31686004)(86362001)(31696002)(36756003)(38100700002)(107886003)(966005)(2616005)(5660300002)(66556008)(478600001)(6506007)(66946007)(66476007)(53546011)(6486002)(316002)(26005)(6512007)(4326008)(8676002)(8936002)(41300700001)(66899024)(83380400001)(30864003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WVVJL2M5N3gzMlJERGgveFlNdWR1WW1yZWNueUFXTFhlSWlzcW4yZXBoTktz?=
 =?utf-8?B?K284aUhKaEc5OEpiMWJFN2FodXFrM3JnWEZPQ29sMFpPS1dPMWZyVkNqb3dJ?=
 =?utf-8?B?N09JbHZENTdEUFlEcHJxMnNPQmtpTWYra3UwK0VWR1dPVEtzWWdzRGdpUVJo?=
 =?utf-8?B?SGo5Z04vc2lmVzhWUE9rY25EOTdqMEtVMEcxVnBBUXVVclVEL1FLU3E1UVFp?=
 =?utf-8?B?MTdQNkNiSzI1Q3lHSUgyVE9QdG9tbk9LOXM0VG5lWDdnQ3N5MkQvRmZoY1Bj?=
 =?utf-8?B?MjMvdnNiaVo4RkdWeUFmN3dMVGlGQlBncW1ZaGF0OWdsV2lMekU1YWgwOGhR?=
 =?utf-8?B?b1V3eUw1STg4K05wWVoxaFFtOFdBcWw0RVczK09MandHeHNUUUpIVitiNytS?=
 =?utf-8?B?bEp1R2h2MW9tVlU5Ly9LWDFiSEZKVkNXeEIwb2NzRElackpCWWl0ZWN0TWE1?=
 =?utf-8?B?Vk5lQ0VIY3JmZVIyRzE1aE9kR2dMazd2ekpUT3hqS2htSFV4Vi9Vak1OeHpl?=
 =?utf-8?B?a0xNNmZRU3FJTzVDSkNQRTUyaWdxWXFDakRZTWU0WDRtZVVaRDRMVDZYZGsw?=
 =?utf-8?B?OWVaNS9lVUFwOUcvTkMzUk8vMTdEbmtqeXhwV0ZsdTlROGZDUHkrT2htTGhS?=
 =?utf-8?B?N01Ha3hueGlPdDhDYWlNL0Erckp1enRpT2xHUFdRNSs5TlJBRlBtNmJkdTEv?=
 =?utf-8?B?K3M4Z3FZaGNZd0hSMFF4dkZPMUd2a3hzSGk2TkhSNU9TU0JERExzdVVneCtj?=
 =?utf-8?B?Y05wU1F0Ym85OUIxeTN1R3R3WXo1SmNpOVc2UUZ2cEdwQ05YVUNVK1QraEJo?=
 =?utf-8?B?MzZlSVlucVJuTkRTb3Nrc2Z5cDhobEJ4NUllaHdIZmRyQWQ5M21yMWJXU2Iy?=
 =?utf-8?B?N2l1aHlFYWJrR2ZzT251Q09CM3FveGJLYlg3TitRL3U3QTRDOHd5MnorRWJt?=
 =?utf-8?B?dTJWTzZTcVpzTXg4b0xwam0yMmNFNDhHb2c1V1ptMXlUWGlZT004WTJDTHdB?=
 =?utf-8?B?VjZSRU4wV0pOMVkydDhsUTg4UFp0OSt5eEQwOVVuN2Nyd1BGTFhaaEZ0bVIw?=
 =?utf-8?B?QkRxU042Z09WaVdnOEpFRGl5S25ITjBWTlViZ0hRajRiYnhXM2tDNTNXQkw5?=
 =?utf-8?B?aDgveExkMWQ5dVBYTHd5RlBFNHlrbElpV2pJazAwSnFobVpsby9nYmhtZnQy?=
 =?utf-8?B?RXpYV1NSeEtNaG5ZSldHbXhCUEovMXh6cGJ2amdqU1BZMk42TmErWlBkSWxY?=
 =?utf-8?B?YzFITGZBb0FiVDZyS3Y3YWU1SUtHSC91clJkMnJjdm8xZ2ZwSVp2YjRWQnlX?=
 =?utf-8?B?WVpCbm12RE1uSXViQ0h5QUxZNHpJK2hPNFNhVjBqOTFNZE0xaWV0QXBvWmpV?=
 =?utf-8?B?b0dBNmFzVlMwWk5xQmN6UkVOUDdRdEdxcEJBT01SSGJldzY2N3l5NGJGQTdR?=
 =?utf-8?B?Mmc4NGY5VVRhVVJTb3B2WFJUZlRQaHVMcGc0dUphNGtmWDRYZHpTZ1pTYzBN?=
 =?utf-8?B?WkxLYmhscldwdmhJZjZiVHNXWnkvQnIzSXl2bjczSEtQZ2xzNk10b2tjS2Fu?=
 =?utf-8?B?WHBic2VBZy9GSStseWFWRk05UEU0VEpuRUcwQVpyK2Y5MW9UbGE4M29NNUg1?=
 =?utf-8?B?c1RIZkM4Smg0TVlGV2w0SzNGbnZrK0liRUVuYUtFNElHc2NOMERhNGxKTS82?=
 =?utf-8?B?N3NFYjVYKysrc29wMGY4c1V0RTRjc3pFdS9wNVBabTRoMW1VUGhzMGJIRWRX?=
 =?utf-8?B?bEh2R0tBMGJybktFZVVjTHJhK00veUpRMWJmNFZlbjUzUnRlekY4cU04d2Zt?=
 =?utf-8?B?VTIzaUY4bTZmZFpuNXprN1J4K2QzZ0VjWGkrenBobjVCVnh5SXNiZi9OVDl2?=
 =?utf-8?B?TXVob1FBUkU2aXJCVlRqdUhTUHFGNWlpU0xoU3BqNWRRakRSRi9hbmJPYys5?=
 =?utf-8?B?ekVVSENwcHVWanhnUThJdkFBaHoweFBqTHFiMzc5cXRGdmNuSDN6dzJRUUJN?=
 =?utf-8?B?ekRibElSNjZ2WUxPWG02TDJNUjNDdDNzbklOemFyaXBtdlNIRk1ZSit0SnNm?=
 =?utf-8?B?SXkwRnFzQ096R0FVUXJ5RDhqbHJyVklXZXVmVndBU01xQjBwRGRFZjFKS1pE?=
 =?utf-8?B?ejhPMWtFOE1IYmFnV0FBSjFUMmlmRVRSbFpxVWZkYTY2WnB5OGx3YW8ydUE2?=
 =?utf-8?B?enc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d6498a6-895d-4c52-d308-08db9fd8b97b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 10:48:57.8100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w6w4QJleaJfoLElQJHzL3lBkGiOF1sYWUU6FEVfSlNUcmFyuJD74eqQaBUrR5UucfRuA0jvOxNkK85QmVXhstfcDczt3PrFSe+eiFkELREw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8417
X-Proofpoint-GUID: jdWaYxmp9VSNcR6ThheI5Qi2DfLCj_nW
X-Proofpoint-ORIG-GUID: mqS9FUNyqHRQ_-rYcMLTVXCyv1rbOImz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-18_12,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2306200000 definitions=main-2308180100
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Aug 2023 10:49:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104484

Gentle Reminder !!

../Narpat

On 28-07-2023 13:43, Narpat Mali via lists.openembedded.org wrote:
> From: Narpat Mali <narpat.mali@windriver.com>
>
> In Django 3.2 before 3.2.20, 4 before 4.1.10, and 4.2 before 4.2.3,
> EmailValidator and URLValidator are subject to a potential ReDoS
> (regular expression denial of service) attack via a very large
> number of domain name labels of emails and URLs.
>
> Since, there is no ptest available for python3-django so have not
> tested the patch changes at runtime.
>
> References:
> https://github.com/advisories/GHSA-jh3w-4vvf-mjgr
> https://github.com/django/django/commit/454f2fb93437f98917283336201b4048293f7582
>
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ---
>   .../python3-django/CVE-2023-36053.patch       | 263 ++++++++++++++++++
>   .../python/python3-django_2.2.28.bb           |   4 +-
>   2 files changed, 266 insertions(+), 1 deletion(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-django/CVE-2023-36053.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2023-36053.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2023-36053.patch
> new file mode 100644
> index 0000000000..2ad38d8e95
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-django/CVE-2023-36053.patch
> @@ -0,0 +1,263 @@
> +From a0b2eeeb7350d0c3a9b9be191783ff15daeffec5 Mon Sep 17 00:00:00 2001
> +From: Mariusz Felisiak <felisiak.mariusz@gmail.com>
> +Date: Thu, 27 Jul 2023 14:51:48 +0000
> +Subject: [PATCH] Fixed CVE-2023-36053
> +
> +-- Prevented potential ReDoS in EmailValidator and URLValidator.
> +
> +Thanks Seokchan Yoon for reports.
> +
> +CVE: CVE-2023-36053
> +
> +Upstream-Status: Backport [https://github.com/django/django/commit/454f2fb93437f98917283336201b4048293f7582]
> +
> +Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> +---
> + django/core/validators.py                     |  9 +++++++--
> + django/forms/fields.py                        |  3 +++
> + docs/ref/forms/fields.txt                     |  4 ++++
> + docs/ref/validators.txt                       | 19 ++++++++++++++++++-
> + docs/releases/2.2.28.txt                      |  9 +++++++++
> + .../field_tests/test_emailfield.py            |  5 ++++-
> + tests/forms_tests/tests/test_forms.py         | 19 +++++++++++++------
> + tests/validators/tests.py                     | 11 +++++++++++
> + 8 files changed, 69 insertions(+), 10 deletions(-)
> +
> +diff --git a/django/core/validators.py b/django/core/validators.py
> +index 2da0688..2dbd3bf 100644
> +--- a/django/core/validators.py
> ++++ b/django/core/validators.py
> +@@ -102,6 +102,7 @@ class URLValidator(RegexValidator):
> +     message = _('Enter a valid URL.')
> +     schemes = ['http', 'https', 'ftp', 'ftps']
> +     unsafe_chars = frozenset('\t\r\n')
> ++    max_length = 2048
> +
> +     def __init__(self, schemes=None, **kwargs):
> +         super().__init__(**kwargs)
> +@@ -109,7 +110,9 @@ class URLValidator(RegexValidator):
> +             self.schemes = schemes
> +
> +     def __call__(self, value):
> +-        if isinstance(value, str) and self.unsafe_chars.intersection(value):
> ++        if not isinstance(value, str) or len(value) > self.max_length:
> ++            raise ValidationError(self.message, code=self.code)
> ++        if self.unsafe_chars.intersection(value):
> +             raise ValidationError(self.message, code=self.code)
> +         # Check if the scheme is valid.
> +         scheme = value.split('://')[0].lower()
> +@@ -190,7 +193,9 @@ class EmailValidator:
> +             self.domain_whitelist = whitelist
> +
> +     def __call__(self, value):
> +-        if not value or '@' not in value:
> ++        # The maximum length of an email is 320 characters per RFC 3696
> ++        # section 3.
> ++        if not value or '@' not in value or len(value) > 320:
> +             raise ValidationError(self.message, code=self.code)
> +
> +         user_part, domain_part = value.rsplit('@', 1)
> +diff --git a/django/forms/fields.py b/django/forms/fields.py
> +index a977256..f939338 100644
> +--- a/django/forms/fields.py
> ++++ b/django/forms/fields.py
> +@@ -542,6 +542,9 @@ class FileField(Field):
> +     def __init__(self, *, max_length=None, allow_empty_file=False, **kwargs):
> +         self.max_length = max_length
> +         self.allow_empty_file = allow_empty_file
> ++        # The default maximum length of an email is 320 characters per RFC 3696
> ++        # section 3.
> ++        kwargs.setdefault("max_length", 320)
> +         super().__init__(**kwargs)
> +
> +     def to_python(self, data):
> +diff --git a/docs/ref/forms/fields.txt b/docs/ref/forms/fields.txt
> +index 6f76d0d..3a888ef 100644
> +--- a/docs/ref/forms/fields.txt
> ++++ b/docs/ref/forms/fields.txt
> +@@ -592,6 +592,10 @@ For each field, we describe the default widget used if you don't specify
> +     Has two optional arguments for validation, ``max_length`` and ``min_length``.
> +     If provided, these arguments ensure that the string is at most or at least the
> +     given length.
> ++    ``empty_value`` which work just as they do for :class:`CharField`. The
> ++    ``max_length`` argument defaults to 320 (see :rfc:`3696#section-3`).
> ++
> ++    The default value for ``max_length`` was changed to 320 characters.
> +
> + ``FileField``
> + -------------
> +diff --git a/docs/ref/validators.txt b/docs/ref/validators.txt
> +index 75d1394..4178a1f 100644
> +--- a/docs/ref/validators.txt
> ++++ b/docs/ref/validators.txt
> +@@ -125,6 +125,11 @@ to, or in lieu of custom ``field.clean()`` methods.
> +     :param code: If not ``None``, overrides :attr:`code`.
> +     :param whitelist: If not ``None``, overrides :attr:`whitelist`.
> +
> ++    An :class:`EmailValidator` ensures that a value looks like an email, and
> ++    raises a :exc:`~django.core.exceptions.ValidationError` with
> ++    :attr:`message` and :attr:`code` if it doesn't. Values longer than 320
> ++    characters are always considered invalid.
> ++
> +     .. attribute:: message
> +
> +         The error message used by
> +@@ -145,13 +150,17 @@ to, or in lieu of custom ``field.clean()`` methods.
> +         ``['localhost']``. Other domains that don't contain a dot won't pass
> +         validation, so you'd need to whitelist them as necessary.
> +
> ++        In older versions, values longer than 320 characters could be
> ++        considered valid.
> ++
> + ``URLValidator``
> + ----------------
> +
> + .. class:: URLValidator(schemes=None, regex=None, message=None, code=None)
> +
> +     A :class:`RegexValidator` that ensures a value looks like a URL, and raises
> +-    an error code of ``'invalid'`` if it doesn't.
> ++    an error code of ``'invalid'`` if it doesn't. Values longer than
> ++    :attr:`max_length` characters are always considered invalid.
> +
> +     Loopback addresses and reserved IP spaces are considered valid. Literal
> +     IPv6 addresses (:rfc:`3986#section-3.2.2`) and unicode domains are both
> +@@ -168,6 +177,14 @@ to, or in lieu of custom ``field.clean()`` methods.
> +
> +         .. _valid URI schemes: https://www.iana.org/assignments/uri-schemes/uri-schemes.xhtml
> +
> ++     .. attribute:: max_length
> ++
> ++        The maximum length of values that could be considered valid. Defaults
> ++        to 2048 characters.
> ++
> ++        In older versions, values longer than 2048 characters could be
> ++        considered valid.
> ++
> + ``validate_email``
> + ------------------
> +
> +diff --git a/docs/releases/2.2.28.txt b/docs/releases/2.2.28.txt
> +index 854c6b0..ab4884b 100644
> +--- a/docs/releases/2.2.28.txt
> ++++ b/docs/releases/2.2.28.txt
> +@@ -38,3 +38,12 @@ keep the old behavior, set ``allow_multiple_selected`` to ``True``.
> +
> + For more details on using the new attribute and handling of multiple files
> + through a single field, see :ref:`uploading_multiple_files`.
> ++
> ++Backporting the CVE-2023-36053 fix on Django 2.2.28.
> ++
> ++CVE-2023-36053: Potential regular expression denial of service vulnerability in ``EmailValidator``/``URLValidator``
> ++===================================================================================================================
> ++
> ++``EmailValidator`` and ``URLValidator`` were subject to potential regular
> ++expression denial of service attack via a very large number of domain name
> ++labels of emails and URLs.
> +diff --git a/tests/forms_tests/field_tests/test_emailfield.py b/tests/forms_tests/field_tests/test_emailfield.py
> +index 826524a..fe5b644 100644
> +--- a/tests/forms_tests/field_tests/test_emailfield.py
> ++++ b/tests/forms_tests/field_tests/test_emailfield.py
> +@@ -8,7 +8,10 @@ class EmailFieldTest(FormFieldAssertionsMixin, SimpleTestCase):
> +
> +     def test_emailfield_1(self):
> +         f = EmailField()
> +-        self.assertWidgetRendersTo(f, '<input type="email" name="f" id="id_f" required>')
> ++        self.assertEqual(f.max_length, 320)
> ++        self.assertWidgetRendersTo(
> ++            f, '<input type="email" name="f" id="id_f" maxlength="320" required>'
> ++        )
> +         with self.assertRaisesMessage(ValidationError, "'This field is required.'"):
> +             f.clean('')
> +         with self.assertRaisesMessage(ValidationError, "'This field is required.'"):
> +diff --git a/tests/forms_tests/tests/test_forms.py b/tests/forms_tests/tests/test_forms.py
> +index d4e421d..8893f89 100644
> +--- a/tests/forms_tests/tests/test_forms.py
> ++++ b/tests/forms_tests/tests/test_forms.py
> +@@ -422,11 +422,18 @@ class FormsTestCase(SimpleTestCase):
> +             get_spam = BooleanField()
> +
> +         f = SignupForm(auto_id=False)
> +-        self.assertHTMLEqual(str(f['email']), '<input type="email" name="email" required>')
> ++        self.assertHTMLEqual(
> ++            str(f["email"]),
> ++            '<input type="email" name="email" maxlength="320" required>',
> ++        )
> +         self.assertHTMLEqual(str(f['get_spam']), '<input type="checkbox" name="get_spam" required>')
> +
> +         f = SignupForm({'email': 'test@example.com', 'get_spam': True}, auto_id=False)
> +-        self.assertHTMLEqual(str(f['email']), '<input type="email" name="email" value="test@example.com" required>')
> ++        self.assertHTMLEqual(
> ++            str(f["email"]),
> ++            '<input type="email" name="email" maxlength="320" value="test@example.com" '
> ++            "required>",
> ++        )
> +         self.assertHTMLEqual(
> +             str(f['get_spam']),
> +             '<input checked type="checkbox" name="get_spam" required>',
> +@@ -2780,7 +2787,7 @@ Good luck picking a username that doesn&#39;t already exist.</p>
> + <option value="true">Yes</option>
> + <option value="false">No</option>
> + </select></li>
> +-<li><label for="id_email">Email:</label> <input type="email" name="email" id="id_email"></li>
> ++<li><label for="id_email">Email:</label> <input type="email" name="email" id="id_email" maxlength="320"></li>
> + <li class="required error"><ul class="errorlist"><li>This field is required.</li></ul>
> + <label class="required" for="id_age">Age:</label> <input type="number" name="age" id="id_age" required></li>"""
> +         )
> +@@ -2796,7 +2803,7 @@ Good luck picking a username that doesn&#39;t already exist.</p>
> + <option value="true">Yes</option>
> + <option value="false">No</option>
> + </select></p>
> +-<p><label for="id_email">Email:</label> <input type="email" name="email" id="id_email"></p>
> ++<p><label for="id_email">Email:</label> <input type="email" name="email" id="id_email" maxlength="320"></p>
> + <ul class="errorlist"><li>This field is required.</li></ul>
> + <p class="required error"><label class="required" for="id_age">Age:</label>
> + <input type="number" name="age" id="id_age" required></p>"""
> +@@ -2815,7 +2822,7 @@ Good luck picking a username that doesn&#39;t already exist.</p>
> + <option value="false">No</option>
> + </select></td></tr>
> + <tr><th><label for="id_email">Email:</label></th><td>
> +-<input type="email" name="email" id="id_email"></td></tr>
> ++<input type="email" name="email" id="id_email" maxlength="320"></td></tr>
> + <tr class="required error"><th><label class="required" for="id_age">Age:</label></th>
> + <td><ul class="errorlist"><li>This field is required.</li></ul>
> + <input type="number" name="age" id="id_age" required></td></tr>"""
> +@@ -3428,7 +3435,7 @@ Good luck picking a username that doesn&#39;t already exist.</p>
> +         f = CommentForm(data, auto_id=False, error_class=DivErrorList)
> +         self.assertHTMLEqual(f.as_p(), """<p>Name: <input type="text" name="name" maxlength="50"></p>
> + <div class="errorlist"><div class="error">Enter a valid email address.</div></div>
> +-<p>Email: <input type="email" name="email" value="invalid" required></p>
> ++<p>Email: <input type="email" name="email" value="invalid" maxlength="320" required></p>
> + <div class="errorlist"><div class="error">This field is required.</div></div>
> + <p>Comment: <input type="text" name="comment" required></p>""")
> +
> +diff --git a/tests/validators/tests.py b/tests/validators/tests.py
> +index 1f09fb5..8204f00 100644
> +--- a/tests/validators/tests.py
> ++++ b/tests/validators/tests.py
> +@@ -58,6 +58,7 @@ TEST_DATA = [
> +
> +     (validate_email, 'example@atm.%s' % ('a' * 64), ValidationError),
> +     (validate_email, 'example@%s.atm.%s' % ('b' * 64, 'a' * 63), ValidationError),
> ++    (validate_email, "example@%scom" % (("a" * 63 + ".") * 100), ValidationError),
> +     (validate_email, None, ValidationError),
> +     (validate_email, '', ValidationError),
> +     (validate_email, 'abc', ValidationError),
> +@@ -242,6 +243,16 @@ TEST_DATA = [
> +     (URLValidator(EXTENDED_SCHEMES), 'git+ssh://git@github.com/example/hg-git.git', None),
> +
> +     (URLValidator(EXTENDED_SCHEMES), 'git://-invalid.com', ValidationError),
> ++    (
> ++        URLValidator(),
> ++        "http://example." + ("a" * 63 + ".") * 1000 + "com",
> ++        ValidationError,
> ++    ),
> ++    (
> ++        URLValidator(),
> ++        "http://userid:password" + "d" * 2000 + "@example.aaaaaaaaaaaaa.com",
> ++        None,
> ++    ),
> +     # Newlines and tabs are not accepted.
> +     (URLValidator(), 'http://www.djangoproject.com/\n', ValidationError),
> +     (URLValidator(), 'http://[::ffff:192.9.5.5]\n', ValidationError),
> +--
> +2.40.0
> diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
> index 77a1a2a740..ec65a985da 100644
> --- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
> +++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
> @@ -5,7 +5,9 @@ UPSTREAM_CHECK_REGEX = "/${PYPI_PACKAGE}/(?P<pver>(2\.2\.\d*)+)/"
>   
>   inherit setuptools3
>   
> -SRC_URI += "file://CVE-2023-31047.patch"
> +SRC_URI += "file://CVE-2023-31047.patch \
> +            file://CVE-2023-36053.patch \
> +           "
>   
>   SRC_URI[sha256sum] = "0200b657afbf1bc08003845ddda053c7641b9b24951e52acd51f6abda33a7413"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104065): https://lists.openembedded.org/g/openembedded-devel/message/104065
> Mute This Topic: https://lists.openembedded.org/mt/100406893/7199376
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [narpat.mali@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

