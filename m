Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE56C77B7C
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 16:33:13 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.68998.1683477192232338250
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 09:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=J8wkRkCC;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-55a5e0f5b1aso33498137b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 09:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683477191; x=1686069191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjbQS9oDNYnZqR9VqoEDTSEEgD7t/YLjkFw/kemAwvE=;
        b=J8wkRkCCvWMg3GJemRuqNPIB6NLqZG0tgjzFbxqMrfaQnQTjUEovpj9G+KxNNRQYTF
         BDkKo19pCuHTm2og66uQNPK9xhv6bsF0rSbgDnTGVDBXLmjJP2KS6EQwTrGPoi8SNMEc
         6sDRI+inaygu2gBcqbcFcYsWv5sM2cpM8UOsYr1rPuLPRQo+7XbeBKK1Tz51Aj4aB3Nz
         G0bfispJLkst+/3FzHbBRo2rI/dhh3NWc25QXl6q6vwLFEn7Hpc+s4kmfQHLs0c2W3sf
         msDiRDjj3PaJpYAACKqzMXYBoUYIttew7pcABiboUziiRGRWWxQpNEV64yFcJ4tiyiG7
         3h1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683477191; x=1686069191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TjbQS9oDNYnZqR9VqoEDTSEEgD7t/YLjkFw/kemAwvE=;
        b=CnfItiIWwjiLqsfAm+oYrMaIXekQuw32i4gpcFkyLnhcNPeTCX/plAITGurV64Jgz8
         aB0qr3By5+94zLLgVe5Qx7a16XU7KI5qEHAfDVos0/ZR5zgVWorIoz/UhOJ+VXEcqdxB
         iqVA7F9+cuhOILwx1TufE3TP6aMpIRhWkLb+3uwZMaxJrw/k16IzULkIworA6S+1aErl
         fu0KSFvjqcAXyy5qC2ef5PA+Vcc1QJFOmItvDvp1Sp3m35A15Sj8KyjjrGIlJz7fJLpx
         F98oPaX/MQ9kxsSU/dYaCXMxMOg/Z9+ICbibORfnNWuEBgNKCfpzcz5ju0msa8ebzg/m
         FgNA==
X-Gm-Message-State: AC+VfDwvI1dTwd0Gu9pDE63OCF1igv7/9UkR51aFA3jRc4+0TMrnyM0R
	HEkp3kA3/njzx50dJLZLpkUlz9XObGY=
X-Google-Smtp-Source: ACHHUZ5JeskXZX9e6tB/Uk5XiDxUIgEAuFBf5cBpvpttUB9NVhv+ZU+Jh8AMjgN5SXDlGYtedB/d5A==
X-Received: by 2002:a0d:d754:0:b0:559:f038:456b with SMTP id z81-20020a0dd754000000b00559f038456bmr8647360ywd.13.1683477191068;
        Sun, 07 May 2023 09:33:11 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b2f5:e641:5b7c:2972])
        by smtp.gmail.com with ESMTPSA id q82-20020a817555000000b0055dbeb68f7asm1113524ywc.69.2023.05.07.09.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 09:33:10 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 05/29] libgpiod: install the libgpiosim header
Date: Sun,  7 May 2023 12:32:41 -0400
Message-Id: <20230507163305.3261044-5-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230507163305.3261044-1-akuster808@gmail.com>
References: <20230507163305.3261044-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 16:33:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102335

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This header is used for building tests. While libgpiod can access it
from the source tree, the python bindings that live in a separate recipe
must be able to use it from its recipe sysroot.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 62cd19e3f4b971483d6250c9ca64be12758e89f8)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
index becc9adb29..179fe170e2 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
@@ -15,7 +15,13 @@ S = "${WORKDIR}/libgpiod-2.0"
 PACKAGECONFIG[tests] = "--enable-tests --enable-gpioset-interactive,--disable-tests,kmod util-linux glib-2.0 catch2 libedit"
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
2.25.1


