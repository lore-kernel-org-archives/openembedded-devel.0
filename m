Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 18C0A77952
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Mar 2017 03:32:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2H3WUZ0007643
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Mar 2017 20:32:31 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 16 Mar 2017 20:32:30 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 17 Mar 2017 11:22:58 +0800
Message-ID: <20170317032258.6793-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2] gperftools: fix do_compile failure for qemuppc
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
X-List-Received-Date: Fri, 17 Mar 2017 03:32:31 -0000
Content-Type: text/plain

Fix the following error for qemuppc.

  error: 'siginfo_t' does not name a type

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../0001-Fix-build-failure-for-ppc.patch           | 28 ++++++++++++++++++++++
 .../recipes-support/gperftools/gperftools_2.5.bb   |  3 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/gperftools/gperftools/0001-Fix-build-failure-for-ppc.patch

diff --git a/meta-oe/recipes-support/gperftools/gperftools/0001-Fix-build-failure-for-ppc.patch b/meta-oe/recipes-support/gperftools/gperftools/0001-Fix-build-failure-for-ppc.patch
new file mode 100644
index 0000000..27f855d
--- /dev/null
+++ b/meta-oe/recipes-support/gperftools/gperftools/0001-Fix-build-failure-for-ppc.patch
@@ -0,0 +1,28 @@
+Subject: Fix build failure for ppc
+
+Upstream-Status: Pending
+
+Fix the following build failure.
+
+  error: 'siginfo_t' does not name a type
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/stacktrace_powerpc-linux-inl.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/stacktrace_powerpc-linux-inl.h b/src/stacktrace_powerpc-linux-inl.h
+index 5d16fa1..a9bf775 100644
+--- a/src/stacktrace_powerpc-linux-inl.h
++++ b/src/stacktrace_powerpc-linux-inl.h
+@@ -44,6 +44,7 @@
+ 
+ #include <stdint.h>   // for uintptr_t
+ #include <stdlib.h>   // for NULL
++#include <signal.h>   // for siginfo_t
+ #include <gperftools/stacktrace.h>
+ #include <base/vdso_support.h>
+ 
+-- 
+2.8.3
+
diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.5.bb b/meta-oe/recipes-support/gperftools/gperftools_2.5.bb
index 3cab423..15cfc97 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.5.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.5.bb
@@ -5,7 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=762732742c73dc6c7fbe8632f06c059a"
 DEPENDS = "libunwind"
 
 SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/gperftools/gperftools-2.5.tar.gz/aa1eaf95dbe2c9828d0bd3a00f770f50/gperftools-2.5.tar.gz \
-           file://0001-Support-Atomic-ops-on-clang.patch\
+           file://0001-Support-Atomic-ops-on-clang.patch \
+           file://0001-Fix-build-failure-for-ppc.patch \
           "
 
 SRC_URI[md5sum] = "aa1eaf95dbe2c9828d0bd3a00f770f50"
-- 
2.8.3


