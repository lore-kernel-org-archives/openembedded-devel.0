Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5FA0260119
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2016 05:48:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8J5mgqr013619
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2016 22:48:42 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Sun, 18 Sep 2016 22:48:41 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 19 Sep 2016 13:45:26 +0800
Message-ID: <1474263926-14708-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-initramfs][PATCH] grubby: add bash to RDEPENDS_grubby-ptest
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
X-List-Received-Date: Mon, 19 Sep 2016 05:48:43 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Add bash to RDEPENDS_grubby-ptest
* As grubby upstream still continually updates ptest
  script test.sh with bash specific syntax such as commit
  98cab84501f86bd98f12653c11f4ecc632139399 and etc, so no
  need to remove bashisms

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../grubby/grubby-remove-bashisms-in-test.sh.patch | 29 ----------------------
 .../recipes-devtools/grubby/grubby_8.40.bb         |  3 +--
 2 files changed, 1 insertion(+), 31 deletions(-)
 delete mode 100644 meta-initramfs/recipes-devtools/grubby/grubby/grubby-remove-bashisms-in-test.sh.patch

diff --git a/meta-initramfs/recipes-devtools/grubby/grubby/grubby-remove-bashisms-in-test.sh.patch b/meta-initramfs/recipes-devtools/grubby/grubby/grubby-remove-bashisms-in-test.sh.patch
deleted file mode 100644
index 6734e7f..0000000
--- a/meta-initramfs/recipes-devtools/grubby/grubby/grubby-remove-bashisms-in-test.sh.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From c3a004b8d6dff1a767573dd7baf5d45efddb9f2b Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Fri, 15 Jul 2016 11:23:17 +0800
-Subject: [PATCH] grubby: remove bashisms in test.sh
-
-* Update #!/bin/bash to #!/bin/sh in test.sh to
-  remove below warning:
-  QA Issue: /usr/lib/grubby/ptest/test.sh contained
-  in package grubby-ptest requires /bin/bash, but no
-  providers found in RDEPENDS_grubby-ptest? [file-rdeps]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- test.sh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/test.sh b/test.sh
-index f738388..f3537f3 100755
---- a/test.sh
-+++ b/test.sh
-@@ -1,4 +1,4 @@
--#!/bin/bash
-+#!/bin/sh
- #
- # test.sh -- grubby regression tests
- #
--- 
-2.8.1
-
diff --git a/meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb b/meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb
index 1a61e9d..0e93790 100644
--- a/meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb
+++ b/meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb
@@ -13,7 +13,6 @@ DEPENDS = "popt util-linux"
 SRC_URI = "https://github.com/rhinstaller/${BPN}/archive/${PV}-1.tar.gz;downloadfilename=${BPN}-${PV}-1.tar.gz \
            file://grubby-rename-grub2-editenv-to-grub-editenv.patch \
            file://run-ptest \
-           file://grubby-remove-bashisms-in-test.sh.patch \
 "
 
 SRC_URI[md5sum] = "1005907b275d6d93368d045274537d86"
@@ -33,6 +32,6 @@ do_install_ptest() {
     sed -i 's|./grubby|grubby|' ${D}${PTEST_PATH}/test.sh
 }
 
-RDEPENDS_${PN}-ptest = "util-linux-getopt"
+RDEPENDS_${PN}-ptest = "util-linux-getopt bash"
 
 COMPATIBLE_HOST = '(x86_64.*|i.86.*)-(linux|freebsd.*)'
-- 
2.8.1


