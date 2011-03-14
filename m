Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pz6fl-0005Jk-LZ for openembedded-devel@lists.openembedded.org;
	Mon, 14 Mar 2011 13:14:53 +0100
Received: from f053046215.adsl.alicedsl.de ([78.53.46.215]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pz6eA-0000rZ-W8 for openembedded-devel@lists.openembedded.org;
	Mon, 14 Mar 2011 12:13:15 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201103141056.24985.pgsellmann@portner-elektronik.at>
References: <201103111138.38493.pgsellmann@portner-elektronik.at>
	<1299846315.4137.48.camel@mattotaupa>
	<201103141056.24985.pgsellmann@portner-elektronik.at>
Date: Mon, 14 Mar 2011 13:13:14 +0100
Message-ID: <1300104794.4193.10.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH] gsoap_2.7.13 build errors
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
X-List-Received-Date: Mon, 14 Mar 2011 12:14:53 -0000
X-Groupsio-MsgNum: 30179
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-6/w1yljCpyAbepllzRMp"

--=-6/w1yljCpyAbepllzRMp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 14.03.2011, 10:56 +0100 schrieb Peter Gsellmann:
> Am Freitag, 11. M=C3=A4rz 2011, 13:25:15 schrieb Paul Menzel:

> > Am Freitag, den 11.03.2011, 11:38 +0100 schrieb Peter Gsellmann:
> > > There is a compiler error about an impossible cast from QUIRKS* to co=
nst QUIRKS*
> > > The patches are from Fedora12 which has the exact same gsoap-version
> > > They can be found at http://archive.fedoraproject.org/pub/archive/fed=
ora/linux/releases/12/Everything/source/SRPMS/gsoap-2.7.13-2.fc12.src.rpm
> > >=20
> > > In the native package, the generated binary is installed in STAGING_B=
INDIR_NATIVE where expected by the gsoap-package
> > >=20
> > > Otherwise the gsoap-package uses a soapcpp2 delivered as 32bit-execut=
able in the source-package! This fails on x86_64 hosts.
> >=20
> > smaller patches would it make easier to review in my opinion. (If it
> > were possible.)
> The patches are as found in Fedora gsoap-2.7.13-2.fc12.src.rpm . I did no=
t make them. Credits to the fedora team.
>=20
> > On what did you test this patch?
> I run a daily build for my target which is Angstrom with some extra packa=
ges. Target hardware is at91sam9g20.
>=20
> > > diff --git a/recipes/gsoap/gsoap-native_2.7.13.bb b/recipes/gsoap/gso=
ap-native_2.7.13.bb
> > > index 3e905e7..83c2329 100644
> > > --- a/recipes/gsoap/gsoap-native_2.7.13.bb
> > > +++ b/recipes/gsoap/gsoap-native_2.7.13.bb
> > > @@ -6,8 +6,9 @@ EXTRA_OEMAKE =3D ""
> > > =20
> > >  inherit native
> > > =20
> > > +
> >=20
> > Not needed?
> >=20
> > >  do_install() {
> > > -	:
> > > +	install -m 0755 ${S}/gsoap/src/soapcpp2 ${STAGING_BINDIR_NATIVE}/
> > >  }
> Only soapcpp2 is needed, exactly in this place.

I meant the newly added line before the function.

> > > diff --git a/recipes/gsoap/gsoap_2.7.13.inc b/recipes/gsoap/gsoap_2.7=
.13.inc
> > > index 877e1d1..c3ab3c4 100644
> > > --- a/recipes/gsoap/gsoap_2.7.13.inc
> > > +++ b/recipes/gsoap/gsoap_2.7.13.inc
> > > @@ -3,7 +3,9 @@ for the development of SOAP Web Services and clients.=
"
> > >  SECTION =3D "devel"
> > >  LICENSE =3D "GPL"
> > > =20
> > > -SRC_URI =3D "${SOURCEFORGE_MIRROR}/gsoap2/gsoap_${PV}.tar.gz"
> > > +SRC_URI =3D "${SOURCEFORGE_MIRROR}/gsoap2/gsoap_${PV}.tar.gz	\
> > > +	file://gsoap-2.7-openssl.patch	\
> >=20
> > Use spaces instead of tabulators before =C2=BB\=C2=AB?
> >=20
> > > +	file://unused_args.patch"
> >=20
> > Maybe you can move the quote =C2=BB"=C2=AB on a new line, so that futur=
e patches
> > will not create a difference for that line.
> I will repost a reworked patch without tabs today

Great! Please remember to tag it as =C2=BB[PATCH v2]=C2=AB.


Thanks,

Paul

--=-6/w1yljCpyAbepllzRMp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk1+BloACgkQPX1aK2wOHVhX/QCbBblET8p/oN9yiUd5qNOsXPrL
io8AnAhmEgKs+tGRXuPyhYXZOPgisS8u
=4zJg
-----END PGP SIGNATURE-----

--=-6/w1yljCpyAbepllzRMp--
