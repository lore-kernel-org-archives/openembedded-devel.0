Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8678779C92
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 08:19:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x628IYsC001928
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Jul 2019 01:19:10 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Tue, 2 Jul 2019 01:18:50 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 2 Jul 2019 16:16:21 +0800
Message-ID: <96c7f671cb019153edc03e0ab1ef873f0bb5efe9.1562055251.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1562055251.git.hongxu.jia@windriver.com>
References: <cover.1562055251.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 7/8] thin-provisioning-tools: 0.7.6 -> 0.8.5
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
X-List-Received-Date: Tue, 02 Jul 2019 08:19:29 -0000
Content-Type: text/plain

- Rebase use-sh-on-path.patch
- Drop 0001-fix-compile-failed-with-libc-musl.patch which
  upstream has merged it

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-fix-compile-failed-with-libc-musl.patch   | 42 ----------------------
 .../files/use-sh-on-path.patch                     | 21 ++++++++---
 ...s_0.7.6.bb => thin-provisioning-tools_0.8.5.bb} |  3 +-
 3 files changed, 18 insertions(+), 48 deletions(-)
 delete mode 100644 meta-oe/recipes-support/thin-provisioning-tools/files/0001-fix-compile-failed-with-libc-musl.patch
 rename meta-oe/recipes-support/thin-provisioning-tools/{thin-provisioning-tools_0.7.6.bb => thin-provisioning-tools_0.8.5.bb} (84%)

diff --git a/meta-oe/recipes-support/thin-provisioning-tools/files/0001-fix-compile-failed-with-libc-musl.patch b/meta-oe/recipes-support/thin-provisioning-tools/files/0001-fix-compile-failed-with-libc-musl.patch
deleted file mode 100644
index 28b44da..0000000
--- a/meta-oe/recipes-support/thin-provisioning-tools/files/0001-fix-compile-failed-with-libc-musl.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From fcbcf9c494cca166106ae4cb03c1dd135ee4f25c Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 1 Aug 2018 09:34:00 +0800
-Subject: [PATCH] fix compile failed with libc musl
-
-There is a failure while compiling with libc musl:
-[snip]
-|./block-cache/io_engine.h:18:17: error: expected
-unqualified-id before numeric constant
-|  unsigned const PAGE_SIZE = 4096;
-[snip]
-
-The musl defeines macro PAGE_SIZE, undef it conditionally
-could fix the issue.
-
-http://musl.openwall.narkive.com/tO8vrHdP/why-musl-define-page-size
-
-Upstream-Status: Submitted [git://github.com/jthornber/thin-provisioning-tools]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- block-cache/io_engine.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/block-cache/io_engine.h b/block-cache/io_engine.h
-index 1704251..e36b932 100644
---- a/block-cache/io_engine.h
-+++ b/block-cache/io_engine.h
-@@ -12,6 +12,10 @@
- 
- //----------------------------------------------------------------
- 
-+// Musl defines
-+#ifdef PAGE_SIZE
-+#undef PAGE_SIZE
-+#endif
- namespace bcache {
- 	using sector_t = uint64_t;
- 
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-support/thin-provisioning-tools/files/use-sh-on-path.patch b/meta-oe/recipes-support/thin-provisioning-tools/files/use-sh-on-path.patch
index 8cb16de..de934c1 100644
--- a/meta-oe/recipes-support/thin-provisioning-tools/files/use-sh-on-path.patch
+++ b/meta-oe/recipes-support/thin-provisioning-tools/files/use-sh-on-path.patch
@@ -1,5 +1,7 @@
-
-thin-provisioning-tools: use sh on path when invoking txt2man
+From 38397b42e2c3450c2aee20e6fb92f362db4e35ef Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 2 Jul 2019 13:20:39 +0800
+Subject: [PATCH] thin-provisioning-tools: use sh on path when invoking txt2man
 
 txt2man contains a test which might try to use ksh to run the script, so we
 avoid running /bin/sh.
@@ -8,14 +10,25 @@ Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: joe.slater <joe.slater@windriver.com>
 
+Rebase to 0.8.5
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 7c867b2..5303994 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -210,7 +210,7 @@ endif
- 
+@@ -223,7 +223,7 @@ endif
  %.8: %.txt bin/txt2man
  	@echo "    [txt2man] $<"
+ 	@mkdir -p $(dir $@)
 -	$(V) bin/txt2man -p -t $(basename $(notdir $<)) $< > $@
 +	$(V) sh bin/txt2man -p -t $(basename $(notdir $<)) $< > $@
  
  #----------------------------------------------------------------
  
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.7.6.bb b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb
similarity index 84%
rename from meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.7.6.bb
rename to meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb
index 5f6ba9e..9f89bac 100644
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.7.6.bb
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb
@@ -9,11 +9,10 @@ S = "${WORKDIR}/git"
 
 SRC_URI = "git://github.com/jthornber/thin-provisioning-tools \
            file://0001-do-not-strip-pdata_tools-at-do_install.patch \
-           file://0001-fix-compile-failed-with-libc-musl.patch \
            file://use-sh-on-path.patch \
 "
 
-SRCREV = "6f936992b8e6208a7838fcf1ec87c5bd3a694a77"
+SRCREV = "5e5409f48b5403d2c6dffd9919b35ad77d6fb7b4"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.7.4


