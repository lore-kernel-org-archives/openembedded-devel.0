Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.495.1795102825230747895
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 07:40:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=bRhj34Kd;
 spf=pass (domain: konsulko.com, ip: 209.85.221.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso1539080f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 07:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795102823; x=1795707623; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FxdUQ1e+FbImy++iUqsYsrqVjS/mS5hsrhoaIxmJXmQ=;
        b=bRhj34KdI/Rf1Lcav+OG9zzTOxLa6aDIw2GBtmuieMzZv/PibD2p7L74wO+jkesO2e
         h3apjdLWMQE6wo5MmcIVdZ1Ju0tBy8PfleE3ufPbT9eDeKZBC27Nm27CfucrGfGLtoE/
         3XGQ18M6TOGc4hEHaOj5EWQpyBoZON6tSUIWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102823; x=1795707623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FxdUQ1e+FbImy++iUqsYsrqVjS/mS5hsrhoaIxmJXmQ=;
        b=olxlg79GmFeOSiLnuK5zhs+V9YthkIdFwJOUwXfjXtSNAEXmYqZ/6gnXMjnZqkkqUh
         VM97emkLJTDMR445NTgv1ukyo4XhGv5Yx+CQZLgnij1hC16SOqaPFb1/RN0631Ft4hQk
         optycmB3eZwFi9k3J86V05lh7AwnUeW2BumtMfs8oOthNRfWzc4ON2BVtq06yk8iRp5O
         1HSZT1qDGTI+z0Xlm7kkTedZtWt26O9aIGo+83EVQcFZGIcFFZg2kUWQZQiNUzr3HW4I
         LF8WsaSAc61TRtuEjsZ8Swb7WzYVu5TXI22xHsYHHJlfuDrdr57xlQRAv0UYMvkCuPNh
         4Csg==
X-Gm-Message-State: APuU4Z+FykGacqLsH/zTc3oivHhIAp7gST51EIBMlHhrYEJbkh3yAZzB
	5nJyKeExn3bjF9mTRC5nok8dvHCnhotTK1HDcC/4JewAsTlQsAYrJJ6lSDke1Q3YCUQJrRKJYFY
	RHND+
X-Gm-Gg: AZFdTZeE4i4WtVf/yRJTP3nKPF7wqllqKaL5RcPO833XrGOiN+N9Bj2xVd9WRCY4v3i
	If/NWU7R4xsYzbq9U1UZBzf7SaJTvWWKJE8DvD116G9EKJH31MV8KFf9K7F+xFP4BUUqarxOiaB
	tQwFu96CQH2zv+xxcNjiZB0BXAtduEmYABXkOlA+aKaCnzVToJvDb1qijRrpVStdzVexA5dKMnX
	dvqkpKh4s59DQ7ilYrSbQpsTti9nB0o/T7/sBb/WdloC7ukjrKEw9Jre1R8ea/8mw8aHjmDOc86
	Snw6oOqsYH2qSu3mDjt3HLrYonxo9NDNY0JgUhal0Lym5BG3/W/rKx92Pm0biNYt8Zloai9sMhT
	1YVKKu4Ox27XFjkZRpZBBEGAdXtO81gcogLMpRw5jjqKo5F9ujlPOqosIOSFidGCj6digfOdbrJ
	hfZmGSut2nq/9XxzGsTByxmYm64bw4Jowcn3aG2ns2Qcu6GNFdk7grQ8SqtSHwHGwWCF4fpdy2W
	X6qBepquGPycWosOpmDdKEODM93MaYhVpzU60V80btRuu0C2EhjkLV9WW+AIpT337AUBiUYLdIP
	BkxCTRg5pYYJpoFAC88fM5SeBpj/ZWvZTR67Ii/jYf9O+yhGZuCYTXFPL+uZE7TLmHviOrjnrLB
	oM7QMykP541QMNKaioy/VEQh3gumxN2c2C2MF+jJs41IsJCb+oaKjlmxj08DYPktG7cLVllXhaJ
	o=
X-Received: by 2002:a5d:5d0c:0:b0:4a7:593a:f421 with SMTP id ffacd0b85a97d-4a7593af8b3mr12095246f8f.47.1795102823387;
        Thu, 19 Nov 2026 07:40:23 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm225495f8f.52.2026.11.19.07.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:40:23 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/11] python3-grpcio-tools: Upgrade 1.85.1 -> 1.85.3
Date: Thu, 19 Nov 2026 17:40:08 +0200
Message-ID: <20261119154014.1039002-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119154014.1039002-1-leon.anavi@konsulko.com>
References: <20261119154014.1039002-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 15:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132683
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.85.3:

- Fixed a deadlock that could freeze the entire Python
  process when closing a channel (synchronous API) while gRPC's
  background threads were running Python callbacks (for example,
  call credentials plugins).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...h_set-include-immintrin.h-instead-of-b.patch | 17 ++++++++++-------
 ...1.85.1.bb => python3-grpcio-tools_1.85.3.bb} |  2 +-
 2 files changed, 11 insertions(+), 8 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.85.1.bb => python3-grpcio-tools_1.85.3.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-abseil-raw_hash_set-include-immintrin.h-instead-of-b.patch b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-abseil-raw_hash_set-include-immintrin.h-instead-of-b.patch
index 7b31540ead..26324cd840 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-abseil-raw_hash_set-include-immintrin.h-instead-of-b.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-abseil-raw_hash_set-include-immintrin.h-instead-of-b.patch
@@ -1,7 +1,8 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From f97638e64eb1deeb599ed33237adb71625789ed5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 24 Jun 2026 00:00:00 +0000
-Subject: [PATCH] abseil: raw_hash_set: include <immintrin.h> instead of <bmi2intrin.h>
+Date: Wed, 24 Jun 2026 00:00:00 +0000
+Subject: [PATCH] abseil: raw_hash_set: include <immintrin.h> instead of
+ <bmi2intrin.h>
 
 Clang refuses a direct include of <bmi2intrin.h> and errors out with:
 
@@ -16,21 +17,23 @@ Upstream-Status: Backport [https://github.com/abseil/abseil-cpp/commit/d851fdd76
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- third_party/abseil-cpp/absl/container/internal/raw_hash_set.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ .../abseil-cpp/absl/container/internal/raw_hash_set.h       | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
 
+diff --git a/third_party/abseil-cpp/absl/container/internal/raw_hash_set.h b/third_party/abseil-cpp/absl/container/internal/raw_hash_set.h
+index a50a488..1964e7b 100644
 --- a/third_party/abseil-cpp/absl/container/internal/raw_hash_set.h
 +++ b/third_party/abseil-cpp/absl/container/internal/raw_hash_set.h
 @@ -225,9 +225,9 @@
  #include <ranges>  // NOLINT(build/c++20)
  #endif
-
+ 
 -#ifdef __BMI2__
 -#include <bmi2intrin.h>
 -#endif  // __BMI2__
 +#if defined(__i386__) || defined(__x86_64__)
 +#include <immintrin.h>
 +#endif
-
+ 
  namespace absl {
  ABSL_NAMESPACE_BEGIN
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.85.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.85.3.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.85.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.85.3.bb
index af3f662755..82ae3cdd16 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.85.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.85.3.bb
@@ -10,7 +10,7 @@ inherit pypi python_setuptools_build_meta cython
 DEPENDS += "python3-grpcio python3-wheel-native"
 
 SRC_URI += "file://0001-abseil-raw_hash_set-include-immintrin.h-instead-of-b.patch"
-SRC_URI[sha256sum] = "d6f1ee213a07de9462c90ee5debe4a78dff20306a0fb394a65d48b2f94fe31a1"
+SRC_URI[sha256sum] = "9439be3cfae21974656abf0c07d0e203535162069f2d786667ad6f618c83b5be"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.47.3

