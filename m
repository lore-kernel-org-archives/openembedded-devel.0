Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web09.5046.1604174066256434154
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Oct 2020 12:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GowRDp/0;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id b3so7843859pfo.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 31 Oct 2020 12:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XtRvhJq/wIX/ccXgCKe8LdOLR0FLfnmTNzxMett1hkU=;
        b=GowRDp/0I+xdM6SONRX2zwdi9y9hNud0nmJekqlhIxWcJa3xM02ssrABQv3WHYg3CF
         6OxBovOdDWn3acYnAF8DqZZLF3nMhT6MNKfihtaioWZOqLiQTJn2QlXhQKSBEdN0DavX
         +qrjcpw8DSAQ5w486yly9lNwvNwt9mz3TFWf1DSsf2sT7MFIKAVGVhbRYRuQeASzcx/8
         KOtvb3XML/GGdb112qiwwbWdC6DfOEm1B/Q8p5trlJdSjjWqOv+yMgFwZMbbA9XnX6pO
         IproUz4ePjUaiI01Wn1no7TIA9W+wIJ0f9ektSYWdb0rW/vnnrwLATS19rPAG3lPjb92
         6KeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XtRvhJq/wIX/ccXgCKe8LdOLR0FLfnmTNzxMett1hkU=;
        b=qRWQYG+XLd70Gac64NHg9TGDvI/N9bpB5wwjh9deJdOls5AtoxpTLhpVfQ3n59OB8n
         qryL3BaVJq8FsYMQ6ZKx2xDTNSFk72eC0MdRwEAPEaB6qvbhsNpCGzLkxARi/vV70XSV
         gVP80hEQOiVfiiSqKtjgKymY2GsQHYdAeEaoN4U8vwBkiZvV5bUO2TTdXNpdO5dudqr6
         5/dCTjtR4nD7maigZrTy1de/c+8csDpscI3bCLlmgp1lBksNjSHerTWkBe2Ym+xZPpdb
         Qh2xbsse1LoUNbX/y0M3Qwd5xQbZSnZ03AjHdNF5orgudyWPABt5Cqnfi6Z9QNv0Ixgk
         frrQ==
X-Gm-Message-State: AOAM5318N7qqwmZfzYVh742qebKCik9LzEQNkN+yt5AjSxGIeUIU0y4G
	s7eAvXpP0FtozWm+1tDAwItBWr3Nmeo3Xw==
X-Google-Smtp-Source: ABdhPJyd4c8Qru8vE2uaZjROH0wVp2GZ6J1Myst673eJL+QKF7q3d1xZvTkV3wy1zJZPPCSqmjChPQ==
X-Received: by 2002:a62:8097:0:b029:153:ce1d:c46 with SMTP id j145-20020a6280970000b0290153ce1d0c46mr15259828pfd.68.1604174065445;
        Sat, 31 Oct 2020 12:54:25 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4874])
        by smtp.gmail.com with ESMTPSA id q84sm9797284pfq.144.2020.10.31.12.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 12:54:24 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] redis: Fix build on 32bit targets and clang
Date: Sat, 31 Oct 2020 12:54:22 -0700
Message-Id: <20201031195422.2677213-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-extended/redis/redis/ilp32.patch  | 29 +++++++++++++++++++
 meta-oe/recipes-extended/redis/redis_6.0.8.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis/ilp32.patch

diff --git a/meta-oe/recipes-extended/redis/redis/ilp32.patch b/meta-oe/recipes-extended/redis/redis/ilp32.patch
new file mode 100644
index 0000000000..48d01a1d62
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis/ilp32.patch
@@ -0,0 +1,29 @@
+__ILP32__ is defined for all 32bit architectures with clang e.g.
+which is right but it is causing issues on non-x86 architectures
+where this condition becomes true and wrongly starts using this
+code, this issue is hidden with gcc becuase gcc does not define
+__ILP32__ for all 32bit architectures but for selected 64bit arches
+who choose to use 32bit ABI e.g. x32
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/src/debug.c
++++ b/src/debug.c
+@@ -944,7 +944,7 @@ static void *getMcontextEip(ucontext_t *
+     /* Linux */
+     #if defined(__riscv) && __riscv_xlen == 32
+     return (void*) uc->uc_mcontext.__gregs[REG_PC];
+-    #elif defined(__i386__) || defined(__ILP32__)
++    #elif defined(__i386__) || (defined(__X86_64__) && defined(__ILP32__))
+     return (void*) uc->uc_mcontext.gregs[14]; /* Linux 32 */
+     #elif defined(__X86_64__) || defined(__x86_64__)
+     return (void*) uc->uc_mcontext.gregs[16]; /* Linux 64 */
+@@ -1125,7 +1125,7 @@ void logRegisters(ucontext_t *uc) {
+     );
+     logStackContent((void**)uc->uc_mcontext.__gregs[REG_SP]);
+     /* Linux x86 */
+-    #elif defined(__i386__) || defined(__ILP32__)
++    #elif defined(__i386__) || ( defined(__X86_64__) && defined(__ILP32__))
+     serverLog(LL_WARNING,
+     "\n"
+     "EAX:%08lx EBX:%08lx ECX:%08lx EDX:%08lx\n"
diff --git a/meta-oe/recipes-extended/redis/redis_6.0.8.bb b/meta-oe/recipes-extended/redis/redis_6.0.8.bb
index 546332851c..14091b565c 100644
--- a/meta-oe/recipes-extended/redis/redis_6.0.8.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.0.8.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0001-src-Do-not-reset-FINAL_LIBS.patch \
            file://GNU_SOURCE.patch \
            file://riscv32.patch \
+           file://ilp32.patch \
            "
 
 SRC_URI[md5sum] = "70113b4b8ea7ee4c7e148be62b5d1e0b"
-- 
2.29.2

