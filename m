Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7D8457D39B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2019 06:00:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x8560p60019660
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 4 Sep 2019 23:00:51 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Wed, 4 Sep 2019 23:00:50 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 5 Sep 2019 14:00:49 +0800
Message-ID: <1567663249-96567-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-filesystems][PATCH] xfsdump: support usrmerge
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
X-List-Received-Date: Thu, 05 Sep 2019 06:00:50 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../files/0001-xfsdump-support-usrmerge.patch      | 48 ++++++++++++++++++++++
 .../recipes-utils/xfsdump/xfsdump_3.1.8.bb         |  2 +-
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 meta-filesystems/recipes-utils/xfsdump/files/0001-xfsdump-support-usrmerge.patch

diff --git a/meta-filesystems/recipes-utils/xfsdump/files/0001-xfsdump-support-usrmerge.patch b/meta-filesystems/recipes-utils/xfsdump/files/0001-xfsdump-support-usrmerge.patch
new file mode 100644
index 0000000..04ec7b3
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfsdump/files/0001-xfsdump-support-usrmerge.patch
@@ -0,0 +1,48 @@
+From 2da4cfe17b994d7f10017561ca8efe6b6bd5f3cf Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 5 Sep 2019 11:17:15 +0800
+Subject: [PATCH] xfsdump: support usrmerge
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ dump/Makefile    | 4 +---
+ restore/Makefile | 4 +---
+ 2 files changed, 2 insertions(+), 6 deletions(-)
+
+diff --git a/dump/Makefile b/dump/Makefile
+index 97879fa..14da664 100644
+--- a/dump/Makefile
++++ b/dump/Makefile
+@@ -97,10 +97,8 @@ default: depend $(LTCOMMAND)
+ include $(BUILDRULES)
+ 
+ install: default
+-	$(INSTALL) -m 755 -d $(PKG_ROOT_SBIN_DIR)
+-	$(LTINSTALL) -m 755 $(LTCOMMAND) $(PKG_ROOT_SBIN_DIR)
+ 	$(INSTALL) -m 755 -d $(PKG_SBIN_DIR)
+-	$(INSTALL) -S $(PKG_ROOT_SBIN_DIR)/$(LTCOMMAND) $(PKG_SBIN_DIR)/$(LTCOMMAND)
++	$(LTINSTALL) -m 755 $(LTCOMMAND) $(PKG_SBIN_DIR)
+ install-dev:
+ 
+ .dep: $(COMMINCL) $(COMMON) $(INVINCL) $(INVCOMMON)
+diff --git a/restore/Makefile b/restore/Makefile
+index c6f3f25..7835ecc 100644
+--- a/restore/Makefile
++++ b/restore/Makefile
+@@ -107,10 +107,8 @@ default: depend $(LTCOMMAND)
+ include $(BUILDRULES)
+ 
+ install: default
+-	$(INSTALL) -m 755 -d $(PKG_ROOT_SBIN_DIR)
+-	$(LTINSTALL) -m 755 $(LTCOMMAND) $(PKG_ROOT_SBIN_DIR)
+ 	$(INSTALL) -m 755 -d $(PKG_SBIN_DIR)
+-	$(INSTALL) -S $(PKG_ROOT_SBIN_DIR)/$(LTCOMMAND) $(PKG_SBIN_DIR)/$(LTCOMMAND)
++	$(LTINSTALL) -m 755 $(LTCOMMAND) $(PKG_SBIN_DIR)
+ install-dev:
+ 
+ .dep: $(COMMINCL) $(COMMON) $(INVINCL) $(INVCOMMON)
+-- 
+2.7.4
+
diff --git a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.8.bb b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.8.bb
index 0421aa0..9c8e78e 100644
--- a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.8.bb
+++ b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.8.bb
@@ -12,7 +12,7 @@ DEPENDS = "xfsprogs attr"
 
 SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsdump/${BP}.tar.xz \
            file://remove-install-as-user.patch \
-           file://work-with-new-version-of-xfsprogs.patch \
+           ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://0001-xfsdump-support-usrmerge.patch','',d)} \
            "
 SRC_URI[md5sum] = "84d3bc287b4a2bb5d16b2320a47049a7"
 SRC_URI[sha256sum] = "ed14e67ae5b273c2698e767b43a46f033d361e540fe13feaaf9b110ee0edc585"
-- 
2.7.4


