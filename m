Received: from einhorn.in-berlin.de ([192.109.42.8] ident=root)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@mobil-400-586.intern.dresearch.de>)
	id 1R237u-0006QP-5C for openembedded-devel@lists.openembedded.org;
	Fri, 09 Sep 2011 17:36:22 +0200
X-Envelope-From: sledz@mobil-400-586.intern.dresearch.de
Received: from mobil-400-586.intern.dresearch.de
	(pd95cb174.dip0.t-ipconnect.de [217.92.177.116])
	(authenticated bits=0)
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	p89FMi86013298
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 9 Sep 2011 17:22:44 +0200
Received: by mobil-400-586.intern.dresearch.de (Postfix, from userid 1000)
	id 57A35C8257; Fri,  9 Sep 2011 17:22:44 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Sep 2011 17:22:33 +0200
Message-Id: <1315581753-7944-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.3.4
X-Scanned-By: MIMEDefang_at_IN-Berlin_e.V. on 192.109.42.8
Subject: [PATCH] linux-libc-headers 2.6.24: backport arm/asm/hwcap.h from recent kernels
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
X-List-Received-Date: Fri, 09 Sep 2011 15:36:22 -0000

This patch is similar to the one in linux-libc-headers 2.6.23.

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 .../arm-hwcap-add-new-entries.patch                |   21 ++++++++++++++++++++
 .../linux-libc-headers_2.6.24.bb                   |    6 +++-
 2 files changed, 25 insertions(+), 2 deletions(-)
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
index 148d03f..e321351 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
@@ -2,16 +2,18 @@ require linux-libc-headers.inc
 
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
+	file://drbcc-linedisc.patch \
 	"
 
 S = "${WORKDIR}/linux-${PV}"
-- 
1.7.3.4



