Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1UAln6-0002kw-9J; Wed, 27 Feb 2013 19:31:45 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so418277dak.20
	for <multiple recipients>; Wed, 27 Feb 2013 10:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Z3caFw+e3KllvCUSuRbvJwibAV7h3clG9cMvkV45uFg=;
	b=vV9jyu6Zwv9t2EAi0oLtEETb6eh2LhjiHl8sFRFYd2igBFnpoVD8mWyLAo3NmPQgSK
	H8ym/Ayz99MuWprtVjWi1kSKK7v/ZxUfiRkapnlzfJPx9SxltBRd8wmZKyXZyxNop7wB
	/f+g0ccjyBikSElHT9RrKoFQgzvW9CjU8YB6oW08O3wumVeIlf9siRm1vlLUCKY3QF1u
	Tkuz2uhUqw8SHNOVz6rOVJUFthZsm+/K2ItruFJBzMvK8qvZyJr21hilsf++2tz1PQKC
	LmEbKu2gRX/nefNDLvpmcqtftWgvbgQi+lnBYbb8bdTSg/4hftaU1+6PVRVUVxWu9Thy
	OQZQ==
X-Received: by 10.68.248.74 with SMTP id yk10mr4805474pbc.38.1361988922547;
	Wed, 27 Feb 2013 10:15:22 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id xr3sm5374988pbc.46.2013.02.27.10.15.18
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 27 Feb 2013 10:15:20 -0800 (PST)
Date: Wed, 27 Feb 2013 19:15:09 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130227181509.GD8208@jama.dyndns-home.com>
References: <20130211144549.AE3EE2055@opal>
MIME-Version: 1.0
In-Reply-To: <20130211144549.AE3EE2055@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Radu Moisan : avahi: Enabling with systemd
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
X-List-Received-Date: Wed, 27 Feb 2013 18:31:45 -0000
X-Groupsio-MsgNum: 43319
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="F8dlzb82+Fcn6AgP"
Content-Disposition: inline

--F8dlzb82+Fcn6AgP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 11, 2013 at 02:45:49PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 6d89c6744a98dce1fee6a21f1dad1305f6bf6fb5
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D6d89c6744a98dce1fee6a21f1dad1305f6bf6fb5
>=20
> Author: Radu Moisan <radu.moisan@intel.com>
> Date:   Fri Feb  8 22:43:18 2013 +0000
>=20
> avahi: Enabling with systemd
>=20
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> Signed-off-by: Sander van Grieken <sander@outrightsolutions.nl>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/recipes-connectivity/avahi/avahi.inc |   21 +++++++++++++--------
>  1 files changed, 13 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-con=
nectivity/avahi/avahi.inc
> index 185207b..3a4547c 100644
> --- a/meta/recipes-connectivity/avahi/avahi.inc
> +++ b/meta/recipes-connectivity/avahi/avahi.inc
> @@ -37,10 +37,13 @@ USERADD_PARAM_avahi-autoipd =3D "--system --home /var=
/run/avahi-autoipd \
>                                -c \"Avahi autoip daemon\" \
>                                avahi-autoipd"
> =20
> -inherit autotools pkgconfig update-rc.d gettext useradd
> +inherit autotools pkgconfig update-rc.d gettext systemd useradd
> =20
> -EXTRA_OECONF =3D "--with-distro=3Ddebian \
> -             --disable-introspection \
> +SYSTEMD_PACKAGES =3D "${PN}-daemon ${PN}-dnsconfd"
> +SYSTEMD_SERVICE_avahi-daemon =3D "avahi-daemon.service"
> +SYSTEMD_SERVICE_avahi-dnsconfd =3D "avahi-dnsconfd.service"

The same avahi.inc is also included in avahi-ui.

meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb:require avahi.inc

where this is not working correctly.

> +
> +EXTRA_OECONF =3D "--disable-introspection \
>               --with-avahi-priv-access-group=3Dadm \
>               --disable-stack-protector \
>               --disable-gdbm \
> @@ -50,10 +53,15 @@ EXTRA_OECONF =3D "--with-distro=3Ddebian \
>               --disable-qt4 \
>               --disable-python \
>               --disable-doxygen-doc \
> -             --with-systemdsystemunitdir=3D${systemd_unitdir}/system/ \
> +             ${EXTRA_OECONF_SYSVINIT} \
> +             ${EXTRA_OECONF_SYSTEMD} \
>               ${AVAHI_GTK} \
>             "
> =20
> +# The distro choice determines what init scripts are installed
> +EXTRA_OECONF_SYSVINIT =3D "${@base_contains('DISTRO_FEATURES','sysvinit'=
,'--with-distro=3Ddebian','--with-distro=3Dnone',d)}"
> +EXTRA_OECONF_SYSTEMD =3D "${@base_contains('DISTRO_FEATURES','systemd','=
--with-systemdsystemunitdir=3D${systemd_unitdir}/system/','',d)}"
> +
>  AVAHI_GTK ?=3D "--disable-gtk --disable-gtk3"
> =20
>  LDFLAGS_append_libc-uclibc =3D " -lintl"
> @@ -64,9 +72,8 @@ do_configure_prepend() {
>  }
> =20
> =20
> -PACKAGES =3D+ "avahi-systemd avahi-daemon libavahi-common libavahi-core =
libavahi-client avahi-dnsconfd libavahi-glib libavahi-ui avahi-autoipd avah=
i-utils"
> +PACKAGES =3D+ "avahi-daemon libavahi-common libavahi-core libavahi-clien=
t avahi-dnsconfd libavahi-glib libavahi-ui avahi-autoipd avahi-utils"
> =20
> -FILES_avahi-systemd =3D "${systemd_unitdir}"
>  FILES_avahi-autoipd =3D "${sbindir}/avahi-autoipd \
>                         ${sysconfdir}/avahi/avahi-autoipd.action \
>                         ${sysconfdir}/dhcp/*/avahi-autoipd \
> @@ -94,8 +101,6 @@ FILES_libavahi-glib =3D "${libdir}/libavahi-glib.so.*"
>  FILES_libavahi-gobject =3D "${libdir}/libavahi-gobject.so.*"
>  FILES_avahi-utils =3D "${bindir}/avahi-*"
> =20
> -RDEPENDS_avahi-systemd =3D "avahi-daemon"
> -
>  RDEPENDS_avahi-daemon =3D "sysvinit-pidof"
> =20
>  # uclibc has no nss
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--F8dlzb82+Fcn6AgP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEuTS0ACgkQN1Ujt2V2gByEFgCfU5+oxqjO1IvIcUjPDogTEk0R
h5gAn1570egI9BSw5s/xHlkePB37nyeW
=Spb1
-----END PGP SIGNATURE-----

--F8dlzb82+Fcn6AgP--
