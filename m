Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web12.11275.1622894998286135683
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Jun 2021 05:09:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d8mBM1zb;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id g20so18653554ejt.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Jun 2021 05:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+3XmNFcy/jOG/Rqht00ZpSGWXd3ZnFAx3SiOvllpVXE=;
        b=d8mBM1zbp8USvcw3QBqXaYUZJVddey4rkYmnWLak1mG03Q4/2mzkTPuyBEVREbteT2
         VGb5AWX5lxy5+3u9IjRSJmeKdhanP9wmHCOHYWeGEM2/LXcNXHYk13F4uv9+cldCNnrd
         hHDxuAiQg7qHqQbzf+0DyqIP6YpsDxXUdbpyO2kkw5a+Gj1v/k2xhARIJLGcDHayZWbv
         cpm57PJugec02ZMjvNAP0x3jtbDWZBPcD7qkwLpAZwhTpko6OqMoDFrLg6xsI1DERtV5
         HH8jmJQAeS2HG+4ZgiKMJ+oIlGDE5w1KfWx4gg1niM3mEjt+oWrGKmm8KYA3p3AawXTy
         3Zhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+3XmNFcy/jOG/Rqht00ZpSGWXd3ZnFAx3SiOvllpVXE=;
        b=SjrIuxVvv8WhuTvYrM4vbHEueXRSZ0abClwBF0mbJp2ApL8z2wb1j1yd0swdNaTwnc
         lJ4ESSjXbNS7RuWh3IeLtKsBqhHmQqlZocx0qRm0pQwJpe+oBIdnm1/WAMThLStqV2tI
         5+O+MB1ECWRyxp1OHgIqGtF89aO3+6K/P5mNBAnnkr66mabAEUmJ9i7eOuNQe/RHsOzZ
         E2ycNvuNGOdKgqKwIUGBscFD/r4e2QYu6d05sB2TMX0qYuSb7pPh1wMiw475U7zIJJ9g
         47th7va1P6PfI9QXBa5P5dk6icR8h1PheBa29M1MLZxVT8HHKpME/gvaFXsLbjws9TAo
         IF/w==
X-Gm-Message-State: AOAM531rDJdlWaf/I+0k+tByS+B6tDKmjjIMMBK9zgToVoGJrR6aCRCC
	8ttfKbOSe2bOnoEs7CbUqQT5lWzBCP3GZg==
X-Google-Smtp-Source: ABdhPJzaf8xnBiRUw9aUjtq/ftVCsl/KMUj3QenpBXeLcda65uNpSRM3GJPd47PztW3XPFMTNYqGgA==
X-Received: by 2002:a17:906:2988:: with SMTP id x8mr9093045eje.122.1622894996923;
        Sat, 05 Jun 2021 05:09:56 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f11f861d707ea86d7bc33dd.dip0.t-ipconnect.de. [2003:f0:7f11:f861:d707:ea86:d7bc:33dd])
        by smtp.gmail.com with ESMTPSA id d25sm3994489ejd.59.2021.06.05.05.09.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 05:09:56 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/5] libqmi: upgrade 1.28.4 -> 1.28.6
Date: Sat,  5 Jun 2021 14:09:41 +0200
Message-Id: <20210605120942.1080733-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210605120942.1080733-1-schnitzeltony@gmail.com>
References: <20210605120942.1080733-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libqmi/{libqmi_1.28.4.bb => libqmi_1.28.6.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.28.4.bb => libqmi_1.28.6.bb} (90%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.28.4.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.28.6.bb
similarity index 90%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.28.4.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.28.6.bb
index c6422c392..f062d8631 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.28.4.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.28.6.bb
@@ -14,7 +14,7 @@ inherit autotools pkgconfig bash-completion gobject-introspection
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "3b14cd2ab5221a7adbb39fed16ef697538ea1c79308821ad2d19b505e1daaea0"
+SRC_URI[sha256sum] = "cbb890893de1dee06ea5ebdac2d22f0469314a6f93f15f61f2f1206a1c9ae5fd"
 
 PACKAGECONFIG ??= "udev mbim"
 PACKAGECONFIG[udev] = ",--without-udev,libgudev"
-- 
2.31.1

