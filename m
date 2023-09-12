Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9974FEE3F08
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 17:28:22 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.450.1694539696104934782
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Sep 2023 10:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=f/E9dl6k;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9936b3d0286so773801466b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Sep 2023 10:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694539694; x=1695144494; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QY5XaEqyp8jWUQf1hopFB7A08zkRtplBGReyKg1Ejxg=;
        b=f/E9dl6kKJzPABfZiLVA7rMqIo8r/6H0NbLJOapM2DI4Vd/KUM+OyW5Hwmn7WOWB0P
         crzftvhl+HSGM6MSUFjgOyg/ZPzRWXB/1KRyumtFFTmVh9pWcB9QvMO8aZnEkA6UJgKB
         4KsiMZxB84dPARHwHyF4aXxMQRnWeYoxPp/EjcIJaHUrXQvnlByr697NJdF/ASSXiHCE
         1h6pMjKvtEgp1jqVaxYolG4EDR3hCzOSaGrbUAfE2ysJnHEzGhorK+rPHot2oSWz+D0s
         yfoPyvVLwD/2wvsPQe9zzgTUHClAxnP4WMYb20fv1MlbvtwylHJ7uLy3TqeQLFKNvJq7
         hRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694539694; x=1695144494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QY5XaEqyp8jWUQf1hopFB7A08zkRtplBGReyKg1Ejxg=;
        b=I2prNu+2iMM9abYQjdciiuuX0mk2l8V6KzDgdbPX0AbEZKRyFfr++Ve0yblNYrvFNe
         7bNxkQEuMTrLLNBWBrIz8uDAwDH59FV1KQKhNlHXzAo8w+a+x4Yi+s4CMQFl7sa36Ezs
         BofbBreegfW/IdZjp+nroNZQ8mcVRQGDyD64ESyzkTyLifcKjSpLzordURoxslO6Yq/3
         5Y3FvtO7r+3+FgPQLz8IvEowLxBrKdVbRajv6BCBGa0AgQOAmEks7A7KC619oEiSY1Kw
         YapRGIxmXjb3IP288LTiO0NXDwIVNqOur/KcnQ/OTdyVu7eaqewiorl23C91yS6e8I68
         +O/Q==
X-Gm-Message-State: AOJu0YyzAKfNyBc971dxzlMzyX9TMO8wjP9zZfYgdsQVgzV6tDRm5GhG
	AnG/rKPxyR11LBf2XOGjqYP7q9aq1aY=
X-Google-Smtp-Source: AGHT+IHe6rUQxhkQ3BtfuVU0ZltXM8DP5znM5k0/buiXgLbGKgqxXatVX1uCOLnX8s+8bNYidbEOEA==
X-Received: by 2002:a17:907:60c6:b0:9a1:c216:c8a0 with SMTP id hv6-20020a17090760c600b009a1c216c8a0mr9978241ejc.64.1694539693701;
        Tue, 12 Sep 2023 10:28:13 -0700 (PDT)
Received: from Unimatrix08-Jammy.Abinsula ([109.53.94.42])
        by smtp.gmail.com with ESMTPSA id mc14-20020a170906eb4e00b009888aa1da11sm7072731ejb.188.2023.09.12.10.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 10:28:12 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] mosquitto: do not automatically depend on dlt-daemon, it's a non-mandatory logging system
Date: Tue, 12 Sep 2023 19:28:10 +0200
Message-Id: <20230912172810.2259791-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Sep 2023 17:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104851

---
 .../recipes-connectivity/mosquitto/mosquitto_2.0.15.bb          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.15.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.15.bb
index d06dd2d9c..eea672a70 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.15.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.15.bb
@@ -23,7 +23,7 @@ SRC_URI[sha256sum] = "4735b1d32e3f91c7a8896741d88a3022e89730a1ee897946decfa0df27
 
 inherit systemd update-rc.d useradd cmake pkgconfig
 
-PACKAGECONFIG ??= "ssl dlt websockets \
+PACKAGECONFIG ??= "ssl websockets \
                   ${@bb.utils.filter('DISTRO_FEATURES','systemd', d)} \
                   "
 
-- 
2.34.1


