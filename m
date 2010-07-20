Received: from mail.gmx.net ([213.165.64.20])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <afenkart@gmx.ch>) id 1ObAxJ-0005mk-Jz
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 13:25:50 +0200
Received: (qmail invoked by alias); 20 Jul 2010 11:25:39 -0000
Received: from 83-64-248-68.inzersdorf.xdsl-line.inode.at (EHLO localhost)
	[83.64.248.68]
	by mail.gmx.net (mp036) with SMTP; 20 Jul 2010 13:25:39 +0200
X-Authenticated: #20192376
X-Provags-ID: V01U2FsdGVkX187IlUGbo07ZpsWjiFl6jiQdYfguRDdxwkaMI/bSY
	uMsLRQ4FyDASy1
From: Andreas Fenkart <andreas.fenkart@streamunlimited.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Jul 2010 13:26:46 +0200
Message-Id: <1279625206-9173-1-git-send-email-andreas.fenkart@streamunlimited.com>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <20100720112607.GA9142@biggy>
References: <20100720112607.GA9142@biggy>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.20
X-SA-Exim-Mail-From: afenkart@gmx.ch
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: trini@embeddedalley.com
Subject: [PATCH 1/1] gcc-cross-sdk: fix C++ headers include, bump PR.
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
X-List-Received-Date: Tue, 20 Jul 2010 11:25:50 -0000

This is a follow up on commit:
gcc-cross-sdk: Fix relocation of the toolchain and bump PR.
sha1: f8bf7421bfe8eb86a3f17f269db4fb3667260c38

Signed-off-by: Andreas Fenkart <andreas.fenkart@streamunlimited.com>
---
 recipes/gcc/gcc-4.3.1.inc       |    2 +-
 recipes/gcc/gcc-4.3.2.inc       |    2 +-
 recipes/gcc/gcc-4.3.3.inc       |    2 +-
 recipes/gcc/gcc-4.3.4.inc       |    2 +-
 recipes/gcc/gcc-4.4.1.inc       |    2 +-
 recipes/gcc/gcc-4.4.2.inc       |    2 +-
 recipes/gcc/gcc-4.4.4.inc       |    2 +-
 recipes/gcc/gcc-package-sdk.inc |    2 +-
 recipes/meta/meta-toolchain.bb  |    2 --
 9 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/recipes/gcc/gcc-4.3.1.inc b/recipes/gcc/gcc-4.3.1.inc
index 3352868..c26f7aa 100644
--- a/recipes/gcc/gcc-4.3.1.inc
+++ b/recipes/gcc/gcc-4.3.1.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r20"
+INC_PR = "r21"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://fedora/gcc43-c++-builtin-redecl.patch;striplevel=0 \
diff --git a/recipes/gcc/gcc-4.3.2.inc b/recipes/gcc/gcc-4.3.2.inc
index 897d4f3..2424abe 100644
--- a/recipes/gcc/gcc-4.3.2.inc
+++ b/recipes/gcc/gcc-4.3.2.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r10"
+INC_PR = "r11"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://fedora/gcc43-c++-builtin-redecl.patch;striplevel=0 \
diff --git a/recipes/gcc/gcc-4.3.3.inc b/recipes/gcc/gcc-4.3.3.inc
index 77cd521..f530a6b 100644
--- a/recipes/gcc/gcc-4.3.3.inc
+++ b/recipes/gcc/gcc-4.3.3.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r12"
+INC_PR = "r13"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://fedora/gcc43-c++-builtin-redecl.patch;striplevel=0 \
diff --git a/recipes/gcc/gcc-4.3.4.inc b/recipes/gcc/gcc-4.3.4.inc
index 9711813..98823ff 100644
--- a/recipes/gcc/gcc-4.3.4.inc
+++ b/recipes/gcc/gcc-4.3.4.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r8"
+INC_PR = "r9"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://fedora/gcc43-c++-builtin-redecl.patch;striplevel=0 \
diff --git a/recipes/gcc/gcc-4.4.1.inc b/recipes/gcc/gcc-4.4.1.inc
index 11b1535..0a83a04 100644
--- a/recipes/gcc/gcc-4.4.1.inc
+++ b/recipes/gcc/gcc-4.4.1.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r8"
+INC_PR = "r9"
 
 FILESPATHPKG .= ":gcc-$PV"
 
diff --git a/recipes/gcc/gcc-4.4.2.inc b/recipes/gcc/gcc-4.4.2.inc
index 8d14c99..eeb4740 100644
--- a/recipes/gcc/gcc-4.4.2.inc
+++ b/recipes/gcc/gcc-4.4.2.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 FILESPATHPKG .= ":gcc-$PV"
 
diff --git a/recipes/gcc/gcc-4.4.4.inc b/recipes/gcc/gcc-4.4.4.inc
index 4dd1bf6..21ae530 100644
--- a/recipes/gcc/gcc-4.4.4.inc
+++ b/recipes/gcc/gcc-4.4.4.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 FILESPATHPKG .= ":gcc-$PV"
 
diff --git a/recipes/gcc/gcc-package-sdk.inc b/recipes/gcc/gcc-package-sdk.inc
index dd32ec7..17ddcd5 100644
--- a/recipes/gcc/gcc-package-sdk.inc
+++ b/recipes/gcc/gcc-package-sdk.inc
@@ -20,7 +20,7 @@ FILES_${PN} = "\
     ${includedir}/c++/${BINV} \
     ${prefix}/${TARGET_SYS}/bin/* \
     ${prefix}/${TARGET_SYS}/lib/* \
-    ${prefix}/${TARGET_SYS}/usr/include/* \
+    ${prefix}/${TARGET_SYS}/include/* \
     "
 FILES_${PN}-doc = "\
     ${infodir} \
diff --git a/recipes/meta/meta-toolchain.bb b/recipes/meta/meta-toolchain.bb
index adc057a..e392a35 100644
--- a/recipes/meta/meta-toolchain.bb
+++ b/recipes/meta/meta-toolchain.bb
@@ -124,8 +124,6 @@ do_populate_sdk() {
 	# With sysroot support, gcc expects the default C++ headers to be
 	# in a specific place.
 	install -d ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/include
-	mv ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/usr/include/c++ \
-		${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/include/
 
 	# Fix or remove broken .la files
 	for i in `find ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS} -name \*.la`; do
-- 
1.6.6.1



