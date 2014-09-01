Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 837BE6FCA3
	for <Openembedded-devel@lists.openembedded.org>;
	Mon,  1 Sep 2014 15:18:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s81FIbNI029608
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 1 Sep 2014 08:18:37 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 1 Sep 2014 08:18:36 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <Openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Sep 2014 08:18:23 -0700
Message-ID: <ebff9edcb4676dc4f70a425e2e3126fbc59aa836.1409584344.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1409584344.git.liezhi.yang@windriver.com>
References: <cover.1409584344.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 01/13] aoetools: no bashism in aoe-stat
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
X-List-Received-Date: Mon, 01 Sep 2014 15:18:37 -0000
Content-Type: text/plain

So use /bin/sh.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../aoetools/aoe-stat-no-checkbashism.patch        |   27 ++++++++++++++++++++
 .../recipes-support/aoetools/aoetools_34.bb        |    6 ++++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/aoetools/aoetools/aoe-stat-no-checkbashism.patch

diff --git a/meta-networking/recipes-support/aoetools/aoetools/aoe-stat-no-checkbashism.patch b/meta-networking/recipes-support/aoetools/aoetools/aoe-stat-no-checkbashism.patch
new file mode 100644
index 0000000..67632ca
--- /dev/null
+++ b/meta-networking/recipes-support/aoetools/aoetools/aoe-stat-no-checkbashism.patch
@@ -0,0 +1,27 @@
+From 38c97e590fde19213f6ba31e72d1c227db869427 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Sun, 31 Aug 2014 22:28:38 -0700
+Subject: [PATCH] aoe-stat.in: no checkbashism
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
+diff --git a/meta-networking/aoe-stat.in b/meta-networking/aoe-stat.in
+index 50e6ac6..0c1d6f5 100755
+--- a/meta-networking/aoe-stat.in
++++ b/meta-networking/aoe-stat.in
+@@ -1,4 +1,4 @@
+-#! /bin/bash
++#! /bin/sh
+ # aoe-stat - collate and present information about AoE storage
+ # Copyright 2012, CORAID, Inc., and licensed under GPL v.2.
+ 
+-- 
+1.7.9.5
+
diff --git a/meta-networking/recipes-support/aoetools/aoetools_34.bb b/meta-networking/recipes-support/aoetools/aoetools_34.bb
index eb1e0fe..09f61e9 100644
--- a/meta-networking/recipes-support/aoetools/aoetools_34.bb
+++ b/meta-networking/recipes-support/aoetools/aoetools_34.bb
@@ -10,7 +10,11 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 RRECOMMENDS_${PN} = "kernel-module-aoe"
 
-SRC_URI = "http://sourceforge.net/projects/${BPN}/files/${BPN}/${BPN}-${PV}.tar.gz"
+SRC_URI = "http://sourceforge.net/projects/${BPN}/files/${BPN}/${BPN}-${PV}.tar.gz \
+           file://aoe-stat-no-checkbashism.patch \
+        "
+
+
 SRC_URI[md5sum] = "cde7f7cedc7cd9938a5ebfd009dd3ec0"
 SRC_URI[sha256sum] = "fd6c57244e9458d7cbe7a0171295ddee4d8cdcae291e40d6acbc641df7296d85"
 
-- 
1.7.9.5


