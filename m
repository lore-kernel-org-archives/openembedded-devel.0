Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BABCAC02180
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 10:16:39 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.132])
 by mx.groups.io with SMTP id smtpd.web11.45366.1737022597502320076
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jan 2025 02:16:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=td1Uyy1T;
 spf=pass (domain: navimatix.de, ip: 40.107.21.132, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TqW1jsI+JJSkhyTl40athVv1MeCM0WOlZdbqjJod7+VthB4PdxgGw1Aggk7civfb91V5kg8XHLlT9tOYoptlmTy8IyZOcI2Ma4IwpgHSeAmQ4XeQZFjfQwK/Kg+3QwRnzpxUhN3zHH1YRDb9HkXshGYOv/CpWpwOxsjDLJUbCxnD+aHvWV46tVl9z7tTnh2uUUGyyumzhZz+HjSBZgxnWHZ7KVA0Yq4YWFyWKK/n8vtm1/ototUfV9W/qj313cuQQ8qUgfhgoJXorVwMKMH5saFr2vzWY92MnfXwBRGgDsSv5F9Lcc5xk8qakrr0FvIVCngiJoWi8WSEQfUbmSNQTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qowo7OcijRfy179ct0YsG4ES5qpa3iLzbvJC3/iVtlI=;
 b=YFCkEvUPRxx3cE0R5kLguZAq5zXgAG/HdP+5SxTi9sITB3HiFwF+tvWGAyquqxqxvqvLR4emTZiA6U13z8O6+4sTo0H3HHY0BYKr4EJK/+wTLv2Ln/nNRFofL4OUtmDTexV+K1Pikt9IP2ke4YSawT1w2WU/g751jRlwPMb+5STeH2UZFRrUIowBdFFDUQkmso6+EvLdQQsy/9Jk5+UUhiLdvVLcVMN3aZnfUgHKh6tDpb0JxmtFCTdQGsPhCgCvykGagIAYBIRIercjlGRrkZsvRyzGH0Rla+S4miSIcN6urY4IJKh7kVqbhjs3Bz0r4t4VwIHnSu1cyhob9d105A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qowo7OcijRfy179ct0YsG4ES5qpa3iLzbvJC3/iVtlI=;
 b=td1Uyy1TwTq703dneRX5mEctKwFy6lrEi/TUJ7kPCsMMwWLyIvEp3hcY5Oz+z8+l/WhP9elkC1Q0SIg7WWT8s3DIAC+KpdyNIPemuKX6SAKY3nsa0i1T9J3Po7PaOcc0MZdShCMoLbIohn1zlV1/CaM8rsLc1WT52wiq3QimRI0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by VI0PR01MB10676.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:255::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Thu, 16 Jan
 2025 10:16:32 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 10:16:32 +0000
Date: Thu, 16 Jan 2025 11:16:30 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
CC: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe] [PATCH] smarty: update 4.5.5 -> 5.4.2
Message-ID: <bnl66um3j23l33i7r4p2q2cl3ceu4c2puzcx4tulnuemeh3vnh@pvbuxsnzibmr>
References: <1736911952-10934-1-git-send-email-wangmy@fujitsu.com>
 <r3pwhezfvqmgh43ejzkjroffsmdoupemdh3q4v6hplgk3zregq@tni3w2fjzwaf>
 <TYWPR01MB11861B18EC4AD9079FF4602B0DC192@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <p675m3ebzd6qsu6x4kcbbowcg5ejb6bi3mlwjvlehxffklqvbo@muqhgasjljh6>
 <TYWPR01MB118617DA97D501BE821574B74DC1A2@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <qrmcdaufwt4l4rhfn72tymtzkj7ffszxwfegedgiuwfebq7735@v4gq5t4gz2vy>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <qrmcdaufwt4l4rhfn72tymtzkj7ffszxwfegedgiuwfebq7735@v4gq5t4gz2vy>
X-ClientProxiedBy: BE1P281CA0242.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::9) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|VI0PR01MB10676:EE_
X-MS-Office365-Filtering-Correlation-Id: 290da43e-acfd-4692-d826-08dd3616d99b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|27256017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eAT7RUHF3jUZapU/RNTPLKgmiAt81bjHvXtPta9ugB/V6mDeDZrIxx9pyhZo?=
 =?us-ascii?Q?nOX+JalV7qWDh056nTub8uJ9jeT0b2AkLF4Tf2M1ImT9/uuN+JZjnyblxDjy?=
 =?us-ascii?Q?HtmquWgspU7Emhyg64vILy2xk5uE7XCKVAX6hJHo5JUPhd15nDk4wNfat3/L?=
 =?us-ascii?Q?IRNyVQbzH/f+7mvBzZHMMWAnTmt2RR1u6BrIRj2LG52LxdNx4Z5r6zUD4wrV?=
 =?us-ascii?Q?CxqSBnPM6AdEya5gZzyLxzQxXcl5f4qEy6uGkAYjDwvoVBiHtCwv3bleOYna?=
 =?us-ascii?Q?SrZqP7DoBg3ADeCYz0q35iAsJeJIfbpHT0wg8ZUohzHJGdMuggR3zpfCSpkb?=
 =?us-ascii?Q?Zz+OH+fnZOxS95kAstQ2l27mvuJyOfL5b++6U0x+6o/P2+KTYlXNXeZDm6aQ?=
 =?us-ascii?Q?/vLlMXTygUfJWie0jck9BZoHKSXpPhSy3IugIxmK+xmv1UeG2cTYjd1//oqq?=
 =?us-ascii?Q?bvMWtjOc8eZCnkVJw1yX5nRGKK7STqFSgKbc+VGoV4Yt0WoV5A/cQwmjEkCK?=
 =?us-ascii?Q?u9YbLbmVWG2whtga4kBAyHP3Xl0tkPsNmaiDtOvu8wYHfnms1NliwVfrm/zd?=
 =?us-ascii?Q?xdIqWX34SBP5KO3HfC92WQLiw2RWNzXk3Q6/7dv/N8qvkkUkOM/XF9uIgBRF?=
 =?us-ascii?Q?LFnmnH7WuyiM1ifqBDbhfeMFHFKtaZ9HVFGgaEiQI7yvpVo5kl2Y23FPsCyM?=
 =?us-ascii?Q?ecLTeAaDkudd1GrcZGD8EMmStuVrI/9rvtdtEYwg3JSJT43/I1doHf9vS+iy?=
 =?us-ascii?Q?PAYDNzPgUbWysJ0EmeU9BgFTpCcT7VqMDn9vTigIFrpGjftOz6JCIcPn9TI0?=
 =?us-ascii?Q?JPHK8lxx/sq26BcVxwNQR5SSgeDU59AxZ8F3+6Fc+7H+Qz3X0GH4O09SUXJe?=
 =?us-ascii?Q?/1tDNVmIhAVyloFZg4HP7uqYVh9u1RtFY6x/YmZg96+A+WXLCND5kgSAjPC3?=
 =?us-ascii?Q?4k9UJtfiTBbJS5sFXDCkPCyCx78DVqfkZ4byNw+Y/eE97FsatQKLr6E3g/AW?=
 =?us-ascii?Q?Ny+bNsfIT2+WR7HXS4lLtLSBPtj1VBWOMde89X6MZHsKnmofYR6pII4R2DMz?=
 =?us-ascii?Q?2V8p9YbiTPMMJHlTe2/XA2auNnuw232tgnAhOAxVmo2rXpBBuCjftFUgoG0m?=
 =?us-ascii?Q?rUsdn+qJFtzsgx6L5o6AQymjx5YvIPeRRYDqsJlLGq8rcdUBmFPjmXSemYvp?=
 =?us-ascii?Q?RJdVx90IdtHgL5O4ELK0Pw/yhGRf7Fn/pptl3T7080jLGcAJA4hkejbf6RzP?=
 =?us-ascii?Q?afn9sytCi3z+RoRctjlAEAIczo6xQOgYtR4Y8XD75yddOnYZAb+TqAw968SW?=
 =?us-ascii?Q?PCfG0XYgtikBIoq+KV09gR+kRELZFhgdIylzlCM39sWab6x1iW/nAqA7Q0kp?=
 =?us-ascii?Q?uXKjoBvtVAL9i/R2pgh2p1/FUlsY?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(27256017);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WQcFITeAo057jtI+EiGniXaQTH966LgRlknaiSKwgFWtfuy6+06zqtlKlkTH?=
 =?us-ascii?Q?M6HrcqDcJi5oe5t6TiN41r2TDrfZAvROs15VBGldcpukI9NoaaHlCMobJMqi?=
 =?us-ascii?Q?i++TZL9NPX2yjWxu8Eoaq3DYm9E71350RFn7GOMjbQaNyEu+6EgFDnW0zfFE?=
 =?us-ascii?Q?TSk8Tamj3l8mh181YcP6yKsD03PvmFIENIOt9y1OHnQuZniry0OrwOKfY1ik?=
 =?us-ascii?Q?cWUgFDs+SeMRO4y6Hc49M0am0Ba6OVNlZ622sLNREXKmsFJm/+ZmUgvE8c33?=
 =?us-ascii?Q?FNIsq9tB1xcDvjMm2QmuaqzD7+wRfBkhIcUa0ktOBltaMTghRm4f+2RRdN+z?=
 =?us-ascii?Q?5TUjZ6Lkta86GH0ABRE/eWTZk6DUQVSJ+cxsg6UTXt9bsvYhKd8fPiqaTBdd?=
 =?us-ascii?Q?sgWKwxbyBOyTQ8y8QWSE5HriidJOciW/NAHc+NUyJ72l/w5dhAkNfZJOIpKC?=
 =?us-ascii?Q?1FmYTWPinUtFfVEq/T32o/fKJyF+r0RgroH992gV9asnogONv3EY9jbGVUop?=
 =?us-ascii?Q?DQd82uGDi/ne0SKx74H5SHqvRQNEAQJhOS9rubS8m5rWiL9Gznigx09g+EJs?=
 =?us-ascii?Q?OsAVzqxjL7AWcrHCRO7qGakjbveF0hVBguh/FnXC3ZgS5uFMLCU2Lf9uPDx0?=
 =?us-ascii?Q?XkumgFs5BWD33pEzxwntzX9plFdBy9C3WYyao5Ex5LvJEJOR+6cEJRVPMCfL?=
 =?us-ascii?Q?jeupDN+bw/80tabLN9M+yA12CGy6kG2ie58CETZfpcB2ZqfeO+EpAnNoaGun?=
 =?us-ascii?Q?V5duzSqX7qEcIm1rz9g9/lq0jnRN/lgiFcHU4pgA0CYePOyhfeNdAh5Muzy0?=
 =?us-ascii?Q?dBhrs4sHlTLZs13qhsA5GH1uPZXraYDyfHSK5xL56wG/Y3h9HdzD/vR6VnuH?=
 =?us-ascii?Q?ffJJUTPpHRKStoHaHNMrwkRCTBEvgfaxFYNQD+sr5965mREPCExPQd2R+9J8?=
 =?us-ascii?Q?AdiYvCJTLlyhM1yjhaSKBtDcBiSfAZiyDWhAIOES89Qybw+yheQ1Dm+BiNst?=
 =?us-ascii?Q?2VpF2Com2bnqQ6Ns8FWwPyMiylo0SoEjnZrhxKIi+B4kd3HjLk00yk8PJhqC?=
 =?us-ascii?Q?pUJkI84sb2MkO+SjlO58GE9kAU0+B5ZTVQiEdAC9TNuCI0qLg6gS64IIFO5e?=
 =?us-ascii?Q?ruKv6hezzAbo7uln3Nc2625kuL1vqrtFZLJmmeIN6WV+NjIIjglYn2ucUVqA?=
 =?us-ascii?Q?i0534s1VSxED9ZXtMp15YSHzPl6HwEvn2foR3wq48wtuDm7PdZ0wmWdvSJ5o?=
 =?us-ascii?Q?N0xs5V+41IkcEBPMc96t8v0ZgkYB2fVIH+8mhizL+9IvDf7hW0EayQMl3R/4?=
 =?us-ascii?Q?DR2RZnnCQ1AwrjbFEoT2y+5ZIIGSO+6PO2q4yqunbWVco8gCkUofuGsGYXuI?=
 =?us-ascii?Q?ap9Qq7SSBuG1hA4lLhnGFF28NfFadhCYOi471qam49lAjsfl98zY24UQ1Xv2?=
 =?us-ascii?Q?oxylb+AatwbU1VWfUU+OJdaMqKQxWv9ep/lFD7qORXRPn9EYVgWlCmVElD+3?=
 =?us-ascii?Q?kRLp5I+pSxhIWUSFVm8ASkmI0jLgYi5Wm9h7eAzZfDvS1h4otT6tWUtjECCq?=
 =?us-ascii?Q?3Sdj9SQY/vhEoVNnF79B7+S+7I7K3L6aMamVoFIyNkRk1bpKTaR0/NLjexrb?=
 =?us-ascii?Q?Cw=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 290da43e-acfd-4692-d826-08dd3616d99b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 10:16:32.5714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Q0szI8OGyinSluIy9RLQ6Sl8a7Z7bz7O6jBtzvX4hgWRDa2iYMzZh0JbXg853MgTSw2wL4p1MktqlI556P3Q3hQFHm5/6kVrJayGDePW4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR01MB10676
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Jan 2025 10:16:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114911

J=F6rg Sommer schrieb am Do 16. Jan, 10:50 (+0100):
> Mingyu Wang (Fujitsu) schrieb am Do 16. Jan, 00:39 (+0000):
> > Adding php-native to DEPENDS also doesn't work, it will report the same=
 error.
>=20
> Yes. The problem is a (somewhat) broken make clean that removes files the=
y
> can't be rebuild without composer. But composer in meta-parallel-php and =
not
> in meta-oe. So, I think the best is to mark clean as broken to prevent th=
at
> do_configure runs it.
>=20
> Here is a patch to make all working:
>=20
> diff --git meta-oe/recipes-support/smarty/smarty_5.4.2.bb meta-oe/recipes=
-support/smarty/smarty_5.4.2.bb
> index 906b9e4ee2..25eda52690 100644
> --- meta-oe/recipes-support/smarty/smarty_5.4.2.bb
> +++ meta-oe/recipes-support/smarty/smarty_5.4.2.bb
> @@ -1,21 +1,29 @@
> -DESCRIPTION =3D "the compiling PHP template engine"
> -SECTION =3D "console/network"
> +SUMMARY =3D "Template engine for PHP"
> +DESCRIPTION =3D "\
> +    Smarty facilitates the separation of presentation (HTML/CSS) from \
> +    application logic. This implies that PHP code is application logic, =
and is \
> +    separated from the presentation. \
> +"
>  HOMEPAGE =3D "https://www.smarty.net/"

I was told in
https://github.com/smarty-php/smarty/issues/1097#issuecomment-2594912113
that the new website is https://smarty-php.github.io/smarty/

> +BUGTRACKER =3D "https://github.com/smarty-php/smarty/issues"
> =20
>  LICENSE =3D "GPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2c0f216b2120ffc367e20f2b56df5=
1b3"
> =20
> -DEPENDS +=3D "php"
> -
>  SRC_URI =3D "git://github.com/smarty-php/smarty.git;protocol=3Dhttps;bra=
nch=3Dmaster"
> -
> -S =3D "${WORKDIR}/git"
> -
>  SRCREV =3D "642a97adcc2bf6c1b2458d6afeeb36ae001c1c2f"
> =20
> -do_compile() {
> -	:
> -}
> +S =3D "${UNPACKDIR}/git"
> +
> +INHIBIT_DEFAULT_DEPS =3D "1"
> +
> +inherit allarch
> +
> +# `make clean` removes files, they can't be rebuild with `make all`
> +CLEANBROKEN =3D "1"
> +
> +do_configure[noexec] =3D "1"
> +do_compile[noexec] =3D "1"
> =20
>  do_install() {
>          install -d ${D}${datadir}/php/smarty3/libs/
> @@ -24,6 +32,8 @@ do_install() {
>          install -d ${D}${datadir}/php/smarty3/src/
>          cp -rf ${S}/src/* ${D}${datadir}/php/smarty3/src/
>  }
> -FILES:${PN} =3D "${datadir}/php/smarty3/"
> +FILES:${PN} +=3D "${datadir}/php/smarty3/"
> +
> +RDEPENDS:${PN} =3D "php"
> =20
>  CVE_STATUS[CVE-2020-10375] =3D "cpe-incorrect: The recipe used in the me=
ta-openembedded is a different smarty package compared to the one which has=
 the CVE issue."
>=20
> I'm unsure about the archall, but it's PHP.
>=20
> Regards, J=F6rg
>=20
> --=20
> Als deutscher Tourist im Ausland steht man vor der Frage, ob man sich
> anst=E4ndig benehmen muss oder ob schon deutsche Touristen dagewesen sind=
.
>                                                 (Kurt Tucholsky)
>=20
> Navimatix GmbH           T: 03641 - 327 99 0
> Tatzendpromenade 2       F: 03641 - 526 306
> 07745 Jena               www.navimatix.de
>=20
> Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
> Registergericht: Amtsgericht Jena, HRB 501480

--=20
Manchmal denke ich, das sicherste Indiz daf=FCr, da=DF anderswo im Universu=
m
intelligentes Leben existiert, ist, da=DF niemand versucht hat, mit uns
Kontakt aufzunehmen.                           (Calvin und Hobbes)

Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

