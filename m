Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9EF4C77E76
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jun 2017 08:05:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v52852TS001227
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 2 Jun 2017 01:05:04 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Fri, 2 Jun 2017 01:05:01 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 2 Jun 2017 16:04:56 +0800
Message-ID: <9b7e73276796febe9ff831e6376cbb20d160c298.1496390474.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1496390474.git.jackie.huang@windriver.com>
References: <cover.1496390474.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/3] umip: fix for parallel compilation
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
X-List-Received-Date: Fri, 02 Jun 2017 08:05:03 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Add missing dependency in Makefile to fix the
parallel compile issue and re-enable PARALLEL_MAKE

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...ependency-to-support-parallel-compilation.patch | 23 ++++++++++++++++++++++
 meta-oe/recipes-connectivity/umip/umip_1.0.bb      |  6 +++---
 2 files changed, 26 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/umip/files/add-dependency-to-support-parallel-compilation.patch

diff --git a/meta-oe/recipes-connectivity/umip/files/add-dependency-to-support-parallel-compilation.patch b/meta-oe/recipes-connectivity/umip/files/add-dependency-to-support-parallel-compilation.patch
new file mode 100644
index 000000000..dbf008264
--- /dev/null
+++ b/meta-oe/recipes-connectivity/umip/files/add-dependency-to-support-parallel-compilation.patch
@@ -0,0 +1,23 @@
+When "make -j10", the compilation will fail,
+because scan.c has included gram.h, but gram.h was produced
+after scan.c was compiled
+
+So add this dependency to ensure that gram.h is produced
+before scan.c is produced.
+
+Upstream-Status: Inappropriate [upstream is not active]
+
+Signed-off-by: Roy.Li <RongQing.Li@windriver.com>
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ src/Makefile.am |    2 ++
+ 1 file changed, 2 insertions(+)
+
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -81,3 +81,5 @@ CLEANFILES = gram.c gram.h \
+ 
+ DISTCLEANFILES = $(BUILT_SOURCES)
+ MAINTAINERCLEANFILES = Makefile.in
++
++scan.c: gram.h
diff --git a/meta-oe/recipes-connectivity/umip/umip_1.0.bb b/meta-oe/recipes-connectivity/umip/umip_1.0.bb
index e80c1b130..e97dd48f6 100644
--- a/meta-oe/recipes-connectivity/umip/umip_1.0.bb
+++ b/meta-oe/recipes-connectivity/umip/umip_1.0.bb
@@ -9,12 +9,12 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=073dc31ccb2ebed70db54f1e8aeb4c33"
 DEPENDS = "rpm indent-native"
 
-SRC_URI = "git://git.umip.org/umip.git"
+SRC_URI = "git://git.umip.org/umip.git \
+    file://add-dependency-to-support-parallel-compilation.patch \
+"
 SRCREV = "428974c2d0d8e75a2750a3ab0488708c5dfdd8e3"
 
 S = "${WORKDIR}/git"
 EXTRA_OE_CONF = "--enable-vt"
 
 inherit autotools-brokensep
-
-PARALLEL_MAKE = ""
-- 
2.11.0


