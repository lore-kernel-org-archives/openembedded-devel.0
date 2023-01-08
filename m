Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B76BC54EBC
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 04:54:09 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.38873.1673153645592527506
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Jan 2023 20:54:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZrjtGcfQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id c4so6059770plc.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Jan 2023 20:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m5d8WEL5HYSw9wDGS8m5yz3F81uhRei28HzMpXXgkqM=;
        b=ZrjtGcfQy3jAYh++L/JXXdZjaHyRHY8W58pJ8yiS5dm34yr5GiBpswKrWjmAf2OSAw
         mwu+3TziPmbR24AXRkCaoTHrAeqm3VCIkG1C+3GOcdgWo6EYN1i24o9ir4B/U5dZheVl
         TzFwe+DaLRlEOBbmmTc66GqEbXPo/+SWsjeQoFpZbozWFFeleqHdMy5P/CjM3u1bJbpT
         0Sl1HMJGXIgtyy7+IryoFX3QMdG2njAbFEFKw21nO58JOUv+G0eODFzn/LdP236fbHSg
         w2GjQUzvck7cGmkXWsK8/vzfNMqjMW9sw+yhyl3Q7U8eNSeJDc5/T78gvP/kJ3tCJZQ4
         2z4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m5d8WEL5HYSw9wDGS8m5yz3F81uhRei28HzMpXXgkqM=;
        b=Mw4R1GglhuG/YKTdN1v8iAK7QfdghwabkSh1jcLsYrKA6UcaSl6e2CJ9O2k8wiO4aG
         BfF+uwqq2w6RyTO6+tSZSJlcgIXp4VcVlX81RJkbL7WHQyxyPIqpH/rHT4uLHc8KRmjl
         ZUvxVXpQl+p5rZv7N8F67UPJypzCyeDx5UWY/ykuU+KF/iqoKy80Huhv5neAo2n1v1XI
         RPMzqx9A6sDL/W9PE9FDxL5N5vJaV599DJMXmeDCQilmSC6QjAes45ooYd7Pr5Ne1uqT
         pmJ+ixhRFa0k4DcC0BPgCc4pfS8TQhSAhofWprhgAD9/uX7C6/iU6ab443fDBlqwslhy
         H3AQ==
X-Gm-Message-State: AFqh2kqnRISF0QcbVVSxXO/wPxYI2XI78T4DRBZdFrnSovEf2bDinu3i
	2oTlsvkoOhQ9Pxsgwp6uGBiqnyM0n458zw==
X-Google-Smtp-Source: AMrXdXv3CuHgxD8/G4JzlC916yOz7EvxoxGacUV6DYUPclIIEs0uyJOaIMPV9e994p2hpPQvGYAM8w==
X-Received: by 2002:a17:902:ce82:b0:192:fb92:327 with SMTP id f2-20020a170902ce8200b00192fb920327mr18551108plg.58.1673153644762;
        Sat, 07 Jan 2023 20:54:04 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::ee35])
        by smtp.gmail.com with ESMTPSA id k15-20020a170902c40f00b0019276616e9fsm3498835plk.183.2023.01.07.20.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 20:54:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/4] concurrencykit: Fix build on riscv32
Date: Sat,  7 Jan 2023 20:53:59 -0800
Message-Id: <20230108045401.1559499-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108045401.1559499-1-raj.khem@gmail.com>
References: <20230108045401.1559499-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 04:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100436

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-build-Use-ilp32d-abi-on-riscv32.patch | 24 +++++++++++++++++++
 .../concurrencykit/concurrencykit_git.bb      |  3 ++-
 2 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/concurrencykit/concurrencykit/0001-build-Use-ilp32d-abi-on-riscv32.patch

diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0001-build-Use-ilp32d-abi-on-riscv32.patch b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0001-build-Use-ilp32d-abi-on-riscv32.patch
new file mode 100644
index 0000000000..a2f79e5464
--- /dev/null
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0001-build-Use-ilp32d-abi-on-riscv32.patch
@@ -0,0 +1,24 @@
+From b709cef30e9e9c7c6c96dc416d141e7283dc4b50 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 7 Jan 2023 19:31:58 -0800
+Subject: [PATCH] build: Use ilp32d abi on riscv32
+
+ilp32d is common ABI used for linux distributions therefore a better
+default
+
+Upstream-Status: Submitted [https://github.com/concurrencykit/ck/pull/204]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ build/ck.build.riscv | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/build/ck.build.riscv b/build/ck.build.riscv
+index 61e0033..11ac840 100644
+--- a/build/ck.build.riscv
++++ b/build/ck.build.riscv
+@@ -1 +1 @@
+-CFLAGS+=-mabi=ilp32
++CFLAGS+=-mabi=ilp32d
+-- 
+2.39.0
+
diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
index fe2c1d201a..ae2bab7e24 100644
--- a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
@@ -11,7 +11,8 @@ PV = "0.7.0+git${SRCPV}"
 SRCREV = "6e8e5bec2e2f8cef2072a68579cbb07ababf3331"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a0b24c1a8f9ad516a297d055b0294231"
 SRC_URI = "git://github.com/concurrencykit/ck.git;branch=master;protocol=https \
-           file://0001-configure-Fix-compoiler-detection-logic-for-cross-co.patch"
+           file://0001-configure-Fix-compoiler-detection-logic-for-cross-co.patch \
+           file://0001-build-Use-ilp32d-abi-on-riscv32.patch"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.0


