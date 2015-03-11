Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id EBD5773B21
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2015 18:15:16 +0000 (UTC)
Received: by wesx3 with SMTP id x3so11160872wes.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2015 11:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9rzDbgV3PNvllPwiFNxNP8NLQlVTwf0uNIamLa6MiVM=;
	b=XOlX1mOA+xKLuQmgSpckR2JE9IWIAM6sAzGh9wcCPbd5LwpFbPuZtWg95+WwyG2Zev
	CzdQw9INpgYr71rHpiJ+Rsn2nnAb0GE2IcvXMF7Ro4+EmNZ/5hvZuE9cuuHUJXrcqwmv
	F4x8XH8QQjxGKdC5Gr/1bZHsxQCJ6VUQ1xF0rrEOyTn59l01TtOCQ97JEjFNy/u5V8D+
	3rUN+B12F55+nEMI85w81847w/p//S8758iuQaoA5r5zqSd74RKV76fL+AFSrAoUCW3L
	a6UMGX+qWPmwwrqK0X9Iqm2Flv96r+bsSsjne/4yuizQdKH3SVpsqpdXBoAIzDJIU55p
	LxmA==
X-Received: by 10.180.205.233 with SMTP id lj9mr923730wic.74.1426097717402;
	Wed, 11 Mar 2015 11:15:17 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dj4sm6490825wjc.13.2015.03.11.11.15.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Mar 2015 11:15:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 11 Mar 2015 19:15:53 +0100
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20150311181553.GC6713@jama>
References: <20150310172917.GF2340@jama>
	<1426019866-3634-1-git-send-email-frederico@cadete.eu>
	<20150311180946.GA19558@denix.org>
MIME-Version: 1.0
In-Reply-To: <20150311180946.GA19558@denix.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Frederico Cadete <frederico.cadete@awtce.be>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH v2] qt5-git, *qtbase*, qt5everywheredemo: Fetch from code.qt.io
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
X-List-Received-Date: Wed, 11 Mar 2015 18:15:18 -0000
X-Groupsio-MsgNum: 54748
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nmemrqcdn5VTmUEE"
Content-Disposition: inline

--nmemrqcdn5VTmUEE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2015 at 02:09:46PM -0400, Denys Dmytriyenko wrote:
> Martin,
>=20
> Any ETA for when you plan to merge master-next into master with this fix?=
=20
> Thanks.

Soon, after verification build on jenkins (which is currently rebuilding
disk array).

> On Tue, Mar 10, 2015 at 09:37:46PM +0100, Frederico Cadete wrote:
> > From: Frederico Cadete <frederico.cadete@awtce.be>
> >=20
> > Gitorious disabled the git:// protocol, breaking fetches.
> > Also, this service is scheduled to stop in May 2015, so move to
> > code.qt.io.
> >=20
> > Signed-off-by: Frederico Cadete <frederico@cadete.eu>
> > ---
> >  recipes-qt/examples/qt5everywheredemo_1.0.bb | 2 +-
> >  recipes-qt/qt5/nativesdk-qtbase_git.bb       | 2 +-
> >  recipes-qt/qt5/qt5-git.inc                   | 2 +-
> >  recipes-qt/qt5/qtbase-native_git.bb          | 2 +-
> >  recipes-qt/qt5/qtbase_git.bb                 | 2 +-
> >  5 files changed, 5 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/recipes-qt/examples/qt5everywheredemo_1.0.bb b/recipes-qt/=
examples/qt5everywheredemo_1.0.bb
> > index 4f7022c..60edaa4 100644
> > --- a/recipes-qt/examples/qt5everywheredemo_1.0.bb
> > +++ b/recipes-qt/examples/qt5everywheredemo_1.0.bb
> > @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://main.cpp;md5=3D1187cb795a0=
f96bce64e63dd1a67dc2b"
> >  DEPENDS =3D "qtdeclarative qtgraphicaleffects"
> > =20
> >  SRCREV =3D "9a868f96ee63c21ceda890d8dfc9d33f093d1b6d"
> > -SRC_URI =3D "git://gitorious.org/qt-labs/qt5-everywhere-demo.git"
> > +SRC_URI =3D "git://code.qt.io/qt-labs/qt5-everywhere-demo.git"
> > =20
> >  S =3D "${WORKDIR}/git/QtDemo"
> > =20
> > diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/na=
tivesdk-qtbase_git.bb
> > index 9194a83..df80407 100644
> > --- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
> > +++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
> > @@ -5,7 +5,7 @@ require ${PN}.inc
> >  FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/${BPN}-git:"
> > =20
> >  SRC_URI =3D "\
> > -    git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BR=
ANCH} \
> > +    git://code.qt.io/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRANCH} \
> >  "
> > =20
> >  # common for qtbase-native, qtbase-nativesdk and qtbase
> > diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
> > index da962b8..84ddf49 100644
> > --- a/recipes-qt/qt5/qt5-git.inc
> > +++ b/recipes-qt/qt5/qt5-git.inc
> > @@ -5,7 +5,7 @@ QT_MODULE_BRANCH ?=3D "5.4"
> > =20
> >  # each module needs to define valid SRCREV
> >  SRC_URI +=3D " \
> > -    git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BR=
ANCH} \
> > +    git://code.qt.io/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRANCH} \
> >  "
> > =20
> >  S =3D "${WORKDIR}/git"
> > diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbas=
e-native_git.bb
> > index cebc021..5a308d4 100644
> > --- a/recipes-qt/qt5/qtbase-native_git.bb
> > +++ b/recipes-qt/qt5/qtbase-native_git.bb
> > @@ -2,7 +2,7 @@ require qt5-git.inc
> >  require ${PN}.inc
> > =20
> >  SRC_URI =3D "\   =20
> > -    git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BR=
ANCH} \
> > +    git://code.qt.io/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRANCH} \
> >  "
> > =20
> >  # common for qtbase-native, qtbase-nativesdk and qtbase
> > diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> > index d33eb68..549c92a 100644
> > --- a/recipes-qt/qt5/qtbase_git.bb
> > +++ b/recipes-qt/qt5/qtbase_git.bb
> > @@ -2,7 +2,7 @@ require qt5-git.inc
> >  require ${PN}.inc
> > =20
> >  SRC_URI =3D "\
> > -    git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BR=
ANCH} \
> > +    git://code.qt.io/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRANCH} \
> >  "
> > =20
> >  # common for qtbase-native, qtbase-nativesdk and qtbase
> > --=20
> > 2.1.4
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nmemrqcdn5VTmUEE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUAhlkACgkQN1Ujt2V2gBwqPQCgiVGCx8zoy9PS+tL77IVne+aV
o7YAoLGQnc90xN2f26/bxITPcZ+TwEl6
=LiO/
-----END PGP SIGNATURE-----

--nmemrqcdn5VTmUEE--
