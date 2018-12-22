Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 76C9D6079E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Dec 2018 17:43:51 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id g9so3931603plo.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Dec 2018 09:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=8yYTSBNbWfnHt1woKrwGzaruCgNepShKDJRXdPbFh3M=;
	b=tmszGlJrYHJR2ROCFePIHu391ukftQK3EWsKO/fgU+FIGXxYt0O9L4cXPtBXutNxI7
	5/aBZ17XQ46VP7wLfe7YkJabvnmzDrHxDqFV5IFeclkMVYbVAe98bFlPc9Y7RgBYlTzQ
	E09W5NFWGGb+2PgXsXplXOpqaqZSEX/YWgkutSJSB2/ezNVksBWufLHJxxXslibjaXES
	pmes0bCmwOQTv0wIkiZFQZ7Hdqdd9TdZ7JELj1WlMOmGYaMHIalvYGPUsMq9Ok6rjgJW
	A6eKdgvTwqLkJVTCm84yQmei0NDa6nDY16nih2/DxCGXLjTIUpOP2PtqxNhPqxaVW3Wt
	LmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=8yYTSBNbWfnHt1woKrwGzaruCgNepShKDJRXdPbFh3M=;
	b=U7e+ye6VdSR/xMDKBw2AMHEgFrmiF3i0kxjTbqe4IZTRueLH7MJbFcHDnU/DkkJlGB
	b/puwVo2QCQ+Z5nq+LmbzrW7Df4z2dn7mmSyOhUyrjrzt+55JTT9QoezW7gy95pY43pd
	S1xLxr+l9htMuY6/UI+ihN4cb+9+m5KTBWRbGbJ7VJMwSiILG8KBgW3h8g57S1oLPJH4
	vDgum4F41iEY2cPLnGPP2TWSQRftXTvc7yGnmjdbFROr34iCH1gjw8+zeEujFaYM1KFe
	SX1IfDVWqhixuJUlW2B5tCLrxPkCxPjWXRz5eDZS4fpHM0jxGlZiO17yNiXydt7xS7k+
	H4ww==
X-Gm-Message-State: AJcUukeJMxYUIjjUR8y/YiNfTRbUkjzA5AYX//ZQdaVpGsqzrz2e4jre
	OcAQ82+vktPytuDitEYu+4z9qnjpurw=
X-Google-Smtp-Source: ALg8bN44E/Y/2QcnPZwcexq1o0AZgDr51ZL/3TgbBSh/gjP3oj9487cSzDCC0IYuj6lZPz1Xk9aovw==
X-Received: by 2002:a17:902:6b87:: with SMTP id
	p7mr7310513plk.282.1545500632171; 
	Sat, 22 Dec 2018 09:43:52 -0800 (PST)
Received: from apnavik-DESK.iind.intel.com (fmdmzpr03-ext.fm.intel.com.
	[192.55.54.38]) by smtp.gmail.com with ESMTPSA id
	h9sm38420035pgd.53.2018.12.22.09.43.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 22 Dec 2018 09:43:51 -0800 (PST)
From: Ankit Navik <ankit.tarot@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Dec 2018 23:15:21 +0530
Message-Id: <1545500721-4167-1-git-send-email-ankit.tarot@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] spirv-shader-generator: Initial recipe for SPIRV-Cross
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
X-List-Received-Date: Sat, 22 Dec 2018 17:43:51 -0000

Add generic recipe for SPIRV-Cross tool.
SPIRV-Cross is a practical tool and library for performing reflection on
SPIR-V and disassembling SPIR-V back to high level languages.

Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
---
 ...0001-Add-install-PHONY-target-in-Makefile.patch | 31 ++++++++++++++++++++++
 .../spir/spirv-shader-generator_git.bb             | 22 +++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/spir/files/0001-Add-install-PHONY-target-in-Makefile.patch
 create mode 100644 meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb

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
diff --git a/meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb b/meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb
new file mode 100644
index 0000000..b787972
--- /dev/null
+++ b/meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb
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


