Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NX1tq-00030G-Du for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 01:24:53 +0100
Received: from f053034131.adsl.alicedsl.de ([78.53.34.131]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NX1rh-0000py-Ne for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 00:22:37 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1260719131.3110.26.camel@mattotaupa.wohnung.familie-menzel.net>
References: <1260618520.3373.23.camel@mattotaupa.wohnung.familie-menzel.net>
	<20091212173311.GA3730@rhein.zuhause.netz>
	<1260711980.3110.21.camel@mattotaupa.wohnung.familie-menzel.net>
	<20091213141849.GG17995@ibawizard.net>
	<1260719131.3110.26.camel@mattotaupa.wohnung.familie-menzel.net>
Date: Tue, 19 Jan 2010 01:22:36 +0100
Message-ID: <1263860556.3438.40.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Setting environment variables in recipes and fixing upstream the right way to cross compile? (was: package VDR for OE)
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
X-List-Received-Date: Tue, 19 Jan 2010 00:24:53 -0000
X-Groupsio-MsgNum: 15863
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-g3twZRYdQiySeYUT6Poz"

--=-g3twZRYdQiySeYUT6Poz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 13.12.2009, 16:45 +0100 schrieb Paul Menzel:
> Am Sonntag, den 13.12.2009, 15:18 +0100 schrieb Petr =C5=A0tetiar:
> > Paul Menzel <paulepanter@users.sourceforge.net> [2009-12-13 14:46:20]:
>=20
> [=E2=80=A6]
>=20
> > Maybe, it's because you don't have STAGING_INCDIR variable available in
> > do_compile() step. If I were you, I would grep for STAGING_INCDIR varia=
ble in
> > other recipes: grep -R STAGING_INCDIR recipes/* and you should get idea=
 how to
> > use it. Hint, change :
> >=20
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

How should the upstream Makefile be changed to be easily cross
compilable. Is my following suggestion correct?

The problem is to find the FreeType headers we have to tell the compiler
where there are, because they are in the subdirectory `freetype` under=20
`${STAGING_INCDIR}/freetype2`.

Therefore change upstream Makefile to

        -INCLUDES =3D /usr/include/freetype2`
        +INCLUDES ?=3D /usr/include/freetype2`

and export `INCLUDES` [1] in the recipe.

        export INCLUDES =3D ${STAGING_INCDIR}/freetype2

Would that be preferable to patching `Makefile` in OE and using
`CFLAGS_append`? Maybe other distributions would profit too if upstream
made this change? If yes, I could prepare a patch.

[=E2=80=A6]


Thanks,

Paul


[1] http://docs.openembedded.org/usermanual/html/recipes_syntax.html

--=-g3twZRYdQiySeYUT6Poz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktU+0sACgkQPX1aK2wOHVidcACeNs8FSdltSTt8QTMkB0k9INWp
md8An1Vl3nIRdy6JTisHiKqacFgozVGF
=OF3d
-----END PGP SIGNATURE-----

--=-g3twZRYdQiySeYUT6Poz--
