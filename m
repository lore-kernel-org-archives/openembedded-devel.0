Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.23154.1596976524626153742
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Aug 2020 05:35:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EGinBIPy;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id q4so4455199edv.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Aug 2020 05:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BJVgsP2pZT8n8o0VpSU/ChrFgJZatOZENdjKDNuSFZA=;
        b=EGinBIPyzJXBz6zOhShOoSEd3hIab1T6VTXPGmF5N0kN6UWMzEXy4c3ukDJiWlX4Dw
         w41sI7uC4vZLIdpYhgzf3W7ELEuQN6N3DcUU9CoW11Ouo0DVDmLHshCg9/MKm5CjnoFe
         0jShKDjg0W78l9jBjWAoM3vqd3HBP4FJFaTqQ430KLQg2o0KK2HkNTQrPKP60n31KIl8
         hoYuGKWi3yP40YfzxWg/5Eccl/UBiRpXFzcD8GWt/4+EdgL1sZRRsGVYuplnpuWt+ize
         KYKn/gyXu0vue/HjnWawmr87IwoxxjqRyUh5LigrGzHVwDyUzkR4GYqKny3hYhfBCvc4
         uUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BJVgsP2pZT8n8o0VpSU/ChrFgJZatOZENdjKDNuSFZA=;
        b=foBX3tHZhaZviKX77qUXf1rmYLBkw/BbomjthKUms9A1/DJlq+D5yryyPSF+v+rctx
         TmVQ7CylFHS9q9ebfq7bIr7gbpqLqsG+2G3X0PCiLhTOpMCUsTV9oynydmWatSGRCM0z
         K4oNoa2ktzUiQTflivIv+1DJsIlWlDr5bXQ1o2+AlL+SmaR0XkWHxxfKSb+md6q0QJHs
         JJcj2cNuufr8+8XE1o0gD1OUkzDtcWw4pKhM2dwirngPQdmmNUMZkJ71kJq/XqiosSCc
         ZUkFjm+jqt+0nZe4jBVwKRaFisURTV9KdwdGRLRwC+s1Fn5FG1Xr2AGDv8mzq4IXpeWh
         VzUw==
X-Gm-Message-State: AOAM532Hhf/59u2fOxg/eMOHcvbbfXi53xFOhqv5jcE09VCzpbWBDqg/
	49eNQ5Z58nLva1Ylq21HLvamvHUv
X-Google-Smtp-Source: ABdhPJyzz32I7nQvUBl5jYxQkqZ4aEfF3Og/BljHcxu0jwSZUX5xZyNDC3vvbUp3qw7AbY05IAHl5A==
X-Received: by 2002:a50:9fc9:: with SMTP id c67mr17148322edf.69.1596976522974;
        Sun, 09 Aug 2020 05:35:22 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f102180f54bc478636fc7f8.dip0.t-ipconnect.de. [2003:f0:7f10:2180:f54b:c478:636f:c7f8])
        by smtp.gmail.com with ESMTPSA id b24sm10070260edn.33.2020.08.09.05.35.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 05:35:22 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 6/6] imagemagick: upgrade 7.0.9_13 -> 7.0.10_25
Date: Sun,  9 Aug 2020 14:35:07 +0200
Message-Id: <20200809123507.267616-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200809123507.267616-1-schnitzeltony@gmail.com>
References: <20200809123507.267616-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changelog would be > 300 lines so for those intersted see [1]

[1] https://github.com/ImageMagick/ImageMagick/blob/master/ChangeLog

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{imagemagick_7.0.9.bb => imagemagick_7.0.10.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.0.9.bb => imagemagick_7.0.10.bb} (98%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.9.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
similarity index 98%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.0.9.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index 3f7d06e26..804faf02e 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.9.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -9,9 +9,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=41b4fa9af60c88e61484b02c0561181a"
 DEPENDS = "lcms bzip2 jpeg libpng tiff zlib fftw freetype libtool"
 
 BASE_PV := "${PV}"
-PV .= "_13"
+PV .= "_25"
 SRC_URI = "git://github.com/ImageMagick/ImageMagick.git "
-SRCREV = "15b935d64f613b5a0fc9d3fead5c6ec1b0e3908f"
+SRCREV = "8b4e00829eb84d4e7b4da11acf1f98f1e8166e5b"
 
 S = "${WORKDIR}/git"
 
-- 
2.26.2

