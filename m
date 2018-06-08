Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D7B7F75125
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jun 2018 01:39:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w581dsGv019512
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 7 Jun 2018 18:39:54 -0700 (PDT)
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Thu, 7 Jun 2018 18:39:53 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <anuj.mittal@intel.com>, <openembedded-devel@lists.openembedded.org>
Date: Fri, 8 Jun 2018 09:49:27 +0800
Message-ID: <1528422567-14811-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-intel][PATCH V2] mce-test: add it
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
X-List-Received-Date: Fri, 08 Jun 2018 01:39:54 -0000
Content-Type: text/plain

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 .../mce-test/files/makefile-remove-ldflags.patch   | 23 +++++++++++
 recipes-kernel/mce-test/mce-test_git.bb            | 48 ++++++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 recipes-kernel/mce-test/files/makefile-remove-ldflags.patch
 create mode 100644 recipes-kernel/mce-test/mce-test_git.bb

diff --git a/recipes-kernel/mce-test/files/makefile-remove-ldflags.patch b/recipes-kernel/mce-test/files/makefile-remove-ldflags.patch
new file mode 100644
index 0000000..0ffedd2
--- /dev/null
+++ b/recipes-kernel/mce-test/files/makefile-remove-ldflags.patch
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
diff --git a/recipes-kernel/mce-test/mce-test_git.bb b/recipes-kernel/mce-test/mce-test_git.bb
new file mode 100644
index 0000000..dca26a6
--- /dev/null
+++ b/recipes-kernel/mce-test/mce-test_git.bb
@@ -0,0 +1,48 @@
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
+PR = "r2"
+
+SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mce-test.git;protocol=git \
+           file://makefile-remove-ldflags.patch \
+          "
+# Use the commit date of SRCREV in PV.
+#
+SRCREV = "74bffd8b0aa27051aeaa1983a7b23975ca8d8726"
+PE = "1"
+PV = "20171030+git${SRCPV}"
+
+RDEPENDS_${PN} = "mcelog mce-inject dialog bash"
+
+COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
+
+S ="${WORKDIR}/git"
+
+inherit autotools-brokensep
+
+do_install_append(){
+   install -d ${D}/opt/mce-test
+   cp -rf ${S}/* ${D}/opt/mce-test/
+}
+
+FILES_${PN} += "/opt"
+FILES_${PN}-dbg += "/opt/mce-test/cases/function/hwpoison/.debug"
+FILES_${PN}-dbg += "/opt/mce-test/cases/function/erst-inject/.debug"
+FILES_${PN}-dbg += "/opt/mce-test/cases/function/pfa/.debug"
+FILES_${PN}-dbg += "/opt/mce-test/cases/function/core_recovery/.debug"
+FILES_${PN}-dbg += "/opt/mce-test/cases/stress/hwpoison/bin/.debug"
+FILES_${PN}-dbg += "/opt/mce-test/cases/stress/hwpoison/tools/page-poisoning/.debug"
+FILES_${PN}-dbg += "/opt/mce-test/cases/stress/hwpoison/tools/fs-metadata/.debug"
+FILES_${PN}-dbg += "/opt/mce-test/bin/.debug"
+FILES_${PN}-dbg += "/opt/mce-test/tools/ltp-pan/.debug"
+FILES_${PN}-dbg += "/opt/mce-test/tools/simple_process/.debug"
+FILES_${PN}-dbg += "/opt/mce-test/tools/page-types/.debug"
-- 
2.7.4


