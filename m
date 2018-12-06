Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A30976C484
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Dec 2018 06:21:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wB66LxPG003394
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 5 Dec 2018 22:22:00 -0800 (PST)
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 5 Dec 2018 22:21:59 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 6 Dec 2018 14:39:30 +0800
Message-ID: <1544078370-1896-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] mce-test: add it
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
X-List-Received-Date: Thu, 06 Dec 2018 06:21:59 -0000
Content-Type: text/plain

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 .../mcelog/mce-test/makefile-remove-ldflags.patch  | 23 +++++++++++++++++
 meta-oe/recipes-support/mcelog/mce-test_git.bb     | 30 ++++++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-support/mcelog/mce-test/makefile-remove-ldflags.patch
 create mode 100644 meta-oe/recipes-support/mcelog/mce-test_git.bb

diff --git a/meta-oe/recipes-support/mcelog/mce-test/makefile-remove-ldflags.patch b/meta-oe/recipes-support/mcelog/mce-test/makefile-remove-ldflags.patch
new file mode 100644
index 0000000..0ffedd2
--- /dev/null
+++ b/meta-oe/recipes-support/mcelog/mce-test/makefile-remove-ldflags.patch
@@ -0,0 +1,23 @@
+Remove the default CFLAGS and LDFLAGS in Makefile. Ensure the extra linker flags can be passed.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
+diff --git a/cases/stress/hwpoison/Makefile b/cases/stress/hwpoison/Makefile
+index da1cbd8..dec5b14 100644
+--- a/cases/stress/hwpoison/Makefile
++++ b/cases/stress/hwpoison/Makefile
+@@ -1,8 +1,8 @@
+-CFLAGS := -g -Wall
+-LDFLAGS := -g
++#CFLAGS := -g -Wall
++#LDFLAGS := -g
+ 
+-export CFLAGS
+-export LDFLAGS
++#export CFLAGS
++#export LDFLAGS
+ 
+ all:
+ 	mkdir -p bin
diff --git a/meta-oe/recipes-support/mcelog/mce-test_git.bb b/meta-oe/recipes-support/mcelog/mce-test_git.bb
new file mode 100644
index 0000000..888c729
--- /dev/null
+++ b/meta-oe/recipes-support/mcelog/mce-test_git.bb
@@ -0,0 +1,30 @@
+#
+# Copyright (C) 2012 Wind River Systems, Inc.
+#
+SUMMARY = "MCE test suite"
+
+DESCRIPTION = "The MCE test suite is a collection of tools and test scripts for \
+testing the Linux RAS related features, including CPU/Memory error \
+containment and recovery, ACPI/APEI support etc."
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mce-test.git;protocol=git \
+           file://makefile-remove-ldflags.patch \
+          "
+SRCREV = "74bffd8b0aa27051aeaa1983a7b23975ca8d8726"
+PV = "20171030+git${SRCPV}"
+
+RDEPENDS_${PN} = "mcelog mce-inject dialog bash"
+
+COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
+
+S ="${WORKDIR}/git"
+
+do_install_append(){
+   install -d ${D}/opt/mce-test
+   cp -rf ${S}/* ${D}/opt/mce-test/
+}
+
+FILES_${PN} += "/opt"
-- 
2.7.4


