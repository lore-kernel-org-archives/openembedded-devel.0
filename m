Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1F2C67F102
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2019 11:57:05 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id x15so28538484wmj.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2019 04:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=pL/z3caPaUrz3ERfEDqVYUnoG7aC6L6ury9cD9Jl0mA=;
	b=GGc3LEqkk871ktmZF5sUFeFPL5gTCL7rCpXwwxzb4HkNyFn9xTFIDqlmttMrOBXzw4
	H58Aq9T2WhQBCEp0mH/Ok4xsAgUIJQae2r/SawncNpniaF+MqTRL6ZwDWa+nfm6ElvgF
	pRB5c5Vt/v3/lmQpps5XXglcVghdxdcY+csu+k4PjWYtueuz7+cmjH4pFl7DEhrQugcL
	O3VJh9DWLSPntW/lX3Tv356LLYsfX70E+RLbW8fXypkyqwo1fO1Jl2tVMfN+NC2/bFqj
	9SAxcEg1X2jrhmVcoNSvYEgM5uCVMsYniV1h1my0HdDqDLDaBnqPE2yUe1bd+7+0HNNn
	WC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pL/z3caPaUrz3ERfEDqVYUnoG7aC6L6ury9cD9Jl0mA=;
	b=IZsfEPWL3c8Wr+5YAwf9miqCsRfzeFNm0muUfT3YgJVx9llpplNWonMhzZHIjmkG3t
	KUERigkM1zwHyYpwnsIdnR6szjXnXzfJZVnoIEwYe7AJBQmvULBDJTk45Pyqze7oqhEC
	Y4gpOVZQ13QoS24bKE582KHGMcNW+2wb3wJFknYFHtCuTmNCtczC7xers3j0kXqR1je9
	KGgjpfcAxSX1UzUGLnHttMk9ydcAEO5cDso7Ak/hlwwM0VmgDhR3qcBYlrGsdWWN+KQj
	sK4BLkhImbUbYbSeMVelOZhqE5ZCoxXBPshUKvlaeZ3qoj3sszRx1v4fe+Udg5kESUlo
	EgQw==
X-Gm-Message-State: APjAAAXICNcWas9p4gZBhCu7zOmD3wEJ5pXXmWrENiiAgZEp7azKz9wk
	ePxeG5WpqIL4rZ/+sylMLpXAk+6bsnY=
X-Google-Smtp-Source: APXvYqzanIHYmnyjTitFDZ+Lnu4aMyySYDLeLgXHHQ2r/wnzf8IwM1W+UpAHMsvTu4PvVV9H6/4A/w==
X-Received: by 2002:a1c:1d08:: with SMTP id d8mr46578011wmd.22.1563537425426; 
	Fri, 19 Jul 2019 04:57:05 -0700 (PDT)
Received: from localhost.localdomain (193.164.125.18.ip.redstone-isp.net.
	[193.164.125.18]) by smtp.gmail.com with ESMTPSA id
	y16sm61068930wrg.85.2019.07.19.04.57.04
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 19 Jul 2019 04:57:04 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Jul 2019 12:57:03 +0100
Message-Id: <20190719115703.20858-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] zstd: New recipe
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
X-List-Received-Date: Fri, 19 Jul 2019 11:57:05 -0000

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta-oe/recipes-extended/zstd/zstd_1.4.0.bb | 50 +++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-extended/zstd/zstd_1.4.0.bb

diff --git a/meta-oe/recipes-extended/zstd/zstd_1.4.0.bb b/meta-oe/recipes-extended/zstd/zstd_1.4.0.bb
new file mode 100644
index 000000000000..823f7b5a53f6
--- /dev/null
+++ b/meta-oe/recipes-extended/zstd/zstd_1.4.0.bb
@@ -0,0 +1,50 @@
+SUMMARY = "Zstandard - Fast real-time compression algorithm"
+DESCRIPTION = "Zstandard is a fast lossless compression algorithm, targeting \
+real-time compression scenarios at zlib-level and better compression ratios. \
+It's backed by a very fast entropy stage, provided by Huff0 and FSE library."
+HOMEPAGE = "http://www.zstd.net/"
+SECTION = "console/utils"
+
+LICENSE = "BSD-3-Clause & GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c7f0b161edbe52f5f345a3d1311d0b32 \
+                    file://COPYING;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0"
+
+SRC_URI = "git://github.com/facebook/zstd.git;nobranch=1"
+
+SRCREV = "83b51e9f886be7c2a4d477b6e7bc6db831791d8d"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
+
+S = "${WORKDIR}/git"
+
+do_compile () {
+    oe_runmake
+    oe_runmake -C programs zstd-compress zstd-decompress zstd-frugal
+}
+
+do_install () {
+    oe_runmake install 'DESTDIR=${D}'
+    install -d -m 0755 ${D}${bindir}
+    install -m 0755 ${S}/programs/zstd-compress ${D}${bindir}
+    install -m 0755 ${S}/programs/zstd-decompress ${D}${bindir}
+    install -m 0755 ${S}/programs/zstd-frugal ${D}${bindir}
+}
+
+PACKAGE_BEFORE_PN += " \
+    ${PN}-compress \
+    ${PN}-decompress \
+    ${PN}-frugal \
+"
+
+FILES_${PN}-compress = " \
+    ${bindir}/zstd-compress \
+"
+
+FILES_${PN}-decompress = " \
+    ${bindir}/zstd-decompress \
+"
+
+FILES_${PN}-frugal = " \
+    ${bindir}/zstd-frugal \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.17.1


