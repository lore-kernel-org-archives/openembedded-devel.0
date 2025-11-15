Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FF6DCEB2DE
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 13:11:18 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8211.1763212272029208007
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Nov 2025 05:11:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i/55GX7D;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477563e28a3so19241335e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 05:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763212270; x=1763817070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LS0AnGTe69AtSD/qb1XGSOxxxzx0Ga94OCzCBfWczKc=;
        b=i/55GX7D9pzzNabVyAMw24IDMaI9vLDDltRzR+/LBxGjZar5nYdPeNfqKtwhOGQ6QB
         JceUomcQ1ZL9J6GzUyqdLNiLMhYBJcqwiFUjTmBs1O/wj+m1qImdegdebxGE3QFLyjBO
         WVrJnCNCFVfNTh0Y1f6tlA+DW4yJqpnpP/qKukrsNewQ4k1Gjbs8Id9lVpYW0X6kE2ws
         g/E3EG4wPHyrzp1MzeTsYoTxG+S9v0S1GmNf+wjbHnjO9+3CJys6dkc83P0SG1v4/TKX
         kFyf2okkFUq2cpwHMbmV+aHefLHXqunfGuf4iK/bblwCnRDl4d3s5MOUL4vIX9lLCA+n
         YJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763212270; x=1763817070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LS0AnGTe69AtSD/qb1XGSOxxxzx0Ga94OCzCBfWczKc=;
        b=bCejx51d5bEbAPy8Nb4rMx/tteaN5z+TWiXlONsmm5NAIik7jx9GXE4ZN84Aq0AIIp
         M906QYZvVScqTnxSqKvSAlnVT9GmTzEQmpbziHI+8PlucXTHBCBaPapWARsLhrthve+B
         026TdIQr5+vBaoc3XSybYx1jQ7SlC0HJFcmS0ZC0CEz4WqYf8KHn4svNfCyyzL8mq5+J
         ATB3Nc1Wfw7BA81NfaczzCbTIgPhSzwW4vWKV/VCJUGU9fVBW1yH4vm3Trer5r7h2h+e
         63jq7ls1G9pjIlnQduLZhduD0ThxHXepjJsbycOsqPoCOvVc4URGYhpndWtMRbtThi9o
         jdQg==
X-Gm-Message-State: AOJu0Ywg92HJy7oj6omc3RaB+z2T712mY7tBR4tDx+VDAoITOg+WiO7H
	kfwzflgoR2KylvOuMwNlEKP8Z2FKaBzoQfxYWIRKxqS1FRDauhv6MzsPJZS/52xh
X-Gm-Gg: ASbGnctIOGGzZa6porG02f81zHSh8b1mXeDMWDxcO7DSDpDU/MVzIpEHTXWSKpticcF
	hpJaFWBVqz8Sg+2QvHp/4LfIhiwJgBK+haTAMaXnM4nWOSE0WZY+QHV08CHcORFQ3utSZJSRuwB
	3F79gutcQpUL1kOIRWPdk/R7PFmPYsbCTwtnrYH2fccrkmpzQ+rhZpW6/XVLKgCIQW+G3oK2fJL
	JKB2tCymHtSdqQ3gtujvlxECm2BhypiJJSv6lswt981dZCWrq36VIMgj4VjPOuO+/7wVyX5DuSX
	GSbF9zbI3eaZsOcfpG/wUZ2NmzNBQq7PVVIQUt8L40YvYvgWlJQnr68Mlq2gDl7trSENC4b/grC
	0n4d5dIeryNc/zchNA/vxH81/J8o3PHgJ9Hbf5TNMnxq3fiICXofAXwxALzShjKVmHhef9ap7xA
	==
X-Google-Smtp-Source: AGHT+IHWmQycyGGo4rKEyQAvAGyKxdjFhmTOGKBVOHEHqFni6xjRWoxM09+whASskswZwgmOLxyyfg==
X-Received: by 2002:a05:600c:190e:b0:471:665:e688 with SMTP id 5b1f17b1804b1-4778fdc3175mr72876405e9.17.1763212270337;
        Sat, 15 Nov 2025 05:11:10 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47796a8a695sm42868995e9.13.2025.11.15.05.11.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 05:11:09 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 6/6] audiofile: Fix build with clang++
Date: Sat, 15 Nov 2025 14:10:59 +0100
Message-ID: <20251115131059.1146238-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115131059.1146238-1-skandigraun@gmail.com>
References: <20251115131059.1146238-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 13:11:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121735

From: Khem Raj <raj.khem@gmail.com>

When tests are enabled additional C++ code is compiled and clang does
not like the code.

Cc: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 78f49691d74db266fc94ac5581eb71d71c7c45e0)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../audiofile/audiofile_0.3.6.bb              |  1 +
 ...test-sign.cpp-Fix-C-narrowing-errors.patch | 41 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0001-test-sign.cpp-Fix-C-narrowing-errors.patch

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index 4c368f8875..d047bd06e2 100644
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

