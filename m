Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.20561.1595723579328165861
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jul 2020 17:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=Tk8+7Ycn;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.174, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f174.google.com with SMTP id 185so3387082ljj.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jul 2020 17:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XqpyIshFRZTjqPg3WYr2My2KZit53vaCjxGBCSAeCCg=;
        b=Tk8+7Ycnl0qOzaqKAK2UQwSh+vyvC4VMPRafv9B/+bfhaLAvKWWvq7AAdSO79K5dao
         /b7VoUych/WpXBbJD2H7DVweoEZ+NB56XdXpBbD64y+WL4HRpsvakmFLQjtXUJhGze1d
         lmmsKACCH6KTq1CSG+RZShDMLvpkSGEqtElQ3gEE2efsJqQ3ijTQ//TS+d9lam64+Vv4
         o8gWhNKgCZOFta3TgPS3bA5/SmEPTveyuiK6/5a/dhqyw8Lu0GGyB7r2yChUCQk7iOGc
         WcPT71ghryz0P9Mu0bKOjHWEbsj9ddZsfr0G3ZnvNR5wiw+sp5JeJ3irDTs9rVWuDBCO
         NK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XqpyIshFRZTjqPg3WYr2My2KZit53vaCjxGBCSAeCCg=;
        b=kK7kkBWXHNRPBcDXBcakp1TEmcaT5zpTJBk/urf3KpGNqudq/R/raSMgYhL+lfob/U
         q/v1qK/0qHV8L2lO8ZE7K4WeUCbl43ZEgPOSmAMj99VhEWrq8qdVKBV9lPsrh9MGSSvt
         NYLpRuWXxX8D6FVBZ0hhNl5OzcglEB6xP+JEsWoJV2BGYjXLDpLAyseQEnuZ5DMNGsbx
         8BLgmcdKVqSH88eMxzwET2dMqG7bV1ZHYzr8/7AhmanRQFOsupWL2LpAIrt0y36awD84
         unB4y96Ksv5K/ZzdgArINcNx5rns4kJemLUX84quPrgY2Qe6nU1MNKkbTG0GXZwH7e4c
         EHoA==
X-Gm-Message-State: AOAM532QJt8rZJGPsesOYe3Tj2VrM3kAl8zTiRBU6dmU+M80ppvU9D5K
	wIv+G7fXUml5dE+CXmhXR002fWMR+qQ=
X-Google-Smtp-Source: ABdhPJwvBIN4DGAN9CgpJUOb/yuxpeBYz2lg7CNSZWRgnTqXk2XUtu+kpZAaUvYUmGOFax9ymTD7sQ==
X-Received: by 2002:a2e:8693:: with SMTP id l19mr6551267lji.361.1595723577276;
        Sat, 25 Jul 2020 17:32:57 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id l26sm27771lfj.22.2020.07.25.17.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 17:32:56 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libzip: update to 1.7.3
Date: Sun, 26 Jul 2020 02:32:54 +0200
Message-Id: <20200726003254.3026129-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License checksum checked due to modified copyright years.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libzip/{libzip_1.7.1.bb => libzip_1.7.3.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/libzip/{libzip_1.7.1.bb => libzip_1.7.3.bb} (71%)

diff --git a/meta-oe/recipes-extended/libzip/libzip_1.7.1.bb b/meta-oe/recipes-extended/libzip/libzip_1.7.3.bb
similarity index 71%
rename from meta-oe/recipes-extended/libzip/libzip_1.7.1.bb
rename to meta-oe/recipes-extended/libzip/libzip_1.7.3.bb
index 1a9cd8f109..e903de3da3 100644
--- a/meta-oe/recipes-extended/libzip/libzip_1.7.1.bb
+++ b/meta-oe/recipes-extended/libzip/libzip_1.7.3.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "libzip is a C library for reading, creating, and modifying zip ar
 HOMEPAGE = "https://libzip.org/"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e33bb117aa55f9aad3d28e29256f9919"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=067e9870bba57e1ce20695c4d5672f30"
 
 DEPENDS = "zlib bzip2"
 
@@ -15,4 +15,4 @@ inherit cmake
 
 SRC_URI = "https://libzip.org/download/libzip-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "a020dc1b17a79faa748e43a05f8605d65e403813e8e97ad3a300a90ddba097ac"
+SRC_URI[sha256sum] = "a60473ffdb7b4260c08bfa19c2ccea0438edac11193c3afbbb1f17fbcf6c6132"
-- 
2.25.1

