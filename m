Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.30589.1629985439989282100
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Aug 2021 06:44:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=moTdcTrV;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.170, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f170.google.com with SMTP id j12so5174860ljg.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Aug 2021 06:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aO9gZlkCKGu3Yics2HaZPhbjjqqurXvyYp0sFBhf+BE=;
        b=moTdcTrVlWQdQvR/i2MQLyrMUFnF7RMIPHsK5wBFkNnpJCVDsBoHoBmnnrJqZztjoB
         Uc/R8okZiFcmHqIpr8tCsj4DX1totALnyw0p1yvKUaUhMxfghxepeOtSiXa9PcQnPhgx
         MGJvBjhG2OzkfeyFAm6Rp6G24mIgX8W7WiUbF598kQxw8YAV8DAZDl2LKyguA5zLcT2Y
         Lgg+Cc0QMpCwtL/koaeG5PwHrqpVCKEub7c2KbxIc8hcsfowbkdDxQmDEkVVOCqC336z
         M3f924AnBYuo3bg/hESYq5Aqn7wxGAvGONFucIgvnscMf+JJa92TT/VCfE22pPeZtvDm
         EU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aO9gZlkCKGu3Yics2HaZPhbjjqqurXvyYp0sFBhf+BE=;
        b=PpJp+GCoeG9Vt5Zj8ndhj5gGpTcEm8k/1StYicQzzc3Ts7BQcu+Tp5RfN1BsdU9S0s
         O5Mqiy+gYyBcbzAPCT+88xKjhvMMUL6nj4E7vU7hBgSLD6uKnYmfx5fzTCLzRf1u7aa2
         45k0ljAT7vs1vLCFvXkEEdAkL5I2DbM3M9ZwUiJXFb59lpARpt+cCvAJ1gst4MnfF+sN
         KnPEt4TpFvsGp5def8RzpeM9CbemOjSiLPDKUhmJHY7fPwE9eYzykM0jD/Kh9lTHVN21
         jZdzRY6kUrvookit78wNM2isJvpIzLNvgx/OWHZ5R9uNiou5QcDzGvfv84EM0GlOEwye
         d48g==
X-Gm-Message-State: AOAM531LvNuJGBC8HisnO/5s3vKLxQLRA4otI9zg0zD971uHFxe+rCbw
	TM/hBHd2XyjJytlI5bb4TIaQt3JFrA0o41uz
X-Google-Smtp-Source: ABdhPJwIVbcazYpYL+Elqx/WdtBcGiD14W33xJaQnsRBWEgb3CYgdh4R5wi59utHi/McAkfytUw61A==
X-Received: by 2002:a2e:2f04:: with SMTP id v4mr3078797ljv.43.1629985438050;
        Thu, 26 Aug 2021 06:43:58 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id p18sm327571lfr.12.2021.08.26.06.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 06:43:57 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH 4/5] font-bh-lucidatypewriter-100dpi: fix UPSTREAM_CHECK_REGEX
Date: Thu, 26 Aug 2021 15:43:26 +0200
Message-Id: <20210826134327.2535535-4-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210826134327.2535535-1-open.source@oleksandr-kravchuk.com>
References: <20210826134327.2535535-1-open.source@oleksandr-kravchuk.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'-100dpi' is part of the package name, not version.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb
index 9d0dc99c0..557eeb17b 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb
@@ -10,6 +10,8 @@ DEPENDS = "util-macros-native font-util-native bdftopcf-native font-util"
 RDEPENDS:${PN} = "encodings font-util"
 RDEPENDS:${PN}:class-native = "font-util-native"
 
+UPSTREAM_CHECK_REGEX = "font\-bh\-lucidatypewriter\-100dpi\-(?P<pver>\d+(\.\d+)+).tar.gz"
+
 inherit features_check
 # depends on bdftopcf-native -> virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.25.1

