Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0C1C37C22A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Feb 2019 14:59:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 43tW8G4phpz1M;
	Mon,  4 Feb 2019 15:59:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1549292382;
	bh=wWKDwHxUOziqZgEw+7CfMYJLryDE4cQ5Wd3/tow/LDg=;
	h=From:To:Cc:Subject:Date:From;
	b=pAtItVW7XY6NxhKfIC4c/SsobqNbiMYUTwuDbUSwH+Fi8a/JUil5PzR9iqJQMDq9q
	RHm5GtqJSwz3nFXQinGvE6vpC8IA7lQ3nKK33JbWk2ba1Zomv65yaauxwPkxIni30R
	EuJ6DhhztXVWPHbDgeDa+x/hHqBEq2NKpTrCesgdDt1BVqjqCBnchknwEemNQfmLH5
	LG6vX6oftvuTqREvRAmxMZR7w5GacvbQL9MCeyxVZxzkMvFojMYe1L7qHUEpjshgoG
	7gVIT5QGFOPoNYbBM6Fe0VIbH1yY3TYwGRgAKlSuU/jkb7+0e0zDI5wSnA6YoLiUrU
	F8njN+bRRem3kjsL2ESQMM6O75/0YvEa4+Dxtg/pD1B6nOvVWfIqQlYCdloTj3KChn
	r0nX6aLAOoFjDH7gUONw2VPpqDQbud34FdietuUMQPqdHzH16EtgE0IeFIkWO+0yAs
	apHKHMBpksFvwCC0fFsKbe2Nv8/RrTg+xp4/gXRXzEreSoq68jBBWCE2QuSL7XKSTk
	uppmGEW+sAjXHrSEdYtMezRVpRmu4d4jGHKUcU6YbnKEMy4uJGsPD9CZZ19WF2eruz
	ymmjiylS57NN2Tck9DP2q69NnlxVz7rBCAugcb7aPm5E/rJ0gc+ntkFVy+tX7z56WG
	a6jcNRNQ3iI8yJHvbeuoMVe8=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Feb 2019 16:59:40 +0200
Message-Id: <20190204145940.17783-1-bunk@stusta.de>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][thud][PATCH] Add czmq (C bindings for ZeroMQ)
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
X-List-Received-Date: Mon, 04 Feb 2019 14:59:43 -0000

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


