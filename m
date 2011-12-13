Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1RaZzI-00082R-9W
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Dec 2011 22:34:12 +0100
Received: by wgbds11 with SMTP id ds11so172062wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2011 13:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=9uRWgFPh1sRzJkw1p11PYed0JIKB5O3R0Z1nRCbXlIk=;
	b=BXxsMJpLxJSWU+WV2uJg1O8v7/JILYOkCXP0Kkf9wQSO7ymbALSsBTrza0QwIkX5Of
	1E1uXNBvN1IBwyh3VUnCnCz3G8keC9NjCKxjJtuquWYfsD3lQiMmg3mcFpPVIP9SvWpu
	QibJ8FS9pFAZMWJ1LzFm4QgNv6F41obtqA+Dc=
Received: by 10.227.205.135 with SMTP id fq7mr184540wbb.19.1323811636049;
	Tue, 13 Dec 2011 13:27:16 -0800 (PST)
Received: from fangorn.rup.mentorg.com (nat-rup.mentorg.com. [139.181.168.34])
	by mx.google.com with ESMTPS id fo3sm507942wib.11.2011.12.13.13.27.13
	(version=SSLv3 cipher=OTHER); Tue, 13 Dec 2011 13:27:14 -0800 (PST)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Dec 2011 01:25:50 +0400
Message-Id: <1323811550-876-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.7.3
Subject: [meta-opie][PATCH] opie-bluetoothd: fix compilation issues
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
X-List-Received-Date: Tue, 13 Dec 2011 21:34:12 -0000

rfkill.cpp uses symbols from libsysfs. However opie-bluetoothd recipe
lacks dependency on sysfsutils (package containing libsysfs) and project
file also lacks -lsysfs in the LIBS rule. Fix those issues.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-opie/opie-bluetoothd/opie-bluetoothd.inc   |    1 +
 .../opie-bluetoothd/opie-bluetoothd/libsysfs.patch |   20 ++++++++++++++++++++
 .../opie-bluetoothd/opie-bluetoothd_git.bb         |    5 ++++-
 3 files changed, 25 insertions(+), 1 deletions(-)
 create mode 100644 recipes-opie/opie-bluetoothd/opie-bluetoothd/libsysfs.patch

diff --git a/recipes-opie/opie-bluetoothd/opie-bluetoothd.inc b/recipes-opie/opie-bluetoothd/opie-bluetoothd.inc
index 5cae5be..6c8f6a5 100644
--- a/recipes-opie/opie-bluetoothd/opie-bluetoothd.inc
+++ b/recipes-opie/opie-bluetoothd/opie-bluetoothd.inc
@@ -4,6 +4,7 @@ LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "opiebluetoothd"
+DEPENDS = "sysfsutils"
 
 S = "${WORKDIR}/opiebluetoothd"
 
diff --git a/recipes-opie/opie-bluetoothd/opie-bluetoothd/libsysfs.patch b/recipes-opie/opie-bluetoothd/opie-bluetoothd/libsysfs.patch
new file mode 100644
index 0000000..0701e22
--- /dev/null
+++ b/recipes-opie/opie-bluetoothd/opie-bluetoothd/libsysfs.patch
@@ -0,0 +1,20 @@
+Upstream-Status: Pending
+Subject: Fix opiebluetoothd linking to libsysfs
+
+rfkill.cpp uses symbols from libsys. Add -lsysfs to the LIBS list
+
+Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+
+Index: opiebluetoothd/opiebluetoothd.pro
+===================================================================
+--- opiebluetoothd.orig/opiebluetoothd.pro	2011-12-13 23:52:42.563082969 +0400
++++ opiebluetoothd/opiebluetoothd.pro	2011-12-14 01:10:28.375070146 +0400
+@@ -5,7 +5,7 @@
+ INTERFACES      = bluetoothpindlgbase.ui
+ INCLUDEPATH     += $(OPIEDIR)/include
+ DEPENDPATH      += $(OPIEDIR)/include
+-LIBS            += -lqpe -lopiecore2 -lopiebluez2 -lopieui2 -ldbus-qt2 $$system(pkg-config --libs dbus-1)
++LIBS            += -lqpe -lopiecore2 -lopiebluez2 -lopieui2 -ldbus-qt2 $$system(pkg-config --libs dbus-1) -lsysfs
+ 
+ TARGET 		= opiebluetoothd
+ 
diff --git a/recipes-opie/opie-bluetoothd/opie-bluetoothd_git.bb b/recipes-opie/opie-bluetoothd/opie-bluetoothd_git.bb
index dac89e4..a9d29f3 100644
--- a/recipes-opie/opie-bluetoothd/opie-bluetoothd_git.bb
+++ b/recipes-opie/opie-bluetoothd/opie-bluetoothd_git.bb
@@ -1,4 +1,7 @@
 require ${PN}.inc
 PV = "${OPIE_GIT_PV}"
 
-SRC_URI = "${OPIE_GIT};protocol=git;subpath=noncore/net/opietooth/opiebluetoothd"
+SRC_URI = "\
+    ${OPIE_GIT};protocol=git;subpath=noncore/net/opietooth/opiebluetoothd \
+    file://libsysfs.patch \
+"
-- 
1.7.7.3



