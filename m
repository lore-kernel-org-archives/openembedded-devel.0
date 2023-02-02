Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62664C61DA4
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 18:26:30 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.613.1675362383205846734
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Feb 2023 10:26:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ffzZgaI2;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id cl23-20020a17090af69700b0022c745bfdc3so2635183pjb.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Feb 2023 10:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eD3r2SJADCxNRdsUsFxPw9D0vaZtbmdQzRp2BgrWD4k=;
        b=ffzZgaI29EaRnRkbUYWsMHQqAKOl4ZTfUZ5aar05i8djojHbBFguoynkh/YZ5ncOoo
         Zp9prGpXkVzGoRvcwJR5zS2NW5M6nt/+XGD32m6p+ClBLo15haQyOPQXGvf7mFgzOyKa
         P0qFhJ7NSF8obmarTBPov7Zx4/bMDgFJGTcf2TLAvVAd1WgW1o0JoMvyoKY6q35Eoevt
         sJ3yo3PdIOMni3wYnk+U5S3Qet3Csr67FTM8gmVOZx51LL0EQggtk5y3rwSNFNMIBQUL
         /Sb1PCZtnRIHQh6Tv2Uh3QwxSOQn2KcvT6HhZfTTslyGJ2EIaLfO3ZyXcYGubKc7ZE0N
         fuGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eD3r2SJADCxNRdsUsFxPw9D0vaZtbmdQzRp2BgrWD4k=;
        b=it4tjQ4e8wHbAF/v6tI0u53Lpg5eCe/rIN2l8glWdtNuAN1b7FZDzUNxGgQuA5sHgR
         rI3ykc+lQoDosf+vFT/fMUUDRTBPkBDTYr5zy4J6JaU2sqS4L2sC6LArex/9fYjpkayD
         0K4f7fxAWxSm7QKHLFsmEs5YLPuf1KoUUYkGe7G9nfPiO8pjOTgw29XLeoODrKcbkGb/
         +fYc/1Jll7j/NjgmYcQ9wCXteYioYZ+exBX/Q4oawP54FYXiPreZmkNOdccFmjZQgakP
         mIY8A6xCLB7choy1/hXVroEn6hr9UbL5Y61Zx9vGgGRVqOQ5RVaQWqvlccN0N6srMI1U
         noSg==
X-Gm-Message-State: AO0yUKWsU20Csso3vr/maTsIevkIDHAycbfuq8Et3qVCTjbmq4Z5px4n
	Ik9YHm3g2NFKwwker1qKDyxh4qxC4nBj7A==
X-Google-Smtp-Source: AK7set/PbJ/h5kp/XzFdchmLOhiV3+STU8aR9i1i9+vKTzW2K4rbIJTXb8uPFDkJXoJ5cE4maFwEiA==
X-Received: by 2002:a17:90b:4d12:b0:22c:9912:39e with SMTP id mw18-20020a17090b4d1200b0022c9912039emr2599435pjb.36.1675362382211;
        Thu, 02 Feb 2023 10:26:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::868f])
        by smtp.gmail.com with ESMTPSA id d9-20020a17090a3b0900b00229934a0a6asm3528270pjc.4.2023.02.02.10.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 10:26:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] pipewire: Do not split modules using PACKAGES_DYNAMIC for native case
Date: Thu,  2 Feb 2023 10:26:19 -0800
Message-Id: <20230202182619.1650393-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Feb 2023 18:26:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100916

One of the module has -native in its name which causes it to be provided
by both pipewire and pipewire-native and we need to set preferred
provider just for that. The fine tailored packages is not needed for
native case anyway so disable it

Fixes
NOTE: Multiple providers are available for runtime pipewire-modules-protocol-native (pipewire, pipewire-native)
Consider defining a PREFERRED_RPROVIDER entry to match pipewire-modules-protocol-native

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.64.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.64.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.64.bb
index cc80989646..f10b472626 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.64.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.64.bb
@@ -246,6 +246,7 @@ PACKAGES =+ "\
 "
 
 PACKAGES_DYNAMIC = "^${PN}-spa-plugins.* ^${PN}-modules.*"
+PACKAGES_DYNAMIC:class-native = ""
 
 SYSTEMD_SERVICE:${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'systemd-system-service', 'pipewire.service', '', d)}"
 CONFFILES:${PN} += "${datadir}/pipewire/pipewire.conf"
-- 
2.39.1


