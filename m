Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B27E95A85
	for <webhook@archiver.kernel.org>; Sun,  8 Oct 2023 00:39:44 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.29710.1696725574346882063
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Oct 2023 17:39:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VW5Vh7Ft;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-691c05bc5aaso3052657b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Oct 2023 17:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696725573; x=1697330373; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kEEJLegClXJafUhBJPMIW7wkMe9BKrR6JCFDdwsvSQ8=;
        b=VW5Vh7Ftg2K49p060L+It5uui0y31z7gfSjWfPvf3rtogs1iGzZPqZYIRk2gMv5V1l
         VJonAYUbkfUxgcuh8KttIRYYXVw4bgJcrVk2DGcRHkLQgiGz4erwa4NZ7sAgxSGS4359
         JKKR3UOHMYPBqppU3WX47HgvANQCXoZGjdcdlcR8+2WGu/oNf7pk/Rvi4nOlje2J7Tq+
         SLZCiGsf2d8q1VuYf1ydQlGedZOU8vzsIftctZxs1Zd44E496yNv1FpqYmlYfpa9Ehso
         AjWxJ12eFmTKR0xUumWJigM5/dNoHskRySPJKIpl4UZai7Q5TJBdpMS/cTpfOUfbCNHZ
         V7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696725573; x=1697330373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kEEJLegClXJafUhBJPMIW7wkMe9BKrR6JCFDdwsvSQ8=;
        b=RuCMQfVO5SLzk9Fss9KpwF4d2JyjanPvjnhPR6iZJBsj5DjPYcEIswADOzQWuZYdpy
         AZNuMNnpil41snFLUX9Yjl7cNClrchGE1IDDwflUQ87ZX7XdiLQjF2NE6yCU8WOvCSX+
         rqdyaqOkm0qu0huQbAqv7rg0x54+vzd470Qdgtmya6da2Dz2c34YMqIEddfDpQX2hOvA
         XihJdfxOwxmzsj75pxHlka+a36wx1t97qHQ9KUJXhjEEwaR6uMH8JnKJ44YXzLCUBs/I
         biBHXIaojH1bVj0q3b3pptSjhJOp2Y4IMb85eUKHkfDOR7xpJar8lsxcJvveYqVR10rO
         zaDA==
X-Gm-Message-State: AOJu0Yxls7WwYqC/tKa+ySgETzOoID4JD7RSPtf/PzbKWh9PScz1yRB6
	/k7p7tJ+xo6Ee9QGYDHvRyVgbMYYrzDGhw==
X-Google-Smtp-Source: AGHT+IEURRkwAktY3DQ8LLcsdy9oeDWx+YJJqxT8KK1DuRWB15b8xIvT6ttEcIzZgayn7+txb8IFAg==
X-Received: by 2002:a05:6a00:1248:b0:690:2ecd:a597 with SMTP id u8-20020a056a00124800b006902ecda597mr14397961pfi.21.1696725573275;
        Sat, 07 Oct 2023 17:39:33 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::7f07])
        by smtp.gmail.com with ESMTPSA id w19-20020a1709029a9300b001c739768214sm6498259plp.92.2023.10.07.17.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 17:39:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-initramfs][PATCH] klibc: Upgrade to 2.0.13 release
Date: Sat,  7 Oct 2023 17:39:30 -0700
Message-ID: <20231008003930.2518866-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Oct 2023 00:39:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105382

Drop backported patch and refresh others as needed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...failure-for-some-architectures-with-.patch | 34 -------------------
 ...libc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch |  6 ++--
 .../klibc/files/armv4-fix-v4bx.patch          |  4 +--
 ...c-cross_2.0.10.bb => klcc-cross_2.0.13.bb} |  0
 ...2.0.10.bb => klibc-static-utils_2.0.13.bb} |  0
 ...-utils_2.0.10.bb => klibc-utils_2.0.13.bb} |  0
 .../recipes-devtools/klibc/klibc.inc          |  3 +-
 .../{klibc_2.0.10.bb => klibc_2.0.13.bb}      |  0
 8 files changed, 6 insertions(+), 41 deletions(-)
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/files/0001-fcntl-Fix-build-failure-for-some-architectures-with-.patch
 rename meta-initramfs/recipes-devtools/klibc/{klcc-cross_2.0.10.bb => klcc-cross_2.0.13.bb} (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-static-utils_2.0.10.bb => klibc-static-utils_2.0.13.bb} (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-utils_2.0.10.bb => klibc-utils_2.0.13.bb} (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc_2.0.10.bb => klibc_2.0.13.bb} (100%)

diff --git a/meta-initramfs/recipes-devtools/klibc/files/0001-fcntl-Fix-build-failure-for-some-architectures-with-.patch b/meta-initramfs/recipes-devtools/klibc/files/0001-fcntl-Fix-build-failure-for-some-architectures-with-.patch
deleted file mode 100644
index 4fc4b45fb1..0000000000
--- a/meta-initramfs/recipes-devtools/klibc/files/0001-fcntl-Fix-build-failure-for-some-architectures-with-.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From a33c262f828f803fffdad8e1f44d524dc9c75856 Mon Sep 17 00:00:00 2001
-From: Ben Hutchings <ben@decadent.org.uk>
-Date: Wed, 3 Aug 2022 01:10:01 +0200
-Subject: [PATCH] fcntl: Fix build failure for some architectures with Linux
- 5.19
-
-Starting from Linux 5.19, the kernel UAPI headers now only define
-__ARCH_FLOCK64_PAD if the architecture actually needs padding in
-struct flock64.  Wrap its use with #ifdef,
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/libs/klibc/klibc.git/commit/?id=bb2fde5ddbc18a2e7795ca4d24759230c2aae9d0]
-Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- usr/include/fcntl.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/usr/include/fcntl.h b/usr/include/fcntl.h
-index ed703a6..cb2e4e5 100644
---- a/usr/include/fcntl.h
-+++ b/usr/include/fcntl.h
-@@ -33,7 +33,9 @@ struct flock {
- 	__kernel_loff_t l_start;
- 	__kernel_loff_t l_len;
- 	__kernel_pid_t  l_pid;
-+#ifdef __ARCH_FLOCK64_PAD
-         __ARCH_FLOCK64_PAD
-+#endif
- };
- 
- #ifdef F_GETLK64
--- 
-2.37.2
-
diff --git a/meta-initramfs/recipes-devtools/klibc/files/0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch b/meta-initramfs/recipes-devtools/klibc/files/0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch
index 15b5144e44..e4ae3728a4 100644
--- a/meta-initramfs/recipes-devtools/klibc/files/0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch
+++ b/meta-initramfs/recipes-devtools/klibc/files/0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch
@@ -14,8 +14,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 --- a/usr/klibc/Kbuild
 +++ b/usr/klibc/Kbuild
-@@ -183,7 +183,8 @@ $(SOHASH): $(SOLIB) $(SOLIB).hash
- targets += interp.o
+@@ -190,7 +190,8 @@ $(SOHASH): $(SOLIB) $(SOLIB).hash
+ targets += shared-stub.o
  
  quiet_cmd_interp = BUILD   $@
 -      cmd_interp = $(KLIBCCC) $(klibccflags) -D__ASSEMBLY__     \
@@ -23,4 +23,4 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +                             -D__ASSEMBLY__     \
                               -DLIBDIR=\"$(SHLIBDIR)\"         \
  			     -DSOHASH=\"$(SOLIBHASH)\" \
-                              $(KLIBCSTACKFLAGS) \
+ 			     -c -o $@ $<
diff --git a/meta-initramfs/recipes-devtools/klibc/files/armv4-fix-v4bx.patch b/meta-initramfs/recipes-devtools/klibc/files/armv4-fix-v4bx.patch
index 585fb2d439..7b29eaf200 100644
--- a/meta-initramfs/recipes-devtools/klibc/files/armv4-fix-v4bx.patch
+++ b/meta-initramfs/recipes-devtools/klibc/files/armv4-fix-v4bx.patch
@@ -16,8 +16,8 @@ Upstream-Status: Pending
 
 --- a/usr/klibc/arch/arm/MCONFIG
 +++ b/usr/klibc/arch/arm/MCONFIG
-@@ -27,6 +27,7 @@ else
- KLIBCSHAREDFLAGS = $(LD_IMAGE_BASE_OPT) 0x01800000
+@@ -23,6 +23,7 @@ else
+ # Extra linkflags when building the shared version of the library
  ifeq ($(CONFIG_AEABI),y)
  KLIBCREQFLAGS += -mabi=aapcs-linux -mno-thumb-interwork
 +KLIBCLDFLAGS += $(FIX_ARMV4_EABI_BX)
diff --git a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.10.bb b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.13.bb
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.10.bb
rename to meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.13.bb
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.10.bb b/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.13.bb
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.10.bb
rename to meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.13.bb
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.10.bb b/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.13.bb
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.10.bb
rename to meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.13.bb
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 5acf679983..113459b523 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -20,7 +20,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/klibc/2.0/klibc-${PV}.tar.xz \
            file://0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch \
            file://cross-clang.patch \
            file://0001-workaround-for-overlapping-sections-in-binary.patch \
-           file://0001-fcntl-Fix-build-failure-for-some-architectures-with-.patch \
            "
 
 ARMPATCHES ?= ""
@@ -28,7 +27,7 @@ ARMPATCHES ?= ""
 ARMPATCHES:arm = " \
                   file://armv4-fix-v4bx.patch \
                  "
-SRC_URI[sha256sum] = "662753da8889e744dfc0db6eb4021c3377ee7ef8ed66d7d57765f8c9e25939cd"
+SRC_URI[sha256sum] = "d673a294f742d59368222ff5c38462d81098c55063799de6fb8a7ba3d4af0436"
 
 S = "${WORKDIR}/klibc-${PV}"
 
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc_2.0.10.bb b/meta-initramfs/recipes-devtools/klibc/klibc_2.0.13.bb
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc_2.0.10.bb
rename to meta-initramfs/recipes-devtools/klibc/klibc_2.0.13.bb
-- 
2.42.0


