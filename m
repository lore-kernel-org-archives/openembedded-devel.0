Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id B8C0761543
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2020 02:16:34 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id u12so11554460pgb.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 18:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ianvCSFNw9A0bals1/DKQqkbuuitrWX6WMTOJzNnnpI=;
	b=c77Zi+dSOz+8nJjTs6B+1aRC8ALgp5vfDE4XUnmmPVWAtutgeun+VVQQs7Be6be9AP
	dMGtgUigczI5IE9SIe4PoapXJ2Z+/XJrUzPMw7NnRmeJt36kMUmchP4ScnELko+FnIv6
	H4G1sXUN2V+9smsEbj3+pJps2ttEgH6QC4UpG67iJky2+uxiQ14rmLXGTMOb7wnr1UNJ
	Yl7js3TWw8a/ZyzRrPllnbGGuXXvN0eaMxYAAe8BmUYQ3yvsJaVgYbv4HvVgK5cC1XqQ
	+M4qR5d8nAXBB17txyW/DTrxwMv1C4XcNE4qWyoObkzVFaNBMbPcBuJTn/GK4E291Q+g
	ct5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ianvCSFNw9A0bals1/DKQqkbuuitrWX6WMTOJzNnnpI=;
	b=SdYE1Ru4OwzLG+h6UTMNUbPkAUDrGkzw5WQfAn8rIcOjjyjYOfeDzsjkdcNz+7eESB
	W6HD1UPOyLzb0lNRk7nU2uuQXHMVuGM4wChQ57h9rQ7TjFfCcAjFcpwRCyolOfSEkoQv
	mvFapI3IxHBJXev1EnY7wiTEt45LYw5a6JEYjlpfmMhHL4ZdeQ0On3Sf4xUoCBLof4cd
	cyNIPbUSRRIYjbfF3bQBJs2d9nhMmVb/IaLUfD2a6r/jQrbWg6+as1cQt7hffwh2bQLy
	uxSTXQ0u8W7gOWbvzyIpThC89dTyAptlG0p/M7tNTMCLzI0kfzdtbIXFVy80NS36qpMZ
	4kSA==
X-Gm-Message-State: APjAAAWkLfw7gUs81cx3lUM6QBCQv7PvVzZzberhvOwrZ+f5fWL5Ge1P
	OMC/N1fGnTEz2aQ2LAsRQGBsA80mMXo=
X-Google-Smtp-Source: APXvYqwVlNyxVJrRoOl9HQcsXW7XSiQZYFdSa1h08157wEEU8qAN8x5FZ9btJ/w2cWRGxC8eQm9glA==
X-Received: by 2002:a63:b257:: with SMTP id t23mr24870522pgo.17.1582078595290; 
	Tue, 18 Feb 2020 18:16:35 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::396c])
	by smtp.gmail.com with ESMTPSA id a10sm249228pgk.71.2020.02.18.18.16.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 18 Feb 2020 18:16:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Feb 2020 18:16:46 -0800
Message-Id: <20200219021646.712447-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2] pm-graph: Provide analyze-suspend as well
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
X-List-Received-Date: Wed, 19 Feb 2020 02:16:34 -0000
Content-Transfer-Encoding: 8bit

Remove stale analyze-suspend recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../analyze-suspend/analyze-suspend_5.5.bb    | 29 -------------------
 .../packagegroups/packagegroup-meta-oe.bb     |  2 +-
 .../recipes-kernel/pm-graph/pm-graph_5.5.bb   | 11 +++++++
 3 files changed, 12 insertions(+), 30 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_5.5.bb

diff --git a/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_5.5.bb b/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_5.5.bb
deleted file mode 100644
index bb0aad3413..0000000000
--- a/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_5.5.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "Analyze Suspend"
-DESCRIPTION = "analyze-suspend is a tool for system developers to visualize \
-the activity between suspend and resume, allowing them to identify \
-inefficiencies and bottlenecks."
-HOMEPAGE = "https://01.org/suspendresume"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
-
-# Apart from the listed RDEPENDS, analyze-suspend depends on some features
-# provided by the kernel. These options are:
-#   - CONFIG_PM_DEBUG=y
-#   - CONFIG_PM_SLEEP_DEBUG=y
-#   - CONFIG_FTRACE=y
-#   - CONFIG_FUNCTION_TRACER=y
-#   - CONFIG_FUNCTION_GRAPH_TRACER=y
-
-RDEPENDS_${PN} += "python-core python-datetime python-stringold"
-
-SRC_URI = "git://github.com/01org/suspendresume.git;protocol=https"
-SRCREV = "cf59527dc24fdd2f314ae4dcaeb3d68a117988f6"
-
-S = "${WORKDIR}/git"
-
-do_install() {
-    install -Dm 0755 analyze_suspend.py ${D}${bindir}/analyze_suspend.py
-    install -Dm 0644 README ${D}${docdir}/analyze-suspend/README
-}
-
-BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index bad4aa769e..3933619add 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -46,7 +46,7 @@ RDEPENDS_packagegroup-meta-oe = "\
 "
 
 RDEPENDS_packagegroup-meta-oe-benchmarks = "\
-    analyze-suspend dhrystone iperf2 linpack phoronix-test-suite \
+    pm-graph dhrystone iperf2 linpack phoronix-test-suite \
     tiobench bonnie++ fio iperf2 iperf3 lmbench s-suite whetstone \
     libc-bench memtester sysbench dbench iozone3 libhugetlbfs \
     nbench-byte tinymembench \
diff --git a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.5.bb b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.5.bb
index 63a9fa88e9..a1378866ad 100644
--- a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.5.bb
+++ b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.5.bb
@@ -12,11 +12,22 @@ SRC_URI = "git://github.com/intel/pm-graph.git \
 "
 S = "${WORKDIR}/git"
 
+# Apart from the listed RDEPENDS, analyze-suspend depends on some features
+# provided by the kernel. These options are:
+#   - CONFIG_PM_DEBUG=y
+#   - CONFIG_PM_SLEEP_DEBUG=y
+#   - CONFIG_FTRACE=y
+#   - CONFIG_FUNCTION_TRACER=y
+#   - CONFIG_FUNCTION_GRAPH_TRACER=y
+
 COMPATIBLE_HOST='(i.86|x86_64).*'
 EXTRA_OEMAKE = "PREFIX=${prefix} DESTDIR=${D} BASELIB=${baselib}"
 
 do_install() {
         oe_runmake install
+        install -Dm 0755 ${S}/analyze_suspend.py ${D}${bindir}/analyze_suspend.py
 }
 
 RDEPENDS_${PN} += "python3-core python3-threading python3-datetime python3-compression"
+RPROVIDES_${PN} = "analyze-suspend"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


