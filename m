Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF7FC021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 13:18:33 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.21917.1739971112618062800
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Feb 2025 05:18:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=D0xM1Eb6;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.46, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38f325ddbc2so3492979f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Feb 2025 05:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739971111; x=1740575911; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLQJi/4bsmLR6oFisCpN2eU5FkJzoR3ey2o1bEE98bo=;
        b=D0xM1Eb6uLCt3md8Go9yGPG7wnhRoyz5MZ/kpcRRRLAYvE+j0whQZ76MnE3QvMTDsv
         EYx9d1n8XpwsxqLRYUf+qTG+p3gLjaAjsa0F53pWBgSe/UYgubRfZAQs4wEkk66StyHU
         RSm7hXeL13fk6AKs+gxFsjrT2IVf2+tjVXaTBS6rFnruyNW5q09NQZqI1VzgJWXpZ9os
         gnRcVdu6uSnkbnlJ6nvzexywDrmnPspMYy7du4gbplKvUJW5Qck29Mbl8P7QvggnJmVO
         LmBSPhJVrA7zpO2FIqWEpROCW065rggR8Pg/JR/Mu3OQx+a+SqTf8baLlYdPx6GPuAZa
         psaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739971111; x=1740575911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jLQJi/4bsmLR6oFisCpN2eU5FkJzoR3ey2o1bEE98bo=;
        b=vhWm5wGJiM5HoSP21llWSivV+f0SxP/JAIHY3QAqK2zX7hiP+uQh2qi3VUVCH6j3mk
         /czTfSw8gM/eOxPVKHWqY+VWIDBf5/bp3/DU/e7QBmwdwRgm18Py8izVCmtz3x2ND8rq
         3J3k/HXg1gDdf+/GsrVNEMq2+U6GxHAKhWRchg0HB2w3xGA6jf4FiGy03qhjYmukHicn
         8vefnF8heKsCpuTaWTUFwuBnvTYfdiEC3tHpiiHlkZuXvljvkh0NOv4H1n+1AlXdzZtA
         WGf8TNBo4Ab22cckQ8s4rjQNMGQcxhPWILYXzkaTGB1/oOF1wbh9D7BN90EZE1K5oa+L
         YcAg==
X-Forwarded-Encrypted: i=1; AJvYcCXrwa8brFuGnqv4qEjOdfWHZH5IIlts2W+SMU0TmcwFIDZDYl+gmgxllvj9Fy4Yz/Pqpl3zQmYXyBbWh0V75uCIWXg=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyKk+SfUnw7/9jm3Cz3j2P8UXNNM/kOsD/dfPrli+j+lfgxVBj+
	8cvcfdhIauJ7bFQGckyzvQi57t+BC09LC/KKJm2TSo3REQ0A8RC1PuRw43BuaIg=
X-Gm-Gg: ASbGncsPJIUqFDvQkyeof2x54T5rCbyx6nNAiiXzRMvBWBOoW0rM4wG6YBOdFYNuPUn
	bRux8iss/fXHWaVpnj0LdtQ6Nv2fzV5qMV8QJzv+EkuWm9EYrLi/fHm2vNhMbU8TUrda2iD3Law
	/REWYNuLUqk2axWatdtH30PI4YS2tf7sT2uOuQnQNfiU6iucBEtYfpjfNVCSjs4ovT83MBX4cLx
	uPQwlM3MbT9iiUaOjbZREPmbrjiwn3PIBMghcB2xwuTtw2LGvBysgCVtx2kdydW7lH+HNVKI6i5
	gIw1YPkYqxnQ6g==
X-Google-Smtp-Source: AGHT+IFp6XsBtOjQ0tBd4OgS9ZaBDjJxUSnybgKT7t0kxLJ683YeuGcOALbTgcG58F1TRygEZFxlrw==
X-Received: by 2002:a5d:64a3:0:b0:38f:50bd:ad11 with SMTP id ffacd0b85a97d-38f50bdadd5mr6132922f8f.5.1739971109479;
        Wed, 19 Feb 2025 05:18:29 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:f0ed:3532:fe6:315c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258ccd95sm17833607f8f.25.2025.02.19.05.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 05:18:29 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 2/2] python3-gpiod: update to v2.3.0
Date: Wed, 19 Feb 2025 14:18:25 +0100
Message-ID: <20250219131826.239050-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250219131826.239050-1-brgl@bgdev.pl>
References: <20250219131826.239050-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Feb 2025 13:18:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115525

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This is a minor gpiod package release that brings in some new
interfaces, a significant typing rework, ruff and mypy conformity and a
slew of bug-fixes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../{python3-gpiod_2.2.4.bb => python3-gpiod_2.3.0.bb} | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gpiod_2.2.4.bb => python3-gpiod_2.3.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.2.4.bb b/meta-python/recipes-devtools/python/python3-gpiod_2.3.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-gpiod_2.2.4.bb
rename to meta-python/recipes-devtools/python/python3-gpiod_2.3.0.bb
index 7efbc5b80a..cd05b40010 100644
--- a/meta-python/recipes-devtools/python/python3-gpiod_2.2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-gpiod_2.3.0.bb
@@ -3,11 +3,11 @@ SUMMARY = "Python bindings for libgpiod."
 LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & CC-BY-SA-4.0"
 # The actual license files live in the upstream libgpiod from which the pypi
 # package is spun out.
-LIC_FILES_CHKSUM = "file://setup.py;beginline=241;endline=241;md5=f5ddb56912b7f20bf94aa4d1bdcd3533"
+LIC_FILES_CHKSUM = "file://pyproject.toml;beginline=13;endline=13;md5=fca786987ac89b59c767e55467de581e"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "4923c27262c70815054fe7a1962b98dd1d6822a541c103d0acd7f42fc9aabae9"
+SRC_URI[sha256sum] = "daa840ed5b691e7078a9cf21c79fe813b9a91c3ed0bdbafae0181c7b98b80300"
 
 inherit python_setuptools_build_meta python_pep517 ptest pypi
 
@@ -34,12 +34,12 @@ do_compile_ptest() {
 
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/gpiod-test/gpiosim
-    install -d ${D}${PTEST_PATH}/gpiod-test/procname
+    install -d ${D}${PTEST_PATH}/gpiod-test/system
     install -m 0644 ${S}/tests/*.py ${D}${PTEST_PATH}/gpiod-test/
     install -m 0644 ${B}/tests/gpiosim/_ext* ${D}${PTEST_PATH}/gpiod-test/gpiosim
     install -m 0644 ${S}/tests/gpiosim/*.py ${D}${PTEST_PATH}/gpiod-test/gpiosim
-    install -m 0644 ${B}/tests/procname/_ext* ${D}${PTEST_PATH}/gpiod-test/procname
-    install -m 0644 ${S}/tests/procname/*.py ${D}${PTEST_PATH}/gpiod-test/procname
+    install -m 0644 ${B}/tests/system/_ext* ${D}${PTEST_PATH}/gpiod-test/system
+    install -m 0644 ${S}/tests/system/*.py ${D}${PTEST_PATH}/gpiod-test/system
 }
 
 INSANE_SKIP:${PN}-ptest += "buildpaths"
-- 
2.45.2


