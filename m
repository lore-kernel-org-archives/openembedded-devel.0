Received: from einhorn.in-berlin.de ([192.109.42.8])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@mobil-400-586.intern.dresearch.de>)
	id 1R38U5-0006S5-KQ for openembedded-devel@lists.openembedded.org;
	Mon, 12 Sep 2011 17:31:45 +0200
X-Envelope-From: sledz@mobil-400-586.intern.dresearch.de
Received: from mobil-400-586.intern.dresearch.de
	(pd95cbf07.dip0.t-ipconnect.de [217.92.191.7]) (authenticated bits=0)
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	p8CFQWb5004817
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Mon, 12 Sep 2011 17:26:32 +0200
Received: by mobil-400-586.intern.dresearch.de (Postfix, from userid 1000)
	id DAC5FC8291; Mon, 12 Sep 2011 17:26:31 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Sep 2011 17:26:24 +0200
Message-Id: <1315841184-4706-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <4E6E2161.3070004@juszkiewicz.com.pl>
References: <4E6E2161.3070004@juszkiewicz.com.pl>
X-Scanned-By: MIMEDefang_at_IN-Berlin_e.V. on 192.109.42.8
Cc: paulepanter@users.sourceforge.net
Subject: [PATCH v2] linux-libc-headers 2.6.24: backport arm/asm/hwcap.h from recent kernels
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
X-List-Received-Date: Mon, 12 Sep 2011 15:31:45 -0000

This patch is similar to the one in linux-libc-headers 2.6.23 [1] and
enables building of OpenJDK which uses HWCAP_THUMBEE which normally
are not present in 2.6.24 headers.

[1] commit 41cd62ffbac7d272d46a4b39faf8a97c0850dd10

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 .../arm-hwcap-add-new-entries.patch                |   21 ++++++++++++++++++++
 .../linux-libc-headers_2.6.24.bb                   |    5 ++-
 2 files changed, 24 insertions(+), 2 deletions(-)
 create mode 100644 recipes/linux-libc-headers/linux-libc-headers-2.6.24/arm-hwcap-add-new-entries.patch

diff --git a/recipes/linux-libc-headers/linux-libc-headers-2.6.24/arm-hwcap-add-new-entries.patch b/recipes/linux-libc-headers/linux-libc-headers-2.6.24/arm-hwcap-add-new-entries.patch
new file mode 100644
index 0000000..6975317
--- /dev/null
+++ b/recipes/linux-libc-headers/linux-libc-headers-2.6.24/arm-hwcap-add-new-entries.patch
@@ -0,0 +1,21 @@
+---
+ include/asm-arm/hwcap.h |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+--- linux-2.6.24.orig/include/asm-arm/hwcap.h
++++ linux-2.6.24/include/asm-arm/hwcap.h
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
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
index 148d03f..cec1835 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
@@ -2,13 +2,14 @@ require linux-libc-headers.inc
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "unifdef-native"
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
            file://procinfo.h \
            file://export_falloc_h.patch \
            file://make-3.82.patch \
-           file://unifdef.patch"
+           file://unifdef.patch \
+           file://arm-hwcap-add-new-entries.patch"
 
 SRC_URI_append_hipox = " \
 	file://siocoutqsnd.patch \
-- 
1.7.3.4



