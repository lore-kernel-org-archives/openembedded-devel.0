Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web12.18145.1590941825237042891
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:17:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rfuwBsMP;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id bh7so3251067plb.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Q+aNTwroXWXecvgyCTEn5SRS5mWo8oENMHk7fg3lcYE=;
        b=rfuwBsMP3KVAkQWJ/xMn66Mg7vogkF9LfdyzgfvmwsCnbcevSKiqGMZlMbIBdBeVQY
         9rhW+kF0QI2amL+Boodri319ifLJN088B8NeCOMDmPkK/aSN4MashEHegWf8tYmPqMta
         JJ0wssuWjBNm171Ylh7AKJ+Y/D6lq2a0C4PZutcl1cdukbhvY0cvmCzfSYZVFcUhRMWh
         gHsAyihqjXJGz7q+5YTmRuncMJkKwTbsUzyu1c534AWHCRR4qTWz0nJyBhYPlQ0sfsV7
         lcVqA79ftLykCOvXYnIez03uHSGVFv3zo+wnQZknleH7ZjEncgQp2IB57XOSUyiqFeTD
         TU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q+aNTwroXWXecvgyCTEn5SRS5mWo8oENMHk7fg3lcYE=;
        b=lXzFRWrJPOP+HNi4wywEJQlMkISxgSgfKLkQ2PYP3CNj02sj42uid6ZqRZF6sq5t/c
         ww25I5/Mv8r1dUFdxV9rWGZDnSbzRsPltvQeQhRCh3064Pa/xTb6b2UBTiJBFtWlOHFE
         o+J7Ezw3+CBN+zUkY84bvq3n1xxY85kA8OomPpwFQRaPwop+X0KC9MNM9L180o6zs/Tz
         RLlBs1iESI9qbxoNveaDsW/OophL3J53+9lhvR1XIo3MCRb8Bi7o0+JZDK+hANirCiwg
         Xz4hl55N+xKmIp0+V8qiQWFze+fa592vBMCzlyBpJIWoWRDoQEULDIc0GSaasYSLEz6P
         CdAQ==
X-Gm-Message-State: AOAM530/dujkMvVgRNTT8xxkX1Ohpw9/RXQq5c0utptj5CiQtjJHkAuv
	P3umVGIU8z+SMivDPw/7EKi/9y0D
X-Google-Smtp-Source: ABdhPJwAvPW+qTAjUw+Zez2oS0xWKerkPHntlWn28rlOToPS+IOtKoe5JggHeWZ1jH1Exg4MOS0G0w==
X-Received: by 2002:a17:90b:1082:: with SMTP id gj2mr20084126pjb.225.1590941824653;
        Sun, 31 May 2020 09:17:04 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.17.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:17:04 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 35/35] thunar: upgrade 1.8.14 -> 1.8.15
Date: Sun, 31 May 2020 09:16:22 -0700
Message-Id: <cc155826b0b4f202a8fa4ac103b7c38368d32734.1590941674.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590941673.git.akuster808@gmail.com>
References: <cover.1590941673.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 713e70bd253310dcfa77709df163c7898bb401b3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../thunar/{thunar_1.8.14.bb => thunar_1.8.15.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.8.14.bb => thunar_1.8.15.bb} (84%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.8.14.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.8.15.bb
similarity index 84%
rename from meta-xfce/recipes-xfce/thunar/thunar_1.8.14.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_1.8.15.bb
index 499c831528..b1f1c967af 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.8.14.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.8.15.bb
@@ -8,8 +8,8 @@ inherit xfce gobject-introspection features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "24218474191ac4c7e907d5b6fd6f1831"
-SRC_URI[sha256sum] = "8ac57b1f5842d5bd348bbb6dac4714f5ad1f22de651d8ec6a7099ceb19fa219f"
+SRC_URI[md5sum] = "303010f4959fa23f7c13c0ccd9b8527e"
+SRC_URI[sha256sum] = "7624560cf21f13869804947042610aab22075146b711593f11ceb9e494277c93"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[pcre] = "--enable-pcre,--disable-pcre,libpcre"
-- 
2.17.1

