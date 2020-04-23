Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.1082.1587619647062599008
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2020 22:27:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fQmImrvJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id h11so1892746plr.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2020 22:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SppVAA8TgRyiKoAjiQiWZ8DUod5MQtQ2ODmYIBkgpyo=;
        b=fQmImrvJWZmZ1/FjTiQ8b3uftHbyKZ4PRjK5IWu+ChImMkrpeas8l8Ls3gUOJmbwEU
         AM0oxV1p9sFy4lbn+L/50K2aIUjY8PSVXdkRKqML2hF1RvWtCm0N0J9UpheIhL5bOlYB
         jIlGN7rkWVa7gy97YbCry0aiIL6YmmZwtMREGYIa74/6URSAjtfVX/NlL1YUPCeyvXUw
         kkesNsXkRVVrKIlAXXLMANp9HjpWydjbb7BN2/CGiMc666BgDygmju/s3oTaAs196rIP
         5GS8MqK6JdZPTNsmAyI4pRzvwr2bHfZMdY1WzobRhwrONRHf+9uiEchzLb217zvBJ2Kn
         0bSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SppVAA8TgRyiKoAjiQiWZ8DUod5MQtQ2ODmYIBkgpyo=;
        b=skIdm1FhEDxAl0hSQYE3XgklvRuKkhFfPU96+G5uPdcClhDPcFw3RUOopE2wdkgBU7
         +jZ9Gl5tb7hL6ys9VMs9j/1hy8ODzpfzOBIbjA3rjOot6kks8bnsU3pMdsUImLqEYN6+
         l+vxRLY7/FuRjKcaEbXIhxywft6areRHC1L5+24KDmiVsWbraNn819Wq5n9wiAKtdnmv
         KTXsBaVebP5yImta6eP+jc2pY3SW3jJbXp5N2Mcxz/3tfWf0+OyYuKfXp7NHXDfgNvMf
         vk7YN3Zq2JorWNJU+GYphdXOoFWuyD7dtYsBVKnsUlKM2XbsVhRXW2/8QEerhwHA601U
         XjJw==
X-Gm-Message-State: AGi0PuaRWuyPu4BcX8Y6DR8QFyo5L6ti/WCB+6Oz/pmFKZfionzei27j
	I533+vOqEdGksknu54jF4fKd0gHtz5c=
X-Google-Smtp-Source: APiQypKUh2qMjaN+yOavFUWT6ySowuuEGgXynoMMwLNbYuvtYnUzaoF9K/5REJRC4m5QU+ugHbppOw==
X-Received: by 2002:a17:90a:1503:: with SMTP id l3mr2381906pja.87.1587619645950;
        Wed, 22 Apr 2020 22:27:25 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1a60])
        by smtp.gmail.com with ESMTPSA id w69sm1311691pff.168.2020.04.22.22.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 22:27:25 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] recipes,packagegroups: Remove riscv non-building recipes and dependencies
Date: Wed, 22 Apr 2020 22:27:22 -0700
Message-Id: <20200423052722.956955-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

since libunwind is not buildable, it results in glog not being buildable
and that results in ceres-solver and gperftools opencv needs glob to
eenable libeigen

Remove these packages from paackagegroup dependencies as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb          | 14 ++++++++++----
 .../ceres-solver/ceres-solver_1.14.0.bb            |  3 +++
 meta-oe/recipes-support/glog/glog_0.3.5.bb         |  3 +++
 .../gperftools/gperftools_2.7.90.bb                |  3 +++
 meta-oe/recipes-support/opencv/opencv_4.1.0.bb     |  3 +++
 5 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index fabb45c88d..650809b625 100644
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
@@ -272,8 +275,8 @@ RDEPENDS_packagegroup-meta-oe-support ="\
 
 RDEPENDS_packagegroup-meta-oe-support_remove_arm ="numactl"
 RDEPENDS_packagegroup-meta-oe-support_remove_mipsarch = "gperftools"
-RDEPENDS_packagegroup-meta-oe-support_remove_riscv64 = "uim"
-RDEPENDS_packagegroup-meta-oe-support_remove_riscv32 = "uim"
+RDEPENDS_packagegroup-meta-oe-support_remove_riscv64 = "ceres-solver glog gperftools uim"
+RDEPENDS_packagegroup-meta-oe-support_remove_riscv32 = "ceres-solver glog gperftools uim"
 RDEPENDS_packagegroup-meta-oe-support_remove_powerpc = "ssiapi"
 
 RDEPENDS_packagegroup-meta-oe-support-egl ="\
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
diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.0.bb b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.0.bb
index ac463038aa..651c110f75 100644
--- a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.0.bb
+++ b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.0.bb
@@ -13,6 +13,9 @@ S = "${WORKDIR}/git"
 
 inherit cmake
 
+COMPATIBLE_HOST_riscv64 = "null"
+COMPATIBLE_HOST_riscv32 = "null"
+
 # We don't want path to eigen3 in ceres-solver RSS to be
 # used by components which use CeresConfig.cmake from their
 # own RSS
diff --git a/meta-oe/recipes-support/glog/glog_0.3.5.bb b/meta-oe/recipes-support/glog/glog_0.3.5.bb
index 70eef72057..3b416009a2 100644
--- a/meta-oe/recipes-support/glog/glog_0.3.5.bb
+++ b/meta-oe/recipes-support/glog/glog_0.3.5.bb
@@ -21,6 +21,9 @@ S = "${WORKDIR}/git"
 
 inherit cmake
 
+COMPATIBLE_HOST_riscv64 = "null"
+COMPATIBLE_HOST_riscv32 = "null"
+
 RDEPENDS_${PN} += "libunwind"
 
 EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON"
diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.7.90.bb b/meta-oe/recipes-support/gperftools/gperftools_2.7.90.bb
index 9dfb0d974f..dab34f2b04 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.7.90.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.7.90.bb
@@ -20,6 +20,9 @@ S = "${WORKDIR}/git"
 #   do_page_fault(): sending SIGSEGV to ls for invalid read access from 00000008
 #   Segmentation fault (core dumped)
 COMPATIBLE_HOST_mipsarch = "null"
+COMPATIBLE_HOST_riscv64 = "null"
+COMPATIBLE_HOST_riscv32 = "null"
+
 # Disable thumb1
 # {standard input}: Assembler messages:
 # {standard input}:434: Error: lo register required -- `ldr pc,[sp]'
diff --git a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
index d781da6005..6fd7bf85ff 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
@@ -100,6 +100,9 @@ PACKAGECONFIG ??= "gapi python3 eigen jpeg png tiff v4l libv4l gstreamer samples
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libav", "", d)}"
 
+PACKAGECONFIG_remove_riscv64 = "eigen"
+PACKAGECONFIG_remove_riscv32 = "eigen"
+
 PACKAGECONFIG[gapi] = "-DWITH_ADE=ON -Dade_DIR=${STAGING_LIBDIR},-DWITH_ADE=OFF,ade"
 PACKAGECONFIG[amdblas] = "-DWITH_OPENCLAMDBLAS=ON,-DWITH_OPENCLAMDBLAS=OFF,libclamdblas,"
 PACKAGECONFIG[amdfft] = "-DWITH_OPENCLAMDFFT=ON,-DWITH_OPENCLAMDFFT=OFF,libclamdfft,"
-- 
2.26.2

