Return-Path: <yang.shi@linaro.org>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5E04960767
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2016 19:07:27 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id c189so9235618pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2016 12:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=IQ2eGmEzX0UdCqdYLxVfOyZNcmGJJoGBNk02V/m90/s=;
	b=FvbUONr495ImwbL6EENVoKoEckhcuSok0xV/HmMLTuXjQ5NDoSSd2F7dl2GeJ3OWAG
	672uaUJ7LEGJmk92TVkldwyvh6YymgBFNtGeut0cToR7z9xBJgNUax6hMhsJkiIa9ERI
	VKCXuXCskSyYwuxZoOD67JdDFVzuCXjb0DxvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IQ2eGmEzX0UdCqdYLxVfOyZNcmGJJoGBNk02V/m90/s=;
	b=Tw25pUoFtup+sdjoXFdGEeDz/PGOJzUqpjjiM5MolZS8hQ0N+/2ZdF01MSeuCpMTXK
	YRmngvpMONOhcea60iaHROlnxPo8SGXpg+gm0D/saEjy/j0jtFlmBwN4B0BHzbyLTsKq
	oCm8BT+7R20KcT9bdTVhRtgNysKWd7qWGyq6mGGYArJM7jmsJt7qnGP5kVwsL1Ek76Gt
	ZzfqRO5ErkdWFm7z/D0K063BXZhwcMaIBOegTRX5eNy4Ut1X+BxCSnLPFGiRn+Ebsp7c
	5MYHdTHSxDOg/TZKxvmhGQICJ4K7xGg2ADp6m//Nfyzs3BL7E0EjyQL0Xsr4033OVcDE
	bNVQ==
X-Gm-Message-State: AOPr4FUrzWu7RUZsAc/ag4IqB3+PborKeitdY3oBQ+6jbEpMchonDxMnwNxWVBzogUcA4p71
X-Received: by 10.98.104.6 with SMTP id d6mr60102581pfc.77.1462907248830;
	Tue, 10 May 2016 12:07:28 -0700 (PDT)
Received: from yshi-Precision-T5600.corp.ad.wrs.com
	(unknown-216-82.windriver.com. [147.11.216.82])
	by smtp.gmail.com with ESMTPSA id
	qm10sm6258461pac.33.2016.05.10.12.07.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 May 2016 12:07:28 -0700 (PDT)
From: Yang Shi <yang.shi@linaro.org>
To: Martin.Jansa@gmail.com
Date: Tue, 10 May 2016 11:40:50 -0700
Message-Id: <1462905650-23335-1-git-send-email-yang.shi@linaro.org>
X-Mailer: git-send-email 2.0.2
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH] libhugetlbfs: enable build for x86-32
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
X-List-Received-Date: Tue, 10 May 2016 19:07:28 -0000

Backported commit e3928d572b12f4e85a2a989482ac2d68c1bc2734
("Force text segment alignment to 0x08000000 for i386 with gold linker")
from libhugetlbfs -next branch to fix the build failure with gold linker.

And, enable x86-32 in COMPATIBLE_HOST.

Signed-off-by: Yang Shi <yang.shi@linaro.org>
---
 ...segment-alignment-to-0x08000000-for-i386-.patch | 92 ++++++++++++++++++++++
 .../libhugetlbfs/libhugetlbfs_git.bb               |  3 +-
 2 files changed, 94 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/Force-text-segment-alignment-to-0x08000000-for-i386-.patch

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/Force-text-segment-alignment-to-0x08000000-for-i386-.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/Force-text-segment-alignment-to-0x08000000-for-i386-.patch
new file mode 100644
index 0000000..ce6974d
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/Force-text-segment-alignment-to-0x08000000-for-i386-.patch
@@ -0,0 +1,92 @@
+From 3c6f8d0e3c0694f79244ec6ad5ad9ba3ca26bc0a Mon Sep 17 00:00:00 2001
+From: Yang Shi <yang.shi@linaro.org>
+Date: Mon, 7 Dec 2015 14:12:13 -0800
+Subject: [PATCH] Force text segment alignment to 0x08000000 for i386 with gold
+ linker
+
+Upstream-Status: Backport
+
+When build libhugetlbfs tests with gold linker for i386, the below error occurs:
+
+i586-oe-linux-gcc  -m32 -march=i586 -Wl,-O1 -Wl,--hash-style=gnu
+-Wl,--as-needed
+--sysroot=/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86 -I..
+-O2
+-Wall -g -o obj32/linkhuge_rw.o -c linkhuge_rw.c
+| i586-oe-linux-gcc  -m32 -march=i586 -Wl,-O1 -Wl,--hash-style=gnu
+-Wl,--as-needed
+--sysroot=/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86
+-B./obj32
+-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,noexecstack -ldl
+-L../obj32
+-o obj32/linkhuge_rw -Wl,--no-as-needed -lpthread -ldl -lhugetlbfs_privutils
+-Wl,--hugetlbfs-align obj32/linkhuge_rw.o obj32/testutils.o
+| i586-oe-linux-ld: internal error in do_write, at
+/home/jenkins/oe/world/shr-core/tmp-glibc/work/x86_64-oe-linux/binutils-cross-i586/2.25-r0/git/gold/output.cc:464
+| collect2: error: ld returned 1 exit status
+
+But, it works well with GNU linker. --hugetlbfs-align flag passes
+"-zcommon-page-size=$SLICE_SIZE -zmax-page-size=$SLICE_SIZE", that are supported by gold linker too.
+But, it looks gold linker deal with them in a different way from gnu linker for i586.
+
+The readelf shows the below result with GNU linker:
+
+Elf file type is EXEC (Executable file)
+Entry point 0x8048fbd
+There are 8 program headers, starting at offset 52
+
+Program Headers:
+  Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
+  PHDR           0x000034 0x08000034 0x08000034 0x00100 0x00100 R E 0x4
+  INTERP         0x048134 0x08048134 0x08048134 0x00013 0x00013 R   0x1
+      [Requesting program interpreter: /lib/ld-linux.so.2]
+  LOAD           0x000000 0x08000000 0x08000000 0x5a5bc 0x5a5bc R E 0x400000
+  LOAD           0x05a5bc 0x0845a5bc 0x0845a5bc 0x1028c 0x202cc RW 0x400000
+  DYNAMIC        0x05a5d0 0x0845a5d0 0x0845a5d0 0x000e8 0x000e8 RW  0x4
+  NOTE           0x048148 0x08048148 0x08048148 0x00044 0x00044 R   0x4
+  GNU_EH_FRAME   0x059e5c 0x08059e5c 0x08059e5c 0x0009c 0x0009c R   0x4
+  GNU_STACK      0x000000 0x00000000 0x00000000 0x00000 0x00000 RW  0x10
+
+"--relax" linker option doesn't solve this problem.
+Forced textsegment alignment to 0x08000000 with gold linker, the build will pass and
+readelf shows the same result with GNU linker:
+
+Elf file type is EXEC (Executable file)
+Entry point 0x8048fbd
+There are 8 program headers, starting at offset 52
+
+Program Headers:
+  Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
+  PHDR           0x000034 0x08000034 0x08000034 0x00100 0x00100 R E 0x4
+  INTERP         0x048134 0x08048134 0x08048134 0x00013 0x00013 R   0x1
+      [Requesting program interpreter: /lib/ld-linux.so.2]
+  LOAD           0x000000 0x08000000 0x08000000 0x5a5bc 0x5a5bc R E 0x400000
+  LOAD           0x05a5bc 0x0845a5bc 0x0845a5bc 0x1028c 0x202cc RW 0x400000
+  DYNAMIC        0x05a5d0 0x0845a5d0 0x0845a5d0 0x000e8 0x000e8 RW  0x4
+  NOTE           0x048148 0x08048148 0x08048148 0x00044 0x00044 R   0x4
+  GNU_EH_FRAME   0x059e5c 0x08059e5c 0x08059e5c 0x0009c 0x0009c R   0x4
+  GNU_STACK      0x000000 0x00000000 0x00000000 0x00000 0x00000 RW  0x10
+
+The fix just have impact on hugelink_rw test case, which needs --hugetlbfs-align flag.
+
+Signed-off-by: Yang Shi <yang.shi@linaro.org>
+Signed-off-by: Eric B Munson <emunson@mgebm.net>
+---
+ ld.hugetlbfs | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/ld.hugetlbfs b/ld.hugetlbfs
+index 4417442..32bc6fb 100755
+--- a/ld.hugetlbfs
++++ b/ld.hugetlbfs
+@@ -98,6 +98,7 @@ if [ "$HTLB_ALIGN" == "slice" ]; then
+ 	# otherwise it will be NULL.
+ 	case "$EMU" in
+ 	armelf*_linux_eabi)	HTLBOPTS="$HTLBOPTS -Ttext-segment=$SLICE_SIZE" ;;
++	elf_i386)		HTLBOPTS="$HTLBOPTS -Ttext-segment=0x08000000" ;;
+ 	esac
+ fi
+ 
+-- 
+2.0.2
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index 015d446..accbffd 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -19,11 +19,12 @@ SRC_URI = " \
     file://0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch \
     file://libhugetlbfs-elf_i386-avoid-search-host-library-path.patch \
     file://libhugetlbfs-avoid-using-restrict-as-var-name.patch \
+    file://Force-text-segment-alignment-to-0x08000000-for-i386-.patch \
 "
 
 S = "${WORKDIR}/git"
 
-COMPATIBLE_HOST = "(x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
+COMPATIBLE_HOST = "(i.86|x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
 
 LIBARGS = "LIB32=${baselib} LIB64=${baselib}"
 LIBHUGETLBFS_ARCH = "${TARGET_ARCH}"
-- 
2.0.2


