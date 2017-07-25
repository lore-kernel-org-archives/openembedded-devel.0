Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 607B178237
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jul 2017 01:30:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="21752320"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Jul 2017 09:30:34 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id B2BB6467021F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jul 2017 09:30:31 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 25 Jul 2017 09:30:31 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Jul 2017 09:30:23 +0800
Message-ID: <1500946223-25865-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: B2BB6467021F.A500B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-qt5] [PATCH v2] qtbase: add ptest
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Jul 2017 01:30:34 -0000
Content-Type: text/plain

Add ptest for qtbase by using provided testsuite.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../0001-Delete-qlonglong-and-qulonglong.patch     | 28 ++++++++++++++++++++++
 recipes-qt/qt5/qtbase/run-ptest                    |  6 +++++
 recipes-qt/qt5/qtbase_git.bb                       | 17 ++++++++++++-
 3 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 recipes-qt/qt5/qtbase/0001-Delete-qlonglong-and-qulonglong.patch
 create mode 100644 recipes-qt/qt5/qtbase/run-ptest

diff --git a/recipes-qt/qt5/qtbase/0001-Delete-qlonglong-and-qulonglong.patch b/recipes-qt/qt5/qtbase/0001-Delete-qlonglong-and-qulonglong.patch
new file mode 100644
index 0000000..975cd28
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0001-Delete-qlonglong-and-qulonglong.patch
@@ -0,0 +1,28 @@
+From c67a4af2e5db4c1e2213961e6392b59affd1959f Mon Sep 17 00:00:00 2001
+From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
+Date: Wed, 7 Jun 2017 21:00:49 +0900
+Subject: [PATCH] Delete qlonglong and qulonglong
+
+Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
+---
+ tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro b/tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro
+index 09458bd..59a120e 100644
+--- a/tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro
++++ b/tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro
+@@ -5,10 +5,8 @@ SUBDIRS=\
+     char32_t \
+     int \
+     long \
+-    qlonglong \
+     qptrdiff \
+     quintptr \
+-    qulonglong \
+     schar \
+     short \
+     uchar \
+-- 
+2.7.4
+
diff --git a/recipes-qt/qt5/qtbase/run-ptest b/recipes-qt/qt5/qtbase/run-ptest
new file mode 100644
index 0000000..044f834
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/run-ptest
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+for x in ` awk '{print $1}' tst_list `;do
+    ./${x};
+done
+
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 5cfbcfa..8464873 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -23,8 +23,12 @@ SRC_URI += "\
     file://0005-configure-bump-path-length-from-256-to-512-character.patch \
     file://0009-Disable-all-unknown-features-instead-of-erroring-out.patch \
     file://0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
+    file://0001-Delete-qlonglong-and-qulonglong.patch \
+    file://run-ptest \
 "
 
+inherit ptest
+
 # only for target qtbase
 SRC_URI += "\
     file://0008-configure-paths-for-target-qmake-properly.patch \
@@ -48,7 +52,7 @@ PACKAGECONFIG_DISTRO ?= ""
 PACKAGECONFIG_RELEASE ?= "release"
 # This is in qt5.inc, because qtwebkit-examples are using it to enable ca-certificates dependency
 # PACKAGECONFIG_OPENSSL ?= "openssl"
-PACKAGECONFIG_DEFAULT ?= "dbus udev evdev widgets tools libs freetype"
+PACKAGECONFIG_DEFAULT ?= "dbus udev evdev widgets tools libs freetype tests"
 
 PACKAGECONFIG ?= " \
     ${PACKAGECONFIG_RELEASE} \
@@ -171,6 +175,17 @@ do_configure() {
         ${QT_CONFIG_FLAGS}
 }
 
+fakeroot do_install_ptest() {
+    mkdir -p ${D}${PTEST_PATH}
+    t=${D}${PTEST_PATH}
+    for var in ` find ${B}/tests/auto/ -name tst_*`; do
+        if [ not ` echo ${var##*/} | grep '\.'` ]; then
+            echo ${var##*/} >> ${t}/tst_list
+            install -m 0644 ${var} ${t}
+        fi
+    done
+}
+
 do_install_append() {
     # Avoid qmake error "Cannot read [...]/usr/lib/qt5/mkspecs/oe-device-extra.pri: No such file or directory"
     touch ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/oe-device-extra.pri
-- 
2.7.4




