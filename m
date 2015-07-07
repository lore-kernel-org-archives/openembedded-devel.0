Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 791D273BB4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jul 2015 02:51:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="98150360"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Jul 2015 10:55:44 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t672o8A3017673
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 7 Jul 2015 10:50:08 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 7 Jul 2015 10:51:49 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 7 Jul 2015 10:51:38 +0800
Message-ID: <1436237498-1610-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH] multipath-tools: bug fix
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
X-List-Received-Date: Tue, 07 Jul 2015 02:52:01 -0000
Content-Type: text/plain

Modify multipathd.service,otherwise it can't be started successfully.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../files/0001-multipathd.service-Error-fix.patch  | 36 ++++++++++++++++++++++
 .../multipath-tools/multipath-tools_git.bb         |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-multipathd.service-Error-fix.patch

diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-multipathd.service-Error-fix.patch b/meta-oe/recipes-support/multipath-tools/files/0001-multipathd.service-Error-fix.patch
new file mode 100644
index 0000000..1e48e1c
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0001-multipathd.service-Error-fix.patch
@@ -0,0 +1,36 @@
+From 74ff5e1cf8ef83dabcf6e6b92f87d6761f7f4d51 Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Tue, 7 Jul 2015 11:34:36 +0900
+Subject: [PATCH] multipathd.service: Error fix
+
+Failed to start Device-Mapper Multipath Device Controller.
+
+Upstream-Status: pending
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ multipathd/multipathd.service | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/multipathd/multipathd.service b/multipathd/multipathd.service
+index be3ba3f..b8d3ecd 100644
+--- a/multipathd/multipathd.service
++++ b/multipathd/multipathd.service
+@@ -6,11 +6,12 @@ DefaultDependencies=no
+ Conflicts=shutdown.target
+ 
+ [Service]
+-Type=notify
++Type=forking
+ NotifyAccess=main
+ LimitCORE=infinity
++PIDFile=/var/run/multipathd.pid
+ ExecStartPre=/sbin/modprobe dm-multipath
+-ExecStart=/sbin/multipathd -d -s
++ExecStart=/sbin/multipathd
+ ExecReload=/sbin/multipathd reconfigure
+ 
+ [Install]
+-- 
+1.8.4.2
+
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
index f35cc3b..bb4e15c 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http \
            file://always-use-libdevmapper.patch \
            file://always-use-libdevmapper-kpartx.patch \
            file://do-not-link-libmpathpersist-to-TMPDIR.patch \
+           file://0001-multipathd.service-Error-fix.patch \
            "
 # 0.5.0
 #
-- 
1.8.4.2


