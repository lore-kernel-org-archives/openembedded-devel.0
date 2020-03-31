Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.5480.1585646995253246639
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Mar 2020 02:29:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=gQzOD7EW;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.65, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f65.google.com with SMTP id m11so19121684wrx.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2020 02:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nq1wDzbP/RwjCNxG1Xfz8D0uxIwfzIc8RP9RTZbiwac=;
        b=gQzOD7EW167a+8NNsgnD+BhR5NIKm8CnNmGD+1O1fWzWLrBthAymWLXUQFVKosuakc
         nxqvgDA8SvHUYfedXvD+83rmkXftKW47aZ6DLC+ru4Y/cmF0GLPqY5Ob2YuIJfoN4bL+
         G7c/pMLyRHr9f3jgGixQ1jfvqR+H+CjzBk4LFx7P++gu35Xh/0mEY6dA5cC6XHrOjyiL
         nxJHtY9AfNeZWmvYQn+cQ0SFLTZI++bkWA8unqKrChKv5zLO0omTnxT99Lvgfp0cwKov
         zGmzDG+fXpkm/Hszna02hNZpfv8Ljric5mIgdkverMXqH/HEXtNFC5jm5zrbUdpKw1ET
         fDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nq1wDzbP/RwjCNxG1Xfz8D0uxIwfzIc8RP9RTZbiwac=;
        b=KK1He92PzEM56FT+dqamXQVQ0V1vCKmVHfpeNETuUeG3AiBukidNCruzHO7sAMDSjF
         bkGZsZIdJPfWUlAtE87O+lht65kj42Sk4kmgK3lQnLAYgzfqGLyVJ+Y0zT0MJ0bXogQ3
         7g4LbRxaMonuRWL0PVXvN0ka5WVXT/LMO9GvYDZhgXAJRkHz8Tz6HRQ+0s3tlm+Dw7jt
         BAPaqWMlGON9uQMdXK2ElhctgzWn9fcHOFD7naOGYELDWQ2LonO44euSeCX5ZZW1PrOg
         gaCfIlekV3fa/RJCRgZmMDRC2n9q+Tf56Q46ZDJngwirwMvBxVP8kLbd8vJo9f+6BAkl
         wyHQ==
X-Gm-Message-State: ANhLgQ3qb9tv6Pf8pJIIFSgRcxkfZF1crVuUAckb0BEoEIXfxf0/SObi
	LuGHMxsVZo4glA/DIcQeekj/IA==
X-Google-Smtp-Source: ADFU+vti14y1iV+WN5lhLddv72yF9ME3LR8oh8h0BF/irYsOLRl5F8tFKbTnf0UtvuX4SaGNXDrKDg==
X-Received: by 2002:adf:e448:: with SMTP id t8mr20796419wrm.229.1585646993714;
        Tue, 31 Mar 2020 02:29:53 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id y7sm28683376wrq.54.2020.03.31.02.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 02:29:53 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-oe][PATCH] libgpiod: update v1.4.2 -> v1.4.3
Date: Tue, 31 Mar 2020 11:29:44 +0200
Message-Id: <20200331092944.1336-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This contains a bugfix for gpiod_chip_open() failing for symbolic links
to devices.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../libgpiod/{libgpiod_1.4.2.bb => libgpiod_1.4.3.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_1.4.2.bb => libgpiod_1.4.3.bb} (80%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.2.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.3.bb
similarity index 80%
rename from meta-oe/recipes-support/libgpiod/libgpiod_1.4.2.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_1.4.3.bb
index bad88a54e..a6320da8e 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.2.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.3.bb
@@ -2,8 +2,8 @@ require libgpiod.inc
 
 DEPENDS += "autoconf-archive-native"
 
-SRC_URI[md5sum] = "b552bfa87685dfd728a1485e914bfae2"
-SRC_URI[sha256sum] = "b289b70e3d63a8e06205f7445d5342f4742277c267ce24a7c4d0017fff339e41"
+SRC_URI[md5sum] = "d4826720a8de13379436f9c207237bc0"
+SRC_URI[sha256sum] = "0ad080d1eb89c422cf13001293ffa72869ca13028e85dab5f6b3ba90f88da46d"
 
 # enable cxx bindings
 PACKAGECONFIG ?= "cxx"
-- 
2.25.0

