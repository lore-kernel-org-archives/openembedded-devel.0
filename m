Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web12.63715.1595878064017157309
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2020 12:27:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=RyryBZOR;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.43, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f43.google.com with SMTP id k13so9666170lfo.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2020 12:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I2u/HkPIv4kbQ8vZxT+XJHqzhY88JrzX3BevfYI0kNA=;
        b=RyryBZORQHYKr+5md/x8XUzB9CGkQBkl6YxhSyumyvQ4AtaXzhSEtuH3PgyqZEdC8E
         ILOtgIKuthq0CkTNXOiTGBC/n0UzggxQt2gKIiyv5+94/Q0FMVCZ3pimY9/tlvkfuK83
         QFenvWmgZPiRz88lgK+CGq7U33utgkMko37KcLkkGHyZK/nKOtpWhl2S0TJooqK54GNf
         Jv+InmCpEIAqr/QPjBz/kqMGN7F8uBNpL3sg5AGkAPtDbiXkiiuAobJVDdWsGXmuXDc1
         L7+G0Jz7VU/67Z9u9sHD3kNN+bYyxWSmnWVnUW2k5gDQAtqgITmxdg6XuxKXt6bWt7HB
         xYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I2u/HkPIv4kbQ8vZxT+XJHqzhY88JrzX3BevfYI0kNA=;
        b=tds/KPlYK9c+fnHlUkgykfQiwIoLCMQaAzNrE0YA2M1E0BhCtxTlBnjV4Ed1ZRrN+X
         vueyE0+GBAdirswCQr+8sWU/jkS19NFqD+26GCcwmBe/L+z4ozwWl4vTUrbNB1wvDOwr
         v3Z6tbS1AiY64c+3N7hFl4oZf+VQR4mHf53aUwgAS0txVrh5NVy/PtcOXjQb58S9iQpA
         Q1ERiUfNa80d2EfAvDtLVK2H5MNQTJ8rWNkCZXZA+kSN8FOXIhLNJpo54abbQpuCtKGs
         AzAmbGGAeIrPUqqNukAxi8oDOoPsMJhMEisZnJGUbFXwFPCwJKv8cJEDiQa/IVIFc+G5
         f8hg==
X-Gm-Message-State: AOAM532eD+UYwdIDqhbFzn2ZXa5VNG5F5DKlv5oiBnU9dQo0ws3brnFX
	+gKLbpKQm0203rt0HJ867tu9JoHS3zc=
X-Google-Smtp-Source: ABdhPJzx5JI73ucSB/4jod+VSRDmZrJ2WikvD6RwPLvUgex3NeAWguTNutmyIVkw5zjwoDuhlT0HBA==
X-Received: by 2002:a05:6512:34c8:: with SMTP id w8mr12419716lfr.12.1595878061573;
        Mon, 27 Jul 2020 12:27:41 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id u19sm2910311ljk.0.2020.07.27.12.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 12:27:41 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2][meta-oe 4/5] usbmuxd: update to 1.1.1
Date: Mon, 27 Jul 2020 21:27:21 +0200
Message-Id: <20200727192722.2488841-4-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200727192722.2488841-1-open.source@oleksandr-kravchuk.com>
References: <20200727192722.2488841-1-open.source@oleksandr-kravchuk.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../usbmuxd/{usbmuxd_git.bb => usbmuxd_1.1.1.bb}               | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/usbmuxd/{usbmuxd_git.bb => usbmuxd_1.1.1.bb} (85%)

diff --git a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_1.1.1.bb
similarity index 85%
rename from meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
rename to meta-oe/recipes-connectivity/usbmuxd/usbmuxd_1.1.1.bb
index 7284234326..3860fd8b99 100644
--- a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
+++ b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_1.1.1.bb
@@ -1,4 +1,5 @@
 DESCRIPTION = "This daemon is in charge of multiplexing connections over USB to an iPhone or iPod touch."
+HOMEPAGE = "https://github.com/libimobiledevice/usbmuxd"
 LICENSE = "GPLv3 & GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=ebb5c50ab7cab4baeffba14977030c07 \
                     file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504"
@@ -9,7 +10,7 @@ inherit autotools pkgconfig gitpkgv systemd
 
 PKGV = "${GITPKGVTAG}"
 
-SRCREV = "ee85938c21043ef5f7cd4dfbc7677f385814d4d8"
+SRCREV = "79c8b38d1488a6b07e1e68f39d8caec3f1a45622"
 SRC_URI = "git://github.com/libimobiledevice/usbmuxd;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1

