Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6D83C78C6B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Aug 2018 05:05:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7255exA008704
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 1 Aug 2018 22:05:40 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 1 Aug 2018 22:05:39 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Aug 2018 13:05:38 +0800
Message-ID: <1533186338-100132-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] mozjs: fix coredump caused by wrong use of getenv
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
X-List-Received-Date: Thu, 02 Aug 2018 05:05:40 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

getenv need include header stdlib.h, or an assumed int
return for getenv to char * pointer will tripping up
the code

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0001-mozjs-fix-coredump-caused-by-getenv.patch | 27 ++++++++++++++++++++++
 meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb     |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0001-mozjs-fix-coredump-caused-by-getenv.patch

diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0001-mozjs-fix-coredump-caused-by-getenv.patch b/meta-oe/recipes-extended/mozjs/mozjs/0001-mozjs-fix-coredump-caused-by-getenv.patch
new file mode 100644
index 0000000..477f73a
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0001-mozjs-fix-coredump-caused-by-getenv.patch
@@ -0,0 +1,27 @@
+From 20b639b7364f9953fdacb058f9ba800bcbf029b4 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 2 Aug 2018 09:40:48 +0800
+Subject: [PATCH] mozjs: fix coredump caused by getenv
+
+Upstream-Status: Submitted [https://bugzilla.mozilla.org/show_bug.cgi?id=1480315]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ mozglue/misc/TimeStamp.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/mozglue/misc/TimeStamp.cpp b/mozglue/misc/TimeStamp.cpp
+index 932b75c..7a4d71b 100644
+--- a/mozglue/misc/TimeStamp.cpp
++++ b/mozglue/misc/TimeStamp.cpp
+@@ -11,6 +11,7 @@
+ #include "mozilla/TimeStamp.h"
+ #include <stdio.h>
+ #include <string.h>
++#include <stdlib.h>
+ 
+ namespace mozilla {
+ 
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb b/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
index da80b63..c0ea746 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/m/mozjs52/mozjs52_52.8.1.o
            file://0004-do-not-use-autoconf-2.13-to-refresh-old.configure.patch \
            file://0005-fix-do_compile-failed-on-mips.patch \
            file://disable-mozglue-in-stand-alone-builds.patch \
+           file://0001-mozjs-fix-coredump-caused-by-getenv.patch \
            "
 SRC_URI_append_libc-musl = " \
            file://0006-support-musl.patch \
-- 
2.7.4


