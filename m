Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.12034.1612990556634509409
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Feb 2021 12:55:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VmAD1a8T;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id u14so3130346wmq.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Feb 2021 12:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=b8ydV/NKhyx1DmnNjvRvzWJD7Eyig+QrZSI5n0vzrBE=;
        b=VmAD1a8TncR4AZIuZCbboZy+YRx6/3NXxTYBXLpgEncyCYre/+yLuR1hrDuKYW2U0D
         s61gzCurbwi1bADyGoCUfjN9ippfeFEvNXJYh+1seYRVoPPo+/bQFLbTeet/miuHucUR
         FN6xxnky21gnfyoNJiEYRiD5EB5yBUXKDBqMmII0CC20wEleRRbwAlfhe/wqqQYw9PYy
         2lJnuYaMmWNZYoJiVac7NJgVXLlPTEwsyiX/lv+O60t4ODk0yfxtmH70puH7PWiki59S
         x6wOkmLcvoVbq1/sQ/sd1Vj79Qg+2fJHuQPNyVFmm6VpPo4MjNZOs5L7jffBqlRPvoxM
         KjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b8ydV/NKhyx1DmnNjvRvzWJD7Eyig+QrZSI5n0vzrBE=;
        b=as4iQYRGb00tnXF/0nxeNyjW7L8cGGGZfCpY8SXJdFqzxXys+IV3Qpa8+dZzipsbn6
         zG6PIfT6rCujJhthx1wvgNond+WXvixiGZaM4Se7HvuFaHXQe5l2qq8hfE2XeOgzlSbm
         RP1Ls4ZPzKXiPDVcHgYS7hYw2SJZW1eInC1JAOYFrZrIF6D2WB3p6a32wT0n4Vvd02IV
         YZh7IOkhJO4UHgk/jtY7Hu9KVueOuvB9YKjial+J56c46QcKR3Gxo9jNDSUL8hc37blF
         o4+PEiQ9LrlwPck8vWYJrhbODG29n5NPNrguKDlAAPDtsW4qUFxWyrQlnQAn/YKaNDdX
         J5Yg==
X-Gm-Message-State: AOAM530xq8hNLLIrLyR2fdihrD7xLC4oZXVFO6WXV8I2eWkMaXU/CQT9
	48S1KzUDmFC5qbkPa2JYRNnP3vbSXsY=
X-Google-Smtp-Source: ABdhPJzbWpjRS4r/XsuL2OF7XIiKf61EIBelncFL+HJOc8VNm7DFOK/3DymNZmjPWlg30gGQrYmc8Q==
X-Received: by 2002:a7b:c3ca:: with SMTP id t10mr880400wmj.138.1612990555255;
        Wed, 10 Feb 2021 12:55:55 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0b5b377382ef15aac10120.dip0.t-ipconnect.de. [2003:f0:7f0b:5b37:7382:ef15:aac1:120])
        by smtp.gmail.com with ESMTPSA id t126sm4521167wmf.3.2021.02.10.12.55.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 12:55:54 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 06/13] gegl: upgrade 0.4.26 -> 0.4.28
Date: Wed, 10 Feb 2021 21:55:31 +0100
Message-Id: <20210210205538.690009-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210210205538.690009-1-schnitzeltony@gmail.com>
References: <20210210205538.690009-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gimp/gegl/{gegl_0.4.26.bb => gegl_0.4.28.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/gegl/{gegl_0.4.26.bb => gegl_0.4.28.bb} (95%)

diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.26.bb b/meta-gnome/recipes-gimp/gegl/gegl_0.4.28.bb
similarity index 95%
rename from meta-gnome/recipes-gimp/gegl/gegl_0.4.26.bb
rename to meta-gnome/recipes-gimp/gegl/gegl_0.4.28.bb
index 6ac1e6ca9..810036162 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.26.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.28.bb
@@ -26,7 +26,7 @@ SRC_URI = " \
     https://download.gimp.org/pub/${BPN}/${SHPV}/${BP}.tar.xz \
     file://0001-meson.build-Give-note-if-sdl2-was-found.patch \
 "
-SRC_URI[sha256sum] = "0f371e2ed2b92162fefd3dde743e648ca08a6a1b2b05004867fbddc7e211e424"
+SRC_URI[sha256sum] = "1d110d8577d54cca3b34239315bd37c57ccb27dd4355655074a2d2b3fd897900"
 
 PACKAGECONFIG ??= "gexiv2 jpeg libpng librsvg sdl2"
 PACKAGECONFIG_class-native = "libpng librsvg"
-- 
2.26.2

