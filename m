Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADFC9C369DC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 21:59:25 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.4062.1745947305363479635
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Apr 2025 10:21:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K36iJ2TA;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: nguyenthaithuanalg@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2279915e06eso72546175ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 10:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745947304; x=1746552104; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wnejKDO2OmN1r8jz6i4hb9EvVKN47bKBk9fXsKErvyk=;
        b=K36iJ2TAV02mtOF3cLqeHla6V5tsSJrKNvXRvSCkjA83s1lmjyeU92tZIrbg58lzLY
         /5J36KFJw1otv2vEwhcN2yQdxvD2od22pq7oWeqH2TW6BjKageG2Vilw2xHMGAS7ZYH0
         rEshx0/IaDz4gh3nczzLEJ1smgr9FPgnFq9GBHrAyV8+8pis0RxhajBylG1KjuqnZ8CS
         LZ5KkaeAmCMtOlHs732s0+1LkZEq4IMSBJD3PN+1JMchcQcTKNGyzhxQZdsINa5TRBSo
         OlBMF/Q6C0Vt2Z0xNIaM6BYPmmb36prtclrbvquaDdEHvl+vwxVYoGeXO5DV6VJx/dOJ
         cARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745947304; x=1746552104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wnejKDO2OmN1r8jz6i4hb9EvVKN47bKBk9fXsKErvyk=;
        b=dBGqb4B9TNzJXqrmwAp+h6np60dB5gLdKhnQee+VBDLI45tDYNml2EJdPX2vAJcIdz
         3PnE4PEcIcKCXWf3Rs7qTHPEbGH12AxCh/Vo7g4UBSnx4P8qCAIoy9o5atEW6N7VuES1
         3aOvT7y3GwFr/1vxAvJZwHdy9dXFshsAgLSdIptPMnorG0tVc1VIoHOxkwJnf/3GkpSc
         LpD9zssl4Z8tP3kbfs2QNOC8xFvAGky13T0BfQ4bDJIP4uxXT9rKkVFWDwJqCerS/5Ui
         2c7lhlX4NehFB+TBp1HRpyqjeFDKuKLfMc3zRiQad1mD7u8J1Z9xnYM5ctCgknFNfiWd
         gd9w==
X-Gm-Message-State: AOJu0YzszBIC+CX1kwXNu9HGWpZJXU7Gv29B4xqqGPdV90BKOUIK1+G7
	ArLoL0DE5wC9vWtMtNuequQbPXAULDb5icGJGwZbwALOjJ8wqKhSRDSf4Q==
X-Gm-Gg: ASbGncv2kVR6P7iYayVTPbfBcAEWsY8wZD6BBGKXcvfOzCwPCzaYZoHHnE8eiT/3Ejv
	hBh9Z6B/98jcQjIFKqR2cc4V3EVdIAT8oyPybkcQ3TGdSDTsP/it+69Y88XhLI1tOcWBfJk1Ll2
	VQXZzfQxdym6hIeNRQVHr+b09ve5IIeYWpYcub/9xWzYgWbH/ouTv8/uswY080IYDXPMA2llt15
	q1GRP/ZyeIPn77vhSXgebIKlPZYeNyRIjqYgscqDSGl76m7mLOS2qE6AlP1JhkJhmkbR+SaFYdR
	HIgI2j2HMgF42PPyCUqhSDjw8x/hL5fZ8hjXcjGJ/D6g0GAqLHvMbrfMXTMhsH7Wfr3oezBisc1
	wq5K1
X-Google-Smtp-Source: AGHT+IGMPJr5pX1fisQeza/gixuTJc3eYPYufOcDUaYdX8vT3Rv3O7cw0/drd3FTunEq5rMvHv5l/w==
X-Received: by 2002:a17:902:ec85:b0:22d:b305:e076 with SMTP id d9443c01a7336-22df35351e5mr2576155ad.3.1745947304145;
        Tue, 29 Apr 2025 10:21:44 -0700 (PDT)
Received: from localhost.localdomain ([2405:4802:90fa:f3a0:76d4:35ff:fe85:dd7a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7a8dsm105660085ad.136.2025.04.29.10.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 10:21:43 -0700 (PDT)
From: =?UTF-8?B?VGh14bqtbiBOZ3V54buFbi1UaMOhaQ==?= <nguyenthaithuanalg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
Subject: [meta-oe][PATCH] libsimplelog: Add a versatile C/C++ logger.
Date: Wed, 30 Apr 2025 00:21:22 +0700
Message-ID: <20250429172122.50669-1-nguyenthaithuanalg@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 21:59:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117244

- Simple, stable, powerful.
- Apply for embedded devices to PC, server.

Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
---
 .../libsimplelog/libsimplelog_1.0.6.bb        | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.6.bb

diff --git a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.6.bb b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.6.bb
new file mode 100644
index 000000000..dedc07668
--- /dev/null
+++ b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.6.bb
@@ -0,0 +1,20 @@
+
+SUMMARY = "simplelog-topc - Simple, STABLE, powerful of logging library in ANSI C/C++. Ready for billion records."
+DESCRIPTION = "Async and Fast C/C++ multi-thread logger with topics. No external dependencies."
+HOMEPAGE = "https://github.com/thuanalg/simplelog-topic"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22cdd382a6275cb4c2e75c517952ac7c"
+
+SRC_URI = "git://github.com/thuanalg/simplelog-topic.git;branch=main;protocol=https;tag=v${PV}"
+
+PV = "1.0.6+git"
+SRCREV = "7676b9cf871bedd8648d2cf68ebf43dc2c79b94d"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
+EXTRA_OECMAKE += "-DUNIX_LINUX=1"
+
+
-- 
2.47.1


