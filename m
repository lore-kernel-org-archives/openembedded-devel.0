Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC6ECD98DB
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 15:34:31 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73368.1781278470359959164
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2026 08:34:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=CxAlmVj8;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso9257525e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2026 08:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1781278469; x=1781883269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1t/XyeyxuL9Au/Ri6MKDGxBvfJtRX6x8QaCLjtwGb0=;
        b=CxAlmVj8f8Y1rvmbbmFuxCnizgIoC9DQQEx1isDnFigcRYbvWMTMDvlTBqC2r+rUIK
         9d8vE8je4mz5zZZ8v5YkY6dXnxBLZPez+e9MxopTlxbRv8yYeD+CvVPf/3PqPC3VlzyG
         +ueEY3l4twpQqtftlXsTyn35GzQRcqYjmk4hs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781278469; x=1781883269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i1t/XyeyxuL9Au/Ri6MKDGxBvfJtRX6x8QaCLjtwGb0=;
        b=qA/xNb81dzPMmQU/dmm57OKs+z1wof4R4adOzmcDa9uDTFCH08LXwxZM+TS1r15PM4
         bGntPMI/SZMrprbTePod9UWIGipN/FqQEtdC7nB3Nl+0p6xvUkd+Z1goOE3g576HUOjb
         tvKqHHxqwohhn5XHqqYSelqQCxde+y3wLmJ6nhXHXX6kel7At/Ri3pGN8JBRryBUFsVf
         m3APSm+0+ha7+NAG2yBuRr+/otFCmWyvzbuyFYfWnqRRbywuKptk8/vo4+09bJtqBKq1
         3ehIjseVdRBLSy68BuayE9tMJsOaVamVo5smhUf8bx1bDlSdx4pCGIOCtifbj23yFKdy
         fY9g==
X-Gm-Message-State: AOJu0YxAzbRcOv51VSyz3q0yS3fUJueaFrwdlc1Z2Zptv0PAUQQyII3m
	E6rCN2VCkyF8YZgOmw6Td2o/q9rRRI81VNIylOdTRmrmixZChPCx+pLIf4w07jwBXnZvz1k+UrT
	vgRxN
X-Gm-Gg: Acq92OHhHJltyBqAapxeYRA6xE4FkkRzNS5eaGAa4B9I88QmVmTeS7rNjiYOCxCxulP
	ASQARByZBUt5x67uXPM4Zn20iCZeLPT665oRIoTAwuHMYh/SNE9CQWk3HOaxCtcKopyShb1ylEM
	58RDznm/Lmbo0+lABMry7H/A/tAePxCLu7UNeGCeT5CwwtRgSQUhIh4zuKRSPE4W0ry35X6fq1s
	VAQRfplBW07x8wlWdbqzZFIgPdK7NjQFK0cZXzHtfCnW4tkrFGDTXl4Nuumbo0w3Inj8mFGORMG
	OVY5UslSUFUptkyUGlafBAZw/+Cbf8pH77O7WOgz71H3nxCn/4D4LY63Z+WBgCIsdiLTAczVC7t
	9eDPbucvOJJZifyfeeJlwqWK+GfEVQGupfrYwI2j7J5NQRmXx+mruT6hvd2kbr9RnhE+eyUnT9Z
	wfRYAEG9yAmVxPbe/m1wLLLN723fhmuSLQt/M1
X-Received: by 2002:a05:600c:58d5:b0:490:c2a2:e91e with SMTP id 5b1f17b1804b1-490ec523a8amr30538995e9.34.1781278467966;
        Fri, 12 Jun 2026 08:34:27 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea961f18sm61187095e9.2.2026.06.12.08.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 08:34:27 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 8/8] python3-starlette: Upgrade 1.2.1 -> 1.3.1
Date: Fri, 12 Jun 2026 18:34:04 +0300
Message-ID: <20260612153404.3213552-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260612153404.3213552-1-leon.anavi@konsulko.com>
References: <20260612153404.3213552-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2026 15:34:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127550

Upgrade to release 1.3.1:

- Use StarletteDeprecationWarning instead of DeprecationWarning
- Enforce max_fields and max_part_size in FormParser
- Enforce FormParser limits in parser callbacks

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-starlette_1.2.1.bb => python3-starlette_1.3.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-starlette_1.2.1.bb => python3-starlette_1.3.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-starlette_1.2.1.bb b/meta-python/recipes-devtools/python/python3-starlette_1.3.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-starlette_1.2.1.bb
rename to meta-python/recipes-devtools/python/python3-starlette_1.3.1.bb
index 66a7148ce2..17f187a5f3 100644
--- a/meta-python/recipes-devtools/python/python3-starlette_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-starlette_1.3.1.bb
@@ -2,11 +2,10 @@ SUMMARY = "Starlette is a lightweight ASGI framework/toolkit, which is ideal for
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=11e8c8dbfd5fa373c703de492140ff7a"
 
-SRC_URI[sha256sum] = "9b9b5ebb992e67d6093741e63c2f59e4f6fff986f81163c087867bd7b924b3f6"
+SRC_URI[sha256sum] = "05d0213193f2fbaae60e2ecb593b4add4262ad4e46536b54abe36f11a71724e0"
 
 inherit pypi python_hatchling ptest
 
-PYPI_PACKAGE = "starlette"
 CVE_PRODUCT = "starlette"
 
 SRC_URI += " \
@@ -30,6 +29,7 @@ RDEPENDS:${PN}-ptest += " \
         python3-typing-extensions \
         python3-unittest-automake-output \
         python3-pyyaml \
+        python3-httpx2 \
 "
 
 do_install_ptest() {
-- 
2.47.3


