Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1R5Eff-0002iO-Bf for openembedded-devel@lists.openembedded.org;
	Sun, 18 Sep 2011 12:32:23 +0200
Received: from f053043176.adsl.alicedsl.de ([78.53.43.176]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1R5Eaq-0001ME-Kx; Sun, 18 Sep 2011 10:27:24 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Sep 2011 12:26:53 +0200
In-Reply-To: <1316012411-28874-1-git-send-email-tristan.lelong@blunderer.org>
References: <1316012411-28874-1-git-send-email-tristan.lelong@blunderer.org>
X-Mailer: Evolution 3.0.3- 
Message-ID: <1316341630.7061.9.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: [PATCH v2] libroxml: Add version 2.1.0
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
X-List-Received-Date: Sun, 18 Sep 2011 10:32:23 -0000
X-Groupsio-MsgNum: 34330
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-Qk38Y5B8SKxektJS6b7o"

--=-Qk38Y5B8SKxektJS6b7o
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Tristan,


thank you for updating the patch.

Am Mittwoch, den 14.09.2011, 17:00 +0200 schrieb tristan.lelong@blunderer.o=
rg:
> From: Tristan Lelong <tristan.lelong@blunderer.org>
>=20
> libroxml is a small fast and powerful xml library

Please add how you tested this package with.

> Signed-off-by: Tristan Lelong <tristan.lelong@blunderer.org>
> ---
>  recipes/libroxml/libroxml.inc      |   19 +++++++++++++++++++
>  recipes/libroxml/libroxml_2.1.0.bb |    6 ++++++
>  2 files changed, 25 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/libroxml/libroxml.inc
>  create mode 100644 recipes/libroxml/libroxml_2.1.0.bb
>=20
> diff --git a/recipes/libroxml/libroxml.inc b/recipes/libroxml/libroxml.in=
c
> new file mode 100644
> index 0000000..06322fe
> --- /dev/null
> +++ b/recipes/libroxml/libroxml.inc
> @@ -0,0 +1,19 @@
> +DESCRIPTION =3D "Small, fast and powerful xml library"
> +AUTHOR =3D "Tristan Lelong <tristan.lelong@libroxml.net>"
> +HOMEPAGE =3D "http://www.libroxml.net"
> +SECTION =3D "libs"
> +PRIORITY =3D "optional"
> +INC_PR =3D "r0"
> +LICENSE =3D "LGPL"

Please order according to the style guide [1].

Additionally checking the license this contradicts itself. `LGPL.txt`
actually says version 3 or later, but the header in the the source files
like `roxml.c` says LGPL 2.1 or later.

Please clarify that in the source as you are the upstream author.
Additionally please never release a new source archive without changing
the version number. This causes problems when checksums are used as in
OE.

> +
> +SRC_URI =3D "http://libroxml.googlecode.com/files/libroxml-2.1.0.tar.gz"

Please use `${P}` instead of `libroxml-2.1.0`.

> +
> +inherit pkgconfig

You do not ship any pkg-config file.

> +
> +do_install() {
> +        oe_runmake install DESTDIR=3D${D}
> +}
> +
> +PACKAGES=3D ${PN} roxml
> +FILES_${PN} =3D ${libdir}/libroxml.so.0
> +FILES_roxml =3D ${bindir}/roxml

Why do you need to define that manually?

        NOTE: package libroxml-2.1.0-r0.0: task do_qa_staging: Started
        WARNING: the following files were installed but not shipped in any =
package:
        WARNING:   /usr/lib/libroxml.so
        WARNING:   /usr/lib/libroxml.a
        WARNING:   /usr/lib/pkgconfig/libroxml.pc
        WARNING:   /usr/lib/.debug/libroxml.so.0
        WARNING:   /usr/include/roxml.h
        WARNING:   /usr/share/man/man1/roxml.1
        WARNING:   /usr/share/doc/libroxml/LGPL.txt =20
        WARNING:   /usr/bin/.debug/roxml

> diff --git a/recipes/libroxml/libroxml_2.1.0.bb b/recipes/libroxml/librox=
ml_2.1.0.bb
> new file mode 100644
> index 0000000..b3669e1
> --- /dev/null
> +++ b/recipes/libroxml/libroxml_2.1.0.bb
> @@ -0,0 +1,6 @@
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[md5sum] =3D "ad1903efa241914baec2fd432a176549"
> +SRC_URI[sha256sum] =3D "bf2d908c330e28e5470fe9a841438b78025dc1406742fc54=
aad6fa8db401229a"
> +
> +require libroxml.inc

I think `require libroxml.inc` should go to the beginning.


Thanks,

Paul


[1] http://openembedded.org/index.php?title=3DStyleguide

--=-Qk38Y5B8SKxektJS6b7o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk51x20ACgkQPX1aK2wOHViPrgCfU9e5I6qohdRcw2kfT0jr2dvZ
NQoAn2Vhi4ZVGqBopefHqTO8sfaVjgQZ
=Mzwp
-----END PGP SIGNATURE-----

--=-Qk38Y5B8SKxektJS6b7o--
