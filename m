Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PFh5n-0004aT-Gs
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Nov 2010 06:51:02 +0100
Received: by gwaa11 with SMTP id a11so4224573gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Nov 2010 21:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=mv1TLvUZ1r7155YgSgHV0W7X+Z0FPkKqDQnWmdrGryQ=;
	b=mdZud4J+/nf1EvS5jtI71uXa80m0dt7IS8cQOESsgacwdTFO2f6lD8JW+bGzogOjYj
	/DvJjzqKzm7YZkxCxfeyNVquJFHdOlTA9NvgRALddU/oZIZOfkmzCavnIx+4ejE2lOqV
	bQ+f2cS+G4RnnDX+nbRvpTcB6NNK8oVAb2R5A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=vuptgZCdb4CqVjTYkUbnY92oGto75UticitiuBegH0D0xZAv7tbml3C2wlr2anO9Re
	Mi7M+/ly9pHK1/Q+dm7G+L6xfKJN+fa/s8J1Hz9rJpEw2IQK0eLm5tiIvZO7yofZ/qXk
	YO8Bf8gQjDddT5YsvxYGjmXyYWziNR3+1Kxyo=
Received: by 10.151.110.2 with SMTP id n2mr2263946ybm.164.1289281352998;
	Mon, 08 Nov 2010 21:42:32 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id v39sm303434yba.7.2010.11.08.21.42.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 08 Nov 2010 21:42:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Nov 2010 21:42:10 -0800
Message-Id: <1289281330-6928-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gcc-configure-common.inc: sed <sysroot>/usr/include hardcodes paths to use target_includedir
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
X-List-Received-Date: Tue, 09 Nov 2010 05:51:02 -0000

This fixes the problem where gcc fails to detect presence of libssp
and does not detect powerpc long double 128 bit support correctly on systems which do
not use common <sysroot>/usr/include paths like we have in micro distro

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/gcc/gcc-4.1.0.inc            |    2 +-
 recipes/gcc/gcc-4.1.1.inc            |    2 +-
 recipes/gcc/gcc-4.1.2.inc            |    2 +-
 recipes/gcc/gcc-4.2.1.inc            |    2 +-
 recipes/gcc/gcc-4.2.2.inc            |    2 +-
 recipes/gcc/gcc-4.2.3.inc            |    2 +-
 recipes/gcc/gcc-4.2.4.inc            |    2 +-
 recipes/gcc/gcc-4.3.1.inc            |    2 +-
 recipes/gcc/gcc-4.3.2.inc            |    2 +-
 recipes/gcc/gcc-4.3.3.inc            |    2 +-
 recipes/gcc/gcc-4.3.4.inc            |    2 +-
 recipes/gcc/gcc-4.4.1.inc            |    2 +-
 recipes/gcc/gcc-4.4.2.inc            |    2 +-
 recipes/gcc/gcc-4.4.4.inc            |    2 +-
 recipes/gcc/gcc-4.5.inc              |    2 +-
 recipes/gcc/gcc-configure-common.inc |    9 ++++++++-
 16 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/recipes/gcc/gcc-4.1.0.inc b/recipes/gcc/gcc-4.1.0.inc
index 8da06aa..3df9976 100644
--- a/recipes/gcc/gcc-4.1.0.inc
+++ b/recipes/gcc/gcc-4.1.0.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-INC_PR = "r13"
+INC_PR = "r14"
 
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/recipes/gcc/gcc-4.1.1.inc b/recipes/gcc/gcc-4.1.1.inc
index c261138..ed6fc47 100644
--- a/recipes/gcc/gcc-4.1.1.inc
+++ b/recipes/gcc/gcc-4.1.1.inc
@@ -3,7 +3,7 @@ require gcc-common.inc
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r4"
+INC_PR = "r5"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://100-uclibc-conf.patch \
diff --git a/recipes/gcc/gcc-4.1.2.inc b/recipes/gcc/gcc-4.1.2.inc
index 114f053..7c699e1 100644
--- a/recipes/gcc/gcc-4.1.2.inc
+++ b/recipes/gcc/gcc-4.1.2.inc
@@ -5,7 +5,7 @@ NATIVEDEPS = "mpfr-native gmp-native"
 
 COMPATIBLE_TARGET_SYS = "."
 
-INC_PR = "r25"
+INC_PR = "r26"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://100-uclibc-conf.patch \
diff --git a/recipes/gcc/gcc-4.2.1.inc b/recipes/gcc/gcc-4.2.1.inc
index e5506c7..99644bd 100644
--- a/recipes/gcc/gcc-4.2.1.inc
+++ b/recipes/gcc/gcc-4.2.1.inc
@@ -3,7 +3,7 @@ require gcc-common.inc
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r23"
+INC_PR = "r24"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://100-uclibc-conf.patch \
diff --git a/recipes/gcc/gcc-4.2.2.inc b/recipes/gcc/gcc-4.2.2.inc
index a1f9cd3..bf31f78 100644
--- a/recipes/gcc/gcc-4.2.2.inc
+++ b/recipes/gcc/gcc-4.2.2.inc
@@ -4,7 +4,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r19"
+INC_PR = "r20"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://100-uclibc-conf.patch \
diff --git a/recipes/gcc/gcc-4.2.3.inc b/recipes/gcc/gcc-4.2.3.inc
index 988740e..267bc5d 100644
--- a/recipes/gcc/gcc-4.2.3.inc
+++ b/recipes/gcc/gcc-4.2.3.inc
@@ -4,7 +4,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r20"
+INC_PR = "r21"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://100-uclibc-conf.patch \
diff --git a/recipes/gcc/gcc-4.2.4.inc b/recipes/gcc/gcc-4.2.4.inc
index 974471e..97e1ddb 100644
--- a/recipes/gcc/gcc-4.2.4.inc
+++ b/recipes/gcc/gcc-4.2.4.inc
@@ -4,7 +4,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r14"
+INC_PR = "r15"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://100-uclibc-conf.patch \
diff --git a/recipes/gcc/gcc-4.3.1.inc b/recipes/gcc/gcc-4.3.1.inc
index 7829f23..19c0431 100644
--- a/recipes/gcc/gcc-4.3.1.inc
+++ b/recipes/gcc/gcc-4.3.1.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r24"
+INC_PR = "r25"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://fedora/gcc43-c++-builtin-redecl.patch;striplevel=0 \
diff --git a/recipes/gcc/gcc-4.3.2.inc b/recipes/gcc/gcc-4.3.2.inc
index aa9cd48..1091511 100644
--- a/recipes/gcc/gcc-4.3.2.inc
+++ b/recipes/gcc/gcc-4.3.2.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r14"
+INC_PR = "r15"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://fedora/gcc43-c++-builtin-redecl.patch;striplevel=0 \
diff --git a/recipes/gcc/gcc-4.3.3.inc b/recipes/gcc/gcc-4.3.3.inc
index 7239f82..58dd501 100644
--- a/recipes/gcc/gcc-4.3.3.inc
+++ b/recipes/gcc/gcc-4.3.3.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r19"
+INC_PR = "r20"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://fedora/gcc43-c++-builtin-redecl.patch;striplevel=0 \
diff --git a/recipes/gcc/gcc-4.3.4.inc b/recipes/gcc/gcc-4.3.4.inc
index 3f3809c..b582f72 100644
--- a/recipes/gcc/gcc-4.3.4.inc
+++ b/recipes/gcc/gcc-4.3.4.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r13"
+INC_PR = "r14"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://fedora/gcc43-c++-builtin-redecl.patch;striplevel=0 \
diff --git a/recipes/gcc/gcc-4.4.1.inc b/recipes/gcc/gcc-4.4.1.inc
index acb5371..b2204ba 100644
--- a/recipes/gcc/gcc-4.4.1.inc
+++ b/recipes/gcc/gcc-4.4.1.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r11"
+INC_PR = "r12"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
         file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
diff --git a/recipes/gcc/gcc-4.4.2.inc b/recipes/gcc/gcc-4.4.2.inc
index 42e8d54..469d407 100644
--- a/recipes/gcc/gcc-4.4.2.inc
+++ b/recipes/gcc/gcc-4.4.2.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r5"
+INC_PR = "r6"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
         file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
diff --git a/recipes/gcc/gcc-4.4.4.inc b/recipes/gcc/gcc-4.4.4.inc
index 1bc7c12..acee192 100644
--- a/recipes/gcc/gcc-4.4.4.inc
+++ b/recipes/gcc/gcc-4.4.4.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r6"
+INC_PR = "r7"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=gcc444tarbz2 \
         file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
diff --git a/recipes/gcc/gcc-4.5.inc b/recipes/gcc/gcc-4.5.inc
index 910be9c..c6a78ce 100644
--- a/recipes/gcc/gcc-4.5.inc
+++ b/recipes/gcc/gcc-4.5.inc
@@ -8,7 +8,7 @@ DEPENDS = "mpfr gmp libmpc libelf"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native"
 
 
-INC_PR = "r18"
+INC_PR = "r19"
 
 SRCREV = "166342"
 PV = "4.5"
diff --git a/recipes/gcc/gcc-configure-common.inc b/recipes/gcc/gcc-configure-common.inc
index fe0d32d..4d8edbc 100644
--- a/recipes/gcc/gcc-configure-common.inc
+++ b/recipes/gcc/gcc-configure-common.inc
@@ -93,7 +93,14 @@ do_configure () {
 	sed -i 's/^LDFLAGS = $/LDFLAGS = @LDFLAGS@/' ${S}/Makefile.tpl
 
 	(cd ${S} && gnu-configize) || die "failure running gnu-configize"
-
+	# gcc assumes ${sysroot}/usr to be prefix on linux targets
+	# but we have distro option to flatten out the tree and micro
+	# uses root file system without leading /usr so we need to
+	# teach gcc configure to look in correct include paths
+	# unfortunately there is no configure knob to indicate this
+	# to configury hence the sed :(
+	sed -i 's:/usr/include:${target_includedir}:g' ${S}/gcc/configure.ac
+	sed -i 's:/usr/include:${target_includedir}:g' ${S}/gcc/configure
 	if [ "${HOST_SYS}" != "${TARGET_SYS}" ]; then
 		# splice our idea of where the headers live into gcc's world
 		echo "NATIVE_SYSTEM_HEADER_DIR = ${target_includedir}" > ${T}/t-oe
-- 
1.7.1



