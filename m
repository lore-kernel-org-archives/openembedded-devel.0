Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pxh4L-0000YV-Jy for openembedded-devel@lists.openembedded.org;
	Thu, 10 Mar 2011 15:42:25 +0100
Received: from f053036145.adsl.alicedsl.de ([78.53.36.145]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pxh2p-0006p7-Ao for openembedded-devel@lists.openembedded.org;
	Thu, 10 Mar 2011 14:40:51 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Mar 2011 15:40:51 +0100
Message-ID: <1299768051.3853.21.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: help2man-native: task configure fails with `configure: error: perl module Locale::gettext required`
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
X-List-Received-Date: Thu, 10 Mar 2011 14:42:25 -0000
X-Groupsio-MsgNum: 30030
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-SK1aNb0ZrVdnOpA/hAj1"

--=-SK1aNb0ZrVdnOpA/hAj1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


some recent commit indirectly seems to have broken `help2man-native` and
task configure fails.

    checking whether gcc accepts -g... yes
    checking for gcc option to accept ISO C89... none needed
    checking for library containing dlsym... -ldl
    checking for library containing bindtextdomain... none required
    configure: error: perl module Locale::gettext required

Adding `liblocale-gettext-perl-native` to `DEPENDS_virtclass-native`
does not fix the problem but causes a dependency loop.

I do not understand the dependency for the native package anyway.

        DEPENDS =3D "gettext-native perl-native liblocale-gettext-perl-nati=
ve"
        DEPENDS_virtclass-native =3D "perl-native autoconf-native automake-=
native"
        RDEPENDS_${PN} =3D "gettext perl liblocale-gettext-perl"
        RDEPENDS_${PN}_virtclass-native =3D ""

I though that `DEPENDS_virtclass-native` has `DEPENDS` as a subset
automatically.

Any ideas?


Thanks,

Paul

--=-SK1aNb0ZrVdnOpA/hAj1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk144vMACgkQPX1aK2wOHVjd6wCdGnSbQ669wQKx6hTvn6gVCkTN
IwAAn3aK6+4suF2zLmVAeeoKGTWwgVrN
=0UNn
-----END PGP SIGNATURE-----

--=-SK1aNb0ZrVdnOpA/hAj1--
