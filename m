Return-Path: <martin.jansa@gmail.com>
Received: from mail-ve0-f174.google.com (mail-ve0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9D3CF60F25
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 May 2014 03:17:33 +0000 (UTC)
Received: by mail-ve0-f174.google.com with SMTP id oz11so4764699veb.33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 May 2014 20:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RINaJTgp9T7QY+m5Vkg1fFzSlIf4lgTHuKpno/KTLYk=;
	b=sloRYU4z+kiLt/c2s+Z+d5m/z55pD+6Y8jHj2tGs5Li4wAHpmGNXzVAuMkX0lUuLXZ
	6F+uwsBZHlrkEHLK1bocV40pVTA80JfFJdHWouC4/ki25917QdryK/MHPqjFliC6TQ1s
	mZR5F497fU7fN0aygQWAVHIoXUD/csheSOWGOY7BPPwBk0UrdOSXvxJ84ADxrK7xXPzZ
	3KbXUmn6ftd6JwRT3hSU9yzMZfohcy31KEK9DZ4ylgt2QpLHQETJft2Q+DHwlZO6k+h1
	CpVPvPIokTxxNuKD9TzmjMysMSGEgIw4EasPeMUCQWPkM35KL6vkbOtVnTii5Xiey9u4
	aSKQ==
X-Received: by 10.52.108.164 with SMTP id hl4mr9418831vdb.25.1399000653967;
	Thu, 01 May 2014 20:17:33 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u3sm60885589vdb.13.2014.05.01.20.17.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 May 2014 20:17:32 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 2 May 2014 05:17:48 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140502031748.GV2486@jama>
References: <1398870272-18014-1-git-send-email-mihaela.sendrea@enea.com>
MIME-Version: 1.0
In-Reply-To: <1398870272-18014-1-git-send-email-mihaela.sendrea@enea.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH v2 1/2] lksctp-tools: add recipe (version 1.0.16)
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
X-List-Received-Date: Fri, 02 May 2014 03:17:33 -0000
X-Groupsio-MsgNum: 49645
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WLWLg9EY4gXXEO9O"
Content-Disposition: inline

--WLWLg9EY4gXXEO9O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2014 at 05:04:31PM +0200, Mihaela Sendrea wrote:
> This recipe comes from arago-oe-dev:
> https://github.com/mrchapp/arago-oe-dev/tree/master/recipes/lksctp-tools

Fails to build in world builds

| ../../i586-oe-linux-libtool  --tag=3DCC   --mode=3Dcompile
i586-oe-linux-gcc  -m32 -march=3Di586
--sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots=
/qemux86
-DHAVE_CONFIG_H -I. -I../..  -I../../src/include   -O2 -pipe -g
-feliminate-unused-debug-types -c -o recvmsg.lo recvmsg.c
| i586-oe-linux-libtool: compile:  i586-oe-linux-gcc -m32 -march=3Di586
--sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots=
/qemux86
-DHAVE_CONFIG_H -I. -I../.. -I../../src/include -O2 -pipe -g
-feliminate-unused-debug-types -c sendmsg.c -o sendmsg.o >/dev/null 2>&1
| i586-oe-linux-libtool: compile:  i586-oe-linux-gcc -m32 -march=3Di586
--sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots=
/qemux86
-DHAVE_CONFIG_H -I. -I../.. -I../../src/include -O2 -pipe -g
-feliminate-unused-debug-types -c recvmsg.c  -fPIC -DPIC -o
=2Elibs/recvmsg.o
| i586-oe-linux-libtool: compile:  i586-oe-linux-gcc -m32 -march=3Di586
--sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots=
/qemux86
-DHAVE_CONFIG_H -I. -I../.. -I../../src/include -O2 -pipe -g
-feliminate-unused-debug-types -c addrs.c -o addrs.o >/dev/null 2>&1
| i586-oe-linux-libtool: compile:  i586-oe-linux-gcc -m32 -march=3Di586
--sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots=
/qemux86
-DHAVE_CONFIG_H -I. -I../.. -I../../src/include -O2 -pipe -g
-feliminate-unused-debug-types -c recvmsg.c -o recvmsg.o >/dev/null 2>&1
| ../../i586-oe-linux-libtool  --tag=3DCC   --mode=3Dlink i586-oe-linux-gcc
-m32 -march=3Di586
--sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots=
/qemux86
-O2 -pipe -g -feliminate-unused-debug-types  -Wl,-O1
-Wl,--hash-style=3Dgnu -Wl,--as-needed -o libsctputil.la  sctputil.lo
| ../../i586-oe-linux-libtool  --tag=3DCC   --mode=3Dlink i586-oe-linux-gcc
-m32 -march=3Di586
--sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots=
/qemux86
-O2 -pipe -g -feliminate-unused-debug-types -version-info 1:16:0
-Wl,--version-script=3D./Versions.map -Wl,-O1 -Wl,--hash-style=3Dgnu
-Wl,--as-needed -o libsctp.la -rpath /usr/lib bindx.lo connectx.lo
peeloff.lo opt_info.lo addrs.lo sendmsg.lo recvmsg.lo
| i586-oe-linux-libtool: link: i586-oe-linux-ar cru .libs/libsctputil.a
=2Elibs/sctputil.o
| i586-oe-linux-libtool: link: i586-oe-linux-ranlib .libs/libsctputil.a
| i586-oe-linux-libtool: link: ( cd ".libs" && rm -f "libsctputil.la" &&
ln -s "../libsctputil.la" "libsctputil.la" )
| make[4]: Leaving directory
`/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/i586-oe-linux/=
lksctp-tools/1.0.16-r1.0/lksctp-tools-1.0.16/src/testlib'
| i586-oe-linux-libtool: link: i586-oe-linux-gcc  -m32 -march=3Di586
--sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots=
/qemux86
-shared  -fPIC -DPIC  .libs/bindx.o .libs/connectx.o .libs/peeloff.o
=2Elibs/opt_info.o .libs/addrs.o .libs/sendmsg.o .libs/recvmsg.o    -m32
-march=3Di586
--sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots=
/qemux86
-O2 -Wl,--version-script=3D./Versions.map -Wl,-O1 -Wl,--hash-style=3Dgnu
-Wl,--as-needed   -Wl,-soname -Wl,libsctp.so.1 -o
=2Elibs/libsctp.so.1.0.16
|
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linu=
x/usr/libexec/i586-oe-linux/gcc/i586-oe-linux/4.8.2/ld:
error: symbol sctp_connectx has undefined version
| collect2: error: ld returned 1 exit status
| make[4]: *** [libsctp.la] Error 1
| make[4]: Leaving directory
`/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/i586-oe-linux/=
lksctp-tools/1.0.16-r1.0/lksctp-tools-1.0.16/src/lib'
| make[3]: *** [../../src/lib/libsctp.la] Error 2
| make[3]: Leaving directory
`/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/i586-oe-linux/=
lksctp-tools/1.0.16-r1.0/lksctp-tools-1.0.16/src/apps'
| make[2]: *** [all-recursive] Error 1
| make[2]: Leaving directory
`/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/i586-oe-linux/=
lksctp-tools/1.0.16-r1.0/lksctp-tools-1.0.16/src'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
`/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/i586-oe-linux/=
lksctp-tools/1.0.16-r1.0/lksctp-tools-1.0.16'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/i586-oe-linux/l=
ksctp-tools/1.0.16-r1.0/temp/log.do_compile.22857)
NOTE: recipe lksctp-tools-1.0.16-r1.0: task do_compile: Failed
ERROR: Task 5644
(/home/jenkins/oe/shr-core-branches/shr-core/meta-openembedded/meta-network=
ing/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb,
do_compile) failed with exit code '1'

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
> +LICENSE =3D "LGPLv2"
> +
> +LIC_FILES_CHKSUM =3D " \
> +  file://COPYING.lib;md5=3D0a1b79af951c42a9c8573533fbba9a92 \
> +  file://COPYING;md5=3D0c56db0143f4f80c369ee3af7425af6e \
> +  "
> +
> +S =3D "${WORKDIR}/${BPN}-${PV}"
> +
> +INC_PR =3D "r1"
> +
> +BBCLASSEXTEND =3D "native"
> +
> +inherit autotools pkgconfig binconfig
> +
> +do_install_append_virtclass-native() {
> +	:
> +}
> +
> +RREPLACES_lksctp-tools =3D "lksctp"
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
> +
> +FILESEXTRAPATHS =3D "${THISDIR}/files"
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/lksctp/lksctp-tools-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "708bb0b5a6806ad6e8d13c55b067518e"
> +SRC_URI[sha256sum] =3D "0903dd526b7f30a89d5031aa2c82757612becc38ed7bc6e4=
f972f8deae351f26"
> --=20
> 1.7.10.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WLWLg9EY4gXXEO9O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNjDlwACgkQN1Ujt2V2gBwdwwCeO5UAiQm8Qx6UYXtkPPCduDNM
q6sAniGf1LkGKo6WtreGuqmoxuPelqKn
=eu4j
-----END PGP SIGNATURE-----

--WLWLg9EY4gXXEO9O--
