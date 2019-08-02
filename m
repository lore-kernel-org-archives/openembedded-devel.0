Return-Path: <Liwei.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F3D3A7F2DB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Aug 2019 03:01:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7231Sjj003537
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 1 Aug 2019 20:01:29 -0700 (PDT)
Received: from pek-lpggp3.wrs.com (128.224.153.76) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 1 Aug 2019 20:01:28 -0700
From: Liwei Song <liwei.song@windriver.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Thu, 1 Aug 2019 23:00:05 -0400
Message-ID: <20190802030005.63180-1-liwei.song@windriver.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] pm-graph: fix time format parse error
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
X-List-Received-Date: Fri, 02 Aug 2019 03:01:28 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Time format in dmesg has been changed from "%Y-%m-%d %H:%M:%S" to
"%Y-%m-%dT%H:%M:%S", backport an upstream patch to fix this error.

Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 .../pm-graph/pm-graph/0001-bootgraph.py.patch | 32 +++++++++++++++++++
 .../recipes-kernel/pm-graph/pm-graph_5.3.bb   |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-kernel/pm-graph/pm-graph/0001-bootgraph.py.patch

diff --git a/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-bootgraph.py.patch b/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-bootgraph.py.patch
new file mode 100644
index 000000000000..79685d612abe
--- /dev/null
+++ b/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-bootgraph.py.patch
@@ -0,0 +1,32 @@
+From 0c94e32b218c31f31a7988577fb9bec595034e7b Mon Sep 17 00:00:00 2001
+From: Todd Brandt <todd.e.brandt@linux.intel.com>
+Date: Fri, 10 May 2019 15:10:35 -0700
+Subject: [PATCH] bootgraph.py: - handle boot time start grep better, the regex
+ needs more complexity
+
+Upstream-Status: Backport
+
+Signed-off-by: Liwei Song <liwei.song@windriver.com>
+---
+ bootgraph.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/bootgraph.py b/bootgraph.py
+index a2b1b1897307..d7f4bd152bf1 100755
+--- a/bootgraph.py
++++ b/bootgraph.py
+@@ -333,9 +333,9 @@ def parseKernelLog():
+ 			if(not sysvals.stamp['kernel']):
+ 				sysvals.stamp['kernel'] = sysvals.kernelVersion(msg)
+ 			continue
+-		m = re.match('.* setting system clock to (?P<t>.*) UTC.*', msg)
++		m = re.match('.* setting system clock to (?P<d>[0-9\-]*)[ A-Z](?P<t>[0-9:]*) UTC.*', msg)
+ 		if(m):
+-			bt = datetime.strptime(m.group('t'), '%Y-%m-%d %H:%M:%S')
++			bt = datetime.strptime(m.group('d')+' '+m.group('t'), '%Y-%m-%d %H:%M:%S')
+ 			bt = bt - timedelta(seconds=int(ktime))
+ 			data.boottime = bt.strftime('%Y-%m-%d_%H:%M:%S')
+ 			sysvals.stamp['time'] = bt.strftime('%B %d %Y, %I:%M:%S %p')
+-- 
+2.22.0
+
diff --git a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
index ea12e054d3ab..a9f540ab8605 100644
--- a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
+++ b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
 SRCREV = "5be9a16547234cef5aca8bfaccd920490ea1cfa7"
 SRC_URI = "git://github.com/intel/pm-graph.git \
-           file://0001-Makefile-fix-multilib-build-failure.patch"
+           file://0001-Makefile-fix-multilib-build-failure.patch \
+           file://0001-bootgraph.py.patch \
+"
 S = "${WORKDIR}/git"
 
 COMPATIBLE_HOST='(i.86|x86_64).*'
-- 
2.22.0


