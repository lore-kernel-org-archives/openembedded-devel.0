Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MM58s-0003B3-PD
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 21:06:50 +0200
Received: (qmail 31249 invoked by uid 813007); 1 Jul 2009 18:54:54 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Jul 2009 18:54:54 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jul 2009 20:54:54 +0200
Message-Id: <1246474496-16704-4-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <200907011818.18407.marcin@juszkiewicz.com.pl>
References: <200907011818.18407.marcin@juszkiewicz.com.pl>
Subject: [STABLE][PATCH 039/125] glibc/eglibc: remove calls to obsolete base_set_filespath()
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
X-List-Received-Date: Wed, 01 Jul 2009 19:06:51 -0000

From: Michael Smith <msmith@cbnco.com>

Some recipes can use the default FILESPATHPKG, others need to override.

Signed-off-by: Michael Smith <msmith@cbnco.com>
Acked-by: Tom Rini <trini@embeddedalley.com>
Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/eglibc/eglibc-initial.inc                |    1 -
 recipes/glibc/glibc-initial.inc                  |    2 +-
 recipes/glibc/glibc-initial_2.2.5.bb             |    1 -
 recipes/glibc/glibc-initial_2.3.2+cvs20040726.bb |    1 -
 recipes/glibc/glibc-initial_2.3.2.bb             |    1 -
 recipes/glibc/glibc-initial_2.3.6.bb             |    2 --
 recipes/glibc/glibc-initial_cvs.bb               |    3 ++-
 recipes/glibc/glibc_2.3.6.bb                     |    2 --
 recipes/glibc/glibc_2.7.bb                       |    2 +-
 9 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/recipes/eglibc/eglibc-initial.inc b/recipes/eglibc/eglibc-initial.inc
index 5fbb5db..7a5a7b2 100644
--- a/recipes/eglibc/eglibc-initial.inc
+++ b/recipes/eglibc/eglibc-initial.inc
@@ -1,7 +1,6 @@
 SECTION = "libs"
 DEPENDS = "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/eglibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
 
 PACKAGES = ""
 PACKAGES_DYNAMIC = ""
diff --git a/recipes/glibc/glibc-initial.inc b/recipes/glibc/glibc-initial.inc
index 5528cf8..cd65924 100644
--- a/recipes/glibc/glibc-initial.inc
+++ b/recipes/glibc/glibc-initial.inc
@@ -1,7 +1,7 @@
 SECTION = "libs"
 DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial linux-libc-headers"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/glibc-2.4', '${FILE_DIRNAME}/glibc-${PV}', '${FILE_DIRNAME}/glibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
+FILESPATHPKG =. "glibc-2.4:"
 
 PACKAGES = ""
 PACKAGES_DYNAMIC = ""
diff --git a/recipes/glibc/glibc-initial_2.2.5.bb b/recipes/glibc/glibc-initial_2.2.5.bb
index a2e6560..a703852 100644
--- a/recipes/glibc/glibc-initial_2.2.5.bb
+++ b/recipes/glibc/glibc-initial_2.2.5.bb
@@ -2,6 +2,5 @@ require glibc_${PV}.bb
 require glibc-initial.inc
 
 DEFAULT_PREFERENCE_sh3 = "-99"
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/glibc-${PV}', '${FILE_DIRNAME}/glibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
 
 PROVIDES_unslung = "virtual/${TARGET_PREFIX}libc-initial"
diff --git a/recipes/glibc/glibc-initial_2.3.2+cvs20040726.bb b/recipes/glibc/glibc-initial_2.3.2+cvs20040726.bb
index 4d7129b..c7dde23 100644
--- a/recipes/glibc/glibc-initial_2.3.2+cvs20040726.bb
+++ b/recipes/glibc/glibc-initial_2.3.2+cvs20040726.bb
@@ -2,4 +2,3 @@ require glibc_${PV}.bb
 require glibc-initial.inc
 
 DEFAULT_PREFERENCE_sh3 = "-99"
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/glibc-cvs', '${FILE_DIRNAME}/glibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
diff --git a/recipes/glibc/glibc-initial_2.3.2.bb b/recipes/glibc/glibc-initial_2.3.2.bb
index 84412bd..c7dde23 100644
--- a/recipes/glibc/glibc-initial_2.3.2.bb
+++ b/recipes/glibc/glibc-initial_2.3.2.bb
@@ -2,4 +2,3 @@ require glibc_${PV}.bb
 require glibc-initial.inc
 
 DEFAULT_PREFERENCE_sh3 = "-99"
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/glibc-${PV}', '${FILE_DIRNAME}/glibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
diff --git a/recipes/glibc/glibc-initial_2.3.6.bb b/recipes/glibc/glibc-initial_2.3.6.bb
index 8249cd6..fa7836a 100644
--- a/recipes/glibc/glibc-initial_2.3.6.bb
+++ b/recipes/glibc/glibc-initial_2.3.6.bb
@@ -1,4 +1,2 @@
 require glibc_${PV}.bb
 require glibc-initial.inc
-
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/glibc-${PV}', '${FILE_DIRNAME}/glibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
diff --git a/recipes/glibc/glibc-initial_cvs.bb b/recipes/glibc/glibc-initial_cvs.bb
index 81be5fc..0bfd665 100644
--- a/recipes/glibc/glibc-initial_cvs.bb
+++ b/recipes/glibc/glibc-initial_cvs.bb
@@ -1,4 +1,5 @@
 require glibc_${PV}.bb
 require glibc-initial.inc
 
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/glibc-cvs', '${FILE_DIRNAME}/glibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
+# glibc_cvs.bb overrides PV; glibc-cvs won't automatically be in FILESPATHPKG
+FILESPATHPKG =. "glibc-cvs:"
diff --git a/recipes/glibc/glibc_2.3.6.bb b/recipes/glibc/glibc_2.3.6.bb
index ab167da..8d64540 100644
--- a/recipes/glibc/glibc_2.3.6.bb
+++ b/recipes/glibc/glibc_2.3.6.bb
@@ -2,8 +2,6 @@ require glibc.inc
 
 PR = "r5"
 
-#FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/glibc-2.3.6', '${FILE_DIRNAME}/orig/glibc', '${FILE_DIRNAME}/orig/files', '${FILE_DIRNAME}/orig' ], d)}"
-
 GLIBC_ADDONS ?= "linuxthreads"
 
 #           ${CROSSTOOL_PATCH_URL}glibc-2.3.5-cygwin.patch;patch=1
diff --git a/recipes/glibc/glibc_2.7.bb b/recipes/glibc/glibc_2.7.bb
index ec4b347..d097cb9 100644
--- a/recipes/glibc/glibc_2.7.bb
+++ b/recipes/glibc/glibc_2.7.bb
@@ -12,7 +12,7 @@ BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${layout_includedir}"
 
 
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/glibc-2.4', '${FILE_DIRNAME}/glibc-${PV}', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
+FILESPATHPKG =. "glibc-2.4:"
 
 GLIBC_ADDONS ?= "ports,nptl,libidn"
 
-- 
1.6.3.1





