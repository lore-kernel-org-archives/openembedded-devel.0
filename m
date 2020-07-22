Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web12.487.1595457267133148040
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2020 15:34:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RpJzG5Ku;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id a1so2977128edt.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2020 15:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GjX1Jf9sHGsJQM3HrEGpcXzMolLaeI6AEDUV1vVk8AM=;
        b=RpJzG5Ku2rSwmswsg2KHkfj98O8+Yx+xEJS4EsOTjVUBpjo0f2soe1fYqJtvlTFXLT
         pXQDbdMi5bWh1bd8iWLQwI0Tioke80bPhl5X5ypsdYffbVbgB1cZAOHfr+bgMJC4HuIY
         WhN+OrYwFKtxVS1lw+d95XKLdXZFn6h2TbLXXEES+4LnY/mSGGefvaZC4Fuc4tAr6zAn
         4Gd8CLw+l+fcHI2YFyDL5Le7y5/Fd2jBeS0WoU4HK6Dr1pHCMuljKwRr9uIdCUu+2pPO
         qxEoFNiktAPGaBcJhFNSGN9u+Zym+Yvq+kiGtClb4ZLNGPyTXaiWHON5za3IplL6e540
         XtXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GjX1Jf9sHGsJQM3HrEGpcXzMolLaeI6AEDUV1vVk8AM=;
        b=Fv0eDUjudwaGDxX0AlSArxEvuCH8FFz/eeLkh3yhM+yrcDwGlzhep9khIuUoROfZLl
         cctPwlNpHYoE1XnUxw/fQtqw+/bykXhzDsDDERswUe6FLW0iGO41Ta36r8qArlaGlBOq
         Szpa9bs54BBelfGPm0CNdu2GKDLsvzyd1uAY9sehZ+kYYMa5POIrTH/nDJM6P772fL33
         xxrnASszD+1r59yw+ernc/7cLJhk3fCwyxbbmrI2TS+DGZBdYF/jIecKOotniwPWV7Pn
         0z4uY6HH0di7xlsYP+Ie2hvvfJ2Bgsfxk6Eb8uruDsTVQRvOaUY/xHZ5gGX9CqI3NQsr
         XwEg==
X-Gm-Message-State: AOAM533Ht8js1EHPvj4DoePUL614hcoH1yOnvUKlpc4itsQpMje7l0D1
	LKDGikUsgd0VI8GCDeGgzq9F1JLe
X-Google-Smtp-Source: ABdhPJy3PHQzhWw26JdyPtrMflARlm4Oq4U2nw0Cn+0BDmFccwg5vQlkgE574A678s7gSdW26UU22A==
X-Received: by 2002:a05:6402:2d7:: with SMTP id b23mr1544277edx.145.1595457265173;
        Wed, 22 Jul 2020 15:34:25 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0b6195abb66966ead5e06a.dip0.t-ipconnect.de. [2003:f0:7f0b:6195:abb6:6966:ead5:e06a])
        by smtp.gmail.com with ESMTPSA id t20sm643527ejd.124.2020.07.22.15.34.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 15:34:24 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/3] xfce4-time-out-plugin: upgrade 1.1.0 -> 1.1.1
Date: Thu, 23 Jul 2020 00:34:14 +0200
Message-Id: <20200722223415.8963-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200722223415.8963-1-schnitzeltony@gmail.com>
References: <20200722223415.8963-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 1.1.1
=======================
- Do not enable countdown when configuration changes (Bug #16118)
- Add lock button to break dialog (Bug #16317)
- Update URLs from goodies.x.o to docs.x.o (Bug #16179)
- Translation Updates:
  Albanian, Arabic, Armenian (Armenia), Basque, Belarusian, Bulgarian,
  Catalan, Chinese (China), Chinese (Taiwan), Croatian, Czech, Danish,
  Dutch, Eastern Armenian, English (Australia), Esperanto, Finnish,
  French, Galician, German, Greek, Hebrew, Hungarian, Icelandic,
  Indonesian, Italian, Japanese, Kazakh, Korean, Latvian, Lithuanian,
  Malay, Norwegian Bokmål, Occitan (post 1500), Polish, Portuguese,
  Portuguese (Brazil), Russian, Serbian, Slovak, Slovenian, Spanish,
  Swedish, Turkish, Uighur, Ukrainian, Urdu, Urdu (Pakistan)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ime-out-plugin_1.1.0.bb => xfce4-time-out-plugin_1.1.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/time-out/{xfce4-time-out-plugin_1.1.0.bb => xfce4-time-out-plugin_1.1.1.bb} (67%)

diff --git a/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.0.bb b/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.1.bb
similarity index 67%
rename from meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.0.bb
rename to meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.1.bb
index c3de5964d..f4ef3f626 100644
--- a/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.0.bb
+++ b/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.1.bb
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "afa0ef865a49f28165098d3fe625df44"
-SRC_URI[sha256sum] = "ee4a51a35076d50cba3824079f8312585373ff2f0d9ebc740d8f3c0426430a19"
+SRC_URI[md5sum] = "3087b3248e427822613e5583784b0ac0"
+SRC_URI[sha256sum] = "194dbeb8751d8aaedf3850a7a9c770f09d32316a99683cde34d7d0fc5bdba31d"
-- 
2.21.3

