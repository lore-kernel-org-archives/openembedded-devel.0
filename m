Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6FC227671F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2015 05:56:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99629412"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Aug 2015 14:00:06 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t7E5ui8S014742
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2015 13:56:44 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 14 Aug 2015 13:56:45 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 14 Aug 2015 13:56:57 +0800
Message-ID: <1439531817-34541-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [meta-oe][PATCH] dnsmasq: upgrade 2.72->2.75
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
X-List-Received-Date: Fri, 14 Aug 2015 05:56:50 -0000
Content-Type: text/plain

-parallel-make.patch is not needed any more,so delete.

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../dnsmasq/dnsmasq/parallel-make.patch               | 19 -------------------
 .../recipes-support/dnsmasq/dnsmasq_2.72.bb           | 10 ----------
 .../recipes-support/dnsmasq/dnsmasq_2.75.bb           |  9 +++++++++
 3 files changed, 9 insertions(+), 29 deletions(-)
 delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/parallel-make.patch
 delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.72.bb
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.75.bb

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq/parallel-make.patch b/meta-networking/recipes-support/dnsmasq/dnsmasq/parallel-make.patch
deleted file mode 100644
index 6d5b722..0000000
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq/parallel-make.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-The dnsmasq target depends on .configured and $(objs). .configured does an rm
--f *.o. Yet the only thing telling make to build the .configured target before
-the $(objs) target was the order of the dependencies of the dnsmasq target. We
-can't rely on that order when doing a paralllel make build, so add an explicit
-rule to enforce that order.
-
-Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-Upstream-status: Pending
-
---- dnsmasq-2.68.orig/Makefile
-+++ dnsmasq-2.68/Makefile
-@@ -139,6 +139,8 @@ bloatcheck : $(BUILDDIR)/dnsmasq_baselin
-	@rm -f *.o
-	@touch $@
-
-+$(objs): .configured
-+
- $(objs:.o=.c) $(hdrs):
-	ln -s $(top)/$(SRC)/$@ .
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.72.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.72.bb
deleted file mode 100644
index bd59194..0000000
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.72.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require dnsmasq.inc
-
-SRC_URI += "\
-    file://parallel-make.patch \
-    file://lua.patch \
-"
-
-SRC_URI[dnsmasq-2.72.md5sum] = "cf82f81cf09ad3d47612985012240483"
-SRC_URI[dnsmasq-2.72.sha256sum] = "635f1b47417d17cf32e45cfcfd0213ac39fd09918479a25373ba9b2ce4adc05d"
-
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.75.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.75.bb
new file mode 100644
index 0000000..a11aabb
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.75.bb
@@ -0,0 +1,9 @@
+require dnsmasq.inc
+
+SRC_URI += "\
+    file://lua.patch \
+"
+
+SRC_URI[dnsmasq-2.75.md5sum] = "d99ac126d4fe910c679d88430559669b"
+SRC_URI[dnsmasq-2.75.sha256sum] = "f8252c0a0ba162c2cd45f81140c7c17cc40a5fca2b869d1a420835b74acad294"
+
-- 
1.8.4.2


