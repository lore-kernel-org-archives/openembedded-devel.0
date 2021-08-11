Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.3916.1628660078148908089
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Aug 2021 22:34:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 17B5Yaid029439
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Aug 2021 22:34:37 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 10 Aug 2021 22:34:36 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 10 Aug 2021 22:34:35 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] jemalloc: fix the race during do_install
Date: Wed, 11 Aug 2021 13:31:48 +0800
Message-ID: <20210811053148.9337-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
 | TOPDIR/tmp-glibc/hosttools/install: cannot stat 'doc/jemalloc.3': No such file or directory
 | make: *** [Makefile:513: install_doc_man] Error 1

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...ke-sure-doc-generated-before-install.patch | 42 +++++++++++++++++++
 .../jemalloc/jemalloc_5.2.1.bb                |  4 +-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/jemalloc/files/0001-Makefile.in-make-sure-doc-generated-before-install.patch

diff --git a/meta-oe/recipes-devtools/jemalloc/files/0001-Makefile.in-make-sure-doc-generated-before-install.patch b/meta-oe/recipes-devtools/jemalloc/files/0001-Makefile.in-make-sure-doc-generated-before-install.patch
new file mode 100644
index 000000000..0a1fe6d76
--- /dev/null
+++ b/meta-oe/recipes-devtools/jemalloc/files/0001-Makefile.in-make-sure-doc-generated-before-install.patch
@@ -0,0 +1,42 @@
+From 1efb45330f5dbe475a092cda6982e6d7e135485a Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Tue, 10 Aug 2021 13:02:18 +0000
+Subject: [PATCH] Makefile.in: make sure doc generated before install
+
+There is a race between the doc generation and the doc installation,
+so make the install depend on the build for doc to fix the error occurs
+sometimes as below:
+ | TOPDIR/tmp-glibc/hosttools/install: cannot stat 'doc/jemalloc.3': No such file or directory
+ | make: *** [Makefile:513: install_doc_man] Error 1
+
+Upstream-Status: Submitted [https://github.com/jemalloc/jemalloc/pull/2108]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ Makefile.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 7128b007..ab94f0c8 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -501,14 +501,14 @@ install_lib: install_lib_static
+ endif
+ install_lib: install_lib_pc
+ 
+-install_doc_html:
++install_doc_html: build_doc_html
+ 	$(INSTALL) -d $(DATADIR)/doc/jemalloc$(install_suffix)
+ 	@for d in $(DOCS_HTML); do \
+ 	echo "$(INSTALL) -m 644 $$d $(DATADIR)/doc/jemalloc$(install_suffix)"; \
+ 	$(INSTALL) -m 644 $$d $(DATADIR)/doc/jemalloc$(install_suffix); \
+ done
+ 
+-install_doc_man:
++install_doc_man: build_doc_man
+ 	$(INSTALL) -d $(MANDIR)/man3
+ 	@for d in $(DOCS_MAN3); do \
+ 	echo "$(INSTALL) -m 644 $$d $(MANDIR)/man3"; \
+-- 
+2.29.2
+
diff --git a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb
index 39637663f..b191f729a 100644
--- a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb
+++ b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb
@@ -13,7 +13,9 @@ SECTION = "libs"
 
 LIC_FILES_CHKSUM = "file://README;md5=6900e4a158982e4c4715bf16aa54fa10"
 
-SRC_URI = "git://github.com/jemalloc/jemalloc.git"
+SRC_URI = "git://github.com/jemalloc/jemalloc.git \
+           file://0001-Makefile.in-make-sure-doc-generated-before-install.patch \
+"
 
 SRCREV = "ea6b3e973b477b8061e0076bb257dbd7f3faa756"
 
-- 
2.17.1

