Return-Path: <gary.robertson@linaro.org>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0DE16721DF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 22:59:54 +0000 (UTC)
Received: by mail-ob0-f172.google.com with SMTP id wn1so8023179obc.31
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 14:59:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hG+UWX/LLwaj/Ga7jnpxaZwhiEYxQOWi+HySq2Hcgjc=;
	b=Yu08yLuMMN28XtdAdHPS8EoPfegurkGjBgKphaDn8AUxp3Or/zOYfbKj61gIPfv1cA
	vow0A6HCwVl3UJ4VIpjwZ0glUDSI+5MGvbavSE/4djyuQy4l09lLTduEu7ubgeBRW+gS
	QW+Ho2bW1aq2UvcWhkuAbY7bi0bpoHZt6aFCRfpVGF6R2gWZ0qQjeeLfs4SFokhkfjw5
	4BhBPCL3gcDVSHeSFoHiP9iFdBbeEsfLR88hpzAZqKuSghM3eSNPrj9qhxHjAffV6iD3
	EgBLBVjfDd3P7jiBaFtDPm6TXbhFK1RIfXuNU/hPWNTm8AqTjvZdIdzKpYUqEE2sSG5z
	vJ8w==
X-Gm-Message-State: ALoCoQmKnI71ml8YsjEopAlknpBjjy9s1lRdKC17vvPkwgTQV5jNfPaY7Xx9ruXPGdQ2Fp6eIe/A
X-Received: by 10.182.49.231 with SMTP id x7mr6278857obn.48.1416869995451;
	Mon, 24 Nov 2014 14:59:55 -0800 (PST)
Received: from honkintosh.cybertech.lan (65-120-133-114.dia.static.qwest.net.
	[65.120.133.114])
	by mx.google.com with ESMTPSA id n7sm6298616obh.25.2014.11.24.14.59.54
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 24 Nov 2014 14:59:54 -0800 (PST)
From: "Gary S. Robertson" <gary.robertson@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Nov 2014 16:59:15 -0600
Message-Id: <1416869955-13519-4-git-send-email-gary.robertson@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1416869955-13519-1-git-send-email-gary.robertson@linaro.org>
References: <1416869955-13519-1-git-send-email-gary.robertson@linaro.org>
Subject: [meta-oe][PATCH 3/3] libhugetlbfs: Fix page size & text offset for arm arches
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
X-List-Received-Date: Mon, 24 Nov 2014 22:59:58 -0000

From: "Gary S. Robertson" <gary.robertson@linaro.org>

Fixed computation of page size and text segment offset for various arm
architectures - including both LE and BE variants of armv7 as well as
aarch64

Upstream Status: Accepted at libhugetlbfs project

Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
---
 ...rch64-fix-page-size-not-properly-computed.patch |   32 -----------
 ...s-arm-arches-fix-page-size-and-text-offse.patch |   57 ++++++++++++++++++++
 .../libhugetlbfs/libhugetlbfs_git.bb               |    2 +-
 3 files changed, 58 insertions(+), 33 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001-aarch64-fix-page-size-not-properly-computed.patch
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001-ld.hugetlbfs-arm-arches-fix-page-size-and-text-offse.patch

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-aarch64-fix-page-size-not-properly-computed.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-aarch64-fix-page-size-not-properly-computed.patch
deleted file mode 100644
index da60ba0..0000000
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-aarch64-fix-page-size-not-properly-computed.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Subject: [PATCH] aarch64: fix page size not properly computed
-
-There's 2 issues fixed:
-* typo on MB variable (MB -> $MB)
-* some linker variants are missing (linux and big endian)
-  - aarch64elfb
-  - aarch64linux
-  - aarch64linuxb
-
-Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
-
-Upstream-Status: Submitted
----
- ld.hugetlbfs | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ld.hugetlbfs b/ld.hugetlbfs
-index df446dd..6553547 100755
---- a/ld.hugetlbfs
-+++ b/ld.hugetlbfs
-@@ -87,7 +87,7 @@ elf32ppclinux|elf64ppc)	HPAGE_SIZE=$((16*$MB)) SLICE_SIZE=$((256*$MB)) ;;
- elf64lppc)		HPAGE_SIZE=$((16*$MB)) SLICE_SIZE=$((256*$MB)) ;;
- elf_i386|elf_x86_64)	HPAGE_SIZE=$((4*$MB)) SLICE_SIZE=$HPAGE_SIZE ;;
- elf_s390|elf64_s390)	HPAGE_SIZE=$((1*$MB)) SLICE_SIZE=$HPAGE_SIZE ;;
--armelf_linux_eabi|aarch64elf)	HPAGE_SIZE=$((2*MB)) SLICE_SIZE=$HPAGE_SIZE ;;
-+armelf_linux_eabi|aarch64elf*|aarch64linux*)	HPAGE_SIZE=$((2*$MB)) SLICE_SIZE=$HPAGE_SIZE ;;
- esac
- 
- if [ "$HTLB_ALIGN" == "slice" ]; then
--- 
-1.9.2
-
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-ld.hugetlbfs-arm-arches-fix-page-size-and-text-offse.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-ld.hugetlbfs-arm-arches-fix-page-size-and-text-offse.patch
new file mode 100644
index 0000000..4e5b7bb
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-ld.hugetlbfs-arm-arches-fix-page-size-and-text-offse.patch
@@ -0,0 +1,57 @@
+From 1ab6f7f9b34fc745451140fc21db6763dffc5785 Mon Sep 17 00:00:00 2001
+From: "Gary S. Robertson" <gary.robertson@linaro.org>
+Date: Thu, 25 Sep 2014 14:57:06 -0500
+Subject: [PATCH] ld.hugetlbfs: arm arches - fix page size and text offset
+ setup
+
+There's 3 issues fixed:
+* typo on MB variable (MB -> $MB)
+* some linker variants are missing (linux and big endian)
+  - armelfb_linux_eabi
+  - aarch64elfb
+  - aarch64linux
+  - aarch64linuxb
+* text segment offset was not specified for armv7 BE
+
+NOTE: This patch replaces and makes obsolete the following previously
+      submitted patch:
+
+      aarch64: fix page size not properly computed
+      by: Fathi Boudra <fathi.boudra@linaro.org>
+
+Upstream Status: Accepted at libhugetlbfs project
+
+Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
+---
+ ld.hugetlbfs |    8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/ld.hugetlbfs b/ld.hugetlbfs
+index df446dd..4417442 100755
+--- a/ld.hugetlbfs
++++ b/ld.hugetlbfs
+@@ -87,7 +87,7 @@ elf32ppclinux|elf64ppc)	HPAGE_SIZE=$((16*$MB)) SLICE_SIZE=$((256*$MB)) ;;
+ elf64lppc)		HPAGE_SIZE=$((16*$MB)) SLICE_SIZE=$((256*$MB)) ;;
+ elf_i386|elf_x86_64)	HPAGE_SIZE=$((4*$MB)) SLICE_SIZE=$HPAGE_SIZE ;;
+ elf_s390|elf64_s390)	HPAGE_SIZE=$((1*$MB)) SLICE_SIZE=$HPAGE_SIZE ;;
+-armelf_linux_eabi|aarch64elf)	HPAGE_SIZE=$((2*MB)) SLICE_SIZE=$HPAGE_SIZE ;;
++armelf*_linux_eabi|aarch64elf*|aarch64linux*)	HPAGE_SIZE=$((2*$MB)) SLICE_SIZE=$HPAGE_SIZE ;;
+ esac
+ 
+ if [ "$HTLB_ALIGN" == "slice" ]; then
+@@ -96,9 +96,9 @@ if [ "$HTLB_ALIGN" == "slice" ]; then
+ 
+ 	# targeting the ARM platform one needs to explicitly set the text segment offset
+ 	# otherwise it will be NULL.
+-	if [ "$EMU" == "armelf_linux_eabi" ]; then
+-		HTLBOPTS="$HTLBOPTS -Ttext-segment=$SLICE_SIZE"
+-	fi
++	case "$EMU" in
++	armelf*_linux_eabi)	HTLBOPTS="$HTLBOPTS -Ttext-segment=$SLICE_SIZE" ;;
++	esac
+ fi
+ 
+ ${LD} "${args[@]}" ${HTLBOPTS}
+-- 
+1.7.9.5
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index 5111935..72d5c66 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code \
     file://tests-Makefile-install-static-4G-edge-testcases.patch \
     file://0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch \
     file://0001-aarch64-fix-cross-compilation.patch \
-    file://0001-aarch64-fix-page-size-not-properly-computed.patch \
+    file://0001-ld.hugetlbfs-arm-arches-fix-page-size-and-text-offse.patch \
     file://0001-replace-lib-lib64-hardcoded-values-by-LIBDIR32-LIBDI.patch \
     file://0001-Extend-arm32-support-to-include-BE-variants.patch \
     file://0001-Makefile-Recognize-all-ix86-arches.patch \
-- 
1.7.9.5


