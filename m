Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC97C433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 18:38:48 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.11143.1644604727217697127
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Feb 2022 10:38:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lsoGhxw1;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id
 a11-20020a17090a740b00b001b8b506c42fso12814405pjg.0
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Feb 2022 10:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WubR3tWIt7dr+MPKDt39x6TN9+Lu8DmEIu8nA39DkLo=;
        b=lsoGhxw17NoJkYVxQYotl48v35d2P5b34TSArSKjdNuANYe3dgLeNIzpEcNj8pfgxp
         yrHGDO5LfIuxuaS4w0ec6Fq0QFxeTw3iedz9DIm+sml+VUsUS9TFdxuyl+LsQ+NPrhd6
         q7B+s9f5VyWIDqUOda0jkP/sKx/8H9BvZ6+A8TQX2skmBrMKzCX3TSjRzQVpqcmp8LTP
         M/BnJVCkg3+KKn6zxk0yy9JTSU1+qDT/hrmWDnV79ORUnWiF83CXphNxZiIucoPldXLg
         4KxyotahPv/elJC9qPlWJMlex8tXzpGvsqqHx/578dNCtQamXsbBKIdqzKlDIc1HOsOO
         Oc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WubR3tWIt7dr+MPKDt39x6TN9+Lu8DmEIu8nA39DkLo=;
        b=uFntGY42BG2Ts5WMwfs7s8GswAZ2JcLfoqJshI5sPkESjjmnVZC/wW2D7p36xVHyQ7
         7yhDJtFtKHDKg6n0s7AP4PUiytapSdGPc0RFcXrGph+64HGf52G3V0WFwHNbXMdDOf+W
         aV50qSvblgoHKH170u7j4oWfw+IFveP9Jn3nceriE92FmgC57xd4wD6hn7mmhuv3tzVn
         TTT4bACSbtjk5J8/vf49VLBiBF26tLAxckbpvpJF1taaZfi2gFg24nAmlCxuqzU4DtbV
         L1rzBchL7mApw6F5IhXJqExuhgFHv96ClDWV5h3myEF+O9qEW406HDR4iPl9UBzNaGjO
         CPpA==
X-Gm-Message-State: AOAM531KfjwKWXbSBdNDbAvvRd3qL0TowU56Itot4kGYZ7hxYKvz4Yvz
	pFPuVpeSj+mPQUIrt8/CoGWYJsVc3ek65w==
X-Google-Smtp-Source: 
 ABdhPJz7+FNWX76U5WoJzTKI7UqNwyfEDJk1PdwWew4tf3Mt4GrnHNpnWRXi9KHt9JhLFOEUmSEp7A==
X-Received: by 2002:a17:902:bd03:: with SMTP id
 p3mr2888347pls.50.1644604726518;
        Fri, 11 Feb 2022 10:38:46 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 k9sm29031592pfc.157.2022.02.11.10.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 10:38:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH] gimp: Disable vector icons with clang on arm
Date: Fri, 11 Feb 2022 10:38:43 -0800
Message-Id: <20220211183843.2605856-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Feb 2022 18:38:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95302

Avoid qemu coredumps

make[3]: *** [Makefile:2397: 24/gimp-center.svg] Segmentation fault (core dumped)
make[3]: *** [Makefile:2397: 24/gimp-channel.svg] Segmentation fault (core dumped)
make[3]: *** [Makefile:2397: 24/gimp-channel-blue.svg] Segmentation fault (core dumped)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
index 68a7a923e2..5081583d63 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
@@ -51,6 +51,7 @@ EXTRA_OECONF = "--disable-python \
                 --disable-check-update \
                 --without-wmf"
 
+EXTRA_OECONF:append:toolchain-clang:arm = " --disable-vector-icons"
 EXTRA_OECONF:append:toolchain-clang:riscv32 = " --disable-vector-icons"
 EXTRA_OECONF:append:toolchain-clang:mips = " --disable-vector-icons"
 EXTRA_OECONF:append:toolchain-clang:x86 = " --disable-vector-icons"
-- 
2.35.1


