Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id A3EF36F3A2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 09:48:52 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id g15so1644218eak.15
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 01:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Gwixi0U/AA6KLP1fgpJE/3CUdoeSK4baKJ7Jzn9aHYM=;
	b=l/sSJeWurwUBuy+QpYRktwerML+Go76BTze28Vdfn6/+gYVCZUYuzQY2+uFtu/qL/o
	I0zYQs3dw7rR6DhppAm/tXihxx1abivjlg+yJLiuQ4sQbE3laZMH2q2YcJ93Q3M93bVN
	DonOIx5AwEnDJdL7tEgmIAa1/gljMuEc7abmB74/y+AbQSZk8JvA/EK4L5mDioBYO8KC
	dgTkWMQ1V9JTRIwaMX68yn+VqYKKInlvE/CGaQEOqDJJXfAZlpTNmHK8BcX66AGHzyak
	SfxEHXrhM/BWluPM/cg3+29wYcgeHXhyvKL2oPaIuV7RiW4mN/EzYYdNew03VA0tB4vL
	UcGA==
X-Received: by 10.15.61.134 with SMTP id i6mr2547418eex.106.1393494533263;
	Thu, 27 Feb 2014 01:48:53 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x2sm14750547eeo.8.2014.02.27.01.48.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Feb 2014 01:48:51 -0800 (PST)
Date: Thu, 27 Feb 2014 10:48:52 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140227094852.GX26981@jama>
References: <1393456501-30516-1-git-send-email-Martin.Jansa@gmail.com>
	<1393456501-30516-2-git-send-email-Martin.Jansa@gmail.com>
	<CAMKF1spDft7cojVXq0Q7mtmDNTdXTsr-5A1nGVxAYUJVHN6eKw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spDft7cojVXq0Q7mtmDNTdXTsr-5A1nGVxAYUJVHN6eKw@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH 2/2] ode: upgrade to 0.13
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
X-List-Received-Date: Thu, 27 Feb 2014 09:48:55 -0000
X-Groupsio-MsgNum: 48395
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kdyvsFMDMDKuFgXB"
Content-Disposition: inline

--kdyvsFMDMDKuFgXB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2014 at 04:07:01PM -0800, Khem Raj wrote:
> On Wed, Feb 26, 2014 at 3:15 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-oe/recipes-support/ode/ode_0.13.bb | 27 +++++++++++++++++++++++++=
++
> >  meta-oe/recipes-support/ode/ode_0.9.bb  | 28 -------------------------=
---
> >  2 files changed, 27 insertions(+), 28 deletions(-)
> >  create mode 100644 meta-oe/recipes-support/ode/ode_0.13.bb
> >  delete mode 100644 meta-oe/recipes-support/ode/ode_0.9.bb
> >
>=20
> git format-patch -M please
>=20
> > diff --git a/meta-oe/recipes-support/ode/ode_0.13.bb b/meta-oe/recipes-=
support/ode/ode_0.13.bb
> > new file mode 100644
> > index 0000000..8e9eb15
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/ode/ode_0.13.bb
> > @@ -0,0 +1,27 @@
> > +SUMMARY =3D "ODE is an Open Source Physics Engine"
> > +SECTION =3D "libs"
> > +HOMEPAGE =3D "http://www.ode.org"
> > +LICENSE =3D "LGPLv2.1 & BSD"
> > +LIC_FILES_CHKSUM =3D " \
> > +    file://COPYING;md5=3D1de906ee96808d9776dd72a5f9a79a22 \
> > +    file://LICENSE.TXT;md5=3D771782cb6245c7fbbe74bc0ec059beff \
> > +"
> > +# LICENSE-BSD.TXT is missing in 0.13 tarball, but COPYING still says i=
t's dual licensed
> > +# and svn repo still contains LICENSE-BSD.TXT so maybe it will return =
in next tarball
>=20
> can this be added as a patch ?

Yes, but I don't know the real intentions in upstream, so I would rather
keep it as comment and return it in next release (if they return it as
well).

>=20
> > +# file://LICENSE-BSD.TXT;md5=3Dc74e6304a772117e059458fb9763a928
> > +
> > +
> > +SRC_URI =3D "${SOURCEFORGE_MIRROR}/opende/ode-${PV}.tar.bz2"
> > +SRC_URI[md5sum] =3D "04b32c9645c147e18caff7a597a19f84"
> > +SRC_URI[sha256sum] =3D "34ce3e236e313bf109a0cb5546d2fca462aed99f29a42e=
62bc1463b803c31ef9"
> > +
> > +inherit autotools binconfig
> > +
> > +EXTRA_OECONF =3D "--disable-demos --enable-soname"
> > +
> > +FILES_${PN} =3D "${libdir}/lib*${SOLIBS}"
> > +
> > +PACKAGECONFIG ?=3D ""
> > +# if it isn't explicitly selected and "$build_os" =3D=3D "$target_os",=
 then configure will run
> > +# series of AC_TRY_RUN which won't work for cross-compilation and conf=
igure fails
> > +PACKAGECONFIG[double-precision] =3D "--enable-double-precision,--disab=
le-double-precision"
> > diff --git a/meta-oe/recipes-support/ode/ode_0.9.bb b/meta-oe/recipes-s=
upport/ode/ode_0.9.bb
> > deleted file mode 100644
> > index 8b9955e..0000000
> > --- a/meta-oe/recipes-support/ode/ode_0.9.bb
> > +++ /dev/null
> > @@ -1,28 +0,0 @@
> > -SUMMARY =3D "ODE is an Open Source Physics Engine"
> > -SECTION =3D "libs"
> > -HOMEPAGE =3D "http://www.ode.org"
> > -LICENSE =3D "LGPLv2.1 & BSD"
> > -LIC_FILES_CHKSUM =3D "file://LICENSE-BSD.TXT;md5=3Dc74e6304a772117e059=
458fb9763a928 \
> > -                    file://LICENSE.TXT;md5=3D771782cb6245c7fbbe74bc0ec=
059beff"
> > -
> > -
> > -SRC_URI =3D "${SOURCEFORGE_MIRROR}/opende/ode-src-${PV}.zip \
> > -           file://install.patch"
> > -
> > -SRC_URI[md5sum] =3D "4c03759b76a0649a6d5108c8e172e1e4"
> > -SRC_URI[sha256sum] =3D "460d0851b743b1f144ef2a8259004d6774504c95d08e93=
57a96a296111496feb"
> > -
> > -inherit autotools binconfig
> > -
> > -EXTRA_OECONF =3D "--disable-demos --enable-soname"
> > -
> > -do_configure_append() {
> > -    echo "#define dInfinity DBL_MAX" >>include/ode/config.h
> > -}
> > -
> > -FILES_${PN} =3D "${libdir}/lib*${SOLIBS}"
> > -
> > -PACKAGECONFIG ?=3D ""
> > -# if it isn't explicitly selected and "$build_os" =3D=3D "$target_os",=
 then configure will run
> > -# series of AC_TRY_RUN which won't work for cross-compilation and conf=
igure fails
> > -PACKAGECONFIG[double-precision] =3D "--enable-double-precision,--disab=
le-double-precision"
> > --
> > 1.9.0
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kdyvsFMDMDKuFgXB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMPCgQACgkQN1Ujt2V2gBxu0QCfd424Fr2OFekzQP+o8w6TgjLf
mAYAn2LrWlMnJUkPEimu1vYcyWw38sJx
=jqVW
-----END PGP SIGNATURE-----

--kdyvsFMDMDKuFgXB--
