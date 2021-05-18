Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web09.9119.1621347304203763969
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 May 2021 07:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u6bZPwA/;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id a11so5159345plh.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 May 2021 07:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=clRsfBmLVbAZyq5GnRniNrI8tkmVjBSgh5l4LCGiD7I=;
        b=u6bZPwA/4zvgmwvLMXVBG4jiLM9RiLKkUJYNpywOilU/OSi2SZFIihEg7Jub8CpaTl
         yZYYfl2GL8oKX1gABbzovJW5kKMBeYr7MsIgaVpjJvtlno+V4+nYknxxeDCqEaNeEDpC
         V41m5Qhd8W6/pubeDXZHUhzhQpSf5TDVK9uTAA7KnBhVm766eDYmWyPXyFIW6Fx8pwbW
         P7wV0HLmIup3PmFHjL29CkBaNFlFm/WIEy/n+/y0cZHwdwKCTjpGsN8Q6xM3ZSe5sXuh
         +t9yID3Psgd86V8symEyn1MqDKui/xskE4O7sMVTQibBi7L3KuFn9TiNVLjNi9O3tQPV
         QT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=clRsfBmLVbAZyq5GnRniNrI8tkmVjBSgh5l4LCGiD7I=;
        b=OZpavriS33mZ6N8QM+R5ZL/CVXH3c5VV9KjMcWxto44YPLJ1tc5u9I6RIxhLzpzS/d
         ISYgM4vxq5LJjsOyK9B7RO7vsIENdVB4LK9K6TqhNgB+7fvYoWZhzqnAblTcWPx/bI6C
         247fzmuOhm8JpLcaELstiWr8F2R3Qw9W/mhN8PTFobM5gAmmVG9T+NAsBNNekUKsciBu
         unmDmyybvg+h33VLvup05WMYHnAIYSAYCazgqJLvGAvYi4X3jTu/kgPEXvtsDiUvAi3p
         KhOI5ullvOv+MnHEVNNsGlVlr7UUS+5xeO+gVBgJbC/r0lF5xfbFmp9R9Bd4UuP4wpTt
         dWOg==
X-Gm-Message-State: AOAM531Cng4N63cZA2jpSR5IIBN5+Ep10CuCCVcJMh3MNSSKmK1vjWKe
	WL1lEu3FSzLVWaB7wuVPXTL7zDl5aq0=
X-Google-Smtp-Source: ABdhPJy1/mI3OxIYMN6eFr3Mh9ByvGnTOOPI6Qvix4FQxA3/CrplwAUl+d2JYRJQJpWotgxh1jXFTw==
X-Received: by 2002:a17:902:ee54:b029:ef:8497:e097 with SMTP id 20-20020a170902ee54b02900ef8497e097mr4831226plo.22.1621347303639;
        Tue, 18 May 2021 07:15:03 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7050:e80a:30c5:274])
        by smtp.gmail.com with ESMTPSA id f5sm2103563pjp.37.2021.05.18.07.15.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 07:15:03 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 4/6] nodejs: 12.20.2 -> 12.21.0
Date: Tue, 18 May 2021 07:14:55 -0700
Message-Id: <d460525cd5f5bd7bd0ea9456600d279151cf040e.1621347202.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1621347202.git.akuster808@gmail.com>
References: <cover.1621347202.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Clément Péron <peron.clem@gmail.com>

Fixes :
 - CVE-2021-22883
 - CVE-2021-22884
 - CVE-2021-23840

Signed-off-by: Clément Péron <peron.clem@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 02feb1d9324fba08c5d3055fa34bb6200ee91520)
[12.x LTS version]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../nodejs/{nodejs_12.20.2.bb => nodejs_12.21.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_12.20.2.bb => nodejs_12.21.0.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.20.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_12.20.2.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb
index 6acc36b4fb..b9e3821776 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.20.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb
@@ -26,7 +26,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
 SRC_URI_append_class-target = " \
            file://0002-Using-native-binaries.patch \
            "
-SRC_URI[sha256sum] = "961ad600f0706c396390ebc7767fb01d5e3792a5022dc2e7774796756eec6d3c"
+SRC_URI[sha256sum] = "052f37ace6f569b513b5a1154b2a45d3c4d8b07d7d7c807b79f1566db61e979d"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.17.1

