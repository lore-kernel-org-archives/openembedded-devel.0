Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web12.1637.1587624286777245442
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2020 23:44:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WEf52GdT;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id y6so2057974pjc.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2020 23:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IcJv+PaTgGW/MISXStQQnS+OiFJzR1kCwnmAeoO6GXA=;
        b=WEf52GdTO1Kt+348Qla67jL0UPoKkcyu0VAGd7ylYV6N9M8hB/Vt5572UNT6Ce6YD1
         ix//z73+fZxQxi+8XvdmSW5qXAPjteNcSm5BQOFN/Rop+mONioWFphxoVO2FcuPTunpN
         NUtkI9maMad7D8Gsv2wBUa8K4JT/jCMAi8TRbPJwRn88pqg3vWXlOx2mQaz3UyOe1atL
         Q4NCrIC12I7QrpP7oVvqNPrXp3ANtSNwV2FKSUzFm/38pdv0D6LysD1FW8qGGm0p8IAY
         wZWOk83reNr77TRKfJAUlqDT+eH6PgeLgggDeCa6yvRrB4gurVYP/lFArjtM6qlPbmc1
         Izzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IcJv+PaTgGW/MISXStQQnS+OiFJzR1kCwnmAeoO6GXA=;
        b=rX9EUc4W2WM0sqROi6gb4/YlzYrXm9PIvKkpbzo2GvgiILIx9ZuQQeGfAMA3o2plIP
         ha44lld1suVyAnx3XPGwv3XMCeGcyJ2xWOmlDBYzHz0ouk7cDgF9nSEq9v3Q3uiW4Tep
         R7QjtBRNJpKFlRPVobcYQlVeWh9PXINeIpBQHKNfsQvPB2xJeN2JwW7SXe9BfOut9Naz
         2gxtitGXgh0HiXM3eoMxbXAqtTlyXW4Zh6vBp9cfRIy0Gm86T7vnboXBoojDExq8MiBJ
         lMVgNW4hlPUt++vk83QbVgkAgtbGtiy37stDX2VxOuKKCbdIPzfzM7oatjVkCdwnL5kv
         XGQA==
X-Gm-Message-State: AGi0PuaAOAR6OKGGlD6rnb4Iv4bR3jDPuxEobx/+r8741ujya69YmbdQ
	zPjBrMBAk/ssRaRokbzltYDsDl9tKbs=
X-Google-Smtp-Source: APiQypK57ER1JzMG2Agp+Fcz3O0/SJa+j5eAHwsWBoFZI14TWUw50qNzu5mFQ0SNEARcNuioIEFw0A==
X-Received: by 2002:a17:90a:ce05:: with SMTP id f5mr2762853pju.39.1587624285681;
        Wed, 22 Apr 2020 23:44:45 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1a60])
        by smtp.gmail.com with ESMTPSA id a136sm1586501pfa.99.2020.04.22.23.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 23:44:45 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2] recipes,packagegroups: Remove libunwind deps for riscv
Date: Wed, 22 Apr 2020 23:44:42 -0700
Message-Id: <20200423064442.45364-1-raj.khem@gmail.com>
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
index 70eef72057..09c7543b66 100644
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
+PACKAGECONFIG[unwind] = "-DWITH_UNWIND=ON,-DWITH_UNWIND=OFF,libuwind,libunwind"
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

