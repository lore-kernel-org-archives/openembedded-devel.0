Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 061D9CAC5B3
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 12:29:08 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.11313.1758716945551399436
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 05:29:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JLu8t586;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-628f29d68ecso11457826a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 05:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758716944; x=1759321744; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qt0ndtoJmsS21VMAxbgrILqXJQqvIfqOpNhtSwodML8=;
        b=JLu8t586Nlox0MSc2mbz4gd2sUUZ6GmNGyZpq7gKBaq00ffTy6dMnUM4IJSdkiFlg2
         r2osAA1/oZLAI67iwoBnQBxnugCUEtO5I2luHqwarQ2dDZSCpSNcRX2jwQtIF+1hh92O
         M9mvWCi4uDmMmas9MlrDGtMqqIaq0GHmSiDDBXFeVIsUCXEDYFSRSIXDtBxMt56rFkUY
         n9G/k5kb0nIrmdrsos8MXylL1wtSzRpLW3O8DiY69HokogQbkVHsb7YceYcMcfOD+MtA
         JR3srDcVAN4ZoUqTdmSn6EUgtauqAwaYYyNYGsvTj6zXksn4cZLchdTKGlAWuUdAqSyv
         2cfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758716944; x=1759321744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qt0ndtoJmsS21VMAxbgrILqXJQqvIfqOpNhtSwodML8=;
        b=Nx6JYFu4B1Z55u2EoWD/ita6DigyKcN1Q/Vrj3010PzhtN/yfn/cusal26ny+Zs/20
         OlqWmTrS3Vh8XVP1XP3mFpVkSW0VxnrbK0oYYfWHZRLspCv3qCQ3wjKu74jeQWCORlh0
         Xqi/EdMd6nradD0t8U7sIILpMAqdCAwuq/zorsOqwtl7tKlVWmsVlX2cJUPXxw2DN/5p
         vGKB2KbAwZeSOGaF2VXsV847kjf2NKE+W5e5NiUrIYZ4FdIvWlACuzYO+ZnEbGyl/C83
         M1QLzG9boYFBooWL5kTGlye5/fnaPUdXY+0oM497Pnl7upgFJDtrcx7M7UzcVcfcTZ1e
         LWGQ==
X-Gm-Message-State: AOJu0Yy+ayhZBm+r9zSvtzuBo9+t6kME9k+kfEjAVrbx42ygOxgIKMEe
	BZE5d49ug/pE9JXhsKmrWqt0hddsRArhaS5kqrwzNDna76wGDOusy0les2GKYw==
X-Gm-Gg: ASbGncvjaIU4aCcFhcpmRyJOms2neobjlrlX/xo1BIEjMer35lVCL7cmt71E/8YJ940
	ggqHLAvWH4dEGjUoN8WNrg1OlYkkg95gDRwIOMzORuBQ+aLBvaTxpah4HAMXwrKDngDgECDWlSh
	QRv8Ubh3S7+YsnVweDtkr+HzV5L0lRHRgkVcdm94xIwOo7/8U/64hY2thZP0eTsuW/TYn2u8m7q
	/sZHzX70/FDauqg1ZRzVY6NWSHISvd0CiySUyahCwfzGIEXbw69RfhEcOSRepVS78YAICFm1q8J
	dqN6PUaHRaBQV5qOG7gB7mbOX8erQYbLZjxMHu+6nN1chZ357fZLPSwYFuj5qzHtHGXO8RkQia5
	h5w5kUOWKiTCEdzV8Srab
X-Google-Smtp-Source: AGHT+IFfvyMVAKN2jFnnEIq2ZbwiHjKH6T9GKxLdXxaO6sNUXwKoLkqFAErPolgEDpIvezKn4jualA==
X-Received: by 2002:a05:6402:52db:10b0:632:67ba:f9b8 with SMTP id 4fb4d7f45d1cf-634677f731amr4653987a12.25.1758716943777;
        Wed, 24 Sep 2025 05:29:03 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63469f30772sm3024835a12.22.2025.09.24.05.29.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:29:02 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 18/20] tracker: upgrade 3.3.2 -> 3.3.3
Date: Wed, 24 Sep 2025 14:28:36 +0200
Message-ID: <20250924122839.4184719-19-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924122839.4184719-1-skandigraun@gmail.com>
References: <20250924122839.4184719-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 12:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119821

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Prepare D-Bus endpoint for cursor streams

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b4a28c8c84366744a39a0dacdf782e3d6b0d51d2)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../tracker/{tracker_3.3.2.bb => tracker_3.3.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker_3.3.2.bb => tracker_3.3.3.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker_3.3.2.bb b/meta-gnome/recipes-gnome/tracker/tracker_3.3.3.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/tracker/tracker_3.3.2.bb
rename to meta-gnome/recipes-gnome/tracker/tracker_3.3.3.bb
index eaa0e065d1..91d90dde2a 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker_3.3.2.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker_3.3.3.bb
@@ -22,7 +22,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection vala gtk-doc manpages bash-completion features_check python3native
 
-SRC_URI[archive.sha256sum] = "0ed2b98918956d6f16429c607dd8a14c84f4da0a48970fd2eb8c93aba3cf9913"
+SRC_URI[archive.sha256sum] = "4094f704e338f2247fa6b94633279cfd07f7e952bb24627128fab78edb242464"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"

