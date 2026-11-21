Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19319.1795278531821780239
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Nov 2026 08:28:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=uuwNmIg9;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-382f4710a17so3273286eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Nov 2026 08:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795278531; x=1795883331; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wyodW3r5cTenzOcS/NFOpUjXUUeRyBEb93lme+JRsKk=;
        b=uuwNmIg9K1HGQzRTDKw+ZvEnxTB9NBjtYHPTBqJsxTPdeJgSGuFZk3kxDf6cWp8WBt
         KxG8YRcufx877EcuewXHb1jq/m2VLIX/llymFctKNWexW7fnmPgJTbl1aGA7b6npwGgy
         Zrwa0ux6WNQbOT3jUWrYP2GlMWQFe+vml+66NtAroGcpjJv5Hw8rWHAzZ5a+pGPyqfBj
         3026jy343b9UZOm71YRQLq4Wbhi/WbHlcPkBwnemXK5C9Wmty/N/EiJnABUF1feOV8k2
         jZ96VGNMi9FBsGvBRrP0MF8QVaZ1kWjvBYcph+LsWhM6zct8PQF6Z5qUgk/hJVsN4oEg
         EHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795278531; x=1795883331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wyodW3r5cTenzOcS/NFOpUjXUUeRyBEb93lme+JRsKk=;
        b=kPKRyZ7yYKYNjDNbtc2qdnClARBYzKkFyzFnzR2XeZ9OTYdKsa8jY/ZtMzaUVO8Fgd
         FD0+jDsbGXV0aKfcsE7lkv+ws+PIAdz9Rjk1hi98Zp1+58YA2M4+U56kfrRM1ATDTeq1
         OI+nqcRoU6Fg4WjtPFZBSKkFy65smsy9V1BcUW/70jJyzRxK1eb6k2skh1YL67CwUbPw
         eWadvIpZ3H38Ftspo7dJ4EHpfedJVSNLN00U8ycW1VpoCcNTyfezx/iI0kD8tjx7Qe8g
         4TDESWBRJtrb5TN3LNCdm5sEJWmJ5zxJk6p+Atwva3xCbed8sokH2nXMe11gtE+A/OsE
         QY2Q==
X-Gm-Message-State: APuU4Z914dAC6WR9HdDm4a84w0oaQD8KNhEE2qa6+7agH/xOD6vJO6Hj
	RXJGih3Z/JTcr/sTZWJBgboJryrcbrrr18hpR8NnwN48P9Lix6kLnNDducJ8w8Lp
X-Gm-Gg: AZFdTZdISPZBrCcKPs8SggcWEN3NqDUhvl9UNPz0NG/M99Nuzk/stZYkRihVt6Bbdl2
	kf6h7yF7+nQ8s6Y6smjCMGmi1ChoxMLl3xm573cQPtV0BP76PkYajBfAUYYf1LrfwFhvwesa7LR
	c04gULuHuB+7nXqjJpfAb5N2eOzbRj6u2qnspiWz571Ywi45YPmDBLnu6wNNGZxdGovpYQqUDnm
	E9Gdb4Qik10iW++/gcIusf2E+CeqcsqneiaCEjnWyzNyHHh3kp1I0O3x74Zobwp79C1bZlPqPza
	3JN8iRZ/X3gFGXCSYWrJRfQmlr63yr9sbZsQyk61StjsmwYb+FtAeemqNgY640xxumO7ogky/sN
	2m+mjnLWlxhX4avKEf6sZvgm7w1sA3Qm/obO2uRKQmhx0J8ERwMzE6joJnt9eoJNmLZmoapsg0M
	gcJMH7KBcg0Ep4mCjaknRko6dD9OJfzjbnDQGU8aonVzKCdoJ/EKsYTUdBXJGHUEBboA6u0W6FS
	mJH8FiNcetkFmqLqJpwSS9tGDMPB6ieKqtFIwmXiubqluuNhg9mokbjACwQ1Tlno1M8eWQZWkl7
	p+zar4DIhvQ45TFUkOiHJaktBO3cpfcxVNpqqkCHN0MtKpJB0MsXqB+Ka/o6CUVecjePdS9X9AD
	XEa6e10p4TJHwiAeFOoN9aiP63atCPZ/yXy87GLsOoK76HBfrr4h2KsOE8ezbp9fX0ZX8Qj+yh4
	EVFQ5JWkQsVoPOMOfW9L76AS1pehygB2vsLtbX+xbavs/cLhn9kh4SSzPhbepM+syoAx64h52hP
	uUFifHAL01cF8PTusXDWRYQcH7Gxr7zbetdOfND1bIeUVTZrHnfm4I4+ZMdLKnqP0Qp/7mlh9U3
	U9Zq
X-Received: by 2002:a05:7301:152f:b0:376:203e:7d7b with SMTP id 5a478bee46e88-3856c6b35b5mr7316665eec.2.1795278529933;
        Sat, 21 Nov 2026 08:28:49 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm22057667eec.26.2026.11.21.08.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 08:28:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] leancrypto-module: Fix RISC-V build without CONFIG_RISCV_ISA_V
Date: Sat, 21 Nov 2026 08:28:46 -0800
Message-ID: <20261121162846.1627792-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 21 Nov 2026 16:28:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132785
Content-Type: text/plain; charset="utf-8"

kernel_vector_begin() and kernel_vector_end() are only declared when the
kernel is built with CONFIG_RISCV_ISA_V, so building against a riscv64
kernel without it fails:

  internal/api/ext_headers_riscv.h:28:26: error: implicit declaration of function 'kernel_vector_begin' [-Wimplicit-function-declaration]

Without CONFIG_RISCV_ISA_V, may_use_simd() always returns false and the
RVV code is never selected, so make the vector enable/disable macros
no-ops in that case.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-RISC-V-build-without-CONFIG_RISCV_I.patch | 45 +++++++++++++++++++
 .../leancrypto/leancrypto-module_1.9.1.bb     |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-crypto/leancrypto/files/0004-Linux-kernel-Fix-RISC-V-build-without-CONFIG_RISCV_I.patch

diff --git a/meta-oe/recipes-crypto/leancrypto/files/0004-Linux-kernel-Fix-RISC-V-build-without-CONFIG_RISCV_I.patch b/meta-oe/recipes-crypto/leancrypto/files/0004-Linux-kernel-Fix-RISC-V-build-without-CONFIG_RISCV_I.patch
new file mode 100644
index 0000000000..d7922061a1
--- /dev/null
+++ b/meta-oe/recipes-crypto/leancrypto/files/0004-Linux-kernel-Fix-RISC-V-build-without-CONFIG_RISCV_I.patch
@@ -0,0 +1,45 @@
+From 48afc009a1dcd588597f966fdaef7b2b6a36c0a6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Nov 2026 23:28:18 -0800
+Subject: [PATCH] Linux kernel: Fix RISC-V build without CONFIG_RISCV_ISA_V
+
+kernel_vector_begin() and kernel_vector_end() are only declared by
+<asm/vector.h> when the kernel is built with CONFIG_RISCV_ISA_V, so the
+RVV code fails to compile against such a kernel:
+
+  internal/api/ext_headers_riscv.h:28:26: error: implicit declaration of function 'kernel_vector_begin' [-Wimplicit-function-declaration]
+
+Without CONFIG_RISCV_ISA_V, may_use_simd() always returns false, so
+LC_CPU_FEATURE_RISCV_ASM_RVV is never set and the RVV code is never
+called. Make LC_VECTOR_ENABLE/LC_VECTOR_DISABLE no-ops in that case.
+
+Upstream-Status: Submitted [https://github.com/smuellerDD/leancrypto/pull/82]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ internal/api/ext_headers_riscv.h | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/internal/api/ext_headers_riscv.h b/internal/api/ext_headers_riscv.h
+index d63af536..dac4f386 100644
+--- a/internal/api/ext_headers_riscv.h
++++ b/internal/api/ext_headers_riscv.h
+@@ -25,8 +25,18 @@
+ #include <asm/vector.h>
+ #include <asm/simd.h>
+
++#ifdef CONFIG_RISCV_ISA_V
+ #define LC_VECTOR_ENABLE kernel_vector_begin()
+ #define LC_VECTOR_DISABLE kernel_vector_end()
++#else
++/*
++ * Without CONFIG_RISCV_ISA_V the kernel does not provide
++ * kernel_vector_begin/end, and may_use_simd() always returns false, so the
++ * RVV code paths are never selected.
++ */
++#define LC_VECTOR_ENABLE
++#define LC_VECTOR_DISABLE
++#endif
+
+ #else /* LINUX_KERNEL */
+
diff --git a/meta-oe/recipes-crypto/leancrypto/leancrypto-module_1.9.1.bb b/meta-oe/recipes-crypto/leancrypto/leancrypto-module_1.9.1.bb
index 439de1a141..ea07ed898c 100644
--- a/meta-oe/recipes-crypto/leancrypto/leancrypto-module_1.9.1.bb
+++ b/meta-oe/recipes-crypto/leancrypto/leancrypto-module_1.9.1.bb
@@ -5,6 +5,7 @@ require leancrypto.inc

 SRC_URI += "file://0001-linux_kernel-use-target-architecture-for-generated-headers.patch \
             file://0002-linux_kernel-make-all-objects-depend-on-generated-he.patch \
+            file://0004-Linux-kernel-Fix-RISC-V-build-without-CONFIG_RISCV_I.patch \
             "

 inherit module
