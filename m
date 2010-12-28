Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PXi2v-0004mo-Or for openembedded-devel@lists.openembedded.org;
	Tue, 28 Dec 2010 23:29:33 +0100
Received: from f053041248.adsl.alicedsl.de ([78.53.41.248]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PXi2i-0004SO-PQ for openembedded-devel@lists.openembedded.org;
	Tue, 28 Dec 2010 22:29:20 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Dec 2010 23:29:19 +0100
Message-ID: <1293575359.19557.0.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH] glib-2.0_2.26.1: remove `DEFAULT_PREFERENCE = "-1"`
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
X-List-Received-Date: Tue, 28 Dec 2010 22:29:33 -0000
X-Groupsio-MsgNum: 27552
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-ZTirNvVWidP5Kw0q+7ak"

--=-ZTirNvVWidP5Kw0q+7ak
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Sat, 25 Dec 2010 20:09:34 +0100

Since commit 07d94e [1] (upstream 2729be [2]) task `configure` of `libfso-g=
lib` fails with the following error, since GLib 2.26 is needed and Minimal =
and Minimal uClibc just provide GLib 2.24 since `glib-2.0_2.26.1.bb` has `D=
EFAULT_PREFERENCE =3D "-1"` set.

	checking pkg-config is at least version 0.9.0... yes
	checking for VALA_DBUS_BINDING_TOOL... yes
	checking for SPECS... yes
	checking for DEPS... configure: error: Package requirements (glib-2.0 >=3D=
 2.26.0
		      gobject-2.0 >=3D 2.26.0
		      gio-2.0 >=3D 2.26.0
		      gthread-2.0 >=3D 2.26.0) were not met:

	Requested 'glib-2.0 >=3D 2.26.0' but version of GLib is 2.24.1
	Requested 'gobject-2.0 >=3D 2.26.0' but version of GObject is 2.24.1
	Requested 'gio-2.0 >=3D 2.26.0' but version of GIO is 2.24.1
	Requested 'gthread-2.0 >=3D 2.26.0' but version of GThread is 2.24.1

	Consider adjusting the PKG_CONFIG_PATH environment variable if you
	installed software in a non-standard prefix.

	Alternatively, you may set the environment variables DEPS_CFLAGS
	and DEPS_LIBS to avoid the need to call pkg-config.
	See the pkg-config man page for more details.

	ERROR: Function do_configure failed

Other packages from the freesmartphone.org API reference implementation wil=
l also require GLib 2.26 in the future.

[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?h=3Dorg.open=
embedded.dev&id=3D07d94ebc8fd3d21fa83fb13fdf511ac008c316e6
[2] http://git.freesmartphone.org/?p=3Dlibfso-glib.git;a=3Dcommit;h=3D2729b=
e7c82a676455f93d201b0d0255ad7e139ba
[3] http://git.freesmartphone.org/?p=3Dcornucopia.git;a=3Dcommit;h=3D709ef6=
3eab6eb9736c15e6731a50de4ccbb3613c

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/glib-2.0/glib-2.0_2.26.1.bb |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/recipes/glib-2.0/glib-2.0_2.26.1.bb b/recipes/glib-2.0/glib-2.=
0_2.26.1.bb
index ded471b..1c855e2 100644
--- a/recipes/glib-2.0/glib-2.0_2.26.1.bb
+++ b/recipes/glib-2.0/glib-2.0_2.26.1.bb
@@ -29,8 +29,6 @@ inherit autotools gettext
=20
 S =3D "${WORKDIR}/glib-${PV}"
=20
-DEFAULT_PREFERENCE =3D "-1"
-
 EXTRA_OECONF =3D "--disable-debug "
=20
 # Add and entry for your favourite arch if your (g)libc has a sane printf
--=20
1.7.2.3

--=-ZTirNvVWidP5Kw0q+7ak
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0aZLoACgkQPX1aK2wOHVjIcACdHZVUTd/JABym/D9CqKGRAQiP
I+YAn2sJ57LLsXKbkvLEEHHkcKC6L2Dw
=hC4a
-----END PGP SIGNATURE-----

--=-ZTirNvVWidP5Kw0q+7ak--
