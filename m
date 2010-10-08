Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P41HB-0008P2-Cz for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 02:57:34 +0200
Received: from f053035201.adsl.alicedsl.de ([78.53.35.201]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P41Gr-0001n0-Oq for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 00:57:13 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 08 Oct 2010 02:57:12 +0200
Message-ID: <1286499432.3659.37.camel@mattotaupa>
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
Subject: [PATCH] cairo_1.10.0: add `glib-2.0-native` to `DEPENDS`
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
X-List-Received-Date: Fri, 08 Oct 2010 00:57:34 -0000
X-Groupsio-MsgNum: 24504
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-HSc4/nfk08P4TKoWqUWP"

--=-HSc4/nfk08P4TKoWqUWP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Thu, 7 Oct 2010 13:38:44 +0200

`do_compile()` of `cairo_1.10.0.bb` fails with the following error.

[=E2=80=A6]
        make[4]: Entering directory `/oe/build/angstrom-dev/work/armv7a-ang=
strom-linux-gnueabi/cairo-1.10.0-r0/cairo-1.10.0/util/cairo-gobject'
          CC     libcairo_gobject_la-cairo-gobject-enums.lo
        In file included from cairo-gobject-enums.c:8:
        cairo-gobject.h:44:25: error: glib-object.h: No such file or direct=
ory
        In file included from cairo-gobject-enums.c:8:
        cairo-gobject.h:52: error: expected '=3D', ',', ';', 'asm' or '__at=
tribute__' before 'cairo_gobject_context_get_type'
        cairo-gobject.h:56: error: expected '=3D', ',', ';', 'asm' or '__at=
tribute__' before 'cairo_gobject_device_get_type'
        cairo-gobject.h:60: error: expected '=3D', ',', ';', 'asm' or '__at=
tribute__' before 'cairo_gobject_pattern_get_type'
        [=E2=80=A6]

`glib-object.h` is only in sysroot of the build host.

    $ find angstrom-dev/ -name glib-object.h
    angstrom-dev/sysroots/i686-linux/usr/include/glib-2.0/glib-object.h

`cairo_1.8.8.bb` builds fine.

Adding `glib-2.0-native` to `DEPENDS` puts `glib-object.h` also into the sy=
sroot of the target machine and fixes the build.

    $ find angstrom-dev/ -name glib-object.h
    angstrom-dev/sysroots/i686-linux/usr/include/glib-2.0/glib-object.h
    angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.=
0/glib-object.h

Build tested with `angstrom-2008.1` for `MACHINE =3D "beagleboard"`.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/cairo/cairo_1.10.0.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/cairo/cairo_1.10.0.bb b/recipes/cairo/cairo_1.10.0.bb
index 7530cd1..9859b9c 100644
--- a/recipes/cairo/cairo_1.10.0.bb
+++ b/recipes/cairo/cairo_1.10.0.bb
@@ -1,5 +1,7 @@
 require cairo.inc
=20
+DEPENDS +=3D "glib-2.0-native"
+
 SRC_URI =3D "http://cairographics.org/releases/cairo-${PV}.tar.gz;name=3Dc=
airo \
 "
=20
--=20
1.7.1

--=-HSc4/nfk08P4TKoWqUWP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyubGIACgkQPX1aK2wOHVgSPQCdFujZqjMjJqm6srUikNV5lush
LVwAn2IgZgxil0jqmo8OKod+6bnYP4gu
=0o5/
-----END PGP SIGNATURE-----

--=-HSc4/nfk08P4TKoWqUWP--
