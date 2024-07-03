Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE9CBC30653
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 05:21:03 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.43773.1719984055045853574
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jul 2024 22:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kithZ20R;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1fa9ecfb321so31523585ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Jul 2024 22:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719984054; x=1720588854; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBLJcLL5/bixrFDgibJ0Jiga010J4mlHNDvWI9Kt+dA=;
        b=kithZ20RMfQYnGJWz3JF6EHuw1sNsNNZ47xOb/xEkGeRxxXOzAIc/y3+IQWbbyUIOz
         0Y4WDQ/fNOQIBQMhnrqMDEC0ShRZ2UXS7HwIsxvNWBF3yf+EL4WfY5dBC+2jXrp/iEH+
         4UWCAJ1d7xPMW+pmy5Zr2mEY6Fa/BqNvZ6DhpHi/Vf34u7PT267F12E6Va3Iqmfi/1wU
         kCgbpVDev/T9GEt4xX+FbKCNwZD6ps0WS9J59kjaqusGXHf8Ai9Xu8cXEsq3HMJ6YUaI
         gTazQy33PNr+hbXzQUgYtvYZXn79LsN8WtA9EU+yzrXNnXCkEHY55SLBK7ZdQVF0i8s6
         rKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719984054; x=1720588854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kBLJcLL5/bixrFDgibJ0Jiga010J4mlHNDvWI9Kt+dA=;
        b=NkGSV37cwE/86mp+dC5aZS+HeLlp6hVL9q3AS0iRmOTVhaYY53iCanUocPDp06pVO/
         nSmfMxmwphVILod/Vi8hHTmfSL6lQZDrr/yGwvBwAA39gV4qAudiZKzEKESYWOsUWUEc
         bXoaLILcb7zaWAoMaG7MVbF1VtAqj90h9tqe1X7iyDbTAQ/MlsQ3enmYMTWp48eHGOcI
         FZeg5+n5kBMQatF8PbcVxL0VFkDny9cubg1BIL+47lUp0MIf60R5KasFf0MweYLQk8ig
         HlMtpafbOaq8SFHI+dNJwnWA6gpOreJ/hoCGR44ZubWcbT+xoOH2RuD75Pub2Mc7Hx8L
         N/tQ==
X-Gm-Message-State: AOJu0YxlTlap+FvdtCJpALZmRpmo6wXSKE18qHAUO/o1N8vhPdKhQ7rO
	vKm+AclsRxeP61JGhssk4fd/x4S+HQTQuj1sX0lCu1qkuHCzFegzEpVEEw==
X-Google-Smtp-Source: AGHT+IGw0Sbn1TnmFCJz7Amf2ST4m58Sif5isA43nTlEnQgvQT8YT9g1a4g4iw1zMtcgc5A9eXoZMw==
X-Received: by 2002:a17:903:40c3:b0:1fb:1b16:eb79 with SMTP id d9443c01a7336-1fb1b16ee64mr2780645ad.41.1719984054004;
        Tue, 02 Jul 2024 22:20:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9980])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10e392asm93718515ad.78.2024.07.02.22.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 22:20:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-inflate64: Fix build with clang fortified glibc headers
Date: Tue,  2 Jul 2024 22:20:49 -0700
Message-ID: <20240703052049.2661826-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703052049.2661826-1-raj.khem@gmail.com>
References: <20240703052049.2661826-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 05:21:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111218

This issue is seen with upcoming glibc 2.40

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-Do-not-override-const-qualifier.patch | 83 +++++++++++++++++++
 .../python/python3-inflate64_1.0.0.bb         |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-inflate64/0001-Do-not-override-const-qualifier.patch

diff --git a/meta-python/recipes-devtools/python/python3-inflate64/0001-Do-not-override-const-qualifier.patch b/meta-python/recipes-devtools/python/python3-inflate64/0001-Do-not-override-const-qualifier.patch
new file mode 100644
index 0000000000..5391a11da0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-inflate64/0001-Do-not-override-const-qualifier.patch
@@ -0,0 +1,83 @@
+From 7e3a795cbeea94b3324aa926f2b11904cb169acc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 2 Jul 2024 22:02:38 -0700
+Subject: [PATCH] Do not override 'const' qualifier
+
+This has worked so far but with fortified system headers from
+Glibc 2.40+ and clang compiler it ends up in compile errors
+
+| In file included from /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/python3-inflate64/1.0.0/recipe-sysroot/usr/include/string.h:548:
+| /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/python3-inflate64/1.0.0/recipe-sysroot/usr/include/bits/string_fortified.h:77:66: error: pass_object_size attribute only applies to constant pointer arguments
+|    77 | __NTH (strcpy (__fortify_clang_overload_arg (char *, __restrict, __dest),
+|       |                                                                  ^
+| /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/python3-inflate64/1.0.0/recipe-sysroot/usr/include/bits/string_fortified.h:86:66: error: pass_object_size attribute only applies to constant pointer arguments
+|    86 | __NTH (stpcpy (__fortify_clang_overload_arg (char *, __restrict, __dest),
+|       |                                                                  ^
+| /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/python3-inflate64/1.0.0/recipe-sysroot/usr/include/bits/string_fortified.h:96:67: error: pass_object_size attribute only applies to constant pointer arguments
+|    96 | __NTH (strncpy (__fortify_clang_overload_arg (char *, __restrict, __dest),
+|       |                                                                   ^
+| /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/python3-inflate64/1.0.0/recipe-sysroot/usr/include/bits/string_fortified.h:107:56: error: pass_object_size attribute only applies to constant pointer arguments
+|   107 | __NTH (stpncpy (__fortify_clang_overload_arg (char *, ,__dest),
+|       |                                                        ^
+| /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/python3-inflate64/1.0.0/recipe-sysroot/usr/include/bits/string_fortified.h:136:66: error: pass_object_size attribute only applies to constant pointer arguments
+|   136 | __NTH (strcat (__fortify_clang_overload_arg (char *, __restrict, __dest),
+|       |                                                                  ^
+| /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/python3-inflate64/1.0.0/recipe-sysroot/usr/include/bits/string_fortified.h:145:67: error: pass_object_size attribute only applies to constant pointer arguments
+|   145 | __NTH (strncat (__fortify_clang_overload_arg (char *, __restrict, __dest),
+|       |                                                                   ^
+| /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/python3-inflate64/1.0.0/recipe-sysroot/usr/include/bits/string_fortified.h:161:67: error: pass_object_size attribute only applies to constant pointer arguments
+|   161 | __NTH (strlcpy (__fortify_clang_overload_arg (char *, __restrict, __dest),
+
+Therefore adjust needed places to use const qualifier
+
+Upstream-Status: Submitted [https://codeberg.org/miurahr/inflate64/pulls/13]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/lib/deflate.h          | 2 +-
+ src/lib/deflate_tree.c     | 4 ++--
+ src/lib/inflate64_config.h | 3 ---
+ 3 files changed, 3 insertions(+), 6 deletions(-)
+
+diff --git a/src/lib/deflate.h b/src/lib/deflate.h
+index 72a324f..c780be9 100644
+--- a/src/lib/deflate.h
++++ b/src/lib/deflate.h
+@@ -288,6 +288,6 @@ void ZLIB_INTERNAL _tr_stored_block OF((deflate_state *s, char FAR *buf,
+   extern const unsigned char ZLIB_INTERNAL _dist_code[];
+ #endif
+ #endif
+-extern uch ZLIB_INTERNAL length_code[];
++extern const uch ZLIB_INTERNAL length_code[];
+ 
+ #endif /* DEFLATE_H */
+diff --git a/src/lib/deflate_tree.c b/src/lib/deflate_tree.c
+index 5a66139..cdee934 100644
+--- a/src/lib/deflate_tree.c
++++ b/src/lib/deflate_tree.c
+@@ -78,10 +78,10 @@ local const uch bl_order[BL_CODES]
+ 
+ #define DIST_CODE_LEN  768 /* see definition of array dist_code below */
+ 
+-local int base_length[LENGTH_CODES];
++local const int base_length[LENGTH_CODES];
+ /* First normalized length for each code (0 = MIN_MATCH) */
+ 
+-uch length_code[BASE_MATCH-MIN_MATCH+1];
++const uch length_code[BASE_MATCH-MIN_MATCH+1];
+ /* length code for each normalized match length (0 == MIN_MATCH) */
+ 
+ #if defined(GEN_TREES_H) || !defined(STDC)
+diff --git a/src/lib/inflate64_config.h b/src/lib/inflate64_config.h
+index 16cfd12..ade7300 100644
+--- a/src/lib/inflate64_config.h
++++ b/src/lib/inflate64_config.h
+@@ -53,9 +53,6 @@
+ #  define FAR
+ #endif
+ 
+-#ifndef const
+-#  define const
+-#endif
+ #define z_const const
+ 
+ typedef unsigned char  uch;
diff --git a/meta-python/recipes-devtools/python/python3-inflate64_1.0.0.bb b/meta-python/recipes-devtools/python/python3-inflate64_1.0.0.bb
index 2ccc98e36b..9fbd5157af 100644
--- a/meta-python/recipes-devtools/python/python3-inflate64_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-inflate64_1.0.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 inherit setuptools3 pypi
 
+SRC_URI += "file://0001-Do-not-override-const-qualifier.patch"
 SRC_URI[sha256sum] = "3278827b803cf006a1df251f3e13374c7d26db779e5a33329cc11789b804bc2d"
 
 PYPI_PACKAGE = "inflate64"

