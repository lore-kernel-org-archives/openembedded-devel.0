Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1BE7B78F69
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 16:11:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7DGBtw0004105
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Aug 2018 09:11:55 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 13 Aug 2018 09:11:54 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 14 Aug 2018 00:22:18 +0800
Message-ID: <155af7100edcdccc666cc910ea65b1807be2ac86.1534177115.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1534177115.git.hongxu.jia@windriver.com>
References: <cover.1534177115.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 3/5] python3-blivet: remove dmraid from dependency check
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
X-List-Received-Date: Mon, 13 Aug 2018 16:11:54 -0000
Content-Type: text/plain

OE does not have dmraid recipe, so remove it from dependency check.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0012-remove-dmraid-dependency-check.patch      | 31 ++++++++++++++++++++++
 .../python-blivet/python3-blivet_3.0.1.bb          |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0012-remove-dmraid-dependency-check.patch

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0012-remove-dmraid-dependency-check.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0012-remove-dmraid-dependency-check.patch
new file mode 100644
index 0000000..886e3ff
--- /dev/null
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0012-remove-dmraid-dependency-check.patch
@@ -0,0 +1,31 @@
+From 4476e846a1e64dde17df2e2370c803ce695514f9 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 6 Aug 2018 17:18:27 +0800
+Subject: [PATCH] remove dmraid dependency check
+
+OE does not support dmraid, remove it from dependency check
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ blivet/tasks/availability.py | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/blivet/tasks/availability.py b/blivet/tasks/availability.py
+index 9a87cfd..843cf6a 100644
+--- a/blivet/tasks/availability.py
++++ b/blivet/tasks/availability.py
+@@ -316,8 +316,7 @@ BLOCKDEV_DM_ALL_MODES = (blockdev.DMTechMode.CREATE_ACTIVATE |
+                          blockdev.DMTechMode.QUERY)
+ BLOCKDEV_DM = BlockDevTechInfo(plugin_name="dm",
+                                check_fn=blockdev.dm_is_tech_avail,
+-                               technologies={blockdev.DMTech.MAP: BLOCKDEV_DM_ALL_MODES,
+-                                             blockdev.DMTech.RAID: BLOCKDEV_DM_ALL_MODES})
++                               technologies={blockdev.DMTech.MAP: BLOCKDEV_DM_ALL_MODES})
+ BLOCKDEV_DM_TECH = BlockDevMethod(BLOCKDEV_DM)
+ 
+ # libblockdev loop plugin required technologies and modes
+-- 
+2.7.4
+
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet_3.0.1.bb b/meta-python/recipes-extended/python-blivet/python3-blivet_3.0.1.bb
index 218c158..5fcbd88 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet_3.0.1.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet_3.0.1.bb
@@ -21,6 +21,7 @@ SRC_URI = "git://github.com/rhinstaller/blivet;branch=3.1-release \
            file://0009-invoking-fsck-with-infinite-timeout.patch \
            file://0010-invoking-mkfs-with-infinite-timeout.patch \
            file://0011-invoking-dd-with-infinite-timeout.patch \
+           file://0012-remove-dmraid-dependency-check.patch \
 "
 
 UPSTREAM_CHECK_GITTAGREGEX = "blivet-(?P<pver>\d+(\.\d+)+)$"
-- 
2.7.4


