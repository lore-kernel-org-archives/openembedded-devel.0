Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 584816D145
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 09:39:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wAR9ddvW024156
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 01:39:39 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 27 Nov 2018 01:39:37 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 27 Nov 2018 17:39:08 +0800
Message-ID: <1543311554-293342-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1543311554-293342-1-git-send-email-changqing.li@windriver.com>
References: <1543311554-293342-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/7] sg3-utils: upgrade to 1.44
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
X-List-Received-Date: Tue, 27 Nov 2018 09:39:38 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../sg3-utils/sg3-utils/glibc-2.28.patch           | 24 ----------------------
 .../{sg3-utils_1.42.bb => sg3-utils_1.44.bb}       |  5 ++---
 2 files changed, 2 insertions(+), 27 deletions(-)
 delete mode 100644 meta-oe/recipes-support/sg3-utils/sg3-utils/glibc-2.28.patch
 rename meta-oe/recipes-support/sg3-utils/{sg3-utils_1.42.bb => sg3-utils_1.44.bb} (78%)

diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils/glibc-2.28.patch b/meta-oe/recipes-support/sg3-utils/sg3-utils/glibc-2.28.patch
deleted file mode 100644
index fbad413..0000000
--- a/meta-oe/recipes-support/sg3-utils/sg3-utils/glibc-2.28.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Fixes:
-http://errors.yoctoproject.org/Errors/Details/185896/
-
-TOPDIR/tmp-glibc/work/core2-64-oe-linux/sg3-utils/1.42-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/8.2.0/ld: sg_map26.o: in function `nd_match_scandir_select':
-/usr/src/debug/sg3-utils/1.42-r0/sg3_utils-1.42/src/sg_map26.c:359: undefined reference to `major'
-TOPDIR/tmp-glibc/work/core2-64-oe-linux/sg3-utils/1.42-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/8.2.0/ld: /usr/src/debug/sg3-utils/1.42-r0/sg3_utils-1.42/src/sg_map26.c:361: undefined reference to `minor'
-TOPDIR/tmp-glibc/work/core2-64-oe-linux/sg3-utils/1.42-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/8.2.0/ld: sg_map26.o: in function `nt_typ_from_filename':
-/usr/src/debug/sg3-utils/1.42-r0/sg3_utils-1.42/src/sg_map26.c:218: undefined reference to `major'
-TOPDIR/tmp-glibc/work/core2-64-oe-linux/sg3-utils/1.42-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/8.2.0/ld: /usr/src/debug/sg3-utils/1.42-r0/sg3_utils-1.42/src/sg_map26.c:219: undefined reference to `minor'
-collect2: error: ld returned 1 exit status
-Makefile:806: recipe for target 'sg_map26' failed
-
-Upstream-Status: Pending
-
---- sg3_utils-1.42.orig/src/sg_map26.c	2018-08-09 11:53:26.907493996 +0000
-+++ sg3_utils-1.42/src/sg_map26.c	2018-08-09 11:51:56.713490763 +0000
-@@ -33,6 +33,7 @@
- #include <sys/ioctl.h>
- #include <sys/types.h>
- #include <sys/stat.h>
-+#include <sys/sysmacros.h>
- #include <linux/major.h>
- 
- #ifdef HAVE_CONFIG_H
diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bb b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.44.bb
similarity index 78%
rename from meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bb
rename to meta-oe/recipes-support/sg3-utils/sg3-utils_1.44.bb
index c37c5e9..4909035 100644
--- a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bb
+++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.44.bb
@@ -9,14 +9,13 @@ LICENSE = "GPLv2+ & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f90da7fc52172599dbf082d7620f18ca"
 
 SRC_URI = "http://sg.danny.cz/sg/p/sg3_utils-${PV}.tgz \
-    file://glibc-2.28.patch \
 "
 MIRRORS += "http://sg.danny.cz/sg/p https://fossies.org/linux/misc"
 
 UPSTREAM_CHECK_REGEX = "sg3_utils-(?P<pver>\d+(\.\d+)+)\.tgz"
 
-SRC_URI[md5sum] = "28080de5bf2222f8b55a29093bec8aea"
-SRC_URI[sha256sum] = "1dcb7a0309bd0ba3d4a83acb526973b80106ee26cd9f7398186cd3f0633c9ef3"
+SRC_URI[md5sum] = "c11d2b3ca4cc2fd01796473e5330afed"
+SRC_URI[sha256sum] = "8dae684d22e71b11353a48b16c95597af90f0cbe9bbd57f98d7f5544da5cae7b"
 
 inherit autotools-brokensep
 
-- 
2.7.4


