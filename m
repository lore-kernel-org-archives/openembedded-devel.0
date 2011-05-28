Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQKv2-0007zI-Ap
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 May 2011 16:55:12 +0200
Received: by fxm19 with SMTP id 19so2135081fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 May 2011 07:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=aSEw7/wqK//U1LpXgPqYXJo/2xpK6A8KM6ub/vbgszs=;
	b=sVlMF/9J1/fKsbeht/YnG8QVERn2ECjEsmW5CnwprxnMCszKvqSe+fOUtBHE9bIIed
	sP8oMA/2I8MgbQSdgyCvGcXyAZnM5eJzcDSwusVDlxxHh0i/1FE8mI9LFh90BluNcRkr
	5WgyvIgbhZGNuEqtT95/bIWvBt0tK8w5v0fMU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=j23/NvpLNx6HQn9PeQHFPGOQBTBfP4TuQwJpvgM5sWCJMtV8DEApTGZsdG5YXuNC3F
	ZZfXFMygSZlbuoOYQwLdJSCMZFKBadcyrdIZeN5F6uFmG9uoS7fVTnoszKp+SJvV13ql
	vlUcV96w0Di/O7KImdyN2/CyMzkq6MBy+zbAw=
Received: by 10.223.73.199 with SMTP id r7mr3535435faj.118.1306594326525;
	Sat, 28 May 2011 07:52:06 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id q21sm179771fan.40.2011.05.28.07.52.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 May 2011 07:52:05 -0700 (PDT)
Date: Sat, 28 May 2011 16:51:59 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110528145159.GV3222@jama.jama.net>
References: <20110528080123.GR3222@jama.jama.net>
	<1306570144-17979-1-git-send-email-Martin.Jansa@gmail.com>
	<4DE1069B.2030208@gravedo.de>
MIME-Version: 1.0
In-Reply-To: <4DE1069B.2030208@gravedo.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] qt4: remove qte.sh from shared SRC_URI and PACKAGE_ARCH_palmpre
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
X-List-Received-Date: Sat, 28 May 2011 14:55:12 -0000
X-Groupsio-MsgNum: 32326
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JaUdphvQ2+4F/M7k"
Content-Disposition: inline

--JaUdphvQ2+4F/M7k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 28, 2011 at 04:28:43PM +0200, Simon Busch wrote:
> On 28.05.2011 10:09, Martin Jansa wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  recipes/qt4/qt-4.6.3.inc          |    3 ---
> >  recipes/qt4/qt-4.7.3.inc          |    3 ---
> >  recipes/qt4/qt4-embedded.inc      |    3 ---
> >  recipes/qt4/qt4-embedded_4.6.3.bb |    4 ++++
> >  recipes/qt4/qt4-embedded_4.7.3.bb |    4 ++++
> >  5 files changed, 8 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/recipes/qt4/qt-4.6.3.inc b/recipes/qt4/qt-4.6.3.inc
> > index a35d57a..36c6a56 100644
> > --- a/recipes/qt4/qt-4.6.3.inc
> > +++ b/recipes/qt4/qt-4.6.3.inc
> > @@ -19,9 +19,6 @@ SRC_URI =3D "ftp://ftp.trolltech.com/qt/source/qt-eve=
rywhere-opensource-src-${PV}.
> >             file://linux.conf \
> >             "
> > =20
> > -# Set necessary variables in the profile
> > -SRC_URI +=3D "file://qte.sh"
> > -
> >  S =3D "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
> > =20
> >  do_configure_prepend() {
> > diff --git a/recipes/qt4/qt-4.7.3.inc b/recipes/qt4/qt-4.7.3.inc
> > index 2450144..b29d892 100644
> > --- a/recipes/qt4/qt-4.7.3.inc
> > +++ b/recipes/qt4/qt-4.7.3.inc
> > @@ -16,9 +16,6 @@ SRC_URI =3D "\
> >  	file://linux.conf \
> >  	"
> > =20
> > -# Set necessary variables in the profile
> > -SRC_URI +=3D "file://qte.sh"
> > -
> >  S =3D "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
> > =20
> >  FILES_${QT_BASE_NAME}-tools                +=3D "${bindir}/qml"
> > diff --git a/recipes/qt4/qt4-embedded.inc b/recipes/qt4/qt4-embedded.inc
> > index 147126d..168a867 100644
> > --- a/recipes/qt4/qt4-embedded.inc
> > +++ b/recipes/qt4/qt4-embedded.inc
> > @@ -28,9 +28,6 @@ SRC_URI =3D "ftp://ftp.trolltech.com/qt/source/qt-emb=
edded-linux-opensource-src-${
> >  # Set necessary variables in the profile
> >  SRC_URI +=3D "file://qte.sh"
> > =20
> > -# For the palmpre we ship a modified qte.sh
> > -PACKAGE_ARCH_palmpre =3D "${MACHINE_ARCH}"
> > -
> >  S =3D "${WORKDIR}/qt-embedded-linux-opensource-src-${PV}"
> > =20
> >  QT_CONFIG_FLAGS +=3D " \
> > diff --git a/recipes/qt4/qt4-embedded_4.6.3.bb b/recipes/qt4/qt4-embedd=
ed_4.6.3.bb
> > index fe49fdb..8c883f5 100644
> > --- a/recipes/qt4/qt4-embedded_4.6.3.bb
> > +++ b/recipes/qt4/qt4-embedded_4.6.3.bb
> > @@ -5,3 +5,7 @@ PR =3D "${INC_PR}.2"
> >  QT_CONFIG_FLAGS_append_armv6 =3D " -no-neon "
> > =20
> >  require qt-${PV}.inc
> > +
> > +# SRC_URI from qt4-embedded.inc was replaced in .inc above and qte.sh =
lost
> > +# Set necessary variables in the profile
> > +SRC_URI +=3D "file://qte.sh"
> > diff --git a/recipes/qt4/qt4-embedded_4.7.3.bb b/recipes/qt4/qt4-embedd=
ed_4.7.3.bb
> > index 7e3d4b8..47176a9 100644
> > --- a/recipes/qt4/qt4-embedded_4.7.3.bb
> > +++ b/recipes/qt4/qt4-embedded_4.7.3.bb
> > @@ -8,6 +8,10 @@ QT_CONFIG_FLAGS_append_armv6 =3D " -no-neon "
> > =20
> >  require qt-${PV}.inc
> > =20
> > +# SRC_URI from qt4-embedded.inc was replaced in .inc above and qte.sh =
lost
> > +# Set necessary variables in the profile
> > +SRC_URI +=3D "file://qte.sh"
> > +
> >  QT_CONFIG_FLAGS +=3D " \
> >   -exceptions \
> >  "
>=20
> Isn't this needing a PR bump? Are we safe that the package is exactly
> the same as before?

PR bump would be usefull only to test that I didn't break SRC_URI for=20
qt4-embedded (which you can test after -c clean) and to rebuild=20
qt4-x11-free with FEED_ARCH instead
of MACHINE_ARCH but it can be rebuilt with next change (I've killed
build on shr buildhost when I noticed building palmpre specific..).

I think buildsystem in ${S} is not looking for qte.sh in ${WORKDIR} and
we're using qte.sh in recipe only for embedded version, so I bet
resulting packages are the same.

Please confirm that I didn't break SRC_URI in qt4-embedded and if no
I'll push it without PR bump (it takes really long to build :)).

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JaUdphvQ2+4F/M7k
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3hDA8ACgkQN1Ujt2V2gBzDpACgqolgi15J8W1UxPp95IgUuxD3
PMcAoIEZGAozCDFdFL26vKujm0gfF8N1
=wk/Y
-----END PGP SIGNATURE-----

--JaUdphvQ2+4F/M7k--
