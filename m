Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web08.10881.1615823737988548233
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 08:55:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: randy.macleod@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 12FFtTcx026090
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Mar 2021 08:55:30 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 15 Mar 2021 08:55:28 -0700
Received: from vme.wrs.com (172.25.44.2) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Mon, 15 Mar 2021 08:55:28 -0700
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] tclap: upgrade 1.2.2 -> 1.4.0
Date: Mon, 15 Mar 2021 11:55:28 -0400
Message-ID: <20210315155528.1471897-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Project switched from autotools to CMake so drop the Makefile.am patch.
The COPYING file copyright years were updated. Add description.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../tclap/Makefile.am-disable-docs.patch      | 31 -------------------
 meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb | 16 ----------
 meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb | 22 +++++++++++++
 3 files changed, 22 insertions(+), 47 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/tclap/tclap/Makefile.am-disable-docs.patch
 delete mode 100644 meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb
 create mode 100644 meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb

diff --git a/meta-oe/recipes-devtools/tclap/tclap/Makefile.am-disable-docs.patch b/meta-oe/recipes-devtools/tclap/tclap/Makefile.am-disable-docs.patch
deleted file mode 100644
index 358cbefdd..000000000
--- a/meta-oe/recipes-devtools/tclap/tclap/Makefile.am-disable-docs.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From c209ed0e7ffca32fe3714bad9cc54bdb00c286bb Mon Sep 17 00:00:00 2001
-From: Ting Liu <b28495@freescale.com>
-Date: Mon, 15 Apr 2013 16:28:37 +0800
-Subject: [PATCH] Makefile.am: disable docs
-
-Upstream-Status: Inappropriate [OE specific]
-
-docs need some generating tool (for example, doxygen) from host which may
-be not available. Disable it to avoid build issue.
-
-Signed-off-by: Ting Liu <b28495@freescale.com>
----
- Makefile.am |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 0a6ebc9..6b42f41 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,7 +1,7 @@
- 
- ACLOCAL_AMFLAGS = -I config
- 
--SUBDIRS = include examples docs tests msc config
-+SUBDIRS = include examples tests msc config
- 
- pkgconfigdir = $(libdir)/pkgconfig
- pkgconfig_DATA = $(PACKAGE).pc
--- 
-1.7.5
-
diff --git a/meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb b/meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb
deleted file mode 100644
index bba8d5c21..000000000
--- a/meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "Templatized C++ Command Line Parser"
-HOMEPAGE = "http://tclap.sourceforge.net/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0ca8b9c5c5445cfa7af7e78fd27e60ed"
-
-SRCREV = "ec3ddcfe41b0544a4551a57439b6b3682fe31479"
-SRC_URI = "git://git.code.sf.net/p/tclap/code;branch=1.2 \
-    file://Makefile.am-disable-docs.patch \
-"
-
-S = "${WORKDIR}/git"
-inherit autotools
-
-ALLOW_EMPTY_${PN} = "1"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb b/meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb
new file mode 100644
index 000000000..13f66e47d
--- /dev/null
+++ b/meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Templatized C++ Command Line Parser"
+HOMEPAGE = "http://tclap.sourceforge.net/"
+DESCRIPTION = "TCLAP is a small, flexible library that provides a simple interface \
+for defining and accessing command line arguments. It was intially inspired by the \
+user friendly CLAP libary. The difference is that this library is templatized, so \
+the argument class is type independent. Type independence avoids identical-except-for-type \
+objects, such as IntArg, FloatArg, and StringArg. While the library is not strictly \
+compliant with the GNU or POSIX standards, it is close. \
+"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5c64b2e8cc50917b2744a90950faa7cd"
+
+SRCREV = "799a8b1f99818e39fee19d0601030770af1221e1"
+SRC_URI = "git://git.code.sf.net/p/tclap/code;branch=1.4 \
+"
+
+S = "${WORKDIR}/git"
+inherit cmake
+
+ALLOW_EMPTY_${PN} = "1"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.27.0

