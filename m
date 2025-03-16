Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA47C35FF3
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 21:27:04 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.38233.1742160419728921421
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Mar 2025 14:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J9v1IYcu;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-223fd89d036so72175935ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Mar 2025 14:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742160419; x=1742765219; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9iKHdRuAhyZZdBEUYGfkmva1oOK7IcJ4L1DR34aWZzE=;
        b=J9v1IYcu0WbD51FxXK+LIk+Vnod5WG9ilH/BvhChuUTdetTNcNs5wz6QtiIf5VdOG4
         njELdG769TrArnQeNOTWD3a2XXNSJ2uBCgZ/nqRg3ZDNyO+HIFNp7ko0kjGBRUoGtnJ+
         +sNPqm1PkUKYh7cYyaPUQNuoMUylKEShWCBJm3B/pnAKuTi8GgFrFJDn11dsgsXJcDBw
         tf/nExdfZR1YvE+YEmnVh7c7LDsX+c/2ZXTRFBsRx0rgbZ5PyXIyQ983OSNTAKJ2dmHz
         66aZYcHEkjFuiK/r2XfVRuaViqTLTpAcc7J0JAcTYxFsDZtQZ9IlFVmWOJrNyabvqSvL
         Xn3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742160419; x=1742765219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9iKHdRuAhyZZdBEUYGfkmva1oOK7IcJ4L1DR34aWZzE=;
        b=AQTjX7HNT2PtWxDkt+zPAF5OB+iMWpBPaz5HCNoCy5sk5QHV1x1I9+dKzVVRnJeiAX
         fBWaR/N8I6Q2Hn5CSCIz5GSoYdhmtYRIphCCZfbLUIzdH7rqCNXkvQK6dvbV9h2AjaT7
         +BbBkQblOQR8B8mCWMMT0Tb47znIao/znbUI6M+u6QPD0wcKKYbWRERXKpzDJZgR/uxk
         tyqg61Ylc+6ygg3a8ZhhQDAuJ8ffqn+6lD4q1HSfCtywx5FwSZUnl4HFCycpUprZ/ZbV
         2AgngvfKn9FolSdzPxmBmm/XF8Ov+wUWM1oz7/7Q5s57/CRqZpdj7TNoDmb0BrI41qMs
         pxZw==
X-Gm-Message-State: AOJu0YxeWxBxxFdD4i2bJ4gI594zrEbfz+eNLmI50hYsDYwc9nBofyjW
	Y6mY/62vvlvhWWIYSoopuZefOtKps/cXgqHqWBKGBcO6gxxNGdXJynHDr/p5
X-Gm-Gg: ASbGnct7C9Z9tGThKONN80DvYzL+KB3uBxGPVoz57bk/N/RmIxvRcZ3CIRQfjqT7Sq4
	NPZTPjU1LB8dWzOIV6leRFLp/MdZc9lCuYP6XdKQy7XLeHwUdvlfGedU2vfCkp+G+rbkoNooAb6
	Ts2He6P10t3cLFovorsjbajJZ7UT7SuM47hA+vWpFFImKfm/i0IW7f6DeP57LwNzpKiS48WFVMt
	hk/RvJcdmTOCYFNDemi7QTpQqQVvFIg6O5erZIQK0TVADMX/Ty09hYPq1ImH69Zo3pPORr8Azt9
	y+KDDja6L3G8Rh+/o5j0lsE00tn5aSW0d2kj
X-Google-Smtp-Source: AGHT+IGb2yeFJy+GZ3HZzYMgKYNWbp9xa9oVY29fsNj0aftKMRRsYA7yUL4cgQ3FqXAUVke8U4EZyA==
X-Received: by 2002:a17:902:f2d2:b0:224:10b9:357a with SMTP id d9443c01a7336-225e0af9ffemr98856295ad.32.1742160418765;
        Sun, 16 Mar 2025 14:26:58 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a4063sm62071105ad.65.2025.03.16.14.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 14:26:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/4] enca: Fix cross builds
Date: Sun, 16 Mar 2025 14:26:53 -0700
Message-ID: <20250316212656.3179516-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Mar 2025 21:27:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116002

Some portions are built using host CC, which
is important when doing cross compile to pass correct flags
otherwise it fails when using newer host compiler e.g. gcc-14

Signed-off-by: Khem Raj <raj.khem@gmail.com>
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

