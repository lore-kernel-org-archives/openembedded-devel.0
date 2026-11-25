Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37935.1795594082740323560
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=sHqPZG4z;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15ea896ddc8so9153163c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594082; x=1796198882; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dVaxF50N0/1bWt5CHjefTO5ZJgap84UxqviqGUqL22A=;
        b=sHqPZG4zeom0o1HOVh4awQKA/Biz8K5rqQaWQVMf0Mq0xJ2k0a50sr63joWiayBYIZ
         kAcepuFaMXAM3VsT44os7mCpMoqoO+c0zgu+DjJv3md8YPQVBCQLCLp0tI5shcjdtEX3
         9fUuS6vM3zpdWyO1JjxYpfeFACPJDmEREjSVRHqDlR13mLTY4rWbXKtIpW49XUZY4uoz
         RYfr/QAjfC55Lg+SVgglOZjx8aD+TQYMjZmA7dpd72y3rjlRaXcZtQ+0pue/nt5DCOog
         7DnSeD6gFQ8aHHTvVxcnXsOxv7EOP8VRIIhKG9B+frSy8CFjG6hIDcxoh2gtwDyw2Go+
         LVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594082; x=1796198882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dVaxF50N0/1bWt5CHjefTO5ZJgap84UxqviqGUqL22A=;
        b=SBmGVXp/pZjku6imGYjXut80TFxF0r0bfX7FiUwFeE+Gh88wygMghUd2Nz3mHTGXgM
         i2XUiIVG08CGEkFCOwoOC8gPKREaHKJclzy7PhAPKnsCoGWLuR6FXbzABxy2U00+bioA
         p2spv5HwM07I3B0fEiC+o1xjyxiz9K0titDCF6yjI+Gh5wlrahxJTTPWLxrYpT+cvEnR
         o5T4epk3LPN9wRieCbPjKkL2QedbYeXU95YvjsTIBimw5fcjWmrjC+Ijp4XR2AiBNhvr
         PV7/AHgyu5Z+44WUcE2iy1pVSLRm3LO+UGMCvMwKPocRy7BophTI/YiPD5i13OkwX4kn
         Dipg==
X-Gm-Message-State: APuU4Z8Nzc9UYOsugmBXE9T92BkEA7N2JP4YXerfJu7l1dknGah0/pIH
	fN9BiZbfA54YWWDk5IYrQCOErKuEPpiiVoFuvTAJiDqV6S4EpfeDoGLmNtWyPnMY
X-Gm-Gg: AZFdTZeph39TXEH7DhkLZw/xevp83m2fMa8yk1VtQzaNdiqb1zvsKzwTtsb9mTgV12s
	8b46LDUiLRkdd8Qs+F++01ZK+sw5yJdQ37mRE4D/681r8MF3IjH+cA9EaXgwK64VxK9smDr5n+X
	atqX9mhcNIHBruWXOinLBCPESZLjP0cpqmze/WruMIObswqQP4LI8+e0f7uEQHt6m7V+1Ldc1FI
	OddwwQMtG2qMH4V5rfF7yznaUuC/fSSE/Q3VcABYav8criVaMGMYInAM8tTq4t9MQcUWl5gFF3P
	SkTajYrNsez2G0V0gqmoZQm2wV31IrcpFY1ANqDemtmTXJznTDoOqeB4Vy6+FmzJ/p1YBC57reO
	k/Mrfd7bHIYgx+frSE+UI6CGUt4EP9FgcX91Sd70sKmJl7qXdvg0RbBfnm9S6cG/5v2fPDlfI8B
	5j/5VryzGo0wB1drVsl7V3/dxt8aNIl3MxSUGnxXzU6p1Qf/uwENB6qer3FL7jootKKlrHCjXEU
	Q6qH4dSBbyIpFY2JdwapviyzpHrIGeHAn6AhPWpeZXHaXlpuJFvZ+52YPtalQy7rhB9PlEiB4+P
	5Ehqn3yUBb4Z+laLNZIOuO8wkI171BDyA2cqVO+iQg7CK+TJ0cGvenLkbxeU6K+DCD4XPsZbw8h
	58MomcydVgFVMqpRLWahMgFZ65/DnPYiWGS//NlaDe/RnpE/4eg6bFmSCsg51m9fuvxtbsfhCBy
	t741ZDX0AXLsk1Ov1qOa8HfiQwHnrG3cx1n/Lvv/33i5S8+hh9mZXJLdnbplfxiFdzxp12a9kQ8
	aZqYR3oNT7W0C+MC5FBf68cSx1dzWhRBvljwR8hO/fIdnAlGtd0N9pf0U4tRn6jlfteBej8DlGp
	EADG
X-Received: by 2002:a05:7301:6184:20b0:386:b006:c8 with SMTP id 5a478bee46e88-386b0060806mr9007860eec.35.1795594081750;
        Wed, 25 Nov 2026 00:08:01 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 15/55] pstack: upgrade 2.18.4 -> 2.19.1
Date: Wed, 25 Nov 2026 00:06:31 -0800
Message-ID: <20261125080732.2419614-21-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133018
Content-Type: text/plain; charset="utf-8"

- Add Go goroutine support
- pyrdb prints many more Python value types (float, complex, bytearray,
  slice, range, set, ...) and handles Python 3.12 integers; updated
  offsets for Python 3.12 and 3.14 and 32-bit fixes
- Robustness: bounds-check reader operations, tolerate broken program
  headers in debug images and use PT_DYNAMIC for symbol hash tables
- Don't deliver SIGTRAP to a process while waiting to attach; less
  scanning of core notes

pstack_2.18.4.bb was copied from the tk recipe when it was added and
never built pstack. Replace it and pstack_git.bb (2.11) with one recipe
using pstack.inc. Use the upstream install rules, which also install the
soname links the hand-written do_install missed, skip the install RPATH
and package the unversioned libhdbg.so LD_PRELOAD library separately.
Drop the cross-compile test patch, which is upstream, and add an
upstream check.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...e-issue-of-cross-compilation-failure.patch | 28 ---------------
 meta-oe/recipes-devtools/pstack/pstack.inc    | 28 ++++-----------
 .../recipes-devtools/pstack/pstack_2.18.4.bb  | 35 -------------------
 .../{pstack_git.bb => pstack_2.19.1.bb}       |  9 +++--
 4 files changed, 11 insertions(+), 89 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/pstack/files/0001-tests-fix-the-issue-of-cross-compilation-failure.patch
 delete mode 100644 meta-oe/recipes-devtools/pstack/pstack_2.18.4.bb
 rename meta-oe/recipes-devtools/pstack/{pstack_git.bb => pstack_2.19.1.bb} (52%)

diff --git a/meta-oe/recipes-devtools/pstack/files/0001-tests-fix-the-issue-of-cross-compilation-failure.patch b/meta-oe/recipes-devtools/pstack/files/0001-tests-fix-the-issue-of-cross-compilation-failure.patch
deleted file mode 100644
index 2b54750e7a..0000000000
--- a/meta-oe/recipes-devtools/pstack/files/0001-tests-fix-the-issue-of-cross-compilation-failure.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From a8c3996d3f8d9b8f3a2888b7062c1139263c5aba Mon Sep 17 00:00:00 2001
-From: Wen Yang <yellowriver2010@hotmail.com>
-Date: Mon, 23 Jun 2025 02:06:53 +0800
-Subject: [PATCH] tests: fix the issue of cross compilation failure
-
-By replacing objcopy with MAKE_OBJCOPY, pstack could support both
-native and cross compilation.
-
-Upstream-Status: Backport [https://github.com/peadar/pstack/pull/38]
----
- tests/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
-index 71a62a7..bf11a04 100644
---- a/tests/CMakeLists.txt
-+++ b/tests/CMakeLists.txt
-@@ -38,7 +38,7 @@ SET_TARGET_PROPERTIES(noreturn PROPERTIES COMPILE_FLAGS "-O2 -g")
-
- add_custom_command(
-    OUTPUT basic-no-unwind-gen
--   COMMAND objcopy --strip-debug --remove-section .eh_frame basic basic-no-unwind
-+   COMMAND ${CMAKE_OBJCOPY} --strip-debug --remove-section .eh_frame basic basic-no-unwind
-    VERBATIM )
-
- add_custom_target(basic-no-unwind ALL DEPENDS basic basic-no-unwind-gen)
---
-2.25.1
diff --git a/meta-oe/recipes-devtools/pstack/pstack.inc b/meta-oe/recipes-devtools/pstack/pstack.inc
index 778438a272..e2b255873a 100644
--- a/meta-oe/recipes-devtools/pstack/pstack.inc
+++ b/meta-oe/recipes-devtools/pstack/pstack.inc
@@ -15,27 +15,13 @@ DEPENDS += "zlib xz libunwind elfutils"
 
 RDEPENDS:${PN} += "elfutils"
 
-do_install() {
-    install -d ${D}${bindir}
-    install -m 0755 ${B}/pstack ${D}${bindir}/pstack
-
-    install -d ${D}${libdir}
-    install -m 0755 ${B}/libprocman.so.${PV} ${D}${libdir}/libprocman.so.${PV}
-    ln -sf libprocman.so.${PV} ${D}${libdir}/libprocman.so
-    install -m 0755 ${B}/libdwelf.so.${PV}  ${D}${libdir}/libdwelf.so.${PV}
-    ln -sf libdwelf.so.${PV}  ${D}${libdir}/libdwelf.so
-}
-
-PACKAGES = "${PN}"
-FILES:${PN} = "${bindir}/pstack"
-FILES:${PN} += "${libdir}/libprocman.so.${PV}"
-FILES:${PN} += "${libdir}/libdwelf.so.${PV}"
-
-PACKAGES += "${PN}-dbg"
-FILES:${PN}-dbg += "${base_bindir}/.debug ${base_sbindir}/.debug ${bindir}/.debug ${sbindir}/.debug"
-
-PACKAGES += "${PN}-dev"
-FILES:${PN}-dev += "${base_libdir}/*.so"
+EXTRA_OECMAKE += "-DCMAKE_SKIP_INSTALL_RPATH=ON"
+
+# libhdbg.so is an unversioned LD_PRELOAD heap debugging library
+PACKAGES =+ "${PN}-hdbg"
+FILES:${PN}-hdbg = "${libdir}/libhdbg.so"
+
+FILES:${PN} += "${datadir}/pstack"
 
 TOOLCHAIN = "gcc"
 
diff --git a/meta-oe/recipes-devtools/pstack/pstack_2.18.4.bb b/meta-oe/recipes-devtools/pstack/pstack_2.18.4.bb
deleted file mode 100644
index 8a1e1c6664..0000000000
--- a/meta-oe/recipes-devtools/pstack/pstack_2.18.4.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY = "A from-scratch implementation of pstack using DWARF debugging \
-and unwind information. Works for C/C++, Go, Rust, and Python."
-
-HOMEPAGE = "https://github.com/peadar/pstack"
-SECTION = "devel/pstack"
-
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=671019a96ba80415b696240ed2ca5e80"
-
-DEPENDS = "tcl virtual/libx11 libxt zip-native"
-
-SRC_URI = "git://github.com/peadar/pstack;branch=master;tag=v${PV};protocol=https \
-           file://0001-reader.h-include-cstdint-for-uintmax_t-intmax_t.patch \
-          "
-SRCREV = "b78d16e9497fd36350e4e8bd37f31f8dab5b5651"
-
-PACKAGES =+ "${PN}-lib"
-
-SOLIBS = ".so"
-FILES_SOLIBSDEV = ""
-
-# isn't getting picked up by shlibs code
-RDEPENDS:${PN} += "tk-lib"
-RDEPENDS:${PN}:class-native = ""
-
-BBCLASSEXTEND = "native nativesdk"
-
-inherit binconfig features_check
-
-REQUIRED_DISTRO_FEATURES = "x11"
-
-SYSROOT_DIRS += "${bindir_crossscripts}"
-
-# Fix some paths that might be used by Tcl extensions
-BINCONFIG_GLOB = "*Config.sh"
diff --git a/meta-oe/recipes-devtools/pstack/pstack_git.bb b/meta-oe/recipes-devtools/pstack/pstack_2.19.1.bb
similarity index 52%
rename from meta-oe/recipes-devtools/pstack/pstack_git.bb
rename to meta-oe/recipes-devtools/pstack/pstack_2.19.1.bb
index 0785ef2ab7..c791354307 100644
--- a/meta-oe/recipes-devtools/pstack/pstack_git.bb
+++ b/meta-oe/recipes-devtools/pstack/pstack_2.19.1.bb
@@ -1,9 +1,8 @@
 require pstack.inc
 
-SRCREV = "1e1734be3adb6d9c81b57c5cc3d0c8fbc43bdee3"
-PV = "2.11"
-
-SRC_URI = "git://github.com/peadar/pstack.git;branch=master;protocol=https \
-           file://0001-tests-fix-the-issue-of-cross-compilation-failure.patch \
+SRC_URI = "git://github.com/peadar/pstack.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-reader.h-include-cstdint-for-uintmax_t-intmax_t.patch \
           "
+SRCREV = "6bb443b3fe8f6515cdae33b908780627aac92b96"
+
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
