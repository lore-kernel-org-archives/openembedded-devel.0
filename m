Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30049C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 19:07:21 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web12.1674.1634324839876892833
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 12:07:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=U+tpE5Ie;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.49, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f49.google.com with SMTP id x27so45996364lfu.5
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 12:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wyn+Pi3+EprEY3hbCOaXa9Ufqky4OiNRIJlvYDoaLUg=;
        b=U+tpE5Ie5Y/e7Jem0gBNmxJeWslFgegNfRStE771j+b8gemxzee2mep8r2nMXeg8fo
         464C2uGZWHysvx/7awnXQ+AexIpg3JgWKxHOOZGtA0jz2TxbHsRF0tkIyuwsX3tZeLIn
         AIZ3UxLV5Til6r8mae+pdmFxWz0VaQ3cV89GXDP/AWXVSEyU6Ec68WclPN9rDhfOdS/H
         U5/9ejyC66ZRiXZGfRUKN76lk2AMV10CtTipX26wo/gu07rPoco509FjYa5bJmcZLWOG
         o9ONhIlGUlfMSCFIuxeIJNkbM4rXIkma8no5soF/+ncm8fFhcAWVnTjjzuR70V2nGAP/
         tjCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wyn+Pi3+EprEY3hbCOaXa9Ufqky4OiNRIJlvYDoaLUg=;
        b=UItNxMTKsOUCrB1tOOzdDwRcSbqFdLYaPgbc8xUUKcGVjrZE/Xsh8BWMec+XZqBEOd
         LOmjW+Ev7tH1kZfschSLlHclBs89c8G8PxpGp7KpLKjxvI7jio1zfQsg/N1+0UzqIxbA
         SLH9Dyix4KgI8goyeaKB4Q1UnJhx3FnpZnU3Naz7G4ZojF11rj7S+qQ1IKINEKeSZPpo
         HM0wL4BhspRcCCDbDwH39wtRrRj0w+9Vr5WaHZVYf2Xu305tbUj7weBZuUFX4BCE54FE
         f/dI8kkHiRpwa03d3pdzsEVp5X+YZFiWZtSj2qgSy1XwJmM/W8G9vG5g8w+4QryLD8uh
         5cNg==
X-Gm-Message-State: AOAM533jOM7o1ygWbPTDgmNd3NDzqlheGPza4AuWXHNxV9DpBq/RqHpX
	qMtZ57U+cmb8kVKI73dcVEvVoH/nF/6+eZku
X-Google-Smtp-Source: 
 ABdhPJzf2SdbopdFeCuEQhKK+XDSQmARZuODj3tly1cN2jLwUbYrp3VF+kMk1vEcWkMO8PaE0XsIZw==
X-Received: by 2002:a05:651c:24a:: with SMTP id
 x10mr9677457ljn.472.1634324837422;
        Fri, 15 Oct 2021 12:07:17 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 d11sm595572lfj.269.2021.10.15.12.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 12:07:17 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] ttf-dejavu: add UPSTREAM_CHECK_URI
Date: Fri, 15 Oct 2021 21:07:15 +0200
Message-Id: <20211015190715.879753-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 19:07:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93330

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
index 0de499666..b02dbbdaa 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
@@ -20,6 +20,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/dejavu/dejavu-fonts-ttf-${PV}.tar.bz2 \
 
 S = "${WORKDIR}/dejavu-fonts-ttf-${PV}/ttf"
 
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/dejavu/files/dejavu/"
+
 do_install:append () {
     install -d ${D}${sysconfdir}/fonts/conf.d/
     install -m 0644 ${WORKDIR}/30-dejavu-aliases.conf ${D}${sysconfdir}/fonts/conf.d/
-- 
2.25.1


