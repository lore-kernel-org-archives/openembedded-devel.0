Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 014E1770AD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 18:48:53 +0000 (UTC)
Received: by wijq8 with SMTP id q8so95264190wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 11:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:cc:to:mime-version;
	bh=ySMrZwDPAJz9Lg2jAXmErqhIpQsTQ/s/WiUAD9yjuQU=;
	b=cKCKcofWM43sCMd42wFa62AL/EFZXbX04NX4Scm2krZ5Eno0tffqoAcot5jG4cs34b
	puXtYZhks+4iXShCv7bF84W1pZnRhfYEohDIhXTS2m7iN08Y8z9CSrUxE0rlQrnBUvUz
	PUnseElo7ogKl876VnMa0lhOY0MA4MJHyCzO8dC2H7VBBe/H3Hswtc7+vvbEHtEo2hhU
	QWCGpstxz6KKsEGsD18LwQkJnxPz0rQnF2CfMgig7BFikAu4xfAMoSELoSVekzDVfAxq
	Ld6zX1HJAnyk6aaoh2BMZQzN1ofBokdkoLMRkrUSzXt+N6Saguv4gDc89zNwmisYfJPH
	3//g==
X-Received: by 10.180.105.33 with SMTP id gj1mr5917566wib.90.1444848533423;
	Wed, 14 Oct 2015 11:48:53 -0700 (PDT)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	pb4sm11665531wjb.8.2015.10.14.11.48.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Oct 2015 11:48:52 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Date: Wed, 14 Oct 2015 20:48:51 +0200
Message-Id: <0B97F40A-B08B-44AC-A4C4-24DA6B8CF061@gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/6] llvm: update 3.5.2 to have a sane ARM JIT for OpenJDK-8
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
X-List-Received-Date: Wed, 14 Oct 2015 18:48:55 -0000
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
 meta-oe/recipes-core/llvm/llvm.inc                 |  8 +---
 ...r-output-from-configure-if-CFLAGS-is-set-.patch | 52 =
----------------------
 .../{llvm3.3 =3D> llvm3.5}/arm_fenv_uclibc.patch     |  0
 .../llvm/{llvm3.3_3.3.bb =3D> llvm3.5_3.5.2.bb}      | 11 +++--
 4 files changed, 9 insertions(+), 62 deletions(-)
 delete mode 100644 =
meta-oe/recipes-core/llvm/llvm3.3/Remove-error-output-from-configure-if-CF=
LAGS-is-set-.patch
 rename meta-oe/recipes-core/llvm/{llvm3.3 =3D> =
llvm3.5}/arm_fenv_uclibc.patch (100%)
 rename meta-oe/recipes-core/llvm/{llvm3.3_3.3.bb =3D> llvm3.5_3.5.2.bb} =
(71%)

diff --git a/meta-oe/recipes-core/llvm/llvm.inc =
b/meta-oe/recipes-core/llvm/llvm.inc
index 0597be1..cc45ca7 100644
--- a/meta-oe/recipes-core/llvm/llvm.inc
+++ b/meta-oe/recipes-core/llvm/llvm.inc
@@ -20,11 +20,6 @@
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
@@ -32,7 +27,7 @@ inherit perlnative pythonnative autotools
 LLVM_RELEASE =3D "${PV}"
 LLVM_DIR =3D "llvm${LLVM_RELEASE}"
=20
-SRC_URI =3D "http://llvm.org/releases/${PV}/llvm-${PV}.src.tar.gz"
+SRC_URI =3D "http://llvm.org/releases/${PV}/llvm-${PV}.src.tar.xz"
 S =3D "${WORKDIR}/llvm-${PV}.src"
=20
 LLVM_BUILD_DIR =3D "${WORKDIR}/llvm-${PV}.build"
@@ -42,6 +37,7 @@ EXTRA_OECONF +=3D "--disable-assertions \
                  --enable-debug-runtime \
                  --disable-expensive-checks \
                  --enable-bindings=3Dnone \
+                 --enable-jit \
                  --enable-keep-symbols \
                  --enable-libffi \
                  --enable-optimized \
diff --git =
a/meta-oe/recipes-core/llvm/llvm3.3/Remove-error-output-from-configure-if-=
CFLAGS-is-set-.patch =
b/meta-oe/recipes-core/llvm/llvm3.3/Remove-error-output-from-configure-if-=
CFLAGS-is-set-.patch
deleted file mode 100644
index 44387e8..0000000
--- =
a/meta-oe/recipes-core/llvm/llvm3.3/Remove-error-output-from-configure-if-=
CFLAGS-is-set-.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-=46rom d4bf7a3853dab12c11cbfc8088fd76f548a8d017 Mon Sep 17 00:00:00 =
2001
-From: Patrik Hagglund <patrik.h.hagglund@ericsson.com>
-Date: Tue, 24 Sep 2013 11:38:45 +0000
-Subject: [PATCH] Remove error output from configure if CFLAGS is set =
(r174313).
-
-This fixes PR16724.
-
-git-svn-id: https://llvm.org/svn/llvm-project/llvm/trunk@191289 =
91177308-0d34-0410-b5e6-96231b3b80d8
-
=
-https://github.com/llvm-mirror/llvm/commit/d4bf7a3853dab12c11cbfc8088fd76=
f548a8d017
-
-Upstream-Status: Backport
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
----
- autoconf/configure.ac | 4 ++--
- configure             | 4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/autoconf/configure.ac b/autoconf/configure.ac
-index f9c365c..45f2fe4 100644
---- a/autoconf/configure.ac
-+++ b/autoconf/configure.ac
-@@ -61,8 +61,8 @@ fi
-=20
- dnl Default to empty (i.e. assigning the null string to) CFLAGS and =
CXXFLAGS,
- dnl instead of the autoconf default (for example, '-g -O2' for =
CC=3Dgcc).
--${CFLAGS=3D}
--${CXXFLAGS=3D}
-+: ${CFLAGS=3D}
-+: ${CXXFLAGS=3D}
-=20
- dnl We need to check for the compiler up here to avoid anything else
- dnl starting with a different one.
-diff --git a/configure b/configure
-index f3a6594..9090cda 100755
---- a/configure
-+++ b/configure
-@@ -1992,8 +1992,8 @@ echo "$as_me: error: Already configured in =
${srcdir}" >&2;}
-   fi
- fi
-=20
--${CFLAGS=3D}
--${CXXFLAGS=3D}
-+: ${CFLAGS=3D}
-+: ${CXXFLAGS=3D}
-=20
- ac_ext=3Dc
- ac_cpp=3D'$CPP $CPPFLAGS'
---=20
-1.9.1
-
diff --git a/meta-oe/recipes-core/llvm/llvm3.3/arm_fenv_uclibc.patch =
b/meta-oe/recipes-core/llvm/llvm3.5/arm_fenv_uclibc.patch
similarity index 100%
rename from meta-oe/recipes-core/llvm/llvm3.3/arm_fenv_uclibc.patch
rename to meta-oe/recipes-core/llvm/llvm3.5/arm_fenv_uclibc.patch
diff --git a/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb =
b/meta-oe/recipes-core/llvm/llvm3.5_3.5.2.bb
similarity index 71%
rename from meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
rename to meta-oe/recipes-core/llvm/llvm3.5_3.5.2.bb
index 60a2221..7289b81 100644
--- a/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
+++ b/meta-oe/recipes-core/llvm/llvm3.5_3.5.2.bb
@@ -1,14 +1,17 @@
 require llvm.inc
=20
+# 3-clause BSD-like
+# University of Illinois/NCSA Open Source License
+LICENSE =3D "NCSA"
+LIC_FILES_CHKSUM =3D =
"file://LICENSE.TXT;md5=3D47e311aa9caedd1b3abf098bd7814d1d"
+
 DEPENDS +=3D "zlib"
 EXTRA_OECONF +=3D "--enable-zlib"
=20
-SRC_URI +=3D =
"file://Remove-error-output-from-configure-if-CFLAGS-is-set-.patch"
-
 SRC_URI_append_libc-uclibc =3D " file://arm_fenv_uclibc.patch "
=20
-SRC_URI[md5sum] =3D "40564e1dc390f9844f1711c08b08e391"
-SRC_URI[sha256sum] =3D =
"68766b1e70d05a25e2f502e997a3cb3937187a3296595cf6e0977d5cd6727578"
+SRC_URI[md5sum] =3D "f5a4dc595f7e8bd23397684d0906d014"
+SRC_URI[sha256sum] =3D =
"44196156d5749eb4b4224fe471a29cc3984df92570a4a89fa859f7394fc0c575"
=20
 PACKAGECONFIG ??=3D ""
 PACKAGECONFIG[r600] =3D "--enable-experimental-targets=3DR600,,,"
--=20
1.9.1


--=20
Jens Rehsack - rehsack@gmail.com


