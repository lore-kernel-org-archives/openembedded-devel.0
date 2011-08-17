Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QtauE-0007PU-Db
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Aug 2011 09:51:18 +0200
Received: by fxg11 with SMTP id 11so553648fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2011 00:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0KD/8Wy783LRCFguzXSF5+peE/PYc92lgqA8aEHgAX8=;
	b=u2s3Scc1tjEreiD8G/zlToMKTfPE4/hbReefLo8eh/xzA5Wh2K1HCvobb/PtXQ/9uV
	cUaNLVgQP9JC0FSrEfi5x01rc6XXsXKSLaAzKAis1D58zMDqHMk7qKzpYrnTScSsmljJ
	NsBxJoA/aSCb6KgyqTvtbmcon4JZq3hz/skzA=
Received: by 10.223.149.199 with SMTP id u7mr972608fav.129.1313567199381;
	Wed, 17 Aug 2011 00:46:39 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b14sm689601fab.19.2011.08.17.00.46.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 17 Aug 2011 00:46:38 -0700 (PDT)
Date: Wed, 17 Aug 2011 09:46:31 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110817074631.GD10195@jama.jama.net>
References: <1313556715-28652-1-git-send-email-pespin.shar@gmail.com>
	<j2fqml$jor$4@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <j2fqml$jor$4@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/2] lightmediascanner: added recipe for v0.4.3
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
X-List-Received-Date: Wed, 17 Aug 2011 07:51:18 -0000
X-Groupsio-MsgNum: 33660
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6WlEvdN9Dv0WHSBl"
Content-Disposition: inline

--6WlEvdN9Dv0WHSBl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 17, 2011 at 09:30:29AM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 17-08-11 06:51, Pau Espin Pedrol schreef:
> > Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com> --- .../recipes=
-efl/e17/lightmediascanner_0.4.3.0.bb   |   29 ++++++++++++++++++++ 1 files=
 changed, 29 insertions(+), 0 deletions(-) create mode 100644 meta-efl/reci=
pes-efl/e17/lightmediascanner_0.4.3.0.bb
> >=20
> > diff --git a/meta-efl/recipes-efl/e17/lightmediascanner_0.4.3.0.bb b/me=
ta-efl/recipes-efl/e17/lightmediascanner_0.4.3.0.bb new file mode 100644 in=
dex 0000000..dd0b283 --- /dev/null +++ b/meta-efl/recipes-efl/e17/lightmedi=
ascanner_0.4.3.0.bb @@ -0,0 +1,29 @@ +DESCRIPTION =3D "Lightweight media
> > scanner meant to be used in not-so-powerful devices" +SECTION =3D "libs=
/multimedia" +AUTHOR =3D "Profusion"
>=20
> Maybe profusion.mobi might be clearer
>=20
> > +LICENSE =3D "LGPLv2.1+" +DEPENDS =3D "sqlite3 flac" +SRC_URI =3D "http=
s://garage.maemo.org/frs/download.php/9439/lightmediascanner-${PV}.tar.bz2"=
 + +PE =3D "1"
>=20
> meta-efl is a fresh start, so PE can be dropped
>=20
> > + +inherit autotools pkgconfig + +do_install_append() { +    install -d=
 ${D}/${bindir}/ +    install -m 755 ${WORKDIR}/${PN}-${PV}/src/bin/.libs/t=
est  ${D}/${bindir}/test-lms +} + + +LIC_FILES_CHKSUM =3D "file://COPYING;m=
d5=3Da6f89e2100d9b6cdffcea4f398e37343"
>=20
> Move that next to LICENSE
>=20
> > +PACKAGES =3D+ "${PN}-test" + +FILES_${PN}-test =3D "${bindir}/test-lms=
" + +FILES_${PN}-dbg +=3D "${libdir}/${PN}/plugins/.debug" + +SRC_URI[md5su=
m] =3D "188ff5188cfa0f2504a42934c969cb77" +SRC_URI[sha256sum] =3D "bdbe7665=
5ad212b936fb3cf6a9ca725e318ddeb57cd7d950d9c8409297d3b0da"
>=20
> And move those next to SRC_URI
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>=20
> iD8DBQFOS24VMkyGM64RGpERAlquAJ97wZaWiNLYg41n3q3O9vGiqJ6qaQCfVO5+
> h0YoTC9/SmvV07UKzu/qdLo=3D
> =3D55Qv
> -----END PGP SIGNATURE-----

+ I've already talked with pespin about moving it from recipes-efl/e17 to
recipes-multimedia or something like that.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6WlEvdN9Dv0WHSBl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5LcdcACgkQN1Ujt2V2gByOAACfYErJqCt1WxmSUIURTxbWYAgY
cmQAnih+HkwJimoaYKtZkSPvgS5Hxfp3
=Ri2W
-----END PGP SIGNATURE-----

--6WlEvdN9Dv0WHSBl--
