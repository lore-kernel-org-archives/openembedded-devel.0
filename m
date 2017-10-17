Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id DD34871AC1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 10:24:55 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id t69so2863143wmt.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 03:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=W+/lCNt3f3/Dicgf+LRkaz6QYWOiqsB/8offL7CUK/4=;
	b=DpzgpX98yEsQnBVLivvwtc/8TqRLUXI3VupIs6aoaKSuHTpGS941f82YIItD0hqGp/
	PKP9E6WdnF0eZj1hPlcCN8M204A+TNq1HUOmOdenl649yVJn2HEjACz95H5kqKZutq6J
	rb1Sb9QABes+6BBiIBTDmrUBBKPysfyyPjIBAqpv7cNB4bldRfoJzm/lV96UZ8l/4lY5
	TxPDUPK7NVdl8tyAFXDne1DhvBXzghky9USQNitBTrPKIejSElgfKYmiVgEz4DXq0iNY
	yDb5DK67u76uCVviiFNgZ9K7/IiV0NqYEus6qepxGyscpt3Xdlmf1oubvp+KCZnWK9Gy
	ZQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=W+/lCNt3f3/Dicgf+LRkaz6QYWOiqsB/8offL7CUK/4=;
	b=rsuNbDs3zg3qmyIyryCYxddw/J7HyTI3wZFVG+asPrmbIHbcxTHeJEAsIxujRee7P+
	W44IgtheJJzK2pM0Sgujt1MhjaJlrtzMCSm4bVu+RmRA1F1BxYlHvTs3c2zyEhAgyA57
	jFzNl4lF9mLkoRloCuX+3YE8P98ZoPqycjp6WJHfT8veDFqR2R0cW1XE17xYJsF4Aw+Y
	vQhYQ+TGJ62lFBUvH9vuGrydIIqej8reX1qro4/lEXeqFjrer1c+gHsJ7zWuWK94fd8q
	AxkCS2Bk+vvyDks6uAZa2K64y1cGGz1THFVjcMRX2YUkrsX4UhRZ2iMT7UjRWW+GUW4K
	kjSQ==
X-Gm-Message-State: AMCzsaVwVg0qxIB9dGbxGTUVgdFBgBvjwsfIOJbJtYgGU3C+Z7Ii4qSi
	f/Zs42W0awB9hMv0xvXtleA=
X-Google-Smtp-Source: ABhQp+T66ASimvP/ZHZnreaIYSlzI1Qxea80PKqLKJEOE6tyKUntvlIGUqzKqq44YfOIaKTZSyCQUQ==
X-Received: by 10.28.131.131 with SMTP id f125mr2861168wmd.137.1508235896392; 
	Tue, 17 Oct 2017 03:24:56 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	x73sm9402128wme.34.2017.10.17.03.24.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 17 Oct 2017 03:24:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 17 Oct 2017 12:28:04 +0200
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <20171017102804.GA4387@jama>
References: <20171016104228.18892-1-schnitzeltony@googlemail.com>
	<20171016124028.71360b0fba325a145b94bfbf@linux.intel.com>
	<CALbNGRSpy07F+E_Ou1_ieMAb0Y62PKDddxOBb+mvo2Qg-GG+LA@mail.gmail.com>
	<20171016160529.c8698d8408842a1b6df4aea5@linux.intel.com>
	<CA+chaQf0YhjxtdFqEYjuhPgdCBOqe38pvUYwqHXrgqq4dHAvHQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQf0YhjxtdFqEYjuhPgdCBOqe38pvUYwqHXrgqq4dHAvHQ@mail.gmail.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] fluidsynth: update 1.1.6 -> 1.1.8
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
X-List-Received-Date: Tue, 17 Oct 2017 10:24:56 -0000
X-Groupsio-MsgNum: 69230
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Content-Disposition: inline

--liOOAslEiF7prFVr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 16, 2017 at 10:58:16PM +0200, Martin Jansa wrote:
> It's already in master-next, if it builds fine, I don't require v2 to be
> sent.

Unfortunately it fails to build for qemux86-64, so v2 will be needed
http://errors.yoctoproject.org/Errors/Details/157327/

>=20
> On Mon, Oct 16, 2017 at 11:05 PM, Leonardo Sandoval <
> leonardo.sandoval.gonzalez@linux.intel.com> wrote:
>=20
> > On Mon, 16 Oct 2017 21:44:23 +0200
> > Andreas M=FCller <schnitzeltony@googlemail.com> wrote:
> >
> > > On Mon, Oct 16, 2017 at 7:40 PM, Leonardo Sandoval <
> > > leonardo.sandoval.gonzalez@linux.intel.com> wrote:
> > >
> > > > On Mon, 16 Oct 2017 12:42:28 +0200
> > > > Andreas M=FCller <schnitzeltony@googlemail.com> wrote:
> > > >
> > > > > * project has moved from sourceforge to github
> > > > > * autotools was replaced by cmake [1]
> > > >
> > > > Worth noting that  license changed from LGPL-2.0+ to LPGL-2.1.
> > >
> > > Yes I forgot to mention
> > >
> > > > In case you send a v2, use a lower -M value for your git-format-pat=
ch
> > > > command, this may detect the rename.
> > > >
> > > I have
> > >
> > > [diff]
> > >     renames =3D true
> >
> > I use git-format-patch which by defaults does renames with 50 of
> > similarity index (defined by -M). I believe there is a git-diff-config =
for
> > the latter value.
> >
> > >
> > > in my .gitconfig which does this job fine usually. I think rename due=
 to
> > > changes in almost all lines.
> > >
> > > V2 required?
> >
> > worth it in my opinion.
> >
> > I just format your patch with the -M2 and this is the output, indicating
> > that lots of stuff change but makes it easier to read.
> >
> > diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsyn
> > th_1.1.6.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsyn
> > th_1.1.8.bb
> > similarity index 23%
> > rename from meta-multimedia/recipes-multimedia/fluidsynth/fluidsyn
> > th_1.1.6.bb
> > rename to meta-multimedia/recipes-multimedia/fluidsynth/fluidsyn
> > th_1.1.8.bb
> > index 88981e44b..754fadc2e 100644
> > --- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
> > +++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.8.bb
> > @@ -1,23 +1,19 @@
> >  SUMMARY =3D "Fluidsynth is a software synthesizer"
> >  HOMEPAGE =3D "http://www.fluidsynth.org/"
> >  SECTION =3D "libs/multimedia"
> > -LICENSE =3D "LGPL-2.0+"
> > -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De198e9aac94943d0ec29a7dae8c=
29416"
> > +LICENSE =3D "LGPL-2.1"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfc178bcd425090939a8b634d1d6=
a9594"
> >
> >  DEPENDS =3D "alsa-lib ncurses glib-2.0"
> >
> > -SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${BP}/${BP}.tar.gz"
> > -SRC_URI[md5sum] =3D "ae5aca6de824b4173667cbd3a310b263"
> > -SRC_URI[sha256sum] =3D "50853391d9ebeda9b4db787efb23f9
> > 8b1e26b7296dd2bb5d0d96b5bccee2171c"
> > +SRC_URI =3D "git://github.com/FluidSynth/fluidsynth.git;branch=3D1.1.x"
> > +SRCREV =3D "12e7afe3a806a6b397f28e0ca4bc6bab9ebe7047"
> > +S =3D "${WORKDIR}/git"
> >
> > -inherit autotools-brokensep pkgconfig lib_package
> > +inherit cmake pkgconfig lib_package
> >
> >  PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio=
',
> > d)}"
> > -PACKAGECONFIG[sndfile] =3D "--enable-libsndfile-support,-
> > -disable-libsndfile-support,libsndfile1"
> > -PACKAGECONFIG[jack] =3D "--enable-jack-support,--disable-jack-support,=
jack"
> > -PACKAGECONFIG[pulseaudio] =3D "--enable-pulse-support,--
> > disable-pulse-support,pulseaudio"
> > -PACKAGECONFIG[portaudio] =3D "--enable-portaudio-support,--
> > disable-portaudio-support,portaudio-v19"
> > -
> > -do_configure_prepend () {
> > -    rm -f ${S}/m4/*
> > -}
> > +PACKAGECONFIG[sndfile] =3D "-Denable-libsndfile-support=3D
> > ON,-Denable-libsndfile-support=3DOFF,libsndfile1"
> > +PACKAGECONFIG[jack] =3D "-Denable-jack-support=3DON,-
> > Denable-jack-support=3DOFF,jack"
> > +PACKAGECONFIG[pulseaudio] =3D "-Denable-pulseaudio=3DON,--
> > Denable-pulseaudio=3DOFF,pulseaudio"
> > +PACKAGECONFIG[portaudio] =3D "-Denable-portaudio=3DON,-Denable-portaud=
io=3DOFF,
> > portaudio-v19"
> >
> >
> >
> > >
> > > Andreas
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> > --
> > Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWeXbMwAKCRA3VSO3ZXaA
HBlTAKCqcTOMYH0oGwdSWLI7j9EY/QVPwACguyRIksFI/yQGicuyA/SQr9ZfHag=
=ayUC
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--
