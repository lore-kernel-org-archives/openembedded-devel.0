Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QLe3m-0006Rs-11 for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 18:20:50 +0200
Received: from f053043231.adsl.alicedsl.de ([78.53.43.231]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QLe2T-0001M4-Bh for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 16:19:29 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1303134465.3910.63.camel@mattotaupa>
References: <1303134465.3910.63.camel@mattotaupa>
Date: Sun, 15 May 2011 18:17:58 +0200
Message-ID: <1305476278.5838.608.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 1/2] pkgconfig: refactor to include file `pkgconfig-0.23.inc`
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
X-List-Received-Date: Sun, 15 May 2011 16:20:50 -0000
X-Groupsio-MsgNum: 32058
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-6qRIGT8N8I+BhgUMqwhX"

--=-6qRIGT8N8I+BhgUMqwhX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 18.04.2011, 15:47 +0200 schrieb Paul Menzel:
> Date: Sun, 17 Apr 2011 22:44:04 +0200
>=20
> In pkg-config releases after 0.23 no patches need to be applied and OE de=
faults can be used. Since `pkgconfig-{native,sdk}` also need the common bit=
s factor those out into `pkgconfig-0.23.inc`.
>=20
> This patch is build tested using `angstrom-2010.x` and `minimal{,-uclibc}=
` for `MACHINE =3D "beagleboard"`.
>=20
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
>  recipes/pkgconfig/pkgconfig-0.23.inc       |   14 ++++++++++++++
>  recipes/pkgconfig/pkgconfig-native_0.23.bb |    6 +-----
>  recipes/pkgconfig/pkgconfig-sdk_0.23.bb    |    6 +-----
>  recipes/pkgconfig/pkgconfig.inc            |   11 +++--------
>  recipes/pkgconfig/pkgconfig_0.23.bb        |    7 ++-----
>  5 files changed, 21 insertions(+), 23 deletions(-)
>  create mode 100644 recipes/pkgconfig/pkgconfig-0.23.inc


>=20
> diff --git a/recipes/pkgconfig/pkgconfig-0.23.inc b/recipes/pkgconfig/pkg=
config-0.23.inc
> new file mode 100644
> index 0000000..5f87d28
> --- /dev/null
> +++ b/recipes/pkgconfig/pkgconfig-0.23.inc
> @@ -0,0 +1,14 @@
> +require pkgconfig.inc
> +
> +SRC_URI +=3D " \
> +            file://autofoo.patch \
> +            file://sysrootfix.patch \
> +            file://glibconfig-sysdefs.h \
> +           "
> +SRC_URI[md5sum] =3D "d922a88782b64441d06547632fd85744"
> +SRC_URI[sha256sum] =3D "08a0e072d6a05419a58124db864f0685e6ac96e71b2875bf=
15ac12714e983b53"
> +
> +acpaths =3D "-I ."
> +do_configure_prepend () {
> +	install -m 0644 ${WORKDIR}/glibconfig-sysdefs.h glib-1.2.*/
> +}
> diff --git a/recipes/pkgconfig/pkgconfig-native_0.23.bb b/recipes/pkgconf=
ig/pkgconfig-native_0.23.bb
> index f5f44ac..309077a 100644
> --- a/recipes/pkgconfig/pkgconfig-native_0.23.bb
> +++ b/recipes/pkgconfig/pkgconfig-native_0.23.bb
> @@ -1,11 +1,7 @@
> -require pkgconfig.inc
> +require pkgconfig-0.23.inc
>  FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/pkgconfig-=
${PV}"
> =20
>  PR =3D "${INC_PR}.1"
> =20
> -S =3D "${WORKDIR}/pkg-config-${PV}/"
>  inherit native
>  DEPENDS =3D ""
> -
> -SRC_URI[md5sum] =3D "d922a88782b64441d06547632fd85744"
> -SRC_URI[sha256sum] =3D "08a0e072d6a05419a58124db864f0685e6ac96e71b2875bf=
15ac12714e983b53"
> diff --git a/recipes/pkgconfig/pkgconfig-sdk_0.23.bb b/recipes/pkgconfig/=
pkgconfig-sdk_0.23.bb
> index cbe6b81..4efb7bd 100644
> --- a/recipes/pkgconfig/pkgconfig-sdk_0.23.bb
> +++ b/recipes/pkgconfig/pkgconfig-sdk_0.23.bb
> @@ -1,11 +1,7 @@
> -require pkgconfig.inc
> +require pkgconfig-0.23.inc
>  FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/pkgconfig-=
${PV}"
> =20
>  PR =3D "${INC_PR}.1"
> =20
> -S =3D "${WORKDIR}/pkg-config-${PV}/"
>  inherit sdk
>  DEPENDS =3D ""
> -
> -SRC_URI[md5sum] =3D "d922a88782b64441d06547632fd85744"
> -SRC_URI[sha256sum] =3D "08a0e072d6a05419a58124db864f0685e6ac96e71b2875bf=
15ac12714e983b53"
> diff --git a/recipes/pkgconfig/pkgconfig.inc b/recipes/pkgconfig/pkgconfi=
g.inc
> index 4edad6a..e6fa5f1 100644
> --- a/recipes/pkgconfig/pkgconfig.inc
> +++ b/recipes/pkgconfig/pkgconfig.inc
> @@ -5,22 +5,17 @@ It replaces the ubiquitous *-config scripts you may hav=
e \
>  seen with a single tool."
>  HOMEPAGE =3D "http://pkg-config.freedesktop.org/wiki/"
>  LICENSE =3D "GPLv2+"
> +DEPENDS =3D "glib-2.0"
>  INC_PR =3D "r8"
> =20
>  SRC_URI =3D "http://pkgconfig.freedesktop.org/releases/pkg-config-${PV}.=
tar.gz \
> -           file://autofoo.patch \
> -           file://sysrootfix.patch \
> -           file://glibconfig-sysdefs.h"
> +          "
> =20
> +# Setting `S` is needed, since the recipe name is `pkgconfig` instead of=
 `pkg-config`.
>  S =3D "${WORKDIR}/pkg-config-${PV}/"
> =20
>  inherit autotools
> =20
> -acpaths =3D "-I ."
> -do_configure_prepend () {
> -	install -m 0644 ${WORKDIR}/glibconfig-sysdefs.h glib-1.2.*/
> -}
> -
>  do_install_append() {
>  	install -d -m 0755 ${D}${libdir}/pkgconfig
>  }
> diff --git a/recipes/pkgconfig/pkgconfig_0.23.bb b/recipes/pkgconfig/pkgc=
onfig_0.23.bb
> index 39f7010..3d8fe6c 100644
> --- a/recipes/pkgconfig/pkgconfig_0.23.bb
> +++ b/recipes/pkgconfig/pkgconfig_0.23.bb
> @@ -1,9 +1,6 @@
> -require pkgconfig.inc
> +require ${PN}.inc
> +require ${P}.inc
> =20
>  PR =3D "${INC_PR}.3"
> =20
> -DEPENDS +=3D "glib-2.0"
>  EXTRA_OECONF =3D "--with-installed-glib"
> -
> -SRC_URI[md5sum] =3D "d922a88782b64441d06547632fd85744"
> -SRC_URI[sha256sum] =3D "08a0e072d6a05419a58124db864f0685e6ac96e71b2875bf=
15ac12714e983b53"
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--=-6qRIGT8N8I+BhgUMqwhX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3P/LYACgkQPX1aK2wOHVi8PACfcIRqVVlbpT9JXxR7noGBNpud
zooAn20kidPi1lyS1uqnGAYwJTICnRoL
=VQn1
-----END PGP SIGNATURE-----

--=-6qRIGT8N8I+BhgUMqwhX--
