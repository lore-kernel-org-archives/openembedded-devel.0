Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E47CE8372
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 16:29:02 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.130])
 by mx.groups.io with SMTP id smtpd.web11.59601.1727713738383524773
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 09:28:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=rC4HerGz;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.130, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kvDS51lS8zoQqLP2+xeQ21WiqQSnRpEK8UdIxCCfMjKQnwl1c1EVS3ajMuW38TQut3nVwoSn9NiROls13TqIAuDZgXpeq9RnXeHbf23MlgrDFF+jZ4CAytyjtVnlNxk272fswmyQDanrz4jBozUkUI9Xu+RJP3hduedqDZAJhEllj7sRLA4LRK1CZ77+HfUR0poRERQ9LNKZPC4Pboj5iGnj9YduFejwVq+3q/Y6gj06TUF2Q0zBqi4YbXWfkuc79PDcgHOrIpaZnLMwoJYnsstWh0JcYKeNU83mjnMVod8yJsfaAONm5vxup23ny7m7yLYj078cdA2pdtEq3Dw+GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTxTycX3EqK9p2pD1dH2kwOzZfiZMy+SEBHULSfCq2w=;
 b=XP9K3pevhkzk02gjEeUXQs2P+OBZQBCFO0ykXsIg5aGJv7yAmM8VguMi/suT+FHCJ8WyD3zblIrXuE0dH2imPKw1MHg097bKpugUm7cRcJpI5vT+XUepZuHb/lnGtyBG+EZLjLj0IoBFRqOJ9R35lOSRc7hYOnZgeIZAFg59KICWtEg4zclKobkMYlu3l3mQa/KYWBtTwaNFo/E6SM3KpkWVbccTtYmI11/h98QAx0mXVNPclKi3oBW8faF90mpWTQX+njoqQozL4cquJBqYkO+zDt6T6Mmb8llmHIE10tX3i/gWItZDzWRmfrp7e0q9C7XAFxuG0I26EaadI3pb5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YTxTycX3EqK9p2pD1dH2kwOzZfiZMy+SEBHULSfCq2w=;
 b=rC4HerGziw86ha7xPAmf1Fhgq30kigZPa/yaddMvLF3yrewEp+Eg4GfWTXOj39PwDjjjSOvCDjva2kn2oLQRpXqdbELaQ24LDTP2weq2YIFyBuIJM44WW0MWLSEqBtLg/bm3Kd1456eU2ixAFn2Do6oFITHqeuLR8OhomMrFAuYXr3vqZii/Xdlz4+vXL6wTU28OtK+ru94iGKO8trWDtNXyNBfljH44Nz6lkPlxXNoYifwz8GG5Mloy+z4xJgEN1Zde9Ul4l1Cc2zx0QIQ8ibifacm8YXNm+2ymgoWy2NTXvYmaN6cSnpLX5W3VAfOCC4muN1DDGt9JL3/tItOaoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DB8PR06MB6426.eurprd06.prod.outlook.com (2603:10a6:10:12a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 16:28:54 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 16:28:54 +0000
Message-ID: <1cd00a33-a0db-41af-bd9c-1a567626265d@vaisala.com>
Date: Mon, 30 Sep 2024 19:28:53 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH 1/4] mysql-python: Remove obsolete recipe
To: Khem Raj <raj.khem@gmail.com>
CC: openembedded-devel@lists.openembedded.org
References: <20240930120524.2051403-1-niko.mauno@vaisala.com>
 <CAMKF1sp_0-6Ep9av_PMS37EfDxKz4vA7UswcY4nPbgPzTjLd+Q@mail.gmail.com>
 <5853cef6-3edf-4614-9b0e-fd572b6286d4@vaisala.com>
 <CAMKF1soMOpdvsV7gf7c82YdFaV6UvGHX1hznRifPiu0qnf_vhQ@mail.gmail.com>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <CAMKF1soMOpdvsV7gf7c82YdFaV6UvGHX1hznRifPiu0qnf_vhQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR04CA0119.eurprd04.prod.outlook.com
 (2603:10a6:208:55::24) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DB8PR06MB6426:EE_
X-MS-Office365-Filtering-Correlation-Id: f95b5526-e2ca-4962-6dbd-08dce16cfa13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7965JR/Des1kahodsgoCQDresK+DanzzreyvhBka28WeDdMbM8kH2qp3+eRu?=
 =?us-ascii?Q?odldTUwwEVM4iAAKyFjnA0sFdzQNxdFmnfJEM9QWITBSREVqZEfqweIxGgSk?=
 =?us-ascii?Q?Djo3QC5MsNFYtWegVttJEbCi45NVuvQKYT9TAVn8e/vKcdGMWQJgNloOvqBI?=
 =?us-ascii?Q?50d7GK7L5oRaxxGXsBcU88jOsD5eWIMmghFeHOo4HoVxcNzfUqtHc8rhVs9T?=
 =?us-ascii?Q?pikNEntAg1UFONM59Ub0EhSJtn6X67x6DZKollaOv5RIaraxBMPITpYsJBlH?=
 =?us-ascii?Q?2FBO3h3pdMfLtnXX128WiXnV7Nveh92qP140wAGz0rE9o6ke8G6kuiG8Gx9H?=
 =?us-ascii?Q?B+Z7pwb7f26B4J1+6eYWCM+JlrZ8szhSEPTqlSVNXDfNaKrzeBnmDsYM9d4t?=
 =?us-ascii?Q?OUhEj6mqaAgmCvby7C8acENbdThdJhzbs6U6Ek+Y9KASDC1w5eFnUFXNAf2Q?=
 =?us-ascii?Q?V3gDzohkzOqaiGldGzGnqqOdZhIwqUDtT2WevO6aukER/rui4eOTF1byDYu6?=
 =?us-ascii?Q?blmfA3I/OzCtNUWcZ65TLNrO8wmmbOj0WuP3sEplmsnzL1hSfNVC0BBNsJlB?=
 =?us-ascii?Q?4cc6Azm6TPac+1560c9lFFAr807tZJoQ/fGLsZawRK8mJVlOifxqqTfmeZUf?=
 =?us-ascii?Q?mlonhnhv0e9FsTC6bUIxPIO0ZhvRwDyjYk3hS+NmCqLzv8n0j1GMz461DWJq?=
 =?us-ascii?Q?v00CutjYLh95dYX+b4FOigWmEnUcBMsisZzDxKcaSmX7GNNyBrLTyLt58eHc?=
 =?us-ascii?Q?zUYNNPqpV+LWuYbHdQbeuZfHuVepBIP17lGWjiy6iJq/CVaU1fwFICmFkK5J?=
 =?us-ascii?Q?BBM0xJbGOEOUdSyVxF/u+MBX75EbJgR6LjXiGnPrwhXe9HhvfIsfT09fWUci?=
 =?us-ascii?Q?Alr1yjEZViDAuho53mpCUkK4gLVD+TqpVuCCxScNhmqKwQyVMwlyJbPeMbWW?=
 =?us-ascii?Q?IcaAkApVgTlMwNJqKfh7fSK0OAIcbIetsUoMutyFE2lJuPUey4+sY5kl/EI3?=
 =?us-ascii?Q?lhSGqIFAG6aJ0zZ8YYwtDzx0cMT1blcNQLvxiZyDDK6ctMKUD3gvvvA9Ngk9?=
 =?us-ascii?Q?JQK2zf6XT+ckHuMLHcvmXDbWPOETi8miT//3k0YLLA9hVuCduCTN/nMubqxo?=
 =?us-ascii?Q?LX348VbKWypGoY7fmhHg8UwkG7N/gEsOqhYHCxqbXz5IZv72RGqdGsfDYKDz?=
 =?us-ascii?Q?U183QQqnb+W6ejeXAwqgoDDfB/M5KTbbVvdKNA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4X5/VZc+7K/IhFGtoLxlhJS1ssHdu8rcID3544hI45PqUYcAWzgx3EZruJUu?=
 =?us-ascii?Q?m+q1oRw8ARujoTmx9QshY/Gm3st+saV6m8Zg1qvbyut7bJZ7GmdSR2UB8VdL?=
 =?us-ascii?Q?wgbevQmbR33AGeDGe6/PMKc1sm7XH+1POfhoOBT0nENsi+j5KCoGe4P3Jo5z?=
 =?us-ascii?Q?3UvxNnKYXxoW8thK+CFpGS7vK4/hB20y+VlJkVi13Cix6JTB6AG+mG3I5Y/s?=
 =?us-ascii?Q?cymB05u+iP84M6ksn9NqqE2F3i6ae+aZ4FgeFWD7bSxdjkMJZZmRFB8/PKun?=
 =?us-ascii?Q?WLFllODYoJR2fOGi6xzhrimr/J4Cp81cDpbexrGCNaU/dk7DgQRd643J4RZp?=
 =?us-ascii?Q?7PShR5O+u51MpOFtPiOPTmljuA3H9yLWgLYIgSIFUzbP0OdZC6t4i7Rk26XH?=
 =?us-ascii?Q?C3ZEfC63rMX5QYofhkP4J9A1qLx9pxdTG5EPoCrF3BdXwwAFRcRVTQVQxVAJ?=
 =?us-ascii?Q?35V24m0b3GQdw3OvCgedh3TxPkbVnvKmUbUp2auo/rbAXnUEitru7slVyLUf?=
 =?us-ascii?Q?dpC9kcrxjgDZBOq/Bk87F1hprURFotRsXaKQbAQtXqIW9CdFNz0j06lLe/J9?=
 =?us-ascii?Q?qZWiK9b/06c50ltqN1ztRv5QZDqZwxClzluzjxYZJ5sFnKN0dQGRiMXDYMTH?=
 =?us-ascii?Q?AnrbWNkbEOsJX/Nqs6K50/+JQKXxh6vUYiAgiXiMotEYT63yV+W7/2fXJc2q?=
 =?us-ascii?Q?t7TByGozFy2QBvlWgrVKVdRb/gE3IP2RkAGaXOd9G0CSMs6kG4hc0WWurZlD?=
 =?us-ascii?Q?XcTfBXZwRla8S6KAlvPxiV3l6Ri3EAAygdXyegPFsFJ4Nz7Q6pHqx1NHnhJU?=
 =?us-ascii?Q?dGkyRtVnyNirKWmFiwgRjz3sCuo0v7V+uX52a9Np8y/1bzyRh3O6a9fOITwo?=
 =?us-ascii?Q?E6lgrCXe6+zOM7VxNaWYLi4b7gIJHa/AOW0RA1t6SQLKcAzdaed5JRzBVI+z?=
 =?us-ascii?Q?5RWuArQUist9OI8oyG2Hf9Y17miI+F1CkgN3yrTfqD2f0g6jrVJMElxTltRZ?=
 =?us-ascii?Q?g7ZPRAwuptF3o/GfjpI1LpGZfEISDbil7KtkxVkO1xFyiKvno5qDey/qMOf3?=
 =?us-ascii?Q?A6946b7kFOfd33Zn+fPOvCHN2C64sgllsS3MyNew9s6cXdHaaMyv0NFNs8LX?=
 =?us-ascii?Q?64wGmWalxPwzQCcur9m37e6HnESMVSsn4z1Elg069DD6Yeu1/JFB31jWi852?=
 =?us-ascii?Q?JjP8Y21ECPH+dwGrSAh6r44r/J7OLYG7yvq2xEIxon3uujlF6rZN4m7kQ9al?=
 =?us-ascii?Q?gB40Qkdb1n5q7ffHBMZ/mUtV7EpMgtvy6hKjPz1lmHeMWfx2CQqT3en8DTyn?=
 =?us-ascii?Q?C6zR08MiubjKW3XJwdkMdj5KTeKzJsqwhigRxcE+tNdk56SSJZyfKVHEcJQv?=
 =?us-ascii?Q?K2ecDbTLxu/+TtK698OALhdcAE07tKH3nl4/osvUHYqKbxh8fFfdDrLTuCFn?=
 =?us-ascii?Q?W4rSWYbO6UpxQlqd2ophxRA4r5sx5GzxzkMfr1q64txsFxkrAeG9Ppb/k9XA?=
 =?us-ascii?Q?nOqktk8bg64Tdpc4J6aaslKatviv/+R3DLOnbJxddT3QIqJBmqV7aUgJ0Zte?=
 =?us-ascii?Q?AVsOUxY+ESfhhkkYI830kFlwDHzZ0gr2SZTFwHskiX0b0lnPyV+bKU/CUQfC?=
 =?us-ascii?Q?8Q=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f95b5526-e2ca-4962-6dbd-08dce16cfa13
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 16:28:54.8819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nUu10FxCWNCHDGsiuV0nqensIK2IEP1F+LB6SBQGdnzyRrwpCCzdaV8Fv1I4t7/xM+t0hlSJj+SSjmrxtGOrGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR06MB6426
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:29:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112613

Thanks, submitted v2 of the four patch series to meta-oe.
-Niko

On 30.9.2024 19.14, Khem Raj wrote:
> Rebase your series then on master next and resend
>=20
> On Mon, Sep 30, 2024 at 8:34=E2=80=AFAM Niko Mauno <niko.mauno@vaisala.co=
m=20
> <mailto:niko.mauno@vaisala.com>> wrote:
>=20
>     On 30.9.2024 17.56, Khem Raj wrote:
>      > Thanks for the cleanup, it would be cool to shed some more perhaps=
. I
>      > had to resolve merge conflicts to get this staged into master-next=
,
>      > please check if all is ok on master-next
>=20
>     Hi Khem, glad if I can help.
>=20
>     To me the following three commits currently seem to be in good shape =
in
>     master-next:
>      =C2=A0 - "lio-utils: Remove obsolete recipe"
>      =C2=A0 - "telepathy-idle: Remove obsolete recipe"
>      =C2=A0 - "cherokee: Remove obsolete recipe"
>=20
>     Unfortunately with two commits I noticed some issues, which I will tr=
y
>     to detail below:
>=20
>      =C2=A0 - "openlmi-tools: Remove obsolete recipe" commit in master-ne=
xt
>     currently removes only the RDEPENDS line in
>     meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
>     <http://packagegroup-meta-oe.bb/
>     remove also two more lines in that file which reference
>     'packagegroup-meta-oe-extended-python2'. Furthermore, it doesn't remo=
ve
>     meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
>     <http://openlmi-tools_0.10.5.bb/
>=20
>     Please see
>     https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-nex=
t&id=3D7b178cf9ea8fe2683741f75ebc220f0f70cb45f8 <https://git.openembedded.o=
rg/meta-openembedded/commit/?h=3Dmaster-next&id=3D7b178cf9ea8fe2683741f75eb=
c220f0f70cb45f8
>     vs.
>     https://patchwork.yoctoproject.org/project/oe/patch/20240930120524.20=
51403-4-niko.mauno@vaisala.com/ <https://patchwork.yoctoproject.org/project=
/oe/patch/20240930120524.2051403-4-niko.mauno@vaisala.com/
>=20
>      =C2=A0 - "mysql-python: Remove obsolete recipe" commit in master-nex=
t
>     currently removes only the recipe files
>     meta-oe/recipes-dbs/mysql/mysql-python/0001-_mysql.c-fix-compilation-=
with-MariaDB-with-10.3.13.patch
>     and meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
>     <http://mysql-python_1.2.5.bb/
>     it doesn't remove the two lines referencing
>     'packagegroup-meta-oe-dbs-python2', nor the
>     RDEPENDS:packagegroup-meta-oe-dbs-python2 declaration in
>     meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
>     <http://packagegroup-meta-oe.bb/
>=20
>     Please see
>     https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-nex=
t&id=3D1a5d5087f66ad3cea99473223971aab9391ffc94 <https://git.openembedded.o=
rg/meta-openembedded/commit/?h=3Dmaster-next&id=3D1a5d5087f66ad3cea99473223=
971aab9391ffc94
>     vs.
>     https://patchwork.yoctoproject.org/project/oe/patch/20240930120524.20=
51403-1-niko.mauno@vaisala.com/ <https://patchwork.yoctoproject.org/project=
/oe/patch/20240930120524.2051403-1-niko.mauno@vaisala.com/
>=20
>     Kind regards, Niko
>=20

