Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob13.myregisteredsite.com
	(atl4mhob13.myregisteredsite.com [209.17.115.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2DF006FFE8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Sep 2016 07:53:33 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.208])
	by atl4mhob13.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	u8S7rWjh011519 for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Sep 2016 03:53:32 -0400
Received: (qmail 17929 invoked by uid 0); 28 Sep 2016 07:53:32 -0000
X-TCPREMOTEIP: 37.74.225.130
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO mikebuntu.TOPIC.LOCAL)
	(mike@milosoftware.com@37.74.225.130)
	by 0 with ESMTPA; 28 Sep 2016 07:53:32 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Sep 2016 09:53:27 +0200
Message-Id: <1475049207-7642-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1474634029-22896-1-git-send-email-mike.looijmans@topic.nl>
References: <1474634029-22896-1-git-send-email-mike.looijmans@topic.nl>
Subject: [PATCH v2] phytool: Add recipe
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
X-List-Received-Date: Wed, 28 Sep 2016 07:53:36 -0000

A nice tool to directly read, write and interpret ethernet PHY data.
Very useful when debugging PHY or MDIO problems, which ethtool does
not do.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
v2:
  Add $bindir comment
  Add patch (pending upstream) to fix LDFLAGS warning
  Fix license filename

 meta-networking/recipes-support/phytool/phytool.bb | 17 ++++++++++++
 .../0001-Makefile-Honor-LDFLAGS-variable.patch     | 31 ++++++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta-networking/recipes-support/phytool/phytool.bb
 create mode 100644 meta-networking/recipes-support/phytool/phytool/0001-Makefile-Honor-LDFLAGS-variable.patch

diff --git a/meta-networking/recipes-support/phytool/phytool.bb b/meta-networking/recipes-support/phytool/phytool.bb
new file mode 100644
index 0000000..e95b035
--- /dev/null
+++ b/meta-networking/recipes-support/phytool/phytool.bb
@@ -0,0 +1,17 @@
+SUMMARY = "PHY interface tool for Linux"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0"
+
+PV = "1.0.1"
+SRCREV = "1a3ea62a218206e9faf3b27fb5d01c85692024c8"
+SRC_URI = "git://github.com/wkz/phytool.git \
+	file://0001-Makefile-Honor-LDFLAGS-variable.patch"
+
+S = "${WORKDIR}/git"
+
+# Intentionally not using $bindir here because the Makefile is hard-coded to
+# install into $PREFIX/bin
+do_install() {
+	install -d ${D}${prefix}/bin
+	oe_runmake 'DESTDIR=${D}' 'PREFIX=${prefix}' install
+}
diff --git a/meta-networking/recipes-support/phytool/phytool/0001-Makefile-Honor-LDFLAGS-variable.patch b/meta-networking/recipes-support/phytool/phytool/0001-Makefile-Honor-LDFLAGS-variable.patch
new file mode 100644
index 0000000..8b99d09
--- /dev/null
+++ b/meta-networking/recipes-support/phytool/phytool/0001-Makefile-Honor-LDFLAGS-variable.patch
@@ -0,0 +1,31 @@
+From 8b75a5e6238fe30661b672743560fe4d357237fd Mon Sep 17 00:00:00 2001
+From: Mike Looijmans <mike.looijmans@topic.nl>
+Date: Wed, 28 Sep 2016 09:42:45 +0200
+Subject: [PATCH] Makefile: Honor LDFLAGS variable
+
+Passing $(LDFLAGS) to the linker is important for cross-compile environments.
+OpenEmbedded builds will display QA errors like this:
+... QA Issue: No GNU_HASH in the elf binary ... [ldflags]
+
+Upstream-Status: Pending
+Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index b52843b..70bb414 100644
+--- a/Makefile
++++ b/Makefile
+@@ -22,7 +22,7 @@ hdrs = $(wildcard *.h)
+ 
+ phytool: $(objs)
+ 	@printf "  CC      $(subst $(ROOTDIR)/,,$(shell pwd)/$@)\n"
+-	@$(CC) $(LDLIBS) -o $@ $^
++	@$(CC) $(LDFLAGS) $(LDLIBS) -o $@ $^
+ 
+ all: phytool
+ 
+-- 
+1.9.1
+
-- 
1.9.1


