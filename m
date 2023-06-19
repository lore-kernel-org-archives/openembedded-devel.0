Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92263EB64DA
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:22:23 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.7391.1687180942445035604
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=EyHXuqLL;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.53, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-30fcde6a73cso2867276f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180941; x=1689772941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGaYEXmq7ygUBXIyGHbRAM250L5wrkFluS93Yw2Nuwk=;
        b=EyHXuqLLI1WadBujx2wvUMSsDxPHhfKG0xh1ninA6+R0FCUEhFtUXX2kNSQJqX9J2V
         CTWKTxmGUQ12NDf6MqvSonvoQvglsWWodwm6/pelE4iHGyYc63/mvyCXIWoqxkR7QeR6
         FmpUmabIoq7TuqVAj3ddEm3B1Mi1FLUiBnVDbm7A/58BoI5CdZTPIP3fdXr7nssj0CtD
         jvSWdHd5pMg6BUis1I/cRIYTtWdjaSrB48HJcUyXU+CZFJsSuk6nq6JUuhOnVZCEDLbM
         QR8EcTAeGk4S+P8AQz/orcW/AExDLSWLCw8ymZrSz76ijNWG91Vjvx5DdjKjkIE+ejLY
         UVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180941; x=1689772941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGaYEXmq7ygUBXIyGHbRAM250L5wrkFluS93Yw2Nuwk=;
        b=ULxF00XJgMg3Eh2/Px0CgZc+m61IC1k3hqvY/MOYXR4hGir+J8QNC2zhdVeR9kdBcP
         AIKOmzAB9+Hwp8r7jv4Mt7Yvgl6v7ddILAmGDposj+UySstyVtjbrQ0RNzCrmpdBc9d9
         sOc2O/n6k0EgdomsU4ZjCjkS0RCPQAKBLtaqXfUDp56OfyVXxGeIh73k7HdaXR1hZRL4
         h5kQ607WbRbQHn22337cWnn3VTIScM5/rDAr6KOtGq87RJZDwBQ6T3w16QbKfInVH7ur
         kSIXtUBgMygTe41SK2e+fye+DqXAUEYBtvWAukSDfOdhuaNzh+jhc2YU9J7TOceBCCKQ
         ESXg==
X-Gm-Message-State: AC+VfDwCcktxvF7SOI6pf2/7Y8MILeNCEAM+hRET8lYZ4uuDaxHqa5KP
	ghqrGELQVZz+ZBbkY4qw4EO+Ww==
X-Google-Smtp-Source: ACHHUZ69SisPVcD7f/LrzQGHCbAmhs4rCsU13V2MrYc4tmQxnGOa+xLNfk4Jm9b6DwD723ySXCJ3ow==
X-Received: by 2002:adf:cc92:0:b0:309:4988:7f83 with SMTP id p18-20020adfcc92000000b0030949887f83mr6346706wrj.20.1687180940971;
        Mon, 19 Jun 2023 06:22:20 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 02/54] python3-pywbem: don't use PYTHON_PN
Date: Mon, 19 Jun 2023 15:21:22 +0200
Message-Id: <20230619132214.213417-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:22:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103385

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


