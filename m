Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93622EB64DB
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:22:23 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.7352.1687180941984097609
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=alELLNhl;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.53, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4f865f0e16cso2433810e87.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180940; x=1689772940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPkpcUl4OAsDdOGJGBESaNLYtJByHDiZvYZUxfUr6cs=;
        b=alELLNhlz0Qucq8Y21vRin4m8GfLsKZa5QDf4JG84Rb014BKGwSja4zibw1IfrJvvD
         iPQ/RhAa5jLVKEaDnTF4mR6z+O4fW8Iyuz+e7byNtrxWgSgmdEjFp3yy9e+V/pPiXcOL
         kYIanpmraQMj/Q5PynTvUdHKBLAdRikwwfJwvMQ4syb0bJtU5uEy+cPBAnUNjxf4JeKJ
         RYx3l74IfnQZAVfv23YUd/U38xcdWamNlNM4pfHmGKs+KkVaD6Pshz1nl0G+5unxhpGj
         sGZW9d3bD4LZvqlIugLwiwWauglAApRZEPVFLGdDnFePeuuCFe2uV7EDM9nkVcfB/B6u
         L64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180940; x=1689772940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPkpcUl4OAsDdOGJGBESaNLYtJByHDiZvYZUxfUr6cs=;
        b=bnE1wvaqWSX9+m2glbdidONTKrazK8mG7ghldLLjiYFCw8Ouqm4ngHRoZU1UfZHfXc
         uMLa9EBwdoVhKkJ7ttdyaSkNTMLdNqKr6uXKLoaMZUlCzqgu4PgwkEQw9NiHuWBzkpLq
         /DrGAXOLEsdV+FawL114seL2M+NaL0Upl2RfH805ASLSXopjJXdPIm8T23dCLDBGXAu9
         ENFTdrXXZD0mMas3prLLmafQN380wZQT2toKEVnoeUY4QirgJKGroXV+Nu1/DSrJO4hm
         GZVXt+154uO4fbrLrpbeF7tnPwndNW2zdF6uWirtLLKZUmhMj7rjPqq6AzQ3dFL3pxLy
         OLqg==
X-Gm-Message-State: AC+VfDyimqPwP25Sf2CuxPhJujZPnkj16PCfQMuS5K9fGM5UZoUWkmV+
	PYUu3B7Uf9rmtM8oyk8cKkvIpA==
X-Google-Smtp-Source: ACHHUZ5BPrNHLWn638SZwTBc/oYP0WwAIiBq4NPiG7apDELDhkVkrIz2LNmNYD26fIT6RYjbrJsMVQ==
X-Received: by 2002:a19:f24a:0:b0:4f7:940f:913 with SMTP id d10-20020a19f24a000000b004f7940f0913mr4938243lfk.50.1687180939878;
        Mon, 19 Jun 2023 06:22:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 01/54] python3-pywbem: drop unneeded class from RDEPENDS
Date: Mon, 19 Jun 2023 15:21:21 +0200
Message-Id: <20230619132214.213417-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:22:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103386

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The native package has the same dependencies. Even if normally they are
satisfied by python3-native, we should still use a global RDEPENDS.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
index 71af06881..8b0383cf6 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
@@ -27,7 +27,7 @@ DEPENDS += " \
     ${PYTHON_PN}-wheel-native \
 "
 
-RDEPENDS:${PN}:class-target += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-netclient \
-- 
2.39.2


