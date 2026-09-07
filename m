Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 541D8C79F9E
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 04:26:46 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27603.1788755201110702261
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Sep 2026 21:26:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dS96PzZM;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d715f4a587so44833675ad.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 06 Sep 2026 21:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788755200; x=1789360000; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tcpu2tayQ3MjjMQOJ/znVq+TC/V7Sziy0CWcjxvoMig=;
        b=dS96PzZMVvnCSp/zdvAqKwMZZmdqIsCSkA7w28otajC4Zz7fkDiY7eOkPNQY6W646D
         HMlpr3V/NwJ9TMBJeNAojHPzHRAljzSdmdmkB1gdeEpzd1/2rw7zjE+d4PB/EpmQqaZX
         ePfkTLCVcS9LsVAKsZPl3AaSXvIBba3jeKFcthTbrDDCpsh3aAKBWowCTMKfLV1wZZ1N
         dtGGhvvj/fystYZT/2baWvSvWyCG7sy56YipIdyXq4YQhK0w9NXYKZ5CXLOvMRpC6tBr
         i2t2sKfOgf7Y6vls37AH1wNdb6EKYr4L2jy9ollsqGoty8c5LTsrPW+7Uj1MC6AAuQIK
         w+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788755200; x=1789360000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tcpu2tayQ3MjjMQOJ/znVq+TC/V7Sziy0CWcjxvoMig=;
        b=ftKQ6opflhtQ++G203lqnBXG39bcGnqsPRsMknhuOVz7puV+BJRCZnF374GSkzaf1s
         sq1JKrCVqrboN+audaOzTzBllnB7gWWB6XjuDJbngCLwtPsFWwHUTmquS6gGsUYYpEPI
         6X7URdtOGU7j+sOHyDDHTFfftl62csC8nm1aPDJV5rPPmVwme9il7rRPSaW99X7ZrnSl
         jkYHNW1E8+VGn9y8TsUBPdvjRDgJkHMOTJlU9rCD+NO1EINOqNDzTHSV3ncy0YvGRrGs
         nOeSB5wPvsHy4CT8FRSjNkfSJwdJ36emR2uCg7c6vlDUSOr9pYH9GUEGmifLAWiQ9lYO
         KaEw==
X-Gm-Message-State: AFuF++k7D54NsxXRLmjdZV1rT8CmAgo4Q3uJgf6OR3PmW45Zd/cobOvQ
	dhUN79P4pfyiIR5dfI+FfGXzaf5i2Wc5BSC6obMzx8iA+yu56mleQ75sPgeN+Q==
X-Gm-Gg: AYBFou0AV7a0kUGmzhJQayb+STqzObOME5SNpf8T9O0urERGxDHvo+WbEMpuPlyILyG
	YczCXrw5oCWm1wiWjDry8b/KLSmxdQD+dOiWXdJFEUBygxfABRiriN3tQ3kIKrounBYLmqjOm15
	Nvg/znk+uNPkJkbivExlBT3AQ5DTjwi/4nCcA/LmzQmZZKMDq/X6YpD0rCcSgVsoNnQhnZdLyMD
	hD41Z4MMu5EL4wO94Z2fbtZI9MYT8u1sqD8+W92fMEOFr/yO1dii/Q29s7I5/BXgod3/s+d0ENp
	lTpIZ8Vs7qC8IzHCuchReU9EHVgdD0Puo0DC/CsO0ek7O43yOy4afDMIhRxRWK/Z9ySSeIRthkA
	9FMl3UJ3r55ZcN2nEJgrDrBVgnJ/aJzDEJ0gZtlBfr63je4vhUIq5JJiDKDxtmTtgxLhQ63HquS
	mW80w7ThikSgxPSdbxBD1MDwL2+4OlNsPA+MrrblAERDj/Ex2McIFbEtwNDCexEo72pNMQba3Av
	jRT4XP4t8eyUjpvnQmZTg4bOdbbAWcwPegZBijCbbQJ/N049RL4GQKzU5jYA8lUXFdvlcCb+T5c
	bfp1cm/Rqppt5aw8lTMXgPfzFRmp31RsaTnQQuV9YqwGAomhc/QkbSW9LEOJ6HpIbYvA4/R1OFk
	R/rpuCg8Ks0PpkPjDLFW/nqkCGZtBjhSc9TUYDcKQGy0EUA==
X-Received: by 2002:a17:90b:28cc:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-39b260e13d5mr31076133a91.1.1788755200314;
        Sun, 06 Sep 2026 21:26:40 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432423f99fsm21954206c88.1.2026.09.06.21.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:26:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 2/2] bpftrace: Upgrade to 0.26.1
Date: Sun,  6 Sep 2026 21:26:36 -0700
Message-ID: <20260907042636.1476474-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907042636.1476474-1-khem.raj@oss.qualcomm.com>
References: <20260907042636.1476474-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 04:26:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129801

Fix build with LLVM 23

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ....txt-allow-to-set-BISON_FLAGS-like-l.patch | 39 -------------------
 ...lderBPF-Fix-HasTerminator-on-LLVM-23.patch | 38 ++++++++++++++++++
 ...5-CMakeLists-Add-support-for-LLVM-23.patch | 36 +++++++++++++++++
 ...{bpftrace_0.25.1.bb => bpftrace_0.26.1.bb} | 14 +++----
 4 files changed, 80 insertions(+), 47 deletions(-)
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0002-CMakeLists.txt-allow-to-set-BISON_FLAGS-like-l.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0004-IRBuilderBPF-Fix-HasTerminator-on-LLVM-23.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0005-CMakeLists-Add-support-for-LLVM-23.patch
 rename meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/{bpftrace_0.25.1.bb => bpftrace_0.26.1.bb} (87%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0002-CMakeLists.txt-allow-to-set-BISON_FLAGS-like-l.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0002-CMakeLists.txt-allow-to-set-BISON_FLAGS-like-l.patch
deleted file mode 100644
index c9e1749dd5..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0002-CMakeLists.txt-allow-to-set-BISON_FLAGS-like-l.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From ce5d908bb1256ede680fbfd521f087060a567dca Mon Sep 17 00:00:00 2001
-From: Martin Jansa <martin.jansa@gmail.com>
-Date: Tue, 3 Sep 2024 14:17:51 +0200
-Subject: [PATCH] CMakeLists.txt: allow to set BISON_FLAGS like -l
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
-
-Upstream-Status: Pending
----
- CMakeLists.txt | 10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
-
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -108,16 +108,21 @@ include_directories(SYSTEM ${LIBCEREAL_I
-
- find_package(BISON REQUIRED)
- find_package(FLEX REQUIRED)
-+
-+# avoid buildpaths in generated #line statements and allow to pass --file-prefix-map=OLD=NEW
-+set(BISON_FLAGS "${BISON_FLAGS} -l")
-+set(FLEX_FLAGS "${FLEX_FLAGS} -L")
-+
- # `parser_class_name` is deprecated and generates warnings in bison >= 3.3.
- # But `api.parser.class` is not supported in bison < 3.3. So we must inject
- # the %define based on the bison version here.
- if(${BISON_VERSION} VERSION_GREATER_EQUAL 3.3)
--  set(BISON_FLAGS "-Dapi.parser.class={Parser} -Wcounterexamples")
-+  set(BISON_FLAGS "${BISON_FLAGS} -Dapi.parser.class={Parser} -Wcounterexamples")
- else()
--  set(BISON_FLAGS "-Dparser_class_name={Parser} -Wcounterexamples")
-+  set(BISON_FLAGS "${BISON_FLAGS} -Dparser_class_name={Parser} -Wcounterexamples")
- endif()
- bison_target(bison_parser src/parser.yy ${CMAKE_BINARY_DIR}/parser.tab.cc COMPILE_FLAGS ${BISON_FLAGS} VERBOSE)
--flex_target(flex_lexer src/lexer.l ${CMAKE_BINARY_DIR}/lex.yy.cc)
-+flex_target(flex_lexer src/lexer.l ${CMAKE_BINARY_DIR}/lex.yy.cc COMPILE_FLAGS ${FLEX_FLAGS})
- add_flex_bison_dependency(flex_lexer bison_parser)
- add_library(parser STATIC ${BISON_bison_parser_OUTPUTS} ${FLEX_flex_lexer_OUTPUTS})
- target_compile_options(parser PRIVATE "-w")
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0004-IRBuilderBPF-Fix-HasTerminator-on-LLVM-23.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0004-IRBuilderBPF-Fix-HasTerminator-on-LLVM-23.patch
new file mode 100644
index 0000000000..f224ca3d81
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0004-IRBuilderBPF-Fix-HasTerminator-on-LLVM-23.patch
@@ -0,0 +1,38 @@
+From d09a791bb88c69c34dd2e294213ed2a47568267f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Viktor=20Mal=C3=ADk?= <viktor.malik@gmail.com>
+Date: Tue, 18 Aug 2026 21:47:37 +0200
+Subject: [PATCH] IRBuilderBPF: Fix HasTerminator on LLVM 23 (#5298)
+
+LLVM 23 changed the implementation of BasicBlock::getTerminator(), which
+now doesn't check that a basic block actually has a terminator and
+should only be called after a successful BasicBlock::hasTerminator()
+check. Add the check to IRBuilderBPF::HasTerminator() for LLVM 23.
+
+Signed-off-by: Viktor Malik <viktor.malik@gmail.com>
+
+Upstream-Status: Backport [https://github.com/bpftrace/bpftrace/commit/d09a791bb88c69c34dd2e294213ed2a47568267f]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/ast/irbuilderbpf.cpp | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/src/ast/irbuilderbpf.cpp b/src/ast/irbuilderbpf.cpp
+index fb94f9bdde6b..2a2ac6209c19 100644
+--- a/src/ast/irbuilderbpf.cpp
++++ b/src/ast/irbuilderbpf.cpp
+@@ -2512,7 +2512,13 @@ llvm::Value *IRBuilderBPF::CreateCheckedBinop(Binop &binop,
+ bool IRBuilderBPF::HasTerminator()
+ {
+   BasicBlock *current_block = GetInsertBlock();
+-  return current_block && current_block->getTerminator();
++  if (!current_block)
++    return false;
++#if LLVM_VERSION_MAJOR >= 23
++  if (!current_block->hasTerminator())
++    return false;
++#endif
++  return current_block->getTerminator();
+ }
+
+ } // namespace bpftrace::ast
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0005-CMakeLists-Add-support-for-LLVM-23.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0005-CMakeLists-Add-support-for-LLVM-23.patch
new file mode 100644
index 0000000000..b5f7f0e3dc
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0005-CMakeLists-Add-support-for-LLVM-23.patch
@@ -0,0 +1,36 @@
+From f0768d0a3d08b4ba7fbc85f874fbe905cd4a6880 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Viktor=20Mal=C3=ADk?= <viktor.malik@gmail.com>
+Date: Wed, 19 Aug 2026 09:25:25 +0200
+Subject: [PATCH] Add support for LLVM 23 (#5299)
+
+- Bump MAX_LLVM_MAJOR
+- Add new Nix targets
+- Bump BCC version to the commit fixing LLVM 23 build
+- Adjust CI jobs
+
+Also drop support for LLVM 18. Since the Nix fuzz shell depended on LLVM
+18, move that to 22.
+
+Signed-off-by: Viktor Malik <viktor.malik@gmail.com>
+
+Only the CMakeLists.txt hunk is backported here; the Nix and CI changes of
+the original commit do not apply to an OE build, and the BCC bump is
+handled by the bcc recipe.
+
+Upstream-Status: Backport [https://github.com/bpftrace/bpftrace/commit/f0768d0a3d08b4ba7fbc85f874fbe905cd4a6880]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index baea14e65c60..a781bf347d61 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -156,7 +156,7 @@ if(CMAKE_BUILD_TYPE STREQUAL "Debug")
+   # releases.
+   set(MAX_LLVM_MAJOR 999)
+ else()
+-  set(MAX_LLVM_MAJOR 22)
++  set(MAX_LLVM_MAJOR 23)
+ endif()
+
+ if((${LLVM_VERSION_MAJOR} VERSION_LESS ${MIN_LLVM_MAJOR}) OR (${LLVM_VERSION_MAJOR} VERSION_GREATER ${MAX_LLVM_MAJOR}))
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.25.1.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.26.1.bb
similarity index 87%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.25.1.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.26.1.bb
index 7daf02ba1c..44e32cb9a4 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.25.1.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.26.1.bb
@@ -3,9 +3,7 @@ HOMEPAGE = "https://github.com/iovisor/bpftrace"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"

-DEPENDS += "bison-native \
-            flex-native \
-            gzip-native \
+DEPENDS += "gzip-native \
             elfutils \
             bpftool-native \
             bcc \
@@ -13,15 +11,16 @@ DEPENDS += "bison-native \
             libbpf \
             xxd-native \
             "
-DEPENDS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'pahole-native llvm-native', '', d)}"
+DEPENDS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'pahole-native llvm-native zip-native', '', d)}"

-SRC_URI = "git://github.com/iovisor/bpftrace;branch=release/0.25.x;protocol=https;tag=v${PV} \
+SRC_URI = "git://github.com/iovisor/bpftrace;branch=release/0.26.x;protocol=https;tag=v${PV} \
            file://run-ptest \
-           file://0002-CMakeLists.txt-allow-to-set-BISON_FLAGS-like-l.patch \
            file://0001-cmake-BuildBPF.cmake-introduce-DEBUG_PREFIX_MAP.patch \
            file://0003-cmake-BuildBPF.cmake-link-data-source-binary-without.patch \
+           file://0004-IRBuilderBPF-Fix-HasTerminator-on-LLVM-23.patch \
+           file://0005-CMakeLists-Add-support-for-LLVM-23.patch \
 "
-SRCREV = "e491811e5d648288c01f42ce087967b271f504a0"
+SRCREV = "1bac8a8daad6e0aa579980e877d0c9d5fc296593"

 inherit bash-completion cmake ptest pkgconfig

@@ -64,7 +63,6 @@ EXTRA_OECMAKE = " \
     -DUSE_SYSTEM_BPF_BCC=ON \
     -DUSE_SYSTEM_LIBBPF=ON \
     -DENABLE_MAN=OFF \
-    -DBISON_FLAGS='--file-prefix-map=${WORKDIR}=' \
 "

 PACKAGES:remove:powerpc64 = "${PN}-ptest"

