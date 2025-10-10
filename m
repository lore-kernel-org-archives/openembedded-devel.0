Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D8DCCD184
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 01:25:50 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.1164.1760059544807735466
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 18:25:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kKu4Hset;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3306eb96da1so1296253a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 18:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760059544; x=1760664344; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjOIprxf9kXk/zbGdh1FB76LjnLb8s2fvnNWAJWxDZU=;
        b=kKu4HsetiIS4hTdi/zjt4ao43shfxOXlIpkLJjF20ADDQ47B7+YR2MXH4VkllXkPox
         WBdRFcC6ZaAgLZI6jVj8el497kdntiSSO/0i//kVDJnCFXeLaWXfwALRN4jGLmf/BcFp
         53Y0Dm0y/gM7qBC5WGJIvN/Itqs8DcLRAUXiDKFBImQDyY3VsxS5A+mW7Pl0H7icBbc4
         o55efIxfRaYtm1XoNRfd9ONPS4/knV+AE9sZkVHe8Sc4gW8t1UzISbKUkNb+4njPGg9l
         e3GKFm5OOXx3BDJc+x9DWHy7UBWypX4FwaFhgNR7ygLAmKybH0gOzMaRQU/zxbvV0qID
         wglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760059544; x=1760664344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QjOIprxf9kXk/zbGdh1FB76LjnLb8s2fvnNWAJWxDZU=;
        b=Cio45ukm4ME80M6PFHip9BaCZRFuEhp+C4p3a1KS1K6jqrS6bNCTO36V6ZSc0PXcqP
         jknGkZuGHAgId4SjhJjCDAyKL/VrvgKEmN18jr/QG30O2oZ1S1IRfBjecM5VWmJagOE/
         FyTMzdL8niLsL5Xt7hLWcTKVU8Pf7tq3LutMYlu0I0r2LwQSvNTINSdAwiT2VrK6hPFY
         T6HyPLzrCn2sUvfraowK2sGGPBeDuOmxNZOwg2w37VHi6JD8E8J0kjzVlld0sTwLV4pk
         uoOZyNfp53eZyUNYTzWt7jxBmp70VsKfbTjlER+Jot5y6IQH/GA0p6fyJ82/OncrbUvf
         S2oA==
X-Gm-Message-State: AOJu0YzHLBUyBAJ7NbN17tFDJ/RkGgXMhKgrSCEn88npCi+AgF+7gPIu
	qws8lPttBLTLtGQzU5QgqAqM7iifERjMy42UB26OoZaUnH8Y1en9e4ul9JScgA==
X-Gm-Gg: ASbGncu+7CaxDhf4uq6JhWa2NTSXDkytI9/9DYl1HqCbX0kiP+zAOy8P5DtJBwsVumt
	+m1HBFVuPhRhbrB2/h9nGFWOJ5JG/Ry826bCGbmNio2cwbFCpDB5QeV1JYq/eIZdFABYM4iGZF/
	BQwzfoFmBPER8/pI9uPleJHtaL3bvaCp4sw6kI0a/dHmhUGnDvwUFFRWcz6k+2PpniG5UYsRnWH
	QLK/neFIXHXcp7pTvHDqKaQr+yhcais7yb3Vqnh+dU1TjU+ThRFhWKKJdpRzjBf5u6baxF4NK0F
	wExAf8AjseH22ZOPxEduLjrnW+fwY4GFYLpMtkAWdZwiMcKgLqc5l+RKPWXD8xj6W/q/I+WLI0o
	2htuw1zQQAGwJlg371NL1A9CDCp+s+qmvGpJZGu5wScbqxvEl7Ai+TH0=
X-Google-Smtp-Source: AGHT+IGRgYQnq5ZEeIZPX7/tYirGV+zHtXh2y55GRpnQI39fEPutMaNQuqtjWN9tn59XkdfMXofhqw==
X-Received: by 2002:a17:90b:4d8b:b0:329:e703:d00b with SMTP id 98e67ed59e1d1-33b51386449mr12907453a91.19.1760059544046;
        Thu, 09 Oct 2025 18:25:44 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b52953666sm3726876a91.2.2025.10.09.18.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 18:25:43 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 3/3] libraw: patch CVE-2025-43964
Date: Fri, 10 Oct 2025 14:25:13 +1300
Message-ID: <20251010012513.4143937-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251010012513.4143937-1-ankur.tyagi85@gmail.com>
References: <20251010012513.4143937-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 01:25:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120465

Details https://nvd.nist.gov/vuln/detail/CVE-2025-43964

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libraw/libraw/0003-CVE-2025-43964.patch   | 29 +++++++++++++++++++
 .../recipes-support/libraw/libraw_0.21.2.bb   |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-support/libraw/libraw/0003-CVE-2025-43964.patch

diff --git a/meta-oe/recipes-support/libraw/libraw/0003-CVE-2025-43964.patch b/meta-oe/recipes-support/libraw/libraw/0003-CVE-2025-43964.patch
new file mode 100644
index 0000000000..d7d7664da3
--- /dev/null
+++ b/meta-oe/recipes-support/libraw/libraw/0003-CVE-2025-43964.patch
@@ -0,0 +1,29 @@
+From 0ecd9906f70114a974809bb35b4ec9fe7fed9011 Mon Sep 17 00:00:00 2001
+From: Alex Tutubalin <lexa@lexa.ru>
+Date: Sun, 2 Mar 2025 11:35:43 +0300
+Subject: [PATCH] CVE-2025-43964
+
+additional checks in PhaseOne correction tag 0x412 processing
+
+CVE: CVE-2025-43964
+Upstream-Status: Backport [https://github.com/LibRaw/LibRaw/commit/a50dc3f1127d2e37a9b39f57ad9bb2ebb60f18c0]
+
+(cherry picked from commit a50dc3f1127d2e37a9b39f57ad9bb2ebb60f18c0)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/decoders/load_mfbacks.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/decoders/load_mfbacks.cpp b/src/decoders/load_mfbacks.cpp
+index f89aecce..95015d27 100644
+--- a/src/decoders/load_mfbacks.cpp
++++ b/src/decoders/load_mfbacks.cpp
+@@ -495,6 +495,8 @@ int LibRaw::phase_one_correct()
+ 	  unsigned w0 = head[1] * head[3], w1 = head[2] * head[4];
+ 	  if (w0 > 10240000 || w1 > 10240000)
+ 		  throw LIBRAW_EXCEPTION_ALLOC;
++	  if (w0 < 1 || w1 < 1)
++		  throw LIBRAW_EXCEPTION_IO_CORRUPT;
+       yval[0] = (float *)calloc(head[1] * head[3] + head[2] * head[4], 6);
+       yval[1] = (float *)(yval[0] + head[1] * head[3]);
+       xval[0] = (ushort *)(yval[1] + head[2] * head[4]);
diff --git a/meta-oe/recipes-support/libraw/libraw_0.21.2.bb b/meta-oe/recipes-support/libraw/libraw_0.21.2.bb
index 36b783b310..eb60f7a29a 100644
--- a/meta-oe/recipes-support/libraw/libraw_0.21.2.bb
+++ b/meta-oe/recipes-support/libraw/libraw_0.21.2.bb
@@ -6,6 +6,7 @@ SRC_URI = " \
     git://github.com/LibRaw/LibRaw.git;branch=0.21-stable;protocol=https \
     file://0001-CVE-2025-43961-CVE-2025-43962.patch \
     file://0002-CVE-2025-43963.patch \
+    file://0003-CVE-2025-43964.patch \
 "
 SRCREV = "1ef70158d7fde1ced6aaddb0b9443c32a7121d3d"
 S = "${WORKDIR}/git"

