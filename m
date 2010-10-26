Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PArGm-0007Oh-Pn for openembedded-devel@lists.openembedded.org;
	Tue, 26 Oct 2010 23:41:29 +0200
Received: from f053033199.adsl.alicedsl.de ([78.53.33.199]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PArG2-0000xa-V3 for openembedded-devel@lists.openembedded.org;
	Tue, 26 Oct 2010 21:40:39 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTi=W1g++5vP22Zeu+XGEsMqhk5Sr38sA88YZDcjw@mail.gmail.com>
References: <1288124872-18813-1-git-send-email-dbatzle@dcbcyber.com>
	<AANLkTi=W1g++5vP22Zeu+XGEsMqhk5Sr38sA88YZDcjw@mail.gmail.com>
Date: Tue, 26 Oct 2010 23:40:36 +0200
Message-ID: <1288129237.3809.26.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] bullet.bb New recipe
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
X-List-Received-Date: Tue, 26 Oct 2010 21:41:32 -0000
X-Groupsio-MsgNum: 25529
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-pxgQQS4esGOxyhsS3zU/"

--=-pxgQQS4esGOxyhsS3zU/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 26.10.2010, 14:30 -0700 schrieb Khem Raj:
> On Tue, Oct 26, 2010 at 1:27 PM, David Batzle <dbatzle@dcbcyber.com> wrot=
e:
> > ---
> >  recipes/bullet/bullet.bb |   14 ++++++++++++++
> >  1 files changed, 14 insertions(+), 0 deletions(-)
> >  create mode 100644 recipes/bullet/bullet.bb
> >
> > diff --git a/recipes/bullet/bullet.bb b/recipes/bullet/bullet.bb
> > new file mode 100644
> > index 0000000..c466e7a
> > --- /dev/null
> > +++ b/recipes/bullet/bullet.bb
> > @@ -0,0 +1,14 @@
> > +DESCRIPTION =3D "Bullet Physics Library"
> > +HOMEPAGE =3D "www.bulletphysics.org"

All other recipes have =C2=BBhttp=C2=AB included in the URL.

	git grep "HOMEPAGE" recipes/

> > +LICENSE =3D "Zlib"
>=20
> if you look closely under the sources different parts are licensed
> under different licenses
> while you are at it could you mention all the licenses that the
> package is using.
>=20
> Otherwise it look ok.
>=20
> > +PV =3D "2.77+svnr${SRCPV}"
> > +PR =3D "r0"
>=20
> you could omit PR setting when its r0 i.e. initial first rev because
> bitbake will set it to r0
> if it does not find a PR definition but then if some fix it done later
> then it has to be bumped
> to r1 then one has to add that in recipe but its ok to set it to r0 as
> well its just FYI
>=20
> > +
> > +SRC_URI =3D "svn://bullet.googlecode.com/svn;module=3Dtrunk;proto=3Dht=
tp"
> > +
> > +SRCREV =3D "2218"
> > +S =3D "${WORKDIR}/trunk"
> > +
> > +inherit cmake
> > +
> > +EXTRA_OECMAKE =3D "-DBUILD_DEMOS:BOOL=3DOFF -DBUILD_EXTRAS:BOOL=3DOFF =
-DUSE_GLUT:BOOL=3DOFF -DBUILD_SHARED_LIBS:BOOL=3DON"

Thank you for this patch iteration. I will test building your recipe as
soon as possible.


Thanks,

Paul

--=-pxgQQS4esGOxyhsS3zU/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzHSsgACgkQPX1aK2wOHVjCKQCeNVHsxeyhW4npnFttqGw56/lh
8HgAn3pOfXWsc3Y9Fzz87qV6dZ85u1U/
=caqA
-----END PGP SIGNATURE-----

--=-pxgQQS4esGOxyhsS3zU/--
