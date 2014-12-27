Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 51135713B9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 17:22:48 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id z10so14561808pdj.14
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 09:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=QZZo5rb5sGfhb8SWkVCDCHj36Ikqn7CJMoyQ6L1BW44=;
	b=X9d4hucoas6quHJNCKRrMiTfeCr9/ZqOd3ikFQwLUS/FVfWzbtgGmGLVtmMPWRa5d1
	UVZJpnL0TarKCToGieDxiMPVhFgW4VCBGV4gxcSuFnjNpoBCNoNOLGWxCC0bIDPMEmXk
	ueGR+1GOYYGaUnzSMCpUBXX0Jwkq5hK2E/HXTFTxgt9yDgBSRtiJ/PorMk/iFEZwTBtc
	rgXNIseEQk2S+DxK6+31yIajoeVa6I3Kxf8QaoS4QDl7cfp2z38ngQa2IWHU9ufjBkH2
	eFYVKXjqpkE2/+vVdD0u3MgcJ3uUU2ZC2jWoKQTIVeu6wEFBt1OWcmZXbl3RLTT6ULAt
	x9xg==
X-Received: by 10.70.88.9 with SMTP id bc9mr15812945pdb.145.1419700969834;
	Sat, 27 Dec 2014 09:22:49 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id
	fu1sm31202444pbb.91.2014.12.27.09.22.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Dec 2014 09:22:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat, 27 Dec 2014 09:22:06 -0800
Message-Id: <8d8b0f1cc843e6df6f44d16360d712a7a44d17d7.1419700394.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
Subject: [PATCH 19/27] libhugetlbfs: Fix page size & text offset for arm arches
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
X-List-Received-Date: Sat, 27 Dec 2014 17:22:49 -0000

From: "Gary S. Robertson" <gary.robertson@linaro.org>

Fixed computation of page size and text segment offset for various arm
architectures - including both LE and BE variants of armv7 as well as
aarch64

Upstream Status: Accepted at libhugetlbfs project

Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...rch64-fix-page-size-not-properly-computed.patch | 32 ------------
 ...s-arm-arches-fix-page-size-and-text-offse.patch | 57 ++++++++++++++++++++++
 .../libhugetlbfs/libhugetlbfs_git.bb               |  2 +-
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
index c906217..4ce6a19 100644
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
1.9.1


