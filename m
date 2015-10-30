Return-Path: <Rongqing.Li@windriver.com>
Received: from mail5.wrs.com (unknown [64.129.254.146])
	by mail.openembedded.org (Postfix) with ESMTP id 76CEE770CB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 05:15:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id t9U5F63P021809
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 22:15:06 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 29 Oct 2015 22:15:06 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 30 Oct 2015 13:06:03 +0800
Message-ID: <1446181563-10425-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-oe] libubox: fix libdir
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
X-List-Received-Date: Fri, 30 Oct 2015 05:15:07 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

The library dir maybe /usr/lib64 or /usr/lib, so use the variable
CMAKE_INSTALL_LIBDIR, not hardcode to lib

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../libubox/libubox/fix-libdir.patch               | 40 ++++++++++++++++++++++
 meta-oe/recipes-devtools/libubox/libubox_git.bb    |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/libubox/libubox/fix-libdir.patch

diff --git a/meta-oe/recipes-devtools/libubox/libubox/fix-libdir.patch b/meta-oe/recipes-devtools/libubox/libubox/fix-libdir.patch
new file mode 100644
index 0000000..6f09c8b
--- /dev/null
+++ b/meta-oe/recipes-devtools/libubox/libubox/fix-libdir.patch
@@ -0,0 +1,40 @@
+[PATCH] fix the CMAKE_INSTALL_LIBDIR
+
+Upstream-Status: Pending
+
+libdir maybe /usr/lib64 for 64bit machine
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ CMakeLists.txt | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 57804cf..2c7bdc1 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -35,8 +35,8 @@ INSTALL(FILES ${headers}
+ 	DESTINATION include/libubox
+ )
+ INSTALL(TARGETS ubox ubox-static
+-	ARCHIVE DESTINATION lib
+-	LIBRARY DESTINATION lib
++	ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
++	LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
+ )
+ 
+ ADD_SUBDIRECTORY(lua)
+@@ -58,8 +58,8 @@ IF(EXISTS ${json})
+ 	TARGET_LINK_LIBRARIES(json_script ubox)
+ 
+ 	INSTALL(TARGETS blobmsg_json blobmsg_json-static jshn json_script
+-		ARCHIVE DESTINATION lib
+-		LIBRARY DESTINATION lib
++		ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
++		LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
+ 		RUNTIME DESTINATION bin
+ 	)
+ 
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-devtools/libubox/libubox_git.bb b/meta-oe/recipes-devtools/libubox/libubox_git.bb
index 3e886b7..d0da2c5 100644
--- a/meta-oe/recipes-devtools/libubox/libubox_git.bb
+++ b/meta-oe/recipes-devtools/libubox/libubox_git.bb
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM = "\
 SRC_URI = "\
     git://git.openwrt.org/project/libubox.git \
     file://0001-version-libraries.patch \
+    file://fix-libdir.patch \
 "
 
 SRCREV = "136a5196266d03d537f822c4e67d2fde2ed59505"
-- 
1.9.1


