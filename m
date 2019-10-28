Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D537A7F9DA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 11:14:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 471sYX33Wqz5h
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 12:14:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572261271;
	bh=SlG6VFPjy/fTmRWzxDR4YhVoL49QRk04d6iCrsCjHXw=;
	h=From:To:Subject:Date:From;
	b=LSA4+eAydWp/XjO52fHdgDGbvbtaTcDs4j4I2jTm2ho8JntQ/rFOYdCW3NRt4oKWg
	YuqxkuGi7un4x/reDdLIT/6qudJjfuHcskCxmPXVllfVCrJgz/I0kY/2CGv4Phlc8J
	AjBMg3M7DRYNlDAREgWnZxeQC1tFgMSntGpGQtXX10SKAymqWCwdCumx/Jti2zo/rO
	RVQOpuB2O8507Tfq/IiHR+mSK/XCQy0V9/Y5HLiedxvB8TpfQCCNsA+If1fx/0cgyp
	7lU65taNLVUT+6hEVhWo0WiQkfEDAonOW5nvllUKZg8v4/QCsAYh8ZgVvEOmj4JjBX
	HztgwmoxX19GohSTuDAYz+Ih7z+1kVxsgsLhITyT/3gJKwTUDOEwqxspzJ4VIc1jaT
	rgwH7BGOKIn/hFNsHkwFmCWLODTttyHhgQpzaogASBdl1lz+9GVNmAn1tAw4pb8fzo
	jln7cIxBTF6yPcpC5wmn01aEGfzzG/NJ7E7gtz0NDPP4v1gIEkKiB5MzjJUrKk2Pa0
	XptdQxR7lyt7+GP0ft8RHtTKeFPXdEKpN9xqPnVdczh7Jy2RiJ3VYuKYan4EBM25ht
	3zS6tPUkxtlCxYs7xg6WBJ1QfJ4PWEqdNui6CG9akc3+HBWq57mtkLYICTu52tzhjz
	PCe5IlvH3/7rSWOlq4QlhKn0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Oct 2019 13:14:23 +0200
Message-Id: <20191028111423.31695-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-initramfs][PATCH] klibc: Upgrade 2.0.6 -> 2.0.7
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
X-List-Received-Date: Mon, 28 Oct 2019 11:14:33 -0000

Patches applied upstream removed.

Use the release tarball.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...01-Fix-missing-include-in-sys-mman.h.patch | 36 -------------------
 .../klibc/files/klibc-config-eabi.patch       | 23 ------------
 ...lcc-cross_2.0.6.bb => klcc-cross_2.0.7.bb} |  0
 ...s_2.0.6.bb => klibc-static-utils_2.0.7.bb} |  0
 ...bc-utils_2.0.6.bb => klibc-utils_2.0.7.bb} |  0
 .../recipes-devtools/klibc/klibc.inc          | 11 +++---
 .../klibc/{klibc_2.0.6.bb => klibc_2.0.7.bb}  |  0
 7 files changed, 6 insertions(+), 64 deletions(-)
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/files/0001-Fix-missing-include-in-sys-mman.h.patch
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/files/klibc-config-eabi.patch
 rename meta-initramfs/recipes-devtools/klibc/{klcc-cross_2.0.6.bb => klcc-cross_2.0.7.bb} (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-static-utils_2.0.6.bb => klibc-static-utils_2.0.7.bb} (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-utils_2.0.6.bb => klibc-utils_2.0.7.bb} (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc_2.0.6.bb => klibc_2.0.7.bb} (100%)

diff --git a/meta-initramfs/recipes-devtools/klibc/files/0001-Fix-missing-include-in-sys-mman.h.patch b/meta-initramfs/recipes-devtools/klibc/files/0001-Fix-missing-include-in-sys-mman.h.patch
deleted file mode 100644
index 4bedef805..000000000
--- a/meta-initramfs/recipes-devtools/klibc/files/0001-Fix-missing-include-in-sys-mman.h.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 36360b16833400de7818151be5588b16ac4fd5bc Mon Sep 17 00:00:00 2001
-From: Barret Rhoden <brho@google.com>
-Date: Thu, 14 Mar 2019 17:30:38 -0400
-Subject: [PATCH] Fix missing include in sys/mman.h
-
-Linux commit 746c9398f5ac ("arch: move common mmap flags to
-linux/mman.h") moved a few mmap flags, particularly MAP_PRIVATE, from
-asm/mman.h to linux/mman.h.  This broke klibc's build, which uses
-MAP_PRIVATE.
-
-linux/mman.h includes asm/mman.h, so this commit merely includes
-linux/mman.h instead of asm/mman.h.
-
-Signed-off-by: Barret Rhoden <brho@google.com>
-Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
----
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/libs/klibc/klibc.git/commit/?id=d4853d030639cf3542ae39129c18b654d8d4f020]
- usr/include/sys/mman.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/usr/include/sys/mman.h b/usr/include/sys/mman.h
-index 56f0b65c..3fd626e7 100644
---- a/usr/include/sys/mman.h
-+++ b/usr/include/sys/mman.h
-@@ -7,7 +7,7 @@
- 
- #include <klibc/extern.h>
- #include <sys/types.h>
--#include <asm/mman.h>
-+#include <linux/mman.h>
- 
- #define MAP_FAILED ((void *)-1)
- 
--- 
-2.23.0
-
diff --git a/meta-initramfs/recipes-devtools/klibc/files/klibc-config-eabi.patch b/meta-initramfs/recipes-devtools/klibc/files/klibc-config-eabi.patch
deleted file mode 100644
index a6998f86d..000000000
--- a/meta-initramfs/recipes-devtools/klibc/files/klibc-config-eabi.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 1118cc971917abe19ddb029aa80417f6fd6bb343 Mon Sep 17 00:00:00 2001
-From: Thomas Kunze <thommycheck@gmx.de>
-Date: Sat, 6 Aug 2011 05:30:14 +0000
-Subject: [PATCH] klibc: initial commit of version 1.5.24
-
-Patch was imported from the OpenEmbedded git server
-(git://git.openembedded.org/openembedded)
-as of commit id b6764cf32ec93547531130dca364fb95e1c495f4
-Signed-off-by: Thomas Kunze <thommycheck@gmx.de>
-
----
- defconfig | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/defconfig
-+++ b/defconfig
-@@ -6,5 +6,5 @@ CONFIG_KLIBC_ZLIB=y
- CONFIG_REGPARM=y
- # ARM options
- # CONFIG_KLIBC_THUMB is not set
--# CONFIG_AEABI is not set
-+CONFIG_AEABI=y
- # CONFIG_DEBUG_INFO is not set
diff --git a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.6.bb b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.7.bb
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.6.bb
rename to meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.7.bb
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.6.bb b/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.7.bb
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.6.bb
rename to meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.7.bb
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.6.bb b/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.7.bb
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.6.bb
rename to meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.7.bb
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 26689f87e..e1afe7f33 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -5,9 +5,8 @@ SECTION = "libs"
 LICENSE = "BSD-3-Clause & GPL-2.0 & MIT & Zlib"
 LIC_FILES_CHKSUM = "file://usr/klibc/LICENSE;md5=d75181f10e998c21eb147f6d2e43ce8b"
 DEPENDS = "linux-libc-headers perl-native"
-SRCREV = "22b36d1ae34416bc48869619cbb0cccb2070f48f"
 
-SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git \
+SRC_URI = "${KERNELORG_MIRROR}/linux/libs/klibc/2.0/klibc-${PV}.tar.xz \
            ${ARMPATCHES} \
            file://klcc-consider-sysroot.patch \
            file://klcc-cross-accept-clang-options.patch \
@@ -23,16 +22,18 @@ SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git \
            file://0001-klibc-add-getrandom-syscall.patch \
            file://0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch \
            file://0001-Define-ulocked_-fgets-fread-fwrite-aliases.patch \
-           file://0001-Fix-missing-include-in-sys-mman.h.patch \
            "
 
 ARMPATCHES ?= ""
 
-ARMPATCHES_arm = "file://klibc-config-eabi.patch \
+ARMPATCHES_arm = " \
                   file://armv4-fix-v4bx.patch \
                  "
 
-S = "${WORKDIR}/git"
+SRC_URI[md5sum] = "712f8bc1a069e03d92584b7f5380c521"
+SRC_URI[sha256sum] = "abef2637ca823485d9c90ce9512e2b08a65047ec4da204635eeaef95a41a9122"
+
+S = "${WORKDIR}/klibc-${PV}"
 
 OPTFLAGS = "${TUNE_CCARGS} -Os"
 OPTFLAGS_append_toolchain-clang = " -fno-builtin-bcmp"
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc_2.0.6.bb b/meta-initramfs/recipes-devtools/klibc/klibc_2.0.7.bb
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc_2.0.6.bb
rename to meta-initramfs/recipes-devtools/klibc/klibc_2.0.7.bb
-- 
2.17.1


