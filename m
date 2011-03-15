Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PzRLc-0005iG-83 for openembedded-devel@lists.openembedded.org;
	Tue, 15 Mar 2011 11:19:28 +0100
Received: from f053032095.adsl.alicedsl.de ([78.53.32.95]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PzRK0-0005HD-Qt for openembedded-devel@lists.openembedded.org;
	Tue, 15 Mar 2011 10:17:48 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Mar 2011 11:17:47 +0100
Message-ID: <1300184267.3759.123.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: [PATCH] mango-lassi: `touch config.rpath` to fix `configure.ac:127: required file `./config.rpath' not found`
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
X-List-Received-Date: Tue, 15 Mar 2011 10:19:28 -0000
X-Groupsio-MsgNum: 30219
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-VSPZHz0K0XjZhKdVUXU/"

--=-VSPZHz0K0XjZhKdVUXU/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Tue, 15 Mar 2011 10:58:26 +0100

Task configure fails with the following error message.

	Build Configuration:
	BB_VERSION        =3D "1.12.0"
	METADATA_BRANCH   =3D "<unknown>"
	METADATA_REVISION =3D "b1fbaf6"
	TARGET_ARCH       =3D "arm"
	TARGET_OS         =3D "linux-gnueabi"
	MACHINE           =3D "beagleboard"
	DISTRO            =3D "angstrom"
	DISTRO_VERSION    =3D "v20110315"
	TARGET_FPU        =3D "hard"

	[=E2=80=A6]
	autoreconf: running: /oe/build-angstrom-next/angstrom-dev/sysroots/i686-li=
nux/usr/bin/autoheader --include=3D/oe/build-angstrom-next/angstrom-dev/sys=
roots/armv7a-angstrom-linux-gnueabi/usr/share/aclocal-1.11 --include=3D/oe/=
build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr=
/share/aclocal --force --warnings=3Dcross
	autoreconf: running: automake --foreign --add-missing --copy --force-missi=
ng --warnings=3Dcross
	automake: unknown warning category `cross'
	configure.ac:39: installing `./compile'
	configure.ac:127: installing `./config.guess'
	configure.ac:127: required file `./config.rpath' not found
	configure.ac:127: installing `./config.sub'
	configure.ac:27: installing `./install-sh'
	configure.ac:27: installing `./missing'
	Makefile.am: installing `./depcomp'
	autoreconf: automake failed with exit status: 1
	+ oefatal 'autoreconf execution failed.'
	+ echo FATAL: 'autoreconf execution failed.'
	FATAL: autoreconf execution failed.
	+ exit 1

`touch config.rpath` in `do_configure_perpend() {}` fixes the issues.

Mango Lasso includes `bootstrap.sh` [1] which also does the same. Using `bo=
otstrap.sh` [1] for configuring Mango Lassi is not considered because `puls=
eaudio_git.bb` [2] also uses the proposed fix.

[1] http://git.0pointer.de/?p=3Dmango-lassi.git;a=3Dblob;f=3Dbootstrap.sh;h=
=3D089d445b3cce3374b48fc083f1f87983c4100052;hb=3DHEAD
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/pulseau=
dio/pulseaudio_git.bb?id=3Dfcb12f3a4448621ccc75d37dcad4a01820fdf89d#n27

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/avahi/mango-lassi_git.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/recipes/avahi/mango-lassi_git.bb b/recipes/avahi/mango-lassi_g=
it.bb
index 1faee4b..049ac24 100644
--- a/recipes/avahi/mango-lassi_git.bb
+++ b/recipes/avahi/mango-lassi_git.bb
@@ -11,3 +11,6 @@ S =3D "${WORKDIR}/git"
=20
 inherit autotools
=20
+do_configure_prepend() {
+    touch config.rpath
+}
--=20
1.7.4.1

--=-VSPZHz0K0XjZhKdVUXU/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk1/PMsACgkQPX1aK2wOHVinGACfSmKi0go6RT/8dxavw2mWOwnc
0GgAnRlDdMvgqMtkneaPkhf4UBKoZwJF
=AODD
-----END PGP SIGNATURE-----

--=-VSPZHz0K0XjZhKdVUXU/--
