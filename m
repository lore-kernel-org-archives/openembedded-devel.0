Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.12279.1612990553412430579
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Feb 2021 12:55:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=drSEwx2o;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id o24so3130137wmh.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Feb 2021 12:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HMPYouDvuGuvHhUdZqb7GBWXafZDTIvenJ/yD/FlMGA=;
        b=drSEwx2o1fpKho9ZYjUT9inVwunW4rcYoQZl8sEEfUhZEw91quK7lBruTjzhjR9jbP
         XrWsu+pifKTsl2+HxWesDDgFwL1S6QwYAHRvKEUU1YhxfdycnfUlxEC7o/zuUSiFZ1uM
         64kRP7XjWFO5+8xsYRQ8bqiyFGZzUS3GfBuDCBoTg6xuTq3rOEwqUKDHVt5BGB3eSE/o
         LvZU2ds8M7R4Mz296cDLqJ+W9akeWCf+jrmBOAYxZ/5G3T7LcVNqiGRvCiXNvBmuNmJY
         YwRca2JpedJ/eapI2+A+UbWRyvBfShrl//IgTptRo/e0zuxwTFaG4GaJYKbBK4+4vHUW
         sZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HMPYouDvuGuvHhUdZqb7GBWXafZDTIvenJ/yD/FlMGA=;
        b=eZTI3pWpChtyEKywrM3Rj84aWZ1ecEAi7nCcV8BIUVWnoqlLDuh2Z6imJMVwJADjo/
         aNFSsEiF+7GR5M2EeQborAMgxHeVlfr2PNHJZUPjrNaWm2o0hVcHeCOmoQ+v7yUhyfQa
         HjnJUvRXybo/Uw1k1tmkh16Lej1XlPvsvKXl+bxAEteQnmclcQT1m6oFfWQHmYqD8IKb
         DFZdREoTehRAtlRlzZ0AXbGhF7jdUdHEnVt96hN47rUaGgNNrwXYD6z/wxjoUJGZWQcz
         NRY2H1EswZO/658HjWvRljcd36cGI555kW/+IXov43MGMQNuGdNdyg/LSXc6deL3/bCo
         L0eg==
X-Gm-Message-State: AOAM531GbxBnI/Vgi6femhJrQlcZ2oVDezIYZTlSyuD00yZcp8HsUGJT
	dVYtlb8Lg+bKNUyiwHrANpFxuPPN08s=
X-Google-Smtp-Source: ABdhPJyfH/VKRcus8eLrK6e4/6YsiWaG7GNDNf3LNXDLeNEcQaM5SiFcNueA7KYfs+ap5niqQvt7QA==
X-Received: by 2002:a7b:c5c1:: with SMTP id n1mr849662wmk.163.1612990551319;
        Wed, 10 Feb 2021 12:55:51 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0b5b377382ef15aac10120.dip0.t-ipconnect.de. [2003:f0:7f0b:5b37:7382:ef15:aac1:120])
        by smtp.gmail.com with ESMTPSA id t126sm4521167wmf.3.2021.02.10.12.55.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 12:55:50 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 01/13] poppler: upgrade 21.01.0 -> 21.02.0
Date: Wed, 10 Feb 2021 21:55:26 +0100
Message-Id: <20210210205538.690009-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release 21.02.0
core:
 * GfxCal*ColorSpace: introduce Bradford transform for chromatic adaptation
 * Fix memory leak if saving the file fails
 * Internal code improvements
 * Fix various issues handling broken files
 * Make checkedAdd work for long long in MSVC

qt5:
 * Properly export NewSignatureData class
 * Fix regression in QIODeviceOutStream + MSVC

qt6:
 * Properly export NewSignatureData class
 * Fix regression in QIODeviceOutStream + MSVC

utils:
 * pdftohtml: Fix error() parameter type

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../poppler/{poppler_21.01.0.bb => poppler_21.02.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_21.01.0.bb => poppler_21.02.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler_21.01.0.bb b/meta-oe/recipes-support/poppler/poppler_21.02.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_21.01.0.bb
rename to meta-oe/recipes-support/poppler/poppler_21.02.0.bb
index 4d4c310a4..c85fbf2af 100644
--- a/meta-oe/recipes-support/poppler/poppler_21.01.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_21.02.0.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            "
-SRC_URI[sha256sum] = "016dde34e5f868ea98a32ca99b643325a9682281500942b7113f4ec88d20e2f3"
+SRC_URI[sha256sum] = "5c14759c99891e6e472aced6d5f0ff1dacf85d80cd9026d365c55c653edf792c"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.26.2

