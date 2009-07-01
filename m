Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MM58s-0003Ay-Ir
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 21:06:50 +0200
Received: (qmail 31221 invoked by uid 813007); 1 Jul 2009 18:54:54 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Jul 2009 18:54:54 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jul 2009 20:54:53 +0200
Message-Id: <1246474496-16704-3-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <200907011818.18407.marcin@juszkiewicz.com.pl>
References: <200907011818.18407.marcin@juszkiewicz.com.pl>
Subject: [STABLE][PATCH 038/125] uclibc: remove calls to obsolete base_set_filespath()
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
X-List-Received-Date: Wed, 01 Jul 2009 19:06:50 -0000

From: Michael Smith <msmith@cbnco.com>

Some recipes can use the default FILESPATHPKG, others need to override.

Signed-off-by: Michael Smith <msmith@cbnco.com>
Acked-by: Tom Rini <trini@embeddedalley.com>
Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/uclibc/bfin-uclibc_svn.bb         |    2 +-
 recipes/uclibc/uclibc-initial_0.9.26.bb   |    2 --
 recipes/uclibc/uclibc-initial_0.9.27.bb   |    2 --
 recipes/uclibc/uclibc-initial_0.9.28.bb   |    2 --
 recipes/uclibc/uclibc-initial_0.9.29.bb   |    2 --
 recipes/uclibc/uclibc-initial_0.9.30.1.bb |    2 --
 recipes/uclibc/uclibc-initial_0.9.30.bb   |    2 --
 recipes/uclibc/uclibc_nptl.bb             |    2 +-
 recipes/uclibc/uclibc_svn.bb              |    2 +-
 9 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/recipes/uclibc/bfin-uclibc_svn.bb b/recipes/uclibc/bfin-uclibc_svn.bb
index 9b438a2..9305245 100644
--- a/recipes/uclibc/bfin-uclibc_svn.bb
+++ b/recipes/uclibc/bfin-uclibc_svn.bb
@@ -25,7 +25,7 @@ KERNEL_SOURCE = "${CROSS_DIR}/${TARGET_SYS}"
 SRC_URI = "svn://sources.blackfin.uclinux.org/toolchain/trunk;module=uClibc "
 SRC_URI += "file://uClibc.machine file://uClibc.distro"
 
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-${UCLIBC_BASE}', '${FILE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
+FILESPATHPKG =. "uclibc-${UCLIBC_BASE}:uclibc:"
 
 
 S = "${WORKDIR}/uClibc"
diff --git a/recipes/uclibc/uclibc-initial_0.9.26.bb b/recipes/uclibc/uclibc-initial_0.9.26.bb
index a6a83bd..d36a647 100644
--- a/recipes/uclibc/uclibc-initial_0.9.26.bb
+++ b/recipes/uclibc/uclibc-initial_0.9.26.bb
@@ -1,8 +1,6 @@
 SECTION = "base"
 require uclibc_${PV}.bb
 
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-${PV}', '${FILE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
-
 DEPENDS = "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
 PACKAGES = ""
diff --git a/recipes/uclibc/uclibc-initial_0.9.27.bb b/recipes/uclibc/uclibc-initial_0.9.27.bb
index 3aecd80..f48e81d 100644
--- a/recipes/uclibc/uclibc-initial_0.9.27.bb
+++ b/recipes/uclibc/uclibc-initial_0.9.27.bb
@@ -1,8 +1,6 @@
 SECTION = "base"
 require uclibc_${PV}.bb
 
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-${PV}', '${FILE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
-
 DEPENDS = "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
 PACKAGES = ""
diff --git a/recipes/uclibc/uclibc-initial_0.9.28.bb b/recipes/uclibc/uclibc-initial_0.9.28.bb
index b996f64..dbd90fc 100644
--- a/recipes/uclibc/uclibc-initial_0.9.28.bb
+++ b/recipes/uclibc/uclibc-initial_0.9.28.bb
@@ -1,8 +1,6 @@
 SECTION = "base"
 require uclibc_${PV}.bb
 
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-${PV}', '${FILE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
-
 DEPENDS = "linux-libc-headers ncurses-native virtual/${TARGET_PREFIX}gcc-initial"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
 PACKAGES = ""
diff --git a/recipes/uclibc/uclibc-initial_0.9.29.bb b/recipes/uclibc/uclibc-initial_0.9.29.bb
index c56e5fb..98ef7b2 100644
--- a/recipes/uclibc/uclibc-initial_0.9.29.bb
+++ b/recipes/uclibc/uclibc-initial_0.9.29.bb
@@ -1,8 +1,6 @@
 SECTION = "base"
 require uclibc_${PV}.bb
 
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-${PV}', '${FILE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
-
 DEPENDS = "linux-libc-headers ncurses-native virtual/${TARGET_PREFIX}gcc-initial"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
 PACKAGES = ""
diff --git a/recipes/uclibc/uclibc-initial_0.9.30.1.bb b/recipes/uclibc/uclibc-initial_0.9.30.1.bb
index c56e5fb..98ef7b2 100644
--- a/recipes/uclibc/uclibc-initial_0.9.30.1.bb
+++ b/recipes/uclibc/uclibc-initial_0.9.30.1.bb
@@ -1,8 +1,6 @@
 SECTION = "base"
 require uclibc_${PV}.bb
 
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-${PV}', '${FILE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
-
 DEPENDS = "linux-libc-headers ncurses-native virtual/${TARGET_PREFIX}gcc-initial"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
 PACKAGES = ""
diff --git a/recipes/uclibc/uclibc-initial_0.9.30.bb b/recipes/uclibc/uclibc-initial_0.9.30.bb
index c56e5fb..98ef7b2 100644
--- a/recipes/uclibc/uclibc-initial_0.9.30.bb
+++ b/recipes/uclibc/uclibc-initial_0.9.30.bb
@@ -1,8 +1,6 @@
 SECTION = "base"
 require uclibc_${PV}.bb
 
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-${PV}', '${FILE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
-
 DEPENDS = "linux-libc-headers ncurses-native virtual/${TARGET_PREFIX}gcc-initial"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
 PACKAGES = ""
diff --git a/recipes/uclibc/uclibc_nptl.bb b/recipes/uclibc/uclibc_nptl.bb
index 7b3ef15..6dcda3b 100644
--- a/recipes/uclibc/uclibc_nptl.bb
+++ b/recipes/uclibc/uclibc_nptl.bb
@@ -19,7 +19,7 @@ PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
 
 #recent versions uclibc require real kernel headers
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-nptl', '${FILE_DIRNAME}/uclibc-${UCLIBC_BASE}', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
+FILESPATHPKG =. "uclibc-nptl:uclibc-${UCLIBC_BASE}:"
 
 #as stated above, uclibc needs real kernel-headers
 #however: we can't depend on virtual/kernel when nptl hits due to depends deadlocking ....
diff --git a/recipes/uclibc/uclibc_svn.bb b/recipes/uclibc/uclibc_svn.bb
index 654cb6e..121e5c5 100644
--- a/recipes/uclibc/uclibc_svn.bb
+++ b/recipes/uclibc/uclibc_svn.bb
@@ -19,7 +19,7 @@ PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
 
 #recent versions uclibc require real kernel headers
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-svn', '${FILE_DIRNAME}/uclibc-${UCLIBC_BASE}', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
+FILESPATHPKG =. "uclibc-svn:uclibc-${UCLIBC_BASE}:"
 
 #as stated above, uclibc needs real kernel-headers
 #however: we can't depend on virtual/kernel when nptl hits due to depends deadlocking ....
-- 
1.6.3.1





