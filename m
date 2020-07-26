Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web12.28071.1595767011851825459
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2020 05:36:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=AjUwDuWJ;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.67, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f67.google.com with SMTP id s9so7534538lfs.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2020 05:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e0/BV4xA4+f4KS6Nh5xNCKSzIFouumZfQQNQ0jo2uqY=;
        b=AjUwDuWJREv9Fw1E8QSB6ciakelga7W3a0cJ0aJKQhzRATunGcBi4U9XlRFmdp1+hA
         y6/+/vhbIDNabR5ft1T0VojevUMiHECSKO9TIUZMf/gyYGvxk4MhlQbm2ftTQFH5PBCY
         uDbBuh8GX3mNBToO2BmgA0nsgKQIcBAyESS74HjG+hPOl6XAFmsGfN0JqJ6ZeFId+8Fs
         YxKIHJTuTVMLpJHK8fFfx1E+hzYgQqmfjw9hZYu2elLnc0+K3KRuFueSkdyic3t4uL5P
         JiZtUF88kGIwahD95gHwzfFoM0nC/hkWVlUWL0mqOxw4VasmqhHX//NP0X/9AZzUOMBP
         sc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e0/BV4xA4+f4KS6Nh5xNCKSzIFouumZfQQNQ0jo2uqY=;
        b=cuZwXP8mftvK8aq/haFeRx4dw4UFQdXJ0bB9JYhMqe2JkqHdKrPuSRcn2grdpOtOTE
         k/BvYyKWkNaZwxG8iFAH+1pB5YQ98MmR1jstsJOn1FWIP0vDrRR79gJz69WHYU7Bk6zl
         PyFdq/h++MS4RG419XpRpPpVqoaEehYM8ua9uo/6puKZFoYMO3azzL69nPfoADgIJu5T
         R56poy0LRQtokQdztaeDg2NRc+JNZu1OaS9okE9U4FLHQWkUaavM+c8LdLKloZBXNzoF
         sgd0WffdEMmQwPTeQrXT0y3sahRXU+XZ7HxK6+6+8vBnBl+6dfxhTmP/8qCBbOE5jCi4
         qm5Q==
X-Gm-Message-State: AOAM5311v4wBpFnsYHCgBH+YHqpYPXT3VOHYCWaSdgfmVx135sC+CXV2
	ivh2mnEQPb4P5RNnZw1p3EVh2ZTHYys=
X-Google-Smtp-Source: ABdhPJzxTZ2aNNw9Uo3qRWNW7mRSdBspD7wYGEaAB81Se8NhLYtPl6RbMzns0jkhQ4uBm7d/eL0QsA==
X-Received: by 2002:a19:834f:: with SMTP id f76mr8774594lfd.25.1595767009689;
        Sun, 26 Jul 2020 05:36:49 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id a19sm2321886lff.25.2020.07.26.05.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 05:36:48 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] doxygen: update to 1.8.18
Date: Sun, 26 Jul 2020 14:36:46 +0200
Message-Id: <20200726123646.34005-1-open.source@oleksandr-kravchuk.com>
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

