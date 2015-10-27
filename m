Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7939275CC2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 20:04:34 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so176450899wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 13:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=0ND0bJp6joCNpqoKvfg3CRcFxorSJWHbGN2EBz8plWs=;
	b=QoIKccJGrdFw+xD4e/7yn6prtKjx2voPgc7aCA59rPfa/SGjTqMIl2p0m5AW8cfhpF
	XnNArx065j4riyeHu4QxixLkf9tE85A3xMpu/fBnPHSXTpg9LAmC5UNNROKgW9fAR/26
	cxiHkLYep0G4S1gOyu6qHHYgIH+nNbUYf5S9I9yeQRXWd3C7KNb3XVsqJaaM50Leiwjh
	NNBTDj0b2glRKWT+sbeImmWVR1X+FhE8ACjt5DAKG4vhyuI+bg9nPkLSxJx8BCdWNXUw
	60cxV6Zfp2CWD+CFm4u+hGRbkjy7amAcaGFc512y2+Aedfmv9yjNFuIcTmpUqhRZ7W0+
	zIIg==
X-Received: by 10.180.91.15 with SMTP id ca15mr17566536wib.40.1445976274587;
	Tue, 27 Oct 2015 13:04:34 -0700 (PDT)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	ev1sm16170549wic.21.2015.10.27.13.04.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Oct 2015 13:04:33 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <79D6C2B5-2151-4A49-AC04-48342EFD42FD@gmail.com>
Date: Tue, 27 Oct 2015 21:04:32 +0100
To: OE-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [meta-oe][PATCH] llvm: update 3.5.2 to have a sane ARM JIT for OpenJDK-8
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
X-List-Received-Date: Tue, 27 Oct 2015 20:04:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


llvm introduced new JIT technology MCJIT with llvm 3.4 and fixes ARM in =
3.5
(see =
http://llvm.org/releases/3.5.2/docs/ReleaseNotes.html#changes-to-the-arm-b=
ackend).

Ensure JIT is built with llvm

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta-oe/recipes-core/llvm/llvm.inc                 |  9 +++-----
 meta-oe/recipes-core/llvm/llvm3.3_3.3.bb           |  7 ++++++
 .../llvm/llvm3.5/arm_fenv_uclibc.patch             | 14 ++++++++++++
 meta-oe/recipes-core/llvm/llvm3.5_3.5.2.bb         | 25 =
++++++++++++++++++++++
 4 files changed, 49 insertions(+), 6 deletions(-)
 create mode 100644 =
meta-oe/recipes-core/llvm/llvm3.5/arm_fenv_uclibc.patch
 create mode 100644 meta-oe/recipes-core/llvm/llvm3.5_3.5.2.bb

diff --git a/meta-oe/recipes-core/llvm/llvm.inc =
b/meta-oe/recipes-core/llvm/llvm.inc
index 04c87aa..21aee3f 100644
--- a/meta-oe/recipes-core/llvm/llvm.inc
+++ b/meta-oe/recipes-core/llvm/llvm.inc
@@ -20,19 +20,15 @@
 DESCRIPTION =3D "The Low Level Virtual Machine"
 HOMEPAGE =3D "http://llvm.org"
=20
-# 3-clause BSD-like
-# University of Illinois/NCSA Open Source License
-LICENSE =3D "NCSA"
-LIC_FILES_CHKSUM =3D =
"file://LICENSE.TXT;md5=3Dd0a3ef0d3e0e8f5cf59e5ffc273ab1f8"
-
 DEPENDS =3D "libffi libxml2-native llvm-common"
=20
 inherit perlnative pythonnative autotools
=20
 LLVM_RELEASE =3D "${PV}"
 LLVM_DIR =3D "llvm${LLVM_RELEASE}"
+LLVM_SRC_EXT ?=3D "xz"
=20
-SRC_URI =3D "http://llvm.org/releases/${PV}/llvm-${PV}.src.tar.gz"
+SRC_URI =3D =
"http://llvm.org/releases/${PV}/llvm-${PV}.src.tar.${LLVM_SRC_EXT}"
 S =3D "${WORKDIR}/llvm-${PV}.src"
=20
 LLVM_BUILD_DIR =3D "${WORKDIR}/llvm-${PV}.build"
@@ -42,6 +38,7 @@ EXTRA_OECONF +=3D "--disable-assertions \
                  --enable-debug-runtime \
                  --disable-expensive-checks \
                  --enable-bindings=3Dnone \
+                 --enable-jit \
                  --enable-keep-symbols \
                  --enable-libffi \
                  --enable-optimized \
diff --git a/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb =
b/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
index 60a2221..2a82213 100644
--- a/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
+++ b/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
@@ -1,5 +1,12 @@
+LLVM_SRC_EXT ?=3D "gz"
+
 require llvm.inc
=20
+# 3-clause BSD-like
+# University of Illinois/NCSA Open Source License
+LICENSE =3D "NCSA"
+LIC_FILES_CHKSUM =3D =
"file://LICENSE.TXT;md5=3Dd0a3ef0d3e0e8f5cf59e5ffc273ab1f8"
+
 DEPENDS +=3D "zlib"
 EXTRA_OECONF +=3D "--enable-zlib"
=20
diff --git a/meta-oe/recipes-core/llvm/llvm3.5/arm_fenv_uclibc.patch =
b/meta-oe/recipes-core/llvm/llvm3.5/arm_fenv_uclibc.patch
new file mode 100644
index 0000000..c3ae494
--- /dev/null
+++ b/meta-oe/recipes-core/llvm/llvm3.5/arm_fenv_uclibc.patch
@@ -0,0 +1,14 @@
+Index: llvm-2.9/include/llvm/Support/FEnv.h
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- llvm-2.9.orig/include/llvm/Support/FEnv.h	2010-11-29 =
20:44:50.000000000 +0100
++++ llvm-2.9/include/llvm/Support/FEnv.h	2011-11-18 =
18:42:22.580161297 +0100
+@@ -17,6 +17,9 @@
+=20
+ #include "llvm/Config/config.h"
+ #include <cerrno>
++
++#undef HAVE_FENV_H
++
+ #ifdef HAVE_FENV_H
+ #include <fenv.h>
+ #endif
diff --git a/meta-oe/recipes-core/llvm/llvm3.5_3.5.2.bb =
b/meta-oe/recipes-core/llvm/llvm3.5_3.5.2.bb
new file mode 100644
index 0000000..7289b81
--- /dev/null
+++ b/meta-oe/recipes-core/llvm/llvm3.5_3.5.2.bb
@@ -0,0 +1,25 @@
+require llvm.inc
+
+# 3-clause BSD-like
+# University of Illinois/NCSA Open Source License
+LICENSE =3D "NCSA"
+LIC_FILES_CHKSUM =3D =
"file://LICENSE.TXT;md5=3D47e311aa9caedd1b3abf098bd7814d1d"
+
+DEPENDS +=3D "zlib"
+EXTRA_OECONF +=3D "--enable-zlib"
+
+SRC_URI_append_libc-uclibc =3D " file://arm_fenv_uclibc.patch "
+
+SRC_URI[md5sum] =3D "f5a4dc595f7e8bd23397684d0906d014"
+SRC_URI[sha256sum] =3D =
"44196156d5749eb4b4224fe471a29cc3984df92570a4a89fa859f7394fc0c575"
+
+PACKAGECONFIG ??=3D ""
+PACKAGECONFIG[r600] =3D "--enable-experimental-targets=3DR600,,,"
+
+# Fails to build with thumb-1 (qemuarm)
+# | {standard input}: Assembler messages:
+# | {standard input}:22: Error: selected processor does not support =
Thumb mode `stmdb sp!,{r0,r1,r2,r3,lr}'
+# | {standard input}:31: Error: lo register required -- `ldmia =
sp!,{r0,r1,r2,r3,lr}'
+# | {standard input}:32: Error: lo register required -- `ldr =
pc,[sp],#4'
+# | make[3]: *** =
[/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/l=
lvm3.3/3.3-r0/llvm-3.3.build/lib/Target/ARM/Release/ARMJITInfo.o] Error =
1
+ARM_INSTRUCTION_SET =3D "arm"
--=20
1.9.1


--=20
Jens Rehsack - rehsack@gmail.com


