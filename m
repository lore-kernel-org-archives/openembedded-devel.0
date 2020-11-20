Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.20358.1605842716868752846
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2020 19:25:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,354,1599494400"; 
   d="scan'208";a="101570895"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Nov 2020 11:25:15 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 42BA94CE3A6C
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2020 11:25:12 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 20 Nov 2020 11:25:12 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libharu: Fix the packaging bug
Date: Fri, 20 Nov 2020 21:06:16 +0800
Message-ID: <1605877576-34748-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 42BA94CE3A6C.A353F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

The following error will occur when multilib is enabled:
ERROR: libharu-2.3.0-r0 do_package: QA Issue: libharu: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/libhpdfs.a
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
libharu: 2 installed and not shipped files. [installed-vs-shipped]
ERROR: libharu-2.3.0-r0 do_package: Fatal QA errors found, failing task.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...ib-into-var-libdir-rather-than-hardc.patch | 30 +++++++++++++++++++
 .../recipes-support/libharu/libharu_2.3.0.bb  |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-support/libharu/libharu/0001-Install-static-lib-into-var-libdir-rather-than-hardc.patch

diff --git a/meta-oe/recipes-support/libharu/libharu/0001-Install-static-lib-into-var-libdir-rather-than-hardc.patch b/meta-oe/recipes-support/libharu/libharu/0001-Install-static-lib-into-var-libdir-rather-than-hardc.patch
new file mode 100644
index 000000000..0947de196
--- /dev/null
+++ b/meta-oe/recipes-support/libharu/libharu/0001-Install-static-lib-into-var-libdir-rather-than-hardc.patch
@@ -0,0 +1,30 @@
+From 9341ac4f6ae38efe95dfd188105a9ea30941ccf6 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Wed, 18 Nov 2020 23:09:51 +0900
+Subject: [PATCH] Install static lib into var-libdir rather than hardcod lib.
+
+Lei Maohui <leimaohui@cn.fujitsu.com>
+
+Upstream-Status: Pending
+---
+ src/CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 249916c..fb06ea3 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -75,8 +75,8 @@ if(LIBHPDF_STATIC)
+   target_link_libraries(${LIBHPDF_NAME_STATIC} ${ADDITIONAL_LIBRARIES})
+   install(
+     TARGETS ${LIBHPDF_NAME_STATIC}
+-    ARCHIVE DESTINATION lib
+-    LIBRARY DESTINATION lib
++    ARCHIVE DESTINATION ${LIB_INSTALL_DIR}
++    LIBRARY DESTINATION ${LIB_INSTALL_DIR}
+     RUNTIME DESTINATION bin
+   )
+   if(WIN32 AND NOT CYGWIN)
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/libharu/libharu_2.3.0.bb b/meta-oe/recipes-support/libharu/libharu_2.3.0.bb
index 2d1a37c42..8d30c1f7b 100644
--- a/meta-oe/recipes-support/libharu/libharu_2.3.0.bb
+++ b/meta-oe/recipes-support/libharu/libharu_2.3.0.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://README;md5=3ee6bc1f64d9cc7907f44840c8e50cb1"
 
 SRC_URI = "git://github.com/libharu/libharu.git;branch=2_3 \
            file://libharu-RELEASE_2_3_0_cmake.patch \
+           file://0001-Install-static-lib-into-var-libdir-rather-than-hardc.patch \
 	   "
 
 SRCREV = "4ae1d5f4c84459f130bf1b1ef4c5c330af8eca5d"
-- 
2.25.1



