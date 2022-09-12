Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0FB6C54EE9
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 03:41:36 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web09.3703.1662954092821441150
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Sep 2022 20:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X+KkWB7Y;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id b21so7356853plz.7
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Sep 2022 20:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=DFY7bMH80CcMHYxtooYPRHUiQ6Nk/c9CNraqOS4+T0E=;
        b=X+KkWB7YWDBfpKbsuNNXEbwBmGHxkYvYmekNFBu6l1EllKoK0uTO0GwwgtMbvJ+6Yz
         AuvBLwJ/7l0kFXjfxmKU6FgTs3odo/B9pJ+Uct6ZRyEzzoIdx++eBFXkpUyaCBySLc8w
         qINPSnYgMQmztRdfK2/xkv2DaG3R3NMpMLD8S5xNrC95EnB5hkfm4oGU+RwTbF1MqL2I
         N7KkKE4NY5I8UlUVp0QjEZZNLVgxfoGQ8Y2528q+Oz9l1lkA5xchafuaLKEYVMUpV0eX
         vMuLFXOOwclDm4rZ+DUsioyZDqLe9rnsQAG+/jS5gZnRtqYheUx8ZWfXtM5mbu80j2aM
         D9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=DFY7bMH80CcMHYxtooYPRHUiQ6Nk/c9CNraqOS4+T0E=;
        b=cp0+JXQOGpk4jbpaXMLfpc8BqmJSjWlVPjVLLhzf3xw3hlIXx+75BEKT3KcsOFXC+B
         m07DAYlTXWIKsDcxzQwUVscwIk2LtI/OjCB0mrcTpkejRLRvVmaQL6g9ViSkiVAEctR6
         aV/Wm41bXCH6AMrdLzQa8p2FcIcV3esOQtwUFoEWz8sO8nOwWlIOpIeGDSFXh8OFeolm
         X724MR2YocCRQXoanHurviIdM+Qu0QRoO3B19F92Lm9C3h1dcwhmnQ1WcS6sVT9ufut4
         T8PMQacNxFTlwNayabunOymSXM/ThxuwyKnSkSLYE4B9AtoMu7qIFQZvkukumc0xrhG5
         MhLw==
X-Gm-Message-State: ACgBeo1YYOBHzGoX5GLo7jizgui/3ze+qxWP0PyNzdpvb4L+agjuFeSc
	+NdySJWy1vtTWNWBtoKBw7rEOXQbJryIyw==
X-Google-Smtp-Source: 
 AA6agR5NwC5pNO+dkbtCrNycmzojffr40aTrNWOCIyVlpHTksEX7C7vjf6cgyFiU3p69OxhCwRPfHw==
X-Received: by 2002:a17:90b:4d8c:b0:200:7cd8:333e with SMTP id
 oj12-20020a17090b4d8c00b002007cd8333emr21337116pjb.95.1662954092083;
        Sun, 11 Sep 2022 20:41:32 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8fc7])
        by smtp.gmail.com with ESMTPSA id
 d7-20020a170902cec700b00176ea6ce0efsm4664940plg.109.2022.09.11.20.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 20:41:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 7/7] aom: Provide missing function prototypes
Date: Sun, 11 Sep 2022 20:41:23 -0700
Message-Id: <20220912034123.1885229-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220912034123.1885229-1-raj.khem@gmail.com>
References: <20220912034123.1885229-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Sep 2022 03:41:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98747

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...neon-Provide-prototypes-for-missing-.patch | 48 +++++++++++++++++++
 .../recipes-multimedia/aom/aom_3.4.0.bb       |  4 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/aom/aom/0001-subpel_variance_neon-Provide-prototypes-for-missing-.patch

diff --git a/meta-multimedia/recipes-multimedia/aom/aom/0001-subpel_variance_neon-Provide-prototypes-for-missing-.patch b/meta-multimedia/recipes-multimedia/aom/aom/0001-subpel_variance_neon-Provide-prototypes-for-missing-.patch
new file mode 100644
index 0000000000..100507cdec
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/aom/aom/0001-subpel_variance_neon-Provide-prototypes-for-missing-.patch
@@ -0,0 +1,48 @@
+From c33e07f78982acfb0574a84fb523f8591e55c50e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 11 Sep 2022 19:46:28 -0700
+Subject: [PATCH] subpel_variance_neon: Provide prototypes for missing
+ functions
+
+Fixes build with clang-15
+aom_dsp/arm/subpel_variance_neon.c:121:10: error: call to undeclared function 'aom_variance8x8_neon'; ISO C99 and later do not support implicit function dec
+larations [-Wimplicit-function-declaration]
+|   return aom_variance8x8_neon(temp2, 8, dst, dst_stride, sse);
+|          ^
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ aom_dsp/arm/subpel_variance_neon.c | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/aom_dsp/arm/subpel_variance_neon.c b/aom_dsp/arm/subpel_variance_neon.c
+index 4ecf891cbeb..859168ea0c5 100644
+--- a/aom_dsp/arm/subpel_variance_neon.c
++++ b/aom_dsp/arm/subpel_variance_neon.c
+@@ -20,6 +20,22 @@
+ #include "aom_dsp/aom_filter.h"
+ #include "aom_dsp/variance.h"
+ 
++extern unsigned int aom_variance8x8_neon(const uint8_t *a, int a_stride,
++                                         const uint8_t *b, int b_stride,
++                                         unsigned int *sse);
++
++extern unsigned int aom_variance16x16_neon(const uint8_t *a, int a_stride,
++                                         const uint8_t *b, int b_stride,
++                                         unsigned int *sse);
++
++extern unsigned int aom_variance32x32_neon(const uint8_t *a, int a_stride,
++                                         const uint8_t *b, int b_stride,
++                                         unsigned int *sse);
++
++extern unsigned int aom_variance64x64_neon(const uint8_t *a, int a_stride,
++                                         const uint8_t *b, int b_stride,
++                                         unsigned int *sse);
++
+ // Load 2 sets of 4 bytes when alignment is not guaranteed.
+ static INLINE uint8x8_t load_unaligned_u8(const uint8_t *buf, int stride) {
+   uint32_t a;
+-- 
+2.37.3
+
diff --git a/meta-multimedia/recipes-multimedia/aom/aom_3.4.0.bb b/meta-multimedia/recipes-multimedia/aom/aom_3.4.0.bb
index 36db45e265..9cd6f7a9e9 100644
--- a/meta-multimedia/recipes-multimedia/aom/aom_3.4.0.bb
+++ b/meta-multimedia/recipes-multimedia/aom/aom_3.4.0.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6ea91368c1bbdf877159435572b931f5 \
                     file://PATENTS;md5=e69ad12202bd20da3c76a5d3648cfa83 \
                    "
 
-SRC_URI = "git://aomedia.googlesource.com/aom;protocol=https;branch=main"
+SRC_URI = "git://aomedia.googlesource.com/aom;protocol=https;branch=main \
+           file://0001-subpel_variance_neon-Provide-prototypes-for-missing-.patch \
+          "
 
 SRCREV = "fd0c9275d36930a6eea6d3c35972e7cf9c512944"
 
-- 
2.37.3


