Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D90C771A23
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Mar 2017 08:50:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2G8oMQB000766
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Mar 2017 01:50:23 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Thu, 16 Mar 2017 01:50:22 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Mar 2017 16:40:53 +0800
Message-ID: <20170316084053.26807-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [meta-oe][PATCH] gperftools: fix do_compile failure for qemuppc
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
X-List-Received-Date: Thu, 16 Mar 2017 08:50:24 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../files/0001-Fix-build-failure-for-ppc.patch     | 28 ++++++++++++++++++++++
 .../recipes-support/gperftools/gperftools_2.5.bb   |  3 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/gperftools/files/0001-Fix-build-failure-for-ppc.patch

diff --git a/meta-oe/recipes-support/gperftools/files/0001-Fix-build-failure-for-ppc.patch b/meta-oe/recipes-support/gperftools/files/0001-Fix-build-failure-for-ppc.patch
new file mode 100644
index 0000000..27f855d
--- /dev/null
+++ b/meta-oe/recipes-support/gperftools/files/0001-Fix-build-failure-for-ppc.patch
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
index 2e4479c..64766c6 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.5.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.5.bb
@@ -4,7 +4,8 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=762732742c73dc6c7fbe8632f06c059a"
 DEPENDS = "libunwind"
 
-SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/gperftools/gperftools-2.5.tar.gz/aa1eaf95dbe2c9828d0bd3a00f770f50/gperftools-2.5.tar.gz"
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/gperftools/gperftools-2.5.tar.gz/aa1eaf95dbe2c9828d0bd3a00f770f50/gperftools-2.5.tar.gz \
+           file://0001-Fix-build-failure-for-ppc.patch"
 
 SRC_URI[md5sum] = "aa1eaf95dbe2c9828d0bd3a00f770f50"
 SRC_URI[sha256sum] = "6fa2748f1acdf44d750253e160cf6e2e72571329b42e563b455bde09e9e85173"
-- 
2.8.3


