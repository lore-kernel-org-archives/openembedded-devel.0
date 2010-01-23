Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NYeH1-0004uu-Tu for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 12:35:30 +0100
Received: from f053033135.adsl.alicedsl.de ([78.53.33.135]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NYeEp-0004LA-JV for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 11:33:11 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <BAY127-W22DDA85C96A4A7D6F4C18ED8610@phx.gbl>
References: <BAY127-W22DDA85C96A4A7D6F4C18ED8610@phx.gbl>
Date: Sat, 23 Jan 2010 12:33:10 +0100
Message-ID: <1264246390.3630.26.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Problem in building console-image
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
X-List-Received-Date: Sat, 23 Jan 2010 11:35:31 -0000
X-Groupsio-MsgNum: 16081
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-u26nn/GCdUW+8HyA/ifT"

--=-u26nn/GCdUW+8HyA/ifT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Saleh,


please follow the netiquette (subject, quoting, etc.) [1]. Otherwise you
will make life hard for the developers to answer you.

Am Samstag, den 23.01.2010, 15:54 +0500 schrieb saleh usman:
> How I can solve this problem? any solution? guidance? tutorial?Plz
> help me in moving forword.

Unfortunately it is not visible that you even tried to figure out what
the others told you. Please ask specific questions next time!

>>>>BBFILES =3D "/oe/org.openembedded.dev/packages/*/*.bb  /oe/ossie_collec=
tion/packages/*/*.bb"
> This seems wrong
>=20
> >>>>NOTE: Handling BitBake files: \ (0014/0014) [100 %]
> In fact you get just 14 items...
>=20
> >>Dunno about ossie, but in openembedded we moved from 'packages' to 'rec=
ipes'.
>=20
> >>>>I've built console-image without adding the following lines in local.=
conf
>=20
>  file and it has been built successfully.Now when I've added these lines =
it is
>=20
> giving  error.Attached is local.conf file.
>=20
> >> >>ANGSTROM_EXTRA_INSTALL =3D " screen oprofile ossie-fm-from-file "
>=20
> BBFILES =3D "/oe/org.openembedded.dev/packages/*/*.bb  /oe/ossie_collecti=
on/packages/*/*.bb"
>=20
> BBFILE_COLLECTIONS =3D "upstream ossie"
>=20
> BBFILE_PATTERN_upstream =3D "^/oe/org.openembedded.dev/packages"
>=20
> BBFILE_PRIORITY_upstream =3D "5"
>=20
> BBFILE_PATTERN_ossie =3D "^/oe/ossie/packages"
>=20
> BBFILE_PRIORITY_ossie =3D "10"

As the others answered already, BitBake is not finding your recipes
(just 14). And the reason is according to the others that the directory
was renamed. So please replace all occurrences of =C2=BBpackages=C2=AB to
=C2=BBrecipes=C2=AB in `local.conf`.


Thanks,

Paul


[1] http://en.opensuse.org/OpenSUSE_mailing_list_netiquette

--=-u26nn/GCdUW+8HyA/ifT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkta3nUACgkQPX1aK2wOHVhU+wCfb8bUnpLkBadk0Dx9APal8Lhr
9v8AnRchkCwvO/i7uqVSb41MU1fwKTlv
=qofI
-----END PGP SIGNATURE-----

--=-u26nn/GCdUW+8HyA/ifT--
