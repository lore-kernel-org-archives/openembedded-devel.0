Received: from mail-bk0-f51.google.com ([209.85.214.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1UNfeS-0004Vq-JZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Apr 2013 10:36:08 +0200
Received: by mail-bk0-f51.google.com with SMTP id y8so1346680bkt.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Apr 2013 01:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=KiLG2wnG3CcBWimK6ypjlpMIALpp0WK/mViQz4Ed43U=;
	b=jgbfGm0jIBOpWJcZddF6z/xnVNCF8QFevAbcqqH8tqmKMz8tpODRF1m19Sne82325/
	HCeEzh3tALsMj3709GFD55JVmdhbzqgjosPAT6GUV/NvMWaVjPFYTxzcF1iLCivC/3Zq
	5VzrB3b+MAWTPd0kvuPi7hnNoih4WnfrSLpKTQHmtB6cz3p8PoX0xOMgwpXk0c1j7CB7
	b1VEmLOpeRYQx6yIoJoLQXvjpE5+BDbmnoFa3tTDz1lNo+2VRPh8mbrwTd9nDNyEYlco
	nC2FJHvDAlXHNhWfOqXOQzJVg+w6ClrltsOp/8WCQbMH4YQyHMS7IpK2tCm8B6WeNuL1
	HmCQ==
X-Received: by 10.205.34.137 with SMTP id ss9mr3643622bkb.14.1365063536127;
	Thu, 04 Apr 2013 01:18:56 -0700 (PDT)
Received: from s-stirtzel-linux.zera.local
	(ip-109-91-251-14.unitymediagroup.de. [109.91.251.14])
	by mx.google.com with ESMTPS id s10sm5172598bkt.10.2013.04.04.01.18.54
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Apr 2013 01:18:55 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Apr 2013 10:18:46 +0200
Message-Id: <1365063527-14328-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH 1/2] maliit-framework: fix for Qt applications
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
X-List-Received-Date: Thu, 04 Apr 2013 08:36:09 -0000

fixes a linking issue and also sets the required variable for X based programms

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 ...k-to-libmaliit-1-0-in-inputcontext-plugin.patch |   23 +++++++++++++++++++
 .../recipes-support/maliit/maliit-framework_git.bb |   24 +++++++++++++++++++-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/maliit/maliit-framework/0001-Link-to-libmaliit-1-0-in-inputcontext-plugin.patch

diff --git a/meta-oe/recipes-support/maliit/maliit-framework/0001-Link-to-libmaliit-1-0-in-inputcontext-plugin.patch b/meta-oe/recipes-support/maliit/maliit-framework/0001-Link-to-libmaliit-1-0-in-inputcontext-plugin.patch
new file mode 100644
index 0000000..c2291c6
--- /dev/null
+++ b/meta-oe/recipes-support/maliit/maliit-framework/0001-Link-to-libmaliit-1-0-in-inputcontext-plugin.patch
@@ -0,0 +1,23 @@
+From cc33efdedbec9e9a55e9a0c6756516fd84d42e53 Mon Sep 17 00:00:00 2001
+From: Samuel Stirtzel <s.stirtzel@googlemail.com>
+Date: Fri, 1 Mar 2013 11:31:41 +0100
+Subject: [PATCH] Link to libmaliit-1,0 in inputcontext plugin
+
+Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
+---
+ .../input-context-plugin/input-context-plugin.pro  |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/input-context/input-context-plugin/input-context-plugin.pro b/input-context/input-context-plugin/input-context-plugin.pro
+index eefbe93..296e2fa 100644
+--- a/input-context/input-context-plugin/input-context-plugin.pro
++++ b/input-context/input-context-plugin/input-context-plugin.pro
+@@ -15,3 +15,5 @@ CONFIG += plugin
+
+ INSTALLS    += target
+ target.path += $$QT_IM_PLUGIN_PATH
++
++LIBS += -L../../lib -l"maliit-1.0"
+--
+1.7.9.5
+
diff --git a/meta-oe/recipes-support/maliit/maliit-framework_git.bb b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
index a164e78..e61cca0 100644
--- a/meta-oe/recipes-support/maliit/maliit-framework_git.bb
+++ b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
@@ -10,6 +10,7 @@ inherit autotools qt4x11 gtk-immodules-cache
 SRC_URI = "git://gitorious.org/maliit/maliit-framework.git;branch=master \
     file://0001-Fix-MALIIT_INSTALL_PRF-to-allow-the-build-with-opene.patch \
     file://0001-Fix-QT_IM_PLUGIN_PATH-to-allow-openembedded-to-build.patch \
+    file://0001-Link-to-libmaliit-1-0-in-inputcontext-plugin.patch \
     "
 
 SRCREV = "750842dec74a9b17dca91ef779c4fc5a43c4d9dc"
@@ -65,4 +66,25 @@ do_install_append() {
     sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${datadir}/qt4/mkspecs/features/maliit-plugins.prf
 }
 
-S= "${WORKDIR}/git"
+pkg_postinst_${PN} () {
+#!/bin/sh
+# should run online
+if [ "x$D" != "x" ]; then
+    exit 1
+fi
+echo "export QT_IM_MODULE=Maliit" >> /etc/xprofile
+}
+
+pkg_postrm_${PN} () {
+#!/bin/sh
+# should run online
+if [ "x$D" = "x" ]; then
+    exit 1
+fi
+if [ -e "/etc/xprofile" ]; then
+    sed -i -e "g|export QT_IM_MODULE=Maliit|d" /etc/xprofile
+fi
+
+}
+
+S = "${WORKDIR}/git"
-- 
1.7.9.5



