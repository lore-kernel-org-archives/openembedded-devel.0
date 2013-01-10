Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TtHrO-0005Wb-Aq
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 14:08:04 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 20E83D22CD;
	Thu, 10 Jan 2013 13:52:42 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Jan 2013 13:52:35 +0100
Message-Id: <1357822356-10623-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
Subject: [meta-oe][PATCH 1/2] libav: add support for AArch64
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
X-List-Received-Date: Thu, 10 Jan 2013 13:08:13 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../0001-configure-enable-pic-for-AArch64.patch    | 25 ++++++++++++++++++++++
 meta-oe/recipes-multimedia/libav/libav_0.8.3.bb    |  5 +++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/libav/libav-0.8.3/0001-configure-enable-pic-for-AArch64.patch

diff --git a/meta-oe/recipes-multimedia/libav/libav-0.8.3/0001-configure-enable-pic-for-AArch64.patch b/meta-oe/recipes-multimedia/libav/libav-0.8.3/0001-configure-enable-pic-for-AArch64.patch
new file mode 100644
index 0000000..1894bb5
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libav/libav-0.8.3/0001-configure-enable-pic-for-AArch64.patch
@@ -0,0 +1,25 @@
+From 58db99e98f615d79ea90cac8f4bcf11c94e3e7c7 Mon Sep 17 00:00:00 2001
+From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
+Date: Thu, 10 Jan 2013 12:42:19 +0100
+Subject: [PATCH] configure: enable pic for AArch64
+
+Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
+---
+ configure |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- git.orig/configure
++++ git/configure
+@@ -2390,11 +2390,11 @@ EOF
+ 
+ check_host_cflags -std=c99
+ check_host_cflags -Wall
+ 
+ case "$arch" in
+-    alpha|ia64|mips|parisc|sparc)
++    alpha|ia64|mips|parisc|sparc|aarch64)
+         spic=$shared
+     ;;
+     x86)
+         subarch="x86_32"
+         check_cc <<EOF && subarch="x86_64"
diff --git a/meta-oe/recipes-multimedia/libav/libav_0.8.3.bb b/meta-oe/recipes-multimedia/libav/libav_0.8.3.bb
index 66a32c9..10bdfa7 100644
--- a/meta-oe/recipes-multimedia/libav/libav_0.8.3.bb
+++ b/meta-oe/recipes-multimedia/libav/libav_0.8.3.bb
@@ -1,5 +1,10 @@
 require libav.inc
 
+FILESEXTRAPATHS_prepend := "${THISDIR}/libav-0.8.3:"
+
+SRC_URI_append = " \
+          file://0001-configure-enable-pic-for-AArch64.patch \
+"
 LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.LGPLv2.1;md5=e344c8fa836c3a41c4cbd79d7bd3a379 \
-- 
1.8.0



