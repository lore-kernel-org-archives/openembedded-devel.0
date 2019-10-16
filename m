Return-Path: <trini@konsulko.com>
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
	[209.85.219.193])
	by mail.openembedded.org (Postfix) with ESMTP id D02FB6D7C1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 03:22:28 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id h7so5230804ybp.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2019 20:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=qgyYiKniyL8gyJDLn4XSAbTdgIQj+AhEapmo8ApZZ+A=;
	b=WelEI+DJc5y6ol5AfvyiVrioB9SXb+FL8ufSjUkDmx/Srx7+pQEN9OhrGAQnGDlTKx
	JbP4aH2dRi9SKPKMOfHuWDDZoeQuQUde1saxZ3cHMxtQbIO4ksaBiGC0ixMlDbWCdIRW
	wJWT20SbLMebtR0RVou4Y0dXZ3kEAWtp122pQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=qgyYiKniyL8gyJDLn4XSAbTdgIQj+AhEapmo8ApZZ+A=;
	b=q+B5ujmFYsQx5YPY4Vkce3qV1pjQocOJads9GsvzCDHBKOO7uLBROyZHONc2kEiBS3
	5FF1Xu6F+mL5yCkbrpVoWcghT58rQWuGUQExyOSKq39xy0jkm3eCzovYoWNTIaWmgdY9
	YVdirtSD+L+0CKtu9dmQrldcSRi3EKz2ywLzoKY49BTe0//rkeL2tJbTaUOZYmwi+9Kg
	2yhRHvAfFF+oy1IQddoHwIIKvCLmPEsOaJTtkaekHf5Rqdpas0RDTril0UJsUcF0VyNK
	Tu6Jgzhimq5EsJ4U5qFTAwjdylvY1sAjcG7KhNYCzKnDWYCGHmmrZFHXiE+OgMo2e3hS
	7/RQ==
X-Gm-Message-State: APjAAAWmELcP2KmIMIdqI8iYxoyb+b+z3B1YwdMjY8ruhxhFNBSIpWRi
	jd4NPXgvNKj2axuV4AZuoWtf6Q==
X-Google-Smtp-Source: APXvYqwGe61qIhXvM3FEPuHWSoiQI8R6/U9B2hB/Noj7sz5PGAPQ3Ir3DQk+4Eig8AqzvxMI8KLgYg==
X-Received: by 2002:a25:d749:: with SMTP id o70mr25838661ybg.111.1571196149151;
	Tue, 15 Oct 2019 20:22:29 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-142-8.ec.res.rr.com. [65.184.142.8])
	by smtp.gmail.com with ESMTPSA id
	t186sm5902471ywd.54.2019.10.15.20.22.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 15 Oct 2019 20:22:28 -0700 (PDT)
Date: Tue, 15 Oct 2019 23:22:25 -0400
From: Tom Rini <trini@konsulko.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191016032225.GR16029@bill-the-cat>
References: <20191014222047.22306-1-schnitzeltony@gmail.com>
	<20191015174854.GN16029@bill-the-cat>
	<CALbNGRSjsd2LJWKSKNOcC6cNiC+mZNA6EjpGi+u8UcdpDv3arQ@mail.gmail.com>
	<CAMKF1sp8KvvACfgujOUzBitKW2wD4f=aVtVZsxMMcwbrhYMkWw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp8KvvACfgujOUzBitKW2wD4f=aVtVZsxMMcwbrhYMkWw@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] pipewire: initial add 0.2.7
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Oct 2019 03:22:29 -0000
X-Groupsio-MsgNum: 80154
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9r+6lkZfxTlLzZoF"
Content-Disposition: inline

--9r+6lkZfxTlLzZoF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2019 at 07:45:32PM -0700, Khem Raj wrote:
> Tom and Andreas
>=20
> I think it will be good to converge the recipe if we want to host it in
> meta-oe such that agl also is able to use it while Andreas has time
> constraints can I ask Tom to look into delta that=E2=80=99s needed for it=
 to usable
> with AGL as well ? Secondly it would be good to keep default packageconfig
> to be common enough that covers normal case that Andreas has

Yes.  There's some parts of what we need in AGL today that's not yet
appropriate to push up here but we can get something common to both.

>=20
> On Wed, Oct 16, 2019 at 12:28 AM Andreas M=C3=BCller <schnitzeltony@gmail=
=2Ecom>
> wrote:
>=20
> > On Tue, Oct 15, 2019 at 7:48 PM Tom Rini <trini@konsulko.com> wrote:
> > >
> > > On Tue, Oct 15, 2019 at 12:20:46AM +0200, Andreas M=C3=BCller wrote:
> > >
> > > > Have 0.2.4 in meta-qt5-extra as dependency for liri-shell. Soon it
> > gets an
> > > > optional dependency for mutter so move latest to meta-oe.
> > > >
> > > > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > > > ---
> > > >  .../pipewire/pipewire_git.bb                  | 32
> > +++++++++++++++++++
> > > >  1 file changed, 32 insertions(+)
> > > >  create mode 100644 meta-oe/recipes-multimedia/pipewire/
> > pipewire_git.bb
> > > >
> > > > diff --git a/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb
> > b/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb
> > > > new file mode 100644
> > > > index 000000000..9b9b64205
> > > > --- /dev/null
> > > > +++ b/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb
> > > > @@ -0,0 +1,32 @@
> > > > +SUMMARY =3D "Multimedia processing graphs"
> > > > +HOMEPAGE =3D "http://pipewire.org/"
> > > > +LICENSE =3D "LGPLv2.1"
> > > > +LIC_FILES_CHKSUM =3D " \
> > > > +    file://LICENSE;md5=3Dd8153c6e65986f862a0550ca74a3ed73 \
> > > > +    file://LGPL;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
> > > > +"
> > > > +
> > > > +inherit meson
> > > > +
> > > > +DEPENDS +=3D " \
> > > > +    dbus \
> > > > +    glib-2.0 \
> > > > +    alsa-lib \
> > > > +    v4l-utils \
> > > > +    gstreamer1.0 \
> > > > +    gstreamer1.0-plugins-base \
> > > > +"
> > > > +
> > > > +SRC_URI =3D "git://github.com/PipeWire/pipewire.git"
> > > > +PV =3D "0.2.7"
> > > > +SRCREV =3D "14c11c0fe4d366bad4cfecdee97b6652ff9ed63d"
> > > > +S =3D "${WORKDIR}/git"
> > > > +
> > > > +
> > > > +FILES_${PN} +=3D " \
> > > > +    ${systemd_user_unitdir} \
> > > > +    ${libdir}/pipewire-0.2 \
> > > > +    ${libdir}/spa \
> > > > +    ${libdir}/gstreamer-1.0 \
> > > > +"
> > >
> > > A few thoughts.  First, there's a lot of knobs that can be set, and it
> > > might be a good idea to take a look at the recipe in AGL:
> > >
> > https://gerrit.automotivelinux.org/gerrit/gitweb?p=3DAGL/meta-agl-devel=
=2Egit;a=3Dtree;f=3Dmeta-pipewire/recipes-multimedia/pipewire;h=3D59d7d7bae=
1b0c072afbfe804857c0f7b4676766a;hb=3DHEAD
> > Sorry but I do not have the resources to test all these knobs.
> > Currently pipewire is yet another optional dependency for mutter on my
> > way to gnome-desktop (which is already a challenge). Once I got there
> > I can think of further 'optimizations'
> >
> > Cheers
> >
> > Andreas
> > >
> > > Second, it's worth keeping in mind for future updates that after v0.2=
=2E7
> > > the license changed to MIT (and yes, I know LIC_FILES_CHKSUM will cat=
ch
> > > this):
> > > https://github.com/PipeWire/pipewire/blob/master/LICENSE
> > >
> > > --
> > > Tom
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >

--=20
Tom

--9r+6lkZfxTlLzZoF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl2mjOcACgkQh/n2NdMd
dlIq7A/9EgzD/Hz/4oT7g+Mrc1YXggtbOkRi7pIFhKFPCv/qcfyfgiF1mdxKhsse
rliGa2CZFhAdWexcWM1IR42TWLoG2xJoPV6X6M4PZZYKDs/vSFrWwHglaN3eNs9x
Mxxqtk69JgFM8/AOtOZSuqjnX4vP+lW6mRFqt+ADvbjsGxRJylV8+05kvonfTtbq
Fi4+Tg0qXscW+sd/CNEGCtJ3CjzsogEIGenRkVat1r0mDza1s5vVl+N3dyCqiyZm
yxx+mcWyZbJuQ98/Huba9K+e4DS0pWsdBdZzXywJ8b4qUs4TBzvFu7BrFWmO7UZS
qlIw1xkC4LuRFRpAIpU/mxXIn5Mqqxtk8afrGiZNKdt+myvnrtCe5VLuPvdt9HuV
2ARu5NS+74JvOesvBGUsjwfE2PHj/gEUHsJva4DxAJQSBZZz5XGh34DHy6W7gXip
McT5IwA3x6QBs2jkR2C93IAvqHhcRQ4EQh0LX6fveEPnyZDELhFVg3WFEKye1jVa
QovKVOWB7beXeyRd4GOVAtG5P7BFRPKI8WGj6tCfEjKjEpwd8oCvpEOGlZWpRYm8
AoRiSKeeK6sF+29k8L7hFtXV/vVKolV7M9IaQjMbym4qD6NRTz4N0yEOqxZmwiN1
R0UQDmlZJVU2pmh4/5IZUIWryg7magWZuB6FN2ZgjVGZyWw089A=
=yNKu
-----END PGP SIGNATURE-----

--9r+6lkZfxTlLzZoF--
