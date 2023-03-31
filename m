Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9795C761AF
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 12:32:08 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.53273.1680265918736730105
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Mar 2023 05:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112 header.b=cinTShJf;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.49, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f49.google.com with SMTP id i5-20020a05600c354500b003edd24054e0so15209919wmq.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 05:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1680265917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fdahuOde01HzREIVnNxy75jNA1LGm3lEl+4pMEOJNL8=;
        b=cinTShJfspP5aK9dlZBmd3854VW0Id121mQQU/DgMwKhvdHMyDPMBknJWa1QoFPQZm
         KWRp5EQfU4N2yHdkWqTkIGd1L728Mw7Z/sz6bLlgAq8uOK7UVnffELfOiSwQ1h9vvIRo
         BNFtpfuFQ6RbyoxQSQ3ibu4hU2TidfRyNksGFP9szljyrRJCUeigEdhL409mFE0IUDBQ
         HHH4+WeT2rDY7/u7CHcf3JfpO3rziE5YXmuOg2b4MhsXv5nIQ3QFzR85+4nsi98ertoZ
         5YtifI3lYumt4w2X32X0SygK3JCcag8TR0D2K1kHMmIQUQntmB92x6CVp5zBwuVTq/xb
         +Ixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680265917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fdahuOde01HzREIVnNxy75jNA1LGm3lEl+4pMEOJNL8=;
        b=hzU4bBvyqVjqNA0AJQsPfd/b8MDyhYg9ZzyQBqiXsRCnfUbpJgpztXXCDRGnNUts2m
         bkd+Axpg3q+bM6yf5y6aTvSeJFiYAQ8WkCN/X0qpUvrls5PZ9D0la9og4NRNG/BQkllC
         67hs0ATgobwPka77agsk8qyZoNoTOPwaWJHpUPp4YrsoLq/QgH1IvPpxAt9OxBRxt4lj
         xAoKg6TibGd+bNfez72DxUfpm2QIOfBdX5uJWJPqLQ0dyvmJ/yJQyZAUuZ83l0+Rcxs3
         A9rCHO4GO8R/5z1b7VK7itFZAJ8bVrKftWLckpFbjpmIbSCIUgdzfj7lYhg4VH62LRoq
         bk3A==
X-Gm-Message-State: AO0yUKUIbFbTLfpzHiYbL0EsMso6ld7OGQ64C/Te+CYudBWJMz2kG/TC
	doDAmV5uNEjTO+tVVEHVIITl4w==
X-Google-Smtp-Source: AK7set+1lZ4riXZHG0P+IEC6u5mrnhlWLT4BoBI1zS5XVqu0cKwlYe3eLgpEDjjz+1A36Av2B0jsfQ==
X-Received: by 2002:a7b:cbd0:0:b0:3ed:2a8f:e6dd with SMTP id n16-20020a7bcbd0000000b003ed2a8fe6ddmr19145656wmi.6.1680265917156;
        Fri, 31 Mar 2023 05:31:57 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1dc:d1f:e44f:2a1d])
        by smtp.gmail.com with ESMTPSA id u17-20020a7bcb11000000b003ef5db16176sm2577189wmj.32.2023.03.31.05.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 05:31:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] reboot-mode: put the build artifacts in ${B}
Date: Fri, 31 Mar 2023 14:31:53 +0200
Message-Id: <20230331123153.292738-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 12:32:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101854

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We should output the compiled executables into ${B} and install them
from it as well. Currently we put the build objects in the source
directory. While at it: don't assume we're already in the source
directory and instead prepend the source file with ${S}.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-oe/recipes-support/reboot-mode/reboot-mode_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/reboot-mode/reboot-mode_git.bb b/meta-oe/recipes-support/reboot-mode/reboot-mode_git.bb
index 20e77c63d..4c3436823 100644
--- a/meta-oe/recipes-support/reboot-mode/reboot-mode_git.bb
+++ b/meta-oe/recipes-support/reboot-mode/reboot-mode_git.bb
@@ -10,9 +10,9 @@ SRCREV = "84831b20512abd9033414ca5f5a023f333525335"
 S = "${WORKDIR}/git"
 
 do_compile() {
-    ${CC} ${CFLAGS} ${LDFLAGS} reboot-mode.c -o reboot-mode
+    ${CC} ${CFLAGS} ${LDFLAGS} ${S}/reboot-mode.c -o ${B}/reboot-mode
 }
 
 do_install() {
-    install -D -m 0755 ${S}/reboot-mode ${D}${bindir}/reboot-mode
+    install -D -m 0755 ${B}/reboot-mode ${D}${bindir}/reboot-mode
 }
-- 
2.37.2


