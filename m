Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C4A0C52D6F
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 12:23:07 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.58563.1723119786862202179
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 05:23:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=uca3Ro+Y;
 spf=pass (domain: konsulko.com, ip: 209.85.208.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5a1337cfbb5so1136209a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 05:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723119785; x=1723724585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUrMGjyBULZILBkOHpa+y0MLMQtf06W4EFoj5StQUa8=;
        b=uca3Ro+Y60xksMrfxJ0BTzuSr2y8MakUWVfZdYMx96QsENd+1PXjngNjFBlDJq+yUn
         sS85vR24xyDESJmLAimLy+MKs3helEAIDMw+NeCzux019oWn/wfLjQ18PfptRalTmyj4
         KsK+njB86pNqBS/Cy6btg8uWnFjR/Dr4UoSb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723119785; x=1723724585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUrMGjyBULZILBkOHpa+y0MLMQtf06W4EFoj5StQUa8=;
        b=XfyXOsRBpIOn6++vVLYsRgaVDO9t7FLjVmRHHIy6ZErX4fgsx2rBoAxMNGVgfmBq/r
         NIv1SQDDbgF89BDPvgcrPDK771ocqLdaEPb6u5K2ZICgjo111ZXl0gOZO2YkxpeoAFVH
         IwsKvg50LZpWMl1kKNf/EitUd349Li4CfLgjLngMkoa3gNnX41N0x6U+6plnDcjiNxaa
         HH8VQV8R/5nEfwUhxyzlbEfHFJHErJOPIMsV91Xeo4Q6u8jOKIdTmRv0NMc4GszSKv3M
         k+goC/msC1gILB4t8jI6FF4t5B5ucSFP9fX9zF2H0hWlANrLAxQGWKUGGAd0S65mQmTw
         Ot6Q==
X-Gm-Message-State: AOJu0YzeSj4hqyN5MI/Sl8OZsAZrMCWZ+Bw3ydvYMhTCkDbzlLkyUcim
	da9ClSPi0XtR12cDYAUqMrnXCP+wMpIXKreBQKXUlDRS277edPtHTTY8zS/kEj4VRrX6C9qL5Ay
	h
X-Google-Smtp-Source: AGHT+IFVNVxft1f6NbOnuXaGbkCVfR20nGmV983UWKknsdMyxgSN+aLTqdhx/mLtJFkiCZ45zmu5Qg==
X-Received: by 2002:a17:906:7312:b0:a77:e1fb:7dec with SMTP id a640c23a62f3a-a8090c8278emr140655566b.17.1723119784736;
        Thu, 08 Aug 2024 05:23:04 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9ec886esm736135366b.203.2024.08.08.05.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 05:23:04 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/6] python3-coverage: switch to PEP-517 build backend
Date: Thu,  8 Aug 2024 15:22:57 +0300
Message-Id: <20240808122301.2271346-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240808122301.2271346-1-leon.anavi@konsulko.com>
References: <20240808122301.2271346-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 12:23:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111655

The project has a proper pyproject.toml which declares the
setuptools.build.meta PEP-517 backend.

Fixes:
WARNING: python3-coverage-7.6.1-r0 do_check_backend: QA Issue:
inherits setuptools3 but has pyproject.toml with
setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-coverage_7.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.6.0.bb b/meta-python/recipes-devtools/python/python3-coverage_7.6.0.bb
index f0dece4ac..5901d9993 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.6.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
 SRC_URI[sha256sum] = "289cc803fa1dc901f84701ac10c9ee873619320f2f9aff38794db4a4a0268d51"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += " \
     python3-crypt \
-- 
2.39.2


