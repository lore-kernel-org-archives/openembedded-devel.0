Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web09.2944.1606767797514230764
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Nov 2020 12:23:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=p1ROnkwF;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.68, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f68.google.com with SMTP id a6so784982wmc.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Nov 2020 12:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LRKLuANylQYQQ+OxeYDsfWNnNkpx+UW5i2rfehqJhNA=;
        b=p1ROnkwFDUu5tC7Rh1+Xa/7vG1JL0aZhlXu1y59zCQC8BrliDJWaT9wB2dA1rhTRkz
         u6pp6VOyq1+A0HXu5CYCbkVGe211dcCxWDE4/UnleJegvIypvSqJ+cZnD3N7A2vSoQrJ
         A75ThAJSXTeoOB55FLfOwDqugKu6Zx9chrj1W1NnWLodvQH+3Urxrx3anYynF+b4BRwP
         Sd199dfSKm9sFsS4VaFOyInYql33WBmVBABFfK8wI6xpixpXBJoHaW/g+93gQlZAWXwT
         HJRbC5XJCwh/b4LJLvVQjYzRLZ26jKZqmxFymDrlIadxLBsEMK5OyprZ13Om8BF9uYyE
         GZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LRKLuANylQYQQ+OxeYDsfWNnNkpx+UW5i2rfehqJhNA=;
        b=hDj5zd9ArNPqJ+CeE7em0XXRgh/8tlQqmkLqOsSAd7Uqy67N0K3guIl/fVo73ExuW4
         hMulCqh2Jl7LpVZzKk4yZFkeebh/YusvXDUJEwOB5Lj2hRN79AUuvhoPm/pmusdd312S
         1zJFeuJcvj90AqEKFnVnBFoV05QUGoR7uR/Kw2mE5mTbrNS0tX3Q2W9ce76QOcqHN7kz
         x/YgDDJVU/FrYcxIj9Xa0XVpW2R8n/WUQ89I9oFLYKP3S9vBLEX7WDA4McaFKKqrQbM+
         mKSB6Qule/QVe3vcYJ8VURtUrI7iItyDCjU4hL+lVgRNMRB9Rwy7nVxiXEtm/Ax+ovQ+
         rYAw==
X-Gm-Message-State: AOAM5319WVw5NqhMtz7dAHHSa69TuriczVQcXpjUsTs2FVBUsfXGyyod
	2YHRGqlNJqhTXegv61/y+JPFGw==
X-Google-Smtp-Source: ABdhPJz7D1aG0zW+Y46BPAgWkwBcGiG/CG6/Ya7j7J90nt1htr5SdSeBcugSz7mEIF5kFFZMmd1HCg==
X-Received: by 2002:a1c:5f8a:: with SMTP id t132mr566749wmb.121.1606767782913;
        Mon, 30 Nov 2020 12:23:02 -0800 (PST)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id g25sm530140wmk.5.2020.11.30.12.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 12:23:02 -0800 (PST)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-oe][PATCH] libgpiod: update v1.4.5 -> v1.6.2
Date: Mon, 30 Nov 2020 21:23:00 +0100
Message-Id: <20201130202300.16984-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We're now by default on linux v5.8 so the GPIO features supported by
libgpiod v1.6 are available. Bump the version to v1.6.2 and extend the
recipe to depend on additional testing packages if tests are being built.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../libgpiod/{libgpiod_1.4.5.bb => libgpiod_1.6.2.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_1.4.5.bb => libgpiod_1.6.2.bb} (87%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.5.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.2.bb
similarity index 87%
rename from meta-oe/recipes-support/libgpiod/libgpiod_1.4.5.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_1.6.2.bb
index aec50e7e6..c0cf54589 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.5.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.2.bb
@@ -5,12 +5,12 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
 
 SRC_URI = "https://www.kernel.org/pub/software/libs/${BPN}/${BP}.tar.xz"
-SRC_URI[md5sum] = "0da9e11dcb0ac0149967b0c4d3ed9cfd"
-SRC_URI[sha256sum] = "a041b06907c956dd1c77836cccf4d392af29b9fe09c8ad18449a6da707b5ba2d"
+SRC_URI[md5sum] = "4765470becb619fead3cdaeac61b9a77"
+SRC_URI[sha256sum] = "c601e71846f5ab140c83bc757fdd62a4fda24a9cee39cc5e99c96ec2bf1b06a9"
 
 inherit autotools pkgconfig python3native
 
-PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
+PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev glib-2.0 catch2"
 PACKAGECONFIG[cxx] = "--enable-bindings-cxx,--disable-bindings-cxx"
 PACKAGECONFIG[python3] = "--enable-bindings-python,--disable-bindings-python,python3"
 
-- 
2.29.1

