Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.3718.1615708489312867340
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Mar 2021 23:54:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cJC16Gu6;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id cl21-20020a17090af695b02900c61ac0f0e9so753564pjb.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Mar 2021 23:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YWeOdkqEoKz4ik6eK5wxd4W9e6cghafDOw2HrdZcvr8=;
        b=cJC16Gu6AU9SHFp31KYvOKuCbMc/9flQXoYXZLScR6TgEyYhmUwBpCLMUM5YQaNw9+
         Y8wXsC2s5lCL8F3OTyIxU3mWw6vvVGHypGfZMxlcFoqQecReUv3mKIzzQNpPBJO+SRuD
         6wXHL9ZYDHS3H5tHumWA5PZYwrQHBp7/FiepJEdRwa+4UYYIOu2jWcxrFQupwpbRKhDX
         pbjsn9IiaVJM4kTpsqcuQose2Hn8ZcWbSeZvQk28vv3KayQNWV6XDObhOJ1NpFlEqXZs
         f7L2aRiGeK8K2JEqVt6ycEFjEcTjaBAkqc7LvhRXHkJMV8XT1ZJnAUHFptKU6ADtcgxS
         g3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YWeOdkqEoKz4ik6eK5wxd4W9e6cghafDOw2HrdZcvr8=;
        b=f46huM5XAUMDtOyPA4/BOzEVkR17I7kguQygn7Imy9v7pvOR6eD+Gd7oWnF8poGSjH
         FSprk5SMYSVnSOfXKzutFOo3ZYQiO5R+AZt9N+Pj/ZpRQARxv1KygACY9c0jsq/b6dWt
         2W9D1oUxu6Pxd6I91YTk2uFY3vdjLuC+gb58V1WTaxnAl3RTRipjma3tR5mj3RKzHQZ+
         SlLiDkfztw9RkwMMc1EVR55GhXCMuHqxOeJJRkRYeZjMBdfcnqf6cdqyYdwWC98Kcbw7
         8unoQFFUqongi5d+P/1B9MGO/gZMUDYTXsB+vW+KjZHuLefHDU1DxCWJly5A1z+/nx1K
         3nvw==
X-Gm-Message-State: AOAM530tQp7cdoaDQ4dXUJNSlwiJyZWhXyAL0Ag+hgNkCMHEcXPLbTpg
	iyI03PcLu/KAFfBoWEzmzLsuxpa+9/UHkw==
X-Google-Smtp-Source: ABdhPJxJUFvUqpdw4qGnqFea+AzC8R3USoJLVg3KsLpPwnerZq5Iwg9DxGMUGG+KNHvw2T0+nsj3Nw==
X-Received: by 2002:a17:90b:e08:: with SMTP id ge8mr6774398pjb.130.1615708488634;
        Sat, 13 Mar 2021 23:54:48 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id p3sm9421362pgl.88.2021.03.13.23.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 23:54:48 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] breakpad: Exclude for ppc64
Date: Sat, 13 Mar 2021 23:54:46 -0800
Message-Id: <20210314075446.307360-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It does not build, errors out like
../git/src/client/linux/dump_writer_common/raw_context_cpu.h:48:2: error: #error "This code has not been ported to your platform yet."

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 4 ++--
 meta-oe/recipes-devtools/breakpad/breakpad_git.bb          | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 34f3c8c898..88cb949253 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -300,8 +300,8 @@ RDEPENDS_packagegroup-meta-oe-devtools_remove_mipsarch = "concurrencykit lshw pl
 RDEPENDS_packagegroup-meta-oe-devtools_remove_mips64 = "luajit nodejs"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_mips64el = "luajit nodejs"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc = "android-tools breakpad lshw luajit uftrace"
-RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc64 = "android-tools lshw luajit ply uftrace"
-RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc64le = "android-tools lshw luajit ply uftrace"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc64 = "android-tools breakpad lshw luajit ply uftrace"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc64le = "android-tools breakpad lshw luajit ply uftrace"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv64 = "breakpad concurrencykit heaptrack lshw ltrace luajit nodejs ply uftrace"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv32 = "breakpad concurrencykit heaptrack lshw ltrace luajit nodejs ply uftrace"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_aarch64 = "${@bb.utils.contains("TUNE_FEATURES", "crypto", "", "abseil-cpp", d)} concurrencykit"
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
index eb2b038dad..c4a8e92abb 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
@@ -47,6 +47,8 @@ S = "${WORKDIR}/git"
 CXXFLAGS += "-D_GNU_SOURCE"
 
 COMPATIBLE_HOST_powerpc = "null"
+COMPATIBLE_HOST_powerpc64 = "null"
+COMPATIBLE_HOST_powerpc64le = "null"
 COMPATIBLE_HOST_riscv64 = "null"
 COMPATIBLE_HOST_riscv32 = "null"
 
-- 
2.30.2

