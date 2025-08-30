Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60FB0CA0FFF
	for <webhook@archiver.kernel.org>; Sat, 30 Aug 2025 18:43:17 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.15656.1756579395769414045
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Aug 2025 11:43:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LiMJRPsx;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3276f46c1caso2831161a91.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Aug 2025 11:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756579395; x=1757184195; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=We5I/AbEaBVpHlNcdf5HQIN6e5ZiTdPeSgK2bCuixis=;
        b=LiMJRPsxrLSIFrtlaziSaiNxvJ2u5u8nX12EYe6Zi5YZ3uuBPh4GbAMvvRSYR8PGYw
         6h49MnDP9hbx7P+VGwbHMhZS/ckU/xQmjPnhzWy4TUUVES3BiDKMwFuNz+N2XQsvzVsk
         K9R1S1kVps08ftyVL8xX/P8Ko0FGWYhX6YFqW4bsEURHDoCcujY/rQbySlKCWS/NADf4
         yoSn7oU+1+qWBLcr/SUevzAXdAnKKsxVfG26o7x4xQtOrR/oW+MYu+u1RP/FUe2nidVs
         S243LK/MCmMzd2ddvrJK1/YS/UfYSRJR0V3Qs+l2It7vLJwxuAwzFszq/stFMKBhk/Gg
         SVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756579395; x=1757184195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=We5I/AbEaBVpHlNcdf5HQIN6e5ZiTdPeSgK2bCuixis=;
        b=qUTw/tHGrEWcY31a9hQtv80HX1QQjZuyINWZjPzjD4TZH3i3CHyUbllY/5bWBE+LTh
         dB1/o5QgtEaXdShfsUF9ci1D5nzgAZcQQyh1mXu4JXpm2IsBxTTxwFbL3Ad1O0LdejZ4
         qvbGiZ1rljJcD1d8U7FOijS1RdIR4v1sKAzVlA+HIc18LUxtJeARsbn0TFi7k3ef0zXs
         uuSxRSKcovPSmXUMEvHFuEe8vfrAt+jKnJEphlNXX90Al4NxAFx4qPqapuKcPiCAUtsi
         8ixm+DzO96vMGpG3hE03voSo3K6VGCYH52AG+b81vC3IGBVrpitD7PkBRKAOFv1utR9G
         ICmA==
X-Gm-Message-State: AOJu0YxfmHDsz95mp9XgZXbWLUdcgfsJbvYd64ALEkmp8FFCL/Vfbk7l
	0Ifswmvl4KznvgUR1WhOLxK4KhWf9ZC/5TXpbA7roWfruSudfKwW73EQWvwznLxN
X-Gm-Gg: ASbGnctuJNH2zx/Szn3I3w6MXP76wsaXyufw7f/06+DiHurptYYC7pGEkPiyjvaBiTC
	XcLJqU27nwPdUFFLBH6dh8g2z8/IZyPY7nuPKSix3Mab/k/9C7AaKO9L0kYEmnbfqRxTDNlTfS/
	hGVS5WE8/cM4f+EN8bbvlrB5h1SdjN0Fuy2/QD2Les9ayV8PqsfiV3fUT40mM8PvvXtIB33lT8V
	7Jrc7l60uYvaIC8t2mODIsU5bXBE8NoXkEpQWdt6d0/dbBUW2H/W+q/9k7uema/tgYvbc3SpOSY
	EgGY3Yffydqsv803G5m0/UWkCqmVoVIUd+tWwdqs8s3ZDYU3PVOsYlXJNKzallmxJLXh7KpGZeR
	L++kAdYK+2Gm1fFpxrYcGQKxLR9zbU5XZ6vckLfqn2AGXxr1Q9r51ssvojoEX9lravAxdTzcBye
	8pdWJcEDhn3SH6Nyc9kl1Wtu74zDFKDGHSZW5tUkvi
X-Google-Smtp-Source: AGHT+IEQYm+0Q7joNNe3v5LQxYNojdEtaxuK7HoVqE0ZZhEGJFYjKJMtEEXDu2ShVYDj+IPTB9b4dA==
X-Received: by 2002:a17:90b:3b4f:b0:327:4bd2:7bbe with SMTP id 98e67ed59e1d1-328154128bemr4127005a91.4.1756579394835;
        Sat, 30 Aug 2025 11:43:14 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::c2de])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327d9330b73sm6462091a91.4.2025.08.30.11.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 11:43:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/8] bcc: Fix build with LLVM/Clang 21
Date: Sat, 30 Aug 2025 11:43:03 -0700
Message-ID: <20250830184311.1018374-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250830184311.1018374-1-raj.khem@gmail.com>
References: <20250830184311.1018374-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Aug 2025 18:43:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119143

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ix-a-build-failure-with-clang21-5369.patch | 50 +++++++++++++++++++
 .../recipes-devtools/bcc/bcc_0.35.0.bb        |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-Fix-a-build-failure-with-clang21-5369.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-Fix-a-build-failure-with-clang21-5369.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-Fix-a-build-failure-with-clang21-5369.patch
new file mode 100644
index 0000000000..571b496f71
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-Fix-a-build-failure-with-clang21-5369.patch
@@ -0,0 +1,50 @@
+From 2e3997121af597f3a54d97505a38b7fdb9febae3 Mon Sep 17 00:00:00 2001
+From: yonghong-song <ys114321@gmail.com>
+Date: Mon, 14 Jul 2025 20:21:59 -0700
+Subject: [PATCH] Fix a build failure with clang21 (#5369)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The build error message:
+  src/cc/frontends/clang/loader.cc:400:73: error: no matching function for
+   call to ‘clang::TextDiagnosticPrinter::TextDiagnosticPrinter(
+     llvm::raw_fd_ostream&, clang::DiagnosticOptions*)’
+  400 |   auto diag_client = new TextDiagnosticPrinter(llvm::errs(), &*diag_opts);
+      |                                                                         ^
+The llvm commit
+  https://github.com/llvm/llvm-project/pull/139584
+caused the build failure.
+
+Adjust the code properly and the error is fixed.
+
+Upstream-Status: Backport [https://github.com/iovisor/bcc/commit/8c5c96ad3beeed2fa827017f451a952306826974]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/cc/frontends/clang/loader.cc | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/cc/frontends/clang/loader.cc b/src/cc/frontends/clang/loader.cc
+index 07dc9d6a..6f8387aa 100644
+--- a/src/cc/frontends/clang/loader.cc
++++ b/src/cc/frontends/clang/loader.cc
+@@ -396,11 +396,19 @@ int ClangLoader::do_compile(
+                     flags_cstr_rem.end());
+ 
+   // set up the error reporting class
++#if LLVM_VERSION_MAJOR >= 21
++  DiagnosticOptions diag_opts;
++  auto diag_client = new TextDiagnosticPrinter(llvm::errs(), diag_opts);
++
++  IntrusiveRefCntPtr<DiagnosticIDs> DiagID(new DiagnosticIDs());
++  DiagnosticsEngine diags(DiagID, diag_opts, diag_client);
++#else
+   IntrusiveRefCntPtr<DiagnosticOptions> diag_opts(new DiagnosticOptions());
+   auto diag_client = new TextDiagnosticPrinter(llvm::errs(), &*diag_opts);
+ 
+   IntrusiveRefCntPtr<DiagnosticIDs> DiagID(new DiagnosticIDs());
+   DiagnosticsEngine diags(DiagID, &*diag_opts, diag_client);
++#endif
+ 
+   // set up the command line argument wrapper
+ 
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.35.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.35.0.bb
index b810f6ec77..8c6e44edbc 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.35.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.35.0.bb
@@ -21,6 +21,7 @@ RDEPENDS:${PN}-ptest = "kernel-devsrc packagegroup-core-buildessential cmake bas
 SRC_URI = "gitsm://github.com/iovisor/bcc;branch=master;protocol=https;tag=v${PV} \
            file://0001-CMakeLists.txt-override-the-PY_CMD_ESCAPED.patch \
            file://0001-Vendor-just-enough-extra-headers-to-allow-libbpf-to-.patch \
+           file://0001-Fix-a-build-failure-with-clang21-5369.patch \
            file://run-ptest \
            file://ptest_wrapper.sh \
            file://fix_for_memleak.patch \

