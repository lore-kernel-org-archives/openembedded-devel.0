Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PeceH-00082x-SA for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 01:08:41 +0100
Received: from f053033090.adsl.alicedsl.de ([78.53.33.90]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pecdj-0008Hi-BX for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 00:08:07 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jan 2011 01:08:06 +0100
Message-ID: <1295222886.13967.27.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [RFC][PATCH] libomxil-bellagio: inherit class `pkgconfig` to stage pkg-config file `libomxil-bellagio.pc`
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
X-List-Received-Date: Mon, 17 Jan 2011 00:08:41 -0000
X-Groupsio-MsgNum: 28085
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-aiSo5eATDe/kn9rglOuq"

--=-aiSo5eATDe/kn9rglOuq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Sun Jan 16 20:16:47 2011 +0100

`libomxil-bellagio` distributes a pkg-config file [1] which is only put to =
the following location with the following content.

	$ more angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/pkgconf=
ig/libomxil-bellagio.pc
	prefix=3D/usr
	exec_prefix=3D/usr
	libdir=3D/usr/lib
	includedir=3D/usr/include
	toolsdir=3D/usr/bin
	pluginsdir=3D${libdir}/bellagio

	Name: libomxil
	Description: OpenMAX Integration Layer library
	Version: 0.9.2.1
	Libs: -L${libdir} -lomxil-bellagio
	Cflags: -I${includedir} -I${includedir}/bellagio

To make it useful for crosscompiling inherit `pkgconfig.bbclass`.

[1] http://omxil.git.sourceforge.net/git/gitweb.cgi?p=3Domxil/omxil;a=3Dblo=
b;f=3Dlibomxil-bellagio.pc.in;h=3Dabae71bf4ade80e26b28a755f214a96285fd5c47;=
hb=3D772f0eca88b242ffb5469e8e381c63ce1f7cd3e1

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
The reason for tagging this `[RFC]` is, that inheriting `pkgconfig.bbclass`=
 does not change anything in the behavior. Could commit c2c8fe4c [1]

	pkgconfig.bbclass: don't blindly install every .pc file

be the reason for this? But I do not see a warning printed. I tried the fol=
lowing, but it did not work. (But because of a path issue.)

	+do_install_append () {
	+       install -d ${D}${libdir}/pkgconfig
	+       install -m 0644 ${WORKDIR}/libomxil-bellagio.pc ${D}${libdir}/pkgc=
onfig/
	+}

[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dc2c8fe4=
c5629add94bd0b922f5b3446624a9f4d8
---
 recipes/openmax/libomxil-bellagio.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/openmax/libomxil-bellagio.inc b/recipes/openmax/libomx=
il-bellagio.inc
index 8c3a82c..8ec327e 100644
--- a/recipes/openmax/libomxil-bellagio.inc
+++ b/recipes/openmax/libomxil-bellagio.inc
@@ -3,11 +3,11 @@ LICENSE =3D "LGPLv2"
 DEPENDS =3D "alsa-lib ffmpeg \
            ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad', d)}=
"
=20
-INC_PR =3D "r7"
+INC_PR =3D "r8"
=20
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/omxil/${PN}-${PV}.tar.gz"
=20
-inherit autotools
+inherit autotools pkgconfig
=20
 FILES_${PN} +=3D "${libdir}/bellagio/*.so ${libdir}/bellagio/*.la"
 FILES_${PN}-dev +=3D "${libdir}/bellagio/*.a"
--=20
1.7.2.3

--=-aiSo5eATDe/kn9rglOuq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0ziGYACgkQPX1aK2wOHVjkbACfa5DHeAUuj9VY7IaDyN2IaljF
FhIAnRCuEzcpOef249ms4D1jWqJf2zQC
=qAyd
-----END PGP SIGNATURE-----

--=-aiSo5eATDe/kn9rglOuq--
