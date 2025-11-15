Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54634CEB2D1
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 12:38:58 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7732.1763210329353143793
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Nov 2025 04:38:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LKeeXR1P;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4775638d819so16339185e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 04:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763210328; x=1763815128; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=liUBgsDcw3lU1KhPLH84b3ReUhFSy2kpea19UjeQi5w=;
        b=LKeeXR1PDKB8W44q9IBitcaZASq+MmroxGf5NhOfCFOfSblXdb1TZ4Vt3tI6ubf1qV
         zFXPOj3Y6DB68O6LLHEgBLxgX50wmxAeWO0ipA9bON05NazdUMTSSafQj1WMn3iTpuMc
         x2vebRUFv8a70x6lP+jfv7yVPwjf+OSgWK6hlEAWi0tOVXQYkQ5pZZFhcaox7V3KjEN0
         RIJbQsIGPghqfWmSZ8RXgjkdDGmeazEmgoBSr/SrkrVKYlbDAIZR7NQAxyyDg/eKpcrz
         OFEWiEJb2R2GJB10TfvrXSt6/q0DafeXNTbCXZJL9/hm9TH4Zrtdj3EYQ+qEdR1jESGs
         YW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763210328; x=1763815128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=liUBgsDcw3lU1KhPLH84b3ReUhFSy2kpea19UjeQi5w=;
        b=MlDV6Y80MKWCZ7A26S6OTAbePhNutFNF4dWI02NUv1mxQYb5MfZAtvMEgkFyXhKjcn
         x0QVeaIuKgOEV+M4lRtVGjpavN75kA/sKhxtvmvWbyltHGym7fHh4UCg1GDYNqIsq9CY
         WwOIT8v8a2I8ca7bMc9CbZZWh7UhOUJicRKBITLURcsAw3PpzbT8Pc2KkUT+STIE3yEi
         h5Tk7jlE4axE8P8XLUpuvHc1wPU1q9sMT3i8fm4GbDAgoQdfWk4imma2+fqaq52xwFl5
         JSmB34xaevUfzNLljIs0hb7sZLt6ckMs0eJeHr/HBIF1c77JMHqaaXQGUFVfe5JDxNp3
         Q1MQ==
X-Gm-Message-State: AOJu0YzngZw/9/uxfBzDY+5OPhg2VK+tlWirbcbfmUYVBQY8jdnbA69r
	s8CHgXRujDUmllD/JUFfZ3329QCFex/UbL2l7QJ7okfHIY6xEQGseb6zfY+gdeQ5
X-Gm-Gg: ASbGncvPO7t8rhkHRYW2LSoN4UzWCS8qZ24HWIOkZXRaFmesHy3E8XKAUCXGoZwjokh
	37VcvA4occN7L0iRrs/GKU7ifbMRFXSK1IVTPYYxVP/FvRJj/dGb76MvStN8Tu3XjmrOqXcrq8B
	UH1Nc5kOdeTWPTWZ5bgu5B04hM2z40al0XZIO23JUSIUfm8eS8H+Y6ZEauxZMeXm7QP8cYypDcU
	cPFkUC8ji3z0rZryLE47/VxjNem/X+0dHauycIdDh1gRCt3XVKMSy6DYQo6N2Esxpd503XiAXFp
	SjPzORPJfaMoBDD9Fu2qJp7Ci3nYnbqVLbh4upU68RYESQWvlQq+gOkTn2fgUVgAnCrTuOkPndd
	ajMAQDY6ty5LrCN2Xh4dpiwQjlcJ0Io+bjy/BMOpx55CDBidT/9pgApVsrAFAlwPIdaCpZeL9mR
	T9PHzOBL+h
X-Google-Smtp-Source: AGHT+IHZp6dMBYB6k9NMUfokNA++PU6tG16WRn4VeBufT/k1vjqoENY6oNTc+J0f1RZ1Ysftb8+lew==
X-Received: by 2002:a05:600c:c178:b0:458:a7fa:211d with SMTP id 5b1f17b1804b1-4778feb2401mr61865665e9.29.1763210327563;
        Sat, 15 Nov 2025 04:38:47 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f17cbfsm15673572f8f.35.2025.11.15.04.38.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 04:38:46 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 4/4] yasm: patch CVE-2021-33456
Date: Sat, 15 Nov 2025 13:38:43 +0100
Message-ID: <20251115123843.708911-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115123843.708911-1-skandigraun@gmail.com>
References: <20251115123843.708911-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 12:38:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121725

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-33465

The patch was taken from Debian:
https://sources.debian.org/patches/yasm/1.3.0-8/1020-hash-null-CVE-2021-33456.patch/

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../yasm/yasm/CVE-2021-33456.patch            | 35 +++++++++++++++++++
 meta-oe/recipes-devtools/yasm/yasm_git.bb     |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33456.patch

diff --git a/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33456.patch b/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33456.patch
new file mode 100644
index 0000000000..2340d8ed75
--- /dev/null
+++ b/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33456.patch
@@ -0,0 +1,35 @@
+From 1126140b8f5ece18c58640725f0e4c08e5ec97b0 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sat, 15 Nov 2025 13:34:15 +0100
+Subject: [PATCH] A potential null pointer difference is that the return value
+ of the hash may be null. This fixes CVE-2021-33456.
+
+From: lixuebing <lixuebing@cqsoftware.com.cn>
+Date: Mon, 25 Aug 2025 13:51:28 +0800
+Subject: Fix null-pointer-dereference in hash
+Bug: https://github.com/yasm/yasm/issues/175
+Origin: https://github.com/yasm/yasm/pull/290
+
+CVE: CVE-2021-33456
+Upstream-Status: Submitted [https://github.com/yasm/yasm/pull/290]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ modules/preprocs/nasm/nasm-pp.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/modules/preprocs/nasm/nasm-pp.c b/modules/preprocs/nasm/nasm-pp.c
+index f9f92dd1..473d98c1 100644
+--- a/modules/preprocs/nasm/nasm-pp.c
++++ b/modules/preprocs/nasm/nasm-pp.c
+@@ -1102,6 +1102,10 @@ hash(char *s)
+ {
+     unsigned int h = 0;
+     unsigned int i = 0;
++    /* Check if the input string is NULL to avoid null pointer dereference */
++    if (s == NULL) {
++        return 0;
++    }
+     /*
+      * Powers of three, mod 31.
+      */
diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-devtools/yasm/yasm_git.bb
index 98ccb42050..d5fa003957 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/yasm/yasm.git;branch=master;protocol=https \
            file://0001-bitvect-fix-build-with-gcc-15.patch \
            file://CVE-2023-59579.patch \
            file://CVE-2021-33464.patch \
+           file://CVE-2021-33456.patch \
            "
 
 

