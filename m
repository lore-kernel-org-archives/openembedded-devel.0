Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pwx29-0007rP-QR for openembedded-devel@lists.openembedded.org;
	Tue, 08 Mar 2011 14:33:05 +0100
Received: from f053034177.adsl.alicedsl.de ([78.53.34.177]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pwx0f-0001yW-Ow for openembedded-devel@lists.openembedded.org;
	Tue, 08 Mar 2011 13:31:33 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 08 Mar 2011 14:31:32 +0100
Message-ID: <1299591092.3785.121.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: [PATCH] xfce4-session_4.6.{1,2}: add `libwnck` to `DEPENDS`
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
X-List-Received-Date: Tue, 08 Mar 2011 13:33:05 -0000
X-Groupsio-MsgNum: 29987
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-d2WvxvfTyDx8NchN4Czq"

--=-d2WvxvfTyDx8NchN4Czq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Tue, 8 Mar 2011 12:27:26 +0100

Task `configure` fails with the following error.

	checking for pkg-config >=3D 0.9.0... 0.23
	checking for libxfce4util-1.0 >=3D 4.6.0... 4.6.2
	checking LIBXFCE4UTIL_CFLAGS... -I/oe/build/angstrom-dev/sysroots/armv7a-a=
ngstrom-linux-gnueabi/usr/include/xfce4 -I/oe/build/angstrom-dev/sysroots/a=
rmv7a-angstrom-linux-gnueabi/usr/include/glib-2.0 -I/oe/build/angstrom-dev/=
sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/glib-2.0/include
	checking LIBXFCE4UTIL_LIBS... -lxfce4util -lglib-2.0
	checking for libxfcegui4-1.0 >=3D 4.6.0... 4.6.4
	checking LIBXFCEGUI4_CFLAGS... -pthread -I/oe/build/angstrom-dev/sysroots/=
armv7a-angstrom-linux-gnueabi/usr/include/xfce4 -I/oe/build/angstrom-dev/sy=
sroots/armv7a-angstrom-linux-gnueabi/usr/include/gtk-2.0 -I/oe/build/angstr=
om-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/gtk-2.0/include -I/oe=
/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/pang=
o-1.0 -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/i=
nclude/glib-2.0 -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnu=
eabi/usr/lib/glib-2.0/include -I/oe/build/angstrom-dev/sysroots/armv7a-angs=
trom-linux-gnueabi/usr/include/cairo -I/oe/build/angstrom-dev/sysroots/armv=
7a-angstrom-linux-gnueabi/usr/include/pixman-1 -I/oe/build/angstrom-dev/sys=
roots/armv7a-angstrom-linux-gnueabi/usr/include/freetype2 -I/oe/build/angst=
rom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/libpng12 -I/oe/b=
uild/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/atk-1.=
0
	checking LIBXFCEGUI4_LIBS... -pthread -lxfcegui4 -lgtk-x11-2.0 -lxfce4util=
 -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpangoft2-1.0 -lgdk_pixbuf-2.0 -lpangoc=
airo-1.0 -lcairo -lpango-1.0 -lfreetype -lfontconfig -lgobject-2.0 -lgmodul=
e-2.0 -lgthread-2.0 -lrt -lglib-2.0
	checking for libwnck-1.0 >=3D 2.12... not found
	*** The required package libwnck-1.0 was not found on your system.
	*** Please install libwnck-1.0 (atleast version 2.12) or adjust
	*** the PKG_CONFIG_PATH environment variable if you
	*** installed the package in a nonstandard prefix so that
	*** pkg-config is able to find it.

Adding `libwnck` to `DEPENDS` makes this error go away.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
`xfce4-session_4.4.2.bb` does not seem to require `libwnck`.
---
 recipes/xfce-base/xfce4-session_4.6.1.bb |    2 +-
 recipes/xfce-base/xfce4-session_4.6.2.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/xfce-base/xfce4-session_4.6.1.bb b/recipes/xfce-base/x=
fce4-session_4.6.1.bb
index de07fb3..72b58d3 100644
--- a/recipes/xfce-base/xfce4-session_4.6.1.bb
+++ b/recipes/xfce-base/xfce4-session_4.6.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "xfce4-session is a sessionmanager for Xfce 4 Desktop  Env=
ironment"
-DEPENDS =3D "libxfcegui4 libxfce4util dbus iceauth xfce-utils"
+DEPENDS =3D "libwnck libxfcegui4 libxfce4util dbus iceauth xfce-utils"
 SECTION =3D "x11"
=20
 PR =3D "r4"
diff --git a/recipes/xfce-base/xfce4-session_4.6.2.bb b/recipes/xfce-base/x=
fce4-session_4.6.2.bb
index c85bb8c..d7f768a 100644
--- a/recipes/xfce-base/xfce4-session_4.6.2.bb
+++ b/recipes/xfce-base/xfce4-session_4.6.2.bb
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "xfce4-session is a session manager for Xfce 4 Desktop Env=
ironment"
-DEPENDS =3D "libxfcegui4 libxfce4util dbus iceauth xfce-utils"
+DEPENDS =3D "libwnck libxfcegui4 libxfce4util dbus iceauth xfce-utils"
 SECTION =3D "x11"
=20
 PR =3D "r0"
--=20
1.7.4.1

--=-d2WvxvfTyDx8NchN4Czq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk12L6MACgkQPX1aK2wOHVj6owCZAVxru6emKIzZgjs9IZYPuh+l
7XMAn3WhEK5Ml6UOaSUacNGSf3yhvFE7
=0Ocn
-----END PGP SIGNATURE-----

--=-d2WvxvfTyDx8NchN4Czq--
