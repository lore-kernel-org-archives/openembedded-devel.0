Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C002CF07CE
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 08:50:28 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.111])
 by mx.groups.io with SMTP id smtpd.web11.38952.1728550218142091752
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Oct 2024 01:50:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=eYfIafFI;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.247.111, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p6HIXe58mYomDWcr5hOsZTpmOIHGsUt59kWLiAFuct4XskXBkZA5NtCbEV0o20heIW6NiG3wB0E321rcd/AMuQ0uO99AOJrCYf+nCcIwDE/fYA8UekycPY6/JJLC1Revwx9EZooGkkj4b18OgBGmd3kE7h8YCZxR5GdRBvtNOeHjUNQiiGYil4d0Cp/QIICuxepe7rbWnvgADTuxoQN32tgbFBwheTNXUA/83Zj+T7sxCO2Iwf9vxcdpWqJr1nHYgHaNcJ8Y3ErC3W/y8YZNMJQNt4suMwa51JuiZGXckXE4NslhpLIg+kLMkKlOlakSId8UyYOlXRv/E+QVglypnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7aS6WKKBjiz0l0cJZiMafpbQ0HJYO/GhjrlYiiAM/+Q=;
 b=zCqcD5fMYtHitlIfcbz1le/BnS48MrBSpjre4c+s6lasIthtBi8lB89GOFqcfTLf7S0YdfdEFPNT+Nne88siz7qTjHR2hEXzfxE2BFzMA1vI2RABUBaLiFLkFr1XKSOAsJrPkc+UYEZ0yO/+A96Celx57GXK5+iYnMjH3JerlklJWm305hIl4s728VUkqMUMqirB1e5aMeGFMNcAg/2pDNhOMpqNyzCRFEcQpPyngRMgLmVeEcxClZ5/cyl+Y4+xrn+D6StkCm3UBb88MBN1b4ZEpcoVqHosX6IYTx7SUT4EXk1NUkGrzld6KipU3RGxJscbc7CnWwWXgdn4skFkvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7aS6WKKBjiz0l0cJZiMafpbQ0HJYO/GhjrlYiiAM/+Q=;
 b=eYfIafFIIdDmU1+ZZancan9xercmcRY5ug1JDvapUvpvurYaKVprz7EmHJPA1q4qrXGr+EJng2YAyjrOj4IE44Lv+aBS7A/sq603p0fvmW/VOIE9qvsXQQi/kuVl+5TeWFmraKEGibZ6MP4h052fa2sY1M4914z00jQLx8RN/OgDSsBF/4Pz8C369fAqc9rXYgaigGFL2AZqGvmchaK2Kk47eanfCfIETOUltWwBlgXJXSxL+JskkE94hKmp/UKbiJL5/zt33AG/YDzAJFbq31P77Qq0w6cPB/CRBphrKj6a2EylQ2iFJWOFFnGxdiTUIITfkQd1a62mM2lrYgn/iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AM9PR06MB7299.eurprd06.prod.outlook.com (2603:10a6:20b:2cf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Thu, 10 Oct
 2024 08:50:12 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8048.013; Thu, 10 Oct 2024
 08:50:12 +0000
Message-ID: <2dba0345-016c-413c-9fa9-2c5601cb628f@vaisala.com>
Date: Thu, 10 Oct 2024 11:50:10 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCHv2] fluentbit: Upgrade recipe to 3.1.9
To: Khem Raj <raj.khem@gmail.com>
CC: openembedded-devel@lists.openembedded.org
References: <20241008111737.1893290-1-niko.mauno@vaisala.com>
 <CAMKF1sr1Gm_mVRnOhKDMdpNu0stKnGd7+9qNVR-FTMZGAu4twQ@mail.gmail.com>
 <17FD0A4A66FC9646.19251@lists.openembedded.org>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <17FD0A4A66FC9646.19251@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV3PEPF00002BA6.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:6:0:18) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AM9PR06MB7299:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b937aa1-5aec-4b81-5c86-08dce9088daf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+f22eMJt9UsHg56DCH6i7sXAwQKAH4CWToDR4LMuhXJmBnAdT23UCBqf2DhN?=
 =?us-ascii?Q?c2yKMxbOWncq34F3PBYsE2MJ5f3wEKpLr/KNE8WcRC3SlRNosr/vIrAf8n6h?=
 =?us-ascii?Q?HqcMPE0qFUj8+/GrXxpkChDSmCIna0OucuipQ1caX7TG9VgbuxapOxp/U4KU?=
 =?us-ascii?Q?m83TSXl512vNMtJIwBe7QTVVOvrm/ZPvE2hEVJYt5zYzJlEQXJfp3GeRKrqw?=
 =?us-ascii?Q?g+dgv/g66I+X43a5DcJzctJoXuARdnWl+Q3ZyzfUjNZiPmbsTaWoppdJGlZv?=
 =?us-ascii?Q?wVAUPhxqnkdVTo8HfuxjAGjKHDpek1FOp7ForO1EVEnb71YJU24MOhb1fGdM?=
 =?us-ascii?Q?/ZUma1eD9YGWo3w4lUT3CzvAlB+NqoNmilG/t5oElV6SPjM6l9HdPB/JqnVz?=
 =?us-ascii?Q?vY3irH4yRwwFBhdT/Fx3cZxFGPfj4i5KO2CSGMarIuu60PSqnDy74tAYXw0/?=
 =?us-ascii?Q?WFrY/BpCjzOuvhb/ddt72C51HRKACjqiUqTuB2BQTV9iiUVPUcUMD3RJu90l?=
 =?us-ascii?Q?VhBCcmXJPq3GrBo4rnUrbuXEvgrVmizuGfK0CGV1wlVyjfbY0zYG9TRDijxx?=
 =?us-ascii?Q?09K1/idk/Pigub8VbjCBL1mQ2XF6rd23PWdL1hn2R7GCohGEUtdxXyFL6beN?=
 =?us-ascii?Q?ut/UIJP7RBRZNA10YMxgSj7R9nToiEFE7kWDTyxyNrjc0+sw0l203JaPKXkN?=
 =?us-ascii?Q?9pqIeZdXLLy9nLkQQBdLBJggql6sDJdSxvQyOxKUg8M+Xxy0UUlctNjTe1PC?=
 =?us-ascii?Q?V6osHPy3iVxAdeS9qv1xueq2xHCQchfrAOOLxUjBwPDwN4iWv+lG2B3GFVPq?=
 =?us-ascii?Q?bkoVk3t+nXO0Qg9cgIaBGx5OY0/hpg3cxIZEJ5TODqx/UuU9cZRkOnjgzz+S?=
 =?us-ascii?Q?L4nU6Ro9ByhFAE9fJYwPC8wVAsXQ6u2kFJz0KvPbmuEtT4NxJaazeUgCIwoL?=
 =?us-ascii?Q?9UzqRKELlcreeFQK0B7r/WWrC1+8F4v1RIBqTlpvsy6oJqmW8MPelOigqNeq?=
 =?us-ascii?Q?ztKFCDAHGc6MowuetrISexIfu6qR5FkmNiwrjl3+zY9FJGpwhl7Iua6O/hkx?=
 =?us-ascii?Q?RAvnCubreZTTRqqMFmerYPQrMZdRQ3/k7v0Zmw0P0QHKsYCrMTGeIDr7RZNg?=
 =?us-ascii?Q?JbayRssYcPh/eBk+Dnj2OqotnMoC8XhEvzSHbNh+K4m36rQBM3ClAMeaNB2C?=
 =?us-ascii?Q?6Oasv64fiEIwUQ0CPchrnxKeE2kNtBxi0QrQ97RrxqiHCo8GIA9YXXjHNKc?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4022899009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9nZ2nK4f4MmNVOckuTV3w3nD4m489ZNGiVqoVESTodlajlQ47mWX+WF0XgUw?=
 =?us-ascii?Q?0SxenLgWzCWUEAgpkZibAYUTgKSR2Vrg7AI7lRVu2+sIetGWJ/9pyJ2qddo6?=
 =?us-ascii?Q?93ghmCLKJ9KnS3B8rgqvPQPiLcQsJen9AmZX//LfSNhcncXBbVsW4hjV86zc?=
 =?us-ascii?Q?UBic13mEDz/VorKL4M1wxOPgHZ3xWvyOkOzY7IMnD2qiAgWHhBdI8JecWXgE?=
 =?us-ascii?Q?U021znAWqTbs696tByc1t4kc2SFFEqsqOTWhOLH36cOd7azV0jpyF9mnCmm8?=
 =?us-ascii?Q?kqraQ73oseY+KmSWi+UwgBj6OIbUbiBP6fNgdE/zvvR51p4CGWDGMaKTaNvL?=
 =?us-ascii?Q?68H8qF1eARm7eOwhdDh9H8UVhhDd8HfEizNhL1wuCUZnzBotfUoxaJrexbkb?=
 =?us-ascii?Q?RR3qT6CtjeHHoXNsPURyUawWY+p7BAwAimmXT6nd4iIzlOsz/8kQsXesTiAL?=
 =?us-ascii?Q?ANyDJDoYq4/peGKzM5V8lLn1aLlH1oC/AqCFFqGd4rsZqXsVeMFCt1m6B7ko?=
 =?us-ascii?Q?Df2sslVMVGaKb2R9tHPBhUITq4bABs+k6kk/QIbwal0b7wks+D1Ul/WtlFaw?=
 =?us-ascii?Q?O38rUjuNGPjs+TtH3VO5eFKGmqaNqGRBiDKjm3RhustD/OZrz2K1HnsnjIi1?=
 =?us-ascii?Q?R2IK3GFQGqvL5cDLvLmKYuzBEIDhkX8eT+/hZMSZfUVFAGPB5fNTlgLQmf1x?=
 =?us-ascii?Q?AAncf1gudnJCj/DNKr6m0N+mg4/yDAZaVyVtkyGGMXBJdXknTM1PK/Z+mnJP?=
 =?us-ascii?Q?CDZWfQORGzbhhC9HPwc1VHfXFdzmg5aSBnGg6RrkmPmCjj3ixaFZ1sdM8SKF?=
 =?us-ascii?Q?yzbmIekrWuMRP4+jYPUIeSGnDYrKDZGkGz/yMGx+qnEW/ddyAE3aX4akUsV1?=
 =?us-ascii?Q?BIWApKv49x3Y+hZQ9RNJ11+HNQx7wgamCd6zF5zro0q4ib2OlThIMZl0T9Ff?=
 =?us-ascii?Q?2lAT9O+SZuyg0keJI5EUw09VT5/3TXdUaoVhwix5W/r4irSNnGDDZHTxNyOO?=
 =?us-ascii?Q?YyE/ka3TrbD8r/ryL+pqz2VEG3bXLfIUCZLD87YQJh/71sWLmPB/UJhQwkEm?=
 =?us-ascii?Q?V4bCi2DdvWIiYNLnqm/BMhAvlV9dSbsLpfF3w9/bUCJ+aJptVIlzlNRtVMWL?=
 =?us-ascii?Q?PQeopca1eGjG0xmKzwXdsOxEO+ZOF/GTZNksP1v7s68HpHN/TJLurp27H7K2?=
 =?us-ascii?Q?RATiDkyaDzi2CVXwSeAqqPFzO18O2ohOlsXH/gzHdqO9y/IarvBj+BxT2Rjn?=
 =?us-ascii?Q?iUYuQ3avBpBi7BCbfHYHlud+JJ7dVPwD2ESeUSkAWSDNU5F4zD6o0QcDPcX9?=
 =?us-ascii?Q?NcXusnggC3tu7YlTqtE+LfLkrgikinzoMrawklU/pHPkCfCBLd7K82TB3ecs?=
 =?us-ascii?Q?UIIYWeWiPUGVDSjajrUR4Ypk7MMK7qHxdDqEC0uz8+Jb47M5o+ag2gYkVzRj?=
 =?us-ascii?Q?QzXOqIel+bAYtB0rF9YOXD1zBNx7olnJh7RehLZCMBXeB95UKL+9Bj4dFGSZ?=
 =?us-ascii?Q?e0bZhkl8dwOHLFVCx9Mc6BD0kPyx2ydj5lWlkunX4NqOAvYA82eNM3vYkKSH?=
 =?us-ascii?Q?8SEfAuBfPJK7V1HwYIWpiG9C+FGM037ToY3LugO+aGrLImxqSoy/fGwQhuLy?=
 =?us-ascii?Q?ew=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b937aa1-5aec-4b81-5c86-08dce9088daf
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 08:50:12.7647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J6W74QRi4xXdmi+pRkf1eyzgETrtY3bp5fSgq4cqgkxrZQLV3AenXDA4OQGhwESsigCT15NB9J4tgzm8GLKMGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB7299
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 08:50:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112773

Submitted v4 still which amends the commit message in one of the patches=20
that was added in v3.
-Niko

On 10.10.2024 11.32, Niko Mauno via lists.openembedded.org wrote:
> Thanks, submitted v3 which should fix this and a couple other issues=20
> detected when building against musl and non-systemd based configuration
> -Niko
>=20
> On 9.10.2024 18.36, Khem Raj wrote:
>> It fails on musl still, it needs to add dep on the fts package and
>> make sure it links to it as well.
>>
>> https://errors.yoctoproject.org/Errors/Details/807548/
>>
>> On Tue, Oct 8, 2024 at 4:17=E2=80=AFAM Niko Mauno <niko.mauno@vaisala.co=
m> wrote:
>>>
>>> According to https://fluentbit.io/announcements/older-versions/
>>>
>>> =C2=A0=C2=A0 Security Policy: support for current series ends three mon=
ths=20
>>> after a new series is released.
>>>
>>> Fluent Bit v1.9 Series has beel EOL since Dec 5, 2022, so upgrade the
>>> recipe to currently supported / newest available version.
>>>
>>> Relevant changelogs since previous 1.9.9 version of the component
>>> =C2=A0 - https://fluentbit.io/announcements/v2.0.0/
>>> =C2=A0 - https://fluentbit.io/announcements/v2.1.0/
>>> =C2=A0 - https://fluentbit.io/announcements/v2.2.0/
>>> =C2=A0 - https://fluentbit.io/announcements/v3.0.0/
>>> =C2=A0 - https://fluentbit.io/announcements/v3.1.0/
>>> =C2=A0 - https://fluentbit.io/announcements/v3.1.1/
>>> =C2=A0 - https://fluentbit.io/announcements/v3.1.2/
>>> =C2=A0 - https://fluentbit.io/announcements/v3.1.3/
>>> =C2=A0 - https://fluentbit.io/announcements/v3.1.4/
>>> =C2=A0 - https://fluentbit.io/announcements/v3.1.5/
>>> =C2=A0 - https://fluentbit.io/announcements/v3.1.6/
>>> =C2=A0 - https://fluentbit.io/announcements/v3.1.7/
>>> =C2=A0 - https://fluentbit.io/announcements/v3.1.8/
>>> =C2=A0 - https://fluentbit.io/announcements/v3.1.9/
>>>
>>> Associated added PACKAGECONFIG knobs are described for the most part in
>>> https://github.com/fluent/fluent-bit/blob/v3.1.9/CMakeLists.txt#L107-L1=
67
>>>
>>> The PACKAGECONFIG knobs are named according to the constant names used
>>> in upstream source code. Please note that here the 'yaml' PACKAGECONFIG
>>> option has changed to 'config-yaml', and instead of 'kafka' there is
>>> now 'out-kafka'.
>>>
>>> As a related side note, the plugin options are now defined in
>>> https://github.com/fluent/fluent-bit/blob/v3.1.9/cmake/plugins_options.=
cmake
>>>
>>> I have tested this change briefly against "qemuarm64" and "qemuppc"
>>> machines that the fluent-bit systemd service starts successfully in
>>> current master based core-image-minimal, and against "qemuarm" machine
>>> using yoe/meta-clang based core-image-minimal. Also tested using an
>>> i.MX6 board that the new Fluent Bit version seems to work as well as
>>> it did with the old 1.9.9 version with respect to logging in a Yocto
>>> Scarthgap based image.
>>>
>>> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
>>> ---
>>> =C2=A0 .../packagegroups/packagegroup-meta-oe.bb=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 1 +
>>> =C2=A0 ...t-Do-not-use-private-makefile-target.patch |=C2=A0 64 -------=
---
>>> =C2=A0 .../0001-Use-posix-strerror_r-with-musl.patch |=C2=A0 34 -----
>>> =C2=A0 ...rivate-makefile-targets-in-CMakelist.patch | 106 ++++++++++++=
++++
>>> =C2=A0 ...ine-_GNU_SOURCE-for-memmem-API-check.patch |=C2=A0 28 -----
>>> =C2=A0 ...nkio-Link-with-fts-library-with-musl.patch |=C2=A0 30 -----
>>> =C2=A0 .../0002-mbedtls-Remove-unused-variable.patch |=C2=A0 40 ------
>>> =C2=A0 ...documentation-warning-as-error-with-.patch |=C2=A0 32 -----
>>> =C2=A0 ...0003-mbedtls-Do-not-overwrite-CFLAGS.patch |=C2=A0 34 -----
>>> =C2=A0 ...-to-store-return-from-flb_kv_item_cr.patch |=C2=A0 45 -------
>>> =C2=A0 ...md-init-systemd-detection-contingent.patch |=C2=A0 63 -------=
---
>>> =C2=A0 ...stackdriver-Fix-return-type-mismatch.patch |=C2=A0 33 -----
>>> =C2=A0 ...06-monkey-Fix-TLS-detection-testcase.patch |=C2=A0 36 ------
>>> =C2=A0 ...-not-check-for-upstart-on-build-host.patch |=C2=A0 46 -------
>>> =C2=A0 .../fluentbit/fluentbit_1.9.9.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 97 ---------------
>>> =C2=A0 .../fluentbit/fluentbit_3.1.9.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 116 ++++++++++++++++++
>>> =C2=A0 16 files changed, 223 insertions(+), 582 deletions(-)
>>> =C2=A0 delete mode 100644=20
>>> meta-oe/recipes-extended/fluentbit/fluentbit/0001-CMakeLists.txt-Do-not=
-use-private-makefile-target.patch
>>> =C2=A0 delete mode 100644=20
>>> meta-oe/recipes-extended/fluentbit/fluentbit/0001-Use-posix-strerror_r-=
with-musl.patch
>>> =C2=A0 create mode 100644=20
>>> meta-oe/recipes-extended/fluentbit/fluentbit/0001-lib-Do-not-use-privat=
e-makefile-targets-in-CMakelist.patch
>>> =C2=A0 delete mode 100644=20
>>> meta-oe/recipes-extended/fluentbit/fluentbit/0001-monkey-Define-_GNU_SO=
URCE-for-memmem-API-check.patch
>>> =C2=A0 delete mode 100644=20
>>> meta-oe/recipes-extended/fluentbit/fluentbit/0002-chunkio-Link-with-fts=
-library-with-musl.patch
>>> =C2=A0 delete mode 100644=20
>>> meta-oe/recipes-extended/fluentbit/fluentbit/0002-mbedtls-Remove-unused=
-variable.patch
>>> =C2=A0 delete mode 100644=20
>>> meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Disable-docum=
entation-warning-as-error-with-.patch
>>> =C2=A0 delete mode 100644=20
>>> meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-overwr=
ite-CFLAGS.patch
>>> =C2=A0 delete mode 100644=20
>>> meta-oe/recipes-extended/fluentbit/fluentbit/0004-Use-correct-type-to-s=
tore-return-from-flb_kv_item_cr.patch
>>> =C2=A0 delete mode 100644=20
>>> meta-oe/recipes-extended/fluentbit/fluentbit/0004-build-Make-systemd-in=
it-systemd-detection-contingent.patch
>>> =C2=A0 delete mode 100644=20
>>> meta-oe/recipes-extended/fluentbit/fluentbit/0005-stackdriver-Fix-retur=
n-type-mismatch.patch
>>> =C2=A0 delete mode 100644=20
>>> meta-oe/recipes-extended/fluentbit/fluentbit/0006-monkey-Fix-TLS-detect=
ion-testcase.patch
>>> =C2=A0 delete mode 100644=20
>>> meta-oe/recipes-extended/fluentbit/fluentbit/0007-cmake-Do-not-check-fo=
r-upstart-on-build-host.patch
>>> =C2=A0 delete mode 100644=20
>>> meta-oe/recipes-extended/fluentbit/fluentbit_1.9.9.bb
>>> =C2=A0 create mode 100644=20
>>> meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
>>>
>>> diff --git=20
>>> a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb=20
>>> b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
>>> index 6dbe194cd..78239b1ea 100644
>>> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
>>> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
>>> @@ -333,6 +333,7 @@ RDEPENDS:packagegroup-meta-oe-extended =3D "\
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dumb-init \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enscript \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 figlet \
>>> +=C2=A0=C2=A0=C2=A0 fluentbit \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains("DISTRO_FEATURES", =
"x11", "gnuplot", "",=20
>>> d)} \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 haveged \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hexedit \
>>> diff --git=20
>>> a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-CMakeLists.txt-Do-n=
ot-use-private-makefile-target.patch b/meta-oe/recipes-extended/fluentbit/f=
luentbit/0001-CMakeLists.txt-Do-not-use-private-makefile-target.patch
>>> deleted file mode 100644
>>> index 0cabed963..000000000
>>> ---=20
>>> a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-CMakeLists.txt-Do-n=
ot-use-private-makefile-target.patch
>>> +++ /dev/null
>>> @@ -1,64 +0,0 @@
>>> -From 6a704ab7bf69cd5d6970b3a7d3ae7798b26027c1 Mon Sep 17 00:00:00 2001
>>> -From: Paulo Neves <ptsneves@gmail.com>
>>> -Date: Thu, 28 Jul 2022 11:28:41 +0200
>>> -Subject: [PATCH] CMakeLists.txt Do not use private makefile $< target
>>> -
>>> -$< is a private detail from the Makefile generated by CMakefile and
>>> -are not under control or to be used at the CMakeLists level. In 3.20
>>> -that private generation changed pre-requisite targets[1] and now logs
>>> -contain the path compiler_depend.ts instead of the actual file.
>>> -
>>> -Upstream-Status: Pending=20
>>> [https://github.com/fluent/fluent-bit/issues/5492
>>> ----
>>> - CMakeLists.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 6 +-----
>>> - lib/chunkio/CMakeLists.txt=C2=A0 | 7 +------
>>> - lib/cmetrics/CMakeLists.txt | 7 +------
>>> - 3 files changed, 3 insertions(+), 17 deletions(-)
>>> -
>>> ---- a/CMakeLists.txt
>>> -+++ b/CMakeLists.txt
>>> -@@ -46,11 +46,7 @@ else()
>>> -=C2=A0=C2=A0 set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall")
>>> - endif()
>>> -
>>> --if(NOT ${CMAKE_SYSTEM_NAME} MATCHES "Windows")
>>> --=C2=A0 set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D'\"$(subs=
t=20
>>> ${CMAKE_SOURCE_DIR}/,,$(abspath $<))\"'")
>>> --else()
>>> --=C2=A0 set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D__FILE__"=
)
>>> --endif()
>>> -+set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D__FILE__")
>>> -
>>> - if(${CMAKE_SYSTEM_PROCESSOR} MATCHES "armv7l")
>>> -=C2=A0=C2=A0 set(CMAKE_C_LINK_FLAGS "${CMAKE_C_LINK_FLAGS} -latomic")
>>> ---- a/lib/chunkio/CMakeLists.txt
>>> -+++ b/lib/chunkio/CMakeLists.txt
>>> -@@ -14,12 +14,7 @@ else()
>>> -=C2=A0=C2=A0 set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall ")
>>> - endif()
>>> -
>>> --# Set __FILENAME__
>>> --if(NOT ${CMAKE_SYSTEM_NAME} MATCHES "Windows")
>>> --=C2=A0 set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D'\"$(subs=
t=20
>>> ${CMAKE_SOURCE_DIR}/,,$(abspath $<))\"'")
>>> --else()
>>> --=C2=A0 set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D__FILE__"=
)
>>> --endif()
>>> -+set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D__FILE__")
>>> -
>>> - include(cmake/macros.cmake)
>>> -
>>> ---- a/lib/cmetrics/CMakeLists.txt
>>> -+++ b/lib/cmetrics/CMakeLists.txt
>>> -@@ -34,12 +34,7 @@ set(CMT_VERSION_MINOR=C2=A0 3)
>>> - set(CMT_VERSION_PATCH=C2=A0 7)
>>> - set(CMT_VERSION_STR=20
>>> "${CMT_VERSION_MAJOR}.${CMT_VERSION_MINOR}.${CMT_VERSION_PATCH}")
>>> -
>>> --# Define __CMT_FILENAME__ consistently across Operating Systems
>>> --if(NOT ${CMAKE_SYSTEM_NAME} MATCHES "Windows")
>>> --=C2=A0 set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__CMT_FILENAME__=3D'\"$(=
subst=20
>>> ${CMAKE_SOURCE_DIR}/,,$(abspath $<))\"'")
>>> --else()
>>> --=C2=A0 set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__CMT_FILENAME__=3D__FIL=
E__")
>>> --endif()
>>> -+set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__CMT_FILENAME__=3D__FILE__")
>>> -
>>> - # Configuration options
>>> - option(CMT_DEV=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "Enable development=20
>>> mode"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 No)
>>> diff --git=20
>>> a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-Use-posix-strerror_=
r-with-musl.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-Use-p=
osix-strerror_r-with-musl.patch
>>> deleted file mode 100644
>>> index 8d89e4df3..000000000
>>> ---=20
>>> a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-Use-posix-strerror_=
r-with-musl.patch
>>> +++ /dev/null
>>> @@ -1,34 +0,0 @@
>>> -From f645128082117a0152a95b3dccd869a184b7513f Mon Sep 17 00:00:00 2001
>>> -From: Khem Raj <raj.khem@gmail.com>
>>> -Date: Wed, 10 Aug 2022 01:23:48 -0700
>>> -Subject: [PATCH 1/2] Use posix strerror_r with musl
>>> -
>>> -Default with glibc is GNU extention of strerror_r
>>> -where as musl uses posix variant, call that out
>>> -
>>> -Upstream-Status: Inappropriate [Need wider porting beyond=20
>>> linux/musl/glibc]
>>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ----
>>> - src/flb_network.c | 5 +++++
>>> - 1 file changed, 5 insertions(+)
>>> -
>>> -diff --git a/src/flb_network.c b/src/flb_network.c
>>> -index 992eb1d..5d7a337 100644
>>> ---- a/src/flb_network.c
>>> -+++ b/src/flb_network.c
>>> -@@ -506,7 +506,12 @@ static int net_connect_async(int fd,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 }
>>> -
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /* Connection is broken, not much to do here */
>>> -+#ifdef __GLIBC__
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 str =3D strerror_r(error, so_error_buf,=20
>>> sizeof(so_error_buf));
>>> -+#else
>>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 st=
rerror_r(error, so_error_buf, sizeof(so_error_buf));
>>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 str =3D so_err=
or_buf;
>>> -+#endif
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 flb_error("[net] TCP connection failed: %s:%i (%s)",
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u->tcp_host=
, u->tcp_port, str);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return -1;
>>> ---
>>> -2.37.1
>>> -
>>> diff --git=20
>>> a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-lib-Do-not-use-priv=
ate-makefile-targets-in-CMakelist.patch b/meta-oe/recipes-extended/fluentbi=
t/fluentbit/0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch
>>> new file mode 100644
>>> index 000000000..233e8c4e3
>>> --- /dev/null
>>> +++=20
>>> b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-lib-Do-not-use-priv=
ate-makefile-targets-in-CMakelist.patch
>>> @@ -0,0 +1,106 @@
>>> +From 940a4e270bb8879a78c0eac4daf997cb77e25b4b Mon Sep 17 00:00:00 2001
>>> +From: Niko Mauno <niko.mauno@vaisala.com>
>>> +Date: Sun, 29 Sep 2024 12:00:00 +0000
>>> +Subject: [PATCH] lib: Do not use private makefile targets in=20
>>> CMakelists.txt
>>> +
>>> +By extending the scope of changes introduced in commit
>>> +fc325524d50fe179b76f127243ab9e03ddbdaaa4
>>> +("build: CMakeLists.txt Do not use private makefile targets (#5819)")
>>> +we mitigate the following error produced by BitBake in Yocto
>>> +
>>> +=C2=A0 ERROR: fluentbit-3.1.9-r0 do_package_qa: QA Issue: File=20
>>> /usr/bin/fluent-bit in package fluentbit contains reference to TMPDIR=20
>>> [buildpaths]
>>> +=C2=A0 ERROR: fluentbit-3.1.9-r0 do_package_qa: Fatal QA errors were=20
>>> found, failing task.
>>> +
>>> +stemming from
>>> +
>>> +=C2=A0 $ strings packages-split/fluentbit/usr/bin/fluent-bit
>>> +=C2=A0 ...
>>> +=C2=A0 $(subst=20
>>> /yocto/upstream/build/tmp/work/cortexa57-poky-linux/fluentbit/3.1.9/git=
/,,$(abspath $<))
>>> +=C2=A0 ...
>>> +
>>> +Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
>>> +
>>> +Upstream-Status: Submitted=20
>>> [https://github.com/fluent/fluent-bit/pull/9450
>>> +---
>>> + lib/cfl/CMakeLists.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 8 ++------
>>> + lib/cmetrics/CMakeLists.txt | 8 ++------
>>> + lib/ctraces/CMakeLists.txt=C2=A0 | 8 ++------
>>> + lib/monkey/CMakeLists.txt=C2=A0=C2=A0 | 4 ----
>>> + 4 files changed, 6 insertions(+), 22 deletions(-)
>>> +
>>> +diff --git a/lib/cfl/CMakeLists.txt b/lib/cfl/CMakeLists.txt
>>> +index 2193cb29c..e2a5cba37 100644
>>> +--- a/lib/cfl/CMakeLists.txt
>>> ++++ b/lib/cfl/CMakeLists.txt
>>> +@@ -40,12 +40,8 @@ if(NOT MSVC)
>>> +=C2=A0=C2=A0 set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall")
>>> + endif()
>>> +
>>> +-# Define __FILENAME__ consistently across Operating Systems
>>> +-if(NOT ${CMAKE_SYSTEM_NAME} MATCHES "Windows")
>>> +-=C2=A0 set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D'\"$$(sub=
st=20
>>> ${CMAKE_SOURCE_DIR}/,,$$(abspath $$<))\"'")
>>> +-else()
>>> +-=C2=A0 set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D__FILE__"=
)
>>> +-endif()
>>> ++# Define __FILENAME__
>>> ++set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D__FILE__")
>>> +
>>> +
>>> +
>>> +diff --git a/lib/cmetrics/CMakeLists.txt b/lib/cmetrics/CMakeLists.txt
>>> +index 4f2989106..9c40dadf4 100644
>>> +--- a/lib/cmetrics/CMakeLists.txt
>>> ++++ b/lib/cmetrics/CMakeLists.txt
>>> +@@ -60,12 +60,8 @@ if(NOT MSVC)
>>> +=C2=A0=C2=A0 set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall")
>>> + endif()
>>> +
>>> +-# Define __CMT_FILENAME__ consistently across Operating Systems
>>> +-if(NOT ${CMAKE_SYSTEM_NAME} MATCHES "Windows")
>>> +-=C2=A0 set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}=20
>>> -D__CMT_FILENAME__=3D'\"$$(subst ${CMAKE_SOURCE_DIR}/,,$$(abspath=20
>>> $$<))\"'")
>>> +-else()
>>> +-=C2=A0 set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__CMT_FILENAME__=3D__FIL=
E__")
>>> +-endif()
>>> ++# Define __CMT_FILENAME__
>>> ++set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__CMT_FILENAME__=3D__FILE__")
>>> +
>>> + # Configuration options
>>> + option(CMT_DEV=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "Enable development=20
>>> mode"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 No)
>>> +diff --git a/lib/ctraces/CMakeLists.txt b/lib/ctraces/CMakeLists.txt
>>> +index e92834e06..5cebb3b73 100644
>>> +--- a/lib/ctraces/CMakeLists.txt
>>> ++++ b/lib/ctraces/CMakeLists.txt
>>> +@@ -30,12 +30,8 @@ set(CTR_VERSION_MINOR=C2=A0 5)
>>> + set(CTR_VERSION_PATCH=C2=A0 6)
>>> + set(CTR_VERSION_STR=20
>>> "${CTR_VERSION_MAJOR}.${CTR_VERSION_MINOR}.${CTR_VERSION_PATCH}")
>>> +
>>> +-# Define __FILENAME__ consistently across Operating Systems
>>> +-if(NOT ${CMAKE_SYSTEM_NAME} MATCHES "Windows")
>>> +-=C2=A0 set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D'\"$$(sub=
st=20
>>> ${CMAKE_SOURCE_DIR}/,,$$(abspath $$<))\"'")
>>> +-else()
>>> +-=C2=A0 set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D__FILE__"=
)
>>> +-endif()
>>> ++# Define __FILENAME__
>>> ++set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D__FILE__")
>>> +
>>> + # Configuration options
>>> + option(CTR_DEV=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "Enable development=20
>>> mode"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 No)
>>> +diff --git a/lib/monkey/CMakeLists.txt b/lib/monkey/CMakeLists.txt
>>> +index 95d8cc1e6..8c66887da 100644
>>> +--- a/lib/monkey/CMakeLists.txt
>>> ++++ b/lib/monkey/CMakeLists.txt
>>> +@@ -15,10 +15,8 @@ include(GNUInstallDirs)
>>> + # Set default compiler options
>>> + if (NOT CMAKE_SYSTEM_NAME MATCHES "Windows")
>>> + set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=3Dgnu99 -Wall -Wextra")
>>> +-set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D'\"$$(subst=20
>>> ${CMAKE_SOURCE_DIR}/,,$$(abspath \$$<))\"'")
>>> +-else()
>>> +-set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D__FILE__")
>>> + endif()
>>> ++set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D__FILE__")
>>> +
>>> + # Monkey Version
>>> + set(MK_VERSION_MAJOR=C2=A0 1)
>>> +--
>>> +2.39.2
>>> +
>>> diff --git=20
>>> a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-monkey-Define-_GNU_=
SOURCE-for-memmem-API-check.patch b/meta-oe/recipes-extended/fluentbit/flue=
ntbit/0001-monkey-Define-_GNU_SOURCE-for-memmem-API-check.patch
>>> deleted file mode 100644
>>> index e70664031..000000000
>>> ---=20
>>> a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-monkey-Define-_GNU_=
SOURCE-for-memmem-API-check.patch
>>> +++ /dev/null
>>> @@ -1,28 +0,0 @@
>>> -From 0d22024c5defba7007e3e633753790e20209c6f6 Mon Sep 17 00:00:00 2001
>>> -From: Khem Raj <raj.khem@gmail.com>
>>> -Date: Tue, 9 Aug 2022 09:59:41 -0700
>>> -Subject: [PATCH 1/5] monkey: Define _GNU_SOURCE for memmem API check
>>> -
>>> -This define is necessary to get this API on glibc based systems
>>> -
>>> -Upstream-Status: Pending
>>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ----
>>> - lib/monkey/mk_core/CMakeLists.txt | 1 +
>>> - 1 file changed, 1 insertion(+)
>>> -
>>> -diff --git a/lib/monkey/mk_core/CMakeLists.txt=20
>>> b/lib/monkey/mk_core/CMakeLists.txt
>>> -index 0e74f8d..739fff3 100644
>>> ---- a/lib/monkey/mk_core/CMakeLists.txt
>>> -+++ b/lib/monkey/mk_core/CMakeLists.txt
>>> -@@ -62,6 +62,7 @@ set(src "${src}"
>>> -=C2=A0=C2=A0 )
>>> -
>>> - check_c_source_compiles("
>>> -+=C2=A0 #define _GNU_SOURCE
>>> -=C2=A0=C2=A0 #include <string.h>
>>> -=C2=A0=C2=A0 int main() {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char=C2=A0 haystack[] =3D \"1234\";
>>> ---
>>> -2.37.1
>>> -
>>> diff --git=20
>>> a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-chunkio-Link-with-f=
ts-library-with-musl.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0=
002-chunkio-Link-with-fts-library-with-musl.patch
>>> deleted file mode 100644
>>> index bdcc53496..000000000
>>> ---=20
>>> a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-chunkio-Link-with-f=
ts-library-with-musl.patch
>>> +++ /dev/null
>>> @@ -1,30 +0,0 @@
>>> -From 63dbbad5978e5f5b0e7d42614999cb6b4ebcce10 Mon Sep 17 00:00:00 2001
>>> -From: Khem Raj <raj.khem@gmail.com>
>>> -Date: Wed, 10 Aug 2022 01:27:16 -0700
>>> -Subject: [PATCH 2/2] chunkio: Link with fts library with musl
>>> -
>>> -Fixes
>>> -cio_utils.c:(.text+0x64): undefined reference to `fts_read'
>>> -
>>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ----
>>> -Upstream-Status: Pending
>>> -
>>> - lib/chunkio/src/CMakeLists.txt | 1 +
>>> - 1 file changed, 1 insertion(+)
>>> -
>>> -diff --git a/lib/chunkio/src/CMakeLists.txt=20
>>> b/lib/chunkio/src/CMakeLists.txt
>>> -index a4fc2d3..4244eb8 100644
>>> ---- a/lib/chunkio/src/CMakeLists.txt
>>> -+++ b/lib/chunkio/src/CMakeLists.txt
>>> -@@ -13,6 +13,7 @@ set(src
>>> -=C2=A0=C2=A0 )
>>> -
>>> - set(libs cio-crc32)
>>> -+set(libs ${libs} fts)
>>> -
>>> - if(${CMAKE_SYSTEM_NAME} MATCHES "Windows")
>>> -=C2=A0=C2=A0 set(src
>>> ---
>>> -2.37.1
>>> -
>>> diff --git=20
>>> a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-mbedtls-Remove-unus=
ed-variable.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-mbedt=
ls-Remove-unused-variable.patch
>>> deleted file mode 100644
>>> index d911420df..000000000
>>> ---=20
>>> a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-mbedtls-Remove-unus=
ed-variable.patch
>>> +++ /dev/null
>>> @@ -1,40 +0,0 @@
>>> -From c7b969d1a2a6b61bd179214ee2516b7b6cd55b27 Mon Sep 17 00:00:00 2001
>>> -From: Khem Raj <raj.khem@gmail.com>
>>> -Date: Tue, 9 Aug 2022 11:21:57 -0700
>>> -Subject: [PATCH 2/5] mbedtls: Remove unused variable
>>> -
>>> -Fixes
>>> -library/bignum.c:1395:29: error: variable 't' set but not used=20
>>> [-Werror,-Wunused-but-set-variable]
>>> -
>>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ----
>>> -Upstream-Status: Pending
>>> -
>>> - lib/mbedtls-2.28.0/library/bignum.c | 4 +---
>>> - 1 file changed, 1 insertion(+), 3 deletions(-)
>>> -
>>> -diff --git a/lib/mbedtls-2.28.0/library/bignum.c=20
>>> b/lib/mbedtls-2.28.0/library/bignum.c
>>> -index 62e7f76..9c256ae 100644
>>> ---- a/lib/mbedtls-2.28.0/library/bignum.c
>>> -+++ b/lib/mbedtls-2.28.0/library/bignum.c
>>> -@@ -1392,7 +1392,7 @@ void mpi_mul_hlp( size_t i,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mbedtls_mpi_uint *d,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mbedtls_mpi_uint b )
>>> - {
>>> --=C2=A0=C2=A0=C2=A0 mbedtls_mpi_uint c =3D 0, t =3D 0;
>>> -+=C2=A0=C2=A0=C2=A0 mbedtls_mpi_uint c =3D 0;
>>> -
>>> - #if defined(MULADDC_HUIT)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 for( ; i >=3D 8; i -=3D 8 )
>>> -@@ -1443,8 +1443,6 @@ void mpi_mul_hlp( size_t i,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> - #endif /* MULADDC_HUIT */
>>> -
>>> --=C2=A0=C2=A0=C2=A0 t++;
>>> --=20
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 while( c !=3D 0 )
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *d +=3D c; c =3D ( *d=
 < c ); d++;
>>> ---
>>> -2.37.1
>>> -
>>> diff --git=20
>>> a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Disable-doc=
umentation-warning-as-error-with-.patch b/meta-oe/recipes-extended/fluentbi=
t/fluentbit/0003-mbedtls-Disable-documentation-warning-as-error-with-.patch
>>> deleted file mode 100644
>>> index 473ebaf7d..000000000
>>> ---=20
>>> a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Disable-doc=
umentation-warning-as-error-with-.patch
>>> +++ /dev/null
>>> @@ -1,32 +0,0 @@
>>> -From 2d12629f768d2459b1fc8a8ca0c38024d84bc195 Mon Sep 17 00:00:00 2001
>>> -From: Khem Raj <raj.khem@gmail.com>
>>> -Date: Tue, 9 Aug 2022 11:32:12 -0700
>>> -Subject: [PATCH 3/5] mbedtls: Disable documentation warning as error=20
>>> with
>>> - clang
>>> -
>>> -There are shortcomings with doxygen info which clang-15+ flags, dont
>>> -treat them as errors
>>> -
>>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ----
>>> -Upstream-Status: Pending
>>> -
>>> - lib/mbedtls-2.28.0/CMakeLists.txt | 2 +-
>>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>>> -
>>> -diff --git a/lib/mbedtls-2.28.0/CMakeLists.txt=20
>>> b/lib/mbedtls-2.28.0/CMakeLists.txt
>>> -index b33c088..c5f886f 100644
>>> ---- a/lib/mbedtls-2.28.0/CMakeLists.txt
>>> -+++ b/lib/mbedtls-2.28.0/CMakeLists.txt
>>> -@@ -212,7 +212,7 @@ if(CMAKE_COMPILER_IS_GNU)
>>> - endif(CMAKE_COMPILER_IS_GNU)
>>> -
>>> - if(CMAKE_COMPILER_IS_CLANG)
>>> --=C2=A0=C2=A0=C2=A0 set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra=
=20
>>> -Wwrite-strings -Wpointer-arith -Wimplicit-fallthrough -Wshadow -Wvla=20
>>> -Wformat=3D2 -Wno-format-nonliteral")
>>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -W=
all -Wextra=20
>>> -Wwrite-strings -Wpointer-arith -Wimplicit-fallthrough -Wshadow -Wvla=20
>>> -Wformat=3D2 -Wno-format-nonliteral -Wno-error=3Ddocumentation")
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 set(CMAKE_C_FLAGS_COVERAGE=C2=A0=C2=A0=C2=A0 =
"-O0 -g3 --coverage")
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 set(CMAKE_C_FLAGS_ASAN=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "-fsanitize=3Daddress -fno-common=20
>>> -fsanitize=3Dundefined -fno-sanitize-recover=3Dall -O3")
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 set(CMAKE_C_FLAGS_ASANDBG=C2=A0=C2=A0=C2=A0=
=C2=A0 "-fsanitize=3Daddress -fno-common=20
>>> -fsanitize=3Dundefined -fno-sanitize-recover=3Dall -O1 -g3=20
>>> -fno-omit-frame-pointer -fno-optimize-sibling-calls")
>>> ---
>>> -2.37.1
>>> -
>>> diff --git=20
>>> a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-over=
write-CFLAGS.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbed=
tls-Do-not-overwrite-CFLAGS.patch
>>> deleted file mode 100644
>>> index 158857ae2..000000000
>>> ---=20
>>> a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-over=
write-CFLAGS.patch
>>> +++ /dev/null
>>> @@ -1,34 +0,0 @@
>>> -From 8486b912281ae85db0c9fc05bb546f16872e114c Mon Sep 17 00:00:00 2001
>>> -From: Paulo Neves <ptsneves@gmail.com>
>>> -Date: Thu, 28 Jul 2022 14:37:18 +0200
>>> -Subject: [PATCH] mbedtls: Do not overwrite CFLAGS
>>> -
>>> -bitbake passes CFLAGS that are often in conflict with the ones set
>>> -in mbedtls' CMakeLists.txt. Such conflicts are the inability to use
>>> -FORTIFY_SOURCE=3D2 except in release mode
>>> -
>>> -Upstream-Status: Inappropriate [due to fluent-bit having it's own=20
>>> Release flags that also overwrite bitbake ones.]
>>> ----
>>> - lib/mbedtls-2.28.0/CMakeLists.txt | 2 --
>>> - 1 file changed, 2 deletions(-)
>>> -
>>> ---- a/lib/mbedtls-2.28.0/CMakeLists.txt
>>> -+++ b/lib/mbedtls-2.28.0/CMakeLists.txt
>>> -@@ -204,8 +204,6 @@ if(CMAKE_COMPILER_IS_GNU)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 if (GCC_VERSION VERSION_GREATER 7.0 OR GCC_VE=
RSION=20
>>> VERSION_EQUAL 7.0)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set(CMAKE_C_FLAGS "${CMAKE_C_FLAG=
S} -Wformat-overflow=3D2=20
>>> -Wformat-truncation")
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 endif()
>>> --=C2=A0=C2=A0=C2=A0 set(CMAKE_C_FLAGS_RELEASE=C2=A0=C2=A0=C2=A0=C2=A0 =
"-O2")
>>> --=C2=A0=C2=A0=C2=A0 set(CMAKE_C_FLAGS_DEBUG=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 "-O0 -g3")
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 set(CMAKE_C_FLAGS_COVERAGE=C2=A0=C2=A0=C2=A0 =
"-O0 -g3 --coverage")
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 set(CMAKE_C_FLAGS_ASAN=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "-fsanitize=3Daddress -fno-common=20
>>> -fsanitize=3Dundefined -fno-sanitize-recover=3Dall -O3")
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 set(CMAKE_C_FLAGS_ASANDBG=C2=A0=C2=A0=C2=A0=
=C2=A0 "-fsanitize=3Daddress -fno-common=20
>>> -fsanitize=3Dundefined -fno-sanitize-recover=3Dall -O1 -g3=20
>>> -fno-omit-frame-pointer -fno-optimize-sibling-calls")
>>> -@@ -215,8 +213,6 @@ endif(CMAKE_COMPILER_IS_GNU)
>>> -
>>> - if(CMAKE_COMPILER_IS_CLANG)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -We=
xtra=20
>>> -Wwrite-strings -Wpointer-arith -Wimplicit-fallthrough -Wshadow -Wvla=20
>>> -Wformat=3D2 -Wno-format-nonliteral")
>>> --=C2=A0=C2=A0=C2=A0 set(CMAKE_C_FLAGS_RELEASE=C2=A0=C2=A0=C2=A0=C2=A0 =
"-O2")
>>> --=C2=A0=C2=A0=C2=A0 set(CMAKE_C_FLAGS_DEBUG=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 "-O0 -g3")
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 set(CMAKE_C_FLAGS_COVERAGE=C2=A0=C2=A0=C2=A0 =
"-O0 -g3 --coverage")
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 set(CMAKE_C_FLAGS_ASAN=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "-fsanitize=3Daddress -fno-common=20
>>> -fsanitize=3Dundefined -fno-sanitize-recover=3Dall -O3")
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 set(CMAKE_C_FLAGS_ASANDBG=C2=A0=C2=A0=C2=A0=
=C2=A0 "-fsanitize=3Daddress -fno-common=20
>>> -fsanitize=3Dundefined -fno-sanitize-recover=3Dall -O1 -g3=20
>>> -fno-omit-frame-pointer -fno-optimize-sibling-calls")
>>> diff --git=20
>>> a/meta-oe/recipes-extended/fluentbit/fluentbit/0004-Use-correct-type-to=
-store-return-from-flb_kv_item_cr.patch b/meta-oe/recipes-extended/fluentbi=
t/fluentbit/0004-Use-correct-type-to-store-return-from-flb_kv_item_cr.patch
>>> deleted file mode 100644
>>> index bd4276193..000000000
>>> ---=20
>>> a/meta-oe/recipes-extended/fluentbit/fluentbit/0004-Use-correct-type-to=
-store-return-from-flb_kv_item_cr.patch
>>> +++ /dev/null
>>> @@ -1,45 +0,0 @@
>>> -From a797b79483940ed4adcaa5fe2c40dd0487c7c2c7 Mon Sep 17 00:00:00 2001
>>> -From: Khem Raj <raj.khem@gmail.com>
>>> -Date: Tue, 9 Aug 2022 11:39:08 -0700
>>> -Subject: [PATCH 4/5] Use correct type to store return from=20
>>> flb_kv_item_create
>>> -
>>> -Fix
>>> -error: incompatible pointer to integer conversion assigning to 'int'=20
>>> from 'struct flb_kv *'
>>> -
>>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ----
>>> -Upstream-Status: Pending
>>> -
>>> - plugins/out_stackdriver/stackdriver_conf.c | 4 ++--
>>> - 1 file changed, 2 insertions(+), 2 deletions(-)
>>> -
>>> -diff --git a/plugins/out_stackdriver/stackdriver_conf.c=20
>>> b/plugins/out_stackdriver/stackdriver_conf.c
>>> -index a9a8eb0..e4f969e 100644
>>> ---- a/plugins/out_stackdriver/stackdriver_conf.c
>>> -+++ b/plugins/out_stackdriver/stackdriver_conf.c
>>> -@@ -176,12 +176,12 @@ static int read_credentials_file(const char=20
>>> *cred_file, struct flb_stackdriver *
>>> -
>>> - static int parse_configuration_labels(struct flb_stackdriver *ctx)
>>> - {
>>> --=C2=A0=C2=A0=C2=A0 int ret;
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 char *p;
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 flb_sds_t key;
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 flb_sds_t val;
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 struct mk_list *head;
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 struct flb_slist_entry *entry;
>>> -+=C2=A0=C2=A0=C2=A0 struct flb_kv *ret;
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 msgpack_object_kv *kv =3D NULL;
>>> -
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 if (ctx->labels) {
>>> -@@ -216,7 +216,7 @@ static int parse_configuration_labels(struct=20
>>> flb_stackdriver *ctx)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 flb_sds_destroy(key);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 flb_sds_destroy(val);
>>> -
>>> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 (ret =3D=3D -1) {
>>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 (!ret) {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -1;
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 }
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> ---
>>> -2.37.1
>>> -
>>> diff --git=20
>>> a/meta-oe/recipes-extended/fluentbit/fluentbit/0004-build-Make-systemd-=
init-systemd-detection-contingent.patch b/meta-oe/recipes-extended/fluentbi=
t/fluentbit/0004-build-Make-systemd-init-systemd-detection-contingent.patch
>>> deleted file mode 100644
>>> index f6e3dce2f..000000000
>>> ---=20
>>> a/meta-oe/recipes-extended/fluentbit/fluentbit/0004-build-Make-systemd-=
init-systemd-detection-contingent.patch
>>> +++ /dev/null
>>> @@ -1,63 +0,0 @@
>>> -From 7a792624925d46690c1f07fe4b194b5f4c510db6 Mon Sep 17 00:00:00 2001
>>> -From: Paulo Neves <ptsneves@gmail.com>
>>> -Date: Tue, 2 Aug 2022 09:57:05 +0200
>>> -Subject: [PATCH 1/1] build: Make systemd init systemd detection=20
>>> contingent on
>>> - pkgconfig
>>> -
>>> -Use pkg-config to get systemd.pc variables and systemdunitdir. Those
>>> -variable ensure that .service files are installed in the correct paths
>>> -and only when systemd is detected.
>>> -
>>> -Upstream-Status: Pending=20
>>> [https://github.com/fluent/fluent-bit/pull/5818
>>> -
>>> ----
>>> - cmake/FindJournald.cmake | 4 ++++
>>> - src/CMakeLists.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
>>> - 2 files changed, 6 insertions(+), 2 deletions(-)
>>> -
>>> -diff --git a/cmake/FindJournald.cmake b/cmake/FindJournald.cmake
>>> -index f5a3a832b..9e6657a29 100644
>>> ---- a/cmake/FindJournald.cmake
>>> -+++ b/cmake/FindJournald.cmake
>>> -@@ -5,6 +5,8 @@
>>> - #=C2=A0 JOURNALD_INCLUDE_DIR - the Journald include directory
>>> - #=C2=A0 JOURNALD_LIBRARIES - Link these to use Journald
>>> - #=C2=A0 JOURNALD_DEFINITIONS - Compiler switches required for using=20
>>> Journald
>>> -+#=C2=A0 SYSTEMD_UNITDIR - The systemd units' directory
>>> -+#
>>> - # Redistribution and use is allowed according to the terms of the=20
>>> BSD license.
>>> - # For details see the accompanying COPYING-CMAKE-SCRIPTS file.
>>> - #
>>> -@@ -16,7 +18,9 @@
>>> - # in the FIND_PATH() and FIND_LIBRARY() calls
>>> - find_package(PkgConfig)
>>> - pkg_check_modules(PC_JOURNALD QUIET systemd)
>>> -+pkg_get_variable(PC_SYSTEMD_UNITDIR systemd "systemdsystemunitdir")
>>> -
>>> -+set(SYSTEMD_UNITDIR ${PC_SYSTEMD_UNITDIR})
>>> - set(JOURNALD_FOUND ${PC_JOURNALD_FOUND})
>>> - set(JOURNALD_DEFINITIONS ${PC_JOURNALD_CFLAGS_OTHER})
>>> -
>>> -diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
>>> -index 522bbf9bd..30743d8d6 100644
>>> ---- a/src/CMakeLists.txt
>>> -+++ b/src/CMakeLists.txt
>>> -@@ -480,13 +480,13 @@ if(FLB_BINARY)
>>> -=C2=A0=C2=A0 endif()
>>> -
>>> -=C2=A0=C2=A0 # Detect init system, install upstart, systemd or init.d =
script
>>> --=C2=A0 if(IS_DIRECTORY /lib/systemd/system)
>>> -+=C2=A0 if(DEFINED SYSTEMD_UNITDIR)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 set(FLB_SYSTEMD_SCRIPT=20
>>> "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.service")
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 configure_file(
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "${PROJECT_SOURCE_DIR}/init/syste=
md.in"
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${FLB_SYSTEMD_SCRIPT}
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 )
>>> --=C2=A0=C2=A0=C2=A0 install(FILES ${FLB_SYSTEMD_SCRIPT} COMPONENT bina=
ry=20
>>> DESTINATION /lib/systemd/system)
>>> -+=C2=A0=C2=A0=C2=A0 install(FILES ${FLB_SYSTEMD_SCRIPT} COMPONENT bina=
ry=20
>>> DESTINATION ${SYSTEMD_UNITDIR})
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 install(DIRECTORY DESTINATION ${FLB_INSTALL_C=
ONFDIR} COMPONENT=20
>>> binary)
>>> -=C2=A0=C2=A0 elseif(IS_DIRECTORY /usr/share/upstart)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 set(FLB_UPSTART_SCRIPT=20
>>> "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.conf")
>>> ---
>>> -2.25.1
>>> -
>>> diff --git=20
>>> a/meta-oe/recipes-extended/fluentbit/fluentbit/0005-stackdriver-Fix-ret=
urn-type-mismatch.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0005=
-stackdriver-Fix-return-type-mismatch.patch
>>> deleted file mode 100644
>>> index f023ab573..000000000
>>> ---=20
>>> a/meta-oe/recipes-extended/fluentbit/fluentbit/0005-stackdriver-Fix-ret=
urn-type-mismatch.patch
>>> +++ /dev/null
>>> @@ -1,33 +0,0 @@
>>> -From 27f0bd5a3339612e03112e6b490900a9fabc3337 Mon Sep 17 00:00:00 2001
>>> -From: Khem Raj <raj.khem@gmail.com>
>>> -Date: Tue, 9 Aug 2022 11:44:25 -0700
>>> -Subject: [PATCH 5/5] stackdriver: Fix return type mismatch
>>> -
>>> -Fix
>>> -error: incompatible integer to pointer conversion returning 'int'=20
>>> from a function with result type 'flb_sds_t' (aka 'char *')=20
>>> [-Wint-conversion]
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn -1;
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~
>>> -
>>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ----
>>> -Upstream-Status: Pending
>>> -
>>> - plugins/out_stackdriver/stackdriver.c | 2 +-
>>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>>> -
>>> -diff --git a/plugins/out_stackdriver/stackdriver.c=20
>>> b/plugins/out_stackdriver/stackdriver.c
>>> -index ae66bf2..e01755c 100644
>>> ---- a/plugins/out_stackdriver/stackdriver.c
>>> -+++ b/plugins/out_stackdriver/stackdriver.c
>>> -@@ -2033,7 +2033,7 @@ static flb_sds_t stackdriver_format(struct=20
>>> flb_stackdriver *ctx,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 flb_sds_destroy(operation_producer);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 msgpack_unpacked_destroy(&result);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 msgpack_sbuffer_destroy(&mp_sbuf);
>>> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn -1;
>>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn NULL;
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> -
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Number of parsed l=
abels */
>>> ---
>>> -2.37.1
>>> -
>>> diff --git=20
>>> a/meta-oe/recipes-extended/fluentbit/fluentbit/0006-monkey-Fix-TLS-dete=
ction-testcase.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0006-mo=
nkey-Fix-TLS-detection-testcase.patch
>>> deleted file mode 100644
>>> index c3f2574d2..000000000
>>> ---=20
>>> a/meta-oe/recipes-extended/fluentbit/fluentbit/0006-monkey-Fix-TLS-dete=
ction-testcase.patch
>>> +++ /dev/null
>>> @@ -1,36 +0,0 @@
>>> -From f88d9b82e8bd8ae38fba666b5825ffb41769f81a Mon Sep 17 00:00:00 2001
>>> -From: Khem Raj <raj.khem@gmail.com>
>>> -Date: Tue, 9 Aug 2022 12:25:22 -0700
>>> -Subject: [PATCH] monkey: Fix TLS detection testcase
>>> -
>>> -Clang15 errors out on compiling the check and disables TLS
>>> -
>>> -Fixes errors like
>>> -
>>> -error: call to undeclared function '__tls_get_addr'; ISO C99 and=20
>>> later do not support implicit function declarations=20
>>> [-Wimplicit-function-declaration]
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __tls_get_addr(0);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
>>> -
>>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ----
>>> -Upstream-Status: Pending
>>> -
>>> - lib/monkey/CMakeLists.txt | 2 ++
>>> - 1 file changed, 2 insertions(+)
>>> -
>>> -diff --git a/lib/monkey/CMakeLists.txt b/lib/monkey/CMakeLists.txt
>>> -index 15e62e8..96ac2bd 100644
>>> ---- a/lib/monkey/CMakeLists.txt
>>> -+++ b/lib/monkey/CMakeLists.txt
>>> -@@ -178,6 +178,8 @@ endif()
>>> - # Use old Pthread TLS
>>> - if(NOT MK_PTHREAD_TLS)
>>> -=C2=A0=C2=A0 check_c_source_compiles("
>>> -+=C2=A0=C2=A0=C2=A0=C2=A0 #include <sys/types.h>
>>> -+=C2=A0=C2=A0=C2=A0=C2=A0 extern void *__tls_get_addr(size_t *v);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __thread int a;
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int main() {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __tls_get_addr(=
0);
>>> ---
>>> -2.37.1
>>> -
>>> diff --git=20
>>> a/meta-oe/recipes-extended/fluentbit/fluentbit/0007-cmake-Do-not-check-=
for-upstart-on-build-host.patch b/meta-oe/recipes-extended/fluentbit/fluent=
bit/0007-cmake-Do-not-check-for-upstart-on-build-host.patch
>>> deleted file mode 100644
>>> index 71bdd34ee..000000000
>>> ---=20
>>> a/meta-oe/recipes-extended/fluentbit/fluentbit/0007-cmake-Do-not-check-=
for-upstart-on-build-host.patch
>>> +++ /dev/null
>>> @@ -1,46 +0,0 @@
>>> -From c41653e856d05ed430d22f8b311714ff756a0e0b Mon Sep 17 00:00:00 2001
>>> -From: Khem Raj <raj.khem@gmail.com>
>>> -Date: Thu, 23 Mar 2023 18:05:27 -0700
>>> -Subject: [PATCH] cmake: Do not check for upstart on build host
>>> -
>>> -Some ubuntu distros might have this directory /usr/share/upstart aroun=
d
>>> -and yocto based distros not using systemd will process this piece of
>>> -code and falsely assume that target supports upstart, which may not be
>>> -true in case of cross-compilation.
>>> -
>>> -This also can end up in configure errors e.g.
>>> -
>>> -| CMake Error at src/CMakeLists.txt:496 (install):
>>> -|=C2=A0=C2=A0 install DIRECTORY given unknown argument "/etc/td-agent-=
bit/".
>>> -|
>>> -|
>>> -| -- Configuring incomplete, errors occurred!
>>> -
>>> -Upstream-Status: Inappropriate [ Cross-compile Specific ]
>>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ----
>>> - src/CMakeLists.txt | 8 --------
>>> - 1 file changed, 8 deletions(-)
>>> -
>>> -diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
>>> -index bb30b2a..c63b6d8 100644
>>> ---- a/src/CMakeLists.txt
>>> -+++ b/src/CMakeLists.txt
>>> -@@ -486,14 +486,6 @@ if(FLB_BINARY)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 )
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 install(FILES ${FLB_SYSTEMD_SCRIPT} COMPONENT=
 binary=20
>>> DESTINATION ${SYSTEMD_UNITDIR})
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 install(DIRECTORY DESTINATION ${FLB_INSTALL_C=
ONFDIR} COMPONENT=20
>>> binary)
>>> --=C2=A0 elseif(IS_DIRECTORY /usr/share/upstart)
>>> --=C2=A0=C2=A0=C2=A0 set(FLB_UPSTART_SCRIPT=20
>>> "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.conf")
>>> --=C2=A0=C2=A0=C2=A0 configure_file(
>>> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "${PROJECT_SOURCE_DIR}/init/upstart.in=
"
>>> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${FLB_UPSTART_SCRIPT}
>>> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 )
>>> --=C2=A0=C2=A0=C2=A0 install(FILES ${FLB_UPSTART_SCRIPT} COMPONENT bina=
ry=20
>>> DESTINATION /etc/init)
>>> --=C2=A0=C2=A0=C2=A0 install(DIRECTORY DESTINATION COMPONENT binary=20
>>> ${FLB_INSTALL_CONFDIR})
>>> -=C2=A0=C2=A0 else()
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 # FIXME: should we support Sysv init script ?
>>> -=C2=A0=C2=A0 endif()
>>> ---
>>> -2.40.0
>>> -
>>> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.9.bb=20
>>> b/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.9.bb
>>> deleted file mode 100644
>>> index 660a3a63e..000000000
>>> --- a/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.9.bb
>>> +++ /dev/null
>>> @@ -1,97 +0,0 @@
>>> -SUMMARY =3D "Fast Log processor and Forwarder"
>>> -DESCRIPTION =3D "Fluent Bit is a data collector, processor and=C2=A0 \
>>> -forwarder for Linux. It supports several input sources and \
>>> -backends (destinations) for your data. \
>>> -"
>>> -
>>> -HOMEPAGE =3D "http://fluentbit.io/
>>> -BUGTRACKER =3D "https://github.com/fluent/fluent-bit/issues
>>> -
>>> -LICENSE =3D "Apache-2.0"
>>> -LIC_FILES_CHKSUM =3D=20
>>> "file://LICENSE;md5=3D2ee41112a44fe7014dce33e26468ba93"
>>> -SECTION =3D "net"
>>> -
>>> -SRC_URI =3D "https://releases.fluentbit.io/1.9/source-$
>>> -          =20
>>> file://0001-CMakeLists.txt-Do-not-use-private-makefile-target.patch \
>>> -          =20
>>> file://0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch =
\
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://00=
03-mbedtls-Do-not-overwrite-CFLAGS.patch \
>>> -          =20
>>> file://0004-build-Make-systemd-init-systemd-detection-contingent.patch =
\
>>> -          =20
>>> file://0001-monkey-Define-_GNU_SOURCE-for-memmem-API-check.patch \
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://00=
02-mbedtls-Remove-unused-variable.patch \
>>> -          =20
>>> file://0003-mbedtls-Disable-documentation-warning-as-error-with-.patch =
\
>>> -          =20
>>> file://0004-Use-correct-type-to-store-return-from-flb_kv_item_cr.patch =
\
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://00=
05-stackdriver-Fix-return-type-mismatch.patch \
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://00=
06-monkey-Fix-TLS-detection-testcase.patch \
>>> -          =20
>>> file://0007-cmake-Do-not-check-for-upstart-on-build-host.patch \
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>>> -SRC_URI:remove:x86 =3D "file://0002-mbedtls-Remove-unused-variable.pat=
ch"
>>> -SRC_URI:append:libc-musl =3D "\
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://00=
01-Use-posix-strerror_r-with-musl.patch \
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://00=
02-chunkio-Link-with-fts-library-with-musl.patch \
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>>> -SRC_URI[sha256sum] =3D=20
>>> "3f6cd4bd1894cda16b465aef6ffec7e920d54c4209b3e2320fcffe7ae345700e"
>>> -S =3D "${WORKDIR}/fluent-bit-${PV}"
>>> -
>>> -DEPENDS =3D "zlib bison-native flex-native openssl"
>>> -DEPENDS +=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
>>> -
>>> -PACKAGECONFIG[yaml] =3D=20
>>> "-DFLB_CONFIG_YAML=3DOn,-DFLB_CONFIG_YAML=3DOff,libyaml"
>>> -PACKAGECONFIG[kafka] =3D=20
>>> "-DFLB_OUT_KAFKA=3DOn,-DFLB_OUT_KAFKA=3DOff,librdkafka"
>>> -PACKAGECONFIG[examples] =3D "-DFLB_EXAMPLES=3DOn,-DFLB_EXAMPLES=3DOff"
>>> -PACKAGECONFIG[jemalloc] =3D=20
>>> "-DFLB_JEMALLOC=3DOn,-DFLB_JEMALLOC=3DOff,jemalloc"
>>> -#TODO add more fluentbit options to PACKAGECONFIG[]
>>> -
>>> -DEPENDS:append:libc-musl =3D " fts "
>>> -
>>> -# flex hardcodes the input file in #line directives leading to=20
>>> TMPDIR contamination of debug sources.
>>> -do_compile:append() {
>>> -=C2=A0=C2=A0=C2=A0 find ${B} -name '*.c' -or -name '*.h' | xargs sed -=
i -e=20
>>> 's|${TMPDIR}|${TARGET_DBGSRC_DIR}/|g'
>>> -}
>>> -
>>> -PACKAGECONFIG ?=3D "yaml"
>>> -
>>> -LTO =3D ""
>>> -
>>> -# Use CMake 'Unix Makefiles' generator
>>> -OECMAKE_GENERATOR ?=3D "Unix Makefiles"
>>> -
>>> -# Fluent Bit build options
>>> -# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>>> -
>>> -# Host related setup
>>> -EXTRA_OECMAKE +=3D "-DGNU_HOST=3D${HOST_SYS} -DFLB_TD=3D1"
>>> -
>>> -# Disable LuaJIT and filter_lua support
>>> -EXTRA_OECMAKE +=3D "-DFLB_LUAJIT=3DOff -DFLB_FILTER_LUA=3DOff "
>>> -
>>> -# Disable Library and examples
>>> -EXTRA_OECMAKE +=3D "-DFLB_SHARED_LIB=3DOff"
>>> -
>>> -# Enable systemd iff systemd is in DISTRO_FEATURES
>>> -EXTRA_OECMAKE +=3D=20
>>> "${@bb.utils.contains('DISTRO_FEATURES','systemd','-DFLB_SYSTEMD=3DOn',=
'-DFLB_SYSTEMD=3DOff',d)}"
>>> -
>>> -# Enable release builds
>>> -EXTRA_OECMAKE +=3D "-DFLB_RELEASE=3DOn"
>>> -
>>> -# musl needs these options
>>> -EXTRA_OECMAKE:append:libc-musl =3D '=20
>>> -DFLB_JEMALLOC_OPTIONS=3D"--with-jemalloc-prefix=3Dje_=20
>>> --with-lg-quantum=3D3" -DFLB_CORO_STACK_SIZE=3D24576'
>>> -
>>> -EXTRA_OECMAKE:append:riscv64 =3D " -DCMAKE_C_STANDARD_LIBRARIES=3D-lat=
omic"
>>> -EXTRA_OECMAKE:append:riscv32 =3D " -DCMAKE_C_STANDARD_LIBRARIES=3D-lat=
omic"
>>> -EXTRA_OECMAKE:append:mips =3D " -DCMAKE_C_STANDARD_LIBRARIES=3D-latomi=
c"
>>> -EXTRA_OECMAKE:append:powerpc =3D " -DCMAKE_C_STANDARD_LIBRARIES=3D-lat=
omic"
>>> -EXTRA_OECMAKE:append:x86 =3D " -DCMAKE_C_STANDARD_LIBRARIES=3D-latomic=
"
>>> -
>>> -CFLAGS:append:x86 =3D " -DMBEDTLS_HAVE_SSE2"
>>> -
>>> -# Fixes build with GCC-14
>>> -CFLAGS +=3D "-Wno-error=3Dincompatible-pointer-types"
>>> -
>>> -inherit cmake systemd pkgconfig
>>> -
>>> -SYSTEMD_SERVICE:${PN} =3D "td-agent-bit.service"
>>> -
>>> -EXTRA_OECMAKE +=3D "-DCMAKE_DEBUG_SRCDIR=3D${TARGET_DBGSRC_DIR}/"
>>> -TARGET_CC_ARCH +=3D " ${SELECTED_OPTIMIZATION}"
>>> -
>>> -SKIP_RECIPE[fluentbit] ?=3D "It is not reproducible. QA Issue: File=20
>>> /usr/bin/.debug/td-agent-bit in package fluentbit-dbg contains=20
>>> reference to TMPDIR [buildpaths]"
>>> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb=20
>>> b/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
>>> new file mode 100644
>>> index 000000000..c56d66759
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
>>> @@ -0,0 +1,116 @@
>>> +SUMMARY =3D "Fast Log Processor and Forwarder"
>>> +DESCRIPTION =3D "Fluent Bit allows to collect log events or metrics=20
>>> from \
>>> +different sources, process them and deliver them to different=20
>>> backends \
>>> +such as Fluentd, Elasticsearch, Splunk, DataDog, Kafka, New Relic,=20
>>> Azure \
>>> +services, AWS services, Google services, NATS, InfluxDB or any custom =
\
>>> +HTTP end-point."
>>> +HOMEPAGE =3D "http://fluentbit.io/
>>> +BUGTRACKER =3D "https://github.com/fluent/fluent-bit/issues
>>> +SECTION =3D "net"
>>> +LICENSE =3D "Apache-2.0"
>>> +LIC_FILES_CHKSUM =3D=20
>>> "file://LICENSE;md5=3D2ee41112a44fe7014dce33e26468ba93"
>>> +DEPENDS =3D "\
>>> +=C2=A0=C2=A0=C2=A0 bison-native \
>>> +=C2=A0=C2=A0=C2=A0 flex-native \
>>> +=C2=A0=C2=A0=C2=A0 openssl \
>>> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)=
} \
>>> +"
>>> +
>>> +SRCREV =3D "431fa79ae27edaef8d050a7af6f038f4400193a1"
>>> +SRC_URI =3D "\
>>> +=C2=A0=C2=A0=C2=A0 git://github.com/fluent/fluent-bit.git;branch=3D3.1=
;protocol=3Dhttps \
>>> +   =20
>>> file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch =
\
>>> +   =20
>>> file://0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch =
\
>>> +"
>>> +
>>> +S =3D "${WORKDIR}/git"
>>> +
>>> +PACKAGECONFIG ??=3D "\
>>> +=C2=A0=C2=A0=C2=A0 aws \
>>> +=C2=A0=C2=A0=C2=A0 binary \
>>> +=C2=A0=C2=A0=C2=A0 config-yaml \
>>> +=C2=A0=C2=A0=C2=A0 custom-calyptia \
>>> +=C2=A0=C2=A0=C2=A0 http-server \
>>> +=C2=A0=C2=A0=C2=A0 inotify \
>>> +=C2=A0=C2=A0=C2=A0 metrics \
>>> +=C2=A0=C2=A0=C2=A0 parser \
>>> +=C2=A0=C2=A0=C2=A0 proxy-go \
>>> +=C2=A0=C2=A0=C2=A0 record-accessor \
>>> +=C2=A0=C2=A0=C2=A0 regex \
>>> +=C2=A0=C2=A0=C2=A0 release \
>>> +=C2=A0=C2=A0=C2=A0 signv4 \
>>> +=C2=A0=C2=A0=C2=A0 sqldb \
>>> +=C2=A0=C2=A0=C2=A0 stream-processor \
>>> +=C2=A0=C2=A0=C2=A0 tls \
>>> +=C2=A0=C2=A0=C2=A0 utf8-encoder \
>>> +"
>>> +
>>> +PACKAGECONFIG[all] =3D "-DFLB_ALL=3DYes,-DFLB_ALL=3DNo"
>>> +PACKAGECONFIG[arrow] =3D "-DFLB_ARROW=3DYes,-DFLB_ARROW=3DNo"
>>> +PACKAGECONFIG[avro-encoder] =3D=20
>>> "-DFLB_AVRO_ENCODER=3DYes,-DFLB_AVRO_ENCODER=3DNo"
>>> +PACKAGECONFIG[aws-error-reporter] =3D=20
>>> "-DFLB_AWS_ERROR_REPORTER=3DYes,-DFLB_AWS_ERROR_REPORTER=3DNo"
>>> +PACKAGECONFIG[aws] =3D "-DFLB_AWS=3DYes,-DFLB_AWS=3DNo"
>>> +PACKAGECONFIG[backtrace] =3D "-DFLB_BACKTRACE=3DYes,-DFLB_BACKTRACE=3D=
No"
>>> +PACKAGECONFIG[binary] =3D "-DFLB_BINARY=3DYes,-DFLB_BINARY=3DNo"
>>> +PACKAGECONFIG[chunk-trace] =3D=20
>>> "-DFLB_CHUNK_TRACE=3DYes,-DFLB_CHUNK_TRACE=3DNo"
>>> +PACKAGECONFIG[config-yaml] =3D=20
>>> "-DFLB_CONFIG_YAML=3DYes,-DFLB_CONFIG_YAML=3DNo,libyaml"
>>> +PACKAGECONFIG[coverage] =3D "-DFLB_COVERAGE=3DYes,-DFLB_COVERAGE=3DNo"
>>> +PACKAGECONFIG[custom-calyptia] =3D=20
>>> "-DFLB_CUSTOM_CALYPTIA=3DYes,-DFLB_CUSTOM_CALYPTIA=3DNo"
>>> +PACKAGECONFIG[debug] =3D "-DFLB_DEBUG=3DYes,-DFLB_DEBUG=3DNo"
>>> +PACKAGECONFIG[enforce-alignment] =3D=20
>>> "-DFLB_ENFORCE_ALIGNMENT=3DYes,-DFLB_ENFORCE_ALIGNMENT=3DNo"
>>> +PACKAGECONFIG[examples] =3D "-DFLB_EXAMPLES=3DYes,-DFLB_EXAMPLES=3DNo"
>>> +PACKAGECONFIG[http-client-debug] =3D=20
>>> "-DFLB_HTTP_CLIENT_DEBUG=3DYes,-DFLB_HTTP_CLIENT_DEBUG=3DNo"
>>> +PACKAGECONFIG[http-server] =3D=20
>>> "-DFLB_HTTP_SERVER=3DYes,-DFLB_HTTP_SERVER=3DNo"
>>> +PACKAGECONFIG[inotify] =3D "-DFLB_INOTIFY=3DYes,-DFLB_INOTIFY=3DNo"
>>> +PACKAGECONFIG[jemalloc] =3D=20
>>> "-DFLB_JEMALLOC=3DYes,-DFLB_JEMALLOC=3DNo,jemalloc"
>>> +PACKAGECONFIG[luajit] =3D "-DFLB_LUAJIT=3DYes,-DFLB_LUAJIT=3DNo"
>>> +PACKAGECONFIG[metrics] =3D "-DFLB_METRICS=3DYes,-DFLB_METRICS=3DNo"
>>> +PACKAGECONFIG[mtrace] =3D "-DFLB_MTRACE=3DYes,-DFLB_MTRACE=3DNo"
>>> +PACKAGECONFIG[parser] =3D "-DFLB_PARSER=3DYes,-DFLB_PARSER=3DNo"
>>> +PACKAGECONFIG[posix-tls] =3D "-DFLB_POSIX_TLS=3DYes,-DFLB_POSIX_TLS=3D=
No"
>>> +PACKAGECONFIG[proxy-go] =3D "-DFLB_PROXY_GO=3DYes,-DFLB_PROXY_GO=3DNo"
>>> +PACKAGECONFIG[record-accessor] =3D=20
>>> "-DFLB_RECORD_ACCESSOR=3DYes,-DFLB_RECORD_ACCESSOR=3DNo"
>>> +PACKAGECONFIG[regex] =3D "-DFLB_REGEX=3DYes,-DFLB_REGEX=3DNo"
>>> +PACKAGECONFIG[release] =3D "-DFLB_RELEASE=3DYes,-DFLB_RELEASE=3DNo"
>>> +PACKAGECONFIG[run-ldconfig] =3D=20
>>> "-DFLB_RUN_LDCONFIG=3DYes,-DFLB_RUN_LDCONFIG=3DNo"
>>> +PACKAGECONFIG[shared-lib] =3D "-DFLB_SHARED_LIB=3DYes,-DFLB_SHARED_LIB=
=3DNo"
>>> +PACKAGECONFIG[signv4] =3D "-DFLB_SIGNV4=3DYes,-DFLB_SIGNV4=3DNo"
>>> +PACKAGECONFIG[small] =3D "-DFLB_SMALL=3DYes,-DFLB_SMALL=3DNo"
>>> +PACKAGECONFIG[sqldb] =3D "-DFLB_SQLDB=3DYes,-DFLB_SQLDB=3DNo"
>>> +PACKAGECONFIG[stream-processor] =3D=20
>>> "-DFLB_STREAM_PROCESSOR=3DYes,-DFLB_STREAM_PROCESSOR=3DNo"
>>> +PACKAGECONFIG[tests-runtime] =3D=20
>>> "-DFLB_TESTS_RUNTIME=3DYes,-DFLB_TESTS_RUNTIME=3DNo"
>>> +PACKAGECONFIG[tls] =3D "-DFLB_TLS=3DYes,-DFLB_TLS=3DNo"
>>> +PACKAGECONFIG[trace] =3D "-DFLB_TRACE=3DYes,-DFLB_TRACE=3DNo"
>>> +PACKAGECONFIG[utf8-encoder] =3D=20
>>> "-DFLB_UTF8_ENCODER=3DYes,-DFLB_UTF8_ENCODER=3DNo"
>>> +PACKAGECONFIG[valgrind] =3D "-DFLB_VALGRIND=3DYes,-DFLB_VALGRIND=3DNo"
>>> +PACKAGECONFIG[wamrc] =3D "-DFLB_WAMRC=3DYes,-DFLB_WAMRC=3DNo"
>>> +PACKAGECONFIG[wasm-stack-protect] =3D=20
>>> "-DFLB_WASM_STACK_PROTECT=3DYes,-DFLB_WASM_STACK_PROTECT=3DNo"
>>> +PACKAGECONFIG[wasm] =3D "-DFLB_WASM=3DYes,-DFLB_WASM=3DNo"
>>> +PACKAGECONFIG[windows-defaults] =3D=20
>>> "-DFLB_WINDOWS_DEFAULTS=3DYes,-DFLB_WINDOWS_DEFAULTS=3DNo"
>>> +
>>> +# Option to disable all Fluent Bit plugins by default. See=20
>>> cmake/plugins_options.cmake which
>>> +# individual plugins then to enable (e.g. using EXTRA_OECMAKE:append=20
>>> =3D " -DFLB_FOOBAR=3DON")
>>> +PACKAGECONFIG[minimal] =3D "-DFLB_MINIMAL=3DYes,-DFLB_MINIMAL=3DNo"
>>> +
>>> +# Without zstd dependency, kafka plugin build fails at link attempt=20
>>> against native libzstd.so
>>> +PACKAGECONFIG[in-kafka] =3D=20
>>> "-DFLB_IN_KAFKA=3DON,-DFLB_IN_KAFKA=3DOFF,librdkafka zstd"
>>> +PACKAGECONFIG[out-kafka] =3D=20
>>> "-DFLB_OUT_KAFKA=3DON,-DFLB_OUT_KAFKA=3DOFF,librdkafka zstd"
>>> +
>>> +SYSTEMD_SERVICE:${PN} =3D "fluent-bit.service"
>>> +
>>> +inherit cmake systemd pkgconfig
>>> +
>>> +FULL_OPTIMIZATION:remove =3D "${@'-O2' if=20
>>> bb.data.inherits_class('clang', d) else ''}"
>>> +TARGET_CC_ARCH +=3D " ${SELECTED_OPTIMIZATION}"
>>> +TARGET_CC_ARCH:remove =3D "-D_FORTIFY_SOURCE=3D2"
>>> +EXTRA_OECMAKE +=3D "-DCMAKE_DEBUG_SRCDIR=3D${TARGET_DBGSRC_DIR}/"
>>> +EXTRA_OECMAKE:append:mips =3D " -DCMAKE_C_STANDARD_LIBRARIES=3D-latomi=
c"
>>> +EXTRA_OECMAKE:append:powerpc =3D " -DCMAKE_C_STANDARD_LIBRARIES=3D-lat=
omic"
>>> +EXTRA_OECMAKE:append:riscv32 =3D " -DCMAKE_C_STANDARD_LIBRARIES=3D-lat=
omic"
>>> +EXTRA_OECMAKE:append:riscv64 =3D " -DCMAKE_C_STANDARD_LIBRARIES=3D-lat=
omic"
>>> +EXTRA_OECMAKE:append:x86 =3D " -DCMAKE_C_STANDARD_LIBRARIES=3D-latomic=
"
>>> +
>>> +# flex hardcodes the input file in #line directives leading to=20
>>> TMPDIR contamination of debug sources.
>>> +do_compile:append() {
>>> +=C2=A0=C2=A0=C2=A0 find ${B} -name '*.c' -or -name '*.h' | xargs sed -=
i -e=20
>>> 's|${TMPDIR}|${TARGET_DBGSRC_DIR}/|g'
>>> +}
>>> --=20
>>> 2.39.2
>>>
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112762): https://lists.openembedded.org/g/openembedde=
d-devel/message/112762
> Mute This Topic: https://lists.openembedded.org/mt/108886811/3618471
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [n=
iko.mauno@vaisala.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

