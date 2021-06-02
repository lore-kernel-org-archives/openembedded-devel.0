Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web09.13764.1622643308873227081
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Jun 2021 07:15:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=jhsJ4u+7;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.41, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f41.google.com with SMTP id o2-20020a05600c4fc2b029019a0a8f959dso1789443wmq.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Jun 2021 07:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hC+SxWuwRezWTKeWdDEKJntvKyd4KpwVI1FCT8Bejpo=;
        b=jhsJ4u+7ZScwSuvAVn/IXVx+BH8wqYDvPwEx3rKWurhW30Tjf55XrTn3Znq4xIgSL3
         soHehY2qV6vTyGmzlecZ/4yUXhINzUMRpmQgPDCBLJETeYQRGe07J/0fra4ryOkwx+CM
         hfGaRm9fA7eDq3TW7V85DajwycUwap90MsAw4ZLUWfl9Jif2EcceFYzBBL9gm7wmgGJD
         YGqCH3urwyMFkSacTUqfTsbI+qz+ktG/acYi4D91c95qbeeAWjs8U7uF69zC44QNqdiK
         VjhBlNdxTxErQqSvA96xUZER6LtvHzOEIxau7y/Rt/N7GOVCDxI8sNZ0eipD7XQJZUAf
         xS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hC+SxWuwRezWTKeWdDEKJntvKyd4KpwVI1FCT8Bejpo=;
        b=I/ZV8usODxjNdnqlFlw2evW16TuNuw5BEaR0YAl15IfBfnBVYkfL2aLYh4WVuIYyru
         sLz/YjLhCUTtO8k0KPBZ35KoNfgX/ZvjN6P16TA+94WVbM1EKSiJ4uSTT6367f49oB2Z
         MfWC9JcZNH+TSwjryOrVQWoKKBflp5T1vPSWz521H1l4urhIUicHigXxnr4jWMhdaaX0
         s4G5Y54QWO1d1halLh6PAGhmigkxQOayhvo7I2usT2kxaonBNgdSoGysvEqcJdk0jwXt
         j1pjwvE776dvkYDlBEmT+Ce2hU2dSsydtkSpGNa4SF1onPunpJiqxoMpcUkaAYcFEJGZ
         SkCA==
X-Gm-Message-State: AOAM531CAbhZyWS9fQyJ9IQNsw7OPYC22VqjIo73UxZRgsyZ7zF/Trnt
	ih3PRKYZunYH9O2gbx3MInNSVw==
X-Google-Smtp-Source: ABdhPJxNTIep3BfWiZ/TEKm6FnJfri8P12PxY5q//fNJe5yUtwBkbImSTqEv1ekVydVZWfMLAyHCVw==
X-Received: by 2002:a1c:df85:: with SMTP id w127mr5462204wmg.130.1622643307565;
        Wed, 02 Jun 2021 07:15:07 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id i12sm2824697wmq.7.2021.06.02.07.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 07:15:07 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-oe][PATCH 4/9] libgpiod: correctly split output files into packages
Date: Wed,  2 Jun 2021 16:14:56 +0200
Message-Id: <20210602141501.6174-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210602141501.6174-1-brgl@bgdev.pl>
References: <20210602141501.6174-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the files that should go into libgpiod-ptest are part of
either the main library package of libgpiod-tools. Use more fine-grained
values for package files variables.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../recipes-support/libgpiod/libgpiod_1.6.3.bb   | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
index 43264782e..9e4bef7b4 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
@@ -28,7 +28,21 @@ EXTRA_OECONF = "--enable-tools"
 DEPENDS += "autoconf-archive-native"
 
 PACKAGES =+ "${PN}-tools libgpiodcxx ${PN}-python"
-FILES_${PN}-tools = "${bindir}/*"
+FILES_${PN}-tools = " \
+    ${bindir}/gpiodetect \
+    ${bindir}/gpioinfo \
+    ${bindir}/gpioget \
+    ${bindir}/gpioset \
+    ${bindir}/gpiofind \
+    ${bindir}/gpiomon \
+"
+FILES_${PN}-ptest += " \
+    ${bindir}/gpiod-test \
+    ${bindir}/gpio-tools-test \
+    ${bindir}/gpio-tools-test.bats \
+    ${bindir}/gpiod-cxx-test \
+    ${libdir}/libgpiomockup.so.* \
+"
 FILES_libgpiodcxx = "${libdir}/libgpiodcxx.so.*"
 FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/*.so"
 FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/*.a"
-- 
2.30.1

