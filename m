Received: from einhorn.in-berlin.de ([192.109.42.8] ident=root)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PxjyO-0005tK-61
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Mar 2011 18:48:28 +0100
X-Envelope-From: sledz@dresearch.de
Received: from mobil-400-586.intern.dresearch.de
	(p57A201FA.dip0.t-ipconnect.de [87.162.1.250]) (authenticated bits=0)
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	p2AHkqql009066
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Thu, 10 Mar 2011 18:46:52 +0100
Received: by mobil-400-586.intern.dresearch.de (Postfix, from userid 1000)
	id 1D1A8296E6; Thu, 10 Mar 2011 18:46:51 +0100 (CET)
From: Steffen Sledz <sledz@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Mar 2011 18:46:27 +0100
Message-Id: <1299779187-17515-1-git-send-email-sledz@dresearch.de>
X-Mailer: git-send-email 1.7.1
X-Scanned-By: MIMEDefang_at_IN-Berlin_e.V. on 192.109.42.8
Subject: [PATCH] linux-2.6.24: add support for AMIC flashes (e.g. A29L160AT)
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
X-List-Received-Date: Thu, 10 Mar 2011 17:48:28 -0000

Similar patch is on its way to the mainline kernel:
http://thread.gmane.org/gmane.linux.kernel/1111144

Signed-off-by: Steffen Sledz <sledz@dresearch.de>
---
 recipes/linux/linux-2.6.24/cfi-amic.patch |   22 ++++++++++++++++++++++
 recipes/linux/linux_2.6.24.bb             |    3 ++-
 2 files changed, 24 insertions(+), 1 deletions(-)
 create mode 100644 recipes/linux/linux-2.6.24/cfi-amic.patch

diff --git a/recipes/linux/linux-2.6.24/cfi-amic.patch b/recipes/linux/linux-2.6.24/cfi-amic.patch
new file mode 100644
index 0000000..feb673f
--- /dev/null
+++ b/recipes/linux/linux-2.6.24/cfi-amic.patch
@@ -0,0 +1,22 @@
+diff -Nurd linux-2.6.24.orig//drivers/mtd/chips/cfi_cmdset_0002.c linux-2.6.24/drivers/mtd/chips/cfi_cmdset_0002.c
+--- linux-2.6.24.orig//drivers/mtd/chips/cfi_cmdset_0002.c	2011-03-10 17:05:22.868634509 +0100
++++ linux-2.6.24/drivers/mtd/chips/cfi_cmdset_0002.c	2011-03-10 17:06:58.723636256 +0100
+@@ -219,6 +219,7 @@
+ static struct cfi_fixup cfi_fixup_table[] = {
+ #ifdef AMD_BOOTLOC_BUG
+ 	{ CFI_MFR_AMD, CFI_ID_ANY, fixup_amd_bootblock, NULL },
++	{ CFI_MFR_AMIC, CFI_ID_ANY, fixup_amd_bootblock, NULL },
+ #endif
+ 	{ CFI_MFR_AMD, 0x0050, fixup_use_secsi, NULL, },
+ 	{ CFI_MFR_AMD, 0x0053, fixup_use_secsi, NULL, },
+diff -Nurd linux-2.6.24.orig//include/linux/mtd/cfi.h linux-2.6.24/include/linux/mtd/cfi.h
+--- linux-2.6.24.orig//include/linux/mtd/cfi.h	2011-03-10 17:05:19.584884614 +0100
++++ linux-2.6.24/include/linux/mtd/cfi.h	2011-03-10 17:08:03.886636402 +0100
+@@ -485,6 +485,7 @@
+ #define CFI_ID_ANY  0xffff
+ 
+ #define CFI_MFR_AMD 0x0001
++#define CFI_MFR_AMIC 0x0037
+ #define CFI_MFR_ATMEL 0x001F
+ #define CFI_MFR_ST  0x0020 	/* STMicroelectronics */
+ 
diff --git a/recipes/linux/linux_2.6.24.bb b/recipes/linux/linux_2.6.24.bb
index d03d2b7..5c05593 100644
--- a/recipes/linux/linux_2.6.24.bb
+++ b/recipes/linux/linux_2.6.24.bb
@@ -11,13 +11,14 @@ DEFAULT_PREFERENCE_hipox = "1"
 DEFAULT_PREFERENCE_cs-e9302 = "1"
 DEFAULT_PREFERENCE_smartq5 = "1"
 
-PR = "r35"
+PR = "r36"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.24.tar.bz2;name=kernel \
            ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.7.bz2;apply=yes;name=stablepatch \
            file://squashfs-lzma-2.6.24.patch \
            file://ubifs-v2.6.24.patch \
            file://ubifs-v2.6.24-silent-get-sb.patch \
+           file://cfi-amic.patch \
            file://defconfig"
 
 # Moved away temporarely until committed properly (work in progress).
-- 
1.7.1



