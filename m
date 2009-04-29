Received: from [194.100.97.46] (helo=mail.inoi.fi)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <petri.lehtinen+openembedded-devel@inoi.fi>)
	id 1Lz5uN-0003C7-Dc for openembedded-devel@lists.openembedded.org;
	Wed, 29 Apr 2009 11:16:51 +0200
Received: from mail.inoi.fi (localhost.localdomain [127.0.0.1])
	by mail.inoi.fi (Postfix) with ESMTP id 04E532127E;
	Wed, 29 Apr 2009 11:59:26 +0300 (EEST)
Received: from localhost.localdomain (unknown [10.105.0.205])
	by mail.inoi.fi (Postfix) with ESMTP id DFCA820794;
	Wed, 29 Apr 2009 11:59:25 +0300 (EEST)
From: Petri Lehtinen <petri.lehtinen+openembedded-devel@inoi.fi>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Apr 2009 12:11:36 +0300
Message-Id: <1240996296-20550-1-git-send-email-petri.lehtinen+openembedded-devel@inoi.fi>
X-Mailer: git-send-email 1.6.0.4
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Petri Lehtinen <petri.lehtinen@inoi.fi>
Subject: [PATCH] uclibc-initial: Fix FILESPATH mangling in all versions
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
X-List-Received-Date: Wed, 29 Apr 2009 09:16:51 -0000

From: Petri Lehtinen <petri.lehtinen@inoi.fi>

Make uclibc-initial use uclibc FILESPATH by setting correct
FILESPATHPKG instead of altering FILESPATH directly via
base_set_filespath.

This makes it possible to provide custom
uClibc.{config,machine,distro} in an overlay, for example.

Signed-off-by: Petri Lehtinen <petri.lehtinen@inoi.fi>
---
 recipes/uclibc/uclibc-initial_0.9.26.bb   |    2 +-
 recipes/uclibc/uclibc-initial_0.9.27.bb   |    2 +-
 recipes/uclibc/uclibc-initial_0.9.28.bb   |    2 +-
 recipes/uclibc/uclibc-initial_0.9.29.bb   |    2 +-
 recipes/uclibc/uclibc-initial_0.9.30.1.bb |    2 +-
 recipes/uclibc/uclibc-initial_0.9.30.bb   |    2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes/uclibc/uclibc-initial_0.9.26.bb b/recipes/uclibc/uclibc-initial_0.9.26.bb
index a6a83bd..8600549 100644
--- a/recipes/uclibc/uclibc-initial_0.9.26.bb
+++ b/recipes/uclibc/uclibc-initial_0.9.26.bb
@@ -1,7 +1,7 @@
 SECTION = "base"
 require uclibc_${PV}.bb
 
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-${PV}', '${FILE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
+FILESPATHPKG = "uclibc-${PV}:uclibc:files:."
 
 DEPENDS = "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
diff --git a/recipes/uclibc/uclibc-initial_0.9.27.bb b/recipes/uclibc/uclibc-initial_0.9.27.bb
index 3aecd80..fdb3936 100644
--- a/recipes/uclibc/uclibc-initial_0.9.27.bb
+++ b/recipes/uclibc/uclibc-initial_0.9.27.bb
@@ -1,7 +1,7 @@
 SECTION = "base"
 require uclibc_${PV}.bb
 
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-${PV}', '${FILE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
+FILESPATHPKG = "uclibc-${PV}:uclibc:files:."
 
 DEPENDS = "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
diff --git a/recipes/uclibc/uclibc-initial_0.9.28.bb b/recipes/uclibc/uclibc-initial_0.9.28.bb
index b996f64..ee95af7 100644
--- a/recipes/uclibc/uclibc-initial_0.9.28.bb
+++ b/recipes/uclibc/uclibc-initial_0.9.28.bb
@@ -1,7 +1,7 @@
 SECTION = "base"
 require uclibc_${PV}.bb
 
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-${PV}', '${FILE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
+FILESPATHPKG = "uclibc-${PV}:uclibc:files:."
 
 DEPENDS = "linux-libc-headers ncurses-native virtual/${TARGET_PREFIX}gcc-initial"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
diff --git a/recipes/uclibc/uclibc-initial_0.9.29.bb b/recipes/uclibc/uclibc-initial_0.9.29.bb
index c56e5fb..a7d140c 100644
--- a/recipes/uclibc/uclibc-initial_0.9.29.bb
+++ b/recipes/uclibc/uclibc-initial_0.9.29.bb
@@ -1,7 +1,7 @@
 SECTION = "base"
 require uclibc_${PV}.bb
 
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-${PV}', '${FILE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
+FILESPATHPKG = "uclibc-${PV}:uclibc:files:."
 
 DEPENDS = "linux-libc-headers ncurses-native virtual/${TARGET_PREFIX}gcc-initial"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
diff --git a/recipes/uclibc/uclibc-initial_0.9.30.1.bb b/recipes/uclibc/uclibc-initial_0.9.30.1.bb
index c56e5fb..a7d140c 100644
--- a/recipes/uclibc/uclibc-initial_0.9.30.1.bb
+++ b/recipes/uclibc/uclibc-initial_0.9.30.1.bb
@@ -1,7 +1,7 @@
 SECTION = "base"
 require uclibc_${PV}.bb
 
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-${PV}', '${FILE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
+FILESPATHPKG = "uclibc-${PV}:uclibc:files:."
 
 DEPENDS = "linux-libc-headers ncurses-native virtual/${TARGET_PREFIX}gcc-initial"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
diff --git a/recipes/uclibc/uclibc-initial_0.9.30.bb b/recipes/uclibc/uclibc-initial_0.9.30.bb
index c56e5fb..a7d140c 100644
--- a/recipes/uclibc/uclibc-initial_0.9.30.bb
+++ b/recipes/uclibc/uclibc-initial_0.9.30.bb
@@ -1,7 +1,7 @@
 SECTION = "base"
 require uclibc_${PV}.bb
 
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-${PV}', '${FILE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
+FILESPATHPKG = "uclibc-${PV}:uclibc:files:."
 
 DEPENDS = "linux-libc-headers ncurses-native virtual/${TARGET_PREFIX}gcc-initial"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
-- 
1.6.0.4



