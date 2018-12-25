Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id BA7796006E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Dec 2018 11:02:28 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id w6so6476100pgl.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Dec 2018 03:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=rrMxEa3iYWeahInD+p9cS3T8r4NE9XMABapTf9JyAk4=;
	b=sBYnjUcdWNF3uEhlV8gF1BY4Iqj7TUpEuP8FS4b5lmQ447u3u0CLVuXfvTdl0yXJlF
	q6HEjHqEfYnviBxWSTBAGIccMXgzBv9jDNvjqcz6UE70Q5lnn9wN44rFNS3HuDxsl4RW
	GS54oarn7zieuQzxhLfE6M8tJbP9xNDk5IjlFhi3AlMRDZZYN6fYtQ4c1nbDhKl+muRn
	VBPTWvUyzT/L31092Ra54fNt6VOqhpL9vmXcLJooqXYpxDWDYyL3qr2p25NLfQXyiiaK
	SPBEDAZFNW+0uUf4R2aN2eW9GRC3/NcCw6PWdH2U24L98e/sCG7dkSVqnGU4OaKqpx4f
	Z6pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=rrMxEa3iYWeahInD+p9cS3T8r4NE9XMABapTf9JyAk4=;
	b=kHYVx+p3Id1BFW4Xwr32fd43IQNMIz5guGkRW3kMafemuVdZx7GmgfGhcbw1wji5pU
	/qAVDSyp6u0wn5vbmh0tvZiY8bSUBK/R6ZX3CQJT80XIxQYdfInTRAx9OQohTufca5Nk
	+w1jnEgtiRIQLKuI+kxXOFr8eyPHr2Z6WZs409TfuTv/PvAObOKp48rF0NYp+Hmx29IC
	LN6GKsECLI0rU1S4bbOIE2KaBYWOKGl8hS+hppsgO5fVa5D/ZqLr6r0+W3s1JBGafKYD
	Fj4l7pbOF5B3dG2SFOP6LyXPVw9nFK4hrW2OQ9KvPlDPguZd6KI+Qbis8SaEyYVEqB4R
	yHeg==
X-Gm-Message-State: AA+aEWaCh8QHT2oEwDm1AxBrQtmswJ8M+JmwbRf+aYT/yPcwGkRzL23p
	gn46lfUwGTS0IxEjMDT10T+r+LfKra8=
X-Google-Smtp-Source: AFSGD/WEf0iHr7bV1Eo28pI+C6/UogvgZYyUK2iNILmG4Y+3ryMYo68MUAfJ+yfpqlqftP8BxYmftg==
X-Received: by 2002:a62:220d:: with SMTP id i13mr16188220pfi.162.1545735749542;
	Tue, 25 Dec 2018 03:02:29 -0800 (PST)
Received: from apnavik-DESK.iind.intel.com ([134.134.139.82])
	by smtp.gmail.com with ESMTPSA id
	e23sm48605535pfh.68.2018.12.25.03.02.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 25 Dec 2018 03:02:28 -0800 (PST)
From: Ankit Navik <ankit.tarot@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Dec 2018 16:34:02 +0530
Message-Id: <1545735842-21144-1-git-send-email-ankit.tarot@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] spirv-tools: Initial recipe for spirv tools
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
X-List-Received-Date: Tue, 25 Dec 2018 11:02:29 -0000

Add generic recipe for spirv tools.

Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
---
 .../0001-tools-lesspipe-Allow-generic-shell.patch  | 24 +++++++++++++++++
 meta-oe/recipes-graphics/spir/spirv-tools_git.bb   | 31 ++++++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/spir/files/0001-tools-lesspipe-Allow-generic-shell.patch
 create mode 100644 meta-oe/recipes-graphics/spir/spirv-tools_git.bb

diff --git a/meta-oe/recipes-graphics/spir/files/0001-tools-lesspipe-Allow-generic-shell.patch b/meta-oe/recipes-graphics/spir/files/0001-tools-lesspipe-Allow-generic-shell.patch
new file mode 100644
index 0000000..542d7ff
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
++#!/bin/sh
+ # Copyright (c) 2016 The Khronos Group Inc.
+ 
+ # Licensed under the Apache License, Version 2.0 (the "License");
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-graphics/spir/spirv-tools_git.bb b/meta-oe/recipes-graphics/spir/spirv-tools_git.bb
new file mode 100644
index 0000000..9d31a06
--- /dev/null
+++ b/meta-oe/recipes-graphics/spir/spirv-tools_git.bb
@@ -0,0 +1,31 @@
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
+INSANE_SKIP_${PN}-dev += "dev-elf"
-- 
2.7.4


