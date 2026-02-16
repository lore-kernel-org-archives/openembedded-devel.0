Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C53E81A5F
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 17:15:24 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24665.1771262122490739850
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Feb 2026 09:15:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=hOUJKHMV;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.210.179, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8218237420eso572529b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 09:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1771262122; x=1771866922; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ajWEDPuF+zWoSyRAaRY4NYxnPDNDuGkWevoiNwwGmvU=;
        b=hOUJKHMVXBN5eScMkLvol+OwQY+SLYsjoyTYyHYXGJtdiMGtdz+DH/v9LD1fhYMGMk
         Jw4xUA+7nil7hCIkjpKG3rBjs6+JYKRbBJbkB5WrgEVtlSfbO7se5/z4tRD6EeUIF7Aj
         vp7tvDG+DED+2q/ns/hTFR/uI52YkZJvpODvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771262122; x=1771866922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajWEDPuF+zWoSyRAaRY4NYxnPDNDuGkWevoiNwwGmvU=;
        b=Nd4HuCuI0BP3TKx0eXwRDizZUBvBG+sM9pZ+qZUQm+zHvnuBUCh+hBIEFwc8iUxerE
         iwtKRHZgFwq2+enA7mOlb7i6laTCMrvWsLZ13kIMcCRvoGuU4oowHdu026MFa6okJEv7
         A8uC6AubEg8LzzJ4e2qqNqtWIW8yqQipabK8D2fJdBxHkxcU3ZWxh6WFboI+6B25WAMR
         6l9NFGoex5pxZ8vFHm/s3h++8rNrDNiLDZstrxI2qaYss0G+J22k8daRIhDjTlH4vA04
         e7snMqGr0MursrupTPoJVxgTJjtsda3O7Vd1nHNCI7tUMoEUwgedR/Hx2zYUBZ2wKIJG
         D9yg==
X-Gm-Message-State: AOJu0Yw0xw+gw8E59n9EMQiUMGYfC+iSR84LHy15H+2FtlRkz8TTXWa5
	HJh9SEnfU08WkKpE4fudQMpoKrEJ0kPeVIH+qCpOgD33ZKjGBf99NlNwKYmnEYsE62fCQ9TBkqW
	OEU7s
X-Gm-Gg: AZuq6aJG1jk4upvRwHiL4SwZEYznzXCi1AnGigxm0akk+MD7u45RqFz1WzuqVtrp44L
	gkULbuwFOVj3VJiSZ/kjbFKzfLl5ZDB31n+qRU2EAv4VQeeZ3ngzhX2dsjH00wJ0HlMmBMg+kEK
	WgGB85n2G/AGN0WTU+O3LYxfjrsLfql0MYutxCXwXchPPfWjWNCjP/qf0xNLeMMErEWw73/JEBe
	nCHQG6JoDgrN9SPjV7N5908VJ5rkzRMZgWhG6FWGHeYVa9IuJzQBqvfB8TiigsvZpVm23cY36iP
	ORXnElid9zFl9v4NSQeJPymNsk1e9x2ChGjyAngJx0Kk5j+E/Pla9s8Ilv8kROXVVRGJyPHhuFH
	p883+PdoXRMArUvmGyUp/oRyA7Kw6S3Y8zDxDIy3DYgJhOgM4Y7kOUrrWcn2CvLQiGeiC+Y6h+M
	Z4sXEUS8WUIfUcjX6dmKWUS8L41OxLqiiyFq3ti2twEaO6bm4gNdAJSwFSqA==
X-Received: by 2002:a05:6a20:1595:b0:356:3b05:2955 with SMTP id adf61e73a8af0-394673315bdmr8242726637.6.1771262121372;
        Mon, 16 Feb 2026 09:15:21 -0800 (PST)
Received: from adam.amarulasolutions.com ([66.164.55.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6bb25e9sm11381855b3a.56.2026.02.16.09.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 09:15:20 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 1/1] kmscon: bump version to 9.3.2
Date: Mon, 16 Feb 2026 18:15:17 +0100
Message-ID: <20260216171518.155691-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 17:15:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124429

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../kmscon/{kmscon_9.3.1.bb => kmscon_9.3.2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/kmscon/{kmscon_9.3.1.bb => kmscon_9.3.2.bb} (97%)

diff --git a/meta-oe/recipes-graphics/kmscon/kmscon_9.3.1.bb b/meta-oe/recipes-graphics/kmscon/kmscon_9.3.2.bb
similarity index 97%
rename from meta-oe/recipes-graphics/kmscon/kmscon_9.3.1.bb
rename to meta-oe/recipes-graphics/kmscon/kmscon_9.3.2.bb
index 4e27ba218a..2db5162857 100644
--- a/meta-oe/recipes-graphics/kmscon/kmscon_9.3.1.bb
+++ b/meta-oe/recipes-graphics/kmscon/kmscon_9.3.2.bb
@@ -20,7 +20,7 @@ DEPENDS = "\
 "
 
 SRC_URI = "git://github.com/kmscon/kmscon;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "e44ff728e51c5a38b56392abe9bc3e8306db86cc"
+SRCREV = "9ce1dc0dc639e54e243a21d93e13f502a746f0a8"
 
 inherit meson pkgconfig systemd
 
-- 
2.53.0


