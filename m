Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RUxWR-0006at-3N for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 10:29:11 +0100
Received: from f053038019.adsl.alicedsl.de ([78.53.38.19]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RUxQ4-0005YF-Hg for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 09:22:36 +0000
Message-ID: <1322472154.3637.10.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Nov 2011 10:22:34 +0100
In-Reply-To: <1322146025-21514-1-git-send-email-sledz@dresearch-fe.de>
References: <1322146025-21514-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] gypsy: fix packaging
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
X-List-Received-Date: Mon, 28 Nov 2011 09:29:11 -0000
X-Groupsio-MsgNum: 35671
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-W5J5bCCEY+38KL6pgG1B"

--=-W5J5bCCEY+38KL6pgG1B
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 24.11.2011, 15:47 +0100 schrieb Steffen Sledz:
> A wrong path had avoided the packaging of the dbus starter script
> /usr/share/dbus-1/system-services/org.freedesktop.Gypsy.service.

So why not use

    gypsy: fix packaging of DBus starter script

as the commit summary?

> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> ---
>  recipes/gypsy/gypsy.inc    |    4 +++-
>  recipes/gypsy/gypsy_0.7.bb |    2 ++
>  2 files changed, 5 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes/gypsy/gypsy.inc b/recipes/gypsy/gypsy.inc
> index eab062c..964e336 100644
> --- a/recipes/gypsy/gypsy.inc
> +++ b/recipes/gypsy/gypsy.inc
> @@ -3,6 +3,8 @@ LICENSE =3D "GPL"
>  SECTION =3D "x11"
>  DEPENDS =3D "glib-2.0 dbus-glib bluez4 libxslt-native"
> =20
> +INC_PR =3D "r1"
> +
>  inherit autotools pkgconfig
> =20
>  do_configure_prepend () {
> @@ -14,6 +16,6 @@ PACKAGES +=3D "libgypsy libgypsy-dev libgypsy-dbg"
>  FILES_lib${PN} =3D "${libdir}/lib*.so*"
>  FILES_lib${PN}-dev =3D "${includedir}/* ${libdir}/*.la ${libdir}/*.a ${l=
ibdir}/pkgconfig"
>  FILES_lib${PN}-dbg =3D "${libdir}/.debug"
> -FILES_${PN} =3D "${datadir}/dbus-1/services/ ${libexecdir}/gypsy-daemon =
${sysconfdir}/dbus-1/system.d/*"
> +FILES_${PN} =3D "${datadir}/dbus-1/system-services/* ${libexecdir}/gypsy=
-daemon ${sysconfdir}/dbus-1/system.d/*"
>  FILES_${PN}-dbg =3D"${libexecdir}/.debug*"
>  CONFFILES_${PN} =3D "${sysconfdir}/dbus-1/system.d/Gypsy.conf"
> diff --git a/recipes/gypsy/gypsy_0.7.bb b/recipes/gypsy/gypsy_0.7.bb
> index 8cd8760..a10cd6e 100644
> --- a/recipes/gypsy/gypsy_0.7.bb
> +++ b/recipes/gypsy/gypsy_0.7.bb
> @@ -1,5 +1,7 @@
>  require gypsy.inc
> =20
> +PR =3D "${INC_PR}.1"
> +

Since `INC_PR` is increased, `${INC_PR}.0` should be fine.

>  SRC_URI =3D "http://gypsy.freedesktop.org/releases/gypsy-0.7.tar.gz;name=
=3Dgypsy \
>             file://docs-reference-am.patch \
>             file://remove-werror.patch \

With the changes above this recipe is

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-W5J5bCCEY+38KL6pgG1B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk7TUtoACgkQPX1aK2wOHVi+NgCfQRgZsoH98e6Fb4Zuzg0+DtNR
D/4AnRBixZougFLUI8PsxuJFPDCu4/Q0
=B+dw
-----END PGP SIGNATURE-----

--=-W5J5bCCEY+38KL6pgG1B--
