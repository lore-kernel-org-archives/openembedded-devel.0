Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id E86447564B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jun 2015 12:50:18 +0000 (UTC)
Received: by wicgi11 with SMTP id gi11so71352511wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jun 2015 05:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=aobYvU4EmZ2aYI4AJ4pqBlzhvUlGRsW6sbvJHSmZwTk=;
	b=Q2CyrK3rs9tdiLp5XjNbBIZpIcCGMNeSAPqtZpcnFZCyx2vg9nB4psjtWoiPcORCV0
	AAR/DCgEaG9bhht5wVJEA4FjZ8aKQ3U9AC/9jH+P/Lxmib5mvSkD32rih9JRd0jpg1jn
	vAKcRtbpWaHTy2ZifnBxg8+a5GTOtdBuvZ3EB0CH4P8QYV5+0xSpwCsrYLfFDpx84kwH
	LxhQaZ8Qxsd50B3419TECc4LUhvFVxfOVPytIlXLEqV1XNfOPc5mhQWeo+0sv5V7hIkO
	QrZDdj4shhGOhifwXhEtNj+Tqh3YWt1CqyVdSsrft1qOhzy8+f3ENhAo513O/W8UVNmd
	uuIA==
X-Received: by 10.194.48.71 with SMTP id j7mr28964767wjn.59.1435582219613;
	Mon, 29 Jun 2015 05:50:19 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id e2sm38493965wjw.12.2015.06.29.05.50.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jun 2015 05:50:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 29 Jun 2015 14:50:24 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150629125024.GF2393@jama>
References: <1435235754-7339-1-git-send-email-schnitzeltony@googlemail.com>
	<1435235754-7339-3-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1435235754-7339-3-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 2/7] networkmanager: update to 1.0.2
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
X-List-Received-Date: Mon, 29 Jun 2015 12:50:20 -0000
X-Groupsio-MsgNum: 56076
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oPmsXEqKQNHCSXW7"
Content-Disposition: inline

--oPmsXEqKQNHCSXW7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2015 at 02:35:49PM +0200, Andreas M=FCller wrote:
> * at_console support is gone
> * add PACKAGECONFIG for bluez5/modemmanager/ppp and disable them by defau=
lt

world build shows:
networkmanager-1.0.2: networkmanager: Files/directories were installed
but not shipped in any package:
  /run
  /run/NetworkManager
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install. [installed-vs-shipped]

can you please check it?

>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  ...c-Check-only-for-libsystemd-not-libsystem.patch | 30 ----------------
>  ...manager_0.9.8.10.bb =3D> networkmanager_1.0.2.bb} | 41 +++++---------=
--------
>  2 files changed, 8 insertions(+), 63 deletions(-)
>  delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkma=
nager/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch
>  rename meta-oe/recipes-connectivity/networkmanager/{networkmanager_0.9.8=
=2E10.bb =3D> networkmanager_1.0.2.bb} (59%)
>=20
> diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0=
001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch b/meta-oe/re=
cipes-connectivity/networkmanager/networkmanager/0001-configure.ac-Check-on=
ly-for-libsystemd-not-libsystem.patch
> deleted file mode 100644
> index e356e9b..0000000
> --- a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-con=
figure.ac-Check-only-for-libsystemd-not-libsystem.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 10427a19302e871daeeb245581e930dc58195492 Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Thu, 27 Feb 2014 12:59:03 +0100
> -Subject: [PATCH] configure.ac: Check only for libsystemd not libsystemd-=
login
> -
> -* they were merged into libsystemd in systemd-209
> -
> -Upstream-Status: Pending (it would need to be conditional on systemd ver=
sion for upstream to accept this)
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - configure.ac | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index cc66e9b..3fe958e 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -283,7 +283,7 @@ AS_IF([! (echo "$with_session_tracking" | grep -q -E=
 "^(systemd|consolekit|no)$"
> - AM_CONDITIONAL(SESSION_TRACKING_CK, test "$with_session_tracking" =3D "=
consolekit")
> - AM_CONDITIONAL(SESSION_TRACKING_SYSTEMD, test "xwith_session_tracking" =
=3D "systemd")
> - if test "$with_session_tracking" =3D "systemd"; then
> --	PKG_CHECK_MODULES(SYSTEMD_LOGIN, [libsystemd-login])
> -+	PKG_CHECK_MODULES(SYSTEMD_LOGIN, [libsystemd])
> - 	AC_SUBST(SYSTEMD_LOGIN_CFLAGS)
> - 	AC_SUBST(SYSTEMD_LOGIN_LIBS)
> - fi
> ---=20
> -1.9.0
> -
> diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0=
=2E9.8.10.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1=
=2E0.2.bb
> similarity index 59%
> rename from meta-oe/recipes-connectivity/networkmanager/networkmanager_0.=
9.8.10.bb
> rename to meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.=
2.bb
> index 8d37c98..324d165 100644
> --- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.10=
=2Ebb
> +++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.2.bb
> @@ -4,18 +4,16 @@ SECTION =3D "net/misc"
>  LICENSE =3D "GPLv2+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcbbffd568227ada506640fe950a48=
23b"
> =20
> -DEPENDS =3D "libnl dbus dbus-glib udev wireless-tools nss util-linux ppp"
> +DEPENDS =3D "libnl dbus dbus-glib udev wireless-tools nss util-linux lib=
ndp"
> =20
>  inherit gnome gettext systemd
> =20
>  SRC_URI =3D " \
>      ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkMana=
ger-${PV}.tar.xz \
>      file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.pat=
ch \
> -    file://0001-configure.ac-Check-only-for-libsystemd-not-libsystem.pat=
ch \
>  "
> -SRC_URI[md5sum] =3D "aad2558887e25417c52eb2deaade2f85"
> -SRC_URI[sha256sum] =3D "064d27223d3824859df12e1fb25b787fec1c68bbc864dc52=
a0289b9211c4c972"
> -
> +SRC_URI[md5sum] =3D "5a4899f89edcbdd1ac46d2d947e8d6eb"
> +SRC_URI[sha256sum] =3D "359385707494bedbb48cfe0992ccfbcc4ac147dae1f7a470=
55c71e96439508ff"
> =20
>  S =3D "${WORKDIR}/NetworkManager-${PV}"
> =20
> @@ -40,30 +38,11 @@ PACKAGECONFIG[systemd] =3D " \
>      polkit \
>  "
>  # consolekit is not picked by shlibs, so add it to RDEPENDS too
> +PACKAGECONFIG[bluez5] =3D "--enable-bluez5-dun,--disable-bluez5-dun,blue=
z5"
>  PACKAGECONFIG[consolekit] =3D "--with-session-tracking=3Dconsolekit,,con=
solekit,consolekit"
> -PACKAGECONFIG[concheck] =3D "--enable-concheck,--disable-concheck,libsou=
p-2.4"
> -
> -# Work around dbus permission problems since we lack a proper at_console
> -do_install_prepend() {
> -    sed -i 's:deny send_destination:allow send_destination:g' ${S}/src/o=
rg.freedesktop.NetworkManager.conf
> -    sed -i 's:deny send_destination:allow send_destination:g' ${S}/callo=
uts/nm-dispatcher.conf
> -    sed -i 's:deny send_destination:allow send_destination:g' ${S}/callo=
uts/nm-dhcp-client.conf
> -    sed -i 's:deny send_destination:allow send_destination:g' ${S}/callo=
uts/nm-avahi-autoipd.conf
> -}
> -
> -do_install_append () {
> -    install -d ${D}${sysconfdir}/dbus-1/event.d
> -    # Additional test binaries
> -    install -d ${D}${bindir}
> -    install -m 0755 ${B}/test/.libs/libnm* ${D}${bindir}
> -
> -    # Install an empty VPN folder as nm-connection-editor will happily s=
egfault without it :o.
> -    # With or without VPN support built in ;).
> -    install -d ${D}${sysconfdir}/NetworkManager/VPN
> -
> -    rm -rf "${D}${localstatedir}/run"
> -    rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
> -}
> +PACKAGECONFIG[concheck] =3D "--with-libsoup=3Dyes,--with-libsoup=3Dno,li=
bsoup-2.4"
> +PACKAGECONFIG[modemmanager] =3D "--with-modem-manager-1=3Dyes,--with-mod=
em-manager-1=3Dno,modemmanager"
> +PACKAGECONFIG[ppp] =3D "--enable-ppp,--disable-ppp,ppp"
> =20
>  PACKAGES =3D+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests ${PN}-bash-=
completion"
> =20
> @@ -78,7 +57,7 @@ FILES_${PN} +=3D " \
>      ${datadir}/polkit-1 \
>      ${datadir}/dbus-1 \
>      ${base_libdir}/udev/* \
> -    ${systemd_unitdir}/system/NetworkManager-wait-online.service \
> +    ${systemd_unitdir}/system \
>  "
> =20
>  RRECOMMENDS_${PN} +=3D "iptables dnsmasq"
> @@ -86,7 +65,6 @@ RCONFLICTS_${PN} =3D "connman"
>  RDEPENDS_${PN} =3D " \
>      wpa-supplicant \
>      dhcp-client \
> -    ${@base_contains('COMBINED_FEATURES', '3gmodem', 'ppp', '', d)} \
>  "
> =20
>  FILES_${PN}-dbg +=3D " \
> @@ -95,14 +73,11 @@ FILES_${PN}-dbg +=3D " \
>  "
> =20
>  FILES_${PN}-dev +=3D " \
> -    ${datadir}/NetworkManager/gdb-cmd \
>      ${libdir}/pppd/*/*.la \
>      ${libdir}/NetworkManager/*.la \
>  "
> =20
>  FILES_${PN}-tests =3D " \
> -    ${bindir}/nm-tool \
> -    ${bindir}/libnm-glib-test \
>      ${bindir}/nm-online \
>  "
> =20
> --=20
> 1.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oPmsXEqKQNHCSXW7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWRPxAACgkQN1Ujt2V2gBwZuwCgukbLf3TtxRs7t9ZgIWAuwoHE
HtUAnjVOnnTKpN/W55CKIIoywKfiWJkC
=1h69
-----END PGP SIGNATURE-----

--oPmsXEqKQNHCSXW7--
