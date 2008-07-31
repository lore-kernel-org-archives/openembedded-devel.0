Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1KOe6T-00078G-66
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Jul 2008 21:46:25 +0200
Received: (qmail invoked by alias); 31 Jul 2008 19:44:35 -0000
Received: from e178116172.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.116.172]
	by mail.gmx.net (mp063) with SMTP; 31 Jul 2008 21:44:35 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+m+UQwnoKmjRRA9IND6xEnrArFssVqRlJXaMcUpW
	xGzwevW+/jQiif
Message-ID: <4892166E.2050206@gmx.net>
Date: Thu, 31 Jul 2008 21:45:50 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.14 (X11/20080509)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.00
Subject: RFC: I want my <asm/ucontext.h>
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Jul 2008 19:46:25 -0000
X-Groupsio-MsgNum: 5674
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enigFD9525A6AB71E6240EF3515A"

--------------enigFD9525A6AB71E6240EF3515A
Content-Type: multipart/mixed;
 boundary="------------010703040509070504080904"

--------------010703040509070504080904
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
I am currently writing a recipe for Sun's phoneme and this wants to

#include <asm/ucontext.h>

Unfortunately this file is not part of our newer linux-libc-header
packages anymore. The problem is as follows:

In the recipes for versions earlier than 2.6.18 we copied the kernel's
include/asm-$ARCH/ files manually. In later kernels we relied upon 'make
install_headers'. Now the kernels Kbuild files do not mention ucontext.h
and as such it is not installed.

In the attached patch I added the installation of ucontext.h for all
newer linux-libc-headers recipes.

Please write if that is OK for .dev.

Regards
Robert

--------------010703040509070504080904
Content-Type: text/x-patch;
 name="oe-linux-libc-ucontext.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline;
 filename="oe-linux-libc-ucontext.patch"

#
# old_revision [2f0d85eeec79f2264f9ab9dfd612b78206b10d58]
#
# patch "packages/linux-libc-headers/linux-libc-headers_2.6.18.bb"
#  from [315b1efcbbcf61f41ebcdd6ff78e4306089eb779]
#    to [e70c403e494b5c1f6aab3b22e9a1d89b0bd16c6d]
#=20
# patch "packages/linux-libc-headers/linux-libc-headers_2.6.20.bb"
#  from [bb5b016cdec7c47517f8a6f0f98bb2bf0553754b]
#    to [f50d6a513fff87005db81caba9a8ecee7a97fc34]
#=20
# patch "packages/linux-libc-headers/linux-libc-headers_2.6.22.bb"
#  from [9848fbf9a03e26527896520878c57d533bebc91e]
#    to [9c69a4a4cb2fa320f613a45ad97ebc6f07612dbc]
#=20
# patch "packages/linux-libc-headers/linux-libc-headers_2.6.23.bb"
#  from [bf5ec08a1649841a180f829658d288158043c847]
#    to [6baf88ce91a21d42fe108b1880ea7986f596a136]
#=20
# patch "packages/linux-libc-headers/linux-libc-headers_2.6.25.bb"
#  from [db5fbde3ea8fba339863fac327c7734070be0da6]
#    to [7a8cf58d50758c246f13954819dccc3fcbebb559]
#
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/linux-libc-headers/linux-libc-headers_2.6.18.bb	315b1efcbbcf=
61f41ebcdd6ff78e4306089eb779
+++ packages/linux-libc-headers/linux-libc-headers_2.6.18.bb	e70c403e494b=
5c1f6aab3b22e9a1d89b0bd16c6d
@@ -2,7 +2,7 @@ DEPENDS +=3D "unifdef-native"
=20
 INHIBIT_DEFAULT_DEPS =3D "1"
 DEPENDS +=3D "unifdef-native"
-PR =3D "r3"
+PR =3D "r4"
=20
 SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.18.tar.=
bz2 \
            file://arm-syscall-define.patch;patch=3D1"
@@ -52,7 +52,8 @@ do_stage () {
 	rm -rf ${STAGE_TEMP}
 	mkdir -p ${STAGE_TEMP}
 	oe_runmake headers_install INSTALL_HDR_PATH=3D${STAGE_TEMP}${exec_prefi=
x} ARCH=3D${ARCH}
-	if [ "${ARCH}" =3D=3D "arm" ]; then
+	cp ${S}/include/asm-$ARCH/ucontext.h ${STAGE_TEMP}${includedir}/asm
+	if [ "$ARCH" =3D=3D "arm" ]; then
 		cp include/asm-arm/procinfo.h ${STAGE_TEMP}${includedir}/asm
 	fi
 	install -d ${STAGING_INCDIR}
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/linux-libc-headers/linux-libc-headers_2.6.20.bb	bb5b016cdec7=
c47517f8a6f0f98bb2bf0553754b
+++ packages/linux-libc-headers/linux-libc-headers_2.6.20.bb	f50d6a513fff=
87005db81caba9a8ecee7a97fc34
@@ -2,7 +2,7 @@ DEPENDS +=3D "unifdef-native"
=20
 INHIBIT_DEFAULT_DEPS =3D "1"
 DEPENDS +=3D "unifdef-native"
-PR =3D "r9"
+PR =3D "r10"
=20
 SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.b=
z2 \
            file://procinfo.h"
@@ -55,6 +55,7 @@ do_stage () {
 	rm -rf ${STAGE_TEMP}
 	mkdir -p ${STAGE_TEMP}
 	oe_runmake headers_install INSTALL_HDR_PATH=3D${STAGE_TEMP}${exec_prefi=
x} ARCH=3D$ARCH
+	cp ${S}/include/asm-$ARCH/ucontext.h ${STAGE_TEMP}${includedir}/asm
 	if [ "$ARCH" =3D "arm" ]; then
 		cp ${WORKDIR}/procinfo.h ${STAGE_TEMP}${includedir}/asm/
 	fi
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/linux-libc-headers/linux-libc-headers_2.6.22.bb	9848fbf9a03e=
26527896520878c57d533bebc91e
+++ packages/linux-libc-headers/linux-libc-headers_2.6.22.bb	9c69a4a4cb2f=
a320f613a45ad97ebc6f07612dbc
@@ -55,6 +55,7 @@ do_stage () {
 	rm -rf ${STAGE_TEMP}
 	mkdir -p ${STAGE_TEMP}
 	oe_runmake headers_install INSTALL_HDR_PATH=3D${STAGE_TEMP}${exec_prefi=
x} ARCH=3D$ARCH
+	cp ${S}/include/asm-$ARCH/ucontext.h ${STAGE_TEMP}${includedir}/asm
 	if [ "$ARCH" =3D "arm" ]; then
 		cp ${WORKDIR}/procinfo.h ${STAGE_TEMP}${includedir}/asm/
 	fi
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/linux-libc-headers/linux-libc-headers_2.6.23.bb	bf5ec08a1649=
841a180f829658d288158043c847
+++ packages/linux-libc-headers/linux-libc-headers_2.6.23.bb	6baf88ce91a2=
1d42fe108b1880ea7986f596a136
@@ -2,7 +2,7 @@ DEPENDS +=3D "unifdef-native"
=20
 INHIBIT_DEFAULT_DEPS =3D "1"
 DEPENDS +=3D "unifdef-native"
-PR =3D "r3"
+PR =3D "r4"
=20
 SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.b=
z2 \
            file://procinfo.h"
@@ -55,6 +55,7 @@ do_stage () {
 	rm -rf ${STAGE_TEMP}
 	mkdir -p ${STAGE_TEMP}
 	oe_runmake headers_install INSTALL_HDR_PATH=3D${STAGE_TEMP}${exec_prefi=
x} ARCH=3D$ARCH
+	cp ${S}/include/asm-$ARCH/ucontext.h ${STAGE_TEMP}${includedir}/asm/
 	if [ "$ARCH" =3D "arm" ]; then
 		cp ${WORKDIR}/procinfo.h ${STAGE_TEMP}${includedir}/asm/
 	fi
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/linux-libc-headers/linux-libc-headers_2.6.25.bb	db5fbde3ea8f=
ba339863fac327c7734070be0da6
+++ packages/linux-libc-headers/linux-libc-headers_2.6.25.bb	7a8cf58d5075=
8c246f13954819dccc3fcbebb559
@@ -2,7 +2,7 @@ DEPENDS +=3D "unifdef-native"
=20
 INHIBIT_DEFAULT_DEPS =3D "1"
 DEPENDS +=3D "unifdef-native"
-PR =3D "r1"
+PR =3D "r2"
=20
 SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.b=
z2 \
 	   file://reinstate-a.out.h.patch;patch=3D1 \
@@ -57,6 +57,7 @@ do_stage () {
 	rm -rf ${STAGE_TEMP}
 	mkdir -p ${STAGE_TEMP}
 	oe_runmake headers_install INSTALL_HDR_PATH=3D${STAGE_TEMP}${exec_prefi=
x} ARCH=3D$ARCH
+	cp ${S}/include/asm-$ARCH/ucontext.h ${STAGE_TEMP}${includedir}/asm
 	if [ "$ARCH" =3D "arm" ]; then
 		cp ${WORKDIR}/procinfo.h ${STAGE_TEMP}${includedir}/asm/
 	fi

--------------010703040509070504080904--

--------------enigFD9525A6AB71E6240EF3515A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAkiSFm4ACgkQG9cfwmwwEtrVhgCePb06oANHUfBJj0VEmYUuMAHi
oGQAniajfFD3q+qTffQFntpS32WF7LUm
=1KrM
-----END PGP SIGNATURE-----

--------------enigFD9525A6AB71E6240EF3515A--
