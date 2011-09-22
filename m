Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1R6gHa-0001E1-Ff for openembedded-devel@lists.openembedded.org;
	Thu, 22 Sep 2011 12:13:30 +0200
Received: from f053047106.adsl.alicedsl.de ([78.53.47.106]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1R6gCa-0003x1-B1 for openembedded-devel@lists.openembedded.org;
	Thu, 22 Sep 2011 10:08:20 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Sep 2011 12:07:51 +0200
In-Reply-To: <1316681869-14204-1-git-send-email-tristan.lelong@blunderer.org>
References: <1316681869-14204-1-git-send-email-tristan.lelong@blunderer.org>
X-Mailer: Evolution 3.0.3- 
Message-ID: <1316686092.4976.11.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: [PATCH v4] libroxml: Add version 2.1.1
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
X-List-Received-Date: Thu, 22 Sep 2011 10:13:30 -0000
X-Groupsio-MsgNum: 34438
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-IkQREGzGP0J88r/fgG8q"

--=-IkQREGzGP0J88r/fgG8q
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 22.09.2011, 10:57 +0200 schrieb Tristan Lelong:
> libroxml is a small fast and powerful xml library
> build successfully using org.openembedded.dev with DISTRO=3Dminimal and M=
ACHINE =3D "i686-generic"
> build successfully using org.openembedded.dev with DISTRO=3Dminimal and M=
ACHINE =3D "ppce500v2"
> tested using projects unit tests on powerpc binaries
>=20
> Signed-off-by: Tristan Lelong <tristan.lelong@blunderer.org>
> ---
>  recipes/libroxml/libroxml.inc      |   24 ++++++++++++++++++++++++
>  recipes/libroxml/libroxml_2.1.1.bb |    5 +++++
>  2 files changed, 29 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/libroxml/libroxml.inc
>  create mode 100644 recipes/libroxml/libroxml_2.1.1.bb
>=20
> diff --git a/recipes/libroxml/libroxml.inc b/recipes/libroxml/libroxml.in=
c
> new file mode 100644
> index 0000000..2ee03eb
> --- /dev/null
> +++ b/recipes/libroxml/libroxml.inc
> @@ -0,0 +1,24 @@
> +DESCRIPTION =3D "Small, fast and powerful xml library"
> +AUTHOR =3D "Tristan Lelong <tristan.lelong@libroxml.net>"
> +HOMEPAGE =3D "http://www.libroxml.net"
> +SECTION =3D "libs"
> +PRIORITY =3D "optional"
> +LICENSE =3D "LGPLv2.1+"
> +INC_PR =3D "r0"
> +
> +SRC_URI =3D "http://libroxml.googlecode.com/files/${P}.tar.gz"
> +
> +do_install() {
> +	install -D -m 755 ${S}/roxml ${D}/${bindir}/roxml
> +	install -D -m 755 ${S}/libroxml.so.0 ${D}/${libdir}/libroxml.so.0
> +	install -D -m 644 ${S}/libroxml.a ${D}/${libdir}/libroxml.a
> +	install -D -m 644 ${S}/inc/roxml.h ${D}/${includedir}/roxml.h
> +	ln -s libroxml.so.0 ${D}/${libdir}/libroxml.so
> +}
> +
> +PACKAGES +=3D "roxml roxml-dbg"
> +FILES_${PN} =3D "${libdir}/libroxml.so.0"
> +FILES_${PN}-dev =3D "${libdir}/libroxml.a ${libdir}/libroxml.so ${includ=
edir}/roxml.h"
> +FILES_${PN}-dbg =3D "${libdir}/.debug/libroxml.so.0"
> +FILES_roxml =3D "${bindir}/roxml"
> +FILES_roxml-dbg =3D "${bindir}/.debug/roxml"

I edited this to

+PACKAGES =3D+ "roxml roxml-dbg"
+FILES_roxml =3D "${bindir}/*"
+FILES_roxml-dbg =3D "${bindir}/.debug/*"

and committed this in 9e1aa4d0 [1].

The only difference I could spot is, that `libroxml.a` is packaged in
`libroxml-static`. I hope that is fine with you and I did not mess
anything up.

> diff --git a/recipes/libroxml/libroxml_2.1.1.bb b/recipes/libroxml/librox=
ml_2.1.1.bb
> new file mode 100644
> index 0000000..c47e1b7
> --- /dev/null
> +++ b/recipes/libroxml/libroxml_2.1.1.bb

[=E2=80=A6]


Thanks again,

Paul


PS: For the future you should try to move to OE-core [1] and meta-oe
where at leaste OE-core gets more support.


[1] http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3D9e1aa4d0=
2aed8ade9bbbc60ccab4aa58fe1bd2fd
[2] http://openembedded.org/index.php?title=3DOpenEmbedded-Core

--=-IkQREGzGP0J88r/fgG8q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk57CPcACgkQPX1aK2wOHVg2DQCdHQ0YJOWDYv8aNXthUAqOD8nN
IEoAoIL/LH9tHI8V9lyJ3he07SeJ+NyF
=2CNX
-----END PGP SIGNATURE-----

--=-IkQREGzGP0J88r/fgG8q--
