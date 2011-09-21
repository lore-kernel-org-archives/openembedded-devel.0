Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1R6O3h-0001SL-7a for openembedded-devel@lists.openembedded.org;
	Wed, 21 Sep 2011 16:45:57 +0200
Received: from f053045060.adsl.alicedsl.de ([78.53.45.60]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1R6Nyg-0000cz-Ig for openembedded-devel@lists.openembedded.org;
	Wed, 21 Sep 2011 14:40:46 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Sep 2011 16:40:38 +0200
In-Reply-To: <1316608829-30502-1-git-send-email-tristan.lelong@blunderer.org>
References: <1316608829-30502-1-git-send-email-tristan.lelong@blunderer.org>
X-Mailer: Evolution 3.0.3- 
Message-ID: <1316616039.4045.22.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: [PATCH v3] libroxml: Add version 2.1.1
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
X-List-Received-Date: Wed, 21 Sep 2011 14:45:57 -0000
X-Groupsio-MsgNum: 34413
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-DDR6ipS769SmPH+/4l7n"

--=-DDR6ipS769SmPH+/4l7n
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Tristan,


thank you for your patience.

Am Mittwoch, den 21.09.2011, 14:40 +0200 schrieb Tristan Lelong:
> libroxml is a small fast and powerful xml library
> build successfully using org.openembedded.dev with DISTRO=3Dminimal and M=
ACHINE =3D "i686-generic"
> build successfully using org.openembedded.dev with DISTRO=3Dminimal and M=
ACHINE =3D "ppce500v2"
> tested using projects unit tests on powerpc binaries
>=20
> Signed-off-by: Tristan Lelong <tristan.lelong@blunderer.org>
> ---
>  recipes/libroxml/libroxml.inc      |   21 +++++++++++++++++++++
>  recipes/libroxml/libroxml_2.1.1.bb |    5 +++++
>  2 files changed, 26 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/libroxml/libroxml.inc
>  create mode 100644 recipes/libroxml/libroxml_2.1.1.bb
>=20
> diff --git a/recipes/libroxml/libroxml.inc b/recipes/libroxml/libroxml.in=
c
> new file mode 100644
> index 0000000..eed21d1
> --- /dev/null
> +++ b/recipes/libroxml/libroxml.inc
> @@ -0,0 +1,21 @@
> +DESCRIPTION =3D "Small, fast and powerful xml library"
> +AUTHOR =3D "Tristan Lelong <tristan.lelong@libroxml.net>"
> +HOMEPAGE =3D "http://www.libroxml.net"
> +SECTION =3D "libs"
> +PRIORITY =3D "optional"
> +LICENSE =3D "LGPL"

I checked again. This should be `LGPLv2.1+`, I think.

> +INC_PR =3D "r1"

Please start with `r0` when submitting recipes.

> +
> +SRC_URI =3D "http://libroxml.googlecode.com/files/${P}.tar.gz"
> +
> +do_install() {
> +	install -D -m 755 ${S}/roxml ${D}/${bindir}/roxml
> +	install -D -m 755 ${S}/libroxml.so.0 ${D}/${libdir}/libroxml.so.0
> +	install -D -m 644 ${S}/inc/roxml.h ${D}/${includedir}/roxml.h
> +	ln -s /usr/lib/libroxml.so.0 ${D}/${libdir}/libroxml.so
> +}
> +
> +PACKAGES =3D ${PN} ${PN}-dev roxml

Is that intended? Using `=3D` you override the variable and for example no
debug package is created and the following files are not packaged.

        WARNING: the following files were installed but not shipped in any =
package:
        WARNING:   /usr/lib/.debug/libroxml.so.0
        WARNING:   /usr/bin/.debug/roxml

> +FILES_${PN} =3D ${libdir}/libroxml.so.0
> +FILES_${PN}-dev =3D ${libdir}/libroxml.so ${includedir}/roxml.h
> +FILES_roxml =3D ${bindir}/roxml

Does

PACKAGES +=3D "roxml"
FILES_roxml =3D ${bindir}/roxml

work for? I do not know if it is done automatically. Maybe you also have
to add `roxml-dbg` then. I am not sure.

> diff --git a/recipes/libroxml/libroxml_2.1.1.bb b/recipes/libroxml/librox=
ml_2.1.1.bb
> new file mode 100644
> index 0000000..0852930
> --- /dev/null
> +++ b/recipes/libroxml/libroxml_2.1.1.bb
> @@ -0,0 +1,5 @@
> +require libroxml.inc
> +PR =3D "${INC_PR}.1"

Please also start with 0.

> +
> +SRC_URI[md5sum] =3D "dc8342d0490bff5a507dbf1de3426102"
> +SRC_URI[sha256sum] =3D "e4e91b610614d6cb1204ac9abbb417368fe84654c7de5813=
4b436cfd00f1a244"

Thank you! I guess the next iteration will be ready to be committed.


Thanks,

Paul

--=-DDR6ipS769SmPH+/4l7n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5592YACgkQPX1aK2wOHVhHEACfTTHhFwqb2lj6ntOKCfJHyYN1
/icAnRACnbVy+puwfBzP4m2Vxp07Ai56
=ggfW
-----END PGP SIGNATURE-----

--=-DDR6ipS769SmPH+/4l7n--
