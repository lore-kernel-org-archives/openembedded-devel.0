Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.10278.1605380671242061491
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2020 11:04:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jD7XZFVf;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id j5so6096119plk.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2020 11:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8u2dvgjYLBiH/f60o5cq3Faek+lmjMoOmdpwAFE4iKY=;
        b=jD7XZFVfi+uUkTlHT30QMoUrGBFm0XhjVBaT8iwfLlpJj631J0SwhH3F6d34rtEuUK
         wMiCHlB0Gxd1Rxi0SzZeZdSGEglNSesUSBjosG//QFYaftWwbtxfXTLtAB4lCnkTftkM
         AfjK+8mVJegTrzu5EgYqqnFuBER6rf5nM2iB3CcIzeMGdpp+V7FznUq/BzwxsdCvVsBd
         3JoWuvyyOJvJkGSyGRqFPCD6kGPuUE67jtWtpk6ngqjTKV7O3yjlDBHa2AFjngrC7/po
         f1C9aNCYeD1BygsLPLzox+ILoBek9Y0Of7D1Sl6zaghwGWYvqtYyRBk6RG8ygOiy6SCN
         HgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8u2dvgjYLBiH/f60o5cq3Faek+lmjMoOmdpwAFE4iKY=;
        b=rByVnVwcqpK3wuAp6Ih/2IB/qmLDNLJ0DrqJ8cDROj8Sszh2q/lADSRKNpNM9hWgAQ
         C2XxxJi9tkjRKjbjPDZJs9uv3MZVHmTNx7soMGB5LEd87loNXR52iz2ImxAtR/im+qqb
         RqQe8wDU/LQNXPvJIfLGkiFZZd7Etii495TRgMU9qjaRT1zpuoNCZ120R5zLKAgLG2+f
         EsaxwEA4QRYvqWPQJrp5gr5sj1/UlyEqfwLCNh8DZgeNyxyQPXon4FMeO5H2Koq/iot1
         8heJmZxu6dU6IpxhSB426Pq99B8fGdt3xmKFyZwM22RQp3B4l++YnnJGO+Fwdg1zRn5R
         LVEA==
X-Gm-Message-State: AOAM530/3So3w6pjspXgqBZeMhJwSGg2uiIK8V5iXfAfBScxxHRVOZBb
	ASFwQ1dKGs3F9YDrj2C+nJDLPms+7bJ01PtW
X-Google-Smtp-Source: ABdhPJzzFfcGVxag3js6SvGnbX8AGxlUDWAl/sGvf06g77hOtD1VzPBnk57O5z/pg/bOyqz8GFWrJw==
X-Received: by 2002:a17:90a:4593:: with SMTP id v19mr8827820pjg.217.1605380670291;
        Sat, 14 Nov 2020 11:04:30 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id 82sm13274444pfv.149.2020.11.14.11.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 11:04:29 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/5] recipe: Add leading whitespace for append operator
Date: Sat, 14 Nov 2020 11:04:22 -0800
Message-Id: <20201114190422.2777143-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201114190422.2777143-1-raj.khem@gmail.com>
References: <20201114190422.2777143-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb | 2 +-
 meta-oe/recipes-devtools/grpc/grpc_1.24.3.bb              | 2 +-
 meta-oe/recipes-devtools/lua/lua_5.3.5.bb                 | 2 +-
 meta-oe/recipes-extended/gnuplot/gnuplot_5.2.8.bb         | 2 +-
 meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb  | 2 +-
 meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb   | 8 ++++----
 meta-oe/recipes-graphics/libyui/libyui-ncurses_2.55.0.bb  | 2 +-
 meta-oe/recipes-support/anthy/anthy_9100h.bb              | 4 ++--
 8 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
index 2a42093447..170663882e 100644
--- a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
+++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
@@ -7,7 +7,7 @@ SRC_URI = "git://github.com/ubinux/dnf-plugin-tui.git;branch=master "
 SRCREV = "95f3c6ab36840fb1e0f4935f34dbf8f708b7780c"
 PV = "1.2"
 
-SRC_URI_append_class-target = "file://oe-remote.repo.sample"
+SRC_URI_append_class-target = " file://oe-remote.repo.sample"
 
 inherit distutils3-base
 
diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.24.3.bb b/meta-oe/recipes-devtools/grpc/grpc_1.24.3.bb
index 752562eb33..c25ce360e7 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.24.3.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.24.3.bb
@@ -62,6 +62,6 @@ do_configure_prepend_toolchain-clang_x86() {
 
 BBCLASSEXTEND = "native nativesdk"
 
-SYSROOT_DIRS_BLACKLIST_append_class-target = "${baselib}/cmake/grpc"
+SYSROOT_DIRS_BLACKLIST_append_class-target = " ${baselib}/cmake/grpc"
 
 FILES_${PN}-dev += "${bindir}"
diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.5.bb b/meta-oe/recipes-devtools/lua/lua_5.3.5.bb
index 7d84ea60b6..60c33d6586 100644
--- a/meta-oe/recipes-devtools/lua/lua_5.3.5.bb
+++ b/meta-oe/recipes-devtools/lua/lua_5.3.5.bb
@@ -31,7 +31,7 @@ PACKAGECONFIG ??= "readline"
 PACKAGECONFIG[readline] = ",,readline"
 
 UCLIBC_PATCHES += "file://uclibc-pthread.patch"
-SRC_URI_append_libc-uclibc = "${UCLIBC_PATCHES}"
+SRC_URI_append_libc-uclibc = " ${UCLIBC_PATCHES}"
 
 TARGET_CC_ARCH += " -fPIC ${LDFLAGS}"
 EXTRA_OEMAKE = "'CC=${CC} -fPIC' 'MYCFLAGS=${CFLAGS} -fPIC' MYLDFLAGS='${LDFLAGS}'"
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_5.2.8.bb b/meta-oe/recipes-extended/gnuplot/gnuplot_5.2.8.bb
index 926d8851d2..b2c41756e5 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot_5.2.8.bb
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot_5.2.8.bb
@@ -32,7 +32,7 @@ BBCLASSEXTEND = "native"
 DEPENDS_class-native = "readline-native"
 PACKAGECONFIG_class-native = ""
 
-SRC_URI_append_class-native = "file://0001-reduce-build-to-conversion-tools-for-native-build.patch"
+SRC_URI_append_class-native = " file://0001-reduce-build-to-conversion-tools-for-native-build.patch"
 
 do_install_class-native() {
     install -d ${D}${bindir}
diff --git a/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb b/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb
index a081cb17a8..27fe0e2c40 100644
--- a/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb
+++ b/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb
@@ -31,4 +31,4 @@ FILES_statgrab-dbg = "${bindir}/.debug/statgrab"
 FILES_saidar = "${bindir}/saidar"
 FILES_saidar-dbg = "${bindir}/.debug/saidar"
 FILES_${PN}-mrtg = "${bindir}/statgrab-make-mrtg-config ${bindir}/statgrab-make-mrtg-index"
-RDEPENDS_${PN}-mrtg_append = "perl statgrab"
+RDEPENDS_${PN}-mrtg_append = " perl statgrab"
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
index 2b884e3a1b..b3ea44c3c3 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
@@ -69,10 +69,10 @@ COMPATIBLE_MACHINE_mips = "(!.*mips).*"
 COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
 COMPATIBLE_MACHINE_powerpc = "(!.*ppc).*"
 
-TARGET_CFLAGS_append_riscv32 += "-fpic"
-TARGET_CXXFLAGS_append_riscv32 += "-fpic"
-TARGET_CFLAGS_append_riscv64 += "-fpic"
-TARGET_CXXFLAGS_append_riscv64 += "-fpic"
+TARGET_CFLAGS_append_riscv32 = " -fpic"
+TARGET_CXXFLAGS_append_riscv32 = " -fpic"
+TARGET_CFLAGS_append_riscv64 = " -fpic"
+TARGET_CXXFLAGS_append_riscv64 = " -fpic"
 
 do_install[cleandirs] += "${WORKDIR}/minifi-install"
 
diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses_2.55.0.bb b/meta-oe/recipes-graphics/libyui/libyui-ncurses_2.55.0.bb
index ba94a838a9..15c40ee31f 100644
--- a/meta-oe/recipes-graphics/libyui/libyui-ncurses_2.55.0.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui-ncurses_2.55.0.bb
@@ -21,7 +21,7 @@ DEPENDS += "boost libyui ncurses"
 BBCLASSEXTEND = "nativesdk"
 
 EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RELWITHDEBINFO"
-EXTRA_OECMAKE_append_toolchain-clang = "-DENABLE_WERROR=OFF"
+EXTRA_OECMAKE_append_toolchain-clang = " -DENABLE_WERROR=OFF"
 
 do_configure_prepend () {
     cd ${S}
diff --git a/meta-oe/recipes-support/anthy/anthy_9100h.bb b/meta-oe/recipes-support/anthy/anthy_9100h.bb
index 9d78c3457c..a83efe03c8 100644
--- a/meta-oe/recipes-support/anthy/anthy_9100h.bb
+++ b/meta-oe/recipes-support/anthy/anthy_9100h.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://osdn.dl.sourceforge.jp/anthy/37536/anthy-9100h.tar.gz \
     file://2ch_t.patch \
 "
 
-SRC_URI_append_class-target = "file://target-helpers.patch"
-SRC_URI_append_class-native = "file://native-helpers.patch"
+SRC_URI_append_class-target = " file://target-helpers.patch"
+SRC_URI_append_class-native = " file://native-helpers.patch"
 
 SRC_URI[md5sum] = "1f558ff7ed296787b55bb1c6cf131108"
 SRC_URI[sha256sum] = "d256f075f018b4a3cb0d165ed6151fda4ba7db1621727e0eb54569b6e2275547"
-- 
2.29.2

