Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 280C9E77198
	for <webhook@archiver.kernel.org>; Mon,  6 Jan 2025 15:23:33 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.62041.1736177005055763115
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jan 2025 07:23:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=TqXj8CZ8;
 spf=pass (domain: konsulko.com, ip: 209.85.208.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d0ac27b412so19675350a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jan 2025 07:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1736177003; x=1736781803; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i+G3HN9OVxW0D6ws/AZoU7eauG3v80pLE8G4pSR0tG8=;
        b=TqXj8CZ8z2dQBUeMABZQT5ypG7Jk15CuTvQFflGy1PlYHJOgT9ukmMbLehch/39FRj
         gQXKAvZetrNyUP/p0T54J/uO1rlTDWiVCnoY0BULBGIc8qJB0w8h9VI3HzPdpWQaX1YV
         sQrmaM6yfjNHlIEnE48RjjtsmVTRHCv3RyjHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736177003; x=1736781803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i+G3HN9OVxW0D6ws/AZoU7eauG3v80pLE8G4pSR0tG8=;
        b=eH9rQ9rgApcXLkyuFUBfRLFF6Jku9DDDlXVBPrs9vhrWxGDM0Fwuf6N0491vcr7B80
         yDrxTIIZ3aG2Lm5lMDNR9ajqyPsS+CAJ3tnc6BdJ7zQ3KCKt1fE0KxIVKgABCMlByP1n
         3OnZpWfRzfqoriW+HurPYPwInrusxIUdsnkJH+iRv6uTqVeIoRRcB7RuddCHnwW+NMMs
         99hIjxVM1Pw0e6uPFvzs69xww8g7CNZ+7gKnk0qAZ/2UDY/822jRr05AIe4OmkoCPPqc
         hX4n6gXQI5K15km4Kb7/q2IMsiS1EQ3FBIdaXxs9IbZlUu++Kj5GHv2jEucg7RdHjFnZ
         XZDw==
X-Gm-Message-State: AOJu0YxsCuPH3v3l5dzfYrR1HUQIPilsuaV878+pFgNrid1qifKvS9lX
	XvE00H+BostlRCk+lDwpJDQD5XcK3dvTp57NZNG8xu2oa2j0Y07zPW5FneB8NeOAKBkKe5KbRP8
	t
X-Gm-Gg: ASbGncug2QtgLE4kjfqzivDP3oLKTw7j4ScOQipjc6W5zK9AS+QW40lJfkUhoaVW9uw
	X0Lq1aIKMhWvh2yplrcES8sD0bmUXBMXg6+I8xXyV7iB4GWJXZAIjDu6zmflyLmyr4sU0EjzHD+
	B2Dmp6knR5yQGZDcLexRKzILI6N3WC32+759yJoJv57uam2nYveMw7qBuIXOZtmQoiHbt1Mreh6
	3pi07q7LgdA5BuwcHjlIKQvxAYPEt2sslmwbnqKscHSwGAEs6YuLL9l6EFYQa/S9w+B8L8=
X-Google-Smtp-Source: AGHT+IG4+sjbEPtjRuXbOcYo5cceR+OvfSrDQ5EBSwucAVltatAXO7Vu7Kt9IXqGCpPApuc464yKaQ==
X-Received: by 2002:a05:6402:3495:b0:5d0:f830:ef5b with SMTP id 4fb4d7f45d1cf-5d81de17f35mr47752790a12.29.1736177002929;
        Mon, 06 Jan 2025 07:23:22 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fed4e1sm23893179a12.70.2025.01.06.07.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 07:23:22 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-inflate64: Upgrade 1.0.0 -> 1.0.1
Date: Mon,  6 Jan 2025 17:23:17 +0200
Message-Id: <20250106152319.728893-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jan 2025 15:23:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114662

Upgrade to release 1.0.1:

* Change deflate_tree: base_length[] and length_code[] not to be
  const to avoid C2166 error on windows
* Drop support for python 3.8 and add support for python 3.13

Patch 0001-Do-not-override-const-qualifier.patch has been merged
in the upstream therefore the file is no longer needed.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...0001-Do-not-override-const-qualifier.patch | 83 -------------------
 ...64_1.0.0.bb => python3-inflate64_1.0.1.bb} |  3 +-
 2 files changed, 1 insertion(+), 85 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-inflate64/0001-Do-not-override-const-qualifier.patch
 rename meta-python/recipes-devtools/python/{python3-inflate64_1.0.0.bb => python3-inflate64_1.0.1.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-inflate64/0001-Do-not-override-const-qualifier.patch b/meta-python/recipes-devtools/python/python3-inflate64/0001-Do-not-override-const-qualifier.patch
deleted file mode 100644
index 5391a11da0..0000000000
--- a/meta-python/recipes-devtools/python/python3-inflate64/0001-Do-not-override-const-qualifier.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From 7e3a795cbeea94b3324aa926f2b11904cb169acc Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 2 Jul 2024 22:02:38 -0700
-Subject: [PATCH] Do not override 'const' qualifier
-
-This has worked so far but with fortified system headers from
-Glibc 2.40+ and clang compiler it ends up in compile errors
-
-| In file included from /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/python3-inflate64/1.0.0/recipe-sysroot/usr/include/string.h:548:
-| /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/python3-inflate64/1.0.0/recipe-sysroot/usr/include/bits/string_fortified.h:77:66: error: pass_object_size attribute only applies to constant pointer arguments
-|    77 | __NTH (strcpy (__fortify_clang_overload_arg (char *, __restrict, __dest),
-|       |                                                                  ^
-| /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/python3-inflate64/1.0.0/recipe-sysroot/usr/include/bits/string_fortified.h:86:66: error: pass_object_size attribute only applies to constant pointer arguments
-|    86 | __NTH (stpcpy (__fortify_clang_overload_arg (char *, __restrict, __dest),
-|       |                                                                  ^
-| /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/python3-inflate64/1.0.0/recipe-sysroot/usr/include/bits/string_fortified.h:96:67: error: pass_object_size attribute only applies to constant pointer arguments
-|    96 | __NTH (strncpy (__fortify_clang_overload_arg (char *, __restrict, __dest),
-|       |                                                                   ^
-| /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/python3-inflate64/1.0.0/recipe-sysroot/usr/include/bits/string_fortified.h:107:56: error: pass_object_size attribute only applies to constant pointer arguments
-|   107 | __NTH (stpncpy (__fortify_clang_overload_arg (char *, ,__dest),
-|       |                                                        ^
-| /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/python3-inflate64/1.0.0/recipe-sysroot/usr/include/bits/string_fortified.h:136:66: error: pass_object_size attribute only applies to constant pointer arguments
-|   136 | __NTH (strcat (__fortify_clang_overload_arg (char *, __restrict, __dest),
-|       |                                                                  ^
-| /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/python3-inflate64/1.0.0/recipe-sysroot/usr/include/bits/string_fortified.h:145:67: error: pass_object_size attribute only applies to constant pointer arguments
-|   145 | __NTH (strncat (__fortify_clang_overload_arg (char *, __restrict, __dest),
-|       |                                                                   ^
-| /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/python3-inflate64/1.0.0/recipe-sysroot/usr/include/bits/string_fortified.h:161:67: error: pass_object_size attribute only applies to constant pointer arguments
-|   161 | __NTH (strlcpy (__fortify_clang_overload_arg (char *, __restrict, __dest),
-
-Therefore adjust needed places to use const qualifier
-
-Upstream-Status: Submitted [https://codeberg.org/miurahr/inflate64/pulls/13]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/lib/deflate.h          | 2 +-
- src/lib/deflate_tree.c     | 4 ++--
- src/lib/inflate64_config.h | 3 ---
- 3 files changed, 3 insertions(+), 6 deletions(-)
-
-diff --git a/src/lib/deflate.h b/src/lib/deflate.h
-index 72a324f..c780be9 100644
---- a/src/lib/deflate.h
-+++ b/src/lib/deflate.h
-@@ -288,6 +288,6 @@ void ZLIB_INTERNAL _tr_stored_block OF((deflate_state *s, char FAR *buf,
-   extern const unsigned char ZLIB_INTERNAL _dist_code[];
- #endif
- #endif
--extern uch ZLIB_INTERNAL length_code[];
-+extern const uch ZLIB_INTERNAL length_code[];
- 
- #endif /* DEFLATE_H */
-diff --git a/src/lib/deflate_tree.c b/src/lib/deflate_tree.c
-index 5a66139..cdee934 100644
---- a/src/lib/deflate_tree.c
-+++ b/src/lib/deflate_tree.c
-@@ -78,10 +78,10 @@ local const uch bl_order[BL_CODES]
- 
- #define DIST_CODE_LEN  768 /* see definition of array dist_code below */
- 
--local int base_length[LENGTH_CODES];
-+local const int base_length[LENGTH_CODES];
- /* First normalized length for each code (0 = MIN_MATCH) */
- 
--uch length_code[BASE_MATCH-MIN_MATCH+1];
-+const uch length_code[BASE_MATCH-MIN_MATCH+1];
- /* length code for each normalized match length (0 == MIN_MATCH) */
- 
- #if defined(GEN_TREES_H) || !defined(STDC)
-diff --git a/src/lib/inflate64_config.h b/src/lib/inflate64_config.h
-index 16cfd12..ade7300 100644
---- a/src/lib/inflate64_config.h
-+++ b/src/lib/inflate64_config.h
-@@ -53,9 +53,6 @@
- #  define FAR
- #endif
- 
--#ifndef const
--#  define const
--#endif
- #define z_const const
- 
- typedef unsigned char  uch;
diff --git a/meta-python/recipes-devtools/python/python3-inflate64_1.0.0.bb b/meta-python/recipes-devtools/python/python3-inflate64_1.0.1.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-inflate64_1.0.0.bb
rename to meta-python/recipes-devtools/python/python3-inflate64_1.0.1.bb
index 7804152d94..841c9239a5 100644
--- a/meta-python/recipes-devtools/python/python3-inflate64_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-inflate64_1.0.1.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 inherit python_setuptools_build_meta pypi
 
-SRC_URI += "file://0001-Do-not-override-const-qualifier.patch"
-SRC_URI[sha256sum] = "3278827b803cf006a1df251f3e13374c7d26db779e5a33329cc11789b804bc2d"
+SRC_URI[sha256sum] = "3b1c83c22651b5942b35829df526e89602e494192bf021e0d7d0b600e76c429d"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.39.5


