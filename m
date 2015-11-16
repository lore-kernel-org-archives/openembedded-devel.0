Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id B6188734B8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2015 22:29:17 +0000 (UTC)
Received: by wmww144 with SMTP id w144so486501wmw.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2015 14:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hPTSxYVpNGoCBDbvlbCL+yAby0ZgJYrgy78/qE/yNxM=;
	b=ix8bcYnoFDPdWSz+OY9s1rGwOS9Adr07BNhZenSx9/ASV2RIF4Yp13V2pKiGE6XbR7
	WT/FX5z/2VQ6zN/LUiPiKVnssTndz5KXs/30PU+awTm1kNSL5HSghDUl+qRKj1Pk1sNs
	jfWeDOrAWKHReq42HnF8+rhpi6RsOoc9DHq1phkn8kbt8TENBqU8c6lwVu1cbiu5+JGT
	K9W0SNWj1ijDkeNCvX0mLEMe+3M2W/mG0ak4eKP2/vnK7ENq2CATOLAD1yNqy6dEJiik
	w++B6+KknIRpTj2DMLVqW+hhWBa3zVS4rbpTmIjgYp06jPfqDZKdK4TY40OrfBPtvyTl
	y7Xw==
X-Received: by 10.28.63.204 with SMTP id m195mr19988686wma.11.1447712956982;
	Mon, 16 Nov 2015 14:29:16 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	c194sm20678287wmd.13.2015.11.16.14.29.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Nov 2015 14:29:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 16 Nov 2015 22:29:30 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151116212930.GF2240@jama>
References: <1447271300-4153-1-git-send-email-adrian.freihofer@gmail.com>
	<1447271300-4153-7-git-send-email-adrian.freihofer@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1447271300-4153-7-git-send-email-adrian.freihofer@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH V2 06/17] networkmanager: Update to 1.0.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Nov 2015 22:29:20 -0000
X-Groupsio-MsgNum: 58677
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w3uUfsyyY1Pqa/ej"
Content-Disposition: inline

--w3uUfsyyY1Pqa/ej
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2015 at 08:48:09PM +0100, Adrian Freihofer wrote:
> Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
> ---
>  ...tworkmanager_1.0.4.bb =3D> networkmanager_1.0.6.bb} | 20 ++++++++++++=
++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
>  rename meta-oe/recipes-connectivity/networkmanager/{networkmanager_1.0.4=
=2Ebb =3D> networkmanager_1.0.6.bb} (81%)
>=20
> diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1=
=2E0.4.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.=
6.bb
> similarity index 81%
> rename from meta-oe/recipes-connectivity/networkmanager/networkmanager_1.=
0.4.bb
> rename to meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.=
6.bb
> index 310a83b..d529b4a 100644
> --- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb
> +++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
> @@ -2,18 +2,21 @@ SUMMARY =3D "NetworkManager"
>  SECTION =3D "net/misc"
> =20
>  LICENSE =3D "GPLv2+"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcbbffd568227ada506640fe950a48=
23b"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcbbffd568227ada506640fe950a48=
23b \
> +                    file://libnm-util/COPYING;md5=3D1c4fa765d6eb3cd2fbd8=
4344a1b816cd \
> +                    file://docs/api/html/license.html;md5=3D51d7fb67bde9=
92e58533a8481cee070b"
> =20
>  DEPENDS =3D "libnl dbus dbus-glib libgudev wireless-tools nss util-linux=
 libndp"
> =20
> -inherit gnome gettext systemd
> +inherit gnomebase gettext systemd
> =20
>  SRC_URI =3D " \
>      ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkMana=
ger-${PV}.tar.xz \
>      file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.pat=
ch \
>  "
> -SRC_URI[md5sum] =3D "7eabef7bd3bbdd6dc0473dd32aeac924"
> -SRC_URI[sha256sum] =3D "e4099fa2f4f4b8d95d0ad9fdd03ec20960845085fa500bf7=
9aecbf54cee018c9"
> +
> +SRC_URI[md5sum] =3D "00f5f9ec69725a9f9b99366853c6f73e"
> +SRC_URI[sha256sum] =3D "38ea002403e3b884ffa9aae25aea431d2a8420f81f491976=
1c83fb92648254bd"
> =20
>  S =3D "${WORKDIR}/NetworkManager-${PV}"
> =20
> @@ -31,15 +34,15 @@ EXTRA_OECONF =3D " \
>      --with-dnsmasq=3D${bindir}/dnsmasq \
>  "
> =20
> -PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES','systemd','syste=
md','consolekit',d)}"
> +PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES','systemd','s=
ystemd','consolekit',d)}"
>  PACKAGECONFIG[systemd] =3D " \
>      --with-systemdsystemunitdir=3D${systemd_unitdir}/system --with-sessi=
on-tracking=3Dsystemd --enable-polkit, \
>      --without-systemdsystemunitdir, \
>      polkit \
>  "
>  # consolekit is not picked by shlibs, so add it to RDEPENDS too
> -PACKAGECONFIG[bluez5] =3D "--enable-bluez5-dun,--disable-bluez5-dun,blue=
z5"
>  PACKAGECONFIG[consolekit] =3D "--with-session-tracking=3Dconsolekit,,con=
solekit,consolekit"
> +PACKAGECONFIG[bluez5] =3D "--enable-bluez5-dun,--disable-bluez5-dun,blue=
z5"
>  PACKAGECONFIG[concheck] =3D "--with-libsoup=3Dyes,--with-libsoup=3Dno,li=
bsoup-2.4"
>  PACKAGECONFIG[modemmanager] =3D "--with-modem-manager-1=3Dyes,--with-mod=
em-manager-1=3Dno,modemmanager"
>  PACKAGECONFIG[ppp] =3D "--enable-ppp,--disable-ppp,ppp"
> @@ -73,8 +76,13 @@ FILES_${PN}-dbg +=3D " \
>  "
> =20
>  FILES_${PN}-dev +=3D " \
> +    ${datadir}/NetworkManager/gdb-cmd \
> +"
> +
> +FILES_${PN}-staticdev +=3D " \

=2Ela files belong to normal -dev and libdir is already included, I've
removed this change when cherry-picking to master-next. see
bitbake.conf:

FILES_${PN}-dev =3D "${includedir} ${FILES_SOLIBSDEV} ${libdir}/*.la \
                ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgconfig \
                ${datadir}/aclocal ${base_libdir}/*.o \
                ${libdir}/${BPN}/*.la ${base_libdir}/*.la"



>      ${libdir}/pppd/*/*.la \
>      ${libdir}/NetworkManager/*.la \
> +    ${libdir}/*.la \
>  "
> =20
>  FILES_${PN}-tests =3D " \
> --=20
> 2.4.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--w3uUfsyyY1Pqa/ej
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZKSroACgkQN1Ujt2V2gBzKwQCguAgawqompJhsG/aIPLdAxj8n
i8oAn1vyj6fPUef6OQTXz5hhhphKYsVj
=OmLH
-----END PGP SIGNATURE-----

--w3uUfsyyY1Pqa/ej--
