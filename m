Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE6FDC624D0
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:05:56 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9051.1788343552431088292
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:05:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cO4GlwQr;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso1074313a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 03:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788343552; x=1788948352; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4o99LDLQvCP6InGqJmy0+x4rInCYHJPoPzbB/aJo+WI=;
        b=cO4GlwQrFptaZVm/FbtZackcAosP7E49XYa6iCzhShaCg7KpLlCvjc6b7yixuW9uDy
         0CF7V3DhSk/U9dALMVlOdwycFJBjTrmhZhIx2pkmlPJw/+TfD74RoNKbk9LxsiAjSdrD
         z3pXMfwkY+cNk/9MFY1UvzckRmHfwwc0xA8tuPp/o80TzAhoKtYUOF4ey96L4rnll1Wk
         OMi6DS82ilqxQqdlKEZ++EZ7D37U6bUBGgyQRHcin6S0Lg2nhTa95Jtt4eqNnKze4Gkk
         NqqYf3mhYRAml8fXohHSmroQHXnauTblcW4MUAWF0lC+uIeiEKy7V0QEVsr0FwEJH5nY
         IqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343552; x=1788948352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4o99LDLQvCP6InGqJmy0+x4rInCYHJPoPzbB/aJo+WI=;
        b=GZZeKGMZGrrmTcMcKoGsESvedtwSEwhCISxTcni8XdM+FrlHDEUyTFZMUPpbAvdgfD
         JD89wm1iQ0pkodPXpHCytb9XnZsyubKsz+0pNRgruM0LdEnqKTnqiajDMPPwdEeZUsy/
         X6zbg+c4v9k6oXU5lrtgbA/5TTtI91/NknjoILz4PoSIMT/V1KyaV4tcSWMoILpHAeIf
         qVnXIgV3c9IAYkrfbf4QakWi4/v5NJPWnrQRyIEak4YFEI1Os3MXsw0cw1cPhYpp6tJj
         84t9p9USkqXUyqg15DySdXtjVL0p32y75fvRAOmYNb99/MY+cUbNjNZ2YHy/9iop9l9B
         oY3w==
X-Gm-Message-State: AFuF++nI2id0pmYSVgFkf1jyrk4mB1XezgBLPZftM7AekNnb9aUF6cyK
	c5XX/i8aIJCEwbPpJVhSg14lNcjCcJtMnMCb0/YsYEbujRPaLRR6Sb2j56pdeA==
X-Gm-Gg: AYBFou2V6fykPuEcKUNnfr4mefQPUTNDzrtOMqkNi0yWhmqUmgsVnnYlxOvpfJejT40
	ZhlMad7iTc3xxEJCYA6EWkca+yClSB8ThccKwRU7lBZJYkV4sfIH+xFviek4ApVaAztJzv+VWad
	wMoRd6WNlp3r4y2pNCM1vxPHJBUowa5lcmMd7mUOtyCMUhvpNLCi07S3/PVnQEZ8FBP4lnqlHJg
	GUGgfXyG+FGbEpdGracDHW+RQXW1GUNi9/JB1h2TGcBSgzVaavypFA+B7rM/eQGv0R6v3oCCXm2
	F1aqWrdYJM1CjUg/P7Fp/yTckkbmx6Cih02Idavs65wmtBMGkSX481rgQTQIBsk2HY7wkq53D0m
	xCrwck2rVazZwwxOxgjzodePzl0rgtWqSC0Tb+J0KUyT+JblAOaVkHDhsLxeThzgZfX47Vw0h69
	gPSgVrCPrwp+VStu/3QN7RyGayJ/8c8aDrRafe9jZeJ3MPN8t8vxhQwJq+3xO9YSq33xoxQK/Z
X-Received: by 2002:a17:90b:5824:b0:38e:bfe:81e9 with SMTP id 98e67ed59e1d1-39aedf66687mr5862942a91.1.1788343551668;
        Wed, 02 Sep 2026 03:05:51 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1dcfbsm10766784a91.2.2026.09.02.03.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:05:51 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 13/28] editorconfig-core-c: patch CVE-2026-40489
Date: Wed,  2 Sep 2026 22:04:55 +1200
Message-ID: <20260902100511.2105916-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
References: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:05:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129644

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-40489

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../editorconfig-core-c/CVE-2026-40489.patch  | 39 +++++++++++++++++++
 .../editorconfig-core-c_0.12.9.bb             |  4 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/editorconfig/editorconfig-core-c/CVE-2026-40489.patch

diff --git a/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c/CVE-2026-40489.patch b/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c/CVE-2026-40489.patch
new file mode 100644
index 0000000000..e328052314
--- /dev/null
+++ b/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c/CVE-2026-40489.patch
@@ -0,0 +1,39 @@
+From 4d5fcd42739f0ae349efe4e9208c0f109bb7c141 Mon Sep 17 00:00:00 2001
+From: Hong Xu <hong@topbug.net>
+Date: Tue, 14 Apr 2026 23:11:39 -0700
+Subject: [PATCH] Merge commit from fork
+
+Completes the buffer-overflow fix from #87, which bounded writes into
+`pcre_str` but left the initial `strcpy` of `pattern` into `l_pattern`
+at the top of `ec_glob` unguarded. Sufficiently long patterns smash the
+stack before any of the bounds-checked code runs.
+
+Fix CVE-2026-40489
+
+(cherry picked from commit 5159be88ad50641d9843289adda791ba300421ff)
+
+CVE: CVE-2026-40489
+Upstream-Status: Backport [https://github.com/editorconfig/editorconfig-core-c/commit/5159be88ad50641d9843289adda791ba300421ff]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/lib/ec_glob.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/lib/ec_glob.c b/src/lib/ec_glob.c
+index d36076d..0e7f7ac 100644
+--- a/src/lib/ec_glob.c
++++ b/src/lib/ec_glob.c
+@@ -96,8 +96,12 @@ int ec_glob(const char *pattern, const char *string)
+     _Bool                     are_braces_paired = 1;
+     UT_array *                nums;     /* number ranges */
+     int                       ret = 0;
++    size_t                    pattern_len = strlen(pattern);
+ 
+-    strcpy(l_pattern, pattern);
++    /* Reject patterns that would overflow l_pattern in the copy below. */
++    if (pattern_len >= sizeof(l_pattern))
++        return -1;
++    memcpy(l_pattern, pattern, pattern_len + 1);
+     p_pcre = pcre_str + 1;
+     pcre_str_end = pcre_str + 2 * PATTERN_MAX;
+ 
diff --git a/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.9.bb b/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.9.bb
index 319c1724c0..8d182d0cd0 100644
--- a/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.9.bb
+++ b/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.9.bb
@@ -4,7 +4,9 @@ SECTION = "libs"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=38f617473e9f7373b5e79baf437accf8"
 
-SRC_URI = "git://github.com/editorconfig/editorconfig-core-c.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/editorconfig/editorconfig-core-c.git;protocol=https;branch=master \
+           file://CVE-2026-40489.patch \
+"
 
 SRCREV = "e082c947e7f7b14240195d55c060a6e1eda1b0a1"
 

