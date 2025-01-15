Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C31AAC02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 09:50:57 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.136])
 by mx.groups.io with SMTP id smtpd.web11.17487.1736934656615445958
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jan 2025 01:50:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=MOdp/2pC;
 spf=pass (domain: navimatix.de, ip: 40.107.22.136, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZGVAyvXRNin4rD/D7mwThUHgjtDCNj73Pk94ZfZ9beYWB6TThaQC4Kj90ddQhx9yDuA4nxw7alxkMj190uGcyT0+VB3DdPW2LxsAo3FP8UWGKZb25PXQpurpZV/nsOD1iBHlrJl2a2E6bUIohxYVPV9X6+2XliqgvwXAdtV1Z3+fNBQq2uzI/OYuT6pTqJp3zf7Yk54V3R6qKjBGAVwEdBcZDiKoWhAJmNZxzK9w5vJGFpbUXzUVBCwgnSVeVWQaxgfCK1d95v3lIQCi36ImIxEDljrUdXhXnKX49QCzhOIV5WkwwoU1GfiNb5LG+sX5h0rSG2AGK1iPJtotB8sHbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4TT04W62Kt79sRvE0oX2vhjP8aOrdp19jklOeAGdpXY=;
 b=VfrYCUJa8A9h92+zkZt35Uqz3qpDhzPmFKCdGq9+pj87o+OyLZSU0sFHfGhAyrpUZsRkrzbworgOjNlTHEC3n/pv0MZfQawIDKyjAW9Xi4Ozze1/nm/6iz3LOx5vlr58Am8D1aP4A2T75wwN73rn3pDKrWJ8Gd0ErVysE8p7X/YnmCUDjLnOYnxvZ9ZCoCB5Zn0LgFPafPn+7XRxkXPFaEYTROnIGwbz5G4vibLQ3vW/52RG8fiHDfd+69Kq9sCocgz8X6YBjClQ8pw55gX/ssW4Juwo4vEBqdBG7QOcTpx3b8BSBnk/mRpTxQggvlFqC5Ibr2pmWnK5AcnPjrrmuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4TT04W62Kt79sRvE0oX2vhjP8aOrdp19jklOeAGdpXY=;
 b=MOdp/2pClqOU3Ppw3pYtPF+Qa7/yDLg4A2uqLFRWHqETV7tKvPhx6X33YI87/jajEjyZyMQCpo3no0pGOaEMcCAJknKA181lCBRkdOO4KpQk0HLbV53SAUMuZAH3xayhmys4k+SW3/kMRXhYBzmpVg9pejgfgM0fOSw6CDU48GM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by GVXPR01MB10619.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:14f::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.12; Wed, 15 Jan
 2025 09:50:50 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 09:50:49 +0000
Date: Wed, 15 Jan 2025 10:50:47 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
CC: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe] [PATCH] smarty: update 4.5.5 -> 5.4.2
Message-ID: <p675m3ebzd6qsu6x4kcbbowcg5ejb6bi3mlwjvlehxffklqvbo@muqhgasjljh6>
References: <1736911952-10934-1-git-send-email-wangmy@fujitsu.com>
 <r3pwhezfvqmgh43ejzkjroffsmdoupemdh3q4v6hplgk3zregq@tni3w2fjzwaf>
 <TYWPR01MB11861B18EC4AD9079FF4602B0DC192@TYWPR01MB11861.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <TYWPR01MB11861B18EC4AD9079FF4602B0DC192@TYWPR01MB11861.jpnprd01.prod.outlook.com>
X-ClientProxiedBy: BE1P281CA0384.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:80::11) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|GVXPR01MB10619:EE_
X-MS-Office365-Filtering-Correlation-Id: 27b58592-5338-4bf4-176b-08dd354a1786
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?U1DTpX4JSYe2a9jMr+zmeMyKCql3YwivMwqvL6RJYpeCSSmBHStfIK7JUMHM?=
 =?us-ascii?Q?1ucmfae496ltuFPGdiMlX/qxy+vlOmuqfg6D8uAKo3xfuiKCpJfKI0vMM/Lu?=
 =?us-ascii?Q?HQvd7rF6eS+nWgIpXHxY7h6NG+JC7eX1+OJYxEa9lJDEJn1q0bdU94O+Speq?=
 =?us-ascii?Q?WlR9GacWRmoestN8ksH0s2pEkQClswwUcNM1RRPfd/xQneYg9UGSk5IKWze+?=
 =?us-ascii?Q?1SP/qBMafMpH4taRA3g/T8rlyGs/HZCqy+lKs+M3hrOvTHNtj5d8lbRV+bWI?=
 =?us-ascii?Q?Tq4S/vjeHG+noyXh8QiL+dxu3apewSVKX4xRjLLaqE7mqhWz4xVrMJwlHTVO?=
 =?us-ascii?Q?cDH7aPg9gutNqLkSctz0DjnrdR0R4qCwUKw1QhIhXQ6Jeqfyxw5eRIETRxqn?=
 =?us-ascii?Q?yK26mit7ZtxGGWLnKaKj87QEfVN0ArCV9RgEIZOMCeIFqvOnG4xA8Nz44k/v?=
 =?us-ascii?Q?o4z/atpJ+F9pHs2AsaRfkojGHK8YUQqF31WBDVKvtEzbBo/li/urxdsiFYz/?=
 =?us-ascii?Q?ckYVpPuRYlSj38+045QaDpWGulpcUfxFaX7hzCbToqwZUBKVbtsEM2qwY/+m?=
 =?us-ascii?Q?TNMSlTmNsZnvXoVSlgeiqd6dtSqaoY1yeVr/6oHmpDWEJV6dR7YevnDG9N/K?=
 =?us-ascii?Q?CR/xR10eSLUdJH0QlA6HH2ZmphihFQRcjQQEtNAK5dD52dmQFklmSknt6yC0?=
 =?us-ascii?Q?sAdSvhnqTXsXXomkaqhH+mvpB+4nrQSprPt11JTZG5y38VSghzKyn2onqA0C?=
 =?us-ascii?Q?1yY71/DoK3K3uzCArvkgypJYCRE9ygmaGAlpOzSjoaKeVoGPHL5fbbWtrCcK?=
 =?us-ascii?Q?I8taZ6EO7gHlYmdatG22gFYKKlfc9FXmq3FPhHj46nvgcrnrNCKtQSkaF1i1?=
 =?us-ascii?Q?AMVgwq9sNuLHo29z1fHCchcaAVcZcnX2UzMGpZEumwT6CEw5LSTshJOA0nYT?=
 =?us-ascii?Q?KlAYWJ8MvnsEO+aK/dq8OKlf7Wh9ljofypXpnfohSk0BQaMkeppgJfwWQvCB?=
 =?us-ascii?Q?fpGSBtBFBdTBg+9CRduAXXMM8kNjrt3GsFPGxEKStfU7luE6PTosPEcstPWx?=
 =?us-ascii?Q?hOPLYQXw41JF2d+BuIXvlR6bYh2LPgGJXWOHN/HRxah6ujPr14S1V3SNrUB6?=
 =?us-ascii?Q?0D9gCEXksK718Bmyd3zCtfFlPhrf5h/uzWpZ2eL716fVlVQdZTL4YjzGxp9V?=
 =?us-ascii?Q?5/EqE5bjndZDuGYfgjwpJWf2559Ty1zI73VTJI7nlyzZmZizmyWggqbU2UGc?=
 =?us-ascii?Q?UknIxSApAnMoEX1rBf4PvDREUlm8JaTAZxsWj1kEubwSAu9NAlfYgaeT/LCn?=
 =?us-ascii?Q?PsixpBtH5YJjI4LnrzDrW17e?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WynwHse18T0aZg8eZzaHSrG4S451P1FI+gMsz3xmEUwNWGsIAUV6DGzYKcVr?=
 =?us-ascii?Q?fzWFYFRN11XzBOETnEMdJzGKEyDvTxjcfFZa1eiGCTsUgAaWQveBFPibWy3m?=
 =?us-ascii?Q?+eKGbGlWPMIKEk7zLJ0cI75cv+Os1nQzHxHSSgthAu9YBaDiywYhVHSpbEAF?=
 =?us-ascii?Q?w7DwvBe50p47GameMpB/mds2jAo6ZDSEe/fm9JMxQxjilDYY7TkCrSbmJEzp?=
 =?us-ascii?Q?DQp4hu+nw6vFOxSqZid4YeWKmcFqw6Tbi+8v0W33qNIZjMO19iC4zNatRshU?=
 =?us-ascii?Q?QinfZVWprLlkyo/K+MTVEI6ELgU+7zV4URHoz8giqnKpWUZOJzpqIRxOap4I?=
 =?us-ascii?Q?ouvMEvRCDh3WGKrb9AAg+ipc5AxJP3etSB/5GW0Db9YhCguNa2Dz7CQeB1Jx?=
 =?us-ascii?Q?CeaziHjE4kFvOPTdU1MYwkNff3JVTyW+JwTkiJ80ViGziiJHzun4BqojOFV4?=
 =?us-ascii?Q?xmpzi0npg9xoMxqfLNydXw2511jV2m8EhSGGZReV5OYtTkvXy32C8171v+MN?=
 =?us-ascii?Q?lGK9JtO0fuC14qUFp2MbtdpsUh9sWQnOCD5quNBFkP28byDY+eMya2s5e3/f?=
 =?us-ascii?Q?M+tL772SYQn+f2j+ZX8HaC3FaDKI9PENMKwaDUdv/Nz270h601Nf/rRc/Bpv?=
 =?us-ascii?Q?niH9wttXCkD8/1gYeYRmL2oxurljOwBKQPN17YLXFgkY506xi+tcdoigWuMr?=
 =?us-ascii?Q?50Ei50tOo+C72JldYDciDIP3A5QFiLB5P9WKY01Pep1mn/T+RIAcqqZWh024?=
 =?us-ascii?Q?VmdgUxBQlNNJ7cy7gqkP9OSd291Wzs6gbd8nxMRNCrrm2B1rKIc6fuoV3z7E?=
 =?us-ascii?Q?Yd/KYVeEiINDaRjqhtSrxxSSgVmlU5r+L4yIuLc6FL4Psty59mE8COgavSbW?=
 =?us-ascii?Q?NdxrItPnwq63uVD6Y30YmjMdF42a4Gq9xDW+GkFKl8AZa94Pk3OaTcUtI/JU?=
 =?us-ascii?Q?X36yPkRKFEsEo2zBvJZ9L8HY+SO1383Pf4Pu4M409ePDf5VCl78kO1nMdiCY?=
 =?us-ascii?Q?SEJuZKKSBbCsoIR0eBhMB7Eu2EnltsM25MjhmLZ1RGu1eoZm4uB6FXR7Ywzt?=
 =?us-ascii?Q?YZypva4+VGkzPr6vF57ebogf6ST35ceOir21i7jcMTloLRfXkVqysynsxaaQ?=
 =?us-ascii?Q?Po5RAzB+Vu0RieaM1PXlSB0T2UG+/jP0LQC3dkkVG79i8Qgr200Ujxy02WHq?=
 =?us-ascii?Q?w58UFSYbQeQ94iKanfwNQP4ldwMrssJRGiT8YV0FgQH9OOCnwRi7DT9c2P6b?=
 =?us-ascii?Q?9+EnV9SOmAIUxbJUvY/RW8itUxz5yK30+rqbMutdfVEEEpMwaws1TOoWJqra?=
 =?us-ascii?Q?bquP9Iv0cPiKbBPItIplTuQQsynDjAsFcuEAS9jslZJu8Dnx4eIOKSaCpDZN?=
 =?us-ascii?Q?hsTYwke1jwxaDvLtHTXAawn/tcmhgKfBrU70f1haRdBfzFyLKq7w/JeAx3BP?=
 =?us-ascii?Q?6vXIA4erEPkSsOOCP5mXofQLhNEq7+lYbPjeDNE/OZgeIACFD0pZulCv+oxz?=
 =?us-ascii?Q?BxjZo1SNOsxlwq1OdPWZjcOGZ8nLAANtPCbyuNi1A/d/KDRZJsK6YXoMiad7?=
 =?us-ascii?Q?GHDjCjXd13qD4nh1rD2TYkGRRmkLs/tKdakF/1DIYK93UsHQk3MmVH5Egxuc?=
 =?us-ascii?Q?yQ=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 27b58592-5338-4bf4-176b-08dd354a1786
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 09:50:49.7395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rdit2GEKSy2Fff1b2ilseLUnyYFgNE8ciF8u6Umj/hl7OKnFa/v3FGxOF41zYUY891wvQKg/wz/++RD6qwxy/5BcERN2AoIbZaHWTA+NuDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR01MB10619
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jan 2025 09:50:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114897

Mingyu Wang (Fujitsu) schrieb am Mi 15. Jan, 08:47 (+0000):
> Sometimes the following errors occur when executing bitbake:
>=20
> DEBUG: Executing shell function do_compile
> NOTE: make -j 4
> php ./utilities/make-parser.php src/Parser/TemplateParser.y src/Parser/Te=
mplateParser.php
> make: php: No such file or directory

Does it help to add php-native to DEPENDS?


> make: *** [Makefile:16: src/Parser/TemplateParser.php] Error 127
> ERROR: oe_runmake failed
> WARNING: exit code 1 from a shell command.
>=20
> It seems that this do_compile should not be executed. To avoid this issue=
, I added an empty do_compile in the bb file
>=20
>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
> No.6 Wenzhu Road, Nanjing, 210012, China
> TEL=EF=BC=9A+86+25-86630566--8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
>=20
> > -----Original Message-----
> > From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> > Sent: Wednesday, January 15, 2025 2:07 PM
> > To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>
> > Cc: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe] [PATCH] smarty: update 4.5.5 -> 5.4.2
> >=20
> > wangmy via lists.openembedded.org schrieb am Mi 15. Jan, 11:32 (+0800):
> > >  S =3D "${WORKDIR}/git"
> >=20
> > Shouldn't this be UNPACKDIR instead of WORKDIR?
> >=20
> > S =3D "${UNPACKDIR}/git"
> >=20
> > > +do_compile() {
> > > +	:
> > > +}
> > > +
> >=20
> > How about:
> >=20
> > do_compile[noexec] =3D "1"
> >=20
> >=20
> > Regards, J=C3=B6rg
> >=20
> > --
> > Ich halte ihn zwar f=C3=BCr einen Schurken und das was er sagt f=C3=BCr=
 falsch =E2=80=93 aber ich
> > bin bereit mein Leben daf=C3=BCr einzusetzen, da=C3=9F
> > er seine Meinung sagen kann.            (Voltaire)
> >=20
> > Navimatix GmbH           T: 03641 - 327 99 0
> > Tatzendpromenade 2       F: 03641 - 526 306
> > 07745 Jena               www.navimatix.de
> >=20
> > Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
> > Registergericht: Amtsgericht Jena, HRB 501480

--=20
=E2=80=9CIt's been said you aren't a real UNIX system administrator until y=
ou've
edited a sendmail.cf file. It's also been said that you are crazy if you
attempted to do so twice.=E2=80=9D

Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

