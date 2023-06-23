Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D09DAC0015E
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:39:46 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.185.1687531184840159874
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:39:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=KJROFKB+;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.45, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3fa70ec8d17so18224955e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531183; x=1690123183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=162WeV0wQcPL/z3Qwqm9WVHEK5P2KX3fbhEzaOofEYs=;
        b=KJROFKB+bBmrvdf6Tzlxdwvm0+qUV2d+7tineAtTBtpI4ORAJzF/AQ/RdgE6Nd8iHC
         j7XMYYviJZdnDIfyCx89wnnEcpatLRFo+hK58ZJFHQshLipTWZvHY8cakXW5LC//nvAd
         t0LHnB+Qy3D6QE0HxatzcM2+oigpLvtbhNP3TxEL5J18rHni/vZQcFhlcVrzreAbFfqY
         T1eaGSrBwykDAwA48QoAQww+IkZ8fUvaPPoe4n5fq4+LsMJze4JocZKKFqwYhtrEIdZ3
         JroLU/78jYhi4heH1jEqHpWImcFZeuQp2PuFmGGuVBIlS5cKzaK1x9+x/xI5u5atzCsi
         6PSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531183; x=1690123183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=162WeV0wQcPL/z3Qwqm9WVHEK5P2KX3fbhEzaOofEYs=;
        b=UtEJHR3IbespGhPtTfTvjNw9VYdttHlrrwfh4ASjXKCVUMINsuQnqQ+oBmus1DEvbW
         NHvLbzkBZtD5spWbOPLiCJQSRgsxdNyVNFAVtiyvQHRxFYpPTVHT9aV2wbWSESUhHyqS
         vVvrIEv9gjiffBWiU0XqOZvPPup1CTvDoQifu1zJR1pAv4agFuQjE5A9DqZivQfNi3f6
         Fx64+5Dijumt9fRE5WHRCwv5MbLHz6Mtq9ZCwnbADfAK6r0QUim7eCSkv6o5HGLZNyqV
         Z5UFKltPP3n4STPL4MK7PdcH0jHUSlYDLtZcHBt+URyiQBsw/4BXhhzQeASDG777GQ5C
         Z2YA==
X-Gm-Message-State: AC+VfDx6j8WMnwtUiAc3xnA6OpHlF7DmWG8wLkRLr3FgjOq+urC4iVqN
	SKtttwcUbwd/ImUtwBMnM9gcwQ==
X-Google-Smtp-Source: ACHHUZ7IiCYmpY2lSmn8qiHI9hgU+GHM4ZBOiQAbzU80GpiTkrpItdAPhoQb9zDBKtTgYhHgag2PYw==
X-Received: by 2002:a1c:f616:0:b0:3f6:d90:3db with SMTP id w22-20020a1cf616000000b003f60d9003dbmr19485270wmc.3.1687531183424;
        Fri, 23 Jun 2023 07:39:43 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:39:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 12/55] python3-ecdsa: don't install tests
Date: Fri, 23 Jun 2023 16:38:38 +0200
Message-Id: <20230623143921.146338-13-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:39:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103508

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

If we don't want to pull python3-unittest at run-time then we must not
install test packages. This recipe doesn't provide ptest anyway.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb b/meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb
index 6a399a96f..d1022891b 100644
--- a/meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb
@@ -13,3 +13,7 @@ inherit pypi setuptools3 python3native
 RDEPENDS:${PN} += "python3-six python3-gmpy2 python3-pbr"
 
 BBCLASSEXTEND = "native nativesdk"
+
+do_install:append() {
+    rm ${D}${PYTHON_SITEPACKAGES_DIR}/ecdsa/test_*.py
+}
-- 
2.39.2


