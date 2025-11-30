Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01BE7D116F8
	for <webhook@archiver.kernel.org>; Sun, 30 Nov 2025 20:35:27 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4962.1764534919794853774
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Nov 2025 12:35:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZicH7i1z;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4775ae77516so36193035e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 12:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764534918; x=1765139718; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vhfEZTCzYTaaoG2c+6bonS2XARBQUXm42fDwjyQanhU=;
        b=ZicH7i1zCmpS4ZbkKnReV0Qr332zkviXO18YnvTSKT+t7CxV4ms/AioqJpRLZYDkB/
         vniw5otMWb9rYjunJGHs5U4g4SuydTIrGQRFPBYt6dvSFfdzFz8RO0e5W4/cekIVFpUR
         3yt2FAzbqMwmo2PLt/ivcV6hcScGmhfcY8V9aHLr9j7+4MnZziDJ4A8iAgOJz98iG0Dm
         FJ+pXAadKyGFbTC9EYENxLW4xQG3YISKEyghdV91ITOm/EqsmdQo4p7US2OjJvRBcsbi
         3Ho1MCUC1afVHVAV+6NGRg46+7x/E2WMzsuxQbcp5cPSppfSDGZryBSaRMFXU85Zgi27
         KquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764534918; x=1765139718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vhfEZTCzYTaaoG2c+6bonS2XARBQUXm42fDwjyQanhU=;
        b=CyNg9U0yef5UHANNzBfOPzFuIv2sYYbtdk8/+mLt0aGJyA1OaG68SXewYgljS51iC+
         ZAZYz8sLunhjk8uD32YiywKUygfSEhfxs6FS0MjpwIq4fsRKXJYhI7sJJA7QPIrUmR6S
         5Jn9EFrUafQ+w2hTTpE6xbdFu+dpzY3edmD/22buXCAVamPjvUCyu+OBAx5WuIi1Gm3P
         mpNh0HkTJnlrUnvU3XReJhbQFws30dSPjNTdsWECjsxAq2x6YJ6ZQi5wltOec2AIXxMx
         9F94SjKatxqmhHLZWf2rWWBj1XjikGbVUJy1NBMr9UvfDMugpW8V3VvHr+5AqmdDQT8s
         JTEA==
X-Gm-Message-State: AOJu0YwK/qod+Zc1Urbgamm6v77rDv9R5YjUtzOU8eD3ZfEcF3iIJYdk
	xBdqBOMNSr7vrZSVZwedZbqI7OO0CDP6anEFVPkWTd0NuuNjXBmvkeEEkUHFQQ==
X-Gm-Gg: ASbGncvXjf6pWdBUOPydRWkNa3O4qApJ7IY97rFHwi2j4qRn3te1KoFAeMQ9zsrfGsn
	Fg2K94NYhzmQ1yJerboHgiB6jsvIUfIgIFJ2mV76X6FZqAYJ3Wjp0YHwSwDNPDyyMe26CB0LdKg
	8XeNTrV8Q23r+Czhfn9rgP6fnnS4ipsKtmSUPUHsVd2JiWrohXy/EwdGSX9jNqq58N5T2BRyTUZ
	AwvVaPtX2KSadUSTWiuWgnm94CmXHuASLvMdPCnMEYbd8oYTsTXYxcAM/8AtO8x7d2wXgqiz2G2
	b00fyyXKwRB9yAuQM+clSfAQX07+83vKO+Dz1K242+V3FQRp8miwj+rlVS2Kn45dvdmQB8JYCrY
	34zd/+WzB7dbm5tsnrKEjWSScgGCX40+Gz3ezZSU2TJoEkwZRkRsRn4S43VICxXj3jaxTKQF/Hk
	LxC/seZ/eO
X-Google-Smtp-Source: AGHT+IEM/AIf2/LF5AESJJOmgNfMXkp/JvT4bQQ2XwvJdo746n0TaB5zuQlYCr9TGN+iM4/OYKuZmA==
X-Received: by 2002:a05:600c:6296:b0:477:5cc6:7e44 with SMTP id 5b1f17b1804b1-477c10d7013mr363254905e9.11.1764534918008;
        Sun, 30 Nov 2025 12:35:18 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca8bae9sm21338810f8f.33.2025.11.30.12.35.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 12:35:16 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 4/8] yasm: patch CVE-2021-33456
Date: Sun, 30 Nov 2025 21:35:07 +0100
Message-ID: <20251130203511.462501-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251130203511.462501-1-skandigraun@gmail.com>
References: <20251130203511.462501-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 20:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122184

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-33465

The patch was taken from Debian:
https://sources.debian.org/patches/yasm/1.3.0-8/1020-hash-null-CVE-2021-33456.patch/

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1e2731fce05d15020fddf3dca5d8ee42ec3c04e1)
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
index 304fa0b34a..5d1739ebf3 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/yasm/yasm.git;branch=master;protocol=https \
            file://CVE-2024-22653.patch \
            file://CVE-2023-29579.patch \
            file://CVE-2021-33464.patch \
+           file://CVE-2021-33456.patch \
            "
 
 S = "${WORKDIR}/git"

