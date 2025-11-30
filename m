Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9526DD116FA
	for <webhook@archiver.kernel.org>; Sun, 30 Nov 2025 19:44:26 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4135.1764531858803131290
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Nov 2025 11:44:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IsS8L2uT;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42e2b78d45bso456952f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 11:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764531857; x=1765136657; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g3eqAQno4f2F/JkZ4Wo1451ktBP80xlXkN31B7XZQhM=;
        b=IsS8L2uTw9fpDZ9AKUCAqIyFG48keZC11H/H3RC4kBUeOHyfV6PKgKJl/fdcPzSD8k
         FINRDa0pXyUcqqgBXwyZ/Xp1PirX50LLqB0zHp3/l90mdR2IUnUEWE06j4DwU+NH7ZGu
         QVDQSskuSkXB5TuWCE87m7S6A/jc0dUWE94QYu+oOGttFiqy/uh0RmOxLrue5YId8yBL
         K8bwb4ukBCwZQBcIV0xxui4WBFAbDGwJd4GzCK/+bW5H/mUk3J/YPXwR3/Sxysm4mind
         fXCjlh/gtGTrYg7IAtOYmLRcuYXiWSyW+VDxTVHgi8gH8excm0MT10Yd/wM2tSniP+cu
         5V5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764531857; x=1765136657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g3eqAQno4f2F/JkZ4Wo1451ktBP80xlXkN31B7XZQhM=;
        b=vnbcvE4DLBKzvB0FDoVlsW6P8IY4ix0ucFQiBoqTrl+s0VC6jEhLGvBgmiw64slZv7
         NskE0CwcLhtIm6HZxLcC+yn+3b8+7qzYEE322NOcAXMg8keqYlLNehrjQZKgGRflZwqw
         7NkZfRpHe6iSWBWGT2b9xiV8tEZT054dCnRfpqawefb4x+TrOV3bEbuPgSoiXtaQqXsU
         k508tj0vjC6Ni5ozciBlVWSifeqIe09T3AbEi5a5o6k+LJYjYIh7tX3JFp1EF0dxEwDs
         Mn6jaT/ir86qjrnpjF6GIwzukwwnQjdPRrqwpVxJAQ6cx24suggeFEBR3ypcmHB4H+dL
         CAdQ==
X-Gm-Message-State: AOJu0YyF7ZSc8Ou1GGm5x1EaOIcCSIk5WhjUIeSOKpbrFI3zC5q0idMJ
	kjDeRUYFYSkIZmL3X8OzV/+DpX3+CYFpgpfs3an/x0w6KXjeB3X9u2A2vShtSA==
X-Gm-Gg: ASbGncvinUGI+pAZIEZYqgE56nyXVwSHh2sZZTKwHjWSUIAzGGCa5Foglo0ZWO21NKm
	2D53BBgJneJ5OsOpgrqrGE2MEKnyZuycAddIsGD0rHJLsWkv/ZxNhvKKQKzSCPXy5RClt4C7UzB
	23Gb4JzjDNWkz8VrGZHYfmQKlm/8kGrcUvnusA9mTmbWCafznkr0L6UMlLZFsMjsSJGHp0O6liX
	jNmGn47tyFmJkWFCOka40Nbg8PfedaaFoIMER+u1bMnbeWna9D1yAAhcOcX2coOWry3UyDwDxba
	O1yvXQ7BeGTInSime8nGrBSkWG7Yy4/aDeIyYIMj4zOZ7zUp2600yENgosAqUV02riJwudYxtz5
	s4+MwiNLDeVFV5KX5a2Ua9qL2TnGi6EG94zT+mPzNVmN6MKZ/F1KXsQQE+OU2jxO6JaCWbqx9ah
	ghQ/SfgMq1
X-Google-Smtp-Source: AGHT+IEn5L+cRLff1Flk1gSXFX5GNk9qSCWDYZkJnnKaKuV4Ed9fRltcdG/N9heumK/NGKJu59RL9w==
X-Received: by 2002:a05:6000:2f83:b0:429:c711:22d8 with SMTP id ffacd0b85a97d-42cc1cee555mr36411349f8f.15.1764531856942;
        Sun, 30 Nov 2025 11:44:16 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca4078csm21399153f8f.29.2025.11.30.11.44.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 11:44:16 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/7] yasm: patch CVE-2023-29579
Date: Sun, 30 Nov 2025 20:44:09 +0100
Message-ID: <20251130194414.2335669-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251130194414.2335669-1-skandigraun@gmail.com>
References: <20251130194414.2335669-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 19:44:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122175

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-29579

The patch was taken from Debian:
https://sources.debian.org/patches/yasm/1.3.0-8/1000-x86-dir-cpu-CVE-2023-29579.patch/

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit cc30757a7fd0af5f60b9a6408b3eb94c0810acda)
---
 .../yasm/yasm/CVE-2023-29579.patch            | 39 +++++++++++++++++++
 meta-oe/recipes-devtools/yasm/yasm_git.bb     |  3 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2023-29579.patch

diff --git a/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-29579.patch b/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-29579.patch
new file mode 100644
index 0000000000..58b4ed1996
--- /dev/null
+++ b/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-29579.patch
@@ -0,0 +1,39 @@
+From 81c1b7b0a28f052eaadddcb010944bf67e6ae257 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sat, 15 Nov 2025 13:24:21 +0100
+Subject: [PATCH] Make sure CPU feature parsing use large enough string buffer.
+  Fixes CVE-2023-29579.
+
+Author: Petter Reinholdtsen <pere@debian.org>
+Bug: https://github.com/yasm/yasm/issues/214
+Bug-Debian: https://bugs.debian.org/1035951
+Forwarded:  https://github.com/yasm/yasm/issues/214
+Last-Update: 2025-04-30
+
+This patch is taken from Debian:
+https://sources.debian.org/patches/yasm/1.3.0-8/1000-x86-dir-cpu-CVE-2023-29579.patch/
+
+CVE: CVE-2023-29579
+Upstream-Status: Submitted [https://github.com/yasm/yasm/issues/214]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ modules/arch/x86/x86arch.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/modules/arch/x86/x86arch.c b/modules/arch/x86/x86arch.c
+index bac11774..58327958 100644
+--- a/modules/arch/x86/x86arch.c
++++ b/modules/arch/x86/x86arch.c
+@@ -165,8 +165,9 @@ x86_dir_cpu(yasm_object *object, yasm_valparamhead *valparams,
+                 yasm_error_set(YASM_ERROR_SYNTAX,
+                                N_("invalid argument to [%s]"), "CPU");
+             else {
+-                char strcpu[16];
+-                sprintf(strcpu, "%lu", yasm_intnum_get_uint(intcpu));
++                char strcpu[21]; /* 21 = ceil(log10(LONG_MAX)+1) */
++                assert(8*sizeof(unsigned long) <= 64);
++                snprintf(strcpu, sizeof(strcpu), "%lu", yasm_intnum_get_uint(intcpu));
+                 yasm_x86__parse_cpu(arch_x86, strcpu, strlen(strcpu));
+             }
+         } else
diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-devtools/yasm/yasm_git.bb
index d1c37cb2ae..d89f9aebe3 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -14,7 +14,8 @@ SRC_URI = "git://github.com/yasm/yasm.git;branch=master;protocol=https \
            file://CVE-2023-31975.patch \
            file://CVE-2023-37732.patch \
            file://CVE-2024-22653.patch \
-"
+           file://CVE-2023-29579.patch \
+           "
 
 S = "${WORKDIR}/git"
 

