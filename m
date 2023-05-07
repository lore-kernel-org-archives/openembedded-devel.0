Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2827FC7EE2D
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 22:44:15 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.94799.1683499451876720526
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 15:44:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=SftUwnta;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-965e4be7541so519871566b.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 15:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683499450; x=1686091450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHO65dUebySbJGGVKSP2ByuOSoq9b8tMZkMCE9rax1E=;
        b=SftUwntawX5KQdZ3EohV5C9f8ndpHp4Y0tqRGyNCHRQ+vQXfDkg+i/pijx8+LiAtKZ
         xN00PAcs+bFz2Vzsu3Vh2BMQ71XI8RUyBLaOmHQaNTKZhfoiaWXZJ271uFzaNNqAmhrb
         oI1ULfBpvLmKgEE/bGWXsVGOJusTYI5h6V79pWgclJgkBgdvp0VTZ9VBrham/pY6BYTh
         NYyOYZy0BCa9v6SCrKP4JWC/psFSewdi5yrN7bw5bxgtEcF4XyEo417zQeIL3qEmBQHx
         NABDoviJuuq5B5AtizRcmgw8xmqJcnpTFuicvFwdYY3FdIAe/JwpzIl1v3IA4F2iZ/JW
         EwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683499450; x=1686091450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHO65dUebySbJGGVKSP2ByuOSoq9b8tMZkMCE9rax1E=;
        b=hPuJhTJdZuG4GWGtM4cqTRQ6ssgtp12nPa9l0YzkLi9JM4A3Hfnh9SAcz5pJ13gwDn
         E71TijpjgyH4GsHnmwphAabWx802e+rWRIV3u7uxk/GRBLzy/ZCgIhEHSFubB1eCzwgT
         8viwlPFJELjOOVsRZjzJUqq1YTH9pFd84RRYjY0Q3AMNtqbTcodnb5DrhqU8QubsYjx1
         kcC+j/fOYCHWcZKNgct4IN766CffVshmtU65CZB0WZmRytjyxaQgPrHy3Ppv5QyS5qam
         uEPPZvrxnIlDsZMto0prU/b0AUq3PbhWq05WBV9J6vZzgQScrg1RvcOHJLzW5jejxsdB
         twCQ==
X-Gm-Message-State: AC+VfDzcGnQuQDUZdbWdPJ++lAPnNOmSB2qXG3UNDgnK3uNW2H09Vm+c
	YFY0t1IAcQwA4qUYOS3WeMsqNEVYiqs=
X-Google-Smtp-Source: ACHHUZ77ZMOZtrnyDF2/c0GXJcSsQR2IVUvbioomQSXBAKPOXee/8n0pbgXnH+myVTp23vyPtHljeA==
X-Received: by 2002:a17:907:3d9f:b0:959:5454:1db7 with SMTP id he31-20020a1709073d9f00b0095954541db7mr7834015ejc.3.1683499450012;
        Sun, 07 May 2023 15:44:10 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id n18-20020a1709065e1200b00965a56f82absm4140126eju.212.2023.05.07.15.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 15:44:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 06/16] appstream: fix build without gobject-introspection-data
Date: Mon,  8 May 2023 00:43:44 +0200
Message-Id: <20230507224354.1149327-6-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230507224354.1149327-1-Martin.Jansa@gmail.com>
References: <20230507224354.1149327-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 22:44:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102368

* there is a meson option to disable introspection, it's just called 'gir'
  fix GIR_MESON_OPTION to resolve:
  http://errors.yoctoproject.org/Errors/Details/702780/
  Run-time dependency gobject-introspection-1.0 found: NO (tried pkgconfig)
  ../AppStream-0.16.1/meson.build:173:4: ERROR: Dependency "gobject-introspection-1.0" not found, tried pkgconfig

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/appstream/appstream_0.16.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/appstream/appstream_0.16.1.bb b/meta-oe/recipes-support/appstream/appstream_0.16.1.bb
index 50d8cdb4c2..b8cecec41f 100644
--- a/meta-oe/recipes-support/appstream/appstream_0.16.1.bb
+++ b/meta-oe/recipes-support/appstream/appstream_0.16.1.bb
@@ -21,7 +21,7 @@ DEPENDS = " \
 
 inherit meson gobject-introspection gettext gtk-doc pkgconfig vala
 
-GIR_MESON_OPTION = ""
+GIR_MESON_OPTION = "gir"
 
 SRC_URI = "https://www.freedesktop.org/software/appstream/releases/AppStream-${PV}.tar.xz"
 SRC_URI:append:class-target = " file://0001-fix-crosscompile.patch"
-- 
2.40.1


