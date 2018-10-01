Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id F1311747F3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Oct 2018 10:32:33 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id q5-v6so6835045wrw.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Oct 2018 03:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ndr87a8i0ZMqI84pdhixi6ip6puBqkLh7C2bcUXVpWU=;
	b=CTAvoaW/Rac8nW/s3hiK2qtcQJsd4UFjSPtgOFU9k8ohfmeFQFAB1KUtlBUusKpDL7
	hG+mvI7K4Mu5IkRt3Ihml8x1Gk8zZ/HTGqe12cIkRwgSsfmASC1A48gE7rJ/FetWUxTG
	x6GGGrbSayiExrO6TFDey8DyMRdsiWFtXFAuG4T/k3EmiCWr40TE+WNawKgHg4EOlnyy
	nBKO5ww6IThUmEYvgGG4fjayEjEO73KoF6QfAmjXnagTHlS4YmEwVsOfZKSVsJ+BUlCB
	IQRNPbhOldMtSsBPI4WIrYMQ0v1g62ba8h9tmdrLnEhvMZxfdgTz5EVgO2eXztXSJeL3
	0jIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ndr87a8i0ZMqI84pdhixi6ip6puBqkLh7C2bcUXVpWU=;
	b=B/kc19rQNYMb+RvZa/F09bly47NwzbRgU2s8Fj+/GV49cu1MP2DU0GMTOxkVFmO6vP
	Onc/9irG40JTz7F4fO/XMvXhKIW0DF0YPDj1rScFIKL2JI7NHrREbyuML5MMoz0WXKSo
	svWFd68gO0P2FqBFvejfVsUidCJy9+0KTRbdu3uJ4VEBjWTdTkCufkM/DfRkT5p8LDLx
	PNlPsIfMl8yESvw+mTsZNkEeI/DkTzxQppE3ZpFWgP+wTiQ7aIKmVDYXaZgKKw2vp4Ze
	NV17aTCkMLlW17yZi1aQwIXb9CSzHmNUA/OR8TdYPvepTczd1KDdJd6WA2siAd2S4JOw
	lLYQ==
X-Gm-Message-State: ABuFfohpWQjpRHnrzcIMOqohT2f/Wd3fohpWgtzRkWEwW85uyqsol085
	1ub/u/CqVqtKHpm5iCHcBLd5kbxW
X-Google-Smtp-Source: ACcGV60Ti/9Oc7abq3pp+RBCRjq3KM53etXWmdmNGOc/3lejDVcm46fivtgTBVs8UjY0YnJCVzvKbg==
X-Received: by 2002:a5d:4e0a:: with SMTP id
	p10-v6mr6871571wrt.320.1538389954519; 
	Mon, 01 Oct 2018 03:32:34 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	p195-v6sm7787300wme.32.2018.10.01.03.32.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 01 Oct 2018 03:32:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 1 Oct 2018 12:32:37 +0200
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Message-ID: <20181001103237.GK1449@jama>
References: <20180927140251.4556-1-Martin.Jansa@gmail.com>
	<20180928201454.GW594@vctlabs.com>
	<CAMKF1srXgYGFi6_Qc8sUQaK4sNR0fqpq150oeivxRocN53Rw+A@mail.gmail.com>
	<20180928210816.GX594@vctlabs.com>
	<CA+chaQdG9vsvs11RGrsCEnS07H-X9+DS8wf5fixJasWdZvC+yA@mail.gmail.com>
	<8d3122b1673b4d07979f67b179ce707c@XBOX02.axis.com>
MIME-Version: 1.0
In-Reply-To: <8d3122b1673b4d07979f67b179ce707c@XBOX02.axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] libldb: add pam to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Mon, 01 Oct 2018 10:32:34 -0000
X-Groupsio-MsgNum: 74807
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EOHJn1TVIJfeVXv2"
Content-Disposition: inline

--EOHJn1TVIJfeVXv2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 01, 2018 at 10:26:42AM +0000, Peter Kjellerstedt wrote:
> Ok, so after reading the thread mentioned below, the actual problem
> seems to be that if libpam has  been built (e.g., because pam is=20
> included in DISTRO_FEATURES), then samba will link with it even if=20
> --without-pam is specified? This seems like something that can be=20
> fixed.

Patches are surely welcome for that. There are at least 2 WIP patches
trying to do that, but neither worked.

Before oe-core c9e7a276859d38aaa03845ee09428f62760ad147 it was even
worse, because libpam could be built even without pam in
DISTRO_FEATUREs.

> Because when building without pam in DISTRO_FEATURES (as we=20
> do), then it does not seem to be a problem to build samba with=20
> --without-pam and having it work as expected. In our case, the=20
> REQUIRED_DISTRO_FEATURES =3D "pam" in the samba recipe is more of a=20
> problem...
>=20
> //Peter
>=20
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org <openembedded-
> > devel-bounces@lists.openembedded.org> On Behalf Of Martin Jansa
> > Sent: den 29 september 2018 09:45
> > To: S. Lockwood-Childs <sjl@vctlabs.com>; Khem Raj
> > <raj.khem@gmail.com>; openembedded-devel <openembedded-
> > devel@lists.openembedded.org>
> > Subject: Re: [oe] [meta-networking][PATCH] libldb: add pam to
> > REQUIRED_DISTRO_FEATURES
> >=20
> > It depends on pam DISTRO_FEATURES, because it depends on libpam since:
> > commit a95726df4bb1c898da7e4d4dbf9e2846914061e4
> > Author: Andreas M=FCller <schnitzeltony@googlemail.com>
> > Date:   Sat Sep 17 12:04:42 2016 +0200
> >=20
> >     samba: replace pam packageconfig by hard dependency
> >=20
> >     samba links against libpam even if pam is not in packageconfig and
> > libpam was
> >     built before. This patch avoid this floating dependency - other
> > solution could
> >     not be found. For those who want packageconfig back, see discussion
> > iat
> > [1] for
> >     further inspiration.
> >=20
> >     [1]
> > http://lists.openembedded.org/pipermail/openembedded-devel/2016-
> > September/109143.html
> >=20
> >     Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> >     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >     Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> >=20
> >=20
> > On Fri, Sep 28, 2018 at 11:04 PM S. Lockwood-Childs <sjl@vctlabs.com>
> > wrote:
> >=20
> > > On Fri, Sep 28, 2018 at 01:23:25PM -0700, Khem Raj wrote:
> > > > On Fri, Sep 28, 2018 at 1:19 PM S. Lockwood-Childs
> > <sjl@vctlabs.com>
> > > wrote:
> > > > >
> > > > > Could you explain commit 0db9697dc6b8c a little bit, where libpam
> > > became a
> > > > > distro requirement for samba itself? I'm not sure why pam is a
> > hard
> > > > > requirement, rather than being PACKAGECONFIG option. I haven't
> > tried
> > > the server
> > > > > ipk built with --without-pam but the client-side pieces are
> > certainly
> > > useful.
> > > > > I've got a bbappend to override the pam forcing, and was just
> > > wondering if
> > > > > this change might be upstreamable.
> > > >
> > > > its lack of fine grained packaging that this was needed. If you can
> > > > sort this out then I am all ears
> > >
> > > What are the packaging problems to be solved when pam support is
> > disabled?
> > >
> > > Like I said we're only running the client-side stuff so far, so I'm
> > > guessing
> > > the problems came up in server-side packages. There were no build
> > errors
> > > from
> > > --without-pam at least.
> > >
> > > >
> > > > >
> > > > > On Thu, Sep 27, 2018 at 02:02:51PM +0000, Martin Jansa wrote:
> > > > > > * dependency on samba was added recently in:
> > > > > >   libldb: Add samba to rdeps for pyldb
> > > > > >   so now we need to match samba restriction to prevent:
> > > > > >
> > > > > > ERROR: Nothing RPROVIDES 'samba' (but
> > > meta-oe/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
> > RDEPENDS
> > > on or otherwise requires it)
> > > > > > samba was skipped: missing required distro feature 'pam' (not
> > in
> > > DISTRO_FEATURES)
> > > > > > NOTE: Runtime target 'samba' is unbuildable, removing...
> > > > > > Missing or unbuildable dependency chain was: ['samba']
> > > > > > ERROR: Required build target 'meta-world-pkgdata' has no
> > buildable
> > > providers.
> > > > > > Missing or unbuildable dependency chain was: ['meta-world-
> > pkgdata',
> > > 'libldb', 'samba']
> > > > > >
> > > > > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > > > > ---
> > > > > >  meta-networking/recipes-support/libldb/libldb_1.4.1.bb | 3 ++-
> > > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/meta-networking/recipes-
> > support/libldb/libldb_1.4.1.bb
> > > b/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
> > > > > > index 99e62f66bb..3c7e5455e9 100644
> > > > > > --- a/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
> > > > > > +++ b/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
> > > > > > @@ -35,7 +35,8 @@ LIC_FILES_CHKSUM =3D
> > > "file://pyldb.h;endline=3D24;md5=3Ddfbd238cecad76957f7f860fbe9ada
> > > > > >  SRC_URI[md5sum] =3D "159a1b1a56dcccf410d1bba911be6076"
> > > > > >  SRC_URI[sha256sum] =3D
> > > "2df13aa25b376b314ce24182c37691959019523de3cc5356c40c1a333b0890a2"
> > > > > >
> > > > > > -inherit waf-samba
> > > > > > +inherit waf-samba distro_features_check
> > > > > > +REQUIRED_DISTRO_FEATURES =3D "pam"
> > > > > >
> > > > > >  S =3D "${WORKDIR}/ldb-${PV}"
> > > > > >
> > > > > > --
> > > > > > 2.17.1
> > > > > >
> > > > > > --
> > > > > > _______________________________________________
> > > > > > Openembedded-devel mailing list
> > > > > > Openembedded-devel@lists.openembedded.org
> > > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-
> > devel
> > > > > --
> > > > > _______________________________________________
> > > > > Openembedded-devel mailing list
> > > > > Openembedded-devel@lists.openembedded.org
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EOHJn1TVIJfeVXv2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW7H3xAAKCRA3VSO3ZXaA
HKTFAKCRrJlTaeSL+HXS/rYHH+6/ahoqigCeIQ3r1DzzxeiSubeUdYCVC0w9+sU=
=W6aE
-----END PGP SIGNATURE-----

--EOHJn1TVIJfeVXv2--
