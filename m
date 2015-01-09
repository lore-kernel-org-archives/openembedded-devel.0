Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 507DF72027
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jan 2015 16:28:19 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Y9cQ7-0002yo-V6 from Joe_MacDonald@mentor.com ;
	Fri, 09 Jan 2015 08:28:19 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 9 Jan 2015 08:28:19 -0800
Received: by burninator (Postfix, from userid 1000)	id CEF1F5813A6; Fri,  9
	Jan 2015 11:28:15 -0500 (EST)
Date: Fri, 9 Jan 2015 11:28:15 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Bian Naimeng <biannm@cn.fujitsu.com>
Message-ID: <20150109162814.GA5581@mentor.com>
References: <1420523147-3740-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1420523147-3740-1-git-send-email-biannm@cn.fujitsu.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH v2] openwsman: add recipe
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
X-List-Received-Date: Fri, 09 Jan 2015 16:28:24 -0000
X-Groupsio-MsgNum: 53788
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline

--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Bian,

I just wanted to be sure you had noticed the discussion on the list
regarding this submission, it has what looks like a -lm issue in the
compile stage and consequently we'll need a v3, please.  You can see an
example of the failure here:

http://errors.yoctoproject.org/Errors/Search/Details/7107/1/10/3939

Thanks,
-J.

[[oe] [meta-networking][PATCH v2] openwsman: add recipe] On 15.01.06 (Tue 1=
3:45) Bian Naimeng wrote:

> Opensource Implementation of WS-Management
>=20
> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> ---
>  .../libssl-is-required-if-eventint-supported.patch | 17 +++++++
>  .../openwsman/openwsman/openwsmand.service         | 12 +++++
>  .../openwsman/openwsman_2.4.12.bb                  | 59 ++++++++++++++++=
++++++
>  3 files changed, 88 insertions(+)
>  create mode 100644 meta-networking/recipes-protocols/openwsman/openwsman=
/libssl-is-required-if-eventint-supported.patch
>  create mode 100644 meta-networking/recipes-protocols/openwsman/openwsman=
/openwsmand.service
>  create mode 100644 meta-networking/recipes-protocols/openwsman/openwsman=
_2.4.12.bb
>=20
> diff --git a/meta-networking/recipes-protocols/openwsman/openwsman/libssl=
-is-required-if-eventint-supported.patch b/meta-networking/recipes-protocol=
s/openwsman/openwsman/libssl-is-required-if-eventint-supported.patch
> new file mode 100644
> index 0000000..bd540e3
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/openwsman/openwsman/libssl-is-req=
uired-if-eventint-supported.patch
> @@ -0,0 +1,17 @@
> +libssl is required by wsman_client_transport if ENABLE_EVENTING_SUPPORT =
enabled.
> +
> +Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> +
> +diff -Nurp openwsman-2.4.12.orig/src/lib/CMakeLists.txt openwsman-2.4.12=
/src/lib/CMakeLists.txt
> +--- openwsman-2.4.12.orig/src/lib/CMakeLists.txt	2014-10-28 23:04:47.000=
000000 +0800
> ++++ openwsman-2.4.12/src/lib/CMakeLists.txt	2014-12-31 11:09:20.34042852=
3 +0800
> +@@ -56,6 +56,9 @@ TARGET_LINK_LIBRARIES( ${WSMAN_CLIENT_TR
> + SET_TARGET_PROPERTIES( ${WSMAN_CLIENT_TRANSPORT_PKG} PROPERTIES VERSION=
 1.0.0 SOVERSION 1)
> + INSTALL(TARGETS ${WSMAN_CLIENT_TRANSPORT_PKG} DESTINATION ${LIB_INSTALL=
_DIR})
> +=20
> ++IF( ENABLE_EVENTING_SUPPORT )
> ++TARGET_LINK_LIBRARIES( ${WSMAN_CLIENT_TRANSPORT_PKG} ${OPENSSL_LIBRARIE=
S} )
> ++ENDIF( ENABLE_EVENTING_SUPPORT )
> +=20
> + ############### wsman_client ###############
> +=20
> diff --git a/meta-networking/recipes-protocols/openwsman/openwsman/openws=
mand.service b/meta-networking/recipes-protocols/openwsman/openwsman/openws=
mand.service
> new file mode 100644
> index 0000000..154f3cd
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/openwsman/openwsman/openwsmand.se=
rvice
> @@ -0,0 +1,12 @@
> +[Unit]
> +Description=3DOpenwsman WS-Management Service
> +After=3Dsyslog.target
> +
> +[Service]
> +Type=3Dforking
> +ExecStart=3D@SBINDIR@/openwsmand
> +ExecStartPre=3D@SYSCONFDIR@/openwsman/owsmangencert.sh
> +PIDFile=3D@LOCALSTATEDIR@/run/wsmand.pid
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-networking/recipes-protocols/openwsman/openwsman_2.4.12=
=2Ebb b/meta-networking/recipes-protocols/openwsman/openwsman_2.4.12.bb
> new file mode 100644
> index 0000000..f188b1d
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/openwsman/openwsman_2.4.12.bb
> @@ -0,0 +1,59 @@
> +SUMMARY =3D "Opensource Implementation of WS-Management"
> +DESCRIPTION =3D "Openwsman is a project intended to provide an open-sour=
ce \
> +implementation of the Web Services Management specipication \
> +(WS-Management) and to expose system management information on the \
> +Linux operating system using the WS-Management protocol. WS-Management \
> +is based on a suite of web services specifications and usage \
> +requirements that exposes a set of operations focused on and covers \
> +all system management aspects. \
> +Openwsman Server and service libraries"
> +HOMEPAGE =3D "http://www.openwsman.org/"
> +SECTION =3D "Applications/System"
> +
> +DEPENDS =3D "curl libxml2 openssl libpam"
> +
> +SRC_URI =3D "https://github.com/Openwsman/openwsman/archive/v2.4.12.tar.=
gz \
> +           file://libssl-is-required-if-eventint-supported.patch \
> +           file://openwsmand.service"
> +
> +SRC_URI[md5sum] =3D "4893a41c6fd89b33095c315c79638a75"
> +SRC_URI[sha256sum] =3D "6a4b75dfff1a51c7bc09fd1d44abbde55ae74906f3828797=
ce391883358120f4"
> +
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd4f53d4c6cf73b9d43186ce3be6dd=
0ba"
> +
> +inherit systemd cmake pkgconfig pythonnative perlnative
> +
> +SYSTEMD_SERVICE_${PN} =3D "openwsmand.service"
> +SYSTEMD_AUTO_ENABLE =3D "disable"
> +
> +EXTRA_OECMAKE =3D "-DBUILD_BINDINGS=3DNO -DBUILD_LIBCIM=3DNO -DBUILD_PER=
L=3DYES \
> +                 -DCMAKE_INSTALL_PREFIX=3D${prefix} -DLIB=3Dlib"
> +
> +do_configure_prepend() {
> +    export HOST_SYS=3D${HOST_SYS}
> +    export BUILD_SYS=3D${BUILD_SYS}
> +    export STAGING_INCDIR=3D${STAGING_INCDIR}
> +    export STAGING_LIBDIR=3D${STAGING_LIBDIR}
> +}
> +
> +do_install_append() {
> +    install -d ${D}/${sysconfdir}/init.d
> +    install -m 755 ${B}/etc/init/openwsmand.sh ${D}/${sysconfdir}/init.d=
/openwsmand
> +    ln -sf ${sysconfdir}/init.d/openwsmand ${D}/${sbindir}/rcopenwsmand
> +
> +    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; =
then
> +        install -d ${D}/${systemd_unitdir}/system
> +        install -m 644 ${WORKDIR}/openwsmand.service ${D}/${systemd_unit=
dir}/system
> +
> +        sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/syst=
em/openwsmand.service
> +        sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir=
}/system/openwsmand.service
> +        sed -i -e 's,@LOCALSTATEDIR@,${localstatedir},g' ${D}${systemd_u=
nitdir}/system/openwsmand.service
> +    fi
> +}
> +
> +FILES_${PN}-dbg +=3D "${libdir}/openwsman/plugins/.debug/ \
> +                    ${libdir}/openwsman/authenticators/.debug/ \
> +                   "
> +
> +INSANE_SKIP_${PN} =3D "dev-so"
> --=20
> 1.9.1
>=20
--=20
-Joe MacDonald.
:wq

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUsAGaAAoJEEn8ffcsOfaWjoYH/3vJkFskv/OnZk3kQcpAybwP
ppyQcGFLnbSCvt2+GZCHpDRCBgiSb1Hx4IJVxEP92+OmZAn2E6DmgCiP42oVKtvB
Q+yBcf+QjXOYxEsGYoJMhT8cZszt5jI8/uXLEo3L/pBTXYfjme07PadlLzJXiPUK
DuEV9/Tw1wi1TdapqsMWmQSP/jfxanVhj/uYOUwgam7/q+bGWImehtMsB7T19al8
QdJN+FR0luJ+SNTbjgyY4zaD7nsyrLRlxYBP8WHrvoV56GpYFzbpA1w1qGmjxxO6
k6Z+OsqpupXNNCezw5Xwfi4vWmEnG4fdYg9P6V3a60OCpWkV6L3MgaK2Mdz+/14=
=+3Iq
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
