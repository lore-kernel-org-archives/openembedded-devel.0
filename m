Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A0B0277EFE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2018 07:38:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w2S7cY59025180
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 Mar 2018 00:38:34 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 28 Mar 2018 00:38:34 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Mar 2018 03:38:18 -0400
Message-ID: <1522222698-33267-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] augeas: refresh patches
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Mar 2018 07:38:34 -0000
Content-Type: text/plain

Fixes:

WARNING: augeas-1.5.0-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to
incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch sepbuildfix.patch
patching file Makefile.am
Hunk #1 succeeded at 5 with fuzz 2.

Now at patch sepbuildfix.patch

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...need_charset_alias-when-building-for-musl.patch | 13 ++++++------
 .../augeas/add-missing-argz-conditional.patch      | 17 +++++++++++-----
 .../augeas/augeas/sepbuildfix.patch                | 23 +++++++++++++++-------
 3 files changed, 35 insertions(+), 18 deletions(-)

diff --git a/meta-oe/recipes-support/augeas/augeas/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta-oe/recipes-support/augeas/augeas/0001-Unset-need_charset_alias-when-building-for-musl.patch
index 9a19876..0ba7c76 100644
--- a/meta-oe/recipes-support/augeas/augeas/0001-Unset-need_charset_alias-when-building-for-musl.patch
+++ b/meta-oe/recipes-support/augeas/augeas/0001-Unset-need_charset_alias-when-building-for-musl.patch
@@ -1,4 +1,4 @@
-From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
+From 32b15332e2130a54b25f4fbf6f58b407b851dd8f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 13 Apr 2015 17:02:13 -0700
 Subject: [PATCH] Unset need_charset_alias when building for musl
@@ -11,14 +11,15 @@ coreutils
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
- lib/gnulib.mk | 2 +-
+ gnulib/lib/Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: augeas-1.2.0/gnulib/lib/Makefile.am
-===================================================================
---- augeas-1.2.0.orig/gnulib/lib/Makefile.am
-+++ augeas-1.2.0/gnulib/lib/Makefile.am
+diff --git a/gnulib/lib/Makefile.am b/gnulib/lib/Makefile.am
+index 963b22d..75788d2 100644
+--- a/gnulib/lib/Makefile.am
++++ b/gnulib/lib/Makefile.am
 @@ -463,7 +463,7 @@ install-exec-localcharset: all-local
  	  case '$(host_os)' in \
  	    darwin[56]*) \
diff --git a/meta-oe/recipes-support/augeas/augeas/add-missing-argz-conditional.patch b/meta-oe/recipes-support/augeas/augeas/add-missing-argz-conditional.patch
index abbdbaa..368bb41 100644
--- a/meta-oe/recipes-support/augeas/augeas/add-missing-argz-conditional.patch
+++ b/meta-oe/recipes-support/augeas/augeas/add-missing-argz-conditional.patch
@@ -1,14 +1,21 @@
-Add missing GL_GENERATE_ARGZ_H conditional
+From 9a6e6374da7d7056db0950f0f7d6b8b905009775 Mon Sep 17 00:00:00 2001
+From: Constantin Musca <constantinx.musca@intel.com>
+Date: Fri, 15 Jul 2016 10:04:48 +0300
+Subject: [PATCH] Add missing GL_GENERATE_ARGZ_H conditional
 
 - GL_GENERATE_ARGZ_H is used in gnulib/lib/Makefile.am
 
 Upstream-Status: Pending
 Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
 
-Index: augeas-1.0.0/configure.ac
-===================================================================
---- augeas-1.0.0.orig/configure.ac
-+++ augeas-1.0.0/configure.ac
+---
+ configure.ac | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 72b6984..fb9653e 100644
+--- a/configure.ac
++++ b/configure.ac
 @@ -55,6 +55,8 @@ AC_ARG_WITH([failmalloc],
  
  AM_CONDITIONAL([WITH_FAILMALLOC], [test x$with_failmalloc != xno])
diff --git a/meta-oe/recipes-support/augeas/augeas/sepbuildfix.patch b/meta-oe/recipes-support/augeas/augeas/sepbuildfix.patch
index b82a3ee..2b18618 100644
--- a/meta-oe/recipes-support/augeas/augeas/sepbuildfix.patch
+++ b/meta-oe/recipes-support/augeas/augeas/sepbuildfix.patch
@@ -1,15 +1,24 @@
-Ensure that builds in separate builddirs (${B} != ${S}) correctly install the 
+From 8a277957a2579e7149c1850675441b288192077c Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Fri, 15 Jul 2016 10:04:48 +0300
+Subject: [PATCH] augeas: fix separate builddirs
+
+Ensure that builds in separate builddirs (${B} != ${S}) correctly install the
 lenses files.
 
 Upstream-Status: Pending
 
 RP 2013/4/17
 
-Index: augeas-1.0.0/Makefile.am
-===================================================================
---- augeas-1.0.0.orig/Makefile.am	2012-11-02 15:20:11.000000000 +0000
-+++ augeas-1.0.0/Makefile.am	2013-04-17 10:36:24.033400125 +0000
-@@ -5,8 +5,8 @@
+---
+ Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 87d511a..7710b3b 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -5,8 +5,8 @@ ACLOCAL_AMFLAGS = -I gnulib/m4
  lensdir=$(datadir)/augeas/lenses/dist
  lenstestdir=$(datadir)/augeas/lenses/dist/tests
  
@@ -18,5 +27,5 @@ Index: augeas-1.0.0/Makefile.am
 +dist_lens_DATA=$(wildcard $(top_srcdir)/lenses/*.aug)
 +dist_lenstest_DATA=$(wildcard $(top_srcdir)lenses/tests/*.aug)
  
- EXTRA_DIST=augeas.spec build/aux/move-if-change Makefile.am HACKING
+ EXTRA_DIST=augeas.spec build/ac-aux/move-if-change Makefile.am HACKING.md
  
-- 
2.8.1


