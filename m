Return-Path: <chanh@os.amperecomputing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62541D2E029
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 08:54:49 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.80])
 by mx.groups.io with SMTP id smtpd.web10.4414.1729673664860959710
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Oct 2024 01:54:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector1-amperemail-onmicrosoft-com._domainkey.amperemail.onmicrosoft.com on 100.100.100.100:53: no such host" header.i=@amperemail.onmicrosoft.com header.s=selector1-amperemail-onmicrosoft-com header.b=ISSNHfH2;
 spf=pass (domain: os.amperecomputing.com, ip: 52.101.62.80, mailfrom: chanh@os.amperecomputing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n1gol3b65tI79starlVM4InClPhZBvsTZ+HLtWAjiKgTNxuqvOlxDNQ7CBCx+/oQagSqmcDVceLrBXE+8CewuMz3e9eSAPG0RApd6pBFyvUH8mr76WtnZUK7moDGaMinCAh2wWoLumG+cKZ8CLR01Y4uNrScjRFlORxFMoV7w1GxBBp1qWX0K/LtTusbVjweJ8V6aThRTonp2mTOTAXB6ip8I6uqpf5aME18rTn+TYAs0aW9cYysYzhsoyH1Gj3X8Vb7eO+V2KgF0lNljN57PWfNxzHXQw/k/J+BN5ABg0idum5KkrGECxKwgGMgBR9Abx8p3UTOOodSBJ6EIEy72g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNaluNtBKsxNqyWM3PmtM/3zt0462bK1CfQMv9lmx3k=;
 b=wwBW/urHXLNkrRllLxEA742Ll8fbaaNUPGIcJbOT/NaXA7++Csf149kUdczcGHmrF46QQrAQcoZa6NIe+AeBnIfg3Bx7hDxpWpkwBEoxZd7ARmjruchuSYEyj+kXwxrFfeg4JUaaQXaco+88dw2YMAr18lxeJr7wIxjX66egLFb0Wz2F0gHBc+6TK+AKh3EkRju4BgWBKOo0/VTswjFxZDHpLNtrEhF5K5YJiiwh36aiJ1gmfzTc9Qm7nZ1SCyuH12PTshiAIb+xtVhUFWXLeM/qBBYSFBARN6MD+rz8Y3ztxyiYJoSO3SGQs0OuVrEfDv+LiJVSRGgYcI7729lO1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNaluNtBKsxNqyWM3PmtM/3zt0462bK1CfQMv9lmx3k=;
 b=ISSNHfH2b03JIf1gAMB3vfYGu+38Q6k7Gkayrv2bCFFmG41nsnC1LY8Zd5/IerNQZvn0Gl15BkuiKjmoYEe2gkENPRg0SmKUF750K7AF3Ub5LwYbRiTiJ9PpDfOc5bto5VEpny5qxPZCmvpdESUCDAutdhsn9BpRB3e/i4uTpqY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 DS1PR01MB8918.prod.exchangelabs.com (2603:10b6:8:222::13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.17; Wed, 23 Oct 2024 08:54:22 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%5]) with mapi id 15.20.8093.018; Wed, 23 Oct 2024
 08:54:22 +0000
Message-ID: <1026a7a9-829a-4ce8-9da9-e91b8299c394@amperemail.onmicrosoft.com>
Date: Wed, 23 Oct 2024 15:54:14 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking,v2][PATCH] mctp: upgrade 1.1 -> 2.0
To: Khem Raj <raj.khem@gmail.com>
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
 <7eebebc1-6c64-49e2-976d-247c8c0fd22c@amperemail.onmicrosoft.com>
 <CAMKF1sp0ujF6n6TT_o5vcH=n-ZmcawockNNcxOArbiRkLZNjbw@mail.gmail.com>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <CAMKF1sp0ujF6n6TT_o5vcH=n-ZmcawockNNcxOArbiRkLZNjbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BY5PR20CA0034.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::47) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|DS1PR01MB8918:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b25e89a-2c34-4897-19ad-08dcf3404993
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|4022899009|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nzxn/Z/xzZ3unUYUJKQIFU4bmbNP35QuTw5dNmBYKueStd8GeSDkAjMpXMMT?=
 =?us-ascii?Q?hUtrQX3pGcPQ90wNdGzMO/otyl9iHokfwHLdHoALcOyN6V+rsbeGJPBAtbBH?=
 =?us-ascii?Q?Wn4ROoPLin22mEgJYVJ8u7jarwTobL55sYc1UGtpI6vX1jYpstZBvRwNNDGF?=
 =?us-ascii?Q?VG9hAqX40PMsPj0K2Y6LhZldeJDWhWqweHf9/juz9g2wRQTwOy8yaURNN9O4?=
 =?us-ascii?Q?eI3L0On3XJQQqgmmBIhpVBNRVEVcLMWyntXnN4Yvdw5iXF1VdRnZIeJSZopP?=
 =?us-ascii?Q?5sdItxxlsXh1jvl2MtAFybXSgSf7Z7psaLAhCxzru6CKxqvalpoW/Gtd+GoU?=
 =?us-ascii?Q?USe4lvKWhLRSjlkXp9SRJqgVjupunMLGcvOCTLOlPD28KWc2LnndjOLYPwvH?=
 =?us-ascii?Q?XT4aEMs6LGlz3j1q60EEjseS7o6Hwf50OPD0TV4mgNW9dNDUa23AGHUckEJY?=
 =?us-ascii?Q?dlumOr64sYslCMqy+2rXywCZwLH8zkuTiCbL/9yeONrQSNfha5uncIFZ7JKV?=
 =?us-ascii?Q?kADiHZzyQlyDoIcvGzWvdbpOkxY9+2mxxOrAsS+zRtWKdjm11WN1sf/YnG6o?=
 =?us-ascii?Q?R4eoD6q9gn9B2qXt9ayiPbDbNWdyd8Ab7/NjwFq3VcQEsYIHC0apuSxxEDUG?=
 =?us-ascii?Q?Dna8r/kyVQwKE76hl7wgsJdVv36EiVJc+gEJ3bLiecrMLpKIikDJi0nPOZgK?=
 =?us-ascii?Q?F82ZjXGAehretcKABXAAicPA7S3cVrzuygcAmmVWBQMMf/iNxsHNxQuSs++c?=
 =?us-ascii?Q?zDFmRdCGdNO78y6QCmEpeGBk0Tsyv7j5FM2P0BaiQMZOfr5kShGx0Q6poCsz?=
 =?us-ascii?Q?1Xw20oavsAO54HEfPCgdB21zrtgWLRvvYFG3aSz7yWlTcscRPA/pxP8emDpX?=
 =?us-ascii?Q?f0w90IR/7b+2G1AZsYyRuU6hnXcNwZ3qhhTUtkR9lZOD8TbUXQIl+g6Usypc?=
 =?us-ascii?Q?9ZNr9gtZJKG/UWuqxE+52BUTAbLaWWsE/ek79T0eDzGOJgW+K5f7wXvLZSxJ?=
 =?us-ascii?Q?WHTk1dSoMtl0Cmr1rA24bXT7vQfBb41/QKPZej64JmXtjxaLkiHoRz8s0JwA?=
 =?us-ascii?Q?HHpDPZrZfLAuo4FUdI+/bzD9aTFS34ExFBtlrFIUd4raYScQXcdYd8YU9R1D?=
 =?us-ascii?Q?Et9Nkvkz/FwIi20gqle+u0yDv3d47ekKg3B8nS+qu+E4nIkaO8eVK69C9ISR?=
 =?us-ascii?Q?LQkInrKp5ddNyiMphJaiLLrdQa7jjcfXsVyBxtwqSOuOD/5gdoEw4MPbiAMV?=
 =?us-ascii?Q?LwOI1+6/4MHzOJcY+7ed8iYm+3koDZ4zmN6B+8b4uw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bONN4iHuRscOmicDqslV3LBIycDs9CM4kTNtsXE5M/Nn6cDFD2BNg4dFXDvr?=
 =?us-ascii?Q?t29HcalhoAZKTzc07yzTptysdYooOvRHghhp1IxAirp0R0yhn6p14qEh9C1t?=
 =?us-ascii?Q?tbDKM+zPwY528rNnoMe3wQBaUmnX7zaPfGGkpUumSXrF9W/E1Uv7p/u7YW4K?=
 =?us-ascii?Q?4TV3euBIFZ7HVpyfyMi/7+6Ns3QQToJT62gJ0nI09PkoRg5xDfecG8QRaQtu?=
 =?us-ascii?Q?cmevB/9V0pHtbeLlVwKHLGUoTHsZ6BubhOBvfeTfae4ICPqrrw04liKKYGx9?=
 =?us-ascii?Q?6imqeCsZMF6o408F1IO0/8NvIk6yLu77cAYl2LqnZCLmnrXraHRrftW/8VxM?=
 =?us-ascii?Q?eZ/yoboe+SB8P8jR45Qc7r4zvipqjpSKmJH/CwozybazJXX7tE+7+YPSTsKN?=
 =?us-ascii?Q?w8B+0cutVNf/G1H0yrrizB71Y8mHVtttP8O023mArcZr9UpbdOvSz6/afVjR?=
 =?us-ascii?Q?UgYtIvuB04rDXJv/yhaOVEt0LT9gbmTRNToYLxb/ZHukyjbfgbmrhPUZpVOj?=
 =?us-ascii?Q?kKUrvbyU2tVj61yfk5N8ge36qnEaJNrBgkv8PWG8i1fU0069KnZMG80NV9KJ?=
 =?us-ascii?Q?tKwKmPguMYUfBrF4LGtNwNQ8ciNPXXbgpVPEAax98/bHqOKZDTzXhbGtu2DQ?=
 =?us-ascii?Q?iXkS/1rSRkYPjN3m8cBH3Vqb0lySVILuoDBdBPrkWrPsSwIjPs9sDb1Nz21J?=
 =?us-ascii?Q?kSGTQQ6NUAQ0qrbM5ii3N0t5pdTnhqp1g/2r8JBoFIFVt8EKxE/jq+JGV6bn?=
 =?us-ascii?Q?9Nj3YvnrRRCah5MDzdmJ1GtOtP0NjPQovTJlrRJhBcT6TpHZajqwicTG7ToM?=
 =?us-ascii?Q?iq7zyDq4GBeFJJDuTNqAqg3Vtx25faw7L8sCP8fH5FNZFAUhxjK7aN1WZ3+I?=
 =?us-ascii?Q?PHc2U31qcYi8d6soOREv9ioxYLEyOEpKf3dsT3HJyoGvrQfFXPYZtUpwUoRZ?=
 =?us-ascii?Q?uj7B+NyfsfoQKBWq/cS16cnYfIXaPvs2vOxnh1lbSYHTavN0qRdYfFt8V9uS?=
 =?us-ascii?Q?8LwI9nXRlcJSf2sfuTt/HOQ41eWr53WHz/hNRcRcuKYKWrYHzaNYkNtfPcKz?=
 =?us-ascii?Q?ZcoyitnhvRp+fGEACi4vCFaU5jWCjCuS4eAnmbOE5qCQfAQQiN2mQE5Ia2+p?=
 =?us-ascii?Q?yLyVR5Ps/B3xtqWPuWciAZk+YaWz9lDApVOgPmn90YLPJFgLC6sfDn3Ki2r+?=
 =?us-ascii?Q?nDjlA57wu8QWdGr2pdNPJoD3X5n6CdJ6chR2bKY/vNH8yCKWJvATUkWIiODj?=
 =?us-ascii?Q?N7HR3XtBNnee5KI4v/ZkE/y4qF8y81vPiw131mle1qWf9Wo1tBbg2bnUgcz9?=
 =?us-ascii?Q?KjA2hc4/gzsxn0DOmfrluU3k+yaoIiIGSeGvyR50vNvuSwfxuMegDEN+U1E8?=
 =?us-ascii?Q?blGhUT8a1VI100bhtbbob2wA7RnPfms4SFWzNo7mJUBHkNlc8KufCoeCRP8F?=
 =?us-ascii?Q?jpu1jFgoUfEfoc90RANFdciBYQsGX2Y37qIVckoxn5cuzYngSqvqellBAr2O?=
 =?us-ascii?Q?r2ToUfAriRe0LoS275mbluK5ENfYorUdf+URKCM+QeZwF8S7+2ZZa23f9N+D?=
 =?us-ascii?Q?itsdYPZXeu/CiSh6jZRK5uroMPtPaf0nKgwMC2YG0Pc0Qmbu6pRmOZv0VW7Z?=
 =?us-ascii?Q?eMj+hnG/0pBAktwbY/0CHaM=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b25e89a-2c34-4897-19ad-08dcf3404993
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 08:54:21.9362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sut28w41bs5/whzTXF6PciXhHxkq2y3EmAzWgNJVFk0wOW53yscqm3yXwvh1HGyik45TLYBBmxUmkKIVmXy82+Vb76Elw89gdUn8JcD4PcNCinCh0kcET8FIwNte5hDu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR01MB8918
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Oct 2024 08:54:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113141



On 21/10/2024 10:17, Khem Raj wrote:
> On Sun, Oct 20, 2024 at 8:02=E2=80=AFPM Chanh Nguyen
> <chanh@amperemail.onmicrosoft.com> wrote:
>>
>>
>>
>> On 21/10/2024 09:29, Khem Raj via lists.openembedded.org wrote:
>>> Chanh
>>>
>>> Can you send a patch on top of the latest master, I have applied the
>>> v2, so please send delta which fixed the musl build as a new patch.
>>>
>>
>> Hi Khem Raj,
>>
>> I saw my patch was merged to the master branch of meta-openembedded
>> https://github.com/openembedded/meta-openembedded/commit/b51e4288b93a974=
67b1d7dd77b4fab537bc311e3
>>
>>
>> I haven't understood your comment. What should I do now?
>>
>=20
> We still need to get the fix for musl build. So instead of doing the
> musl fix included in original patch
> do it as a new patch on top of what got merged.

You mean we need a patch for the musl compiler?

I tried to build mctp repo by musl compiler and got error as=20
https://errors.yoctoproject.org/Errors/Details/809802/ log mentioned.
It showed the mctp-ops.c code missed linux/socket.h. So, Jeremy added=20
this header to the mctp-ops.c. You can see more at=20
https://github.com/CodeConstruct/mctp/commit/0629ec8976b1d56c17db51805f647b=
f35f4bfd3b=20


I don't know how to fix the musl compiler to pass this error without=20
fixing in mctp repo.

Thanks,
Chanh
>=20
>> Thanks,
>> Chanh
>>
>>> On Fri, Oct 18, 2024 at 12:19=E2=80=AFAM Chanh Nguyen
>>> <chanh@amperemail.onmicrosoft.com> wrote:
>>>>
>>>> Hi Khem Raj,
>>>>
>>>> Follow the error log, I tried to use the musl cross compiler
>>>> (https://musl.cc/) to compiler https://github.com/CodeConstruct/mctp a=
nd
>>>> report error to mctp maintainer. Jeremy fixed this error by commit
>>>> https://github.com/CodeConstruct/mctp/commit/0629ec8976b1d56c17db51805=
f647bf35f4bfd3b
>>>>
>>>>
>>>> Now I'll push the patch v3 with latest commit from mctp repo.
>>>>
>>>> Khem Raj, How can I run CI on meta-openembedded manually? I would like
>>>> to verify errors from CI failed before push patch. That will help us
>>>> work on the patch quickly.
>>>>
>>>> Thanks,
>>>> Chanh
>>>>
>>>>
>>>> On 18/10/2024 03:46, Khem Raj via lists.openembedded.org wrote:
>>>>> ok, now it fails for musl target see
>>>>>
>>>>> https://errors.yoctoproject.org/Errors/Details/809802/
>>>>>
>>>>> maybe you need to include linux/socket.h to get AF_MCTP address famil=
y
>>>>> definition
>>>>>
>>>>> On Wed, Oct 16, 2024 at 11:36=E2=80=AFPM Chanh Nguyen
>>>>> <chanh@os.amperecomputing.com> wrote:
>>>>>>
>>>>>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>>>>>> ---
>>>>>> Change in v2:
>>>>>>      - Fix CI failed                              [Chanh]
>>>>>> ---
>>>>>>     .../recipes-support/mctp/{mctp_1.1.bb =3D> mctp_2.0.bb}       | =
6 +++++-
>>>>>>     1 file changed, 5 insertions(+), 1 deletion(-)
>>>>>>     rename meta-networking/recipes-support/mctp/{mctp_1.1.bb =3D> mc=
tp_2.0.bb} (93%)
>>>>>>
>>>>>> diff --git a/meta-networking/recipes-support/mctp/mctp_1.1.bb b/meta=
-networking/recipes-support/mctp/mctp_2.0.bb
>>>>>> similarity index 93%
>>>>>> rename from meta-networking/recipes-support/mctp/mctp_1.1.bb
>>>>>> rename to meta-networking/recipes-support/mctp/mctp_2.0.bb
>>>>>> index bf3961be4..62044e007 100644
>>>>>> --- a/meta-networking/recipes-support/mctp/mctp_1.1.bb
>>>>>> +++ b/meta-networking/recipes-support/mctp/mctp_2.0.bb
>>>>>> @@ -5,7 +5,7 @@ LICENSE =3D "GPL-2.0-only"
>>>>>>
>>>>>>     LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cc91856b08b094b4f406=
a29dc61db21"
>>>>>>
>>>>>> -SRCREV =3D "a591ad885aa28f113cb45870b2fd5bce48378d6f"
>>>>>> +SRCREV =3D "9986862f88fd6e6ca75e2a29236cf332d640e600"
>>>>>>
>>>>>>     SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dmain;p=
rotocol=3Dhttps"
>>>>>>
>>>>>> @@ -13,6 +13,10 @@ S =3D "${WORKDIR}/git"
>>>>>>
>>>>>>     inherit meson pkgconfig systemd
>>>>>>
>>>>>> +EXTRA_OEMESON =3D " \
>>>>>> +    -Dtests=3Dfalse \
>>>>>> +"
>>>>>> +
>>>>>>     PACKAGECONFIG ??=3D " \
>>>>>>         ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
>>>>>>     "
>>>>>> --
>>>>>> 2.43.0
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>
>>>>
>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#113070): https://lists.openembedded.org/g/openembe=
dded-devel/message/113070
>>>> Mute This Topic: https://lists.openembedded.org/mt/109059332/9027231
>>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [chanh@os.amperecomputing.com]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>
>>


