Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B7DDC433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 06:43:42 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web09.5515.1646117021012298181
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 22:43:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J9vF22h7;
 spf=pass (domain: gmail.com, ip: 209.85.214.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id e2so298202pls.10
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 22:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NmoK9KGsXvrgv+QvyYkZzTSe2abd3t+bIj165+lJmv8=;
        b=J9vF22h74yVHEmRnDquFP49EgkysJi1I2PowvwgESxmLZWUv82rEyOguMuoLpIMLEp
         4g4fqe+GRFxFK9a/ME09ETcwsRjRjkQljlBg1BPzaWOKkhqbjRBEiYNCZZqLHgugUXPt
         QQ8ndKw+leoUo6tyYECsQnPKW4F5H1rUvXXNsyMZMni0J273mh3+Cu9LFhmFcQ0nje+K
         kSJAunPMiI5eDIQyo7VTba9Z/z60m+uFKhaSBl2UyR0dtcP4RU1jCn2HWtQf9SqcygIN
         GcE7nnYErmSJUioXfL0wGuIfWel56WR1P6RoviHsRuMUMbHowKAaizwzIveT3BHcfMXG
         g+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NmoK9KGsXvrgv+QvyYkZzTSe2abd3t+bIj165+lJmv8=;
        b=2PmCaArsU3MhGkNBQQFjXQuzGYYBfC7D+55vm91u3yxT1GFMUzWVUrtOkLlOod4Oml
         OTO26XvUSPzNC8bL8xwgXXi+N0YaAXo63IsVP5Fdql+XSqnFzWX7Gy8L0/tOr8tGwtZX
         e7QUHM8c8nnsrXBJD10ay11Pgkj2MySQ+JyhvSJOn0o16hyott51bsnRacx5CZFirXO9
         7RsuOxV4F7HmrdR3ybwZsiYefVTAo/PCs+9VCwviaYWojaIvhK03ynE+a4iyqFoXiIW1
         nJoYmqieyrBFqxyMpm8Cq4wpb/B7Sfixz2c4r0yPBt/rAcI900GKUcRkYNh0GjNL8xmX
         lvbw==
X-Gm-Message-State: AOAM531KAGsQRSC114hc6sRiEAH4GYLPDyxpCXGzGXWSXUmfuoL8cXFP
	mt5I+f8Ft2MzPlX6eh6xG+NVr27zjVRvpQ==
X-Google-Smtp-Source: 
 ABdhPJzGX0SEwRXufUIV2yh6AZrM2Jmubhe801lau9HbSuXr+1DxuLeFkPI57JwCbOGFpJxKdDeBLA==
X-Received: by 2002:a17:90a:10d6:b0:1bc:48ad:c8c8 with SMTP id
 b22-20020a17090a10d600b001bc48adc8c8mr20610614pje.149.1646117020144;
        Mon, 28 Feb 2022 22:43:40 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1a20])
        by smtp.gmail.com with ESMTPSA id
 ep22-20020a17090ae65600b001b92477db10sm1110388pjb.29.2022.02.28.22.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 22:43:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH] onboard: Inherit setuptools3-base instead of
 setuptools3
Date: Mon, 28 Feb 2022 22:43:37 -0800
Message-Id: <20220301064337.1825899-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 06:43:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95618

It uses distutils heavily

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-support/onboard/onboard_1.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb b/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
index e7733bf8b3..775e7c3c7a 100644
--- a/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
+++ b/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://launchpad.net/onboard/1.4/${PV}/+download/${BPN}-${PV}.tar.gz
 SRC_URI[md5sum] = "1a2fbe82e934f5b37841d17ff51e80e8"
 SRC_URI[sha256sum] = "01cae1ac5b1ef1ab985bd2d2d79ded6fc99ee04b1535cc1bb191e43a231a3865"
 
-inherit features_check setuptools3 pkgconfig gtk-icon-cache gsettings mime-xdg
+inherit features_check setuptools3-base pkgconfig gtk-icon-cache gsettings mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.35.1


