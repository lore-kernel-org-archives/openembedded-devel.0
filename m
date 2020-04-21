Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.1593.1587482377311154710
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Apr 2020 08:19:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uHXZqCwr;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: andrea.adami@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id f13so16876665wrm.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2020 08:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=deMQ7W7CXdQ24wrUCveRF7zBTfToVcVXEpx+bDNsyv4=;
        b=uHXZqCwrq/2tpOg70EGG8WYjJet/qegOuFAwBET2Y7rbplNmWJuwmuhXvnS8/PB+85
         lcAYkJjyvqnv7VEq7Q9dFd2CaUrcZuTQq+im90Kqb1xGOqCxo4t/j7zL/sNJUtXPAlf6
         x6dskD+POuIBMyQexymUXgHhsR/Tgdxg6gN8VYoE1NQ7QEO+Y6I7LytinHH54Kv/CjYX
         XrnlPi7tqzjoqulU1ar0Fx22TydVryemr8pYe0TzAtZBHJI7kQrtlyzCj6/hgr4F5gES
         40RC5kcCkwt3C1fy6gaPhKAs3HvBdJLG9VdnP3NhEaK1zaZ0q1j/kfoigQoDOD9vXXYr
         /l4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=deMQ7W7CXdQ24wrUCveRF7zBTfToVcVXEpx+bDNsyv4=;
        b=VVG5YRYYaB3Yaqq3auO9zJ++MCOTlfLs7yMVDDnjBZ4gaqpUzuG0N8u+xkTEI9f46w
         5WcgPnv4iIKdpQ3ZnQ0PIs59lUwY/B15CylutzZB/yUafj+G64N8OmeNLMXUL2rOnMX0
         mSr0+ZD0fDKmjHCVecazcTgDtnIbp1GltYNGEgvhw3EDEt6LOvq/IiaXASdY8OXSMBo7
         6Ndw8QYFZA/f2n6Ho6LAwmHaQ2O6Ly5jMc6FRybzEq/p2+VxeVKd+WWIsqxiDqgUG0+I
         PIXUcbbzgVUelupEnznJhR0uwskMv5G2R8neL40nVBbh00S89pvDEi9C2JHUNZIdZbk4
         44Ww==
X-Gm-Message-State: AGi0PubWKD6Q9Q2Z8EOB506+QbZJABIILCG5rcpBAuVjbmeYDSlOs6/e
	c/oHGbXQaDYeBR/xz6s6Gc66g3H7
X-Google-Smtp-Source: APiQypJxEFbMXTdJX9OtbePPO3f7DOHUvKzi4AcHoSsU7G2h3mt6qHqPxJG9bdRCSaDxmzEtodV5Gw==
X-Received: by 2002:a5d:4752:: with SMTP id o18mr24256457wrs.283.1587482375468;
        Tue, 21 Apr 2020 08:19:35 -0700 (PDT)
Return-Path: <andrea.adami@gmail.com>
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it (host220-224-dynamic.250-95-r.retail.telecomitalia.it. [95.250.224.220])
        by smtp.googlemail.com with ESMTPSA id h5sm4407674wrp.97.2020.04.21.08.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 08:19:34 -0700 (PDT)
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrea Adami <andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 1/2] meta-initramfs: put images and initrdscripts in recipes-core
Date: Tue, 21 Apr 2020 17:19:31 +0200
Message-Id: <20200421151932.13070-1-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../{recipes-bsp => recipes-core}/images/initramfs-debug-image.bb | 0
 .../images/initramfs-kexecboot-image.bb                           | 0
 .../images/initramfs-kexecboot-klibc-image.bb                     | 0
 .../initrdscripts/files/init-debug.sh                             | 0
 .../initrdscripts/initramfs-debug_1.0.bb                          | 0
 5 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-initramfs/{recipes-bsp => recipes-core}/images/initramfs-debug-image.bb (100%)
 rename meta-initramfs/{recipes-bsp => recipes-core}/images/initramfs-kexecboot-image.bb (100%)
 rename meta-initramfs/{recipes-bsp => recipes-core}/images/initramfs-kexecboot-klibc-image.bb (100%)
 rename meta-initramfs/{recipes-bsp => recipes-core}/initrdscripts/files/init-debug.sh (100%)
 rename meta-initramfs/{recipes-bsp => recipes-core}/initrdscripts/initramfs-debug_1.0.bb (100%)

diff --git a/meta-initramfs/recipes-bsp/images/initramfs-debug-image.bb b/meta-initramfs/recipes-core/images/initramfs-debug-image.bb
similarity index 100%
rename from meta-initramfs/recipes-bsp/images/initramfs-debug-image.bb
rename to meta-initramfs/recipes-core/images/initramfs-debug-image.bb
diff --git a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb b/meta-initramfs/recipes-core/images/initramfs-kexecboot-image.bb
similarity index 100%
rename from meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
rename to meta-initramfs/recipes-core/images/initramfs-kexecboot-image.bb
diff --git a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb b/meta-initramfs/recipes-core/images/initramfs-kexecboot-klibc-image.bb
similarity index 100%
rename from meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
rename to meta-initramfs/recipes-core/images/initramfs-kexecboot-klibc-image.bb
diff --git a/meta-initramfs/recipes-bsp/initrdscripts/files/init-debug.sh b/meta-initramfs/recipes-core/initrdscripts/files/init-debug.sh
similarity index 100%
rename from meta-initramfs/recipes-bsp/initrdscripts/files/init-debug.sh
rename to meta-initramfs/recipes-core/initrdscripts/files/init-debug.sh
diff --git a/meta-initramfs/recipes-bsp/initrdscripts/initramfs-debug_1.0.bb b/meta-initramfs/recipes-core/initrdscripts/initramfs-debug_1.0.bb
similarity index 100%
rename from meta-initramfs/recipes-bsp/initrdscripts/initramfs-debug_1.0.bb
rename to meta-initramfs/recipes-core/initrdscripts/initramfs-debug_1.0.bb
-- 
2.17.1

