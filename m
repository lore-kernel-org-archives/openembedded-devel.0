Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF67DC83F22
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 11:27:01 +0000 (UTC)
Received: from esa13.hc324-48.eu.iphmx.com (esa13.hc324-48.eu.iphmx.com [207.54.72.35])
 by mx.groups.io with SMTP id smtpd.web11.75862.1752492418642111750
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jul 2025 04:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=BB32Rn5A;
 spf=pass (domain: bmw.de, ip: 207.54.72.35, mailfrom: prvs=2837bfe52=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1752492418; x=1784028418;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SGSbjFGDqL7PGDK1MMGszpOP3FFe+nGtEx58iOa7CMc=;
  b=BB32Rn5AWxP1f02HLSQWHvgkEXUZ62UXgvmk9SUp5VQjZOdhCcmoFLS5
   mZTrn68RS1CdBG1rwxL00+99PfiK7E3/tLWkNPTK2yiKmSWApR6UDI+6c
   zgjlMAGtP24hwxhkOOM5vjMj7vAaRBP7WDr0Z2KYA6hSEqWAKaOvq7dMg
   w=;
X-CSE-ConnectionGUID: eSQumiq5Qp6sN64FPQnEAQ==
X-CSE-MsgGUID: 88ZfZPxIRGqjEDhV6bxVgA==
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa13.hc324-48.eu.iphmx.com with ESMTP/TLS; 14 Jul 2025 13:26:55 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw4.muc with ESMTP/TLS;
 14 Jul 2025 13:26:55 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb1.muc with ESMTP/TLS; 14 Jul 2025 13:26:55 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.204) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Mon, 14 Jul 2025 13:26:55 +0200
X-CSE-ConnectionGUID: xNP1EjpoRV2MOZZ/S/f86w==
X-CSE-MsgGUID: iIABcl8/TU6Usgy9qSRUkQ==
X-CSE-ConnectionGUID: AxHrefwhQDewvvzgSzWweA==
X-CSE-MsgGUID: PcY2CAxLRCiQg5itSF+mPw==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [meta-oe][PATCH 02/10] libubox: Update to latest tip of trunk
Date: Mon, 14 Jul 2025 13:26:27 +0200
Message-ID: <20250714112642.121146-2-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714112642.121146-1-Moritz.Haase@bmw.de>
References: <20250714112642.121146-1-Moritz.Haase@bmw.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: smucmp15a.europe.bmw.corp (2a03:1e80:a15:58f::1:68) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 11:27:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118521

Fixes builds with CMake 4+. All patches that are still required have been
refreshed and a new patch for CMake 4 compatibility has been added.

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 ...x-array-out-of-bounds-GCC-10-warning.patch | 42 -------------------
 ...h => 0001-cmake-Set-library-version.patch} | 19 ++++++---
 ...-cmake-fix-the-CMAKE_INSTALL_LIBDIR.patch} | 15 +++----
 ...ude-lua-and-examples-directories-if-.patch | 35 ++++++++++++++++
 .../recipes-devtools/libubox/libubox_git.bb   |  8 ++--
 5 files changed, 61 insertions(+), 58 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/libubox/libubox/0001-blobmsg-fix-array-out-of-bounds-GCC-10-warning.patch
 rename meta-oe/recipes-devtools/libubox/libubox/{0001-version-libraries.patch => 0001-cmake-Set-library-version.patch} (65%)
 rename meta-oe/recipes-devtools/libubox/libubox/{fix-libdir.patch => 0002-cmake-fix-the-CMAKE_INSTALL_LIBDIR.patch} (69%)
 create mode 100644 meta-oe/recipes-devtools/libubox/libubox/0003-cmake-Don-t-include-lua-and-examples-directories-if-.patch

diff --git a/meta-oe/recipes-devtools/libubox/libubox/0001-blobmsg-fix-array-out-of-bounds-GCC-10-warning.patch b/meta-oe/recipes-devtools/libubox/libubox/0001-blobmsg-fix-array-out-of-bounds-GCC-10-warning.patch
deleted file mode 100644
index 4f1dd76326..0000000000
--- a/meta-oe/recipes-devtools/libubox/libubox/0001-blobmsg-fix-array-out-of-bounds-GCC-10-warning.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From a12325a0cbf3bf1d66a0b0f8d85e08083bae6066 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
-Date: Wed, 25 Dec 2019 10:27:59 +0100
-Subject: [PATCH] blobmsg: fix array out of bounds GCC 10 warning
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes following warning reported by GCC 10.0.0 20191203:
-
- blobmsg.c:234:2: error: 'strcpy' offset 6 from the object at 'attr' is out of the bounds of referenced subobject 'name' with type 'uint8_t[0]' {aka 'unsigned char[0]'} at offset 6 [-Werror=array-bounds]
-   234 |  strcpy((char *) hdr->name, (const char *)name);
-       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
- In file included from blobmsg.c:16:
- blobmsg.h:42:10: note: subobject 'name' declared here
-    42 |  uint8_t name[];
-       |          ^~~~
-
-Upstream-Status: Submitted [https://gitlab.com/ynezz/openwrt-libubox/commit/3775b3aa28de8c20d96b6f02786a327423b0748a]
-Reported-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Petr Štetiar <ynezz@true.cz>
----
- blobmsg.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/blobmsg.c b/blobmsg.c
-index a860483..b6b7535 100644
---- a/blobmsg.c
-+++ b/blobmsg.c
-@@ -195,7 +195,7 @@ blobmsg_new(struct blob_buf *buf, int type, const char *name, int payload_len, v
- 	attr->id_len |= be32_to_cpu(BLOB_ATTR_EXTENDED);
- 	hdr = blob_data(attr);
- 	hdr->namelen = cpu_to_be16(namelen);
--	strcpy((char *) hdr->name, (const char *)name);
-+	memcpy(hdr->name, name, namelen);
- 	pad_end = *data = blobmsg_data(attr);
- 	pad_start = (char *) &hdr->name[namelen];
- 	if (pad_start < pad_end)
--- 
-2.24.1
-
diff --git a/meta-oe/recipes-devtools/libubox/libubox/0001-version-libraries.patch b/meta-oe/recipes-devtools/libubox/libubox/0001-cmake-Set-library-version.patch
similarity index 65%
rename from meta-oe/recipes-devtools/libubox/libubox/0001-version-libraries.patch
rename to meta-oe/recipes-devtools/libubox/libubox/0001-cmake-Set-library-version.patch
index f82c31ad07..737d143287 100644
--- a/meta-oe/recipes-devtools/libubox/libubox/0001-version-libraries.patch
+++ b/meta-oe/recipes-devtools/libubox/libubox/0001-cmake-Set-library-version.patch
@@ -1,18 +1,27 @@
+From 0d97421370d1c52d0db798134420796a960df743 Mon Sep 17 00:00:00 2001
+From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
+Date: Thu, 1 Oct 2015 17:31:36 +0300
+Subject: [PATCH 1/3] cmake: Set library version
+
 Upstream-Status: Pending
+Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
+---
+ CMakeLists.txt | 3 +++
+ 1 file changed, 3 insertions(+)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 57804cf..1aa7f27 100644
+index f40eaa6..cb089a2 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -18,6 +18,7 @@ ENDIF()
- SET(SOURCES avl.c avl-cmp.c blob.c blobmsg.c uloop.c usock.c ustream.c ustream-fd.c vlist.c utils.c safe_list.c runqueue.c md5.c kvlist.c ulog.c base64.c)
+@@ -21,6 +21,7 @@ INCLUDE_DIRECTORIES(${JSONC_INCLUDE_DIRS})
+ SET(SOURCES avl.c avl-cmp.c blob.c blobmsg.c uloop.c usock.c ustream.c ustream-fd.c vlist.c utils.c safe_list.c runqueue.c md5.c kvlist.c ulog.c base64.c udebug.c udebug-remote.c)
  
  ADD_LIBRARY(ubox SHARED ${SOURCES})
 +SET_TARGET_PROPERTIES(ubox PROPERTIES VERSION 1.0.1 SOVERSION 1)
  ADD_LIBRARY(ubox-static STATIC ${SOURCES})
  SET_TARGET_PROPERTIES(ubox-static PROPERTIES OUTPUT_NAME ubox)
  
-@@ -46,6 +47,7 @@ find_library(json NAMES json-c)
+@@ -65,6 +66,7 @@ find_library(json NAMES json-c)
  IF(EXISTS ${json})
  	ADD_LIBRARY(blobmsg_json SHARED blobmsg_json.c)
  	TARGET_LINK_LIBRARIES(blobmsg_json ubox ${json})
@@ -20,7 +29,7 @@ index 57804cf..1aa7f27 100644
  
  	ADD_LIBRARY(blobmsg_json-static STATIC blobmsg_json.c)
  	SET_TARGET_PROPERTIES(blobmsg_json-static
-@@ -55,6 +57,7 @@ IF(EXISTS ${json})
+@@ -78,6 +80,7 @@ IF(EXISTS ${json})
  	TARGET_LINK_LIBRARIES(jshn blobmsg_json ${json})
  
  	ADD_LIBRARY(json_script SHARED json_script.c)
diff --git a/meta-oe/recipes-devtools/libubox/libubox/fix-libdir.patch b/meta-oe/recipes-devtools/libubox/libubox/0002-cmake-fix-the-CMAKE_INSTALL_LIBDIR.patch
similarity index 69%
rename from meta-oe/recipes-devtools/libubox/libubox/fix-libdir.patch
rename to meta-oe/recipes-devtools/libubox/libubox/0002-cmake-fix-the-CMAKE_INSTALL_LIBDIR.patch
index 6f09c8b293..853ce9b5e4 100644
--- a/meta-oe/recipes-devtools/libubox/libubox/fix-libdir.patch
+++ b/meta-oe/recipes-devtools/libubox/libubox/0002-cmake-fix-the-CMAKE_INSTALL_LIBDIR.patch
@@ -1,19 +1,23 @@
-[PATCH] fix the CMAKE_INSTALL_LIBDIR
+From ff1f1c6c67ca9c955385a967b1b6609da76c5944 Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Fri, 30 Oct 2015 13:06:03 +0800
+Subject: [PATCH 2/3] cmake: fix the CMAKE_INSTALL_LIBDIR
 
 Upstream-Status: Pending
 
 libdir maybe /usr/lib64 for 64bit machine
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
+Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
 ---
  CMakeLists.txt | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 57804cf..2c7bdc1 100644
+index cb089a2..783fa0a 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -35,8 +35,8 @@ INSTALL(FILES ${headers}
+@@ -42,8 +42,8 @@ INSTALL(FILES ${headers}
  	DESTINATION include/libubox
  )
  INSTALL(TARGETS ubox ubox-static
@@ -24,7 +28,7 @@ index 57804cf..2c7bdc1 100644
  )
  
  ADD_SUBDIRECTORY(lua)
-@@ -58,8 +58,8 @@ IF(EXISTS ${json})
+@@ -84,8 +84,8 @@ IF(EXISTS ${json})
  	TARGET_LINK_LIBRARIES(json_script ubox)
  
  	INSTALL(TARGETS blobmsg_json blobmsg_json-static jshn json_script
@@ -35,6 +39,3 @@ index 57804cf..2c7bdc1 100644
  		RUNTIME DESTINATION bin
  	)
  
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-devtools/libubox/libubox/0003-cmake-Don-t-include-lua-and-examples-directories-if-.patch b/meta-oe/recipes-devtools/libubox/libubox/0003-cmake-Don-t-include-lua-and-examples-directories-if-.patch
new file mode 100644
index 0000000000..b38989ef9e
--- /dev/null
+++ b/meta-oe/recipes-devtools/libubox/libubox/0003-cmake-Don-t-include-lua-and-examples-directories-if-.patch
@@ -0,0 +1,35 @@
+From 93e7b9014a14193e39e5d414c81da2d32f94ed43 Mon Sep 17 00:00:00 2001
+From: Moritz Haase <Moritz.Haase@bmw.de>
+Date: Mon, 14 Jul 2025 09:23:09 +0200
+Subject: [PATCH 3/3] cmake: Don't include 'lua' and 'examples' directories if
+ disabled
+
+It's the sensible thing to do and unblocks builds with CMake 4+, since both
+CMakeLists.txt files in the directories in question have
+'cmake_minimum_required(VERSION 2.6)'.
+
+Upstream-Status: Pending
+Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
+---
+ CMakeLists.txt | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 783fa0a..61e152c 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -46,8 +46,12 @@ INSTALL(TARGETS ubox ubox-static
+ 	LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
+ )
+ 
+-ADD_SUBDIRECTORY(lua)
+-ADD_SUBDIRECTORY(examples)
++IF(BUILD_LUA)
++	ADD_SUBDIRECTORY(lua)
++ENDIF()
++IF(BUILD_EXAMPLES)
++	ADD_SUBDIRECTORY(examples)
++ENDIF()
+ 
+ MACRO(ADD_UNIT_TEST_SAN name)
+   ADD_EXECUTABLE(${name}-san ${name}.c)
diff --git a/meta-oe/recipes-devtools/libubox/libubox_git.bb b/meta-oe/recipes-devtools/libubox/libubox_git.bb
index 394cf9c000..3c51d36848 100644
--- a/meta-oe/recipes-devtools/libubox/libubox_git.bb
+++ b/meta-oe/recipes-devtools/libubox/libubox_git.bb
@@ -14,12 +14,12 @@ LIC_FILES_CHKSUM = "\
 
 SRC_URI = "\
     git://git.openwrt.org/project/libubox.git;branch=master \
-    file://0001-version-libraries.patch \
-    file://fix-libdir.patch \
-    file://0001-blobmsg-fix-array-out-of-bounds-GCC-10-warning.patch \
+    file://0001-cmake-Set-library-version.patch \
+    file://0002-cmake-fix-the-CMAKE_INSTALL_LIBDIR.patch \
+    file://0003-cmake-Don-t-include-lua-and-examples-directories-if-.patch \
 "
 
-SRCREV = "07413cce72e19520af55dfcbc765484f5ab41dd9"
+SRCREV = "b7acc8e6fd5e13611ad90a593e98f9589af4009a"
 PV = "1.0.1+git"
 
 # Upstream repo does not tag

