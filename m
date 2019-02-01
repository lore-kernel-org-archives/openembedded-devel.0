Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9B5787C1FB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Feb 2019 05:56:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x115tPRs030980
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 31 Jan 2019 21:55:35 -0800
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.435.0;
	Thu, 31 Jan 2019 21:55:14 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Thu, 31 Jan 2019 21:55:14 -0800
Message-ID: <20190201055514.125049-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] vim: improve reproducibility
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
X-List-Received-Date: Fri, 01 Feb 2019 05:56:00 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Clear all_cflags, all_lflags, compiled_user
and compiled_sys to avoid introducing build
info to improve reproducibility as below:

WARNING: vim-8.1.0347-r0 do_package_qa: QA Issue: File /work/core2-64-wrs-linux/vim/8.1.0347-r0/packages-split/vim/usr/bin/vim.vim in package contained reference to tmpdir [buildpaths]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...src-Makefile-improve-reproducibility.patch | 46 +++++++++++++++++++
 meta-oe/recipes-support/vim/vim_8.1.0347.bb   |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch

diff --git a/meta-oe/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch b/meta-oe/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch
new file mode 100644
index 000000000..63a7b78f1
--- /dev/null
+++ b/meta-oe/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch
@@ -0,0 +1,46 @@
+From 133ab27cdb17ca20ef6b0304cf30621d2bcbe757 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Thu, 31 Jan 2019 21:32:26 -0800
+Subject: [PATCH] src/Makefile: improve reproducibility
+
+Clear all_cflags, all_lflags, compiled_user
+and compiled_sys to avoid introducing build
+info to improve reproducibility as below:
+
+WARNING: vim-8.1.0347-r0 do_package_qa: QA Issue: File /work/core2-64-wrs-linux/vim/8.1.0347-r0/packages-split/vim/usr/bin/vim.vim in package contained reference to tmpdir [buildpaths]
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/Makefile | 14 ++++----------
+ 1 file changed, 4 insertions(+), 10 deletions(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index f2fafa4dc..7148d4bd9 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -2845,16 +2845,10 @@ auto/pathdef.c: Makefile auto/config.mk
+ 	-@echo '#include "vim.h"' >> $@
+ 	-@echo 'char_u *default_vim_dir = (char_u *)"$(VIMRCLOC)";' | $(QUOTESED) >> $@
+ 	-@echo 'char_u *default_vimruntime_dir = (char_u *)"$(VIMRUNTIMEDIR)";' | $(QUOTESED) >> $@
+-	-@echo 'char_u *all_cflags = (char_u *)"$(CC) -c -I$(srcdir) $(ALL_CFLAGS)";' | $(QUOTESED) >>  $@
+-	-@echo 'char_u *all_lflags = (char_u *)"$(CC) $(ALL_LIB_DIRS) $(LDFLAGS) -o $(VIMTARGET) $(ALL_LIBS) ";' | $(QUOTESED) >>  $@
+-	-@echo 'char_u *compiled_user = (char_u *)"' | tr -d $(NL) >> $@
+-	-@if test -n "$(COMPILEDBY)"; then \
+-		echo "$(COMPILEDBY)" | tr -d $(NL) >> $@; \
+-		else ((logname) 2>/dev/null || whoami) | tr -d $(NL) >> $@; fi
+-	-@echo '";' >> $@
+-	-@echo 'char_u *compiled_sys = (char_u *)"' | tr -d $(NL) >> $@
+-	-@if test -z "$(COMPILEDBY)"; then hostname | tr -d $(NL) >> $@; fi
+-	-@echo '";' >> $@
++	-@echo 'char_u *all_cflags = (char_u *)"";' | $(QUOTESED) >>  $@
++	-@echo 'char_u *all_lflags = (char_u *)"";' | $(QUOTESED) >>  $@
++	-@echo 'char_u *compiled_user = (char_u *)"";' >> $@
++	-@echo 'char_u *compiled_sys = (char_u *)"";' >> $@
+ 	-@sh $(srcdir)/pathdef.sh
+ 
+ GUI_GTK_RES_INPUTS = \
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-support/vim/vim_8.1.0347.bb b/meta-oe/recipes-support/vim/vim_8.1.0347.bb
index 46d229e03..4de4d8e38 100644
--- a/meta-oe/recipes-support/vim/vim_8.1.0347.bb
+++ b/meta-oe/recipes-support/vim/vim_8.1.0347.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;endline=287;md5=f1f82b42360
 SRC_URI = "git://github.com/vim/vim.git \
            file://disable_acl_header_check.patch;patchdir=.. \
            file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
+           file://0001-src-Makefile-improve-reproducibility.patch;patchdir=.. \
 "
 SRCREV = "f1c118be93184e8e57e3e80b1b3383f464ed649e"
 
-- 
2.17.1


