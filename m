Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web10.19556.1630917936730883208
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Sep 2021 01:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wP2jDGh6;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1630917934; i=@fujitsu.com;
	bh=gAJuslYgFtQI6Cgd4B+cGlgm4WAiNEllNY5wknBj9dw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=wP2jDGh6ki0454R7kXhQ4jb672+BT0mGLwJIByJyBL6Rk392TG6lm5jOvtyLEIh9x
	 PC/wxc3gltgzl+0FWmOs9IfCwhkct/hKpP2waypHlURSnB+QYY19zM/1DBRnUXxsow
	 BKM0vyprtMFJtL8cKpO18nNHzAru6KNgS76vcnaQCp/gTxFlBZj1vmXvnAYDDbLzFF
	 W80QkXaGTHAP1v9Hco/GiMWjnWbxEXA2kiWESI7Gs6lwy5o0nOMtpWziH+x4oRlMju
	 ZMWjzCgrdHt3x/AWof5RM+kB7tf/67gs1Zy6DBwUOEEfKodgN7gtrJ/jaO46tZRluj
	 BwMMG/pEEcmMQ==
Received: from [100.113.2.26] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id CE/FB-32481-E25D5316; Mon, 06 Sep 2021 08:45:34 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MxVVf3qmm
  iwbb1ZhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aTt88YCzoVKk4dPM7ewNgt08XIxSEkMItJ
  ovdQP2MXIyeQs5tR4sT5MBCbTUBX4tzjtewgtoiAvsTS2XuYQWxhAXuJK9e3gtksAioSm8++Z
  Opi5ODgFfCQOPtbFSQsIaAgMeXhe7ASXgFBiZMzn7CA2MwCEhIHX7xgBimXEFCUmD1dHqK8Qu
  L14UvMExh5ZiHpmIWkYwEj0ypGy6SizPSMktzEzBxdQwMDXUNDY10DXSNTI73EKt1EvdRS3eT
  UvJKiRKCsXmJ5sV5xZW5yTopeXmrJJkZgEKUUMvzZwbj6zQe9Q4ySHExKorzPDpomCvEl5adU
  ZiQWZ8QXleakFh9ilOHgUJLgvXgJKCdYlJqeWpGWmQMMaJi0BAePkghv7GWgNG9xQWJucWY6R
  OoUoyvHu5+LFzFzvFm7BEi23bsLJGcuOLiameN++6HVzEIsefl5qVLivIdBmgVAmjNK8+BGw6
  LxEqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3v8gU3gy80rgLngFdBwT0HFtD01AjitJREh
  JNTA1OmTNUbGcsSDl6+yEK/dlbz8Uf7f89n7tQvFVLGerKv9xhDwNfn4laCPTfT2P+G2rfqds
  P/jf7zZPq/31LVxdK5zqTZrfsvklPmg7L595LIOvo89wZb1nhZDRAfXjx1oCTO58OmEg9Exhf
  mfH/vl8nqH+3ql6N5LMrVQTFNgid347cN9ANWHP9K01M0W8b+rxRJvMmrpuq8AtzhnTVjKZ+r
  HPqDyt0bZb0+TG8WWNKUbHCo8ryHh6X1f4oG0oZiDN9nz53FOPO3nfHNn2M8v/5ZwMo/NP+DW
  WzTi+VLcr8+S6GI1NApsu13H2OqydJv8ivKAm5LGMUkBlDFPw+g1t79k5a12OBWrslfseUaHE
  UpyRaKjFXFScCADb5Rv/QQMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-228.messagelabs.com!1630917933!287201!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27971 invoked from network); 6 Sep 2021 08:45:33 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-8.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 6 Sep 2021 08:45:33 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1868jX2O021726
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Sep 2021 09:45:33 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 6 Sep 2021 09:45:31 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] avro-c: upgrade 1.9.2 -> 1.10.2
Date: Sun, 5 Sep 2021 13:55:57 +0800
Message-ID: <1630821357-48968-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

0001-cmake-Use-GNUInstallDirs-instead-of-hard-coded-paths.patch
Removed since this is included in 1.10.2

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...tallDirs-instead-of-hard-coded-paths.patch | 70 -------------------
 .../{avro-c_1.9.2.bb => avro-c_1.10.2.bb}     |  5 +-
 2 files changed, 2 insertions(+), 73 deletions(-)
 delete mode 100644 meta-oe/recipes-support/avro/avro-c/0001-cmake-Use-GNUInstallDirs-instead-of-hard-coded-paths.patch
 rename meta-oe/recipes-support/avro/{avro-c_1.9.2.bb => avro-c_1.10.2.bb} (66%)

diff --git a/meta-oe/recipes-support/avro/avro-c/0001-cmake-Use-GNUInstallDirs-instead-of-hard-coded-paths.patch b/meta-oe/recipes-support/avro/avro-c/0001-cmake-Use-GNUInstallDirs-instead-of-hard-coded-paths.patch
deleted file mode 100644
index 6496b92dfe..0000000000
--- a/meta-oe/recipes-support/avro/avro-c/0001-cmake-Use-GNUInstallDirs-instead-of-hard-coded-paths.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From f24f863f3a8ca86f44123a58613f62c3b511da1e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 19 Dec 2019 18:23:41 -0800
-Subject: [PATCH] cmake: Use GNUInstallDirs instead of hard-coded paths
-
-This ensures that it can be built on platforms where libdir is not
-/usr/lib e.g. ppc64
-
-Upstream-Status: Submitted [https://github.com/apache/avro/pull/749]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lang/c/CMakeLists.txt     |  2 +-
- lang/c/src/CMakeLists.txt | 16 +++++++++-------
- 2 files changed, 10 insertions(+), 8 deletions(-)
-
-diff --git a/lang/c/CMakeLists.txt b/lang/c/CMakeLists.txt
-index 11cbf018e..6c8d7aaf3 100644
---- a/lang/c/CMakeLists.txt
-+++ b/lang/c/CMakeLists.txt
-@@ -16,7 +16,7 @@
- # specific language governing permissions and limitations
- # under the License.
- #
--cmake_minimum_required(VERSION 2.4)
-+cmake_minimum_required(VERSION 3.1)
- project(AvroC)
- enable_testing()
- 
-diff --git a/lang/c/src/CMakeLists.txt b/lang/c/src/CMakeLists.txt
-index 6f5659750..c1761c8de 100644
---- a/lang/c/src/CMakeLists.txt
-+++ b/lang/c/src/CMakeLists.txt
-@@ -106,17 +106,19 @@ install(DIRECTORY
-         DESTINATION include
-         FILES_MATCHING PATTERN "*.h")
- 
-+include(GNUInstallDirs)
-+
- if (WIN32)
- install(TARGETS avro-static
--        RUNTIME DESTINATION bin
--        LIBRARY DESTINATION lib
--        ARCHIVE DESTINATION lib
-+	RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
-+        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
-+        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
-        )
- else(WIN32)
- install(TARGETS avro-static avro-shared
--        RUNTIME DESTINATION bin
--        LIBRARY DESTINATION lib
--        ARCHIVE DESTINATION lib
-+	RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
-+	LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
-+        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
-        )
- endif(WIN32)
- 
-@@ -126,7 +128,7 @@ set(prefix ${CMAKE_INSTALL_PREFIX})
- set(VERSION ${AVRO_VERSION})
- configure_file(avro-c.pc.in avro-c.pc)
- install(FILES ${CMAKE_CURRENT_BINARY_DIR}/avro-c.pc
--        DESTINATION lib/pkgconfig)
-+        DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
- 
- add_executable(avrocat avrocat.c)
- target_link_libraries(avrocat avro-static)
--- 
-2.24.1
-
diff --git a/meta-oe/recipes-support/avro/avro-c_1.9.2.bb b/meta-oe/recipes-support/avro/avro-c_1.10.2.bb
similarity index 66%
rename from meta-oe/recipes-support/avro/avro-c_1.9.2.bb
rename to meta-oe/recipes-support/avro/avro-c_1.10.2.bb
index 0642179fb3..b86bfead76 100644
--- a/meta-oe/recipes-support/avro/avro-c_1.9.2.bb
+++ b/meta-oe/recipes-support/avro/avro-c_1.10.2.bb
@@ -7,10 +7,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6d502b41f76179fc84e536236f359cae"
 
 DEPENDS = "jansson zlib xz"
 
-BRANCH = "branch-1.9"
-SRCREV = "bf20128ca6138a830b2ea13e0490f3df6b035639"
+BRANCH = "branch-1.10"
+SRCREV = "8111cdc35430ff68dcb644306362859de40999d9"
 SRC_URI = "git://github.com/apache/avro;branch=${BRANCH} \
-           file://0001-cmake-Use-GNUInstallDirs-instead-of-hard-coded-paths.patch;patchdir=../../ \
           "
 
 S = "${WORKDIR}/git/lang/c"
-- 
2.25.1

