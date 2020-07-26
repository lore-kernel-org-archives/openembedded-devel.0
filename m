Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.20706.1595722495903170718
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jul 2020 17:14:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=fkm4IGqe;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.181, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f181.google.com with SMTP id a27so4090053ljn.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jul 2020 17:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e0/BV4xA4+f4KS6Nh5xNCKSzIFouumZfQQNQ0jo2uqY=;
        b=fkm4IGqeD8hxmnbworhPRqf7K7VzyehALMh5Svj25QNE/hPlNo6HVkf2OmbQQtwP9D
         okMA/oBse1Ih1SnUk848xF3a/AcPwGCIcEBVmM7C5/3oou9TKegwDYScylJh50/E7NGf
         GpRVbLledfBrR/C35CK05CVVPPlEsV5plfOvJ+PLAdmXA1rPNeyuvUJNEeJGso0VH5BL
         DTz78XUzNPAtH2q1qORgbu/kZD/9UIwUeP8Y2sr+vOUIwuVOMUFOReH7WN4Uek3bPbrM
         EgueEomVJJS65HHc+uGP6oVovEo8Ry5GRSmU4/KY8IZx0Ys5OSDAYkk/DuMkxw44chVg
         iQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e0/BV4xA4+f4KS6Nh5xNCKSzIFouumZfQQNQ0jo2uqY=;
        b=Tus9NHAmNa2MwoSCkRESCZdrUYJGMx7ER0LKFJLFvDEZIkb74MI9nh/FYHglUpt+vr
         nZdsxoLZxgH8xtrUEiT7JrWTpHjpwF/QoXtyjQmUAAvs83fIi3SY5xk9aFFAwPd3qKd7
         /7PC8GNZok2aH27TBlR2DW/eGLoSliYMgySY0dIs1r7mzEBtsXkPugUeCH/nn/kIzAvs
         07Nomsc5cTabTH30XY/cUowsG5VY3DIr5cRsMCrfNiEz92HVV6xeZSYQsDBJeh6kTi2h
         okjSrEziClGA0BUiuyw4qfymZGQTkaU4mwprGIdTF0cFbKB6L95G9zJ94dOmrDpbo29H
         UJGQ==
X-Gm-Message-State: AOAM531u5It1P/lNCtyuGIlW4++y+DUPIz8zDBqcerLho9DuZ9SNWo1L
	k2KFdU8d43y3Qbw/fXZ0irQBmozFQgs=
X-Google-Smtp-Source: ABdhPJxvCyw9U7wrfbQ5Db3w0X5nxVZb+QuHATsEt9pKlWGn3vHhdW7L4i5azbb4S05o45+UdBHbEw==
X-Received: by 2002:a05:651c:2006:: with SMTP id s6mr6670084ljo.74.1595722493604;
        Sat, 25 Jul 2020 17:14:53 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id z12sm1827481lfh.61.2020.07.25.17.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 17:14:53 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] doxygen: update to 1.8.18
Date: Sun, 26 Jul 2020 02:14:51 +0200
Message-Id: <20200726001451.2894866-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../doxygen/{doxygen_1.8.17.bb => doxygen_1.8.18.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/doxygen/{doxygen_1.8.17.bb => doxygen_1.8.18.bb} (79%)

diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.8.17.bb b/meta-oe/recipes-devtools/doxygen/doxygen_1.8.18.bb
similarity index 79%
rename from meta-oe/recipes-devtools/doxygen/doxygen_1.8.17.bb
rename to meta-oe/recipes-devtools/doxygen/doxygen_1.8.18.bb
index 45de718265..f3562b54fc 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen_1.8.17.bb
+++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.8.18.bb
@@ -10,8 +10,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.src.tar.gz \
            file://0001-build-don-t-look-for-Iconv.patch \
 "
 SRC_URI_append_class-native = " file://doxygen-native-only-check-python3.patch"
-SRC_URI[md5sum] = "7997a15c73a8bd6d003eaba5c2ee2b47"
-SRC_URI[sha256sum] = "2cba988af2d495541cbbe5541b3bee0ee11144dcb23a81eada19f5501fd8b599"
+SRC_URI[md5sum] = "eda8e82fcc58970894029b0399776cb5"
+SRC_URI[sha256sum] = "18173d9edc46d2d116c1f92a95d683ec76b6b4b45b817ac4f245bb1073d00656"
 
 inherit cmake python3native
 
-- 
2.25.1

