Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95148CF6491
	for <webhook@archiver.kernel.org>; Sat, 28 Sep 2024 21:57:47 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.5])
 by mx.groups.io with SMTP id smtpd.web11.22104.1727560666378021099
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Sep 2024 14:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=Auu/mJDx;
 spf=pass (domain: axis.com, ip: 52.101.65.5, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M63hQPBadC57bwtCL1zknAwHLDkDKhu5BwaOCRqnRU6s6YrnUmW7M89zk3lNxzuTuyfGGWQQMOsr58OVYsA8wQDXZLNCshQ3iZBwR67z8whocBl9idlzcSicLaMKuKDKNVb3U3/aAsqT+pVc9OBpRPG9W8F4EsKeCBFBSESbt2np7NQVvcAJXsNiK1oy7mlCwYNShturdVBXP6o4+JdwP5kasWsCbZdAcxelDKaLv4vHVbTjxaJ84TJi0ebXLXDu3BG9qco7vVIafO1pmTw5dk5AqTD3veof7h2zLe1Vm1hRlPwCkdn0Ht59nH2oJGcypa4PSCO9eziuBj4fc4EzSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=raF/vBR99oluQ71O3jFbImq1NpY4MedQ2durP/qpVr4=;
 b=e74IYZzNBdebuYUX6vN+mVNjRrWF5diJJTjdFU+9Y7F/4bc9s83RIYMeinQreppFPGFdTlVfaP74AX/0akmVnd1aOwovr6IHjncDInEZGk81jMjQn/4cZZFdb5YJiaF7YkSO3lb1WIuTroDgPANp33ZxEm/Mm6H/6bPQBP2r+aQkAs1tRTmVohlc7v7Lo21ScjVfd6ft/1lxYuaAQiopFzKSBBI/HIKI0gQ0afJ4OrhLINkU4efvDEXZ+dTwnFTtBTJqddKS5KAubY1JQmIG6JxKKOnZHLzWVoYqKYbWC0MWeqOe8wrzhdTntlOIFtWoWIguHI33IGbOsjSUDKF1tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raF/vBR99oluQ71O3jFbImq1NpY4MedQ2durP/qpVr4=;
 b=Auu/mJDxx0aqO4vjzPdANXN+HcaEZtLQuZpQvazudpU42meG6pMYLe+cVjQevhxCPMf474kC++KnevTAMOCJLks0VOfL7gRl5GJWXc1Hzp0BWp22mcrOle4sPwlljocLOuW9RwXgxGCYKsiHpXU0qtUaYQxFUyd6g/ZlSsff1Zk=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PA6PR02MB10688.eurprd02.prod.outlook.com (2603:10a6:102:3cc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.24; Sat, 28 Sep
 2024 21:57:43 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.8005.021; Sat, 28 Sep 2024
 21:57:37 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Markus Volk <f_l_k@t-online.de>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-multimedia][PATCH] pipewire: update 1.2.3 -> 1.2.5
 PipeWire 1.2.5 (2024-09-27)
Thread-Topic: [oe] [meta-multimedia][PATCH] pipewire: update 1.2.3 -> 1.2.5
 PipeWire 1.2.5 (2024-09-27)
Thread-Index: AQHbEbULdhhk3fp1X0Wem2DqVuvrLLJtvgWw
Date: Sat, 28 Sep 2024 21:57:37 +0000
Message-ID: 
 <DB5PR02MB10213B5C021DBB29F2AB8CF08EF742@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240928144701.120491-1-f_l_k@t-online.de>
In-Reply-To: <20240928144701.120491-1-f_l_k@t-online.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PA6PR02MB10688:EE_
x-ms-office365-filtering-correlation-id: d99ee3cc-1618-4e47-76a6-08dce008911d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?nmaK3wL8Zt/hFdwrIhjE1fjVihCsQeNJSQHRtGzWSVNTMGRUcDUhzcAa72k7?=
 =?us-ascii?Q?yrwgp5WkTNW87/A7ttAHUs5Nt6aQXCFBL57cOZeusyKN0V4bNCAmgSR6z29F?=
 =?us-ascii?Q?hwmrutAj6FHqvZod9K3TVC7cpghq9Pb7K70+Dx1LdZOMQfFbltMBV9CRtltX?=
 =?us-ascii?Q?vkhcZIMWhNZUsLWemHxHeqvJctQmeCnpEDFfFQkhmxeMsTZY4yDdwwoIgwGI?=
 =?us-ascii?Q?DKgMgew6I1KurhqloTtcZ7gcxqa5fbHR3eNsGtPOmnx2PdDxe5pOOJS7z7Zi?=
 =?us-ascii?Q?2lg1563Blem8VcYSSCxHXGkuppaeVqUwiDRuHWV/1Bh08sxEUno+OQwHh3Wx?=
 =?us-ascii?Q?SdMn7jgftkIrTFchpyLCKOPCJfAQ+XrfAJPEw1usbtlgK660erZvKUF7fieU?=
 =?us-ascii?Q?UgjuRRg2OUbB56ucTId9b2Zuym8UGBZr5LJpvIuMj/c1se5eK4YOraIFG+PN?=
 =?us-ascii?Q?AXs997wWTa1ji+omsjNlELBGkOGm/CN9a2g6CttZ8Pw0aJvgHo5c1h0t1bn/?=
 =?us-ascii?Q?EZ9FSBW0eqGbYUZW0S4ZLBJ6emwzm2xAchcJl+0+3kwrkrIGlTJ7Z60w6PTN?=
 =?us-ascii?Q?GzF4eC6sKOEmjwweOIH7tqd+wfMuXWKXybvQ/VFU+hD8oFyN48Vc0BiG9nGQ?=
 =?us-ascii?Q?+/WwvfP/ksM9dmClU+7ITs+ueLwYXBlqwhdc0eyVxhFIqBO7eYaCPCqrvj8E?=
 =?us-ascii?Q?n/KuXHq1mJrMcdAHHSvCaemx3W7AECT8+ZpRv6ZCV04f4sgKHnHIOu9eoxYY?=
 =?us-ascii?Q?1hpysKuIoxqR1nwWmdrO5Dq45G6e1N68gXZu+0hEL4v7MXSE3onh5yfgkdbF?=
 =?us-ascii?Q?ui1qXWfku+9mAUDYD0Gy7TlSxTT/wiwRTtoi8dNtOt3vqZA7Axlv4M1OmiES?=
 =?us-ascii?Q?+psQb++DQUb3F4YNLl+wb3MjvOWWJsZ42pvTWEVQVOjcL4/dRDkTeefqwPAk?=
 =?us-ascii?Q?qAE+w9XbJ3ekFVgSV5uHTOPcZ8U02m/Vgfn07vwLbvz3830D67SDY0gkmOJd?=
 =?us-ascii?Q?iya48ngKXwMZ8jENLsg0OibV+W+XWycBHtiB21O0DGiVCIS3zo/qd6mu1jev?=
 =?us-ascii?Q?u0ZepPu9MAFTYViqAVVWSt/cPc5g5DVjdJEv/1cTh/gSjJYDe5EKk5tZcHG7?=
 =?us-ascii?Q?QWxco1X0gcnYSj5xp2KFvLlMRUlR/m3zCtt8WOUiTgDnr0sxy8lNBIDdii3I?=
 =?us-ascii?Q?jJTxTHDyygIDsuT6f9qggsdVlkKcqygoDt3sxaHoG1p5Co/hAfu9Wz0f8PJ2?=
 =?us-ascii?Q?9YNT3AKBqJge8zTo+/1oT1Dmw5ukBrPI8PDeWr3FugytFOcJ/wz+AJ4JbjyU?=
 =?us-ascii?Q?xhmfVUaAuftVHcEZj+giUvivvFGU/nbzKKApAnXfg7470Rm4mP/Y0aa9q9x5?=
 =?us-ascii?Q?eETGuca61O/C+PKrjWlP37jiQXxNZ6z3wh4HRysOWvrmN0biMQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?DUs2IL50SJ530EdFR5tHHT9O+LdB9q277CnlrQnvqGsIffcmluDbxPlZSfvi?=
 =?us-ascii?Q?UOB6qKYkwG9vREbPMZbnj6RpQbIUSzWnqZTiDyiBi/LRedgcKALcVwPZKT5L?=
 =?us-ascii?Q?nYM+vT56s1dTVSTH2XszJwi0gxG53MUTqVN5mE4RacV504oq3DI0HYSGYRm1?=
 =?us-ascii?Q?h/fQ9thRT0icJMiUtuQ/j76VBDdmq8aQyBqmBs+sB/bSNJsVHAZPsL68gplu?=
 =?us-ascii?Q?AAJdfOQWjLhGxSaCovreKIL3Em/BpvrBk9k6vukt0j3Pi0Ds4aqcPDtSII4K?=
 =?us-ascii?Q?hj2xYXXsAukSsWvdkq13yoPKecuw4fmolISlXL8yVkPha5pDZyRmwM8DTI2v?=
 =?us-ascii?Q?Kohi3XVKGRwTwp0AD3jig6030G3ytRVpf5rpHpHb0bl27cUPKORJ3PReGxwD?=
 =?us-ascii?Q?+ONV00NICq/Xxsj4N/w5NKMA75R3HGmv8J9gyx8/a+LBgFBVSK7tlSOCPa4E?=
 =?us-ascii?Q?iU7BrRld5olkP0UNMlNE//ESj1OIhiIV8pjfJbEylSwxr6pJXIWDBcd5seAx?=
 =?us-ascii?Q?Oz9OvPl0eKn/KFvMVu2+bNY6kxXf3tjPDCHAXnofprkIXTvkNumHG8lU6T/l?=
 =?us-ascii?Q?kO8dMxN87lnbXHZwgEwHk2IpW/W/q1qPBRIiWkopbLHSo7RWXjm6Z2vjBnGk?=
 =?us-ascii?Q?+tSVK2Xphh18Ld9+9NJiU6YaIYk80EvDgVfIzcEyUfw+gh/PbmPX+plgnZoG?=
 =?us-ascii?Q?Y/oq/7WHuUIn04ASR8hpAETNQVtdaXIu+njhltqvJJ2JlgWEKu6cWgoooSP/?=
 =?us-ascii?Q?QO2o1myZx/qWnRNuJg/dY1HR0Efq+1E5b4QtmP2ccyWrHUL7KLO4bwI3BZhk?=
 =?us-ascii?Q?WN4GAsvDjsaJgaGCezFdfQw0YMSxbSAElW2sVh5CZjOrlfgqWbIhaR5hzjCG?=
 =?us-ascii?Q?95J6EeZcN3UL4G7QCTZJMwj5Nccu+hDdq3VRLZ4bFPtmPFK0SNJY5/x/ayRh?=
 =?us-ascii?Q?cF4Wptme0+iNQF+D8DKh9/j/mqExwEbVSwktZXjiUWAGqw8ruxBGC9lwQHS+?=
 =?us-ascii?Q?wqEO3KEA5jJRbBXHAOCXg07aYXpaSUqFX0DkjP7Djniw6/hszHIJM9OcL9Yf?=
 =?us-ascii?Q?OzmJKYRJi1EjdKohwwrKEYzpkABqVCpo1Ub5bsxXeB3a220rCMIZJ0fnY2xp?=
 =?us-ascii?Q?dbKG8xga2dFOZ+8N1eV5gixQCSygszBC9Br9SvsG9vTLESkRx/NbERVlfGDJ?=
 =?us-ascii?Q?XxSGLzidxhTvS6DBEb1rpapBkE2n0v/DrZDEKOfgd92B2UNqZCZCDHTy1tEr?=
 =?us-ascii?Q?yWm7YNo6+HvU7SYB5R4Lm8PrfPvxiyhZD+jbSBish+24t2pCr7ICnUOIT3CQ?=
 =?us-ascii?Q?WoZQwqXsGRxLzOI4SpWawrA50cndHE4965+B7ktKGn9x1ZGWyAb8Sc8RkOZv?=
 =?us-ascii?Q?UgrkFQG8Ls1aIO4HmFVCgTUsMRV8aAac3Nf1vqqQ/Rcmfl7QlHIEVkBTe5lm?=
 =?us-ascii?Q?378zRmLvzm5AobTdxR1dgXmRukI9x54Hual3VJAQTX9J2wKg5hHIb7DVhBOL?=
 =?us-ascii?Q?gXLdGkHBLjczbqSZpx/4+iVqXNp7NX9oskinVXKidQPj5Ml14YuHAzHx2KSU?=
 =?us-ascii?Q?ns7d+ASwbFwnQh7VIR8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d99ee3cc-1618-4e47-76a6-08dce008911d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2024 21:57:37.8427
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g2lNWWNEmjo2uAUAtcopoj8cOyKnsOjmE1xfAgqXDn6nu57LT730X1QNqAn6qi8x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR02MB10688
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Sep 2024 21:57:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112544

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Markus Volk
> Sent: den 28 september 2024 16:47
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-multimedia][PATCH] pipewire: update 1.2.3 -> 1.2.5 Pi=
peWire 1.2.5 (2024-09-27)

Based on the entry below for 1.2.4, I assume the "PipeWire 1.2.5 (2024-09-2=
7)"
part above was actually intended to be part of the body.

//Peter

>=20
> This is an important bugfix release that is API and ABI compatible with t=
he
> previous 1.2.x and 1.0.x releases.
>=20
> Highlights
>   - Fix an fd mismatch in the protocol in some cases that could lead to
>     fd leaks and crashes.
>   - Fix a bug where the mixer was not updated after setting the port, whi=
ch would
>     cause muted audio at boot or resume from suspend.
>   - Fix a potential use-after-free in module-rt when stopping a thread.
>   - Cached objects are now freed in the JACK API to avoid memory leaks.
>   - Some more fixes and improvements.
>=20
> PipeWire
>   - RequestProcess commands are now only sent after the node completes
>     the state change to RUNNING.
>   - More FreeBSD fixes.
>   - Handle ACTIVE links going to < PAUSED as well. This improves
>     renegotiation in some cases.
>   - Fix an fd mismatch in the protocol in some cases that could lead to
>     fd leaks and crashes.
>=20
> Modules
>   - Many of the network modules can now also accept hostnames instead of
>     IP addresses.
>   - Fix a potential use-after-free in module-rt when stopping the thread.
>=20
> SPA
>   - Support for elogind was added.
>   - Some more errors are checked when converting JSON to POD. (#4313)
>   - Fix a bug where the mixer was not updated after setting the port, whi=
ch would
>     cause muted audio at boot or resume from suspend. (#4084)
>=20
> JACK
>   - The BBT transport handling was improved. Some fields were added to be=
 able
>     to handle the JACK semantics correctly. (#4314)
>   - Buffers are now aligned according to the maximum CPU alignment instea=
d of
>     the hardcoded 16 bytes alignment.
>   - Cached objects are now freed correctly.
>=20
> Doc
>   - Some small doc updates. (#4272)
>=20
> Older versions:
>=20
> PipeWire 1.2.4 (2024-09-19)
>=20
> This is a bugfix release that is API and ABI compatible with the
> previous 1.2.x and 1.0.x releases.
>=20
> Highlights
>   - Avoid a crash in cleanup of globals. (#4250)
>   - Use systemd-logind to scan for new devices in v4l2.
>   - Some more bugfixes and improvements.
>=20
> PipeWire
>   - Avoid a crash in cleanup of globals. (#4250)
>   - Improve RequestProcess dispatch.
>=20
> Tools
>   - Improve float parsing. (#4234)
>=20
> SPA
>   - Clear the ringbuffer when stopping in libcamera.
>   - Use systemd-logind to scan for new devices in v4l2. (#3539, #3960)
>   - Queue dropped first buffer in v4l2.
>   - Unlink pcm devices when moving drivers to avoid broken pipe.
>=20
> JACK
>   - Emit buffer_size callback in jack_activate() to improve
>     compatibility with GStreamer. (#4260)
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../pipewire/{pipewire_1.2.3.bb =3D> pipewire_1.2.5.bb}           | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.2.3.bb =
=3D> pipewire_1.2.5.bb} (99%)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.3.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.5.bb
> similarity index 99%
> rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.3.bb
> rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.5.bb
> index 0a2088a3c..b37ae0a53 100644
> --- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.3.bb
> +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.5.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D " \
>=20
>  DEPENDS =3D "dbus ncurses"
>=20
> -SRCREV =3D "e2a76824e2b112b15ae4a1a3d444696d5526f8d8"
> +SRCREV =3D "71fac7fa818f21234da4c356de0b44e47e1a2ef2"
>  SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=
=3D1.2;protocol=3Dhttps"
>=20
>  S =3D "${WORKDIR}/git"
> --
> 2.46.0


