Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 957DCCEB2D2
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 12:38:48 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7748.1763210327721542328
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Nov 2025 04:38:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SjaL/7b+;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b32900c8bso1635218f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 04:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763210326; x=1763815126; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zaCpTGz51selMPKnHkpydxCqauzE+8nmllAAXwLIvvQ=;
        b=SjaL/7b+MEJGRO8pCUrHotto1ms6JRDF/Dp2KWeoFKn+B6fBUhbVboFXBQk0TsgZ8o
         I+e3pPLz/aMnh83fMqOcY8eQV0uR0mb25HrpTtFni1EJFE8L6fIG5LLirZZat9nGt6V+
         xK3XwkLX/TjIhb4Z/AI8lZKZQbfzV/Gt4neFX8vh04PcjOrNvnGJyu65nRLVWn0nm/PC
         XDt5P3PRivne78iTw75KTWBVUxoLo8RnNnUdp1fyE2ImTEmo0dEsBvq8Ts6c0qkzlOUX
         /qpzSMF5I6DWx1DdEsGnGmOyYSeCi7Jw7W+FtN/i5xw/FM3f4CUg91I3G5tPcwbz2bgW
         6fNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763210326; x=1763815126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zaCpTGz51selMPKnHkpydxCqauzE+8nmllAAXwLIvvQ=;
        b=BiT2jE+AzBYT1zvLC7tX9j4xcQtx1gcqNvPWc2ebKHS5E6gJZ/WxFPQuhxdIZK1Fdn
         B3ygoTYPSRtsa3KJiNy19lBjjRtaaKLkIQparp6/syMx6O/MyGAd+w1beKYHfM2ILEke
         BqA8iABIFF6Xd1qZDwG8m+ykSuqP+Mp/F+IkrKbcbn7/lAQTMYHg0s6cRbhLew8sXsHj
         n74vqXbAjrXe+mKc83FQSgtr80XHD8ZchuHBMW5fpHi+FyJtrhUtMdz4vR+I0htKnhzB
         2MKItDw4kcUogQW6/Ts+YcotkUDWJWN6vj7qR0+yLgfBNsYYmj1HDxCLV5QvL21X02Ix
         lXIA==
X-Gm-Message-State: AOJu0YzLL93yyZ4I4owROhLGV45t+XkBuCdDLs0t8lgMr2y3BI3DoC4Y
	OwpDEJZBvVTYIUNY5KfmVcMXhDmU3xFXW7//Y0sr7MbILTz8rq9VOBJEPNbz21sD
X-Gm-Gg: ASbGnctzL59aIxyrKfuQBmL0+lSHaEyUtJ3kvc1joUaaFIvjJEBXdmGzFg7Wlh9fMS0
	696Safwv87ZyrjvRlmQTF81/V9zJkf/2lAiSo40oiFwNn4wWYq/dzeWEKm4iH7cCUkrGNAsw5Yg
	hSt7WM+34x8N4oEHRY7wW9/XpGwlYTkiIZfGUuJOtUI8wxf6vmArq13zoOeHRS/M3X/ABtgWMt8
	+SLt2/chDhn2+e/Uijfyc4LBkWkLOV3Ua81pcAVGz4WZsfA2wXvRclRHcxuQxdEFZ5NCGbCd5te
	Dy9k/poS0xHNWVj/oqzgpPszBe4qEjaJwyyDcX2FpV4j4o6Dgy1hIlgiAY44Idpo89JhhU5ffK8
	OHF8mIZo/St29U4in+zwLVWx27I+Q92VP1ndoqpbuYu+hemso6ytn9Gxg3dawelxbd2cFnH0w5k
	fcewgJFnf7
X-Google-Smtp-Source: AGHT+IElm9mt3hCsyJnz9EU6LwbHuQ6iwD9Xd79piRaRSIiiXsi8qSXYiHIVLcQ4xRYOPHSwA4yIeQ==
X-Received: by 2002:a05:6000:144c:b0:42b:39ee:2889 with SMTP id ffacd0b85a97d-42b59374c26mr6160808f8f.48.1763210325933;
        Sat, 15 Nov 2025 04:38:45 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f17cbfsm15673572f8f.35.2025.11.15.04.38.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 04:38:45 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/4] yasm: patch CVE-2021-33464
Date: Sat, 15 Nov 2025 13:38:42 +0100
Message-ID: <20251115123843.708911-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115123843.708911-1-skandigraun@gmail.com>
References: <20251115123843.708911-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 12:38:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121724

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-33464

The patch was taken from Debian:
https://sources.debian.org/patches/yasm/1.3.0-8/1010-nasm-pp-no-env-CVE-2021-33464.patch/

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../yasm/yasm/CVE-2021-33464.patch            | 34 +++++++++++++++++++
 meta-oe/recipes-devtools/yasm/yasm_git.bb     |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33464.patch

diff --git a/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33464.patch b/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33464.patch
new file mode 100644
index 0000000000..ebae250ff9
--- /dev/null
+++ b/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33464.patch
@@ -0,0 +1,34 @@
+From 3c3f968d48d768c1e355199d4067d99cb72abc26 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sat, 15 Nov 2025 13:30:12 +0100
+Subject: [PATCH] Handle file descriptors with nonexisting env names better. 
+ Avoid writing past allocated memory.
+
+This fixes CVE-2021-33464.
+Author: Petter Reinholdtsen <pere@debian.org>
+Bug: https://github.com/yasm/yasm/issues/164
+Bug-Debian: https://bugs.debian.org/1016353
+Forwarded: https://github.com/yasm/yasm/issues/164
+Last-Update: 2025-04-30
+
+CVE: CVE-2021-33464
+Upstream-Status: Submitted [https://github.com/yasm/yasm/issues/164]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ modules/preprocs/nasm/nasm-pp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/modules/preprocs/nasm/nasm-pp.c b/modules/preprocs/nasm/nasm-pp.c
+index 512f02c3..f9f92dd1 100644
+--- a/modules/preprocs/nasm/nasm-pp.c
++++ b/modules/preprocs/nasm/nasm-pp.c
+@@ -1815,7 +1815,7 @@ inc_fopen(char *file, char **newname)
+             error(ERR_WARNING, "environment variable `%s' does not exist",
+                   p1+1);
+             *p2 = '%';
+-            p1 = p2+1;
++            pb = p1 = p2+1;
+             continue;
+         }
+         /* need to expand */
diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-devtools/yasm/yasm_git.bb
index f4f84a21f7..98ccb42050 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/yasm/yasm.git;branch=master;protocol=https \
            file://0002-yasm-Use-BUILD_DATE-for-reproducibility.patch \
            file://0001-bitvect-fix-build-with-gcc-15.patch \
            file://CVE-2023-59579.patch \
+           file://CVE-2021-33464.patch \
            "
 
 

