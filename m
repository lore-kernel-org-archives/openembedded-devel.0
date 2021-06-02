Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web09.13762.1622643306801897549
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Jun 2021 07:15:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=XRuN6GzS;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.45, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f45.google.com with SMTP id g204so1397377wmf.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Jun 2021 07:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OtIyzNx0pNdB5mXgq12zFd9hzHQ7WjEQRF0poyzBRbU=;
        b=XRuN6GzSTKCOC5aav345rRFlLYWr1HPufC/l/iewBnZRMn9IJt5hxJP3bpqW5wU+Tt
         2ChrU5UJlNkeKksl6/vbIUxLFfOlKQYmDXUUt2zUcO7BBoSFcEotYbSLZopoT9FfVHhO
         VbEEEMV4CfRUvSXYEJF8X2rFB2snK1DbizrKBQTPT7bIaNHgtWIoJfbW5iDguhcJitTk
         KWlnv6Qx3wuS7IRk+1M1W5v7aTUnzon5sgp0A4Dfo4fTw/c2ZJ/LIVZDtxIrcW/bCMvj
         JjbewlAKTUr7mGodA2shTV8nX8kp6s7YKcJxwlQmsNdXzE5R1MP+SL5cUyVqbaITsulL
         3hHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OtIyzNx0pNdB5mXgq12zFd9hzHQ7WjEQRF0poyzBRbU=;
        b=PSg7Lo1uy++t09eRIWHYmQ9e48Un8yDPOqIL0wWnpIR6ESxyjdrWOYOJbpDcXtUeuh
         zUov6JwmESoVVoley2HoSTXO+Snnn6lNi5HQMmMHK43JhFrU7nSA/sJYYTO5o59Dww3U
         ZAeRfn8XWW7vrILgukTMmdeX4/lDV00huvFa5BvvM75YXUgpiQce/+r0+XGduIWOYbj8
         LTJSClb3E6AB8ab949/8czVax9pdXWoIQEGXGOs7XOLDHDZTBeiPYNmsby34jFEXbQd0
         IPwkioj63FVJ1M1/ICysjemouEuNcAEBKmv7rmnUjs8wV9SE7QyuC1u6yWComXygtIXk
         rOEg==
X-Gm-Message-State: AOAM533FURsHq90YXCHZa67HIPK8RNAQkgMddy/3vIwrpXZL/sed7oWL
	dXZod/7tgbJqJS37e6rJ0sNzOg==
X-Google-Smtp-Source: ABdhPJyMClukMbZI44gmj930bXuqoiDl57dZy8B0dgN4pO0AdB3oMoJuIOOxiVPu5lqTnUHjkTjEwQ==
X-Received: by 2002:a05:600c:198d:: with SMTP id t13mr5358638wmq.56.1622643305466;
        Wed, 02 Jun 2021 07:15:05 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id i12sm2824697wmq.7.2021.06.02.07.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 07:15:05 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-oe][PATCH 1/9] libgpiod: coding style fixes
Date: Wed,  2 Jun 2021 16:14:53 +0200
Message-Id: <20210602141501.6174-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210602141501.6174-1-brgl@bgdev.pl>
References: <20210602141501.6174-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The recipe is getting bigger so try to keep a consistent coding style.
Use four spaces instead of tabs and use the common way of splitting
multi-line strings for minimum git diff lines at modification.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
index d9c251705..f51906a43 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
@@ -4,8 +4,9 @@ AUTHOR = "Bartosz Golaszewski <bgolaszewski@baylibre.com>"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
 
-SRC_URI = "https://www.kernel.org/pub/software/libs/${BPN}/${BP}.tar.xz \
-           file://run-ptest \
+SRC_URI = " \
+    https://www.kernel.org/pub/software/libs/${BPN}/${BP}.tar.xz \
+    file://run-ptest \
 "
 
 SRC_URI[md5sum] = "28e79f6f70fee1da9079558d8b7b3736"
@@ -39,6 +40,6 @@ RRECOMMENDS_${PN}-python += "${RRECOMMENDS_PYTHON}"
 PACKAGECONFIG_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'tests', '', d)}"
 
 do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp ${B}/tests/.libs/gpiod-test ${D}${PTEST_PATH}/tests/
+    install -d ${D}${PTEST_PATH}/tests
+    cp ${B}/tests/.libs/gpiod-test ${D}${PTEST_PATH}/tests/
 }
-- 
2.30.1

