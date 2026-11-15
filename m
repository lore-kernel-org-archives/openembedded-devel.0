Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3842.1794729080695480347
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:51:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=tDY0bT+D;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-37f14feca60so20092eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729080; x=1795333880; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8dFMf9IC8yx3nZZFI0wHqxuVod4UFggfZ0xM0tXP2VE=;
        b=tDY0bT+DoOxBJcg30zLxW7WDt7Bt2TO1qznBR57F4oIHZIzsdO0VBsl2wph/ZaJdLJ
         C5xP4k4poSyWRHDYoe8lf1Hj8RhMR+RSr0PBtMBMq02szKZiPmEh631g1nOWFWX4ixjc
         svEtk35hHVf1YYC+8aV88fmNeBXjCBYSU2KCmqpB/t8GijP7voIgGaJ44iuiFlv+dyPL
         V0ddS3+joJFbZyqu7BNQSaE3bQ/mmcjcE5KY8wW1lP5MdPJf/9FP6ULYTwJCWvgVT2nC
         mj2cgy70sbjuTovsHB8lsE5C/yTjPY34LL1Uh/wPFAyI/y5w8q+A1/KXSXWlOMWYzFpG
         Rohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729080; x=1795333880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8dFMf9IC8yx3nZZFI0wHqxuVod4UFggfZ0xM0tXP2VE=;
        b=JR64lwRxocyedGiXhf+LH47EmA92BE6bU1k9PAOeQwJMmy0hSlyofBjUWYqxChPpck
         gBjZId8hMENQvmur6VMLl+sJEpvnNv6BkFZMmfyJqUmmWljnbM9R96IkTsb0242/OyPF
         +H8cIDLgYjJhnrWU5GIg16PviMOm6iNQYB66xBMnOynO5nJbhU88qH3mfvfs9mHIulLk
         J2Usg3MpyddbIGvLtmYIkzmNErXE5/PqykZ7OKnZ4PyCjIBdU1B6w08qKzJzJDvuB3KO
         /bDZ7780sxdpdsTulieR6V+3YKPcYX2nw+HBrBk4FQ5QWaiQ6W30ij+iEiLpSHIKYV+g
         1K/Q==
X-Gm-Message-State: APuU4Z9WCabuz/CXGI9ohUP0avuzd0TIrfXL3eeZb0jeJkACLCgHHwJw
	w/UEY9NSl01td5pKBNwbTt7gAVVjPtznTi+ZZj+3lpXDMxDJEcAFy7/S/BkZFgiQ
X-Gm-Gg: AYBFou20DYhImm6IUCps8O4J/KXIhgyAO+BMsrhm/pHXaXpi9TTkPAw2J35ejQfcgS8
	7dXiOeHL6Z/D/6zmCfI+O91iNNGHFXrW6Ds9dbNTmoF2njyn+vkroCgWMS9+NHOR73613gHKXJc
	ntrcug6dOrrw2l0jbPVfU51q1boOlPGNhWZeL6OejvdbqkXd2TO5VWJabQvhn7nBJkQxsI0z3IY
	AyGNXTh4lzsXxXynCJUDWXkdpigWSEGjWyzMA8VeoGKDsA2UzkAOPyihaTVzq7vdxuDn+r8cpLq
	Pj9KrZUb1LuSD2Hj6n3ZhAj/8FvDLmZI6+M290HSjIqxHdHtQnXpLBZqVS0R2Gh3T7TFDGdPyp1
	VSiKJXl3hS4sCOuBGZPjNe5yALGH2ngGIjhfjRRX5xYfOMQCtyJi8kEIdZDIq5ZSDKECZUcyJP4
	eNNpWjQqqtSPXGVRoBQNnjIAm1QBiTOIQqa8yqlR9GxxgE20f1O08p2cfBflnyF4zBydVqo/pa0
	x2AITpP2n6netZzO3GO6rNIF1HLTApnuJAOwHJzG8XuxET9/JlTK11z6rPKz/7jIf4Zq2b0sErN
	6VT8YhdPruiwgOoUZKzA4Gx3+NnhCuO94BDdiTeJuzt2xP2tsMROSaOPMXrksf8nkHWK51Wn95o
	TyZkbrI+xpaN8SRA0GktjXlh3ftvmSpwZOqUdt3+Cz8C4NB8cG7A6Xyb1SLNzqnRCjC1R5VZ+E+
	Hx3IQMccFWMcRlxmm98+JQpavScMxeHdCEgRsyBAFoMuQtuvyaYiW8fMHB9+eROBU8ki9fJXfr5
	6/XFw8cj2DL6M8BfTzYllR1sIaXrmvJpSbj4rl1wsGiK0bbe4kZisdSkZH1q9CUYN6R0wszCviB
	X27aNvGJjyzCxiwLKlWuf0nmdw==
X-Received: by 2002:a05:7300:6027:b0:360:e2e6:f849 with SMTP id 5a478bee46e88-37966e3b6c9mr7829141eec.28.1794729079971;
        Sat, 14 Nov 2026 23:51:19 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:51:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 73/96] tbb: upgrade 2023.1.0 -> 2023.2.0
Date: Sat, 14 Nov 2026 23:48:51 -0800
Message-ID: <20261115074918.2932593-73-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132343
Content-Type: text/plain; charset="utf-8"

This release adds the Thread Composability Manager (libtcm). Do not
copy it into the ptest directory as well, and do not hardcode the build
directory as RPATH of its test_premature_exit test.

ptests pass on qemux86-64.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ardcode-the-build-directory-as-RPATH.patch | 25 +++++++++++++++++++
 .../tbb/{tbb_2023.1.0.bb => tbb_2023.2.0.bb}  |  5 +++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/tbb/files/0001-tcm-test-Do-not-hardcode-the-build-directory-as-RPATH.patch
 rename meta-oe/recipes-support/tbb/{tbb_2023.1.0.bb => tbb_2023.2.0.bb} (94%)

diff --git a/meta-oe/recipes-support/tbb/files/0001-tcm-test-Do-not-hardcode-the-build-directory-as-RPATH.patch b/meta-oe/recipes-support/tbb/files/0001-tcm-test-Do-not-hardcode-the-build-directory-as-RPATH.patch
new file mode 100644
index 0000000000..1a488dd027
--- /dev/null
+++ b/meta-oe/recipes-support/tbb/files/0001-tcm-test-Do-not-hardcode-the-build-directory-as-RPATH.patch
@@ -0,0 +1,25 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 12 Nov 2026 00:00:00 -0800
+Subject: [PATCH] tcm/test: Do not hardcode the build directory as RPATH
+
+test_premature_exit is linked with -rpath pointing at the build output
+directory so that it can dlopen libtcm from there. When the tests are
+installed (e.g. as ptests) this leaks the build path into the binary,
+and libtcm is found in the regular library path anyway.
+
+Upstream-Status: Inappropriate [OE ptest specific]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+--- a/thread_composability_manager/test/CMakeLists.txt
++++ b/thread_composability_manager/test/CMakeLists.txt
+@@ -158,9 +158,6 @@
+   PRIVATE ${TCM_COMPILE_DEFINITIONS}
+   PRIVATE TCM_LIB_NAME="$<TARGET_FILE_NAME:TCM::tcm>"
+ )
+-if (UNIX)
+-  target_link_options(${TCM_TEST_PREMATURE_EXIT} PRIVATE -Wl,-rpath,${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
+-endif (UNIX)
+ target_include_directories(${TCM_TEST_PREMATURE_EXIT} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../include)
+ target_link_libraries(${TCM_TEST_PREMATURE_EXIT} PRIVATE Threads::Threads ${CMAKE_DL_LIBS})
+ add_test(NAME ${TCM_TEST_PREMATURE_EXIT} COMMAND ${TCM_TEST_PREMATURE_EXIT})
diff --git a/meta-oe/recipes-support/tbb/tbb_2023.1.0.bb b/meta-oe/recipes-support/tbb/tbb_2023.2.0.bb
similarity index 94%
rename from meta-oe/recipes-support/tbb/tbb_2023.1.0.bb
rename to meta-oe/recipes-support/tbb/tbb_2023.2.0.bb
index 08f6ddcfd2..7958fe956d 100644
--- a/meta-oe/recipes-support/tbb/tbb_2023.1.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2023.2.0.bb
@@ -13,11 +13,12 @@ DEPENDS:append:class-target = " hwloc"
 PE = "1"
 
 BRANCH = "onetbb_2023"
-SRCREV = "3046c8b0c29df995980003ea24f4d78c80ec0c8d"
+SRCREV = "41158a44ab3fb7ac5df7f99ef82626c87607447f"
 SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH} \
            file://run-ptest \
            file://0001-test-Skip-conformance_resumable_tasks-when-resumable.patch \
            file://0002-test-malloc_overload-Only-use-glibc-malloc-extension.patch \
+           file://0001-tcm-test-Do-not-hardcode-the-build-directory-as-RPATH.patch \
           "
 
 LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -Wl,--undefined-version', '', d)}"
@@ -79,12 +80,14 @@ do_install_ptest() {
 do_install_ptest:append:toolchain-gcc() {
     cp -rf ${B}/gnu* ${D}${PTEST_PATH}
     rm -rf ${D}${PTEST_PATH}/gnu*/libtbb*
+    rm -rf ${D}${PTEST_PATH}/gnu*/libtcm*
     rm -rf ${D}${PTEST_PATH}/gnu*/*.sh
 }
 
 do_install_ptest:append:toolchain-clang() {
     cp -rf ${B}/clang* ${D}${PTEST_PATH}
     rm -rf ${D}${PTEST_PATH}/clang*/libtbb*
+    rm -rf ${D}${PTEST_PATH}/clang*/libtcm*
     rm -rf ${D}${PTEST_PATH}/clang*/*.sh
 }
 
