Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 750B260249
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jun 2016 20:32:02 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id n184so17581902wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jun 2016 13:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=3NwJcfk4uJl8R2+0AmiMQ8SC0ojlxgbCJ9B+k8wnkMU=;
	b=n9tV6IfyhUD4Fc0rooMnmF2f4vSu6Q2aQl2LqKtVDWxhUgq62L1WpDKdHyu0s4K3Bw
	LU9KqgVGiLACSCNVMdwuSMS9/visjAWP5ymM83g/xkMDmtRC+FLSgkZTCAzIva1qq7n9
	yon4RfhsgHrCpHLK8v+ZgFElrqks0EcHHQf7uHp/s0o52rka/Jol1ZwRFj13GzZtOMo9
	ngnk2OsyPc070hnz68aAoDZV6IX8O4K9nbBFzBzMU8WZoP1ZsX3dTI7t8mvJHjSsUJGX
	TQiqNwS3PUW/bZ9pLJQjoJPFLw6pEZ8krN/VqP6OMjVtOVuUNnJ194zeqHdzqrjmnR5M
	igsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=3NwJcfk4uJl8R2+0AmiMQ8SC0ojlxgbCJ9B+k8wnkMU=;
	b=Lucm9uoQF4XsqDRvclyveH8sYDcNwU5o2FF7rud17qHfFiMRbCaoUTpW5ep9mRrLAy
	ncpVN+u8vTuaYhCAEhBusEjlS4kK18cvpfP4IXW4tNhIuyGAeRxRHcPaT3kAciczTmxP
	QBAFcMrr8JoEcNXiXeu2hJsEi0Gt6qExOAtPAOjfniX0a1TSpDkjthLXi1Ak4LnlITxl
	jhXJDsw69yYP/heomRVXREGJOhAZA1JmZ+Xb0j0doUZYAio1y94VcNjpee0Bo1RoYqbK
	G82di8X/CppRiIV/6iYd7Nu+h3o8KPCQFO78DsmM/7k9QGXZ6o5SFeS8kaGUaWRX6qWm
	U7fQ==
X-Gm-Message-State: ALyK8tJXJkDEUxjrAtGli2oUAJmM05O+kcfOhQy+ESI7T/zMCO29lTj2gdbJgadyAdg8dQ==
X-Received: by 10.28.173.8 with SMTP id w8mr1174961wme.39.1465849922320;
	Mon, 13 Jun 2016 13:32:02 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	hq2sm29264783wjb.36.2016.06.13.13.32.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 13 Jun 2016 13:32:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 13 Jun 2016 22:32:11 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160613203211.GC2580@jama>
References: <1465355197-28010-1-git-send-email-wenzong.fan@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1465355197-28010-1-git-send-email-wenzong.fan@windriver.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Subject: Re: [PATCH][meta-oe] krb5: add systemd support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Jun 2016 20:32:05 -0000
X-Groupsio-MsgNum: 61816
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UPT3ojh+0CqEDtpF"
Content-Disposition: inline

--UPT3ojh+0CqEDtpF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 07, 2016 at 11:06:37PM -0400, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>=20
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>  .../krb5/krb5/krb5-admin-server.service            | 14 +++++++++++
>  .../krb5/krb5/krb5-kdc.service                     | 13 ++++++++++
>  meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb   | 29 +++++++++++++++-=
------
>  3 files changed, 47 insertions(+), 9 deletions(-)
>  create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/krb5-admin-ser=
ver.service
>  create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/krb5-kdc.servi=
ce
>=20
> diff --git a/meta-oe/recipes-connectivity/krb5/krb5/krb5-admin-server.ser=
vice b/meta-oe/recipes-connectivity/krb5/krb5/krb5-admin-server.service
> new file mode 100644
> index 0000000..1b42716
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/krb5/krb5/krb5-admin-server.service
> @@ -0,0 +1,14 @@
> +[Unit]
> +Description=3DMIT Kerberos KDC administrative daemon
> +After=3Dsyslog.target network.target
> +ConditionPathExists=3D/etc/krb5.conf
> +
> +[Service]
> +Type=3Dforking
> +ExecStartPre=3D/bin/sh -c "test ! -f /var/log/kadmind.log || test ! -x /=
sbin/restorecon || /sbin/restorecon -F /var/log/kadmind.log"
> +ExecStart=3D/usr/sbin/kadmind
> +SuccessExitStatus=3D1 2 SIGKILL
> +TimeoutStopSec=3D30
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-oe/recipes-connectivity/krb5/krb5/krb5-kdc.service b/me=
ta-oe/recipes-connectivity/krb5/krb5/krb5-kdc.service
> new file mode 100644
> index 0000000..d5e5a95
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/krb5/krb5/krb5-kdc.service
> @@ -0,0 +1,13 @@
> +[Unit]
> +Description=3DMIT Kerberos KDC
> +After=3Dsyslog.target network.target
> +ConditionPathExists=3D/etc/krb5.conf
> +
> +[Service]
> +Type=3Dforking
> +ExecStart=3D/usr/sbin/krb5kdc
> +SuccessExitStatus=3D1 2 SIGKILL
> +TimeoutStopSec=3D30
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb b/meta-oe/r=
ecipes-connectivity/krb5/krb5_1.13.2.bb
> index 0c566cb..d60e332 100644
> --- a/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
> +++ b/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
> @@ -17,7 +17,7 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://${S}/../NOTICE;md5=3Df64248328d2d9928e1f041=
58b5243e7f"
>  DEPENDS =3D "ncurses util-linux e2fsprogs e2fsprogs-native"
> =20
> -inherit autotools-brokensep binconfig perlnative
> +inherit autotools-brokensep binconfig perlnative systemd
> =20
>  SHRT_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
>  SRC_URI =3D "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}-s=
igned.tar \
> @@ -32,6 +32,8 @@ SRC_URI =3D "http://web.mit.edu/kerberos/dist/${BPN}/${=
SHRT_VER}/${BP}-signed.tar
>             file://etc/init.d/krb5-admin-server \
>             file://etc/default/krb5-kdc \
>             file://etc/default/krb5-admin-server \
> +           file://krb5-kdc.service \
> +           file://krb5-admin-server.service \
>             file://krb5-CVE-2016-3119.patch;striplevel=3D2 \
>             file://0001-Work-around-uninitialized-warning-in-cc_kcm.c.pat=
ch;striplevel=3D2 \
>  "
> @@ -40,6 +42,9 @@ SRC_URI[sha256sum] =3D "e528c30b0209c741f6f320cb83122de=
d92f291802b6a1a1dc1a01dcdb3
> =20
>  S =3D "${WORKDIR}/${BP}/src"
> =20
> +SYSTEMD_SERVICE_${PN} =3D "krb5-admin-server.service krb5-kdc.service"
> +SYSTEMD_AUTO_ENABLE =3D "disable"
> +
>  PACKAGECONFIG ??=3D "openssl"
>  PACKAGECONFIG[libedit] =3D "--with-libedit,--without-libedit,libedit"
>  PACKAGECONFIG[openssl] =3D "--with-pkinit-crypto-impl=3Dopenssl,,openssl"
> @@ -79,20 +84,26 @@ do_configure() {
>  }
> =20
>  do_install_append() {
> -    mkdir -p ${D}/${sysconfdir}/init.d ${D}/${sysconfdir}/default
> -    install -m 0755 ${WORKDIR}/etc/init.d/* ${D}/${sysconfdir}/init.d
> -    install -m 0644 ${WORKDIR}/etc/default/* ${D}/${sysconfdir}/default
> -
>      rm -rf ${D}/${localstatedir}/run
> -    mkdir -p ${D}/${sysconfdir}/default/volatiles
> -    echo "d root root 0755 ${localstatedir}/run/krb5kdc none" \
> -           > ${D}${sysconfdir}/default/volatiles/87_krb5
> +
> +    if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', =
d)}; then

Don't use base_contains

Did you test this change in master? You would see this note:

NOTE: /OE/build/oe-core/meta-openembedded/meta-oe/recipes-connectivity/krb5=
/krb5_1.13.2.bb: base_contains is deprecated, please use bb.utils.contains =
instead.

> +        mkdir -p ${D}/${sysconfdir}/init.d ${D}/${sysconfdir}/default
> +        install -m 0755 ${WORKDIR}/etc/init.d/* ${D}/${sysconfdir}/init.d
> +        install -m 0644 ${WORKDIR}/etc/default/* ${D}/${sysconfdir}/defa=
ult
> +
> +        mkdir -p ${D}/${sysconfdir}/default/volatiles
> +        echo "d root root 0755 ${localstatedir}/run/krb5kdc none" \
> +              > ${D}${sysconfdir}/default/volatiles/87_krb5
> +    fi
>      if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false=
', d)}; then
>          install -d ${D}${sysconfdir}/tmpfiles.d
>          echo "d /run/krb5kdc - - - -" \
>                > ${D}${sysconfdir}/tmpfiles.d/krb5.conf
> -    fi
> =20
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 0644 ${WORKDIR}/krb5-admin-server.service ${D}${syste=
md_unitdir}/system
> +        install -m 0644 ${WORKDIR}/krb5-kdc.service ${D}${systemd_unitdi=
r}/system
> +    fi
>  }
> =20
>  pkg_postinst_${PN} () {
> --=20
> 2.8.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UPT3ojh+0CqEDtpF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldfGEoACgkQN1Ujt2V2gBwB4gCgjMHsV49O8nXFqRMirS/o3KyR
b+MAn3dX51Gp9v0KLPlm5d6UVmHoLP1O
=QUwO
-----END PGP SIGNATURE-----

--UPT3ojh+0CqEDtpF--
