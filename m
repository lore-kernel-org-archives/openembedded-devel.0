Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8798E6D611
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2013 17:30:47 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id b10so25163eae.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2013 09:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ORl09vh3ms1uxs/jzi9fdx9ztcFgCiUKDlEKl0R3quo=;
	b=ipcVkAOmpjQQ5hw94qae74ERFh5nu+68uLUT4yO7kah+H+lRGYuMfIppGfnwO9dDck
	iIGPo843BwAJ4ut616S4Wi5wYBQcaxUgX6/WcDLBF3LK5X5c9+BMc9GzDhiewCaZVo7o
	PkSTU3nTIIrlarQbkwJbT9bY+b9oa+STKLpCWOM+dRROPrFBEfhqvMeVFpkDTqsXNMb7
	P1ao9drSwG1KQd63N2kBitLH7+nf8LjKXqO2D6AofeSWkDMbfhiuI+Axaf2rOxnEs/rw
	TR5Wex1dBnM77RFzi/e26kGfvdxUmDc4dXqoK0LRhPFDDthaQnp57Q8kpdltETk3qmZ3
	bCQg==
X-Received: by 10.14.98.5 with SMTP id u5mr333096eef.69.1385055046783;
	Thu, 21 Nov 2013 09:30:46 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 44sm72134323eek.5.2013.11.21.09.30.45
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Nov 2013 09:30:46 -0800 (PST)
Date: Thu, 21 Nov 2013 18:30:50 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131121173050.GA3708@jama>
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
X-List-Received-Date: Thu, 21 Nov 2013 17:30:48 -0000
X-Groupsio-MsgNum: 47233
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+HwY7O+GdaLKMYOv"
Content-Disposition: inline

--+HwY7O+GdaLKMYOv
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

Ah one more comment.

qmake5_base.bbclass doesn't look like best place for it.

I guess you have only target qtbase being MACHINE_ARCH, right?

qmake5_base.bbclass can be inherited by many packages which are
TUNE_PKGARCH and don't use (depend) on target qtbase at all, so
QMAKE_PACKAGE_ARCH would be used in more recipes then where it's really
needed.

Cheers,

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

--+HwY7O+GdaLKMYOv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKOQ0oACgkQN1Ujt2V2gBxskACfawXp+Bh7T10H//g9GOuxgmu4
1xUAn0ViwYeK2YMRHBlTjMVPmQXkgYfB
=HrjV
-----END PGP SIGNATURE-----

--+HwY7O+GdaLKMYOv--
