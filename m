Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC73C77B73
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 11:36:48 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.5631.1681990598925458214
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Apr 2023 04:36:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=TvJVp4hH;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.53, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f53.google.com with SMTP id q5so1064466wmo.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Apr 2023 04:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1681990597; x=1684582597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mdIn0hLXbU7OltbQaV3+u7UM5qX1gzLPpLE3OPIRlkw=;
        b=TvJVp4hHlzOrmY5c+vTc9/Rk4yevHfsaqZsI8VnU7PeAQvF4ToBUMbyxpqzfcnumlM
         5DCKLiVZPjB10JtlxrsXDRhN9Oj2vIYcu/cg154xprBPBcz2AX32AOgoQNX9+X6S+NFm
         M5U2PVLe853ux4VU44EEzlJDw+VdUIg17hjX0AsQD+fppBf9v0PHa5U2ch7yFI9Wwq/F
         X+MRWNw69QuO1BaqmzJRSW69D9oIfx8YRtgS0/HSPeuQuJ1Z86tL/p+Tuxh4R/nOdiJF
         +SfgmsPGNXA16gqELOC25aXJLZBoJ1g4TohNntpsBzDdVXefDVbXEgjZ/CIU/KpiVYQm
         DWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681990597; x=1684582597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mdIn0hLXbU7OltbQaV3+u7UM5qX1gzLPpLE3OPIRlkw=;
        b=i7ythLlGG9t0ldEfvq5rqMRHCikHzpaRQQCQmOFeQ86wHviWAmXebBtgDkiM/HUINY
         y7OJytLdDUkqadDnFs9LtSbW1/Esb3hL3/YwGxg3lcV2eZVwPWbNMIP7GDEVUftpd1sY
         buBQd294lNb7Hf9k+RGfFTJJe5DjNMGpDK7aKJaFIMZZVUBjAsf3ScmHcg1ANB0ABVmV
         vSKApArVkXIVL4Hk0gxPxMCIzQLorBf0RZJbgI5XOJEVBZFng6y5j7XhXr5KTTG89t+G
         vznG4FW2LQGAkXDI9BbReSc+m0zmMkJ1neIYXpkO7FW4HJNL6ucRWuChOxb0Ds6lkbRn
         D6pA==
X-Gm-Message-State: AAQBX9cG7+1MqOk6BGdof5tBTUtdSuBzaCPoU16OktG+jdi/ixEzfEcu
	IlqY+0nyulCneLW4/hQspZrYvQ==
X-Google-Smtp-Source: AKy350bea3meaUDnhkiztCevVpiGhim4OwLMyyC9t2NuOnCGbIoxmvahoJzCZpr7QS9F3P6IRiRSdg==
X-Received: by 2002:a05:600c:230d:b0:3ed:33a1:ba8e with SMTP id 13-20020a05600c230d00b003ed33a1ba8emr1095909wmo.1.1681990597226;
        Thu, 20 Apr 2023 04:36:37 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:5a37:5f28:f2c4:36e4])
        by smtp.gmail.com with ESMTPSA id o3-20020a05600c378300b003ef5f77901dsm1719505wmr.45.2023.04.20.04.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 04:36:36 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-oe][PATCH] libgpiod: remove test executables from ${bindir}
Date: Thu, 20 Apr 2023 13:36:34 +0200
Message-Id: <20230420113634.64651-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Apr 2023 11:36:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102142

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There's no need to put the test executables into ${bindir} as they're
already installed into ${PTEST_PATH}. This just pollutes $PATH.

Future libgpiod releases will not install test binaries at all, leaving
it to the library users. For now: remove them manually after
installation.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-oe/recipes-support/libgpiod/libgpiod.inc | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod.inc b/meta-oe/recipes-support/libgpiod/libgpiod.inc
index 53f9ec49c..0329caafd 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod.inc
+++ b/meta-oe/recipes-support/libgpiod/libgpiod.inc
@@ -30,17 +30,18 @@ FILES:${PN}-tools += " \
     ${bindir}/gpioset \
     ${bindir}/gpiomon \
 "
-FILES:${PN}-ptest += " \
-    ${bindir}/gpiod-test \
-    ${bindir}/gpio-tools-test \
-    ${bindir}/gpio-tools-test.bats \
-    ${bindir}/gpiod-cxx-test \
-"
 FILES:libgpiodcxx = "${libdir}/libgpiodcxx.so.*"
 
 RRECOMMENDS:${PN}-ptest += "coreutils"
 RDEPENDS:${PN}-ptest += "bats"
 
+do_install:append() {
+    rm -f ${D}${bindir}/gpiod-test
+    rm -f ${D}${bindir}/gpio-tools-test
+    rm -f ${D}${bindir}/gpio-tools-test.bats
+    rm -f ${D}${bindir}/gpiod-cxx-test
+}
+
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests/
 
-- 
2.37.2


