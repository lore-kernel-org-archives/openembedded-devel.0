Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67])
	by mail.openembedded.org (Postfix) with ESMTP id 22AA27F947
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2019 01:06:58 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id s7so536022pjc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Dec 2019 17:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=HqEbR9HV0P1z/4wCAlo8h3eO8i8Sveb8iwlEC2KWQH0=;
	b=N/OH4KqubMPldDmxsdMMEql0/qWUOOxicenzmjbIGG7jqTRVWsWt/weaHAznxfa1Jk
	GkGW3wiAT9IeTbhhaVvHF2gQ9ZHLMTB4hNdBsbKnG782HA4Is46pB0VlQiaHzZde531+
	5Jrvw0OM6bNwsbaLNLBr2YMJqeK0KwsRShND4VW36DyK6csq79hr7Omk/0t5DLKcPs0g
	yiqZnCbXOUWMfBW7C1P+Mbd9McxFKKuCoCAp4ZkpCSBlUAhySsvWJ2vuE0X5gqb6ZZvg
	WkciKkH6BSkljPo7AWV2bNXUmzQieKnlr2zjo9oxOQDBDXn/WRXdBRjyBUFxetx713Od
	Usvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=HqEbR9HV0P1z/4wCAlo8h3eO8i8Sveb8iwlEC2KWQH0=;
	b=nXvenvvuuhqCCN9PvJ4hDQo6pdBjmGiUvW1LeToU6MAoZubVPTbktG2fIdvu3ejrF5
	zz1MB/qfT1/gyaR9hlWPKgMNh9KYtEM8p93A/C95E3YOwCc6Gk8paVIVXe+i9/ZEra+U
	HvZLT1UU/DWKr2A9Gk7O4rHcURRJPDfqmngkksAse4XO0LsI81eOs2qb1dD4ww0KoYP/
	Jqf2WbT/xpMv1R2CKl+Lqk7iNp7yTxw4FmOKCk9bcnRu001A6NtgaK3lwaD1WTK0ft+g
	gGuZD+YnikNY1nrZiBHjenPc6DmyoaavD7w0+pcd4IXDTyTmdwu2kb0uaKVwgyxMrLTD
	rz6Q==
X-Gm-Message-State: APjAAAVa341llcnI0vHOH6GZFBi9H38GFYNebwCjNAmhKDJBdV4KCirN
	iuT29G+qe4FeXQe4rqxXk5IqATxOYY0=
X-Google-Smtp-Source: APXvYqzcoId4t2StZaYn4pF4gJiJD1EJeYC2/vjxFHpRklmOroe3r+vLk4/kNp/phzAwu8ij1ljVpA==
X-Received: by 2002:a17:90a:36af:: with SMTP id
	t44mr2757994pjb.25.1577754419601; 
	Mon, 30 Dec 2019 17:06:59 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::fa4b])
	by smtp.gmail.com with ESMTPSA id
	k1sm47345844pgq.70.2019.12.30.17.06.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 30 Dec 2019 17:06:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Dec 2019 17:06:49 -0800
Message-Id: <20191231010652.3206534-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191231010652.3206534-1-raj.khem@gmail.com>
References: <20191231010652.3206534-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 4/8] spirv-tools: Upgrade to v2019.5
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
X-List-Received-Date: Tue, 31 Dec 2019 01:06:59 -0000
Content-Transfer-Encoding: 8bit

Drop upstreamed patch

backport a patch to fix

error: moving a temporary object prevents copy elision [-Werror,-Wpessimizing-move]
|         std::move(BuildModule(env_, consumer_, original, assemble_options_));
|         ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-Avoid-pessimizing-std-move-3124.patch | 50 +++++++++++++++++++
 ...1-tools-lesspipe-Allow-generic-shell.patch | 24 ---------
 .../recipes-graphics/spir/spirv-tools_git.bb  | 12 ++---
 3 files changed, 56 insertions(+), 30 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/spir/files/0001-Avoid-pessimizing-std-move-3124.patch
 delete mode 100644 meta-oe/recipes-graphics/spir/files/0001-tools-lesspipe-Allow-generic-shell.patch

diff --git a/meta-oe/recipes-graphics/spir/files/0001-Avoid-pessimizing-std-move-3124.patch b/meta-oe/recipes-graphics/spir/files/0001-Avoid-pessimizing-std-move-3124.patch
new file mode 100644
index 0000000000..9b48cdcd09
--- /dev/null
+++ b/meta-oe/recipes-graphics/spir/files/0001-Avoid-pessimizing-std-move-3124.patch
@@ -0,0 +1,50 @@
+From 4fffcd275b50d08b54b0411679ead98970651bad Mon Sep 17 00:00:00 2001
+From: David Neto <dneto@google.com>
+Date: Fri, 27 Dec 2019 12:05:58 -0500
+Subject: [PATCH] Avoid pessimizing std::move (#3124)
+
+Should fix a warning
+
+Upstream-Status: Backport [https://github.com/KhronosGroup/SPIRV-Tools/commit/8aa423930db37e37086665efcc55944d577c06e5]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ test/opt/pass_fixture.h | 9 +++------
+ 1 file changed, 3 insertions(+), 6 deletions(-)
+
+diff --git a/test/opt/pass_fixture.h b/test/opt/pass_fixture.h
+index 53fb206f..64c089d8 100644
+--- a/test/opt/pass_fixture.h
++++ b/test/opt/pass_fixture.h
+@@ -60,8 +60,7 @@ class PassTest : public TestT {
+   // from pass Process() function.
+   std::tuple<std::vector<uint32_t>, Pass::Status> OptimizeToBinary(
+       Pass* pass, const std::string& original, bool skip_nop) {
+-    context_ =
+-        std::move(BuildModule(env_, consumer_, original, assemble_options_));
++    context_ = BuildModule(env_, consumer_, original, assemble_options_);
+     EXPECT_NE(nullptr, context()) << "Assembling failed for shader:\n"
+                                   << original << std::endl;
+     if (!context()) {
+@@ -197,8 +196,7 @@ class PassTest : public TestT {
+   // messages.
+   template <typename PassT, typename... Args>
+   void SinglePassRunAndFail(const std::string& original, Args&&... args) {
+-    context_ =
+-        std::move(BuildModule(env_, consumer_, original, assemble_options_));
++    context_ = BuildModule(env_, consumer_, original, assemble_options_);
+     EXPECT_NE(nullptr, context()) << "Assembling failed for shader:\n"
+                                   << original << std::endl;
+     std::ostringstream errs;
+@@ -235,8 +233,7 @@ class PassTest : public TestT {
+   void RunAndCheck(const std::string& original, const std::string& expected) {
+     assert(manager_->NumPasses());
+ 
+-    context_ =
+-        std::move(BuildModule(env_, nullptr, original, assemble_options_));
++    context_ = BuildModule(env_, nullptr, original, assemble_options_);
+     ASSERT_NE(nullptr, context());
+ 
+     context()->set_preserve_bindings(OptimizerOptions()->preserve_bindings_);
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-graphics/spir/files/0001-tools-lesspipe-Allow-generic-shell.patch b/meta-oe/recipes-graphics/spir/files/0001-tools-lesspipe-Allow-generic-shell.patch
deleted file mode 100644
index e9a45c24fc..0000000000
--- a/meta-oe/recipes-graphics/spir/files/0001-tools-lesspipe-Allow-generic-shell.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 03127fd5a6eff5ae2ebea2e9c6c01fbf1a0a421a Mon Sep 17 00:00:00 2001
-From: Ankit Navik <ankit.tarot@gmail.com>
-Date: Tue, 25 Dec 2018 14:34:09 +0530
-Subject: [PATCH] tools/lesspipe: Allow generic shell
-
-Upstream-Status: Submitted [https://github.com/KhronosGroup/SPIRV-Tools/pull/2255]
-Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
----
- tools/lesspipe/spirv-lesspipe.sh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/lesspipe/spirv-lesspipe.sh b/tools/lesspipe/spirv-lesspipe.sh
-index 81e3355..f955259 100644
---- a/tools/lesspipe/spirv-lesspipe.sh
-+++ b/tools/lesspipe/spirv-lesspipe.sh
-@@ -1,4 +1,4 @@
--#!/bin/bash
-+#!/usr/bin/env sh
- # Copyright (c) 2016 The Khronos Group Inc.
- 
- # Licensed under the Apache License, Version 2.0 (the "License");
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-graphics/spir/spirv-tools_git.bb b/meta-oe/recipes-graphics/spir/spirv-tools_git.bb
index 49a91b0053..c4db017e8c 100644
--- a/meta-oe/recipes-graphics/spir/spirv-tools_git.bb
+++ b/meta-oe/recipes-graphics/spir/spirv-tools_git.bb
@@ -13,14 +13,14 @@ SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;name=spirv-tools \
 	git://github.com/google/effcee.git;name=effcee;destsuffix=${DEST_DIR}/effcee \
 	git://github.com/google/re2.git;name=re2;destsuffix=${DEST_DIR}/re2 \
 	git://github.com/google/googletest.git;name=googletest;destsuffix=${DEST_DIR}/googletest \
-	file://0001-tools-lesspipe-Allow-generic-shell.patch \
         file://0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-file.patch \
+        file://0001-Avoid-pessimizing-std-move-3124.patch \
 "
-SRCREV_spirv-tools = "167f1270a9ee641b17c016a545741e4aadfabe86"
-SRCREV_spirv-headers = "4618b86e9e4b027a22040732dfee35e399cd2c47"
-SRCREV_effcee = "8f0a61dc95e0df18c18e0ac56d83b3fa9d2fe90b"
-SRCREV_re2 = "2cf86e5ab6dcfe045a1f510c2b9a8b012a4158cd"
-SRCREV_googletest = "150613166524c474a8a97df4c01d46b72050c495"
+SRCREV_spirv-tools = "c413b982c316b14e784f50d941814fc737b55b4a"
+SRCREV_spirv-headers = "af64a9e826bf5bb5fcd2434dd71be1e41e922563"
+SRCREV_effcee = "cd25ec17e9382f99a895b9ef53ff3c277464d07d"
+SRCREV_re2 = "5bd613749fd530b576b890283bfb6bc6ea6246cb"
+SRCREV_googletest = "f2fb48c3b3d79a75a88a99fba6576b25d42ec528"
 
 inherit cmake python3native
 
-- 
2.24.1


