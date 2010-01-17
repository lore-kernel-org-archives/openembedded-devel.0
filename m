Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NWci0-0004bU-Bj for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 22:30:59 +0100
Received: from g225080206.adsl.alicedsl.de ([92.225.80.206]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NWcfs-0007g1-Tz for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 21:28:45 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hivtt3$v2r$1@ger.gmane.org>
References: <1263760344-26105-1-git-send-email-eric@eukrea.com>
	<hivtt3$v2r$1@ger.gmane.org>
Date: Sun, 17 Jan 2010 22:28:43 +0100
Message-ID: <1263763723.5353.16.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] barebox: Add recipe for this new bootloader
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
X-List-Received-Date: Sun, 17 Jan 2010 21:30:59 -0000
X-Groupsio-MsgNum: 15824
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-qutq+o04vdV/9c8KkzsL"

--=-qutq+o04vdV/9c8KkzsL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 17.01.2010, 22:02 +0100 schrieb Koen Kooi:
> On 17-01-10 21:32, Eric Benard wrote:
> > * barebox is "a bootloader that inherits the best of U-Boot and the
> Linux kernel"
> > * add recipe for v2009.12.0 (last stable)
> > * add recipe for git repository
> >=20
> > Signed-off-by: Eric Benard <eric@eukrea.com>
>=20
> > +++ b/recipes/barebox/barebox_2009.12.bb
> > @@ -0,0 +1,15 @@
>=20
>=20
> > +PR =3D "r0"
>=20
> > +++ b/recipes/barebox/barebox_git.bb
> > @@ -0,0 +1,10 @@
>=20
> > +PR =3D "r0"
>=20
> Please don't set variables to the current default value, but leave
> them
> out. We had tons of problems with vars getting copy/paste where the
> default changed and we had to manually fix those (e.g. efl.bbclass
> still
> pokes needlessly at PACKAGES).
>=20
> Setting PR is relatively minor, but lets stay consistent :)=20

Could someone please change this in the manual please [1].

=C2=BBIt is good practice to always define PR in your recipes, even for the
"r0" release, so that when editing the recipe it is clear that the PR
number needs to be updated.=C2=AB


Thanks,

Paul


[1] http://docs.openembedded.org/usermanual/html/recipes_versioning.html

--=-qutq+o04vdV/9c8KkzsL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktTgQsACgkQPX1aK2wOHVgzJACfZy8PlakGHT/varSPJJp6inEX
C0AAniGFw9la4SjI+7Vnw0NeDJ16Rkwh
=J544
-----END PGP SIGNATURE-----

--=-qutq+o04vdV/9c8KkzsL--
