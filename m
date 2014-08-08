Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id EA620609B1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Aug 2014 09:59:10 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id w61so5488940wes.37
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Aug 2014 02:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1UQQP4/uGpMprPmtv5K5YnLPnDneo5C4DhXgAsn79GQ=;
	b=Go6KdaXioHyMHtLFzFcgdilebK5+kGub1PFxY/j1P1ItUsYYjDzTR472CrXtLb9QUn
	wZGvhl35ARXTNMuS7mxd3MxwjPQ5KjbatpGboa+TgmJZC4qvlpkcQf+KkgamAclUrqV4
	2J80EmywKdiz/AE+hUf9CFgaVXY5arKv85CvVySr8rXbXn4RGRn1SnZW7eKfnGLS2/+u
	AIoq7onYyttklVbnizcv1x2EKn4LZvG2LDmPGnIlBZ/bhAnOgPOOFbvpKvLvERdvGOwY
	+cg4luGkR4pD+640tdRBgPAl8I2EYxes+Ige8XNFIKajeOuI16EtT8j+Y4t2mug8XJCA
	cCRQ==
X-Received: by 10.180.11.135 with SMTP id q7mr2946417wib.67.1407491951071;
	Fri, 08 Aug 2014 02:59:11 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	10sm16203743wjx.26.2014.08.08.02.59.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Aug 2014 02:59:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 8 Aug 2014 11:59:42 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140808095942.GB14848@jama>
References: <1406903795-9767-1-git-send-email-yao.zhao@windriver.com>
	<1406903886-9812-1-git-send-email-yao.zhao@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1406903886-9812-1-git-send-email-yao.zhao@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH v2] add support for opendataplane
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
X-List-Received-Date: Fri, 08 Aug 2014 09:59:14 -0000
X-Groupsio-MsgNum: 51495
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZCk4OG7a+AFlaik7"
Content-Disposition: inline

--ZCk4OG7a+AFlaik7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 01, 2014 at 10:38:06AM -0400, Yao Zhao wrote:
> The OpenDataPlane (ODP) project provides a data plane application
> programming environment that is easy to use, high performance,
> and portable between networking SoCs.
>=20
> support build opendataplane release 0.2 and current HEAD from linaro.
> For dpdk build, it is tested against layer meta-intel's
> common/recipes-extended/dpdk/dpdk_1.6.0r2.bb recipe.
> And it is needed to change its do_configure to add support for
> a single intel_dpdk library.(default is multiple static libraries)
> for example:
> @@ -35,6 +35,8 @@ do_configure () {
>         #############################################################
>         unset prefix
>=20
> +       sed -i -e "s/CONFIG_RTE_BUILD_COMBINE_LIBS=3Dn/CONFIG_RTE_BUILD_C=
OMBINE_LIBS=3Dy/g" \
> +               config/defconfig_${TARGET_ARCH}-default-${TARGET_OS}app-g=
cc
>         make O=3D$RTE_TARGET T=3D$RTE_TARGET config

Fails to build for qemuarm

| arm-oe-linux-gnueabi-libtool: compile:  arm-oe-linux-gnueabi-gcc -march=
=3Darmv5te -marm -mthumb-interwork --sysroot=3D/home/jenkins/oe/world/shr-c=
ore/tmp-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -pthread -DODP_DEBUG_PR=
INT=3D1 -W -Wall -Werror -Wstrict-prototypes -Wmissing-prototypes -Wmissing=
-declarations -Wold-style-definition -Wpointer-arith -Wcast-align -Wnested-=
externs -Wcast-qual -Wformat-nonliteral -Wformat-security -Wundef -Wwrite-s=
trings -I/home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-g=
nueabi/opendataplane/0.2+gitAUTOINC+68a45b11e5-r0/git/platform/linux-generi=
c/include -I/home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linu=
x-gnueabi/opendataplane/0.2+gitAUTOINC+68a45b11e5-r0/git/platform/linux-gen=
eric/include/api -I/home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-=
oe-linux-gnueabi/opendataplane/0.2+gitAUTOINC+68a45b11e5-r0/git/include -O2=
 -pipe -g -feliminate-unused-debug-types -c /home/jenkins/oe/world/shr-core=
/tmp-eglibc/work/armv5te-oe-linux-gnueabi/opendataplane/0.2+gitAUTOINC+68a4=
5b11e5-r0/git/platform/linux-generic/odp_packet.c -o odp_packet.o
| {standard input}: Assembler messages:
| {standard input}:40: Error: selected processor does not support ARM mode =
`dmb st'
| {standard input}:72: Error: selected processor does not support ARM mode =
`dmb st'
| make[2]: *** [odp_barrier.lo] Error 1
| make[2]: *** Waiting for unfinished jobs....
| make[2]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-eglibc/wo=
rk/armv5te-oe-linux-gnueabi/opendataplane/0.2+gitAUTOINC+68a45b11e5-r0/buil=
d/platform/linux-generic'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-eglibc/wo=
rk/armv5te-oe-linux-gnueabi/opendataplane/0.2+gitAUTOINC+68a45b11e5-r0/buil=
d/platform'
| make: *** [all-recursive] Error 1
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/jenkins/=
oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/opendataplane/0.=
2+gitAUTOINC+68a45b11e5-r0/temp/log.do_compile.12211)
NOTE: recipe opendataplane-0.2+gitAUTOINC+68a45b11e5-r0: task do_compile: F=
ailed
ERROR: Task 12545 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-n=
etworking/recipes-support/opendataplane/opendataplane_git.bb, do_compile) f=
ailed with exit code '1'

> Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
> ---
>  ...inux-dpdk-remove-unnecessary-include-path.patch | 29 ++++++++++++++++=
++++++
>  .../opendataplane/opendataplane.inc                | 21 ++++++++++++++++
>  .../opendataplane/opendataplane_0.2.bb             | 25 ++++++++++++++++=
+++
>  .../opendataplane/opendataplane_git.bb             | 14 +++++++++++
>  4 files changed, 89 insertions(+)
>  create mode 100644 meta-networking/recipes-support/opendataplane/files/0=
001-linux-dpdk-remove-unnecessary-include-path.patch
>  create mode 100644 meta-networking/recipes-support/opendataplane/opendat=
aplane.inc
>  create mode 100644 meta-networking/recipes-support/opendataplane/opendat=
aplane_0.2.bb
>  create mode 100644 meta-networking/recipes-support/opendataplane/opendat=
aplane_git.bb
>=20
> diff --git a/meta-networking/recipes-support/opendataplane/files/0001-lin=
ux-dpdk-remove-unnecessary-include-path.patch b/meta-networking/recipes-sup=
port/opendataplane/files/0001-linux-dpdk-remove-unnecessary-include-path.pa=
tch
> new file mode 100644
> index 0000000..a0ef7ce
> --- /dev/null
> +++ b/meta-networking/recipes-support/opendataplane/files/0001-linux-dpdk=
-remove-unnecessary-include-path.patch
> @@ -0,0 +1,29 @@
> +From 72b8eacc2985f054cadc5d0b48351a658998b8d6 Mon Sep 17 00:00:00 2001
> +From: Yao Zhao <yao.zhao@windriver.com>
> +Date: Wed, 30 Jul 2014 16:02:14 -0400
> +Subject: [PATCH] linux-dpdk: remove unnecessary include path
> +
> +for dpdk include/arch and include/exec-env is only included
> +by generic rte_xxx.h header, can't be included directly.
> +
> +Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
> +---
> + platform/linux-dpdk/Makefile.am | 2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/platform/linux-dpdk/Makefile.am b/platform/linux-dpdk/Makef=
ile.am
> +index 4aa568f..dfcaadb 100644
> +--- a/platform/linux-dpdk/Makefile.am
> ++++ b/platform/linux-dpdk/Makefile.am
> +@@ -12,8 +12,6 @@ PLAT_CFLAGS  =3D -msse4.2
> + if SDK_INSTALL_PATH_
> + PLAT_CFLAGS +=3D -include $(SDK_INSTALL_PATH)/include/rte_config.h
> + PLAT_CFLAGS +=3D -I$(SDK_INSTALL_PATH)/include
> +-PLAT_CFLAGS +=3D -I$(SDK_INSTALL_PATH)/include/arch
> +-PLAT_CFLAGS +=3D -I$(SDK_INSTALL_PATH)/include/exec-env
> +=20
> + AM_LDFLAGS  +=3D -L$(SDK_INSTALL_PATH)/lib
> + endif
> +--=20
> +1.9.1
> +
> diff --git a/meta-networking/recipes-support/opendataplane/opendataplane.=
inc b/meta-networking/recipes-support/opendataplane/opendataplane.inc
> new file mode 100644
> index 0000000..c4b184e
> --- /dev/null
> +++ b/meta-networking/recipes-support/opendataplane/opendataplane.inc
> @@ -0,0 +1,21 @@
> +SUMMARY =3D "Cross platform OpenDataPlane application APIs"
> +
> +DESCRIPTION =3D "The OpenDataPlane project has been established to \
> +produce an open-source, cross-platform set of application \
> +programming interfaces (APIs) for the networking data plane."
> +
> +HOMEPAGE =3D "http://www.opendataplane.org"
> +SECTION =3D "networking"
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4ccfa994aa96974cfcd39a59faee2=
0a2"
> +                =20
> +SRC_URI =3D "git://git.linaro.org/lng/odp.git"
> +
> +COMPATIBLE_HOST =3D "^((?!mips).*)$"
> +
> +PACKAGECONFIG ??=3D "platform_linux_generic"
> +PACKAGECONFIG[netmap] =3D "--enable-netmap,,,"
> +PACKAGECONFIG[platform_linux_generic] =3D "--with-platform=3Dlinux-gener=
ic,,,"
> +
> +S =3D "${WORKDIR}/git"
> +
> diff --git a/meta-networking/recipes-support/opendataplane/opendataplane_=
0.2.bb b/meta-networking/recipes-support/opendataplane/opendataplane_0.2.bb
> new file mode 100644
> index 0000000..6f7f601
> --- /dev/null
> +++ b/meta-networking/recipes-support/opendataplane/opendataplane_0.2.bb
> @@ -0,0 +1,25 @@
> +require ${BPN}.inc
> +
> +#odp-0.2 tag
> +SRCREV  =3D "6007d8833a6880abedf98f792586c0cfb9f10de0"
> +PV =3D "0.2"
> +
> +#0.2 still using pure Makefile
> +
> +#override the Makefile DESTDIR
> +export DESTDIR=3D"${D}${exec_prefix}"
> +
> +do_install () {
> +    oe_runmake install
> +   =20
> +    #move DESTDIR/share/odp/odp_x usr/bin
> +    install -d ${D}${bindir}
> +    for i in ${DESTDIR}/share/odp/*; do
> +        filename=3D`basename $i`
> +        mv ${DESTDIR}/share/odp/${filename} ${D}${bindir}/${filename}
> +    done
> +    rm -rf ${DESTDIR}/share
> +}
> +
> +#non standard doc install location
> +FILES_${PN}-doc +=3D "${exec_prefix}/doc/*"
> diff --git a/meta-networking/recipes-support/opendataplane/opendataplane_=
git.bb b/meta-networking/recipes-support/opendataplane/opendataplane_git.bb
> new file mode 100644
> index 0000000..e569daa
> --- /dev/null
> +++ b/meta-networking/recipes-support/opendataplane/opendataplane_git.bb
> @@ -0,0 +1,14 @@
> +require ${BPN}.inc
> +
> +SRC_URI +=3D "file://0001-linux-dpdk-remove-unnecessary-include-path.pat=
ch"
> +
> +SRCREV  =3D "68a45b11e52dbf835a7087c15d503c6b0e5d91ed"
> +#8f4f080625e2db810da3f13770ba418c72b08ede will support --with-sdk-instal=
l-path
> +PV =3D "0.2+git${SRCPV}"
> +
> +PACKAGECONFIG[platform_linux_generic] =3D "--with-platform=3Dlinux-gener=
ic,,openssl,libcrypto"
> +#need meta-intel layer's common/recipes-extended/dpdk/dpdk recipe
> +PACKAGECONFIG[platform_linux_dpdk] =3D '--with-platform=3Dlinux-dpdk --w=
ith-sdk-install-path=3D"${STAGING_EXECPREFIXDIR}",,dpdk,'
> +PACKAGECONFIG[platform_linux_keystone2] =3D "--with-platform=3Dlinux-key=
stone2,,,"
> +
> +inherit autotools
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

--ZCk4OG7a+AFlaik7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPkn44ACgkQN1Ujt2V2gBwYTQCdF5MSXQMuV/mwZ5OfwM2Tr3UU
Y9AAn1lZ9JIYZa0rnvIGJ2F06Db4secE
=Rxvg
-----END PGP SIGNATURE-----

--ZCk4OG7a+AFlaik7--
