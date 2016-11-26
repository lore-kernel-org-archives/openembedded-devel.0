Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f193.google.com (mail-wj0-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0506671BD4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Nov 2016 00:17:12 +0000 (UTC)
Received: by mail-wj0-f193.google.com with SMTP id kp2so7221549wjc.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2016 16:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=xBV2mae1MjNRvS86g5FkyS+GGSVEVIjfk6xc6IKWar4=;
	b=aKVjj74cWgXTR8O1rzaRhgStVelfohSS9V4Sk7bDkUlofm3Y3v4hsS5bV8ODKAwayA
	s3a8JDqDJb0N8J+i550UQw9vuVd2umN/on5u3amjExTt9ZpwQ73YhdsHBaGMuxtCOqCC
	vVgNBay2piADsH/7K2SILyuGgzh2PQxPq9nRkOTYZYDk/LE14UP7qrAbjRl2dXb2Q70a
	PrSmI4tF6h591TWZDP7x77n11fcbFGHq49Goq6zsWNGM22Xv9PKjr/ARhdJSemliHAuS
	fRQ4Y3bhrI3c2xLoewT85DLbl+R9c+ybQamKb3SlX9nmbraQcAxTZ28dXjx61qjWsS82
	MoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=xBV2mae1MjNRvS86g5FkyS+GGSVEVIjfk6xc6IKWar4=;
	b=H4IAxAVIfX2Z2qFKrtpBJfu6GL1QYIFL8C0PNjVunNjjpLEYKrqqr/ZurF2y1TSkZL
	OJQNXnT5y3L+R4CwXv220IGneaTCHHy1qIq1fdKCWXH28MNXqkPw8mw2Gno0+6+EjAiA
	1+QCuQLUyjHM2Jhgiqoj6UxVY/gKksxHDX9PK/GK1doaK4COatJFFNEiG4tHmGXieKHx
	6xWqrTOhS/lVLeOLW9wnjUiMcwbfInyrIvNV0u/9bXZCvU8tEnKfJ64yoqs+7AYMpTsF
	57IU3RUHdYnxYCCV4TzCTm+qQAyONMls692Vo93tTpBWVU929hSgL+BbRRs9smdkc9aZ
	O6kQ==
X-Gm-Message-State: AKaTC01Z+/+6UJZi01PDO9cIEh+C3SF5PtDiXrSJLiwBgNNpNrNkLzu2aS/6XRZqpHfaQw==
X-Received: by 10.194.84.6 with SMTP id u6mr9481221wjy.185.1480119433596;
	Fri, 25 Nov 2016 16:17:13 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	i10sm49553602wjd.15.2016.11.25.16.17.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 25 Nov 2016 16:17:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 26 Nov 2016 01:17:17 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161126001717.GE8369@jama>
References: <20161123092209.23699-1-raj.khem@gmail.com>
	<20161123092209.23699-31-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20161123092209.23699-31-raj.khem@gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Subject: Re: [meta-oe][PATCH 31/49] openobex,obexftp: Update recipes
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
X-List-Received-Date: Sat, 26 Nov 2016 00:17:13 -0000
X-Groupsio-MsgNum: 64047
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XuV1QlJbYrcVoo+x"
Content-Disposition: inline

--XuV1QlJbYrcVoo+x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2016 at 01:21:51AM -0800, Khem Raj wrote:
> Update obexftp to 0.24.2 and openobex to 1.7.2
> These packages moved to CMake infra for builds
> therefore make adjustments to cross compile it

opexftp autodetect uriparser now:
http://lists.openembedded.org/pipermail/openembedded-devel/2016-November/11=
0050.html

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../disable-cable-test.patch                       |  0
>  .../libusb_crosscompile_check.patch                |  0
>  .../separate_builddir.patch                        |  0
>  meta-oe/recipes-connectivity/obex/openobex_1.5.bb  | 35 ----------------
>  .../recipes-connectivity/obex/openobex_1.7.2.bb    | 37 +++++++++++++++++
>  ...ists.txt-Explicitly-link-libbfb-and-libmu.patch | 47 ++++++++++++++++=
++++++
>  .../recipes-connectivity/obexftp/obexftp_0.23.bb   | 16 --------
>  .../recipes-connectivity/obexftp/obexftp_0.24.2.bb | 33 +++++++++++++++
>  8 files changed, 117 insertions(+), 51 deletions(-)
>  rename meta-oe/recipes-connectivity/obex/{openobex-1.5 =3D> openobex}/di=
sable-cable-test.patch (100%)
>  rename meta-oe/recipes-connectivity/obex/{openobex-1.5 =3D> openobex}/li=
busb_crosscompile_check.patch (100%)
>  rename meta-oe/recipes-connectivity/obex/{openobex-1.5 =3D> openobex}/se=
parate_builddir.patch (100%)
>  delete mode 100644 meta-oe/recipes-connectivity/obex/openobex_1.5.bb
>  create mode 100644 meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
>  create mode 100644 meta-oe/recipes-connectivity/obexftp/obexftp/0001-app=
s-CMakeLists.txt-Explicitly-link-libbfb-and-libmu.patch
>  delete mode 100644 meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb
>  create mode 100644 meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb
>=20
> diff --git a/meta-oe/recipes-connectivity/obex/openobex-1.5/disable-cable=
-test.patch b/meta-oe/recipes-connectivity/obex/openobex/disable-cable-test=
=2Epatch
> similarity index 100%
> rename from meta-oe/recipes-connectivity/obex/openobex-1.5/disable-cable-=
test.patch
> rename to meta-oe/recipes-connectivity/obex/openobex/disable-cable-test.p=
atch
> diff --git a/meta-oe/recipes-connectivity/obex/openobex-1.5/libusb_crossc=
ompile_check.patch b/meta-oe/recipes-connectivity/obex/openobex/libusb_cros=
scompile_check.patch
> similarity index 100%
> rename from meta-oe/recipes-connectivity/obex/openobex-1.5/libusb_crossco=
mpile_check.patch
> rename to meta-oe/recipes-connectivity/obex/openobex/libusb_crosscompile_=
check.patch
> diff --git a/meta-oe/recipes-connectivity/obex/openobex-1.5/separate_buil=
ddir.patch b/meta-oe/recipes-connectivity/obex/openobex/separate_builddir.p=
atch
> similarity index 100%
> rename from meta-oe/recipes-connectivity/obex/openobex-1.5/separate_build=
dir.patch
> rename to meta-oe/recipes-connectivity/obex/openobex/separate_builddir.pa=
tch
> diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.5.bb b/meta-oe/=
recipes-connectivity/obex/openobex_1.5.bb
> deleted file mode 100644
> index 6ac7905..0000000
> --- a/meta-oe/recipes-connectivity/obex/openobex_1.5.bb
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -DESCRIPTION =3D "The Openobex project is an open source implementation o=
f the \
> -Object Exchange (OBEX) protocol."
> -HOMEPAGE =3D "http://openobex.triq.net"
> -SECTION =3D "libs"
> -DEPENDS =3D "virtual/libusb0"
> -DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','=
bluez4',d)}"
> -
> -LICENSE =3D "GPLv2 & LGPLv2.1"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539feef013de476e68b5c=
50a \
> -                    file://COPYING.LIB;md5=3Da6f89e2100d9b6cdffcea4f398e=
37343 \
> -"
> -
> -SRC_URI =3D "http://www.kernel.org/pub/linux/bluetooth/openobex-${PV}.ta=
r.gz \
> -           file://disable-cable-test.patch \
> -           file://libusb_crosscompile_check.patch \
> -           file://separate_builddir.patch"
> -
> -SRC_URI[md5sum] =3D "0d83dc86445a46a1b9750107ba7ab65c"
> -SRC_URI[sha256sum] =3D "e602047570799a47ecb028420bda8f2cef41310e5a99d084=
de10aa9422935e65"
> -
> -inherit autotools binconfig pkgconfig
> -
> -EXTRA_OECONF =3D "--enable-apps --enable-syslog"
> -
> -do_install_append() {
> -    install -d ${D}${datadir}/aclocal
> -    install -m 0644 ${S}/openobex.m4 ${D}${datadir}/aclocal
> -}
> -
> -PACKAGES +=3D "openobex-apps"
> -FILES_${PN} =3D "${libdir}/lib*.so.*"
> -FILES_${PN}-dev +=3D "${bindir}/openobex-config"
> -FILES_${PN}-apps =3D "${bindir}/*"
> -DEBIAN_NOAUTONAME_${PN}-apps =3D "1"
> -
> diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb b/meta-o=
e/recipes-connectivity/obex/openobex_1.7.2.bb
> new file mode 100644
> index 0000000..053c80a
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
> @@ -0,0 +1,37 @@
> +DESCRIPTION =3D "The Openobex project is an open source implementation o=
f the \
> +Object Exchange (OBEX) protocol."
> +HOMEPAGE =3D "http://openobex.triq.net"
> +SECTION =3D "libs"
> +DEPENDS =3D "virtual/libusb0"
> +DEPENDS_append_class-target =3D " ${@bb.utils.contains('DISTRO_FEATURES'=
,'bluez5','bluez5','bluez4',d)}"
> +
> +LICENSE =3D "GPLv2 & LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539feef013de476e68b5c=
50a \
> +                    file://COPYING.LIB;md5=3Da6f89e2100d9b6cdffcea4f398e=
37343 \
> +"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}/${PV}/${BP}-Source.tar.=
gz \
> +"
> +
> +SRC_URI[md5sum] =3D "f6e0b6cb7dcfd731460a7e9a91429a3a"
> +SRC_URI[sha256sum] =3D "158860aaea52f0fce0c8e4b64550daaae06df2689e058346=
97b7e8c7d73dd4fc"
> +
> +inherit cmake pkgconfig
> +
> +S =3D "${WORKDIR}/${BP}-Source"
> +
> +EXTRA_OECONF =3D " -DCMAKE_SKIP_RPATH=3DON "
> +
> +#--enable-apps --enable-syslog
> +
> +do_install_append () {
> +    rmdir ${D}${bindir}
> +}
> +
> +PACKAGES =3D+ "openobex-apps"
> +FILES_${PN}-apps =3D "${bindir}/*"
> +FILES_${PN} +=3D "${libdir}/lib*.so.*"
> +FILES_${PN}-dev +=3D "${bindir}/openobex-config ${libdir}/cmake"
> +DEBIAN_NOAUTONAME_${PN}-apps =3D "1"
> +
> +BBCLASSEXTEND =3D "native"
> diff --git a/meta-oe/recipes-connectivity/obexftp/obexftp/0001-apps-CMake=
Lists.txt-Explicitly-link-libbfb-and-libmu.patch b/meta-oe/recipes-connecti=
vity/obexftp/obexftp/0001-apps-CMakeLists.txt-Explicitly-link-libbfb-and-li=
bmu.patch
> new file mode 100644
> index 0000000..55e5567
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/obexftp/obexftp/0001-apps-CMakeLists.t=
xt-Explicitly-link-libbfb-and-libmu.patch
> @@ -0,0 +1,47 @@
> +From b8dc608dad7d9fc3a4c16acd0327d97b81c23b95 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 15 Nov 2016 01:32:31 +0000
> +Subject: [PATCH] apps/CMakeLists.txt: Explicitly link libbfb and libmult=
icobex
> +
> +Transitive linking is disabled now for multicobex and
> +obexftp, This ends up with linking errors for apps, therefore
> +they are required to be added to link line explicitly.
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + apps/CMakeLists.txt | 13 +++++++++++--
> + 1 file changed, 11 insertions(+), 2 deletions(-)
> +
> +diff --git a/apps/CMakeLists.txt b/apps/CMakeLists.txt
> +index b5c84e4..63af134 100644
> +--- a/apps/CMakeLists.txt
> ++++ b/apps/CMakeLists.txt
> +@@ -5,14 +5,23 @@ add_definitions( -DVERSION=3D"${obexftp_VERSION}" )
> + add_definitions ( -DHAVE_USB )
> +=20
> + add_executable ( obexftp_app obexftp.c )
> +-target_link_libraries ( obexftp_app obexftp )
> ++target_link_libraries ( obexftp_app
> ++  PRIVATE multicobex
> ++  PRIVATE bfb
> ++  obexftp
> ++)
> + set_target_properties ( obexftp_app PROPERTIES
> +   OUTPUT_NAME obexftp
> + )
> +=20
> +=20
> + add_executable ( obexftpd_app obexftpd.c )
> +-target_link_libraries ( obexftpd_app obexftp openobex )
> ++target_link_libraries ( obexftpd_app
> ++  PRIVATE multicobex
> ++  PRIVATE bfb
> ++  obexftp
> ++  openobex
> ++)
> + set_target_properties ( obexftpd_app PROPERTIES
> +   OUTPUT_NAME obexftpd
> + )
> +--=20
> +1.9.1
> +
> diff --git a/meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb b/meta-=
oe/recipes-connectivity/obexftp/obexftp_0.23.bb
> deleted file mode 100644
> index b6bdfb7..0000000
> --- a/meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -DESCRIPTION =3D "A tool for transfer files to/from any OBEX enabled devi=
ce"
> -LICENSE =3D "GPLv2 & LGPLv2 & LGPLv2.1"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
> -
> -DEPENDS +=3D "openobex"
> -
> -SRC_URI =3D "http://sourceforge.net/projects/openobex/files/obexftp/${PV=
}/obexftp-${PV}.tar.bz2 \
> -           file://Remove_some_printf_in_obexftpd.patch "
> -
> -SRC_URI[md5sum] =3D "f20762061b68bc921e80be4aebc349eb"
> -SRC_URI[sha256sum] =3D "44a74ff288d38c0f75354d6bc2efe7d6dec10112eaff2e7b=
10e292b0d2105b36"
> -
> -inherit autotools pkgconfig
> -
> -EXTRA_OECONF +=3D "--disable-tcl --disable-perl --disable-python --disab=
le-ruby"
> -
> diff --git a/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb b/met=
a-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb
> new file mode 100644
> index 0000000..991cd48
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb
> @@ -0,0 +1,33 @@
> +DESCRIPTION =3D "A tool for transfer files to/from any OBEX enabled devi=
ce"
> +LICENSE =3D "GPLv2 & PD & LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://LGPL-2.1.txt;md5=3D4fbd65380cdd255951079008=
b364516c \
> +                    file://GPL-2.txt;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263 \
> +                    file://License.txt;md5=3Dfcbddc3c1debed80dd80da2d3e5=
f0dc1 \
> +                   "
> +
> +DEPENDS +=3D "openobex obexftp-native"
> +SRC_URI =3D "http://downloads.sourceforge.net/openobex/${BP}-Source.tar.=
gz \
> +           file://0001-apps-CMakeLists.txt-Explicitly-link-libbfb-and-li=
bmu.patch \
> +"
> +SRC_URI[md5sum] =3D "157a9d1b2ed220203f7084db906de73c"
> +SRC_URI[sha256sum] =3D "d40fb48e0a0eea997b3e582774b29f793919a625d54b8718=
2e31a3f3d1c989a3"
> +
> +inherit cmake pkgconfig
> +
> +S =3D "${WORKDIR}/${BP}-Source"
> +
> +EXTRA_OECMAKE +=3D "-DCMAKE_SKIP_RPATH=3DON \
> +                  -DENABLE_PERL=3DNO -DENABLE_PYTHON=3DNO \
> +                  -DENABLE_RUBY=3DNO -DENABLE_TCL=3DNO \
> +"
> +
> +do_compile_class-native () {
> +    oe_runmake crctable
> +}
> +
> +do_install_class-native () {
> +    install -D -m 0755 ${B}/bfb/crctable ${D}${bindir}/crctable
> +}
> +
> +
> +BBCLASSEXTEND =3D "native"
> --=20
> 2.10.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XuV1QlJbYrcVoo+x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWDjUjQAKCRA3VSO3ZXaA
HEMKAJ9bSyprsQra1sLdYSESofXDnBbpTACdFRLjOr4qLHbEZC9mTosRjAXaEAU=
=q3n6
-----END PGP SIGNATURE-----

--XuV1QlJbYrcVoo+x--
