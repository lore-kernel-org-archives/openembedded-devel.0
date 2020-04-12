Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.1962.1586720027189289374
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Apr 2020 12:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u1HfjUHz;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id k1so1016568wrx.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Apr 2020 12:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=h3PynETRb42XVJfxba8rq+15k4A6k1Zqu+w+wpsHc6k=;
        b=u1HfjUHznNes5b309dgXd/20LoMAFtFo6ZdYgtDI/4kP5OEPkovC1yxJLCHuNAhCGN
         CRrV3eGrUshP74DeQVILy76IEaslh94ri5YTRUGNxRs4U8Yrz0eKJdCF5ekzw2JreAYU
         xOQ+5HX8+ejU0CPkspj7QH5aIzDXGa19ROtxmzIPRsWR7cb2OpeLtvWmxGayKxPoTNK/
         jswU3jumEU2aC2X/e2bXVsru9KsCyhikkU4l1GvnXhOQNHYjMiHLk7NR8uc+ULoz1GeZ
         lI5AlvyZ3x+iQbd9i2toaOvPyVuHjPRMmttXv9adfHFCd5W+8yj/HN2bV1tK8ecJf6xb
         tdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h3PynETRb42XVJfxba8rq+15k4A6k1Zqu+w+wpsHc6k=;
        b=RzBc0Bz8Ra5cx1hSqvf1NFuEHkC9IhtK814nA95ydCVu7qRMGSi58866Tzh+kCKc7g
         x+SG8/KbBozy26yDHpkS86TnNSSw1HuUH3jB7apJuKCpO4g8jimdLKLDoj+YpSH9q7Tm
         r/R/HRFh/YK3WhUciJBS44opZvvTOle00wb4uxJA0lszaUTDslUp7Hfw5fyvj6PZpVWO
         /1LL+SdhW5GBow6K0cUsv2iSmHm51btd9B3e90DyQQ0ai4L6gcuC1EG6TjF526oXb9ij
         15GLJrpqBwvWCMMZx8dbPB75rr1WZ1GiJXRW8735bazTNI2M7yZLe5gAFHnbw2XwahBu
         assg==
X-Gm-Message-State: AGi0PuYCTY2uX1vA5/HmQKIX6MpJVlafpHWhI2s72jBbS59CKpJHJvnV
	HBItiYDIYQ7RlQ5WDOCDIvrmw6utCw8=
X-Google-Smtp-Source: APiQypKGkdmjD9EBZjnE5Ht4fd2RaQzy8CkPM00rNmFH8HRpkAFBiAZ/LQRDkvIv2xndswukdkz48A==
X-Received: by 2002:adf:a15d:: with SMTP id r29mr14479598wrr.134.1586720025632;
        Sun, 12 Apr 2020 12:33:45 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F05DA21F0F62E347B55C3B6.dip0.t-ipconnect.de. [2003:f0:7f05:da21:f0f6:2e34:7b55:c3b6])
        by smtp.gmail.com with ESMTPSA id c20sm12393341wmd.36.2020.04.12.12.33.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2020 12:33:45 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/3] poppler: Add splash PACKAGECONFIG and enable it by default
Date: Sun, 12 Apr 2020 21:33:30 +0200
Message-Id: <20200412193330.16380-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412193330.16380-1-schnitzeltony@gmail.com>
References: <20200412193330.16380-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Splash graphics option is enabled by default in CMakeLists.txt. So

* add it to our defaults to keep situation as it was before
* when using splash follow upstream's suggestion and add boost to depends:
  | Warning: Use of boost is recommended for better performance.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-support/poppler/poppler_0.86.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.86.1.bb b/meta-oe/recipes-support/poppler/poppler_0.86.1.bb
index 073edef86..a6067e634 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.86.1.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.86.1.bb
@@ -14,7 +14,7 @@ DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
 inherit cmake pkgconfig gobject-introspection
 
-PACKAGECONFIG ??= "jpeg openjpeg png tiff nss"
+PACKAGECONFIG ??= "jpeg openjpeg png tiff nss splash"
 PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON -DENABLE_DCTDECODER=libjpeg,-DWITH_JPEG=OFF -DENABLE_DCTDECODER=none,jpeg"
 PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng"
 PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff"
@@ -22,6 +22,7 @@ PACKAGECONFIG[curl] = "-DENABLE_LIBCURL=ON,-DENABLE_LIBCURL=OFF,curl"
 PACKAGECONFIG[openjpeg] = "-DENABLE_LIBOPENJPEG=openjpeg2,-DENABLE_LIBOPENJPEG=none,openjpeg"
 PACKAGECONFIG[qt5] = "-DENABLE_QT5=ON,-DENABLE_QT5=OFF,qtbase qttools-native"
 PACKAGECONFIG[nss] = "-DWITH_NSS3=ON,-DWITH_NSS3=OFF,nss"
+PACKAGECONFIG[splash] = "-DENABLE_SPLASH=ON,-DENABLE_SPLASH=OFF,boost"
 
 # surprise - did not expect this to work :)
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'cmake_qt5', '', d)}
-- 
2.21.1

