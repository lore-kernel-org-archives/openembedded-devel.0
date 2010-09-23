Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Oyk0n-0000W5-4R for openembedded-devel@lists.openembedded.org;
	Thu, 23 Sep 2010 13:30:50 +0200
Received: from f053045061.adsl.alicedsl.de ([78.53.45.61]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Oyk0j-0008Rf-D7 for openembedded-devel@lists.openembedded.org;
	Thu, 23 Sep 2010 11:30:45 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Sep 2010 13:30:44 +0200
Message-ID: <1285241444.3691.60.camel@mattotaupa>
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
Subject: libatasmart_0.13.bb: `No package 'libudev' found` and `./strpool: ./strpool: cannot execute binary file`
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
X-List-Received-Date: Thu, 23 Sep 2010 11:30:50 -0000
X-Groupsio-MsgNum: 23873
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-VszSsbnAHGto1mZ53+mK"

--=-VszSsbnAHGto1mZ53+mK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


I am trying to build `libatasmart_0.13.bb`.

Using Minimal as distribution `do_configure()` fails, because package
config for libudev is not found.

        [=E2=80=A6]
        | checking for arm-oe-linux-gnueabi-pkg-config... no
        | checking for pkg-config... /oe/build-minimal-eglibc/minimal-dev/s=
ysroots/i686-linux/usr/bin/pkg-config
        | configure: WARNING: using cross tools not prefixed with host trip=
let
        | checking pkg-config is at least version 0.9.0... yes
        | checking for LIBUDEV... configure: error: Package requirements (l=
ibudev) were not met:
        |
        | No package 'libudev' found
        |
        | Consider adjusting the PKG_CONFIG_PATH environment variable if yo=
u
        | installed software in a non-standard prefix.
        |
        | Alternatively, you may set the environment variables LIBUDEV_CFLA=
GS
        | and LIBUDEV_LIBS to avoid the need to call pkg-config.
        | See the pkg-config man page for more details.
        |
        | ERROR: Function do_configure failed
        NOTE: package libatasmart-0.13-r1: task do_configure: Failed
        [=E2=80=A6]

`find minimal-dev/ -name *libudev*` did not return anything useful.
Steffen added `udev` to `DEPENDS` [1] but that does not seem to help.
(Although I do not know if he saw the same error as I do, because it is
not mentioned in the commit message.)

Using =C8=A6ngstr=C3=B6m 2008.1 this error was not met though. But `do_comp=
ile()`
fails with `./strpool: cannot execute binary file`.

        Log data follows:
        | NOTE: make
        |   CC     strpool.o
        |   CCLD   strpool
        | ./strpool atasmart.c atasmart.strpool.c
        | ./strpool: ./strpool: cannot execute binary file
        | make: *** [atasmart.strpool.c] Error 126
        | FATAL: oe_runmake failed
        | ERROR: Function do_compile failed
        NOTE: package libatasmart-0.13-r1: task do_compile: Failed

But as far as I understand the recipe takes care of that by compiling
`strpool` for the build host [2].

        do_compile_prepend() {
        	rm strpool -f
        	${BUILD_CC} -o strpool strpool.c
        	chmod +x strpool
        }


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Df94938a=
c8022a9ab94cccf1e61eb069a30133ffb
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/devicek=
it/libatasmart_0.13.bb?id=3D67ab615dac83b0460fa1b88dfb11c72d7c93e259

--=-VszSsbnAHGto1mZ53+mK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkybOmMACgkQPX1aK2wOHVgYUACeJiI8aV0NDrzelVJBJhthY4Dj
NaIAnid6lsnyxmk7ecIczdvWdVjMDZfx
=pJuO
-----END PGP SIGNATURE-----

--=-VszSsbnAHGto1mZ53+mK--
