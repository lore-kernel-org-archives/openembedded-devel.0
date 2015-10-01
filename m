Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id B11E873CF2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2015 14:08:38 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t91E8doN003647 for <openembedded-devel@lists.openembedded.org>;
	Thu, 1 Oct 2015 09:08:39 -0500
Received: from adi-pc-linux.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015100109083879-891940 ;
	Thu, 1 Oct 2015 09:08:38 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 1 Oct 2015 17:08:37 +0300
Message-Id: <1443708517-27056-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1443602914-22199-1-git-send-email-adrian.ratiu@ni.com>
References: <1443602914-22199-1-git-send-email-adrian.ratiu@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 10/01/2015 09:08:39 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 10/01/2015 09:08:39 AM,
	Serialize complete at 10/01/2015 09:08:39 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-10-01_04:, , signatures=0
Subject: [meta-oe][PATCH V3] meta-oe: recipes-devtools: add libubox recipe
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
X-List-Received-Date: Thu, 01 Oct 2015 14:08:40 -0000

libubox contains C utility functions used by OpenWrt projects

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 .../libubox/libubox/0001-version-libraries.patch   | 28 ++++++++++++++++++++
 meta-oe/recipes-devtools/libubox/libubox_git.bb    | 30 ++++++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/libubox/libubox/0001-version-libraries.patch
 create mode 100644 meta-oe/recipes-devtools/libubox/libubox_git.bb

diff --git a/meta-oe/recipes-devtools/libubox/libubox/0001-version-libraries.patch b/meta-oe/recipes-devtools/libubox/libubox/0001-version-libraries.patch
new file mode 100644
index 0000000..02117fa
--- /dev/null
+++ b/meta-oe/recipes-devtools/libubox/libubox/0001-version-libraries.patch
@@ -0,0 +1,28 @@
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 57804cf..1aa7f27 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -18,6 +18,7 @@ ENDIF()
+ SET(SOURCES avl.c avl-cmp.c blob.c blobmsg.c uloop.c usock.c ustream.c ustream-fd.c vlist.c utils.c safe_list.c runqueue.c md5.c kvlist.c ulog.c base64.c)
+ 
+ ADD_LIBRARY(ubox SHARED ${SOURCES})
++SET_TARGET_PROPERTIES(ubox PROPERTIES VERSION 1.0.1 SOVERSION 1)
+ ADD_LIBRARY(ubox-static STATIC ${SOURCES})
+ SET_TARGET_PROPERTIES(ubox-static PROPERTIES OUTPUT_NAME ubox)
+ 
+@@ -46,6 +47,7 @@ find_library(json NAMES json-c)
+ IF(EXISTS ${json})
+ 	ADD_LIBRARY(blobmsg_json SHARED blobmsg_json.c)
+ 	TARGET_LINK_LIBRARIES(blobmsg_json ubox ${json})
++	SET_TARGET_PROPERTIES(blobmsg_json PROPERTIES VERSION 1.0.1 SOVERSION 1)
+ 
+ 	ADD_LIBRARY(blobmsg_json-static STATIC blobmsg_json.c)
+ 	SET_TARGET_PROPERTIES(blobmsg_json-static
+@@ -55,6 +57,7 @@ IF(EXISTS ${json})
+ 	TARGET_LINK_LIBRARIES(jshn blobmsg_json ${json})
+ 
+ 	ADD_LIBRARY(json_script SHARED json_script.c)
++	SET_TARGET_PROPERTIES(json_script PROPERTIES VERSION 1.0.1 SOVERSION 1)
+ 	TARGET_LINK_LIBRARIES(json_script ubox)
+ 
+ 	INSTALL(TARGETS blobmsg_json blobmsg_json-static jshn json_script
diff --git a/meta-oe/recipes-devtools/libubox/libubox_git.bb b/meta-oe/recipes-devtools/libubox/libubox_git.bb
new file mode 100644
index 0000000..d16bbcf
--- /dev/null
+++ b/meta-oe/recipes-devtools/libubox/libubox_git.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "C utility functions for OpenWrt"
+SECTION = "libs"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "\
+    file://avl.c;endline=39;md5=00810155fed3d604816ec5814523d60a \
+    file://avl-cmp.c;endline=15;md5=1603e6094b432a5f3f320877a06f41b5 \
+    file://base64.c;endline=61;md5=51fdff010d45b0086ac0a6e035693dc0 \
+    file://blobmsg.c;endline=15;md5=7ed64c1570e8c9b46c4fc6fbd16c489e \
+    file://list.h;endline=28;md5=2d5f5475fbd0f08741354c5a99c2e983 \
+    file://md5.h;endline=39;md5=048bf9f68963c207a0c2b3a94c9d2aaa \
+    file://md5.c;endline=51;md5=0a448eea0bcbc89e3c7e6608f2d119a0 \
+    file://usock.h;endline=18;md5=f0dfdc8de858e66d66d74036611bba14 \
+"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI = "\
+    git://git.openwrt.org/project/libubox.git \
+    file://0001-version-libraries.patch \
+"
+
+SRCREV = "136a5196266d03d537f822c4e67d2fde2ed59505"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+DEPENDS = "json-c"
+
+EXTRA_OECMAKE = "-DBUILD_EXAMPLES=OFF -DBUILD_LUA=OFF"
-- 
2.1.4


