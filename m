Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.1938.1628012313798577884
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Aug 2021 10:38:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H7v+khzR;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id j18-20020a17090aeb12b029017737e6c349so3440809pjz.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Aug 2021 10:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GQr8i4+8aTwU1Ldr3CErUvn98tBUPuLQYb278+Lbhtg=;
        b=H7v+khzRqlKF1tu8yqjuInAak3Jq9ekIlriR4wd/1pfptp3ZcVZp7tyxNibB9KjolT
         pNy95as8tbh9YJYXUU+RX0N6FNBOhX4cLB3rUbhMtVPLJ+WA3YDZuOv9/yA4Fe2ZTL4E
         XtegZ1VCsVGWsmAE8FOrWjJ3UChloQ/li1Bjy1AVMA7d6tNZ3NRW9w4x0+FZARj4g7TH
         SR4E4ALvA19p9lpj7mSkarVAmb0WR87U0NKjvAWuTVa4ivvqa29icGJyGooqjgXXxQ9E
         EFR54WymVw/nozxKPpAbzW0IM3W0Pn7yUqoe+szHiCGo1Tkc73g2bxDX4Z22Y8RWHJZb
         9PcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GQr8i4+8aTwU1Ldr3CErUvn98tBUPuLQYb278+Lbhtg=;
        b=aw8KJHkDaixTofrnNmF+4u5M0vKzzTqKTrxNTK5dc5o2152sITOEWgzaX3hPwFBu0V
         aDOA06k8Ir4GZ54LSffjq2e2C1or+oreRQIDBmldW2GxsbKl8MEF07s45FfupfsRw1rm
         qBg765M9Ct9xFCNkkWeV0fj3wJMcjdX425ki3kbFIM7J+fyniVkx2oEtSH0YVJFZm158
         O8cRpX4rMPxNrictG0JC3FpSI/yCx0zzbBlyu+vjBSRbWRPVSlpyVyLE8UnNpAy5WEU2
         Z4q+mzGqzLdQwEDwBNLCNhHKeyh25CBT6MDH6AVMpRh7OoUDBdqF4MNv0Yr3n5csedpE
         8l1w==
X-Gm-Message-State: AOAM531MyOlQeEEgVsc3iv80OjiWzrUIsTW1g7qKdzhigpfXVz0sAWVa
	6NfslptusYn8fKHggQ/t9V2Vwv73aT+JAA==
X-Google-Smtp-Source: ABdhPJy3UZfRr9Xb8gs6eEH4bWfDGOUhjUk6ElDPVcwEHbhZp+dWtTfjtqkv0Ly9U+AQhbWQA/fa9A==
X-Received: by 2002:a62:e50c:0:b029:2f9:b9b1:d44f with SMTP id n12-20020a62e50c0000b02902f9b9b1d44fmr24062105pff.42.1628012313023;
        Tue, 03 Aug 2021 10:38:33 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id a11sm16805297pgj.75.2021.08.03.10.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 10:38:32 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libhugetlbfs: Disable build with glibc 2.34+
Date: Tue,  3 Aug 2021 10:38:29 -0700
Message-Id: <20210803173829.2669409-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210803173829.2669409-1-raj.khem@gmail.com>
References: <20210803173829.2669409-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It uses __morecore internal function from glibc which has been removed
in 2.34+ and replacing it is not so simple and upstream needs to fix it
see [1]

[1] https://github.com/libhugetlbfs/libhugetlbfs/issues/52

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb | 3 +++
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 1 -
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb  | 3 +--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index aa9eb02b34..124b142d83 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -74,3 +74,6 @@ INSANE_SKIP_${PN} = "dev-so"

 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+
+# see https://github.com/libhugetlbfs/libhugetlbfs/issues/52
+PNBLACKLIST[libhugetlbfs] ?= "Needs porting to glibc 2.34+"
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index a95fe8b040..84f89f4e71 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -68,7 +68,6 @@ RDEPENDS_packagegroup-meta-oe-benchmarks = "\
     iperf2 \
     iperf3 \
     libc-bench \
-    libhugetlbfs \
     linpack \
     lmbench \
     mbw \
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 4caf217c24..11cf935c73 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -18,7 +18,7 @@ SRC_URI += "file://run-ptest \
 # we will append other kernel selftest in the future
 # bpf was added in 4.10 with: https://github.com/torvalds/linux/commit/5aa5bd14c5f8660c64ceedf14a549781be47e53d
 # if you have older kernel than that you need to remove it from PACKAGECONFIG
-PACKAGECONFIG ??= "firmware vm"
+PACKAGECONFIG ??= "firmware"
 PACKAGECONFIG_remove_x86 = "bpf"
 PACKAGECONFIG_remove_arm = "bpf vm"
 # host ptrace.h is used to compile BPF target but mips ptrace.h is needed
@@ -137,4 +137,3 @@ COMPATIBLE_HOST_libc-musl = 'null'
 # It has native clang/llvm dependency, poky distro is reluctant to include them as deps
 # this helps with world builds on AB
 EXCLUDE_FROM_WORLD = "1"
-
--
2.32.0
