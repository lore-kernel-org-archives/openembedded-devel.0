Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EDB3C83F17
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 21:37:50 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.93477.1753738660102382398
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Jul 2025 14:37:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C+Xsvkpt;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7490acf57b9so3285348b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Jul 2025 14:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753738659; x=1754343459; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CoMsQS2FZ28dJDcAduhxZiToHpM9+vP/Ghty9G6x1A4=;
        b=C+Xsvkpti7/fSFXviYAqPT2tnVOYMhO2lPFWbOE8vLESQ+bFue+R56YCYxVnvArUrm
         WmW/v1zYOnSsXmi2flGFqfeamlTibpy/a0mtga3N90F4rM2za79H29qRd3rLT/ZJxWbt
         dG/2mW6amUk59nZvSuhb4/MzdwCbBN9zzhDgGvDDBizAxh62YTP20Q0U8DobsuZodTpf
         kwxmlrniDRXEJmf1EibtpyQQMP289GqL3jjMnPMAPNfYtvF+hyGssBVl/Z7/wwQeAmpe
         UPCLZHEzHesMGk+DAW0/k/ONCm+lwKRa7nG7FJ1nZGrqE+GV7KA2gCt3UJ2uniJLwUvM
         ONdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753738659; x=1754343459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CoMsQS2FZ28dJDcAduhxZiToHpM9+vP/Ghty9G6x1A4=;
        b=kHApJ+Hycv27q4AvSo+l1k4UYFQo2max+n5lhcM+e9apXgDDhJ8RRS2cL/Zhs85HR+
         tvC8SHIGv/g958ps+cxbJBPBSAY9bDWCzKblf9dfh2xdnD5KC7ClzLQRIfwp39nJYETh
         zo0sgyCJVa8iP6B55dBBv3oO+DiRiSaRtTz8EFp0PjWMXl/LS7XwAxYkYGhz5JjJ9Yee
         ktAbtNWd/JZYt50bDi7vyqC7l+b2cLVLV9vopFxZYaG+ELRometqoFUys8rXRujZ/EO+
         Uc2IcFVTcTh5QWMDdvqKqo6L7Lxqry3Yrqz0FOZJGIraXGe6pQc11m5tHVIpj145VTy8
         KD/w==
X-Gm-Message-State: AOJu0YxmGDjP1XUkLPrg0aEBP6H+yr7YT56D6ow6xQWN1G1wvGURkfHa
	OcoC9Y4YOJ37u6olH9AmRnmk2WwhZ11pwma6wVHu6Vi6hl+l0HUgRWpwe76jFk2lGOM=
X-Gm-Gg: ASbGnct42EJreJr3aLofI9/9M8VLsg3URWLj/VWXPpVQjDcBbYqjYqqGSE568hBIdWa
	WXRtdpcoe9esSY21krcylcqjyAAbW5tJNiCnclgxyHh/E/bS2zHg74nSpGS7GNtVjtsg3TFzkm9
	9XiaH9Vu5w/bRmRs9MiXgo9V3ukgEHARcQVemif8XRuAa3TGHjvbn58TupR1n2Z1ST/aqBN4tJX
	myFXjk33S05O/bVIcIuSTnvLfgmcnfS/VvA+DzSC1aQ7z+BIFzqVkcB1UFiVp1CZwGobPGRh2Tf
	omnlaWwxLoEMVi2RSsKRg4QjA2jPeP3VKUdJuh1Yko9b+LxvcLtydgce4Ks4VD44YQntpR/yLeD
	h+v1YTZM2nl6NJA==
X-Google-Smtp-Source: AGHT+IFETf5G7vB3ODWQgi1yljFsSUKmgDEAZx2/eMBFTIaxa2EFbDUf8pyBmGABBRCocZi3X9rKZg==
X-Received: by 2002:a05:6a00:3a23:b0:742:a111:ee6f with SMTP id d2e1a72fcca58-76335b749f7mr16641325b3a.10.1753738659062;
        Mon, 28 Jul 2025 14:37:39 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::33e9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640b4d15cfsm6292006b3a.119.2025.07.28.14.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 14:37:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] leveldb: Fix cast warnings seen with clang-21
Date: Mon, 28 Jul 2025 14:37:32 -0700
Message-ID: <20250728213732.3992327-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Jul 2025 21:37:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118751

backport needed patch for googletest

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...instead-of-ImplicitCast_-for-charact.patch | 49 +++++++++++++++++++
 meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb   |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/leveldb/leveldb/0001-Use-static_cast-instead-of-ImplicitCast_-for-charact.patch

diff --git a/meta-oe/recipes-dbs/leveldb/leveldb/0001-Use-static_cast-instead-of-ImplicitCast_-for-charact.patch b/meta-oe/recipes-dbs/leveldb/leveldb/0001-Use-static_cast-instead-of-ImplicitCast_-for-charact.patch
new file mode 100644
index 0000000000..7a06630918
--- /dev/null
+++ b/meta-oe/recipes-dbs/leveldb/leveldb/0001-Use-static_cast-instead-of-ImplicitCast_-for-charact.patch
@@ -0,0 +1,49 @@
+From fa8438ae6b70c57010177de47a9f13d7041a6328 Mon Sep 17 00:00:00 2001
+From: Abseil Team <absl-team@google.com>
+Date: Mon, 19 May 2025 09:01:54 -0700
+Subject: [PATCH] Use static_cast instead of ImplicitCast_ for character
+ conversions
+
+Clang has recently added "warnings when mixing different charN_t types" [1].
+The rationale is that "charN_t represent code units of different UTF encodings.
+Therefore the values of 2 different charN_t objects do not represent the same
+characters."
+
+Note that the warning here may be legitimate - from https://github.com/google/googletest/issues/4762:
+"[...] This is incorrect for values that do not represent valid codepoints."
+
+For the time being, silence the warning by being more explicit about the
+conversion being intentional by using static_cast.
+
+Link: https://github.com/llvm/llvm-project/pull/138708 [1]
+PiperOrigin-RevId: 760644157
+Change-Id: I2e6cc1871975455cecac8731b2f93fd5beeaf0e1
+
+Upstream-Status: Backport [https://github.com/google/googletest/commit/fa8438ae6b70c57010177de47a9f13d7041a6328]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ third_party/googletest/googletest/include/gtest/gtest-printers.h | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+Index: leveldb-1.23/third_party/googletest/googletest/include/gtest/gtest-printers.h
+===================================================================
+--- leveldb-1.23.orig/third_party/googletest/googletest/include/gtest/gtest-printers.h
++++ leveldb-1.23/third_party/googletest/googletest/include/gtest/gtest-printers.h
+@@ -471,11 +471,15 @@ GTEST_API_ void PrintTo(wchar_t wc, ::st
+ 
+ GTEST_API_ void PrintTo(char32_t c, ::std::ostream* os);
+ inline void PrintTo(char16_t c, ::std::ostream* os) {
+-  PrintTo(ImplicitCast_<char32_t>(c), os);
++ // TODO(b/418738869): Incorrect for values not representing valid codepoints.
++ // Also see https://github.com/google/googletest/issues/4762.
++ PrintTo(static_cast<char32_t>(c), os);
+ }
+ #ifdef __cpp_char8_t
+ inline void PrintTo(char8_t c, ::std::ostream* os) {
+-  PrintTo(ImplicitCast_<char32_t>(c), os);
++  // TODO(b/418738869): Incorrect for values not representing valid codepoints.
++  // Also see https://github.com/google/googletest/issues/4762.
++  PrintTo(static_cast<char32_t>(c), os);
+ }
+ #endif
+ 
diff --git a/meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb b/meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb
index 1ccf115793..90e0785e54 100644
--- a/meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb
+++ b/meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=92d1b128950b11ba8495b64938fc164d"
 SRC_URI = "gitsm://github.com/google/${BPN}.git;branch=main;protocol=https \
     file://0001-CMakeLists.txt-fix-googletest-related-options.patch \
     file://0001-Fix-printing-64-bit-integer-types.patch \
+    file://0001-Use-static_cast-instead-of-ImplicitCast_-for-charact.patch \
     file://run-ptest \
 "
 

