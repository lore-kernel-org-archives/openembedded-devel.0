Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id A98AC60CC9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Feb 2020 14:59:40 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id b17so3189711wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Feb 2020 06:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ixlaDX1sqdWtv0ZL71pteMu8afTcRauMLQ7OKLwKkfM=;
	b=HxhtAiVp1EYi5PLloucMU1KroM0D/j/88CVjJBA141v6ErMYmP4CSvvvbb9aQU5WL3
	igCvVHrKi0Pt+6iFSNXZJkvGbH7Srg6hTdETCRk6bGtqMq4FcrR8MhbL5ebJGMCFswp4
	gITa/ZCQt+sO8imY6K4kEsflgkkHdsB4+VgAx9GfGbj2XK5bPUapKF8hM+NbsS1YXUb8
	tBn0T0pyqCbNaLAjSsWSn1bWcPMB+IRlTivHXDAVVPpkM7BDo/nQEeIfjhENaUD9uXNW
	mp2ggSaDHrFNjIv0QFKRvqPiDpVqUYvrJSIQYG0f0pHJVXkJnB2uVFPFEBXr7UOlloGf
	mhRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ixlaDX1sqdWtv0ZL71pteMu8afTcRauMLQ7OKLwKkfM=;
	b=Cp372ZXoMa2HZ8AzbDV7BkGCUDl07I5E2Tlu5LMRJFFF0R1fD0d5zHYmG4VYdNYuDl
	35LjeZ5crMCUgJy+PeHgWU0tBWjOVxgGwdJa+1jHmpGSeJYvgPq1ZB9JTiSnzxOgKyMw
	ZCsMt8yY5Z/bZlvP5H412t3f67jGwCGOmWh5V76b2oILlvt60yzhm96sG6v1hRpAuWVD
	xtQFp7eGa6X02N3F0w5Idt3EcDV/WRYXcvRI4yGcDIrrWneoAl/5U0eEbj6CtAasDmfb
	DLcmJIQH1ab80qBZIwL2GaHp9O3Aa99IAgcEzzcIOcgQ7HEt7JG+4FAdnINOqd7yuqp1
	Rt3w==
X-Gm-Message-State: APjAAAXdijuSlrARt3hge2zoW0epc0WB3SOLVAkLfnBGzLySIrq/wzOs
	DuqlP5NPEPL4F5S/T4DjIF8=
X-Google-Smtp-Source: APXvYqwEAZ9h+ko2abAGqDO/U8/xP6MXQnag/R1LOGELe1IY5K+E+TGZiCEIWwQQOqmoxTAD/oq47A==
X-Received: by 2002:a1c:238e:: with SMTP id j136mr6249445wmj.33.1580914781268; 
	Wed, 05 Feb 2020 06:59:41 -0800 (PST)
Received: from localhost ([109.238.218.228])
	by smtp.gmail.com with ESMTPSA id o2sm8208750wmh.46.2020.02.05.06.59.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 05 Feb 2020 06:59:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 5 Feb 2020 15:59:39 +0100
To: Tim Orling <ticotimo@gmail.com>
Message-ID: <20200205145939.tadzklcfscc442eg@jama>
References: <20200130153405.26756-1-Trevor.Gamblin@windriver.com>
	<CA+chaQdLL1BnAD7Yg3=MJxjxUEOGcZoUvBodTgYCkjTAHTspXQ@mail.gmail.com>
	<CANx9H-CSjpmXB13nkBB8PSgM8a4q=T+xHpQ4FGdij5ykEM+f+A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANx9H-CSjpmXB13nkBB8PSgM8a4q=T+xHpQ4FGdij5ykEM+f+A@mail.gmail.com>
User-Agent: NeoMutt/20180716
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][zeus][PATCH v2 1/2] python-twisted: add required RDEPENDS for twistd
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
X-List-Received-Date: Wed, 05 Feb 2020 14:59:41 -0000
X-Groupsio-MsgNum: 82615
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2p5wrul2z47ptenl"
Content-Disposition: inline

--2p5wrul2z47ptenl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2020 at 08:45:26PM -0800, Tim Orling wrote:
> On Mon, Feb 3, 2020 at 8:30 PM Martin Jansa <martin.jansa@gmail.com> wrot=
e:
>=20
> > Please send this fix to normal meta-python in meta-oe/zeus:
> >
> > http://git.openembedded.org/meta-openembedded/tree/meta-python/recipes-=
devtools/python/python-twisted.inc?h=3Dzeus
> >
> > BTW: Why are you using meta-python2 with zeus branch? It imho doesn't h=
ave
> > anything which would be missing in oe-core+meta-oe zeus branch and fixes
> > like this should be resolved also for people using zeus branch without
> > overlaying them by meta-python2.
> >
> >
> Because, as I believe I have said before, I need a prior release to test
> the infrastructure on. zeus allows me to work on more than just master
> until we have the next stable release branching.

The question was for Trevor, I understood that you wanted zeus branch to
test the infrastructure, but I still don't understand why any "project"
should use meta-python2/zeus for the python2 bits which are still in
oe-core/zeus + meta-python/zeus.

I see that there are some differences in the recipes in zeus, e.g.:

martin@jama:/OE/meta-python2$ diff recipes-devtools/python/python-configpar=
ser_3.8.1.bb ../meta-openembedded/meta-python/recipes-devtools/python/pytho=
n-configparser_3.8.1.bb
1c1
< inherit setuptools python-backports-init
---
> inherit setuptools
martin@jama:/OE/meta-python2$ diff recipes-devtools/python/python-dbus_1.2.=
12.bb ../meta-openembedded/meta-python/recipes-devtools/python/python-dbus_=
1.2.12.bb
18,19c18,19
< # documentation needs python-sphinx, which is not in oe-core or meta-pyth=
on2 for now
< # change to use PACKAGECONFIG when python-sphinx is added to oe-core or m=
eta-python2
---
> # documentation needs python-sphinx, which is not in oe-core or meta-pyth=
on for now
> # change to use PACKAGECONFIG when python-sphinx is added to oe-core or m=
eta-python

But README nor your reply explained to me, what's the benefit of using meta=
-python2/zeus
instead of the existing python2 recipes which are in oe-core and meta-oe ze=
us. That's why
I've never tried to use it with zeus, nor submitted the python-numpy and py=
thon-nose
recipes which got removed from oe-core/zeus, but weren't re-introduced in m=
eta-python2
python-nose was removed in:
http://git.openembedded.org/openembedded-core/commit/?h=3Dzeus&id=3D9f07b28=
36405d86e869780f8f1ae00843eadc409
python-numpy in:
http://git.openembedded.org/openembedded-core/commit/?h=3Dzeus&id=3D4e9659f=
24e2f699effadcbe378b6a746d77ccdbd
=66rom oe-core/zeus.

> It has nothing to do with what is missing from meta-oe, it is a viable
> alternative that also helps prove out my workflow as I have EXTREMELY
> LIMITED TIME to support this.

Understood, thanks for doing this work, I'm happy to use and contribute to
master branch, it's just that I still don't understand the purpose of zeus
branch (other than testing the infrastructure by you) and I hope you agree
that bug fixes for python2 issues like the one in this thread belong
to meta-oe/meta-python zeus in first place (because that's the layer which
what most people are probably still using with zeus).

Cheers,

> On Fri, Jan 31, 2020 at 10:29 AM Trevor Gamblin <
> > Trevor.Gamblin@windriver.com> wrote:
> >
> > > From: Trevor Gamblin <trevor.gamblin@windriver.com>
> > >
> > > python-twisted is currently missing some packages for its /usr/bin/tw=
istd
> > > executable to function. Add these to the RDEPENDS list, and also clea=
n up
> > > formatting since the list is getting long.
> > >
> > > Note that a similar patch has already been submitted for master branc=
h,
> > > but the python2 version of twisted needs more explicit RDEPENDS than =
the
> > > python3 version submitted to master in order for /usr/bin/twistd to w=
ork
> > > properly.
> > >
> > > Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> > > ---
> > >  .../recipes-devtools/python/python-twisted.inc | 18 ++++++++++++++++=
+-
> > >  1 file changed, 17 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta-python/recipes-devtools/python/python-twisted.inc
> > > b/meta-python/recipes-devtools/python/python-twisted.inc
> > > index d70104dc2..024a9fa7c 100644
> > > --- a/meta-python/recipes-devtools/python/python-twisted.inc
> > > +++ b/meta-python/recipes-devtools/python/python-twisted.inc
> > > @@ -56,7 +56,23 @@ RDEPENDS_${PN} =3D "\
> > >      ${PN}-zsh \
> > >  "
> > >
> > > -RDEPENDS_${PN}-core =3D "${PYTHON_PN}-core ${PYTHON_PN}-zopeinterface
> > > ${PYTHON_PN}-incremental ${PYTHON_PN}-constantly ${PYTHON_PN}-hyperli=
nk
> > > ${PYTHON_PN}-automat"
> > > +RDEPENDS_${PN}-core =3D "${PYTHON_PN}-automat \
> > > +                       ${PYTHON_PN}-constantly \
> > > +                       ${PYTHON_PN}-core \
> > > +                      ${PYTHON_PN}-debugger \
> > > +                       ${PYTHON_PN}-hyperlink \
> > > +                       ${PYTHON_PN}-incremental \
> > > +                       ${PYTHON_PN}-misc \
> > > +                       ${PYTHON_PN}-pkg-resources \
> > > +                       ${PYTHON_PN}-pkgutil \
> > > +                       ${PYTHON_PN}-plistlib \
> > > +                       ${PYTHON_PN}-pyhamcrest \
> > > +                       ${PYTHON_PN}-pyserial \
> > > +                       ${PYTHON_PN}-setuptools \
> > > +                       ${PYTHON_PN}-unixadmin \
> > > +                       ${PYTHON_PN}-zopeinterface \
> > > +"
> > > +
> > >  RDEPENDS_${PN}-test =3D "${PN}"
> > >  RDEPENDS_${PN}-conch =3D "${PN}-core ${PN}-protocols"
> > >  RDEPENDS_${PN}-mail =3D "${PN}-core ${PN}-protocols"
> > > --
> > > 2.24.0
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >

--2p5wrul2z47ptenl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXjrYWgAKCRA3VSO3ZXaA
HOJoAJkBsmH++mz1qij5wMMKYRrYEv3V2ACeMF7g5XqcQ1dMC20UrkMA66cAlNw=
=Fd/K
-----END PGP SIGNATURE-----

--2p5wrul2z47ptenl--
