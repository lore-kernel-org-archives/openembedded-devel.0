Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PAjhG-0006RK-5t for openembedded-devel@lists.openembedded.org;
	Tue, 26 Oct 2010 15:36:16 +0200
Received: from f053033199.adsl.alicedsl.de ([78.53.33.199]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PAjgc-0004d7-Bf for openembedded-devel@lists.openembedded.org;
	Tue, 26 Oct 2010 13:35:34 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTimnXA+8fC0s213A1KdS9k-CLjwOd_bkz_Ba9ajw@mail.gmail.com>
References: <1288063685-10500-1-git-send-email-dbatzle@dcbcyber.com>
	<AANLkTimnXA+8fC0s213A1KdS9k-CLjwOd_bkz_Ba9ajw@mail.gmail.com>
Date: Tue, 26 Oct 2010 15:35:32 +0200
Message-ID: <1288100132.3802.4.camel@mattotaupa>
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
Subject: Re: [PATCH] New recipe for Bullet Physics library
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
X-List-Received-Date: Tue, 26 Oct 2010 13:36:16 -0000
X-Groupsio-MsgNum: 25515
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-0kMEViPOMmS5zQKDNN1T"

--=-0kMEViPOMmS5zQKDNN1T
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 26.10.2010, 08:38 +0200 schrieb Frans Meulenbroeks:
> 2010/10/26 dbatzle <dbatzle@dcbcyber.com>:

The commit summary should start with the recipe name as suggested by the
commit policy [1].

> > Signed-off-by: dbatzle <dbatzle@dcbcyber.com>

I guess a real name would be preferred. But if you want to stay
anonymous that is alright too I guess.

> > ---
> >  recipes/bullet/bullet.bb |   18 ++++++++++++++++++
> >  1 files changed, 18 insertions(+), 0 deletions(-)
> >  create mode 100644 recipes/bullet/bullet.bb
> >
> > diff --git a/recipes/bullet/bullet.bb b/recipes/bullet/bullet.bb
> > new file mode 100644
> > index 0000000..d28734f
> > --- /dev/null
> > +++ b/recipes/bullet/bullet.bb
> > @@ -0,0 +1,18 @@
> > +DESCRIPTION =3D "Bullet Physics Library"
> > +LICENSE =3D "Zlib"
> > +
> > +PR =3D "r1"
>=20
> A recipe should start at r0.
> Can you also add HOMEPAGE (and maybe some more of the header fields)
>=20
> > +SRCREV=3D"2218"
> > +PV=3D"2.77+svnr${SRCPV}"
> > +
> > +#SRC_URI =3D "file:///home/David/gamestuff/bullet-2.75"
>=20
> suggest to remove the line above
>=20
> > +SRC_URI =3D "svn://bullet.googlecode.com/svn;module=3Dtrunk;proto=3Dht=
tp"
> > +
> > +#If you want to build the demos you will have to have xlib and glut in=
stalled.
> > +#Then set BUILD_DEMOS, BUILD_EXTRAS, and USE_GLUT to ON
> > +
> > +EXTRA_OECMAKE=3D"-DBUILD_DEMOS:BOOL=3DOFF -DBUILD_EXTRAS:BOOL=3DOFF -D=
USE_GLUT:BOOL=3DOFF -DBUILD_SHARED_LIBS:BOOL=3DON"
> > +
> > +inherit cmake
> > +
> > +S =3D "${WORKDIR}/trunk"
> > --
> > 1.6.0.6

I agree with Frans=E2=80=99 suggestions. You can also run `oe-stylize.py` [=
2] if
you have not done so already.

Please do not forget to update the patch queue [3].


Thanks,

Paul


[1] http://wiki.openembedded.org/index.php/Commit_Policy
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/contrib/oe-styl=
ize.py
[3] http://wiki.openembedded.org/index.php/Patchwork

--=-0kMEViPOMmS5zQKDNN1T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzG2RoACgkQPX1aK2wOHVhuvQCfQItnbpG0yLoSZAMpLUYuhWMk
SIcAn00Rqczk6nzWWCed7cjojHR0+kx8
=Sn/q
-----END PGP SIGNATURE-----

--=-0kMEViPOMmS5zQKDNN1T--
