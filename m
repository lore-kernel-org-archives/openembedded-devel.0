Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D1A1CDB469
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 01:35:35 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8676.1763084132781426243
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 17:35:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IHGcCz2B;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b9f1d0126e6so938540a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 17:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763084132; x=1763688932; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3i26RYB3GQTFUoagmxUKtilI9OEwZ+S2hcULQpr6IAA=;
        b=IHGcCz2BuBtw1J/qw2eXP0mAMeb9wrQyPy/DAZL3sB5q3F70HFK9TpeMdqvpTsdqZ6
         1P314pAbQ9aE2vWD8KNj3kJ+GhxQonOumUTntgfBinEhO1m0RPEyGeDTRUy11zyq/3o1
         1zk30EOnFwKDxVYg1FMGgxMYS2zGLm9SEa268+h1EmadkSBzxbQrTR5Lwn/frp5aA07e
         ztt02sJ/325v2lrSXu6R0AcZdZ6nj53Dgt5iYU3bd64ms2U8hYzYaw58jlukRro8U97j
         bjWI4lGbcp0yk7K/qHvJ9Uxn1p+0FVNmTs4AfmX/EmVKFyGn40+CoGxSRjtX+JdxoZDA
         EjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763084132; x=1763688932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3i26RYB3GQTFUoagmxUKtilI9OEwZ+S2hcULQpr6IAA=;
        b=tV9S20kqMvx9vQOxnru6hhCkup4zRsmyln0uNZwo+W8pW7GZki+00aacrb51GI6TM2
         0G70mw5AkmOcKBxkOyN+Wzni/sN34I7rMX7lnx7As7l0uUgh6QEuWjyCaR6az5a8q3b3
         vcIUMnqs6T+fxdmMD63jtFopOy0amH4CL67SI+2zG5bqtdZixR1LR6nCEHhZxympOsvM
         kex9upZJX4DhmvOO2cjAeqLF57xQrkp1sSvWf04akH/zqMsuV3LNr6d8JKFHh+QcZz43
         TlXPYu9Ereyj5qWNnqNVw7WcANxOB+GLU8Oqbgz7x8hs+Zg2ipqI1dkbyEBuTXIjRXhL
         feNw==
X-Gm-Message-State: AOJu0YxkSqUbx6Wv0iqkGF9l7rRDqTK6jU/Z5tYnMJFCb/fo5aI3L47+
	IitQPRvuUmV6q7GF9M1LN9nHoKsG3y3ahlPZR8nlyWyuO06nKyr7EYciWNR5gCHivOU=
X-Gm-Gg: ASbGncsmhroRQsJsp3uKrYOmCHS7e5oTy2p8eU3EsFiToe9hLUk2xBphFYk+1TUMyHV
	HFOWyaOUIZvf87Wqf+SldX2C4KT+wiyaszrFIWF47upii5mKMpVxRRyx/caxVWcy8diip51Gu5F
	lCel/fFiZ1bWdbIfxnG5NNRtawL/SHoi9gFeu04o2zTK325WKAWdpTEzLPQbnwCbKZGcxzJ0bCB
	wuBFbYKvLc21Ylq32e8gyzyXJG198sXXTu4S+Yek7Jn1UztmBNVAABO0v/7+KWGrUGj2csOZwNs
	YWxr9v4lG81lXhp3p27F6vKNU+HJSVkxbvk1wQsa/Na44i4l+eUBBATh9wK42hqIEGocYqKWkwz
	loqxePMEoAC91zbxJx1nddaqw9mp0jDUXzz7hdWG7vpf+BOaEwxpm6frUyjZLjraUfFpVl/AglP
	wpuy4B73+qXSJHCg/N5rHCTGpFmt8CCQpMpOdM3F7RD3VYbh6ny3S+n/xAqgEsallVz3RGNT/Vs
	FALjrwIhhaT9WQ0OqQ/Ctk7SZszLhZ+
X-Google-Smtp-Source: AGHT+IHdsIYDnRSdvsYgBvnJG1ZshYqUaOrOVf/LPr+BvdRSb9sWXy96C7TMUzmbJD4V8xhI+JBwog==
X-Received: by 2002:a05:7022:7e8e:b0:119:e569:f84b with SMTP id a92af1059eb24-11b032a21b7mr454934c88.2.1763084131702;
        Thu, 13 Nov 2025 17:35:31 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885cdsm3926484c88.6.2025.11.13.17.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 17:35:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [meta-oe][PATCH] audiofile: Fix build with clang++
Date: Thu, 13 Nov 2025 17:35:28 -0800
Message-ID: <20251114013528.108047-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 01:35:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121661

When tests are enabled additional C++ code is compiled and clang does
not like the code.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../audiofile/audiofile_0.3.6.bb              |  1 +
 ...test-sign.cpp-Fix-C-narrowing-errors.patch | 41 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0001-test-sign.cpp-Fix-C-narrowing-errors.patch

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index cc7fef2a26..6ebb54e261 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
@@ -19,6 +19,7 @@ SRC_URI = " \
     file://0006-Check-for-multiplication-overflow-in-sfconvert.patch \
     file://0007-Actually-fail-when-error-occurs-in-parseFormat.patch \
     file://0008-Check-for-multiplication-overflow-in-MSADPCM-decodeS.patch \
+    file://0001-test-sign.cpp-Fix-C-narrowing-errors.patch \
     file://test-for-CVE-2015-7747.patch \
     file://CVE-2019-13147.patch \
     file://CVE-2022-24599.patch \
diff --git a/meta-oe/recipes-multimedia/audiofile/files/0001-test-sign.cpp-Fix-C-narrowing-errors.patch b/meta-oe/recipes-multimedia/audiofile/files/0001-test-sign.cpp-Fix-C-narrowing-errors.patch
new file mode 100644
index 0000000000..83c573a873
--- /dev/null
+++ b/meta-oe/recipes-multimedia/audiofile/files/0001-test-sign.cpp-Fix-C-narrowing-errors.patch
@@ -0,0 +1,41 @@
+From bed0eb57c3294bac1c743cbe4404168c1007287d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Nov 2025 17:00:59 -0800
+Subject: [PATCH] test/sign.cpp: Fix C++ narrowing errors
+
+The error is because -kMinInt32 is both overflowing and a narrowing conversion in a brace initializer.
+Fix it by doing the negation in a wider type and explicitly casting to uint32_t in the initializer.
+
+Fixes
+
+../../sources/audiofile-0.3.6/test/Sign.cpp:160:39: error: non-constant-expression cannot be narrowed from type 'int32_t' (aka 'int') to 'uint32_t' (aka 'unsigned int') in initializer list [-Wc++11-narrowing]
+  160 |         const uint32_t expectedData[] = { 0, -kMinInt32, kMaxUInt32 };
+      |                                              ^~~~~~~~~~
+../../sources/audiofile-0.3.6/test/Sign.cpp:160:39: note: insert an explicit cast to silence this issue
+  160 |         const uint32_t expectedData[] = { 0, -kMinInt32, kMaxUInt32 };
+      |                                              ^~~~~~~~~~
+      |                                              static_cast<uint32_t>( )
+../../sources/audiofile-0.3.6/test/Sign.cpp:160:39: warning: overflow in expression; result is -2'147'483'648 with type 'int32_t' (aka 'int') [-Winteger-overflow]
+  160 |         const uint32_t expectedData[] = { 0, -kMinInt32, kMaxUInt32 };
+      |                                              ^~~~~~~~~~
+1 warning and 1 error generated.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ test/Sign.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/Sign.cpp b/test/Sign.cpp
+index c339514..0d80fe6 100644
+--- a/test/Sign.cpp
++++ b/test/Sign.cpp
+@@ -157,7 +157,7 @@ TEST_F(SignConversionTest, Int32)
+ 	AFframecount framesRead = afReadFrames(file, AF_DEFAULT_TRACK, readData, frameCount);
+ 	ASSERT_EQ(framesRead, frameCount);
+ 	afCloseFile(file);
+-	const uint32_t expectedData[] = { 0, -kMinInt32, kMaxUInt32 };
++	const uint32_t expectedData[] = { 0, static_cast<uint32_t>(-static_cast<int64_t>(kMinInt32)), kMaxUInt32 };
+ 	for (int i=0; i<frameCount; i++)
+ 		EXPECT_EQ(readData[i], expectedData[i]);
+ }

