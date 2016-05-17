Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 648E176536
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 May 2016 03:56:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="6959452"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 May 2016 11:56:38 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id A692A489F98A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 May 2016 11:56:35 +0800 (CST)
Received: from localhost.localdomain (10.167.226.93) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Fri, 27 May 2016 11:56:35 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 May 2016 11:32:19 -0700
Message-ID: <1463509939-25222-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.93]
X-yoursite-MailScanner-ID: A692A489F98A.AD8D0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] daemontools: Fix a warning
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
X-List-Received-Date: Fri, 27 May 2016 03:56:46 -0000
Content-Type: text/plain

To fix the warning as following:

WARNING: daemontools-native-0.76-r0 do_populate_sysroot: File 'usr/bin/chkshsgr' from daemontools-native was already stripped, this will prevent future debugging!

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../daemontools/0001-conf-ld-warning-fix.patch     | 26 ++++++++++++++++++++++
 .../daemontools/daemontools_0.76.bb                |  3 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/daemontools/daemontools/0001-conf-ld-warning-fix.patch

diff --git a/meta-oe/recipes-support/daemontools/daemontools/0001-conf-ld-warning-fix.patch b/meta-oe/recipes-support/daemontools/daemontools/0001-conf-ld-warning-fix.patch
new file mode 100644
index 0000000..f7bce25
--- /dev/null
+++ b/meta-oe/recipes-support/daemontools/daemontools/0001-conf-ld-warning-fix.patch
@@ -0,0 +1,26 @@
+From aa246fb9055bdcb293e9daca571066b72adc1cb2 Mon Sep 17 00:00:00 2001
+From: Li Xin <lixin.fnst@cn.fujitsu.com>
+Date: Thu, 14 Jan 2016 17:54:27 +0900
+Subject: [PATCH] conf-ld: warning fix
+
+WARNING: File 'usr/bin/chkshsgr' from daemontools-native was already stripped, this will prevent future debugging!
+
+Upstream-Status: pending
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
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
+1.8.4.2
+
diff --git a/meta-oe/recipes-support/daemontools/daemontools_0.76.bb b/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
index 161f92f..c3ce5d3 100644
--- a/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
+++ b/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
@@ -16,7 +16,8 @@ LICENSE = "PD"
 
 SRC_URI = "http://cr.yp.to/daemontools/${BPN}-${PV}.tar.gz \
            file://0001-error.h-include-errno.h-instead-of-extern-int.diff \
-           file://0002-supervise.c-.-supervise-may-be-a-symlink-if-it-s-da.diff "
+           file://0002-supervise.c-.-supervise-may-be-a-symlink-if-it-s-da.diff \
+           file://0001-conf-ld-warning-fix.patch "
 
 SRC_URI_append_class-target = "file://cross-compile.patch"
 
-- 
1.8.4.2




