Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A0F3271388
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Sep 2014 16:27:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s89GRwfI005010
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 9 Sep 2014 09:27:58 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 9 Sep 2014 09:27:58 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 9 Sep 2014 09:27:45 -0700
Message-ID: <a476577b650e8b3acd0417e671143ec5cf55c4a3.1410279874.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1410279874.git.liezhi.yang@windriver.com>
References: <cover.1410279874.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 01/14] aoetools: no bashism in aoe-stat
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
X-List-Received-Date: Tue, 09 Sep 2014 16:28:01 -0000
Content-Type: text/plain

So use /bin/sh.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../aoetools/aoetools/aoe-stat-no-bashism.patch    |   27 ++++++++++++++++++++
 .../recipes-support/aoetools/aoetools_36.bb        |    4 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/aoetools/aoetools/aoe-stat-no-bashism.patch

diff --git a/meta-networking/recipes-support/aoetools/aoetools/aoe-stat-no-bashism.patch b/meta-networking/recipes-support/aoetools/aoetools/aoe-stat-no-bashism.patch
new file mode 100644
index 0000000..ec89b7a
--- /dev/null
+++ b/meta-networking/recipes-support/aoetools/aoetools/aoe-stat-no-bashism.patch
@@ -0,0 +1,27 @@
+From 38c97e590fde19213f6ba31e72d1c227db869427 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Sun, 31 Aug 2014 22:28:38 -0700
+Subject: [PATCH] aoe-stat.in: no bashism
+
+The checkbashisms shows there is no bashism, so use /bin/sh.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ aoe-stat.in |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/aoe-stat.in b/aoe-stat.in
+index 50e6ac6..0c1d6f5 100755
+--- a/aoe-stat.in
++++ b/aoe-stat.in
+@@ -1,4 +1,4 @@
+-#! /bin/bash
++#! /bin/sh
+ # aoe-stat - collate and present information about AoE storage
+ # Copyright 2012, CORAID, Inc., and licensed under GPL v.2.
+ 
+-- 
+1.7.9.5
+
diff --git a/meta-networking/recipes-support/aoetools/aoetools_36.bb b/meta-networking/recipes-support/aoetools/aoetools_36.bb
index 5bb486f..2b80ae7 100644
--- a/meta-networking/recipes-support/aoetools/aoetools_36.bb
+++ b/meta-networking/recipes-support/aoetools/aoetools_36.bb
@@ -10,7 +10,9 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 RRECOMMENDS_${PN} = "kernel-module-aoe"
 
-SRC_URI = "http://sourceforge.net/projects/${BPN}/files/${BPN}/${BPN}-${PV}.tar.gz"
+SRC_URI = "http://sourceforge.net/projects/${BPN}/files/${BPN}/${BPN}-${PV}.tar.gz \
+           file://aoe-stat-no-bashism.patch \
+        "
 SRC_URI[md5sum] = "bff30daa988a65f69d4448ce4726a6db"
 SRC_URI[sha256sum] = "fb5e2cd0de7644cc1ec04ee3aeb43211cf7445a0c19e13d6b3ed5a8fbdf215ff"
 
-- 
1.7.9.5


