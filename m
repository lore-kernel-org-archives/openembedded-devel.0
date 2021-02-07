Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.17705.1612685618560670862
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 00:13:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nF6sxktz;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id g15so8261714pgu.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Feb 2021 00:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+9TrWYLeDFOCP6ED6tcDUNtWpUPHbqW/d82zUOhhMac=;
        b=nF6sxktzErV+1D6d5aM0ilZydPilqZ/ykpSKBv4Nl5y48E9XAbokdpjj9EQkD1Lq8q
         3AkiMeDcJggw68a+8V1mvk1lk1p8pSZN6iuJKKiJX6xkcPGOc8MPA0pr3WvPB4VIpzms
         R8mntpq0VLHiOfCEA/cElQRDW1ExU0RZCyVyhOBFSfXX3HMtB41jgOpxvS2bxkHZaURJ
         l0+apAELrEeNEs2D1psk6uFxxoOe0qZjip9YpGZSVM8FovQsWJse/AZIADjQXIi2jjm1
         jy04na0U7vpGBL2FvnGrJHixxo61IQCHN5xHxTe/t1WUUshwn+fhtwfoLRcN4Qga91Cj
         PcOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+9TrWYLeDFOCP6ED6tcDUNtWpUPHbqW/d82zUOhhMac=;
        b=NealpOJglXtuWbplTpA71aMB+8abMVNq2ICBztZc5OJQhM0v7uIDrG9k5PrgckTc5u
         04OJNUVKsH8D1v5lCHx3nWpLmT+/HZFc8Clmll+JJO1gjuBzzTUKvSRda0HU51ZFKwk4
         4FHc4onttMSz8R7c/gJVi2PF3nIp5cV9lCkggPQYbvEVfeU5msHzQxKgyJI6X0VKWbaU
         zDUOnCyPKrUnpfLapQBmS2UQIIdzMPCDri6QiHbVgvV5vIvH3YHJy9UaF+hnhBe5omdX
         WKwoFjXxsmZMfLZOM+MFEoJQ/9Rjdiw/ymdJj4ceTelgM+lSJJ6ovrAUPlJrAbxxVbxh
         uOIw==
X-Gm-Message-State: AOAM532tllUTWaJwZ7CqZJpszsDz27ZSOvPX0apBvA4Z+32jhZyp6U5N
	3wmRx7GaUPustYqVXta/Mxuf5gjHXLGXcQ==
X-Google-Smtp-Source: ABdhPJyK0cGnOiSyiMcVVQz4bvFx0RUPlNUX66Qrzs6pDfmFYHn+IjTa+3pfMRXW+wwhKGIGHv2W5w==
X-Received: by 2002:a62:7dc4:0:b029:1ba:765:3af with SMTP id y187-20020a627dc40000b02901ba076503afmr12415172pfc.78.1612685617556;
        Sun, 07 Feb 2021 00:13:37 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d188])
        by smtp.gmail.com with ESMTPSA id y8sm6254527pfe.36.2021.02.07.00.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 00:13:37 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Andrea Adami <andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH] klibc: Fix x86_64 build with binutils 2.36+
Date: Sun,  7 Feb 2021 00:13:34 -0800
Message-Id: <20210207081334.268419-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

this patch is already on klibc mailing list

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andrea Adami <andrea.adami@gmail.com>
---
 ...d-for-overlapping-sections-in-binary.patch | 52 +++++++++++++++++++
 .../recipes-devtools/klibc/klibc.inc          |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-initramfs/recipes-devtools/klibc/files/0001-workaround-for-overlapping-sections-in-binary.patch

diff --git a/meta-initramfs/recipes-devtools/klibc/files/0001-workaround-for-overlapping-sections-in-binary.patch b/meta-initramfs/recipes-devtools/klibc/files/0001-workaround-for-overlapping-sections-in-binary.patch
new file mode 100644
index 0000000000..8ccfe447ee
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/files/0001-workaround-for-overlapping-sections-in-binary.patch
@@ -0,0 +1,52 @@
+From 911130ce429cbf6a92d0fbd17f0ff638ec941df2 Mon Sep 17 00:00:00 2001
+From: Petr Ovtchenkov <ptr@void-ptr.info>
+Date: Sun, 7 Feb 2021 00:04:36 -0800
+Subject: [PATCH] workaround for overlapping sections in binary
+
+Problem: binary (typesize.bin) created from object file (typesize.o)
+with 'objcopy -O binary ... '. But typesize.o has relocatable objects that all
+copied with offset 0. This will lead to overlapping sections in binary.
+By fortunate syscalls.pl check magic bytes and ring the bell.
+
+This is naive workaround: skip .note.gnu.property section that overlap
+.rodata section.
+
+This not a bug of objcopy, https://sourceware.org/bugzilla/show_bug.cgi?id=27314
+
+Related commit:
+
+  commit de6f630e6be90d6d32d8bf2fed3f856b0c32f7ba
+  Author: H. Peter Anvin <hpa at zytor.com>
+  Date:   Sat Jun 10 11:15:19 2006 -0700
+
+      [klibc] Detect the sizes of various types, and make available to sysstub.ph.
+
+      This additional code effectively queries the C compiler for the sizes of
+      various types, and makes an associative array %typesize available to
+      sysstub.ph.  This is currently not used, but it's expected that some
+      architectures, e.g. s390, will need this to determine which registers
+      go where, and how many registers are needed.
+
+Upstream-Status: Submitted [https://lists.zytor.com/archives/klibc/2021-February/004583.html]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ usr/klibc/syscalls/Kbuild | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/usr/klibc/syscalls/Kbuild b/usr/klibc/syscalls/Kbuild
+index 2430b9b4..754d028e 100644
+--- a/usr/klibc/syscalls/Kbuild
++++ b/usr/klibc/syscalls/Kbuild
+@@ -71,7 +71,7 @@ $(obj)/typesize.c: $(srctree)/$(KLIBCSRC)/syscalls.pl $(obj)/SYSCALLS.i     \
+ 
+ # Convert typesize.o to typesize.bin
+ quiet_cmd_mkbin = OBJCOPY $@
+-      cmd_mkbin = $(KLIBCOBJCOPY) -O binary $< $@
++      cmd_mkbin = $(KLIBCOBJCOPY) -O binary --remove-section .note.gnu.property $< $@
+ 
+ $(obj)/typesize.bin: $(obj)/typesize.o FORCE
+ 	$(call if_changed,mkbin)
+-- 
+2.30.0
+
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 6e8ec0fd56..41147eb2da 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -20,6 +20,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/klibc/2.0/klibc-${PV}.tar.xz \
            file://0001-klibc-add-getrandom-syscall.patch \
            file://0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch \
            file://cross-clang.patch \
+           file://0001-workaround-for-overlapping-sections-in-binary.patch \
            "
 
 ARMPATCHES ?= ""
-- 
2.30.0

