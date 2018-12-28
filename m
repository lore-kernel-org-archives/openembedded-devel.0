Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id 294386B5B4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Dec 2018 03:54:44 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id c73so9916594pfe.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Dec 2018 19:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=5x0xjoKgLY1Ep3qFtephqNaLQGfZ0GGDoqmqSbB4A7w=;
	b=iM3QnhaFRiBz0ttiZA1OLXnLDdrbAFcS0KYER32KgUkMezGm63XWDhRwMzR2ju3a1l
	zsiBcFaP5kxeRs7IrWrTWYSdR4FQEEMlJSZFtBKMXFMOob5p8Q81opBZP+r/wth4FHii
	j8Mvy7TyOhIlJsmRiRq5GXf2cnx6aZqyyarwzovRZNn22maJ/ZN6gq9bBuLj3yN6go9O
	BRvF5w5xTbbqFDSj7qbtZz0TF56oOpdKGPO/HfgNApMB00nMQbLQyrkT8PMHhiPZvJBa
	HqyMYGNo6Zlouu0b6yABPXj+xk3pA4D3mZ5JPZUbU0OthZw2V3peNHvmXtqEUr+12eAM
	GHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=5x0xjoKgLY1Ep3qFtephqNaLQGfZ0GGDoqmqSbB4A7w=;
	b=BG1txt/Ih4VHUfaHzsABNoIABqnV3HDq8xKihnXdKt7wjNAkOauvDf829A8bUhTr8J
	YpPG7eJU0mQ8214qaleTlbaMSbxXnrejrw1uBFrWTr2UUSHvUET9KZX82/GBBbA1FdFG
	rlioOf8+6wvMzuajN0BvnnyExuxv/K8kfOLUZCCB9dz0j5iJ3Ql4Lge6Hq2JM1jnQKMr
	V9BEUqo+QxOrCons3h4sbap0XfiLAOJ3DVXCUTS/qUYCnQOJX1yLPpI41ZpSfDDS1CtK
	5bh58TlIPkNVeNXhrcPIHZ7h5oQSJcLhKp6p2eNpKY4TiaT0IF5L6UQyYIYQ5cBmyuJZ
	xKUg==
X-Gm-Message-State: AA+aEWbKjpsG+HBMqb9CnCh+WS+trt7QbdnhNBvX+Lhu4kTfd0QfioQH
	yD8Xo2clm83ws200d6noqaNEpv31DJZBQA==
X-Google-Smtp-Source: AFSGD/VtGVgQzds5jb5m/jt9oDkR/5dkMYLxWe7paK9d5R/gBSLqyjQVHz5CjyHoanPkzadttDlOIg==
X-Received: by 2002:a62:7e13:: with SMTP id z19mr26609353pfc.94.1545969284937; 
	Thu, 27 Dec 2018 19:54:44 -0800 (PST)
Received: from apnavik-DESK.iind.intel.com ([192.55.54.40])
	by smtp.gmail.com with ESMTPSA id
	w185sm58371544pfb.135.2018.12.27.19.54.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Dec 2018 19:54:43 -0800 (PST)
From: Ankit Navik <ankit.tarot@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Dec 2018 09:26:23 +0530
Message-Id: <1545969383-31548-1-git-send-email-ankit.tarot@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] spirv-tools: Initial recipe for spirv tools
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
X-List-Received-Date: Fri, 28 Dec 2018 03:54:45 -0000

Add generic recipe for spirv tools.

Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
---
 .../0001-tools-lesspipe-Allow-generic-shell.patch  | 24 ++++++++++++++++
 meta-oe/recipes-graphics/spir/spirv-tools_git.bb   | 32 ++++++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/spir/files/0001-tools-lesspipe-Allow-generic-shell.patch
 create mode 100644 meta-oe/recipes-graphics/spir/spirv-tools_git.bb

diff --git a/meta-oe/recipes-graphics/spir/files/0001-tools-lesspipe-Allow-generic-shell.patch b/meta-oe/recipes-graphics/spir/files/0001-tools-lesspipe-Allow-generic-shell.patch
new file mode 100644
index 0000000..e9a45c2
--- /dev/null
+++ b/meta-oe/recipes-graphics/spir/files/0001-tools-lesspipe-Allow-generic-shell.patch
@@ -0,0 +1,24 @@
+From 03127fd5a6eff5ae2ebea2e9c6c01fbf1a0a421a Mon Sep 17 00:00:00 2001
+From: Ankit Navik <ankit.tarot@gmail.com>
+Date: Tue, 25 Dec 2018 14:34:09 +0530
+Subject: [PATCH] tools/lesspipe: Allow generic shell
+
+Upstream-Status: Submitted [https://github.com/KhronosGroup/SPIRV-Tools/pull/2255]
+Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
+---
+ tools/lesspipe/spirv-lesspipe.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/lesspipe/spirv-lesspipe.sh b/tools/lesspipe/spirv-lesspipe.sh
+index 81e3355..f955259 100644
+--- a/tools/lesspipe/spirv-lesspipe.sh
++++ b/tools/lesspipe/spirv-lesspipe.sh
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/usr/bin/env sh
+ # Copyright (c) 2016 The Khronos Group Inc.
+ 
+ # Licensed under the Apache License, Version 2.0 (the "License");
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-graphics/spir/spirv-tools_git.bb b/meta-oe/recipes-graphics/spir/spirv-tools_git.bb
new file mode 100644
index 0000000..aae11df
--- /dev/null
+++ b/meta-oe/recipes-graphics/spir/spirv-tools_git.bb
@@ -0,0 +1,32 @@
+SUMMARY  = "The SPIR-V Tools project provides an API and commands for \
+processing SPIR-V modules"
+DESCRIPTION = "The project includes an assembler, binary module parser, \
+disassembler, validator, and optimizer for SPIR-V."
+LICENSE  = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+SECTION = "graphics"
+
+S = "${WORKDIR}/git"
+DEST_DIR = "${S}/external" 
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;name=spirv-tools \
+	file://0001-tools-lesspipe-Allow-generic-shell.patch \
+	git://github.com/KhronosGroup/SPIRV-Headers.git;name=spirv-headers;destsuffix=${DEST_DIR}/spirv-headers \
+	git://github.com/google/effcee.git;name=effcee;destsuffix=${DEST_DIR}/effcee \
+	git://github.com/google/re2.git;name=re2;destsuffix=${DEST_DIR}/re2 \
+	git://github.com/google/googletest.git;name=googletest;destsuffix=${DEST_DIR}/googletest \
+"
+SRCREV_spirv-tools = "167f1270a9ee641b17c016a545741e4aadfabe86"
+SRCREV_spirv-headers = "4618b86e9e4b027a22040732dfee35e399cd2c47"
+SRCREV_effcee = "8f0a61dc95e0df18c18e0ac56d83b3fa9d2fe90b"
+SRCREV_re2 = "2cf86e5ab6dcfe045a1f510c2b9a8b012a4158cd"
+SRCREV_googletest = "150613166524c474a8a97df4c01d46b72050c495"
+
+inherit cmake python3native
+
+do_install_append() {
+	install -d ${D}/${includedir}/spirv
+	install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/1.2/* ${D}/${includedir}/spirv	
+}
+
+FILES_SOLIBSDEV = ""
+FILES_${PN} += "${libdir}/*.so"
-- 
2.7.4


