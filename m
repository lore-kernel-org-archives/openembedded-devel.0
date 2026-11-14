Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3151.1794685072549182084
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 11:37:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=aV3zEHXN;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-37628596783so3699775eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 11:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794685072; x=1795289872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2zRaP/hrz7hnoqLaIwRn9MqpcCWVyw1p7QPrr2kG0Ac=;
        b=aV3zEHXNq7345mlvNTyDmP4f/dIDYFmy9JmMUqmAarb/qUCuapA+cwRQt6tcApuMf9
         QCM3spuwjSHlYJBUwOUl71EK9siAjzMYR6UkSvgjwjp1BiuqP9upO/0VbccPmBRK9qqZ
         xBUEetT9mVOJ5RTTtDM2TVJoFA+/P4risu4ZgzFOZ3oSJInAC27WJ+GaTt0qTtKnTPK1
         /yY+9xXyg9DuaEhaOohuhEZQWnpBbwTb0VP4EOdmc1QyhOFD7Mqu5dJNU9TRPRUuxuCG
         DkQ5epdzvrSUX6/cU2fhiOkn+rdhwLgym8UjKxJfjrjJirigzMGNAM468agkiq8Jqmyr
         VXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794685072; x=1795289872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2zRaP/hrz7hnoqLaIwRn9MqpcCWVyw1p7QPrr2kG0Ac=;
        b=ybY+1VmzwmGuRstJ6sM92bmMsi6Jtbg67mPife0hgx5i9SRmfPcQOlgZ/Yif/xfefe
         oyw9beAJqfgmzJWPJiImrBi6MaEXo5SqWYXKSD0T1nkRsZk3fqeNTAMO5mEFLNA0iW0K
         0UqtgQ94IFwvH3TA/Cymc7yvbAMDVmhLftbNnz8mPkEYsPuIja9E2wZr15NQVHL8lsH7
         HrM6uv4uTkFMT5svV3v3qbT+0N/L0TItZJDhS30BzHKCJvUGi0gAD7VvMFQ05AonV4UE
         7zq6VOaxhw+3iRsC7i1Q57gaGQGQHpGuWREYFwE0WkDPGqr6Ml+SBwFZrxv0+a96F8il
         /F2g==
X-Gm-Message-State: APuU4Z85ctzqRhBvv27cvteV4DN6IW5VnyiapiW5h7rlsmSdJ4PQ/Yv6
	QTJstAMM5GIhpqvs2A18aqiIbAqgHzdF3YTiodO4QAtRDafy6ZDwTvGRsWeQNZfZ
X-Gm-Gg: AYBFou00yRScY6G2ktUFbWntpfy6XQXkivRJTeIs++WJ9Rkc4ZoU/hD2YNOYXeWzGmP
	nER1p8taLvjCKY4hOzK1OBpSmm9HHTGBX1JXWGHITNUB9ZbWUng/+FGZwBZEBWTASKT7mQ9xJuU
	/KWFbjMEPyNN+tKskktQYyXEuq5rx1muaEzAWZR0Q2AFhhZX88JGfIG6XKKoUkkNw4b3TiiKlIX
	dE6Yebez1xib+gRu0ZOM+4Tw2y9QmQtKhXONyLU0nrifMyv0Qh/PbhNlKpCWhgVS6mc1tUyquzP
	5hizfe1JukFHjHCwOfFrizndDDKvG1sRo/SO73+wXrQh7jJln2IVS/sX2t8lGlJNLcYjAafVrx/
	GlhywLsDybkh8qpYV4UlUJWn/ZTLHCBHlHEUL0gv5PtTY+s31irtIVMWWtSa1yCtoLtUHhhoa4B
	YtFDzre86HnHklzWkz51H5+wSrNiAYJrHmrV8Im228S5pT6KGfNa0C+G3ONqbQ9pqh6MxCS2Msy
	JwdjbpmlD8Bx1PYTBN3uNR4ksiwEGJIVD5i9XAZsDZf/9L3eMOqGJBKNpTDMfoejPmw6sNw5gvf
	RAqAvHOpwWEdsrhl8daHq0T19y3SgL+pEDJ6S4eHAxCycGet2djvwV0fxMXZtysRU73bYhGq734
	J24tuczL1w7f9gUD+xVn9vlpHiIPE4HVOBsFr1/rhATdGZhQ4wPNT2b+Dmvra/djFPjKKZbddqO
	eFJbNPlGlb2FNX0quXMdgB8/oaOiALck7cSzkI1FR0eSObyB+dL3/nyYydfSijlYWh4SU7JnOzw
	hkfSHvZiG1NjIuug5EwJ5Xh7GyO4+rUZwITvNzPm0WmWmycrvWwxsL6/bJnon5c2iAMyPEOiFEM
	pV0k
X-Received: by 2002:a05:693c:87d7:20b0:35f:8c5d:5928 with SMTP id 5a478bee46e88-37967125e78mr5358924eec.30.1794685071866;
        Sat, 14 Nov 2026 11:37:51 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm16855164eec.4.2026.11.14.11.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:37:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 13/13] fluentbit: Fix build with clang 23 on riscv64
Date: Sat, 14 Nov 2026 11:37:33 -0800
Message-ID: <20261114193733.1743149-13-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114193733.1743149-1-khem.raj@oss.qualcomm.com>
References: <20261114193733.1743149-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 19:37:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132270
Content-Type: text/plain; charset="utf-8"

The bundled simdutf enables its RVV kernel through target regions with
clang >= 19 even when -march has no V extension, and clang 23 rejects it:

  simdutf.cpp:4941:57: error: RISC-V type 'vuint16m1_t' (aka '__rvv_uint16m1_t') requires the 'zve32x' extension

Backport the upstream simdutf change that drops the RVV target region
support, so the RVV kernel is only built when targeting V.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...imdutf-Do-not-use-RVV-target-regions.patch | 42 +++++++++++++++++++
 .../fluentbit/fluentbit_5.1.5.bb              |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0005-simdutf-Do-not-use-RVV-target-regions.patch

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0005-simdutf-Do-not-use-RVV-target-regions.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0005-simdutf-Do-not-use-RVV-target-regions.patch
new file mode 100644
index 0000000000..76b67bde7b
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0005-simdutf-Do-not-use-RVV-target-regions.patch
@@ -0,0 +1,42 @@
+From e20d9dd911c83790316f66277320851cdc0c96b8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 11 Nov 2026 11:41:05 -0800
+Subject: [PATCH] simdutf: Do not use RVV target regions
+
+With clang >= 19 simdutf enables its RVV kernel through target regions on
+riscv64 even when the baseline -march has no V extension. clang 23 rejects
+the RVV types in the function templates of that region:
+
+  simdutf.cpp:4941:57: error: RISC-V type 'vuint16m1_t' (aka '__rvv_uint16m1_t') requires the 'zve32x' extension
+
+Upstream simdutf no longer defines SIMDUTF_HAS_RVV_TARGET_REGION, so the
+RVV kernel is only built when the compiler targets V. Backport that hunk to
+the bundled amalgamation.
+
+Upstream-Status: Backport [https://github.com/simdutf/simdutf/commit/37be90689b18]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/simdutf-amalgamation-5.5.0/src/simdutf/simdutf.h | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/lib/simdutf-amalgamation-5.5.0/src/simdutf/simdutf.h b/lib/simdutf-amalgamation-5.5.0/src/simdutf/simdutf.h
+index 4b534c1..a0945ae 100644
+--- a/lib/simdutf-amalgamation-5.5.0/src/simdutf/simdutf.h
++++ b/lib/simdutf-amalgamation-5.5.0/src/simdutf/simdutf.h
+@@ -156,11 +156,11 @@
+ // RISC-V 64-bit
+ #define SIMDUTF_IS_RISCV64 1
+ 
+-#if __clang_major__ >= 19
+-// Does the compiler support target regions for RISC-V
+-#define SIMDUTF_HAS_RVV_TARGET_REGION 1
+-#endif
+-
++//#if __riscv_v_intrinsic >= 1000000
++//  #define SIMDUTF_HAS_RVV_INTRINSICS 1
++//  #define SIMDUTF_HAS_RVV_TARGET_REGION 1
++//#elif ...
++// Check for special compiler versions that implement pre v1.0 intrinsics
+ #if __riscv_v_intrinsic >= 11000
+ #define SIMDUTF_HAS_RVV_INTRINSICS 1
+ #endif
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_5.1.5.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_5.1.5.bb
index a9a5122e83..5b71003bbe 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_5.1.5.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_5.1.5.bb
@@ -23,6 +23,7 @@ SRC_URI = "\
     file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch \
     file://0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch \
     file://0003-CMakeLists.txt-Revise-init-manager-deduction.patch \
+    file://0005-simdutf-Do-not-use-RVV-target-regions.patch \
 "
 SRC_URI:append:libc-musl = "\
     file://0004-chunkio-Link-with-fts-library-with-musl.patch \
