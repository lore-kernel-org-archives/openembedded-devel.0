Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C9E8C44502
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 16:22:51 +0000 (UTC)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20734.1782663764072231541
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 09:22:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=K4TIO0zH;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30bc871ecdfso3314147eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 09:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782663763; x=1783268563; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0LN7cvfsFWiDlnOCvIL/tYEBkaTayjpXmaHQhlwVEs=;
        b=K4TIO0zHrJsM5BOkLs1jM2Syv2K/WItuLNmyHpniS237mWfzZkrPaNX4uVzAgkZygf
         l/ADBjB1rjBgQe+sF3jqpnzlnaH8vUYQJlKmhvE45I64s717Ppg67waCqxaUXiL3Ucbk
         bQ50LwV+vxnJfGxZSsGJ2l5P5oCauiv4QEVX2WYqAcRH60PuTN4oIuE5YL4sDy9X2TyT
         ZBegdykjw0lR5Ypl5//iNc+iPpDlihnFLupMThHVVLR5qeJBkwS+Q6vIvjO6uM0Xf0DE
         BIW7Sdoe+k2/rSWhbifqMtniVwbuVUi8a/It8MaKfhEh1mlAx3OhOC5rTkDAgGqT3sId
         FFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782663763; x=1783268563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k0LN7cvfsFWiDlnOCvIL/tYEBkaTayjpXmaHQhlwVEs=;
        b=GraAXxwD5YXPed2ndgJgeJyUMwHNv2mq+RV4qGCuqZ9H9WeaSNvOtIPeTBxY5i1oA/
         aoFJAyHTb32R6ltCdss+Y5HJatWlNRf4SIQFudfAqXkDYcAZZu9iGi7ukgMsCu1ievz1
         FIdeJsJ2iN+r46wxuWSQivePY8mBjFfMuQ1AvAQorPMbJRlr2ShyGtr1HjXeOOWrijXn
         nECISDecVct1BtgWCGry7eJP6VaKdWYZuloTsw4jfJaCaKmDnXj0+TtqUT/Ju2CsZmmd
         Y0yK5UJxd9HjUnI/hy62coztZksXbAN25FvSdLLD03Ypf5P1fSU9Nl+RSYRkLcCU2Fdn
         KSrw==
X-Gm-Message-State: AOJu0YzrKayTpbcEW7f3Xj5B5waYOhiGz3xv9QiLMK6mhGdERHR+mi/s
	0ix5crgQ/N040UvICe4BNfA8hmpXRZOXgwcz7PXRD6VfYMhgjjcu2bqVRPGRMR7Hu/rbIw==
X-Gm-Gg: AfdE7clizSWTaqcLlpGTkClWBTMdlM12gPqr3VpTv40VfqJJEtew/eXa7NHv580NWuD
	OuCslEmYn0qOaKCrJMBS772XZOSnCAWlY27SybDjl/MD9pvMX2qvA+fNuc6mCCj7lTBMXFdWaZO
	YwZ5iN3jnJMa7WGIXak53P3PBOALR0fd6dgfP2IQ4HPdvrLzB/cRHGwVcIoVJsTEHSawuNEXMZG
	zauK2FnJ9zY8UuByD3RMnwM8G56mT3IKituQTlSwJ+MEhWHgpip7CAUcdrJOOM6icJqBW521mAs
	RVm5ik5HIScWK2/hsfpDWV2dsswRBfart162XJvm9nt9VoorjE442QU40OtOcAOGzWuNDDzUcfa
	xI+/2P9bcD9f/j5Z5cgwxwAo4ikJz34v//xXXj81k09yIwxmI4QJ/lEKQ80twXB2/x5MThyPOQZ
	cD1BdPfFr+gRdi6mG3DEmPWW2QX9gsfQS2cNRGJPtZjXmJjgJOMp2oMOenMNz886Dc7xFdg7tSJ
	NpgbkrepFAu4p+/MYWqjaa6vpC7xS+D02Hm9EAr2chg/9mh4M1uP86Zuqco/H6ULkgkwxfJj3Ny
	Hx3o2u+CtpG6ffG8fp8LxhMJJFCeBg==
X-Received: by 2002:a05:7300:3202:b0:30c:ab4d:3823 with SMTP id 5a478bee46e88-30cab4d3cffmr7863391eec.37.1782663763318;
        Sun, 28 Jun 2026 09:22:43 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm49849445eec.7.2026.06.28.09.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 09:22:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 118/128] android-tools: fix build with libstdc++ and current C++ frontends
Date: Sun, 28 Jun 2026 09:22:12 -0700
Message-ID: <20260628162222.4081517-18-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
References: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 16:22:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127928

From: Khem Raj <raj.khem@gmail.com>

Two build failures occur with the default clang/lld toolchain (and with
gcc) when compiling android-tools 35.0.2:

1. The bundled fmtlib 10.2.0 validates FMT_STRING() inside a consteval
   basic_format_string constructor whose parse path evaluates
   "format_str_.remove_prefix(detail::to_unsigned(it - begin()))". Current
   C++ frontends reject that iterator subtraction as a non-constant
   subexpression:

     error: call to consteval function
       'fmt::basic_format_string<...>::basic_format_string<FMT_COMPILE_STRING,0>'
       is not a constant expression

   Define FMT_CONSTEVAL to empty so fmt drops the consteval qualifier and
   validates format strings via its runtime path instead.

2. adb's IOVector::coalesce() static_asserts that its Block collection type
   is standard-layout. Block holds a std::unique_ptr<char[]>, which is
   standard-layout under LLVM libc++ (AOSP's runtime) but not under GNU
   libstdc++, so the assertion fails for libstdc++ based toolchains:

     packages/modules/adb/types.h:235:27: error: static assertion failed due
     to requirement 'std::is_standard_layout<Block>()'

   The assertion does not protect the memcpy it guards (which writes into
   plain char storage), so drop it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ortable-is_standard_layout-assertion.patch | 42 +++++++++++++++++++
 .../android-tools/android-tools_35.0.2.bb     |  8 +++-
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/0011-adb-drop-non-portable-is_standard_layout-assertion.patch

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0011-adb-drop-non-portable-is_standard_layout-assertion.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0011-adb-drop-non-portable-is_standard_layout-assertion.patch
new file mode 100644
index 0000000000..c8316a48fa
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/0011-adb-drop-non-portable-is_standard_layout-assertion.patch
@@ -0,0 +1,42 @@
+From 1cbe4eb212f9be35e89eb7f43160c7e0ec35524c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 24 Jun 2026 17:50:54 -0700
+Subject: [PATCH] adb: drop non-portable std::is_standard_layout assertion in
+ IOVector::coalesce
+
+IOVector::coalesce() asserts that the destination collection type is
+standard-layout before memcpy'ing the coalesced payload into it:
+
+  static_assert(std::is_standard_layout<decltype(result)>());
+
+The default collection type is Block, which holds a std::unique_ptr<char[]>
+member. unique_ptr is standard-layout in LLVM libc++ (what AOSP builds
+against) but not in GNU libstdc++, so the assertion fails for any
+libstdc++ based toolchain (gcc, or clang with the default C++ runtime):
+
+  packages/modules/adb/types.h:235:27: error: static assertion failed due
+  to requirement 'std::is_standard_layout<Block>()'
+
+The assertion does not protect the memcpy, which only writes into the
+contiguous char storage exposed via Block::operator[]; Block being
+standard-layout is irrelevant to its correctness. Drop the assertion so
+the code builds with libstdc++.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ packages/modules/adb/types.h | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/packages/modules/adb/types.h b/packages/modules/adb/types.h
+index 18c8e13..2ed006a 100644
+--- a/packages/modules/adb/types.h
++++ b/packages/modules/adb/types.h
+@@ -232,7 +232,6 @@ struct IOVector {
+ 
+         size_t offset = 0;
+         iterate_blocks([&offset, &result](const char* data, size_t len) {
+-            static_assert(std::is_standard_layout<decltype(result)>());
+             memcpy(&result[offset], data, len);
+             offset += len;
+         });
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
index 3a277cd4b5..5a3ff3a6dd 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
@@ -55,6 +55,7 @@ SRC_URI = "https://deb.debian.org/debian/pool/main/a/android-platform-tools/andr
            file://0008-adb-GCC-compatibility-fixes-for-usb_linux-and-sysdep.patch \
            file://0009-libbase-include-stdint.h-in-hex.cpp.patch \
            file://0010-adbd-make-systemd-sd_notify-conditional-on-HAVE_SYSTEMD.patch \
+           file://0011-adb-drop-non-portable-is_standard_layout-assertion.patch \
            "
 
 SRC_URI[orig.md5sum] = "352376965cdef7bd7505d8fefdd43d50"
@@ -79,7 +80,12 @@ SYSTEMD_PACKAGES = "${PN}-adbd"
 SYSTEMD_SERVICE:${PN}-adbd = "android-tools-adbd.service"
 
 CFLAGS:append = " -fPIC -std=gnu2x"
-CXXFLAGS:append = " -fPIC -std=gnu++20 -D_Nonnull= -D_Nullable= -I${STAGING_INCDIR}/boringssl"
+# The bundled fmtlib 10.2.0 validates FMT_STRING() inside a consteval
+# basic_format_string constructor whose parse path evaluates "it - begin()",
+# which current C++ frontends reject as a non-constant subexpression. Define
+# FMT_CONSTEVAL to empty so format-string checking falls back to fmt's runtime
+# path instead of the broken compile-time one.
+CXXFLAGS:append = " -fPIC -std=gnu++20 -D_Nonnull= -D_Nullable= -I${STAGING_INCDIR}/boringssl -DFMT_CONSTEVAL="
 LDFLAGS:append = " -fPIC -L${STAGING_LIBDIR}/android"
 
 

