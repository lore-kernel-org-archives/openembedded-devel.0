Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web12.1010.1629567349206879423
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Aug 2021 10:35:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mmAbb3+y;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id x4so12421348pgh.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Aug 2021 10:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9YbmvKHAvEGF71J4+TBfYuWKGOXalcK1oLcR/31fphk=;
        b=mmAbb3+yhH+FWHLAjF1GeT/LDPG3yLYGZnAAUcXTNbe7fr3WG/XAcgDJzC8nVqJ5aT
         qpMZsrMZB/4EJ9Pdl67JvooBTZ6rjtly8GnZUqMWjKTJZziw9DiRwrnapFTr1nQj/h2u
         a1AHhX3tF7+vRakn5m7QDAwARmuv5GO0ZukJfJH5nGszt3F6Stg0hz6W5sd65KPHTzJt
         WIvY4pCps6dpy6AyBKRlrUVhl+EhH7SGAKVz3t8XOdKeSCpjwS7pQJZyId2p1Desm/ER
         TOGJSlvFE2/+r/eU/lrqGeNnP0Lr+uFmDeIOBhVjkI9dOy9SDMHlENDE6FtEnvJHMqpy
         nVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9YbmvKHAvEGF71J4+TBfYuWKGOXalcK1oLcR/31fphk=;
        b=iQzQrpIpDa7CxRWRPtCmGQK3fkuzRtBWe+D3icfeArHZ4+0PMrVnS3gcbgwdqEBR7G
         l4mWaH6q8xTSu62MOf5jwwqXsnVeH48r6e1OrVnNEgPCq5ZTdDGWQT8RC8bX7XCYkyyW
         PYqX0Q9LGjKnCeQKAKvHJxQJLaXpaYH23IwHtWOT1ffz2fV1i2rcAzIeiFGYiQH4n2No
         JEaFSKvNHcqoeDyBMB5StE5H9vM3N5gWnnIGrshOvcp9xoNs9dyz5713dN/i8TFk9Rly
         kG4do9xUclrYOWp/Je4ndFWHDYq2XWZENhW/yYloxgYIryeu1ROBXFPcWjYo8wF1Z8oN
         Hakg==
X-Gm-Message-State: AOAM5309tr5BdNiut+XaI4MTIEKW5QGUDMqDkGJPVJmTPQML6UCuCqGf
	iB3C8Njg+5Sf9WhW5m+au80vp3cljhE=
X-Google-Smtp-Source: ABdhPJxKqb8b/YzmMqY/OdMsytS6kC7VqXELydyJmTi9ISlVVZp+Jox1W11N3WxBauKiGCo9IXBrRg==
X-Received: by 2002:a65:6413:: with SMTP id a19mr21534993pgv.120.1629567348707;
        Sat, 21 Aug 2021 10:35:48 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:43c0:2d24:85b:da13])
        by smtp.gmail.com with ESMTPSA id n18sm10993315pfu.3.2021.08.21.10.35.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 10:35:48 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 4/7] fvwm: Fix build time paths in target perl/python scripts
Date: Sat, 21 Aug 2021 10:35:38 -0700
Message-Id: <28ca556a2f5cdff11950ccb73307c39d91d1c76c.1629567241.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629567241.git.akuster808@gmail.com>
References: <cover.1629567241.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Add rdeps as needed
Fixes shebang-size QA warnings

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8cc64128c70c5b6a41b050332abb1d73a10ef4fa)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb b/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb
index c93c510976..3b01a216bd 100644
--- a/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb
+++ b/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb
@@ -82,6 +82,9 @@ do_install_append() {
 
     install -d -m 0755 ${D}/${datadir}/fvwm
     touch ${D}/${datadir}/fvwm/ConfigFvwmDefaults
+    sed -i -e 's:${STAGING_BINDIR_NATIVE}/perl-native/perl:${USRBINPATH}/env perl:g' ${D}${bindir}/fvwm-*
+    sed -i -e 's:${STAGING_BINDIR_NATIVE}/perl-native/perl:${USRBINPATH}/env perl:g' ${D}${libexecdir}/fvwm/*/Fvwm*
+    sed -i -e 's:${STAGING_BINDIR_NATIVE}/python3-native/python3:${USRBINPATH}/env python3:g' ${D}${bindir}/fvwm-menu-desktop
 }
 
 # the only needed packages (note: locale packages are automatically generated
@@ -113,3 +116,7 @@ FILES_${PN}-doc = " \
 RDEPENDS_${PN} = " \
     xuser-account \
 "
+RDEPENDS_${PN}-extra += "\
+    perl \
+    python3-core \
+"
-- 
2.25.1

