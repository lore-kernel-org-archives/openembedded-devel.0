Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4623FCAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 03:59:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by mx.groups.io with SMTP id smtpd.web10.4828.1758686369007389432
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 20:59:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Gj57pEv8;
 spf=pass (domain: intel.com, ip: 192.198.163.13, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758686369; x=1790222369;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vQh0OhtiyQi0MsRpUtqbJjqK8qs5itpuNxCdc3NuC2o=;
  b=Gj57pEv8VXCV8zGan3nQ64g8Nghkk2IGdbL5WASo55iD6wWTIAKu13bL
   IpA+cc9wDy4xGELMxHkOEzs6zdu/BJDpFPGh97fUcwW67phM9/Kkdxq7w
   BhbVS5yRAB/dQRUgsPH3xqPXr8aDmZ2qwLAqHsobsezYTyG4ubIIacVPs
   DTY0v7IFiJ8aMR+Shit/rdh/lcR2R4npGi1apncnbm5LYsvQ72G7Tsq4a
   YTwfqRxJQgRZzHlSjmHk8K79VJQ18PHHA/5hZb9pH/ecdT+Iesde3lY6b
   UiOtldrfNNa/XhnGcbP4y4C9tXcaL2InTzmiaDE8ZxHBsEaR894qR071O
   A==;
X-CSE-ConnectionGUID: EYqwvXl/QrOMxXOaa3hqjA==
X-CSE-MsgGUID: N5LLBaSPT0WHkRynN9V/cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="63602888"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="63602888"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 20:59:28 -0700
X-CSE-ConnectionGUID: Mm71ZtiASVWgmghUf3+rQw==
X-CSE-MsgGUID: Fm9IMDhrSTC7wGKtQHFJOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="176873665"
Received: from unknown (HELO anmitta2-mobl4.png.intel.com) ([10.107.11.67])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 20:59:27 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 1/8] enca: Fix cross builds
Date: Wed, 24 Sep 2025 11:59:16 +0800
Message-ID: <20250924035923.35477-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 03:59:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119741

From: Khem Raj <raj.khem@gmail.com>

Some portions are built using host CC, which
is important when doing cross compile to pass correct flags
otherwise it fails when using newer host compiler e.g. gcc-14

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 32eb26264323888e77154c2aeadc9994a4a54d5d)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta-oe/recipes-support/enca/enca/cross.patch | 68 +++++++++++++++++++
 .../enca/enca/makefile-remove-tools.patch     | 14 ----
 meta-oe/recipes-support/enca/enca_1.19.bb     | 24 ++-----
 3 files changed, 73 insertions(+), 33 deletions(-)
 create mode 100644 meta-oe/recipes-support/enca/enca/cross.patch
 delete mode 100644 meta-oe/recipes-support/enca/enca/makefile-remove-tools.patch

diff --git a/meta-oe/recipes-support/enca/enca/cross.patch b/meta-oe/recipes-support/enca/enca/cross.patch
new file mode 100644
index 0000000000..7749dee088
--- /dev/null
+++ b/meta-oe/recipes-support/enca/enca/cross.patch
@@ -0,0 +1,68 @@
+From: Helmut Grohne <helmut@subdivi.de>
+Subject: build make_hash with the build arch compiler
+
+Also note that we cannot include config.h in make_hash.c, because it is
+specific to the host architecture.
+
+Sourced from debian - https://salsa.debian.org/debian/enca/-/blob/master/debian/patches/cross.patch?ref_type=heads
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: enca-1.19/configure.ac
+===================================================================
+--- enca-1.19.orig/configure.ac
++++ enca-1.19/configure.ac
+@@ -35,6 +35,7 @@
+ dnl Checks for programs.
+ AC_PROG_AWK
+ AC_PROG_CC
++AX_PROG_CC_FOR_BUILD
+ AC_GNU_SOURCE
+ AC_AIX
+ AC_ISC_POSIX
+Index: enca-1.19/tools/Makefile.am
+===================================================================
+--- enca-1.19.orig/tools/Makefile.am
++++ enca-1.19/tools/Makefile.am
+@@ -2,7 +2,8 @@
+ noinst_HEADERS = encodings.h
+ noinst_SCRIPTS = expand_table.pl
+ 
+-make_hash_SOURCES = make_hash.c
++make_hash$(EXEEXT): make_hash.c
++	$(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) -o $@ $<
+ 
+ BUILT_SOURCES = $(noinst_HEADERS)
+ 
+Index: enca-1.19/tools/make_hash.c
+===================================================================
+--- enca-1.19.orig/tools/make_hash.c
++++ enca-1.19/tools/make_hash.c
+@@ -17,25 +17,9 @@
+   with this program; if not, write to the Free Software Foundation, Inc.,
+   59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
+ */
+-#ifdef HAVE_CONFIG_H
+-#  include "config.h"
+-#endif /* HAVE_CONFIG_H */
+-
+ #include <stdlib.h>
+ #include <stdio.h>
+-
+-#ifdef HAVE_STRING_H
+-#  include <string.h>
+-#else /* HAVE_STRING_H */
+-#  ifdef HAVE_STRINGS_H
+-#    include <strings.h>
+-#  endif /* HAVE_STRINGS_H */
+-#endif /* HAVE_STRING_H */
+-
+-#ifdef HAVE_MEMORY_H
+-#  include <memory.h>
+-#endif /* HAVE_MEMORY_H */
+-
++#include <string.h>
+ #include <unistd.h>
+ #include <ctype.h>
+ 
diff --git a/meta-oe/recipes-support/enca/enca/makefile-remove-tools.patch b/meta-oe/recipes-support/enca/enca/makefile-remove-tools.patch
deleted file mode 100644
index 756745d839..0000000000
--- a/meta-oe/recipes-support/enca/enca/makefile-remove-tools.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Pending
-
---- enca-1.19/Makefile.am.orig	2006-06-29 15:34:55.000000000 +0100
-+++ enca-1.19/Makefile.am	2006-06-29 15:35:20.000000000 +0100
-@@ -1,7 +1,7 @@
- if MAINTAINER_MODE
--SUBDIRS = tools data script lib src devel-docs test
-+SUBDIRS = data script lib src devel-docs test
- else
--SUBDIRS = tools script lib src devel-docs
-+SUBDIRS = script lib src devel-docs
- endif
- man_MANS = man/enca.1
- 
diff --git a/meta-oe/recipes-support/enca/enca_1.19.bb b/meta-oe/recipes-support/enca/enca_1.19.bb
index 774f05f7c4..61da50ba52 100644
--- a/meta-oe/recipes-support/enca/enca_1.19.bb
+++ b/meta-oe/recipes-support/enca/enca_1.19.bb
@@ -2,33 +2,19 @@ SUMMARY = "Enca is an Extremely Naive Charset Analyser"
 SECTION = "libs"
 HOMEPAGE = "https://cihar.com/software/enca/"
 
-DEPENDS += "gettext-native"
+DEPENDS += "gettext-native autoconf-archive-native"
 
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=24b9569831c46d4818450b55282476b4"
 
 SRC_URI = "https://dl.cihar.com/enca/enca-${PV}.tar.gz \
+    file://cross.patch \
     file://dont-run-tests.patch \
-    file://makefile-remove-tools.patch \
     file://libenca-003-iconv.patch \
-    file://0001-Do-not-use-MKTEMP_PROG-in-cross-build.patch"
+    file://0001-Do-not-use-MKTEMP_PROG-in-cross-build.patch \
+    "
 SRC_URI[sha256sum] = "4c305cc59f3e57f2cfc150a6ac511690f43633595760e1cb266bf23362d72f8a"
 
 inherit autotools
 
-do_configure:prepend() {
-    # remove failing test which checks for something that isn't even used
-    sed -i -e '/ye_FUNC_SCANF_MODIF_SIZE_T/d' ${S}/configure.ac
-}
-
-do_configure:append() {
-    sed -i s:-I/usr/include::g ${B}/Makefile
-    sed -i s:-I/usr/include::g ${B}/*/Makefile
-}
-
-do_compile() {
-    cd ${S}/tools && ${BUILD_CC} -o make_hash make_hash.c
-    cd ${B}
-    oe_runmake
-}
-
+EXTRA_OECONF += "MKTEMP_PROG=mktemp"

