Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA240C30653
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 11:34:32 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.5797.1719488063863679987
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jun 2024 04:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Pze7X4r8;
 spf=pass (domain: mvista.com, ip: 209.85.214.177, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1f4a5344ec7so12378195ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Jun 2024 04:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1719488063; x=1720092863; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bcOTEhpYM/l0WkNJ/vfFw7a3GnHTNJTTJwps0wdMmys=;
        b=Pze7X4r8Wb+U5pBVbDJhv95rWRzaaUcU+9Tv14FXbyl93sm9YvF92IjHhjgmg8dPY6
         DhEJMdgvIB7LL+c26MYxLb0d1b+47t6u60hUFCLMNUC7LI9m/noBn5zTJVvNnmkkNqjk
         QnRxJQLMV2nU28ddhGh6h0CwgumgawUjTgr9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719488063; x=1720092863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bcOTEhpYM/l0WkNJ/vfFw7a3GnHTNJTTJwps0wdMmys=;
        b=OLwJcFv14a59vJ2xmUpNksFo3WpQHKYJ0VUNlua7VXZl08s8hYLAMT0jL/I/ZO0+uI
         BNnQndJSztvgHQ1hV1/H3I/SXsFBu87ivRGhXDh0VKJSFClSiK/Okf4LBkg97RsrSK6Y
         4KNh1oiyaIYqSZXfXfc4kA+uSeQjqmVGxBOxvqqpPtX0OZkG6WUBHQzVAqmyWGxf0oFR
         V63gvSiLtSfC5WgacMLZtYXRcoNdfZvp5ac4i+bLKiiBZ2+1qXooE5Vf8byHTjrYsDqg
         q3ZiCS2EuImlISGJKkvyIbqzpbcon3tL050zBOMeFh08LmSIbioKevjpaAGcP0RMhcy/
         2Okw==
X-Gm-Message-State: AOJu0YwT0Nut06TtZU+CfFYhF2By3R89wh8FUsPNYj7XpTYnMjm0rUaS
	hjGrVM2ZkxqNcWTurfmmxZ1OLRvDeUUL5C/S4YGaFgJdjrcu8xjcnqUF8FTZh7pnxA8PIBsKjgA
	o
X-Google-Smtp-Source: AGHT+IEMW/+RO9cWNOxke3ngk7D+zrQpnaP4mqOW03D7WySBWyk0VmHrcgKM0xwjHZdBZoQQ4EpvRQ==
X-Received: by 2002:a17:902:c411:b0:1f8:5230:e788 with SMTP id d9443c01a7336-1fa5e6a9ec6mr137694175ad.25.1719488062911;
        Thu, 27 Jun 2024 04:34:22 -0700 (PDT)
Received: from localhost.localdomain ([150.129.170.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac99939esm11226735ad.218.2024.06.27.04.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 04:34:22 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-java][kirkstone)][PATCH] openjdk-8: Fix CVE-2022-40433
Date: Thu, 27 Jun 2024 17:04:15 +0530
Message-Id: <20240627113415.539591-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jun 2024 11:34:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111124

Upstream-Status: Backport from https://github.com/openjdk/jdk8u/commit/961ab463974b7d05600b826303f9111c4f367a04

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../openjdk/openjdk-8-release-common.inc      |   1 +
 .../patches-openjdk-8/CVE-2022-40433.patch    | 233 ++++++++++++++++++
 2 files changed, 234 insertions(+)
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/CVE-2022-40433.patch

diff --git a/recipes-core/openjdk/openjdk-8-release-common.inc b/recipes-core/openjdk/openjdk-8-release-common.inc
index ff8d96e..c977c96 100644
--- a/recipes-core/openjdk/openjdk-8-release-common.inc
+++ b/recipes-core/openjdk/openjdk-8-release-common.inc
@@ -21,6 +21,7 @@ PATCHES_URI = "\
     file://2007-jdk-no-genx11-in-headless.patch \
     file://2008-jdk-no-unused-deps.patch \
     file://2009-jdk-make-use-gcc-instead-of-ld-for-genSocketOptionRe.patch \
+    file://CVE-2022-40433.patch \
 "
 HOTSPOT_UB_PATCH = "\
     file://1001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch \
diff --git a/recipes-core/openjdk/patches-openjdk-8/CVE-2022-40433.patch b/recipes-core/openjdk/patches-openjdk-8/CVE-2022-40433.patch
new file mode 100644
index 0000000..fcae4f4
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/CVE-2022-40433.patch
@@ -0,0 +1,233 @@
+From 961ab463974b7d05600b826303f9111c4f367a04 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ji=C5=99=C3=AD=20Van=C4=9Bk?= <jvanek@openjdk.org>
+Date: Mon, 25 Sep 2023 14:05:03 +0000
+Subject: [PATCH] 8283441: C2: segmentation fault in
+ ciMethodBlocks::make_block_at(int)
+
+Reviewed-by: mbalao
+Backport-of: 947869609ce6b74d4d28f79724b823d8781adbed
+
+Upstream-Status: Backport [https://github.com/openjdk/jdk8u/commit/961ab463974b7d05600b826303f9111c4f367a04]
+CVE: CVE-2022-40433
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ hotspot/src/share/vm/c1/c1_GraphBuilder.cpp   | 12 ++++--
+ hotspot/src/share/vm/ci/ciMethodBlocks.cpp    | 17 +++++---
+ .../src/share/vm/compiler/methodLiveness.cpp  |  9 ++--
+ hotspot/test/compiler/parsing/Custom.jasm     | 38 +++++++++++++++++
+ ...UnreachableBlockFallsThroughEndOfCode.java | 42 +++++++++++++++++++
+ 5 files changed, 106 insertions(+), 12 deletions(-)
+ create mode 100644 hotspot/test/compiler/parsing/Custom.jasm
+ create mode 100644 hotspot/test/compiler/parsing/UnreachableBlockFallsThroughEndOfCode.java
+
+diff --git a/hotspot/src/share/vm/c1/c1_GraphBuilder.cpp b/hotspot/src/share/vm/c1/c1_GraphBuilder.cpp
+index 99f1c510..6e3e4cc4 100644
+--- a/hotspot/src/share/vm/c1/c1_GraphBuilder.cpp
++++ b/hotspot/src/share/vm/c1/c1_GraphBuilder.cpp
+@@ -206,8 +206,10 @@ void BlockListBuilder::handle_exceptions(BlockBegin* current, int cur_bci) {
+ }
+ 
+ void BlockListBuilder::handle_jsr(BlockBegin* current, int sr_bci, int next_bci) {
+-  // start a new block after jsr-bytecode and link this block into cfg
+-  make_block_at(next_bci, current);
++  if (next_bci < method()->code_size()) {
++    // start a new block after jsr-bytecode and link this block into cfg
++    make_block_at(next_bci, current);
++  }
+ 
+   // start a new block at the subroutine entry at mark it with special flag
+   BlockBegin* sr_block = make_block_at(sr_bci, current);
+@@ -227,6 +229,8 @@ void BlockListBuilder::set_leaders() {
+   // branch target and a modification of the successor lists.
+   BitMap bci_block_start = method()->bci_block_start();
+ 
++  int end_bci = method()->code_size();
++
+   ciBytecodeStream s(method());
+   while (s.next() != ciBytecodeStream::EOBC()) {
+     int cur_bci = s.cur_bci();
+@@ -297,7 +301,9 @@ void BlockListBuilder::set_leaders() {
+       case Bytecodes::_if_acmpne: // fall through
+       case Bytecodes::_ifnull:    // fall through
+       case Bytecodes::_ifnonnull:
+-        make_block_at(s.next_bci(), current);
++        if (s.next_bci() < end_bci) {
++          make_block_at(s.next_bci(), current);
++        }
+         make_block_at(s.get_dest(), current);
+         current = NULL;
+         break;
+diff --git a/hotspot/src/share/vm/ci/ciMethodBlocks.cpp b/hotspot/src/share/vm/ci/ciMethodBlocks.cpp
+index 614e75dc..2285eb0a 100644
+--- a/hotspot/src/share/vm/ci/ciMethodBlocks.cpp
++++ b/hotspot/src/share/vm/ci/ciMethodBlocks.cpp
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2006, 2011, Oracle and/or its affiliates. All rights reserved.
++ * Copyright (c) 2006, 2022, Oracle and/or its affiliates. All rights reserved.
+  * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
+  *
+  * This code is free software; you can redistribute it and/or modify it
+@@ -33,12 +33,13 @@
+ 
+ 
+ ciBlock *ciMethodBlocks::block_containing(int bci) {
++  assert(bci >= 0 && bci < _code_size, "valid bytecode range");
+   ciBlock *blk = _bci_to_block[bci];
+   return blk;
+ }
+ 
+ bool ciMethodBlocks::is_block_start(int bci) {
+-  assert(bci >=0 && bci < _code_size, "valid bytecode range");
++  assert(bci >= 0 && bci < _code_size, "valid bytecode range");
+   ciBlock *b = _bci_to_block[bci];
+   assert(b != NULL, "must have block for bytecode");
+   return b->start_bci() == bci;
+@@ -146,7 +147,9 @@ void ciMethodBlocks::do_analysis() {
+       case Bytecodes::_ifnonnull   :
+       {
+         cur_block->set_control_bci(bci);
+-        ciBlock *fall_through = make_block_at(s.next_bci());
++        if (s.next_bci() < limit_bci) {
++          ciBlock *fall_through = make_block_at(s.next_bci());
++        }
+         int dest_bci = s.get_dest();
+         ciBlock *dest = make_block_at(dest_bci);
+         break;
+@@ -166,7 +169,9 @@ void ciMethodBlocks::do_analysis() {
+       case Bytecodes::_jsr         :
+       {
+         cur_block->set_control_bci(bci);
+-        ciBlock *ret = make_block_at(s.next_bci());
++        if (s.next_bci() < limit_bci) {
++          ciBlock *ret = make_block_at(s.next_bci());
++        }
+         int dest_bci = s.get_dest();
+         ciBlock *dest = make_block_at(dest_bci);
+         break;
+@@ -224,7 +229,9 @@ void ciMethodBlocks::do_analysis() {
+       case Bytecodes::_jsr_w       :
+       {
+         cur_block->set_control_bci(bci);
+-        ciBlock *ret = make_block_at(s.next_bci());
++        if (s.next_bci() < limit_bci) {
++          ciBlock *ret = make_block_at(s.next_bci());
++        }
+         int dest_bci = s.get_far_dest();
+         ciBlock *dest = make_block_at(dest_bci);
+         break;
+diff --git a/hotspot/src/share/vm/compiler/methodLiveness.cpp b/hotspot/src/share/vm/compiler/methodLiveness.cpp
+index eda1ab15..7fb496dc 100644
+--- a/hotspot/src/share/vm/compiler/methodLiveness.cpp
++++ b/hotspot/src/share/vm/compiler/methodLiveness.cpp
+@@ -268,10 +268,11 @@ void MethodLiveness::init_basic_blocks() {
+       case Bytecodes::_ifnull:
+       case Bytecodes::_ifnonnull:
+         // Two way branch.  Set predecessors at each destination.
+-        dest = _block_map->at(bytes.next_bci());
+-        assert(dest != NULL, "must be a block immediately following this one.");
+-        dest->add_normal_predecessor(current_block);
+-
++        if (bytes.next_bci() < method_len) {
++          dest = _block_map->at(bytes.next_bci());
++          assert(dest != NULL, "must be a block immediately following this one.");
++          dest->add_normal_predecessor(current_block);
++        }
+         dest = _block_map->at(bytes.get_dest());
+         assert(dest != NULL, "branch desination must start a block.");
+         dest->add_normal_predecessor(current_block);
+diff --git a/hotspot/test/compiler/parsing/Custom.jasm b/hotspot/test/compiler/parsing/Custom.jasm
+new file mode 100644
+index 00000000..73a2b1ff
+--- /dev/null
++++ b/hotspot/test/compiler/parsing/Custom.jasm
+@@ -0,0 +1,38 @@
++/*
++ * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
++ * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
++ *
++ * This code is free software; you can redistribute it and/or modify it
++ * under the terms of the GNU General Public License version 2 only, as
++ * published by the Free Software Foundation.
++ *
++ * This code is distributed in the hope that it will be useful, but WITHOUT
++ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
++ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
++ * version 2 for more details (a copy is included in the LICENSE file that
++ * accompanied this code).
++ *
++ * You should have received a copy of the GNU General Public License version
++ * 2 along with this work; if not, write to the Free Software Foundation,
++ * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
++ *
++ * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
++ * or visit www.oracle.com if you need additional information or have any
++ * questions.
++ */
++
++package compiler/parsing;
++
++super public class Custom {
++
++    public static Method test:"(I)V" stack 2 locals 1 {
++        return;
++Loop:
++        // Unreachable block
++        iload_0;
++        bipush        100;
++        if_icmpge     Loop;
++        // Falls through
++    }
++
++}
+diff --git a/hotspot/test/compiler/parsing/UnreachableBlockFallsThroughEndOfCode.java b/hotspot/test/compiler/parsing/UnreachableBlockFallsThroughEndOfCode.java
+new file mode 100644
+index 00000000..9dfb488d
+--- /dev/null
++++ b/hotspot/test/compiler/parsing/UnreachableBlockFallsThroughEndOfCode.java
+@@ -0,0 +1,42 @@
++/*
++ * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
++ * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
++ *
++ * This code is free software; you can redistribute it and/or modify it
++ * under the terms of the GNU General Public License version 2 only, as
++ * published by the Free Software Foundation.
++ *
++ * This code is distributed in the hope that it will be useful, but WITHOUT
++ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
++ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
++ * version 2 for more details (a copy is included in the LICENSE file that
++ * accompanied this code).
++ *
++ * You should have received a copy of the GNU General Public License version
++ * 2 along with this work; if not, write to the Free Software Foundation,
++ * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
++ *
++ * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
++ * or visit www.oracle.com if you need additional information or have any
++ * questions.
++ *
++ */
++
++/*
++ * @test UnreachableBlockFallsThroughEndOfCode.java
++ * @bug 8283441
++ * @compile Custom.jasm UnreachableBlockFallsThroughEndOfCode.java
++ * @summary Compiling method that falls off the end of the code array
++ * @run main/othervm -XX:TieredStopAtLevel=1 -Xbatch compiler.parsing.UnreachableBlockFallsThroughEndOfCode
++ * @run main/othervm -XX:-TieredCompilation -Xbatch compiler.parsing.UnreachableBlockFallsThroughEndOfCode
++ */
++
++package compiler.parsing;
++
++public class UnreachableBlockFallsThroughEndOfCode {
++    public static void main(String[] strArr) {
++        for (int i = 0; i < 20000; i++) {
++            Custom.test(i);
++        }
++    }
++}
+-- 
+2.25.1
+
-- 
2.25.1


