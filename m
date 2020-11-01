Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.16946.1604246749816912044
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Nov 2020 08:05:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=kiv8fYv1;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.66, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f66.google.com with SMTP id h62so2321840wme.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Nov 2020 08:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=veYS+x+hm7VCNzec8UAEwebZSTBCKXnGaWDjmPHid+c=;
        b=kiv8fYv1fcyo48dVoyOlCeB66ZS2sfEi3Uhk5PDxbs6x5OJ2YD0ewQ5NIeeb13SyJd
         4QcgGp5pIZuQhkLFRnFpY4X6/ls+O95rS8kvzzA9DzOpOuAAQfjcbbQ6hn4/ajx6vllR
         M2VQXhG1OATgTCz9OYiOXbD1Q1VLTxwp1A4RWauqQkN1x4XG/vrXHK5ZM1gGILrYB9dS
         YUwOfZAveaxrKJ4MhhN5stqfdRbAva/DawC39Z7oPjzjq8ypTx+kWmpFuv+QYjQqSokT
         MqSwTTt55A0owCjI/qoqyYsPHP5bx68Scz8cinbGMxPOQPw45yM4/n0Fdmb68OnEXa37
         81IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=veYS+x+hm7VCNzec8UAEwebZSTBCKXnGaWDjmPHid+c=;
        b=W+9rNOccXiHBX2rgw9Fnks5ljNttBvZyfiPd0nUXwux9QDQxdELiCiUBwO20h3Y94f
         YSk33O0EplZUaH+LjMyC0Rm+HOK8fuAwCINLxFgZqy/TZ+jsynSE2SHC/UY7pchQYRFW
         Sk49RGQoeY4kfvE697bd0BxqxWd/tv04NXMr0xr54DST867OBqcbORYLY4vqDLZ+lNBT
         j9DUTI4OqJ52+mxtFRo8Y/y2aPUDP4xXEPy12cSQPKLgK6Tsf3yd028t5oUNgBBsZX/2
         Y1p8Xw2mcaMGXoxqrBHzyMSwW7cHODiYP9t6bvN7K0pc1d+VEZt5yPk5+dR5FOoAZOti
         lpeg==
X-Gm-Message-State: AOAM5330+287vqIn7coZxJWiEGuDEyHJueUDce8P4TRXPPQ+hbCLqBjX
	115T9o6UqaWx59yygXs+r29w0w==
X-Google-Smtp-Source: ABdhPJyImw5H+l2dNhbgt5Jfrhy65aYCnJoCpkoDQttbJ9dmtYzABXDxnHqESwA+bKNHxAAo0Hfm0A==
X-Received: by 2002:a1c:1dc1:: with SMTP id d184mr13175515wmd.169.1604246748236;
        Sun, 01 Nov 2020 08:05:48 -0800 (PST)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id z191sm12438623wme.30.2020.11.01.08.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2020 08:05:47 -0800 (PST)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-oe][PATCH] libgpiod: update v1.4.4 -> v1.4.5
Date: Sun,  1 Nov 2020 17:05:45 +0100
Message-Id: <20201101160545.15697-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This bugfix release contains a couple fixes for C++ and Python bindings.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../libgpiod/{libgpiod_1.4.4.bb => libgpiod_1.4.5.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_1.4.4.bb => libgpiod_1.4.5.bb} (89%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.5.bb
similarity index 89%
rename from meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_1.4.5.bb
index 6433675ca..aec50e7e6 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.5.bb
@@ -5,8 +5,8 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
 
 SRC_URI = "https://www.kernel.org/pub/software/libs/${BPN}/${BP}.tar.xz"
-SRC_URI[md5sum] = "064c2627397e6641c52de09a26951112"
-SRC_URI[sha256sum] = "f1cda2789e6a13a92aefc012a76e5a7cc57a1b402d66f71df8719ee314b67699"
+SRC_URI[md5sum] = "0da9e11dcb0ac0149967b0c4d3ed9cfd"
+SRC_URI[sha256sum] = "a041b06907c956dd1c77836cccf4d392af29b9fe09c8ad18449a6da707b5ba2d"
 
 inherit autotools pkgconfig python3native
 
-- 
2.29.1

