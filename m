Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC26C7EE33
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:31 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.9078.1685521586133582620
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=wUQ+atM9;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.48, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4f505aace48so3272195e87.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521584; x=1688113584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4gMDq9+M5hFC9MpDEKTBj7GzFxrW9KpQKdCA4cJfBa0=;
        b=wUQ+atM9e+3DMIDpgPa7vMEobRYd3BEj7NXFVoUZQTp+leeI5aDvw8ZCgv4HV3Pr2S
         kJa2nXSLXgQ9VXtdbRNUGGNG608K5yVuxvpdNbxIWo987I4ASfK000+1tnwDEkQCYjqu
         Yt5U+4wlS3Dltdt+g/1PYDxXyf6N3MMAe63QursY1sfEHu3/UcYEhJXxPa1zwSTiz0+z
         d3ISaUZEwdEaD//+zbiUSGkwIz3TfAomc1pFS48znF1/6WrTAipdC8p3B3emjAvtr4r3
         YzZbZ5nWGVR5gHtk57eqOfjOEWOxIVyBmT9dF0/GhuI/oTEBMh6QPvrUNeUKDMYsPmV2
         MyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521584; x=1688113584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4gMDq9+M5hFC9MpDEKTBj7GzFxrW9KpQKdCA4cJfBa0=;
        b=aQ9XIjfNu+5Ovk6EqeyAoe4lhOqCv3uuaRXwopZnmXyU4ZFEuCqtIISM7RP9+JzXGd
         aUTJluqi9j4GhjGsaYyXdFAsRqr/u6t/W1mxAt7LKSBN1tiMLGcaCFQkdiKHjK4zrVs+
         E6+SyD0G+Tgc54u/5EDjy++e3koX2HBy9V84A2QviNdOpG9zimbFTm2NgaXDItMplEjj
         2q3UreibeBJ8zFhD+hd8wUdSD2m9qVPIU/NPUrS8VvSXswg/ryWwmd4vo8Fipt9yXOaw
         HHb9oqjV6LPWutLpCouiWIxnaSPB9y0wF5pYWjribODNl33YDrBCCUKjYh0cw4xLAQXy
         BXOw==
X-Gm-Message-State: AC+VfDwVhEaQO7ZkQid/nCIZqIWM3PqmiA2tDsM6nOo78y2O1TMohLH7
	HC8nvDX75dJCUTFU/tOWP9Nj9Q==
X-Google-Smtp-Source: ACHHUZ48ejbQ0N9/cDud6/icwMJ3948cnFrlVCnsDJwFhEttbHpe2o8y1zrH3ZcQm3WO7LNzThFOHQ==
X-Received: by 2002:a19:c211:0:b0:4f3:b620:ce26 with SMTP id l17-20020a19c211000000b004f3b620ce26mr2116671lfc.42.1685521584494;
        Wed, 31 May 2023 01:26:24 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 070/149] python3-classes: new package
Date: Wed, 31 May 2023 10:23:18 +0200
Message-Id: <20230531082437.10646-71-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102997

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a recipe for the package python3-pylyrics run-time depends on but
which was never provided by meta-python.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-classes_0.4.1.bb   | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-classes_0.4.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-classes_0.4.1.bb b/meta-python/recipes-devtools/python/python3-classes_0.4.1.bb
new file mode 100644
index 000000000..d9240e138
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-classes_0.4.1.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Smart, pythonic, ad-hoc, typed polymorphism for Python."
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=155fbcc756c8ae5265d252d23e20908f"
+
+SRC_URI[sha256sum] = "4de4fdd6c5c38607bbd8ad76703d7cc4dbe007cfa78e8ef1f62fc6ac55303e23"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += "python3-typing-extensions"
-- 
2.39.2


