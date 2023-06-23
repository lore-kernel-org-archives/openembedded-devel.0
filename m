Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3347C001B3
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:39:46 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.165.1687531176572250632
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:39:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=QWHrTGsA;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.53, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f90b4ac529so9281335e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531175; x=1690123175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGaYEXmq7ygUBXIyGHbRAM250L5wrkFluS93Yw2Nuwk=;
        b=QWHrTGsAU0uiq9/pkDER1Km5F6uuS0evkihOfHfqgh177/+kJHM21woZheom6Ku+KQ
         kijlcbw3cNdcgaHWNfszNLPISL+Lv8+mBEm2+9vCI/fLe3JIYSftnIT5wm50L3brqgfF
         wrBeweUG1nUuDRNYNe/vMQc1/lAx+tDjTito+Z5f7I84E+1a/UfeM61vUPwj3yGviRZp
         19PTrmZRRr87mSYYhb14JdFLoUZfPlNFHl1xJHkRkQz4h5nn82Mk/+JLePHtYXPPFG0V
         KQT9/4r3P6J45L2PlcRK2c0jShjNunOu0RhTNOB2fx2KzOsgsI8W5MSER0aDUgbEdCtG
         gROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531175; x=1690123175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGaYEXmq7ygUBXIyGHbRAM250L5wrkFluS93Yw2Nuwk=;
        b=dAUe/u2Du8LvV5osaNH+J3jrFjCMujMRXLKELP5/FIN12SxWEvl3R0OlKbn1BundhA
         lhAnYiLyPUjomahR7/fUbuaUY4NSc+10p+IDPnQWRYi0xUpZGQX8ZCidVqFSDFkVlnmu
         i+dS6yJG3M34soIsgUMC+tObcHWJkXjeUYRnF6jcZArEryH0WHNrFSICycFm+tLyqfM2
         tl84/92tHjoMubouFQStxLO2RuaSVwGs3XC81Dd7I6HIwHPsLbPCF2NKP+V0AQ0ize/a
         Y7EX/wrOPm16T4dPSZ/t0e5Y1fpjWqlMWTDfHbftgCEV2yLekA6JIR85T11Kg2dRb4fb
         7xaA==
X-Gm-Message-State: AC+VfDwpI1I6GTwfJ9F34Bfo7peBtcYVB4pPx3Q9NSZtSNTYLaQMjyVv
	Mi3TcZDMmgP5k23aPQ4XbLCCzccUqj+Exjhterg=
X-Google-Smtp-Source: ACHHUZ5ghvG6yENsnrdjfSu2Z1vIt1TJReOHP/5O9UWJlS7AfmB+J3qZaTU9Pp1VuA2IeVofNIav+Q==
X-Received: by 2002:a7b:cd97:0:b0:3f9:c1b:83c3 with SMTP id y23-20020a7bcd97000000b003f90c1b83c3mr13011904wmj.2.1687531174985;
        Fri, 23 Jun 2023 07:39:34 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:39:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 03/55] python3-pywbem: don't use PYTHON_PN
Date: Fri, 23 Jun 2023 16:38:29 +0200
Message-Id: <20230623143921.146338-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:39:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103499

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We no longer support python2. Drop PYTHON_PN and use python3 explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../pywbem/python3-pywbem_1.6.1.bb            | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
index 8b0383cf6..c84576382 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
@@ -21,26 +21,26 @@ SRC_URI[sha256sum] = "abdbd6ce08b6c597cdd6c7730e6b49a842d913f2f6b3cc62b585c58ec3
 inherit pypi setuptools3 update-alternatives
 
 DEPENDS += " \
-    ${PYTHON_PN}-ply-native \
-    ${PYTHON_PN}-pyyaml-native \
-    ${PYTHON_PN}-six-native \
-    ${PYTHON_PN}-wheel-native \
+    python3-ply-native \
+    python3-pyyaml-native \
+    python3-six-native \
+    python3-wheel-native \
 "
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-ply \
-    ${PYTHON_PN}-pyyaml \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-stringold \
-    ${PYTHON_PN}-threading \
-    ${PYTHON_PN}-unixadmin \
-    ${PYTHON_PN}-xml \
-    ${PYTHON_PN}-nocasedict \
-    ${PYTHON_PN}-nocaselist \
-    ${PYTHON_PN}-yamlloader \
+    python3-datetime \
+    python3-io \
+    python3-netclient \
+    python3-ply \
+    python3-pyyaml \
+    python3-six \
+    python3-stringold \
+    python3-threading \
+    python3-unixadmin \
+    python3-xml \
+    python3-nocasedict \
+    python3-nocaselist \
+    python3-yamlloader \
 "
 
 ALTERNATIVE:${PN} = "mof_compiler"
-- 
2.39.2


