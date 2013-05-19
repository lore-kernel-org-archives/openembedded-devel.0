Received: from mail-pa0-f44.google.com ([209.85.220.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Ue2SA-00069U-1e
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 May 2013 14:11:06 +0200
Received: by mail-pa0-f44.google.com with SMTP id jh10so4903651pab.17
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 May 2013 04:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=iK1qjWoVeD9ZYy8f8/lO/IADAmDl0O4zWkcIXACLYrM=;
	b=SNIQmN2z9sXLu14+9W+z8Ty4Sx6qXeLN8pkv7bVVVQc/u/6hnTGCt9odIYTRIoKX1R
	cY+LcJfnwsdTQk4CB+hvxPp3rf91LbRQKa+ZDKE78anQFKNoYGjUNzFBEHgLCa+f5Z1O
	kvXfEuFtw2CtLkb2ignz4w1nEbN5gJP3MWHMZgzbnhBqUFmLY0m6QgDzAdlOdLpyc0hj
	ui+tEdVxz/PZOSL+6Udi+qsfe9Dlo9BBU7Xe0zEXHiCOSR4nUkgBQWq6qST9U+OzDDOE
	mTyyDWBSkvbBtoL+iMZKTiXYJnj18BLsESdQhf+CM/9Buo1Ci4U5T5CLErm6v91i2wjm
	Kt+w==
X-Received: by 10.66.163.5 with SMTP id ye5mr200183pab.60.1368964366754;
	Sun, 19 May 2013 04:52:46 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	ri8sm19485534pbc.3.2013.05.19.04.52.44 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 19 May 2013 04:52:45 -0700 (PDT)
Date: Sun, 19 May 2013 13:52:36 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Philip Balister <philip@balister.org>
Message-ID: <20130519115236.GF3196@jama>
References: <1368457185-8140-1-git-send-email-philip@balister.org>
	<20130519073217.GA3196@jama> <5198B21A.5090907@balister.org>
MIME-Version: 1.0
In-Reply-To: <5198B21A.5090907@balister.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] gnuradio : Update recipe to build on all machines again.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 19 May 2013 12:11:11 -0000
X-Groupsio-MsgNum: 44785
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hUH5gZbnpyIv7Mn4"
Content-Disposition: inline

--hUH5gZbnpyIv7Mn4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 19, 2013 at 07:06:02AM -0400, Philip Balister wrote:
> On 05/19/2013 03:32 AM, Martin Jansa wrote:
> > On Mon, May 13, 2013 at 10:59:45AM -0400, Philip Balister wrote:
> >> Also updated the git repo address after recent changes in hosting.
> >>
> >> The recipe failed to build for machines without neon as a tune feature.
> >> The cmake config options have been changed so that it configures prope=
rly
> >> now.
> >>
> >> Test on armv7a, x86, and x86-64.
> >>
> >> Signed-off-by: Philip Balister <philip@balister.org>
> >> ---
> >>  meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb | 10 +++-------
> >>  1 file changed, 3 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb b/m=
eta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
> >> index edd4615..9e6998b 100644
> >> --- a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
> >> +++ b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
> >> @@ -70,7 +70,7 @@ SRCREV =3D "5f69899e059e9bea58f92af61f70fc3f63825087"
> >>  GIT_REPO =3D "gnuradio.git"
> >>  GIT_BRANCH =3D "master"
> >> =20
> >> -SRC_URI =3D "git://gnuradio.org/${GIT_REPO};branch=3D${GIT_BRANCH};pr=
otocol=3Dgit \
> >> +SRC_URI =3D "git://git.gnuradio.org/${GIT_REPO};branch=3D${GIT_BRANCH=
};protocol=3Dgit \
> >>  "
> >> =20
> >>  S=3D"${WORKDIR}/git"
> >> @@ -88,15 +88,11 @@ EXTRA_OECMAKE =3D "-DENABLE_GR_ATSC=3DFALSE \
> >>                   -DQT_LIBRARY_DIR=3D${STAGING_LIBDIR} \
> >>                   -DQT_QTCORE_LIBRARY_RELEASE=3D${STAGING_LIBDIR}/libQ=
tCore.so \
> >>                   -DQT_QTGUI_LIBRARY_RELEASE=3D${STAGING_LIBDIR}/libQt=
Gui.so \
> >> +                 ${@base_contains('TUNE_FEATURES', 'neon', \
> >> +                     '-Dhave_mfpu_neon=3D1', '-Dhave_mfpu_neon=3D0', =
d)} \
> >>  "
> >> =20
> >>  inherit distutils-base cmake pkgconfig
> >> =20
> >>  EXTRA_OEMAKE =3D "-C ${OECMAKE_BUILDPATH}"
> >> =20
> >> -# Only builds for machines with neon instructions. Problem is in upst=
ream cmake.
> >> -python () {
> >> -    if not oe.utils.contains ('TUNE_FEATURES', 'neon', True, False, d=
):
> >> -        raise bb.parse.SkipPackage("'neon' not in TUNE_FEATURES")
> >> -}
> >=20
> > Hi,=20
> >=20
> > this enables gnuradio to build on qemu* MACHINEs I'm testing and it
> > failed on all 3 because of docs generation, can you disable it?
> >=20
> > | [ 20%] /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/ar=
mv5te-oe-linux-gnueabi/gnuradio/3.6.4.1-r0/git/gr-trellis/doc/gr-trellis.xm=
l:6: warning: failed to load external entity "/home/jenkins/oe/shr-core-bra=
nches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gnuradio/3.6.4.1-r0=
/git/gr-trellis/doc/docbookx.dtd"
> > | ]>
> > |   ^
> > | warning: failed to load external entity "/home/jenkins/oe/shr-core-br=
anches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gnuradio/3.6.4.1-r=
0/git/gr-trellis/doc/docbookx.dtd"
> > | validity error : Could not load the external subset "docbookx.dtd"
> > | Document /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/=
armv5te-oe-linux-gnueabi/gnuradio/3.6.4.1-r0/git/gr-trellis/doc/gr-trellis.=
xml does not validate
> >=20
>=20
> Thanks. Do you want me to make a new patch including that and resend?

Can be in separate patch, but I would like to apply them together (so
that I don't get new failure on world builds)

> It built on my machine, I wonder if there is a host contamination issue?

docs are broken for long time:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2416

a lot of components is disabling docs (if configure option available) or
dropping them from SUBDIRs in Makefile.am with sed.

Cheers,

>=20
> Philip
>=20
> > Cheers,
> >=20
> >=20
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >=20
>=20



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hUH5gZbnpyIv7Mn4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGYvQMACgkQN1Ujt2V2gBw1+wCcCOvDip6eoLtrgvr9oRv+QB6Q
OokAmwWxbosxF3o0dDbuAAyJTmjMGJl5
=rMUK
-----END PGP SIGNATURE-----

--hUH5gZbnpyIv7Mn4--
