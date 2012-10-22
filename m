Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TQO6b-0007Op-Eu
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Oct 2012 21:56:09 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so1597195wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Oct 2012 12:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=50KjhtRg6p0XrRW8VP6nr9MqJPi1H++cP6yuCvx0oNg=;
	b=Jraoej20bG+Tq8ihs4/V1pl1aZ2tUCOwNBgz+gOk1TvcrYQUfJ7wjfOcNyWRRcn4o6
	WqQJAx3z6sSMdIp/LOH0Lt6q5Uj330FzVgz1PeXVD/yiIAkqsR2NxXc1/0iMOX+PdnEQ
	3omafqgg1UD99YJhDaLAUkWdg9y4b0moqJUFsFvzGotYzhJBotUoDFMK+k5LhUjbNH2u
	aO27rZvdFpobMeBEDk++Ja+a3JQfajCK5Z/sXBF/I0/dk2l9VqWnBbAnzyZg/Oi2x9Hq
	BVFKbHfW7XIoak/9/RsNmtDTD87amq1iUw2yHnTcO+Uqe5sOdE7lWo8UjFwUVZkLznUl
	hoXA==
Received: by 10.216.194.97 with SMTP id l75mr5665672wen.67.1350934964314;
	Mon, 22 Oct 2012 12:42:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w8sm52529484wif.4.2012.10.22.12.42.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Oct 2012 12:42:43 -0700 (PDT)
Date: Mon, 22 Oct 2012 21:42:58 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121022194258.GK3269@jama.jama.net>
References: <1350918808-23478-1-git-send-email-s.stirtzel@googlemail.com>
	<7D46E86EC0A8354091174257B2FED10159276891@DLEE12.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED10159276891@DLEE12.ent.ti.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH v3] libjpeg-turbo: Add RPROVIDES to fix errors	when rdepending on jpeg
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
X-List-Received-Date: Mon, 22 Oct 2012 19:56:09 -0000
X-Groupsio-MsgNum: 41217
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aziWXe2aaRGlkyg3"
Content-Disposition: inline

--aziWXe2aaRGlkyg3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 22, 2012 at 07:37:26PM +0000, Maupin, Chase wrote:
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On
> > Behalf Of Samuel Stirtzel
> > Sent: Monday, October 22, 2012 10:13 AM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: [oe] [meta-oe][PATCH v3] libjpeg-turbo: Add RPROVIDES to
> > fix errors when rdepending on jpeg
> >=20
> > This fixes "ERROR: Multiple .bb files are due to be built which
> > each provide jpeg"

Btw, when I've first noticed this error it was caused by
task/packagegroup recipe having jpeg in RDEPENDS. It does not cause
problems when apps are RDEPENDing on jpeg through shlibs which is imho
better way then pulling jpeg to image through task/packagegroup.

But adding this dont hurt either case, so it's fine.

Cheers,
=20
> > Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
>=20
> Acked-by: Chase Maupin <chase.maupin@ti.com>
>=20
> > ---
> >  meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb |    5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> > b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> > index 2aefe1f..d87743b 100644
> > --- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> > +++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> > @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D
> > "file://cdjpeg.h;endline=3D12;md5=3D78fa8dbac547bb5b2a0e6457a6cfe
> >=20
> > file://djpeg.c;endline=3D13;md5=3De85613b52f2906c5dfc0e21ec902cb33 \
> >  "
> >  PV =3D "8d+1.2.1"
> > -PR =3D "r1"
> > +PR =3D "r2"
> >  SRCREV =3D "837"
> >  SRC_URI =3D "svn://libjpeg-
> > turbo.svn.sourceforge.net/svnroot/libjpeg-
> > turbo;protocol=3Dhttps;module=3Dtrunk"
> >=20
> > @@ -15,6 +15,9 @@ S =3D "${WORKDIR}/trunk"
> >=20
> >  # Drop-in replacement for jpeg
> >  PROVIDES =3D "jpeg"
> > +RPROVIDES_${PN} +=3D "jpeg"
> > +RREPLACES_${PN} +=3D "jpeg"
> > +RCONFLICTS_${PN} +=3D "jpeg"
> >=20
> >  inherit autotools pkgconfig
> >=20
> > --
> > 1.7.9.5
> >=20
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-
> > devel
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aziWXe2aaRGlkyg3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCFocIACgkQN1Ujt2V2gBw96QCeJpxodKs93S4wcMVK9tBHFAfs
JM8AoLeVf05qlHdn8UMJ4MciSfI+zGSg
=KumK
-----END PGP SIGNATURE-----

--aziWXe2aaRGlkyg3--
