Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B11C47DDB
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 05:24:19 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.9213.1706765052171425837
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Jan 2024 21:24:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TM/OHqJ/;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6e1270e8cd3so250838a34.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 Jan 2024 21:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706765051; x=1707369851; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tw6gc4cZ7L572VTHGjiaRTB+EgJa6BL2HDlb0Kdz5zE=;
        b=TM/OHqJ/N8yGhe2PWeGxeMpCu9EGeZS5hPjVrgsyoAko9L1prFnaeJIbrDXUbF2awe
         4YtOi6vHJTIe9D8TJ5jVTUhXPd22f+pVxQgUQSm3nLjcclDuonYvphHL/E2aU3eR8xL5
         WxL6tgVK/WpBFw2Co1T29IDLZjxWWbxiUgxGWUwidzapK8nCGcsq7P1Dz9Rj8MnCtqrv
         IH232ZLrfDY2MUVHI5qv9YfT7JkB5MIzdGHTLO6yzzhryLQUXss7VcoMnkJofoDlClCz
         rRPJpAKJXLywPW8Zw4vXBcN9fTj4g1OxZuaJnEblFlRPllKDkbQjfxk2xOoP4Onk4VkK
         rj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706765051; x=1707369851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tw6gc4cZ7L572VTHGjiaRTB+EgJa6BL2HDlb0Kdz5zE=;
        b=C1dGZg3Hfl9dR0cKcWpzBiYlmMc26tdQ7ZhV/rZLrpjIAkHCyqEm+jwYd5xhcmhO2G
         73D7F1iPy/tzRMM8Cd/tmyRnHj2V7YUUoc8bSFSoDCVquhmCFGj4+HlfN+3x+mNIEWVV
         X4w5w2cvzUEz8371/1Qe/UxuLbqVoW8h2dpnkzNUCSqEJzvusW++l8JCVDNtXxIg90yu
         97hLBHJC64j9/gR5lfqxquoBFQnbcAC8GZJtxGrhYZKWF3YeoN2YWdFb/gaNl/YU/6X3
         /TKl8cioP5ZMBIv9GConuO1kAer6h3qlW4hjF0sSrhuUXZucQRnzJCltDIUuKZLWCwni
         +Fnw==
X-Gm-Message-State: AOJu0YxaT5WxGXMiNOamMKi58awaQSAZDGTax5bIQ5HAUikCpQdPGlto
	Goypi+HGYbvPjEpQNvDKiEBIWX0uDsQCuRIlTOuR8hMaRd2mP+Q9nBvtOqcSpNE=
X-Google-Smtp-Source: AGHT+IGX6/k6S3k9xaCli8QdbWADZwmeRCm6sx1GIXhm+EFZwKSdnzlF/lHHEoHkEpGNxjEJjoTavA==
X-Received: by 2002:a9d:4e95:0:b0:6e1:3d4b:4b27 with SMTP id v21-20020a9d4e95000000b006e13d4b4b27mr3862822otk.27.1706765051107;
        Wed, 31 Jan 2024 21:24:11 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::8157])
        by smtp.gmail.com with ESMTPSA id i129-20020a636d87000000b005cee9115cb3sm11762503pgc.0.2024.01.31.21.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 21:24:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] breakpad: Upgrade to 2023.06.01 release
Date: Wed, 31 Jan 2024 21:24:08 -0800
Message-ID: <20240201052408.3527135-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Feb 2024 05:24:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108512

Add a backport to fix build with latest clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ixed-missing-include-for-std-find_if.patch | 31 +++++++++++++++++++
 ...breakpad_git.bb => breakpad_2023.06.01.bb} | 11 +++----
 2 files changed, 35 insertions(+), 7 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/breakpad/breakpad/0001-Fixed-missing-include-for-std-find_if.patch
 rename meta-oe/recipes-devtools/breakpad/{breakpad_git.bb => breakpad_2023.06.01.bb} (96%)

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0001-Fixed-missing-include-for-std-find_if.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0001-Fixed-missing-include-for-std-find_if.patch
new file mode 100644
index 0000000000..943daf4d00
--- /dev/null
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0001-Fixed-missing-include-for-std-find_if.patch
@@ -0,0 +1,31 @@
+From 45ea097e864e566771d756c92619e984815acd1e Mon Sep 17 00:00:00 2001
+From: Nathan Moinvaziri <nathan@nathanm.com>
+Date: Tue, 19 Dec 2023 14:35:05 -0800
+Subject: [PATCH] Fixed missing include for std::find_if.
+
+Throws an error when compiling on Windows.
+
+Upstream-Status: Backport [https://github.com/google/breakpad/commit/898a997855168c0e6a689072fefba89246271a5d]
+Change-Id: Ieb34c00cf199aaa1b45a440086c48b8ed363b3c7
+Reviewed-on: https://chromium-review.googlesource.com/c/breakpad/breakpad/+/5137658
+Reviewed-by: Ivan Penkov <ivanpe@chromium.org>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/common/module.cc | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/common/module.cc b/src/common/module.cc
+index 0eb5aad8..b6f5da7e 100644
+--- a/src/common/module.cc
++++ b/src/common/module.cc
+@@ -42,6 +42,7 @@
+ #include <stdio.h>
+ #include <string.h>
+ 
++#include <algorithm>
+ #include <functional>
+ #include <iostream>
+ #include <memory>
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb b/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb
similarity index 96%
rename from meta-oe/recipes-devtools/breakpad/breakpad_git.bb
rename to meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb
index 3462b846d3..3bf4371e85 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb
@@ -18,22 +18,18 @@ BBCLASSEXTEND = "native"
 
 PE = "2"
 
-PV = "1.0"
+SRCREV_FORMAT = "breakpad_gtest_protobuf_lss"
 
-SRCREV_FORMAT = "breakpad_gtest_protobuf_lss_gyp"
-
-SRCREV_breakpad = "7a1a190f4f68e8a3e06788498f50a4d5520a69f3"
-#v1.10.0
+SRCREV_breakpad = "8988364bcddd9b194b0bf931c10bc125987330ed"
+#v1.11.0
 SRCREV_gtest = "e2239ee6043f73722e7aa812a459f54a28552929"
 SRCREV_protobuf = "cb6dd4ef5f82e41e06179dcd57d3b1d9246ad6ac"
 SRCREV_lss = "9719c1e1e676814c456b55f5f070eabad6709d31"
-SRCREV_gyp = "324dd166b7c0b39d513026fa52d6280ac6d56770"
 
 SRC_URI = "git://github.com/google/breakpad;name=breakpad;branch=main;protocol=https \
            git://github.com/google/googletest.git;destsuffix=git/src/testing/gtest;name=gtest;branch=main;protocol=https \
            git://github.com/protocolbuffers/protobuf.git;destsuffix=git/src/third_party/protobuf/protobuf;name=protobuf;branch=master;protocol=https \
            git://chromium.googlesource.com/linux-syscall-support;protocol=https;branch=main;destsuffix=git/src/third_party/lss;name=lss \
-           git://chromium.googlesource.com/external/gyp;protocol=https;destsuffix=git/src/tools/gyp;name=gyp;branch=master \
            file://0001-include-sys-reg.h-to-get-__WORDSIZE-on-musl-libc.patch \
            file://0003-Fix-conflict-between-musl-libc-dirent.h-and-lss.patch \
            file://0001-Turn-off-sign-compare-for-musl-libc.patch \
@@ -41,6 +37,7 @@ SRC_URI = "git://github.com/google/breakpad;name=breakpad;branch=main;protocol=h
            file://0004-elf_reader.cc-include-sys-reg.h-to-get-__WORDSIZE-on.patch \
            file://mcontext.patch \
            file://0001-Remove-HAVE_GETCONTEXT-check-to-add-local-implementa.patch \
+           file://0001-Fixed-missing-include-for-std-find_if.patch \
            file://0001-lss-Match-syscalls-to-match-musl.patch;patchdir=src/third_party/lss \
            file://mips_asm_sgidefs.patch;patchdir=src/third_party/lss \
 "
-- 
2.43.0


