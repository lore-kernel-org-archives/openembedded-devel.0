Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A4DFA600B3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Nov 2018 09:32:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAG9WK8A032566
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 16 Nov 2018 01:32:30 -0800
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 16 Nov 2018 01:32:09 -0800
From: <mingli.yu@windriver.com>
To: <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
Date: Fri, 16 Nov 2018 01:32:09 -0800
Message-ID: <20181116093209.123185-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] fio: Upgrade to 3.12
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
X-List-Received-Date: Fri, 16 Nov 2018 09:32:56 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Refresh 0001-update-the-interpreter-paths.patch as the
folder unit_tests/ is renamed to t/ in below commit:
c44d2c6e Move steady state unit test to t/

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../fio/files/0001-update-the-interpreter-paths.patch     | 8 ++++----
 meta-oe/recipes-benchmark/fio/{fio_3.8.bb => fio_3.12.bb} | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-benchmark/fio/{fio_3.8.bb => fio_3.12.bb} (96%)

diff --git a/meta-oe/recipes-benchmark/fio/files/0001-update-the-interpreter-paths.patch b/meta-oe/recipes-benchmark/fio/files/0001-update-the-interpreter-paths.patch
index 276a24d89..327b9f5b7 100644
--- a/meta-oe/recipes-benchmark/fio/files/0001-update-the-interpreter-paths.patch
+++ b/meta-oe/recipes-benchmark/fio/files/0001-update-the-interpreter-paths.patch
@@ -16,7 +16,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  tools/hist/fiologparser_hist.py | 2 +-
  tools/hist/half-bins.py         | 2 +-
  tools/plot/fio2gnuplot          | 2 +-
- unit_tests/steadystate_tests.py | 2 +-
+ t/steadystate_tests.py | 2 +-
  7 files changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/tools/fio_jsonplus_clat2csv b/tools/fio_jsonplus_clat2csv
@@ -79,10 +79,10 @@ index 4d1815cf..509141af 100755
  # Note: this script is python2 and python3 compatible.
  #
  #  Copyright (C) 2013 eNovance SAS <licensing@enovance.com>
-diff --git a/unit_tests/steadystate_tests.py b/unit_tests/steadystate_tests.py
+diff --git a/t/steadystate_tests.py b/t/steadystate_tests.py
 index 50254dcc..95e7dfde 100755
---- a/unit_tests/steadystate_tests.py
-+++ b/unit_tests/steadystate_tests.py
+--- a/t/steadystate_tests.py
++++ b/t/steadystate_tests.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/python2.7
 +#!/usr/bin/env python
diff --git a/meta-oe/recipes-benchmark/fio/fio_3.8.bb b/meta-oe/recipes-benchmark/fio/fio_3.12.bb
similarity index 96%
rename from meta-oe/recipes-benchmark/fio/fio_3.8.bb
rename to meta-oe/recipes-benchmark/fio/fio_3.12.bb
index 5bc48b052..2deb42db9 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.8.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.12.bb
@@ -21,7 +21,7 @@ PACKAGECONFIG ??= "${PACKAGECONFIG_NUMA}"
 PACKAGECONFIG[numa] = ",--disable-numa,numactl"
 
 # rev for v3.8
-SRCREV = "bfd986752ad053175423ffe3bbbeb07803f8ad4a"
+SRCREV = "16500b5a0b03ee0142d592bb74a46943a223b06e"
 SRC_URI = "git://git.kernel.dk/fio.git \
           file://0001-update-the-interpreter-paths.patch \
 "
-- 
2.17.1


