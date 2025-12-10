Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0CA2D3C543
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 12:47:02 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14605.1765370817289109271
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 04:46:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PAiSSG6I;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-343774bd9b4so5455814a91.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 04:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765370816; x=1765975616; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ydUsLkGgiwiqnQ+F0DcIz+/IbrKCvA5sjDKWEGcE+4w=;
        b=PAiSSG6I5zHW6sHGdAwPzvtZBMVT677Kn+ODsJAOvGao34zKlb+gU/y/sekc4/gxF0
         NQCCV5qldUhxBmEdNyvg24+VB4QI5RY60GBpJtl9XqSX1CbAuIRwikUfvRzI+PFvaFXL
         OI35s78RK0idruGOsMT6C6Maq8VS6mcQrvcsapJD23FhuG1OZWknXv+Mi1eFrGmZCJfm
         LuXAo4zge2EzCwsqoglrqbiKK4LYZowQ5Rx60HQ/viADMuciXrgdgnQLueHwISToZ6M6
         Zq1xsherQE1hw8v3wGJWwlWhRqk+RnLee5MIHEeOInI7Y80Di2IuIJcuU1C8eOEvRzdA
         aPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765370816; x=1765975616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ydUsLkGgiwiqnQ+F0DcIz+/IbrKCvA5sjDKWEGcE+4w=;
        b=wtR9bYTqU6dQ5360P/WxAzk7xy17SH5E4lQL95AeRhPeV2xWrdAYEz6Sagp+A7VB3C
         BicO47Xg1gfQc5E6eV+u+tFwWM3bZdaa+9W8HVDKW6nZ++pU1c9uei8WBWt4ApR4ogXR
         E+NTrrFI7DafiV96hQtg3tM1HUPPmZMZXFb4YewtR3PSrRyQOfGauT1mnGYweDot3dy0
         mXVtsvlDHjGLYkioZAS0tmMPEPzAF4bq/anueD7tTGwrgkl7DbNJUDCaDHUDx9LuWyat
         /A9lj6lNifgu0JMIdbSdzGPfF5xGEuk8jlunZN0+rhaLsqq3gPehZ2IKbhxCXlr0IaG7
         p76w==
X-Gm-Message-State: AOJu0YyC+NtenFQFCZDnrrP4Kh4yVN8Qo5CughFG70b7FHV/SouFC8ti
	biKyhjbDqqaFrDYl8A+3nf01fWThioYGhKtZWbxIrqLrH0fYR05EEsSqbvDREA==
X-Gm-Gg: AY/fxX6tuasHCLHwNdNU/9CH7SlKyBjtS+3kCaL1OmSiKXzg3HFLM/3cc6bll4Oo15i
	Oc2dVvoz5cJzg+EiSuR/hYT+rLCX2PCQl1OJewl97bjY06FH0mSc1eQkJoAwAZpUi3TfymuQpXp
	8A8+oE95BJ3ocrGDRWIlsXQSwHKwLW/VbPvjljr+/2re4ydy/ksJ4hvt1wNLc0MSVLr+0q02VCz
	VKfYGYAQo2BftqRjEhT8+tbxnnTk+MPsOO4kfTBAmVigmfyGgbzjcDTkhpcuJuHdhAT9CqgLqZo
	aifHNbW73oc2Jv0zIZdaKaqjzePPWaJULdHvTYEQzoFbDrfS+pl01odQ63L7vh6whk9fdMKxHxw
	AVQsSaVTDqOxm0nKLT/kIddPgFPo1egDxOP97yBBTYeRvncUrhYg8VXYt88+SMGln/62mSq1k9B
	ALStddeGAraIa+1S2cCoaEoA==
X-Google-Smtp-Source: AGHT+IFMkkZx4TM2/12nQPOiKcTuMGF7Sb+uoni6tql0BWRg9yiMmlqTmbWeIUtsMxS/AAzrVOb4Dw==
X-Received: by 2002:a17:90b:2752:b0:32e:7c34:70cf with SMTP id 98e67ed59e1d1-34a728d570bmr1979435a91.36.1765370816449;
        Wed, 10 Dec 2025 04:46:56 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.251.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf6875cc8eesm17748421a12.16.2025.12.10.04.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 04:46:56 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 11/43] xorgxrdp: upgrade 0.9.19 -> 0.10.4
Date: Wed, 10 Dec 2025 18:14:55 +0530
Message-ID: <20251210124528.10696-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210124528.10696-1-ankur.tyagi85@gmail.com>
References: <20251210124528.10696-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 12:47:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122515

From: Gyorgy Sarvari <skandigraun@gmail.com>

Changelog:
0.10.4: https://github.com/neutrinolabs/xorgxrdp/releases/tag/v0.10.4
0.10.3: https://github.com/neutrinolabs/xorgxrdp/releases/tag/v0.10.3
0.10.2: https://github.com/neutrinolabs/xorgxrdp/releases/tag/v0.10.2
0.10.1: https://github.com/neutrinolabs/xorgxrdp/releases/tag/v0.10.1
0.10.0: https://github.com/neutrinolabs/xorgxrdp/releases/tag/v0.10.0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 89a119a2731f906ac2efcc5e51a26ce0ff88bfdf)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{xorgxrdp_0.9.19.bb => xorgxrdp_0.10.4.bb}      | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/xorg-xrdp/{xorgxrdp_0.9.19.bb => xorgxrdp_0.10.4.bb} (65%)

diff --git a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.10.4.bb
similarity index 65%
rename from meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb
rename to meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.10.4.bb
index 533b0801cb..f111c4eed9 100644
--- a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb
+++ b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.10.4.bb
@@ -10,14 +10,17 @@ DEPENDS = "virtual/libx11 xserver-xorg xrdp nasm-native"
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "x11 pam"
 
-SRC_URI = "git://github.com/neutrinolabs/xorgxrdp.git;branch=v0.9;protocol=https"
-
-SRCREV = "d463bad9639c910fadc2f30dac473c7688b11cfc"
-
-PV = "0.9.19"
+SRC_URI = "git://github.com/neutrinolabs/xorgxrdp.git;branch=v0.10;protocol=https;tag=v${PV}"
 
+SRCREV = "2b1f913f4aa6b88d63d9ce9302c61cb0e39483f6"
 
 FILES:${PN} += "${libdir}/xorg/modules/*"
+FILES:${PN}-staticdev += " \
+    ${libdir}/xorg/modules/libxorgxrdp.a \
+    ${libdir}/xorg/modules/drivers/xrdpdev_drv.a \
+    ${libdir}/xorg/modules/input/xrdpmouse_drv.a \
+    ${libdir}/xorg/modules/input/xrdpkeyb_drv.a \
+    "
 
 require recipes-graphics/xorg-xserver/xserver-abi.inc
 

