Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E334777FED
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Aug 2017 08:05:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7285pjH004220
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 2 Aug 2017 01:05:51 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 2 Aug 2017 01:05:50 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 2 Aug 2017 04:05:49 -0400
Message-ID: <1501661149-112629-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] lvm2/libdevmapper: workaround build man failure
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
X-List-Received-Date: Wed, 02 Aug 2017 08:05:52 -0000
Content-Type: text/plain

On some host (ubuntu 1404), build manual failed.
...
./tools/man-generator --primary lvscan lvscan.8_des
Failed to stat description file lvscan.8_des.
...

Do not build man to workaround the issue.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../lvm2/files/0005-do-not-build-manual.patch      | 58 ++++++++++++++++++++++
 meta-oe/recipes-support/lvm2/lvm2.inc              |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch

diff --git a/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch b/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
new file mode 100644
index 0000000..15aa9f5
--- /dev/null
+++ b/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
@@ -0,0 +1,58 @@
+From d8bb25e34d6533ba78eaae697771ee499a66706f Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 2 Aug 2017 03:41:37 -0400
+Subject: [PATCH] do not build manual
+
+On some host (ubuntu 1404), build manual failed.
+...
+./tools/man-generator --primary lvscan lvscan.8_des
+Failed to stat description file lvscan.8_des.
+...
+
+Do not build man to workaround the issue.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile.in  | 4 ++--
+ configure.in | 1 -
+ 2 files changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 31d428d..24f89a2 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -18,7 +18,7 @@ top_builddir = @top_builddir@
+ abs_top_builddir = @abs_top_builddir@
+ abs_top_srcdir = @abs_top_srcdir@
+ 
+-SUBDIRS = conf daemons include lib libdaemon libdm man scripts tools
++SUBDIRS = conf daemons include lib libdaemon libdm scripts tools
+ 
+ ifeq ("@UDEV_RULES@", "yes")
+   SUBDIRS += udev
+@@ -69,7 +69,7 @@ liblvm.device-mapper: include.device-mapper
+ daemons.device-mapper: libdm.device-mapper
+ tools.device-mapper: libdm.device-mapper
+ scripts.device-mapper: include.device-mapper
+-device-mapper: tools.device-mapper daemons.device-mapper man.device-mapper
++device-mapper: tools.device-mapper daemons.device-mapper
+ 
+ ifeq ("@INTL@", "yes")
+ lib.pofile: include.pofile
+diff --git a/configure.in b/configure.in
+index 1dc8819..108ace4 100644
+--- a/configure.in
++++ b/configure.in
+@@ -2213,7 +2213,6 @@ libdm/Makefile
+ libdm/libdevmapper.pc
+ liblvm/Makefile
+ liblvm/liblvm2app.pc
+-man/Makefile
+ po/Makefile
+ python/Makefile
+ python/setup.py
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index c2dac95..179b044 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -13,6 +13,7 @@ SRC_URI = "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz \
            file://0003-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch \
            file://0004-tweak-MODPROBE_CMD-for-cross-compile.patch \
            file://0001-Avoid-bashisms-in-init-scripts.patch \
+           file://0005-do-not-build-manual.patch \
            "
 S = "${WORKDIR}/LVM2.${PV}"
 
-- 
2.8.1


