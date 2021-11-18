Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D7DC433EF
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 02:50:00 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web09.105.1637203798964655998
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 18:49:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eizxrFhS;
 spf=pass (domain: gmail.com, ip: 209.85.167.172,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id n66so10915534oia.9
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 18:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HhBSVRz5T3XESMwOo+/zESXWL7zdYDyH7gua2w+iWRc=;
        b=eizxrFhS1anU2I3daG+yg2wlk5qZshtctj4EasSSnfA0l0J9oFiWM/aRU+Etr1eW+L
         6jXpKermpEo8nwvWq6UsEUR87Vl/7bLAO6aUnIVlhrpu+WpSbXE1YMqHrE2z8RFqen9e
         rZG2GF5c896BWsQXWTBBf13UL5WCEypF05JJpgLgALfqL5yg5Zvj/A9B60G605Zvw+HI
         ABlqblzGGbCvCa8KbutoFRWf/pMJHls2KLXOoreiaUDJOQVhTi7V2y7D658RGxAg9jTi
         92GAGzMDdp1Gm+B37kDvNN6J77/TqADa1cKIJPgDdtjvUxBJTf8frUy1BCcnKk4HtnRr
         qaiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HhBSVRz5T3XESMwOo+/zESXWL7zdYDyH7gua2w+iWRc=;
        b=CNwz0hSmQwIvK7Jxc9To+GBErLzdMnEfxRoaUELCSVT4SFDaX0SYaNe/28V0HQD+kT
         MgPUT4RnUlp+awRB+hztCrTvCHd60ulomXiSFyfS+N88sGuEzIKyAN3soAf6hI2zawNg
         CJZ3HOYfjGG33/B9fdwR8HkZOoBgok++4jx6sKEx3sJrne7tbSES4EUQSGCwp3RaHtjy
         8gep3VJ3xSg4DcQIUPxsI9dCE8wwCuvd37THZ2aqL2ZMHh+GWSeINscQRX56+R6fBX5/
         hOaTsq89H8I2xLaGFHwU2PZHf6RK/LhbRcPfdSCKiDHWYME53InOk96NVNMyeunVSDap
         kYkw==
X-Gm-Message-State: AOAM5316B1O0Zr2/M8wczK/8DOinmjmnUq8JhFLTgxNtQ9CxZZSnPqCz
	ifLfCxYB/GoZMge9MhSjt4/kuMGPt7o=
X-Google-Smtp-Source: 
 ABdhPJwaUA3/y+D9ApSUidlZxUCJ4sqxHArfhvWNk5iQZwb9iTr62b3200/0VyZRVZnKpBWQrFkJ1w==
X-Received: by 2002:a54:4390:: with SMTP id u16mr4550206oiv.109.1637203797972;
        Wed, 17 Nov 2021 18:49:57 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id y9sm283898oon.8.2021.11.17.18.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 18:49:57 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [oe][meta-oe][PATCH] gnome-settings-daemon: introspection is not
 valid meson option
Date: Wed, 17 Nov 2021 20:49:53 -0600
Message-Id: <20211118024953.477989-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Nov 2021 02:50:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94014

meson 0.60+ errors out on unknown options and -Dintrospection
is not a valid option

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../gnome-settings-daemon/gnome-settings-daemon_41.0.bb        | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_41.0.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_41.0.bb
index 976aa6222..82504a406 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_41.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_41.0.bb
@@ -23,11 +23,10 @@ DEPENDS = " \
 
 # all these are mandatory
 REQUIRED_DISTRO_FEATURES = "x11 polkit pulseaudio systemd gobject-introspection-data"
+GIR_MESON_OPTION = ""
 
 SRC_URI[archive.sha256sum] = "e6ca6361fbd1deab2de1a1e390d4f14167cf47b1c547dbb8b65a5d89e9663884"
 
-UNKNOWN_CONFIGURE_WHITELIST = "introspection"
-
 PACKAGECONFIG ??= " \
     cups nm \
     alsa gudev \
-- 
2.33.0


