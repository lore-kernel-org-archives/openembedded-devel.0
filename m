Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 287B073D46
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2015 22:34:43 +0000 (UTC)
Received: by wmec201 with SMTP id c201so200442993wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2015 14:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=aBsbQj/YY8wO7lgME9j2CuDggUX+H+rd1Z3pKjNIL74=;
	b=AxaigKVSPFwRyPJ7SV13TZwARzxBORKOtIPkEGRZgNENETYk2Au1PhIemxwZNPzmjH
	W8ZjyAVxvnkk9kfNDP5AwRpySOclZFMu+3hFPqS+RrMfVXe58jrHskC8oQuaeppL49eR
	ZmE1rYMrirEnQjztKlwisRWbbPemcl8bkXzx5bDjmTVAr801nI4oy2TdAO+4Qk7lYzmk
	kdPoZZ5q8cf2aTg9EczuNJk+vQ2lbwDkTk+ZRERSAGNgVkGu2v+s1rXWaRN1GAKsNo8r
	cTkkWQ0/G8EnCx4/8KhM0txfT3fvvqORVMAvtKLW71yT7VqeE0ydtDM0nylVe5SiOYCa
	tqew==
X-Received: by 10.194.87.99 with SMTP id w3mr17158307wjz.76.1447713283865;
	Mon, 16 Nov 2015 14:34:43 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	it4sm36711563wjb.0.2015.11.16.14.34.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Nov 2015 14:34:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 16 Nov 2015 22:34:57 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151116213457.GG2240@jama>
References: <1447271300-4153-1-git-send-email-adrian.freihofer@gmail.com>
	<1447271300-4153-8-git-send-email-adrian.freihofer@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1447271300-4153-8-git-send-email-adrian.freihofer@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH V2 07/17] networkmanager: support gnutls and nss
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
X-List-Received-Date: Mon, 16 Nov 2015 22:34:45 -0000
X-Groupsio-MsgNum: 58678
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qf1oXS95uex85X0R"
Content-Disposition: inline

--Qf1oXS95uex85X0R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2015 at 08:48:10PM +0100, Adrian Freihofer wrote:
> Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
> ---
>  .../0002-add-pkg-config-for-libgcrypt.patch        | 41 ++++++++++++++++=
++++++
>  .../networkmanager/networkmanager_1.0.6.bb         | 14 ++++++--
>  2 files changed, 52 insertions(+), 3 deletions(-)
>  create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkma=
nager/0002-add-pkg-config-for-libgcrypt.patch
>=20
> diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0=
002-add-pkg-config-for-libgcrypt.patch b/meta-oe/recipes-connectivity/netwo=
rkmanager/networkmanager/0002-add-pkg-config-for-libgcrypt.patch
> new file mode 100644
> index 0000000..bb95eaa
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-add=
-pkg-config-for-libgcrypt.patch
> @@ -0,0 +1,41 @@
> +From a9261fee4a41045c42e0d292237cee532e11982c Mon Sep 17 00:00:00 2001
> +From: Adrian <adrian.freihofer@gmail.com>
> +Date: Thu, 27 Nov 2014 15:43:26 +0100
> +Subject: [PATCH] add pkg config for libgcrypt
> +
> +---
> + configure.ac | 18 +++++++-----------
> + 1 file changed, 7 insertions(+), 11 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 94b0758..654a015 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -480,17 +480,13 @@ if test x"$ac_crypto" =3D xnss; then
> +   with_nss=3Dyes
> + elif test x"$ac_crypto" =3D xgnutls; then
> +   PKG_CHECK_MODULES(GNUTLS, [gnutls >=3D 1.2])
> +-  AC_PATH_PROG(LIBGCRYPT_CONFIG, libgcrypt-config, no)
> +-  if test x"$LIBGCRYPT_CONFIG" =3D xno; then
> +-    AC_MSG_ERROR([gnutls explicitly requested but gcrypt not found on s=
ystem])
> +-  else
> +-    AC_DEFINE(HAVE_GNUTLS, 1, [Define if you have libgnutls])
> +-    LIBGCRYPT_CFLAGS=3D`$LIBGCRYPT_CONFIG --cflags`
> +-    LIBGCRYPT_LIBS=3D`$LIBGCRYPT_CONFIG --libs`
> +-    AC_SUBST(LIBGCRYPT_CFLAGS)
> +-    AC_SUBST(LIBGCRYPT_LIBS)
> +-    with_gnutls=3Dyes
> +-  fi
> ++  AC_DEFINE(HAVE_GNUTLS, 1, [Define if you have libgnutls])
> ++  PKG_CHECK_MODULES(LIBGCRYPT, [libgcrypt >=3D 1.1.42], [
> ++      AC_DEFINE(HAVE_GCRYPT, 1, [Define if gcrypt library is available.=
])
> ++      with_gnutls=3Dyes
> ++    ], [
> ++      AC_MSG_ERROR([gnutls explicitly requested but gcrypt not found on=
 system])
> ++    ])
> + else
> +   AC_MSG_ERROR([Please choose either 'nss' or 'gnutls' for certificate =
and crypto operations])
> + fi
> +--=20
> +1.9.1
> +
> diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1=
=2E0.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.=
6.bb
> index d529b4a..3a59f83 100644
> --- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
> +++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
> @@ -6,13 +6,14 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcbbffd568227=
ada506640fe950a4823b \
>                      file://libnm-util/COPYING;md5=3D1c4fa765d6eb3cd2fbd8=
4344a1b816cd \
>                      file://docs/api/html/license.html;md5=3D51d7fb67bde9=
92e58533a8481cee070b"
> =20
> -DEPENDS =3D "libnl dbus dbus-glib libgudev wireless-tools nss util-linux=
 libndp"
> +DEPENDS =3D "libnl dbus dbus-glib libgudev wireless-tools util-linux lib=
ndp"
> =20
>  inherit gnomebase gettext systemd
> =20
>  SRC_URI =3D " \
>      ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkMana=
ger-${PV}.tar.xz \
>      file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.pat=
ch \
> +    file://0002-add-pkg-config-for-libgcrypt.patch \
>  "
> =20
>  SRC_URI[md5sum] =3D "00f5f9ec69725a9f9b99366853c6f73e"
> @@ -26,7 +27,6 @@ EXTRA_OECONF =3D " \
>      --disable-ifnet \
>      --disable-ifcfg-suse \
>      --with-netconfig \
> -    --with-crypto=3Dnss \
>      --disable-more-warnings \
>      --with-dhclient=3D${base_sbindir}/dhclient \
>      --with-iptables=3D${sbindir}/iptables \
> @@ -34,7 +34,13 @@ EXTRA_OECONF =3D " \
>      --with-dnsmasq=3D${bindir}/dnsmasq \
>  "
> =20
> -PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES','systemd','s=
ystemd','consolekit',d)}"
> +# If you need a different configuration for networkmanager, add lines si=
milar to
> +# the following example to your local.conf or distro config
> +# PACKAGECONFIG_remove_pn-networkmanager =3D "nss"
> +# PACKAGECONFIG_append_pn-networkmanager =3D " gnutls modemmanager ppp"
> +PACKAGECONFIG ??=3D "nss \
> +    ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','consolek=
it',d)} \
> +"
>  PACKAGECONFIG[systemd] =3D " \
>      --with-systemdsystemunitdir=3D${systemd_unitdir}/system --with-sessi=
on-tracking=3Dsystemd --enable-polkit, \
>      --without-systemdsystemunitdir, \
> @@ -46,6 +52,8 @@ PACKAGECONFIG[bluez5] =3D "--enable-bluez5-dun,--disabl=
e-bluez5-dun,bluez5"
>  PACKAGECONFIG[concheck] =3D "--with-libsoup=3Dyes,--with-libsoup=3Dno,li=
bsoup-2.4"
>  PACKAGECONFIG[modemmanager] =3D "--with-modem-manager-1=3Dyes,--with-mod=
em-manager-1=3Dno,modemmanager"
>  PACKAGECONFIG[ppp] =3D "--enable-ppp,--disable-ppp,ppp"
> +PACKAGECONFIG[nss] =3D "--with-crypto=3Dnss,,nss"

won't it detect nss when available in sysroot?

> +PACKAGECONFIG[gnutls] =3D "--with-crypto=3Dgnutls,,gnutls libgcrypt,gnut=
ls libgcrypt"

Why do you need to add gnutls and libgcrypt manually to RDEPENDS?

> =20
>  PACKAGES =3D+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests ${PN}-bash-=
completion"
> =20
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

--Qf1oXS95uex85X0R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZKTAEACgkQN1Ujt2V2gBxxsACgoVPn4Hb2+Hxtn000AH4mFSZ5
sQsAoJQ0qaV0DDuuhFDylq8iy55JXrZx
=aFGt
-----END PGP SIGNATURE-----

--Qf1oXS95uex85X0R--
