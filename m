Return-Path: <gary.robertson@linaro.org>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id CC27D7067B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Nov 2014 19:23:40 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id g201so1275652oib.33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Nov 2014 11:23:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2K3f/2vx+0Hu4b4SQfuDWplGm2onYl5/SctIxbEGjNg=;
	b=gR6fQYNYyatVzxt5pufJJs1IhBj3BYIYR1BOLIBPN05C5TcM+AUDchlRDGW7Q7tPFi
	wkYcVEAUXKA4eGocF0jmInqOhgyhhlMYax5cT7YUgkjrxe/TKH8fgzh3wotqgKFQExvb
	p+DOt5y9GZzyLZHpLF4GKSTVuCYJ0xQIxairt/+o10MrpD00TXCTSLwPr0YEf3GB3qNr
	a7ZY8cTFNsAFGslycSDWa3+Tdvdbt/XUjfh6QoUSyzdRXZWVn276b0sr+wStMXzXdjpT
	JmHmPgW+Oc/iKr17+xbPDPqxo0YlecjsaydgGiQPFtCkwvReId0CQfZNBgrgsfr8ziz2
	t5Hw==
X-Gm-Message-State: ALoCoQlR6sXQwyA1DlK7lJzkhYDg9trjXcJlHfXnwGDF59OvxtXRyIexemjpTrwFdLX59Djdy3iN
X-Received: by 10.182.210.232 with SMTP id mx8mr5427884obc.46.1415301821022;
	Thu, 06 Nov 2014 11:23:41 -0800 (PST)
Received: from honkintosh.cybertech.lan (65-120-133-114.dia.static.qwest.net.
	[65.120.133.114])
	by mx.google.com with ESMTPSA id 2sm3016019obq.29.2014.11.06.11.23.39
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 06 Nov 2014 11:23:40 -0800 (PST)
From: "Gary S. Robertson" <gary.robertson@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Nov 2014 13:23:03 -0600
Message-Id: <1415301783-5342-4-git-send-email-gary.robertson@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1415301783-5342-1-git-send-email-gary.robertson@linaro.org>
References: <1415301783-5342-1-git-send-email-gary.robertson@linaro.org>
Subject: [PATCH 3/3] libhugetlbfs: fix page size and text offset for arm arches
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
X-List-Received-Date: Thu, 06 Nov 2014 19:23:45 -0000

From: "Gary S. Robertson" <gary.robertson@linaro.org>

Fixed computation of page size and text segment offset for various arm
architectures - including both LE and BE variants of armv7 as well as
aarch64

Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
---
 ...rch64-fix-page-size-not-properly-computed.patch |   32 -----------
 ...s-arm-arches-fix-page-size-and-text-offse.patch |   57 ++++++++++++++++++++
 .../libhugetlbfs/libhugetlbfs_git.bb               |    1 +
 3 files changed, 58 insertions(+), 32 deletions(-)
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
index 0000000..68cd71b
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-ld.hugetlbfs-arm-arches-fix-page-size-and-text-offse.patch
@@ -0,0 +1,57 @@
+From 1ab6f7f9b34fc745451140fc21db6763dffc5785 Mon Sep 17 00:00:00 2001
+From: "Gary S. Robertson" <gary.robertson@linaro.org>
+Date: Thu, 25 Sep 2014 14:57:06 -0500
+Subject: [libhugetlbfs][PATCH] ld.hugetlbfs: arm arches - fix page size and text offset
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
+Upstream Status: Submitted
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
index 0af77f1..e490848 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -20,6 +20,7 @@ SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code \
     file://0001-replace-lib-lib64-hardcoded-values-by-LIBDIR32-LIBDI.patch \
     file://0001-Extend-arm32-support-to-include-BE-variants.patch \
     file://0001-libhugetlbfs-Recognize-all-ix86-arches.patch \
+    file://0001-ld.hugetlbfs-arm-arches-fix-page-size-and-text-offse.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
1.7.9.5


