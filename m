Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E187DCDE029
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 08:24:57 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13341.1763108695526668797
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Nov 2025 00:24:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V8mBopoG;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so12504145e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 00:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763108694; x=1763713494; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FOSvOzj8ihocHNsuxiuD6YDvQYvQJVyLwUV0QwwOyo=;
        b=V8mBopoGNePdIKTK85J+lIZ307V/ueyQoD/QbapDBjVKf8rgngttAfJKb+YYPj2oqa
         LqF4gHNg71ios40hBTU2vIEi8vcCNuHpJWzQLjC+EFaUEMCa3xS53wZjsFSd6lDo3wqW
         4qB0W50iDhIn8Y5ykWx2xXFhdR+guTyxx2gfnOJuqB9XbA1eWYIubObrEehAsgEHthBd
         IKDWwlVSzuea9msm0NCkiyEzdUDe1q5Ju/1NzL8EcVkNScs9irrIrdbKFVneFncDzzmm
         sdfqVd1n43hvESSGzBfoTN4x02WmLZ9SPUJHtp2xR25PFqRalJ/0yKe8weoeuJC3zZcl
         +Vwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763108694; x=1763713494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3FOSvOzj8ihocHNsuxiuD6YDvQYvQJVyLwUV0QwwOyo=;
        b=SRo3q7n721xoct8xttkIclS0YnJ7xVs/jLUTmspt9Eth5s8uKi9rSzsafOd76HnGLE
         N4yZpKMR2tSzXVjS60aHCiE4/gdaFEIsg2E9ib1OyNext5a2T2cSgmFPo+itHJJsfYPE
         Pp/w138bi/Z+PXIy8iqtl+yqWw747bL1Di4AbwrB3tjzckFhxzy4Bii3OpdclWzdnw1F
         BCL7tnanX7QtGhIwhpP9bDQZnuc7OKzKpYH2j//cGZqWRA8NmsjZ1TY0khMi6VAqMogV
         YWrW1Ip029jCk7T+6eMfddI7AE2iLMaR2acCiFAaYbyHd66m1okzaDkfJxB+/+uBuf9S
         XKwA==
X-Gm-Message-State: AOJu0YxMgPa0edOShpuBMaJl/gCjItB4ZZtRmxaTiusYzeXuiNPJrrEt
	2uWoIuhPRVz9/qFqfIJP8BxlQbWAUpI5eNMGqb1WlnCpX0CiEmpcM/j+LvOVaeQH
X-Gm-Gg: ASbGncv58tyCo/RiQDHEdt14RvIQCjveu0jUlsxMF7SnW9c3I9UWdqO+PcFPG0du1Zt
	XtzlKt6YnQkMTel+uxCVg29RP3X+5SRzaInT/+l+rOXzVZiFE/rnNUBrVZxVFozGF3s5KW+aKJQ
	T8KP/B5HqH1ZToeW6srWrTHUh5eCUyXeIDu5kAoBZwUYwR2ATaZiAluA63OMlda79VWflUoJRq7
	e1wns0pYeiQOS3YFm8w3np4yGDrkdXkka49I7++FRe1WX5CJQ8TZEtp5Pj0RVjdWEFM7jNf0HM2
	0LY62WIqJOcbDZ4l5oJOdoBL1ufrM2DpIu6R7fsb7BTeVcSF+adRyffGKA9LTm/7rimdRfPsxlN
	MsXKXxDVoNR0IRHNi7R+OBSA6U0rate1BMm4JB02BvHly9scCSNeqNnlmZ/y7sAhXZ9MCsEI3Bi
	xsI4PgyL+u
X-Google-Smtp-Source: AGHT+IHagomjG353SNsfXqnNwF4fRzRQM0yp73iwU74e/cY7zSe7vzHyAB77k/qH2DoZRSlNoFu1Yw==
X-Received: by 2002:a05:600c:c4a3:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-4778fe603ccmr19505525e9.7.1763108693668;
        Fri, 14 Nov 2025 00:24:53 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778f247821sm53838325e9.5.2025.11.14.00.24.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 00:24:53 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v3 5/5] audiofile: Fix build with clang++
Date: Fri, 14 Nov 2025 09:24:50 +0100
Message-ID: <20251114082450.2720967-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114082450.2720967-1-skandigraun@gmail.com>
References: <20251114082450.2720967-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 08:24:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121698

From: Khem Raj <raj.khem@gmail.com>

When tests are enabled additional C++ code is compiled and clang does
not like the code.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Gyorgy Sarvari <skandigraun@gmail.com>
---

v3: included in this series, no change compared to the original submission

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

