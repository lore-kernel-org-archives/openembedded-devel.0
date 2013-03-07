Received: from mail-ee0-f50.google.com ([74.125.83.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1UDd41-0001rd-2r
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 16:49:01 +0100
Received: by mail-ee0-f50.google.com with SMTP id e51so437458eek.37
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2013 07:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=DKtDLz/zmeuabzpAZ0YeGdZ8vHuwGMpJJTLEYecu7YE=;
	b=JcyldQYWayWddEp3a3YXR6HnBfyTKRGbDZ/drhAmBSFHv4owpxikokQALaTr3BkKZU
	4Pc2MWO7zChGSjes32mmrMofRwvBAQUUNOO2Vhh55GFKJsmQ+QGCagXbOEcJZde0+FIg
	9xxFjkPU9efMMxGkF7aUTuh5F6xiA0Ojs4vSk+HUui9cAHZGfboXuMB1HCfFSgmk8BKZ
	FucF1ez0Ihcnx+uQ6sJ1nbQyJFXsoAA+9RvrNDrlQG9XBOpuj6a1Zk/sp+baSKEGsZn2
	bAaL4EH1ToOz8NpV1geyve1MpQXumpFTvwELN9udgKT3whIRCfTuEuGZksmYvrFXIqXW
	ncsg==
X-Received: by 10.14.111.72 with SMTP id v48mr64975002eeg.11.1362670349016;
	Thu, 07 Mar 2013 07:32:29 -0800 (PST)
Received: from s-stirtzel-linux.zera.local
	(ip-95-223-251-141.unitymediagroup.de. [95.223.251.141])
	by mx.google.com with ESMTPS id u44sm2753373eel.7.2013.03.07.07.32.27
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 07 Mar 2013 07:32:28 -0800 (PST)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Mar 2013 16:32:08 +0100
Message-Id: <1362670329-16891-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH v2] maliit-framework: fix for Qt based applications
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
X-List-Received-Date: Thu, 07 Mar 2013 15:49:02 -0000

Previously Qt based applications did not trigger the Maliit virtual keyboard
The Qt inputmethod plugin could not be loaded because it did not link to libmaliit-1.0.so
It is also necessary to set the Qt default input method to "Maliit"

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 ...k-to-libmaliit-1-0-in-inputcontext-plugin.patch |   23 ++++++++++++++++++++
 .../recipes-support/maliit/maliit-framework_git.bb |   13 +++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-support/maliit/maliit-framework/0001-Link-to-libmaliit-1-0-in-inputcontext-plugin.patch

diff --git a/meta-oe/recipes-support/maliit/maliit-framework/0001-Link-to-libmaliit-1-0-in-inputcontext-plugin.patch b/meta-oe/recipes-support/maliit/maliit-framework/0001-Link-to-libmaliit-1-0-in-inputcontext-plugin.patch
new file mode 100644
index 0000000..749ddbe
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
index a164e78..11d06aa 100644
--- a/meta-oe/recipes-support/maliit/maliit-framework_git.bb
+++ b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
@@ -10,6 +10,7 @@ inherit autotools qt4x11 gtk-immodules-cache
 SRC_URI = "git://gitorious.org/maliit/maliit-framework.git;branch=master \
     file://0001-Fix-MALIIT_INSTALL_PRF-to-allow-the-build-with-opene.patch \
     file://0001-Fix-QT_IM_PLUGIN_PATH-to-allow-openembedded-to-build.patch \
+    file://0001-Link-to-libmaliit-1-0-in-inputcontext-plugin.patch \
     "
 
 SRCREV = "750842dec74a9b17dca91ef779c4fc5a43c4d9dc"
@@ -65,4 +66,16 @@ do_install_append() {
     sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${datadir}/qt4/mkspecs/features/maliit-plugins.prf
 }
 
+pkg_postinst_${PN} () {
+#!/bin/sh
+#can run online and offline
+echo "EXPORT QT_IM_MODULE=Maliit" >> $D/etc/profile
+}
+
+pkg_postrm_${PN} () {
+#!/bin/sh
+#can run online and offline
+sed -i "/EXPORT QT_IM_MODULE=Maliit/d" $D/etc/profile
+}
+
 S= "${WORKDIR}/git"
-- 
1.7.9.5



