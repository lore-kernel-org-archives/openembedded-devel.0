Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FBBACD4F4A
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 23:08:01 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.61])
 by mx.groups.io with SMTP id smtpd.web10.64291.1725491273211046787
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Sep 2024 16:07:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=YcPRgDOF;
 spf=pass (domain: axis.com, ip: 40.107.21.61, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xz022XI/ECaTJuz20XDw1aJoI4a3Xo/LAAEydBEBgiKBp9dWobvn4907amKNs8GG1e6vNautAXVzfKO/j0flJSe1hJUzH7FUxkG5chw0ETIwWXBb6PyxQtV10EVpRFxWRpb53UT+e2ocPOat7Syg/sDIuA7WKnHlL5rA06J6RoIr/qQ7EpzyV2Zf70qwhlgeYkgglDvC+or9DAhFmw6QATdi4ogjKSA1z2Ax7kgJ2+/bTU66aDOa823+rSrxRBQ5NphbfUx6bl6ZEhYuolvYw9+vAk51x9V+Ds62DJROOjqViZoJkYFEVa0gXyeV50OXdCx6Tn6hj7x6RqhG2dmDVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=liBVK9fl8Z3QJpFNplFTtaw/1atexWf6pOvFueBrt+E=;
 b=NkdI9RjDEWsL0Ir0rg8uvFo9lGIjcqh/4Q9BGfmbew4dnWaq3GDh8vWGXGMY3rzyPRxF4n41KU8F+paKuIl56IxjOKa/Ims7u13Q9gi+Y5f5qVH38lnP4ILi/FaS77QHHtOvdc4X4BbDLdksx++8PlAikWEbU69b70Wfa83EiKoTWho5NBjaeLs4YNaVCd/sX6rrhaZOeXPqNBxiSzN+nKupV/KRaYwTf+iucojXOurQZfcvfa1dxTZhmLYDgWwGw2cT+dRJLJVAe4JmCYeA7+arapCoC+vHWEtDr4PdAr178i1Yd9rd/iuAAkPcpZ2/SHOyqkAU3fIZvc9mVtDR1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=liBVK9fl8Z3QJpFNplFTtaw/1atexWf6pOvFueBrt+E=;
 b=YcPRgDOFk70wSpVFNp/Ld/1anB7BCyx6EHlvNw1m6jddLXvQgD1NgBKT3n5kaW63ZzqjcQCXrsSM3gFNw4XruybHnG+L+gRBNC2LY8ZwBD6tD9a/XxYCPeniE4N0xgq018SDWf0VTExYDMZQ+y6dEe1P+74oSgoAC+hEexIO5ic=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS8PR02MB9459.eurprd02.prod.outlook.com (2603:10a6:20b:5a3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 4 Sep
 2024 23:07:49 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 23:07:49 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "yoann.congal@smile.fr" <yoann.congal@smile.fr>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH 1/2] polkit: Switch PAM files to common-*
Thread-Topic: [oe] [meta-oe][PATCH 1/2] polkit: Switch PAM files to common-*
Thread-Index: AQHa/x1bxzs2K26e4kyapQn6lPJ447JIPwGQ
Date: Wed, 4 Sep 2024 23:07:49 +0000
Message-ID: 
 <DB5PR02MB102135BF13B71C080CFABD5E1EF9C2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240904225341.2699885-1-yoann.congal@smile.fr>
In-Reply-To: <20240904225341.2699885-1-yoann.congal@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS8PR02MB9459:EE_
x-ms-office365-filtering-correlation-id: f00f26b1-a451-454c-48b9-08dccd3665b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?XvM1VtUDYyb5+WtxVs8W1xW2T5rU8ig/tZnixDPtcdVyZPhHEn7jo5Y+ZFAI?=
 =?us-ascii?Q?eNiTtMUMPqwPPf+REySpccS8cXv0fdFDCJf9QCFB0FjWYLIq1rv0Hc7OIhhC?=
 =?us-ascii?Q?ZwBytPmEJucuz6Tbtg2nZAIzv4ek/WBLRUDFQYfgh2wDgqw9tSrkvkFadAF4?=
 =?us-ascii?Q?WskXcPW7LOOcYFBN1ri/GEPEp8NOz+XnvvA8vZCVM+hzvjtgoYZvXPiJKujO?=
 =?us-ascii?Q?Qm65E3YGOa2NyQ/ouqg7sZnsCKHuaDDrqxx7OYeLRfZfHJBSpLz8QBx7ZWMD?=
 =?us-ascii?Q?G2zh+RTCw5hl32Jx1te9IcLSqQm3PuP1CwRrFNGjQ2jM9owA5/660SbTnxKS?=
 =?us-ascii?Q?9XWE9eeVYcyuKOHVApYZxJ+pC85ZJzQl6y9tHxlINFfr70nR9SwrgjTqlwTa?=
 =?us-ascii?Q?2hivTSADBJ3LEEQz7lYivJHxjoWzVpbRzIlbY3dd3c2+KvtJp+SFtVOB34ii?=
 =?us-ascii?Q?nUqdic72peNinQDALheRyrJ6VEIgChJBaGrJrPRqzTNJfK7o4NJvhEm8KjlX?=
 =?us-ascii?Q?E3F2nLj3LQ06iOjKQhNiBeDqvJiIZzWy1nvZ/fgrxOfe/DHqnJI7pqm18E0g?=
 =?us-ascii?Q?b8QL4T2qjvYpiAF7ichMMrT9QST2jkI9ge0pPQ8eICxrV9tMtx/Is+nldJF1?=
 =?us-ascii?Q?NzqadWCtcZD9o++92tg/O2K0FO1cCnNlJUWaufyVMkyQ2RHWAIC3A6hcWKDt?=
 =?us-ascii?Q?D1IuR8txWBXU0gEVqMiQt6spP7NNEnMyspPQOBXfTuDiadWgm8Ae3y8sQgSU?=
 =?us-ascii?Q?Le7o0oqIQAf+A4mV8VvQfGMpuEmARCf4pTDBsIrmRPi3bbzpOElg6oWkiOdf?=
 =?us-ascii?Q?tucnnRr6VmKJBzHEqzeREFBz5ct6EyicgxmTmGv0l1YzEwvIGK383nnfn2Yk?=
 =?us-ascii?Q?St3xD4hJNafhiS/5Oww+BeaFp9mWor1cDCQdpw1VEpltZ6DvmVbg6joZ4v8T?=
 =?us-ascii?Q?5FSLDygsagrSzSYTuIiE4KtKN6lK7uHZzjhOM+oKTK5LyI6F2Nkf3fCAEpcw?=
 =?us-ascii?Q?oGKYxEQDLjWNnmgrPue64zh1ZFiQ8tMr0Jq5g4uG+FHclGtw1daMcLQXDFQh?=
 =?us-ascii?Q?NGPMXbZkpZ+ENcHOHj/XuPAC2DN40+jyB1zf4xCJnfH813uRcOE8m9zsG9Ss?=
 =?us-ascii?Q?NCAFhhisTlhcXUJBIPN+Sze65AjWlL6vVjMXHI6wo6Wv6fIYrCa25OiOu0HO?=
 =?us-ascii?Q?1lCw1yGcBjtp3uvgvJnFH5tcDLVLNHtlrqy+KpSW5RBxtZCXh39vfrvuA+A0?=
 =?us-ascii?Q?veibXzPLDMiwIEN4AvsVyxFWj2/g29Khnn5H7BDyV41Os2NMWnjIhXGowdwZ?=
 =?us-ascii?Q?zcYDEzh34K+jwTSIZzPbs1CkmcUW5Ls8jXRYpDWe0n2dfP68cs4fZGWkzYYM?=
 =?us-ascii?Q?45KuM8rQfuQht48h+YWlbLsGWgNTzEb/Udejzlv6uqtzQH5akw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?77PjC55cFO6219Gf/R9NnagF+kCYl2zjIi3h26Q+10j12ANKB8dd6SgPjCFV?=
 =?us-ascii?Q?5ZouZxglKtl70qJxM4RUhrkyR5SyjLV58Lx/5XNEDeKu40oTVTdkjjDIYHrC?=
 =?us-ascii?Q?/VeH5IGC/BygEwnWLuOgLLMvmnME0Lj0tT1FiaLrbHxC+FfVVU5Nnuqs1s02?=
 =?us-ascii?Q?8ebTEApvKt9l2c93GHIAmew+N2i7wAqWuLaPrAka8Cb9EnkatD+D19/N7+7Z?=
 =?us-ascii?Q?1o7RqMxJQuKKM+reOkPxg2r3RIz3fptCtk1MMZ1dQ03ynlmrjmj58JZDmp8n?=
 =?us-ascii?Q?i0tygvcC2QZyh8ka1WSlJuSRgSl1iuXR2nZXA2ksac869om2UYdrAEyRRAKy?=
 =?us-ascii?Q?aNasArYp4meBPMkxVfsQrOeFtSxvW847LXWRth6Tb3RYL+usY0FiFRmi2MVR?=
 =?us-ascii?Q?OwlYgRMkhoNtHzCAy8LmoK0OPkBv+VuvjKOkWc+mxaR7VUUvcjtT0WepSx5x?=
 =?us-ascii?Q?Bkun+RdP4ncHegctXw5/DbVOt2IvOx1XGeZdvGkFJGOiFVTmoHEKe9+RNRzv?=
 =?us-ascii?Q?pEbVxyuF+StHtyYW1M5ephoqpavIZgKaCk1JZt8dXHyK1dyRpa2V5iEh1P5O?=
 =?us-ascii?Q?5Em4rW58OcR1T3U0HsezAUxa0HIJrp0cunDSe32xpeN8oxg+FS+hY5ETWwkw?=
 =?us-ascii?Q?lmr6FSnJFA2+LaviYjkuXGj44Y0nQ+mcnUOqyPEGtMQdc9NdDXRqvSNPonzK?=
 =?us-ascii?Q?TpumjbOFZmCKRJAfeDxTsg9qwS6EOmpaYVqOTzUc0aTfpb7lgUX2syoWNHE0?=
 =?us-ascii?Q?3j0v6OIs1AUuFSEr2NIYZT53rZc26xLAdrDNoWgm8CP8yFt9CAqc2u0mkICa?=
 =?us-ascii?Q?PBLsywi+4GW4WDvNq5dF1FYELGZYDUMm+pq3yGh8rMhD5oQUmXBSRYYpvc86?=
 =?us-ascii?Q?OcFzKtwsUbT+lE1Ng2rVqBelpaw9F7jqgUEAok8JaUCZp1WCiaAEmgYmB1ZX?=
 =?us-ascii?Q?RJ6Wkx5whIhRG488jONbPtb3ICc4KoqfBDnMuAoHpgmZa7qMREjEQL15YDAf?=
 =?us-ascii?Q?tePxpoYBjyGWiZ1aq1sueqSxUpTVyDzhUTekhbURVeulQqox4qUJkLhqWrBO?=
 =?us-ascii?Q?lxQMuNu7b5fGyN2sT2PEhb5d80favujXqLifE4T0yzkRQF1s15j43gjfFAcW?=
 =?us-ascii?Q?JlyTw7HOtUaJm3WUvYjLQ1WS/DRDLQ+r2wHlrrXZubB8I8Bw8WpmEVL4EuOt?=
 =?us-ascii?Q?qmjVS+X0GQfCDR3gj5lnjV58JbtVjGN4sOM3y/wUQz8PovVOGaM6GZSVINcL?=
 =?us-ascii?Q?+Gz+qaDojOIeeSxEIE1KR4q1U1c6Vt1rg/mQaGqjWOpbM0Q6fzghd8pqjarN?=
 =?us-ascii?Q?cS5xL9S0IIgag7R5osaE6iIh5nRgRTA2HwNUUtuDJiClKGLR3PJncxmfAMTo?=
 =?us-ascii?Q?JEDj0p898QHgn/eveOTc0SYdo3IZSKiOwMY7AEBGdLCIvpRKuXTodPi1TdJa?=
 =?us-ascii?Q?QXOjXtXkhCRtaJXL1CjIUkvmjh0IIugmEkAuUyHOZRHLNr24KacJOSOWyu7D?=
 =?us-ascii?Q?m6ugWKTig4RLQ0QCypX3z1sE9Ed7tGKA81UoES630fUIYCFhDW1nganm/Wdw?=
 =?us-ascii?Q?jkz2TgZC+pmor4hogHQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f00f26b1-a451-454c-48b9-08dccd3665b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2024 23:07:49.8188
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cCpM1W5P9ybTVWFsyuAX7OU2X9mPzVk0Y5Dg8RgIjRwhQLPL+tqg/avUVRwBOFCz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9459
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Sep 2024 23:08:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112095

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Yoann Congal via lists.openembedded.org
> Sent: den 5 september 2024 00:54
> To: openembedded-devel@lists.openembedded.org
> Cc: Yoann Congal <yoann.congal@smile.fr>
> Subject: [oe] [meta-oe][PATCH 1/2] polkit: Switch PAM files to common-*
>=20
> From: Yoann Congal <yoann.congal@smile.fr>
>=20
> Add a new OS option to polkit meson: "openembedded" and use this to
> set PAM include to common-* which matches OE-Core libpam.
>=20
> This also may fix a non-reproducibility since polkit meson system tried
> to detect the host (compiling) OS and changed PAM config from the
> detected value.
>=20
> Fixes: https://github.com/openembedded/meta-openembedded/issues/860
>=20
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  ...pport-openembedded-OS-for-PAM-config.patch | 48 +++++++++++++++++++
>  meta-oe/recipes-extended/polkit/polkit_125.bb |  8 +++-
>  2 files changed, 55 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-extended/polkit/files/meson-build-Sup=
port-openembedded-OS-for-PAM-config.patch
>=20
> diff --git a/meta-oe/recipes-extended/polkit/files/meson-build-Support-op=
enembedded-OS-for-PAM-config.patch b/meta-oe/recipes-extended/polkit/files/=
meson-build-Support-openembedded-OS-for-PAM-config.patch
> new file mode 100644
> index 0000000000..e0ee8a309a
> --- /dev/null
> +++ b/meta-oe/recipes-extended/polkit/files/meson-build-Support-openembed=
ded-OS-for-PAM-config.patch
> @@ -0,0 +1,48 @@
> +From 7c89b88f0f81ad220d08d69d212c14c6eeefb647 Mon Sep 17 00:00:00 2001
> +From: Yoann Congal <yoann.congal@smile.fr>
> +Date: Tue, 3 Sep 2024 12:17:42 +0200
> +Subject: [PATCH] meson.build: Support "openembedded" OS for PAM config
> +
> +In Openembedded, same as Suse/Solaris: PAM files are common-*:
> +* PAM_FILE_INCLUDE_AUTH: common-auth
> +* PAM_FILE_INCLUDE_ACCOUNT: common-account
> +* PAM_FILE_INCLUDE_PASSWORD: common-password
> +* PAM_FILE_INCLUDE_SESSION: common-session
> +See OE-Core libpam recipe.
> +
> +NB: This is also the same config as Debian but its not mentioned in the
> +code.
> +
> +Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> +Upstream-Status: Inappropriate [oe specific]
> +---
> + meson.build       | 2 +-
> + meson_options.txt | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 302c189..a55f2d6 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -311,7 +311,7 @@ endif
> +
> + pam_include =3D get_option('pam_include')
> + if pam_include =3D=3D ''
> +-  if ['suse', 'solaris'].contains(os_type)
> ++  if ['suse', 'solaris', 'openembedded'].contains(os_type)
> +     pam_conf =3D {
> +       'PAM_FILE_INCLUDE_AUTH': 'common-auth',
> +       'PAM_FILE_INCLUDE_ACCOUNT': 'common-account',
> +diff --git a/meson_options.txt b/meson_options.txt
> +index c2e4a6c..14d7a50 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -6,7 +6,7 @@ option('polkitd_user', type: 'string', value: 'polkitd',
> description: 'User for
> + option('polkitd_uid', type: 'string', value: '-', description: 'Fixed U=
ID for user running polkitd (polkitd)')
> +
> + option('authfw', type: 'combo', choices: ['pam', 'shadow', 'bsdauth'], =
value: 'pam', description: 'Authentication framework (pam/shadow)')
> +-option('os_type', type: 'combo', choices: ['redhat', 'suse', 'gentoo', =
'pardus', 'solaris', 'netbsd', 'lfs', ''], value: '', description: 'distrib=
ution or OS')
> ++option('os_type', type: 'combo', choices: ['redhat', 'suse', 'gentoo', =
'pardus', 'solaris', 'netbsd', 'lfs', 'openembedded', ''], value: '', descr=
iption: 'distribution or OS')
> +
> + option('pam_include', type: 'string', value: '', description: 'pam file=
 to include')
> + option('pam_module_dir', type: 'string', value: '', description: 'direc=
tory to install PAM security module')
> diff --git a/meta-oe/recipes-extended/polkit/polkit_125.bb b/meta-oe/reci=
pes-extended/polkit/polkit_125.bb
> index fe1ee467c3..2405ed6034 100644
> --- a/meta-oe/recipes-extended/polkit/polkit_125.bb
> +++ b/meta-oe/recipes-extended/polkit/polkit_125.bb
> @@ -5,7 +5,9 @@ LICENSE =3D "LGPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D155db86cdbafa7532b41f39040928=
3eb"
>  BUGTRACKER =3D "https://github.com/polkit-org/polkit/issues"
>=20
> -SRC_URI =3D "git://github.com/polkit-org/polkit.git;protocol=3Dhttps;bra=
nch=3Dmain"
> +SRC_URI =3D "git://github.com/polkit-org/polkit.git;protocol=3Dhttps;bra=
nch=3Dmain \
> +           file://meson-build-Support-openembedded-OS-for-PAM-config.pat=
ch \
> +           "
>=20
>  S =3D "${WORKDIR}/git"
>  SRCREV =3D "112752c12da812a163dac67d7f675b60de8f7d7b"
> @@ -16,6 +18,10 @@ inherit meson pkgconfig useradd systemd gettext gobjec=
t-introspection features_c
>=20
>  REQUIRED_DISTRO_FEATURES =3D "polkit"
>=20
> +# Prevent meson.build to try to autodetect host OS (which could lead to
> +# non-reproducibility)
> +EXTRA_OEMESON =3D "-Dos_type=3Dopenembedded"

Why do you need the patch? Can't you just set:

EXTRA_OEMESON =3D "-Dos_type=3Dsuse"

and be done with it?

> +
>  PACKAGECONFIG =3D " \
>  	${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
>  	${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', 'consolek=
it', d)} \

//Peter


