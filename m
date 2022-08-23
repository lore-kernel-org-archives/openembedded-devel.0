Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF2CDC3F6B0
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 16:51:36 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web12.291.1661273488473343041
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 09:51:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SanBTALT;
 spf=pass (domain: gmail.com, ip: 209.85.210.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id 67so5814658pfv.2
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 09:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=tK741Uun5XA9+oxCrNhAcaw35nJ3bwSS+xFDuSV833M=;
        b=SanBTALT5OyF2ycDX0zX9FwkVGmrayKzBQPmjVxL1nns8H3tj4slP9xGGKy9bJTZVP
         pud9i+1uuUBlMyjRA61HyTI4ybRuTSg65S1BLi1aWWIDhmzwc5faRF/0BJ0B6TUQA1H0
         V21QUNCaf13F5rk6+IR9ne7CeTfF7jcDO4rtGeeEQj3xOOUM46n7DhGssZaOQStcg3qY
         xdbETYMoua4NuMhNBZ200W42Ort9gOygeDm2zvHuUE8Sd+79rZTXSey2uXT5uWDUidgF
         t5tGGgqAxPtloVI+3t+K2ysL4KcApuwAO5CxROfDsRIg+oBo6teBPME1SqCzA+2KrAzB
         5Lzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=tK741Uun5XA9+oxCrNhAcaw35nJ3bwSS+xFDuSV833M=;
        b=lncJzJ0zkmaBEqpYOv1MLn+CBVX4Z7M6j+4F5Fe0AD1ekMQzCEvMLPlhW4qznsmc6A
         wmgeCo8onIkIoCKy07REnVmGzjTIq5SyCw6apPF5v5RztHgJf7id3rzwqaXpvMOjKQkt
         t8RQYO2KXFXCzSzWoW94CH//qphpIFv4tMM3BPzqDO+F/oTjnqqmbX0aLGwNRsa5nO7N
         bHsO0sRxldEwp6QjggGPVDLIPAXz3jEOcBceDIIxHhhW7ptJUn9sRlNG5cz5soW2EA8z
         6CBqR3YbqBSHyqY4aMXgJtt7P43KMkSx701yEBY3UlLUZX/KkJ7ZHEvHccjg01bM1eNW
         iOHg==
X-Gm-Message-State: ACgBeo3ZqFrd7gDAeIXtzkLGTBDqWwp1/ye+WM+yIq9WuYLjWfUjO1fy
	z2dBRFcD2zpULl4askwS9zEM5qnhNnPWUg==
X-Google-Smtp-Source: 
 AA6agR4/MVxgZQ2vohmtMgEQ3RFYF7pT0kxxhNo9oxjHhSJRI5x04f3VCVRQdrFcw6CNbDYAPzIy1g==
X-Received: by 2002:a05:6a00:a1d:b0:536:90d3:1930 with SMTP id
 p29-20020a056a000a1d00b0053690d31930mr11046618pfh.25.1661273487553;
        Tue, 23 Aug 2022 09:51:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 q18-20020a170902f35200b0016be834d54asm10596856ple.306.2022.08.23.09.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 09:51:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/4] safec: Remove unused variable 'len'
Date: Tue, 23 Aug 2022 09:51:22 -0700
Message-Id: <20220823165122.3248107-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220823165122.3248107-1-raj.khem@gmail.com>
References: <20220823165122.3248107-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Aug 2022 16:51:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98396

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...strpbrk_s-Remove-unused-variable-len.patch | 42 +++++++++++++++++++
 meta-oe/recipes-core/safec/safec_3.7.1.bb     |  3 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-core/safec/safec/0001-strpbrk_s-Remove-unused-variable-len.patch

diff --git a/meta-oe/recipes-core/safec/safec/0001-strpbrk_s-Remove-unused-variable-len.patch b/meta-oe/recipes-core/safec/safec/0001-strpbrk_s-Remove-unused-variable-len.patch
new file mode 100644
index 0000000000..4fd36ab8ab
--- /dev/null
+++ b/meta-oe/recipes-core/safec/safec/0001-strpbrk_s-Remove-unused-variable-len.patch
@@ -0,0 +1,42 @@
+From b1d7cc6495c541cdd99399b4d1a835997376dcbf Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 22 Aug 2022 23:42:33 -0700
+Subject: [PATCH] strpbrk_s: Remove unused variable len
+
+Fixes
+error: variable 'len' set but not used [-Werror,-Wunused-but-set-variable]
+
+Upstream-Status: Submitted [https://github.com/rurban/safeclib/pull/123]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/extstr/strpbrk_s.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/extstr/strpbrk_s.c b/src/extstr/strpbrk_s.c
+index 5bb7a0f8..2cf8a8be 100644
+--- a/src/extstr/strpbrk_s.c
++++ b/src/extstr/strpbrk_s.c
+@@ -79,7 +79,6 @@ EXPORT errno_t _strpbrk_s_chk(char *dest, rsize_t dmax, char *src, rsize_t slen,
+ #endif
+ {
+     char *ps;
+-    rsize_t len;
+ 
+     CHK_SRC_NULL("strpbrk_s", firstp)
+     *firstp = NULL;
+@@ -121,7 +120,6 @@ EXPORT errno_t _strpbrk_s_chk(char *dest, rsize_t dmax, char *src, rsize_t slen,
+     while (*dest && dmax) {
+ 
+         ps = src;
+-        len = slen;
+         while (*ps) {
+ 
+             /* check for a match with the substring */
+@@ -130,7 +128,6 @@ EXPORT errno_t _strpbrk_s_chk(char *dest, rsize_t dmax, char *src, rsize_t slen,
+                 return RCNEGATE(EOK);
+             }
+             ps++;
+-            len--;
+         }
+         dest++;
+         dmax--;
diff --git a/meta-oe/recipes-core/safec/safec_3.7.1.bb b/meta-oe/recipes-core/safec/safec_3.7.1.bb
index 5ffe7d7528..9dd6f1c7cc 100644
--- a/meta-oe/recipes-core/safec/safec_3.7.1.bb
+++ b/meta-oe/recipes-core/safec/safec_3.7.1.bb
@@ -9,7 +9,8 @@ inherit autotools pkgconfig
 S = "${WORKDIR}/git"
 SRCREV = "f9add9245b97c7bda6e28cceb0ee37fb7e254fd8"
 SRC_URI = "git://github.com/rurban/safeclib.git;branch=master;protocol=https \
-"
+           file://0001-strpbrk_s-Remove-unused-variable-len.patch \
+           "
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|powerpc64|arm|aarch64|mips).*-linux'
 
-- 
2.37.2


