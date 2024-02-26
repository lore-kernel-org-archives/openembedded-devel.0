Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5042AC54E49
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 11:46:29 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.96])
 by mx.groups.io with SMTP id smtpd.web11.18322.1708947972737650037
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Feb 2024 03:46:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=RmCD5m1r;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.247.96, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mxJtFXZgwLKZm6ineKRgkoW/wrJ3lBh/KlMlmOVofVLi32bb1m+SIl3MbdJnhuCr1oF5fLcpe+19+VHsM0ENQ3zrZ1YCLLVHYBmFl6NfWFgybQIoY49oIamKhMyFf/oRiCgCSMddaDN2zsDMzp1CcXCoKbAIPYgHXVrcQ+b7kcDcQOi3b7ZZlCs9Op+USLHL3zRXll+iCag3kCu0qWZj7CVEZ+CqPXE8khKGn9+aBtsf+PLTnKNU8koVAr7V9M97hXayRxJmJUbIfEGCdAwGSp3LpbjCNs8+SSp7vPxuTz/nj5ruzk5LR2zNhpGglQFP4tPfWRPClFLmf3VqNtnGpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=642XpWSVa/tKgBFsfAqTqT8na7S7DdKK3/wSpKrLpNU=;
 b=WUKKdVT3pwSUK+x6jNfkjs1avpTiFX7YYl+pewdCuwMUJoX1QLwUFP96AqzA5KuJt1RRl5LiO6mafmQ4OHc5yg4pwVHw2KmyUMQAH9JTBaz7sN1KaOrAIRor7P0ku4KojRtQT5qoJOr+rWXkWxJr1iBIbCVhoKqeTMh1RPLalbXx7ieht8nU29uCGW4s2XXC0Dpqjy2cTj4WlMrYjcquv0wkgQMY5gGlOzc1aN533wxaOP+0qmCsj4STo9pTvyBwTT1lVEHR6WpvZ2IHhwXV2hV/qzJASMYoejLbk/EhftK4tHhvigQhWf2jh5MYVFoH5HzvVkeJEKgAHql6ObQrvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=642XpWSVa/tKgBFsfAqTqT8na7S7DdKK3/wSpKrLpNU=;
 b=RmCD5m1rJGLUlpTgO2UQZB5syyJ9BSaWtmNcy/BI7On+7I94wUW7uIgrNuur5VBFn6KarnmtNBuErsDM1M2WruFyEqDNbSx7Mm8y5s2c21kcfKM1rAYdifnLpEDlMzDygPyqQ4wWRFld+Pb9zKhYNLbyZtEkRBwuhRTfSwwNK/DtOgPhMPKgLPgEqhrzlVbjmf5RGAAa/x2fK5dBGyOqbp7qi4DTLYt0hFQFNIROFVV3n0m5ehr0HLhMoQlAwNsGGw8qX3hZGNVyHrEYmkt7xX9zwyrRmo22dBtow8E/LxRjj3d5QJLuBrbr1f+JhDQLXDbTC0wFimdrmMO5O4AIkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DUZPR06MB8773.eurprd06.prod.outlook.com (2603:10a6:10:4d8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.23; Mon, 26 Feb
 2024 11:46:10 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::b5ae:8355:acaf:29e0]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::b5ae:8355:acaf:29e0%4]) with mapi id 15.20.7339.022; Mon, 26 Feb 2024
 11:46:09 +0000
Message-ID: <b5ebf160-6562-42e7-af2e-172702e39686@vaisala.com>
Date: Mon, 26 Feb 2024 13:46:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH 2/4] python3-pybind11: Prune redundant
 inherit
To: Khem Raj <raj.khem@gmail.com>, Tim Orling <ticotimo@gmail.com>
CC: openembedded-devel@lists.openembedded.org
References: <20240214082449.3498259-1-niko.mauno@vaisala.com>
 <20240214082449.3498259-2-niko.mauno@vaisala.com>
 <CANx9H-DYRrFpa_sfzqbthTrq6B6vzuOBiz8DA9vXiU557gH6_A@mail.gmail.com>
 <CAMKF1spRz8YYP1c5P1p72L3LLVSdW5wTToZT+7WDkkhAwJP=fA@mail.gmail.com>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <CAMKF1spRz8YYP1c5P1p72L3LLVSdW5wTToZT+7WDkkhAwJP=fA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GVX0EPF0000ED8E.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:3:0:6) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DUZPR06MB8773:EE_
X-MS-Office365-Filtering-Correlation-Id: 93bd361a-abdb-401d-b862-08dc36c08681
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/lDYNu4HNhg8F/B2/slG64bS018PYWef+ro+MMBRZzRvF09ms9AUEvQK3R+Ywvm1wZCksN3GXmqpjEI4Qr5nYgcKlvO82lKN6oz98cBnT6r/YYEnb+2fN4vh7sjrPrTQCBmiILBwBMe69lkv20+IF01CORg9QT/f2inLcs5WOGrG3aadLcmiNZ61U32kr9pAM5w0B8I3b9hZUhQgarHWzAlgdgd9ZurmvmIK7omxnLaT4oX6PobDXKDlNK566U3oREt7CnjvDoH2+INFpuNYcFU5Wj0K852wRp0BkfxScNCJkaooYzreFfsoDdVLHHPEaaS47UnC0MZ1Q6P8YN6Qlq8tSEnCtNIXQDfshvcGE8trqX8L36YhfjwufsLS+ezQiif9Rw+giN1Ikjtlgr3SQCT0VjuvlsL0/7ZX5tULa5Gz5zM/TatSITpKpUoZberja2rsHHjNgVKTEOxc7cJxgaL+776v1pePZ4B3NASCx6kIpx1134WixbRjrHY8qrxJNRxFmOQuW7eeDucfc30/taKw+LqIj7KZ9RW5+FEnX1SqtC0CSblgE8+VBmb2vCVLAnu+iTvQe9Z2fBh7oSmvvKrPf051fICvcpyWpEOTm/1fO27NOBg5ErEU6zvAnMD5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?u4/ShbQcU98hDFckzJkgMlgWEPlMm9hVwu/sfY6dBwelgA0PKfiHzelOcOvO?=
 =?us-ascii?Q?D9INIP0K9roqNLLQUtKi1c86verbZf649w09jZBOJv3W+XdhEhq74qoHiErD?=
 =?us-ascii?Q?Xv8SUB7hHXLg87BcnnmZ8scUoY9rnERqYGzydB2YAS0pW0zv4zLDkp1Z/HyD?=
 =?us-ascii?Q?g0WQplwTznJn3/Qf0+UUphsOTYRgogYBsLjd/eIOVEzVBb3rmTsvB2Cb+pZ3?=
 =?us-ascii?Q?JGsftLl4eHmdoQ1wlPo35n8VfY7EFf8nYrlozCLr4h9IMBxTgTREu1JBdfRc?=
 =?us-ascii?Q?O7mR/gclBwrP5IMVLq7Tz+uxUfQ/lSOd0oJeGcA8C8JjDh9R1Jt5EtjYUuIh?=
 =?us-ascii?Q?12VWDVufte3orucep9Ur9aYAzfEXZl09GJkjhMvMTphJrpaqQH51C9s2ZSnI?=
 =?us-ascii?Q?y0VIUX4ahlSp3RnvVcbJE99ZwmGKZjpF9i9PE/loGtk1w3H+i24DjHjlF4bs?=
 =?us-ascii?Q?WLVt+0MDgH/9yV4SmNMFKvNa8/YJS6RxGHmVsI0P90KdWcjZdFwyb267UVWP?=
 =?us-ascii?Q?cwuv8S78pen7s9fIya+OXAC3Fb66YkR6hLnEu+xDfZs0sYso6LAWd3UL6+fn?=
 =?us-ascii?Q?wC3HWr0gKaDPBOlkfqoH9IZ1ynoYiES2QTTq7P1Nvo067dEUSL4OXA3hxQLP?=
 =?us-ascii?Q?mMstKdlNTa3qA+yjQDbcmhn6hRkS/pRCEhDr9UZ3lPjb+m0ekm4RyvTKj6fr?=
 =?us-ascii?Q?cdVKc4McNLgbGEmiSPoOPs+8n2BQBOhPIkicvLv6EANAusavxPeBO6qZk+VQ?=
 =?us-ascii?Q?47+VPDXCBCl2cVoihLsQUSvpfp+MItJk0Ldeh3/BlKuDMmXJSdkMVSOU1d1B?=
 =?us-ascii?Q?foAOPJU25jwc1c1guGw6EOTO5cUGKYTn1bI7cwjaz/XCm9V3Dlv2dOeNNOUP?=
 =?us-ascii?Q?6/RwGYxULTcU4JnT0RwFcO98S5l539iCU/X02GKu+MkH7v+i84Ub/DriK8ck?=
 =?us-ascii?Q?0nHB+8GXfvz5HuVz6JCUE80HexTQ6heZfC0l6Co0YmqQtI2Wk3sr9i5gbbWI?=
 =?us-ascii?Q?/hlBX+DAOX9Sw2l2iTIOe/7ffG1H0772Dv+qgH/S6tVVnp0QtUif88eo3R9I?=
 =?us-ascii?Q?3DYxtNGU1N6d/Kd3L5tuzazLP0tpA3wK1CzrCjquXesGPRffI+zwEjis6X3Q?=
 =?us-ascii?Q?jrEF10p5levu1qp9TxgR6Z8IYzHjinxos05TcwuLfc5L6j60msdBLAAOeflx?=
 =?us-ascii?Q?bR2JWfLeQLtJzdJ5trCAv0eFoDtlKCnTCvGjSLln5X8do+9NZc7ZBfjRAutI?=
 =?us-ascii?Q?WUwsQPOOxMoOieRjXOuLKW5yys/v4LIvhaPdUmHSdhGih93JReybXfhfuJT6?=
 =?us-ascii?Q?jPmZvWAG60GQGawlxwEZktxiL/tEnBsrDUAqZMZw9clcYyYFMYme65u0J+Y8?=
 =?us-ascii?Q?qYqwIanQMRtlAX4QD0CMi+avb5hAsGa7ObjTAye2yWnwD5tmpXXYwdrgUu2D?=
 =?us-ascii?Q?AOdKQWaGbEv6Phh0qz6D7ZNg9skPnsyyRjS52Ronp2jRWcgjIJU3efR/5Z1h?=
 =?us-ascii?Q?Q948XoE8lep1rCfwaCIeg02RxvNVSABD2vve6vWZp10Jnl10VtmqpcTKyNXk?=
 =?us-ascii?Q?BBCXOV3jI3pVEY6wPpKufuEUAMNG4Z/8QUpSkwO8i+6PkH3bIddSdtSA2Dt+?=
 =?us-ascii?Q?ng=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93bd361a-abdb-401d-b862-08dc36c08681
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 11:46:09.8990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ay820lKhwh7n2G1O0V3tiw0ZHXAPPDaNLRPffRcBpDdeZZa0x0ozBqxnPzmozNppNKtpKzHQBTv/uFZH60oQEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR06MB8773
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Feb 2024 11:46:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109035

On 15.2.2024 5.39, Khem Raj wrote:
> On Wed, Feb 14, 2024 at 7:30=E2=80=AFPM Tim Orling <ticotimo@gmail.com=20
> <mailto:ticotimo@gmail.com>> wrote:
>=20
>     On Wed, Feb 14, 2024 at 12:25=E2=80=AFAM Niko Mauno via
>     lists.openembedded.org
>     <http://lists.openembedded.org/
>=20
>         From: Niko Mauno <niko.mauno@vaisala.com
>         <mailto:niko.mauno@vaisala.com>>
>=20
>         Inheriting setuptools3 implies the inherit of python3native, so d=
rop
>         the latter inherit as redundant.
>=20
>     according to
>     https://github.com/pybind/pybind11/blob/8b48ff878c168b51fe5ef7b8c7288=
15b9e1a9857/pyproject.toml#L3 <https://github.com/pybind/pybind11/blob/8b48=
ff878c168b51fe5ef7b8c728815b9e1a9857/pyproject.toml#L3
>     we should drop setuptools3 and inherit pyyhin_setuptools_build_meta
>=20
>=20
> Good point I think that could be added as a new patch

Thanks, submitted a new series for addressing this issue:=20
https://patchwork.yoctoproject.org/project/oe/list/?series=3D22759
-Niko

