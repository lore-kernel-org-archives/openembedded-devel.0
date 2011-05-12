Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QKdYM-0005SN-Fu for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 23:36:14 +0200
Received: from f053044015.adsl.alicedsl.de ([78.53.44.15]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QKdX0-000787-M1 for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 21:34:50 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <BANLkTimHpb2Jyf=QYk_p0VL95jdNQJGCog@mail.gmail.com>
References: <BANLkTimHpb2Jyf=QYk_p0VL95jdNQJGCog@mail.gmail.com>
Date: Thu, 12 May 2011 23:33:26 +0200
Message-ID: <1305236006.13652.41.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: wpa-supplicant-0.7.inc patch
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
X-List-Received-Date: Thu, 12 May 2011 21:36:14 -0000
X-Groupsio-MsgNum: 31953
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Q6RStnZvX5VcZfD/VZKb"

--=-Q6RStnZvX5VcZfD/VZKb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Martin,


Am Donnerstag, den 12.05.2011, 16:53 -0400 schrieb Martin Bures:
> The wpa-supplicant recipe does not place dbus configuration files even
> though dbus is enabled in the .config.

you can add this to the commit message too.

> The following patch fixes this for me.

Thank you very much for the patch. Unfortunately we cannot commit this
yet, since at least your Signed-off-by line is missing. Please take a
look at the commit policy [1].

> From b8d6a52070f678371aef194fc0df37c6911e1952 Mon Sep 17 00:00:00 2001
> From: Martin Bures <mbures@zoll.com>

You should decide what address to use and also take that for the
Signed-off-by line.

> Date: Thu, 12 May 2011 16:35:29 -0400
> Subject: [PATCH] Fixed issue where dbus configuration is not detected.  T=
his prevented
>  wpa-supplicant dbus support from being included.

Please use a short commit summary and an elaborate commit message
(body).

wpa-supplicant-0.7.inc: use `.config` in the source directory `${S}`

Using the `.config` in the working directory `${WORKDIR}` =E2=80=A6

> ---
>  recipes/wpa-supplicant/wpa-supplicant-0.7.inc |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/recipes/wpa-supplicant/wpa-supplicant-0.7.inc b/recipes/wpa-=
supplicant/wpa-supplicant-0.7.inc
> index 722f5fa..6e2f754 100644
> --- a/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
> +++ b/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
> @@ -50,15 +50,15 @@ do_install () {
>         install -m 600 ${WORKDIR}/defaults-sane ${D}${sysconfdir}/default=
/wpa
>         install -m 600 ${WORKDIR}/wpa_supplicant.conf-sane ${D}${sysconfd=
ir}/wpa_supplicant.conf
> =20
> -       if grep -q ^CONFIG_CTRL_IFACE_DBUS=3Dy .config || grep -q ^CONFIG=
_CTRL_IFACE_DBUS_NEW=3Dy .config; then
> +       if grep -q ^CONFIG_CTRL_IFACE_DBUS=3Dy ${S}/.config || grep -q ^C=
ONFIG_CTRL_IFACE_DBUS_NEW=3Dy ${S}/.config; then

I still do not quite understand the change. Looking at

        do_configure () {
        	install -m 0755 ${WORKDIR}/defconfig .config
        	if [ "${@base_contains('COMBINED_FEATURES', 'madwifi', 1, 0, d)}" =
=3D "1" ]; then
        		echo "CONFIG_DRIVER_MADWIFI=3Dy" >> .config
        		echo "CFLAGS +=3D -I${STAGING_INCDIR}/madwifi-ng" >> .config
        	fi
        }

`.config` should be created in `${WORKDIR}` as a copy of `defconfig`.
Why do you now consider `.config` in the source directory? Maybe you
should adapt the `defconfig` shipped by OpenEmbedded?

>                 install -d ${D}/${sysconfdir}/dbus-1/system.d
>                 install -m 644 ${S}/dbus/dbus-wpa_supplicant.conf ${D}/${=
sysconfdir}/dbus-1/system.d
>                 install -d ${D}/${datadir}/dbus-1/system-services
> -               if grep -q ^CONFIG_CTRL_IFACE_DBUS=3Dy .config; then
> +               if grep -q ^CONFIG_CTRL_IFACE_DBUS=3Dy ${S}/.config; then
>                         sed -i -e s:/sbin:${sbindir}:g ${S}/dbus/fi.epite=
st.hostap.WPASupplicant.service
>                         install -m 644 ${S}/dbus/fi.epitest.hostap.WPASup=
plicant.service ${D}/${datadir}/dbus-1/system-services
>                 fi
> -               if grep -q ^CONFIG_CTRL_IFACE_DBUS_NEW=3Dy .config; then
> +               if grep -q ^CONFIG_CTRL_IFACE_DBUS_NEW=3Dy ${S}/.config; =
then
>                         sed -i -e s:/sbin:${sbindir}:g ${S}/dbus/fi.w1.wp=
a_supplicant1.service
>                         install -m 644 ${S}/dbus/fi.w1.wpa_supplicant1.se=
rvice ${D}/${datadir}/dbus-1/system-services
>                 fi

I do not know the recipe, so please excuse my questions.


Thanks,

Paul


[1] http://openembedded.org/index.php/Commit_Policy

--=-Q6RStnZvX5VcZfD/VZKb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3MUiYACgkQPX1aK2wOHVhnFQCcDyD3z1tZXzLkSerYk2wbWKux
254An34dJayxxmIcPpAsNilA3Jlm2Jqs
=kaQf
-----END PGP SIGNATURE-----

--=-Q6RStnZvX5VcZfD/VZKb--
