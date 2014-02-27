Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5FAAF6F3A5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 09:53:35 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id a15so1634798eae.23
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 01:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=z19fHfLhOKriYpfnw7FmrTX6YSlIXnIqpXdTAb+5sqo=;
	b=MYjkEVoCFpp8jef8zmVH1iLl+ifGEjDk35imUCPwkKHRI/AUcZjoKdDH6ZMxuRDInE
	lUL+RKU3iQIxPadFLyeWLcBoUL7turYZ1lQllFncWvp+F/kgHGp8IyeZkhrWh3+BmHzn
	xw87ZbKj++qJLjbj21wbWdD/q9DFYsi2Nrpk38fK1C4utDyrwJWhig/BlT5cMe6emDm0
	+Fbnm/p2fTXI9hK6Pf/FyweAUEa+CcM5VpYgTFfdGFXxAwaPKh7t0u4zDS9OhIkB5t2Y
	Wo0Zrqs+kX74KZyeTuJsiS4H/8aHkuA7o6RrbuQ6PGk6JAGPNRPhq+/UnH/D/ZHNVEyK
	YemA==
X-Received: by 10.15.48.1 with SMTP id g1mr12220621eew.51.1393494816532;
	Thu, 27 Feb 2014 01:53:36 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	j41sm14801756eeg.10.2014.02.27.01.53.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Feb 2014 01:53:35 -0800 (PST)
Date: Thu, 27 Feb 2014 10:53:35 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140227095335.GY26981@jama>
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
X-List-Received-Date: Thu, 27 Feb 2014 09:53:37 -0000
X-Groupsio-MsgNum: 48396
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kr6QJ6xGUOmSrVQA"
Content-Disposition: inline

--kr6QJ6xGUOmSrVQA
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

It was sent with -M..

-M48 and higher sends it like this and the default is 50%

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

--kr6QJ6xGUOmSrVQA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMPCx8ACgkQN1Ujt2V2gBwcAACaAlcaUGeJMWIHk6pI0XbYHTj0
we0AmgKhZdvyoLy8z6Yvt8e6wgoZFO8+
=7ndE
-----END PGP SIGNATURE-----

--kr6QJ6xGUOmSrVQA--
