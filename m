Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A85ED73600
	for <webhook@archiver.kernel.org>; Sat, 30 Nov 2024 12:08:32 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.53])
 by mx.groups.io with SMTP id smtpd.web11.132833.1732968501361468123
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Nov 2024 04:08:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=co+8dODJ;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.22.53, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WztBMBpzMlbgp3eV/+n0Jniqx//VABSOhcCgJUl1moRcwCkMtLF+fQSyktgA4u2DeWkv65joGUOt0p5UD7YCDiQ8kWYUAiYaYTnE0mR5hlOOq9EeJ3TxmbZUHfsCkA05P+crs9ZY4XRbS8Y6jRGqrbLsnqqu0N3F8nYeynDLfibIyPqq6bxHjFoNjm+Lq0ERF+0Ml+mXYcVVKZzxYcFW0U5iDbeI0RyUSsXR9VJkxgEJGYH2KvjBUxN8Kie6QXEgj4dw45iH6OHzIgNDR8+V+ob793yPMM3FAItgMOmMc+csXI1DiwhLvvDbc25p9MTOT0Hd5TUTHgqKwFErYN3/gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/D0lqzZkTfhVRQlxZQoVCBWjAfR5C4oPI0hQHVRXtU=;
 b=LzTtpxi5W9D2nPt3ojNdYU+Pn2jrCNltmnHt+7VgzUXNwrasXZdQMaim/lMqPPBB6Ke5qjoeJKDug9s/+4nBQXo0s/JGDLr11qQ7GcmJ6lgnjkVwj1ul5+r6dMz2LDAzCBy/eodSe1iM9FI6Rvm/GJGcET7ZOUUyMW/aVUDEHhSaXalMaibcxzunBxNLBdlejdOU3z5kJSAEJumFeDOTU47x4PpqEyJ9XSiaQJHULvRlnhtu1W0EuaXFrbR8a/XngCc4ug3+QcQGu0NpgBno1X6cuF3kX75Psa9bN2ZwGz+fsLOXX6QAwGvkPc1S1x0GkRpFbAwbJhLBpEiqYu8hdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/D0lqzZkTfhVRQlxZQoVCBWjAfR5C4oPI0hQHVRXtU=;
 b=co+8dODJc1BGk4qam1ZFwYz1gZd/uftRtRgRtbZ94RH2FC4VsSMef3g909cTpVm/NFG2nQNllDSrbmx2zHlSaMzATaXNx7amEunKfaAzlzS/PIX/Dily9S4+DCKjGFCtt0U7+Wcp83VsoafWeqwrsel1N1096zuuHia+W8lVtIA=
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com (2603:10a6:20b:355::8)
 by PA2PR06MB9556.eurprd06.prod.outlook.com (2603:10a6:102:41c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.16; Sat, 30 Nov
 2024 12:08:17 +0000
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::570d:8853:c13b:c7d3]) by AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::570d:8853:c13b:c7d3%6]) with mapi id 15.20.8207.014; Sat, 30 Nov 2024
 12:08:17 +0000
From: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
To: =?iso-8859-1?Q?Jan_L=FCbbe?= <jlu@pengutronix.de>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, ZHIZHIKIN Andrey
	<andrey.zhizhikin@leica-geosystems.com>
Subject: Re: [oe] [meta-oe][PATCH v1] signing.bbclass: add certificate
 ca-chain handling
Thread-Topic: [oe] [meta-oe][PATCH v1] signing.bbclass: add certificate
 ca-chain handling
Thread-Index: AQHbLFZb5ma7eF5Ohk6cgKGxMWC2BrLJ3MKAgAC+uCaAAhITAIADMMkG
Date: Sat, 30 Nov 2024 12:08:17 +0000
Message-ID: 
 <AM8PR06MB75217CFBC4A22F2121D0DF6CBC2B2@AM8PR06MB7521.eurprd06.prod.outlook.com>
References: <20241101120514.185668-1-johannes.schneider@leica-geosystems.com>
	 <993d5bc627151ecab7366454bc0fa0f02491cf28.camel@pengutronix.de>
	 <AM8PR06MB7521EC2BB3A7EDB743AC4B8BBC282@AM8PR06MB7521.eurprd06.prod.outlook.com>
 <1727d53834f2687b9590476233b9676a92c0d056.camel@pengutronix.de>
In-Reply-To: <1727d53834f2687b9590476233b9676a92c0d056.camel@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR06MB7521:EE_|PA2PR06MB9556:EE_
x-ms-office365-filtering-correlation-id: b86389ed-6b05-4317-6c41-08dd1137ac73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?Zek1T5L2/qNsg/oHL+ipjaThc4E/BATPzVFtqzgtjKNAmVW2oXB6TC4GSN?=
 =?iso-8859-1?Q?imrbqHa1Nmrn4yy5nFNQ4V+3b6/JwF2xKQO4lfn/wUEWnEm1XBNUqpBYba?=
 =?iso-8859-1?Q?Prte4dLw/Hwcd0W8aiKXzH5bgzFKFKlJWy/y/vglG18jsra9jzbdwhoM7A?=
 =?iso-8859-1?Q?S6DscLGbG27jmp2BMJkGe0oqQUOs4uvjv///6LQrgUPCKcTkQcK+oyBXgX?=
 =?iso-8859-1?Q?WcXAnl1xX7nEYUwMVGaXtDy9Ij+xZOvt1m0loipD3/e/K15NO+Y7KXVm3N?=
 =?iso-8859-1?Q?nUZUcc7r58wfprRlKJ7zbPYpCzi+k0nj2kxudsNHDWHrGX1K4ExVO3n7fK?=
 =?iso-8859-1?Q?T1KIut1Wra16mporku0wgduufVoufRSyBDWgpPFxfx+85ScTMwn3yFhSnX?=
 =?iso-8859-1?Q?cYW0ekiX6wc39lJXcY6d33vJ52joLsit+T5sw0qBXiHr24t7ccbFRBV4vF?=
 =?iso-8859-1?Q?uD6Gn/VZjvWYS0FtaIrHJf7JmaVHAG+JZyowD3F5487doC37pFfYHlOqUn?=
 =?iso-8859-1?Q?CBSfRp/dpH1CgicHkyk8Ya5tamatUFAboDJTnL39v/36Rtrx/Vj7sFi1YZ?=
 =?iso-8859-1?Q?Bhbo9X+1eU6hPMn4hLw4Kl9rDGHEQ/wSqGk4bCmGUxRF/cblop3pqGZx9N?=
 =?iso-8859-1?Q?GwVPI79GJAAwE1Hrsm5QPqe6vnH1KtQPLJyEWblIE0lh9B4Loep/jgee9T?=
 =?iso-8859-1?Q?FL8ab0jHjHn43i/Frd0Vg9H69HuL2fYkW666AP0CHy9RcUVNbj6+3Xr1R2?=
 =?iso-8859-1?Q?issOq0XYy1bie+RPIblprGMrsxmwsD40cv+J/BflwzErh5TjLgt7YiqABW?=
 =?iso-8859-1?Q?4daUmbv+C2ZPZsfv+z71L8vs6jSHh/RhCKGL+lUndlZim7P5BOOu++h//J?=
 =?iso-8859-1?Q?2JEk9PRw86P94uJ09icptfQVCzmLua9q2P4U9HCJt9w4HwE6nEPtALkeEn?=
 =?iso-8859-1?Q?AKGYVUebhvVIWd6Kj/5PjSYx4gAH/IsvMX7/g/KND4nCl4BPk1AJpdLg7W?=
 =?iso-8859-1?Q?ZwyxZGf7DoRJ66zwmlafrQm7lUEzt/p4xAzQl1bUJ3LURiQx/IGp0xBItG?=
 =?iso-8859-1?Q?JITPpY7QcR8KV7cfcLNAlaSNx5wbr9wahul6pQppfLVSguusS3nlgawDVL?=
 =?iso-8859-1?Q?+i87NxW0ExDFEJdNNWsTrvXeeizyjKyTIJlq02Yhin7BNQN9GJ5X/x00TD?=
 =?iso-8859-1?Q?GRB8YSvT7UmYOp1EYBZ5WE1CTo6wfzdNbBJ63uYN82Oy/ykFwJ99vyJUvH?=
 =?iso-8859-1?Q?V1wVPgrbhFXWfUVEvGZugk2oyl+2EyV0HTVxVhl43PhaeeOrv7VeXyEA1J?=
 =?iso-8859-1?Q?GvZ5il3+i9uuo/iPm2G3gwWuTvfKM4ciCNnAx+mYvpBro2EboBHegHlEz0?=
 =?iso-8859-1?Q?xl74GMKv2zp5O18Pj2bOGYMMWdIs8LzcI+Ej/wxOznoSlF1+V5X+M=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR06MB7521.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?BkiZu/QtUGZHvEzCJgUtEbKgvuCTECUf5X74kobcjC1dhk80dgwT5dQAfF?=
 =?iso-8859-1?Q?M/2kpsy2n8FXD41LyF4SdyYJcT2QdX2SKJS2hUxVJ2HVGHMcG91N4w2wmn?=
 =?iso-8859-1?Q?32bps/IiNJKUojji/jvy/NlWzq/Ws8dSb2vSCOOEqZyYMWzThICc1i9Nuz?=
 =?iso-8859-1?Q?X9fA3EfUC+Ug1V0bQjs/ubOX1KkoxpjJezhJ+7hLKkwFn3r+e7JZzN1vTb?=
 =?iso-8859-1?Q?zMR/EeeQLH2ui0S0FUjdj5v2IwaTQNfwnFlgGpHT3fUsu4aOgF/BW80Qve?=
 =?iso-8859-1?Q?gELgBmgtwewUpdDMjqyBlb5EeM51FXWKio5Hv26/9JdUg0qu+seO0wvWBK?=
 =?iso-8859-1?Q?P7qwdTS4nAzP9oYCqtoRGa8gEye8kiNp/HwUl8964LG+qeL2i6qpd5jIBZ?=
 =?iso-8859-1?Q?BGA/1HwMwpMeyVtQQw/xba1uEiQVfnn1JFFY8AFA2VdWK1aPCf17jB2MJG?=
 =?iso-8859-1?Q?JNy2EkY4Ha8yeMNp0YteqAT+3oL/iDVodtFpVyCr+E47Evifd863cVzuxK?=
 =?iso-8859-1?Q?ZPXvTbfcpqgwXnZZcpdIR3TmSsK05FzrxQ1QFlJhv6h8pwsSsvX4z0xuvU?=
 =?iso-8859-1?Q?mE6qb/f3usCIEu5YFY3V2Sb5XCatDWCDL26a9Xvp2VeYU4mbDGd0Pfs8fx?=
 =?iso-8859-1?Q?nenGaMm0ayqFZo/AI75M6MdhCDAUM05zcUOzkoZUdLQenoYPfnz8cQdfNM?=
 =?iso-8859-1?Q?hec6lCwsX/qFcfDjM08LxXU24tEbr1EgtYHhOS0yqthmtyLM+ENisKyxGw?=
 =?iso-8859-1?Q?AEpZIiUBCLzFsf6G3lg6sjL/IBRDp8xtM4Y1qkkfHnxxYK1WSwRLH594Xk?=
 =?iso-8859-1?Q?xpCEicqbR5ycyBiPJ9H83OXjuZaJzozDTJkufODvB6UhEVUYm/0wT2Lw0I?=
 =?iso-8859-1?Q?WwUe+kzVcsruyMW5w6m7ANM8oCPQvchXuvJlh8f5LjrGqNf5b46pbLYs+1?=
 =?iso-8859-1?Q?jgvHOYJoQkOStP0MJYuedom48xL46YnxZR402GDRntyg84KZYGw3LaV/Mz?=
 =?iso-8859-1?Q?lJSp8EjUxNsnKoU4fV8Woji1+pJBlG4t4tsEfpqzBenk5Ll+/dwhDm0Ss0?=
 =?iso-8859-1?Q?mrsIY4Ioavrwn6ZpRBUtsTKAQUpSTWj2OeijqgQBGI0lwRymEf0f5DTHrj?=
 =?iso-8859-1?Q?jN19MxFOJ5CXzTrAIOyXBMOBvnRdVozxF9aSVxvsdKMJ7HLZy6kl+oy1mo?=
 =?iso-8859-1?Q?wZXc/QymWS2LDL8a66j7/V+zpNlFoYh5oN//OvVy9n/sRQcApbZZfk92QP?=
 =?iso-8859-1?Q?yvwt2Y0rF2OqHO6mkn+eUVLNggQz1gETemh0Fi3LswoFkL4m+U0GKPWBrD?=
 =?iso-8859-1?Q?j9XMELCcaSMVZMoNN2x/br4fSjUWnNJ2FEV7EZEUv9NrUiQOgeN83PBkuC?=
 =?iso-8859-1?Q?HXIocY/EvWExjOMUt4Ws4wDiUG+3x7LsNwTlensIC05zMu7tJfPRyYpS6I?=
 =?iso-8859-1?Q?0+DtL0vVqHVojEcNt+qLXYK9HC7GDq+MBTX7xLvTUof4x/XH/RNROFFdtV?=
 =?iso-8859-1?Q?RY2Kb28zyFl40Sfu8A/O5XvRVW6UpqHnQAhTEXAg6ye5PkXQiv25Sq9Xls?=
 =?iso-8859-1?Q?+GMLeC4PnZaVDGzScur/10Vj3QII+qzwH/NpKfyTwcc79gW7w78hlVIdwf?=
 =?iso-8859-1?Q?34qgp/hotKuS7HmLssZgRvprainICP9lihAvOQD12GHS/uPF1P7X6JH6jw?=
 =?iso-8859-1?Q?FKYLZDteJqNIygQrxnQdkMlt9ftFG0Vp11XI2U8YgySvTdX2BTd+ovH6cH?=
 =?iso-8859-1?Q?wi1uZ330TA303cAiZnW69dal0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR06MB7521.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b86389ed-6b05-4317-6c41-08dd1137ac73
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2024 12:08:17.0512
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K7lpz8r2ueA1CS/OxFNZffbvYyccDKxiLKHCGhn6Qf7sGEoYpfiGxQhsmd77okzegsShKV89vfq2HJ2Q/JPy+o2yUmNylv2Hhel2M+MKnQCE9HRi1+zBQKTYdsoNc9zd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR06MB9556
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Nov 2024 12:08:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114126

Hoi,

>
> On Wed, 2024-11-27 at 03:39 +0000, Johannes Schneider via lists.openembed=
ded.org wrote:
> > > On Fri, 2024-11-01 at 13:05 +0100, Johannes Schneider via lists.opene=
mbedded.org wrote:
> > > > Add handling of ca-chains which can consist of more than one
> > > > certificate in a .pem file, which need to be split off, processed a=
nd
> > > > stored separately in the softhsm - as the tool-chain
> > > > signing.bbclass::signing_import_cert* -> softhsm -> 'extract-cert'
> > > > only supports one-per-file, due to using/expecting "plain" x509
> > > > in-/output.
> > > >
> > > > The added signing_import_cert_chain_from_pem function takes a <role=
>
> > > > basename, and iterates through the input .pem file, creating number=
ed
> > > > <role>_1, _2, ... roles as needed.
> > >
> > > Why do you want to import certificates without corresponding private
> > > keys into the singing mechanism?
> > >
> > > They can't be used for signing, so don't really fit the role concept =
as
> > > I intended it. This mismatch then leads to workarounds such as the _N
> > > suffix and the problem below.
> >
> > During a (yocto) build, there can be places where the key is used to si=
gn
> > something, and other places where the corresponding certificate is inse=
rted/used
> > to verify the former - so there are two different "consumers" of one ro=
le; e.g.
> > the kernel fitimage is signed with A.key, and at bootloader build time =
A.cert is
> > inserted into the bootloader so that it can later verify what it is sup=
posed to load.
>
> Yes, this split between signed artifact component (e.g. fitimage) and
> authenticating component (e.g. bootloader) was the main motivation for
> the concept of roles: both users of a role can be switched from one
> (development) key to a different one at a single place
> (local/auto.conf).
>
> > Now the bootloader<>kernel uscase is simple, because there is no verifi=
cation of
> > the certificate; e.g. there is no need to provide the complete chain.
>
> (for fit images, the certificate isn't even available during
> authentication, only the public key)
>
> > But other usecases sign $something during buildtime, and at runtime thi=
s
> > artifact would then be verified against a certificate, which in turn wo=
uld need
> > to be verified against it's CA-chain.
>
> Beyond the simple case of self-signed certificates, I find it clearer
> to talk about leaf, intermediate and root certificates. Depending on
> context, "chain" can mean leaf+intermediates, intermediates only, or
> even leaf+intermediates+root.
>
> On the target, only the root certificates need to be stored in a
> trusted location. The intermediate certificates are usually provided
> with the signature to let the authenticating component to build a path
> to a trusted root.

Or stored also in a trusted location?
-> openssl -CApath /usr/share/ca-certificate/youre-company/
(which openssl/libopenssl actually picks up automatically, if the certifica=
tes
there have hash-symlinks; and that's what we're using ATM)

>
> The leaf certificate is special in this case mainly because it's the
> only certificate for which we have the corresponding private key.
>
> > By keeping the leaf (key+cert) plus all links (just the cert) up the ce=
rtificate
> > chain, the softhsm can be used as "single source of keymaterial". Other=
wise
> > there could be a rift between taking the keys from the softhsm during b=
uildtime,
> > but takeing the certificate (-chains) from $elsewhere.
>
> If we say signing.bbclass instead of SoftHSM, I'd agree.
>

(thumbsup) i was more refering to the "thing storing the keymaterial"
the softhsm just happens to be the default backend of the .bbclass

>
> SoftHSM doesn't actually provide more security for private keys than
> simple .pem files. So why add all this complexity instead of using
> simple OE variable pointing to a private key file? Because it allows us
> to:
> - support hardware tokens
> - decouple key configuration from key usage
>   =3D> simplifies reuse
>   =3D> consistent configuration for many recipes
> - use same code-paths for development and release
>   =3D> better testing
>
> (for more background info, see my OE WS 2023 talk
> https://pretalx.com/openembedded-workshop-2023/talk/3C8MFF/)
>
>
> I definitely agree that signing.bbclass should also have a way to get
> the intermediate and root certs for any given key-pair via the role.
> Introducing additional certificate-only roles for this causes new
> problems, though (see below).

what new problems?
it's already being done for e.g. HABv4, where there are roles
that do import a (leaf) certificat, but don't have a key to import

>
> > > > Afterwards the certificates can be used or extracted one-by-one fro=
m
> > > > the softhsm, using the numbered roles; the only precondition - or
> > > > limitation - is that the PKI structure has to be known beforhand;
> > > > e.g. how many certificates are between leaf and root.
> > >
> > > The point of the signing.bbclass is to abstract over different HSMs a=
nd
> > > allow flexible key selection at the .conf level.
> > >
> > > With this approach, any recipe using this set of generated
> > > (certificate-only) roles now needs to know how long the chain is and
> > > the PKIs with different layouts are no longer possible.
> >
> > That is the one caveat - the layout has to be the same and known before=
hand;
> > should we add more logic=3Dcomplexity into the class to detect and hand=
le this
> > (... i guess: no ;-)?
>
> The information has to be stored somewhere, but ideally only in one
> place. It can't be the recipes, because we always have (at least) two
> of them (signing and authenticating components). Also, hard-coding
> details of the layout in recipes reduces reusability across layers or
> projects.
>
> I'm not willing to give up on the goal of proper decoupling. As the
> inherent complexity has to live somewhere, I'd prefer the class, so a
> single implementation can be reused and the recipes are less complex.
>
>
> One aspect to consider is that there is not a one-to-one relationship
> between the leaf certificate and the set of CA certificates

Depends on which way you look, there is a 1:1 from leaf->intermediary,
and then intermediary/-ies->root
But you're right, it's not necessarily 1:1 in the other direction.

> (intermediates+root): CAs are used to support multiple interchangeable
> leaf certificates under a single trusted root. Without the need of
> multiple leaf certs, you could just use a self-signed cert and avoid
> all this complexity. :)

:-D - or just do away with the code-signing complexity alltogether, and all=
ow
people to run OSS-software of their choosing on the hardware they paid mone=
y for
;-)

>
> For example, one build configuration could have different key-pairs
> (roles) for different components, e.g. kernel modules and an IPE
> policies. Their certificates may still be signed by the same CA, as
> they are authenticated by the same component (the kernel).
>
>
> So, handling (intermediate and root) CA certificates separately from
> the roles would allow us to refer to them indirectly.
>
> > > Could you describe you use-case in detail? I think we should try to
> > > find a design which avoids using roles for certificate chains, while
> > > also allowing different PKI layouts between SoftHSM and actual HSMs.
> >
> > We have a build setup that, depending on a build-configuration switch, =
uses
> > either development-keymaterial, or production-keymaterial. So the (soft=
)HSM
> > encapsuled by the signing.bbclass and it's roles becomes the common int=
erface
> > through which all keymaterial is requested for artifact-signing purpose=
s, or
> > certificate (chains) are gathered to populate e.g. the rootfs with, for=
 use
> > during system runtime.
>
> Yes.
>
> > The intended usecase of the signing.bbclass is certainly to swith aroun=
d the
> > actual underlying HSMs (e.g. have a softhsm with devkeys, but a "real" =
HSM for
> > the production usecase) - but due to limitations with our CI infrastruc=
ture...
> > we only have a secured channel to fetch the productive keymaterial, but=
 still
> > need/intend to use the softhsm to "secure" the keymaterial on the CI du=
ring
> > build-time.
>
> Using SoftHSM doesn't provide any security. If you're OK with that, it
> still is useful as part of the abstraction, so that keys can be
> switched without touching recipes.
>
>
> Note that certificates are not secret, so storing them in a HSM is
> primarily useful because that avoids the need of a different storage
> location. Alternatively, all certs could be stored as files in the
> layer and found by recursively walking the X509v3 Authority Key
> Identifiers (but that would likely need a small tool to be called from
> the class).
>
> > > > Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosyst=
ems.com>
> > > > ---
> > > >  meta-oe/classes/signing.bbclass | 30 +++++++++++++++++++++++++++++=
+
> > > >  1 file changed, 30 insertions(+)
> > > >
> > > > diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/sign=
ing.bbclass
> > > > index 3e662ff73..8af7bbf8e 100644
> > > > --- a/meta-oe/classes/signing.bbclass
> > > > +++ b/meta-oe/classes/signing.bbclass
> > > > @@ -134,6 +134,36 @@ signing_import_cert_from_der() {
> > > >      signing_pkcs11_tool --type cert --write-object "${der}" --labe=
l "${role}"
> > > >  }
> > > >
> > > > +# signing_import_cert_chain_from_pem <role> <pem>
> > > > +#
> > > > +
> > > > +# Import a certificate *chain* from a PEM file to a role.
> > > > +# (e.g. multiple ones concatenated in one file)
> > > > +#
> > > > +# Due to limitations in the toolchain:
> > > > +#   signing class -> softhsm -> 'extract-cert'
> > > > +# the input certificate is split into a sequentially numbered list=
 of roles,
> > > > +# starting at <role>_1
> > > > +#
> > > > +# (The limitations are the conversion step from x509 to a plain .d=
er, and
> > > > +# extract-cert expecting a x509 and then producing only plain .der=
 again)
> > > > +signing_import_cert_chain_from_pem() {
> > > > +    local role=3D"${1}"
> > > > +    local pem=3D"${2}"
> > > > +    local i=3D1
> > > > +
> > > > +    cat "${pem}" | \
> > > > +        while openssl x509 -inform pem -outform der -out ${B}/temp=
_${i}.der; do
> > > > +            signing_import_define_role "${role}_${i}"
> > >
> > > Calling signing_import_define_role() from an import function breaks t=
he
> > > separation and ordering we currently use (first
> > > signing_import_define_role(), then import certs/keys) and is surprisi=
ng
> > > compared to the existing signing_import_define_role()
> >
> > That is true... got any advice/ideas on how to handle this?
> >
> > This way the PKI layout =3D the certificate chain lenght, has not to be=
 known at
> > the time of the import, but only when using the roles. A separate
> > signing_import_define_N_roles(N) to have them prepared "blindly" ahead =
of time?
>
> If we separate certificates from roles, we'd have something like this
> in the provider (where development keys are imported):
>   signing_import_prepare
>
>   signing_import_root_cert kernel ".../kernel-ca.crt"
>
>   signing_import_define_role kernel_modules
>   signing_import_cert_from_pem kernel_modules "${S}/kmod-development.crt"
>   signing_import_key_from_pem kernel_modules "${S}/kmod-development.key"
>   signing_import_set_ca kernel_modules kernel
>

That is an idea! adding a variable to to the SIGNING_ENV_FILE that allows t=
o
preserves the relation between certificates. Having a "signing_import_set_c=
a" is
probably enough: leafs would point to their intermediary, and that to it's =
root;
having an signing_import_root_cert is IMO not needed, as it's the same as a
signing_import_cert_from_pem.

>   signing_import_define_role kernel_ipe
>   signing_import_cert_from_pem kernel_ipe "${S}/ipe-development.crt"
>   signing_import_key_from_pem kernel_ipe "${S}/ipe-development.key"
>   signing_import_set_ca kernel_ipe kernel
>
>   signing_import_finish
>
> In the recipes using these roles, you'd need to refer to the CA. For
> the kernel (authenticating component):
>   signing_prepare
>   cp "$(signing_get_root_cert kernel)" "${B}/kernel_ca.pem"
>

if it would be just a simple 'cp'... it's always a "get the pkcs11 uri" + e=
xtract-cert :-/
It would be neat if the signing.bbclass would support getting to the (publi=
c) certificate
out of a role directly.

>
> When signing the modules, you'd use:
>   signing_prepare
>   signing_use_role kernel_modules
>   ... use $PKCS11_URI
>
>
> For cases wth intermediate certificates, we could chain them to their
> respective CA:
>   signing_import_prepare
>
>   signing_import_root_cert kernel ".../kernel-ca.crt"
>   signing_import_intermediate_cert kernel_2024 kernel ".../kernel-kmods.c=
rt"
>

and why not:
signing_import_define_role kernel
signing_import_cert_from_pem kernel ".../kernel-ca.crt"
signing_import_define_role kernel_2024
signing_import_cert_from_pem kernel_2024 ".../kernel-kmods.crt"
signing_import_set_ca kernel_2024 kernel

Or did you mean to abstract those steps away in the functions
signing_import_root_cert +  signing_import_intermediate_cert
... seems redudndant to the import_cert_from_pem

>
>   signing_import_define_role kernel_modules
>   signing_import_cert_from_pem kernel_modules "${S}/kmod-development.crt"
>   signing_import_key_from_pem kernel_modules "${S}/kmod-development.key"
>   signing_import_set_ca kernel_modules kernel_2024
>
>   signing_import_define_role kernel_ipe
>   signing_import_cert_from_pem kernel_ipe "${S}/ipe-development.crt"
>   signing_import_key_from_pem kernel_ipe "${S}/ipe-development.key"
>   signing_import_set_ca kernel_ipe kernel_2024
>
>   signing_import_finish
>
> To support this, only the user (e.g. kernel modules, IPE policy) would
> need to conditionally include the intermediate certificates:
>
>   signing_prepare
>   signing_use_role kernel_modules
>   SIGN_CMD=3D"... --key=3DPKCS11_URI ..."
>   if signing_has_intermediate_certs kernel_modules; then
>     SIGN_CMD=3D"$SIGN_CMD --intermediate=3D$(signing_get_intermediate_cer=
ts kernel_modules)"
>   fi
>
> This recipe-level-code would support all cases:
> - self-signed cert for simple cases
> - leaf + root cert (no intermediates)
> - leaf + intermediate + root cert (intermediates include with the signatu=
re)
>
>
> For release builds, in addition to overriding the roles, you'd need to
> override the certificates as well in you .conf:
>   SIGNING_PKCS11_URI[kernel_modules] =3D "pkcs11:serial=3DDENK0200554;obj=
ect=3Dkmod&pin-value=3D123456"
>   SIGNING_CA_CERT[kernel_modules] =3D "file:///kod-ca.cert"
>   SIGNING_PKCS11_URI[kernel_ipe] =3D "pkcs11:serial=3DDENK0200554;object=
=3Dipe&pin-value=3D123456"
>   SIGNING_CA_CERT[kernel_ipe] =3D "pkcs11:serial=3DDENK0200554;object=3Di=
pe-ca"
>   SIGNING_CA_CERT[kernel] =3D "pkcs11:serial=3DDENK0200554;object=3Dkerne=
l-ca"
> So, you could have the certificates as files or in the HSM.
>
> If you'd need to define a different hierarchy, you'd add:
>   SIGNING_CA[kernel_modules] =3D "product_a_kmods_2024"
>   SIGNING_CA_CERT[kernel_modules] =3D "..."
>   SIGNING_CA[kernel_ipe] =3D "product_a_ipe_2024"
>   SIGNING_CA_CERT[kernel_ipe] =3D "..."
>   SIGNING_CA[product_a_kmods_2024] =3D "product_a_2024"
>   SIGNING_CA_CERT[product_a_kmods_2024] =3D "..."
>   SIGNING_CA[product_a_ipe_2024] =3D "product_a_2024"
>   SIGNING_CA_CERT[product_a_ipe_2024] =3D "..."
>   SIGNING_CA[product_a_2024] =3D "release-ca"
>   SIGNING_CA_CERT[product_a_2024] =3D "..."
>   SIGNING_CA_CERT[release-ca] =3D "..."
> And the actual recipes wouldn't need to change, preserving the
> decoupling between recipes and PKI configuration.
>
> I think that should offer enough flexibility for your and other
> scenarios.
>
> Regards
> Jan

seems like this patch was already accepted in <master>  :-)
i'll put togheter another one to add the 'signing_import_set_ca', since it
would supplement everything nicely.


gru=DF
Johannes

