Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QSBt5-0004GR-4I for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jun 2011 19:40:51 +0200
Received: from f053037130.adsl.alicedsl.de ([78.53.37.130]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QSBqc-0001EP-Dp; Thu, 02 Jun 2011 17:38:18 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 02 Jun 2011 19:37:39 +0200
Message-ID: <1307036259.4241.65.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: [PATCH] Revert "lmbench: Obey ranlib"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
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
X-List-Received-Date: Thu, 02 Jun 2011 17:40:51 -0000
X-Groupsio-MsgNum: 32480
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-hUwKqDzM/fvtwA9QFHrC"

--=-hUwKqDzM/fvtwA9QFHrC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Thu, 2 Jun 2011 19:33:38 +0200

This reverts commit 1a1f68d70af9054d8e8216c02f5debf83c1544b0 [1].

Task install fails with the following error message using `minimal{,-uclibc=
}` for `MACHINE =3D "beagleboard"`.

	+ cd /oe/build-minimal-eglibc/minimal-dev/work/armv7a-oe-linux-gnueabi/lmb=
ench-3.0-a9-r5/lmbench-3.0-a9
	+ do_install
	+ install -d /oe/build-minimal-eglibc/minimal-dev/work/armv7a-oe-linux-gnu=
eabi/lmbench-3.0-a9-r5/image/var/run/lmbench /oe/build-minimal-eglibc/minim=
al-dev/work/armv7a-oe-linux-gnueabi/lmbench-3.0-a9-r5/image/usr/bin /oe/bui=
ld-minimal-eglibc/minimal-dev/work/armv7a-oe-linux-gnueabi/lmbench-3.0-a9-r=
5/image/usr/share/man /home/paul/oe/build-minimal-eglibc/minimal-dev/work/a=
rmv7a-oe-linux-gnueabi/lmbench-3.0-a9-r5/image/usr/lib/lmbench /oe/build-mi=
nimal-eglibc/minimal-dev/work/armv7a-oe-linux-gnueabi/lmbench-3.0-a9-r5/ima=
ge/usr/share/lmbench/scripts
	+ oe_runmake BASE=3D/oe/build-minimal-eglibc/minimal-dev/work/armv7a-oe-li=
nux-gnueabi/lmbench-3.0-a9-r5/image/usr -C src install
	+ oenote make 'CC=3Darm-oe-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcor=
tex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sys=
root=3D/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueab=
i' AR=3Darm-oe-linux-gnueabi-ar 'RANLIB=3Darm-oe-linux-gnueabi-ranlib CFLAG=
S=3D' -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os=
 '-g              LDFLAGS=3D-Wl,-O1' '-Wl,--hash-style=3Dgnu LD=3Darm-oe-li=
nux-gnueabi-ld' '--sysroot=3D/oe/build-minimal-eglibc/minimal-dev/sysroots/=
armv7a-oe-linux-gnueabi OS=3Darm-oe-linux-gnueabi           TARGET=3Dlinux-=
gnueabi BASE=3D/usr BASE=3D/oe/build-minimal-eglibc/minimal-dev/work/armv7a=
-oe-linux-gnueabi/lmbench-3.0-a9-r5/image/usr' -C src 'install
		      make CC=3Darm-oe-linux-gnueabi-gcc' -march=3Darmv7-a -mtune=3Dcorte=
x-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb '--sysr=
oot=3D/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi=
 AR=3Darm-oe-linux-gnueabi-ar RANLIB=3Darm-oe-linux-gnueabi-ranlib' 'CFLAGS=
=3D -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -=
g' 'LDFLAGS=3D-Wl,-O1 -Wl,--hash-style=3Dgnu' 'LD=3Darm-oe-linux-gnueabi-ld=
 --sysroot=3D/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-=
gnueabi' OS=3Darm-oe-linux-gnueabi TARGET=3Dlinux-gnueabi BASE=3D/usr BASE=
=3D/oe/build-minimal-eglibc/minimal-dev/work/armv7a-oe-linux-gnueabi/lmbenc=
h-3.0-a9-r5/image/usr -C src install
	+ echo NOTE: 'make CC=3Darm-oe-linux-gnueabi-gcc -march=3Darmv7-a -mtune=
=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb=
 --sysroot=3D/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-=
gnueabi AR=3Darm-oe-linux-gnueabi-ar RANLIB=3Darm-oe-linux-gnueabi-ranlib C=
FLAGS=3D -fexpensive-optimizations -fomit-frame-pointer -frename-registers =
-Os -g              LDFLAGS=3D-Wl,-O1 -Wl,--hash-style=3Dgnu LD=3Darm-oe-li=
nux-gnueabi-ld --sysroot=3D/oe/build-minimal-eglibc/minimal-dev/sysroots/ar=
mv7a-oe-linux-gnueabi OS=3Darm-oe-linux-gnueabi               TARGET=3Dlinu=
x-gnueabi BASE=3D/usr BASE=3D/oe/build-minimal-eglibc/minimal-dev/work/armv=
7a-oe-linux-gnueabi/lmbench-3.0-a9-r5/image/usr -C src install
		      make CC=3Darm-oe-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex=
-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroo=
t=3D/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi A=
R=3Darm-oe-linux-gnueabi-ar RANLIB=3Darm-oe-linux-gnueabi-ranlib CFLAGS=3D =
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -g LD=
FLAGS=3D-Wl,-O1 -Wl,--hash-style=3Dgnu LD=3Darm-oe-linux-gnueabi-ld --sysro=
ot=3D/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi =
OS=3Darm-oe-linux-gnueabi TARGET=3Dlinux-gnueabi BASE=3D/usr BASE=3D/oe/bui=
ld-minimal-eglibc/minimal-dev/work/armv7a-oe-linux-gnueabi/lmbench-3.0-a9-r=
5/image/usr -C src install'
	NOTE: make CC=3Darm-oe-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-=
a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=
=3D/oe/build-minimal-eglibc/minim
	al-dev/sysroots/armv7a-oe-linux-gnueabi AR=3Darm-oe-linux-gnueabi-ar RANLI=
B=3Darm-oe-linux-gnueabi-ranlib CFLAGS=3D -fexpensive-optimizations -fomit-=
frame-pointer -frename-registers -Os -g              LDFLAGS=3D-Wl,-O1 -Wl,=
--hash-style=3Dgnu LD=3Darm-oe-linux-gnueabi-ld --sysroot=3D/oe/build-minim=
al-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi OS=3Darm-oe-linux-gn=
ueabi           TARGET=3Dlinux-gnueabi BASE=3D/usr BASE=3D/oe/build-minimal=
-eglibc/minimal-dev/work/armv7a-oe-linux-gnueabi/lmbench-3.0-a9-r5/image/us=
r -C src install
	ERROR: Function 'do_install' failed (see /oe/build-minimal-eglibc/minimal-=
dev/work/armv7a-oe-linux-gnueabi/lmbench-3.0-a9-r5/temp/log.do_install.2009=
7 for further information)
		      make CC=3Darm-oe-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex=
-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroo=
t=3D/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi A=
R=3Darm-oe-linux-gnueabi-ar RANLIB=3Darm-oe-linux-gnueabi-ranlib CFLAGS=3D =
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -g LD=
FLAGS=3D-Wl,-O1 -Wl,--hash-style=3Dgnu LD=3Darm-oe-linux-gnueabi-ld --sysro=
ot=3D/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi =
OS=3Darm-oe-linux-gnueabi TARGET=3Dlinux-gnueabi BASE=3D/usr BASE=3D/oe/bui=
ld-minimal-eglibc/minimal-dev/work/armv7a-oe-linux-gnueabi/lmbench-3.0-a9-r=
5/image/usr -C src install
	+ mv /oe/build-minimal-eglibc/minimal-dev/work/armv7a-oe-linux-gnueabi/lmb=
ench-3.0-a9-r5/image/usr/bin/line /oe/build-minimal-eglibc/minimal-dev/work=
/armv7a-oe-linux-gnueabi/lmbench-3.0-a9-r5/image/usr/bin/lm_line
	mv: cannot stat `/oe/build-minimal-eglibc/minimal-dev/work/armv7a-oe-linux=
-gnueabi/lmbench-3.0-a9-r5/image/usr/bin/line': No such file or directory

Reverting that commit gets rid of the error.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
CC: Tom Rini <tom_rini@mentor.com>

[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/recipes/lmben=
ch/lmbench_3.0-a9.bb?id=3D48433b13bf3a26e9ccb83bf8e7344ee3e37f6139
---
Dear Tom,


as always a fix is preferred. I have no time to look into it.


Thanks,

Paul
---
 recipes/lmbench/lmbench-3.0-a9/obey-ranlib.patch |   25 ------------------=
----
 recipes/lmbench/lmbench_3.0-a9.bb                |    7 ++---
 2 files changed, 3 insertions(+), 29 deletions(-)
 delete mode 100644 recipes/lmbench/lmbench-3.0-a9/obey-ranlib.patch

diff --git a/recipes/lmbench/lmbench-3.0-a9/obey-ranlib.patch b/recipes/lmb=
ench/lmbench-3.0-a9/obey-ranlib.patch
deleted file mode 100644
index 5ce6e15..0000000
--- a/recipes/lmbench/lmbench-3.0-a9/obey-ranlib.patch
+++ /dev/null
@@ -1,25 +0,0 @@
----
- src/Makefile |    3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-Index: lmbench-3.0-a9/src/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- lmbench-3.0-a9.orig/src/Makefile
-+++ lmbench-3.0-a9/src/Makefile
-@@ -38,6 +38,7 @@ CC=3D`../scripts/compiler`
- MAKE=3D`../scripts/make`
- AR=3Dar
- ARCREATE=3Dcr
-+RANLIB=3Dranlib
-=20
- # base of installation location
- BASE=3D/usr/local
-@@ -217,7 +218,7 @@ $O/lmbench : ../scripts/lmbench version.
- $O/lmbench.a: $(LIBOBJS)
- 	/bin/rm -f $O/lmbench.a
- 	$(AR) $(ARCREATE) $O/lmbench.a $(LIBOBJS)
--	-ranlib $O/lmbench.a
-+	-$(RANLIB) $O/lmbench.a
-=20
- $O/lib_timing.o : lib_timing.c $(INCS)
- 	$(COMPILE) -c lib_timing.c -o $O/lib_timing.o
diff --git a/recipes/lmbench/lmbench_3.0-a9.bb b/recipes/lmbench/lmbench_3.=
0-a9.bb
index e84ab47..ce6d1a8 100644
--- a/recipes/lmbench/lmbench_3.0-a9.bb
+++ b/recipes/lmbench/lmbench_3.0-a9.bb
@@ -3,21 +3,20 @@ DESCRIPTION =3D "Tools for performance analysis."
 LICENSE =3D "GPL"
 RDEPENDS_${PN} =3D "debianutils"
=20
-PR =3D "r5"
+PR =3D "r4"
=20
 inherit autotools
=20
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
 	   file://lmbench-run \
 	   file://rename-line-binary.patch \
-	   file://update-results-script.patch \
-	   file://obey-ranlib.patch"
+	   file://update-results-script.patch"
 SRC_URI[md5sum] =3D "b3351a3294db66a72e2864a199d37cbf"
 SRC_URI[sha256sum] =3D "cbd5777d15f44eab7666dcac418054c3c09df99826961a397d=
9acf43d8a2a551"
=20
 S =3D "${WORKDIR}/lmbench-${PV}"
=20
-EXTRA_OEMAKE =3D 'CC=3D"${CC}" AR=3D"${AR}" RANLIB=3D"${RANLIB} CFLAGS=3D"=
${CFLAGS}" \
+EXTRA_OEMAKE =3D 'CC=3D"${CC}" AR=3D"${AR}" CFLAGS=3D"${CFLAGS}" \
 		LDFLAGS=3D"${LDFLAGS}" LD=3D"${LD}" OS=3D"${TARGET_SYS}" \
 		TARGET=3D"${TARGET_OS}" BASE=3D"${prefix}"'
=20
--=20
1.7.5.3

--=-hUwKqDzM/fvtwA9QFHrC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3nymMACgkQPX1aK2wOHViDVACeOj01fK4kmhR4siiVbNrzj37t
FaAAn2f+MEk86G/8dfFT4f8KxEtL0YLS
=RXds
-----END PGP SIGNATURE-----

--=-hUwKqDzM/fvtwA9QFHrC--
