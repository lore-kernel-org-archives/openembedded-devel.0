Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web11.221.1617899780377204645
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ctPFMG6C;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id v24-20020a9d69d80000b02901b9aec33371so2914977oto.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=5zz9pB4LRZlkPwrLCgfwfpyZ747diIlnmLjmsMDupik=;
        b=ctPFMG6C8o1j3qvpCcCgFtuA28Jl4tCLwrHncPPeNLTJh4nvG0lPmTDifjJ+UCysjO
         hUTVXcVeLhmi97UBUC7iunKOlhGJZXHc5j5nSNDK7oAGG6JQdmfZzX1ty2QdF5Uzoogs
         UCNHx+FoUsut8aTlXwHPIbH7ZFIt/Y1+raHpqe+ER+OHDjjIBT9Pbwu7A05BW+IrfHKX
         Mvb77LMDhG7aGaWTm50fghg7l9ajt7tMjagigbYgzMEKhQMfbcRd7f+m6a3k7vKhzk8k
         z14QoZ8chkMpoAHNcdfvP8MFnkIpCdFZxQ9DsnMFRGnNNuy2LBbCkvooqO/G6rYWeOkC
         UpcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=5zz9pB4LRZlkPwrLCgfwfpyZ747diIlnmLjmsMDupik=;
        b=NeF0EQSwoABNraCBihKZFeOiPZRw31CqV12XBgvuhH3e9PrB1rpKwEVDLIdlnqRMqN
         E8lj4g2ET/s1SsQhtn9/v831hN+P/T5zKKjr+MpRcm5yNl7BlCbj7nwPFyV4Re5j6y1O
         /yAjtjzqQZTMzG0WJgSiv/3/Npc1aJ6V195aKOpgCacutQkSqJ2IAWna/UAnTXiZUx2R
         H2biZ5MhG1Tu+o28QqkRvJhcdxWhi9fY8STLgd6udZRqqMSY6dDM2GVPEPcwdZ6lNyKv
         Wd+QCFrzo7kYOhpDNBMI2Ha74cT3PBf3au0k7jIhIji89IEBOp5kTvEyOZBe88rrU7gM
         6ADQ==
X-Gm-Message-State: AOAM531mlQ2sdMymGCT+4xvdzpUyAC0JVljERZKKbJ2+ysn9iPHj4Afa
	DPBvZCVm8N14vfjCQ9Nrocd855WCVmk=
X-Google-Smtp-Source: ABdhPJygmEDMMhYd2WCK0FWXuvinbPv/5yGqN86ItRAPMjuYnGvnH/gyoYhZbE+8vnAsXeCEW4kiiA==
X-Received: by 2002:a05:6830:1c2b:: with SMTP id f11mr8614725ote.125.1617899779538;
        Thu, 08 Apr 2021 09:36:19 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:19 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 04/64] flashrom: Add remaining RISCV support
Date: Thu,  8 Apr 2021 09:35:11 -0700
Message-Id: <bdf307b30acc1a235c3c87495ed93533e7b73f73.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>
(cherry picked from commit e024a4c7085fb9ab2c79b3b6c5c6389037fab630)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...SCV-as-non-memory-mapped-I-O-archite.patch | 44 +++++++++++++++++++
 meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb  |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/0001-flashrom-Mark-RISCV-as-non-memory-mapped-I-O-archite.patch

diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/0001-flashrom-Mark-RISCV-as-non-memory-mapped-I-O-archite.patch b/meta-oe/recipes-bsp/flashrom/flashrom/0001-flashrom-Mark-RISCV-as-non-memory-mapped-I-O-archite.patch
new file mode 100644
index 00000000000..e481c5a1618
--- /dev/null
+++ b/meta-oe/recipes-bsp/flashrom/flashrom/0001-flashrom-Mark-RISCV-as-non-memory-mapped-I-O-archite.patch
@@ -0,0 +1,44 @@
+From 2c777126765b4095bf481d5cfe4a21470374d940 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 30 Mar 2021 15:12:09 -0700
+Subject: [PATCH] flashrom: Mark RISCV as non memory-mapped I/O architecture
+
+Upstream-Status: Submitted [https://review.coreboot.org/c/flashrom/+/51960]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Change-Id: I55c4e8529d36f0850dd56441c3fb8602c5d889fd
+---
+ Makefile   | 2 +-
+ hwaccess.h | 4 ++++
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 6d37d55..203e04b 100644
+--- a/Makefile
++++ b/Makefile
+@@ -559,7 +559,7 @@ endif
+ # Disable all drivers needing raw access (memory, PCI, port I/O) on
+ # architectures with unknown raw access properties.
+ # Right now those architectures are alpha hppa m68k sh s390
+-ifneq ($(ARCH),$(filter $(ARCH),x86 mips ppc arm sparc arc))
++ifneq ($(ARCH),$(filter $(ARCH),x86 mips ppc arm sparc arc riscv))
+ ifeq ($(CONFIG_RAYER_SPI), yes)
+ UNSUPPORTED_FEATURES += CONFIG_RAYER_SPI=yes
+ else
+diff --git a/hwaccess.h b/hwaccess.h
+index 5602c15..e79988a 100644
+--- a/hwaccess.h
++++ b/hwaccess.h
+@@ -295,6 +295,10 @@ int libpayload_wrmsr(int addr, msr_t msr);
+ 
+ /* Non memory mapped I/O is not supported on ARC. */
+ 
++#elif IS_RISCV
++
++/* Non memory mapped I/O is not supported on RISCV. */
++
+ #else
+ 
+ #error Unknown architecture, please check if it supports PCI port IO.
+-- 
+2.31.1
+
diff --git a/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb b/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
index 4e0b2d4a8c6..145a3cad02e 100644
--- a/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
+++ b/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SRC_URI = "https://download.flashrom.org/releases/flashrom-v${PV}.tar.bz2 \
            file://0001-typecast-enum-conversions-explicitly.patch \
            file://meson-fixes.patch \
+           file://0001-flashrom-Mark-RISCV-as-non-memory-mapped-I-O-archite.patch \
            "
 SRC_URI[md5sum] = "7f8e4b87087eb12ecee0fcc5445b4956"
 SRC_URI[sha256sum] = "e1f8d95881f5a4365dfe58776ce821dfcee0f138f75d0f44f8a3cd032d9ea42b"
-- 
2.17.1

