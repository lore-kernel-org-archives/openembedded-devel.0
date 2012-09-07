Received: from zk223.dresearch-fe.de ([217.92.177.116])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@fensuse.internal.dresearch-fe.de>)
	id 1TA0RC-0001MY-2I for openembedded-devel@lists.openembedded.org;
	Fri, 07 Sep 2012 17:25:42 +0200
Received: from fensuse.internal.dresearch-fe.de
	(fensuse.internal.dresearch-fe.de [172.29.23.6])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id EF8FDE0228;
	Fri,  7 Sep 2012 15:04:43 +0000 (UTC)
Received: by fensuse.internal.dresearch-fe.de (Postfix, from userid 1000)
	id E853B7021C9; Fri,  7 Sep 2012 17:04:43 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Tom Rini <tom.rini@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Fri,  7 Sep 2012 17:04:38 +0200
Message-Id: <d7139c46a628d72ac781294d154e8c12ac9c52e6.1347029881.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1347029881.git.sledz@dresearch-fe.de>
References: <cover.1347029881.git.sledz@dresearch-fe.de>
Subject: [2011.03-maintenance 1/1] llvm2.7: provide "lseek64" symbol
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Sep 2012 15:25:42 -0000

EE: Provide the symbol "lseek64" explicitly with <unistd.h> on Linux glibc.

With libcxx, it seems <unistd.h> would not be provided. Thanks to Ryuta
Suzuki.

See also:

   <http://llvm.org/viewvc/llvm-project?view=rev&revision=137567>

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 recipes/llvm/llvm2.7/r137567-lseek64.patch |   23 +++++++++++++++++++++++
 recipes/llvm/llvm2.7_2.7.bb                |    3 ++-
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 recipes/llvm/llvm2.7/r137567-lseek64.patch

diff --git a/recipes/llvm/llvm2.7/r137567-lseek64.patch b/recipes/llvm/llvm2.7/r137567-lseek64.patch
new file mode 100644
index 0000000..a751d0f
--- /dev/null
+++ b/recipes/llvm/llvm2.7/r137567-lseek64.patch
@@ -0,0 +1,23 @@
+Upstream-Status: Accepted
+
+EE: Provide the symbol "lseek64" explicitly with <unistd.h> on Linux glibc.
+
+With libcxx, it seems <unistd.h> would not be provided. Thanks to Ryuta Suzuki.
+
+See also:
+
+   <http://llvm.org/viewvc/llvm-project?view=rev&revision=137567>
+
+Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
+
+diff -Nurd llvm-2.7.orig/lib/ExecutionEngine/JIT/Intercept.cpp llvm-2.7/lib/ExecutionEngine/JIT/Intercept.cpp
+--- llvm-2.7.orig/lib/ExecutionEngine/JIT/Intercept.cpp	2012-09-07 16:21:14.000000000 +0200
++++ llvm-2.7/lib/ExecutionEngine/JIT/Intercept.cpp	2012-09-07 16:22:14.000000000 +0200
+@@ -51,6 +51,7 @@
+ #if defined(HAVE_SYS_STAT_H)
+ #include <sys/stat.h>
+ #endif
++#include <unistd.h>"
+ #include <fcntl.h>
+ /* stat functions are redirecting to __xstat with a version number.  On x86-64 
+  * linking with libc_nonshared.a and -Wl,--export-dynamic doesn't make 'stat' 
diff --git a/recipes/llvm/llvm2.7_2.7.bb b/recipes/llvm/llvm2.7_2.7.bb
index 7d56e7d..758c337 100644
--- a/recipes/llvm/llvm2.7_2.7.bb
+++ b/recipes/llvm/llvm2.7_2.7.bb
@@ -1,6 +1,6 @@
 require llvm.inc
 
-PR = "r11"
+PR = "r12"
 
 DEPENDS = "llvm-common llvm2.7-native"
 
@@ -16,6 +16,7 @@ SRC_URI += "\
   file://r104653-BFC-BFI.patch \
   file://rawMOVLRPC.patch \
   file://include-fixes.patch \
+  file://r137567-lseek64.patch \
   "
 
 LLVM_RELEASE = "2.7"
-- 
1.7.10.4



