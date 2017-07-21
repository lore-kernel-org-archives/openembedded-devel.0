Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 29842783AE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 07:35:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6L7Z8jK000994
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 21 Jul 2017 00:35:08 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 21 Jul 2017 00:35:07 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Jul 2017 03:34:47 -0400
Message-ID: <5d10992c138933e79ec7d1bec6d7fd03caec20bd.1500621886.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1500621886.git.hongxu.jia@windriver.com>
References: <cover.1500621886.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2 10/10] xmlrpc-c: add recipe 1.31.0
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
X-List-Received-Date: Fri, 21 Jul 2017 07:35:08 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...ix-compile-failure-against-musl-C-library.patch | 52 ++++++++++++++++++++++
 .../recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb   | 23 ++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-fix-compile-failure-against-musl-C-library.patch
 create mode 100644 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb

diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-fix-compile-failure-against-musl-C-library.patch b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-fix-compile-failure-against-musl-C-library.patch
new file mode 100644
index 0000000..234d696
--- /dev/null
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-fix-compile-failure-against-musl-C-library.patch
@@ -0,0 +1,52 @@
+From 950b27f8320b841490cafcb3e6e3b818c7174c0d Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 20 Jul 2017 22:32:50 -0400
+Subject: [PATCH] fix compile failure against musl C library
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ test/cpp/server_abyss.cpp               |  2 +-
+ tools/xmlrpc_pstream/xmlrpc_pstream.cpp | 10 +++++++---
+ 2 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/test/cpp/server_abyss.cpp b/test/cpp/server_abyss.cpp
+index 2458a8f..82f91da 100644
+--- a/test/cpp/server_abyss.cpp
++++ b/test/cpp/server_abyss.cpp
+@@ -18,7 +18,7 @@
+ #ifdef WIN32
+   #include <winsock2.h>
+ #else
+-  #include <sys/unistd.h>
++  #include <unistd.h>
+   #include <sys/socket.h>
+   #include <arpa/inet.h>
+   #include <netinet/in.h>
+diff --git a/tools/xmlrpc_pstream/xmlrpc_pstream.cpp b/tools/xmlrpc_pstream/xmlrpc_pstream.cpp
+index d39e105..1fd8900 100644
+--- a/tools/xmlrpc_pstream/xmlrpc_pstream.cpp
++++ b/tools/xmlrpc_pstream/xmlrpc_pstream.cpp
+@@ -15,11 +15,15 @@
+ #include "xmlrpc-c/girerr.hpp"
+ using girerr::throwf;
+ 
+-#include <features.h>  // for __BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ 
+-__BEGIN_DECLS
+ #include "dumpvalue.h"  /* An internal Xmlrpc-c header file ! */
+-__END_DECLS
++
++#ifdef __cplusplus
++}
++#endif
+ 
+ 
+ #include <xmlrpc-c/base.hpp>
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb
new file mode 100644
index 0000000..9050d66
--- /dev/null
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "XML-RPC for C/C++ is programming libraries and related tools to help you \
+write an XML-RPC server or client in C or C++."
+
+HOMEPAGE = "http://xmlrpc-c.sourceforge.net/"
+LICENSE = "BSD & MIT"
+LIC_FILES_CHKSUM = "file://doc/COPYING;md5=aefbf81ba0750f02176b6f86752ea951"
+
+SRC_URI = "git://github.com/ensc/xmlrpc-c.git;branch=master \
+           file://0001-fix-compile-failure-against-musl-C-library.patch \
+"
+SRCREV = "81443a9dc234cc275449dbc17867ad77ae189124"
+S = "${WORKDIR}/git"
+
+DEPENDS = "curl libxml2"
+RDEPENDS_${PN} = "curl"
+
+inherit cmake
+
+EXTRA_OECMAKE = "-D_lib:STRING=${baselib}"
+
+BBCLASSEXTEND = "native"
+
+TARGET_CFLAGS += "-Wno-narrowing"
-- 
2.8.1


