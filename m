Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCAC3C25B77
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 10:49:32 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.7084.1716374971283479758
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 May 2024 03:49:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=Mz5IrM07;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4202ca70318so38209845e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 May 2024 03:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1716374969; x=1716979769; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MCZeyJDJ3NneZyxRiOoUYGUFlPWsVr2hWxKYpBschRA=;
        b=Mz5IrM07IKRgmmvPT1d9FIfNg53yJ8LwCR5me3ejK0dEDdgHFa3/4FcS/W5FywU64z
         sZF8eQH6Srpp1QDBhxLCLmU+g+Ye+/+JS7dWMXIWcSfjTwAk68dkxhe3kqZYQmV9EtI5
         h3t6+7A9PBiJ7PXwGmjx/VBFuc8D4NAGh8agWQZh5q3He4hjdg0UhmRje5GTtotkZQdF
         VwrRXJMxR89Ef4RhdkIKWy7cElaRUZLTo02N7zHdYQdcIHus/Qp1JaBMG1cFujOUOH+2
         xG9mxBJ5q5g6RCbizPhi9EzvKRg5nf2bE48whS3cAErmwR+k1+z/Jq06OfxhlfoZuBOE
         5CWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716374969; x=1716979769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MCZeyJDJ3NneZyxRiOoUYGUFlPWsVr2hWxKYpBschRA=;
        b=QQWt8M2pB1BOPJk2/8xtTUJQZWecbyS6Bf85GQypUfZCdJUVaVVu3zZ7eYOqKuMgA7
         FKfEY8xIIj57d5DvqwJKejEQbyGA+WcI6m+rxTN5LdNBJE0JY3Pvig1LgGnnCHMJyQzQ
         iE4YGCNel0/Oe4x80kopfljq0Ki2L3clxsVuRneidYvUFHB+a7PGW08WKGf8omr54RHh
         4RA7h8kRj4m1ZPZJngF07CZZU0eWmM3N8fTE8zlkQi/o7/2g5jmdqt6/EDZI2MHmrTb6
         t49CYLEwetTKkSlbbW9J/NfILRgTzRLBlCQlnCBpS8FcePhEK6dqUDP4aSUON4hQtQZ/
         F7Yw==
X-Gm-Message-State: AOJu0YyXxZaM7ERpYbjRR0s9qROn+jO8iU3FidnHFnCGpmaWJzljVv6g
	lgaXKqPBFPk3tsfY7X1AoMMTukR0lSJaoliSbpSSXSXQzWyQyoSopMX7MOqsvxj+V/T6geJxoLo
	a
X-Google-Smtp-Source: AGHT+IHZ0fk4wh6/fNOBzP9tq9195QAVwEj2lRHVqg5q5dnbeA6nE4QKqVvmHHRQxVFxPx3mG7TsAg==
X-Received: by 2002:a05:600c:444c:b0:41a:bdaf:8c78 with SMTP id 5b1f17b1804b1-420fd2dcf14mr13189635e9.8.1716374968896;
        Wed, 22 May 2024 03:49:28 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccbe8fb5sm494301305e9.9.2024.05.22.03.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 03:49:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Alexandre Truong <alexandre.truong@smile.fr>
Subject: [meta-oe][PATCH] packagegroup-meta-oe: fix lvgl inclusion
Date: Wed, 22 May 2024 12:49:05 +0200
Message-Id: <20240522104905.2054459-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 May 2024 10:49:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110483

Since commit f7fedd156374 ("lvgl: Upgrade to LVGL 9 series"):
* lv-drivers and lv-lib-png packages do not exist anymore
* lvgl does not depend on "wayland" being in DISTRO_FEATURES

This fixes these warnings (e.g. from AB[0]):
  Nothing RPROVIDES 'lv-lib-png' (but [...]/packagegroup-meta-oe.bb RDEPENDS on or otherwise requires it)
  Nothing RPROVIDES 'lv-drivers' (but [...]/packagegroup-meta-oe.bb RDEPENDS on or otherwise requires it)

[0]: https://autobuilder.yoctoproject.org/typhoon/#/builders/156/builds/367/steps/12/logs/warnings

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Alexandre Truong <alexandre.truong@smile.fr>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index c5f8dce97..19242ba54 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -511,7 +511,7 @@ RDEPENDS:packagegroup-meta-oe-graphics ="\
     libsdl2-net \
     ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "libsdl2-ttf", "", d)} \
     libsdl \
-    ${@bb.utils.contains("DISTRO_FEATURES", "wayland", "lv-drivers lvgl lv-lib-png", "", d)} \
+    lvgl \
     ttf-arphic-uming \
     ttf-droid-sans ttf-droid-sans-mono ttf-droid-sans-fallback ttf-droid-sans-japanese ttf-droid-serif \
     ttf-abyssinica \
-- 
2.39.2


