Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OdgGF-0003z7-JQ for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 11:15:44 +0200
Received: from g229062094.adsl.alicedsl.de ([92.229.62.94]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OdgG0-0006Dq-KT for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 09:15:28 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTik+1EuG8Se996jFqVfQBXc3fFqoYPGzHh4hRsV2@mail.gmail.com>
References: <AANLkTik+1EuG8Se996jFqVfQBXc3fFqoYPGzHh4hRsV2@mail.gmail.com>
Date: Tue, 27 Jul 2010 11:15:25 +0200
Message-ID: <1280222125.3763.6.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bitbake error on ncurses_5.4.bb C compiler cannot create executables
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
X-List-Received-Date: Tue, 27 Jul 2010 09:15:45 -0000
X-Groupsio-MsgNum: 21501
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-bsAjbVTpSBbUsjA6E7eE"

--=-bsAjbVTpSBbUsjA6E7eE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Ranjith,


Am Dienstag, den 27.07.2010, 09:44 +0530 schrieb ranjith kannikara:

> I was trying to run " bitbake fso-illume-image" and it rerturned an error
> that do_config on ncurses5.4.bb failed
> the respective log is
>=20
> Configuring NCURSES 5.4 ABI 5 (Tue Jul 27 09:32:35 IST 2010)
> checking build system type... i686-pc-linux-gnu
> checking host system type... arm-oe-linux-gnueabi
> checking target system type... arm-oe-linux-gnueabi
> Configuring for linux-gnueabi
> checking for prefix... /usr
> checking for arm-oe-linux-gnueabi-gcc... arm-oe-linux-gnueabi-gcc
> -march=3Darmv4t -mtune=3Darm920t -mthumb-interwork -mthumb
> checking whether the C compiler works... no
> configure: error: in
> `/home/ranjith/test/build/tmp/work/armv4t-oe-linux-gnueabi/ncurses-5.4-r2=
0.0/ncurses-5.4':
> configure: error: C compiler cannot create executables

Do other recipes work correctly?

> See `config.log' for more details.
>=20
> and the config.log entry is
>=20
> .## ----------- ##
> ## confdefs.h. ##
> ## ----------- ##
>=20
> /* confdefs.h */
> #define PACKAGE_NAME ""
> #define PACKAGE_TARNAME ""
> #define PACKAGE_VERSION ""
> #define PACKAGE_STRING ""
> #define PACKAGE_BUGREPORT ""
> #define PACKAGE_URL ""
> #define SYSTEM_NAME "linux-gnueabi"
>=20
> configure: exit 77
>=20
> I tried googling and tried installing gcc newer version, buildessentials,
> epenembedded-essentials, but nothign worked for me.
> So can any one help me in this regard to solve this issue ,,

You did not provide information on what configuration and distribution
you use. Did you try to rebuild the whole tree in a clean environment?


Thanks,

Paul

--=-bsAjbVTpSBbUsjA6E7eE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxOo6YACgkQPX1aK2wOHVhmegCdHxUSxb1PhSfhlecgCClVvHSf
DOAAnR8iMyUzTdSA7FqATsVFkJ6kLHBe
=hWHb
-----END PGP SIGNATURE-----

--=-bsAjbVTpSBbUsjA6E7eE--
