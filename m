Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B16C4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 20:05:04 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.22331.1699819500152757996
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 12:05:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bLz6xL8/;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-9e1021dbd28so581829366b.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 12:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699819498; x=1700424298; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hXNhRrU2UyXJNf6xyAmXPZRIfI3Gx02z7PyVtXdhVmo=;
        b=bLz6xL8/ONDe4Bxput9YaeyNT7KZN7zq4RwyY78BZg7lFkJ3YvcaBDuBGFhW3Ei4Qz
         6XqVU9mc6y0BXjx8LxjyxLoymIOVeoVWRqNXBPLFrOqHNFCSqFNor20lpmIlfE9kl3tA
         BC7VlWkE0iPZX3EHdPTErkVifBc78NbUoz6IpBaPM0+deBOQQlGjPGqp6NvQrBM1TwCd
         x1R/nf9OWnBa9kbfI2hFC9mvQfo3/yXx928iMLLxcTYagBuXhX13OPD0nCj7Y8dz/0+E
         vfjGexEWkHIPPIev/DTS0ILmXaFXCPuY4GMCCbr2aJtNwKvZ05OkR2xEe/q7qlTJPtx2
         fL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699819498; x=1700424298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hXNhRrU2UyXJNf6xyAmXPZRIfI3Gx02z7PyVtXdhVmo=;
        b=pl3WDPRp/uwTuMd8LytsRgGKf3dZqEerVrEhuxYvlqxGZvm3Y5cuWKTTYoecEGsoE/
         Q5IOCiD17b6MXbkDXqwwlH1r9brjDGHE0hontqsCThJL8P/RyPlbt8ww48KvbagsL+21
         ZZiwX82/cBgSJS/4qiamwjMQO9OzUYIoIcD3CXH9CYh2h5BkPRqyWTB312QWlAOniEuN
         p3MiTkQLEkOVEBTNJV4yPOYCsX2aEBvhlSVF74FcOIC9yxeCkUnv9ctHaISvBCvyISzU
         UaPQQsOTcOEwE2i5cEBfv6NoC5a6wzMKS23pFjZ7hEJL0uJDxKH+1vGAddmRGmSrIDmQ
         J+mw==
X-Gm-Message-State: AOJu0YyNNnQTsD1C8/fcrWr3+fGyfdzyYO6+WCcedD/4HjwLDl2cJuRB
	JVcZDtFn3OVOvsa8pc6RDS5YeKSwW1p0Ug==
X-Google-Smtp-Source: AGHT+IEXwuRZM21t5WY3oLgPOxQuOWnDfR1N8v6sduin4ymFTTzqlFlAxtTffHp2xHWjoMAfC0Uclg==
X-Received: by 2002:a17:906:68d1:b0:9bd:a73a:7a0a with SMTP id y17-20020a17090668d100b009bda73a7a0amr3430735ejr.58.1699819497764;
        Sun, 12 Nov 2023 12:04:57 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id o7-20020a170906358700b009adc77fe164sm2927277ejb.66.2023.11.12.12.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 12:04:57 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-networking][PATCH] civetweb: upgrade 1.12 -> 1.16
Date: Sun, 12 Nov 2023 23:04:51 +0300
Message-Id: <20231112200451.610152-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 20:05:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106603

=========================
- Added "-DCIVETWEB_SSL_OPENSSL_API_3_0=ON" because of following error:

civetweb.c:1561:2: error: #error "Please define OPENSSL_API_#_# or USE_MBEDTLS"

You may also want to check out the available CMake options here:

https://github.com/civetweb/civetweb/blob/d7ba35bbb649209c66e582d5a0244ba988a15159/CMakeLists.txt
=========================

Changelog:

https://github.com/civetweb/civetweb/blob/d7ba35bbb649209c66e582d5a0244ba988a15159/RELEASE_NOTES.md

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../civetweb/{civetweb_git.bb => civetweb_1.16.bb}         | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/civetweb/{civetweb_git.bb => civetweb_1.16.bb} (91%)

diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
similarity index 91%
rename from meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
rename to meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
index e9c205618..0a654a10f 100644
--- a/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
@@ -2,10 +2,10 @@ SUMMARY = "Civetweb embedded web server"
 HOMEPAGE = "https://github.com/civetweb/civetweb"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=50bd1d7f135b50d7e218996ba28d0d88"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ce6ce6eb1b2fd59ee6bab219470442a3"
+
+SRCREV = "d7ba35bbb649209c66e582d5a0244ba988a15159"
 
-SRCREV = "4b440a339979852d5a51fb11a822952712231c23"
-PV = "1.12+git${SRCPV}"
 SRC_URI = "git://github.com/civetweb/civetweb.git;branch=master;protocol=https \
            file://0001-Unittest-Link-librt-and-libm-using-l-option.patch \
            "
@@ -23,6 +23,7 @@ EXTRA_OECMAKE = " \
     -DCIVETWEB_ENABLE_LUA=OFF \
     -DCIVETWEB_ENABLE_ASAN=OFF \
     -DCIVETWEB_BUILD_TESTING=OFF \
+    -DCIVETWEB_SSL_OPENSSL_API_3_0=ON \
 "
 
 # Building with ninja fails on missing third_party/lib/libcheck.a (which
-- 
2.25.1


