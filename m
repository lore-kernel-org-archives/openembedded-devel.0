Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id DF35471985
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Dec 2018 14:21:21 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id n2so3807220pgm.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Dec 2018 06:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=JgGv7oPMQtQVfr+lVF1HSG0jvR6xrNatR3ncuBNNFHw=;
	b=pYksqGirbJI3X6WdsJSGUQVidnqZZuLtuXpVdzNGEL80OHV4jY2EA8OFJOnSrFmenW
	+DPBiP0PAXqLLmBbweCOWShzLOidEkkheSgohPr2rzaMplbQ3lkHSZyEFRwkV0gulE6g
	gXOTYAB31odBQu+NBA4egicH1tFpK08dFeNVGWjWIegnLI2khs0MmErB1IXDqTQMqUw8
	Zt5T7aaZyLvj+IkDRL2y0FJbRqw/pMGQbE1lRCDdkRCGT/Og/A+7gvI0MCMgtdCKsZ0W
	AnB4IwCymlyZzllFeIRSkLCyGIwN7qgi9Clg2aeqOH8RVkvWEr0bAC4DcChwHc0w6pvu
	Pi7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=JgGv7oPMQtQVfr+lVF1HSG0jvR6xrNatR3ncuBNNFHw=;
	b=YPX/aSL5VixKHfwEqjh0iFUaRtIdTB9bgkMVbF9aaqAKSkz2kjsuWEmR2Q+iP5Cnfc
	vodZ3ALc13dLxiH51chjnBKPQtzxaIqe1MsskhFHWaKJuod8kZ2d37k1z0Ss+I4XZxAW
	m2QnXNeLjHAe7l1YoOTEcjo4BiXK54Q9hqUBNAVMpYXsu8r4Z0aF4gzSiNonbtjo7UEa
	Eu5gq4VcUfuzC3qqBRZJCxHER2B0REnimyo3NSUD3o7yLAvHoahZNG5JwtGFqPaPa3ik
	jVhkWirDazCnsyIjjf3O6L8GjrxmrocaH5+KhKPzRFWgx9zCoNATEfe62R2t3DbkmnMr
	34Pg==
X-Gm-Message-State: AJcUukcMT4Pb8lbNLJmvtJkUQuqTB211Zwd/45l1qe1tc5hPmy51lglV
	1DRmSsGIQgjtZPIVGzniYrEfEyocAy8=
X-Google-Smtp-Source: ALg8bN5eGhE0uiKgdj2x9z4qGUZQczJcpHCT7Sw3Gf3wAO0SEkpYLqc/UG1z0g4Z4l8KeylurIi/pQ==
X-Received: by 2002:a63:7e5b:: with SMTP id o27mr6250757pgn.214.1545488482768; 
	Sat, 22 Dec 2018 06:21:22 -0800 (PST)
Received: from apnavik-DESK.iind.intel.com (fmdmzpr04-ext.fm.intel.com.
	[192.55.54.39]) by smtp.gmail.com with ESMTPSA id
	q1sm42331979pgs.14.2018.12.22.06.21.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 22 Dec 2018 06:21:21 -0800 (PST)
From: Ankit Navik <ankit.tarot@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Dec 2018 19:52:51 +0530
Message-Id: <1545488571-406-1-git-send-email-ankit.tarot@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] spirv-cross: Initial recipe for SPIRV-Cross
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
X-List-Received-Date: Sat, 22 Dec 2018 14:21:22 -0000

Add generic recipe for SPIRV-Cross tool.

Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
---
 ...0001-Add-install-PHONY-target-in-Makefile.patch | 31 ++++++++++++++++++++++
 meta-oe/recipes-graphics/spir/spirv-cross_git.bb   | 22 +++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/spir/files/0001-Add-install-PHONY-target-in-Makefile.patch
 create mode 100644 meta-oe/recipes-graphics/spir/spirv-cross_git.bb

diff --git a/meta-oe/recipes-graphics/spir/files/0001-Add-install-PHONY-target-in-Makefile.patch b/meta-oe/recipes-graphics/spir/files/0001-Add-install-PHONY-target-in-Makefile.patch
new file mode 100644
index 0000000..78598ea
--- /dev/null
+++ b/meta-oe/recipes-graphics/spir/files/0001-Add-install-PHONY-target-in-Makefile.patch
@@ -0,0 +1,31 @@
+From 8d9870b66c3cfcf12ce7e8e013946e2a215bb722 Mon Sep 17 00:00:00 2001
+From: Ankit Navik <ankit.tarot@gmail.com>
+Date: Sat, 22 Dec 2018 19:16:02 +0530
+Subject: [PATCH] Add install PHONY target in Makefile
+
+---
+ Makefile | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 0564b65..0993372 100644
+--- a/Makefile
++++ b/Makefile
+@@ -35,7 +35,13 @@ $(STATIC_LIB): $(OBJECTS)
+ %.o: %.cpp
+ 	$(CXX) -c -o $@ $< $(CXXFLAGS) -MMD
+ 
++install:
++	mkdir -p $(TARGET_DIR_BIN)
++	mkdir -p $(TARGET_DIR_LIB)
++	cp $(TARGET) $(TARGET_DIR_BIN)/
++	cp $(STATIC_LIB) $(TARGET_DIR_LIB)/
++
+ clean:
+ 	rm -f $(TARGET) $(OBJECTS) $(CLI_OBJECTS) $(STATIC_LIB) $(DEPS)
+ 
+-.PHONY: clean
++.PHONY: all install clean
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-graphics/spir/spirv-cross_git.bb b/meta-oe/recipes-graphics/spir/spirv-cross_git.bb
new file mode 100644
index 0000000..b787972
--- /dev/null
+++ b/meta-oe/recipes-graphics/spir/spirv-cross_git.bb
@@ -0,0 +1,22 @@
+SUMMARY  = "SPIRV-Cross is a tool designed for parsing and converting SPIR-V \
+to other shader languages"
+LICENSE  = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+SECTION = "graphics"
+
+S = "${WORKDIR}/git"
+SRCREV = "ed16b3e69985feaf565efbecea70a1cc2fca2a58"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Cross.git \
+	file://0001-Add-install-PHONY-target-in-Makefile.patch \
+"
+
+EXTRA_OEMAKE += 'TARGET_DIR_LIB="${D}${libdir}"' 
+EXTRA_OEMAKE += 'TARGET_DIR_BIN="${D}${bindir}"'
+
+do_compile () {
+	cd ${S} && oe_runmake
+}
+
+do_install () {
+	cd ${S} && oe_runmake install
+}
-- 
2.7.4


