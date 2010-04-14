Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1O27eJ-0004tr-Vh
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Apr 2010 20:49:20 +0200
Received: (qmail 12443 invoked by uid 813007); 14 Apr 2010 18:45:53 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 14 Apr 2010 18:45:53 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Apr 2010 20:46:08 +0200
Message-Id: <1271270768-6212-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [STABLE][PATCH v3] linux-libc-headers 2.6.23: add newer ARM hwcap flags
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
X-List-Received-Date: Wed, 14 Apr 2010 18:49:20 -0000

From: Marcin Juszkiewicz <marcin@buglabs.net>

OpenJDK uses HWCAP_THUMBEE which is not present in 2.6.23 headers.

Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 .../arm-hwcap-add-new-entries.patch                |   21 ++++++++++++++++++++
 .../linux-libc-headers_2.6.23.bb                   |    5 ++-
 2 files changed, 24 insertions(+), 2 deletions(-)
 create mode 100644 recipes/linux-libc-headers/linux-libc-headers-2.6.23/arm-hwcap-add-new-entries.patch

diff --git a/recipes/linux-libc-headers/linux-libc-headers-2.6.23/arm-hwcap-add-new-entries.patch b/recipes/linux-libc-headers/linux-libc-headers-2.6.23/arm-hwcap-add-new-entries.patch
new file mode 100644
index 0000000..934db51
--- /dev/null
+++ b/recipes/linux-libc-headers/linux-libc-headers-2.6.23/arm-hwcap-add-new-entries.patch
@@ -0,0 +1,21 @@
+---
+ include/asm-arm/hwcap.h |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+--- linux-2.6.23.orig/include/asm-arm/hwcap.h
++++ linux-2.6.23/include/asm-arm/hwcap.h
+@@ -13,10 +13,14 @@
+ #define HWCAP_VFP	64
+ #define HWCAP_EDSP	128
+ #define HWCAP_JAVA	256
+ #define HWCAP_IWMMXT	512
+ #define HWCAP_CRUNCH	1024
++#define HWCAP_THUMBEE	2048
++#define HWCAP_NEON	4096
++#define HWCAP_VFPv3	8192
++#define HWCAP_VFPv3D16	16384
+ 
+ #if defined(__KERNEL__) && !defined(__ASSEMBLY__)
+ /*
+  * This yields a mask that user programs can use to figure out what
+  * instruction set this cpu supports.
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
index 95152f1..b4766bc 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
@@ -2,11 +2,12 @@ require linux-libc-headers.inc
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "unifdef-native"
-PR = "r4"
+PR = "r6"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
            file://procinfo.h \
-           file://unifdef.patch;patch=1"
+           file://unifdef.patch;patch=1 \
+           file://arm-hwcap-add-new-entries.patch;patch=1"
 
 S = "${WORKDIR}/linux-${PV}"
 
-- 
1.7.0.4





