Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5432C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 08:00:07 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.9138.1635235207096115017
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 01:00:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 19Q7xtkg022277
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Tue, 26 Oct 2021 00:59:56 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 19Q7xkFI021130
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 26 Oct 2021 00:59:55 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 26 Oct 2021 00:59:49 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Tue, 26 Oct 2021 00:59:49 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 26 Oct 2021 00:59:48 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
Subject: [meta-oe][hardknott][PATCH 3/7] jemalloc: fix the race during
 do_install
Date: Tue, 26 Oct 2021 15:58:33 +0800
Message-ID: <20211026075837.39670-3-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211026075837.39670-1-mingli.yu@windriver.com>
References: <20211026075837.39670-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Oct 2021 08:00:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93590

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
 | TOPDIR/tmp-glibc/hosttools/install: cannot stat 'doc/jemalloc.3': No such file or directory
 | make: *** [Makefile:513: install_doc_man] Error 1

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
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


