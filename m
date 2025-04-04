Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B86C36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 19:42:46 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.6019.1743795755628841476
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 12:42:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c4jR2xFA;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7023843e467so24118687b3.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 12:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743795755; x=1744400555; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yOcK211/mg8arrkzzBnbd2G9CVY2rBXHLvPtn1npi00=;
        b=c4jR2xFAV6DVbUs1sqV6Mv4BVYlSCVczQi4TFH8pZj+dZh/p86JJxtaZFHZT383QUU
         VygKk407Hr1AXjxB5XcxAcT8SKKglQoLlNWYqTlMr0pGxiLQNUE3/+B3jX8ep4llZriG
         +ed/+BxduE+bWRCADWNje2H+LRekqI7yjdgOR6F+zOpiaBHMju4kcSqwyXVn5cNCKZ6y
         rykGTXTDcGbO8+hK0sTKQDw16ZnrmNNS+338E1MY6DdwCltqYRoVQLgy4goLSLkDuwLW
         C1Vh4Y8oa0b/rRCg32uYQ/UBDfa/v2AJLoiNXypvVJKOuZfXJj+47nxa9SQG2Tkuew8s
         76zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743795755; x=1744400555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yOcK211/mg8arrkzzBnbd2G9CVY2rBXHLvPtn1npi00=;
        b=BY2H/tYbYoeAZCdKFDLm3JUiqMgK7t85y3A5spqpKxA/ABzp7TaIu2ODLEs//b1OeG
         9Hm5RPJBf8+G1F7KEt7ppqvPMVm+Vkwh8Z7JODqS64gN5oHEOEIgwxdw4w9Ze7zkQ4Bf
         jRWfqDO/pV6b7TlgkrfUnB1aYarg4Kq83LfkvoNjajHGGLwOUNYxagAsQ1ea2m8AysaY
         MNyjzfcAfWDFR1lp6zRK2myUu+jw/+6OiGYhGgti0HRkOt274to+9ZK7zRcqCfp8fOV6
         TVuBMArX/wcuhv14NSwdQnkVLKRImHgKsptPU9SgnzWtbWGF6k+EZPMpkX3eQ1YwE8Gx
         3pGg==
X-Gm-Message-State: AOJu0Yw5ghluWm6ehB4W69jsXOY4zxoTqy05TeHzYkffr70P8c2tREbY
	xEkP7I++mOtrK41bfjr38nWe9McsPbl6Vzyr0mRNcwf5ccieOXpBQyrLma5q
X-Gm-Gg: ASbGnct1pGBqS0XiTjY00sX+0Lj6pYl2eV5Rp8Eld9nvGvaCWuLakPboLprTnQxKy2v
	oe3JACksu1XdFwnCF0Je3o1fpiOSPKCbtJHEMidqjCoiUDYR+o7z6x+nry4xxrOtXpfIbfegAF5
	7Gdu68tJ/wt4XjCcj/P1JXg4RR1el34V+Es819gkSACYincKSxk4m3gw4rQoeIYtJfPhQalAhLq
	er62bEYv4RZEfcmNO45DmffSXJKRR4wWnDmQinaiurZ74N0ILfSS0gX1TkAF64qu2OnQorDA8nI
	79CUw9MHsRCpzwUw1c8yAFisFgY3aJTQ43TQx8GUO3BTHZEZGA==
X-Google-Smtp-Source: AGHT+IESR9GzKYoFOH1ozKFnn/R/ZaHfoN1eEEfTAJa8pda9truqKOgP+7nZgvpkzZtvSb4fGowNTA==
X-Received: by 2002:a05:690c:6c0d:b0:702:56b5:b3ac with SMTP id 00721157ae682-703e154aff1mr79205357b3.14.1743795754191;
        Fri, 04 Apr 2025 12:42:34 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-703d1faac10sm10394867b3.97.2025.04.04.12.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 12:42:33 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] Fix warning : lack of whitespace around assignment
Date: Fri,  4 Apr 2025 15:42:22 -0400
Message-ID: <20250404194222.173938-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 19:42:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116593

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-oe.bbappend    | 2 +-
 .../gnome-layer/recipes-graphics/openbox/openbox-xdgmenu_0.3.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/dynamic-layers/gnome-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend b/meta-oe/dynamic-layers/gnome-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
index f15b36184d..596255951e 100644
--- a/meta-oe/dynamic-layers/gnome-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
+++ b/meta-oe/dynamic-layers/gnome-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
@@ -1,3 +1,3 @@
-RDEPENDS:packagegroup-meta-oe-graphics +="\
+RDEPENDS:packagegroup-meta-oe-graphics += "\
     openbox-xdgmenu \
 "
diff --git a/meta-oe/dynamic-layers/gnome-layer/recipes-graphics/openbox/openbox-xdgmenu_0.3.bb b/meta-oe/dynamic-layers/gnome-layer/recipes-graphics/openbox/openbox-xdgmenu_0.3.bb
index 98184b2236..2dfeb177e0 100644
--- a/meta-oe/dynamic-layers/gnome-layer/recipes-graphics/openbox/openbox-xdgmenu_0.3.bb
+++ b/meta-oe/dynamic-layers/gnome-layer/recipes-graphics/openbox/openbox-xdgmenu_0.3.bb
@@ -16,7 +16,7 @@ SRC_URI = " \
     file://fix-menu-generation.patch \
 "
 SRC_URI[sha256sum] = "824e099928aab2fb628f0fa4870ef7bba10b95581e47c2d8fa216709a0f399b3"
-UPSTREAM_CHECK_URI="https://launchpad.net/openbox-xdgmenu/"
+UPSTREAM_CHECK_URI = "https://launchpad.net/openbox-xdgmenu/"
 
 inherit pkgconfig features_check
 # depends on openbox, which is X11-only
-- 
2.43.0


