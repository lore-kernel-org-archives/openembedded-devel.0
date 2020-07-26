Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web11.25753.1595753495251804658
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2020 01:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=njqRBw8+;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.194, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f194.google.com with SMTP id f5so14045910ljj.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2020 01:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dK/FR8dNaLY8PMas2P7imtOqsbVdCgnmdFNJQza0XLQ=;
        b=njqRBw8+gEdr2M7kpKbT4wW+7TkicN/h+VihNzypsP/aKJQ/GcuoKKLsUugj8Qsm33
         Jbd5NoADSnZP36TdnbylC4lz6JGWAQJWpT9og9CS8mbZtj8mX89zc0M2gmrFOREdGZls
         SdLWNdC+21ZRWxo+kTHHBR84TGfKvOO53c5AB9Xdg4iNVmyFlkp/ZFd8y5USmMmTRWwQ
         Qt8A5YCfc90et4X7X4EYbaIoIbV9jgJ/0L9WtQo+tVhMNeY4UtiUigZtArbDd5LV6pRO
         GdhBn9Gy2EE08+GfJQp6qeMlgA2OOoI3lbF5PCapRT7s6x5U7Rf+QEzJD3WtXxdqrhn6
         77Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dK/FR8dNaLY8PMas2P7imtOqsbVdCgnmdFNJQza0XLQ=;
        b=jE7dt4uxSjZ01LqVH1kc2jsBs6vUug8x/gutfV1ET/VgML4km0lNT1/e7bZr3opkUE
         U+iZvUTkYEPHpFRgHwgyoOSUgskEwp9xnzxz32wdFXF8hx0v+OJya3Dcsbxf8t5qBVdE
         HB8vHoQmZP2Vz01k33TSD43GIwBDzN6uGfobtwgzeVgjLhuHP9B4hoOYExbGiHDlz5Tm
         dJGYOZscHHMe7WpbeQcF83YugM3V7ueDMr8rq+j054DDbPOguF01946SKpOqj9vPRUCb
         mZ+xcZEBm8W6FvXUJzg9GrkIQFxmUB4mxI5FSXTxxQbwrENFZsFdAx+/Hs8nhjJhgMQG
         0Q6w==
X-Gm-Message-State: AOAM530NPRq9PN2JkhkufaVs6YyWOw3rm/jVNgV0oYLfpHsl+xJLzEVD
	rNe9p1GDTMaIzJMFHmA0ynDfWROP8I0=
X-Google-Smtp-Source: ABdhPJyZt9WhU3pHitogQVP4Hyuq+n/3FjILI1VBxtEt02yN5Op0kNYEUyXMqRfJwbye+LmzjXC4AQ==
X-Received: by 2002:a2e:999a:: with SMTP id w26mr2506950lji.242.1595753493140;
        Sun, 26 Jul 2020 01:51:33 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id c17sm2201462lfr.23.2020.07.26.01.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 01:51:32 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] leptonica: update to 1.79.0
Date: Sun, 26 Jul 2020 10:51:30 +0200
Message-Id: <20200726085130.3712200-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../leptonica/{leptonica_1.74.4.bb => leptonica_1.79.0.bb}  | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/leptonica/{leptonica_1.74.4.bb => leptonica_1.79.0.bb} (73%)

diff --git a/meta-oe/recipes-graphics/leptonica/leptonica_1.74.4.bb b/meta-oe/recipes-graphics/leptonica/leptonica_1.79.0.bb
similarity index 73%
rename from meta-oe/recipes-graphics/leptonica/leptonica_1.74.4.bb
rename to meta-oe/recipes-graphics/leptonica/leptonica_1.79.0.bb
index 249e96f168..a6de1f7956 100644
--- a/meta-oe/recipes-graphics/leptonica/leptonica_1.74.4.bb
+++ b/meta-oe/recipes-graphics/leptonica/leptonica_1.79.0.bb
@@ -3,9 +3,11 @@ DEPENDS = "jpeg tiff libpng zlib"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://leptonica-license.txt;md5=34aa579294e8284b7b848c8d5d361e8f"
 
+UPSTREAM_CHECK_URI = "https://github.com/DanBloomberg/leptonica/releases"
+
 SRC_URI = "http://www.leptonica.org/source/leptonica-${PV}.tar.gz"
-SRC_URI[md5sum] = "4f32be9bd2e2c142ba018037ab5d746f"
-SRC_URI[sha256sum] = "29c35426a416bf454413c6fec24c24a0b633e26144a17e98351b6dffaa4a833b"
+SRC_URI[md5sum] = "a545654b1dae7d29e2ea346b29095f84"
+SRC_URI[sha256sum] = "045966c9c5d60ebded314a9931007a56d9d2f7a6ac39cb5cc077c816f62300d8"
 
 EXTRA_OECONF += " \
     --without-libwebp \
-- 
2.25.1

