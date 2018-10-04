Return-Path: <daniel.diaz@linaro.org>
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
	[209.85.219.172])
	by mail.openembedded.org (Postfix) with ESMTP id B0445789FF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Oct 2018 23:16:09 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id o63-v6so4691800yba.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Oct 2018 16:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=7I8iGQi9+5B+BtUPW7l8FgRkLCnlAuo4o2LWb1ydMyM=;
	b=WYeI44PE9ksdl5M3CqmhpdrCBoakxzHY/VvFK83GGCgfa6aTCyGW6c8ul6qivt+WTP
	e7TPy+tGjhnK/NNC/QSY2eLTcH8Tn0aadtCgjPkkNcW8u5PHgt9/sjpLOGMPtJ9Pj5gH
	5IXntxW9oedzm+NhZOM3gRnPHAFW2HQ7TgdZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7I8iGQi9+5B+BtUPW7l8FgRkLCnlAuo4o2LWb1ydMyM=;
	b=KXbzbc6nLSW9TdXFjI9Ot4SoPZ3s60hNsYMoHKeWkCQL0gOmixfAsJ5Nce2nvtHhe/
	Ty2i9sn1bvU6O/V0vYtnaHi9Tun+VAHJqXLOpi6+PAG7xXPAndJWFzLQnR/kUTzTA4pp
	G6cjAZe9okHxS7J3j1iCrbeXFkL6+CIxgp01iKCrqGpFzFxz3nWzPfSR7HuR/xCtNWFj
	JorXnF98Y4A4NnRC+MjJNzOYULq5d/HsbohVTHpL9xLVMLnfxf0LR2IdMVfqvVf9LgEy
	6iQ58UWzZW01nEcGNisRmGMv1rOnBNuNZKn7EOKJpoMZ3vTBwBRoXM41K7l/JRGnfghs
	iY/Q==
X-Gm-Message-State: ABuFfogtFCwk6cplYaRlcdUjD5YHsQzeHsHdtsoc2F203RVrkPy6pQVu
	B704tO3CJfYVkg5738Zsx01l6Kyf0+JbgQ==
X-Google-Smtp-Source: ACcGV63XR89eTdu0zLZkz9w1yYCS80Gdq+GhWspXjyK01YcDv99H93VA0r6Zul/EA+BK0Qx7rzHmoQ==
X-Received: by 2002:a25:bacb:: with SMTP id
	a11-v6mr5201143ybk.132.1538694969987; 
	Thu, 04 Oct 2018 16:16:09 -0700 (PDT)
Received: from localhost.localdomain
	(CableLink-187-161-144-121.PCs.InterCable.net. [187.161.144.121])
	by smtp.googlemail.com with ESMTPSA id
	o202-v6sm8961039ywo.38.2018.10.04.16.16.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Oct 2018 16:16:08 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Oct 2018 18:15:50 -0500
Message-Id: <20181004231550.15800-1-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181004225610.13853-1-daniel.diaz@linaro.org>
References: <20181004225610.13853-1-daniel.diaz@linaro.org>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] libhugetlbfs: Update to 2.21
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
X-List-Received-Date: Thu, 04 Oct 2018 23:16:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Version 2.21 was released on 9/17 [1]. These changes update
the recipe to use that version.

Only one of the existing patches had been merged upstream
(as e3928d57 "Force text segment alignment to 0x08000000 for
i386 with gold linker") -- the rest of them is still needed
for proper cross-compilation.

Upstream commit c3e5cb22 ("Remove bit-rotting scripts") got
rid of the Perl stuff, due to it being "massively out of
date", so the Perl bits in the recipe have gone away too.

[1] https://github.com/libhugetlbfs/libhugetlbfs/releases/tag/2.21

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
v2: Delete unneeded patch.

 ...nt-alignment-to-0x08000000-for-i386-.patch | 92 -------------------
 .../libhugetlbfs/libhugetlbfs_git.bb          | 20 +---
 2 files changed, 5 insertions(+), 107 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/Force-text-segment-alignment-to-0x08000000-for-i386-.patch

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/Force-text-segment-alignment-to-0x08000000-for-i386-.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/Force-text-segment-alignment-to-0x08000000-for-i386-.patch
deleted file mode 100644
index ce6974d7c..000000000
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/Force-text-segment-alignment-to-0x08000000-for-i386-.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From 3c6f8d0e3c0694f79244ec6ad5ad9ba3ca26bc0a Mon Sep 17 00:00:00 2001
-From: Yang Shi <yang.shi@linaro.org>
-Date: Mon, 7 Dec 2015 14:12:13 -0800
-Subject: [PATCH] Force text segment alignment to 0x08000000 for i386 with gold
- linker
-
-Upstream-Status: Backport
-
-When build libhugetlbfs tests with gold linker for i386, the below error occurs:
-
-i586-oe-linux-gcc  -m32 -march=i586 -Wl,-O1 -Wl,--hash-style=gnu
--Wl,--as-needed
---sysroot=/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86 -I..
--O2
--Wall -g -o obj32/linkhuge_rw.o -c linkhuge_rw.c
-| i586-oe-linux-gcc  -m32 -march=i586 -Wl,-O1 -Wl,--hash-style=gnu
--Wl,--as-needed
---sysroot=/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86
--B./obj32
--Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,noexecstack -ldl
--L../obj32
--o obj32/linkhuge_rw -Wl,--no-as-needed -lpthread -ldl -lhugetlbfs_privutils
--Wl,--hugetlbfs-align obj32/linkhuge_rw.o obj32/testutils.o
-| i586-oe-linux-ld: internal error in do_write, at
-/home/jenkins/oe/world/shr-core/tmp-glibc/work/x86_64-oe-linux/binutils-cross-i586/2.25-r0/git/gold/output.cc:464
-| collect2: error: ld returned 1 exit status
-
-But, it works well with GNU linker. --hugetlbfs-align flag passes
-"-zcommon-page-size=$SLICE_SIZE -zmax-page-size=$SLICE_SIZE", that are supported by gold linker too.
-But, it looks gold linker deal with them in a different way from gnu linker for i586.
-
-The readelf shows the below result with GNU linker:
-
-Elf file type is EXEC (Executable file)
-Entry point 0x8048fbd
-There are 8 program headers, starting at offset 52
-
-Program Headers:
-  Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
-  PHDR           0x000034 0x08000034 0x08000034 0x00100 0x00100 R E 0x4
-  INTERP         0x048134 0x08048134 0x08048134 0x00013 0x00013 R   0x1
-      [Requesting program interpreter: /lib/ld-linux.so.2]
-  LOAD           0x000000 0x08000000 0x08000000 0x5a5bc 0x5a5bc R E 0x400000
-  LOAD           0x05a5bc 0x0845a5bc 0x0845a5bc 0x1028c 0x202cc RW 0x400000
-  DYNAMIC        0x05a5d0 0x0845a5d0 0x0845a5d0 0x000e8 0x000e8 RW  0x4
-  NOTE           0x048148 0x08048148 0x08048148 0x00044 0x00044 R   0x4
-  GNU_EH_FRAME   0x059e5c 0x08059e5c 0x08059e5c 0x0009c 0x0009c R   0x4
-  GNU_STACK      0x000000 0x00000000 0x00000000 0x00000 0x00000 RW  0x10
-
-"--relax" linker option doesn't solve this problem.
-Forced textsegment alignment to 0x08000000 with gold linker, the build will pass and
-readelf shows the same result with GNU linker:
-
-Elf file type is EXEC (Executable file)
-Entry point 0x8048fbd
-There are 8 program headers, starting at offset 52
-
-Program Headers:
-  Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
-  PHDR           0x000034 0x08000034 0x08000034 0x00100 0x00100 R E 0x4
-  INTERP         0x048134 0x08048134 0x08048134 0x00013 0x00013 R   0x1
-      [Requesting program interpreter: /lib/ld-linux.so.2]
-  LOAD           0x000000 0x08000000 0x08000000 0x5a5bc 0x5a5bc R E 0x400000
-  LOAD           0x05a5bc 0x0845a5bc 0x0845a5bc 0x1028c 0x202cc RW 0x400000
-  DYNAMIC        0x05a5d0 0x0845a5d0 0x0845a5d0 0x000e8 0x000e8 RW  0x4
-  NOTE           0x048148 0x08048148 0x08048148 0x00044 0x00044 R   0x4
-  GNU_EH_FRAME   0x059e5c 0x08059e5c 0x08059e5c 0x0009c 0x0009c R   0x4
-  GNU_STACK      0x000000 0x00000000 0x00000000 0x00000 0x00000 RW  0x10
-
-The fix just have impact on hugelink_rw test case, which needs --hugetlbfs-align flag.
-
-Signed-off-by: Yang Shi <yang.shi@linaro.org>
-Signed-off-by: Eric B Munson <emunson@mgebm.net>
----
- ld.hugetlbfs | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/ld.hugetlbfs b/ld.hugetlbfs
-index 4417442..32bc6fb 100755
---- a/ld.hugetlbfs
-+++ b/ld.hugetlbfs
-@@ -98,6 +98,7 @@ if [ "$HTLB_ALIGN" == "slice" ]; then
- 	# otherwise it will be NULL.
- 	case "$EMU" in
- 	armelf*_linux_eabi)	HTLBOPTS="$HTLBOPTS -Ttext-segment=$SLICE_SIZE" ;;
-+	elf_i386)		HTLBOPTS="$HTLBOPTS -Ttext-segment=0x08000000" ;;
- 	esac
- fi
- 
--- 
-2.0.2
-
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index 14c909e75..66fd8e21d 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -3,14 +3,14 @@ HOMEPAGE = "https://github.com/libhugetlbfs/libhugetlbfs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LGPL-2.1;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-DEPENDS = "sysfsutils perl"
-RDEPENDS_${PN} += "bash perl python python-io python-lang python-subprocess python-resource ${PN}-perl"
+DEPENDS = "sysfsutils"
+RDEPENDS_${PN} += "bash python python-io python-lang python-subprocess python-resource"
 RDEPENDS_${PN}-tests += "bash"
 
-PV = "2.20"
+PV = "2.21"
 PE = "1"
 
-SRCREV = "e44180072b796c0e28e53c4d01ef6279caaa2a99"
+SRCREV = "73d06e69108f231696e9c5c44f4b42690fc5d752"
 SRC_URI = " \
     git://github.com/libhugetlbfs/libhugetlbfs.git;protocol=https \
     file://skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch \
@@ -18,7 +18,6 @@ SRC_URI = " \
     file://tests-Makefile-install-static-4G-edge-testcases.patch \
     file://0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch \
     file://libhugetlbfs-elf_i386-avoid-search-host-library-path.patch \
-    file://Force-text-segment-alignment-to-0x08000000-for-i386-.patch \
     file://0001-include-stddef.h-for-ptrdiff_t.patch \
     file://0002-Mark-glibc-specific-code-so.patch \
     file://0003-alloc.c-Avoid-sysconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch \
@@ -51,14 +50,6 @@ do_configure() {
     if [ "${@bb.utils.filter('DISTRO_FEATURES', 'ld-is-gold', d)}" ]; then
       sed -i 's/CUSTOM_LDSCRIPTS = yes/CUSTOM_LDSCRIPTS = no/'  Makefile
     fi
-
-    # fixup perl module directory hardcoded to perl5
-    sed -i 's/perl5/perl/g'  Makefile
-
-    # fixup to install perl module under $(LIBDIR)/perl/${@get_perl_version(d)}/TLBC
-    # to avoid below error
-    # Can't locate TLBC/OpCollect.pm in @INC
-    sed -i '/^PMDIR/ s:perl:perl/${@get_perl_version(d)}:g' Makefile
 }
 
 do_install() {
@@ -69,11 +60,10 @@ do_install() {
 }
 
 
-PACKAGES =+ "${PN}-perl ${PN}-tests "
+PACKAGES =+ "${PN}-tests "
 FILES_${PN} += "${libdir}/*.so"
 FILES_${PN}-dev = "${includedir}"
 FILES_${PN}-dbg += "${libdir}/libhugetlbfs/tests/obj32/.debug ${libdir}/libhugetlbfs/tests/obj64/.debug"
-FILES_${PN}-perl = "${libdir}/perl"
 FILES_${PN}-tests += "${libdir}/libhugetlbfs/tests"
 
 INSANE_SKIP_${PN} = "dev-so"
-- 
2.17.1


