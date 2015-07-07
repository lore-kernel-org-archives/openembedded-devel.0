Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4346B65CCD
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jul 2015 05:15:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t675FRFq022528
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Jul 2015 22:15:27 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Mon, 6 Jul 2015 22:15:26 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 7 Jul 2015 13:14:40 +0800
Message-ID: <1436246080-5266-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-oe] hostapd: consider sysroot when search header files
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
X-List-Received-Date: Tue, 07 Jul 2015 05:15:30 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../hostapd/hostapd-2.2/add-sysroot-to-gcc.patch   | 40 ++++++++++++++++++++++
 .../recipes-connectivity/hostapd/hostapd_2.2.bb    |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd-2.2/add-sysroot-to-gcc.patch

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd-2.2/add-sysroot-to-gcc.patch b/meta-oe/recipes-connectivity/hostapd/hostapd-2.2/add-sysroot-to-gcc.patch
new file mode 100644
index 0000000..d1134b9
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd-2.2/add-sysroot-to-gcc.patch
@@ -0,0 +1,40 @@
+Upstream-Status: Pending
+
+We should make sure that sysroot is used by gcc instead of assuming
+hardcoded locations for include paths
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ src/drivers/drivers.mak | 2 +-
+ src/drivers/drivers.mk  | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/drivers/drivers.mak b/src/drivers/drivers.mak
+index 7e175f4..950701f 100644
+--- a/src/drivers/drivers.mak
++++ b/src/drivers/drivers.mak
+@@ -35,7 +35,7 @@ NEED_RFKILL=y
+ ifdef CONFIG_LIBNL32
+   DRV_LIBS += -lnl-3
+   DRV_LIBS += -lnl-genl-3
+-  DRV_CFLAGS += -DCONFIG_LIBNL20 -I/usr/include/libnl3
++  DRV_CFLAGS += -DCONFIG_LIBNL20 -I=/usr/include/libnl3
+ else
+   ifdef CONFIG_LIBNL_TINY
+     DRV_LIBS += -lnl-tiny
+diff --git a/src/drivers/drivers.mk b/src/drivers/drivers.mk
+index db8561a..c93e88d 100644
+--- a/src/drivers/drivers.mk
++++ b/src/drivers/drivers.mk
+@@ -30,7 +30,7 @@ NEED_RFKILL=y
+ ifdef CONFIG_LIBNL32
+   DRV_LIBS += -lnl-3
+   DRV_LIBS += -lnl-genl-3
+-  DRV_CFLAGS += -DCONFIG_LIBNL20 -I/usr/include/libnl3
++  DRV_CFLAGS += -DCONFIG_LIBNL20 -I=/usr/include/libnl3
+ else
+   ifdef CONFIG_LIBNL_TINY
+     DRV_LIBS += -lnl-tiny
+-- 
+2.1.2
+
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.2.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.2.bb
index b75f2b9..02b78f1 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.2.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.2.bb
@@ -18,6 +18,7 @@ SRC_URI = " \
     file://defconfig \
     file://init \
     file://hostapd.service \
+    file://add-sysroot-to-gcc.patch;patchdir=.. \
 "
 
 S = "${WORKDIR}/hostapd-${PV}/hostapd"
-- 
1.9.1


