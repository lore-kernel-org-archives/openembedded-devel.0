Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9F1C57226D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Apr 2015 08:35:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3G8Z73e013806
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 Apr 2015 01:35:08 -0700 (PDT)
Received: from lirq-OptiPlex-780.wrs.com (128.224.162.139) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Thu, 16 Apr 2015 01:35:07 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <joe_macdonald@mentor.com>
Date: Thu, 16 Apr 2015 16:35:05 +0800
Message-ID: <1429173305-443-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH][meta-networking] netkit-telnet: support the cross-compile
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Apr 2015 08:35:06 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

when check the CC, only compile the object by CC, not run the object.
MCONFIG file includes more configuration, we can not clear it

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../netkit-telnet/files/cross-compile.patch        | 48 ++++++++++++++++++++++
 .../netkit-telnet/netkit-telnet_0.17.bb            |  6 ++-
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-netkit/netkit-telnet/files/cross-compile.patch

diff --git a/meta-networking/recipes-netkit/netkit-telnet/files/cross-compile.patch b/meta-networking/recipes-netkit/netkit-telnet/files/cross-compile.patch
new file mode 100644
index 0000000..b3fe36b
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-telnet/files/cross-compile.patch
@@ -0,0 +1,48 @@
+To support the cross-compile
+
+Upstream-Status: Pending
+
+make the configure to support the cross-compile, by only to compile the
+target, and not to run it
+
+Roy Li <rongqing.li@windriver.com>
+Index: netkit-telnet-0.17/configure
+===================================================================
+--- netkit-telnet-0.17.orig/configure	2008-11-23 22:01:26.000000000 +0100
++++ netkit-telnet-0.17/configure	2008-11-23 22:05:00.000000000 +0100
+@@ -94,7 +94,7 @@
+     echo -n 'Checking if C compiler works... '
+     if (
+           $CC __conftest.c -o __conftest || exit 1
+-          ./__conftest || exit 1
++          # Idiots belong shot! ./__conftest || exit 1
+        ) >/dev/null 2>&1; then
+          echo 'yes'
+      else
+@@ -141,7 +141,7 @@
+     echo -n 'Checking if C++ compiler works... '
+     if (
+           $CXX __conftest.cc -o __conftest || exit 1
+-          ./__conftest || exit 1
++          # Iditios belong shot! ./__conftest || exit 1
+        ) >/dev/null 2>&1; then
+          echo 'yes'
+      else
+@@ -284,7 +284,7 @@
+ else
+     if (
+           $CXX $CXXFLAGS -D__USE_BSD_SIGNAL __conftest.cc  -o __conftest || exit 1
+-          ./__conftest || exit 1
++          # running still does not work./__conftest || exit 1
+        ) >/dev/null 2>&1; then
+         echo '-D__USE_BSD_SIGNAL'
+         CFLAGS="$CFLAGS -D__USE_BSD_SIGNAL"
+@@ -501,7 +501,7 @@
+ EOF
+ if (
+       $CXX $CXXFLAGS  __conftest.cc $LIBBSD -o __conftest || exit 1
+-      ./__conftest || exit 1
++      # argh! morons!./__conftest || exit 1
+    ) >/dev/null 2>&1; then
+     echo 'ok'
+ else
diff --git a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
index a2dc1c2..6b2e72f 100644
--- a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
@@ -8,6 +8,7 @@ SRC_URI = "ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/${BP}.tar.gz \
     file://To-aviod-buffer-overflow-in-telnet.patch \
     file://Warning-fix-in-the-step-of-install.patch \
     file://telnet-xinetd \
+    file://cross-compile.patch \
 "
 
 EXTRA_OEMAKE = "INSTALLROOT=${D} SBINDIR=${sbindir} DAEMONMODE=755 \
@@ -15,7 +16,10 @@ EXTRA_OEMAKE = "INSTALLROOT=${D} SBINDIR=${sbindir} DAEMONMODE=755 \
 
 do_configure () {
     ./configure --prefix=${prefix}
-    echo "LDFLAGS=${LDFLAGS}" > MCONFIG
+    sed -e 's#^CFLAGS=\(.*\)$#CFLAGS= -D_GNU_SOURCE \1#' \
+        -e 's#^CXXFLAGS=\(.*\)$#CXXFLAGS= -D_GNU_SOURCE \1#' \
+        -e 's#^LDFLAGS=.*$#LDFLAGS= ${LDFLAGS}#' \
+        -i MCONFIG
 }
 
 do_compile () {
-- 
2.1.0


