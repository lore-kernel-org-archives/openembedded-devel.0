Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QR7zr-0001dt-4E for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 21:19:27 +0200
Received: from f053035189.adsl.alicedsl.de ([78.53.35.189]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QR7xL-0003aj-3M; Mon, 30 May 2011 19:16:51 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201105220143.54594.schnitzeltony@gmx.de>
References: <201105220001.36288.schnitzeltony@gmx.de>
	<201105220143.54594.schnitzeltony@gmx.de>
Date: Mon, 30 May 2011 21:16:18 +0200
Message-ID: <1306782978.4106.483.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: [PATCH] Revert "perl-native: create_wrapper on perl${PV} too"
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
X-List-Received-Date: Mon, 30 May 2011 19:19:27 -0000
X-Groupsio-MsgNum: 32404
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-zgL8209iOpbcAiOZ8ZQ4"

--=-zgL8209iOpbcAiOZ8ZQ4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Paul Menzel <paulepanter@users.sourceforge.net>
Date: Mon, 30 May 2011 21:08:24 +0200

This reverts commit 1e255fbd296e95ff178d66c4a1fe4875a988d7e1.

	Author: Tom Rini <tom_rini@mentor.com>
	Date:   Mon May 16 13:06:33 2011 -0700

		  perl-native: create_wrapper on perl${PV} too

		  perl${PV} becomes hostperl when building for the target so we need a
		  wrapper on that too.

		  Signed-off-by: Tom Rini <tom_rini@mentor.com>

It breaks task compile of perl using `angstrom-2010.x` or `minimal{,-uclibc=
}` for `MACHINE =3D "beagleboard"` [1].

[=E2=80=A6]
| mv -f miniperl miniperl-target
| ln -s hostperl miniperl
| LD_LIBRARY_PATH=3D/home/Superandy/tmp/work/armv7a-angstrom-linux-gnueabi/=
perl-5.10.1-r22/perl-5.10.1${LD_LIBRARY_PATH:+:}$LD_LIBRARY_PATH ./miniperl=
 -Ilib make_patchnum.pl
| env: ./perl5.10.1.real: No such file or directory
| make[1]: *** [lib/Config_git.pl] Error 127
| make[1]: Leaving directory `/home/Superandy/tmp/work/armv7a-angstrom-linu=
x-gnueabi/perl-5.10.1-r22/perl-5.10.1'
| make[1]: Entering directory `/home/Superandy/tmp/work/armv7a-angstrom-lin=
ux-gnueabi/perl-5.10.1-r22/perl-5.10.1'
| LD_LIBRARY_PATH=3D/home/Superandy/tmp/work/armv7a-angstrom-linux-gnueabi/=
perl-5.10.1-r22/perl-5.10.1${LD_LIBRARY_PATH:+:}$LD_LIBRARY_PATH ./miniperl=
 -Ilib autodoc.pl
| env: ./perl5.10.1.real: No such file or directory
| make[1]: *** [pod/perlapi.pod] Error 127
| make[1]: Leaving directory `/home/Superandy/tmp/work/armv7a-angstrom-linu=
x-gnueabi/perl-5.10.1-r22/perl-5.10.1'
| make: *** [perl] Error 2
[=E2=80=A6]

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-May/032981=
.html

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
CC: Tom Rini <tom_rini@mentor.com>
---
A fix is preferred though. ;-) Probably `PR` needs to be updated somehow to=
o.
---
 recipes/perl/perl-native_5.10.1.bb |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/recipes/perl/perl-native_5.10.1.bb b/recipes/perl/perl-native_=
5.10.1.bb
index fdbe055..3dafc10 100644
--- a/recipes/perl/perl-native_5.10.1.bb
+++ b/recipes/perl/perl-native_5.10.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION =3D "Perl is a popular scripting language."
 HOMEPAGE =3D "http://www.perl.org/"
 SECTION =3D "libs"
 LICENSE =3D "Artistic|GPLv1+"
-PR =3D "r11"
+PR =3D "r10"
 NATIVE_INSTALL_WORKS =3D "1"
 INHIBIT_DEFAULT_DEPS =3D "1"
 PATCHTOOL =3D "patch"
@@ -108,7 +108,6 @@ do_install() {
 	done
=20
 	create_wrapper ${D}${bindir}/perl PERL5LIB=3D'$PERL5LIB:${STAGING_LIBDIR}=
/perl/${PV}:${STAGING_LIBDIR}/perl/'
-	create_wrapper ${D}${bindir}/perl${PV} PERL5LIB=3D'$PERL5LIB:${STAGING_LI=
BDIR}/perl/${PV}:${STAGING_LIBDIR}/perl/'
 }
=20
 do_install_append_nylon() {
--=20
1.7.5.3

--=-zgL8209iOpbcAiOZ8ZQ4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3j7QIACgkQPX1aK2wOHVjMkQCgiHAAhY2NRovKaDpUxl/7XVMm
etkAn1fKeXuUBNZ3a/lYCUNLzyX8j3kp
=r7UJ
-----END PGP SIGNATURE-----

--=-zgL8209iOpbcAiOZ8ZQ4--
