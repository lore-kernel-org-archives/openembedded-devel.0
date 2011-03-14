Received: from bsmtp5.bon.at ([195.3.86.187] helo=bsmtp.bon.at)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pgsellmann@portner-elektronik.at>)
	id 1Pz4XT-0001kI-Ue for openembedded-devel@lists.openembedded.org;
	Mon, 14 Mar 2011 10:58:12 +0100
Received: from aspire.localdomain (unknown [88.116.171.82])
	by bsmtp.bon.at (Postfix) with ESMTP id E8508CDF97
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2011 10:56:20 +0100 (CET)
From: Peter Gsellmann <pgsellmann@portner-elektronik.at>
Organization: PORTNER Elektronik
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Mar 2011 10:56:24 +0100
User-Agent: KMail/1.13.5 (Linux/2.6.32.26-175.fc12.x86_64; KDE/4.4.5; x86_64; ;
	)
References: <201103111138.38493.pgsellmann@portner-elektronik.at>
	<1299846315.4137.48.camel@mattotaupa>
In-Reply-To: <1299846315.4137.48.camel@mattotaupa>
MIME-Version: 1.0
Message-Id: <201103141056.24985.pgsellmann@portner-elektronik.at>
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
X-List-Received-Date: Mon, 14 Mar 2011 09:58:12 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

Am Freitag, 11. M=E4rz 2011, 13:25:15 schrieb Paul Menzel:
> Dear Peter,
>=20
>=20
> Am Freitag, den 11.03.2011, 11:38 +0100 schrieb Peter Gsellmann:
> > There is a compiler error about an impossible cast from QUIRKS* to cons=
t QUIRKS*
> > The patches are from Fedora12 which has the exact same gsoap-version
> > They can be found at http://archive.fedoraproject.org/pub/archive/fedor=
a/linux/releases/12/Everything/source/SRPMS/gsoap-2.7.13-2.fc12.src.rpm
> >=20
> > In the native package, the generated binary is installed in STAGING_BIN=
DIR_NATIVE where expected by the gsoap-package
> >=20
> > Otherwise the gsoap-package uses a soapcpp2 delivered as 32bit-executab=
le in the source-package! This fails on x86_64 hosts.
>=20
> smaller patches would it make easier to review in my opinion. (If it
> were possible.)
The patches are as found in Fedora gsoap-2.7.13-2.fc12.src.rpm . I did not =
make them. Credits to the fedora team.

> On what did you test this patch?
I run a daily build for my target which is Angstrom with some extra package=
s. Target hardware is at91sam9g20.

> > diff --git a/recipes/gsoap/gsoap-native_2.7.13.bb b/recipes/gsoap/gsoap=
=2Dnative_2.7.13.bb
> > index 3e905e7..83c2329 100644
> > --- a/recipes/gsoap/gsoap-native_2.7.13.bb
> > +++ b/recipes/gsoap/gsoap-native_2.7.13.bb
> > @@ -6,8 +6,9 @@ EXTRA_OEMAKE =3D ""
> > =20
> >  inherit native
> > =20
> > +
>=20
> Not needed?
>=20
> >  do_install() {
> > -	:
> > +	install -m 0755 ${S}/gsoap/src/soapcpp2 ${STAGING_BINDIR_NATIVE}/
> >  }
Only soapcpp2 is needed, exactly in this place.

> > diff --git a/recipes/gsoap/gsoap_2.7.13.inc b/recipes/gsoap/gsoap_2.7.1=
3.inc
> > index 877e1d1..c3ab3c4 100644
> > --- a/recipes/gsoap/gsoap_2.7.13.inc
> > +++ b/recipes/gsoap/gsoap_2.7.13.inc
> > @@ -3,7 +3,9 @@ for the development of SOAP Web Services and clients."
> >  SECTION =3D "devel"
> >  LICENSE =3D "GPL"
> > =20
> > -SRC_URI =3D "${SOURCEFORGE_MIRROR}/gsoap2/gsoap_${PV}.tar.gz"
> > +SRC_URI =3D "${SOURCEFORGE_MIRROR}/gsoap2/gsoap_${PV}.tar.gz	\
> > +	file://gsoap-2.7-openssl.patch	\
>=20
> Use spaces instead of tabulators before =BB\=AB?
>=20
> > +	file://unused_args.patch"
>=20
> Maybe you can move the quote =BB"=AB on a new line, so that future patches
> will not create a difference for that line.
I will repost a reworked patch without tabs today


Peter


