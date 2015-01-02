Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id B5CDD71F59
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jan 2015 07:22:17 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id m14so4176373wev.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jan 2015 23:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nAXWOT8gyklKzGVPHF7lpIGLeXExIeaTiZ3hAfZTUmc=;
	b=vFCngEFXtNMaE8OD3gTUUJBpTjJJEnpVh6Z8BirEPK8UbnpmVmJWkIBuT/GveznWNr
	4HZHjWVE7Bu48NZ5URgU8BCgmqPq8XRQzkVYF81YawEC+qJ5C6EqmaxaV5lC6I68iaSO
	W3cH7z4LJq9R0DJsuS5zLP3NXkoH7c+peJmcW2M6E9BJQzuF/Jgu/1cqVG1SG3nxwCWx
	jhjKWsPPLQPWCSXU1REXoNlZb3H1MSYLW2uODrCENHCbabRhutXGrFH+askJhxs+G3Ya
	gvANhdkJgUGDMpWdwXN5xhYd/g+W4DKc3mEoEu8m6c8yFEEsEUQdTSflU8Xe+6fdKO/l
	3QuQ==
X-Received: by 10.194.62.163 with SMTP id z3mr147388927wjr.74.1420183337496;
	Thu, 01 Jan 2015 23:22:17 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	j10sm54213603wjn.23.2015.01.01.23.22.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Jan 2015 23:22:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 2 Jan 2015 08:22:21 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150102072221.GF2469@jama>
References: <1420003780-39552-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1420003780-39552-1-git-send-email-biannm@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] openwsman: add recipe
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
X-List-Received-Date: Fri, 02 Jan 2015 07:22:27 -0000
X-Groupsio-MsgNum: 53549
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RE3pQJLXZi4fr8Xo"
Content-Disposition: inline

--RE3pQJLXZi4fr8Xo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 31, 2014 at 01:29:40PM +0800, Bian Naimeng wrote:
> Opensource Implementation of WS-Management

Fails to build in world, it doesn't have ruby or swig dependency so probabl=
y autodetects them and fails when found in sysroot.

| [ 15%] Built target wsman_pam_auth
| In file included from /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/=
x86_64-linux/usr/include/ruby-1.9.1/ruby.h:32:0,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv=
5te-oe-linux-gnueabi/openwsman/2.4.12-r0/build/src/plugins/swig/ruby/swig_w=
rap.c:821:
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/inclu=
de/ruby-1.9.1/ruby/ruby.h:105:14: error: size of array 'ruby_check_sizeof_l=
ong' is negative
|  typedef char ruby_check_sizeof_long[SIZEOF_LONG =3D=3D sizeof(long) ? 1 =
: -1];
|               ^
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/inclu=
de/ruby-1.9.1/ruby/ruby.h:109:14: error: size of array 'ruby_check_sizeof_v=
oidp' is negative
|  typedef char ruby_check_sizeof_voidp[SIZEOF_VOIDP =3D=3D sizeof(void*) ?=
 1 : -1];
|               ^
| In file included from /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/=
x86_64-linux/usr/include/ruby-1.9.1/ruby/intern.h:43:0,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/=
x86_64-linux/usr/include/ruby-1.9.1/ruby/ruby.h:1383,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/=
x86_64-linux/usr/include/ruby-1.9.1/ruby.h:32,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv=
5te-oe-linux-gnueabi/openwsman/2.4.12-r0/build/src/plugins/swig/ruby/swig_w=
rap.c:821:
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/inclu=
de/ruby-1.9.1/ruby/st.h:67:14: error: size of array 'st_check_for_sizeof_st=
_index_t' is negative
|  typedef char st_check_for_sizeof_st_index_t[SIZEOF_VOIDP =3D=3D (int)siz=
eof(st_index_t) ? 1 : -1];
|               ^


>=20
> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> ---
>  .../libssl-is-required-if-eventint-supported.patch | 17 +++++++
>  .../openwsman/openwsman/openwsmand.service         | 12 +++++
>  .../openwsman/openwsman_2.4.12.bb                  | 58 ++++++++++++++++=
++++++
>  3 files changed, 87 insertions(+)
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
> index 0000000..d3fb9c2
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/openwsman/openwsman_2.4.12.bb
> @@ -0,0 +1,58 @@
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
> +EXTRA_OECMAKE =3D "-DBUILD_JAVA=3DNO -DBUILD_LIBCIM=3DNO -DLIB=3Dlib"
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
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RE3pQJLXZi4fr8Xo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSmRy0ACgkQN1Ujt2V2gBzqvQCfXsGCFzEc1Pwh1S6nb1YQ/Wdt
rWoAnjkOqpZqHtvcHoYdoWfS/kv8JLg+
=ZKzH
-----END PGP SIGNATURE-----

--RE3pQJLXZi4fr8Xo--
