Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41854CAC5B3
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:06:51 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.14109.1758625607682219292
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:06:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XcXUaI1w;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b2e173b8364so297201866b.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 04:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758625606; x=1759230406; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KpJcs3V42WUAMUayCfHkoxdK0udPFi2oXch3j4cQ+nM=;
        b=XcXUaI1wlcyt5bHrWKtUjTGX/JRZpR82CLnXQ9KIk2efieggJE1/vTFTDKmS1QYXUM
         5cjP8ypzsuDk3xPARUuTSmqyTxanKuR6ArU0Srcp2URdZt0mFA4Rzpg021MfCe1G54t7
         eltv/HLkKZjvIkYuW1cgNyVAPntGibeJkvFbx9YXrirQEI/l7jKe/aleAHRGVEMTvn1u
         /2Z0a2kS2oA7/nUGI8vzX0mIVmvDAu1OYyzskzBAojK01SN4hBjLEYsgN+732RN9Mfh5
         TDVO+wUYlAwN8KwFg53ptdKjmdfvciM8LM/TqMZ6ZDO814/CDKet/e6jeeZBG2H1TTCp
         auow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758625606; x=1759230406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KpJcs3V42WUAMUayCfHkoxdK0udPFi2oXch3j4cQ+nM=;
        b=fDtlaDG+ZMDmbfg9CoEHzw29yMHAdkS+5FPxhJZ0R5XyepmPgpQjHApN7SKT3C8FhN
         xnY9efoU6iRnRDK3S62/LN51dp+YipwAIpsMlAZylpO1q4+U8NDFsEPTVxvfAx+nmHQz
         ziFE8+8c969ymq5ztFkNXJ9DQAOSjiIIFVk3dzLiFFaph7UHjI/wqeRDJBe2kDez8O3P
         BHDQx20aoZqn8TNGI2TcLMHw42O1phhXJY5jr7mHMWJhKYaphI5EVLgFGJ5cGABsnx06
         eHnt4WvWfC/w2RP4sNBoGsZ3osn6A5j4L/dFqR9hletr2fzEmEgMr888yZ60jS70+ZC+
         Aczw==
X-Gm-Message-State: AOJu0Yz5uELBkYGCQ4HbAurAr0SNcQ63uKowSzEfd/3PINFcbfmWn56F
	ykjNZ2zRjjDv1Q3ueTQKu0qDkREUKpfC7H0+QjBm6FDgUDh2MQtDP6pqk9Dr6w==
X-Gm-Gg: ASbGncuGcBEf4UTs99KPSjtA1RbspfAJ0yHOjtlBVsZwDRK6681eXoKHMeH+dYzQ/2T
	HGiMlL6wh/VaQiBb+u+xQwa9F0F+jdrYCtAMo6aty/Jtj2uy7Dnt2mqmewJYqFVRTEvlVRWTlNb
	3VE6EzN8kNmy7quhFOBm+XsWDSaeOWb7NGwIFMGpiexH2ZdRs7NkVkewI0XvXgfrHcZHA+qOPAd
	BlJUgBuOwTpUmAHQDVHGInOmCj9QsyrCywy3ubrsbH2QYAhKpzy9JEtug6udXe9kZRaKj5iBwG5
	BAOt+lnxbBLspK9VGMFF4mOK4YdYJjInVSUrE5I6v/jcxJx4hQV/o7HfaC6fTDX7f2h8RGmdSSv
	FEGvOFFc25CSso0cc8JVpVaLoYLWGuxQ=
X-Google-Smtp-Source: AGHT+IHCoHR+CTC4Gv4gvndm6DMO2H3oL8UZbs8pG+31fYRw6+ExnlXaR93pJ5YRkQ44Vs2KLOfi/A==
X-Received: by 2002:a17:907:d25:b0:b0e:8cd4:e2d3 with SMTP id a640c23a62f3a-b302705ebc2mr198010766b.19.1758625605935;
        Tue, 23 Sep 2025 04:06:45 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b293fa07816sm709263166b.50.2025.09.23.04.06.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:06:45 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 13/22] gnome-bluetooth: upgrade 42.1 -> 42.2
Date: Tue, 23 Sep 2025 13:06:27 +0200
Message-ID: <20250923110636.3413021-14-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923110636.3413021-1-skandigraun@gmail.com>
References: <20250923110636.3413021-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:06:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119677

From: wangmy <wangmy@fujitsu.com>

This version fixes duplicate devices appearing when bluetoothd restarts, as well
as the discovery not being updated correctly in that same situation.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a30bc18ffdc137823d13824af5400bf0e8517309)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{gnome-bluetooth_42.1.bb => gnome-bluetooth_42.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-bluetooth/{gnome-bluetooth_42.1.bb => gnome-bluetooth_42.2.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.1.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.2.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.1.bb
rename to meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.2.bb
index 7f6cf84dd6..df0c33ca9b 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.2.bb
@@ -26,7 +26,7 @@ inherit features_check gnomebase gtk-icon-cache gtk-doc gobject-introspection
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-SRC_URI[archive.sha256sum] = "d9fe5d673f27a40a86a9e23d93cb99367e7b06df51872e8ac5ecc9938e55b5eb"
+SRC_URI[archive.sha256sum] = "8ce8ecfab28272db1830a63f08f9ccb5304734d1be2dbfce795fe4029e629f0c"
 
 BT_PULSE_PACKS = " \
     pulseaudio-lib-bluez5-util \

