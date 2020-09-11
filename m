Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.3784.1599787821309503393
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2020 18:30:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,413,1592841600"; 
   d="scan'208";a="99114668"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Sep 2020 09:30:19 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 01A4148990D2
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2020 09:30:16 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 11 Sep 2020 09:30:15 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] zeromq: upgrade 4.3.2 -> 4.3.3
Date: Fri, 11 Sep 2020 21:30:15 +0800
Message-ID: <1599831015-15643-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 01A4148990D2.A2969
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Refresh the following patch:
0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...void-host-specific-path-to-libsodium.patch | 19 +++++++++++++------
 .../{zeromq_4.3.2.bb => zeromq_4.3.3.bb}      |  4 ++--
 2 files changed, 15 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-connectivity/zeromq/{zeromq_4.3.2.bb => zeromq_4.3.3.bb} (87%)

diff --git a/meta-oe/recipes-connectivity/zeromq/files/0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch b/meta-oe/recipes-connectivity/zeromq/files/0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch
index eb3dee4d3..3b0300c8a 100644
--- a/meta-oe/recipes-connectivity/zeromq/files/0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch
+++ b/meta-oe/recipes-connectivity/zeromq/files/0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch
@@ -1,6 +1,7 @@
+From 24ad50286a87833329213dc0b0e68c21aeeee95f Mon Sep 17 00:00:00 2001
 From: Niko Mauno <niko.mauno@vaisala.com>
-Date: Wed Apr 22 09:00:00 2020 +0300
-Subject: CMakeLists.txt: Avoid host-specific path to libsodium
+Date: Wed, 22 Apr 2020 09:00:00 +0300
+Subject: [PATCH] CMakeLists.txt: Avoid host-specific path to libsodium
 
 Avoid propagating full build host specific path to generated
 ZeroMQTargets.cmake when building with libsodium, which changes the
@@ -17,10 +18,16 @@ Upstream-Status: Pending
 
 Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
 
+---
+ CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e92141d..d0775c1 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -1210,7 +1210,7 @@
-   target_link_libraries(libzmq ${OPTIONAL_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})
+@@ -1428,7 +1428,7 @@ if(BUILD_SHARED)
+   endif()
  
    if(SODIUM_FOUND)
 -    target_link_libraries(libzmq ${SODIUM_LIBRARIES})
@@ -28,8 +35,8 @@ Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
      # On Solaris, libsodium depends on libssp
      if(${CMAKE_SYSTEM_NAME} MATCHES "SunOS")
        target_link_libraries(libzmq ssp)
-@@ -1240,7 +1240,7 @@
-   target_link_libraries(libzmq-static ${OPTIONAL_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})
+@@ -1473,7 +1473,7 @@ if(BUILD_STATIC)
+   endif()
  
    if(SODIUM_FOUND)
 -    target_link_libraries(libzmq-static ${SODIUM_LIBRARIES})
diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.2.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.3.bb
similarity index 87%
rename from meta-oe/recipes-connectivity/zeromq/zeromq_4.3.2.bb
rename to meta-oe/recipes-connectivity/zeromq/zeromq_4.3.3.bb
index 02a4c04fd..a10500475 100644
--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.2.bb
+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.3.bb
@@ -10,8 +10,8 @@ SRC_URI = "http://github.com/zeromq/libzmq/releases/download/v${PV}/zeromq-${PV}
     file://0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch \
     file://run-ptest \
 "
-SRC_URI[md5sum] = "2047e917c2cc93505e2579bcba67a573"
-SRC_URI[sha256sum] = "ebd7b5c830d6428956b67a0454a7f8cbed1de74b3b01e5c33c5378e22740f763"
+SRC_URI[md5sum] = "78acc277d95e10812d71b2b3c3c3c9a9"
+SRC_URI[sha256sum] = "9d9285db37ae942ed0780c016da87060497877af45094ff9e1a1ca736e3875a2"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/libzmq/releases"
 
-- 
2.25.1



