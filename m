Return-Path: <avinash.reddy.palleti@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 01414792B8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Aug 2018 04:19:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Aug 2018 21:19:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,249,1531810800"; d="scan'208";a="73465584"
Received: from arpallet-desk.iind.intel.com ([10.66.247.158])
	by FMSMGA003.fm.intel.com with ESMTP; 16 Aug 2018 21:19:04 -0700
From: avinash.reddy.palleti@intel.com
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Aug 2018 09:47:39 +0530
Message-Id: <1534479459-4263-1-git-send-email-avinash.reddy.palleti@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH v3] cpuid: Fix build with glibc 2.28+
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
X-List-Received-Date: Fri, 17 Aug 2018 04:19:04 -0000

From: Avinash Reddy Palleti <avinash.reddy.palleti@intel.com>

Include sys/sysmacros.h for cpuid.c

Upstream-Status:Pending
Signed-off-by: Avinash Reddy Palleti <avinash.reddy.palleti@intel.com>
---
 meta-oe/recipes-devtools/cpuid/cpuid_20170122.bb   |  3 ++-
 ...ix-Add-sys-sysmacros.h-to-fix-build-issue.patch | 24 ++++++++++++++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/cpuid/files/0001-Fix-Add-sys-sysmacros.h-to-fix-build-issue.patch

diff --git a/meta-oe/recipes-devtools/cpuid/cpuid_20170122.bb b/meta-oe/recipes-devtools/cpuid/cpuid_20170122.bb
index 7a70f75..5dd1bdd 100644
--- a/meta-oe/recipes-devtools/cpuid/cpuid_20170122.bb
+++ b/meta-oe/recipes-devtools/cpuid/cpuid_20170122.bb
@@ -6,7 +6,8 @@ UMC, NexGen, Rise, and SiS CPUs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "http://www.etallen.com/${BPN}/${BP}.src.tar.gz"
+SRC_URI = "http://www.etallen.com/${BPN}/${BP}.src.tar.gz \
+           file://0001-Fix-Add-sys-sysmacros.h-to-fix-build-issue.patch"
 SRC_URI[md5sum] = "1c46a6662626c5a6eaca626f23a5a7d7"
 SRC_URI[sha256sum] = "667612aae6704341dd10844e97c84c5c5c8700817a5937a3c293b55013bc4865"
 
diff --git a/meta-oe/recipes-devtools/cpuid/files/0001-Fix-Add-sys-sysmacros.h-to-fix-build-issue.patch b/meta-oe/recipes-devtools/cpuid/files/0001-Fix-Add-sys-sysmacros.h-to-fix-build-issue.patch
new file mode 100644
index 0000000..985182e
--- /dev/null
+++ b/meta-oe/recipes-devtools/cpuid/files/0001-Fix-Add-sys-sysmacros.h-to-fix-build-issue.patch
@@ -0,0 +1,24 @@
+From 2693a499d4eec4504962e85a9713fa6431d3025f Mon Sep 17 00:00:00 2001
+From: Avinash Reddy Palleti <avinash.reddy.palleti@intel.com>
+Date: Thu, 16 Aug 2018 22:36:31 +0530
+Subject: [PATCH] Fix: Add sys/sysmacros.h to fix build issue
+
+---
+ cpuid.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/cpuid.c b/cpuid.c
+index 3c94837..0a98616 100644
+--- a/cpuid.c
++++ b/cpuid.c
+@@ -31,6 +31,7 @@
+ #include <stdio.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
++#include <sys/sysmacros.h>
+ #include <fcntl.h>
+ #include <errno.h>
+ #include <unistd.h>
+-- 
+2.7.4
+
-- 
2.7.4


