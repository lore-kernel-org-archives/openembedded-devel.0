Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id B743E7391A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Sep 2015 19:10:47 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so38561200wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Sep 2015 12:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=o1XQMy1rEWkwiOeJZ3t58W0Qq2qmw0DyVka2qVlOyx8=;
	b=YStWp6ryBINVUAOAT09VPsusoyZmdsvsXEtu0OofqKE+KeqxkyCnR1hDgDAuauSCWM
	Wejb5zTg5bgmk7sOv4J9sZYJei05q6oD3EEKLSmG3HuTQrwyON1R2JC+8if5yvAfCgXF
	PDVxFY8OfHMB2hn0D7A/xBq/NAeP3YemH3nzyta5ifnsJrbyPKpAGCwIsyyFpZPHn4HZ
	IFTtWaz4vsWS9/L06LaromCHY6kcQveZsbEaDRdKLJYj1q1F8d5ZPvoedokR6XTtyi4i
	AkzFFQNWXYBaafDzEgtjG961bRs/i4qakZZN9uzv4u4MmZpsNuuFvKYGf7VzHAAlGYfZ
	OdHw==
X-Received: by 10.180.106.99 with SMTP id gt3mr19981558wib.51.1442949047080;
	Tue, 22 Sep 2015 12:10:47 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	lm3sm3311146wjc.39.2015.09.22.12.10.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Sep 2015 12:10:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 22 Sep 2015 21:10:49 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150922191049.GD2388@jama>
References: <1442651315-18493-1-git-send-email-manuel.bachmann@iot.bzh>
	<CAMKF1so0dDq2Wxq25q+hRms8rUKc24RaZH6aZbVV1H75GqC+tg@mail.gmail.com>
	<CANTDXNdodvY6dq5rt2NRgRe_FNKtfzBmXxLfExHxyVm8ZYOmjQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANTDXNdodvY6dq5rt2NRgRe_FNKtfzBmXxLfExHxyVm8ZYOmjQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH] wayland-fits: Add recipe
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
X-List-Received-Date: Tue, 22 Sep 2015 19:10:51 -0000
X-Groupsio-MsgNum: 57503
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5gxpn/Q6ypwruk0T"
Content-Disposition: inline

--5gxpn/Q6ypwruk0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2015 at 08:29:34PM +0200, Manuel Bachmann wrote:
> Hi Khem, and thanks a lot for your feedback !
>=20
> You are definitely right. For this purpose, though, we need Wayland + EGL
> support in EFL itself (wayland-fits checks for them at configure time).
>=20
> I just sent the corresponding patch to the mailing list, here it is :
>=20
> http://lists.openembedded.org/pipermail/openembedded-devel/2015-September=
/103507.html
>=20
> Feel free to give feedback. Once it is merged, I will promptly re-submit =
an
> updated "wayland-fits" recipe which optionally depends on it.

You can send PATCHv2 now, and I'll test them both together.

Thanks

> 2015-09-19 22:02 GMT+02:00 Khem Raj <raj.khem@gmail.com>:
>=20
> > On Sat, Sep 19, 2015 at 1:28 AM, Manuel Bachmann
> > <manuel.bachmann@iot.bzh> wrote:
> > > wayland-fits is a functional integration test suite
> > > for Wayland and Weston.
> > >
> > > Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
> > > ---
> > >  .../recipes-graphics/wayland/wayland-fits_git.bb   | 30
> > ++++++++++++++++++++++
> > >  1 file changed, 30 insertions(+)
> > >  create mode 100644 meta-oe/recipes-graphics/wayland/wayland-fits_git=
=2Ebb
> > >
> > > diff --git a/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
> > b/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
> > > new file mode 100644
> > > index 0000000..550e171
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
> > > @@ -0,0 +1,30 @@
> > > +SUMMARY =3D "Wayland-fits, the Wayland Functional Integration Test S=
uite"
> > > +DESCRIPTION =3D "Wayland-fits is a fully automated functional integr=
ation
> > \
> > > +test suite. Its main purpose is to test the functionality and
> > integration of \
> > > +client-side (i.e. toolkit) and server-side (compositor) implementati=
ons
> > of \
> > > +the Wayland protocol."
> > > +HOMEPAGE =3D "https://github.com/01org/wayland-fits"
> > > +LICENSE =3D "MIT"
> > > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df8d34cadaf891753c0f00c6cd=
48f08f5
> > \
> > > +
> > file://src/extensions/weston/weston-wfits.cpp;endline=3D21;md5=3D848c81=
e55cf3a30a9f6ed75f0dba7a97"
> > > +
> > > +SRC_URI =3D "git://github.com/01org/wayland-fits.git"
> > > +SRCREV =3D "f30dfa9fceb438d3687c5215093fffc21a7852fc"
> > > +
> > > +S =3D "${WORKDIR}/git"
> > > +
> > > +inherit autotools pkgconfig
> > > +
> > > +DEPENDS =3D "libcheck boost wayland weston"
> > > +RDEPENDS_${PN} =3D "weston"
> >
> > may be better to use +=3D here
> >
> > > +
> > > +EXTRA_OECONF =3D "--enable-shared --disable-static \
> > > +                --disable-efl-tests --disable-gtk-tests \
> > > +                --with-boost-libdir=3D${STAGING_LIBDIR}"
> >
> > We do have EFL and GTK support in OE, would it make sense to turn it
> > into some sort of PACKAGECONFIG ?
> >
> > > +
> > > +do_install_append() {
> > > +       rm -f ${D}/${libdir}/weston/*.la
> > > +}
> > > +
> > > +FILES_${PN} =3D "${bindir}/wfits ${libdir}/weston/*.so"
> > > +FILES_${PN}-dbg =3D "${bindir}/.debug ${libdir}/weston/.debug
> > ${prefix}/src"
> >
> > this could be +=3D as well.
> >
> > > --
> > > 1.8.3.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
>=20
>=20
>=20
> --=20
> Regards,
>=20
> *Manuel Bachmann, Graphics Engineer www.iot.bzh <http://iot.bzh> *
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5gxpn/Q6ypwruk0T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYBp7gACgkQN1Ujt2V2gBzU1ACfZouFVgQHET+cwC1DXaYy/A3H
zPgAoK4mDp6PLqwRPnKFojzO4nIFelR2
=5/Jd
-----END PGP SIGNATURE-----

--5gxpn/Q6ypwruk0T--
