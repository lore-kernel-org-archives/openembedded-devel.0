Return-Path: <naveen.kumar.saini@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 72D487ECAA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2019 05:28:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Sep 2019 22:28:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="196784170"
Received: from saininav-desk1.png.intel.com ([172.30.199.130])
	by orsmga002.jf.intel.com with ESMTP; 10 Sep 2019 22:28:22 -0700
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Sep 2019 13:31:03 +0800
Message-Id: <20190911053103.12432-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] pm-graph: upgrade 5.3 -> 5.5
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
X-List-Received-Date: Wed, 11 Sep 2019 05:28:22 -0000

This release has python3 support so updating python3 to RDEPENDS.
python subprocess comes with python3-core, so removing from RDEPENDS.

Removed patch, which is already merged in this release.

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 .../pm-graph/pm-graph/0001-bootgraph.py.patch | 32 ---------------
 .../0001-sleepgraph.py-use-python3.patch      | 39 +++++++++++++++++++
 .../{pm-graph_5.3.bb => pm-graph_5.5.bb}      |  6 +--
 3 files changed, 42 insertions(+), 35 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/pm-graph/pm-graph/0001-bootgraph.py.patch
 create mode 100644 meta-oe/recipes-kernel/pm-graph/pm-graph/0001-sleepgraph.py-use-python3.patch
 rename meta-oe/recipes-kernel/pm-graph/{pm-graph_5.3.bb => pm-graph_5.5.bb} (75%)

diff --git a/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-bootgraph.py.patch b/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-bootgraph.py.patch
deleted file mode 100644
index d49ce0138..000000000
--- a/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-bootgraph.py.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 0c94e32b218c31f31a7988577fb9bec595034e7b Mon Sep 17 00:00:00 2001
-From: Todd Brandt <todd.e.brandt@linux.intel.com>
-Date: Fri, 10 May 2019 15:10:35 -0700
-Subject: [PATCH] bootgraph.py: - handle boot time start grep better, the regex
- needs more complexity
-
-Upstream-Status: Backport [https://github.com/intel/pm-graph/commit/0c94e32b218c31f31a7988577fb9bec595034e7b]
-
-Signed-off-by: Liwei Song <liwei.song@windriver.com>
----
- bootgraph.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/bootgraph.py b/bootgraph.py
-index a2b1b1897307..d7f4bd152bf1 100755
---- a/bootgraph.py
-+++ b/bootgraph.py
-@@ -333,9 +333,9 @@ def parseKernelLog():
- 			if(not sysvals.stamp['kernel']):
- 				sysvals.stamp['kernel'] = sysvals.kernelVersion(msg)
- 			continue
--		m = re.match('.* setting system clock to (?P<t>.*) UTC.*', msg)
-+		m = re.match('.* setting system clock to (?P<d>[0-9\-]*)[ A-Z](?P<t>[0-9:]*) UTC.*', msg)
- 		if(m):
--			bt = datetime.strptime(m.group('t'), '%Y-%m-%d %H:%M:%S')
-+			bt = datetime.strptime(m.group('d')+' '+m.group('t'), '%Y-%m-%d %H:%M:%S')
- 			bt = bt - timedelta(seconds=int(ktime))
- 			data.boottime = bt.strftime('%Y-%m-%d_%H:%M:%S')
- 			sysvals.stamp['time'] = bt.strftime('%B %d %Y, %I:%M:%S %p')
--- 
-2.22.0
-
diff --git a/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-sleepgraph.py-use-python3.patch b/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-sleepgraph.py-use-python3.patch
new file mode 100644
index 000000000..25c87093f
--- /dev/null
+++ b/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-sleepgraph.py-use-python3.patch
@@ -0,0 +1,39 @@
+From 22ce65d997f99606a3bb9d2a660ead42eecc234a Mon Sep 17 00:00:00 2001
+From: Naveen Saini <naveen.kumar.saini@intel.com>
+Date: Wed, 11 Sep 2019 11:31:07 +0800
+Subject: [PATCH] sleepgraph.py: use python3
+
+Already compatible with Python 3.
+Same goes for bootgraph.py
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+---
+ bootgraph.py  | 2 +-
+ sleepgraph.py | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/bootgraph.py b/bootgraph.py
+index d3b99a1..efb5714 100755
+--- a/bootgraph.py
++++ b/bootgraph.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/python3
+ # SPDX-License-Identifier: GPL-2.0-only
+ #
+ # Tool for analyzing boot timing
+diff --git a/sleepgraph.py b/sleepgraph.py
+index 1794c79..cfed8e0 100755
+--- a/sleepgraph.py
++++ b/sleepgraph.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/python3
+ # SPDX-License-Identifier: GPL-2.0-only
+ #
+ # Tool for analyzing suspend/resume timing
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.5.bb
similarity index 75%
rename from meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
rename to meta-oe/recipes-kernel/pm-graph/pm-graph_5.5.bb
index a9f540ab8..63a9fa88e 100644
--- a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
+++ b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.5.bb
@@ -5,10 +5,10 @@ HOMEPAGE = "https://01.org/pm-graph"
 LICENSE  = "GPL-2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
-SRCREV = "5be9a16547234cef5aca8bfaccd920490ea1cfa7"
+SRCREV = "cf59527dc24fdd2f314ae4dcaeb3d68a117988f6"
 SRC_URI = "git://github.com/intel/pm-graph.git \
            file://0001-Makefile-fix-multilib-build-failure.patch \
-           file://0001-bootgraph.py.patch \
+           file://0001-sleepgraph.py-use-python3.patch \
 "
 S = "${WORKDIR}/git"
 
@@ -19,4 +19,4 @@ do_install() {
         oe_runmake install
 }
 
-RDEPENDS_${PN} += "python-core python-threading python-datetime python-subprocess python-compression"
+RDEPENDS_${PN} += "python3-core python3-threading python3-datetime python3-compression"
-- 
2.17.1


