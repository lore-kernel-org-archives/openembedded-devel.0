Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E81C02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 12:08:20 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.41929.1737547693564564696
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jan 2025 04:08:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ADGVAmf6;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3863494591bso3700063f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jan 2025 04:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737547692; x=1738152492; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kasNOPXpWMYz/FafU/6i+SYH3YyV1/0n2IHFxJ2S6JY=;
        b=ADGVAmf6vDL0VcScw8gN6qFa47EjgD2nYj/A4jtW1ZS6M3tqSmphRBS0lTVxjyZ5sq
         089LOEq8e/dKwbqwfHHV7NaWjDRkM6TF5kN/pfWisY8I96LGozhSoFYMhI0j7SPF9qRJ
         cYQpIqHmPi0521nQXKzZJBcJZC1soQ3F+59pu/H/QgkG2CccBO8+MP244uPWkRn+cJMF
         OE7XDGm5Z65wcgrCPmle1W7EdUEMD7OXZNV86fJxgEeMJ3rlJStGJPKlElAFSzzuBfU9
         gqFEjv30MdEf95Luaj43UN2mxEjEzIQHmTt7sCt3oQRCFxUHjRFR2DjKDXySELmgYbLu
         zruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737547692; x=1738152492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kasNOPXpWMYz/FafU/6i+SYH3YyV1/0n2IHFxJ2S6JY=;
        b=DL4TYrP86KhV2i+MCFSDWVFjUjP8MgDzI8jB9TU/mAEii9PTVhCwVAvWK7cgY/AraE
         4qEVtNG9OOFRWykpEVacLVWUWpL7edkek13SRJP2QhGm9CiGMgKjoBVKN8unoMADh3pp
         BGp5Le4D+E5P1dj0KXyqGt/VkTPDjRGW0v1Kf+rtCzmaUhNABcTG3u6xYtGbMKVzSoDp
         t5S25Mlr/ZRdhY9wPdMXvwOiOkGm1G5vTXZjl7MHrTos9RchTp8aB4U1FysUXptdEVhM
         nCi37M4hyHtWvGBT7T3llNJ3OG9w7RXE5j8tGr8oVcdWgmcdXvAOB52PNEoUt6CI/74u
         dzgQ==
X-Gm-Message-State: AOJu0Yx/99kSFf37v46+lUFoHniCM4i04tyf61RRUX1ltyJZByBwPmJl
	9HUlYunR6fe88PwJOwvM0HW9Ks+fx58wStPRx+/pDeTjVToAgu7ok2t3ROBu
X-Gm-Gg: ASbGncs6E6f6zwDjZkVYLBUAScYiw0xbR/ci1YjAK9kEYvJbmkHitbnM+LQQmi8NaYd
	V24Bip+NAdaLW7pqwFmio0EZxh03My3OA2Wi9it27rqicq9i9by4Rw0vE7mVUpr/acVkqBj9Alc
	UAf7D+eTM4wT8M8JHPcIVjF+UpZG//PJwbGQWUyfAhGdBXVNx/ZhNHcQTwRIsGeYD7kLFCviVbT
	JTUHbpHv34JtaSxcP35bxXGiXalFbRqAfifqenu/a4/ZVhVV9rmBB8n9i9IlmpnYORCpOW3ujL+
	wEzLAamhMg==
X-Google-Smtp-Source: AGHT+IEgCEX4d91x7cuprpE/6eoKS4jRYRIknAGJEaLXprFNOntUELhiKsJdtEZkxN8TAD4EKTyZwg==
X-Received: by 2002:a5d:584b:0:b0:38a:87cc:fbee with SMTP id ffacd0b85a97d-38bf568414bmr20056109f8f.14.1737547691878;
        Wed, 22 Jan 2025 04:08:11 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221b70sm15833997f8f.26.2025.01.22.04.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 04:08:11 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [meta-oe][PATCH] dbus-cxx: fix typo in PACKAGECONFIG
Date: Wed, 22 Jan 2025 13:07:56 +0100
Message-ID: <20250122120756.2502609-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jan 2025 12:08:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115015

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
index fbe1e3475..d4f693d8c 100644
--- a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
+++ b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
@@ -29,7 +29,7 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG:class-native ?= "tools"
 PACKAGECONFIG:class-nativesdk ?= "tools"
 
-PACKAGECONFIG[tools] = "-DENABLE_TOOLS=ON,-DENABLE_TOOS=OFF,popt cppgenerate"
+PACKAGECONFIG[tools] = "-DENABLE_TOOLS=ON,-DENABLE_TOOLS=OFF,popt cppgenerate"
 PACKAGECONFIG[glib] = "-DENABLE_GLIB_SUPPORT=ON,-DENABLE_GLIB_SUPPORT=OFF,glib-2.0"
 PACKAGECONFIG[uv] = "-DENABLE_UV_SUPPORT=ON,-DENABLE_UV_SUPPORT=OFF,libuv"
 
-- 
2.48.1


