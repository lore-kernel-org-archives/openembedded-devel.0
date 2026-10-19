Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1172CCF2DE
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 00:41:36 +0000 (UTC)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24760.1792370487016458033
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Oct 2026 17:41:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KzdekADu;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso4351010eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Oct 2026 17:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792370486; x=1792975286; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NqA3kVkGs22YkbGPfbZ2HWVFGFF6qSGpyBbH9DUMXaI=;
        b=KzdekADuMRWRjykc8mXMpEMb/X4e3HZFj4duXt0NI0llceIme0qNAgeewjUPOQdLeU
         n+GGCjQOstRyccoM/pWQ4CU3z4N3ZDNlCvii7AC9+H6uC52Gx8BZXamwuaIJKIjT36uY
         4EkvqhYwWO+cK+AzlZ53QkPBPDhJYT4EmawDQajygKbT1uP08VgGWP7JW+HaHIfzFUmg
         acli5z2TLPh4QBPRavUFSqJDYLV2jHrFocQakZ3hvV6mv9L4SFRLx2DkBB/gFlcjdf8i
         dNoPtWQ4D2p8TJxGZG/+4j8ZWHcBfdn/iiV6yqqIZun29NO1sQnftKTOlcJUY5dGG9Dj
         ev1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792370486; x=1792975286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NqA3kVkGs22YkbGPfbZ2HWVFGFF6qSGpyBbH9DUMXaI=;
        b=EF4xidTwLt/y7U8i755goj3paX8eE5nAcpcvvrQlU6Ls0WZ2l329NOTGjPC8tPlwcT
         rl9fSUvQWtAGk4zGPdcmNxYhXSWJru1vgPh+5mWppAuroxLBogOwSK281MownABJbh7c
         lw0T/orMAOhTQJUhHnx5f1XlGb80MpYXL4QFKeVO0Z/YrWFUdg6IjuzKKis8GGcPdVzW
         UmBIn1o0+IosMJytoXTFDt1CktZvojWaqvTSHlihBuNCUBXssuSBvDepMIVW/aBQH3OC
         CQ4ThHk66loLvVRLzewI9a7FnLc2bQjCAhLgAzPgQ1dOs2qwi15Z4hO/nhYS/jQWj2aP
         mfhQ==
X-Gm-Message-State: AFq9FYIPyXMKo0loeGeYw1SA/uyd02PB6MkrKqiavd1NNuQBhDUkjUGJ
	kpYf2MDLqJW3FJsGcCuN+ftXqygBPSBh6Y1VGsWOZzBXK7AGUKyl9BsUygOMM3WpwOM=
X-Gm-Gg: AYBFou2lyA3cC6pfwF0Z1Anm7iWe6t513zuZj6AsV8GaKyp1qDiYgcOrek9MK/EnomH
	uHbPWqK3sD+VXJeNdDxpVKSkbhECJG7pWrUgWLExK7zY/kMMHi26HsSkSIMVYdnA9PoQfAfNxAg
	D3MAF8DQ+hhmX9wtiukdSJK3QoKH5jjQYv07G8qEXEaDSS/m/5cSXMADHx93oHP0b+8dfry68P3
	IuV+mxvmM6LdkacK7OsG9ZFkGwyyoOGVvH974azij76l43+QUD7k3zAtWeQS43R/zyxSiNYj0OV
	WltcEVuppz2ukI+wXxdolSGbfWl1MGutIOPlDVuy2wr0uaiKImdoqaKESQ2/kz36hQO4VR4v88P
	zr+xbn5zGpURZHbsAKY8l6zZTnpSWye/ziEeLBPxEbbsvfqQuP6v91C4X6MJzDSABTVP1LDfy26
	0fuBwEzRVM3EM/qMDp2JfgFMPGIzUqvaBhJcndLFFEhs4ZUA4A5SPabo/xs6ZxLk4T0QDWyODT4
	MFkWFw0Yny91dTxm3NHuycOkOzktaLOFYDu+6xR38do3nTJ+4+q+sKZqbSHDlXfqgAxV36b06Ar
	1nh6/11ljX0SOwCiNaZKtd4CZQqgtn3cHoY26bgutvV7tHSYVjz2E0RsROB1YfVxtyuvPYv0uBu
	lzN8aUBBCls7o/hjAVL4fUIV8pdJOufoFWhyQcqh9cniBGp1Rb4S6+bII2OgJkECJUpKYByZOG8
	z83uTQ5Ueyzi1ai73g60mrc2z8E39Z+SBbIGPCzCELalfk4A==
X-Received: by 2002:a05:693c:8345:b0:35b:da8b:f88c with SMTP id 5a478bee46e88-361a2e37398mr9256658eec.41.1792370486042;
        Sun, 18 Oct 2026 17:41:26 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm45211774eec.28.2026.10.18.17.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 17:41:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 2/8] luajit: Enable riscv64 using the plctlab LuaJIT fork
Date: Sun, 18 Oct 2026 17:41:16 -0700
Message-ID: <20261019004122.2475327-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019004122.2475327-1-khem.raj@oss.qualcomm.com>
References: <20261019004122.2475327-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 00:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131101

Upstream LuaJIT v2.1 has no riscv64 backend, so fetch the plctlab
v2.1-riscv64 branch on riscv64, with the recipe's patches rebased onto
it, and drop the riscv64 COMPATIBLE_HOST restriction.

Tested by building for qemuriscv64 (musl, clang) and running a JIT-ed
loop under qemu-riscv64 (jit.status() is true).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...omatically-this-leaves-the-stripping.patch | 27 +++++++++++++++++++
 .../0001-Use-builtin-for-clear_cache.patch    | 24 +++++++++++++++++
 meta-oe/recipes-devtools/luajit/luajit_git.bb |  9 ++++---
 3 files changed, 57 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/luajit/luajit/riscv64/0001-Do-not-strip-automatically-this-leaves-the-stripping.patch
 create mode 100644 meta-oe/recipes-devtools/luajit/luajit/riscv64/0001-Use-builtin-for-clear_cache.patch

diff --git a/meta-oe/recipes-devtools/luajit/luajit/riscv64/0001-Do-not-strip-automatically-this-leaves-the-stripping.patch b/meta-oe/recipes-devtools/luajit/luajit/riscv64/0001-Do-not-strip-automatically-this-leaves-the-stripping.patch
new file mode 100644
index 0000000000..e3760836af
--- /dev/null
+++ b/meta-oe/recipes-devtools/luajit/luajit/riscv64/0001-Do-not-strip-automatically-this-leaves-the-stripping.patch
@@ -0,0 +1,27 @@
+From 528009f5ca0685c95ef27f6c8957160499c0576a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 10 May 2013 10:42:45 -0700
+Subject: [PATCH] Do not strip automatically, this leaves the stripping busines to OE
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/Makefile |    2 --
+ 1 file changed, 2 deletions(-)
+
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -754,12 +754,10 @@ $(LUAJIT_A): $(LJVMCORE_O)
+ $(LUAJIT_SO): $(LJVMCORE_O)
+ 	$(E) "DYNLINK   $@"
+ 	$(Q)$(TARGET_LD) $(TARGET_ASHLDFLAGS) -o $@ $(LJVMCORE_DYNO) $(TARGET_ALIBS)
+-	$(Q)$(TARGET_STRIP) $@
+
+ $(LUAJIT_T): $(TARGET_O) $(LUAJIT_O) $(TARGET_DEP)
+ 	$(E) "LINK      $@"
+ 	$(Q)$(TARGET_LD) $(TARGET_ALDFLAGS) -o $@ $(LUAJIT_O) $(TARGET_O) $(TARGET_ALIBS)
+-	$(Q)$(TARGET_STRIP) $@
+ 	$(E) "OK        Successfully built LuaJIT"
+
+ ##############################################################################
diff --git a/meta-oe/recipes-devtools/luajit/luajit/riscv64/0001-Use-builtin-for-clear_cache.patch b/meta-oe/recipes-devtools/luajit/luajit/riscv64/0001-Use-builtin-for-clear_cache.patch
new file mode 100644
index 0000000000..6b91016b06
--- /dev/null
+++ b/meta-oe/recipes-devtools/luajit/luajit/riscv64/0001-Use-builtin-for-clear_cache.patch
@@ -0,0 +1,24 @@
+From ca8f7d968a212f2da64492faac4f80384a5ba395 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 11 Sep 2022 13:23:19 -0700
+Subject: [PATCH] Use builtin for clear_cache
+
+This makes it compile on mips/clang and also portable across platforms
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/lj_mcode.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/src/lj_mcode.c
++++ b/src/lj_mcode.c
+@@ -70,7 +70,7 @@ void lj_mcode_sync(void *start, void *en
+   syscall(__NR_riscv_flush_icache, start, end, 0UL);
+ #endif
+ #elif defined(__GNUC__) || defined(__clang__)
+-  __clear_cache(start, end);
++  __builtin___clear_cache(start, end);
+ #else
+ #error "Missing builtin to flush instruction cache"
+ #endif
diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/recipes-devtools/luajit/luajit_git.bb
index a929d832e4..5a4bffb108 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
@@ -3,13 +3,17 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=a2c43bf4a9ea63755af2131b0ae59ff3"
 HOMEPAGE = "http://luajit.org"

-SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http;branch=v2.1 \
+FORK ?= "git://luajit.org/git/luajit-2.0.git;protocol=http;branch=v2.1"
+FORK:riscv64 = "git://github.com/plctlab/LuaJIT.git;protocol=https;branch=v2.1-riscv64"
+SRC_URI = "${FORK} \
            file://0001-Do-not-strip-automatically-this-leaves-the-stripping.patch \
            file://0001-Use-builtin-for-clear_cache.patch \
            "

 PV = "2.1"
 SRCREV = "659a61693aa3b87661864ad0f12eee14c865cd7f"
+SRCREV:riscv64 = "2c509ee67e20772bce3a11ce8f53b6b14b4980bb"
+
 # The v2.1 branch is rolling with no tags; track commits.
 UPSTREAM_CHECK_COMMITS = "1"

@@ -111,10 +115,9 @@ FILES:${PN}-dev += "${libdir}/libluajit-5.1.a \
 "
 FILES:luajit-common = "${datadir}/${BPN}-${PV}"

-# ppc64/riscv64/riscv32 is not supported in this release
+# ppc64/riscv32 is not supported in this release
 COMPATIBLE_HOST:powerpc64 = "null"
 COMPATIBLE_HOST:powerpc64le = "null"
-COMPATIBLE_HOST:riscv64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"

 CVE_STATUS[CVE-2024-25176] = "fixed-version: The used revision contains the fix already."

