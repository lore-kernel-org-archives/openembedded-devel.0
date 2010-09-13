Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1Ov4LI-0007QT-1T
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 10:24:48 +0200
Received: by eyb7 with SMTP id 7so2663472eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Sep 2010 01:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=lL/NDON+piLIvhhf720C3ytH1m+fRiiXkJLZgibGwAE=;
	b=wqsonMkYgXGlU86vjmhNb3Et6bV3oNbyb/ZIDrikZZe+kIKhDbFrZg7Ez40yvvGMmN
	4KffQg+5ufL4NZgrokzR4bncBnOr/LjQtfvNdNk9DVNT0UeUxObn7sjl1eqdbnHhvgS+
	Y8Z/RhFxrvAI4EH173bBHvBQeU2PWY3bTfEiw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=qzBYGrX+bwhvvzgtcuwh41roMfk2g6oIah+DKZtcd07cSHYIFEdSvd+dy0M2zBdQ0A
	I6ojhHfJexGkJh5TUz/SvFQLW/oeu2TkXne9xX4DswRX//90Zmc52D8P11PCaCCwjwAc
	dE9oPgMysCSx62iv/wmq69oCSr8CbOxCKM7m0=
Received: by 10.213.27.138 with SMTP id i10mr1519633ebc.51.1284366242695;
	Mon, 13 Sep 2010 01:24:02 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id z55sm8838966eeh.3.2010.09.13.01.24.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 13 Sep 2010 01:24:01 -0700 (PDT)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Sep 2010 10:23:49 +0200
Message-Id: <1284366229-69234-1-git-send-email-koen@openembedded.org>
X-Mailer: git-send-email 1.7.0
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: koen.kooi@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <k-kooi@ti.com>
Subject: [PATCH] gcc-package-cross.inc: install shlibs lists into target dir instead of host dir
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
X-List-Received-Date: Mon, 13 Sep 2010 08:24:49 -0000

From: Koen Kooi <k-kooi@ti.com>

This fixes the "libstdc++ isn't installed into my rootfs anymore" type of problems after a full rebuild of all packages

This bumps PR of gcc to force a rebuild, but that is *NOT* enough to fix the packages built before this fix, those still need rebuilding

Signed-off-by: Koen Kooi <k-kooi@ti.com>
Acked-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Dallas Foley <dfoley@telus.net>

---
 recipes/gcc/gcc-3.3.4.inc         |    2 +-
 recipes/gcc/gcc-3.4.3.inc         |    2 +-
 recipes/gcc/gcc-3.4.4.inc         |    2 +-
 recipes/gcc/gcc-3.4.6.inc         |    2 ++
 recipes/gcc/gcc-4.0.0.inc         |    2 ++
 recipes/gcc/gcc-4.0.2.inc         |    2 ++
 recipes/gcc/gcc-4.1.0.inc         |    2 +-
 recipes/gcc/gcc-4.1.1.inc         |    2 +-
 recipes/gcc/gcc-4.1.2.inc         |    2 +-
 recipes/gcc/gcc-4.2.1.inc         |    2 +-
 recipes/gcc/gcc-4.2.2.inc         |    2 +-
 recipes/gcc/gcc-4.2.3.inc         |    2 +-
 recipes/gcc/gcc-4.2.4.inc         |    2 +-
 recipes/gcc/gcc-4.3.1.inc         |    2 +-
 recipes/gcc/gcc-4.3.2.inc         |    2 +-
 recipes/gcc/gcc-4.3.3.inc         |    2 +-
 recipes/gcc/gcc-4.3.4.inc         |    2 +-
 recipes/gcc/gcc-4.4.1.inc         |    2 +-
 recipes/gcc/gcc-4.4.2.inc         |    2 +-
 recipes/gcc/gcc-4.4.4.inc         |    2 +-
 recipes/gcc/gcc-4.5.inc           |    2 +-
 recipes/gcc/gcc-package-cross.inc |    2 ++
 22 files changed, 26 insertions(+), 18 deletions(-)

diff --git a/recipes/gcc/gcc-3.3.4.inc b/recipes/gcc/gcc-3.3.4.inc
index 1185c65..29c1473 100644
--- a/recipes/gcc/gcc-3.3.4.inc
+++ b/recipes/gcc/gcc-3.3.4.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-INC_PR = "r12"
+INC_PR = "r13"
 
 SRC_URI = "${GNU_MIRROR}/gcc/releases/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	   file://arm-gotoff.dpatch;apply=yes;striplevel=0 \
diff --git a/recipes/gcc/gcc-3.4.3.inc b/recipes/gcc/gcc-3.4.3.inc
index cfee4d1..cf615a1 100644
--- a/recipes/gcc/gcc-3.4.3.inc
+++ b/recipes/gcc/gcc-3.4.3.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-INC_PR = "r20"
+INC_PR = "r21"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	   file://gcc34-reverse-compare.patch \
diff --git a/recipes/gcc/gcc-3.4.4.inc b/recipes/gcc/gcc-3.4.4.inc
index 6d4d266..99e680f 100644
--- a/recipes/gcc/gcc-3.4.4.inc
+++ b/recipes/gcc/gcc-3.4.4.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-INC_PR = "r16"
+INC_PR = "r17"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	   file://gcc34-reverse-compare.patch \
diff --git a/recipes/gcc/gcc-3.4.6.inc b/recipes/gcc/gcc-3.4.6.inc
index b6b01e3..5296f26 100644
--- a/recipes/gcc/gcc-3.4.6.inc
+++ b/recipes/gcc/gcc-3.4.6.inc
@@ -1,5 +1,7 @@
 require gcc-common.inc
 
+INC_PR = "r1"
+
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	   file://gcc34-reverse-compare.patch \
 	   file://gcc34-arm-ldm.patch \
diff --git a/recipes/gcc/gcc-4.0.0.inc b/recipes/gcc/gcc-4.0.0.inc
index dd48595..d6a7f33 100644
--- a/recipes/gcc/gcc-4.0.0.inc
+++ b/recipes/gcc/gcc-4.0.0.inc
@@ -1,5 +1,7 @@
 require gcc-common.inc
 
+INC_PR = "r1"
+
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
diff --git a/recipes/gcc/gcc-4.0.2.inc b/recipes/gcc/gcc-4.0.2.inc
index 16584ec..63f9772 100644
--- a/recipes/gcc/gcc-4.0.2.inc
+++ b/recipes/gcc/gcc-4.0.2.inc
@@ -1,5 +1,7 @@
 require gcc-common.inc
 
+INC_PR = "r1"
+
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
diff --git a/recipes/gcc/gcc-4.1.0.inc b/recipes/gcc/gcc-4.1.0.inc
index d3c5079..8da06aa 100644
--- a/recipes/gcc/gcc-4.1.0.inc
+++ b/recipes/gcc/gcc-4.1.0.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-INC_PR = "r12"
+INC_PR = "r13"
 
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/recipes/gcc/gcc-4.1.1.inc b/recipes/gcc/gcc-4.1.1.inc
index 88c9d7e..c261138 100644
--- a/recipes/gcc/gcc-4.1.1.inc
+++ b/recipes/gcc/gcc-4.1.1.inc
@@ -3,7 +3,7 @@ require gcc-common.inc
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r3"
+INC_PR = "r4"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://100-uclibc-conf.patch \
diff --git a/recipes/gcc/gcc-4.1.2.inc b/recipes/gcc/gcc-4.1.2.inc
index c102b05..114f053 100644
--- a/recipes/gcc/gcc-4.1.2.inc
+++ b/recipes/gcc/gcc-4.1.2.inc
@@ -5,7 +5,7 @@ NATIVEDEPS = "mpfr-native gmp-native"
 
 COMPATIBLE_TARGET_SYS = "."
 
-INC_PR = "r24"
+INC_PR = "r25"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://100-uclibc-conf.patch \
diff --git a/recipes/gcc/gcc-4.2.1.inc b/recipes/gcc/gcc-4.2.1.inc
index fbee758..e5506c7 100644
--- a/recipes/gcc/gcc-4.2.1.inc
+++ b/recipes/gcc/gcc-4.2.1.inc
@@ -3,7 +3,7 @@ require gcc-common.inc
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r22"
+INC_PR = "r23"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://100-uclibc-conf.patch \
diff --git a/recipes/gcc/gcc-4.2.2.inc b/recipes/gcc/gcc-4.2.2.inc
index 1c7f9d0..a1f9cd3 100644
--- a/recipes/gcc/gcc-4.2.2.inc
+++ b/recipes/gcc/gcc-4.2.2.inc
@@ -4,7 +4,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r18"
+INC_PR = "r19"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://100-uclibc-conf.patch \
diff --git a/recipes/gcc/gcc-4.2.3.inc b/recipes/gcc/gcc-4.2.3.inc
index 6d29b0e..988740e 100644
--- a/recipes/gcc/gcc-4.2.3.inc
+++ b/recipes/gcc/gcc-4.2.3.inc
@@ -4,7 +4,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r19"
+INC_PR = "r20"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://100-uclibc-conf.patch \
diff --git a/recipes/gcc/gcc-4.2.4.inc b/recipes/gcc/gcc-4.2.4.inc
index db09c6e..974471e 100644
--- a/recipes/gcc/gcc-4.2.4.inc
+++ b/recipes/gcc/gcc-4.2.4.inc
@@ -4,7 +4,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r13"
+INC_PR = "r14"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://100-uclibc-conf.patch \
diff --git a/recipes/gcc/gcc-4.3.1.inc b/recipes/gcc/gcc-4.3.1.inc
index 645c14a..7829f23 100644
--- a/recipes/gcc/gcc-4.3.1.inc
+++ b/recipes/gcc/gcc-4.3.1.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r23"
+INC_PR = "r24"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://fedora/gcc43-c++-builtin-redecl.patch;striplevel=0 \
diff --git a/recipes/gcc/gcc-4.3.2.inc b/recipes/gcc/gcc-4.3.2.inc
index 2d3118c..aa9cd48 100644
--- a/recipes/gcc/gcc-4.3.2.inc
+++ b/recipes/gcc/gcc-4.3.2.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r13"
+INC_PR = "r14"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://fedora/gcc43-c++-builtin-redecl.patch;striplevel=0 \
diff --git a/recipes/gcc/gcc-4.3.3.inc b/recipes/gcc/gcc-4.3.3.inc
index 11d09fa..a3392c0 100644
--- a/recipes/gcc/gcc-4.3.3.inc
+++ b/recipes/gcc/gcc-4.3.3.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r16"
+INC_PR = "r17"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://fedora/gcc43-c++-builtin-redecl.patch;striplevel=0 \
diff --git a/recipes/gcc/gcc-4.3.4.inc b/recipes/gcc/gcc-4.3.4.inc
index b8df9f0..5aef5e5 100644
--- a/recipes/gcc/gcc-4.3.4.inc
+++ b/recipes/gcc/gcc-4.3.4.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r11"
+INC_PR = "r12"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://fedora/gcc43-c++-builtin-redecl.patch;striplevel=0 \
diff --git a/recipes/gcc/gcc-4.4.1.inc b/recipes/gcc/gcc-4.4.1.inc
index 8cfb47f..acb5371 100644
--- a/recipes/gcc/gcc-4.4.1.inc
+++ b/recipes/gcc/gcc-4.4.1.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r10"
+INC_PR = "r11"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
         file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
diff --git a/recipes/gcc/gcc-4.4.2.inc b/recipes/gcc/gcc-4.4.2.inc
index 3bb9f53..42e8d54 100644
--- a/recipes/gcc/gcc-4.4.2.inc
+++ b/recipes/gcc/gcc-4.4.2.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r4"
+INC_PR = "r5"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
         file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
diff --git a/recipes/gcc/gcc-4.4.4.inc b/recipes/gcc/gcc-4.4.4.inc
index 51337e1..1bc7c12 100644
--- a/recipes/gcc/gcc-4.4.4.inc
+++ b/recipes/gcc/gcc-4.4.4.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r5"
+INC_PR = "r6"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=gcc444tarbz2 \
         file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
diff --git a/recipes/gcc/gcc-4.5.inc b/recipes/gcc/gcc-4.5.inc
index 08d7058..b7bd87b 100644
--- a/recipes/gcc/gcc-4.5.inc
+++ b/recipes/gcc/gcc-4.5.inc
@@ -8,7 +8,7 @@ DEPENDS = "mpfr gmp libmpc libelf"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native"
 
 
-INC_PR = "r8"
+INC_PR = "r9"
 
 SRCREV = "163322"
 PV = "4.5"
diff --git a/recipes/gcc/gcc-package-cross.inc b/recipes/gcc/gcc-package-cross.inc
index 0c4ea2d..59e7dde 100644
--- a/recipes/gcc/gcc-package-cross.inc
+++ b/recipes/gcc/gcc-package-cross.inc
@@ -2,6 +2,8 @@ PACKAGE_STRIP ?= ""
 OLD_PACKAGE_STRIP := "${PACKAGE_STRIP}"
 PACKAGE_STRIP = "no"
 
+SHLIBSDIR = "${STAGING_DIR_TARGET}/shlibs"
+
 PACKAGES = "libgcc libssp libstdc++ libg2c libgfortran"
 
 # Called from within gcc-cross, so libdir is set wrong
-- 
1.6.6.1



