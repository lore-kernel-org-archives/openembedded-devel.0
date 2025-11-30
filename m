Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 777E6D116F7
	for <webhook@archiver.kernel.org>; Sun, 30 Nov 2025 19:44:26 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4096.1764531860416450728
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Nov 2025 11:44:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KUsokeyX;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-429ce7e79f8so2242898f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 11:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764531859; x=1765136659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4fI8QkxPTfDIpxOWw1mqfNc5TrXDOOyiB5Sa9V8x204=;
        b=KUsokeyXwUHEm73xh4WgFscxHO18xGzQiJq8Uw9/fpOo8j6qLtMzzMLOBu7orLWNxY
         4iPKKsrcfIeEOeJ2/cnqUG0jcNBpCJoA8EZxxVPEq11LaM7ZwvWXnwRk6HXqNfRuXiDx
         lL8GgT40jKgb4KJf8lmC2Y0E+iUyxXjrqIKcFy3R7JAqQ1ddQYU5FuL598f82bckruTN
         EWuI60Nnvygo+YKVAR4Ok2WMIoeebE7Jfe0GHXWu2pURbszVIis0ZLqR6AszGVJ7Qu9x
         T7Zz+zWF/uxeXC+cYSy6rFj4mPG0alVB5MbUwXcRaaXe1a+PWRMpGZl0cK7UWOsu440R
         ElCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764531859; x=1765136659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4fI8QkxPTfDIpxOWw1mqfNc5TrXDOOyiB5Sa9V8x204=;
        b=H5JtMfq7NVj4HGOKjB2hrw4hmDhKmzGEmDpoFg1tAVWgAS5TAEkN2ep47BBSOrfIG/
         Z8AcgNs0oPecwaWxL0LLFwGIeOr1tDO6aYoGS/HwIijk4lmmkhJOvCF5X9Lij9UuCCcG
         6mSFjrzElz9drq997U7fQgd2WxAWm4ff7/wKH0kgb+h0/MQFDux5SUs2m3fagVnpPrOW
         eChhXdfIYpUQ670G339VnOuz9hJjtirYrgLn9Vv5bT/xjmKZbKXSoSCPR9USIbDx4OwM
         ZCkBxDfhxGXXhHqoQw7dOYSst03+m1+v/3dhFDB52h8Fr7OjhSMJx+OJMxsH51h25Fic
         gIpw==
X-Gm-Message-State: AOJu0YzNSmR/hi5vU1XlLq7BntrWDstPziHD4uuR+qHug3zXVseqxqgt
	9VH546ZClh6sSTBVfuNH365SHffMFeDO+GFDdgtxB40yPQjJzxwbICmCWnMicA==
X-Gm-Gg: ASbGncv98aM1wUceFUbYmsp6NU9Fjmls/kZDdvYlWZcSVSgJiJ/gzMjy0JtyT3ZpzB+
	Jm5VadYm1Qt6dlvb4O2SSMYOI9g7p5vumHIRsEDLaajD/F37JcV1D5KoLn7SAcnRmtkOMXJxYlQ
	eigwhieKlm+u5zUEDCsDKxZXc/13bXkA3Ayxfg2/QNEpwuRqpHOElQQVga9mba0yi3iwieToBG3
	oTcpwlNMpH8dXQH9/fO13UF8tThhF7I7EKzw8Mm+E7WfVvfe7YKhZdW8UhAkDeK02UkU8P9EvBC
	X3XYTPToPS5/nCbX7QNXVPvlszT7j1m0hLBhhDWmQJAf2zeYgAZqn4Hf/eZwKVtbGYguJBSMZ2J
	TBLCjKDGkknxBbdMD9h35DxENZZPjqxglYQo+qOguuqE7QMdohWGF6qsqHkQ/uA8dTNjM2jWeOi
	tqkhQHgvzd
X-Google-Smtp-Source: AGHT+IFPBz05bSCBQpCNvQKY1wL0kzyCQT1basBXCgNKEjlEUurLa5JYkj6QTzYvmFBMSxC+zs9ANw==
X-Received: by 2002:a05:6000:2482:b0:429:cd3f:f45f with SMTP id ffacd0b85a97d-42e0f1d5b2amr24164102f8f.7.1764531858684;
        Sun, 30 Nov 2025 11:44:18 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca4078csm21399153f8f.29.2025.11.30.11.44.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 11:44:18 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 4/7] yasm: patch CVE-2021-33456
Date: Sun, 30 Nov 2025 20:44:11 +0100
Message-ID: <20251130194414.2335669-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251130194414.2335669-1-skandigraun@gmail.com>
References: <20251130194414.2335669-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 19:44:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122177

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
index 08a9ccab50..32a0aad65d 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/yasm/yasm.git;branch=master;protocol=https \
            file://CVE-2024-22653.patch \
            file://CVE-2023-29579.patch \
            file://CVE-2021-33464.patch \
+           file://CVE-2021-33456.patch \
            "
 
 S = "${WORKDIR}/git"

