Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 968FC60650
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 May 2014 14:48:47 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id pv20so3127693lab.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 May 2014 07:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RQAc3tjfNlW4x+KFViyvaZtzoMDT2R2bBFdgu3rLwmQ=;
	b=C6ZTULx+vy8Swv4Qa5U+ohV1hsEpxqttkdtu1e8TqYHBH/wH23rurOVELV1frqsv5W
	7s9VXEEZQQ6gQhUmm75wv1VsSi7X9WiVRWn3iew1NGc/6osxtoYnZ2aJV8O+T0jiBP+W
	Md4QLdT4aL97bQXWYHtcRmrHtbtsjySyHsJBjAKNceJi/hv/9ukGxxp//Lm3s1RRTF+n
	/qfRcxe3uUmcWfcDovoF3cLrIumvxCLumL176XXskRqecaosgRCj/zq0rw2UsMd2+WG/
	He3DK8kgaUHilxXCWRY5RzMyGY0B0rszGcksQIJMXaQ6bPZ6QwVSXiX3pNbQUFPy8WlF
	5MVA==
X-Received: by 10.152.36.99 with SMTP id p3mr29973laj.61.1399042127795;
	Fri, 02 May 2014 07:48:47 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	b5sm20544327laa.17.2014.05.02.07.48.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 May 2014 07:48:46 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 2 May 2014 16:49:03 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140502144903.GW2486@jama>
References: <1399037801-2347-1-git-send-email-mihaela.sendrea@enea.com>
MIME-Version: 1.0
In-Reply-To: <1399037801-2347-1-git-send-email-mihaela.sendrea@enea.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH v3 1/2] lksctp-tools: add recipe (version 1.0.16)
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
X-List-Received-Date: Fri, 02 May 2014 14:48:52 -0000
X-Groupsio-MsgNum: 49660
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zrBELilYOHYtIcUD"
Content-Disposition: inline

--zrBELilYOHYtIcUD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 02, 2014 at 03:36:40PM +0200, Mihaela Sendrea wrote:
> This recipe comes from arago-oe-dev:
> https://github.com/mrchapp/arago-oe-dev/tree/master/recipes/lksctp-tools
>=20
> Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
> ---
>  .../lksctp-tools/files/lib_order.patch             |   75 ++++++++++++++=
++++++
>  .../recipes-support/lksctp-tools/lksctp-tools.inc  |   59 +++++++++++++++
>  .../lksctp-tools/lksctp-tools_1.0.16.bb            |   10 +++
>  3 files changed, 144 insertions(+)
>  create mode 100644 meta-networking/recipes-support/lksctp-tools/files/li=
b_order.patch
>  create mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-t=
ools.inc
>  create mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-t=
ools_1.0.16.bb
>=20
> diff --git a/meta-networking/recipes-support/lksctp-tools/files/lib_order=
=2Epatch b/meta-networking/recipes-support/lksctp-tools/files/lib_order.pat=
ch
> new file mode 100644
> index 0000000..eb07d75
> --- /dev/null
> +++ b/meta-networking/recipes-support/lksctp-tools/files/lib_order.patch
> @@ -0,0 +1,75 @@
> +From 93fd7448317419594472045663ff13034c31efa9 Mon Sep 17 00:00:00 2001
> +From: Vlad Yasevich <vladislav.yasevich@hp.com>
> +Date: Wed, 14 Jan 2009 14:30:20 -0500
> +Subject: [PATCH] [lib] Fix building of static libraries
> +
> +When running "./configure --disable-shared --enable-
> +static" the build fails with the following error:
> +
> +gcc -g -Wall -Wstrict-prototypes -Wimplicit-function-
> +declaration -g -O2 -o nagle_snd
> +nagle_snd.o ../../src/lib/.libs/libsctp.a ../../src/t
> +estlib/.libs/libsctputil.a
> +../../src/testlib/.libs/libsctputil.a(sctputil.o): In
> +function `test_peer_addr':
> +/home/roubert/src/lksctp/lksctp-tools-
> +1.0.6/src/testlib/sctputil.c:376: undefined reference
> +to `sctp_getpaddrs'
> +/home/roubert/src/lksctp/lksctp-tools-
> +1.0.6/src/testlib/sctputil.c:382: undefined reference
> +to `sctp_freepaddrs'
> +/home/roubert/src/lksctp/lksctp-tools-
> +1.0.6/src/testlib/sctputil.c:416: undefined reference
> +to `sctp_freepaddrs'
> +/home/roubert/src/lksctp/lksctp-tools-
> +1.0.6/src/testlib/sctputil.c:400: undefined reference
> +to `sctp_freepaddrs'
> +collect2: ld returned 1 exit status
> +make[3]: *** [nagle_snd] Error 1
> +
> +Changing the order of libsctp.a and libsctputil.a
> +fixes this. The attached patch updates
> +src/apps/Makefile.am and src/func_tests/Makefile.am
> +to do that.
> +
> +Patch submitted by Fredrik Roubert <roubert@sf.net>.
> +
> +Signed-off-by: Vlad Yasevich <vladislav.yasevich@hp.com>
> +---
> + src/apps/Makefile.am       |    4 ++--
> + src/func_tests/Makefile.am |    4 ++--
> + 2 files changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/apps/Makefile.am b/src/apps/Makefile.am
> +index 515ef96..960cd5e 100644
> +--- a/src/apps/Makefile.am
> ++++ b/src/apps/Makefile.am
> +@@ -8,8 +8,8 @@ include $(top_srcdir)/Makefile.dirs
> + INCLUDES =3D -I. -I$(top_srcdir)/src/include -I$(top_srcdir)/src/testli=
b=20
> + AM_CFLAGS =3D -g -Wall -Wstrict-prototypes -Wimplicit-function-declarat=
ion
> + AM_LDFLAGS =3D=20
> +-LDADD =3D $(top_builddir)/src/lib/libsctp.la \
> +-	$(top_builddir)/src/testlib/libsctputil.la
> ++LDADD =3D $(top_builddir)/src/testlib/libsctputil.la \
> ++	$(top_builddir)/src/lib/libsctp.la
> +=20
> + # programs to be installed with the distriubution
> + bin_PROGRAMS =3D sctp_darn sctp_test
> +diff --git a/src/func_tests/Makefile.am b/src/func_tests/Makefile.am
> +index b985685..44f0e94 100644
> +--- a/src/func_tests/Makefile.am
> ++++ b/src/func_tests/Makefile.am
> +@@ -8,8 +8,8 @@ include $(top_srcdir)/Makefile.dirs
> + INCLUDES =3D -I. -I$(top_srcdir)/src/include -I$(top_srcdir)/src/testli=
b=20
> + AM_CFLAGS =3D -g -Wall -Wstrict-prototypes -Wimplicit-function-declarat=
ion
> + AM_LDFLAGS =3D -lpthread
> +-LDADD =3D $(top_builddir)/src/lib/libsctp.la \
> +-	$(top_builddir)/src/testlib/libsctputil.la
> ++LDADD =3D $(top_builddir)/src/testlib/libsctputil.la \
> ++	$(top_builddir)/src/lib/libsctp.la
> +=20
> + V6FLAGS =3D -DCONFIG_IPV6=3D1 -DTEST_V6=3D1 ${DEFS} ${INCLUDES} ${CFLAG=
S}
> +=20
> +--=20
> +1.7.1
> +
> diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools.in=
c b/meta-networking/recipes-support/lksctp-tools/lksctp-tools.inc
> new file mode 100644
> index 0000000..fd3c285
> --- /dev/null
> +++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools.inc
> @@ -0,0 +1,59 @@
> +DESCRIPTION =3D "The Linux Kernel Stream Control Transmission Protocol (=
lksctp) project"
> +SECTION =3D "libs"
> +PRIORITY =3D "optional"

we're not using this variable anymore

> +LICENSE =3D "LGPLv2"
> +
> +LIC_FILES_CHKSUM =3D " \
> +  file://COPYING.lib;md5=3D0a1b79af951c42a9c8573533fbba9a92 \
> +  file://COPYING;md5=3D0c56db0143f4f80c369ee3af7425af6e \
> +  "

Please use 4 spaces for indentation and " as first character on last
line.

> +
> +S =3D "${WORKDIR}/${BPN}-${PV}"

${BPN}-${PV} is ${BP}

> +
> +INC_PR =3D "r1"

Drop this

> +
> +BBCLASSEXTEND =3D "native"
> +
> +inherit autotools pkgconfig binconfig
> +
> +do_install_append_virtclass-native() {
> +	:

4 spaces

> +}
> +
> +RREPLACES_lksctp-tools =3D "lksctp"

why is this needed?

> +
> +LEAD_SONAME =3D "libsctp.so"
> +
> +PACKAGES =3D+ "${PN}-withsctp ${PN}-utils"
> +
> +FILES_${PN} =3D " \
> +  ${libdir}/libsctp.so.${SOLIBVERSION} \
> +  "
> +
> +FILES_${PN}-withsctp =3D " \
> +  ${libdir}/lksctp-tools/libwithsctp.so.${SOLIBVERSION}"
> +
> +FILES_${PN}-dev +=3D " \
> +  ${libdir}/libsctp.so.${SOLIBMAJORVERSION} \
> +  ${libdir}/libsctp.so \
> +  ${libdir}/lksctp-tools/libwithsctp.so.${SOLIBMAJORVERSION} \
> +  ${libdir}/lksctp-tools/libwithsctp.so \
> +  ${datadir}/lksctp-tools/checksctp.c \
> +  ${datadir}/lksctp-tools/sctp_socket.c \
> +  ${datadir}/lksctp-tools/sctp_status.c \
> +  ${datadir}/lksctp-tools/sctp_bind.c \
> +  ${datadir}/lksctp-tools/sctp_darn.c \
> +  ${datadir}/lksctp-tools/sctp_load_libs.c \
> +  ${datadir}/lksctp-tools/sctp_sockopt.c \
> +  ${datadir}/lksctp-tools/sctp_socket.h \
> +  ${datadir}/lksctp-tools/sctp_test.c \
> +  ${datadir}/lksctp-tools/sctp_darn.h \
> +  "
> +
> +FILES_${PN}-utils =3D " \
> +  ${bindir}/sctp_test \
> +  ${bindir}/sctp_darn \
> +  ${bindir}/checksctp \
> +  ${bindir}/withsctp  \
> +  ${bindir}/sctp_status \
> +  "

for spaces for all FILES_ variables

> diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.=
0.16.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.=
bb
> new file mode 100644
> index 0000000..964f08c
> --- /dev/null
> +++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
> @@ -0,0 +1,10 @@
> +SOLIBVERSION=3D"1.0.16"
> +SOLIBMAJORVERSION=3D"1"
> +require lksctp-tools.inc
> +PR =3D "${INC_PR}.0"

drop PR

> +
> +FILESEXTRAPATHS =3D "${THISDIR}/files"

Why is this needed? I'm pretty sure it isn't

> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/lksctp/lksctp-tools-${PV}.tar.gz"

lksctp-tools-${PV} -> ${BP}

> +
> +SRC_URI[md5sum] =3D "708bb0b5a6806ad6e8d13c55b067518e"
> +SRC_URI[sha256sum] =3D "0903dd526b7f30a89d5031aa2c82757612becc38ed7bc6e4=
f972f8deae351f26"

You can also fold .inc file to the recipe as we don't expect multiple
versions of lksctp-tools.

Was the build error I've reported fixed in this version?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zrBELilYOHYtIcUD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNjsF8ACgkQN1Ujt2V2gBwKXwCfU8Rte48MVtU7A0Zh25Ygmngu
de4AnjL9wDC1qqfOd5/LkGaetrDbBvDW
=WDX0
-----END PGP SIGNATURE-----

--zrBELilYOHYtIcUD--
