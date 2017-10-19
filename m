Return-Path: <Li.Zhou@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 42F49781F4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Oct 2017 07:13:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v9J7D2hQ005450
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Oct 2017 00:13:03 -0700
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 19 Oct 2017 00:13:02 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 19 Oct 2017 15:12:10 +0800
Message-ID: <1508397130-81256-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [meta-networking][PATCH] bridge-utils: modify the AR to cross toolchain
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
X-List-Received-Date: Thu, 19 Oct 2017 07:13:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The Makefile uses the host “ar” tool when it should be using the
ar from the target toolchain.

Signed-off-by: Jiwei Sun <jiwei.sun@windriver.com>
Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 ...ridge-Modifying-the-AR-to-cross-toolchain.patch | 34 ++++++++++++++++++++++
 .../bridge-utils/bridge-utils_1.5.bb               |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-networking/recipes-support/bridge-utils/bridge-utils/0001-libbridge-Modifying-the-AR-to-cross-toolchain.patch

diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils/0001-libbridge-Modifying-the-AR-to-cross-toolchain.patch b/meta-networking/recipes-support/bridge-utils/bridge-utils/0001-libbridge-Modifying-the-AR-to-cross-toolchain.patch
new file mode 100644
index 0000000..e477f41
--- /dev/null
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils/0001-libbridge-Modifying-the-AR-to-cross-toolchain.patch
@@ -0,0 +1,34 @@
+From 689e24ef05bd1772b2149e4eb48b058ca8361cf4 Mon Sep 17 00:00:00 2001
+From: Li Zhou <li.zhou@windriver.com>
+Date: Thu, 19 Oct 2017 11:34:18 +0800
+Subject: [PATCH 2/2] libbridge: Modifying the AR to cross toolchain
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The Makefile uses the host “ar” tool when it should be using the
+ar from the target toolchain.
+
+Upstream-Status: Pending
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ libbridge/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libbridge/Makefile.in b/libbridge/Makefile.in
+index 11c0829..59d7355 100644
+--- a/libbridge/Makefile.in
++++ b/libbridge/Makefile.in
+@@ -1,7 +1,7 @@
+ 
+ KERNEL_HEADERS=-I@KERNEL_HEADERS@
+ 
+-AR=ar
++AR?=ar
+ RANLIB=@RANLIB@
+ 
+ CC=@CC@
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.5.bb b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.5.bb
index 6032ab0..723ae5f 100644
--- a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.5.bb
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.5.bb
@@ -7,6 +7,7 @@ SRC_URI += "\
     file://0003-bridge-fix-some-build-time-warnings-errno.h.patch \
     file://0004-libbridge-add-missing-include-s-fix-build-against-mu.patch \
     file://0005-build-don-t-ignore-CFLAGS-from-environment.patch \
+    file://0001-libbridge-Modifying-the-AR-to-cross-toolchain.patch \
 "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f9d20a453221a1b7e32ae84694da2c37"
-- 
1.9.1


