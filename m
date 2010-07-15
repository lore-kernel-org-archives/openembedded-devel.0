Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OZIhk-0002tf-7C for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jul 2010 09:18:01 +0200
Received: from f053040153.adsl.alicedsl.de ([78.53.40.153]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OZIhi-00031R-5k for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jul 2010 07:17:58 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Jul 2010 09:17:55 +0200
Message-ID: <1279178275.5049.28.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: uclibc: PREFERRED_UCLIBC_VERSION = "git" not respected
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
X-List-Received-Date: Thu, 15 Jul 2010 07:18:01 -0000
X-Groupsio-MsgNum: 20997
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-75qONeb4+8FR0OPIirDc"

--=-75qONeb4+8FR0OPIirDc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


the commit message of 070e46f2932b254a617d7ce88af9b078c2a2849f [1] says

        With this change, you can put PREFERRED_UCLIBC_VERSION=3D"git"
        into your conf/local.conf once or set
        PREFERRED_VERSION_uclibc{*}=3D"git" and need not adjust local.conf
        if the git revision was changed.

I have the following line in my `local.conf`.

    PREFERRED_UCLIBC_VERSION               =3D "git"

Doing `bitbake uclibc` with

        DISTRO =3D "angstrom-2008.1"
       =20
        GLIBC_GENERATE_LOCALES =3D "en_US.UTF-8 en_GB.UTF-8 de_DE.UTF-8"
       =20
        MACHINE =3D "beagleboard"
        BUILD_ARCH =3D "i686"
        BUILD_OS =3D "linux"
        ANGSTROMLIBC =3D "uclibc"

chooses uclibc-0.9.30.2-r34.0 nevertheless.

Doing `git grep "PREFERRED_UCLIBC"` does not list anything distribution
specific as far as I can see.


Thanks,

Paul


[1] http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3D070e46f2=
932b254a617d7ce88af9b078c2a2849f

--=-75qONeb4+8FR0OPIirDc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkw+tiMACgkQPX1aK2wOHVhCFQCfSxbCrHlnXYd5FmmYOqD7O234
qRcAn09lfOdbkgPfYuM1NhDJro6qeSaU
=xH4X
-----END PGP SIGNATURE-----

--=-75qONeb4+8FR0OPIirDc--
