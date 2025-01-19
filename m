Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D14C2C02183
	for <webhook@archiver.kernel.org>; Sun, 19 Jan 2025 14:03:55 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web11.15543.1737295431712154162
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Jan 2025 06:03:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=PI0xIXYH;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202501191403486528d030479dd5e9b0-llkc10@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202501191403486528d030479dd5e9b0
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 19 Jan 2025 15:03:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Zt1d8h4hExuAhMZE7QzhOQu5h1sbFWq2CfRS90nnE0U=;
 b=PI0xIXYHMIiMiIssq8Vpx0pAu53sEKG87Jyq/zRmQ+G7lM02vpM+3J/M2B/A5GmUD7Tok2
 jfeN6KVqUmjd8Smdf6nk3gx7QVQlKXzFSkzcQsNqta8xM1d4z2+Od2C0MbZrZqQhXZpgP0ZE
 LUrFd6dUsmkLHmAtVIHrZ8Ce9/bbx1NJQuW+ohrEJ7BA48iKqF2vOy+WkEuf2LLGw6rNApTA
 j0OWAYBruiLdBBp7Iv/L9u4dI/Zm4GFD8zkPiLi7Zwj9nkwK189giwWL0KZPPH0Gs3qa02TT
 wu+MIUt9/7hVhu0tOGqFJ7gBqCprzEJ7Ba24zNfhYMG8trK1g0/s++xA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] yasm: update to latest git revision
Date: Sun, 19 Jan 2025 15:02:54 +0100
Message-Id: <20250119140254.2574108-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Jan 2025 14:03:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114956

From: Peter Marko <peter.marko@siemens.com>

Last tag is from 2014, but bugfixing continued and last commit is from
year 2024. Additional 87 commits are present, mostly bugfixes.

PV already has "+git" although it was exactly on tag, no edit needed.

Drop 3 patches which are included in current git version.
Add CVE_STATUS for 2 CVEs from those patches.

Also mark one additional CVE as fixed: CVE-2021-33454.
Stack trace from https://github.com/yasm/yasm/issues/166
References the same line of code as corrected in
https://github.com/yasm/yasm/pull/244

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../yasm/0001-Do-not-use-AC_HEADER_STDC.patch | 39 ------------------
 .../yasm/yasm/CVE-2023-31975.patch            | 29 -------------
 .../yasm/yasm/CVE-2023-37732.patch            | 41 -------------------
 meta-oe/recipes-devtools/yasm/yasm_git.bb     | 10 ++---
 4 files changed, 5 insertions(+), 114 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/yasm/yasm/0001-Do-not-use-AC_HEADER_STDC.patch
 delete mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2023-31975.patch
 delete mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2023-37732.patch

diff --git a/meta-oe/recipes-devtools/yasm/yasm/0001-Do-not-use-AC_HEADER_STDC.patch b/meta-oe/recipes-devtools/yasm/yasm/0001-Do-not-use-AC_HEADER_STDC.patch
deleted file mode 100644
index bda90edb20..0000000000
--- a/meta-oe/recipes-devtools/yasm/yasm/0001-Do-not-use-AC_HEADER_STDC.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 6b1cbe8b4dcc45103d69bc7337e5eb33d1fd21f3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 3 Feb 2021 14:22:51 -0800
-Subject: [PATCH] Do not use AC_HEADER_STDC
-
-This macro is removed in autotools 2.70+ and it can be expected that C90
-headers are always available [1]
-
-Upstream-Status: Pending
-
-[1] https://www.gnu.org/software/autoconf/manual/autoconf-2.70/autoconf.html#index-AC_005fHEADER_005fSTDC
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 6 ------
- 1 file changed, 6 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 01b61097..2823ecd7 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -101,14 +101,8 @@ AM_WITH_DMALLOC
- #
- # Checks for header files.
- #
--AC_HEADER_STDC
- AC_CHECK_HEADERS([strings.h libgen.h unistd.h direct.h sys/stat.h])
- 
--# REQUIRE standard C headers
--if test "$ac_cv_header_stdc" != yes; then
--	AC_MSG_ERROR([Standard (ANSI/ISO C89) header files are required.])
--fi
--
- #
- # Checks for typedefs, structures, and compiler characteristics.
- #
--- 
-2.30.0
-
diff --git a/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-31975.patch b/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-31975.patch
deleted file mode 100644
index ae10e99c2f..0000000000
--- a/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-31975.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From b2cc5a1693b17ac415df76d0795b15994c106441 Mon Sep 17 00:00:00 2001
-From: Katsuhiko Gondow <gondow@cs.titech.ac.jp>
-Date: Tue, 13 Jun 2023 05:00:47 +0900
-Subject: [PATCH] Fix memory leak in bin-objfmt (#231)
-
-Upstream-Status: Backport [https://github.com/yasm/yasm/commit/b2cc5a1693b17ac415df76d0795b15994c106441]
-
-CVE: CVE-2023-31975
----
- modules/objfmts/bin/bin-objfmt.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/modules/objfmts/bin/bin-objfmt.c b/modules/objfmts/bin/bin-objfmt.c
-index 18026750..a38c3422 100644
---- a/modules/objfmts/bin/bin-objfmt.c
-+++ b/modules/objfmts/bin/bin-objfmt.c
-@@ -1680,6 +1680,10 @@ static void
- bin_section_data_destroy(void *data)
- {
-     bin_section_data *bsd = (bin_section_data *)data;
-+    if (bsd->align)
-+        yasm_xfree(bsd->align);
-+    if (bsd->valign)
-+        yasm_xfree(bsd->valign);
-     if (bsd->start)
-         yasm_expr_destroy(bsd->start);
-     if (bsd->vstart)
---
-2.40.0
diff --git a/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-37732.patch b/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-37732.patch
deleted file mode 100644
index 1ca33f0a92..0000000000
--- a/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-37732.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 2cd3bb50e256f5ed5f611ac611d25fe673f2cec3 Mon Sep 17 00:00:00 2001
-From: Peter Johnson <johnson.peter@gmail.com>
-Date: Fri, 11 Aug 2023 10:49:51 +0000
-Subject: [PATCH] elf.c: Fix NULL deref on bad xsize expression (#234)
-
-CVE: CVE-2023-37732
-
-Upstream-Status: Backport [https://github.com/yasm/yasm/commit/2cd3bb50e256f5ed5f611ac611d25fe673f2cec3]
-
-Signed-off-by: Soumya <soumya.sambu@windriver.com>
----
- modules/objfmts/elf/elf.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/modules/objfmts/elf/elf.c b/modules/objfmts/elf/elf.c
-index 2486bba8..bab4c9ca 100644
---- a/modules/objfmts/elf/elf.c
-+++ b/modules/objfmts/elf/elf.c
-@@ -482,15 +482,15 @@ elf_symtab_write_to_file(FILE *f, elf_symtab_head *symtab,
-
-         /* get size (if specified); expr overrides stored integer */
-         if (entry->xsize) {
--            size_intn = yasm_intnum_copy(
--                yasm_expr_get_intnum(&entry->xsize, 1));
--            if (!size_intn) {
-+            yasm_intnum *intn = yasm_expr_get_intnum(&entry->xsize, 1);
-+            if (!intn) {
-                 yasm_error_set(YASM_ERROR_VALUE,
-                                N_("size specifier not an integer expression"));
-                 yasm_errwarn_propagate(errwarns, entry->xsize->line);
--            }
-+            } else
-+                size_intn = yasm_intnum_copy(intn);
-         }
--        else
-+        if (!size_intn)
-             size_intn = yasm_intnum_create_uint(entry->size);
-
-         /* get EQU value for constants */
---
-2.40.0
diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-devtools/yasm/yasm_git.bb
index 216b777667..e2c1a3c02b 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -8,12 +8,9 @@ DEPENDS += "flex-native bison-native"
 PACKAGECONFIG[docs] = ",,xmlto-native,"
 
 PV = "1.3.0+git"
-# v1.3.0
-SRCREV = "ba463d3c26c0ece2e797b8d6381b161633b5971a"
+# v1.3.0-87
+SRCREV = "121ab150b3577b666c79a79f4a511798d7ad2432"
 SRC_URI = "git://github.com/yasm/yasm.git;branch=master;protocol=https \
-           file://0001-Do-not-use-AC_HEADER_STDC.patch \
-           file://CVE-2023-31975.patch \
-           file://CVE-2023-37732.patch \
            file://0001-yasm-Set-build-date-to-SOURCE_DATE_EPOCH.patch \
            file://0002-yasm-Use-BUILD_DATE-for-reproducibility.patch \
 "
@@ -33,3 +30,6 @@ do_configure:prepend() {
      sed -i -e "s/^echo \"\/\* generated \$ac_cv_stdint_message \*\/\" >>\$ac_stdint$"// ${S}/m4/ax_create_stdint_h.m4
 }
 
+CVE_STATUS_GROUPS += "CVE_STATUS_HASH_UPDATE"
+CVE_STATUS_HASH_UPDATE = "CVE-2021-33454 CVE-2023-31975 CVE-2023-37732"
+CVE_STATUS_HASH_UPDATE[status] = "fixed-version: patched in current git hash"
-- 
2.30.2


