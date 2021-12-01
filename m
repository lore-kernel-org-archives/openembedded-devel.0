Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC483C433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 10:37:48 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.90509.1638355068002161793
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Dec 2021 02:37:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JoXX5XCk;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id c4so51133858wrd.9
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Dec 2021 02:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x/hVGJIQTXoYAv997pzlxVIUZzLFKH17pfL1O62nAg0=;
        b=JoXX5XCkQhFterrSTtMpl4R6XpoLAJXpIvCcvUQVxuwFW7rIelHFpmCaSJdrl3VDY0
         nXpFrBhAQi5XYczg1H92/FT7hly2wuv/XHFQ29DSg1EVyy/1DRpwTlP/XuLHGzotlsAn
         6D27mvl/73Rk+967xn8KqUL/OXo3I8AwCehrTjy14sQZO/aNqyirj/DAUFLWb4VUfCOk
         kq1HpC66TEhuDXNweFpjiFy6dldnx/tioT97w7wRZd2HVKythhlFRaewArUCLpcH70Tl
         GkxohPx/t0zboPPzPNwo203l/P8lxSE3qnUjm1opWwh296y30Z3U3E0tNS2in703UM8Q
         TVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x/hVGJIQTXoYAv997pzlxVIUZzLFKH17pfL1O62nAg0=;
        b=zksWVgXG5mdJq/UpxgDmF38oHCSz8Aysr//owsNoONCFMVSS3Ntt8AXa+OMlxK3aUh
         hMcAriClOBPUkUF/PXrfkORt5C00KKXUmCyo4RJR5CfWHqiozrQJP9WPBZlfUx30M7Fx
         67m5YpLguu61+Kb2onlJUoFlwbkmIsFSv9ke7MKFg0U+s0xQ5pecRw1cORR34k3mIjUt
         M59tJKm+GAuLOWpK60X/YaWOFtSRyN8hgrF8yf6KbB82b3S5Pvw0nv1dAIlw1DQp76tc
         2GUdELAIxXzjYjCmIvfbS96oXVzZ/yqJsb8EWYDnPJtLjxUTOdGsyFSnGmMsM/xNiOql
         RG9w==
X-Gm-Message-State: AOAM531isG8Mn3PZ/QNDebOv9zVnsSSdEmUpsPLc8bzXDuq29VVJlxL1
	fzBLkR8QExLqiS0PdEDzaJTt5J1M1c76fw==
X-Google-Smtp-Source: 
 ABdhPJzHbVlk86tHbbmH7mEyVw4iLn9KjSDyn5HJZndGw4A5lX98sWZMWbOsmujqli3eoQyn1r68fw==
X-Received: by 2002:adf:e8d1:: with SMTP id k17mr5522572wrn.465.1638355066106;
        Wed, 01 Dec 2021 02:37:46 -0800 (PST)
Received: from Unimatrix08-Focal.lan (93-50-192-18.ip153.fastwebnet.it.
 [93.50.192.18])
        by smtp.gmail.com with ESMTPSA id m1sm584666wme.39.2021.12.01.02.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 02:37:45 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] vboxguestdrivers: upgrade 6.1.28 -> 6.1.30
Date: Wed,  1 Dec 2021 11:37:44 +0100
Message-Id: <20211201103744.71732-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Dec 2021 10:37:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94162

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 ...{vboxguestdrivers_6.1.28.bb => vboxguestdrivers_6.1.30.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.28.bb => vboxguestdrivers_6.1.30.bb} (95%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.28.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.30.bb
similarity index 95%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.28.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.30.bb
index 014fe30bb..9bbc9b427 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.28.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.30.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2
     file://0001-utils-fix-build-against-5.15-libc-headers-headers.patch \
 "
 
-SRC_URI[md5sum] = "c6efae8dc115b90c6124e13126794c4f"
-SRC_URI[sha256sum] = "8d34993d8e9c0cf35e7bd44dd26c8c757f17a3b7d5a64052f945d00fd798ebfe"
+SRC_URI[md5sum] = "2e408e56e92cf778eb8722dbbcb5c357"
+SRC_URI[sha256sum] = "3c60a29375549ffc148aaebe859be91b27c19d6fa2deefde1373c4f6da8f18ef"
 
 S ?= "${WORKDIR}/vbox_module"
 S:task-patch = "${WORKDIR}/${VBOX_NAME}"
-- 
2.25.1


