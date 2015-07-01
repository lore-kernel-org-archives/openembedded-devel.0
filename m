Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 117F465CDD
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jul 2015 13:19:33 +0000 (UTC)
Received: by widjy10 with SMTP id jy10so57547618wid.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jul 2015 06:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=D4cdAmMw6Jmdtm30ivohLFrRKHnBNdGqYYGTiEPr6vY=;
	b=V+rYk8qVy2qxJKjS531N+CWcNr0BHkNedYfe6jSsqztn8vfb1ab52mJ4MGrcv0JIx3
	L1MtIrJyvii2Db658CJFhMopYGbKtJqOQaLRRloCU9k5bF/dWhAyPsF9zqAfsfCreHN7
	i4lj1jNBIF1Fads3n+6dWTHfvEFX2u+fClVcXTb5CNhX7pE5fcJoEQE7gpzdnqy9Su0r
	7AFQ8Xz+dGOxDBKYoQrz6IvIi2WJmnBg5MkQmkIVCdGDP7ocC/Bo5qIlEZaC0OfYcf50
	dGCtwAiQ7/BL+LNDIRdG6Uo4IIMoCPfeqKB5SPmOn+2ESikxENlVjqCSSeFAEMILWhHF
	9PPw==
X-Received: by 10.194.47.164 with SMTP id e4mr47781321wjn.157.1435756773716;
	Wed, 01 Jul 2015 06:19:33 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	ef10sm2890279wjd.49.2015.07.01.06.19.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jul 2015 06:19:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 1 Jul 2015 15:19:55 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150701131955.GH2409@jama>
References: <1435741531-30306-1-git-send-email-net147@gmail.com>
	<5593B688.4070304@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <5593B688.4070304@opendreambox.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH] libconnman-qt5: new recipe
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
X-List-Received-Date: Wed, 01 Jul 2015 13:19:37 -0000
X-Groupsio-MsgNum: 56111
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mPTHnM80CEnHQ2WJ"
Content-Disposition: inline

--mPTHnM80CEnHQ2WJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2015 at 11:44:40AM +0200, Andreas Oberritter wrote:
> Hello Jonathan,
>=20
> On 01.07.2015 11:05, Jonathan Liu wrote:
> > Signed-off-by: Jonathan Liu <net147@gmail.com>
> > ---
> >  recipes-qt/libconnman-qt/libconnman-qt5_git.bb | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >  create mode 100644 recipes-qt/libconnman-qt/libconnman-qt5_git.bb
> >=20
> > diff --git a/recipes-qt/libconnman-qt/libconnman-qt5_git.bb b/recipes-q=
t/libconnman-qt/libconnman-qt5_git.bb
> > new file mode 100644
> > index 0000000..0ca57e2
> > --- /dev/null
> > +++ b/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
> > @@ -0,0 +1,17 @@
> > +require recipes-qt/qt5/qt5.inc
> > +
> > +SUMMARY =3D "Qt Library for ConnMan"
> > +HOMEPAGE =3D "https://github.com/nemomobile/libconnman-qt"
> > +LICENSE =3D "Apache-2.0"
> > +LIC_FILES_CHKSUM =3D "file://libconnman-qt/clockmodel.h;endline=3D8;md=
5=3Dea9f724050803f15d2d900ce3c5dac88"
> > +DEPENDS +=3D "qtbase qtdeclarative"
> > +PV =3D "1.0.89+git${SRCPV}"
> > +
> > +SRCREV =3D "79a8d10479ba55951ffa375a66797eedff230dd3"
> > +SRC_URI =3D "git://github.com/nemomobile/libconnman-qt.git"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +inherit pkgconfig
> > +
> > +RDEPENDS_${PN} +=3D "connman"
>=20
> I have a slightly different version in my meta-qt5 repo (fido):
>=20
> https://github.com/opendreambox/meta-qt5/commit/9e616b42e266f1c804daae1eb=
5dcf693c0f07b42
>=20
> Can you please compare both versions and make sure that the things you
> omitted aren't needed anymore? Note that libconnman-qt.inc is equal to
> the version in meta-openembedded.

Another recipe to the party :)
https://github.com/webOS-ports/meta-webos-ports/blob/master/meta-luneos/rec=
ipes-connectivity/connman/libconnman-qt_git.bb

Yes, it would be nice to consolidate all 3 in one which suits us all.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mPTHnM80CEnHQ2WJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWT6PoACgkQN1Ujt2V2gBxd/gCgo3UA7NYo1w7Zkg42EuR4TmHj
4isAoLmL90XBe1XMoTvjIYxMMBxVM3hU
=p9Sq
-----END PGP SIGNATURE-----

--mPTHnM80CEnHQ2WJ--
