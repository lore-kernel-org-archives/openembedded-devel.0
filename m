Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id DA0C96028A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 15:52:29 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6LFqS9w016414 for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 10:52:29 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014072110522893-32984 ;
	Mon, 21 Jul 2014 10:52:28 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Jul 2014 10:52:09 -0500
Message-Id: <1405957930-15362-3-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1405957930-15362-1-git-send-email-ben.shelton@ni.com>
References: <1405957930-15362-1-git-send-email-ben.shelton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/21/2014 10:52:28 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/21/2014 10:52:29 AM,
	Serialize complete at 07/21/2014 10:52:29 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-20_03:2014-07-18, 2014-07-20,
	1970-01-01 signatures=0
Subject: [meta-oe][PATCH 3/4] syslog-ng: Fix errant ulimit settings
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jul 2014 15:52:30 -0000

From: Richard Tollerton <rich.tollerton@ni.com>

Having a "minimum" of 4096 fds is kind of silly on some (most?) targets.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 .../recipes-support/syslog-ng/files/fd-limit.patch | 36 ++++++++++++++++++++++
 .../recipes-support/syslog-ng/syslog-ng_3.2.5.bb   |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/fd-limit.patch

diff --git a/meta-oe/recipes-support/syslog-ng/files/fd-limit.patch b/meta-oe/recipes-support/syslog-ng/files/fd-limit.patch
new file mode 100644
index 0000000..6c48c28
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/fd-limit.patch
@@ -0,0 +1,36 @@
+diff --git ./lib/gprocess.c-orig ./lib/gprocess.c
+index 3729ecb..6abef20 100644
+--- ./lib/gprocess.c-orig
++++ ./lib/gprocess.c
+@@ -604,23 +604,6 @@ g_process_detach_tty(void)
+ }
+ 
+ /**
+- * g_process_change_limits:
+- *
+- * Set fd limit.
+- *
+- **/
+-static void
+-g_process_change_limits(void)
+-{
+-  struct rlimit limit;
+-
+-  limit.rlim_cur = limit.rlim_max = process_opts.fd_limit_min;
+-  
+-  if (setrlimit(RLIMIT_NOFILE, &limit) < 0)
+-    g_process_message("Error setting file number limit; limit='%d'; error='%s'", process_opts.fd_limit_min, g_strerror(errno));
+-}
+-
+-/**
+  * g_process_detach_stdio:
+  *
+  * Use /dev/null as input/output/error. This function is idempotent, can be
+@@ -1253,7 +1236,6 @@ g_process_start(void)
+   pid_t pid;
+   
+   g_process_detach_tty();
+-  g_process_change_limits();
+   g_process_resolve_names();
+   
+   if (process_opts.mode == G_PM_BACKGROUND)
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bb
index 9f89740..bb65dfe 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bb
@@ -4,6 +4,7 @@ PR = "${INC_PR}.1"
 SRC_URI += " \
     file://syslog-ng.conf \
     file://initscript \
+    file://fd-limit.patch \
 "
 
 FILES_${PN} += "${libdir}/${BPN}/*"
-- 
2.0.2


