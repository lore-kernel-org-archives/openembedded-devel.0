Received: from einhorn.in-berlin.de ([192.109.42.8] ident=root)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@mobil-400-586.intern.dresearch.de>)
	id 1R4B96-00074q-KF for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2011 14:34:24 +0200
X-Envelope-From: sledz@mobil-400-586.intern.dresearch.de
Received: from mobil-400-586.intern.dresearch.de
	(pd95cbf07.dip0.t-ipconnect.de [217.92.191.7]) (authenticated bits=0)
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	p8FCTD5F012292
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Thu, 15 Sep 2011 14:29:14 +0200
Received: by mobil-400-586.intern.dresearch.de (Postfix, from userid 1000)
	id AE5E6C3967; Thu, 15 Sep 2011 14:29:13 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Sep 2011 14:29:02 +0200
Message-Id: <1316089742-26495-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1316077506.4523.10.camel@mattotaupa>
References: <1316077506.4523.10.camel@mattotaupa>
X-Scanned-By: MIMEDefang_at_IN-Berlin_e.V. on 192.109.42.8
Cc: paulepanter@users.sourceforge.net
Subject: [PATCH v5] linux-libc-headers 2.6.24: backport arm/asm/hwcap.h from linux 2.6.26
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
X-List-Received-Date: Thu, 15 Sep 2011 12:34:24 -0000

Enables building of OpenJDK which uses HWCAP_THUMBEE that is not present
in 2.6.24 headers and was introduced with

  commit d7f864be8323e5394040e2877594645b0e7da85d
  Author: Catalin Marinas <catalin.marinas@arm.com>
  Date:   Fri Apr 18 22:43:06 2008 +0100

      ARMv7: Add support for the ThumbEE state saving/restoring

      This patch adds the detection and handling of the ThumbEE extension on
      ARMv7 CPUs.

      Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>

Upstream-Status: Backport [2.6.26]

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
[PATCH v5] contains updates in commit comment and patch header as a result of
Paul's review of [PATCH v4] especially the referenced linux commit.
---
 .../arm-hwcap-add-new-entries.patch                |   31 ++++++++++++++++++++
 .../linux-libc-headers_2.6.24.bb                   |    6 ++-
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 recipes/linux-libc-headers/linux-libc-headers-2.6.24/arm-hwcap-add-new-entries.patch

diff --git a/recipes/linux-libc-headers/linux-libc-headers-2.6.24/arm-hwcap-add-new-entries.patch b/recipes/linux-libc-headers/linux-libc-headers-2.6.24/arm-hwcap-add-new-entries.patch
new file mode 100644
index 0000000..80a7949
--- /dev/null
+++ b/recipes/linux-libc-headers/linux-libc-headers-2.6.24/arm-hwcap-add-new-entries.patch
@@ -0,0 +1,31 @@
+linux-libc-headers 2.6.24: backport arm/asm/hwcap.h from linux 2.6.26
+
+Enables building of OpenJDK which uses HWCAP_THUMBEE that is not present
+in 2.6.24 headers and was introduced with
+
+  commit d7f864be8323e5394040e2877594645b0e7da85d
+  Author: Catalin Marinas <catalin.marinas@arm.com>
+  Date:   Fri Apr 18 22:43:06 2008 +0100
+  
+      ARMv7: Add support for the ThumbEE state saving/restoring
+      
+      This patch adds the detection and handling of the ThumbEE extension on
+      ARMv7 CPUs.
+            
+      Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
+
+Upstream-Status: Backport [2.6.26]
+
+Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
+
+diff -Nurd linux-2.6.24.orig//include/asm-arm/hwcap.h linux-2.6.24/include/asm-arm/hwcap.h
+--- linux-2.6.24.orig//include/asm-arm/hwcap.h	2011-09-15 08:42:58.467307245 +0200
++++ linux-2.6.24/include/asm-arm/hwcap.h	2011-09-15 08:43:46.004693497 +0200
+@@ -15,6 +15,7 @@
+ #define HWCAP_JAVA	256
+ #define HWCAP_IWMMXT	512
+ #define HWCAP_CRUNCH	1024
++#define HWCAP_THUMBEE	2048
+ 
+ #if defined(__KERNEL__) && !defined(__ASSEMBLY__)
+ /*
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
index 148d03f..d7f67ed 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
@@ -2,13 +2,15 @@ require linux-libc-headers.inc
 
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
+           file://arm-hwcap-add-new-entries.patch \
+"
 
 SRC_URI_append_hipox = " \
 	file://siocoutqsnd.patch \
-- 
1.7.3.4



