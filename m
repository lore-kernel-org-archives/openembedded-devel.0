Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE3C7D5CCBE
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 15:33:49 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.17800.1730302420169552986
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Oct 2024 08:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i3vplLeU;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539e8607c2aso6986584e87.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Oct 2024 08:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730302418; x=1730907218; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ELnlrNoPEENoB/auPJJxNqA9/y99ceE9u0CXqRmp6zI=;
        b=i3vplLeU/evIJqEu66oH9eQeLnrHEkLDw5DlpHTgcNXGFHo5TDkH404D0NT/soWVsu
         pg8HKsrHVM1WDSyiXYrzzFnMNFjWKjEn7WJ3CpYUl0Jp9q60CSMltvqMN8D/kjAwSEv6
         /LXIHckzlSSqcX0vN++on5s/9FooKfhYt11EYp1EiG3tBoc2g3FrYJVb2ZGcQr8jB6nP
         v5X92vtnXRY2VyGZAiNDBdoBwuD+6ltjPA7iHNQaveEUdgm4VH4PW26/8QC8tGdBgsxn
         1sHK9amipRTf1It1vWTVKXm1WdhvIi6k5C/rCKV8SxQMnfTjNUGnMsNPaeiMtyNrQnQK
         ZHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730302418; x=1730907218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ELnlrNoPEENoB/auPJJxNqA9/y99ceE9u0CXqRmp6zI=;
        b=Ak9nqnbpgod2mDKGFwr/8xTqzFmQq7Ibuw79wX4fyrrm4xZ8CB0rKiLQk8wUGu7Dc8
         5jJdSQrR22hgUOLbqPb6PHL/2SL9s0wlgj0uQ+T7+2otjxgqZZ4umAIL9NaaoBGf+Mcv
         ZE6XnLR+Xe8uY0DEExkLdvpOgfk55aY/9PrGxcmQeyAyljZuHYQ6UQPwCK2jRcvtju+b
         Q6MwPKcICQl3KdLXbPd0SZqNhQX25aUtu7xA0bDeqh44WXA1H0zFfhSI1vgGUYBj1555
         EfUODZK2wbA44ZE0tSr9+tihVG+GnHepE4QHZQt50tJJWERhJE4r/wYcMsNd0Cql1nt7
         SATQ==
X-Gm-Message-State: AOJu0Yy3bIcyWrcrm3Q+NqtsFFgbwbjMdMihzV6pzj8EGIQ/ptyDNnG/
	OFvtEatLwDYBHVWjk+V/VgprmAFt9nB/zE7+7idaMC/zrUOASg7eEsBU6A==
X-Google-Smtp-Source: AGHT+IH6da4XAjgVdxRBOSJ8K4t+yVbGVB6v6veiAtTF2teXQ7dJhLZuvXgkI27GFO5ZZO+ZClYUew==
X-Received: by 2002:a05:6512:ba2:b0:539:968a:9196 with SMTP id 2adb3069b0e04-53b34a2d6e3mr7195632e87.48.1730302417355;
        Wed, 30 Oct 2024 08:33:37 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb6257f37sm4797851a12.19.2024.10.30.08.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 08:33:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH v2] libgpiod: drop wrong S assignment
Date: Wed, 30 Oct 2024 16:33:29 +0100
Message-ID: <20241030153329.255181-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Oct 2024 15:33:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113347

* the default from bitbake.conf:
  S = "${WORKDIR}/${BP}"
  works better, because it points to correct directory even with e.g. when
  building lib32-libgpiod with multilib

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
index 3d9758e27a..00252dfe64 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
@@ -17,8 +17,6 @@ SRC_URI += "file://gpio-manager.init"
 
 SRC_URI[sha256sum] = "ee29735890eb1cc0e4b494001da5163d1a9c4735343201d22485db313601ca07"
 
-S = "${UNPACKDIR}/${PN}-2.2"
-
 # Enable all project features for ptest
 PACKAGECONFIG[tests] = " \
     --enable-tests --enable-tools --enable-bindings-cxx --enable-bindings-glib --enable-gpioset-interactive --enable-dbus, \
-- 
2.47.0


