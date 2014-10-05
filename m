Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id EDED96AC6B;
	Sun,  5 Oct 2014 07:05:30 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id a1so4274359wgh.23
	for <multiple recipients>; Sun, 05 Oct 2014 00:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rzaUyAivafHxJYbW7XbkMBV3ev1b4KL6zGeEwNbUOoY=;
	b=FE3g1H6BUORefrtoUZrJXLNCQrlje1JGb/qNjM4rgWF5WVXdhcZvPh827G2zB/ZDpQ
	ZzyZ2xHhaV0npkJkz125HNp3jUF/hLrP+NdUpIUzsfEdjO9MNjG3VvSWdQEoE4IRA/2w
	rS16XOxhDaLgF5KkQmuHjpzT6mnQ7M5PJWP6t4FGwhoWpCoX/NeF3N5MxRk/lFOOEKU4
	1Bs3ftvPEkXixAiJqucZVoaRmhhFVB/al+XByCKEFwQI4auRGTrBeG2hjSic5Df4OHBQ
	ckiO1KmjbzkSdlrb/eNkAMVc9S04pEQ4+bjskQN/OKEjVFBVgGVeX5Iy/q4nlJy8pLJK
	S4qA==
X-Received: by 10.194.161.231 with SMTP id xv7mr21318386wjb.78.1412492731560; 
	Sun, 05 Oct 2014 00:05:31 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ei1sm7070930wib.20.2014.10.05.00.05.30 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 Oct 2014 00:05:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 5 Oct 2014 09:06:30 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141005070630.GR25706@jama>
References: <20141003223636.170B350581@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20141003223636.170B350581@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Khem Raj : libdivecomputer: Update to 0.4.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Oct 2014 07:05:34 -0000
X-Groupsio-MsgNum: 52360
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sd7l8P2TFUHagl4l"
Content-Disposition: inline

--sd7l8P2TFUHagl4l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 03, 2014 at 10:36:36PM +0000, git@git.openembedded.org wrote:
> Module: meta-openembedded.git
> Branch: master-next
> Commit: ff593ed015a0f62d05ab91676034779242c2edc4
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3Dff593ed015a0f62d05ab91676034779242c2edc4
>=20
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Mon Sep 29 20:52:58 2014 -0700
>=20
> libdivecomputer: Update to 0.4.2

This is breaking subsurface

| In file included from libdivecomputer.c:9:0:
| libdivecomputer.h:15:19: fatal error: utils.h: No such file or directory
|  #include <utils.h>
|                    ^

which could be resolved by cherry-picking
http://git.hohndel.org/?p=3Dsubsurface.git;a=3Dcommit;h=3D57af78b

But then there are couple move issues with old subsurface and new libdiveco=
mputer

| libdivecomputer.h:22:2: error: unknown type name 'device_type_t'
|   device_type_t type;
|   ^
| libdivecomputer.h:25:2: error: unknown type name 'device_devinfo_t'
|   device_devinfo_t devinfo;
|   ^
| libdivecomputer.h:26:2: error: unknown type name 'device_clock_t'
|   device_clock_t clock;
|   ^
| libdivecomputer.h:32:2: error: unknown type name 'device_type_t'
|   device_type_t type;
|   ^
| libdivecomputer.c:25:8: error: unknown type name 'parser_status_t'
|  static parser_status_t create_parser(device_data_t *devdata, parser_t **=
parser)
|         ^
| libdivecomputer.c:25:62: error: unknown type name 'parser_t'
|  static parser_status_t create_parser(device_data_t *devdata, parser_t **=
parser)
|                                                               ^
| libdivecomputer.c:90:46: error: unknown type name 'parser_t'
|  static int parse_gasmixes(struct dive *dive, parser_t *parser, int ngase=
s)
|                                               ^
| libdivecomputer.c:121:68: error: unknown type name 'parser_sample_value_t'
|  static void handle_event(struct dive *dive, struct sample *sample, parse=
r_sample_value_t value)
|                                                                     ^
| libdivecomputer.c:159:11: error: unknown type name 'parser_sample_type_t'
|  sample_cb(parser_sample_type_t type, parser_sample_value_t value, void *=
userdata)
|            ^
| libdivecomputer.c:159:38: error: unknown type name 'parser_sample_value_t'
|  sample_cb(parser_sample_type_t type, parser_sample_value_t value, void *=
userdata)
|                                       ^
| libdivecomputer.c:212:47: error: unknown type name 'parser_t'
|  static int parse_samples(struct dive **divep, parser_t *parser)
|                                                ^
| libdivecomputer.c: In function 'dive_cb':
| libdivecomputer.c:241:2: error: unknown type name 'parser_t'
|   parser_t *parser =3D NULL;
|   ^
| libdivecomputer.c:247:2: warning: implicit declaration of function 'creat=
e_parser' [-Wimplicit-function-declaration]
|   rc =3D create_parser(devdata, &parser);
|   ^
| libdivecomputer.c:248:12: error: 'PARSER_STATUS_SUCCESS' undeclared (firs=
t use in this function)
|   if (rc !=3D PARSER_STATUS_SUCCESS) {
|             ^
| libdivecomputer.c:248:12: note: each undeclared identifier is reported on=
ly once for each function it appears in
| libdivecomputer.c:253:2: warning: implicit declaration of function 'parse=
r_set_data' [-Wimplicit-function-declaration]
|   rc =3D parser_set_data(parser, data, size);
|   ^

and upgrading subsurface switches also the UI to qt, so in the end
I haven't upgraded it, because I cannot test it in runtime anyway.

Can you look into it?
Otherwise I'll PNBLACKLIST it next week as other than this and xf86-video-g=
eode we have clean world build state.

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> ---
>=20
>  .../recipes-extended/libdivecomputer/libdivecomputer_git.bb | 13 +++++++=
------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git=
=2Ebb b/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
> index 1154dc0..6c4f4a0 100644
> --- a/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
> +++ b/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
> @@ -2,18 +2,19 @@ DESCRIPTION =3D "Libdivecomputer is a cross-platform an=
d open source library for c
>  HOMEPAGE =3D "http://www.divesoftware.org/libdc/"
> =20
>  LICENSE =3D "LGPLv2.1"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fcd118f065f900982=
c24"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D243b725d71bb5df4a1e5920b344b8=
6ad"
> =20
>  DEPENDS =3D "libusb1"
> =20
>  inherit autotools pkgconfig
> =20
> -PV =3D "0.0.0"
> -PR =3D "r1"
> +PV =3D "0.4.2+gitr${SRCPV}"
> +
> +SRCREV =3D "5f765f91430f16932d96b3777404420aa2dd4c7c"
> +SRC_URI =3D "git://git.libdivecomputer.org/libdivecomputer.git \
> +           file://fix-ar.patch \
> +          "
> =20
> -SRCREV =3D "b7a6be15ca58cc8f89fbc8fa1a4c840e13d51092"
> -SRC_URI =3D "git://libdivecomputer.git.sourceforge.net/gitroot/libdiveco=
mputer/libdivecomputer \
> -file://fix-ar.patch"
>  S =3D "${WORKDIR}/git"
> =20
> =20
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sd7l8P2TFUHagl4l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQw7fYACgkQN1Ujt2V2gBxCLACgtFrOs55Ey9YvwWi1RUw6I9q3
ifQAnAiYUR40VIDWl1O5F/TFOeuRg/pR
=iXJj
-----END PGP SIGNATURE-----

--sd7l8P2TFUHagl4l--
