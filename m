Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67B94C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 12:08:56 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.82437.1701950927039740559
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Dec 2023 04:08:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k0PAqrNw;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3316d09c645so849058f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 04:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701950925; x=1702555725; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0OHrh2Iq0R7A/i0+Y3OuFHNGkb5DQhtDgIh0HoPEkBc=;
        b=k0PAqrNwHE5ZV01nAEyPh+x5b/JLU/E+PX7hS9mw28rCwRQ4KsIceBMlfwsRz+1uwo
         KoziyaLXtLbliuiU0efkZ6jcTgRWuIbmT2xkdcMiuinnls/uFSATNMVYhOsnxS6oEfOq
         Z/vgJ5zLP+vGcorlOhVnsEyw19eW+rwjNUyoDPlGVfZUsIQCNRiulRaRihaeuv/AdJma
         N0kNwrBH1oveHMUsa9wof1dkk+u/C0at1Nex1zrBVKgmYg7mWb00GxMhSEQuSunVuThx
         wMgJRgW24kVxJRsdr1kfagp0P05ECagXCGZh6RHN4F7Q+WQnIxEUP6E98vy+m5KzaTdl
         9XGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701950925; x=1702555725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0OHrh2Iq0R7A/i0+Y3OuFHNGkb5DQhtDgIh0HoPEkBc=;
        b=FxuJ7sBByOrM4B0N1JuHdShkTRYwZMDQEgAy7qZTZMJ9KoGXafWr0YSGJjrINevW+R
         8WlW2eY6/lP/x10J6pddsH0kSjC7XtipqYjt5Gd4g+/SSsUPtL7+SUO7rEmSVUgjt6sS
         KIgRQv+IA+TOVxjh4bSB1V2QZMWbhIXNq0I7ueOy70TQJz92vvsRIWqlk+6gMIza0+IJ
         aDybvwyh8/hwKgRSRD+z74U2qddmTY7BA6L97zX18e2iFVtFryBwHz06K0zQHZOjWb2B
         C6ftAw1UnHY5fmIJJ2WyyhnR/lFU9wwogeAvLrlcAzLsRMr+2jamxihHFTXh27YchPva
         mtqw==
X-Gm-Message-State: AOJu0YyKeOL7EzvKtPawSO0qk4jGFEF5ntF7dPDKgBnoD3SJBZO1Qckr
	AIJ9TvCETt61quLIrdbx04Q5HXAcNTVeow==
X-Google-Smtp-Source: AGHT+IFOkqxw1fiSza4FbwMnmxXaWoIag4iqc537bTqDdNk7eTeccaPSj3iGABgpVqTRB7vlF8fvRA==
X-Received: by 2002:a5d:68c5:0:b0:333:d06b:ec64 with SMTP id p5-20020a5d68c5000000b00333d06bec64mr1280734wrw.49.1701950924865;
        Thu, 07 Dec 2023 04:08:44 -0800 (PST)
Received: from localhost.localdomain ([176.33.71.251])
        by smtp.gmail.com with ESMTPSA id d2-20020adfe2c2000000b003333d2c6420sm1290104wrj.74.2023.12.07.04.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 04:08:44 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] xf86-video-ati: upgrade 19.1.0 -> 22.0.0
Date: Thu,  7 Dec 2023 15:08:10 +0300
Message-Id: <20231207120810.1342464-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 12:08:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107278

* SRC_URI && features_check removed because already defined in xorg-driver-common.inc

Changelog:

* Don't set SourceValidate pointer to NULL
* radeon_glamor_wrappers.c: Convert from ISO-8859-1 to UTF-8
* gitlab CI: enable gitlab's builtin static analysis
* gitlab CI: enable commit & merge request checks
* Fix spelling/wording issues
* Build xz tarballs instead of bzip2
* Only include dri.h with older versions of xserver
* Add GitLab CI pipeline
* Guard local variable info only used with glamor
* ati: cleanup terminology to use primary/secondary
* Fix return value check of drmIoctl()
* Don't crash X server if GPU acceleration is not available
* Handle NULL fb_ptr in pixmap_get_fb
* Fix link failure with gcc 10

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 ...f86-video-ati_git.bb => xf86-video-ati_22.0.0.bb} | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)
 rename meta-oe/recipes-graphics/xorg-driver/{xf86-video-ati_git.bb => xf86-video-ati_22.0.0.bb} (74%)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_git.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_22.0.0.bb
similarity index 74%
rename from meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_git.bb
rename to meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_22.0.0.bb
index 9452c3a91..57ea9d2d3 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_git.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_22.0.0.bb
@@ -9,18 +9,10 @@ DESCRIPTION = "Open-source X.org graphics driver for ATI Radeon graphics"
 DEPENDS += "virtual/libx11 libxvmc drm \
             virtual/libgl xorgproto libpciaccess"
 
-inherit features_check
-
 REQUIRED_DISTRO_FEATURES += "opengl"
 
-SRC_URI = "git://git@gitlab.freedesktop.org/xorg/driver/xf86-video-ati.git;branch=master"
-SRCREV = "7a6a34af026f0bef8080b91baf97a729380bca01"
-
-SRC_URI[sha256sum] = "659f5a1629eea5f5334d9b39b18e6807a63aa1efa33c1236d9cc53acbb223c49"
-
-PV = "19.1.0+git${SRCPV}"
-
-S = "${WORKDIR}/git"
+XORG_DRIVER_COMPRESSOR = ".tar.xz"
+SRC_URI[sha256sum] = "c8c8bb56d3f6227c97e59c3a3c85a25133584ceb82ab5bc05a902a743ab7bf6d"
 
 PACKAGECONFIG ??= "udev"
 PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
-- 
2.25.1


