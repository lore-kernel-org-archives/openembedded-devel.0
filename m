Return-Path: <chanh@os.amperecomputing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E57B3D10399
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 15:49:28 +0000 (UTC)
Received: from SJ2PR03CU002.outbound.protection.outlook.com (SJ2PR03CU002.outbound.protection.outlook.com [52.101.44.105])
 by mx.groups.io with SMTP id smtpd.web11.15264.1729871364735914604
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Oct 2024 08:49:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector1-amperemail-onmicrosoft-com._domainkey.amperemail.onmicrosoft.com on 100.100.100.100:53: no such host" header.i=@amperemail.onmicrosoft.com header.s=selector1-amperemail-onmicrosoft-com header.b=luaiLcp4;
 spf=pass (domain: os.amperecomputing.com, ip: 52.101.44.105, mailfrom: chanh@os.amperecomputing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R0EUcUeWigN62KeqQoZcQ0cOQOc7h/yWGSAjsbcx/hp8jOWP9tNnlLwSd4RvjKwIlgpqv2wm51KD0lbFSFk08q/PekQJDKT4mM929Y4DXJ0JU2CO2jkq128ZlZuIacdSuSZfOLJvz8gdcB9uKE2W6gA72vdJOCixL6BvXjv2Y7yV1WnMehdp13jnAazJVC+tBGlaJxCDHDuG9eygKuYEh4AP2EtnTPi3qabj6BmPHG5qFQYA1tR7GoNCq0etCpX0H1hmgN1dipd/LUwAWgOZkRnliDTfwj9xOSwuKYoCvKjodJeeKx+FyxJLjdhEjsLJTY6ZqbISu1GBjlR5FMS+fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hliJKKKRbkHuPfyDWW8ZcjDSAh914hmQ0lMJWtFVU/s=;
 b=x8VbSe1gEAz67/IohE7V76CHyMpSrhWdSEgop+zIPuBebIBy3YRGcf8RkF/4RmeLtjiavsJrGglwkZXsZLRidQnYiAjTHCr1E5wzXTT5YoC0xtn+K0hnT+2+GA385cW140fqpOZujgL0/01K5v9o0I0Q/Y4PqXm0/4maXPLvPyfBk7w4nvGt19zHtos7yU39FTjhjdw8qaIRBYjGliDIpXyirup4S21As+4QO7i0TtkixONu7cD4Hw68Ywf8CRzX48K6a3C7E8uDF3wAPr7Rpb64J1l8USFqsRWZcI66UNGwUWCi4/0zWlpxZ1vjrucdFvjLje4L72bOpgKuJ1guBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hliJKKKRbkHuPfyDWW8ZcjDSAh914hmQ0lMJWtFVU/s=;
 b=luaiLcp4+G+3eHlNwPEaFrKJRvFa0nDrE4T/kCk1igdbUFSt0ZNIBsi7XsjqbmCAxg2ZUkQyuxiZB/VHksRFTu+ewVZftpV50hpXP4J5N1yhicsOG/G2mnehO6Bf94xMmfjJFxhwSzA8Xm3clQx7q3/BPU8nOqprn0KKxvylwkY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 SJ0PR01MB6205.prod.exchangelabs.com (2603:10b6:a03:297::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.11; Fri, 25 Oct 2024 15:49:16 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%5]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 15:49:16 +0000
Message-ID: <b1b309ce-2417-47b0-86e1-7d2761fbb68b@amperemail.onmicrosoft.com>
Date: Fri, 25 Oct 2024 22:49:09 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-networking][PATCH] mctp: Fix CI build error with musl+clang
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
 <2b431a79-3d7f-4b55-8238-21072edbaf20@amperemail.onmicrosoft.com>
 <CAMKF1soGa9mqLAxC2+4s+L8iEdgdpp57asn7Y5ULusrucR9sSA@mail.gmail.com>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <CAMKF1soGa9mqLAxC2+4s+L8iEdgdpp57asn7Y5ULusrucR9sSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SG2PR01CA0183.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::16) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|SJ0PR01MB6205:EE_
X-MS-Office365-Filtering-Correlation-Id: cfc3e02c-a5ef-4e7a-90e4-08dcf50c94aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?h7SzshYKO6GDQ1JHx/mHIkF9kX3taJtOt55JxyiKu/ebyVNEd9xVVx3JF8Jt?=
 =?us-ascii?Q?aJbvhBhoVEuP2l/5QUpNPbAtuI8p6e0fnrQkrMHV5duXx5pfWXM4rbazsQIt?=
 =?us-ascii?Q?FCyapMBTBQ4VAhN1wY2IeQTKHYZOpuBQN0JYBdYs5YYi2ZYoxGF5rNjO1L5S?=
 =?us-ascii?Q?XYmo+kjgaAmffbzcZ+Vpy3c97rKzCviqN195tuIlgFlgsGuyWY4uHhHaNi/n?=
 =?us-ascii?Q?OVBRlAHbCzHm5ivvdMXC6+4R93Dm+j9KA9Sz64wrWZc9pKekAC1c+e9lw+r/?=
 =?us-ascii?Q?g/fS9J5hCTvegkBSb+uRgGBM+mj89byK+wcGJWaURJFJKLj1EVtWZI+0fvSX?=
 =?us-ascii?Q?ahvZS9Kbw6Eo7bJ19zzHSX9edU+rExC+X90rtAEI4hbR2BxSOyae9+ofpW/X?=
 =?us-ascii?Q?SgpJCckINZ7pVepARby2SpMN8iF+BOHdaU0UMWhdf4f3KGLzlAmQjluXQoEx?=
 =?us-ascii?Q?IyIdXuaN0K9V9CkrT5dKddL2bS55RYd2WTRxtvm/6zWsQDFajbfD8bglH+lT?=
 =?us-ascii?Q?3BrQdgVZdyjA9OP1az4YsNuGwfM13PWa+Tp31Mf9tAT30AXvJJM5ZtUD2Ilz?=
 =?us-ascii?Q?yUtaRb4hHxSnUrDibbNT1KqJI0bpPsKzbUy9VXBfYOjvKVM7JjoZK5RqqdPp?=
 =?us-ascii?Q?pqvkj2GjHyRScXRN/fSJ1od/yLlmWI04cqd72BdjpPUp8LW6s8wJceKWDLsN?=
 =?us-ascii?Q?amO5/+HDal/XN9s85XEqRQym7JYhWLBzRTtRZT9+1yNuxNjOWSGfIyb9PO4B?=
 =?us-ascii?Q?7Zz4IZtQxbys62tKoWHB7Hv5IUTEpAyX/ejUMK9mTviQgmYLGIz3DPIzviha?=
 =?us-ascii?Q?YFKkIVXdgs25VPDSu2l8+ygT3W2TkTWFHHDIRlNP93XWBs7ufn60odrzh0dO?=
 =?us-ascii?Q?BMFbT/aUOrxOqsCoyQF1zMCMha6aqW4HU6y40ze9PBllV4WwweI1+B/iC2Y6?=
 =?us-ascii?Q?ohnh58lxMpSfd5ovD1sgelyEJ9FjpeaL2pn7iR8PDrwzwuu5kWoR9Dd8Q3zX?=
 =?us-ascii?Q?xJ+qKLupPyXj8xoIpYbuBCg/7Al8WvV6anLOopiQGkerRluEoNt/XNdJNYEI?=
 =?us-ascii?Q?llyJmB1uzce2FKkPOIyttIH/IugZS64axlbupHXPrOcn2FZppf9OG1g0TkQM?=
 =?us-ascii?Q?HCAp0tEhMDAqsGtLAUGeNTJYmNOLXgOW3Kr45GX39hu79Lpx0QmX1UmUKykO?=
 =?us-ascii?Q?w/ArShV8iC8az3DvB+4B/9ObZH0Cofj5F8nDEgC4eZVoBaoZsiTwWZ43R5V6?=
 =?us-ascii?Q?x1xiUo8K0EEV7KaSq2Pj?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IoXyJfKzqttIthkvd3SVIdTNbJgS3Gg9Vu3ARtb+SzM4zfWAnkUocr172fL7?=
 =?us-ascii?Q?dkSpgRyS/ll5bSnJXIWQ8kF5Ifp8rDu2pdL2gOxSjUIzbOumiKxR0YBL/jGM?=
 =?us-ascii?Q?Acp8VE0bjznIwWwMD61iL9/y/+0AKFGXsrRXhBXVP4+KTY9fB06yJ4foAVek?=
 =?us-ascii?Q?oehVKyjIZ0Dg7NAomMNd5/y3NWrvUi1A8IHNArjjlMGkOMGNdAveQlVOkCXH?=
 =?us-ascii?Q?cDBtRNUX4gasWXbdiMM//F7Tgfp+6JuK67JrcOIEM6xBszMQfOX2vrIo8JtM?=
 =?us-ascii?Q?bOWW7NhV/33p0VkFm2Qye1+sf448I3czuU0JrPgp/Tget9CgzOMJBJqG7ngx?=
 =?us-ascii?Q?w0MqyPgiiogw1gmm9gp/R8AaHRPpb4dfHHdJfgh1vGQGP3iG4N10w1b9iRxA?=
 =?us-ascii?Q?eYv26UFy48zgPsptjCAueO8BeWFyK7174F6XTvFVEk+G4fvtj5oOBN1/VAyx?=
 =?us-ascii?Q?V71TZu9Q3UB2TY+Qf1sdPLDKE9IIULC5jxI4GhouNEY63xqNJS205B+sdEup?=
 =?us-ascii?Q?1FS9PXqJ+nrJKoPGdR+n/TABB+7aUgwfb3xos9WKESD4bZPTpFQL94dcXHfg?=
 =?us-ascii?Q?4GF0jKRTk1zl5h7f87ahhmPvd2yoJzabUg/bmuahKQq8SwySP3kxPkCHmlr8?=
 =?us-ascii?Q?S0flsbkYJGwDxpUWEuXA1pi6/noHzcWdW9D6JdKQ7QqQrhLXujIW0R99OCsY?=
 =?us-ascii?Q?fru4bLdOmZ3lG2rtnlUXWG7JFtBMJUxll5D4ep+luLX3PCo0mjchP5IpizW+?=
 =?us-ascii?Q?8xN366GdeNaU8o/QvufnhxK+tXO6LWw/cgVfumPeeXVfPyKHI1JLWHZSY6Ep?=
 =?us-ascii?Q?NuF1971oHS/H//sNqH7QLwY7IbyvqXWo2tVwmnz7f1bXP06XXCCAc//XsW4r?=
 =?us-ascii?Q?+R/RRlFCfeI8HDgJ4omPpZK6DNVJusBp7dHs6OZ3FDhu2OQCpCImSRGsfq25?=
 =?us-ascii?Q?Zt9gkCGWUtBCESFv3Z8PjOXzZYhQC6hSByLeYJDKwcAUa4LWQDC6ppfXyGkj?=
 =?us-ascii?Q?ItekHQv7b//y+AMzXSGbHg73dhHsgJYkHLrFQWF3IKOlc3itOx/VEUFoWwKs?=
 =?us-ascii?Q?UM4TmVQ1b3IHoRfmheqtK1P9stnXz9fW8ft6WgAI2SaPE0+QzqsWlbug/z2g?=
 =?us-ascii?Q?9XpRCz7pyB1wT3emQ/bMPSbKw1I066MSLQ819ZLqitCpNnDgtlfyceH3lVsn?=
 =?us-ascii?Q?AkdYvVDwMXpR4tGk+fc96rTnkzO6WEYwzhVii5a+WyIGtRw54V/1iUW+sSyC?=
 =?us-ascii?Q?nkLzYvwWq6JRfDrVenqCg+aWtRwUa6LIkzeXSNcY3x56UD8ieOcvQUE6Yzyi?=
 =?us-ascii?Q?0dUn8zGczBQpSRKalDUBnlASmjIyo3A1X0ooEQk8Uz3ZALcesFtbMQQbluz+?=
 =?us-ascii?Q?Rnr9uUzIkw8xrpGoJunFGYNljKDIChku4kqNY0PJUyQ/I/8n4bIJm8NZIl1Z?=
 =?us-ascii?Q?aQujxHxz6j5hy7X3pN2KE7SW9LsNX5NsXp0lke8R6z29A13xxR6B8xzsGbkF?=
 =?us-ascii?Q?ZlEg+SAfe1jiaxxME5C4ZHQSG8sfsWuMbZVofSIEMHdwBC42qP/XHR4KYzwR?=
 =?us-ascii?Q?abkSxORH7uzQbfBG1p4hDE2WjULRMGLFUXEYA23u+jlTfacoP3NWmqH3oKXe?=
 =?us-ascii?Q?T05ynOt66jVTI5+IgCMfCa0=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc3e02c-a5ef-4e7a-90e4-08dcf50c94aa
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 15:49:16.6664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9QPXwNCaosNRNKJgb73gudNBSaMHcG3rx9w6Czd3OuH0yp1RFeyF+pvcLQfo4L6TrLXf/BuQO/zJInhrjsUr6v29vUc+jgxcgtgRP/2mTVdJvEM7onFpkKMir8Q26Y8S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB6205
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Oct 2024 15:49:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113227



On 24/10/2024 22:22, Khem Raj wrote:
> On Thu, Oct 24, 2024 at 7:57=E2=80=AFAM Chanh Nguyen
> <chanh@amperemail.onmicrosoft.com> wrote:
>>
>>
>>
>> On 24/10/2024 21:46, Chanh Nguyen wrote:
>>>
>>>
>>> On 24/10/2024 19:18, Khem Raj wrote:
>>>> Please test it and wait it to merge before sending pull request here,
>>>> feature branches are temporary and usually not something we use in OE
>>>>
>>>
>>> Yes Khem, it is only temporary for CI build checking.
>>>
>>> Can you please help run CI build? If any other errors, we'll fix.
>>>
>>> Thanks,
>>> Chanh
>>>
>> I and Jeremy used the musl compiler (https://musl.cc/), and it compiled
>> the MCTP successfully. It seems the error just happens with your CI run,
>> and we haven't known to run the CI to check.
>>
>=20
> As I mentioned before, the combination is clang19 + musl, musl.cc is
> gcc+musl only so
> you won't see clang specific issues with it.
> That's fine if you can say [RFT] in the subject line to convey the intent=
ion.
>=20

Thank Khem for your instruction about subject patch!

Should I resend this patch with new subject ? It will be
[RFT][meta-networking][PATCH] mctp: Fix CI build error with musl+clang

>>>> On Wed, Oct 23, 2024 at 11:52=E2=80=AFPM Chanh Nguyen
>>>> <chanh@amperemail.onmicrosoft.com> wrote:
>>>>>
>>>>> Hi Khem,
>>>>>
>>>>> This is only a temporary patch. It helps check CI build errors on the
>>>>> MCTP repo. Please help run the CI build; if any error you can show he=
re,
>>>>> then Jeremy will update the mctp repo to fix errors.
>>>>>
>>>>> Please don't merge this patch. When the CI builds completely without =
any
>>>>> errors, I will push a new patch with the latest version on the MCTP
>>>>> repo.
>>>>>
>>>>> Thanks,
>>>>>
>>>>> Chanh
>>>>>
>>>>> On 24/10/2024 13:51, Chanh Nguyen wrote:
>>>>>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>>>>>> ---
>>>>>>     meta-networking/recipes-support/mctp/mctp_2.0.bb | 4 ++--
>>>>>>     1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/meta-networking/recipes-support/mctp/mctp_2.0.bb b/
>>>>>> meta-networking/recipes-support/mctp/mctp_2.0.bb
>>>>>> index c6aa7c104..793afe755 100644
>>>>>> --- a/meta-networking/recipes-support/mctp/mctp_2.0.bb
>>>>>> +++ b/meta-networking/recipes-support/mctp/mctp_2.0.bb
>>>>>> @@ -5,9 +5,9 @@ LICENSE =3D "GPL-2.0-only"
>>>>>>
>>>>>>     LIC_FILES_CHKSUM =3D "file://
>>>>>> LICENSE;md5=3D4cc91856b08b094b4f406a29dc61db21"
>>>>>>
>>>>>> -SRCREV =3D "f110926b082731b25720b444378ad55d7a9d451d"
>>>>>> +SRCREV =3D "089dc53fa7387cca517cd713061c323ca06fb6dd"
>>>>>>
>>>>>> -SRC_URI =3D "git://github.com/CodeConstruct/
>>>>>> mctp;branch=3Dmain;protocol=3Dhttps"
>>>>>> +SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Ddev/cross=
-
>>>>>> fixes;protocol=3Dhttps"
>>>>>>
>>>>>>     S =3D "${WORKDIR}/git"
>>>>>>
>>>>>
>>>
>>


