Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16934C3DA4B
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 20:49:43 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.2625.1721076580814709064
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 13:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DeVPY+P4;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-367993463b8so2707855f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 13:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1721076578; x=1721681378; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YvVCEs5gykFqAEvgY/QYM8K+XaX5y3EUTc88PKG82ls=;
        b=DeVPY+P4MtR7LcGIeAiXh4nEioNMcUoDtqLN07UqXNCB9/+boiRddovHAi879hyHmr
         Nk9uTrTBsmD0wr+CyGemenxaduQIzIVjz5JaSH4JGhEBAQZnPmMgyq3LInizzuCHAeiX
         65U+j4GaQ+EgxmXUSHPNXv1hHsKN0allSwAPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721076578; x=1721681378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YvVCEs5gykFqAEvgY/QYM8K+XaX5y3EUTc88PKG82ls=;
        b=a02LkZdsXQOVnnsu2zOl+J7ZwViSVMkN+jI9NZUqtfVoCNmB5Nsx2iL5C7bnkXda+L
         A2+qs8qDkCIVbT33bNu7/NIz5BobCC5Aylrzs1u4wtp00JhL8Igtt4+hMEF6CISE8rMS
         BYqXokv5jF4AI1yF5iwfPwxupIWnBudlImmOWKfN6KoQEoWSiL7uU7mnZVpxNLDiuT+Y
         0ovyP0dOQNKIwHrg8ups10ZPItte1UwdUulT6wzUIF9+VxWCD0VHW7NXHMpSPnna7r8j
         PFql5dCqEEXWp9vETc+hcMziizr+t3Zt3DnNNaCc7KdD/oCGlePGXjWaA20xJp45QDI6
         IRNQ==
X-Gm-Message-State: AOJu0Ywpr6aF4mUAsOFVeV5xhs9rosvqewRldmG30+jCf+Pk/jV0blKY
	qcPeP7tUqm8GWBXY3RJifLLxSqioKvQv7onJMK8bzZP69m9eHsQl5I1kl9/rnDLec9JoxD+Hf9N
	hl70=
X-Google-Smtp-Source: AGHT+IElRtPlqu7gcoa+3YsEhKUcB+8lkWQhBidaM8RvmCCRZJdyEjdMP57pBKRzEzWGBPUeiePJEg==
X-Received: by 2002:a5d:574d:0:b0:367:8c64:d969 with SMTP id ffacd0b85a97d-368261446f0mr27609f8f.39.1721076578533;
        Mon, 15 Jul 2024 13:49:38 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680daccd68sm7276842f8f.63.2024.07.15.13.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 13:49:38 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Alexandre Truong <alexandre.truong@smile.fr>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH] packagegroup-meta-oe: fix lvgl inclusion
Date: Mon, 15 Jul 2024 22:49:13 +0200
Message-Id: <20240715204913.2759019-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 20:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111364

From: Yoann Congal <yoann.congal@smile.fr>

Since commit f7fedd156374 ("lvgl: Upgrade to LVGL 9 series"):
* lv-drivers and lv-lib-png packages do not exist anymore
* lvgl does not depend on "wayland" being in DISTRO_FEATURES

This fixes these warnings (e.g. from AB[0]):
  Nothing RPROVIDES 'lv-lib-png' (but [...]/packagegroup-meta-oe.bb RDEPENDS on or otherwise requires it)
  Nothing RPROVIDES 'lv-drivers' (but [...]/packagegroup-meta-oe.bb RDEPENDS on or otherwise requires it)

[0]: https://autobuilder.yoctoproject.org/typhoon/#/builders/156/builds/367/steps/12/logs/warnings

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Alexandre Truong <alexandre.truong@smile.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit cda9ade9fb9662d11b6e956844db7c8202b9902b)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 7544a9fbfa..71f74287c7 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -511,7 +511,7 @@ RDEPENDS:packagegroup-meta-oe-graphics ="\
     libsdl2-net \
     ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "libsdl2-ttf", "", d)} \
     libsdl \
-    ${@bb.utils.contains("DISTRO_FEATURES", "wayland", "lv-drivers lvgl lv-lib-png", "", d)} \
+    lvgl \
     ttf-arphic-uming \
     ttf-droid-sans ttf-droid-sans-mono ttf-droid-sans-fallback ttf-droid-sans-japanese ttf-droid-serif \
     ttf-abyssinica \

