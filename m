Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3B3CC723BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2015 02:54:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 17 Mar 2015 19:54:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,419,1422950400"; d="scan'208";a="700217131"
Received: from liuxin1-mobl.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.254.180.202])
	by orsmga002.jf.intel.com with ESMTP; 17 Mar 2015 19:54:33 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Mar 2015 20:54:13 -0600
Message-Id: <1426647253-12404-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1426647253-12404-1-git-send-email-sgw@linux.intel.com>
References: <1426647253-12404-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/2] openflow: update libopenflow.m4 to use openssl instead of libssl
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
X-List-Received-Date: Wed, 18 Mar 2015 02:54:42 -0000

openssl provides both the libssl and libcrypto APIs for linkage, the 1.0.2 of
OpenSSL removed libcrypto from the libssl.pc

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../recipes-protocols/openflow/openflow.inc        |  4 ++-
 .../openflow/use-openssl-instead-of-libssl.patch   | 34 ++++++++++++++++++++++
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-protocols/openflow/openflow/use-openssl-instead-of-libssl.patch

diff --git a/meta-networking/recipes-protocols/openflow/openflow.inc b/meta-networking/recipes-protocols/openflow/openflow.inc
index 1a226f8..7eca1d7 100644
--- a/meta-networking/recipes-protocols/openflow/openflow.inc
+++ b/meta-networking/recipes-protocols/openflow/openflow.inc
@@ -11,7 +11,9 @@ LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e870c934e2c3d6ccf085fd7cf0a1e2e2"
 
-SRC_URI = "git://gitosis.stanford.edu/openflow.git;protocol=git"
+SRC_URI = "git://gitosis.stanford.edu/openflow.git;protocol=git \
+           file://use-openssl-instead-of-libssl.patch \
+          "
 
 DEPENDS = "virtual/libc"
 
diff --git a/meta-networking/recipes-protocols/openflow/openflow/use-openssl-instead-of-libssl.patch b/meta-networking/recipes-protocols/openflow/openflow/use-openssl-instead-of-libssl.patch
new file mode 100644
index 0000000..724855f
--- /dev/null
+++ b/meta-networking/recipes-protocols/openflow/openflow/use-openssl-instead-of-libssl.patch
@@ -0,0 +1,34 @@
+OpenSSL 1.0.2 removed -lcrypto from the libssl.pc, but the openssl.pc
+contains both. Since openflow uses both libcrypto and libssl API we
+should use openssl.pc.
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Upstream-Status: Inappropriate [upstream obsolete]
+
+Index: git/m4/libopenflow.m4
+===================================================================
+--- git.orig/m4/libopenflow.m4
++++ git/m4/libopenflow.m4
+@@ -65,7 +65,7 @@ AC_DEFUN([OFP_CHECK_OPENSSL],
+   [AC_ARG_ENABLE(
+      [ssl],
+      [AC_HELP_STRING([--enable-ssl], 
+-                     [Enable ssl support (requires libssl)])],
++                     [Enable ssl support (requires libssl and libcrypto)])],
+      [case "${enableval}" in
+         (yes) ssl=true ;;
+         (no)  ssl=false ;;
+@@ -76,10 +76,10 @@ AC_DEFUN([OFP_CHECK_OPENSSL],
+    if test "$ssl" = true; then
+    dnl Make sure that pkg-config is installed.
+    m4_pattern_forbid([PKG_CHECK_MODULES])
+-   PKG_CHECK_MODULES([SSL], [libssl], 
++   PKG_CHECK_MODULES([SSL], [openssl], 
+      [HAVE_OPENSSL=yes],
+      [HAVE_OPENSSL=no
+-      AC_MSG_WARN([Cannot find libssl:
++      AC_MSG_WARN([Cannot find OpenSSL Libraries:
+ 
+    $SSL_PKG_ERRORS
+ 
-- 
2.1.0


