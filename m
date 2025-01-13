Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C21C02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 19:24:38 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.125])
 by mx.groups.io with SMTP id smtpd.web11.26696.1736796267635632241
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jan 2025 11:24:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=i0IH/pi+;
 spf=pass (domain: navimatix.de, ip: 40.107.22.125, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WZodzoKoA0k0fLufcmETFgHq4n8GZt9sOgfLAysjZMBD3x5+VPpW+3Qbtun0ZbiieMMuEqrUQDjncTtjtK3koQpm+9qGRetGaqEQoZ1mjLLgxETnYA7kAfV61fk6JlXnRduruDJpCCsJ/W3gNAKzkW0210bjdYDmDElwUJlSsk/a2BJKbxn/cXBYq4VA/u9C9U3xDZ4IydtMv10LDeimEicSIQ75EyHMKS5IEOhl0EDuPs1CTbscAaAyLpRPSi9ct2c1IjopHV6z0JYtpNqiV5of68mvyAneNRG9SHG/zaIyVeXRCibbffOYsRq93beYdiyveJkINtTlHmKp9RSsbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAAdnkqM+Vn8HwqaekYiWcyuaug5GoIeCFzTcY0/ORU=;
 b=O/qL/CBJWWbqrSvqXkK9dZ5xmqAv1zHCeGMXIe2tm4g0yTbfzvPRxKMvg0PhoiHYwb5QL6ZoN7i8wIi//r6NJrFwTCUHvhTzVSRmVHliH7JR//7g1FCq/45TJBgeVWbjeZWqHHV76FT3AaJQ9q5Xw0LKAFoly4gVz/xifbRyRtFS+1Rir57PYTdq+iU8Q5MZHYUHYdXRmvYrLPuDoEMe/EQl46kGRTrfZGeZny699Lz77swhU7FJrAokYsEa3WHG1ma8vja0sVm1zVryb7IKtaFe9HS3ne4UnY0KCa0b4gpAK8Yig/y0KoZr/OesWj1OWyGSanNQpfNHCu+nv1jx0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAAdnkqM+Vn8HwqaekYiWcyuaug5GoIeCFzTcY0/ORU=;
 b=i0IH/pi+QNabXQd4kszicqrZc9ITjC4BmO0eiPqPDnrb9xRVvXqWqFln0mrytImiy2qszq/91WTCI059tcEXWKFcWaHLjNr3TXPff2jANQqvli3/xEVH+8hTAPo1Ama+uTB1zUXtt/QEryGU+YLxBbHCASugU14rRcxkNvADEtk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by VI1PR01MB6927.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:17d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Mon, 13 Jan
 2025 19:24:22 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 19:24:22 +0000
Date: Mon, 13 Jan 2025 20:24:20 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: Khem Raj <raj.khem@gmail.com>
CC: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH] spectre-meltdown-checker: New recipe to
 check hardware vulnerability
Message-ID: <3qzcj5xrgvprs5zvirsrxythll36eebjuoo43tzebhvl23bido@4hsgliqaz4bb>
References: <e26acb8229abc26b88bcaa76a54829e9be2b2ee5.1736613424.git.joerg.sommer@navimatix.de>
 <CAMKF1sqWVybooyT3XgLFpESU4JeWS8yQJ6XAUTu-=y-EAhfEmw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMKF1sqWVybooyT3XgLFpESU4JeWS8yQJ6XAUTu-=y-EAhfEmw@mail.gmail.com>
X-ClientProxiedBy: BE1P281CA0203.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:89::12) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|VI1PR01MB6927:EE_
X-MS-Office365-Filtering-Correlation-Id: 400c5dac-7b6e-475f-e606-08dd3407e25f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Bs9rMNB7mDHk5e5Pa5ojmxpqYanLkM7+Y8x6QFBNzUqRP237cswt0HvnWbFJ?=
 =?us-ascii?Q?u4FrCGjxg0P++sXPUGSa4VnBHJV8eLEUR4AFsnmx3WnbpNB3NfID5Xe4dSjv?=
 =?us-ascii?Q?4MzmYojO40FzYl66W2nrPkwy20Az1j6azmI9wV/ECjfKpOcC582QplLaN9dg?=
 =?us-ascii?Q?7UrH1pMpggKwAiFaCc+pB2ua5LPm0Wgd0kcN5ts5abr/YQIijndlXzr6sT3B?=
 =?us-ascii?Q?98BgtJfNwXLFp54HQEWSYjAnaHM1K02zZ6XZzdHfLEJ/qLCNQx5EUcKVgKxs?=
 =?us-ascii?Q?6FY8rgLWJl1eHldAsBY1lLkuKQNkHFuqd70jXHcIbzqkU2z3AZdWOQZ1DQz3?=
 =?us-ascii?Q?2lfRg5H9EFeZsyq41yBiFDlYRYdpx9oRhQLT4kCSVeJhHVpe1At5wRifpT7W?=
 =?us-ascii?Q?v2eT96nf/QMxtP6zFHJY2qmW4ATRTImjY5vGPvbd6eD+v7xwOYcvXLqksdVF?=
 =?us-ascii?Q?6aO12qEJO//0sMEoD8SsPjtRp/fDjc3lMVbBAuxe9y1Yi2nT5UKqnnfxt+M4?=
 =?us-ascii?Q?SPP+x2ve0yi2UjZlBiKC/7dZ/bmJ7OYl2e67ynZwgURd/WhImbDbHS8Z2sDp?=
 =?us-ascii?Q?Z2zEvixxYiuTd7sJKFKj91csBIv4Qi7P8isCJ3bEMxR5XMFca8w51WuLeeHG?=
 =?us-ascii?Q?Af20sfAs0WeGaW5VZ8u+FOuF/ufnSTpOAS3kn6LZRDNKwL7krnrtWeue9qWh?=
 =?us-ascii?Q?jrzV5wx+ThrKyGTzLL0JXkX9Ll8Anlv8U3Ni4E45LUKtvk8UYTC2SEGYuHWP?=
 =?us-ascii?Q?CXey3t1nnFY+YBYbQFS6RQmo1rR49oUwvjabceoy4ziYiKy9O4F8+hWs9Mxl?=
 =?us-ascii?Q?uWE9XB0QLKgs9fktGgkPAdgsTliyLrxAh7HabjcCpy945OhrVxdhMTdchqOj?=
 =?us-ascii?Q?aPVwi+ubVw/5zeS/dWF4LJHDkb1IPl44Fz+z60xUS6SQEP6H/MZyeXyLOOMZ?=
 =?us-ascii?Q?8A6M7fElmNffyGQH6Zz9rDTzGsoFzpz7QY9iqSvTgHkrqC8aIw4uyojzKcQg?=
 =?us-ascii?Q?xzymCkCD/mdkEJwVXzZiWKqvOkK8f81WIAP/fwwbPDFL2uT+RYzZRY2oTHqr?=
 =?us-ascii?Q?95J1hwzCI0XPhQTyWaUWbNoCFeUgwxcLTn4IEZEnrl0mQPpPTq0FMNSKRV05?=
 =?us-ascii?Q?Id3mzdceQraEN7oRqcWyFKzJjxrlg7i2uvFFHLqddvxPA+qPI9auM2bn4Mv6?=
 =?us-ascii?Q?qZLU02WbOzWcl4+78yjICunspqRjPQq9fmLLOopcaq+uPBbRN2kByKd+gPH6?=
 =?us-ascii?Q?pl4dfgZQ7FxLQBOQ0qIqRVGiN7+jw9sBB9oTMVX5ydyCgvBFywNWQWDX7RF/?=
 =?us-ascii?Q?DUHdn84BUmlMVVXNmc/PLNV2?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4022899009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?D8GT9EzHDrclmPIEb5i1gdB2Yw0PbNcvhmGgwa4Z3vWFqWa7/MaYzEj/wx/r?=
 =?us-ascii?Q?xtxMTN4uezr4tizqKn/3irrXAOvbOklDwTgkdrsJPoprp2n7iIRI4kqf43xV?=
 =?us-ascii?Q?uRDePHNcypGHHHoLSY31dQq5ZFgEjWNx3myHpR0XjiY2GuuRCgw7GoVS/0Hz?=
 =?us-ascii?Q?M7f8EIIBh1EVi+/kQF/v34p/8WYHGps+RKRY6mzIb7Bdo6wKd+DO+byqd7lh?=
 =?us-ascii?Q?CdhPsDuSsS599ZnVkoCzmKayWqEkVHfBrcruN/YvNFmLjjaD3gOX0iHuYwDe?=
 =?us-ascii?Q?PMGR6+YXCI25/M/Dpb4ucvhPdvu2anyWA4n1CVWN8QWF49xlfGszROg7zqCx?=
 =?us-ascii?Q?ftNA+b6cgRp12WPjLONXLyIftktrwYhqXNkjJlSsJtlFu/b2FsxEkFbmqrU4?=
 =?us-ascii?Q?rTkmvIKFi5xB49ArZfehWfxW/tW8Fqi79NOIhEOze2nBudoDZaeUDbym9jqv?=
 =?us-ascii?Q?aHaG9Vqt+7I9swbkdZOoyZtNMNT+jjgkK6iHLz4xf4GMNVI8bg5FlX6fv81Y?=
 =?us-ascii?Q?5hk1r2mZgzb1z/dy7bqVR4wXmM8h92RisWIiF0cYiPRdAoe+zDeCtExFlTOA?=
 =?us-ascii?Q?jI362SE7dDuwcgydRJBK3CisdKy/L8FiBcmMk9B3IJynCPztO5e1Fwq4++p+?=
 =?us-ascii?Q?ZGqRnldO+5mgJIsfh7Dn4nn8ZJgiNjYZLSbO2EcybvbNjTStL/HpkbQxLjq0?=
 =?us-ascii?Q?jd1y4AEEsTHwQCYWpOMS9Qs5fjSodvHso6oHCnDy7VJjqMm5Blasxovh39wa?=
 =?us-ascii?Q?zpkhqSIOh8uEoCfxQFA/JGl6OBQlKB6zYPAk0/4PdtRRINLax2/3rJQYjJTY?=
 =?us-ascii?Q?q1jTvmleKcC5BA8lloI0xFHh32XmQj3dynulKwb0AnQmDhBxHdPzRp/cgHeH?=
 =?us-ascii?Q?NnrGl+5esTtctYwOlv814jxoTOeUR/2Xxi7yeLDvTDvnKFOSFnQBrAlJXtBi?=
 =?us-ascii?Q?d75D+tYKVB6bB+snbGT++SeZ2x+ZUIk31XVoJBZTE+XXXHOy+8SXm/eky4iX?=
 =?us-ascii?Q?qKEEWm7XwcoE8YGzIH6Nms0MZhLCTuFhds3Dg7v/x9kVgFH0pHpiJVFVkqGa?=
 =?us-ascii?Q?4iW7c5djztzppZh1MhIlspiqJGz56nSqxAXqZll7Q5RpLG0PzT16xkMzutfc?=
 =?us-ascii?Q?GfOx9NvC7guINnA54u0Gr4XVQfAH88K5Yt2L3pgdFRSAMTmSYr7X0GwasXwC?=
 =?us-ascii?Q?nz4mGjb+dRJ4gJjjBMLSkQt5wJQ/V+tDojbvYmVm6iskvNFAWwKQr5+ybv8h?=
 =?us-ascii?Q?vtQ00vG2VR2ndSpQUz2XIPb3ZeCmCbW7tdlS1TCdSKI/WA9+erefJJ1+bOra?=
 =?us-ascii?Q?TcHZQB9tBuhWLk9W/knhIcFjE58ZlR71x2BALfi+aXmJB1rQjJbVtftah9Jw?=
 =?us-ascii?Q?l/zFrRuMCFkImR8v6zTGv/0hR55ddLHfnLWMHn7t8RJ3IcoBwxT+PrxiqI4J?=
 =?us-ascii?Q?Tgm3sbdSXSPAVcwp7vBRSE0zI5urNRy5VUGofWMjiWqK+cv7VKowgytQQI/i?=
 =?us-ascii?Q?qYozX1RC88rgJJHMSHgcr4/uA90RCHrpQzXVnA43wVO18eCKMmcU5/1INeB5?=
 =?us-ascii?Q?DbG8/6l2NYAEtvoINyvoz/sShv/morMCoNG/0TDnjaOZM9D82Y5x0VxKDuyV?=
 =?us-ascii?Q?PA=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 400c5dac-7b6e-475f-e606-08dd3407e25f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 19:24:22.4860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bkt/7j3Aer+fDB8Lp7o4Ohgd3XfJplVPo+6dt0dDlektIFxBkCeheP1BbwJskItY9OziVHX6b4EGyVi8SAk1bFLxE1ClxHEewiLPWX4d3Kw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR01MB6927
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 19:24:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114839

Khem Raj schrieb am Mo 13. Jan, 10:10 (-0800):
> seeing this
>=20
> ERROR: Nothing RPROVIDES 'msr-tools' (but
> /mnt/jenkins/workspace/Yocto-world-musl/sources/meta-openembedded/meta-oe=
/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_0.46.bb
> RDEPENDS on or otherwise requires it)
> msr-tools was skipped: incompatible with host aarch64-yoe-linux-musl
> (not in COMPATIBLE_HOST)
>=20
> Perhaps this recipe should be limited to x86 arch like msr-tools

It works fine on arm. Instead I would remove the msr-tools. There are other
fall-back options using perl or something. And if everything fails, it
prints message and doesn't crash or something. The MSR is only checked for
some tests, so others report valuable results.

> On Sat, Jan 11, 2025 at 8:37=E2=80=AFAM J=C3=B6rg Sommer via lists.openem=
bedded.org
> <joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:
> >
> > From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> >
> > Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> > ---
> >  .../spectre-meltdown-checker_0.46.bb          | 36 +++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> >  create mode 100644 meta-oe/recipes-security/spectre-meltdown-checker/s=
pectre-meltdown-checker_0.46.bb
> >
> > diff --git a/meta-oe/recipes-security/spectre-meltdown-checker/spectre-=
meltdown-checker_0.46.bb b/meta-oe/recipes-security/spectre-meltdown-checke=
r/spectre-meltdown-checker_0.46.bb
> > new file mode 100644
> > index 0000000000..c2996415ad
> > --- /dev/null
> > +++ b/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdow=
n-checker_0.46.bb
> > @@ -0,0 +1,36 @@
> > +SUMMARY =3D "Hardware vulnerability and mitigation checker"
> > +DESCRIPTION =3D "\
> > +    Reptar, Downfall, Zenbleed, ZombieLoad, RIDL, Fallout, Foreshadow,=
 Spectre, \
> > +    Meltdown vulnerability/mitigation checker for Linux & BSD \
> > +"
> > +HOMEPAGE =3D "https://github.com/speed47/spectre-meltdown-checker"
> > +BUGTRACKER =3D "https://github.com/speed47/spectre-meltdown-checker/is=
sues"
> > +LICENSE =3D "GPL-3.0-only"
> > +LIC_FILES_CHKSUM =3D "file://spectre-meltdown-checker.sh;beginline=3D2=
;endline=3D2;md5=3D3ae5399e70af7be9b93f72568069e2f4"
> > +
> > +SRC_URI =3D "git://github.com/speed47/spectre-meltdown-checker;protoco=
l=3Dhttps;branch=3Dmaster"
> > +SRCREV =3D "b8f8c81d519435c0871b13f02b5c4a72c5bffd5e"
> > +
> > +S =3D "${UNPACKDIR}/git"
> > +
> > +# binutils: readelf,objdump might be used for deeper analysis
> > +# coreutils: dd with iflag=3Dskip_bytes oflag=3Dseek_bytes in some cas=
es
> > +# kernel-dev: /boot/config is used
> > +# perl: sometimes used when other tools (dd, rdmsr/wdmsr) are missing
> > +RRECOMMENDS:${PN} =3D "\
> > +    binutils \
> > +    coreutils \
> > +    kernel-dev \
> > +    msr-tools \
> > +    perl \
> > +"
> > +
> > +INHIBIT_DEFAULT_DEPS =3D "1"
> > +
> > +inherit allarch
> > +
> > +do_compile[noexec] =3D "1"
> > +
> > +do_install() {
> > +    install -m 755 -D ${S}/${PN}.sh ${D}${bindir}/${PN}
> > +}
> > --
> > 2.45.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#114816): https://lists.openembedded.org/g/openembed=
ded-devel/message/114816
> > Mute This Topic: https://lists.openembedded.org/mt/110555586/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

--=20
Ein Mensch sieht ein und das ist wichtig,
nichts ist ganz falsch und nichts ganz richtig.
                                               (Eugen Roth)

Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

