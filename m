Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33656.1794851700034648674
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=oZxysl7A;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-37986eb6fa2so4830172eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851699; x=1795456499; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=866cFDOyj2a33oFexOC6wwz7eKtYHgsUVD8bviJhwQo=;
        b=oZxysl7AzQZ+auDS3jcPT0GJGV2wmQ5F+7WMhRM6znVUR7GAIp80MCIw7lVEvNwo9Q
         IcvfRXevFIQcDjgF785Ctha/c5MnPDjj7vkRHPIXTjCtghIVQcEtHBMS5n9xzE/vf/QT
         aQgjQXDbnAD5cqCk2nUjQODPmEHcXhQca20Q6+AxZ6ozkZES2fqn7AucvfDRsTSn0En/
         eH196LbMtswXcFjKiG11MFGmjVNz0f0WS24ZG0ySiUULwWmhl3yiu6HeLi91E83xMcEB
         zVxoN/b4Yo+gXgapkyBHdmHG8jbQLaZZTFnPe4Jm3mcvtFciWSc/T8MoXqr67e7QndOv
         v4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851699; x=1795456499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=866cFDOyj2a33oFexOC6wwz7eKtYHgsUVD8bviJhwQo=;
        b=Y4ergTTRa5O/fkeGoFpAmG6qwEu9PlZc7t9vhUpuS/V3mz/Ve5CzEiI+zYsLHVvIBR
         ceVJjYPjeeotrbdnSb4RArkKXByekGkigS3v/iJTRB8zVzQKNSipRviyiZkWSEqL3Oha
         tt0M2GSP2fzimUV5IG1NpPE0VL32WJKa/S1DFZlWw8THbgiGdPlOrqk6haX2pzEIgI9M
         wbA20Hq0CTzlqhmi7W6wxW9owNt4Vt5dIowlISvZ81gtAuCZ2roYfzltlR/IN90RNAbr
         df2sUGmDhN8774JRWSGRgoW/eg3w1vX28hx8VPlUewqX5vzv0X6yQgKIN8B8R/ilJy4p
         5bZg==
X-Gm-Message-State: APuU4Z+dIDAYpsjUXf4ytI/vmMTqmuUb6zhaXWdnx9ne0nwLKqqQamue
	g9hQ1gxQzSgoaMs4jq6Vtiv3G3K4/BGzKHUNlSi/ZaITgyM5ZHTx6VZ4YHBBG96z
X-Gm-Gg: AYBFou0iIWik8gI6vpGMAAG5u0+gd+5q4jXyIjI+mVj7dHBG7hOQuqRP9znAx4HTYc7
	032KXxv5akkphTOZFUju6zyn0ZB8T1tBVwkgzWMl2XUgLJ0VqSG877rnFuUS5HlXDIBkEUkw9LT
	0WiOOgst6uW80A6vzHG+mLKM/BXMzLexXBbGe/n4qPBTh5L0h9HPiY9ZyKq1kcEAvzGlyw1HPWV
	/efglULHjUFQYv3LfoA+6kqH/1o84wo5rAlHYz2R5r7e6JfQapcPYvVxmMgETxjQVVQ0wnS2Cor
	i/eCwHRy3ZqeHENnlx+wzU1N9Kd1xMiqir3zWfZxwRKN3DpaviJhe/CYFOeUcTiLCdX0oR62SgV
	reKtsbC31xOZD25iVgzDbe9MldcNAkF7qsN/Cdx0fHypYbWYC3fHtnHAadHlXq0gQugWpuX+kK2
	SySVzyq6w7kqsvhtOu22ERuxEifhYGzCgz8Bc3reoTjlMFkSLMeOF0MUAVEbokSBvGhvsSGh7+x
	ieuWfcX1qv4RKdxpGxl6J3/yRDKuQibvxOWXbxpG3wSoH3sqVNQbyaXjLjLCVGkW7Bjh/nZ0nVW
	Ocuu1oezDJHSPxGFgr/h4BybASvqMuNJiM0accm/fNP/OTBJf+NzfptYNrCFyp2z6QKTnSO52VA
	zNTIRkWPQ29T7kX/g7k9uBK+e0HEdO/z1XOs3W14Lk5ymXg98nvrlL9O0GSw7mdFZVVU9Lx2QQm
	73+tS/PToKkh60Ag2dvUAmXjzsakRTmwLGTDw1KDwxBXkDYFVDVg2P/oN9UeFHVVXoB4qn8JffL
	UfRa+8mH4MPkcgbkRMlf+LUNep4947oqQv1SItn1GQUp+Ush4II6/H5s+LDupRx/bR0iDDZubqp
	F+UY
X-Received: by 2002:a05:7301:2424:b0:362:fa87:2aa6 with SMTP id 5a478bee46e88-3796057b51cmr10232914eec.0.1794851699218;
        Mon, 16 Nov 2026 09:54:59 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 040/105] python3-grpcio-tools: upgrade 1.84.1 -> 1.85.1
Date: Mon, 16 Nov 2026 09:52:52 -0800
Message-ID: <20261116175359.342679-40-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132496
Content-Type: text/plain; charset="utf-8"

Backport the abseil fix for clang rejecting a direct <bmi2intrin.h>
include (needed for x86-64-v3) to the bundled abseil.

Changes:
- Follows grpcio 1.85: Cython unpinned for source builds, OpenSSL 4
  support and OpenSSL 1.0.2 support removed in the bundled gRPC core.
- Security: gRPC core 1.85.1 fixes denial of service in Health Watch
  RPC and HPACK host/:authority handling (no CVE ID published).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...set-include-immintrin.h-instead-of-b.patch | 36 +++++++++++++++++++
 ...84.1.bb => python3-grpcio-tools_1.85.1.bb} |  3 +-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio-tools/0001-abseil-raw_hash_set-include-immintrin.h-instead-of-b.patch
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.84.1.bb => python3-grpcio-tools_1.85.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-abseil-raw_hash_set-include-immintrin.h-instead-of-b.patch b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-abseil-raw_hash_set-include-immintrin.h-instead-of-b.patch
new file mode 100644
index 0000000000..7b31540ead
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-abseil-raw_hash_set-include-immintrin.h-instead-of-b.patch
@@ -0,0 +1,36 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 24 Jun 2026 00:00:00 +0000
+Subject: [PATCH] abseil: raw_hash_set: include <immintrin.h> instead of <bmi2intrin.h>
+
+Clang refuses a direct include of <bmi2intrin.h> and errors out with:
+
+  error: "Never use <bmi2intrin.h> directly; include <immintrin.h> instead."
+
+This is hit whenever __BMI2__ is defined, e.g. when building with
+-march=x86-64-v3. Mirror upstream and include the umbrella <immintrin.h>
+header guarded by an x86 check, which transitively provides the BMI2
+intrinsics (_bzhi_u32/_bzhi_u64) used in mask().
+
+Upstream-Status: Backport [https://github.com/abseil/abseil-cpp/commit/d851fdd768b27c02b3fb786fd0987faddd279ece]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ third_party/abseil-cpp/absl/container/internal/raw_hash_set.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- a/third_party/abseil-cpp/absl/container/internal/raw_hash_set.h
++++ b/third_party/abseil-cpp/absl/container/internal/raw_hash_set.h
+@@ -225,9 +225,9 @@
+ #include <ranges>  // NOLINT(build/c++20)
+ #endif
+
+-#ifdef __BMI2__
+-#include <bmi2intrin.h>
+-#endif  // __BMI2__
++#if defined(__i386__) || defined(__x86_64__)
++#include <immintrin.h>
++#endif
+
+ namespace absl {
+ ABSL_NAMESPACE_BEGIN
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.84.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.85.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.84.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.85.1.bb
index 91d14f719a..af3f662755 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.84.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.85.1.bb
@@ -9,7 +9,8 @@ inherit pypi python_setuptools_build_meta cython
 
 DEPENDS += "python3-grpcio python3-wheel-native"
 
-SRC_URI[sha256sum] = "ca8a326df3441127d6709d992774844bb496db30b08f76ed5d1a912089e03f2c"
+SRC_URI += "file://0001-abseil-raw_hash_set-include-immintrin.h-instead-of-b.patch"
+SRC_URI[sha256sum] = "d6f1ee213a07de9462c90ee5debe4a78dff20306a0fb394a65d48b2f94fe31a1"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
