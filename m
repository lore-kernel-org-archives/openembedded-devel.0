Return-Path: <cshored@thecshore.com>
Received: from mail.thecshore.com (mail.thecshore.com [144.217.14.6])
	by mail.openembedded.org (Postfix) with ESMTP id 394C07889F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 11:37:47 +0000 (UTC)
Received: from workhobbyl.thecshore.com (135-23-247-100.cpe.pppoe.ca
	[135.23.247.100])
	by mail.thecshore.com (Postfix) with ESMTPSA id 424662677;
	Tue, 30 Jan 2018 06:37:48 -0500 (EST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.thecshore.com 424662677
Authentication-Results: mail.thecshore.com;
	dmarc=none (p=none dis=none) header.from=thecshore.com
Authentication-Results: mail.thecshore.com;
	spf=fail smtp.mailfrom=cshored@thecshore.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.thecshore.com 424662677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thecshore.com;
	s=default; t=1517312268;
	bh=Tl8kmgEh8p2e07wYijd1/hgdC62ePCN97uHHMUmPbyU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n1ei/dqgMCd8YhYZs0f3xj73pODi+ULqseXdMjy3+VGO/qT0ZcLD/OP19KMhstQVV
	Av8gq0t1DqEulxEIYMGpF+SrX/VjUhHsgeciBwfchLdyyUi3M5jvg33E8hMb7MrJy6
	NHO7xfD/U5sEiBT4zI2tsGlNZYNGWyvFTreN7BNI=
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.99.2 at mail.thecshore.com
From: cshored@thecshore.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Jan 2018 06:37:07 -0500
Message-Id: <20180130113708.14018-2-cshored@thecshore.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180130113708.14018-1-cshored@thecshore.com>
References: <20180130113708.14018-1-cshored@thecshore.com>
Subject: [PATCH 1/2] libubox: Move to meta-openwrt repo
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
X-List-Received-Date: Tue, 30 Jan 2018 11:37:47 -0000

From: "Daniel F. Dickinson" <cshored@thecshore.com>

libubox is primarily useful in the context of openwrt packages
and per Khem Raj does not belong in meta-oe (see
http://lists.openembedded.org/pipermail/openembedded-devel/2018-January/116565.html)

Signed-off-by: Daniel F. Dickinson <cshored@thecshore.com>
---
 .../libubox/libubox/0001-version-libraries.patch   | 28 ---------------
 .../libubox/libubox/fix-libdir.patch               | 40 ----------------------
 meta-oe/recipes-devtools/libubox/libubox_git.bb    | 30 ----------------
 3 files changed, 98 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/libubox/libubox/0001-version-libraries.patch
 delete mode 100644 meta-oe/recipes-devtools/libubox/libubox/fix-libdir.patch
 delete mode 100644 meta-oe/recipes-devtools/libubox/libubox_git.bb

diff --git a/meta-oe/recipes-devtools/libubox/libubox/0001-version-libraries.patch b/meta-oe/recipes-devtools/libubox/libubox/0001-version-libraries.patch
deleted file mode 100644
index 02117fa8d..000000000
--- a/meta-oe/recipes-devtools/libubox/libubox/0001-version-libraries.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 57804cf..1aa7f27 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -18,6 +18,7 @@ ENDIF()
- SET(SOURCES avl.c avl-cmp.c blob.c blobmsg.c uloop.c usock.c ustream.c ustream-fd.c vlist.c utils.c safe_list.c runqueue.c md5.c kvlist.c ulog.c base64.c)
- 
- ADD_LIBRARY(ubox SHARED ${SOURCES})
-+SET_TARGET_PROPERTIES(ubox PROPERTIES VERSION 1.0.1 SOVERSION 1)
- ADD_LIBRARY(ubox-static STATIC ${SOURCES})
- SET_TARGET_PROPERTIES(ubox-static PROPERTIES OUTPUT_NAME ubox)
- 
-@@ -46,6 +47,7 @@ find_library(json NAMES json-c)
- IF(EXISTS ${json})
- 	ADD_LIBRARY(blobmsg_json SHARED blobmsg_json.c)
- 	TARGET_LINK_LIBRARIES(blobmsg_json ubox ${json})
-+	SET_TARGET_PROPERTIES(blobmsg_json PROPERTIES VERSION 1.0.1 SOVERSION 1)
- 
- 	ADD_LIBRARY(blobmsg_json-static STATIC blobmsg_json.c)
- 	SET_TARGET_PROPERTIES(blobmsg_json-static
-@@ -55,6 +57,7 @@ IF(EXISTS ${json})
- 	TARGET_LINK_LIBRARIES(jshn blobmsg_json ${json})
- 
- 	ADD_LIBRARY(json_script SHARED json_script.c)
-+	SET_TARGET_PROPERTIES(json_script PROPERTIES VERSION 1.0.1 SOVERSION 1)
- 	TARGET_LINK_LIBRARIES(json_script ubox)
- 
- 	INSTALL(TARGETS blobmsg_json blobmsg_json-static jshn json_script
diff --git a/meta-oe/recipes-devtools/libubox/libubox/fix-libdir.patch b/meta-oe/recipes-devtools/libubox/libubox/fix-libdir.patch
deleted file mode 100644
index 6f09c8b29..000000000
--- a/meta-oe/recipes-devtools/libubox/libubox/fix-libdir.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-[PATCH] fix the CMAKE_INSTALL_LIBDIR
-
-Upstream-Status: Pending
-
-libdir maybe /usr/lib64 for 64bit machine
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- CMakeLists.txt | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 57804cf..2c7bdc1 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -35,8 +35,8 @@ INSTALL(FILES ${headers}
- 	DESTINATION include/libubox
- )
- INSTALL(TARGETS ubox ubox-static
--	ARCHIVE DESTINATION lib
--	LIBRARY DESTINATION lib
-+	ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
-+	LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
- )
- 
- ADD_SUBDIRECTORY(lua)
-@@ -58,8 +58,8 @@ IF(EXISTS ${json})
- 	TARGET_LINK_LIBRARIES(json_script ubox)
- 
- 	INSTALL(TARGETS blobmsg_json blobmsg_json-static jshn json_script
--		ARCHIVE DESTINATION lib
--		LIBRARY DESTINATION lib
-+		ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
-+		LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
- 		RUNTIME DESTINATION bin
- 	)
- 
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-devtools/libubox/libubox_git.bb b/meta-oe/recipes-devtools/libubox/libubox_git.bb
deleted file mode 100644
index f9f4e08b7..000000000
--- a/meta-oe/recipes-devtools/libubox/libubox_git.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION = "C utility functions for OpenWrt"
-SECTION = "libs"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "\
-    file://avl.c;endline=39;md5=00810155fed3d604816ec5814523d60a \
-    file://avl-cmp.c;endline=15;md5=1603e6094b432a5f3f320877a06f41b5 \
-    file://base64.c;endline=61;md5=51fdff010d45b0086ac0a6e035693dc0 \
-    file://blobmsg.c;endline=15;md5=7ed64c1570e8c9b46c4fc6fbd16c489e \
-    file://list.h;endline=28;md5=2d5f5475fbd0f08741354c5a99c2e983 \
-    file://md5.h;endline=39;md5=048bf9f68963c207a0c2b3a94c9d2aaa \
-    file://md5.c;endline=51;md5=0a448eea0bcbc89e3c7e6608f2d119a0 \
-    file://usock.h;endline=18;md5=f0dfdc8de858e66d66d74036611bba14 \
-"
-
-SRC_URI = "\
-    git://git.openwrt.org/project/libubox.git \
-    file://0001-version-libraries.patch \
-    file://fix-libdir.patch \
-"
-
-SRCREV = "155bf39896f126b1ba121b816922a88dc34c31e3"
-PV = "1.0.1+git${SRCPV}"
-
-S = "${WORKDIR}/git"
-
-inherit cmake
-
-DEPENDS = "json-c"
-
-EXTRA_OECMAKE = "-DBUILD_EXAMPLES=OFF -DBUILD_LUA=OFF"
-- 
2.11.0


