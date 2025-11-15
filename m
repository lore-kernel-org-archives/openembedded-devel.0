Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 860D3CEB2CF
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 12:38:48 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7731.1763210326940071294
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Nov 2025 04:38:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bRMKLp6X;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b31507ed8so2235837f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 04:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763210325; x=1763815125; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EHxf2eMnfq/+DZiBDLAE3c5ORs4eShe1/ihqwYj/zqk=;
        b=bRMKLp6XSi8Ktq8V+J9+NBKpv3GYO9Wm1thedcBZA7qX6NXzFbHBnOF1/8yqdu8qAp
         +Y7n7CThT7Df4lqigCXBvKYOYYy+rvFwZjOuA+qmCs4n2gx90Mx6MBUnPnhioxmmyQH+
         se6DXZCXsaE516c47ReaiJxZAJN8zN68iHfGGD/hWCAtuByH1Z8XRsGnA3C/NeYxEEn/
         1p2MOIPDaV1HDv42LTojTiXbfB6HnW19nQ0yXQ5+8XLiUvYbAJRzr9CGZJ3gpDpRxAfC
         kMglstAM/8w+F5FRpTID5o3ypS1NYuBHWOT1baWoS4bWqScR8UrqDOwsg8N4ruE5X9FY
         2Giw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763210325; x=1763815125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EHxf2eMnfq/+DZiBDLAE3c5ORs4eShe1/ihqwYj/zqk=;
        b=VbDuCe45kVnuAyUpEC0IY2lonxHSr1W69qA+z5UPf5cbp3RokWt9cxhnfFy0feL5F3
         DBhKehFdMJlz+Ol38rkrfNPwHI7x3CK+PWHjzHEsVubOMobPmXADY97gM4CfdzMEw4Bf
         /lAFIDVa7PEv73MDeainOEjnUEGzhwUCXGDL1IVsAqmgC/hMu7wGnqvcOF/lG/u3hu0A
         YTvV4AnAeNRAUYZT7v4dYpWqi57OpOY7lmo6yjUVmgcULQ05yYkw02PLCA5PjThfpq6Q
         1I7iMtOduZOp7x8pTR/Q9ZOJ4iGO74tnnTRa/QQJ49VqFIA4TFamVFMBT1grQi66+5Yg
         eBfw==
X-Gm-Message-State: AOJu0YxhqSb1dpdmGbZU1ZRZTM6lE80QlfMLI6D59WiSylGPNi3VmEo6
	24kfs1B/AzPenInMR6Hgmv8vhGkkgb4vcXwD1yqNYyVRbsLPhz47rf5f2Xw7Scj1
X-Gm-Gg: ASbGnct9hAw9fz553tfY+44J82MB1Y1rFVDM3yk1qRL6uHDaGRrSf4WYOHj9wh/EsqL
	kZLpbazAfP+FHR2l2KvZoC09fctcSMQltxUVcmeP8lu5czN8q6QwThoOZPIw+m30aOhLeZlkYDR
	+ChQlBaEi4xsC4QGTkSBZX/iuw3PDhWHBGpLMpdLcgqNJfQS5F6DsGPRx5t0sAu7ZhXeywwmEXA
	YqRVUjinFP9+20RHFhq++AxYnUcjUgT53LOccbMuEUWWJDhrKJjNHXAoYa3Esw1TffLdtt1RHfi
	wbtmJ7XIVG/ht2DiPbMeJHSnPv4vgDI0SNpAjy5+5mNQ+sd+9hRZbnFv3QxY3fYJekMviePTejV
	jij2uQ41uy/qIkUunVSlTSPNEoGwyfDuoPuCaSz8jUjvS5EQCLTJHnYTNdMqui3C6SR5UxTepZA
	==
X-Google-Smtp-Source: AGHT+IEDuVvzrme3mVaWR3ygzayxfkwmIH7lc3XzsAeJ2bGOi5fkS7U5ewar8n7CcJO/+fPQUt8YBw==
X-Received: by 2002:a05:6000:25c8:b0:429:cda2:9ffd with SMTP id ffacd0b85a97d-42b59342d0dmr5445590f8f.9.1763210325171;
        Sat, 15 Nov 2025 04:38:45 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f17cbfsm15673572f8f.35.2025.11.15.04.38.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 04:38:44 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/4] yasm: patch CVE-2023-59579
Date: Sat, 15 Nov 2025 13:38:41 +0100
Message-ID: <20251115123843.708911-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115123843.708911-1-skandigraun@gmail.com>
References: <20251115123843.708911-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 12:38:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121723

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-29579

The patch was taken from Debian:
https://sources.debian.org/patches/yasm/1.3.0-8/1000-x86-dir-cpu-CVE-2023-29579.patch/

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../yasm/yasm/CVE-2023-59579.patch            | 39 +++++++++++++++++++
 meta-oe/recipes-devtools/yasm/yasm_git.bb     |  3 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2023-59579.patch

diff --git a/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-59579.patch b/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-59579.patch
new file mode 100644
index 0000000000..564b27f5e5
--- /dev/null
+++ b/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-59579.patch
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
+CVE: CVE-2023-59579
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
index abaeef4db3..f4f84a21f7 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -14,7 +14,8 @@ SRC_URI = "git://github.com/yasm/yasm.git;branch=master;protocol=https \
            file://0001-yasm-Set-build-date-to-SOURCE_DATE_EPOCH.patch \
            file://0002-yasm-Use-BUILD_DATE-for-reproducibility.patch \
            file://0001-bitvect-fix-build-with-gcc-15.patch \
-"
+           file://CVE-2023-59579.patch \
+           "
 
 
 inherit autotools gettext python3native

