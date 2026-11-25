Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37922.1795594073524767546
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:07:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=dxuMdw4B;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-386d1859e1cso270507eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594073; x=1796198873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=14k7AhaVHAVrliD493zRXQ1fkD4TshJOaLvutq7cxFg=;
        b=dxuMdw4BnHeOVtiPa9qpKgGxFm7NPHiBAEHq7mCjdC46xPXHiLdB09ucgohmPgDbKT
         RA4DttAAtuoizcu+ulwH5BJjgt+UrosicEgcoxKU5ry5Gn+nw2Zsy/Yrsnkvqah1ipbX
         kmylA3zZpFAq9webiodxnSNfFXSEhgthxtEvGJP3Ea0tSeHMEiUeqceHCQF08tB4sZK1
         ZLnpebXA09tLegtUcrISIJRmJLT08irdTAKSuWYkXZy8Y/EXRZ26EAG/2TmSv7sMVWXo
         ZobWUwH3b4RBDv4xk79jy+E+OwcIwTn+tpgfej/VK1xMfUdrDgS6+BAKDyW3HnaslkFp
         O8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594073; x=1796198873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=14k7AhaVHAVrliD493zRXQ1fkD4TshJOaLvutq7cxFg=;
        b=iicVwmMUdEDtDkuC0Dp0a0uusTpJQfYUF2tdg2BE5Uw1nBn/HP85b6QiJDOh+UwnfP
         X4Q8WE4068NK0gNTWbxjv9x68uLmIrjbhtYHBAJTjlO5WamMaimEEp1k904l74SqtbEE
         8DVVjwRrXZXcJEH2Rnl2LTyqFbIRf9Nnjtn/J0XYO9cTxh6zb/CHIkVA/rHrU6Ib5rVj
         fqxUkFYjyhEmT6pw5zPZMzEZumEGYPyZcQk/1Tkw6Emh+fdZamilutJbVjKjxHIOXwoE
         1oWgwtXlR3MxnKYeVCKvpSuvMaItqk3Q/QWFvxYM4wODH13Bovr5jXpIgQNQb5nRFLWF
         KMaw==
X-Gm-Message-State: APuU4Z/7yZSLuMGHAeyb/3TW0HEUAWUi2Ad62LOPfUOADG5W8zu/v1fR
	VCSU1fMZSjT4Bn17xMO9ziGKjKwYQ7evKi0qFTLn4Weor2+egZ47S+6KjEoQN/Gw
X-Gm-Gg: AZFdTZfK7mWGDl7vFJN9ShzX/Nia9r9zk1IpgJ1rrrvIVW1DqxV4ATEU1nGxSyKEs64
	q4Id5af20o+Iak3YjhPwAh8xGOzjvj6Bv4+MwD/A8V8qMjJCSIbVAga0tzR0Q5j5NYI0cB/r7+d
	Akea3+r0pQli0yuTMIkvNFHe+N1eCiuLoWtAPRnhFDtnLVcZV8t+xr7UtTvyXPUDOGYyTKh8y1a
	atXlGkUbiM0tBDS4kpp3bMZ27jt3JuxSQe1imcjUuqWqnTUuwXzGgXWSIwE6m80P88ykaxHy4Ov
	vpIAWxqzN1b9XyZkYm1Rkgu23cMf0gV8Ib3RcWNEQ+X7uwBIbLS+zCVIsaoBT9DIrWiOkcqbXA4
	ScNzCaVkvj+0Iq+s0LesronWwONI4AfzU2a+zBtnUVVhDk6+rgVgRihMpWdiJ//ykiyDn1DF4VT
	XQaO5LYih2Tk0LaYsW6suQVNKhAvIAiDBx3qzwAJyZdpGsz9uEWEZvGcCzaho2VfWrbauHwBRvU
	1yORRd9ok3yQmQchMD3PMj81dgBR5Oae104vjoy8ZxZO2xyCEjLBdcxHFJnL+oY0m7Wb26JjaUd
	F9O6DwZ2R5kkcXe0tS+oxTviyf99gNcxKCJrFNpP8WW4hAHCiJN+ub3AuCk1qJf9QbNqzccIr2K
	vo9EyYWr8UDOXLz6U/Y2f0SwXI03J+kGgq1PTmjLmCMw9U8d01cjPAndXGk0AMOrWF0cURbn+zL
	orU0LYUC7QiFKPYvCyJt3SFWS0yzryguHUTg2JMoFMtPURY2t+rpHI2QHdUe1o0574XFhfM6DrT
	fTDcKUWVEjCC/5gReOJyLOvNgdzIGJBzlkmTFaiMuG+xfsLzdfegKPATDluyhO/zYCGDBoZLqdC
	5xql757BepGEYrhh6BiJSyg8UA==
X-Received: by 2002:a05:7301:4283:b0:386:96fb:28c with SMTP id 5a478bee46e88-38696fb2022mr16456142eec.18.1795594072765;
        Wed, 25 Nov 2026 00:07:52 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:07:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 07/55] breakpad: upgrade 2023.06.01 -> 2024.02.16
Date: Wed, 25 Nov 2026 00:06:23 -0800
Message-ID: <20261125080732.2419614-13-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133010
Content-Type: text/plain; charset="utf-8"

- Fix integer overflows in the processor's map/range code and a buffer
  overflow in symbol serialization caused by an integer overflow
- dump_syms: support zstd-compressed ELF sections (--enable-zstd),
  capture inline info in DW_TAG_lexical_block, and add a switch to
  report DWARF warnings
- Linux: always map ELF files from offset 0 and handle ARMEABI binaries
  on ARM64 kernels in the ptrace dumper
- Processor: read extended x86 contexts, recognise new SEGV_* codes and
  fix ARM64 stack walking (illegal downcast) and StackwalkerAddressList
- Helper scripts are ported to Python 3

Drop the std::find_if include patch, which is upstream. Fetch the
release tag and add an upstream check.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ixed-missing-include-for-std-find_if.patch | 31 -------------------
 ...d_2023.06.01.bb => breakpad_2024.02.16.bb} |  7 +++--
 2 files changed, 4 insertions(+), 34 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/breakpad/breakpad/0001-Fixed-missing-include-for-std-find_if.patch
 rename meta-oe/recipes-devtools/breakpad/{breakpad_2023.06.01.bb => breakpad_2024.02.16.bb} (98%)

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0001-Fixed-missing-include-for-std-find_if.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0001-Fixed-missing-include-for-std-find_if.patch
deleted file mode 100644
index 943daf4d00..0000000000
--- a/meta-oe/recipes-devtools/breakpad/breakpad/0001-Fixed-missing-include-for-std-find_if.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 45ea097e864e566771d756c92619e984815acd1e Mon Sep 17 00:00:00 2001
-From: Nathan Moinvaziri <nathan@nathanm.com>
-Date: Tue, 19 Dec 2023 14:35:05 -0800
-Subject: [PATCH] Fixed missing include for std::find_if.
-
-Throws an error when compiling on Windows.
-
-Upstream-Status: Backport [https://github.com/google/breakpad/commit/898a997855168c0e6a689072fefba89246271a5d]
-Change-Id: Ieb34c00cf199aaa1b45a440086c48b8ed363b3c7
-Reviewed-on: https://chromium-review.googlesource.com/c/breakpad/breakpad/+/5137658
-Reviewed-by: Ivan Penkov <ivanpe@chromium.org>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/common/module.cc | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/common/module.cc b/src/common/module.cc
-index 0eb5aad8..b6f5da7e 100644
---- a/src/common/module.cc
-+++ b/src/common/module.cc
-@@ -42,6 +42,7 @@
- #include <stdio.h>
- #include <string.h>
- 
-+#include <algorithm>
- #include <functional>
- #include <iostream>
- #include <memory>
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb b/meta-oe/recipes-devtools/breakpad/breakpad_2024.02.16.bb
similarity index 98%
rename from meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb
rename to meta-oe/recipes-devtools/breakpad/breakpad_2024.02.16.bb
index 26f6ab9195..cbf6e458dc 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_2024.02.16.bb
@@ -20,13 +20,15 @@ PE = "2"
 
 SRCREV_FORMAT = "breakpad_gtest_protobuf_lss"
 
-SRCREV_breakpad = "8988364bcddd9b194b0bf931c10bc125987330ed"
+SRCREV_breakpad = "f80f2888031b0570783011476a5e862fb7d848a1"
 #v1.11.0
 SRCREV_gtest = "e2239ee6043f73722e7aa812a459f54a28552929"
 SRCREV_protobuf = "cb6dd4ef5f82e41e06179dcd57d3b1d9246ad6ac"
 SRCREV_lss = "9719c1e1e676814c456b55f5f070eabad6709d31"
 
-SRC_URI = "git://github.com/google/breakpad;name=breakpad;branch=main;protocol=https \
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
+
+SRC_URI = "git://github.com/google/breakpad;name=breakpad;branch=main;protocol=https;tag=v${PV} \
            git://github.com/google/googletest.git;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/src/testing/gtest;name=gtest;branch=main;protocol=https \
            git://github.com/protocolbuffers/protobuf.git;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/src/third_party/protobuf/protobuf;name=protobuf;branch=main;protocol=https \
            git://chromium.googlesource.com/linux-syscall-support;protocol=https;branch=main;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/src/third_party/lss;name=lss \
@@ -37,7 +39,6 @@ SRC_URI = "git://github.com/google/breakpad;name=breakpad;branch=main;protocol=h
            file://0004-elf_reader.cc-include-sys-reg.h-to-get-__WORDSIZE-on.patch \
            file://mcontext.patch \
            file://0001-Remove-HAVE_GETCONTEXT-check-to-add-local-implementa.patch \
-           file://0001-Fixed-missing-include-for-std-find_if.patch \
            file://0001-module_factory-move-CreateModule-out-of-line-to-fix-.patch \
            file://0001-lss-Match-syscalls-to-match-musl.patch;patchdir=src/third_party/lss \
            file://mips_asm_sgidefs.patch;patchdir=src/third_party/lss \
