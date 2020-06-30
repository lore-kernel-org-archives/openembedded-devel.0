Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.5952.1593480392350105689
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 18:26:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,296,1589212800"; 
   d="scan'208";a="95532554"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 30 Jun 2020 09:26:25 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 90AA64CE4B1C
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 09:15:56 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 30 Jun 2020 09:26:23 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] docopt.cpp: upgrade 0.6.2 -> 0.6.3
Date: Tue, 30 Jun 2020 09:26:21 +0800
Message-ID: <1593480381-4888-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 90AA64CE4B1C.A5649
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-docopt.cpp/0001-Set-library-VERSION-and-SOVERSION.patch
Removed since this is included in 0.6.3.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...01-Set-library-VERSION-and-SOVERSION.patch | 31 -------------------
 .../docopt.cpp/docopt.cpp_git.bb              |  5 ++-
 2 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/docopt.cpp/docopt.cpp/0001-Set-library-VERSION-and-SOVERSION.patch

diff --git a/meta-oe/recipes-extended/docopt.cpp/docopt.cpp/0001-Set-library-VERSION-and-SOVERSION.patch b/meta-oe/recipes-extended/docopt.cpp/docopt.cpp/0001-Set-library-VERSION-and-SOVERSION.patch
deleted file mode 100644
index d4c776569..000000000
--- a/meta-oe/recipes-extended/docopt.cpp/docopt.cpp/0001-Set-library-VERSION-and-SOVERSION.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From a47ca75702318ff43446c70120f7aacde4ccee1b Mon Sep 17 00:00:00 2001
-From: Eero Aaltonen <eero.aaltonen@vaisala.com>
-Date: Thu, 20 Jun 2019 16:21:20 +0300
-Subject: [PATCH] Set library VERSION and SOVERSION
-
-With soversion and version specified, `install` target will install the
-library with the specified version and also create the proper symlink.
-
-Upstream-Status: Submitted [https://github.com/docopt/docopt.cpp/pull/112]
-but unlikely to be merged soon as it is a duplicate of
-[https://github.com/docopt/docopt.cpp/pull/112] which has been **Open**
-since 2016-12-08.
----
- CMakeLists.txt | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 23da468..feff32e 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -50,6 +50,10 @@ else()
-     set_target_properties(docopt_o PROPERTIES POSITION_INDEPENDENT_CODE TRUE)
- 
-     add_library(docopt SHARED $<TARGET_OBJECTS:docopt_o>)
-+	set_target_properties(docopt PROPERTIES
-+		VERSION ${PROJECT_VERSION}
-+		SOVERSION ${PROJECT_VERSION_MAJOR}
-+		)
-     add_library(docopt_s STATIC $<TARGET_OBJECTS:docopt_o>)
- endif()
- 
diff --git a/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb b/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
index aa55ebf84..7a6b0bf95 100644
--- a/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
+++ b/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
@@ -14,12 +14,11 @@ LIC_FILES_CHKSUM = "\
 "
 
 DEPENDS = "boost"
-SRCREV = "3dd23e3280f213bacefdf5fcb04857bf52e90917"
-PV = "0.6.2+git${SRCPV}"
+SRCREV = "42ebcec9dc2c99a1b3a4542787572045763ad196"
+PV = "0.6.3+git${SRCPV}"
 
 SRC_URI = "\
     git://github.com/docopt/docopt.cpp.git;protocol=https \
-    file://0001-Set-library-VERSION-and-SOVERSION.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.17.1



