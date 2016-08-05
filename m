Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id F2F437707B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Aug 2016 09:40:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="9601679"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Aug 2016 17:40:14 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 730AE42CA543
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Aug 2016 17:40:13 +0800 (CST)
Received: from localhost.localdomain (10.167.226.93) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Fri, 5 Aug 2016 17:40:13 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 5 Aug 2016 10:40:13 -0700
Message-ID: <1470418813-5380-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.93]
X-yoursite-MailScanner-ID: 730AE42CA543.ABAD8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH v2] daemontools: fix QA Issues for daemontools and fix a warning for daemontools-native
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
X-List-Received-Date: Fri, 05 Aug 2016 09:40:14 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../0001-daemontools-Fix-QA-Issue.patch            | 26 ++++++++++++++++++++++
 .../0001-daemontools-native-Fix-a-warning.patch    | 26 ++++++++++++++++++++++
 .../daemontools/daemontools_0.76.bb                |  5 ++++-
 3 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/daemontools/daemontools/0001-daemontools-Fix-QA-Issue.patch
 create mode 100644 meta-oe/recipes-support/daemontools/daemontools/0001-daemontools-native-Fix-a-warning.patch

diff --git a/meta-oe/recipes-support/daemontools/daemontools/0001-daemontools-Fix-QA-Issue.patch b/meta-oe/recipes-support/daemontools/daemontools/0001-daemontools-Fix-QA-Issue.patch
new file mode 100644
index 0000000..c48a765
--- /dev/null
+++ b/meta-oe/recipes-support/daemontools/daemontools/0001-daemontools-Fix-QA-Issue.patch
@@ -0,0 +1,26 @@
+From a86c4209da695909424db0c9108592194a3094b7 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Sat, 6 Aug 2016 00:47:37 +0900
+Subject: [PATCH] daemontools: Fix QA Issue
+
+To fix the QA Issues as following:
+
+ERROR: daemontools-0.76-r0 do_package_qa: QA Issue: No GNU_HASH in the elf binary: '/build-poky/tmp/work/i586-poky-linux/daemontools/0.76-r0/packages-split/daemontools/usr/bin/tai64nlocal'
+
+Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+---
+ src/conf-ld | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/conf-ld b/src/conf-ld
+index 2a44210..c7e7755 100644
+--- a/src/conf-ld
++++ b/src/conf-ld
+@@ -1,3 +1,3 @@
+-${CC}
++${CC} ${LDFLAGS}
+ 
+ This will be used to link .o files into an executable.
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/daemontools/daemontools/0001-daemontools-native-Fix-a-warning.patch b/meta-oe/recipes-support/daemontools/daemontools/0001-daemontools-native-Fix-a-warning.patch
new file mode 100644
index 0000000..8a1983c
--- /dev/null
+++ b/meta-oe/recipes-support/daemontools/daemontools/0001-daemontools-native-Fix-a-warning.patch
@@ -0,0 +1,26 @@
+From a43a3327ccd4b06a3bcf0c87d518a97c6b39ac02 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Sat, 6 Aug 2016 02:09:53 +0900
+Subject: [PATCH] daemontools: Fix a warning
+
+To fix the warning as following:
+
+WARNING: daemontools-native-0.76-r0 do_populate_sysroot: File '/build-poky/tmp/sysroots/x86_64-linux/usr/bin/chkshsgr' from daemontools-native was already stripped, this will prevent future debugging!
+
+Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+---
+ src/conf-ld | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/conf-ld b/src/conf-ld
+index 59a0de7..1d0518a 100644
+--- a/src/conf-ld
++++ b/src/conf-ld
+@@ -1,3 +1,3 @@
+-gcc -s
++gcc
+ 
+ This will be used to link .o files into an executable.
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/daemontools/daemontools_0.76.bb b/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
index 161f92f..def58db 100644
--- a/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
+++ b/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
@@ -18,7 +18,10 @@ SRC_URI = "http://cr.yp.to/daemontools/${BPN}-${PV}.tar.gz \
            file://0001-error.h-include-errno.h-instead-of-extern-int.diff \
            file://0002-supervise.c-.-supervise-may-be-a-symlink-if-it-s-da.diff "
 
-SRC_URI_append_class-target = "file://cross-compile.patch"
+SRC_URI_append_class-target = "file://cross-compile.patch \
+                               file://0001-daemontools-Fix-QA-Issue.patch "
+
+SRC_URI_append_class-native = "file://0001-daemontools-native-Fix-a-warning.patch "
 
 SRC_URI[md5sum] = "1871af2453d6e464034968a0fbcb2bfc"
 SRC_URI[sha256sum] = "a55535012b2be7a52dcd9eccabb9a198b13be50d0384143bd3b32b8710df4c1f"
-- 
2.7.4




