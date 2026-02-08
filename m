Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8BACEF06ED
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 20:03:51 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32852.1770581027350502140
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Feb 2026 12:03:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=civNQ7Vk;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48039fdc8aeso23221355e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Feb 2026 12:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770581026; x=1771185826; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tCakr/qPNyVd2Sn9Nzpa5Btv6FqD3o+WlhElyWXv/vk=;
        b=civNQ7Vkr/UlKqYq+x3PGK6XwYJTNwJ3kYLiL9jDYGxphvhift8pQhQI/HH+kjr7eV
         RoJRtgZ4Mp8Tqvbl142wG8YNweF34zQKkv36Xd5lqApDe5Ov7F16PWgFYkROYk9cwolI
         6obbtuGjWOM60UGzJh0Nf3CPIHb/Edt+Dz9pnnvyycfYrIUkl0CBiVEJAMHyjYEPdEgC
         OfKaf3r//I6192S4WApF1nNax5SqlZcovJVtjYOIbacDOQaQZURn4DkBhbDpeBiVATy2
         vECaECl0EoLvd1hp5ZT2Rg6HpkskFtAVaViDLaEKZ4qhcJLj4gR4aF++TreN7ExSYhPT
         glxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770581026; x=1771185826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tCakr/qPNyVd2Sn9Nzpa5Btv6FqD3o+WlhElyWXv/vk=;
        b=MMoJ0ZIcUf0Xj1Kar+ZD5nKWXms0JVJ+Av70vuayHmSbxGPriNUYxz/kqQ2hmzEpTm
         7KIZBPQOwYwXKtYlh0eyOjgnFlwPBUDbG2rIK5n23OyTU604c+i0IMNwBA1DJB4Th6mO
         jRoZl/CZDLnn+IAHYYcxt5SXtG8mHH2+Rm+NuRJTNbfeB+ExMlQyn4qg4YgQ5v8HyOUz
         5GYcLQf+bRzCpDqYVnqNJBxZgon0JqY9CAk+1ic+wFKcixH3MZu20gwGTcapLiIWfwZ5
         kQiWcuTWiKfgO0OqG26nfsJ4vQunnPkOIPawF3lQZ6Lz1oCGVEM4/Rrp2Ep3PYQi4LaK
         U/lQ==
X-Gm-Message-State: AOJu0YxYnm+UruuFmNRDrQZE1HpVHIZr1Gyp1NRDfXNgE+nCumBN8XoR
	xzxXPup6941t7fs5K6EGG/nbE+yarH5IygILdAvkcM3lYzEzoaxF+0fOZj38bw==
X-Gm-Gg: AZuq6aKEwuDEw+LJi2qqGbiuktOoPwM/P9dQ5pYf/8yOHfPwLmCGASy5YjL06+Kgb5Z
	0vRzVLUEYfc0Q92bLBI2hNIeAHzmS4u7LaKKyzmEjPU8WY0n+KVXO51uL7+gnFjnqqkiCBmSRgA
	Wlv8PDtsQQVzHDVvYu57KJRnCqPrVpqaisO5qF3dryn5afYwGQ1cPvVnJsOvXUOvf5XKL/UeVxH
	qFlCAD1neDGLh586JxHoIjnQaFp6N4JwDib1NGobQW6enZRg92IhlPxP2V0ZG8tJLCEbhtWh34N
	OjApPPYsWf+rx5eFXcZRW0L1lBmMCbZ2svbmINkOfD7fVD08n+GBAmEUPiQkdYk7L5SV4KpvKpB
	5MAYnVIU0RmX6fH2o3nu0eHrvZ/1Hns7RPZT2lWKCMjY9wgR17XkZHey2lVXW+Lc7bO2VylLaas
	FHONmZXif8
X-Received: by 2002:a05:600c:3484:b0:483:3d42:d04f with SMTP id 5b1f17b1804b1-4833d42d0bdmr25292985e9.37.1770581025627;
        Sun, 08 Feb 2026 12:03:45 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d8e8d4sm278069555e9.15.2026.02.08.12.03.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 12:03:45 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] gnome-commander: upgrade 1.16.1 -> 1.16.2
Date: Sun,  8 Feb 2026 21:03:43 +0100
Message-ID: <20260208200344.3917693-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Feb 2026 20:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124285

Drop patch that's included in this release.

Changes:
 - Fix double g_error_free call in remote_close_callback
 - Fix build with taglib 2.0
 - Set project gnu++11 c++ language version explicitely

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...001-Build-fix-needed-with-taglib-2.0.patch | 37 -------------------
 ...er_1.16.1.bb => gnome-commander_1.16.2.bb} |  3 +-
 2 files changed, 1 insertion(+), 39 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-commander/gnome-commander/0001-Build-fix-needed-with-taglib-2.0.patch
 rename meta-gnome/recipes-gnome/gnome-commander/{gnome-commander_1.16.1.bb => gnome-commander_1.16.2.bb} (86%)

diff --git a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander/0001-Build-fix-needed-with-taglib-2.0.patch b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander/0001-Build-fix-needed-with-taglib-2.0.patch
deleted file mode 100644
index 8f6920c2cc..0000000000
--- a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander/0001-Build-fix-needed-with-taglib-2.0.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From dc3aa0ff5a41114b17816f1f36f6bb5631c6ab5c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 7 Mar 2024 17:17:29 -0800
-Subject: [PATCH] Build fix needed with taglib 2.0
-
-Fixes
-| ../gnome-commander-1.16.1/src/tags/gnome-cmd-tags-taglib.cc:153:29: error: no member named 'sampleWidth' in 'TagLib::FLAC::Properties'
-|   153 |         if (flacProperties->sampleWidth())
-|       |             ~~~~~~~~~~~~~~  ^
-| ../gnome-commander-1.16.1/src/tags/gnome-cmd-tags-taglib.cc:154:67: error: no member named 'sampleWidth' in 'TagLib::FLAC::Properties'
-|   154 |             cout << "Audio.FLAC.SampleWidth  " << flacProperties->sampleWidth()<< endl;
-|       |                                                   ~~~~~~~~~~~~~~  ^
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/tags/gnome-cmd-tags-taglib.cc | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/tags/gnome-cmd-tags-taglib.cc b/src/tags/gnome-cmd-tags-taglib.cc
-index 9e65836..573f5eb 100644
---- a/src/tags/gnome-cmd-tags-taglib.cc
-+++ b/src/tags/gnome-cmd-tags-taglib.cc
-@@ -150,8 +150,8 @@ bool getAudioProperties(GnomeCmdFileMetadata &metadata, const TagLib::AudioPrope
-     if (flacProperties)
-     {
-         metadata.add(TAG_AUDIO_CODEC,"FLAC");
--        if (flacProperties->sampleWidth())
--            cout << "Audio.FLAC.SampleWidth  " << flacProperties->sampleWidth()<< endl;
-+        if (flacProperties->bitsPerSample())
-+            cout << "Audio.FLAC.BitsPerSample  " << flacProperties->bitsPerSample()<< endl;
- 
-         return true;
-     }
--- 
-2.44.0
-
diff --git a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.2.bb
similarity index 86%
rename from meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb
rename to meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.2.bb
index d96371de3c..012f50d85e 100644
--- a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.2.bb
@@ -16,8 +16,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
 
-SRC_URI += "file://0001-Build-fix-needed-with-taglib-2.0.patch"
-SRC_URI[archive.sha256sum] = "3f1d00c4a650fe7902167648286b32c9ca4ef86e31a5d8ccca0139f12d10d0b3"
+SRC_URI[archive.sha256sum] = "7cf5d56c77a95d828f25407294312abaae20dc6b556ceafd9424dbfe209e5ed3"
 
 PACKAGECONFIG ??= "exiv2 taglib libgsf poppler"
 PACKAGECONFIG[exiv2] = "-Dexiv2=enabled,-Dexiv2=disabled,exiv2"

