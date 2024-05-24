Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF613C25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 18:28:20 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.2643.1716575291736661672
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 May 2024 11:28:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dm6MVvOo;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5295ae273c8so1302654e87.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 11:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716575290; x=1717180090; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I4AFWriykDY27mJd2vYsVNlOeqxB8/WaX28Y6TOdS2c=;
        b=dm6MVvOou2ISs8hPmAFKU991UQoPjI5ChwuKlwioxjJl8pq6qoUh2L/CnXiyxhOVLO
         NgNH+iTVCOMM1b9Vj7zXU92LizKqXwHmBQPlTzWKBxsHKFH8V3cCWAOornEouKW3/KlD
         TT7BLBMC2ySNwfmDApd25X+F95s3yMNUoSrKRZC4fgTAMvpkdceD+SsIpsjcJhlddNAo
         JqM/BCQebcdAj1Le/Y+DXC3mYM4zN2cvyykL2Xvo7A71gQ7UnJ5JEYe1KRUge9vZ+RgH
         6CW2PncdxJGqZMMbtbNsDcUX1O5sDjK5fs/hOpUxXtYfrnKXtQrsD190/62VqWjA1dLL
         GIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716575290; x=1717180090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I4AFWriykDY27mJd2vYsVNlOeqxB8/WaX28Y6TOdS2c=;
        b=unkXUOz1NA0xPwJ6qD3Kg/xyBbOBRAIWc0SJ0EDPlj9WvlC8OfeIhrzqvucb7sksQ1
         KFcGd7f1kL3F6OQ0moKb2WLXMtgSmSVN18Tzu8XcNSdGwRJJcxH5OQ34XYyTNU7MkViv
         YLr6nQplL01nJAbmjCRgKcbyfWfkiBy+Jw6cLDEUwP4nqrtdOj7xLESs/KSLOlXaRZ36
         Km/b8R6I9wvS2gSD+sRSVNJ0ufuMfWUC+PSKIUVIn1E1wiVD2J7lZ2iW15Q7Yrfa+eBF
         R2na+Ng7UAWx+0ZGatz/63dlwouaz+tvdGMOKM9ahg2I87eORDkUVBoG5gmpfukhEKJ4
         A8TA==
X-Gm-Message-State: AOJu0YwZ6mVCv/qD3Jyby4gMQALyBmA4gV28T85gmcVdYop3IKhKl4zH
	Z7pNXxYL6Zg7z6uBt9q87dAb2jhp/eyea0RYzChPWfgrLmRSNILGLyPZJw==
X-Google-Smtp-Source: AGHT+IEYNQZdo3sJ7JV6mbTumr0Y1ML4cZTn2UNM8AKx6Q1RGTLEcPTt1h1nYsiAQXb8JWDPeFGoww==
X-Received: by 2002:a05:6512:3b20:b0:523:41ec:125a with SMTP id 2adb3069b0e04-529663e631amr2959151e87.46.1716575289172;
        Fri, 24 May 2024 11:28:09 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c8182edsm166254366b.9.2024.05.24.11.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 11:28:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gerard Salvatella <gerard.salvatella@siemens.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] libwebsockets: remove STAGING_LIBDIR with /
Date: Fri, 24 May 2024 20:28:00 +0200
Message-ID: <20240524182800.1037957-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 18:28:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110524

* after buildpath warnings fix from:
  https://git.openembedded.org/meta-openembedded/commit/?id=eeef1fddd9052bed4b1a91565260518eb042fed2
  the LibwebsocketsTargets.cmake ends with:
  INTERFACE_LINK_LIBRARIES "ssl;crypto;ssl;crypto;/libcap.so;-lpthread"
  instead of:
  INTERFACE_LINK_LIBRARIES "ssl;crypto;ssl;crypto;/OE/build/.../libwebsockets/4.3.3/lib32-recipe-sysroot/usr/lib/libcap.so;-lpthread"
  which causes e.g. mosquitto to fail in do_compile with:
  ninja: error: '/libcap.so', needed by 'src/mosquitto', missing and no known rule to make it

* this happens only when libwebsocket is built with libcap enabled
  (by libcap in DEPENDS)

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb
index 8f8b70421c..3170d37f5b 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb
@@ -42,8 +42,8 @@ do_install:append() {
     sed -i -e 's|${STAGING_LIBDIR}/libuv.so|uv|g' ${D}${libdir}/cmake/libwebsockets/LibwebsocketsTargets.cmake
     sed -i -e 's|${STAGING_INCDIR}||g' ${D}${libdir}/cmake/libwebsockets/LibwebsocketsTargets.cmake \
                                        ${D}${libdir}/cmake/libwebsockets/libwebsockets-config.cmake
-    sed -i -e 's|${STAGING_LIBDIR}||g' ${D}${libdir}/cmake/libwebsockets/LibwebsocketsTargets.cmake \
-                                       ${D}${libdir}/cmake/libwebsockets/libwebsockets-config.cmake
+    sed -i -e 's|${STAGING_LIBDIR}/||g' ${D}${libdir}/cmake/libwebsockets/LibwebsocketsTargets.cmake \
+                                        ${D}${libdir}/cmake/libwebsockets/libwebsockets-config.cmake
 }
 
 PACKAGES =+ "${PN}-testapps ${PN}-evlib-event ${PN}-evlib-uv ${PN}-evlib-ev ${PN}-evlib-sd"
-- 
2.45.1


