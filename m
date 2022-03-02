Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B9A7C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 01:22:32 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.2738.1646184151029958017
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 17:22:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EBH2hUa5;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id z2so231681plg.8
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 17:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g/swaHmhlzBlZWCC8MKqRgJgWP/pdAWaOj/qSduKYqc=;
        b=EBH2hUa5QF1aVcByf/wACCpme+5jm6TQJuSUPOHpUyZcU3ssm+4gz2xSaD4KU0WpBR
         RJbUIE5/kdxVIdC5scxMp+V4FkzOz98D6NIqPO1IPNPlsZlt+hEdbp1fxriVn0HQf/O2
         5xhkQiYCuCCF3w+rdY6rwRZBI6LDfKJC5hDuZcPnuMCpgtKr+KOYkw0qbwLWRhNkqfLv
         2o6gEd7ZQYI78BEKAJvDk55MD0s0oYEKAqIIoaR0BKtBqi7pSxCknTh97sCtIK4cnMvd
         kiMGW3XCRjHvT5DLOrrasqxCWfRMvhv7hLkKxvyTYOYLTd8l/70uDEWQ0sNtdadWfgij
         t0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g/swaHmhlzBlZWCC8MKqRgJgWP/pdAWaOj/qSduKYqc=;
        b=UKRecb0IahsxiB9mUQO36P8v0sJ6qr1qEkUOSJpzN3bgcNJF82kt9qtlikZCDmLo+V
         XT6aFEhAXrSAV/Mi+ul7ihu3HHpKiVaT4z+6Z15VPDq1SkV2+XcEKWEMHat37+SkvucK
         bjNTTmTaJz6LLmOi/jp/oCwqMkJE+9tHgJBFPTLuXCjbXU4dnjfAq8F0GmPSpQyNn7Su
         uTamWGiMXMLaoj9S66EzJGbO5R+MR8yDJxoi3O+dahCbxl2GB7ieiGxUje4OBpxzDkrp
         WG/o22AoAS8wJsRGhvJ3s+4HcEcIlRoc+4dDPw5L1PsSw5YzpsUzS2QauHP21/TsxOV/
         gWbA==
X-Gm-Message-State: AOAM533agfa0onKcXS8fCDZWN3ogdMN0sD2nXvwnAFezJgtszebfRbVG
	Vhy4OlpclqF32luwtcisGNcSu0JK5Ww3Hw==
X-Google-Smtp-Source: 
 ABdhPJyvwcsO3021repLSY/h/qBOEJQSgQidncZANG6jQgJOVbNan+LWQfgb7tnwKU8tLpfpMzPYkQ==
X-Received: by 2002:a17:902:f647:b0:14f:c37d:34ec with SMTP id
 m7-20020a170902f64700b0014fc37d34ecmr28144068plg.6.1646184150323;
        Tue, 01 Mar 2022 17:22:30 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1a20])
        by smtp.gmail.com with ESMTPSA id
 h12-20020a056a00218c00b004c3a2450acasm19681487pfi.147.2022.03.01.17.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 17:22:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/4] python3-pytest-runner: Define
 PIP_INSTALL_PACKAGE
Date: Tue,  1 Mar 2022 17:22:25 -0800
Message-Id: <20220302012228.2337827-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 01:22:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95672

Guessing code fails, so aid it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-pytest-runner_5.3.1.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-runner_5.3.1.bb b/meta-python/recipes-devtools/python/python3-pytest-runner_5.3.1.bb
index 28b7053218..0ca007dd44 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-runner_5.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-runner_5.3.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 SRC_URI[sha256sum] = "0fce5b8dc68760f353979d99fdd6b3ad46330b6b1837e2077a89ebcf204aac91"
 
 inherit pypi setuptools3
-
+PIP_INSTALL_PACKAGE = "pytest_runner"
 DEPENDS += " \
     ${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.35.1


