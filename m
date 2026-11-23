Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48022.1795411832812672115
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=zL/qB+IO;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-380b40312e2so7012014eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411832; x=1796016632; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nxlt/hReqvzH5uHxX5UHBZYuxKVJw9MT8d+h5WxUmaY=;
        b=zL/qB+IOKRqvW0PvBLAGnYdMlOUe+gbo+q6AR4yfGc0TIVfFnnO1RAXdTjDc0OjNTO
         scSuxVtXfBLovFyjUTdiSKMBIGJJnHRiTcDidFFDfNl4NEV5vwXmJQEsrh89xZcaPaK5
         lrqTycHiI+KmyZENwRt0mZCiYJL4U7DvQhZP9fM7fr283V9rGwmsXRgsjODvVa64+gjl
         GPDd34d2eLsCV9ScEe4qG7GkPPS7hAlAtiVP8bn89BLN4NrXtv6DiqV+DQcrU0z23e5k
         KbBI5ghtcPiFCfbWhOcKKtd2KPFmfU89N9znpUGatGRilFX3SgC4jqtGUzFeYffzbtvr
         mF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411832; x=1796016632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nxlt/hReqvzH5uHxX5UHBZYuxKVJw9MT8d+h5WxUmaY=;
        b=zR15y9vF9cRMRilQOP6ndGHYoVqCEDXKNYjdG9IDnc+mRs2JEoZjUP9LzZJwu0diNS
         oXSePE7AwoDAZNRc6+eXKCRGEHlGTM2m2+NIRCei9ShvvRVTxV6kMV+Ca/tSmMxcZnJ6
         yyeC7vxbWiarKzc5bVTPCWR/j/TuZMHfZujDRyEZeTbmEfGyvaZ8yibWkL4FdMkQGmDa
         EaRom/QW0MQvNDtaRjmNkxKeEu0I2qok/qBzJ9Nnq5aJyV5VheM/lWyk/Bgd4C84HCqm
         BYTp4QnLxA+Rr5NfxYFoOOFhuC5/VCNLBX55tMvdHaDFtHtWHCA2z0BxhWNwlqsebTV8
         ECNg==
X-Gm-Message-State: APuU4Z9jUgn0mZX9tU9SDqa5ik1AYZaFIX0TJf3mZSgj0Hq5VkzlhqMT
	ITvz8uculeMb8j3CxXzjel6hHccYUBvAC6IV396zegaumtTUf1+oAFk7p+KmQKGEIzw=
X-Gm-Gg: AZFdTZdZeMqZGauyYG+PtrhuYlS1/tNIq34wmwhu9cJJ9Vqen40HAFHgstuh/IA+RcX
	eQMqDFjF9WIw1hw2vB/uw1jkAmb02oEhkhhWb4WdP/F1Jq70yCnKoCpVfkx1pUqLgVGOmmIYCQM
	2Uuwt+NbpjwiXLmonVtyJJibW9Yt+C3buby1y2dhemqyKsqLxqwIBkTSWiBkUQr86dL5KOYzCQy
	MOKf1SU+hXnXkhicFu/uvyAyPAkOMi3a+Fjlyh2Iv70DEK4dIzOwLYj9YAc7qt4mm5Zdw5bDVy5
	TMzq2jD3B8m74jdbQTovbnA4rCFcHDVS7eZ30Vn1ZUeFZ7y89WbAJOmQJFcDXs+1Uo7K0HoTWxx
	0Kac7TuRMNNnjjrbUSObnEO3bi1KKyUqcMbYtcucKgjqP5T2fBM6DR7BI/5uq6pNoUI4EWFb1c9
	JVNcqQ3vSUOqHuyt2cELpDXa+uYz8BzeKsSf+mx4bV/LeszVPgWwgKJXDJsoDXvfsRTDqLjS0d7
	tycwKpH4ouH83yeoQugjikwje0nzC9fxkxRtj5adHsQ5mwhTlBFWPIV5EyDQjmTBEA9Bdv7ypf4
	OYa2+nn4O2q0ul9Q36Ny3vWpYTbFCjS1QVJ5jluV4RjK1gvcLVdBpIyTriE+zVQb+QyCzHDtqIh
	R+1D+vCfCEjwtzcgSPvSaz5rQiVfomPVdkb+1XOP8edo6uaMEjjPMoVOyMA479EIoypoimcOy+P
	ieSm4YdToaybvtHqkdz78AqPeAkarPfLPuOQkfYi/Zs+r+mRFJNRM7nHu4VhpmYNM5f2dZkJqU5
	Zfr3Hp1XCAvI3TvzJuNvx+Ug5yADtdOKqE3oRs9/07wOfJHBOwUCLzZxPAa1N4uTTXG3k1PHn8E
	3I9g
X-Received: by 2002:a05:7300:f0c1:b0:386:9b72:274 with SMTP id 5a478bee46e88-3869b7211e9mr7852282eec.39.1795411832178;
        Sun, 22 Nov 2026 21:30:32 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 01/42] abseil-cpp: upgrade 20260526.0 -> 20260817.0
Date: Sun, 22 Nov 2026 21:28:45 -0800
Message-ID: <20261123052953.3658549-29-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132816
Content-Type: text/plain; charset="utf-8"

- Add URL escaping utilities to absl/strings/escaping.h
- Deprecate absl::void_t in favour of C++17 std::void_t
- Hashtable iterators returned from insert/emplace are now
  non-iterable (iterating them was already a bug)
- Many bug fixes and optimizations

Drop the raw_hash_set bmi2intrin.h patch; the header no longer includes
<bmi2intrin.h>.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...lude-immintrin.h-instead-of-bmi2intr.patch | 36 -------------------
 ...20260526.0.bb => abseil-cpp_20260817.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 38 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-raw_hash_set-include-immintrin.h-instead-of-bmi2intr.patch
 rename meta-oe/recipes-devtools/abseil-cpp/{abseil-cpp_20260526.0.bb => abseil-cpp_20260817.0.bb} (91%)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-raw_hash_set-include-immintrin.h-instead-of-bmi2intr.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-raw_hash_set-include-immintrin.h-instead-of-bmi2intr.patch
deleted file mode 100644
index 38eba684d9..0000000000
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-raw_hash_set-include-immintrin.h-instead-of-bmi2intr.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 24 Jun 2026 00:00:00 +0000
-Subject: [PATCH] raw_hash_set: include <immintrin.h> instead of <bmi2intrin.h>
-
-Clang refuses a direct include of <bmi2intrin.h> and errors out with:
-
-  error: "Never use <bmi2intrin.h> directly; include <immintrin.h> instead."
-
-This is hit whenever __BMI2__ is defined, e.g. when building with
--march=x86-64-v3. Mirror upstream and include the umbrella <immintrin.h>
-header guarded by an x86 check, which transitively provides the BMI2
-intrinsics (_bzhi_u32/_bzhi_u64) used in mask().
-
-Upstream-Status: Backport [https://github.com/abseil/abseil-cpp/commit/d851fdd768b27c02b3fb786fd0987faddd279ece]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- absl/container/internal/raw_hash_set.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
---- a/absl/container/internal/raw_hash_set.h
-+++ b/absl/container/internal/raw_hash_set.h
-@@ -225,9 +225,9 @@
- #include <ranges>  // NOLINT(build/c++20)
- #endif
-
--#ifdef __BMI2__
--#include <bmi2intrin.h>
--#endif  // __BMI2__
-+#if defined(__i386__) || defined(__x86_64__)
-+#include <immintrin.h>
-+#endif
-
- namespace absl {
- ABSL_NAMESPACE_BEGIN
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260526.0.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260817.0.bb
similarity index 91%
rename from meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260526.0.bb
rename to meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260817.0.bb
index c2d1e7f44e..c255394f5d 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260526.0.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260817.0.bb
@@ -10,9 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915"
 SRC_URI = "https://github.com/abseil/${BPN}/releases/download/${PV}/${BP}.tar.gz \
            file://0001-absl-always-use-asm-sgidefs.h.patch \
            file://0002-abseil-ppc-fixes.patch \
-           file://0003-raw_hash_set-include-immintrin.h-instead-of-bmi2intr.patch \
            "
-SRC_URI[sha256sum] = "6e1aee535473414164bf83e4ebc40240dec71a4701f8a642d906e95bea1aea0c"
+SRC_URI[sha256sum] = "f7e05179df39c45434cad433f5783840bb3788ef322976f9138bc6b72b3a107d"
 
 UPSTREAM_CHECK_URI = "https://github.com/abseil/abseil-cpp/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
