Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F447C001DE
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:40:07 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.198.1687531206287318328
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:40:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=CrudhT9V;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.45, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4f875b267d9so952711e87.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531204; x=1690123204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8eTdc6efvFddz8183su0/Lq8XOMbCyz+Rpft10zuXk8=;
        b=CrudhT9V3ucTM/XWZm/EroAA+9GdYeDTvB5XCPRx1kP4iEaUJJtsX1Pcqz3HCA+K6G
         Pkhg2AqkaqtmnZxohWeXW2iHNJcrd4QMjrej5agkPpAowonNbD1KDS+yL/dYasRNLOzZ
         bityz7NeqndTgN/HOZqaqH5q3oogJFVz6O2MBJnrHEKu1erobNWlgJshUroWq1hWoDyX
         g89kzesfEifI7J1Cn3DIlttGt/oBBx14o/eJd3XwdJ9bh37ICFXZ10dE33J9belkebmo
         EMBfBL5hBahk0GaQe3CCjvy5c4ivfZzazy3Rt8N4VErjX1gsCJSqZVczXvhUygNqwDFp
         RX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531204; x=1690123204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8eTdc6efvFddz8183su0/Lq8XOMbCyz+Rpft10zuXk8=;
        b=MET1iSMNbi+25EoGDcSwjGnm/TXlgIFGJG3XsAt+1rs++n5/kmC63Fe5SWp4OFX3CC
         TylL8HRtUmGNRVSbxJYO+0Smw5dOIEh7wAerwS/OqY8BhvWB0/nWaLdbg4AfihUfQaqH
         9XJZCz+DNNhkQWJEQGVYQJtpu7zR/N0HoyRC7aWzZb5N+Z6ko/WjednPWLwQ3I1j96Aj
         deEq8e0+CUGv6TvrijG+S9ZMwLIa85RN457YY4kJU3kWW1YoAkyIP6U240F0WQcHPHLt
         xw1RgDUmXgYm3e+WhKW83un8l0vGrJ3esITWKJ3z/etXdYjUEYvwockT9nlYWyMGvqbs
         9V9Q==
X-Gm-Message-State: AC+VfDw0Me4J56fRaBGLetq/xNCpx82K2cdi5sgwjPWOJGM5c2kt459y
	5LDJYKjMA7mt/DXbE9KkOtoomQ==
X-Google-Smtp-Source: ACHHUZ6HHDPokZESdOHQubYmmnX20bxx1K1AZmYJ2HVQU8LMPyYStRB1WWGbg14iBLavZFTLaC8OqQ==
X-Received: by 2002:a19:e011:0:b0:4f8:5886:186d with SMTP id x17-20020a19e011000000b004f85886186dmr12421781lfg.9.1687531204531;
        Fri, 23 Jun 2023 07:40:04 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:40:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 32/55] python3-aioserial: fix coding style
Date: Fri, 23 Jun 2023 16:38:58 +0200
Message-Id: <20230623143921.146338-33-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103528

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Stop using PYTHON_PN, fix whitespaces, drop python3-core from RDEPENDS.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-aioserial_1.3.1.bb       | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-aioserial_1.3.1.bb b/meta-python/recipes-devtools/python/python3-aioserial_1.3.1.bb
index 7ef47a2f8..6419aa9c9 100755
--- a/meta-python/recipes-devtools/python/python3-aioserial_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aioserial_1.3.1.bb
@@ -11,7 +11,6 @@ SRC_URI[sha256sum] = "702bf03b0eb84b8ef2d8dac5cb925e1e685dce98f77b125569bc6fd2b3
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-pyserial \
+RDEPENDS:${PN} += " \
+    python3-pyserial \
 "
-- 
2.39.2


