Return-Path: <chanh@os.amperecomputing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F5F0CE8E89
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 14:57:18 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.142])
 by mx.groups.io with SMTP id smtpd.web10.16623.1729781836461366173
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 07:57:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector1-amperemail-onmicrosoft-com._domainkey.amperemail.onmicrosoft.com on 100.100.100.100:53: no such host" header.i=@amperemail.onmicrosoft.com header.s=selector1-amperemail-onmicrosoft-com header.b=QzFrbHZP;
 spf=pass (domain: os.amperecomputing.com, ip: 52.101.62.142, mailfrom: chanh@os.amperecomputing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hF4/IKhObMcHJlGrZ/unyHxe0AWV/YzasuZH0e+BvuM3UPvqO5f+cBruujc9AnTziip2Ylhj0RN3ktFY2WVrMNjNzP8sigM70rXIpBznigqYdeXJsJvAHccKoXH5jMe07G7yqgvTrdGy5KXyHarRPS6EDIttYuQHVrhsQEwYKm/jgrOC50JMWVDLrIVGWlmZCjL5spbpaUICG+a9uas0YJsjAbK/tXJyNoj4qyTX1uPspY8uTrt7fnLG3I35cS7IqyAWUBHh8uSGsgmuxLsvp3afRw3FfMSn8toPQ9Wq7hVnLaf282dLVoAWigzceEjsH5NF4eib0nxLCrgRXi5g9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CludK1A8Ret3KmO1NjKKLIMMumI5KOKl8Uv/dIgcR4U=;
 b=fCbT8R6speZLYck+cLjrZdtkGbpSAG4+c1IQBP0Bj/vUVDD4ONXH8KoHMo0XztyDY6ZCPwe7V4a6NN8+0oelNFwM803KO3hvkAS5By9AYovfo7MaSaJO3jPocIotXPib60aY4rMSP2sJpym5OiAGVmGtD+CuIqNQYg57BUFU/Fhc/0x6tVvf5F7OxJfjavoJNeHMzzlHZY3Nlb6uusQzZ1Ble7kaQ01e6T4D5rYIFJPQsEym+MuaP/tiMYM2Hc8ddyBYNj15yH8bBqHxHqlbMY7eJt5jKpIc5G0VlQZghbfK3Wh64l4bT8ahsIUwMiHNHRRE5+Fbo1wobhSXRDAaOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CludK1A8Ret3KmO1NjKKLIMMumI5KOKl8Uv/dIgcR4U=;
 b=QzFrbHZP/5DlKHhGIKwW0YVGsLinN3XQ+Rhme3shOsq6fXlKz894ebB6OTZ59aMfNfJaBgs6rrKfV+e7VJ9hXqkM+CHH+jiHNLa/qdMF0ZHXg6TVaTtIl7NYDpaymFl4R2fp1QcniUuhEINbhce3zKqKypgYAREtVLzutbm1aG8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 SJ2PR01MB8457.prod.exchangelabs.com (2603:10b6:a03:560::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.8; Thu, 24 Oct 2024 14:57:11 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%5]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 14:57:11 +0000
Message-ID: <2b431a79-3d7f-4b55-8238-21072edbaf20@amperemail.onmicrosoft.com>
Date: Thu, 24 Oct 2024 21:57:04 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-networking][PATCH] mctp: Fix CI build error with musl+clang
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
To: Khem Raj <raj.khem@gmail.com>
CC: Chanh Nguyen <chanh@os.amperecomputing.com>,
 Jeremy Kerr <jk@codeconstruct.com.au>,
 openembedded-devel@lists.openembedded.org,
 Thang Nguyen <thang@os.amperecomputing.com>,
 Thu Nguyen <tbnguyen@amperecomputing.com>
References: <20241024065109.74010-1-chanh@os.amperecomputing.com>
 <38e5da48-fc0e-4685-b615-992a1f78dd45@amperemail.onmicrosoft.com>
 <CAMKF1sprL34koHC73Y9ji5ZTP2J+2W+TLDmoKjRzUR9vcudDjg@mail.gmail.com>
 <4f094abd-bd57-41b3-b4a4-e42180b45dc5@amperemail.onmicrosoft.com>
Content-Language: en-US
In-Reply-To: <4f094abd-bd57-41b3-b4a4-e42180b45dc5@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BY3PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:217::31) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|SJ2PR01MB8457:EE_
X-MS-Office365-Filtering-Correlation-Id: c0c09c09-ac0f-4a27-7e47-08dcf43c236e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sXtfft9ThbRhOGAzaBJY0b7mWBixtA7ltNvsf4dYudJZWGdH7hKQ4Yc0Jvm6?=
 =?us-ascii?Q?kZ87jB4TrtuMrVi7JHszfFz9GxnW91toChJxobd9Mb7f1xZmvA1w+zWDYPkH?=
 =?us-ascii?Q?Oll1b0e7jAFW4/Gp6kNsvq0IeXNrz/q51xo1MZvyBhorFW+get/mStEknJ4M?=
 =?us-ascii?Q?bzjP4mwiyfKhtjQCvdgm4iM0cPyYaGLIjPg9UbsTrbhBL0IEIH4m2jHTTLNf?=
 =?us-ascii?Q?5qzX752s6OYgmiC0OXgC4uJdwh8CaMgRf2KQsSjecj22u3p8z5qwCJY+hlwW?=
 =?us-ascii?Q?krPV93sgTi64+Tajer6ePKaMURcbKPBoPeQiZcKkf1aT9k/P4rPnyurKUPA5?=
 =?us-ascii?Q?TwZnvx5VF7LUEZW2o+ZadY+bg9/GC0wgOkyODXr1MRCZEthydMb0DMgvOy9f?=
 =?us-ascii?Q?4SD4dbbDW5fr/Pd3sp08j2ijJJL49Om02++2q00coUrWdZLvtCo+MG9JesMp?=
 =?us-ascii?Q?Spzn7spBl81rrXt7BzS5ROutHQx5+tS+uiSUTFkukicHGXllA3FBXVXT8fZo?=
 =?us-ascii?Q?at5iHtTKHQrowu4HxolOvstHdu59t049vIwI9CX+kfRIpS3hrXdAyl96zbPb?=
 =?us-ascii?Q?7I4cP5eknJ6XVIwYWXulzxZL7f2oXnS0ghw93JyrNjppZ7vi+jxGmEIcCtLA?=
 =?us-ascii?Q?tiPLJ379pV7cSkQ0Q2zen80TH7AisJemO7Qf8a4azlWVQb+Ki2bli9BbzmCC?=
 =?us-ascii?Q?8lyzANQP3IgJuP5lZk8b/ySjxZ4UFDq7uq+d0MoC+iYk18pWLg+mziJhDUc2?=
 =?us-ascii?Q?VpvnjNIxiPYa0XtHLxC4pqMwpUSTxdd04CF9TKFQIxeU2Cof/c8EW1lWVNz8?=
 =?us-ascii?Q?EQ0C1l6CTtbu+LPnzcQLVhW5E+YeB5kD1qVSqkr6QTeazUktHk+6KRifH6fk?=
 =?us-ascii?Q?HODuKailL8/Le+vWx58fJnSmM14nLuER5oJk1aifBkw/j/NAGa0bC9fF4u98?=
 =?us-ascii?Q?9fLkcG78vrx0xvAMQDStE3lFuxxBeSU+fGZtfNt/BDuaIxs5ZJSFmGUaT3vk?=
 =?us-ascii?Q?8vLQTJuo+3fGm8B+7Bkd3ywj1oxrP24ntHqzSnkdsKLN2Szks3SYTIlkWxoj?=
 =?us-ascii?Q?R+n2K2Pk69zENuBWCce4rsAWHVxiMM9Kh/CRGE/lZ+c3IvhTRSN9VubqM5VX?=
 =?us-ascii?Q?SXe9lcziBDOz7J74J0m0IqE0Tp7x+WmOV8oYuYF165eR3deLrkKwtKv2BcDX?=
 =?us-ascii?Q?yeOYsLpWFsWTZDVYxH1Cf7X9mmT9pncDkV/5IAqrmFfMxFqMfwlTAUtslRij?=
 =?us-ascii?Q?Aa4M+fdWlVQI8ue4yjBW?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+yv2he3M21oH/fHuaygw0I6t89ft91QftuScliZ/IP4ElXrCzmbtHUBzmx+K?=
 =?us-ascii?Q?HlYVOg8WzNjxCUFf6GeV/Ybe3s9Sn518niUui2cXLnwdFN5DQGGvUJFh3BKg?=
 =?us-ascii?Q?uGtMp7xXrgi8H5SEDfy5VCyHqRt424WZ7O7WIeORLPlIZAE7LX6q3Arvp7ep?=
 =?us-ascii?Q?m9N9osdEPyk8dHhvbrOXZoJ62KvnHhBzZkKsp3hv2VFgqW+6YOKsbbLqwD6N?=
 =?us-ascii?Q?IwjiyqBhLaPgaJj0zni4fhxO8UDaT3IUIzjwTWK4KoEiq6/F1ZGR6onlLI5N?=
 =?us-ascii?Q?6tLdyu9MNTBoW1mtALI5e09bYscxG59pOhuw/EdbPAOwo4E1OasWqASq/m8H?=
 =?us-ascii?Q?hx8lz6Nf7ecrAxSk4zR14yCnTU8siDHvl+SfolBbBUQPESUoYGMl6ZVIaaGk?=
 =?us-ascii?Q?2UgoaojR8dwgCRsdO4/8fu0u2Oo7czfH8tDY/hZWi+z1lhWc+ooowJv3wTNS?=
 =?us-ascii?Q?EBnOGkqntYyjsvNfazjlqxmFtL0WGyW0Tlcu+omGs0/i2bShj6kkU/1I0ehu?=
 =?us-ascii?Q?CXRDsEmtcsYYgDiWNpkjawZ3evF7EyNgb6BNjGwNvt+X2uy4OpKzg1cMjt0u?=
 =?us-ascii?Q?MXDNCkJ2kPTePBkHBH5fOQqTpsVRw1xc+1Ix7dj1GvO5hC6U/ELVYwWG3dZV?=
 =?us-ascii?Q?xWpUwbch7WeZ0BE4wUVWSOlxWqsJX9LlKw+rDgAkmyZTiVUyWUJqbVlknRio?=
 =?us-ascii?Q?lqoeZIhAQ2OAtxMnADGQYBSkDjz3CcS9PiyH6nXPz7r8liOpeewdQX+2cCUg?=
 =?us-ascii?Q?Q1mvWQmzk7654Cst2ubexuhlaOQoZWdKtzsMksR1uUSzAzwyZpQyKGqVQBiR?=
 =?us-ascii?Q?9Ern8RJAQ6kxBERIdZhfQ305r+A6X7kZ2aMpbsIHzfZkO7I9nTDUuJFp3qM8?=
 =?us-ascii?Q?lizrbs9yyLMnXdzyNx0/l4BWcS0lQfORVxpvJGPwCRb6j2KNQ0pm8lsVdRLM?=
 =?us-ascii?Q?/ypXRRcsO09zdtRU0bMApb7Pw2hgRWiIrdonmXhynfDIEED41dox9ifscwB4?=
 =?us-ascii?Q?F5sYMFwQ3ueN3lOT+I0DfoTc9+5P+qLJE1ME9lA/M5kEgyFl4ibf9BNvrG5E?=
 =?us-ascii?Q?kuIypWBAsiu1jQNnzvN38F5TN1paNne4SSVM5FxGMoaVX+0+QgbzGcqidlih?=
 =?us-ascii?Q?rf0C9uc0mQ/byONKBiq3eawKVMwnqhQEDnBWif9K6oCOBVdRy1xW2Evt1cD+?=
 =?us-ascii?Q?XQAUiowTGFbdHCh0U5ubuzLWU2337B9hMJYksZQKz9a40t3sAc9mWKcjewh/?=
 =?us-ascii?Q?k/FR+i90T/r3wC/B7110RoHdQ0NS0e0333w7aVeP0PL1jbxnZo8gO/4koMDK?=
 =?us-ascii?Q?cqLNNlSGjnv0/ulHtXhb/83cdE4digNeVMuWvTIR0LY4IqPBzcnaAsVxPClM?=
 =?us-ascii?Q?sev4LiDSpQhwNyZ5LW/+ZB4jqn1ujxcHO79tKQAlS8OuwwHDm7Hxg0IDkB/X?=
 =?us-ascii?Q?HEdclfofDc8YGuQNkr83+Yr+vlAf8jd0eIH7OLZHwZo5aaF0ymcIZ2RVfdDj?=
 =?us-ascii?Q?w2Srspyb1aeiu8JwBWwv3mTr+d+/vRF2ryja9SloUF2WfKxpyQgtzXO2ps2B?=
 =?us-ascii?Q?4nELVKgFy9lPYEMZqaLgamz55rmEFXix7WIKaWT4Ha5FkmptgJ0RsisXQwMK?=
 =?us-ascii?Q?swwniJ8/ld1lUIJurVlqJ9Y=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c09c09-ac0f-4a27-7e47-08dcf43c236e
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 14:57:11.0876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ol3we146jR08s5b4y5K/vpM95dl4Mtt4DxadMTl9H5PahypEe9adD0c0++PJR+/TC/+E8IMFBJYTSUEfUVCaYyh+5Sqh/081HTE1J7FSeYjkkIvyciRwX99H6rZYMyLO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR01MB8457
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 14:57:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113174



On 24/10/2024 21:46, Chanh Nguyen wrote:
>=20
>=20
> On 24/10/2024 19:18, Khem Raj wrote:
>> Please test it and wait it to merge before sending pull request here,
>> feature branches are temporary and usually not something we use in OE
>>
>=20
> Yes Khem, it is only temporary for CI build checking.
>=20
> Can you please help run CI build? If any other errors, we'll fix.
>=20
> Thanks,
> Chanh
>=20
I and Jeremy used the musl compiler (https://musl.cc/), and it compiled=20
the MCTP successfully. It seems the error just happens with your CI run,=20
and we haven't known to run the CI to check.

>> On Wed, Oct 23, 2024 at 11:52=E2=80=AFPM Chanh Nguyen
>> <chanh@amperemail.onmicrosoft.com> wrote:
>>>
>>> Hi Khem,
>>>
>>> This is only a temporary patch. It helps check CI build errors on the
>>> MCTP repo. Please help run the CI build; if any error you can show here=
,
>>> then Jeremy will update the mctp repo to fix errors.
>>>
>>> Please don't merge this patch. When the CI builds completely without an=
y
>>> errors, I will push a new patch with the latest version on the MCTP=20
>>> repo.
>>>
>>> Thanks,
>>>
>>> Chanh
>>>
>>> On 24/10/2024 13:51, Chanh Nguyen wrote:
>>>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>>>> ---
>>>> =C2=A0=C2=A0 meta-networking/recipes-support/mctp/mctp_2.0.bb | 4 ++--
>>>> =C2=A0=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta-networking/recipes-support/mctp/mctp_2.0.bb b/=20
>>>> meta-networking/recipes-support/mctp/mctp_2.0.bb
>>>> index c6aa7c104..793afe755 100644
>>>> --- a/meta-networking/recipes-support/mctp/mctp_2.0.bb
>>>> +++ b/meta-networking/recipes-support/mctp/mctp_2.0.bb
>>>> @@ -5,9 +5,9 @@ LICENSE =3D "GPL-2.0-only"
>>>>
>>>> =C2=A0=C2=A0 LIC_FILES_CHKSUM =3D "file://=20
>>>> LICENSE;md5=3D4cc91856b08b094b4f406a29dc61db21"
>>>>
>>>> -SRCREV =3D "f110926b082731b25720b444378ad55d7a9d451d"
>>>> +SRCREV =3D "089dc53fa7387cca517cd713061c323ca06fb6dd"
>>>>
>>>> -SRC_URI =3D "git://github.com/CodeConstruct/=20
>>>> mctp;branch=3Dmain;protocol=3Dhttps"
>>>> +SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Ddev/cross-=
=20
>>>> fixes;protocol=3Dhttps"
>>>>
>>>> =C2=A0=C2=A0 S =3D "${WORKDIR}/git"
>>>>
>>>
>=20


