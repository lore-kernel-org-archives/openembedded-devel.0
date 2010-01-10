Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NTx7v-0002ma-25 for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jan 2010 13:42:42 +0100
Received: from f053034057.adsl.alicedsl.de ([78.53.34.57]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NTx5t-0003dA-9A for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jan 2010 12:40:33 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1260719131.3110.26.camel@mattotaupa.wohnung.familie-menzel.net>
References: <1260618520.3373.23.camel@mattotaupa.wohnung.familie-menzel.net>
	<20091212173311.GA3730@rhein.zuhause.netz>
	<1260711980.3110.21.camel@mattotaupa.wohnung.familie-menzel.net>
	<20091213141849.GG17995@ibawizard.net>
	<1260719131.3110.26.camel@mattotaupa.wohnung.familie-menzel.net>
Date: Sun, 10 Jan 2010 13:40:31 +0100
Message-ID: <1263127231.3163.3.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: environment variables in Makefile for cross compilation (was: package VDR for OE)
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
X-List-Received-Date: Sun, 10 Jan 2010 12:42:42 -0000
X-Groupsio-MsgNum: 15516
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-j4JhcHSNA517xqxnpgiV"

--=-j4JhcHSNA517xqxnpgiV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 13.12.2009, 16:45 +0100 schrieb Paul Menzel:
> Am Sonntag, den 13.12.2009, 15:18 +0100 schrieb Petr =C5=A0tetiar:
> > Paul Menzel <paulepanter@users.sourceforge.net> [2009-12-13 14:46:20]:
>=20
> [=E2=80=A6]
> =20
> > INCLUDES =3D -I${STAGING_INCDIR}freetype2
> >=20
> > to=20
> >=20
> > INCLUDES =3D ${CFLAGS}
> >=20
> > and in your recipe do:
> >=20
> > CFLAGS_append  +=3D " -I${STAGING_INCDIR}/freetype2"
>=20
> Great. That worked.
>=20
> > > Furthermore is there a better way for upstream to set things up so th=
at
> > > no patching is needed? Or is autotools needed for this?
>=20
> I am still asking if upstream could change something to make the
> Makefile cross compilable by default.

Is there an environment variable for a handmade Makefile to make it
cross compilable? Or is patching the upstream Makefile inevitable?

[=E2=80=A6]


Thanks,

Paul

--=-j4JhcHSNA517xqxnpgiV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktJyrgACgkQPX1aK2wOHVhLEgCfe8mQCPeuZ3WhZT9cKDgF/eDT
edgAnAgM89lmueurMxS6SFiYI6ZQ6l0o
=g6HM
-----END PGP SIGNATURE-----

--=-j4JhcHSNA517xqxnpgiV--
