Received: from compulab.co.il ([67.18.134.219])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mike@compulab.co.il>) id 1NFl8O-0008JG-P7
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Dec 2009 10:04:32 +0100
Received: from [62.90.235.247] (helo=zimbra-mta.compulab.co.il)
	by compulab.site5.com with esmtp (Exim 4.69)
	(envelope-from <mike@compulab.co.il>) id 1NFkYh-0001Nm-5M
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Dec 2009 02:27:35 -0600
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zimbra-mta.compulab.co.il (Postfix) with ESMTP id 429C59A0359
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Dec 2009 10:27:34 +0200 (IST)
X-Virus-Scanned: amavisd-new at compulab.co.il
Received: from zimbra-mta.compulab.co.il ([127.0.0.1])
	by localhost (zimbra-mta.compulab.co.il [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id TkUjqGdtNFfw; Wed,  2 Dec 2009 10:27:33 +0200 (IST)
Received: from droid.compulab.local (droid.compulab.local [10.1.1.77])
	by zimbra-mta.compulab.co.il (Postfix) with ESMTP id 2A5189A034C;
	Wed,  2 Dec 2009 10:27:33 +0200 (IST)
Received: from droid.compulab.local (localhost [127.0.0.1])
	by droid.compulab.local (8.14.0/8.14.0) with ESMTP id nB28NGYG019527;
	Wed, 2 Dec 2009 10:23:16 +0200
Received: (from mike@localhost)
	by droid.compulab.local (8.14.0/8.14.0/Submit) id nB28NFjW019526;
	Wed, 2 Dec 2009 10:23:15 +0200
X-Authentication-Warning: droid.compulab.local: mike set sender to
	mike@compulab.co.il using -f
From: Mike Rapoport <mike@compulab.co.il>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Dec 2009 10:23:14 +0200
Message-Id: <1259742194-19490-1-git-send-email-mike@compulab.co.il>
X-Mailer: git-send-email 1.6.4.4
X-ACL-Warn: {
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - compulab.site5.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - compulab.co.il
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 67.18.134.219
X-SA-Exim-Mail-From: mike@compulab.co.il
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] omap3-sgx-modules: fix build for recent kernels
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
X-List-Received-Date: Wed, 02 Dec 2009 09:04:32 -0000

Starting from v2.6.32-rc6 of linux-omap tree the
arch/arm/plat-omap/include/mach has been moved to
arch/arm/plat-omap/include/plat
Take care of that change

Signed-off-by: Mike Rapoport <mike@compulab.co.il>
---
 .../0001-Compile-fixes-for-recent-kernels.patch    |   28 ++++++++++++++++++++
 .../omap3-sgx-modules_1.3.13.1607.bb               |    1 +
 2 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 recipes/powervr-drivers/omap3-sgx-modules/0001-Compile-fixes-for-recent-kernels.patch

diff --git a/recipes/powervr-drivers/omap3-sgx-modules/0001-Compile-fixes-for-recent-kernels.patch b/recipes/powervr-drivers/omap3-sgx-modules/0001-Compile-fixes-for-recent-kernels.patch
new file mode 100644
index 0000000..53b1f27
--- /dev/null
+++ b/recipes/powervr-drivers/omap3-sgx-modules/0001-Compile-fixes-for-recent-kernels.patch
@@ -0,0 +1,28 @@
+From ef693358e658a7cbab4d2696108d9d4240ab8096 Mon Sep 17 00:00:00 2001
+From: Mike Rapoport <mike@compulab.co.il>
+Date: Wed, 2 Dec 2009 10:13:15 +0200
+Subject: [PATCH] Compile fixes for recent kernels
+
+---
+ .../3rdparty/dc_omap3430_linux/omaplfb_linux.c     |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/services4/3rdparty/dc_omap3430_linux/omaplfb_linux.c b/services4/3rdparty/dc_omap3430_linux/omaplfb_linux.c
+index 935f78b..4d41829 100755
+--- a/services4/3rdparty/dc_omap3430_linux/omaplfb_linux.c
++++ b/services4/3rdparty/dc_omap3430_linux/omaplfb_linux.c
+@@ -57,7 +57,11 @@ extern int omap_dispc_request_irq(unsigned long, void (*)(void *), void *);
+ extern void omap_dispc_free_irq(unsigned long, void (*)(void *), void *);
+ extern void omap_dispc_set_plane_base(int plane, IMG_UINT32 phys_addr);
+ #else
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,32)
++#include <plat/display.h>
++#else
+ #include <mach/display.h>
++#endif
+ #include <linux/console.h>
+ #include <linux/fb.h>
+ #endif
+-- 
+1.6.4.4
+
diff --git a/recipes/powervr-drivers/omap3-sgx-modules_1.3.13.1607.bb b/recipes/powervr-drivers/omap3-sgx-modules_1.3.13.1607.bb
index 9bd77ad..603c81f 100644
--- a/recipes/powervr-drivers/omap3-sgx-modules_1.3.13.1607.bb
+++ b/recipes/powervr-drivers/omap3-sgx-modules_1.3.13.1607.bb
@@ -8,6 +8,7 @@ SRC_URI = "file://omap3-sgx-modules-${PV}.tar.bz2 \
            file://rotation-dss2.patch;patch=1 \
            file://build_es3.x_sgx.patch;patch=1 \
            file://proc-interface.patch;patch=1 \
+	   file://0001-Compile-fixes-for-recent-kernels.patch;patch=1 \
 "
 
 PVRBUILD = "release"
-- 
1.6.4.4



