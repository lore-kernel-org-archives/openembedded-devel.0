Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 150E4C77B7C
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 11:52:01 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.7405.1681473115130817761
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Apr 2023 04:51:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=wgeCkOlf;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.48, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f48.google.com with SMTP id w24so7610653wra.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Apr 2023 04:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1681473113; x=1684065113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RS5zG2S0YvaV04wV9JuX1hGkUkejTko5HCtw40TggQY=;
        b=wgeCkOlf1Iyhc6sNYRTqNU73cyUwKWBQyclayeaCl0DCa0AEM3nZkBrblG9SghdyR3
         1SC0Lt4oNNvjE/T+VL7+ItIZAiu1GH1AZG9FrLQFPy9zhlet/Gc4elD6iv6TaRTXRhnt
         AAZ8yA64NNci4TGRpyZYng1nOgOSXnEpekfNGtASSyC/pdabxCLHMOTeqLfoTpwHTg1l
         eMSoxoc+PTpi64Yu7/0EDm0jSnJQDrn/djdyu2lXdmty5QJosjJPJnOo3QN1s6DD/MdN
         yDSG6tVaZnxeyu47zD6OPJ/29ym97c+giJZrY4+azI0QwKpWC6s546jPl8Iem/R1H/ho
         xIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681473113; x=1684065113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RS5zG2S0YvaV04wV9JuX1hGkUkejTko5HCtw40TggQY=;
        b=CC0SPGsDTzOfCtnagTnElbedkI0WxRduWdTbWbuNMrDHpUhHNAAxrNzNW7j+GEMAHT
         9MfoCSFiZMwxfpgWFgU+0L/XSDaude2MtXQmZ4Lu7F6gmq/hzXQWzGSrawyM2XFGJRN3
         HqHtZn8ul9wIhYPaokyfvcqQgdEIxPie7dmsbojIRc1zczNEEucxAF1U5FfnCiJTlkmU
         Z4yGOTLnoJ47hbeQ9iCqkyT9Gz36MLcthFMGc0LUEcsPVj1MTK9vBhZmX5iqxqS3p4Qb
         y/F+HkRNo4mPwQuSpw/GZ6yV7Jj0P7AJ2bbM3NL6MC4GZP+5CmYKSaa9LIcqdjb2RmlO
         uf+Q==
X-Gm-Message-State: AAQBX9dLgsV4loJV/0zqhtM6AXPT4XGuLn/2jgJkRb6Y5IX3q9bIxaGR
	CSkt7+VMUFcBgI6SZQzQtv5EDQ==
X-Google-Smtp-Source: AKy350avn3m86+CsPqNRizLw/sYFOcuLos7nD82AAq12UAGOiKAp44jYMV8YPRPTSOA4aT0TyX3bPQ==
X-Received: by 2002:a5d:4e0a:0:b0:2d8:4e4:8ce3 with SMTP id p10-20020a5d4e0a000000b002d804e48ce3mr4502164wrt.4.1681473113519;
        Fri, 14 Apr 2023 04:51:53 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e6b0:9ea2:8124:b254])
        by smtp.gmail.com with ESMTPSA id f15-20020adff58f000000b002efb3566b0asm3379523wro.52.2023.04.14.04.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 04:51:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-oe][PATCH v2 2/4] libgpiod: install the libgpiosim header
Date: Fri, 14 Apr 2023 13:51:45 +0200
Message-Id: <20230414115147.136593-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230414115147.136593-1-brgl@bgdev.pl>
References: <20230414115147.136593-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Apr 2023 11:52:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102095

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This header is used for building tests. While libgpiod can access it
from the source tree, the python bindings that live in a separate recipe
must be able to use it from its recipe sysroot.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
index 50b9203a7..337554cd8 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
@@ -15,7 +15,13 @@ SRC_URI[sha256sum] = "b5367d28d045b36007a4ffd42cceda4c358737ef4f2ce22b0c1d05ec57
 PACKAGECONFIG[tests] = "--enable-tests --enable-tools --enable-bindings-cxx --enable-gpioset-interactive,--disable-tests,kmod util-linux glib-2.0 catch2 libedit"
 PACKAGECONFIG[gpioset-interactive] = "--enable-gpioset-interactive,--disable-gpioset-interactive,libedit"
 
+PACKAGES =+ "${PN}-ptest-dev"
 FILES:${PN}-tools += "${bindir}/gpionotify"
 FILES:${PN}-ptest += "${libdir}/libgpiosim.so.*"
+FILES:${PN}-ptest-dev += "${includedir}/gpiosim.h"
 
 RRECOMMENDS:${PN}-ptest += "kernel-module-gpio-sim"
+
+do_install_ptest:append() {
+    install -m 0644 ${S}/tests/gpiosim/gpiosim.h ${D}${includedir}/gpiosim.h
+}
-- 
2.37.2


