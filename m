Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id BFB9965CBC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 15:00:54 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so148648963wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 08:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Fe7kMy3kk5rIgqNUUFkAHnaka0w0Jy2lP/z0h8+ALSU=;
	b=NX8fTAaYANDShvZZUlMNnLkToml4mkqnHa3RctUSCXI7/FIHVc6CmiW11AsH5hQGXs
	rXj/uM5lpcY9WSb6qsiunWhg3hDI2pRvMcXw9A26GEhxMssA/1zcS1CJpDn/CNP3nCS2
	ux3pM2TlVjGEDjzIO8yQDMLAv48DwC0WE6/gjIgA41MCfV8ZbGwjlKDwlDxMFOABKb98
	dFKBKtF1/t3wczj2MD0x2WmSC2+VsmDb62mHkMEsO/MM0gHtXSUv5EgBj4hN4Y2BO6hH
	iSr/vdIW0Rci3BXOEL3RNr3UTLNy1QAvMuCeBlr/MghtdgPXNcwA62Akkn+A+57JPJz5
	0Njg==
X-Received: by 10.194.5.103 with SMTP id r7mr6605278wjr.47.1440082854438;
	Thu, 20 Aug 2015 08:00:54 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bq7sm5916528wjc.31.2015.08.20.08.00.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Aug 2015 08:00:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 20 Aug 2015 17:01:20 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150820150120.GD2446@jama>
References: <1437024767-3022-1-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1437024767-3022-1-git-send-email-leimaohui@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH v2] openwsman: add new recipe
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
X-List-Received-Date: Thu, 20 Aug 2015 15:00:56 -0000
X-Groupsio-MsgNum: 56832
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+B+y8wtTXqdUj1xM"
Content-Disposition: inline

--+B+y8wtTXqdUj1xM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2015 at 01:32:47PM +0800, Lei Maohui wrote:
> Openwsman is an open source implementation of WS-Management; enabling the=
 in-band management of Linux/uni*/Windows platforms.
>=20
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>  .../libssl-is-required-if-eventint-supported.patch | 17 ++++++
>  .../openwsman/openwsman/openwsmand.service         | 12 ++++
>  .../recipes-extended/openwsman/openwsman_2.6.0.bb  | 65 ++++++++++++++++=
++++++
>  3 files changed, 94 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/openwsman/openwsman/libssl-i=
s-required-if-eventint-supported.patch
>  create mode 100644 meta-oe/recipes-extended/openwsman/openwsman/openwsma=
nd.service
>  create mode 100644 meta-oe/recipes-extended/openwsman/openwsman_2.6.0.bb
>=20
> diff --git a/meta-oe/recipes-extended/openwsman/openwsman/libssl-is-requi=
red-if-eventint-supported.patch b/meta-oe/recipes-extended/openwsman/openws=
man/libssl-is-required-if-eventint-supported.patch
> new file mode 100644
> index 0000000..bd540e3
> --- /dev/null
> +++ b/meta-oe/recipes-extended/openwsman/openwsman/libssl-is-required-if-=
eventint-supported.patch
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
> diff --git a/meta-oe/recipes-extended/openwsman/openwsman/openwsmand.serv=
ice b/meta-oe/recipes-extended/openwsman/openwsman/openwsmand.service
> new file mode 100644
> index 0000000..154f3cd
> --- /dev/null
> +++ b/meta-oe/recipes-extended/openwsman/openwsman/openwsmand.service
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
> diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.6.0.bb b/meta=
-oe/recipes-extended/openwsman/openwsman_2.6.0.bb
> new file mode 100644
> index 0000000..67cd618
> --- /dev/null
> +++ b/meta-oe/recipes-extended/openwsman/openwsman_2.6.0.bb
> @@ -0,0 +1,65 @@
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
> +SRC_URI =3D "https://github.com/Openwsman/openwsman/archive/v${PV}.tar.g=
z \

Don't use github archives, they are regenerated from time to time with
different checksums and they have stupid filenames (prone to collision
with other recipes).

> +           file://libssl-is-required-if-eventint-supported.patch \
> +           file://openwsmand.service"
> +
> +SRC_URI[md5sum] =3D "824834a86040b98b03f3fc0f7f62e853"
> +SRC_URI[sha256sum] =3D "449b4972dc7700918f8f674047f0a1a9c19eeee3f4ce82f4=
7890dddfa56e823f"
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
> +LDFLAGS_append =3D "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', " =
-fuse-ld=3Dbfd ", '', d)}"
> +
> +EXTRA_OECMAKE =3D "-DBUILD_BINDINGS=3DNO \
> +                 -DBUILD_LIBCIM=3DNO \
> +                 -DBUILD_PERL=3DYES \
> +                 -DCMAKE_INSTALL_PREFIX=3D${prefix} \
> +                 -DLIB=3Dlib \
> +                "
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
> +    chmod 755 ${D}/${sysconfdir}/openwsman/owsmangencert.sh
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
> 1.8.4.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+B+y8wtTXqdUj1xM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXV68AACgkQN1Ujt2V2gBzfVACeKZP3CmC2uZSYoTpbzoyx226t
KbgAnR90BFWKdEL2hZqxVvEySRPOruMy
=Tzo1
-----END PGP SIGNATURE-----

--+B+y8wtTXqdUj1xM--
