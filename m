Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PDZF4-0002Aq-8D for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 10:02:51 +0100
Received: from f053043217.adsl.alicedsl.de ([78.53.43.217]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PDZEH-00007w-LU; Wed, 03 Nov 2010 09:02:01 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org, Roman I Khimov
	<khimov@altell.ru>
Date: Wed, 03 Nov 2010 10:02:00 +0100
Message-ID: <1288774920.3980.29.camel@mattotaupa>
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
Subject: libprelude: minimal-uclibc: task `install` fails with `sed: can't read /oe/build-minimal-uclibc/minimal-uclibc-dev/work/armv7a-oe-linux-uclibceabi/libprelude-1.0.0-r0/image/usr/lib/perl/5.8.8/auto/Prelude/.packlist: No such file or directory`
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
X-List-Received-Date: Wed, 03 Nov 2010 09:02:51 -0000
X-Groupsio-MsgNum: 25769
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-5jyMCd6gR/S2EPrrazcN"

--=-5jyMCd6gR/S2EPrrazcN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks, dear Roman,


Build Configuration:
BB_VERSION        =3D "1.10.0"
METADATA_BRANCH   =3D "org.openembedded.dev"
METADATA_REVISION =3D "8fc09c071a6fba0766c3b002209c758572298d26"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-uclibceabi"
MACHINE           =3D "beagleboard"
DISTRO            =3D "minimal-uclibc"
DISTRO_VERSION    =3D "dev-snapshot-20101103"
TARGET_FPU        =3D "hard"

testing to build `suricata_1.0.2` (commit f85795) [1] the build fails in
the task `install` of the dependency `libprelude_1.0.0` (commit 577889)
[2].

        make[1]: Leaving directory `/oe/build-minimal-uclibc/minimal-uclibc=
-dev/work/armv7a-oe-linux-uclibceabi/libprelude-1.0.0-r0/libprelude-1.0.0'
	sed: can't read /oe/build-minimal-uclibc/minimal-uclibc-dev/work/armv7a-oe=
-linux-uclibceabi/libprelude-1.0.0-r0/image/usr/lib/perl/5.8.8/auto/Prelude=
/.packlist: No such file or directory
	ERROR: Function do_install failed

Could you please take a look.


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Df857958=
0b47ea2e9022e7d9a375827fa750b71f1
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D5778891=
6d7a3675260267ac1e043efd367806253

--=-5jyMCd6gR/S2EPrrazcN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzRJQgACgkQPX1aK2wOHVi5OwCfbG0grWPny4oC1XcgZXDh3clx
2HQAn1ewAt/SnQJ9149CaniVNKdBAhWy
=1UTb
-----END PGP SIGNATURE-----

--=-5jyMCd6gR/S2EPrrazcN--
