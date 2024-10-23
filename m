Return-Path: <chanh@os.amperecomputing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 710E1D2E02A
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 09:08:39 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.109])
 by mx.groups.io with SMTP id smtpd.web11.4589.1729674511739775544
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Oct 2024 02:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector1-amperemail-onmicrosoft-com._domainkey.amperemail.onmicrosoft.com on 100.100.100.100:53: no such host" header.i=@amperemail.onmicrosoft.com header.s=selector1-amperemail-onmicrosoft-com header.b=dfFqe6EV;
 spf=pass (domain: os.amperecomputing.com, ip: 40.107.243.109, mailfrom: chanh@os.amperecomputing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=on/edBCKx0P4dwupgwJ+9YmY6lUPzAGvbkMN9q8wu3iyNuV6eVx1kBtQhj4sx7ABjg+AIsX+wdNaiaNUoPqZ+UVnR2nMDi6YTSezuUmNZWXoUmZ8Oh6YBEQPGslFebrMrT+CyLeYOuz26iLg/hvIKbSxsj0ioTyi0CtUF6ViVkA0rxW7Ty/Rk8CUxQwuvxVkqGeVymrS1wKS0YVQHd9FErgwUE9ds2d7BfLCoF66rnqMud9dSCICAGvwCfyfACIqZVh8wR5q69AOCJ/giOD+Hngef/68Fv+edPshdp8uap1cHnBVcAZt3MZU4chVx1Efgn5pxfRaWJiLF14gW7Ehtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7H1gWya38T4HOrXDrdZ1eOYiM0rKi8t4OiVVkaa4ZHc=;
 b=gB/Wvtxz/fgfxsl2+LZKuxqGizdfM8WoeVlh5FebxvQ1s5A5zDMB3cPGyEoYhv+PaklGP+20CwmX04h940AFzyfpCMrxhE4cDgyy8g6Cx9n9Yf+PuwfTJWU1dF/SVN//JVz4wsaNG5FRsOpet2CA1DQduAyEtPsZ+79CwDtQ03SwhB5Cz/g/Rb+rxdUsPHidgTZfrZbSxSmYkf4EI13jFMbuDEpF5CTad030mJluC+VdgWzrVAb0bcf6h6f9Eg17AB/2/JoXkmmtUFf4zhOYxRUFHcmMg1F/38Ve5GiSe3YIUA/V1aYWuqHReVbpir+ygmSeagHq5lFWM4dUB0xqzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7H1gWya38T4HOrXDrdZ1eOYiM0rKi8t4OiVVkaa4ZHc=;
 b=dfFqe6EVcydaVFOr0kMZ4Y4A5Y7SJMMIhv6GIWL/eN6AeGfzVFxIbfIXoY7Twxzo5sf9QS8TsEI6YV3HcgP5jjVYKhnYgklXBisgdg5DdaOvsl0+km2U5UMIULurBpMnxUoc1lJd2CDrtpedU8SeGO39K1+ZkT+cGpXkpFUTXyg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 SA6PR01MB9048.prod.exchangelabs.com (2603:10b6:806:42d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.16; Wed, 23 Oct 2024 09:08:29 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%5]) with mapi id 15.20.8093.018; Wed, 23 Oct 2024
 09:08:29 +0000
Message-ID: <66ef3f0b-431c-4d4e-a3a4-9519503feeac@amperemail.onmicrosoft.com>
Date: Wed, 23 Oct 2024 16:08:21 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking,v2][PATCH] mctp: upgrade 1.1 -> 2.0
To: raj.khem@gmail.com
CC: Chanh Nguyen <chanh@os.amperecomputing.com>,
 Jeremy Kerr <jk@codeconstruct.com.au>,
 openembedded-devel@lists.openembedded.org,
 Phong Vo <phong@os.amperecomputing.com>,
 Thang Nguyen <thang@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Khanh Pham <khpham@amperecomputing.com>,
 Thu Nguyen <tbnguyen@amperecomputing.com>
References: <20241017063626.2089926-1-chanh@os.amperecomputing.com>
 <CAMKF1srdcMcJ6CVEm3Cf42nEyFug+kDO0yGWQ53GGjG1TADGfw@mail.gmail.com>
 <64bbd9ab-d24b-4085-9e7b-abbfbc286264@amperemail.onmicrosoft.com>
 <CAMKF1sqr6WcQHBXietnNMmVqSFq2wenkMtfLSqyD5OCRxeirEQ@mail.gmail.com>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <CAMKF1sqr6WcQHBXietnNMmVqSFq2wenkMtfLSqyD5OCRxeirEQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BY3PR10CA0030.namprd10.prod.outlook.com
 (2603:10b6:a03:255::35) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|SA6PR01MB9048:EE_
X-MS-Office365-Filtering-Correlation-Id: bc47965c-a584-4a5e-d9d0-08dcf34242c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uMkXzHSQ1qfe9h5p8fCT8iwTh5E2NmZ6f/wH8rlLVsfK/UhmFNZjUANOEFdx?=
 =?us-ascii?Q?ToAopovANC7mUOkVXkRHRQlLjlOqegwxSO3RP1TJJXGy3YYdXv1LG8gbh1Ug?=
 =?us-ascii?Q?mSZng293Xa1L7yhcfEwKpmPxVfyyXI81nHDzsvRU8i4CrpyjQBuUYz/e4o11?=
 =?us-ascii?Q?RDkPDfMNHMjxqeLWXcxxXHlxINDY9cxg8zhPpNIbr9Pd1hC6a/wFiVkujGla?=
 =?us-ascii?Q?RgaDD95lZw1LSqsKZJlvRUnOcR8PbR/kR8uAh1YUAmQ2y+eI1Zdew6anhRyj?=
 =?us-ascii?Q?9Gcb5kUASo4QIrpNuDbLMcuP+G5Rm2muUV//b2ZjiGhrZWrqvyCNe+0LUlv8?=
 =?us-ascii?Q?Il3wj9ytO7iO0wa0KO/Jk3A1tzByu9ZEXT1xwxKjZuASFBNs4R4THXn04rzY?=
 =?us-ascii?Q?IzbpdSJGcCYNWLpUk3mOunfV+B5dv11+BFuQX2nKpK7HSqVUiNahalcDaT4L?=
 =?us-ascii?Q?wKVT6HYrhgg0jEhxSMUhTyhyWf/y2NpPTgNZwuXSbbOeJ7lWII/wcTm/N+ZN?=
 =?us-ascii?Q?Q+varUoUv+PH8tQ31WAmpNhf1F7snEcTCBjb3n35+SMMWRBLK9qxdOiCm/oL?=
 =?us-ascii?Q?i7zOcpN08m/NTx9IMRZwu56w7eXPsy1gkl0yS8GBoiMOylFq4c0npT4Ze3dl?=
 =?us-ascii?Q?Z8buL32iNICAmH3FLOF+0G1w8Hte5KtNFFG245PZCihPbm8rErGLz1NgdHxI?=
 =?us-ascii?Q?gbWxQ3aYi/ZaPcTFxVBf2TS7ErVplLISqnebxpkTAGvOE8cL7W1/zW4GhGw+?=
 =?us-ascii?Q?P+yu8rQURJQ6OTWUklx3J3YgQqyjJXV89JE+rnXPSGUkkxnzrWpGzrppcKrI?=
 =?us-ascii?Q?8EetreXCJEWbO4YQzCC6mOTx3IETv8SIkPf1ATSr0I1Bk5hi2ueFEbGCJnez?=
 =?us-ascii?Q?bzrtWQ08guVSP+QM8DQqXgPzcmXlIL4BLPo55Zk/tJQSt7RhreI9chNTwow9?=
 =?us-ascii?Q?HyVW7SLcfZUjFnr9qg02KnmJyCXeZR+mvvgL9s4PpdYum9q0nbx4oulR6CRJ?=
 =?us-ascii?Q?tN558duOHYeVDCT7rd9oxI2YKNSPZAnkZXEh8+Hfj1vIdl1U+oM6Uj2z7mNR?=
 =?us-ascii?Q?QJrtAWw0GzfndbHVKdWAKjkyI1fPQ3o70znURXfZ/JZO6fWYwTv2MMwAyZws?=
 =?us-ascii?Q?KEdON5nmFRYrjctPCY7xyomNHHCi3qjs+NDUiygWv797v9IS3iPD8aQMsUvw?=
 =?us-ascii?Q?gvTL1zu/ILM8J4DngdvAxVrAVDyfugXdieecwcTNOWZvGXhAUkc9TZZTRKcy?=
 =?us-ascii?Q?N1ooBMvLG3LqXlPJvX4novme6ewQM3TUz+IHe3TuXw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(4022899009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nyIIVvDg8BnxWkqGum32uGt2u+2BXWodjI0ibMyIH8XEqvGCOFqzwRyI2DmB?=
 =?us-ascii?Q?UBUp3wKQw5cpLt2WsMP+COk2DQ0/nWXUmRv6qTJaJrbwBP8qrlLXwIpSdx7c?=
 =?us-ascii?Q?QuPJfwlrvvnGn0FN9T+lFH/H6ISOaiT4OZidLjRT4c6r1cJmrfAq2LFpK/+B?=
 =?us-ascii?Q?2veEfP7Bq+OZK0T9X3H05w22GVIPf13kY/6by3nVAwzI10yvoQLQJOf/LjL5?=
 =?us-ascii?Q?G1s19Mrgn830yfy8T2qV85SqqZcY0QDdhc/EDm+hyVbzWa+P4U9zTVYHBujj?=
 =?us-ascii?Q?40fQBR4+8Hd/YgXd9GDTytmK6rJ9tVSIX8Yc9ld2oTMGZps4FZtZkL2Bzyfk?=
 =?us-ascii?Q?Ltg9h+OAgoFNhNBJTHUSYk1TLXjfULhXx2WpPd5rvi6EPHYufhhn/fPbms4z?=
 =?us-ascii?Q?WahA5bAhuK4CV9j2PCR3CXy/3xzvs2H+6169yWYOePK/v7HdFcLhRPHb6OcS?=
 =?us-ascii?Q?vYfpOyc/65Sd05KcY1ln/O349RCc0Gw3uCRbh/4pIGq0jPuxfo/lFK88DTMn?=
 =?us-ascii?Q?T7yJwvYnRl+jwPZ1lNy7DzO5oIu5Nszzt2+EB3yZ7WvVcXsAMi+cShspvAhB?=
 =?us-ascii?Q?8l4aFfVqzPENSwBBzD0FfT9EC0GPQrSPQSza+uNqiQuxIiqZ+0LGYnLGZ+VD?=
 =?us-ascii?Q?b9rJrzcl2U+v7DhrymNnOqv/n0YU6vcr77oC0cJx1/8rOG3e5AtSJIe7bMFn?=
 =?us-ascii?Q?+U396QllmktRh50jAA/Q+CpbmtwQz5lWYxMrzCAYHqV7PjW7pNcdIaRhkXQ1?=
 =?us-ascii?Q?/2qxWGdzl23XDvj4tlQS/ykHAmwYMDbBxLsuVGTnSH0W9r/f3Pc3bV+4fhWX?=
 =?us-ascii?Q?GaCsdGcExlNyka9vsv/nzC74lzas42f2q3Dxxy/OTvY8lSafXcjs5MrtNj5M?=
 =?us-ascii?Q?1ETJrqE8qrEu3bgcBZ1WDWLWpXgjfplluieUOJl/V7cSdE3d16AFTBIxM1Od?=
 =?us-ascii?Q?Q4K2bKbdJJUjwQJ8jsV8zmWweggcxdOVrb1MeOofVe7KbMwMLc42834FpqUy?=
 =?us-ascii?Q?ks731figHjUnfe2E1OG3NxMCxXsskld+qFQt/v2xT0Vb/YFUhhHUjyCI/3X9?=
 =?us-ascii?Q?xkLaxY4enVwSxzb3lMG/TW5OAJBpb4+LQABMgXCCAaZl6qGG/bNhMAPL6UT1?=
 =?us-ascii?Q?xqqOb6kzhX+hbVHmwXEueyop59S0Qi3x6hC7w7xWMXMSQeMSUsM9dCNe/ywE?=
 =?us-ascii?Q?GJYtaqzXLpJPI9r2EGoHtxBEbjVsdBrmwvSOPT7xSSexaaQf9w0kwnBnJlq6?=
 =?us-ascii?Q?ehJFvD8Ba/Gu3DkN6BO8mE64iI3HhB2Uifk09Yxs/rFR4/QlHKLqffWdpoD0?=
 =?us-ascii?Q?J31Scud+DHsh3HEmzbA//zjtvDAIbfi/67hA+94YDtM9vmv+hMzeU+pJVVCD?=
 =?us-ascii?Q?4WCl9Npn8WHvEqBZD0ZS+tZDxPW/0ATjm/dphX7KU/4rIMRG53W4P+8d2FUL?=
 =?us-ascii?Q?DwABpT6iJrW4Muw6lT+x7v6JkOFryJ9Nh0e8JM+UYCX/xiZeDOc7j2KLf0Y6?=
 =?us-ascii?Q?sxPzza/BR7c74aoswN4Zdae8+vuGI6MJrV9na0tk/Dkz4Ke4IJLWRRNmBpg/?=
 =?us-ascii?Q?3BRZkY7+hT4D93Y77JfAvyeY1kTVLKrcVYb1RAanuVujXv6ax0keFnnUUpHg?=
 =?us-ascii?Q?Lj0k1JeS3hc5authYakbb50=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc47965c-a584-4a5e-d9d0-08dcf34242c0
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 09:08:29.4259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ILeJx4ndWk3vIL/8vFaRhaWFFX3gMJXL+S/SDqiaIU42PPf3lxz7zqQmZouZuFS9fI6j3jekpHnwlw8kA8GmaaEmTbjtlbmOjalIdBMwRjECFGIxrJbadA3+3U1ExXj8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR01MB9048
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Oct 2024 09:08:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113142



On 21/10/2024 09:29, Khem Raj via lists.openembedded.org wrote:
> Chanh
>=20
> Can you send a patch on top of the latest master, I have applied the
> v2, so please send delta which fixed the musl build as a new patch.
>=20

I saw my patch v3 was merged to the master branch of meta-openembedded
https://github.com/openembedded/meta-openembedded/commit/b51e4288b93a97467b=
1d7dd77b4fab537bc311e3=20
. This is correct revision, no any wrong here.

> On Fri, Oct 18, 2024 at 12:19=E2=80=AFAM Chanh Nguyen
> <chanh@amperemail.onmicrosoft.com> wrote:
>>
>> Hi Khem Raj,
>>
>> Follow the error log, I tried to use the musl cross compiler
>> (https://musl.cc/) to compiler https://github.com/CodeConstruct/mctp and
>> report error to mctp maintainer. Jeremy fixed this error by commit
>> https://github.com/CodeConstruct/mctp/commit/0629ec8976b1d56c17db51805f6=
47bf35f4bfd3b
>>
>>
>> Now I'll push the patch v3 with latest commit from mctp repo.
>>
>> Khem Raj, How can I run CI on meta-openembedded manually? I would like
>> to verify errors from CI failed before push patch. That will help us
>> work on the patch quickly.
>>
>> Thanks,
>> Chanh
>>
>>
>> On 18/10/2024 03:46, Khem Raj via lists.openembedded.org wrote:
>>> ok, now it fails for musl target see
>>>
>>> https://errors.yoctoproject.org/Errors/Details/809802/
>>>
>>> maybe you need to include linux/socket.h to get AF_MCTP address family
>>> definition
>>>
>>> On Wed, Oct 16, 2024 at 11:36=E2=80=AFPM Chanh Nguyen
>>> <chanh@os.amperecomputing.com> wrote:
>>>>
>>>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>>>> ---
>>>> Change in v2:
>>>>     - Fix CI failed                              [Chanh]
>>>> ---
>>>>    .../recipes-support/mctp/{mctp_1.1.bb =3D> mctp_2.0.bb}       | 6 +=
++++-
>>>>    1 file changed, 5 insertions(+), 1 deletion(-)
>>>>    rename meta-networking/recipes-support/mctp/{mctp_1.1.bb =3D> mctp_=
2.0.bb} (93%)
>>>>
>>>> diff --git a/meta-networking/recipes-support/mctp/mctp_1.1.bb b/meta-n=
etworking/recipes-support/mctp/mctp_2.0.bb
>>>> similarity index 93%
>>>> rename from meta-networking/recipes-support/mctp/mctp_1.1.bb
>>>> rename to meta-networking/recipes-support/mctp/mctp_2.0.bb
>>>> index bf3961be4..62044e007 100644
>>>> --- a/meta-networking/recipes-support/mctp/mctp_1.1.bb
>>>> +++ b/meta-networking/recipes-support/mctp/mctp_2.0.bb
>>>> @@ -5,7 +5,7 @@ LICENSE =3D "GPL-2.0-only"
>>>>
>>>>    LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cc91856b08b094b4f406a29=
dc61db21"
>>>>
>>>> -SRCREV =3D "a591ad885aa28f113cb45870b2fd5bce48378d6f"
>>>> +SRCREV =3D "9986862f88fd6e6ca75e2a29236cf332d640e600"
>>>>
>>>>    SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dmain;prot=
ocol=3Dhttps"
>>>>
>>>> @@ -13,6 +13,10 @@ S =3D "${WORKDIR}/git"
>>>>
>>>>    inherit meson pkgconfig systemd
>>>>
>>>> +EXTRA_OEMESON =3D " \
>>>> +    -Dtests=3Dfalse \
>>>> +"
>>>> +
>>>>    PACKAGECONFIG ??=3D " \
>>>>        ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
>>>>    "
>>>> --
>>>> 2.43.0
>>>>
>>>>
>>>>
>>>>
>>>>
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#113070): https://lists.openembedded.org/g/openembedd=
ed-devel/message/113070
>> Mute This Topic: https://lists.openembedded.org/mt/109059332/9027231
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
chanh@os.amperecomputing.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


