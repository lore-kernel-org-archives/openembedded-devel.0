Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4DC6860557
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Dec 2017 15:45:51 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id e137so16543224lfg.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Dec 2017 07:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=NbswQw4MIhJNmvq7dQC6w4Z8eGDRX2VLVZtdRkHZz8M=;
	b=hP58zVkBScSG7NJhYowVZiAbqn/pbaXJpZOPTEM+vm27tLtrUkwp3v6hb3UKUJ21Fv
	UXNE65TTP/+eaNW9NVrpLGQMPFtmLF21gStRn/aCH6FNsKg2wRafkASOv/HGSXMl2u1r
	VQkB4kTeW9UG9zDsd+P0GA99jz7V+L9HSIBPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NbswQw4MIhJNmvq7dQC6w4Z8eGDRX2VLVZtdRkHZz8M=;
	b=Vr7D0qYZd28FGEiGbFGIrtLeEhq4DJxavtVfdwCkN8iKgKsi+pBBXE/wAKKF7CvME5
	Jwpyt/Tmvgr0EynyhQIlnlf5BJBTK3fjOk78SmRYGTXWWHvYIjbMp+YS658Mz2ce8lOb
	MuwMhhWQKuoJbY/2BvxapyE4L0W5PrjrrPM05qVzjAqo8Lu6zTbD8lDcRCVBbqw/15Xr
	Nx+FQSDoJ+euotB6cmzcMWCz1eI2WGvKZ/bvYBDzFczOVip6uykup1BuFzO0lQMNwITm
	w8StfCQXszmtn47iyarAULyrLQs0UYGDH1QiFHqmGcYHiAVGZjHj998TAxr22FTbLaph
	AIfg==
X-Gm-Message-State: AJaThX7JeQKcAy/oTqKRvrWtULq3reo8i41S7Q3Qugnw6+0/gpazG8Sh
	ymlb1jy0sZeGrY0BG+IKqgKODHzNJDw=
X-Google-Smtp-Source: AGs4zMbEhk8zqtRSh2rbFtkTkBm9O8PuaK0pK4GUI6EZYoGuApmUgH9LdyE3FpHXXCTuUz46IjFXdw==
X-Received: by 10.46.21.7 with SMTP id s7mr17888921ljd.71.1512920751884;
	Sun, 10 Dec 2017 07:45:51 -0800 (PST)
Received: from localhost.localdomain (a91-156-68-101.elisa-laajakaista.fi.
	[91.156.68.101]) by smtp.gmail.com with ESMTPSA id
	g82sm2438549ljg.57.2017.12.10.07.45.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Dec 2017 07:45:50 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Dec 2017 17:45:48 +0200
Message-Id: <20171210154548.11747-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.15.1
Cc: naresh.kamboju@linaro.org, koen.kooi@linaro.org
Subject: [meta-oe][PATCH v2] libhugetlbfs: use next branch instead of master
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
X-List-Received-Date: Sun, 10 Dec 2017 15:45:52 -0000

Master hasn't been updated since 2 years (December 2015). Next branch
received some fixes/updates and is only 23 commits ahead of master.

Switch from master to next branch:
* update PV to include SRCPV and "+next" string
* update SRCREV
* update SRC_URI to use next branch
* drop Force-text-segment-alignment-to-0x08000000-for-i386-.patch which is
  a backported patch from next branch
* drop perl package. The perl scripts have been removed in
  https://github.com/libhugetlbfs/libhugetlbfs/commit/c3e5cb223798eca4e3297829a47d39bbcd73c527

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 ...segment-alignment-to-0x08000000-for-i386-.patch | 92 ----------------------
 .../libhugetlbfs/libhugetlbfs_git.bb               | 22 ++----
 2 files changed, 6 insertions(+), 108 deletions(-)
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
index a63494a62..91bdf114f 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -3,22 +3,21 @@ HOMEPAGE = "https://github.com/libhugetlbfs/libhugetlbfs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LGPL-2.1;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-DEPENDS = "sysfsutils perl"
-RDEPENDS_${PN} += "bash perl python python-io python-lang python-subprocess python-resource ${PN}-perl"
+DEPENDS = "sysfsutils"
+RDEPENDS_${PN} += "bash python python-io python-lang python-subprocess python-resource"
 RDEPENDS_${PN}-tests += "bash"
 
-PV = "2.20"
+PV = "2.20+git${SRCPV}+next"
 PE = "1"
 
-SRCREV = "e44180072b796c0e28e53c4d01ef6279caaa2a99"
+SRCREV = "02df38e93e25e07f4d54edae94fb4ec90b7a2824"
 SRC_URI = " \
-    git://github.com/libhugetlbfs/libhugetlbfs.git;protocol=https \
+    git://github.com/libhugetlbfs/libhugetlbfs.git;protocol=https;branch=next \
     file://skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch \
     file://libhugetlbfs-avoid-search-host-library-path-for-cros.patch \
     file://tests-Makefile-install-static-4G-edge-testcases.patch \
     file://0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch \
     file://libhugetlbfs-elf_i386-avoid-search-host-library-path.patch \
-    file://Force-text-segment-alignment-to-0x08000000-for-i386-.patch \
 "
 
 S = "${WORKDIR}/git"
@@ -43,14 +42,6 @@ do_configure() {
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
@@ -61,11 +52,10 @@ do_install() {
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
2.15.1


