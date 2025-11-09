Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C9CECCF9F8
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 19:22:48 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28456.1762707071875796343
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 08:51:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FAqswzyk;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: moraless.philius5@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-63c489f1e6cso3286713a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 08:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762707070; x=1763311870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5K8VkRgjfTu7BzJNfZeyOhjBnzzXqblS0Vpo3xOTckY=;
        b=FAqswzykDxi0DasXG47th8pceC4tJzz0+TpsKTrKZEMchQkXFX+nM2eQoIPoMD/NZ1
         VEdYd74281HkWKPHjeyepfQLifqsfHXTVQl+fKXpAxH9khGVjrjBmRo5zK6+2jP3Z19i
         /RmZqEAHOZLKWyzqIvswYDfhAXVeEt5sRzmhaAqegd0VK/NCzD6S/2xn9Ko85qW8imcY
         UnJebcOgugQz5W1MiW5tVBtn+uQKMmARrBbMEQpGP4GmQjLYin7/yYJNMImiwSsN8OnA
         RTmt7dAIzXQNXdzwe4rVhiIcpXCZzMk8FW12jsU1NBJ0v0sumztxuwBqTzDI7UkvNGHP
         VfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762707070; x=1763311870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5K8VkRgjfTu7BzJNfZeyOhjBnzzXqblS0Vpo3xOTckY=;
        b=OiRFs1xITokYCWUKGP+BtsEKl18SwOEe3s87sSgCrtmMbaxAosfk50mIqha50KZ9eg
         d+RoYtEkGbOiXktqY0acx5b8VsnbbnoCh7noxuZ6gtw1hrbci3Z1JVSgXLvSPGoffh5V
         GBs0/fYwn0HbWY7/ROGJMHW8KH5y4aAE+GJCunB4LS60HFhzRVe7g+KQIQFAAqSUq8tc
         I/gSVEZUv0xT8hcvODamYQIbzYGIAFvgfIFx3coagjeaaIle++ApjxXfdscZ3yfsvHYI
         cFsgnG2Vds5kMWgT5DPelH7zfiYtH/e9C+Oa7SvYoZfPV30Fve6DZh7jMQ9m90Hdf7jY
         UEAQ==
X-Gm-Message-State: AOJu0YzgjyQrcyguizkB/YkE6C2TMbqfI/LtJ21Cm5KULAl5FL4CwBFC
	oJiuPz2lnTNvymgw3j8zdQCp+bsvSW/hRI4z38Rr0P6IHajf0A7CBTaRbvgCZReWnlj4xA==
X-Gm-Gg: ASbGncvDViHworKzIw3lwo43WHYLUkKcdcJdUfnUpr7DNvn10ZfDQGotS60OOHZQQTy
	xydJ5znIB1rxxkS9vDzCTc7mdYI4YxV9dbecHvLuubVOYRAX5vpi9+XtpwgN2Fa13Ajrm05oVHY
	YqdV+jAVOcjqUCSeedDhlsIeK8aU61FRM3tAt7oQvyzs6LLs7nOnFvRnHXPjxQFatAO59VtS4n5
	fVg1qYKxFxBkDaomnm+HUO49sLRctgKsyg9l6OjXs4y/QkPSejIpix9Xm/pIDao+8dLyEfJ7Jvs
	pwRG5/6SxbLMHHphMoe6fkOrgv/UfH1Wy/Mruh5RD2ly8uTy6MrmF1Or5KLFSwLevAdnJuduYXe
	KZE/iyzE7sJPSdDM1WbqoNdR4sUkpadxOQm3ldqUfyzXSLxGsscps4qjyVaJMlXTXtzwy/Ijaqt
	RgWix3PnXubXDJSQjac07f1Hv0QtUqFg==
X-Google-Smtp-Source: AGHT+IH47bF5CdI4HApCk2xnL85VcUBzQNRG7KyE9kxYbn7zsJySfLP76Zxa93lwrYnsSvNLEgfItQ==
X-Received: by 2002:a05:6000:601:b0:42b:3b45:71a7 with SMTP id ffacd0b85a97d-42b3b457563mr330590f8f.21.1762706756414;
        Sun, 09 Nov 2025 08:45:56 -0800 (PST)
Received: from LAPTOP-35JGH6FO.localdomain ([80.214.97.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac679214asm18910786f8f.38.2025.11.09.08.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 08:45:55 -0800 (PST)
From: moraless.philius5@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Moraless Philius <moraless.philius5@gmail.com>
Subject: [meta-networking][PATCH] libtalloc: fix pytalloc package ordering
Date: Sun,  9 Nov 2025 17:45:41 +0100
Message-ID: <20251109164541.2901-1-moraless.philius5@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 19:22:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121445

From: Moraless Philius <moraless.philius5@gmail.com>

The libtalloc recipe did not properly populate the pytalloc package
because pytalloc was listed after the main libtalloc package in the
PACKAGES variable. As a result, the pytalloc package contained only
talloc.so and was missing other required files.

Signed-off-by: Moraless Philius <moraless.philius5@gmail.com>
---
 .../recipes-support/libtalloc/libtalloc_2.4.2.bb       | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.4.2.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.4.2.bb
index b617f097cf..177872fd60 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.4.2.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.4.2.bb
@@ -49,13 +49,15 @@ do_install_ptest() {
     install -m 0755 ${B}/bin/*_testsuite ${D}${PTEST_PATH}/tests/
 }
 
-PACKAGES += "pytalloc pytalloc-dev"
+PACKAGES =+ "pytalloc pytalloc-dev"
 
 RPROVIDES:${PN}-dbg += "pytalloc-dbg"
 
 FILES:pytalloc = "${PYTHON_SITEPACKAGES_DIR}/* \
-                  ${libdir}/libpytalloc-util.so.2 \
-                  ${libdir}/libpytalloc-util.so.2.1.1 \
+                  ${libdir}/libpytalloc-util.so.* \
                  "
-FILES:pytalloc-dev = "${libdir}/libpytalloc-util.so"
+FILES:pytalloc-dev = "${libdir}/libpytalloc-util.so \
+                      ${includedir}/pytalloc.h \
+                      ${libdir}/pkgconfig/pytalloc.pc \
+                     "
 RDEPENDS:pytalloc = "python3"
-- 
2.43.0


