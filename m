Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1M8qNM-0001r1-LJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 May 2009 08:43:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 354D04C012B;
	Tue, 26 May 2009 02:35:00 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 08298-10; Tue, 26 May 2009 02:35:00 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 12D174C0120; Tue, 26 May 2009 02:34:59 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00,
	UPPERCASE_25_50 autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id C4B7D4C0120;
	Tue, 26 May 2009 02:34:56 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id D39941AC4C1; Tue, 26 May 2009 02:34:56 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 May 2009 02:34:56 -0400
Message-Id: <1243319696-16223-4-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1243319696-16223-3-git-send-email-msmith@cbnco.com>
References: <Pine.LNX.4.64.0905260228240.6446@juice.ott.cti.com>
	<1243319696-16223-1-git-send-email-msmith@cbnco.com>
	<1243319696-16223-2-git-send-email-msmith@cbnco.com>
	<1243319696-16223-3-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH 4/4] uclibc: remove calls to obsolete base_set_filespath()
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
X-List-Received-Date: Tue, 26 May 2009 06:43:05 -0000

Some recipes can use the default FILESPATHPKG, others need to override.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---

All untested.

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
index 18c88c8..ba46a50 100644
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
index 127cea7..d3f0973 100644
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
1.5.6.5



