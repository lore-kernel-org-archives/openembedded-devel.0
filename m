Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96CE8C02193
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 08:47:56 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.111551.1738658871499125747
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Feb 2025 00:47:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=ctABTKM5;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.47, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4368a293339so61351135e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Feb 2025 00:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738658870; x=1739263670; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ly8iu0IAkaGFigaOQ28GEQJL7o9KXdGvIJRkferGa98=;
        b=ctABTKM5tRssDGfk6GmDsnv5nunB4z1Mc767IRNS1YV6Oduz3hZ2fNUN8GewqseZMR
         xEHF97lB2AHKVRsSsDsS4ovLX5XMsI+t7KPGOAvdZdSpLCiibDLdlWYlSkwG73cNQYE4
         nmVJwfdM0Ibo32VCgcrGMydk9ifV0y/tQPAzJUMEferBtpDBSK8u1q7znj1QWAfI/7Kt
         KKxJieLPpuubMwfRKpSWxQ0uH0o1HgDfFZwpsCHmY5T3V7zkVYm9U1jUnaJd0FdixFe9
         yRtAcbrNCn6kEDk6dFCBTEiwvi2qBbgGz/FweBnVxNN82qRIVUI4SzuQ9nLcncy7Zlpv
         r8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738658870; x=1739263670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ly8iu0IAkaGFigaOQ28GEQJL7o9KXdGvIJRkferGa98=;
        b=JfpXl6p0JApamNVnDqyfjWLQaUcJh8C7Vn/93+OSsTehLickE+KZb3HhCBe+lA4Qao
         juxs3GjIhpZDIMiWBfuiTjgjXOl4WMj8Mef/aSSSvZXr58iGaGG+ddWiCGf3JjMuBH/u
         rDPsXh4wRGR51DupTQxKBk6NeHpZVJuIpCCk7mJ3hCJ8q0mu+wogFOIHnTTo9gUkYgSz
         RBUP9X2RMQtYlFvyX+wpbosoT/rxrpgeHXG4hoceB58208B7qHI7l1ZKJZaujrq5FOD7
         TuhThOeeJ8hze1zX2RJ/GUmQgcdm6x5NlSgBoMOZAv7irzgM5WbQKZnunj1ybTPOHE/7
         GZ+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWjl8x0DYU/U6a2tWZDmj5tqgKlDnRtd4/YmjfZkf6aNyZJ5mBj+GY3nWE+BEWUHEFms3nGWv18hCoZtw1XOWvcBHM=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxQfl0HsE+KlcCspDoSi7tTpws8uVycaB3gBBXXPHV1q5Mdpu0i
	mVMOrBGcdWSPmpN9fMCk3ShZUDgG+Epn5wtn/CBXFwjwFFFqbkeg9Q5P5mViE58=
X-Gm-Gg: ASbGnculNxz4VVcr/2Px9MZitV31qt/H9OY7S9qSQcmyrSVaH3z1BB4x0PK3mIoHdr/
	VIXNPnNwmasbX1FIjcmxEDTfenpNI8dTs6wWTTeql2ou4+/vaxP+P+m0up3DRj29x5dUfb/WjaD
	AbXQ0c/PbHWHdPL2gyanim6h2xvZv8YA1+aDKg1AFMSQ5iheCF5nl5zwHv5O/LCaYMdu04ORt0l
	gzzn6Ip3/tM4+TOg/ceXhCo/D9j3ALlnspm6V32wsJeNsfOEZdZxaGfA2YPgT3sp0/UYFCn/SE8
	P0utywrGauFBfzo=
X-Google-Smtp-Source: AGHT+IGi5Fl6LDXXydcUNace1qfDNice9I09h+gV/4KaMkQy2HMN5MjyCaZspnlP4UuwDP/ZVWB/Yg==
X-Received: by 2002:a05:6000:18a8:b0:385:e5d8:3ec2 with SMTP id ffacd0b85a97d-38c5195fda6mr19694097f8f.28.1738658869107;
        Tue, 04 Feb 2025 00:47:49 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4fb0:17c9:a494:227f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cf831sm15350283f8f.90.2025.02.04.00.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 00:47:48 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 2/2] python3-gpiod: fix ptest failure
Date: Tue,  4 Feb 2025 09:47:42 +0100
Message-ID: <20250204084742.26325-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250204084742.26325-1-brgl@bgdev.pl>
References: <20250204084742.26325-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Feb 2025 08:47:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115267

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linux kernel commit 8bd76b3d3f3a ("gpio: sim: lock up configfs that an
instantiated device depends on") revealed an issue in libgpiod bindings
tests where a GPIO simulator device is not disabled before removing its
configfs entries.

Add a patch (already submitted upstream) that fixes the observed ptest
failures.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 ...tests-disable-device-before-releasin.patch | 49 +++++++++++++++++++
 .../python/python3-gpiod_2.2.3.bb             |  5 +-
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-gpiod/0001-bindings-python-tests-disable-device-before-releasin.patch

diff --git a/meta-python/recipes-devtools/python/python3-gpiod/0001-bindings-python-tests-disable-device-before-releasin.patch b/meta-python/recipes-devtools/python/python3-gpiod/0001-bindings-python-tests-disable-device-before-releasin.patch
new file mode 100644
index 0000000000..9025e0d72d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-gpiod/0001-bindings-python-tests-disable-device-before-releasin.patch
@@ -0,0 +1,49 @@
+From ad91b034e7575074998b3e480b592e3ae6d00def Mon Sep 17 00:00:00 2001
+From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+Date: Tue, 4 Feb 2025 09:36:13 +0100
+Subject: [PATCH] bindings: python: tests: disable device before releasing the
+ bank
+
+Linux kernel commit 8bd76b3d3f3a ("gpio: sim: lock up configfs that an
+instantiated device depends on") uncovered an issue in Python bindings
+tests where the GPIO simulator device is not disabled before removing its
+configfs entries. Reorder the operations in chip_finalize() in order to
+disable the device first (if needed) before releasing any other
+resources.
+
+Upstream-Status: Submitted [https://lore.kernel.org/all/20250203-fix-gpiosim-in-bindings-v1-2-d2c9e0f3a29d@linaro.org/]
+
+Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+---
+ tests/gpiosim/ext.c | 11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/tests/gpiosim/ext.c b/tests/gpiosim/ext.c
+index 272e6f7..cb5611a 100644
+--- a/tests/gpiosim/ext.c
++++ b/tests/gpiosim/ext.c
+@@ -96,15 +96,16 @@ static int chip_init(chip_object *self,
+ 
+ static void chip_finalize(chip_object *self)
+ {
+-	if (self->bank)
+-		gpiosim_bank_unref(self->bank);
+-
+ 	if (self->dev) {
+ 		if (gpiosim_dev_is_live(self->dev))
+ 			gpiosim_dev_disable(self->dev);
+-
+-		gpiosim_dev_unref(self->dev);
+ 	}
++
++	if (self->bank)
++		gpiosim_bank_unref(self->bank);
++
++	if (self->dev)
++		gpiosim_dev_unref(self->dev);
+ }
+ 
+ static void chip_dealloc(PyObject *self)
+-- 
+2.45.2
+
diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.2.3.bb b/meta-python/recipes-devtools/python/python3-gpiod_2.2.3.bb
index 58908ad0d5..bdc7e52ca5 100644
--- a/meta-python/recipes-devtools/python/python3-gpiod_2.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-gpiod_2.2.3.bb
@@ -5,7 +5,10 @@ LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & CC-BY-SA-4.0"
 # package is spun out.
 LIC_FILES_CHKSUM = "file://setup.py;beginline=241;endline=241;md5=f5ddb56912b7f20bf94aa4d1bdcd3533"
 
-SRC_URI += "file://run-ptest"
+SRC_URI += " \
+    file://run-ptest \
+    file://0001-bindings-python-tests-disable-device-before-releasin.patch \
+"
 
 SRC_URI[sha256sum] = "b916c3741dfc4dbcf6224b39e50765f672b137896287715709d49e9f063304c5"
 
-- 
2.45.2


