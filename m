Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6BEDA60557;
	Tue, 28 Oct 2014 17:00:14 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id h11so2256734wiw.6
	for <multiple recipients>; Tue, 28 Oct 2014 10:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=utR19npq6YARX0l3H2AV4aE0QWMVyM9lzLwYh6LtVuc=;
	b=CwgB/iaVO7RxWghoAuumV/pKzq6LSKiLFY3k0Le4X5dgyEvx4dX4soiAEl2D7Ejpnq
	bwyfPaZAbxvTkskupo7dYgmKAz5pMuaxhhcFoQYMNXV8ksl0OHsRKJVAfq7dy6Vopnj1
	/jbhU1DuEU7UpISgnCtIJTueNb+svFmx2NQjb98klePyQf7tnpwcD7kp8FUtc+kKvbbc
	rfoSZml1d7gKHLSkvTvtZ96PUJMH7KTL4So4ah5w2SbAuRaHj8+4JnNgN8hg48r+y+Y5
	bdq+K+yHULiJmz1m6/Yg45vFdyFDUdr16I4k6SRTOvZX4jmFalUkU7TX/JN/GdR2Aj25
	Vt+Q==
X-Received: by 10.180.88.162 with SMTP id bh2mr6272215wib.77.1414515614323;
	Tue, 28 Oct 2014 10:00:14 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ko10sm2429506wjb.48.2014.10.28.10.00.13 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Oct 2014 10:00:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 28 Oct 2014 18:00:17 +0100
To: Richard Tollerton <rich.tollerton@ni.com>,
	openembedded-devel@lists.openembedded.org
Message-ID: <20141028170017.GE2430@jama>
References: <20140721220428.5C2262049@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20140721220428.5C2262049@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Richard Tollerton : openvpn: update and enable iproute2 support
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
X-List-Received-Date: Tue, 28 Oct 2014 17:00:16 -0000
X-Groupsio-MsgNum: 52651
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AjmyJqqohANyBN/e"
Content-Disposition: inline

--AjmyJqqohANyBN/e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 21, 2014 at 10:04:28PM +0000, git@git.openembedded.org wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: f647f319fcf1ca4844039a83fbc38acbd4ac762e
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3Df647f319fcf1ca4844039a83fbc38acbd4ac762e
>=20
> Author: Richard Tollerton <rich.tollerton@ni.com>
> Date:   Fri Jul 18 16:14:36 2014 -0500
>=20
> openvpn: update and enable iproute2 support
>=20
> - Added .bb for version 2.3.4.
> - The download URL was broken; it's changed to reflect where the website
>   points to.
> - Force use of iproute2, which is generally recommended when running
>   OpenVPN as an unprivileged user. Ref:
>   http://community.openvpn.net/openvpn/wiki/UnprivilegedUser
> - Explicitly add libpam to DEPENDS if pam is enabled, and disable the
>   auth-pam plugin if pam is not enabled.
> - Pass the path to the 'ip' utility to the configure script to keep it
>   from trying to find it on the host.

This part doesn't seem to work, on my host machine without ip utility
installed (minimalistic Gentoo chroot just for OE builds) openvpn build
is now failing with:

| checking git checkout... no
| configure: error: ip utility is required but missing
| Configure failed. The contents of all config.log files follows to aid deb=
ugging

| ERROR: oe_runconf failed
| WARNING: /OE/build/shr-core/tmp-glibc/work/core2-64-oe-linux/openvpn/2.3.=
4-r0/temp/run.do_configure.10450:1 exit 1 from
|   exit 1
| ERROR: Function failed: do_configure (log file is located at /OE/build/sh=
r-core/tmp-glibc/work/core2-64-oe-linux/openvpn/2.3.4-r0/temp/log.do_config=
ure.10450)
ERROR: Task 5 (/OE/build/shr-core/meta-openembedded/meta-networking/recipes=
-support/openvpn/openvpn_2.3.4.bb, do_configure) failed with exit code '1'

>=20
> Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> Signed-off-by: Ben Shelton <ben.shelton@ni.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> ---
>=20
>  .../recipes-support/openvpn/openvpn_2.1.3.bb       | 27 ----------------=
---
>  .../recipes-support/openvpn/openvpn_2.3.4.bb       | 31 ++++++++++++++++=
++++++
>  2 files changed, 31 insertions(+), 27 deletions(-)
>=20
> diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.1.3.bb b/m=
eta-networking/recipes-support/openvpn/openvpn_2.1.3.bb
> deleted file mode 100644
> index 9ef0fbf..0000000
> --- a/meta-networking/recipes-support/openvpn/openvpn_2.1.3.bb
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -SUMMARY =3D "A full-featured SSL VPN solution via tun device"
> -HOMEPAGE =3D "http://openvpn.sourceforge.net"
> -SECTION =3D "console/network"
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5aac200199fde47501876cba7263c=
b0c"
> -DEPENDS =3D "lzo openssl"
> -
> -inherit autotools
> -
> -SRC_URI =3D "http://openvpn.net/release/openvpn-${PV}.tar.gz \
> -           file://openvpn"
> -
> -SRC_URI[md5sum] =3D "7486d3e270ba4b033e311d3e022a0ad7"
> -SRC_URI[sha256sum] =3D "5185181df2e6043bd667377bc92e36ea5a5bd7600af20965=
4f109b6403ca5b36"
> -
> -CFLAGS +=3D "-fno-inline"
> -
> -# I want openvpn to be able to read password from file (hrw)
> -EXTRA_OECONF +=3D "--enable-password-save"
> -
> -do_install_append() {
> -    install -d ${D}/${sysconfdir}/init.d
> -    install -d ${D}/${sysconfdir}/openvpn
> -    install -m 755 ${WORKDIR}/openvpn ${D}/${sysconfdir}/init.d
> -}
> -
> -RRECOMMENDS_${PN} =3D "kernel-module-tun"
> diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb b/m=
eta-networking/recipes-support/openvpn/openvpn_2.3.4.bb
> new file mode 100644
> index 0000000..a3322a0
> --- /dev/null
> +++ b/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb
> @@ -0,0 +1,31 @@
> +SUMMARY =3D "A full-featured SSL VPN solution via tun device."
> +HOMEPAGE =3D "http://openvpn.sourceforge.net"
> +SECTION =3D "console/network"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5aac200199fde47501876cba7263c=
b0c"
> +DEPENDS =3D "lzo openssl iproute2 ${@base_contains('DISTRO_FEATURES', 'p=
am', 'libpam', '', d)}"
> +
> +inherit autotools
> +
> +SRC_URI =3D "http://swupdate.openvpn.org/community/releases/openvpn-${PV=
}.tar.gz \
> +           file://openvpn"
> +
> +SRC_URI[md5sum] =3D "04d47237907faabe9d046970ffe44b2e"
> +SRC_URI[sha256sum] =3D "af506d5f48568fa8d2f2435cb3fad35f9a9a8f263999ea6d=
f3ba296960cec85a"
> +
> +CFLAGS +=3D "-fno-inline"
> +
> +# I want openvpn to be able to read password from file (hrw)
> +EXTRA_OECONF +=3D "--enable-password-save --enable-iproute2"
> +EXTRA_OECONF +=3D "${@base_contains('DISTRO_FEATURES', 'pam', '', '--dis=
able-plugin-auth-pam', d)}"
> +EXTRA_OECONF +=3D "IPROUTE=3D/bin/ip"
> +
> +do_install_append() {
> +    install -d ${D}/${sysconfdir}/init.d
> +    install -d ${D}/${sysconfdir}/openvpn
> +    install -m 755 ${WORKDIR}/openvpn ${D}/${sysconfdir}/init.d
> +}
> +
> +RRECOMMENDS_${PN} =3D "kernel-module-tun"
> +
> +FILES_${PN}-dbg +=3D "/usr/lib/openvpn/plugins/.debug"
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AjmyJqqohANyBN/e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRPy6EACgkQN1Ujt2V2gBy1JgCeL1otSrJvjU2CfCT1k6fUYwoP
gNgAoKqokuyi7LNSDvhRr1vRMt2Trlbq
=ulPb
-----END PGP SIGNATURE-----

--AjmyJqqohANyBN/e--
