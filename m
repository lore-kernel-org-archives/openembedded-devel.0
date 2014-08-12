Return-Path: <gary.robertson@linaro.org>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2D9A765C70
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 18:33:22 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id a141so6880716oig.23
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 11:33:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mKDBtFbdcaJnvvdi4yRe9NJrIeMuMNwg+mURDgGJSdo=;
	b=RkTsYr2Bn41rA+7Wb/GX+0139f3ETJpP3n1ozXA692E1zO1vr2dr9fOGPTMCpHRTF1
	63lQkYaPvhQmp6euJxnD2v9gB2AqV4ruwpk4LMCRTVgS4xOWMhtrH2sxY+tAWAPcQkGG
	8EmZv6u1q5oYu+zR5J3L4NtQlvefAsnueUsBgutZob120gnQzbBoipzcuZ4mgQp+hjcX
	WVQxmnCcQcNZk45pF8dXlrTx6Xozq1orLecjSUYsWZW4wmMWbu51LF81CAclkBxpmwHD
	o6Wr9zH6q18vJUBYaL2YV8M7az8UEWFc7fcBCVfYM0D6067MxlMnowApHKCZwJXdSikM
	5mHQ==
X-Gm-Message-State: ALoCoQmj3uTugAWI/ZlEpkaVf/dZEHMaEQWq+m3TIrdFe8zx6Mb06BFdnou1b4sizsEtXa2PZ+qN
X-Received: by 10.182.200.166 with SMTP id jt6mr6708045obc.1.1407868403095;
	Tue, 12 Aug 2014 11:33:23 -0700 (PDT)
Received: from honkintosh.cybertech.lan (65-120-133-114.dia.static.qwest.net.
	[65.120.133.114])
	by mx.google.com with ESMTPSA id ii12sm5016355obd.5.2014.08.12.11.33.21
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 12 Aug 2014 11:33:21 -0700 (PDT)
From: "Gary S. Robertson" <gary.robertson@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Aug 2014 13:32:58 -0500
Message-Id: <1407868378-26155-1-git-send-email-gary.robertson@linaro.org>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][master][PATCH] libhugetlbfs: Extend arm32 support to include BE variants
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Aug 2014 18:33:23 -0000

From: "Gary S. Robertson" <gary.robertson@linaro.org>

Upstream Status: Submitted

This patch applies the same technique used by Koen Kool in the following patch
which was accepted by the libhugetlbfs project:

[0a4f6] Add aarch64_be_support 2014-03-31 10:52:37

It modifies the libhugetlbfs Makefile to mark all 32-bit arm architectures
as supported by the libhugetlbfs build.  Builds and successful functional
tests have been performed for armv7a LE and BE runtime platforms.

This patch replaces and renders obsolete the following patch:
arm32-support.patch by: Chunrong Guo <B40290@freescale.com>

Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
---
 ...tend-arm32-support-to-include-BE-variants.patch |   38 ++++++++++++++++++++
 .../libhugetlbfs/files/arm32-support.patch         |   29 ---------------
 .../libhugetlbfs/libhugetlbfs_git.bb               |    2 +-
 3 files changed, 39 insertions(+), 30 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Extend-arm32-support-to-include-BE-variants.patch
 delete mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/arm32-support.patch

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Extend-arm32-support-to-include-BE-variants.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Extend-arm32-support-to-include-BE-variants.patch
new file mode 100644
index 0000000..f6147cb
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Extend-arm32-support-to-include-BE-variants.patch
@@ -0,0 +1,38 @@
+From 5af6dec8764375ca4f13bd9fed96af090228351a Mon Sep 17 00:00:00 2001
+From: "Gary S. Robertson" <gary.robertson@linaro.org>
+Date: Mon, 11 Aug 2014 11:06:04 -0500
+Subject: [libhugetlbfs][PATCH] Extend arm32 support to include BE variants
+    
+This patch applies the same technique used by Koen Kool in the following patch
+which was accepted by the libhugetlbfs project:
+    
+[0a4f6] Add aarch64_be_support 2014-03-31 10:52:37
+    
+It modifies the libhugetlbfs Makefile to mark all 32-bit arm architectures
+as supported by the libhugetlbfs build.  Builds and successful functional
+tests have been performed for armv7a LE and BE runtime platforms.
+    
+This patch replaces and renders obsolete the following patch:
+arm32-support.patch submitted by: Chunrong Guo <B40290@freescale.com>
+
+Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
+---
+ Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 91502e1..ba79607 100644
+--- a/Makefile
++++ b/Makefile
+@@ -59,7 +59,7 @@ ELF32 = elf32ppclinux
+ TMPLIB32 = lib
+ CPPFLAGS += -DPPC_NO_SEGMENTS
+ else
+-ifeq ($(ARCH),armv7l)
++ifneq (,$(findstring arm,$(ARCH)))
+ CC32 = $(CC)
+ TMPLIB32 = lib
+ ELF32 += armelf_linux_eabi
+-- 
+1.7.9.5
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/arm32-support.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/arm32-support.patch
deleted file mode 100644
index 96f162d..0000000
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/arm32-support.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Upstream-Status: Submitted
-
-This patch adds support for arm32.
-
-Signed-off-by: Chunrong Guo <B40290@freescale.com>
-
---- a/Makefileold	2014-06-17 21:55:23.131058918 -0500
-+++ b/Makefile	2014-06-17 21:56:08.726098531 -0500
-@@ -59,6 +59,12 @@
- TMPLIB32 = lib
- CPPFLAGS += -DPPC_NO_SEGMENTS
- else
-+ifeq ($(ARCH),arm)
-+CC32 = $(CC)
-+TMPLIB32 = lib
-+ELF32 += armelf_linux_eabi
-+CUSTOM_LDSCRIPTS = no
-+else
- ifeq ($(ARCH),armv7l)
- CC32 = $(CC)
- TMPLIB32 = lib
-@@ -116,6 +122,7 @@
- endif
- endif
- endif
-+endif
- 
- ifdef CC32
- OBJDIRS += obj32
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index 315863d..851b050 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code \
     file://0001-aarch64-fix-cross-compilation.patch \
     file://0001-aarch64-fix-page-size-not-properly-computed.patch \
     file://0001-replace-lib-lib64-hardcoded-values-by-LIBDIR32-LIBDI.patch \
-    file://arm32-support.patch \
+    file://0001-Extend-arm32-support-to-include-BE-variants.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
1.7.9.5


