Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.3774.1614756783574387931
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Mar 2021 23:33:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 1237WuSB018654
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 2 Mar 2021 23:33:01 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 2 Mar 2021 23:32:56 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Tue, 2 Mar 2021 23:32:55 -0800
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/2] libinih: install header files without prefix dir inih
Date: Wed, 3 Mar 2021 15:32:51 +0800
Message-ID: <20210303073252.31386-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The other flavor of inih which adapted by Fedora and Ubuntu installs
header files to /usr/include directly. And xfsprogs 5.10.0 also checks
ini.h without extra search path and failed. So install header files
without prefix dir inih.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...header-files-without-prefix-dir-inih.patch | 24 +++++++++++++++++++
 meta-oe/recipes-support/inih/libinih_git.bb   |  3 ++-
 2 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/inih/files/0001-include-install-header-files-without-prefix-dir-inih.patch

diff --git a/meta-oe/recipes-support/inih/files/0001-include-install-header-files-without-prefix-dir-inih.patch b/meta-oe/recipes-support/inih/files/0001-include-install-header-files-without-prefix-dir-inih.patch
new file mode 100644
index 000000000..fb7b85cfd
--- /dev/null
+++ b/meta-oe/recipes-support/inih/files/0001-include-install-header-files-without-prefix-dir-inih.patch
@@ -0,0 +1,24 @@
+include: install header files without prefix dir inih
+
+The other flavor of inih which adapted by Fedora and Ubuntu installs
+header files to /usr/include directly. And xfsprogs 5.10.0 also checks
+ini.h without extra search path and fails. So install header files
+without prefix dir inih.
+
+Upstream-Status: Submitted [https://github.com/OSSystems/inih/pull/4]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ include/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/CMakeLists.txt b/include/CMakeLists.txt
+index 7a46ee7..4a9033f 100644
+--- a/include/CMakeLists.txt
++++ b/include/CMakeLists.txt
+@@ -1 +1 @@
+-install(FILES ini.h INIReader.h DESTINATION ${CMAKE_INSTALL_PREFIX}/include/inih)
++install(FILES ini.h INIReader.h DESTINATION ${CMAKE_INSTALL_PREFIX}/include)
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-support/inih/libinih_git.bb b/meta-oe/recipes-support/inih/libinih_git.bb
index 227e2a7b7..5beb29281 100644
--- a/meta-oe/recipes-support/inih/libinih_git.bb
+++ b/meta-oe/recipes-support/inih/libinih_git.bb
@@ -10,7 +10,8 @@ PR = "r3"
 # The github repository provides a cmake and pkg-config integration
 SRCREV = "c858aff8c31fa63ef4d1e0176c10e5928cde9a23"
 SRC_URI = "git://github.com/OSSystems/inih.git \
-          "
+           file://0001-include-install-header-files-without-prefix-dir-inih.patch \
+           "
 
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.17.1

