Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web12.6314.1622029976090102968
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 04:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=T28C9SyA;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id o17-20020a17090a9f91b029015cef5b3c50so176470pjp.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 04:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ijf1nITWa/XJE5w1qn1LrLTxIq5F1g0vCqR5f6m7QfY=;
        b=T28C9SyAUkjC5M+SldqlxN3XcC4aTV283rYUvT0/whfFUCySTBhEjj0WH41/hlY3hb
         pkBo+pxEoHbBIqDWVImTokNTuD48mVfAA2GSlEmDGmUfRxmCKqIdTU9lqfj7aH7Hats6
         Lq36RG7LTlM1XpyjaGFNRsHaGtsyjzGKwKU8g9zwNqKvkLxDfCOfn5lrpvWnQM3Ew+Oj
         OF2PWQGimdmXPSj41DNJzc5VzZ24t6svOpR7SnCM8QufMKttRDjdSLFvszjvKDl39gUZ
         tDuBe2JtjTlJcdT/cW79GnYSQrSoISbgEAollKcYZweQL5dDzNe20SolC7beOnv63CyR
         +E9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ijf1nITWa/XJE5w1qn1LrLTxIq5F1g0vCqR5f6m7QfY=;
        b=UAFt7AUQPQeKMRprbA0qxnLlfAJI6ezCdBX0WytMXyEHh6FFr/kHc42b6xNxwGCk3Z
         h1V5OAsIZWTwZS44n40iwWMXc7elPUljd984bdVvFoCHibNx6sVZrlpCtH7BbjLeUSDq
         u1DgacDWGozqiJ9iYZ7I3MDQJiPABc5I//pjGTOfP/0PTsWnyRfTH75UHwf4WzOPnFyo
         6a+UqJMslGurX6JMNS9aDZJjdIAc5d/nYThTe06728E7J/xFkD0XNb9G18DDFwu86oOM
         +XSCT76L3C0/JNGvKuaUOGmowJE0GQRhaeUxvh1nzjUpuOCAPVHQ7ql/C1Mr9YDGSE1n
         ic0Q==
X-Gm-Message-State: AOAM532cy/yKIwMRm4dP+5Opsav5z4+lsDzkcbXiD3uvbtT48DIV6Rcc
	vnqg3uQC1ds0FQL4/cgJu7chxH9ex96IoA==
X-Google-Smtp-Source: ABdhPJy+AmH3WeZXu8MWJ/VGNR4gXhXFt6GDTF4xs/4+EAum+owCyOFTn6251R9DefohhT7TC0h0Mw==
X-Received: by 2002:a17:90a:590d:: with SMTP id k13mr36996854pji.68.1622029975325;
        Wed, 26 May 2021 04:52:55 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:68d3:e59c:b64:76e3])
        by smtp.gmail.com with ESMTPSA id h22sm15408818pfn.55.2021.05.26.04.52.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 04:52:55 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [harkknott 07/23] uftrace: Fix a plthook crash on aarch64 with binutils2.35.1 and later versions on aarch64
Date: Wed, 26 May 2021 04:52:22 -0700
Message-Id: <a1ae03d0964df5ff7cc1c37c1f95eae60dd07800.1622029873.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622029873.git.akuster808@gmail.com>
References: <cover.1622029873.git.akuster808@gmail.com>

From: wangmy <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 54feab11a1866435107df366005b50aba3b8d1cd)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...error-on-aarch64-with-binutils2.35.1.patch | 27 -----------
 ...thook-crash-on-aarch64-with-binutils.patch | 47 +++++++++++++++++++
 .../recipes-devtools/uftrace/uftrace_0.9.4.bb |  2 +-
 3 files changed, 48 insertions(+), 28 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/uftrace/uftrace/0001-Fix-error-on-aarch64-with-binutils2.35.1.patch
 create mode 100644 meta-oe/recipes-devtools/uftrace/uftrace/0001-aarch64-Fix-a-plthook-crash-on-aarch64-with-binutils.patch

diff --git a/meta-oe/recipes-devtools/uftrace/uftrace/0001-Fix-error-on-aarch64-with-binutils2.35.1.patch b/meta-oe/recipes-devtools/uftrace/uftrace/0001-Fix-error-on-aarch64-with-binutils2.35.1.patch
deleted file mode 100644
index ac17cf433f..0000000000
--- a/meta-oe/recipes-devtools/uftrace/uftrace/0001-Fix-error-on-aarch64-with-binutils2.35.1.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 0bc502989822506af308a559ac1cd52af82cac03 Mon Sep 17 00:00:00 2001
-From: Lei Maohui <leimaohui@cn.fujitsu.com>
-Date: Wed, 14 Apr 2021 09:35:35 +0900
-Subject: [PATCH] Fix error on aarch64 with binutils2.35.1.
-
-WARN: child terminated by signal: 11: Segmentation fault
-
-Upstream-status: Pending
-
-Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
----
- arch/aarch64/mcount-arch.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/arch/aarch64/mcount-arch.h b/arch/aarch64/mcount-arch.h
-index 69efe521..60c2c1ba 100644
---- a/arch/aarch64/mcount-arch.h
-+++ b/arch/aarch64/mcount-arch.h
-@@ -31,7 +31,7 @@ struct mcount_arch_context {
- 	double d[ARCH_MAX_FLOAT_REGS];
- };
- 
--#define ARCH_PLT0_SIZE  32
-+#define ARCH_PLT0_SIZE  16
- #define ARCH_PLTHOOK_ADDR_OFFSET  0
- 
- struct mcount_disasm_engine;
diff --git a/meta-oe/recipes-devtools/uftrace/uftrace/0001-aarch64-Fix-a-plthook-crash-on-aarch64-with-binutils.patch b/meta-oe/recipes-devtools/uftrace/uftrace/0001-aarch64-Fix-a-plthook-crash-on-aarch64-with-binutils.patch
new file mode 100644
index 0000000000..bf997d6e4b
--- /dev/null
+++ b/meta-oe/recipes-devtools/uftrace/uftrace/0001-aarch64-Fix-a-plthook-crash-on-aarch64-with-binutils.patch
@@ -0,0 +1,47 @@
+From 0851278471472c6be69a936cc3698aa50a646ffd Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Wed, 12 May 2021 17:06:31 +0900
+Subject: [PATCH] aarch64: Fix a plthook crash on aarch64 with binutils2.35.1
+ and later versions
+
+plthook is always crashed in Ubuntu 20.10 aarch64, which uses binutils 2.35.1.
+Since the `plt_entsize` is not automatically set in this version, we have to
+explicitly set the value.
+
+This patch fixes the following problem.
+
+  $ uname -m
+  aarch64
+
+  $ cat /etc/os-release | grep PRETTY_NAME
+  PRETTY_NAME="Ubuntu 20.10"
+
+  $ gcc -pg tests/s-abc.c
+
+  $ uftrace record a.out
+  WARN: child terminated by signal: 7: Bus error
+
+Fixed: #1254
+
+Upstream-status: submitted [Sent to https://github.com/namhyung/uftrace/pull/1248]
+
+Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
+---
+ utils/symbol.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/utils/symbol.c b/utils/symbol.c
+index 29a1d295..01e52dab 100644
+--- a/utils/symbol.c
++++ b/utils/symbol.c
+@@ -560,6 +560,7 @@ int load_elf_dynsymtab(struct symtab *dsymtab, struct uftrace_elf_data *elf,
+ 	}
+ 	else if (elf->ehdr.e_machine == EM_AARCH64) {
+ 		plt_addr += 16;    /* AARCH64 PLT0 size is 32 */
++		plt_entsize = 16;
+ 	}
+ 	else if (elf->ehdr.e_machine == EM_386) {
+ 		plt_entsize += 12;
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb
index 4b4fc831c3..a04fccca75 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb
@@ -13,7 +13,7 @@ inherit autotools
 PV .= "+git${SRCPV}"
 SRCREV = "d648bbffedef529220896283fb59e35531c13804"
 SRC_URI = "git://github.com/namhyung/${BPN} \
-           file://0001-Fix-error-on-aarch64-with-binutils2.35.1.patch \
+           file://0001-aarch64-Fix-a-plthook-crash-on-aarch64-with-binutils.patch \
            "
 S = "${WORKDIR}/git"
 
-- 
2.17.1

