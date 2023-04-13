Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17872C77B61
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 21:19:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3994.1681420754541760854
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Apr 2023 14:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=fCREvWFJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=346776508d=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33DHpZtW013227
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Apr 2023 14:19:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=Dhi0nEDc0vL/WGvXO7OucKljWpTxHoLOWcUXT5YtnFo=;
 b=fCREvWFJsKPN2HazuY8fUC2j3pZ1Od2IuDSi5S6PDEFQ8Tb6f35Kavy7WRx8GtIzThGW
 5+KivwblzZqbfEusj98Hi3yM1jcvyBO4ApdEcdBz6+np3NkfPfvKODZAQjBOKHEXkzox
 Znz6omPbPgccSbOLiSDvf6hjuGv+jSGEYLVRD6RAqPo1K4sg5mdk+LG5YbgFPG7WbfSD
 NnO5SzDLL57cWtvffQeDUfjumDzXygqhQltuW1Oyx8iL7SW6zuhATqK2l6jLiKbdyr36
 H4vUnpP1cjgEBpWJXg7Tg8tzA599CQHdo0mLk6yjaUTp5rKMycxkOWcaJXJ9tThrXgiI nQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3px7a2h22y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Apr 2023 14:19:14 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33DLIXWN027488
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Apr 2023 14:19:13 -0700
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2049.outbound.protection.outlook.com [104.47.74.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3px7a2h22x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Apr 2023 14:19:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1l0rbZf4SLfrLgNq4dn10wskEBqZmteoiU3NWrY77StdG4Cu4r67tNtEJ9vlgosDQneEwsFdYNlgaZ9maDHUG7W9NDGpqgwaKasgRwe86MJIPGvlCxQ5COb9fh/cbxTAAeTGOnv/LEie7cd0XF+Uq57Jwk1huolaFUcBAsm983yl7D2ztT+UJt/ivWOdizq4E9Q3U5B0jL9nXreZLpoTsbPdXbYTZfeWzOSQbp4QawhOJOPmqiy32wbFbiqGzsMGQI31CYECB9OojJOcw+CGIppDeAcYvNhheVx/HIeYYaDFjXMKdjPNBmaK5AYQtuoMRZwegMosvP0uiAthS0/vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dhi0nEDc0vL/WGvXO7OucKljWpTxHoLOWcUXT5YtnFo=;
 b=TifOlz9FjzVsm5XeqTc+VdoRqe2MLKbWGcNbzpBDMmYKk8nmsSJ28Rx2N8BZWstGdNZhcnU+AuvVjDGkg/G7kvCmOvFCL74BEZa64N45MKQoJjNGbDNBhqZZiaOnYWGnCdDLd9MqZtKn71QgRMjbJFLksbRmK3iU98EVIjjuFd1kcs/LnnXOv2JeOPFMI1C1HYD8vH7uu1yc/UL8p9yyYq2qzH+V6C8dxSnESdLxR1jervKJUZuG3sx9lUyujrQTNC1OUq2A3H+9mqUcbU8B1KxLQuX6fpW8HDE8MA65t9DiXPDUg26NzFqYGE7DH74JfizLrEbNY4dBVzFxOjqbsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by CH0PR11MB8085.namprd11.prod.outlook.com (2603:10b6:610:183::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.34; Thu, 13 Apr
 2023 21:19:11 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::6e26:7321:99ab:72ab]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::6e26:7321:99ab:72ab%3]) with mapi id 15.20.6277.035; Thu, 13 Apr 2023
 21:19:11 +0000
Content-Type: multipart/alternative;
 boundary="------------vfDqL1K4LmwBj0FWYW9Sleb9"
Message-ID: <0d9fdcf0-4093-45cd-140a-990f01592e18@windriver.com>
Date: Thu, 13 Apr 2023 17:19:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [oe] [meta-oe][PATCH 4/4] libgpiod: update to v2.0.1
Content-Language: en-CA
To: brgl@bgdev.pl, Khem Raj <raj.khem@gmail.com>,
        openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Sakib Sajal <sakib.sajal@windriver.com>
References: <20230411131518.401912-1-brgl@bgdev.pl>
 <20230411131518.401912-4-brgl@bgdev.pl>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20230411131518.401912-4-brgl@bgdev.pl>
X-ClientProxiedBy: SJ0PR03CA0244.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::9) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|CH0PR11MB8085:EE_
X-MS-Office365-Filtering-Correlation-Id: ab9030fb-5d22-4fbf-5114-08db3c64b980
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4bhJmt7t5oxI+U9me3oOGkHFRd5Mra4L8lU002QXnNtqloK+8t6L32XBhhsaOqRHRh9Qys5TTGESmHFotfjgXSxoiCEibxc7MI4EuOpQz03y8Y0oPJiNPal8E0cVoTKWCF2d0wIC2dXHiCvQ/DG+z5BV2cA0+WygNJzjAQu7nZVCTea3AdDOfFRkxHrnVOsMPFehztSrUhWm7lhQE88WEkjzC8gydVkYil1QbsxD7kY2gxul+Bz+Fogs/5OBvqebcrUyhfQk71M0sJGUvcNUhhJMzHIEjegYc6ZXk7JNE8V8MNF0QhRfoHvM6iuP9B3pUuEaS8l7S4pfnkqDOufrT2vR2CAxD6MHN2rS4sIBOsA/EbBKmD6P+BaN8eVk5XPCaCz7mTUlVbKXxTuAoZoPZL/AfKea+/X2kDzXWc/CIWjIbB+ulcx9U76RU9lwbx4uOEcnv2Asnu2DoxJ889sbpBy4cKJ96lvDJlQiq3jmnWSwXpkgEpy0xJEw1VDPUCUaSz0CVo4StabSuhHuQ9I4KNfgKWu8V72uNoPFmtLNEzSXsCJzCS+ANPRKeK/x3OATCVniiuygcb4qbsq8ptBthE86o5LHmRN/vonVPa/5k5CdXxDyFs7LkV6Tljz0nICEKfrscPVEl73wcSYbJzwSzTVsgjRFx3e4bHNliIPoc3k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(136003)(346002)(376002)(396003)(366004)(451199021)(83380400001)(5660300002)(6486002)(8936002)(166002)(6666004)(54906003)(316002)(31686004)(26005)(53546011)(6506007)(6512007)(41300700001)(33964004)(38100700002)(15650500001)(2906002)(4326008)(66556008)(66946007)(66476007)(966005)(478600001)(8676002)(31696002)(66899021)(86362001)(2616005)(107886003)(36756003)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MHY3RzBncXR4a3g3WWlCRzB1c1A4WVFSeFEycDYybjBINUZtQnNjWWk5Qy90?=
 =?utf-8?B?eisyNVVVYkpmMm5hK2xURDZwbFZuNXRqd3I4RnV2SDNrUUxzNW5oVTdiMkQ4?=
 =?utf-8?B?eThzaEVXWnpuN0dzZXRkNE5vQW1vamdVVUJ4Y1RRNWxuVndxQW5KTkJZYkZu?=
 =?utf-8?B?cmxmN3lqL2VOV2lkT1AvUEY2U1p5NittMCtKUVB6ZDllSVBySWorOGhjYzFi?=
 =?utf-8?B?TllNYnZxK3p0Y0tXWnYyRDkvZ2hEVmkrZjVZcjBta0s5MWdCQ2wyWVRaRXpO?=
 =?utf-8?B?ZS9RR003S2RORTdySTFvRWRoZ1cvWE5xMklKVGhEM1RYRTFSY0M0Ynp1VXZl?=
 =?utf-8?B?elRiclRPN0l0dzUwM0U2clZpTGNNWEI4eXBsWFN3eDRYQStRTGE0NzB2SUly?=
 =?utf-8?B?QXhxdE9RM1AvTGVWVERIN2Z0V3ByZ0hYOHVqd1dlRGlaWHVsOVVkOHBGakhG?=
 =?utf-8?B?TzdqSkR3UFIwTXAzUkZzRU5zZ3VWdjkrd1kyTDdJdGwvVTNrRjNaWmNQak9Q?=
 =?utf-8?B?ZFYvS2JKNU9pUExwd1ppRG16MVJNeERVaUFLSWNJNjBBUGZHbkV6OW0rQVVi?=
 =?utf-8?B?V0NJNlFpL0NZbnF2NWozZFplQncrWUZ2Qk12b3dXcG9MTlUvcWFGb1kreGE1?=
 =?utf-8?B?by8rRU9jOGpOQzhrR1M4S1BUd3dRb25rb1hyay84cEdxTlRjSTRMWmN4N0ZL?=
 =?utf-8?B?cFZNY09mSkM1Zld1b3ZkREdzaVN6L09oZTJBcktuSHM0OHF3ZHA0c0plc3pV?=
 =?utf-8?B?M3I1VTY4OFF5NzYvNUYyYm11Rmovd1d3TDRCTCtoSjNyZExBanRmc1pDa2gw?=
 =?utf-8?B?Y01FcWdtNmJjeGRuNi96QzRCKzhLU2hHS2xZYnBuVzNLTnNUc0NiOHNBZDVO?=
 =?utf-8?B?c0hBWXNUZzQvaXdJM3lVMGM5YUlPNnRFRW12VFkveGZFWVlKR2hqTHdIWkRn?=
 =?utf-8?B?ZGVqdGhYWkRqOXR5enQyRnlkWEQ5Q05qN0lWYVhOMmJqOE5neWdEYVNZNE5T?=
 =?utf-8?B?bjZyclJPK09mZmlXMEpWNFI3aXpWbWZnUkNrWTVTcmM4QW5yc29TRzNVQWlv?=
 =?utf-8?B?c2RZeGRtZC9sWE82aDhvejZrVlVCTWJKZnczL2hWc09rSHJ6OENXUTBVZU1w?=
 =?utf-8?B?Z0JpQ2prc2JKS0NTMC9DUFU0ZXFOK05yRnR0TVRmM2FXV0tUZ1ZoWWt2S0pR?=
 =?utf-8?B?bTZ2dFNPY1JYVEFEM05LbW1xY1QvaG5vY3QxZ1J4VkttMEY3N1FRVGhkeHhP?=
 =?utf-8?B?bU1TdVh4ZnJ0RVQxZktKMTA4NmJPcnhkbHNkWTl6N3Z5SzZBdmZ1dXpzbnB6?=
 =?utf-8?B?QWQzZHpUbmhHZG03YXFMcmZEbXYxb2ZFNXZtZVdSYTBkMkYyOUZxZU1LQ2x4?=
 =?utf-8?B?cVp4c0lSU2crOVlFV1E2Y3B5SkNDTVRsQ1lRd1ZLbkpubzlYcXlyaEsvZCtS?=
 =?utf-8?B?c1NRR2trUUNCeEhBLzBuTFhWRG9rcWQ3WnFGRDZFbG50TXg1dUJaZUxycnJw?=
 =?utf-8?B?akZJWUlCNzZ6Y3JGQnhxd0RSWWgvZ1lvbkJvaUZRNjc5Wkg4cmhyVFBVaHhC?=
 =?utf-8?B?QUdDcUJqMWNJL2F4RU96bFdFcnpQYlV2MDczL3RnU3JTcFh6OXRFSVNUdnA4?=
 =?utf-8?B?NU5GQkZxODVOKzd3Q3p3SVl2TnIyNGNkT2YzT29Lc2laZ05WQUZhRzI0aVdU?=
 =?utf-8?B?QjZHMzlOOUcrNDBnemZvK01NUGxTL1U2cjB5VXNtbm9hUW5leGhuQlkvNmhJ?=
 =?utf-8?B?L01OcmdFMlFCMFgwTVJPZzkvcmIwUUtvQ3I0TE1ialg2bmdtOXp0dDFwVXIy?=
 =?utf-8?B?b2o0enpOV1psb2Z3aVp6ZHRheEF5NXRvU3RPYVZjNXdJSmx1bzIzL3EyRnhJ?=
 =?utf-8?B?RDdGVHFadkQ1ZERvTEM1VmpQamV1bko1NTI3eWlKVVZNcTNXNTJ0ZlRYWEZN?=
 =?utf-8?B?M043d3gwclFNcWR1MnoyWTNiTnhFamt1MXRHMVIzY1dreDRTWGdEZXY0cDkr?=
 =?utf-8?B?YS9OT3hqeE95OGpUc2dVdFpVVG5WUU1TWldIUFpqVXdmSXZUZDVXcGZ1WlpL?=
 =?utf-8?B?cmQwSlF5aUh3cm5uTkI5am91NVR4a3F2NWowU21iTjBLM2xoMnR0MXh6Y0pF?=
 =?utf-8?B?SDV0ZEN6Rnhwb1dFNFcwZ25CT3Y2VDhxQlJuK3Avc3BCYjZzZ3p0UmNZblVV?=
 =?utf-8?B?NWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab9030fb-5d22-4fbf-5114-08db3c64b980
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 21:19:11.1329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fMhZmyMEr4k77Fdldm6kjYom+o/X5+4szmfASlo/xY2SKJxZNN3XxxnvcUXlUvT5KN5JMjbUcSnaDXd58zdngH1h7VtfzgTxMBlnPMka/6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8085
X-Proofpoint-ORIG-GUID: b-9V-eZ6tMYO1f6L4lVLHV8G7h3LAsfz
X-Proofpoint-GUID: 90vLuyeNYYD7id5YT2CuU57yFklyweUv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-13_15,2023-04-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304130189
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Apr 2023 21:19:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102083

--------------vfDqL1K4LmwBj0FWYW9Sleb9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 33DHpZtW013227


On 2023-04-11 09:15, Bartosz Golaszewski via lists.openembedded.org wrote=
:
> From: Bartosz Golaszewski<bartosz.golaszewski@linaro.org>
>
> This is a bug-fix release addressing bugs discovered since the release
> of v2.0.

Should we drop the old recipe?

=E2=9D=AF fd libgpiod
meta-oe/recipes-support/libgpiod
meta-oe/recipes-support/libgpiod/libgpiod-1.x
meta-oe/recipes-support/libgpiod/libgpiod-2.x
meta-oe/recipes-support/libgpiod/libgpiod-src.inc
meta-oe/recipes-support/libgpiod/libgpiod.inc
meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb
meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb

I think that v2 was added when it was a release candidate:

https://git.openembedded.org/meta-openembedded/log/?qt=3Dgrep&q=3Dlibgpio=
d

../Randy


>
> Signed-off-by: Bartosz Golaszewski<bartosz.golaszewski@linaro.org>
> ---
>   .../libgpiod/{libgpiod_2.0.bb =3D> libgpiod_2.0.1.bb}             | 2=
 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-oe/recipes-support/libgpiod/{libgpiod_2.0.bb =3D> libgpio=
d_2.0.1.bb} (90%)
>
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb b/meta-oe=
/recipes-support/libgpiod/libgpiod_2.0.1.bb
> similarity index 90%
> rename from meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
> rename to meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
> index bdfd72f2e..50b9203a7 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D " \
>  =20
>   FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-2.x:"
>  =20
> -SRC_URI[sha256sum] =3D "f74cbf82038b3cb98ebeb25bce55ee2553be28194002d2=
a9889b9268cce2dd07"
> +SRC_URI[sha256sum] =3D "b5367d28d045b36007a4ffd42cceda4c358737ef4f2ce2=
2b0c1d05ec57a38392"
>  =20
>   # Enable all project features for ptest
>   PACKAGECONFIG[tests] =3D "--enable-tests --enable-tools --enable-bind=
ings-cxx --enable-gpioset-interactive,--disable-tests,kmod util-linux gli=
b-2.0 catch2 libedit"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102057):https://lists.openembedded.org/g/openembedd=
ed-devel/message/102057
> Mute This Topic:https://lists.openembedded.org/mt/98196930/3616765
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  =
[randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------vfDqL1K4LmwBj0FWYW9Sleb9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 33DHpZtW013227

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    &nbsp;&nbsp;&nbsp; <br>
    <div class=3D"moz-cite-prefix">On 2023-04-11 09:15, Bartosz
      Golaszewski via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20230411131518.401912-4-brgl@bg=
dev.pl">
      <pre class=3D"moz-quote-pre" wrap=3D"">From: Bartosz Golaszewski <a=
 class=3D"moz-txt-link-rfc2396E" href=3D"mailto:bartosz.golaszewski@linar=
o.org">&lt;bartosz.golaszewski@linaro.org&gt;</a>

This is a bug-fix release addressing bugs discovered since the release
of v2.0.</pre>
    </blockquote>
    <p>Should we drop the old recipe?</p>
    <p>=E2=9D=AF fd libgpiod<br>
      meta-oe/recipes-support/libgpiod<br>
      meta-oe/recipes-support/libgpiod/libgpiod-1.x<br>
      meta-oe/recipes-support/libgpiod/libgpiod-2.x<br>
      meta-oe/recipes-support/libgpiod/libgpiod-src.inc<br>
      meta-oe/recipes-support/libgpiod/libgpiod.inc<br>
      meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb<br>
      meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb<br>
    </p>
    <p>I think that v2 was added when it was a release candidate:<br>
    </p>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedde=
d.org/meta-openembedded/log/?qt=3Dgrep&amp;q=3Dlibgpiod">https://git.open=
embedded.org/meta-openembedded/log/?qt=3Dgrep&amp;q=3Dlibgpiod</a></p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20230411131518.401912-4-brgl@bg=
dev.pl">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Signed-off-by: Bartosz Golaszewski <a class=3D"moz-txt-link-rfc2396E" hre=
f=3D"mailto:bartosz.golaszewski@linaro.org">&lt;bartosz.golaszewski@linar=
o.org&gt;</a>
---
 .../libgpiod/{libgpiod_2.0.bb =3D&gt; libgpiod_2.0.1.bb}             | 2=
 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_2.0.bb =3D&gt; libgpio=
d_2.0.1.bb} (90%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb b/meta-oe/r=
ecipes-support/libgpiod/libgpiod_2.0.1.bb
similarity index 90%
rename from meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
index bdfd72f2e..50b9203a7 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D &quot; \
=20
 FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/${PN}-2.x:&quot;
=20
-SRC_URI[sha256sum] =3D &quot;f74cbf82038b3cb98ebeb25bce55ee2553be2819400=
2d2a9889b9268cce2dd07&quot;
+SRC_URI[sha256sum] =3D &quot;b5367d28d045b36007a4ffd42cceda4c358737ef4f2=
ce22b0c1d05ec57a38392&quot;
=20
 # Enable all project features for ptest
 PACKAGECONFIG[tests] =3D &quot;--enable-tests --enable-tools --enable-bi=
ndings-cxx --enable-gpioset-interactive,--disable-tests,kmod util-linux g=
lib-2.0 catch2 libedit&quot;
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#102057): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-devel/message/102057">https:=
//lists.openembedded.org/g/openembedded-devel/message/102057</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/98196930/3616765">https://lists.openembedded.org/mt/=
98196930/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.=
openembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/=
g/openembedded-devel/unsub</a> [<a class=3D"moz-txt-link-abbreviated" hre=
f=3D"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------vfDqL1K4LmwBj0FWYW9Sleb9--

