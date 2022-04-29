Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E34CC433F5
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 08:26:13 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.29224.1652084771435617582
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 01:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rsOg3eFv;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652084769; i=@fujitsu.com;
	bh=qxPcLCNvNKIpwzhxrJ707wD6wGNwRg4ak2HBeDrc5HY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=rsOg3eFvnnmzzD20238TXG9lz0b1keHratHVCzaK8mBrkl0GP+NU+38Tujcnh1N0H
	 qGf6CnE//v7vJhkh6jzi5TPb5yMQUcKeDGXlY3PoFrau6mdCOnXPjb5V8eFO/Icz99
	 0X+nW0E4/coFAnIXGE+lLe/Le0vyWhf67X6CMRTznwu/A93kVgSK/+mzEXiaBQ2/Ns
	 SZFy+JVI3QaUHFDxnKSI++2HQI857W8HfZIKW1C3Xw9K0FnLRrf0Z6VBUPJmfKkvhg
	 CJPua544jvgCuh+juFcgbzKnQQKeF3jgckRcGTskMTjBvM71YD56Hw8aEfJbuwkwcn
	 iLm8RYnp7qiLA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORqKt4oSL
  JYNM+QYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaNt4VqmgivSFd+WHmNtYHwk0cXIxSEk8IRR
  YsmMW2wQzgUmiWlXj7NDOLsZJdq/X2btYuTkYBNQk5h+6waYLSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBB4kvnVSYQm0VAVWLW9ZmMIDavgJPE5pWHweISAgoSUx6+Z4aIC0qcnPmEBWKOhMTBFy
  +YIWoUJWZfbmaBsCskZs1qg+pVk7h6bhPzBEb+WUjaZyFpX8DItIrROqkoMz2jJDcxM0fX0MB
  A19DQVNfYSNfQwlIvsUo3US+1VLc8tbhE10gvsbxYL7W4WK+4Mjc5J0UvL7VkEyMwMFOKFfbu
  YLy88qfeIUZJDiYlUd7KpookIb6k/JTKjMTijPii0pzU4kOMMhwcShK8IeeAcoJFqempFWmZO
  cAogUlLcPAoifDePQGU5i0uSMwtzkyHSJ1itOe4u3DvXmaOnVsuA8mrV64AyRsgUoglLz8vVU
  qctxhkqgBIW0ZpHtxQWFRfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMq3QeaApPZl4J3O5
  XQGcxAZ31MaAU5KySRISUVANTY/cq9wXHvnnGS7jnPqowPBPzZ0UTf+PvP+r6+xymt0Ud8Tm9
  8tHuZ9Ue1yqL2G5J9fp2yflH1/oYXD+f4nf9uomkaKLUwwm/+q6adi7Mys/ddjdp/b6J/xu/f
  svrPrRN+ky8RLziznP8sumNSYkCnm4Jp0P3a5Uc61jEIKXQx7rNV6eDb+OxUP+9RtMKK6vmbA
  5607npgmW6+qRzi07OqtRtLKqOVnpxfump4NAuMbYFIZ4NwfecP4lKPO6el6HXt8p/Ro5JVab
  aJAfjuNAtM7nuJW7flZ76m+/7VF3Zg4YznM6I8Yh/+nDtTtfuzfpcFkky87Qk7s0RFq4VqFfU
  OW6kwbDqmtPm8/o1U5VYijMSDbWYi4oTAVZ2g7FlAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-571.messagelabs.com!1652084769!351763!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23198 invoked from network); 9 May 2022 08:26:09 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-12.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 May 2022 08:26:09 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id BC53D100193
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:26:08 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id ACFC510018B
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:26:08 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 9 May 2022 09:25:49 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] jemalloc: upgrade 5.2.1 -> 5.3.0
Date: Fri, 29 Apr 2022 16:08:05 +0800
Message-ID: <1651219689-27457-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 08:26:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96997

0001-Makefile.in-make-sure-doc-generated-before-install.patch
removed since it's included in 5.3.0

Changelog:
https://github.com/jemalloc/jemalloc/releases/tag/5.3.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ke-sure-doc-generated-before-install.patch | 42 -------------------
 .../{jemalloc_5.2.1.bb => jemalloc_5.3.0.bb}  |  5 +--
 2 files changed, 2 insertions(+), 45 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/jemalloc/files/0001-Makefile.in-make-sure-doc-generated-before-install.patch
 rename meta-oe/recipes-devtools/jemalloc/{jemalloc_5.2.1.bb => jemalloc_5.3.0.bb} (91%)

diff --git a/meta-oe/recipes-devtools/jemalloc/files/0001-Makefile.in-make-sure-doc-generated-before-install.patch b/meta-oe/recipes-devtools/jemalloc/files/0001-Makefile.in-make-sure-doc-generated-before-install.patch
deleted file mode 100644
index 0a1fe6d76..000000000
--- a/meta-oe/recipes-devtools/jemalloc/files/0001-Makefile.in-make-sure-doc-generated-before-install.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 1efb45330f5dbe475a092cda6982e6d7e135485a Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Tue, 10 Aug 2021 13:02:18 +0000
-Subject: [PATCH] Makefile.in: make sure doc generated before install
-
-There is a race between the doc generation and the doc installation,
-so make the install depend on the build for doc to fix the error occurs
-sometimes as below:
- | TOPDIR/tmp-glibc/hosttools/install: cannot stat 'doc/jemalloc.3': No such file or directory
- | make: *** [Makefile:513: install_doc_man] Error 1
-
-Upstream-Status: Submitted [https://github.com/jemalloc/jemalloc/pull/2108]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- Makefile.in | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 7128b007..ab94f0c8 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -501,14 +501,14 @@ install_lib: install_lib_static
- endif
- install_lib: install_lib_pc
- 
--install_doc_html:
-+install_doc_html: build_doc_html
- 	$(INSTALL) -d $(DATADIR)/doc/jemalloc$(install_suffix)
- 	@for d in $(DOCS_HTML); do \
- 	echo "$(INSTALL) -m 644 $$d $(DATADIR)/doc/jemalloc$(install_suffix)"; \
- 	$(INSTALL) -m 644 $$d $(DATADIR)/doc/jemalloc$(install_suffix); \
- done
- 
--install_doc_man:
-+install_doc_man: build_doc_man
- 	$(INSTALL) -d $(MANDIR)/man3
- 	@for d in $(DOCS_MAN3); do \
- 	echo "$(INSTALL) -m 644 $$d $(MANDIR)/man3"; \
--- 
-2.29.2
-
diff --git a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
similarity index 91%
rename from meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb
rename to meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
index 8618c8c6a..950b64ee9 100644
--- a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb
+++ b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
@@ -14,14 +14,13 @@ SECTION = "libs"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ea061f8731d5e6a5761dfad951ef5f5f"
 
 SRC_URI = "git://github.com/jemalloc/jemalloc.git;branch=master;protocol=https \
-           file://0001-Makefile.in-make-sure-doc-generated-before-install.patch \
            file://run-ptest \
-"
+           "
 
 # Workaround for https://github.com/llvm/llvm-project/issues/52765
 SRC_URI:append:libc-glibc:toolchain-clang = " file://0001-test-Disable-optimization-with-clang-for-aligned_all.patch "
 
-SRCREV = "ea6b3e973b477b8061e0076bb257dbd7f3faa756"
+SRCREV = "54eaed1d8b56b1aa528be3bdd1877e59c56fa90c"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


