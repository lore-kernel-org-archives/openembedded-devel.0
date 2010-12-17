Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PTnAM-0002Zn-7y for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 04:09:02 +0100
Received: from f053034146.adsl.alicedsl.de ([78.53.34.146]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PTXA1-0001aO-MU for openembedded-devel@lists.openembedded.org;
	Fri, 17 Dec 2010 10:03:37 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Dec 2010 11:03:36 +0100
Message-ID: <1292580216.24903.4.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH] python-pycairo_1.8.0: remove `DEFAULT_PREFERENCE = "-1"`
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
X-List-Received-Date: Sat, 18 Dec 2010 03:09:02 -0000
X-Groupsio-MsgNum: 27248
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Rz7LdxSBoHTYJwAKZsgk"

--=-Rz7LdxSBoHTYJwAKZsgk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Thu, 16 Dec 2010 23:20:25 +0100

Cairo 1.8 is available for some time and =C8=A6ngstr=C3=B6m and other distr=
ibutions have pinned this Pycairo version for quite some time.

Build tested with Minimal and Minimal uClibc.

	Build Configuration:
	BB_VERSION        =3D "1.10.0"
	METADATA_BRANCH   =3D "org.openembedded.dev"
	METADATA_REVISION =3D "977d4dd"
	TARGET_ARCH       =3D "arm"
	TARGET_OS         =3D "linux-gnueabi"
	MACHINE           =3D "beagleboard"
	DISTRO            =3D "minimal"
	DISTRO_VERSION    =3D "dev-snapshot-20101217"
	TARGET_FPU        =3D "hard"

	Build Configuration:
	BB_VERSION        =3D "1.10.0"
	METADATA_BRANCH   =3D "org.openembedded.dev"
	METADATA_REVISION =3D "977d4dd"
	TARGET_ARCH       =3D "arm"
	TARGET_OS         =3D "linux-uclibceabi"
	MACHINE           =3D "beagleboard"
	DISTRO            =3D "minimal-uclibc"
	DISTRO_VERSION    =3D "dev-snapshot-20101217"
	TARGET_FPU        =3D "hard"

`python-pygtk_2.16.0.bb` does not build with `python-pycairo_1.4.0` because=
 it does not put its package config files in `sysroots`.

	checking for ATK... yes
	checking for PANGO... yes
	checking for codegen... /oe/build-minimal-eglibc/minimal-dev/sysroots/armv=
7a-oe-linux-gnueabi/usr/share/pygobject/2.0/codegen
	checking for PYCAIRO... no
	no
	not checking for gtk due to missing pycairo
	checking for GDK target... x11
	configure: WARNING: Could not find a valid numpy installation, disabling.
	checking whether arm-oe-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex=
-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb understa=
nds -Wall... yes
	checking whether arm-oe-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex=
-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb understa=
nds -fno-strict-aliasing... yes
	checking whether arm-oe-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex=
-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb understa=
nds -std=3Dc9x... yes
	configure: error: conditional "HAVE_GTK_2_16" was never defined.
	Usually this means the macro was only invoked conditionally.
	ERROR: Function do_configure failed

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/python/python-pycairo_1.8.0.bb |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/recipes/python/python-pycairo_1.8.0.bb b/recipes/python/python=
-pycairo_1.8.0.bb
index 0b44acb..6f96ea8 100644
--- a/recipes/python/python-pycairo_1.8.0.bb
+++ b/recipes/python/python-pycairo_1.8.0.bb
@@ -6,8 +6,6 @@ LICENSE =3D "LGPL MPL"
 DEPENDS =3D "cairo"
 PR =3D "ml4"
=20
-DEFAULT_PREFERENCE =3D "-1"
-
 SRC_URI =3D "http://cairographics.org/releases/pycairo-${PV}.tar.gz \
            file://fix-setup-py.patch"
 S =3D "${WORKDIR}/pycairo-${PV}"
--=20
1.7.2.3

--=-Rz7LdxSBoHTYJwAKZsgk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0LNXAACgkQPX1aK2wOHVjYwQCgjWNl+HLYlibn7+TUOlyOkD+q
WPwAn04yiPgaPzJn/lwazgn6biOHVKVO
=f9o5
-----END PGP SIGNATURE-----

--=-Rz7LdxSBoHTYJwAKZsgk--
