Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.9346.1603773272551344509
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2020 21:34:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=knX7PahJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id r3so113829plo.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2020 21:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WwuPkE+iRTHAF2E6IH25jx1vrLYSeHHhLv5u5dT108A=;
        b=knX7PahJFj8WXQtrhbEqkzJCvJ1k6qnlWF4/u0hcIae6XHb2iUgwCteedHUJb0JXLi
         zJ7QWyAc0R4mI42041NODbcycm9fsZFAbR7Sy+E72A6BzWyPaGMYiJ4KT39YV5r69ORZ
         Hlkho/jHLFIol5FfUMipKXC9Q6C027AhtewEj+3UwvIPaFGYHcyyOY8nijkm5Hm7sKiO
         FQT7Anhb6twZXu26A/Ient+5rqCkegA5aAPtl7CXyU1hcTx4nuHPJNT+DV1l8o9b21C9
         r6K9Ecflb3WlKowoCi55iaW/F2J+ZTuR47eKozkjcGx3krx8rB+QdubLuzlelVTse4Vz
         O2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WwuPkE+iRTHAF2E6IH25jx1vrLYSeHHhLv5u5dT108A=;
        b=TbOPw7Uucg77WJi48H9g6gj/F89lTE5Huv9n7xt1edoJB3XrKyWWmjmp2ZMm4ma0wG
         novfHre4j0VmlhD1y6eeTNl60w7sPHIA6b1WHD6W07kW8juP+4vzM5TXpCOnmzplYKa/
         mknDosUQJFE5ispsEhf7C2lwA2VjzA2R0JMy5MTETtqvygUkmzpw+6W2Hu/tgHnQZfkS
         6VLrRNAS2cgUBoBP3ijdYOYZw1l+CYegGDRSSqnI/3U2ygwYQDqOvFlf7pp7ECkXptQ7
         3H25eJRPFmXOfk+UgntFXgPIed5t70dhZ9zrOAPmZ7K7IFaKP6pT9k3VUiqKGr8fd0/E
         5VSQ==
X-Gm-Message-State: AOAM533BMM71xBH6My7I69L3fxiTHDjsJ/Ip4YxMljlP+2fvEEtUKDvS
	fbywaS4K3pe0sm8mcakJvp4qPvigiRJh0g==
X-Google-Smtp-Source: ABdhPJyirZfzNZoWap8FTuuHQzXkI3ICkV3RtWqIaRIloULXs37j/LoUHU89ZLtgnG5Oxii7mYFD7w==
X-Received: by 2002:a17:90a:e781:: with SMTP id iz1mr302104pjb.173.1603773271741;
        Mon, 26 Oct 2020 21:34:31 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::bc1e])
        by smtp.gmail.com with ESMTPSA id z22sm387684pfa.220.2020.10.26.21.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 21:34:31 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] redis: Fix build with clang on riscv32
Date: Mon, 26 Oct 2020 21:34:29 -0700
Message-Id: <20201027043429.579303-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clang defines __ILP32__ for rv32 but gcc does not as a result
backtracing gets enabled when using clang but not when using gcc so
clang build exposes a porting error. Therefore add code to return
correct mcontext on rv32

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../redis/redis/riscv32.patch                 | 47 +++++++++++++++++++
 meta-oe/recipes-extended/redis/redis_6.0.8.bb |  2 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis/riscv32.patch

diff --git a/meta-oe/recipes-extended/redis/redis/riscv32.patch b/meta-oe/recipes-extended/redis/redis/riscv32.patch
new file mode 100644
index 0000000000..79ec7423da
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis/riscv32.patch
@@ -0,0 +1,47 @@
+Define correct gregs for RISCV32
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/src/debug.c
++++ b/src/debug.c
+@@ -942,7 +942,9 @@ static void *getMcontextEip(ucontext_t *
+     #endif
+ #elif defined(__linux__)
+     /* Linux */
+-    #if defined(__i386__) || defined(__ILP32__)
++    #if defined(__riscv) && __riscv_xlen == 32
++    return (void*) uc->uc_mcontext.__gregs[REG_PC];
++    #elif defined(__i386__) || defined(__ILP32__)
+     return (void*) uc->uc_mcontext.gregs[14]; /* Linux 32 */
+     #elif defined(__X86_64__) || defined(__x86_64__)
+     return (void*) uc->uc_mcontext.gregs[16]; /* Linux 64 */
+@@ -1102,8 +1104,28 @@ void logRegisters(ucontext_t *uc) {
+     #endif
+ /* Linux */
+ #elif defined(__linux__)
++    /* Linux RISCV32 */
++    #if defined(__riscv) && __riscv_xlen == 32
++    serverLog(LL_WARNING,
++    "\n"
++    "RA:%08lx S0:%08lx S1:%08lx S2:%08lx\n"
++    "SP:%08lx PC:%08lx A0:%08lx A1:%08lx\n"
++    "A2 :%08lx A3:%08lx A4:%08lx",
++        (unsigned long) uc->uc_mcontext.__gregs[REG_RA],
++        (unsigned long) uc->uc_mcontext.__gregs[REG_S0],
++        (unsigned long) uc->uc_mcontext.__gregs[REG_S1],
++        (unsigned long) uc->uc_mcontext.__gregs[REG_S2],
++        (unsigned long) uc->uc_mcontext.__gregs[REG_SP],
++        (unsigned long) uc->uc_mcontext.__gregs[REG_PC],
++        (unsigned long) uc->uc_mcontext.__gregs[REG_A0 + 0],
++        (unsigned long) uc->uc_mcontext.__gregs[REG_A0 + 1],
++        (unsigned long) uc->uc_mcontext.__gregs[REG_A0 + 2],
++        (unsigned long) uc->uc_mcontext.__gregs[REG_A0 + 3],
++        (unsigned long) uc->uc_mcontext.__gregs[REG_A0 + 4]
++    );
++    logStackContent((void**)uc->uc_mcontext.__gregs[REG_SP]);
+     /* Linux x86 */
+-    #if defined(__i386__) || defined(__ILP32__)
++    #elif defined(__i386__) || defined(__ILP32__)
+     serverLog(LL_WARNING,
+     "\n"
+     "EAX:%08lx EBX:%08lx ECX:%08lx EDX:%08lx\n"
diff --git a/meta-oe/recipes-extended/redis/redis_6.0.8.bb b/meta-oe/recipes-extended/redis/redis_6.0.8.bb
index 64b137c1be..546332851c 100644
--- a/meta-oe/recipes-extended/redis/redis_6.0.8.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.0.8.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://oe-use-libc-malloc.patch \
            file://0001-src-Do-not-reset-FINAL_LIBS.patch \
            file://GNU_SOURCE.patch \
+           file://riscv32.patch \
            "
 
 SRC_URI[md5sum] = "70113b4b8ea7ee4c7e148be62b5d1e0b"
@@ -23,6 +24,7 @@ SRC_URI[sha256sum] = "04fa1fddc39bd1aecb6739dd5dd73858a3515b427acd1e2947a66dadce
 inherit autotools-brokensep update-rc.d systemd useradd
 
 FINAL_LIBS_x86_toolchain-clang = "-latomic"
+FINAL_LIBS_riscv32_toolchain-clang = "-latomic"
 FINAL_LIBS_mips = "-latomic"
 FINAL_LIBS_arm = "-latomic"
 FINAL_LIBS_powerpc = "-latomic"
-- 
2.29.1

