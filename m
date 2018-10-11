Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 57B5B79A4B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2018 08:18:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9B8Fd4e022244
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2018 01:18:21 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 11 Oct 2018 01:17:26 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 11 Oct 2018 16:17:24 +0800
Message-ID: <1539245845-32509-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] e2fsprogs: fix test f_detect_junk print error msg
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
X-List-Received-Date: Thu, 11 Oct 2018 08:18:31 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

test script have problem when the file want to grep
don't exist, change the check command to fix it

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0001-e2fsprogs-fix-ptest-error-msg.patch       | 33 ++++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsprogs-fix-ptest-error-msg.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsprogs-fix-ptest-error-msg.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsprogs-fix-ptest-error-msg.patch
new file mode 100644
index 0000000..46d32ef
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsprogs-fix-ptest-error-msg.patch
@@ -0,0 +1,33 @@
+From e193316891510ec3852699d57a860c65615196ef Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 11 Oct 2018 15:13:24 +0800
+Subject: [PATCH] e2fsprogs: fix ptest error msg
+
+Upstream-Status: Inappropriate [oe-specific]
+
+original command want to get count of match lines, but if
+config.h is not existed, like our case, the result of
+$(grep -c 'define HAVE_MAGIC_H' ../lib/config.h) will not be
+number, and cannot compare with 0, so fix it by check
+command executed result.
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tests/f_detect_junk/script | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/f_detect_junk/script b/tests/f_detect_junk/script
+index 2577842..d56ec1a 100644
+--- a/tests/f_detect_junk/script
++++ b/tests/f_detect_junk/script
+@@ -1,6 +1,6 @@
+ #!/bin/bash
+ 
+-if [ "$(grep -c 'define HAVE_MAGIC_H' ../lib/config.h)" -eq 0 ]; then
++if ! grep -q -c 'define HAVE_MAGIC_H' ./config.h 2>/dev/null
+ 	echo "$test_name: skipped (no magic)"
+ 	exit 0
+ fi
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb
index 823d18b..c935f98 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb
@@ -6,6 +6,7 @@ SRC_URI += "file://remove.ldconfig.call.patch \
             file://Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch \
             file://mkdir_p.patch \
             file://0001-misc-create_inode.c-set-dir-s-mode-correctly.patch \
+            file://0001-e2fsprogs-fix-ptest-error-msg.patch \
             "
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
-- 
2.7.4


