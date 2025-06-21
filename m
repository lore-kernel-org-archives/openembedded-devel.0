Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC55C71157
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 10:40:22 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.4974.1750502420481207143
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jun 2025 03:40:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b5BWUBJh;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-712cba3c6dcso12632177b3.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 03:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750502419; x=1751107219; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3chMAMMysvKf5kvIYfKv5l5ZadJ7YP6PEJtqqD/pHPE=;
        b=b5BWUBJhXp2UUw5ukIHsa7oNpOk6NX0PYS/8Iw0vm4sy88gqFZsKJPjELa45QCezib
         TlRfTiUFgsGuuJ9DpfNen5xlyIVHiNEWUsFYNsEkKBOdQwqDm8YA+QlpM9jtTRUjS2xH
         tHpTBGWYSndxFsq7f1dx3e+ttgCkFCUBi+wYtAUg/bwVB3EEx7f10CifC2t94FqPkRVg
         ySaHP3drvzfL0UL4xrXArR8PAAP/3zJc7C1vn7YKxY+Oh7yS2vFYnDp+922aXu277DrA
         ln6xrMXYdYdCS/jwR2fB5JaPll7FAOoUjdyRnXFQIvfsuybX3xmSvSktNiKwxg/7fX0v
         gKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750502419; x=1751107219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3chMAMMysvKf5kvIYfKv5l5ZadJ7YP6PEJtqqD/pHPE=;
        b=cgZvxyyy8EOeTCOeLBqXX32QJYw0glRjEzXwzY/LnZyFLHe2Wsk9qFZJy8TEQgeipA
         y14RwiI9a9FgsxVWAFuvTl/eypOP84yhywWrRoi8y4FwpFFSHSowHNx4QKzAz8xgB0O8
         RMcodM48Cj75Fc3I6CJ0tzELvc07CZl5six0nIqfqu17pNihoj54Awz7J2t69hnpRIDx
         qZt3lsdzLjDy/CN3aaFauprax8br8VxWAWGOIDLrEL2L9FJ9ZYekqUNkDyGO8tg+9+tj
         lop9AuAHXz/nowFUuqvdLQ9xDDGQkhz/D1vyH14GXcbtqq7n02AGP1vr3AQTTObTRLeA
         zjVg==
X-Gm-Message-State: AOJu0YwJ2m2jL01wFCF/iKUUE8Brd5Oze8wW/SEnPIjEPasUfvL1jI9T
	aTVAFrwYjAKcaxjtEtJUpK15GZKcZThcjft7fSEpwVz9+AnfSsyUkxpWyfxVAQ6G
X-Gm-Gg: ASbGncvHWm+mt6Or3UTiD2dTX6Kfxo+4Ay4KC9jgvhz8OD78t21Axf2qfv32c1sZmHE
	wseOqNDQnikNz9qbgeWwY7Y8Rdu+QpoPyGSzGGgloWSsG8YuNNuX6wL6Brs2Mh/1xW7NnNB13+k
	97MlXjwhoPeD2fUask1rx1EyOs196+jxDx8dV3oCrglULN8YDsqVqvOYWbCzxv/3IrMUvKbN7kk
	LIekPIVilny/uNntiiTsBk1v1xj+3Neo5AwjKUT+Tyq+VibFX8mKuYKWXjBgQVbsB7QzLOH1dmR
	CpF/WRwDVN5lzfhvvUJDsj7rx/zey4Gw1mZib3yOvsY8D91Cmhc9nBUo6d/CFkjuDnoLrKHt9lq
	rKA09sRoARZHVjv7kjjrh
X-Google-Smtp-Source: AGHT+IGUDrBCPsuf0pE0MTxd+TQHx2VE6R5wNspq26Y5eOsDV2F+fYB+MJNNsI31jxgRhYoZ8edUjA==
X-Received: by 2002:a05:690c:6704:b0:70e:142d:9c4e with SMTP id 00721157ae682-712c651255bmr94725937b3.26.1750502419000;
        Sat, 21 Jun 2025 03:40:19 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-712c4be2c76sm7792147b3.102.2025.06.21.03.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 03:40:18 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 1/5] libxfce4windowing: upgrade 4.20.0 -> 4.20.3
Date: Sat, 21 Jun 2025 06:40:05 -0400
Message-ID: <20250621104010.766706-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 10:40:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117997

Changelog: https://github.com/xfce-mirror/libxfce4windowing/releases/tag/libxfce4windowing-4.20.3

Changelog: https://github.com/xfce-mirror/libxfce4windowing/releases/tag/libxfce4windowing-4.20.2

Changelog: https://github.com/xfce-mirror/libxfce4windowing/releases/tag/libxfce4windowing-4.20.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...libxfce4windowing_4.20.0.bb => libxfce4windowing_4.20.3.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/libxfce4windowing/{libxfce4windowing_4.20.0.bb => libxfce4windowing_4.20.3.bb} (83%)

diff --git a/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.0.bb b/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.3.bb
similarity index 83%
rename from meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.0.bb
rename to meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.3.bb
index e16997ca11..988814a22f 100644
--- a/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.0.bb
+++ b/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.3.bb
@@ -1,11 +1,12 @@
 SUMMARY = "Windowing concept abstraction library for X11 and Wayland"
+HOMEPAGE = "https://docs.xfce.org/xfce/libxfce4windowing/start"
 SECTION = "x11/libs"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=435ed639f84d4585d93824e7da3d85da"
 
 DEPENDS = "xfce4-dev-tools-native libdisplay-info libwnck3"
 
-SRC_URI[sha256sum] = "56f29b1d79606fb00a12c83ef4ece12877d2b22bf1acaaff89537fbe8e939f68"
+SRC_URI[sha256sum] = "df2419a6bd960c0bfac3307eff593050857524642597eb35a26fb4f8261a017b"
 
 inherit features_check gobject-introspection gtk-doc xfce
 
-- 
2.43.0


