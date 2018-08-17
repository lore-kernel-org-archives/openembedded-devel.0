Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 25B73792EE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Aug 2018 09:37:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7H9bJGr006529
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Aug 2018 02:37:19 -0700 (PDT)
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Fri, 17 Aug 2018 02:37:18 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 17 Aug 2018 17:47:49 +0800
Message-ID: <1534499269-29908-2-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534499269-29908-1-git-send-email-dengke.du@windriver.com>
References: <1534499269-29908-1-git-send-email-dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] kernel-selftest: add ptest support
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
X-List-Received-Date: Fri, 17 Aug 2018 09:37:18 -0000
Content-Type: text/plain

Group the kernel-selftest testcases in run-ptest.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb     |  4 +++-
 .../recipes-kernel/kernel-selftest/kernel-selftest/run-ptest  | 11 +++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100755 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/run-ptest

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index d5ccace..d2923bc 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -4,6 +4,8 @@ LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7 \
 "
+SRC_URI += "file://run-ptest \
+"
 
 # for musl libc
 SRC_URI_libc-musl += "file://userfaultfd.patch \
@@ -17,7 +19,7 @@ PACKAGECONFIG[vm] = ",,,libgcc bash"
 
 do_patch[depends] += "virtual/kernel:do_shared_workdir"
 
-inherit linux-kernel-base kernel-arch
+inherit linux-kernel-base kernel-arch ptest
 
 do_populate_lic[depends] += "virtual/kernel:do_patch"
 
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/run-ptest b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/run-ptest
new file mode 100755
index 0000000..d40b957
--- /dev/null
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/run-ptest
@@ -0,0 +1,11 @@
+#!/bin/sh
+export PATH=$PATH:/usr/kernel-selftest/bpf
+
+# test_align
+test_align | grep "12 pass" &> /dev/null
+if [ $? == 0 ]; then
+    echo "[PASS]: test_align"
+else
+    echo "[FAIL]: test_align"
+fi
+
-- 
2.7.4


