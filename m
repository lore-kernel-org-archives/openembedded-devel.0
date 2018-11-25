Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0A61D6C45F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Nov 2018 18:55:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 432zlB5jMmz61
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Nov 2018 19:55:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1543172134;
	bh=wWKDwHxUOziqZgEw+7CfMYJLryDE4cQ5Wd3/tow/LDg=;
	h=From:To:Subject:Date:From;
	b=RovrnfQHMMxpefAI1Lw++QXcLmEI/mB2DCxh8XhK+hfqcwuoZnONtpevdS9tnwClD
	UzWE5Msj/Qe6l71+zP0Cu6VKYLef7V5JfKeVCOI/2S6WQ6bJXjG4iHUz28sKk4yitf
	nbv6/d0ZzmDa+GYi2tHZnXIFCBq1kmE0TP89HLGeQLC0h0Je+5suSblSImEFp06V3z
	NGtPWcRxE04KWMzQf9ZAMCR4cKLqiE2gcJPlzzZmQ0pjkS2pPxdkQLP0WpMcIVLyDx
	rCWN8nnnhE2QOLEcwCjeh0EXuLr8tyPKfI0q9KhXKDOrIu0XgM94XQRYPgduTJPvdr
	eDwnaXOGeFaYtxK8bljU8EhZnUOG+FIAuDDBHjvabT8ojbFh8oP0kWztkQiPObjWbU
	wN07Ct7iKrNqHwrPvVKfHQN+S9sGHTNMBiT11Rxi2vSurhwtH38qZz9RA87DhZGqVl
	MVMNwjX5gsuon7N7oiVK7ILkwYn4+Xf090FA2cVp78iyVEpOpEf2Fr55l+fMHsA/ss
	UINoWsiaM+xNJETvEHFlYAKzVMeymIyILG+4S2l7fjlA11P77Uyrmk+3RD4z0fftIF
	FsUsf3sQWEj/PVXesqUHnertjJTy0XfoBWs+XVsgafnFlDNsrJL9qpQn7fnPIHIhrU
	51BdaZYfF4ptPDFTaMtBNBqM=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Nov 2018 20:55:36 +0200
Message-Id: <20181125185536.11694-1-bunk@stusta.de>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH] Add czmq (C bindings for ZeroMQ)
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
X-List-Received-Date: Sun, 25 Nov 2018 18:55:34 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-connectivity/zeromq/czmq_4.1.1.bb  | 30 +++++++++++++++++++++
 .../0001-Problem-out-of-date-with-zproject.patch   | 31 ++++++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/zeromq/czmq_4.1.1.bb
 create mode 100644 meta-oe/recipes-connectivity/zeromq/files/0001-Problem-out-of-date-with-zproject.patch

diff --git a/meta-oe/recipes-connectivity/zeromq/czmq_4.1.1.bb b/meta-oe/recipes-connectivity/zeromq/czmq_4.1.1.bb
new file mode 100644
index 000000000..f2db0041c
--- /dev/null
+++ b/meta-oe/recipes-connectivity/zeromq/czmq_4.1.1.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "C bindings for ZeroMQ"
+HOMEPAGE = "http://www.zeromq.org"
+LICENSE = "MPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9741c346eef56131163e13b9db1241b3"
+DEPENDS = "zeromq"
+
+SRC_URI = "https://github.com/zeromq/czmq/releases/download/v${PV}/czmq-${PV}.tar.gz \
+    file://0001-Problem-out-of-date-with-zproject.patch \
+"
+
+SRC_URI[md5sum] = "6d3a6fdd25c2bb29897c53670dce97bf"
+SRC_URI[sha256sum] = "f00ff419881dc2a05d0686c8467cd89b4882677fc56f31c0e2cc81c134cbb0c0"
+
+inherit cmake
+
+PACKAGES = "lib${BPN} lib${BPN}-dev lib${BPN}-staticdev ${PN} ${PN}-dbg"
+
+FILES_${PN} = "${bindir}/*"
+FILES_lib${BPN} = "${libdir}/*.so.*"
+FILES_lib${BPN}-dev = "${libdir}/*.so ${libdir}/pkgconfig ${includedir}"
+FILES_lib${BPN}-staticdev = "${libdir}/lib*.a"
+
+RDEPENDS_lib${BPN}-dev = "zeromq-dev"
+
+PACKAGECONFIG ??= "lz4 uuid"
+PACKAGECONFIG[lz4] = ",-DCMAKE_DISABLE_FIND_PACKAGE_lz4=TRUE,lz4"
+PACKAGECONFIG[uuid] = ",-DCMAKE_DISABLE_FIND_PACKAGE_uuid=TRUE,util-linux"
+
+BBCLASSEXTEND = "nativesdk"
+
diff --git a/meta-oe/recipes-connectivity/zeromq/files/0001-Problem-out-of-date-with-zproject.patch b/meta-oe/recipes-connectivity/zeromq/files/0001-Problem-out-of-date-with-zproject.patch
new file mode 100644
index 000000000..5f5702c8c
--- /dev/null
+++ b/meta-oe/recipes-connectivity/zeromq/files/0001-Problem-out-of-date-with-zproject.patch
@@ -0,0 +1,31 @@
+From d155ffd33630f80b23c31b3a6e01da221dd9bd13 Mon Sep 17 00:00:00 2001
+From: Luca Boccassi <luca.boccassi@gmail.com>
+Date: Fri, 30 Mar 2018 16:36:22 +0100
+Subject: [PATCH] Problem: out of date with zproject
+
+Upstream-Status: backport
+Signed-off-by: Adrian Bunk <bunk@stusta.de>
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index a3b81722..4f203461 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -38,7 +38,7 @@ if (NOT CMAKE_BUILD_TYPE)
+             OUTPUT_STRIP_TRAILING_WHITESPACE
+         )
+         message(STATUS "git workspace root [${git_result}]: ${git_root}")
+-        if ( "${git_result}" == "0" )
++        if ( "${git_result}" STREQUAL "0" )
+             set (CMAKE_BUILD_TYPE Debug)
+         else ()
+             set (CMAKE_BUILD_TYPE Release)
+@@ -608,7 +608,7 @@ add_custom_command(
+     TARGET  distclean
+ )
+ 
+-include(ClangFormat)
++include(ClangFormat OPTIONAL)
+ 
+ ########################################################################
+ # summary
+
-- 
2.11.0


