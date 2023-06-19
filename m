Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D08C3DA42
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:23:03 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.7422.1687180977231108577
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=GNU042wv;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.42, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f9b37cd58bso5323495e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180976; x=1689772976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RMTkYCCkoQsxtT1YQ1yl9FgfORATtsVQPdK6vF8CbM=;
        b=GNU042wvgkrIFIaD9pptg6SMTo1ed+XeCta49lnjlVC4nsTmiJBsj6Yf4h25mE37Si
         Vt+/mzaTDSmAftjeyKCxmQ/rwfB04AGSrI51Whp88iUPrs7BE3DA8jVQVW3up3QOZj6p
         wxws9AJHFoZMlf/wFNaePQPAf+w33m1ig4vkKzt505PkvX1lfdAu8dump/KF3rIp4qKd
         ymNCUIkUq7w9ywpzACkOAzYyKzpcbZL3PkyZMwqdm1eKWlMwfe9QveuISf+w5cTgBJIt
         XqD5Fx1qrurVGykmxl68FMzaDFxrnPCFqXlAcHugd6HAl/SHyqnPROl0GhfrqOja2gAT
         oPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180976; x=1689772976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7RMTkYCCkoQsxtT1YQ1yl9FgfORATtsVQPdK6vF8CbM=;
        b=PBBNciXUxIcW18Co2c1k/IuLn3VZYEXB/bzHOp/Q0t9OUzh5E+CK/LMRsqDqjVcWYx
         8CM3YVOeFHtSccWQP2+VBeK/Kfli3NMGO/39YaqEH9yyuYFDb4GXuL/DPYx1rx22GR36
         kIeUW0HpLNbRbUJ+qqfj4yr/guV59ZXxLRNp6nBbGSxAM70vbz4RBX46wE3aDWFWwJNF
         X8fe6i7ijGC7IPVfN1xA6339H4Somkv2eIWNKVvRdST9XcnPj+Gmav9KG9l17XctLBFJ
         s7hLVurmexLiPX47LVcB4snfdd3FOwHsq1klD4Uixx73j+SCYJ9jmFC7uc9ZFkG1YOMe
         Gs/Q==
X-Gm-Message-State: AC+VfDz3V5HiVBeyA46tfbCqzGnU7Pn8tbMDzEOT+SbnnS93V6J4y4Ex
	4N7s0pPwcOzb0gL3KuxjaUyVdQ==
X-Google-Smtp-Source: ACHHUZ6ZWxj4kg4T8O2l9YtBXPkJZMeti6RxCrzYMSplTHpkhUdsG22AMSsav3EOAswfbLqFysRTcw==
X-Received: by 2002:a1c:790f:0:b0:3f9:b32:5d3 with SMTP id l15-20020a1c790f000000b003f90b3205d3mr2687069wme.34.1687180975734;
        Mon, 19 Jun 2023 06:22:55 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 34/54] python3-asyncio-throttle: add missing run-time dependencies
Date: Mon, 19 Jun 2023 15:21:54 +0200
Message-Id: <20230619132214.213417-35-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:23:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103418

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-asyncio-throttle_1.0.2.bb   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-asyncio-throttle_1.0.2.bb b/meta-python/recipes-devtools/python/python3-asyncio-throttle_1.0.2.bb
index 1f907511a..040e70940 100644
--- a/meta-python/recipes-devtools/python/python3-asyncio-throttle_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-asyncio-throttle_1.0.2.bb
@@ -7,3 +7,5 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c7906e56b70808e1ade6ca05e0bb48d5"
 SRC_URI[sha256sum] = "2675282e99d9129ecc446f917e174bc205c65e36c602aa18603b4948567fcbd4"
 
 inherit pypi setuptools3
+
+RDEPENDS:${PN} += "python3-asyncio"
-- 
2.39.2


