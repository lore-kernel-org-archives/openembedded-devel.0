Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1URnyr-0008T0-Ac
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 20:18:20 +0200
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 45667D2284
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2013 20:00:11 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Apr 2013 20:00:47 +0200
Message-Id: <1366048847-6777-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <20130409095840.GA2474@jama>
References: <20130409095840.GA2474@jama>
Subject: [meta-oe][PATCH v2] tbb: update to 4.1 Update 3 version from 20130314
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
X-List-Received-Date: Mon, 15 Apr 2013 18:18:23 -0000

ARMv7a support was added in 4.1 Update 3
Older ARM cores support was added by me.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../tbb/allow-to-build-for-older-arm-cores.patch   | 30 ++++++++++++++++++++++
 meta-oe/recipes-support/tbb/tbb_4.1.bb             |  7 ++---
 2 files changed, 34 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/tbb/tbb/allow-to-build-for-older-arm-cores.patch

diff --git a/meta-oe/recipes-support/tbb/tbb/allow-to-build-for-older-arm-cores.patch b/meta-oe/recipes-support/tbb/tbb/allow-to-build-for-older-arm-cores.patch
new file mode 100644
index 0000000..cd2ec94
--- /dev/null
+++ b/meta-oe/recipes-support/tbb/tbb/allow-to-build-for-older-arm-cores.patch
@@ -0,0 +1,30 @@
+From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
+Description: Allow to build TBB for ARM cores older than ARMv7a
+
+| ../../include/tbb/machine/gcc_armv7.h:39:2: error: #error Threading
+Building Blocks ARM port requires an ARMv7-a architecture.
+| make[1]: *** [concurrent_hash_map.o] Error 1
+
+https://bugs.launchpad.net/linaro-oe/+bug/1167144
+
+Upstream-status: pending
+
+---
+ include/tbb/tbb_machine.h |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- tbb41_20130314oss.orig/include/tbb/tbb_machine.h
++++ tbb41_20130314oss/include/tbb/tbb_machine.h
+@@ -237,11 +237,11 @@ template<> struct atomic_selector<8> {
+         #include "machine/linux_intel64.h"
+     #elif __ia64__
+         #include "machine/linux_ia64.h"
+     #elif __powerpc__
+         #include "machine/mac_ppc.h"
+-    #elif __arm__
++    #elif __ARM_ARCH_7A__
+         #include "machine/gcc_armv7.h"
+     #elif __TBB_GCC_BUILTIN_ATOMICS_PRESENT
+         #include "machine/gcc_generic.h"
+     #endif
+     #include "machine/linux_common.h"
diff --git a/meta-oe/recipes-support/tbb/tbb_4.1.bb b/meta-oe/recipes-support/tbb/tbb_4.1.bb
index a159321..96137bc 100644
--- a/meta-oe/recipes-support/tbb/tbb_4.1.bb
+++ b/meta-oe/recipes-support/tbb/tbb_4.1.bb
@@ -6,17 +6,18 @@ DESCRIPTION = "Parallelism library for C++ - runtime files \
 HOMEPAGE = "http://threadingbuildingblocks.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2c7f2caf277a3933e3acdf7f89d54cc1"
-PRDATE = "20130116"
+PRDATE = "20130314"
 PR = "r${PRDATE}"
 
 SRC_URI = "http://threadingbuildingblocks.org/sites/default/files/software_releases/source/tbb41_${PRDATE}oss_src.tgz \
            file://cross-compile.patch \
+           file://allow-to-build-for-older-arm-cores.patch \
            file://tbb.pc"
 
 S = "${WORKDIR}/tbb41_${PRDATE}oss/"
 
-SRC_URI[md5sum] = "3809790e1001a1b32d59c9fee590ee85"
-SRC_URI[sha256sum] = "4ae2c10899e3b6ef2f686013ec5901fc658444ca90178efaca6014b0665c34b6"
+SRC_URI[md5sum] = "ed4af7ccfa122f16cf9920b241633a3a"
+SRC_URI[sha256sum] = "32fd5979971b772caa96d40646cee585ed0070516ba2dbbcb1f9b6033d08a92d"
 
 do_compile() {
     oe_runmake compiler=gcc arch=${HOST_ARCH} runtime=cc4
-- 
1.8.1.2



