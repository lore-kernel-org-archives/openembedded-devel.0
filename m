Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id D69A66AC37
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jun 2015 03:37:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,625,1427731200"; d="scan'208";a="97242605"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Jun 2015 11:41:38 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5I3ZrJw032361
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jun 2015 11:35:53 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 18 Jun 2015 11:37:43 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 18 Jun 2015 11:28:40 +0800
Message-ID: <1434598120-50857-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-oe][PATCH] multipath-tools: fix build warning
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
X-List-Received-Date: Thu, 18 Jun 2015 03:37:29 -0000
Content-Type: text/plain

 NOTE: Executing RunQueue Tasks
 WARNING: QA Issue: Symlink /lib/libmpathpersist.so in multipath-tools-dev points to TMPDIR [symlink-to-sysroot]
 NOTE: Tasks Summary: Attempted 1604 tasks of which 1591 didn't need to be rerun and all succeeded.

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 .../do-not-link-libmpathpersist-to-TMPDIR.patch    | 30 ++++++++++++++++++++++
 .../multipath-tools/multipath-tools_git.bb         |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/do-not-link-libmpathpersist-to-TMPDIR.patch

diff --git a/meta-oe/recipes-support/multipath-tools/files/do-not-link-libmpathpersist-to-TMPDIR.patch b/meta-oe/recipes-support/multipath-tools/files/do-not-link-libmpathpersist-to-TMPDIR.patch
new file mode 100644
index 0000000..86d5e0e
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/do-not-link-libmpathpersist-to-TMPDIR.patch
@@ -0,0 +1,30 @@
+From fe65ac8face3c88d9d4e12811f44e63ad72c59ae Mon Sep 17 00:00:00 2001
+From: Bian Naimeng <biannm@cn.fujitsu.com>
+Date: Thu, 18 Jun 2015 12:25:25 +0900
+Subject: [PATCH] fix build warning
+
+  NOTE: Executing RunQueue Tasks
+  WARNING: QA Issue: Symlink /lib/libmpathpersist.so in multipath-tools-dev points to TMPDIR [symlink-to-sysroot]
+  NOTE: Tasks Summary: Attempted 1604 tasks of which 1591 didn't need to be rerun and all succeeded.
+
+Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
+---
+ libmpathpersist/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libmpathpersist/Makefile b/libmpathpersist/Makefile
+index c4ec1c5..62022eb 100644
+--- a/libmpathpersist/Makefile
++++ b/libmpathpersist/Makefile
+@@ -32,7 +32,7 @@ install: $(LIBS)
+ 	$(INSTALL_PROGRAM) -m 755 -d $(DESTDIR)$(man3dir)
+ 	$(INSTALL_PROGRAM) -m 755 -d $(DESTDIR)/usr/include/
+ 	$(INSTALL_PROGRAM) -m 755 -d $(DESTDIR)/usr/share/doc/mpathpersist/
+-	ln -sf $(DESTDIR)$(syslibdir)/$(LIBS) $(DESTDIR)$(syslibdir)/$(DEVLIB)
++	ln -sf $(syslibdir)/$(LIBS) $(DESTDIR)$(syslibdir)/$(DEVLIB)
+ 	install -m 644 mpath_persistent_reserve_in.3.gz $(DESTDIR)$(man3dir)	
+ 	install -m 644 mpath_persistent_reserve_out.3.gz $(DESTDIR)$(man3dir)	
+ 	install -m 644 mpath_persist.h $(DESTDIR)/usr/include/
+-- 
+1.8.4.2
+
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
index 055cfe6..f35cc3b 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
@@ -9,6 +9,7 @@ SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http \
            file://makefile_inc.patch \
            file://always-use-libdevmapper.patch \
            file://always-use-libdevmapper-kpartx.patch \
+           file://do-not-link-libmpathpersist-to-TMPDIR.patch \
            "
 # 0.5.0
 #
-- 
1.8.4.2


