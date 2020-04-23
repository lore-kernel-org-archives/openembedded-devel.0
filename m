Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.7430.1587652502622120104
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2020 07:35:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LHYi5iDH;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id y6so2579079pjc.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2020 07:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XxpUsR4rH+oMw8G8edrwdMwQ6+WSUQo6wv9Pkxg8/AE=;
        b=LHYi5iDHZQw6U9oIfMd9T87loqNw7fsFTPmpDVDF/VLNgB8uDXQ1rOrswCURanTZ/K
         PK9UlaTukt2I9IZsyDyTrbC78d26aCntZw9rp2JIRvfZZKy4LldTgFNMQv2ivJVqTZKE
         9iqX6DZko2nw0NaROem0Ueq+ON1PuAa29gOo3z2yhmx6rKYqc+26Ds8NQ4IkVeqwzNqp
         Ur+O/6gXiK3pxfPSKCGLLmVSWESKHkE2Zn++6YJxGtcebF8yLi4RaRqftj/KmC8syu20
         G1CDQJhcZF4Ir1pXpmhAoB5MEzwYilKEAjMfn0ZrafxQDcowrgttcoLGwI5sPsdqPmmN
         ndXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XxpUsR4rH+oMw8G8edrwdMwQ6+WSUQo6wv9Pkxg8/AE=;
        b=fMVQ8+Q08dWGN/4YuE9jB+79qFWm8/uIAcYDJhFwUyWR+2Rt97Fl2YVte/Sxtfsr5S
         Pm93X5CSO7zg7W9coUnjmKMRimqIGjSEbyxBNzyc7yo8rmN4mCRhy5AEv9vbHA8DBrbF
         FTJKM4pT7eBF28DIVzgBqxMyY/pHjw0A4ld8ztSMgbBlyhY3xU84JbYukGiqcvt2AQOp
         CJW6cWYqCX4PFE2KO7Cp7RvndsGCE7gQGXDEYFLx0IJJfZLtq8HmJSGBm5uyYw/KPi7E
         A/q/rdSfub0/ZyGN6UAxBgH+L6KRa2RDHu2teGVOZYAyAtUvmleBS18NsES0u2In6Rn1
         gKqQ==
X-Gm-Message-State: AGi0PuYmlqmKuItpq6kWBn6OhBvAB3OU9JYF6HWJjwRyM9eDCkKkWYFK
	54FddOj0xcmdzEH5RYqIFknRL+/q4Yc=
X-Google-Smtp-Source: APiQypKdsKFVE0ckwCP6fiY6hEN+MnPhuYL3CIZbt0oA5+cD0taJ7/c3mHcWUZpvh1/l1NUR3wl1ng==
X-Received: by 2002:a17:90a:8d12:: with SMTP id c18mr983819pjo.144.1587652501574;
        Thu, 23 Apr 2020 07:35:01 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1a60])
        by smtp.gmail.com with ESMTPSA id b29sm2803119pfp.68.2020.04.23.07.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 07:35:01 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v3] recipes,packagegroups: Remove libunwind deps for riscv
Date: Thu, 23 Apr 2020 07:34:58 -0700
Message-Id: <20200423143458.3045734-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

since libunwind is not buildable, it results in glog not being buildable
and that results in ceres-solver and gperftools opencv needs glob to
eenable libeigen

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Surgically remove need for libunwind instead of disabling whole
    recipe
v3: Fix a typo libuwind -> libunwind

 .../recipes-core/packagegroups/packagegroup-meta-oe.bb | 10 ++++++++--
 meta-oe/recipes-support/glog/glog_0.3.5.bb             |  9 +++++----
 .../recipes-support/gperftools/gperftools_2.7.90.bb    |  3 +++
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index fabb45c88d..d5c6288cdf 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -129,8 +129,8 @@ RDEPENDS_packagegroup-meta-oe-devtools_remove_mips64el = "nodejs"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc = "android-tools breakpad uftrace lshw"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc64 = "android-tools uftrace lshw"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc64le = "android-tools uftrace lshw"
-RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv64 = "nodejs uftrace lshw"
-RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv32 = "nodejs uftrace lshw"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv64 = "breakpad ltrace nodejs uftrace lshw"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv32 = "breakpad ltrace nodejs uftrace lshw"
 
 RDEPENDS_packagegroup-meta-oe-extended ="\
     byacc cfengine cfengine-masterfiles cmpi-bindings \
@@ -203,6 +203,9 @@ RDEPENDS_packagegroup-meta-oe-kernel_remove_libc-musl = "crash minicoredumper"
 RDEPENDS_packagegroup-meta-oe-kernel_remove_mips64 = "crash"
 RDEPENDS_packagegroup-meta-oe-kernel_remove_mips64el = "crash"
 
+RDEPENDS_packagegroup-meta-oe-kernel_remove_riscv64 = "crash oprofile"
+RDEPENDS_packagegroup-meta-oe-kernel_remove_riscv32 = "crash oprofile"
+
 RDEPENDS_packagegroup-meta-oe-multimedia ="\
     alsa-oss audiofile cdrkit id3lib \
     a2jmidid jack libass libburn libcdio libcdio-paranoia \
@@ -304,6 +307,9 @@ RDEPENDS_packagegroup-meta-oe-ptest-packages = "\
     libee-ptest \
     poco-ptest \
     "
+RDEPENDS_packagegroup-meta-oe-ptest-packages_remove_riscv64 = "oprofile-ptest"
+RDEPENDS_packagegroup-meta-oe-ptest-packages_remove_riscv32 = "oprofile-ptest"
+
 RDEPENDS_packagegroup-meta-oe-ptest-packages_append_x86 = "\
     mcelog-ptest \
 "
diff --git a/meta-oe/recipes-support/glog/glog_0.3.5.bb b/meta-oe/recipes-support/glog/glog_0.3.5.bb
index 70eef72057..9a8332836b 100644
--- a/meta-oe/recipes-support/glog/glog_0.3.5.bb
+++ b/meta-oe/recipes-support/glog/glog_0.3.5.bb
@@ -6,8 +6,6 @@ HOMEPAGE = "https://github.com/google/glog"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dc9db360e0bbd4e46672f3fd91dd6c4b"
 
-DEPENDS = "libunwind"
-
 SRC_URI = " \
     git://github.com/google/glog.git;nobranch=1 \
     file://0001-Rework-CMake-glog-VERSION-management.patch \
@@ -21,6 +19,9 @@ S = "${WORKDIR}/git"
 
 inherit cmake
 
-RDEPENDS_${PN} += "libunwind"
+PACKAGECONFIG ?= "shared unwind"
+PACKAGECONFIG_remove_riscv64 = "unwind"
+PACKAGECONFIG_remove_riscv32 = "unwind"
 
-EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON"
+PACKAGECONFIG[unwind] = "-DWITH_UNWIND=ON,-DWITH_UNWIND=OFF,libunwind,libunwind"
+PACKAGECONFIG[shared] = "-DBUILD_SHARED_LIBS=ON,-DBUILD_SHARED_LIBS=OFF,,"
diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.7.90.bb b/meta-oe/recipes-support/gperftools/gperftools_2.7.90.bb
index 9dfb0d974f..e15133c1b9 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.7.90.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.7.90.bb
@@ -20,6 +20,7 @@ S = "${WORKDIR}/git"
 #   do_page_fault(): sending SIGSEGV to ls for invalid read access from 00000008
 #   Segmentation fault (core dumped)
 COMPATIBLE_HOST_mipsarch = "null"
+
 # Disable thumb1
 # {standard input}: Assembler messages:
 # {standard input}:434: Error: lo register required -- `ldr pc,[sp]'
@@ -29,6 +30,8 @@ ARM_INSTRUCTION_SET_toolchain-clang_arm = "arm"
 
 PACKAGECONFIG ?= "libunwind static"
 PACKAGECONFIG_remove_arm_libc-musl = "libunwind"
+PACKAGECONFIG_remove_riscv64 = "libunwind"
+PACKAGECONFIG_remove_riscv32 = "libunwind"
 
 PACKAGECONFIG[libunwind] = "--enable-libunwind,--disable-libunwind,libunwind"
 PACKAGECONFIG[static] = "--enable-static,--disable-static,"
-- 
2.26.2

