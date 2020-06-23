Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.1595.1592893314439465001
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2020 23:21:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: liwei.song@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05N6L1HD028382
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Jun 2020 23:21:43 -0700
Received: from pek-lpggp3.wrs.com (128.224.153.76) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Mon, 22 Jun 2020
 23:21:30 -0700
From: "LiweiSong" <liwei.song@windriver.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
CC: <liwei.song@windriver.com>
Subject: [oe][meta-oe][PATCH] pm-graph: add flags support for RT kernel
Date: Tue, 23 Jun 2020 14:21:27 +0800
Message-ID: <20200623062127.37418-1-liwei.song@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

with PREEMPT_RT enabled in kernel, ftrace have a different
falgs compare with standard kernel. Add supported for
RT kernel ftrace flags format.

Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 ...d-support-for-RT-kernel-ftrace-flags.patch | 42 +++++++++++++++++++
 .../recipes-kernel/pm-graph/pm-graph_5.5.bb   |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/pm-graph/pm-graph/0001-sleepgraph-add-support-for-RT-kernel-ftrace-flags.patch

diff --git a/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-sleepgraph-add-support-for-RT-kernel-ftrace-flags.patch b/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-sleepgraph-add-support-for-RT-kernel-ftrace-flags.patch
new file mode 100644
index 000000000000..f7f8bc06871d
--- /dev/null
+++ b/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-sleepgraph-add-support-for-RT-kernel-ftrace-flags.patch
@@ -0,0 +1,42 @@
+From 47a1db21f6c5d17c94c58c3fe0dcce35c623dbf4 Mon Sep 17 00:00:00 2001
+From: Liwei Song <liwei.song@windriver.com>
+Date: Tue, 23 Jun 2020 04:47:20 +0000
+Subject: [PATCH] sleepgraph: add support for RT kernel ftrace flags
+
+with PREEMPT_RT enabled in kernel, ftrace have a different
+flags format:
+
+                   _-----=> irqs-off
+                  / _----=> need-resched
+                 | / _----=> need-resched
+                 || / _---=> hardirq/softirq
+                 ||| / _--=> preempt-depth
+                 ||||/     delay
+TASK-PID   CPU#  |||||   TIMESTAMP  FUNCTION
+   | |       |   |||||      |         |
+
+add support for this.
+
+Upstream-Status: Submitted [https://github.com/intel/pm-graph/pull/18]
+
+Signed-off-by: Liwei Song <liwei.song@windriver.com>
+---
+ sleepgraph.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sleepgraph.py b/sleepgraph.py
+index cfed8e09e0e6..561f165cf9be 100755
+--- a/sleepgraph.py
++++ b/sleepgraph.py
+@@ -2689,7 +2689,7 @@ class TestProps:
+ 		'[ +!#\*@$]*(?P<dur>[0-9\.]*) .*\|  (?P<msg>.*)'
+ 	ftrace_line_fmt_nop = \
+ 		' *(?P<proc>.*)-(?P<pid>[0-9]*) *\[(?P<cpu>[0-9]*)\] *'+\
+-		'(?P<flags>.{4}) *(?P<time>[0-9\.]*): *'+\
++		'(?P<flags>.{4,7}) *(?P<time>[0-9\.]*): *'+\
+ 		'(?P<msg>.*)'
+ 	def __init__(self):
+ 		self.stamp = ''
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.5.bb b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.5.bb
index a1378866ad47..4526eeed3fe6 100644
--- a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.5.bb
+++ b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.5.bb
@@ -9,6 +9,7 @@ SRCREV = "cf59527dc24fdd2f314ae4dcaeb3d68a117988f6"
 SRC_URI = "git://github.com/intel/pm-graph.git \
            file://0001-Makefile-fix-multilib-build-failure.patch \
            file://0001-sleepgraph.py-use-python3.patch \
+           file://0001-sleepgraph-add-support-for-RT-kernel-ftrace-flags.patch \
 "
 S = "${WORKDIR}/git"
 
-- 
2.17.1

