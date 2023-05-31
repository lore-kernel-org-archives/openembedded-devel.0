Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCB47C7EE32
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:21 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.9110.1685521530121090666
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=RR6YOF+S;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.43, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-30af159b433so2510916f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521575; x=1688113575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ui2Kc2W6GV3enkn0vNEdZwRYold1qmHYXYIrm9/qmCE=;
        b=RR6YOF+S1aZGKxzIGBwi9yn19X73XThj5MpPe4hdcfEx1TVOiDXZSL5GAmduP2Oasm
         q6J7AnDoI3BDYdjPohjXd1UzigctKI64pk5uyWbpP+pqBVDERIEoGIwxxlDfwRbN6ZjZ
         sav4UXSXR+yvcCIjeTS8FWQIIlkwKs9DIYbjxfoAbnhVkwZdhCd6kxpk9YlpN051/j2v
         xbg8+IwPgP7luJaAjGvsRtsgQDCCUdSQtkKNYuGNWTybJMg24HuljCDF0HpTJupP6ryO
         9kNOOh5PZ/weuM42uRBAaNDzoSSiKccVXV8U2Yeh74Ssq6HNvQl/ENfxhgm5GYT0hchl
         TX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521575; x=1688113575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ui2Kc2W6GV3enkn0vNEdZwRYold1qmHYXYIrm9/qmCE=;
        b=AOaRnQYvP1qg+QA+mSU6FTY+1KGxNO31Gv+yWS/KEsg2i7akit+79YmjMjuHxaGq88
         LVy77mkDhAF4GjQXRGjfwSdCvTLcZCJI7J/HYvuT0QW5UZHtnx8Rb2PiCD48D47u3dR1
         T7Xu6hNLPZYg7fc5vFnGg1tn3IC4s2DRWNZGhUXb8uhHpMun8B4WgZz0aEcG23UBmnsQ
         K7KsEj8O1IX/GAvszOqHdMzhMOPBIGSbziMgg/BY7uunB/GBcQzIBXPkQyCdCZXZ0hPB
         cQ7T88wK6WZZu/7Cf9USkSQE1/WdmuhooESfZO+6UrWlI2xeelDL3PHRwxpClMa+MHgi
         KqkQ==
X-Gm-Message-State: AC+VfDzA0X5pICoJTZ9tidsKJAVlZUDB2RldYjWHsi0a9NRGZHkrelh2
	dsRP9XeLT36Gt/xOi8iWwEtRi0zy2PriC0tpah8=
X-Google-Smtp-Source: ACHHUZ5pdYuHmdEpfoQYin99AeytmvCu5clud49S0E8RKyHJXwBgeo8HL0roKNSipQ43wy9QhWD1ww==
X-Received: by 2002:a5d:4eca:0:b0:301:8551:446a with SMTP id s10-20020a5d4eca000000b003018551446amr3527493wrv.2.1685521575555;
        Wed, 31 May 2023 01:26:15 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 062/149] python3-pyusb: fix run-time dependencies
Date: Wed, 31 May 2023 10:23:10 +0200
Message-Id: <20230531082437.10646-63-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102989

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the missing dependency on ctypes and drop libusb1 from RDEPENDS as
it will be already present in the rootfs thanks to being in project's
build-time dependencies.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-pyusb_1.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyusb_1.2.1.bb b/meta-python/recipes-devtools/python/python3-pyusb_1.2.1.bb
index 286e9672b..abe352911 100644
--- a/meta-python/recipes-devtools/python/python3-pyusb_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyusb_1.2.1.bb
@@ -13,6 +13,6 @@ SRC_URI[sha256sum] = "a4cc7404a203144754164b8b40994e2849fde1cfff06b08492f12fff9d
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} += "libusb1"
+RDEPENDS:${PN} += "python3-ctypes"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


