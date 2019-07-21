Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id DC40D7EED4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 16:39:38 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id f17so12210925pfn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 09:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=58G5XTrPWfF6UAG7MokVrIBpvuCoAl7HQrknMm0aczM=;
	b=opNte6w7Twrrp5hNyWygyspDfz7jrzWTjJGIqaIh3ZWPgeXZK59jUHTW6hCux6+eMP
	/q8AXOHPM6HyclysEWtX6hq95av703bU6uMN+K/bOtraaEhWN2//jT9mjZ4iszz3dRWJ
	dxhlLZNYU/Zj6E0XEZLC6HGYI0Nzk6onIXQ5hAgWRaHLclo9GKyVy1C7Cb8swPh0ZVDo
	AL3MzcKT3grzRAG4U5mb8o9OqPeFLWnO1Lzz8KkeSMX4jZMz54fvlvQWYRAKZ+u3OUcG
	4m+BJwkikC4oHg84yFN2lYhL+l6Ol7wcORjs04dw8TIDJeAhVvUIHKb91roSn4v/Ai1W
	VxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=58G5XTrPWfF6UAG7MokVrIBpvuCoAl7HQrknMm0aczM=;
	b=N9HA5AqD3NA1uoiciPGtrcB7FufHfBoSlYbzwf4AHMKMuKWH458530qjxC/bJGerWP
	FenExc0t7VkYnf6Uuh8beCGqv0IF7bTKZHs7TH5fDsuwE0yUk6ZZTFu4aG9oDaCf/wsu
	4LsAxxAY1WrO+OUXKITqMtsESKOXxclYiW7ATwReLIQbbGrEafvfg70pz3pEnaVlmX2V
	PlhybzO4yxf+Z/Bi3uhvKI2U0oU804B7/k3LDxXO4SuEwdoKCHF5OHD98Ksw/tru6iqE
	99MgW+ewMtmaTLsJh5dnMxvfsPv3gqBw405106i45DKGcgudygvMlWQYddwVDUT+GDdT
	tWpQ==
X-Gm-Message-State: APjAAAWf7/nhrAb2VrqmnB12/JqBAyDHzZwrQFq14/5FxJEGyIUu4Fpf
	nZlq5NsIAH4wKTqlVjHADbSxmoKIptc=
X-Google-Smtp-Source: APXvYqywevI44I252kE5hVF1N79U/hb7lMV3sbEYhghm25ZBFNwcE65WypfiWFeW2/cZ0aR0Op0P2w==
X-Received: by 2002:a17:90a:bf02:: with SMTP id
	c2mr72800638pjs.73.1563727179391; 
	Sun, 21 Jul 2019 09:39:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	35sm38763285pgw.91.2019.07.21.09.39.38
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 21 Jul 2019 09:39:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jul 2019 09:39:19 -0700
Message-Id: <20190721163919.32659-14-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190721163919.32659-1-raj.khem@gmail.com>
References: <20190721163919.32659-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-initramfs][PATCH 14/14] kexec-tools-klibc: Refresh patch with no code change
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
X-List-Received-Date: Sun, 21 Jul 2019 16:39:39 -0000
Content-Transfer-Encoding: 8bit

Fixes
kexec-tools-klibc-2.0.18+gitAUTOINC+5750980cdb: Patch log indicates that patches do not apply cleanly. [patch-fuzz]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-force-static-build.patch             |  4 +-
 ...der-of-headers-to-fix-build-for-musl.patch |  2 +-
 .../0003-kexec-elf-rel-use-our-elf.h.patch    |  6 +--
 ...ec-elf-exec.c-replace-with-our-err.h.patch |  2 +-
 ...work-around-for-sysconf-_SC_NPROCESS.patch |  4 +-
 ...-work-around-missing-syscall-wrapper.patch | 13 ++----
 ...007-kexec.c-add-guard-around-ENOTSUP.patch |  8 ++--
 ...-kexec.c-replace-mising-BLKGETSIZE64.patch |  6 +--
 ...-dmesg.c-work-around-missing-imaxdiv.patch |  4 +-
 ...-fs2dt.c-work-around-missing-getline.patch |  2 +-
 ...011-purgatory-Makefile-adapt-to-klcc.patch | 10 ++--
 ...string.c-avoid-inclusion-of-string.h.patch |  5 +-
 ...256.h-avoid-inclusion-of-sys-types.h.patch |  5 +-
 .../0014-add-if_nameindex-from-musl.patch     | 14 +++---
 .../0015-vmcore-dmesg-fix-warning.patch       | 10 ++--
 .../140-mips_disable_devicetree_support.patch |  6 +--
 .../arm64-crashdump-arm64.c-fix-warning.patch |  8 ++--
 ...4.c-workaround-for-getrandom-syscall.patch | 11 ++---
 ...c-image-header.h-add-missing-le64toh.patch |  7 +--
 .../arm_crashdump-fix-buffer-align.patch      | 10 ++--
 .../kexec-tools-klibc/arm_crashdump.patch     |  4 +-
 .../kexec/kexec-tools-klibc/kexec-x32.patch   | 46 +++++++++++--------
 .../kexec-tools-klibc/klibc-reboot.patch      | 10 ++++
 ...gatory-Makefile-remove-unknown-flags.patch |  9 ++--
 ...powerpc_change-the-memory-size-limit.patch | 13 +++---
 .../kexec-tools-klibc/x86_basename.patch      |  4 +-
 .../kexec-tools-klibc/x86_kexec_test.patch    |  4 +-
 .../kexec/kexec-tools-klibc/x86_sys_io.patch  |  2 +-
 .../kexec/kexec-tools-klibc/x86_vfscanf.patch |  4 +-
 29 files changed, 110 insertions(+), 123 deletions(-)

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0001-force-static-build.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0001-force-static-build.patch
index 4744e7a35b..34826baed9 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0001-force-static-build.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0001-force-static-build.patch
@@ -1,4 +1,4 @@
-From d6af515cfcc8185f423860f80ff28719975b701f Mon Sep 17 00:00:00 2001
+From 2a62d7623e3d4c0eaa44434ab678274fe3a9edb1 Mon Sep 17 00:00:00 2001
 From: OpenEmbedded <oe.patch@oe>
 Date: Wed, 11 Apr 2018 22:51:00 +0200
 Subject: [PATCH] force static build
@@ -11,7 +11,7 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 54c206f..79188d8 100644
+index fb01134..dbf1fb6 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -47,7 +47,7 @@ TARGET_CFLAGS	= @TARGET_CFLAGS@
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0002-Adjust-the-order-of-headers-to-fix-build-for-musl.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0002-Adjust-the-order-of-headers-to-fix-build-for-musl.patch
index 1d96a2b3db..ec456f382b 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0002-Adjust-the-order-of-headers-to-fix-build-for-musl.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0002-Adjust-the-order-of-headers-to-fix-build-for-musl.patch
@@ -1,4 +1,4 @@
-From 0976d2d5be1ed44c2324b609c7d16c1e93181c4b Mon Sep 17 00:00:00 2001
+From 6843cefb1d1d0017a714a2752bb008efd844f3e4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 13 Jul 2017 16:20:08 -0700
 Subject: [PATCH] Adjust the order of headers to fix build for musl
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0003-kexec-elf-rel-use-our-elf.h.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0003-kexec-elf-rel-use-our-elf.h.patch
index ae9e7bbc48..32035ca128 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0003-kexec-elf-rel-use-our-elf.h.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0003-kexec-elf-rel-use-our-elf.h.patch
@@ -1,4 +1,4 @@
-From 7f91875d65778154709e4fa0ccb23f3b2a98b0dc Mon Sep 17 00:00:00 2001
+From 7e202ea55e8dd803278d9d1eac7ffd355344d6be Mon Sep 17 00:00:00 2001
 From: OpenEmbedded <oe.patch@oe>
 Date: Wed, 11 Apr 2018 22:51:00 +0200
 Subject: [PATCH] kexec-elf-rel: use our elf.h
@@ -56,7 +56,7 @@ index 1acbd86..a60c66c 100644
  #include "../../kexec-elf.h"
  
 diff --git a/kexec/arch/ppc64/kexec-elf-rel-ppc64.c b/kexec/arch/ppc64/kexec-elf-rel-ppc64.c
-index 5f8e3f2..765bf6e 100644
+index 51b1354..c85f421 100644
 --- a/kexec/arch/ppc64/kexec-elf-rel-ppc64.c
 +++ b/kexec/arch/ppc64/kexec-elf-rel-ppc64.c
 @@ -1,5 +1,5 @@
@@ -67,7 +67,7 @@ index 5f8e3f2..765bf6e 100644
  #include "../../kexec.h"
  #include "../../kexec-elf.h"
 diff --git a/kexec/arch/x86_64/kexec-elf-rel-x86_64.c b/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
-index 7fdde73..cd5d729 100644
+index db85b44..761a4ed 100644
 --- a/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
 +++ b/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
 @@ -1,5 +1,5 @@
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0004-kexec-elf-exec.c-replace-with-our-err.h.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0004-kexec-elf-exec.c-replace-with-our-err.h.patch
index 1080e8bb56..27a1cc7a56 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0004-kexec-elf-exec.c-replace-with-our-err.h.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0004-kexec-elf-exec.c-replace-with-our-err.h.patch
@@ -1,4 +1,4 @@
-From 8b9da93ac9a4ea79ae953f80f6fe6e4f080341f2 Mon Sep 17 00:00:00 2001
+From 720e24029fca7dcd8e1cd0b556f37aa1dc2b8fe8 Mon Sep 17 00:00:00 2001
 From: Andrea Adami <andrea.adami@gmail.com>
 Date: Tue, 17 Apr 2018 10:57:23 +0200
 Subject: [PATCH] kexec-elf-exec.c: replace with our elf.h
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0005-crashdump-elf.c-work-around-for-sysconf-_SC_NPROCESS.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0005-crashdump-elf.c-work-around-for-sysconf-_SC_NPROCESS.patch
index 4f7506d44c..4604c2a5b7 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0005-crashdump-elf.c-work-around-for-sysconf-_SC_NPROCESS.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0005-crashdump-elf.c-work-around-for-sysconf-_SC_NPROCESS.patch
@@ -1,4 +1,4 @@
-From 1cfee75d9662c3382bb7cb8f1c952333837598ae Mon Sep 17 00:00:00 2001
+From 43fb9cec1749b337bfa252fc2c1b0288847e8fa7 Mon Sep 17 00:00:00 2001
 From: Andrea Adami <andrea.adami@gmail.com>
 Date: Wed, 18 Apr 2018 02:21:30 +0200
 Subject: [PATCH] crashdump-elf.c: work around for _SC_NPROCESSORS_CONF
@@ -18,7 +18,7 @@ Upstream-Status: Inappropriate [klibc specific]
 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
 
 ---
- kexec/crashdump-elf.c | 92 +++++++++++++++++++++++++++++++++++++++++++++++++++
+ kexec/crashdump-elf.c | 92 +++++++++++++++++++++++++++++++++++++++++++
  1 file changed, 92 insertions(+)
 
 diff --git a/kexec/crashdump-elf.c b/kexec/crashdump-elf.c
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0006-kexec-syscall.h-work-around-missing-syscall-wrapper.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0006-kexec-syscall.h-work-around-missing-syscall-wrapper.patch
index 3020f767ad..a607ce777e 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0006-kexec-syscall.h-work-around-missing-syscall-wrapper.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0006-kexec-syscall.h-work-around-missing-syscall-wrapper.patch
@@ -1,4 +1,4 @@
-From 45a80fe7d247898d83edfeabe32b9de80a50a6be Mon Sep 17 00:00:00 2001
+From ab24f236cbc0aa8a3eadde5d71d9d7ea1d979a51 Mon Sep 17 00:00:00 2001
 From: Andrea Adami <andrea.adami@gmail.com>
 Date: Fri, 31 Aug 2018 11:33:51 +0200
 Subject: [PATCH] kexec-syscall.h: work around missing syscall() wrapper
@@ -16,10 +16,10 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
  1 file changed, 21 insertions(+)
 
 diff --git a/kexec/kexec-syscall.h b/kexec/kexec-syscall.h
-index 33638c2..204007d 100644
+index b96e02a..2a3794d 100644
 --- a/kexec/kexec-syscall.h
 +++ b/kexec/kexec-syscall.h
-@@ -74,11 +74,16 @@
+@@ -77,11 +77,16 @@
  
  struct kexec_segment;
  
@@ -36,7 +36,7 @@ index 33638c2..204007d 100644
  
  static inline int is_kexec_file_load_implemented(void) {
  	if (__NR_kexec_file_load != 0xffffffff)
-@@ -86,6 +91,21 @@ static inline int is_kexec_file_load_implemented(void) {
+@@ -89,6 +94,21 @@ static inline int is_kexec_file_load_implemented(void) {
  	return 0;
  }
  
@@ -58,7 +58,7 @@ index 33638c2..204007d 100644
  static inline long kexec_file_load(int kernel_fd, int initrd_fd,
  			unsigned long cmdline_len, const char *cmdline_ptr,
  			unsigned long flags)
-@@ -93,6 +113,7 @@ static inline long kexec_file_load(int kernel_fd, int initrd_fd,
+@@ -96,6 +116,7 @@ static inline long kexec_file_load(int kernel_fd, int initrd_fd,
  	return (long) syscall(__NR_kexec_file_load, kernel_fd, initrd_fd,
  				cmdline_len, cmdline_ptr, flags);
  }
@@ -66,6 +66,3 @@ index 33638c2..204007d 100644
  
  #define KEXEC_ON_CRASH		0x00000001
  #define KEXEC_PRESERVE_CONTEXT	0x00000002
--- 
-2.7.4
-
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0007-kexec.c-add-guard-around-ENOTSUP.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0007-kexec.c-add-guard-around-ENOTSUP.patch
index 3d44683936..0ae90016d0 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0007-kexec.c-add-guard-around-ENOTSUP.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0007-kexec.c-add-guard-around-ENOTSUP.patch
@@ -1,4 +1,4 @@
-From e6bd7a1bcfbd3e54efc81fbd7d60d915f9af0632 Mon Sep 17 00:00:00 2001
+From 17e9da8d3c3c69f84e11c0457bd9fb8c4ee4274b Mon Sep 17 00:00:00 2001
 From: Andrea Adami <andrea.adami@gmail.com>
 Date: Tue, 17 Apr 2018 11:35:14 +0200
 Subject: [PATCH] kexec.c: add guard around ENOTSUP
@@ -16,10 +16,10 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/kexec/kexec.c b/kexec/kexec.c
-index 313d9fe..b5a8a1e 100644
+index 32ae56c..0764e85 100644
 --- a/kexec/kexec.c
 +++ b/kexec/kexec.c
-@@ -1501,6 +1501,7 @@ int main(int argc, char *argv[])
+@@ -1517,6 +1517,7 @@ int main(int argc, char *argv[])
  					 */
  				case -EINVAL:
  				case -ENOEXEC:
@@ -27,7 +27,7 @@ index 313d9fe..b5a8a1e 100644
  					 /*
  					  * ENOTSUP can be unsupported image
  					  * type or unsupported PE signature
-@@ -1513,6 +1514,7 @@ int main(int argc, char *argv[])
+@@ -1529,6 +1530,7 @@ int main(int argc, char *argv[])
  					  * kernel bug
  					  */
  				case -ENOTSUP:
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0008-kexec.c-replace-mising-BLKGETSIZE64.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0008-kexec.c-replace-mising-BLKGETSIZE64.patch
index cfc51cf7f3..0ab7a1d71e 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0008-kexec.c-replace-mising-BLKGETSIZE64.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0008-kexec.c-replace-mising-BLKGETSIZE64.patch
@@ -1,4 +1,4 @@
-From 12c7b09c3152f2b3475d081691a26bd1a5633256 Mon Sep 17 00:00:00 2001
+From 30b61da180286643bea68b09b092744346011801 Mon Sep 17 00:00:00 2001
 From: Andrea Adami <andrea.adami@gmail.com>
 Date: Tue, 17 Apr 2018 11:38:42 +0200
 Subject: [PATCH] kexec.c: replace missing BLKGETSIZE64
@@ -16,10 +16,10 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/kexec/kexec.c b/kexec/kexec.c
-index b5a8a1e..7842f8b 100644
+index 0764e85..157c577 100644
 --- a/kexec/kexec.c
 +++ b/kexec/kexec.c
-@@ -54,6 +54,10 @@
+@@ -55,6 +55,10 @@
  #define KEXEC_LOADED_PATH "/sys/kernel/kexec_loaded"
  #define KEXEC_CRASH_LOADED_PATH "/sys/kernel/kexec_crash_loaded"
  
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0009-vmcore-dmesg.c-work-around-missing-imaxdiv.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0009-vmcore-dmesg.c-work-around-missing-imaxdiv.patch
index df980b118e..8bc473cb00 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0009-vmcore-dmesg.c-work-around-missing-imaxdiv.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0009-vmcore-dmesg.c-work-around-missing-imaxdiv.patch
@@ -1,4 +1,4 @@
-From ad598a71ffff6f86462211f252ac0c7b5de53869 Mon Sep 17 00:00:00 2001
+From 20e2c61fc04a291250acee649c2523d2546cedea Mon Sep 17 00:00:00 2001
 From: Andrea Adami <andrea.adami@gmail.com>
 Date: Tue, 17 Apr 2018 13:14:12 +0200
 Subject: [PATCH] vmcore-dmesg.c: work around missing imaxdiv()
@@ -18,7 +18,7 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
  1 file changed, 12 insertions(+), 1 deletion(-)
 
 diff --git a/vmcore-dmesg/vmcore-dmesg.c b/vmcore-dmesg/vmcore-dmesg.c
-index e340ef4..1b27b71 100644
+index 7972788..c63ac4f 100644
 --- a/vmcore-dmesg/vmcore-dmesg.c
 +++ b/vmcore-dmesg/vmcore-dmesg.c
 @@ -575,8 +575,11 @@ static void dump_dmesg_structured(int fd)
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0010-fs2dt.c-work-around-missing-getline.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0010-fs2dt.c-work-around-missing-getline.patch
index cff1485e5e..4652f10a6e 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0010-fs2dt.c-work-around-missing-getline.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0010-fs2dt.c-work-around-missing-getline.patch
@@ -1,4 +1,4 @@
-From edefda702d906d472ee7a675f6b506d5cfca7ac8 Mon Sep 17 00:00:00 2001
+From 14d4dbd293c75bc81a0dde6e678f9bbefb40b6f1 Mon Sep 17 00:00:00 2001
 From: Andrea Adami <andrea.adami@gmail.com>
 Date: Tue, 17 Apr 2018 13:48:25 +0200
 Subject: [PATCH] fs2dt.c: work around missing getline()
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0011-purgatory-Makefile-adapt-to-klcc.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0011-purgatory-Makefile-adapt-to-klcc.patch
index 636151bee9..5bbb178bc6 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0011-purgatory-Makefile-adapt-to-klcc.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0011-purgatory-Makefile-adapt-to-klcc.patch
@@ -1,16 +1,17 @@
-From 9b6866b106eb3ad11115bd591a23e65a68dd847d Mon Sep 17 00:00:00 2001
+From b6ebe05dc389b9457e3707401411fd075230b10e Mon Sep 17 00:00:00 2001
 From: Andrea Adami <andrea.adami@gmail.com>
 Date: Tue, 21 Aug 2018 16:31:44 +0200
-Subject: [PATCH 11/11] purgatory Makefile: adapt to klcc
+Subject: [PATCH] purgatory Makefile: adapt to klcc
 
 Upstream-Status: Inappropriate [klibc specific]
 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
 ---
  purgatory/Makefile | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/purgatory/Makefile b/purgatory/Makefile
-index 49ce80a..72eefaa 100644
+index 49ce80a..1542b3a 100644
 --- a/purgatory/Makefile
 +++ b/purgatory/Makefile
 @@ -47,7 +47,7 @@ purgatory/sha256.o: $(srcdir)/util_lib/sha256.c
@@ -33,6 +34,3 @@ index 49ce80a..72eefaa 100644
  			-Wl,-Map=$(PURGATORY_MAP)
  
  $(PURGATORY): $(PURGATORY_OBJS)
--- 
-2.7.4
-
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0012-purgatory-string.c-avoid-inclusion-of-string.h.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0012-purgatory-string.c-avoid-inclusion-of-string.h.patch
index 20934da898..db0d763178 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0012-purgatory-string.c-avoid-inclusion-of-string.h.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0012-purgatory-string.c-avoid-inclusion-of-string.h.patch
@@ -1,4 +1,4 @@
-From 2d2ad16f9328a7cbb3f5b8479ae93eb923a0727f Mon Sep 17 00:00:00 2001
+From 9bb386018257e1e18ffe0e925201946515b31080 Mon Sep 17 00:00:00 2001
 From: Andrea Adami <andrea.adami@gmail.com>
 Date: Thu, 19 Apr 2018 00:28:14 +0200
 Subject: [PATCH] purgatory/string.c: avoid inclusion of string.h
@@ -26,6 +26,3 @@ index f06c460..c5e978a 100644
  
  size_t strnlen(const char *s, size_t max)
  {
--- 
-2.7.4
-
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0013-sha256.h-avoid-inclusion-of-sys-types.h.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0013-sha256.h-avoid-inclusion-of-sys-types.h.patch
index 5d1664f76b..777cbcf94f 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0013-sha256.h-avoid-inclusion-of-sys-types.h.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0013-sha256.h-avoid-inclusion-of-sys-types.h.patch
@@ -1,4 +1,4 @@
-From ec6000b9f287e62cb0746e26cfa4372c7ea528f4 Mon Sep 17 00:00:00 2001
+From 60098810e1c04be677794bff6a3935011af98934 Mon Sep 17 00:00:00 2001
 From: Andrea Adami <andrea.adami@gmail.com>
 Date: Thu, 19 Apr 2018 23:26:43 +0200
 Subject: [PATCH] sha256.h: avoid inclusion of sys/types.h
@@ -31,6 +31,3 @@ index 467fb22..40fd3ed 100644
  #include <stdint.h>
  
  typedef struct
--- 
-2.7.4
-
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0014-add-if_nameindex-from-musl.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0014-add-if_nameindex-from-musl.patch
index ad21266987..f4d0d5d942 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0014-add-if_nameindex-from-musl.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0014-add-if_nameindex-from-musl.patch
@@ -1,7 +1,7 @@
-From b15e9610b4ab52c381e712241d50dea96d50d873 Mon Sep 17 00:00:00 2001
+From 04eec97b390621f2b3794b0d774b77429eb88cfd Mon Sep 17 00:00:00 2001
 From: Andrea Adami <andrea.adami@gmail.com>
 Date: Wed, 2 May 2018 23:14:19 +0200
-Subject: [PATCH 14/14] add if_nameindex from musl
+Subject: [PATCH] add if_nameindex from musl
 
 Taken from musl, minimal changes.
 klibc lacks struct and func
@@ -20,10 +20,11 @@ to fix :
  #define __bitwise __bitwise__
 
 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
 ---
  kexec/Makefile       |  2 +-
- kexec/if_nameindex.c | 64 ++++++++++++++++++++++++++++++++++++++++++++++++++++
- kexec/if_nameindex.h | 15 ++++++++++++
+ kexec/if_nameindex.c | 64 ++++++++++++++++++++++++++++++++++++++++++++
+ kexec/if_nameindex.h | 15 +++++++++++
  kexec/ifdown.c       |  3 +++
  4 files changed, 83 insertions(+), 1 deletion(-)
  create mode 100644 kexec/if_nameindex.c
@@ -114,7 +115,7 @@ index 0000000..e586e41
 +}
 diff --git a/kexec/if_nameindex.h b/kexec/if_nameindex.h
 new file mode 100644
-index 0000000..1725fbd
+index 0000000..cf1c061
 --- /dev/null
 +++ b/kexec/if_nameindex.h
 @@ -0,0 +1,15 @@
@@ -147,6 +148,3 @@ index 82c6141..cc3ca9f 100644
  
  /*
   *  First, we find all shaper devices and down them. Then we
--- 
-2.7.4
-
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0015-vmcore-dmesg-fix-warning.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0015-vmcore-dmesg-fix-warning.patch
index 0b88b94c6e..9b8107aedc 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0015-vmcore-dmesg-fix-warning.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0015-vmcore-dmesg-fix-warning.patch
@@ -1,17 +1,18 @@
-From 3294266c6a875c5009065c1ae5d0b86200c4147c Mon Sep 17 00:00:00 2001
+From a2679731a56748de58a4cf0a46b7a15d75543a88 Mon Sep 17 00:00:00 2001
 From: Andrea Adami <andrea.adami@gmail.com>
 Date: Sun, 29 Apr 2018 00:52:31 +0200
-Subject: [PATCH 6/6] vmcore-dmesg: fix warning
+Subject: [PATCH] vmcore-dmesg: fix warning
 
  # define __bitwise
 
 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
 ---
  vmcore-dmesg/vmcore-dmesg.c | 3 +++
  1 file changed, 3 insertions(+)
 
 diff --git a/vmcore-dmesg/vmcore-dmesg.c b/vmcore-dmesg/vmcore-dmesg.c
-index e340ef4..91e4789 100644
+index c63ac4f..a4e3014 100644
 --- a/vmcore-dmesg/vmcore-dmesg.c
 +++ b/vmcore-dmesg/vmcore-dmesg.c
 @@ -2,6 +2,9 @@
@@ -24,6 +25,3 @@ index e340ef4..91e4789 100644
  #include <endian.h>
  #include <byteswap.h>
  #include <stdio.h>
--- 
-2.7.4
-
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/140-mips_disable_devicetree_support.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/140-mips_disable_devicetree_support.patch
index b3ef3c82d1..bd728ccb49 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/140-mips_disable_devicetree_support.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/140-mips_disable_devicetree_support.patch
@@ -1,4 +1,4 @@
-From 5ea7cd78cd252ffd3a9f3fbc8dc795d6e1596084 Mon Sep 17 00:00:00 2001
+From 7bd94a64cd5424e74ad49dbda65a15e83670268f Mon Sep 17 00:00:00 2001
 From: Andrea Adami <andrea.adami@gmail.com>
 Date: Mon, 17 Dec 2018 11:25:20 +0100
 Subject: [PATCH] kexec-tools: fix non-device tree devices on mips
@@ -14,6 +14,7 @@ Removed ppc change (unwanted ?)
 
 Signed-off-by: Konstantin Kuzov <master.nosferatu@gmail.com>
 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
 ---
  kexec/arch/mips/include/arch/options.h |  4 +-
  kexec/arch/mips/kexec-elf-mips.c       | 58 ++++++++++++++------------
@@ -158,6 +159,3 @@ index 222c815..90b21c3 100644
  };
  
  extern struct memory_ranges usablemem_rgns;
--- 
-2.17.1
-
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64-crashdump-arm64.c-fix-warning.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64-crashdump-arm64.c-fix-warning.patch
index 24be4dd76d..c2418d8fa0 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64-crashdump-arm64.c-fix-warning.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64-crashdump-arm64.c-fix-warning.patch
@@ -1,7 +1,7 @@
-From 6f69f489a442b3a192e4c08748ee8c4d31c75dae Mon Sep 17 00:00:00 2001
+From 3fd4db2ce1710f45eb297ae6b2c10726b33204f3 Mon Sep 17 00:00:00 2001
 From: Andrea Adami <andrea.adami@gmail.com>
 Date: Sun, 29 Apr 2018 00:46:16 +0200
-Subject: [PATCH 5/6] arm64: crashdump-arm64.c: fix warning
+Subject: [PATCH] arm64: crashdump-arm64.c: fix warning
 
                  from ../git/kexec/kexec.h:6,
                  from ../git/kexec/arch/arm64/crashdump-arm64.c:18:
@@ -11,6 +11,7 @@ ng: "__bitwise" redefined
  # define __bitwise
 
 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
 ---
  kexec/arch/arm64/crashdump-arm64.c | 3 +++
  1 file changed, 3 insertions(+)
@@ -29,6 +30,3 @@ index 4fd7aa8..890d88f 100644
  #include <linux/elf.h>
  
  #include "kexec.h"
--- 
-2.7.4
-
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64_kexec-arm64.c-workaround-for-getrandom-syscall.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64_kexec-arm64.c-workaround-for-getrandom-syscall.patch
index b22ac3aca4..df7b0a7782 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64_kexec-arm64.c-workaround-for-getrandom-syscall.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64_kexec-arm64.c-workaround-for-getrandom-syscall.patch
@@ -1,4 +1,4 @@
-From 10afeecd10499fbd64b2c68d3b076c6906df441f Mon Sep 17 00:00:00 2001
+From a99fc685214452aedabf9ac105bb99357006aa26 Mon Sep 17 00:00:00 2001
 From: Andrea Adami <andrea.adami@gmail.com>
 Date: Wed, 5 Sep 2018 17:07:48 +0200
 Subject: [PATCH] kexec-arm64.c: workaround for getrandom() syscall
@@ -15,15 +15,15 @@ and
 | ../git/kexec/arch/arm64/kexec-arm64.c:499:12: warning: implicit declaration of function 'getrandom'; did you mean 'srandom'? [-Wimplicit-function-declaration]
 |    result = getrandom(&fdt_val64,
 
-
 Upstream-Status: Inappropriate [klibc specific]
 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
 ---
  kexec/arch/arm64/kexec-arm64.c | 12 +++++++++++-
  1 file changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/kexec/arch/arm64/kexec-arm64.c b/kexec/arch/arm64/kexec-arm64.c
-index 7a12479..8a7f5c5 100644
+index b143e86..88d4168 100644
 --- a/kexec/arch/arm64/kexec-arm64.c
 +++ b/kexec/arch/arm64/kexec-arm64.c
 @@ -16,7 +16,11 @@
@@ -54,8 +54,5 @@ index 7a12479..8a7f5c5 100644
 +				GRND_NONBLOCK);
 +#endif
  		if(result == -1) {
- 			dbgprintf("%s: Reading random bytes failed.\n",
+ 			fprintf(stderr, "%s: Reading random bytes failed.\n",
  					__func__);
--- 
-2.7.4
-
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64_kexec-image-header.h-add-missing-le64toh.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64_kexec-image-header.h-add-missing-le64toh.patch
index 7decbac4fb..cdcecdf41e 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64_kexec-image-header.h-add-missing-le64toh.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64_kexec-image-header.h-add-missing-le64toh.patch
@@ -1,7 +1,7 @@
-From af7d06a753a4c377b7ffe587da67a6ba56048bea Mon Sep 17 00:00:00 2001
+From c5e7928217ee73640d25c6471c4619601cb1ba19 Mon Sep 17 00:00:00 2001
 From: Andrea Adami <andrea.adami@gmail.com>
 Date: Thu, 19 Apr 2018 10:47:17 +0200
-Subject: [PATCH 2/2] kexec/arm64: image-header.h: add macro for le64toh
+Subject: [PATCH] kexec/arm64: image-header.h: add macro for le64toh
 
 Fix
 
@@ -35,6 +35,3 @@ index 158d411..10ed2d6 100644
  /**
   * struct arm64_image_header - arm64 kernel image header.
   *
--- 
-2.7.4
-
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm_crashdump-fix-buffer-align.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm_crashdump-fix-buffer-align.patch
index c6afdfae71..5323a81e6b 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm_crashdump-fix-buffer-align.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm_crashdump-fix-buffer-align.patch
@@ -1,15 +1,16 @@
-From 06b0d43c20f7c6200902d4c6db3d33416877f71c Mon Sep 17 00:00:00 2001
+From edf186f45d543e318400195cc25175387ff3f5c4 Mon Sep 17 00:00:00 2001
 From: Andrea Adami <andrea.adami@gmail.com>
 Date: Sun, 26 Aug 2018 21:40:06 +0200
-Subject: [PATCH 1/1] arm- backport from oe-core
+Subject: [PATCH] arm- backport from oe-core
 
 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
 ---
  kexec/arch/arm/crashdump-arm.c | 5 ++++-
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/kexec/arch/arm/crashdump-arm.c b/kexec/arch/arm/crashdump-arm.c
-index 2530b29..af2600d 100644
+index daa4788..3f72b38 100644
 --- a/kexec/arch/arm/crashdump-arm.c
 +++ b/kexec/arch/arm/crashdump-arm.c
 @@ -240,6 +240,7 @@ int load_crashdump_segments(struct kexec_info *info, char *mod_cmdline)
@@ -39,6 +40,3 @@ index 2530b29..af2600d 100644
  					  crash_kernel_mem.start,
  					  crash_kernel_mem.end, -1, 0);
  
--- 
-2.7.4
-
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm_crashdump.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm_crashdump.patch
index 95962636e5..2d1d64db1c 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm_crashdump.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm_crashdump.patch
@@ -1,4 +1,4 @@
-From 6dae4752a53973c152b3e91e8a4ca74a486dae8b Mon Sep 17 00:00:00 2001
+From 8ee92bc915d650e188caaa3df0a798ac2002f64e Mon Sep 17 00:00:00 2001
 From: OpenEmbedded <oe.patch@oe>
 Date: Wed, 11 Apr 2018 22:51:00 +0200
 Subject: [PATCH] use our elf.h header
@@ -17,7 +17,7 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/kexec/arch/arm/crashdump-arm.c b/kexec/arch/arm/crashdump-arm.c
-index daa4788..2530b29 100644
+index 3f72b38..af2600d 100644
 --- a/kexec/arch/arm/crashdump-arm.c
 +++ b/kexec/arch/arm/crashdump-arm.c
 @@ -21,7 +21,7 @@
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/kexec-x32.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/kexec-x32.patch
index 26d18eb6fe..3c2594a5d0 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/kexec-x32.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/kexec-x32.patch
@@ -1,4 +1,10 @@
-x86_64: Add support to build kexec-tools with x32 ABI
+From fd40eee42273220fb0050fe10744b10067adc0a7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
+Date: Fri, 31 Aug 2018 17:31:50 +0200
+Subject: [PATCH] x86_64: Add support to build kexec-tools with x32 ABI
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
 Summary of changes,
 
@@ -21,11 +27,11 @@ Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
  purgatory/arch/x86_64/Makefile           | 4 +++-
  4 files changed, 20 insertions(+), 1 deletion(-)
 
-Index: kexec-tools-2.0.10/configure.ac
-===================================================================
---- kexec-tools-2.0.10.orig/configure.ac
-+++ kexec-tools-2.0.10/configure.ac
-@@ -56,6 +56,15 @@ case $target_cpu in
+diff --git a/configure.ac b/configure.ac
+index e05d601..c428146 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -54,6 +54,15 @@ case $target_cpu in
  		;;
  	ia64|x86_64|alpha|m68k )
  		ARCH="$target_cpu"
@@ -41,11 +47,11 @@ Index: kexec-tools-2.0.10/configure.ac
  		;;
  	* )
  		AC_MSG_ERROR([unsupported architecture $target_cpu])
-Index: kexec-tools-2.0.10/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
-===================================================================
---- kexec-tools-2.0.10.orig/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
-+++ kexec-tools-2.0.10/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
-@@ -8,7 +8,11 @@ int machine_verify_elf_rel(struct mem_eh
+diff --git a/kexec/arch/x86_64/kexec-elf-rel-x86_64.c b/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
+index 761a4ed..1c0e3f8 100644
+--- a/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
++++ b/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
+@@ -8,7 +8,11 @@ int machine_verify_elf_rel(struct mem_ehdr *ehdr)
  	if (ehdr->ei_data != ELFDATA2LSB) {
  		return 0;
  	}
@@ -57,10 +63,10 @@ Index: kexec-tools-2.0.10/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
  		return 0;
  	}
  	if (ehdr->e_machine != EM_X86_64) {
-Index: kexec-tools-2.0.10/kexec/kexec-syscall.h
-===================================================================
---- kexec-tools-2.0.10.orig/kexec/kexec-syscall.h
-+++ kexec-tools-2.0.10/kexec/kexec-syscall.h
+diff --git a/kexec/kexec-syscall.h b/kexec/kexec-syscall.h
+index 2a3794d..3e67078 100644
+--- a/kexec/kexec-syscall.h
++++ b/kexec/kexec-syscall.h
 @@ -31,8 +31,12 @@
  #define __NR_kexec_load		268
  #endif
@@ -74,11 +80,11 @@ Index: kexec-tools-2.0.10/kexec/kexec-syscall.h
  #ifdef __s390x__
  #define __NR_kexec_load		277
  #endif
-Index: kexec-tools-2.0.10/purgatory/arch/x86_64/Makefile
-===================================================================
---- kexec-tools-2.0.10.orig/purgatory/arch/x86_64/Makefile
-+++ kexec-tools-2.0.10/purgatory/arch/x86_64/Makefile
-@@ -23,4 +23,6 @@ x86_64_PURGATORY_SRCS += purgatory/arch/
+diff --git a/purgatory/arch/x86_64/Makefile b/purgatory/arch/x86_64/Makefile
+index 7300937..4af11e4 100644
+--- a/purgatory/arch/x86_64/Makefile
++++ b/purgatory/arch/x86_64/Makefile
+@@ -23,4 +23,6 @@ x86_64_PURGATORY_SRCS += purgatory/arch/i386/console-x86.c
  x86_64_PURGATORY_SRCS += purgatory/arch/i386/vga.c
  x86_64_PURGATORY_SRCS += purgatory/arch/i386/pic.c
  
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/klibc-reboot.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/klibc-reboot.patch
index be1301df68..6497fb4160 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/klibc-reboot.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/klibc-reboot.patch
@@ -1,3 +1,13 @@
+From 9c99b0748dd0ea1aaf3836378ee75fa5af099a19 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 15 Mar 2019 00:22:40 -0700
+
+---
+ kexec/kexec.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/kexec/kexec.c b/kexec/kexec.c
+index 157c577..5da0d67 100644
 --- a/kexec/kexec.c
 +++ b/kexec/kexec.c
 @@ -901,7 +901,7 @@ static int my_exec(void)
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/powerpc-purgatory-Makefile-remove-unknown-flags.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/powerpc-purgatory-Makefile-remove-unknown-flags.patch
index c3b2071bcd..8fb9f443aa 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/powerpc-purgatory-Makefile-remove-unknown-flags.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/powerpc-purgatory-Makefile-remove-unknown-flags.patch
@@ -1,8 +1,7 @@
-From 709dfe457c07aa0275f3da14634cbce5cf1029dc Mon Sep 17 00:00:00 2001
+From 3683b3f3e318fa711f6018f154d950c51d5b597a Mon Sep 17 00:00:00 2001
 From: Andrea Adami <andrea.adami@gmail.com>
 Date: Thu, 19 Apr 2018 19:26:53 +0200
-Subject: [PATCH 3/3] powerpc/purgatory: Makefile: remove unknown flags for
- powerpc
+Subject: [PATCH] powerpc/purgatory: Makefile: remove unknown flags for powerpc
 
 Fix
 
@@ -12,6 +11,7 @@ Fix
 
 Upstream-Status: Inappropriate [klibc specific]
 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
 ---
  purgatory/arch/ppc/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -29,6 +29,3 @@ index c85c58a..cd44a16 100644
  
  dist += purgatory/arch/ppc/Makefile $(ppc_PURGATORY_SRCS)		\
  	purgatory/arch/ppc/purgatory-ppc.h purgatory/arch/ppc/ppc_asm.h
--- 
-2.7.4
-
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/powerpc_change-the-memory-size-limit.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/powerpc_change-the-memory-size-limit.patch
index dc97d930e9..67a3cac1fa 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/powerpc_change-the-memory-size-limit.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/powerpc_change-the-memory-size-limit.patch
@@ -1,4 +1,4 @@
-From b19b68eab567aa534cf8dec79fe18e3dc0e14043 Mon Sep 17 00:00:00 2001
+From 6fec72bd7264478c214169b0f30f649304bd39ea Mon Sep 17 00:00:00 2001
 From: Quanyang Wang <quanyang.wang@windriver.com>
 Date: Tue, 16 Jun 2015 12:59:57 +0800
 Subject: [PATCH] powerpc: change the memory size limit
@@ -16,15 +16,16 @@ locate_hole failed
 Upstream-Status: Pending
 
 Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
+
 ---
  kexec/arch/ppc/kexec-ppc.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: kexec-tools-2.0.10/kexec/arch/ppc/kexec-ppc.h
-===================================================================
---- kexec-tools-2.0.10.orig/kexec/arch/ppc/kexec-ppc.h
-+++ kexec-tools-2.0.10/kexec/arch/ppc/kexec-ppc.h
-@@ -42,7 +42,7 @@ void dol_ppc_usage(void);
+diff --git a/kexec/arch/ppc/kexec-ppc.h b/kexec/arch/ppc/kexec-ppc.h
+index 04e728e..6bae9ec 100644
+--- a/kexec/arch/ppc/kexec-ppc.h
++++ b/kexec/arch/ppc/kexec-ppc.h
+@@ -44,7 +44,7 @@ void dol_ppc_usage(void);
   * During inital setup the kernel does not map the whole memory but a part of
   * it. On Book-E that is 64MiB, 601 24MiB or 256MiB (if possible).
   */
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_basename.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_basename.patch
index 0d0ed23c90..568f19758a 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_basename.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_basename.patch
@@ -1,4 +1,4 @@
-From 5f47c30759684cea9a7a409646686c1a358b78ac Mon Sep 17 00:00:00 2001
+From 7823956149c78e1996c567d1965803456df090f8 Mon Sep 17 00:00:00 2001
 From: OpenEmbedded <oe.patch@oe>
 Date: Wed, 11 Apr 2018 22:51:05 +0200
 Subject: [PATCH] replace basename() with sscanf()
@@ -13,7 +13,7 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/kexec/arch/i386/x86-linux-setup.c b/kexec/arch/i386/x86-linux-setup.c
-index 6c7d260..7850083 100644
+index 6cda12c..5514c1c 100644
 --- a/kexec/arch/i386/x86-linux-setup.c
 +++ b/kexec/arch/i386/x86-linux-setup.c
 @@ -304,9 +304,9 @@ static int add_edd_entry(struct x86_linux_param_header *real_mode,
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_kexec_test.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_kexec_test.patch
index 1c471f5593..ecb0d85e26 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_kexec_test.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_kexec_test.patch
@@ -1,4 +1,4 @@
-From 9de68ec5af8db2eff352f12da28145fe5e96244d Mon Sep 17 00:00:00 2001
+From e26fe77b0ac9acc2c8086586d267aa7160969d2d Mon Sep 17 00:00:00 2001
 From: OpenEmbedded <oe.patch@oe>
 Date: Wed, 11 Apr 2018 22:51:05 +0200
 Subject: [PATCH] do not build test
@@ -14,7 +14,7 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index fb01134..440730d 100644
+index dbf1fb6..440730d 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -173,8 +173,8 @@ PSRCS:=$(foreach s, $(SRCS), $(PACKAGE_NAME)-$(PACKAGE_VERSION)/$(s))
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_sys_io.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_sys_io.patch
index 493f298a99..ef9a411b5c 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_sys_io.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_sys_io.patch
@@ -1,4 +1,4 @@
-From a992ee014efacdc98d5658be9930dcab0eaadfd7 Mon Sep 17 00:00:00 2001
+From 444160260a11022ecd84cd605fe8c22b316e6546 Mon Sep 17 00:00:00 2001
 From: OpenEmbedded <oe.patch@oe>
 Date: Wed, 11 Apr 2018 22:51:04 +0200
 Subject: [PATCH] i386: replace with our io.h
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_vfscanf.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_vfscanf.patch
index 2f0ad2ea45..af8467a239 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_vfscanf.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_vfscanf.patch
@@ -1,4 +1,4 @@
-From 423c3f6f41fe04f4512e2a97a130f072d53dd4cf Mon Sep 17 00:00:00 2001
+From c6934455ec2337e6da7ea9fbc3486ce9beeb5d82 Mon Sep 17 00:00:00 2001
 From: OpenEmbedded <oe.patch@oe>
 Date: Wed, 11 Apr 2018 22:51:05 +0200
 Subject: [PATCH] x86-linux-setup.c: replace vfscanf() with vsscanf()
@@ -13,7 +13,7 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
  1 file changed, 10 insertions(+), 1 deletion(-)
 
 diff --git a/kexec/arch/i386/x86-linux-setup.c b/kexec/arch/i386/x86-linux-setup.c
-index 7850083..e190356 100644
+index 5514c1c..bdb28c6 100644
 --- a/kexec/arch/i386/x86-linux-setup.c
 +++ b/kexec/arch/i386/x86-linux-setup.c
 @@ -200,6 +200,8 @@ static int file_scanf(const char *dir, const char *file, const char *scanf_line,
-- 
2.22.0


