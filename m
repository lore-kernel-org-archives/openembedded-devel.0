Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web08.8015.1630070584589165806
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Aug 2021 06:23:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=Mw65KwcS;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.45, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f45.google.com with SMTP id c8so1763868lfi.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Aug 2021 06:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6eFA08cXF9koUoS71ydcRO4RQyptYftBICleu+U+Xo4=;
        b=Mw65KwcSpjpYrssi6xBtrKIKCYq2EaYphT6TWh57+U/R2uXGzLmxpz5Rfpefn/Mrlu
         rxEJGMewUWddE+Zu6kc3JzEBbASFsXjBj12f8oxLkGlTuYigU5qeQdGyhmfIa10bKwWD
         epCgVGVOPiGBbpRfD5D1pQVL7FRFTsY5QAjoxw3d6UPR2gbHLokMFD0B2KnXP3yqKzI+
         TaJD1ZADrt2TQplRo+hWZgZJQ8OUxXmmraNwcuUxFJiSn7LwJr5JvIqKWe2BDOJatCRw
         LeWu5MC/Br+wpABPO8sF4a7qCUwzD8/HAFZ3x3oBkOZo2aT2qyVaq1tZB70RpHnfIjUq
         Fpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6eFA08cXF9koUoS71ydcRO4RQyptYftBICleu+U+Xo4=;
        b=kicBwDgP0ID3Oj205L/bElcET6xFR+L36QHuGIBDPyL2zydrLNZQSqnvNYeOu5uP6W
         G0y3aC9EYs2pgpExCG3f4CQqZcc7pOl3qb/C1v0AzUVz1nK8YgdvPmzi1lZVqkQf4gGE
         fG4djuoIJWM9v377phIpIMiPQg4KF/sZWRl05h1B5vbdC4u5uIOhdPnJ5Yc2hGjewrQV
         lTZT6Vxmt3VA48aL+cfnbNRK0zgZEEJLVHi8svopb10LI3y2bRPa8/hfxdD18kQwe7W7
         P9HNnVRJb7GfhXcahvqDjaEwsDdvz6VEmiAgzmXGALaN8/iJruU6+40xzNigWJnExXjW
         ZZMQ==
X-Gm-Message-State: AOAM533XzJvkhPAGuJ8pqz0E2ePzA7Y4t3kdZlGZAg830qNveIONQ1eU
	EV1D90SEt/VAcayB6DNYELrKjGX9Le5Tegb1
X-Google-Smtp-Source: ABdhPJzxYYj4SJsHqyaLAANB4F6L0Fn+lj4XPl6aGC1Yf4rkMMb+OgeE7wFqnhi3GUXA2QgQ41N4AQ==
X-Received: by 2002:a05:6512:2088:: with SMTP id t8mr6664965lfr.88.1630070581922;
        Fri, 27 Aug 2021 06:23:01 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id d1sm596445lfh.209.2021.08.27.06.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 06:23:01 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] xf86-input-tslib: update to 1.1.1
Date: Fri, 27 Aug 2021 15:22:59 +0200
Message-Id: <20210827132259.3006674-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...f86-input-tslib_0.0.7.bb => xf86-input-tslib_1.1.1.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-graphics/xorg-driver/{xf86-input-tslib_0.0.7.bb => xf86-input-tslib_1.1.1.bb} (81%)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.7.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_1.1.1.bb
similarity index 81%
rename from meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.7.bb
rename to meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_1.1.1.bb
index 830ca7ac9..9f445ff26 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.7.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_1.1.1.bb
@@ -1,16 +1,16 @@
 require recipes-graphics/xorg-driver/xorg-driver-input.inc
+
 SUMMARY = "X.Org X server -- tslib input driver"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f1524518264f7776a9707c19c8affbbf"
+
 DEPENDS += "tslib"
 RRECOMMENDS:${PN} += "tslib-calibrate"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=f1524518264f7776a9707c19c8affbbf"
-
 SRC_URI = "https://github.com/merge/xf86-input-tslib/releases/download/${PV}/xf86-input-tslib-${PV}.tar.xz \
            file://99-xf86-input-tslib.rules \
 "
 
-SRC_URI[md5sum] = "c5ffb03bccccfa1c4ba11079fef0036e"
-SRC_URI[sha256sum] = "1439a9efa50eb481e6a0ab5319ab0765d457732e7da64e3c15f3c0cd13b44297"
+SRC_URI[sha256sum] = "b596168c4ed2f1023212dc828ce49cbe82a0bbd1aac3c5e2958154d78870ca88"
 
 do_install:append() {
     install -d ${D}${nonarch_base_libdir}/udev/rules.d
-- 
2.25.1

