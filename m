Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C82307473A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jul 2018 10:02:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6KA2TmU003845
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jul 2018 03:02:29 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Fri, 20 Jul 2018 03:02:28 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 20 Jul 2018 03:02:28 -0700
Message-ID: <20180720100228.41795-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] fio: Upgrade to 3.7
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
X-List-Received-Date: Fri, 20 Jul 2018 10:02:29 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

* Licence-Update:
  Address update in COPYING
* Add patch 0001-update-the-interpreter-paths.patch
  and add python and bash to RDEPENDS_${PN} to fix
  below QA issues:
  ERROR: fio-3.7-r0 do_package_qa: QA Issue: /usr/bin/fiologparser.py contained in package fio requires /usr/bin/python2.7, but no providers found in RDEPENDS_fio? [file-rdeps]
  ERROR: fio-3.7-r0 do_package_qa: QA Issue: /usr/bin/genfio contained in package fio requires /usr/bin/bash, but no providers found in RDEPENDS_fio? [file-rdeps]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../0001-update-the-interpreter-paths.patch   | 94 +++++++++++++++++++
 .../fio/{fio_2.9.bb => fio_3.7.bb}            | 11 ++-
 2 files changed, 101 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/fio/files/0001-update-the-interpreter-paths.patch
 rename meta-oe/recipes-benchmark/fio/{fio_2.9.bb => fio_3.7.bb} (81%)

diff --git a/meta-oe/recipes-benchmark/fio/files/0001-update-the-interpreter-paths.patch b/meta-oe/recipes-benchmark/fio/files/0001-update-the-interpreter-paths.patch
new file mode 100644
index 000000000..276a24d89
--- /dev/null
+++ b/meta-oe/recipes-benchmark/fio/files/0001-update-the-interpreter-paths.patch
@@ -0,0 +1,94 @@
+From 55078e494bdf7da7dd9cb76077fa7ac2a66b6dd6 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Fri, 20 Jul 2018 02:33:25 -0700
+Subject: [PATCH] update the interpreter paths
+
+Update the interpreter path to make it more
+compatible
+
+Upstream-Status: Pending
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ tools/fio_jsonplus_clat2csv     | 2 +-
+ tools/fiologparser.py           | 2 +-
+ tools/genfio                    | 2 +-
+ tools/hist/fiologparser_hist.py | 2 +-
+ tools/hist/half-bins.py         | 2 +-
+ tools/plot/fio2gnuplot          | 2 +-
+ unit_tests/steadystate_tests.py | 2 +-
+ 7 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/tools/fio_jsonplus_clat2csv b/tools/fio_jsonplus_clat2csv
+index 78a007e5..0524b6e6 100755
+--- a/tools/fio_jsonplus_clat2csv
++++ b/tools/fio_jsonplus_clat2csv
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python2.7
++#!/usr/bin/env python
+ # Note: this script is python2 and python3 compatible.
+ #
+ # fio_jsonplus_clat2csv
+diff --git a/tools/fiologparser.py b/tools/fiologparser.py
+index cc29f1c7..ea60e783 100755
+--- a/tools/fiologparser.py
++++ b/tools/fiologparser.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python2.7
++#!/usr/bin/env python
+ # Note: this script is python2 and python 3 compatible.
+ #
+ # fiologparser.py
+diff --git a/tools/genfio b/tools/genfio
+index 286d814d..8518bbcc 100755
+--- a/tools/genfio
++++ b/tools/genfio
+@@ -1,4 +1,4 @@
+-#!/usr/bin/bash
++#!/bin/bash
+ #
+ #  Copyright (C) 2013 eNovance SAS <licensing@enovance.com>
+ #  Author: Erwan Velu  <erwan@enovance.com>
+diff --git a/tools/hist/fiologparser_hist.py b/tools/hist/fiologparser_hist.py
+index 8910d5fa..b77c2933 100755
+--- a/tools/hist/fiologparser_hist.py
++++ b/tools/hist/fiologparser_hist.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python2.7
++#!/usr/bin/env python
+ """ 
+     Utility for converting *_clat_hist* files generated by fio into latency statistics.
+     
+diff --git a/tools/hist/half-bins.py b/tools/hist/half-bins.py
+index 1bba8ff7..58d53e36 100755
+--- a/tools/hist/half-bins.py
++++ b/tools/hist/half-bins.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python2.7
++#!/usr/bin/env python
+ """ Cut the number bins in half in fio histogram output. Example usage:
+ 
+         $ half-bins.py -c 2 output_clat_hist.1.log > smaller_clat_hist.1.log
+diff --git a/tools/plot/fio2gnuplot b/tools/plot/fio2gnuplot
+index 4d1815cf..509141af 100755
+--- a/tools/plot/fio2gnuplot
++++ b/tools/plot/fio2gnuplot
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python2.7
++#!/usr/bin/env python
+ # Note: this script is python2 and python3 compatible.
+ #
+ #  Copyright (C) 2013 eNovance SAS <licensing@enovance.com>
+diff --git a/unit_tests/steadystate_tests.py b/unit_tests/steadystate_tests.py
+index 50254dcc..95e7dfde 100755
+--- a/unit_tests/steadystate_tests.py
++++ b/unit_tests/steadystate_tests.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python2.7
++#!/usr/bin/env python
+ # Note: this script is python2 and python 3 compatible.
+ #
+ # steadystate_tests.py
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-benchmark/fio/fio_2.9.bb b/meta-oe/recipes-benchmark/fio/fio_3.7.bb
similarity index 81%
rename from meta-oe/recipes-benchmark/fio/fio_2.9.bb
rename to meta-oe/recipes-benchmark/fio/fio_3.7.bb
index 67b513fa0..410e27b93 100644
--- a/meta-oe/recipes-benchmark/fio/fio_2.9.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.7.bb
@@ -8,9 +8,10 @@ files are included. fio displays all sorts of I/O performance information."
 HOMEPAGE = "http://freecode.com/projects/fio"
 SECTION = "console/tests"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "libaio zlib"
+RDEPENDS_${PN} = "python bash"
 
 PACKAGECONFIG_NUMA = "numa"
 # ARM does not currently support NUMA
@@ -19,9 +20,11 @@ PACKAGECONFIG_NUMA_arm = ""
 PACKAGECONFIG ??= "${PACKAGECONFIG_NUMA}"
 PACKAGECONFIG[numa] = ",--disable-numa,numactl"
 
-# rev for v2.9
-SRCREV = "fe8d0f4c54f0c308c9a02a4e3c2f5084e8bf5461"
-SRC_URI = "git://git.kernel.dk/fio.git"
+# rev for v3.7
+SRCREV = "c397ab3aac3d4ed1660d9cd4d820f31a4375306e"
+SRC_URI = "git://git.kernel.dk/fio.git \
+          file://0001-update-the-interpreter-paths.patch \
+"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


