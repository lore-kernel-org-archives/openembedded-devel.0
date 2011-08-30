Received: from smarthost.techfak.uni-bielefeld.de ([129.70.137.17])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sherbrec@cit-ec.uni-bielefeld.de>)
	id 1QyPOK-000705-Dn for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 16:34:16 +0200
Received: from localhost.localdomain (hanuta.TechFak.Uni-Bielefeld.DE
	[129.70.129.229])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: sherbrec)
	by smarthost.TechFak.Uni-Bielefeld.DE (Postfix) with ESMTPSA id B6687A2;
	Tue, 30 Aug 2011 16:29:21 +0200 (CEST)
From: Stefan Herbrechtsmeier <sherbrec@cit-ec.uni-bielefeld.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Aug 2011 16:29:10 +0200
Message-Id: <1314714550-29390-1-git-send-email-sherbrec@cit-ec.uni-bielefeld.de>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] gcc: Remove package libstdc++-dev and libgcc-dev from gcc-cross
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
X-List-Received-Date: Tue, 30 Aug 2011 14:34:16 -0000

Remove package libstdc++-dev and libgcc-dev from gcc-cross as they
already provided by gcc.

Commit 8c42351519ece9ed60659a103e624d2e154b3641 add dev packages
(libstdc++-dev libgcc-dev) to gcc-cross (gcc-package-cross.inc)
which are already part of gcc. The libgcc-dev package both include
the libgcc_s.so file which triggers a 'file is already provided by
package' error on incremental builds. The libstdc++-dev package have
different content and is empty on some archs (armv5te, armv7e).
The empty package triggers a 'Cannot satisfy the following
dependencies for task-sdk-bare' error. If an empty libstdc++-dev
package is generated it triggers a '..../usr/include/c++ not exist'
error as this is part of the package from gcc but not gcc-cross.

Signed-off-by: Stefan Herbrechtsmeier <sherbrec@cit-ec.uni-bielefeld.de>
---
 recipes/gcc/gcc-4.3.3.inc         |    2 +-
 recipes/gcc/gcc-4.5.inc           |    2 +-
 recipes/gcc/gcc-package-cross.inc |    4 +---
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/recipes/gcc/gcc-4.3.3.inc b/recipes/gcc/gcc-4.3.3.inc
index 649fdfe..8b6ffe5 100644
--- a/recipes/gcc/gcc-4.3.3.inc
+++ b/recipes/gcc/gcc-4.3.3.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r23"
+INC_PR = "r24"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://fedora/gcc43-c++-builtin-redecl.patch;striplevel=0 \
diff --git a/recipes/gcc/gcc-4.5.inc b/recipes/gcc/gcc-4.5.inc
index 69229ef..2777dca 100644
--- a/recipes/gcc/gcc-4.5.inc
+++ b/recipes/gcc/gcc-4.5.inc
@@ -8,7 +8,7 @@ DEPENDS = "mpfr gmp libmpc libelf"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native"
 
 
-INC_PR = "r37"
+INC_PR = "r38"
 
 SRCREV = "170880"
 PV = "4.5"
diff --git a/recipes/gcc/gcc-package-cross.inc b/recipes/gcc/gcc-package-cross.inc
index 1533069..8d52b6f 100644
--- a/recipes/gcc/gcc-package-cross.inc
+++ b/recipes/gcc/gcc-package-cross.inc
@@ -4,7 +4,7 @@ PACKAGE_STRIP = "no"
 
 SHLIBSDIR = "${STAGING_DIR_TARGET}/shlibs"
 
-PACKAGES = "libgcc libssp libstdc++ libg2c libgfortran libstdc++-dev libgcc-dev"
+PACKAGES = "libgcc libssp libstdc++ libg2c libgfortran"
 
 # Called from within gcc-cross, so libdir is set wrong
 FILES_libg2c = "${target_libdir}/libg2c.so.*"
@@ -14,11 +14,9 @@ FILES_libssp = "${target_libdir}/libssp.so.*"
 FILES_libgfortran = "${target_libdir}/libgfortran.so.*"
 
 FILES_libgcc = "${target_base_libdir}/libgcc_s.so.1"
-FILES_libgcc-dev = "${target_libdir}/libgcc_s.so"
 
 FILES_libstdc++ = "${target_libdir}/libstdc++.so.*"
 
-FILES_libstdc++-dev = "${target_datadir}/gdb/auto-load/${libdir}/libstdc++.so.*-gdb.py*"
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install
 	install -d ${D}${target_base_libdir}
-- 
1.7.0.4



