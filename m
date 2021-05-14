Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.10250.1621006628882099933
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 May 2021 08:37:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ApKHMxlF;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id q2so24795451pfh.13
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 May 2021 08:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tSqnpWlKCWltcwDWhvJgJQzE9ydmL0kbYwznwUYqe1Y=;
        b=ApKHMxlF8hXguHUGXmXTUvfzm8iJ6v7ncRPQ/HjI1axLfEN5wazEdTzVY91uq6Np0n
         QBkDOVF2MC2QQU0fX51PG2SIgX+kfktax+EAMiW9M7RFiAG/YogQmZFpxJsDSaleQ5WN
         nPUoUOLwZ6zIihYo5kVqvTTGE6wTdDX74HPM5QqdwifAiWdgndk9Jhjo1FCdQ52Yc1DK
         cEO+1tzP1q8kgPwHYWY/RChcKKuSd55dtIUVFSEUS1peupweWZ3k+hgV1Y5GdF7Th3ag
         ZPI2o8jXRI8o+NgEV+rWZo+6QBqzLj5QXTmnGPvubBFFSh4iIOLSatTgN6W9rtz/0go5
         IbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tSqnpWlKCWltcwDWhvJgJQzE9ydmL0kbYwznwUYqe1Y=;
        b=Zo7hQ4LgoDISb2efuK3gBw0eM9PapO9vGtXEcRcKHbtbyDPLFhgnCqZswt7l6ujGGn
         xsucnilnC2Jajkhk63gMugh2Ye12JVBOaPp1nWnYni/JkdV0+GOXW5YnBK3MSkoih2wg
         z64VVpYEIxoTBf9iPDzolaxoRhvlnKX+zFzLlJ1rJbOZGZrA65eN+zLEx8XaQdkfXyjP
         529/tTxxqiwMq7pYri0ePrHFsKt1pfZhACMfr6Xz0CxdXyA/pehDaL9iB5ixehfy9k1a
         CB4RJeFa/gXSJvQ79PP6hhlLzjJcKHUH2iJ8Pg6/FFAb20q2QC2Dr3eVzPHXPJ4yrlBi
         Of1A==
X-Gm-Message-State: AOAM5304V0G+4YyoryAJU7e8sVScHBPh1rImIfhgLxi/kOoiVtOe6vKJ
	lAR7NIUh4iXNyzVSy7ccHxqf9Au8rqQ2Gg==
X-Google-Smtp-Source: ABdhPJwDBm7mHe6ek8i6oW/oEf53P5LoUo3A7w2Wkdadz+1hcd543zMV2TZ/7nlboxtKw6TaAmYtrg==
X-Received: by 2002:a65:43c9:: with SMTP id n9mr47263113pgp.19.1621006628172;
        Fri, 14 May 2021 08:37:08 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a7ac])
        by smtp.gmail.com with ESMTPSA id g2sm4255194pfj.218.2021.05.14.08.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 08:37:07 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-gnome][PATCH] nautilus: Exclude from builds
Date: Fri, 14 May 2021 08:37:05 -0700
Message-Id: <20210514153705.3040536-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It does not build with latest meson upgrades from OE-core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/nautilus/nautilus_3.36.3.bb            | 2 ++
 .../recipes-support/packagegroups/packagegroup-gnome-apps.bb    | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_3.36.3.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_3.36.3.bb
index cf138d9739..3ed472bef1 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_3.36.3.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_3.36.3.bb
@@ -35,3 +35,5 @@ FILES_${PN} += " \
 # mandatory - not checked during configuration:
 # | (org.gnome.Nautilus:863): GLib-GIO-ERROR **: 21:03:52.326: Settings schema 'org.freedesktop.Tracker.Miner.Files' is not installed
 RDEPENDS_${PN} += "tracker-miners"
+
+PNBLACKLIST[nautilus] ?= "Does not build with latest meson, perhaps needs upgrade"
diff --git a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
index 593e5866d1..b86fd03a73 100644
--- a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
+++ b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
@@ -18,6 +18,5 @@ RDEPENDS_${PN} = " \
     gnome-photos \
     gnome-terminal \
     libwnck3 \
-    nautilus \
     ${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'gnome-system-monitor gnome-disk-utility', '', d)} \
 "
-- 
2.31.1

