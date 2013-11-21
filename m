Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 16E186D611
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2013 17:28:02 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id c13so21689eek.16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2013 09:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FndCgQqsSxAaH3J64Fzy6BUvDrAdk5g17tFOoxAQ0NI=;
	b=IIgly4NpCCEdXgXPqzSfnwwoxHpMH0BClYjmphki4/MnnGYZ1MQrleP6EO/8Cy8JWI
	vfU9iPVtDGhIyGksUYUsjfJ+Ta59n5JRSP+cFBU8OtUF/1r2LY/bzV/e/sUzPxF3ABW0
	NvY30Mm/Gz74nT4+iWPBDIvEO4P3eP4ef6Suvvjh6JesVW6fLwRKauhQsLN5obhPjYbj
	OPqvZBFqTaQOxeG2luv41W0/emuL1XOV0+c+NzFXh16zWYsUonUBVdwNQOg9s3yF4D68
	CTaK7YPeZp9FfjNHG8Fp9LGTgXwpH7Y5+iyrnaj6/1rx+a9176fejG/xB6mFDfuLQsQC
	cxEA==
X-Received: by 10.15.35.135 with SMTP id g7mr44904eev.139.1385054881139;
	Thu, 21 Nov 2013 09:28:01 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id x4sm72097889eef.1.2013.11.21.09.27.59
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Nov 2013 09:28:00 -0800 (PST)
Date: Thu, 21 Nov 2013 18:28:04 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131121172804.GZ3708@jama>
References: <CAP71Wjy9mGKjDnzAKED7zFUY6J1c_2-ysUpH8uHgczZe5zNi9A@mail.gmail.com>
	<20131121123904.GX3708@jama>
	<CAP71WjxW7KZp3D+gTEGV2ZzDfwPhwxqLUP5qw4Rj4XN_z1=cQA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71WjxW7KZp3D+gTEGV2ZzDfwPhwxqLUP5qw4Rj4XN_z1=cQA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Andre Draszik <andre.draszik@linaro.org>
Subject: Re: making qt5 package machine specific
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
X-List-Received-Date: Thu, 21 Nov 2013 17:28:04 -0000
X-Groupsio-MsgNum: 47232
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dZHW955j1vPFHE0Q"
Content-Disposition: inline

--dZHW955j1vPFHE0Q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2013 at 04:11:00PM +0100, Nicolas Dechesne wrote:
> On Thu, Nov 21, 2013 at 1:39 PM, Martin Jansa <martin.jansa@gmail.com>wro=
te:
>=20
> > There are 2 ways and I'm using both in different scenarios (different
> > builds)
> >
> > 1) .inc file with
> > PACKAGE_ARCH_pn-qtbase =3D "${MACHINE_ARCH}"
> > PACKAGE_ARCH_pn-qtdeclarative =3D "${MACHINE_ARCH}"
> > ...
> > for whole qt* stack (use sstate-diff-machines.sh script to see that you
> > get them all).
> >
> > 2) SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
> > # Depending on MACHINE_ARCH GL/GLES binaries (or mesa)
> > SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D "\
> >     qtbase->other-gl-gles-provider \
> >     qtbase->mesa \
> > "
> >
> > 2) doesn't solve your MACHINE specific patches of course
> >
>=20
> thanks. how about getting something like this merged? i believe our
> situation is going to be an issue for others as well, so perhaps it's nice
> to build the infrastructure to make it simpler for people to use

Looks useful, would you mind sending it with send-email so that it
correctly shows up in patchwork (now it breaks author and commit
message).

I'll let other reviewers some time to comment, but can merge it later.

>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> From c562d011f196b1ee8ceced76833dc80e48dd599f Mon Sep 17 00:00:00 2001
> From: =3D?UTF-8?q?Andr=3DC3=3DA9=3D20Draszik?=3D <andre.draszik@linaro.or=
g>
> Date: Thu, 21 Nov 2013 13:48:45 +0000
> Subject: [PATCH] qmake5_base.bbclass: allow to set the package arch globa=
lly
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>=20
> Packages built using a (machine) specific qmake, will also be
> machine specific.
> Since it is not feasible to add PACKAGE_ARCH=3D... to each and every
> recipe that is built using qmake, we introduce a new variable,
> QMAKE_PACKAGE_ARCH, that can be set by the machine configuration as
> needed.
>=20
> We have to be careful though to only change the architecture of the
> resulting packages if we're not compiling a 'native' package.
>=20
> Signed-off-by: Andr=E9 Draszik <andre.draszik@linaro.org>
> ---
>  classes/qmake5_base.bbclass | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
> index 2db0fa3..e77dd73 100644
> --- a/classes/qmake5_base.bbclass
> +++ b/classes/qmake5_base.bbclass
> @@ -1,3 +1,15 @@
> +python __anonymous() {
> +    barch =3D d.getVar("BUILD_ARCH", True) or ''
> +    tarch =3D d.getVar("TARGET_ARCH", True) or ''
> +    # do not do anything if we are building a native package
> +    if barch =3D=3D tarch:
> +        True
> +    else:
> +        tarch =3D d.getVar("QMAKE_PACKAGE_ARCH", True) or ''
> +        if tarch:
> +            d.setVar("PACKAGE_ARCH", tarch)
> +}
> +
>  # This is useful for target recipes to reference native mkspecs
>  QMAKE_MKSPEC_PATH_NATIVE =3D "${STAGING_LIBDIR_NATIVE}/${QT_DIR_NAME}"
>  QMAKE_MKSPEC_PATH_TARGET =3D "${STAGING_LIBDIR}/${QT_DIR_NAME}"
> --=20
> 1.8.2
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dZHW955j1vPFHE0Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKOQqQACgkQN1Ujt2V2gBz6iwCgqL1L+mSLE2HoYwENo30wyEED
vLsAn0N/c4uh+lRWsGE0cgnbo07vbbeQ
=HUbA
-----END PGP SIGNATURE-----

--dZHW955j1vPFHE0Q--
