Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B36C5516D
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 18:03:42 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2124.1785521012213723771
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2026 11:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pa7Wa2Zc;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so992716a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 11:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785521011; x=1786125811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f183hlVmyH3OvX0CxnwRo8fCjUK99vOqor1vHCNQOds=;
        b=pa7Wa2ZcKB41dVdw73/3zljdGHr5U/2i218Qm02kQUiTs/68XIZIjL1FBZ7wFyv+dc
         cqbXCsA/f0bt1KPhnwaGLnzpm8uOwkUZZIXi3nSdI7R0nGQYQk8q4vIwjOmK0SRKqZnT
         vsZC2W/ZcZ9Z1EpUbLc5iDBXrSbZPwtSBXfg1XnDU+/A9P+uQbvqA8sQXi4WjfyP6ad3
         sH0h292bX/cgdUUFXB1rpr8raXZ+DKjy1+JMCINyJISsFaPE0QTzP5dUIjINDuWEcS9n
         gV124z8zcEdH7I7oPk7Y+L5I2IKiadxvAxK8eEu2DWRK3QfWoV+Ch/S5ef55C+5wHL+t
         RyIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785521011; x=1786125811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f183hlVmyH3OvX0CxnwRo8fCjUK99vOqor1vHCNQOds=;
        b=sYpaMbSkD6dtn9rALI6eTPRYYu7zgWAHSY9M7rEBmW5R1vfUGWodoEn41x2p+gZzqK
         vrjRilJxjpcrI9Uhz98UT0XVij8jKeHqfn2APk/RUbheBI9U1lQ0O2SEyVrf77U3tE5A
         W/24RHH0eaosYLRGWtwPtuSCsThHCBeAJbTECMz02CqoujmvSJoQ88qi+asNpE6hBrFP
         IuDpwMt9cfa++eomDB23JAB0AKFaGYuZxAQ69p5BFTFw1V3MVtmHUlJ5cZJYC8ZE6566
         cnyoMyUlLd4zGgsDfdp4B03DdGgOqjho3W+hFRpJFFkKu9x9vqDFfH6t7c8qd1dV7bd1
         VWhw==
X-Gm-Message-State: AOJu0YwWBACxw0cwi6UkgRhB4OYMpf5suM3sDMRg9Vp36LF3bV/MWPGY
	VPst38dQ9w8zNNsSh2cpTZE1SVDKRHqB614Kug0LW+Bu1LsF6OGq3A1tX/GAH607
X-Gm-Gg: AR+sD12kO7xTZresGHuuhHKzFJvTi7npx8Hid3TRvNfFs8QKGd6SaoKeihzh2rJreXD
	bJ/cPrwRwYkqGD8F/xs3f0jbADBCzRTdR1t7eCgiAWVu29XiVdWbGu1aMy6ngbPLqUc3yJkGQZc
	TBUlJ+23dYxHnOs80ZC7UeETmGw6FNNhtGb2o2d2YimDR9+d4yONkYaT66K5jLjB0iFErRMKC+U
	SwoLZ92yhmPczFAiWD1LWu45vKRYM7vz7WKXnqi1KqV3N2WXK/DKKxmi9t9sLgn/OrQadyK27IG
	6GiTWf2H4dEk4HHTaI5HLjfvgPqkC4luthLHBBb7qMY0P48i9mtbdxmq6AN81c1boM9cUci/9R0
	qM5pLmx3kw/CFxSJT8GKFspLjGRIrUfi+/whVQcY75gdUDr1xJtToGiXpSZQ2X/jDT/T9/XqHTU
	trwzcpytJv9xjV+QcTjiqzTPtiP3k78DMjNKQhbx6cyR55jT4r2M/cUBdOSuDJ76a0tRSrZfQDc
	TYew1+sTl8IqV7U4ceLKwsZNXhWZkGCkS8mqbw9DQSBzspfr0nGZYGAFPXuI0tz1aRauQGz3pzv
	sH2I7XxDLK728rbW7Mgdh97mMbc+PXfKLGmO2UzHnvZvaUcdIPy6aIdaozRRHiXdse7nxBsHI8R
	SeA==
X-Received: by 2002:a05:6a21:e58d:b0:3bf:b931:b3f4 with SMTP id adf61e73a8af0-3c92a864c61mr760862637.51.1785521011210;
        Fri, 31 Jul 2026 11:03:31 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06f8dbsm8376794eec.22.2026.07.31.11.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 11:03:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] oprofile: Fix build with binutils 2.47
Date: Fri, 31 Jul 2026 11:03:28 -0700
Message-ID: <20260731180328.1305799-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 18:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128588

binutils 2.47 removed the bfd_boolean compatibility define along with the
TRUE/FALSE macros it brought in, see binutils commit 1d95b744c069 ("Remove
bfd_boolean definition from bfd"). This breaks oprofile:

  opagent.c:81:2: error: use of undeclared identifier 'bfd_boolean'
  create_bfd.c:68:18: error: 'FALSE' undeclared

Add a patch using bool/false from <stdbool.h> instead, which is what the
bfd API has been returning since binutils 2.36.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0001-Fix-build-with-binutils-2.47.patch   | 111 ++++++++++++++++++
 .../recipes-kernel/oprofile/oprofile_1.4.0.bb |   1 +
 2 files changed, 112 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/oprofile/oprofile/0001-Fix-build-with-binutils-2.47.patch

diff --git a/meta-oe/recipes-kernel/oprofile/oprofile/0001-Fix-build-with-binutils-2.47.patch b/meta-oe/recipes-kernel/oprofile/oprofile/0001-Fix-build-with-binutils-2.47.patch
new file mode 100644
index 0000000000..0b747aaa36
--- /dev/null
+++ b/meta-oe/recipes-kernel/oprofile/oprofile/0001-Fix-build-with-binutils-2.47.patch
@@ -0,0 +1,111 @@
+From 0a9a94a4f212fea58792e35b195587a153919968 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 30 Jul 2026 11:33:45 -0700
+Subject: [PATCH] Fix build with binutils 2.47
+
+binutils 2.47 removed the bfd_boolean compatibility define, together with
+the TRUE/FALSE macros that came along with it, see binutils commit
+1d95b744c069 ("Remove bfd_boolean definition from bfd").
+
+Use the C99 bool/false from <stdbool.h> instead, which is what the bfd
+API has been returning since binutils 2.36.
+
+While here, make _bfd_target_name a 'char const *' since that is the type
+of bfd_target::name; it is only ever read.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ libopagent/opagent.c   |  5 +++--
+ opjitconv/create_bfd.c | 13 +++++++------
+ 2 files changed, 10 insertions(+), 8 deletions(-)
+
+diff --git a/libopagent/opagent.c b/libopagent/opagent.c
+index f280880..c3d1af9 100644
+--- a/libopagent/opagent.c
++++ b/libopagent/opagent.c
+@@ -52,6 +52,7 @@
+
+ #include "config.h"
+ #include <stdio.h>
++#include <stdbool.h>
+ #include <errno.h>
+ #include <string.h>
+ #include <stdint.h>
+@@ -70,7 +71,7 @@
+ #include "jitdump.h"
+
+ // Declare BFD-related global variables.
+-static char * _bfd_target_name;
++static char const * _bfd_target_name;
+ static int _bfd_arch;
+ static unsigned int _bfd_mach;
+
+@@ -78,7 +79,7 @@ static unsigned int _bfd_mach;
+ static int define_bfd_vars(void)
+ {
+ 	bfd * bfd;
+-	bfd_boolean r;
++	bool r;
+ 	int len;
+ #define MAX_PATHLENGTH 2048
+ 	char mypath[MAX_PATHLENGTH];
+diff --git a/opjitconv/create_bfd.c b/opjitconv/create_bfd.c
+index da1e6d2..3124d88 100644
+--- a/opjitconv/create_bfd.c
++++ b/opjitconv/create_bfd.c
+@@ -20,6 +20,7 @@
+
+ #include <bfd.h>
+ #include <assert.h>
++#include <stdbool.h>
+ #include <stdint.h>
+ #include <stdio.h>
+
+@@ -65,7 +66,7 @@ static int fill_symtab(void)
+ 		syms[i] = s;
+ 	}
+ 	r = bfd_set_symtab(cur_bfd, syms, entry_count);
+-	if (r == FALSE) {
++	if (r == false) {
+ 		bfd_perror("bfd_set_symtab");
+ 		rc = OP_JIT_CONV_FAIL;
+ 	}
+@@ -88,11 +89,11 @@ asection * create_section(bfd * abfd, char const * section_name,
+ 		goto error;
+ 	}
+ 	op_bfd_set_section_vma(abfd, section, vma);
+-	if (op_bfd_set_section_size(abfd, section, size) == FALSE) {
++	if (op_bfd_set_section_size(abfd, section, size) == false) {
+ 		bfd_perror("bfd_set_section_size");
+ 		goto error;
+ 	}
+-	if (op_bfd_set_section_flags(abfd, section, flags) == FALSE) {
++	if (op_bfd_set_section_flags(abfd, section, flags) == false) {
+ 		bfd_perror("bfd_set_section_flags");
+ 		goto error;
+ 	}
+@@ -134,7 +135,7 @@ static int create_text_section(int start_idx, int end_idx)
+ int fill_section_content(bfd * abfd, asection * section,
+ 			 void const * b, file_ptr offset, size_t sz)
+ {
+-	if (bfd_set_section_contents(abfd, section, b, offset, sz) == FALSE) {
++	if (bfd_set_section_contents(abfd, section, b, offset, sz) == false) {
+ 		bfd_perror("bfd_set_section_contents");
+ 		return OP_JIT_CONV_FAIL;
+ 	}
+@@ -257,11 +258,11 @@ bfd * open_elf(char const * filename)
+ 		bfd_perror("bfd_openw");
+ 		goto error1;
+ 	}
+-	if (bfd_set_format(abfd, bfd_object) == FALSE) {
++	if (bfd_set_format(abfd, bfd_object) == false) {
+ 		bfd_perror("bfd_set_format");
+ 		goto error;
+ 	}
+-	if (bfd_set_arch_mach(abfd, dump_bfd_arch, dump_bfd_mach) == FALSE) {
++	if (bfd_set_arch_mach(abfd, dump_bfd_arch, dump_bfd_mach) == false) {
+ 		bfd_perror("bfd_set_arch_mach");
+ 		goto error;
+ 	}
diff --git a/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb b/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb
index df1045e6df..b9f9f9bf35 100644
--- a/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb
+++ b/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb
@@ -33,6 +33,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://0011-replace-__FILE__-with-__FILE_NAME__.patch \
            file://0001-configure-Include-unistd.h-for-getpid-API.patch \
            file://0001-Replace-std-bind2nd-with-generic-lambda.patch \
+           file://0001-Fix-build-with-binutils-2.47.patch \
 "
 SRC_URI[sha256sum] = "7ba06f99d7c188389d20d1d5e53ee690c7733f87aa9af62bd664fa0ca235a412"


