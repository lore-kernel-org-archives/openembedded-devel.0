Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 34217609A7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Apr 2014 13:28:47 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id e49so6724999eek.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Apr 2014 06:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gzJiS1nfTHclBaMsXuoBUxn2E6zgDN/o70K8sWicGCU=;
	b=K2ydKu5KONFnBotRUZSZFH+hpKkPEuJeeFcHULzbyPHhG18pJ6acLk8cWaf1sFagBY
	M+6fBDJAnA0wDamGb39sXOaFL6Ge3u3c5i24ydIyEGLdyAP4y92lyGXwPwthKBLF7q2k
	e24/d3ScM26rY7PR3KLAFmlCRavjdWl7yYrd5FndckBXI8FP4VGnd8vYI/9TUJ8jkZuZ
	VD6tV/cFMjdaLoaffFpRVIMiazd9IfOlorAAnnO4sp+8F/8dbi6UWfb8fUXMLb9xQgS2
	iSsojpRKyYeYnyTAVmWzzH+giJFyI/fuRxsJ9g9255U2REM9tZpBoNzbcJEHo7QFmBZ9
	cWuw==
X-Received: by 10.14.94.5 with SMTP id m5mr51832653eef.23.1397482127968;
	Mon, 14 Apr 2014 06:28:47 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cb5sm41059811eeb.18.2014.04.14.06.28.45 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Apr 2014 06:28:46 -0700 (PDT)
Date: Mon, 14 Apr 2014 15:28:58 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140414132858.GB2132@jama>
References: <1397233423-26218-1-git-send-email-b.krombholz@pironex.de>
	<20140411182042.GU2132@jama>
MIME-Version: 1.0
In-Reply-To: <20140411182042.GU2132@jama>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: =?iso-8859-1?Q?Bj=F6rn?= Krombholz <b.krombholz@pironex.de>
Subject: Re: [meta-oe][PATCH 1/1] qwt-e: qwt 6.1.0 FTBFS fix for qt-embedded targets
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
X-List-Received-Date: Mon, 14 Apr 2014 13:28:49 -0000
X-Groupsio-MsgNum: 49215
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qKojvbh47KHQqxue"
Content-Disposition: inline

--qKojvbh47KHQqxue
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2014 at 08:20:42PM +0200, Martin Jansa wrote:
> On Fri, Apr 11, 2014 at 06:23:43PM +0200, Bj=F6rn Krombholz wrote:
> > - qwt 6.1.0 changed the handling of the QT_INFIX variable. Builds with =
any
> >   QT_INFIX defined will fail as the generated qmake TARGET is always
> >   libqwt.* ignoring the INFIX, but sub-projects like designer respect t=
he
> >   INFIX variable.
> > - add PR/INC_PR to force recompile.
>=20
> We're not using PR/INC_PR anymore, it will recompile because of
> signature change (OEBasicHash) and package version should be incremented
> by PR service.
>=20
> So please send v2 without adding PR/INC_PR.
>=20
> > Signed-off-by: Bj=F6rn Krombholz <b.krombholz@pironex.de>
> > ---
> > for yocto-1.4 branch, 1.5 is still on qwt 6.0.1

meta-oe/master also has qwt 6.0.1, where is patch for 6.1.0?

> >  meta-oe/recipes-qt/qwt/files/qwt-e_qt_infix.patch | 13 +++++++++++++
> >  meta-oe/recipes-qt/qwt/qwt-e_6.1.0.bb             |  2 ++
> >  meta-oe/recipes-qt/qwt/qwt.inc                    |  5 ++++-
> >  meta-oe/recipes-qt/qwt/qwt_6.1.0.bb               |  2 ++
> >  4 files changed, 21 insertions(+), 1 deletion(-)
> >  create mode 100644 meta-oe/recipes-qt/qwt/files/qwt-e_qt_infix.patch
> >=20
> > diff --git a/meta-oe/recipes-qt/qwt/files/qwt-e_qt_infix.patch b/meta-o=
e/recipes-qt/qwt/files/qwt-e_qt_infix.patch
> > new file mode 100644
> > index 0000000..3a6fb64
> > --- /dev/null
> > +++ b/meta-oe/recipes-qt/qwt/files/qwt-e_qt_infix.patch
> > @@ -0,0 +1,13 @@
> > +Index: qwt-6.1.0/qwtfunctions.pri
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- qwt-6.1.0.orig/qwtfunctions.pri	2014-04-11 16:25:59.291152505 +0200
> > ++++ qwt-6.1.0/qwtfunctions.pri	2014-04-11 16:26:25.749892402 +0200
> > +@@ -12,7 +12,7 @@
> > + defineReplace(qwtLibraryTarget) {
> > +=20
> > +     unset(LIBRARY_NAME)
> > +-    LIBRARY_NAME =3D $$1
> > ++    LIBRARY_NAME =3D $$1$${QT_LIBINFIX}
> > +=20
> > +     mac:contains(QWT_CONFIG, QwtFramework) {
> > +=20
> > diff --git a/meta-oe/recipes-qt/qwt/qwt-e_6.1.0.bb b/meta-oe/recipes-qt=
/qwt/qwt-e_6.1.0.bb
> > index 7694514..3d46a7a 100644
> > --- a/meta-oe/recipes-qt/qwt/qwt-e_6.1.0.bb
> > +++ b/meta-oe/recipes-qt/qwt/qwt-e_6.1.0.bb
> > @@ -2,6 +2,8 @@ inherit qt4e
> > =20
> >  require qwt.inc
> > =20
> > +PR =3D "${INC_PR}.0"
> > +
> >  SRC_URI[qwt.md5sum] =3D "aef0437b37f191067a6a9dc01c30ba64"
> >  SRC_URI[qwt.sha256sum] =3D "a7e3d9f1db917d186a973c5f04a316bc9607c7c357=
94d7a16de323aba5e17402"
> > =20
> > diff --git a/meta-oe/recipes-qt/qwt/qwt.inc b/meta-oe/recipes-qt/qwt/qw=
t.inc
> > index 0ac71bf..bc65db6 100644
> > --- a/meta-oe/recipes-qt/qwt/qwt.inc
> > +++ b/meta-oe/recipes-qt/qwt/qwt.inc
> > @@ -5,8 +5,11 @@ SECTION =3D "libs"
> >  LICENSE =3D "QWTv1.0"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddac2743472b0462ff3cfb4af420=
51c88"
> > =20
> > +INC_PR =3D "r1"
> > +
> >  SRC_URI =3D "${SOURCEFORGE_MIRROR}/qwt/qwt/6.1.0/qwt-${PV}.tar.bz2;nam=
e=3Dqwt \
> > -           file://qwt6-fix-linking-with-ld-gold.patch"
> > +           file://qwt6-fix-linking-with-ld-gold.patch \
> > +           file://qwt-e_qt_infix.patch "
> > =20
> >  S =3D "${WORKDIR}/qwt-${PV}"
> > =20
> > diff --git a/meta-oe/recipes-qt/qwt/qwt_6.1.0.bb b/meta-oe/recipes-qt/q=
wt/qwt_6.1.0.bb
> > index 97a53a8..eb12c1a 100644
> > --- a/meta-oe/recipes-qt/qwt/qwt_6.1.0.bb
> > +++ b/meta-oe/recipes-qt/qwt/qwt_6.1.0.bb
> > @@ -2,6 +2,8 @@ inherit qt4x11
> > =20
> >  require qwt.inc
> > =20
> > +PR =3D "${INC_PR}.0"
> > +
> >  SRC_URI[qwt.md5sum] =3D "aef0437b37f191067a6a9dc01c30ba64"
> >  SRC_URI[qwt.sha256sum] =3D "a7e3d9f1db917d186a973c5f04a316bc9607c7c357=
94d7a16de323aba5e17402"
> > =20
> > --=20
> > 1.9.2
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qKojvbh47KHQqxue
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNL4poACgkQN1Ujt2V2gByVIACfX4Mcp+7ji9VTa5CwYu3o8Lk6
UNcAnAq3fP6GiNu8/VTKBMxiZByPV0zE
=/HWL
-----END PGP SIGNATURE-----

--qKojvbh47KHQqxue--
