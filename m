Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9BA0C78D63
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Aug 2018 07:11:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w717BffM004307
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Aug 2018 00:11:41 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 1 Aug 2018 00:11:39 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Wed, 1 Aug 2018 15:21:30 +0800
Message-ID: <d1318a396b3e0eebfc045fb3489a43209da21ea4.1533107855.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1533107855.git.hongxu.jia@windriver.com>
References: <cover.1533107855.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 06/16] thin-provisioning-tools: 0.6.3 -> 0.7.6
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
X-List-Received-Date: Wed, 01 Aug 2018 07:11:45 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...01-do-not-strip-pdata_tools-at-do_install.patch | 12 +++----
 .../0001-fix-compile-failed-with-libc-musl.patch   | 42 ++++++++++++++++++++++
 ...s_0.6.3.bb => thin-provisioning-tools_0.7.6.bb} |  3 +-
 3 files changed, 50 insertions(+), 7 deletions(-)
 create mode 100644 meta-oe/recipes-support/thin-provisioning-tools/files/0001-fix-compile-failed-with-libc-musl.patch
 rename meta-oe/recipes-support/thin-provisioning-tools/{thin-provisioning-tools_0.6.3.bb => thin-provisioning-tools_0.7.6.bb} (83%)

diff --git a/meta-oe/recipes-support/thin-provisioning-tools/files/0001-do-not-strip-pdata_tools-at-do_install.patch b/meta-oe/recipes-support/thin-provisioning-tools/files/0001-do-not-strip-pdata_tools-at-do_install.patch
index b4cdda1..547949d 100644
--- a/meta-oe/recipes-support/thin-provisioning-tools/files/0001-do-not-strip-pdata_tools-at-do_install.patch
+++ b/meta-oe/recipes-support/thin-provisioning-tools/files/0001-do-not-strip-pdata_tools-at-do_install.patch
@@ -1,6 +1,6 @@
-From e8be402e20cbdfbd8192a171ac9904d9362103bf Mon Sep 17 00:00:00 2001
+From de869ad2cb19d81257a159770ebe27593a71593c Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 31 Aug 2016 01:35:40 -0400
+Date: Tue, 31 Jul 2018 11:29:51 +0800
 Subject: [PATCH] do not strip pdata_tools at do_install
 
 It caused QA Issue:
@@ -17,11 +17,11 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 4264191..ac22042 100644
+index 02b75dd..df590b4 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -189,7 +189,6 @@ distclean: clean
- install: bin/pdata_tools
+@@ -267,7 +267,6 @@ MANPAGES:=$(patsubst %,man8/%.8,$(TOOLS))
+ install: bin/pdata_tools $(MANPAGES)
  	$(INSTALL_DIR) $(BINDIR)
  	$(INSTALL_PROGRAM) bin/pdata_tools $(BINDIR)
 -	$(STRIP) $(BINDIR)/pdata_tools
@@ -29,5 +29,5 @@ index 4264191..ac22042 100644
  	ln -s -f pdata_tools $(BINDIR)/cache_dump
  	ln -s -f pdata_tools $(BINDIR)/cache_metadata_size
 -- 
-2.8.1
+2.7.4
 
diff --git a/meta-oe/recipes-support/thin-provisioning-tools/files/0001-fix-compile-failed-with-libc-musl.patch b/meta-oe/recipes-support/thin-provisioning-tools/files/0001-fix-compile-failed-with-libc-musl.patch
new file mode 100644
index 0000000..28b44da
--- /dev/null
+++ b/meta-oe/recipes-support/thin-provisioning-tools/files/0001-fix-compile-failed-with-libc-musl.patch
@@ -0,0 +1,42 @@
+From fcbcf9c494cca166106ae4cb03c1dd135ee4f25c Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 1 Aug 2018 09:34:00 +0800
+Subject: [PATCH] fix compile failed with libc musl
+
+There is a failure while compiling with libc musl:
+[snip]
+|./block-cache/io_engine.h:18:17: error: expected
+unqualified-id before numeric constant
+|  unsigned const PAGE_SIZE = 4096;
+[snip]
+
+The musl defeines macro PAGE_SIZE, undef it conditionally
+could fix the issue.
+
+http://musl.openwall.narkive.com/tO8vrHdP/why-musl-define-page-size
+
+Upstream-Status: Submitted [git://github.com/jthornber/thin-provisioning-tools]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ block-cache/io_engine.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/block-cache/io_engine.h b/block-cache/io_engine.h
+index 1704251..e36b932 100644
+--- a/block-cache/io_engine.h
++++ b/block-cache/io_engine.h
+@@ -12,6 +12,10 @@
+ 
+ //----------------------------------------------------------------
+ 
++// Musl defines
++#ifdef PAGE_SIZE
++#undef PAGE_SIZE
++#endif
+ namespace bcache {
+ 	using sector_t = uint64_t;
+ 
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.6.3.bb b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.7.6.bb
similarity index 83%
rename from meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.6.3.bb
rename to meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.7.6.bb
index 4a692dc..20cb17a 100644
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.6.3.bb
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.7.6.bb
@@ -9,9 +9,10 @@ S = "${WORKDIR}/git"
 
 SRC_URI = "git://github.com/jthornber/thin-provisioning-tools \
            file://0001-do-not-strip-pdata_tools-at-do_install.patch \
+           file://0001-fix-compile-failed-with-libc-musl.patch \
 "
 
-SRCREV = "49bfc12e9c7956c1ac134b24afbe1a6a602ce7d5"
+SRCREV = "6f936992b8e6208a7838fcf1ec87c5bd3a694a77"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.7.4


