Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.8316.1595375163126620663
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jul 2020 16:46:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BSqQh/g9;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id gc15so2042650pjb.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2020 16:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PY65XCP1VSCSrbR0ABrZvLWPmTn35vcKFZk4hIT9QHI=;
        b=BSqQh/g9gtW6z6n1o8+Tp9S+xTMG4OmrEC0FhL6PSNt+qlsx6u48eaS/MCrzckuDVI
         JuZiT4VuT73Rq7gcGo/a9Z1Vijiu5gg0wBvjyqXxZ/kq8Tocb9vk/eAPwA3PdFfGvBSt
         ebSTWvhVWV/y+xrxEaBt7/0GFKZHaFZHpNxAI85sU2MelzwjC41kivxDlQVfcguDqwU3
         DyuWXFL26YBiWUGiDui3V09XsdRQ/IjRkEbbjy593dwTsKyq4+UoyhHUbGXdIQ2BMUmF
         40zIlvS/xxhprouqvx1D44OpAJtwlv8krxT0DWeW9wXSfc7/c/PlVS6K+q/eJl4jb3sg
         Fmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PY65XCP1VSCSrbR0ABrZvLWPmTn35vcKFZk4hIT9QHI=;
        b=tn+W4UnjnWmdriYa1x+PEfilvEr5onbECIiHeZyn7W1hSv8+eV9MEGrUHrjttNNmHq
         samM95X/K9L/TBodtk3umyF2bHPfG29OS8lM7jx9QT8U/Flx1TtFN3+YzDQGlLvRdUby
         CqFRhY6wIn1/nF8g97l8Yrt/HyzvZcgHePDKwR95kBsmNZQ6Ge/wT6xuE1STyYfWmzLn
         yYCjcgICgu5ZXWd94TwbkUoz3SoznFKeZL+d7Ec6mogCjVOGPiIaXImSHKE+XBN6dOgo
         7EE/O0mO5NbvjIQYfJtdHKiwSPv20QA2soUkJMZvn4Br47v6KBzZat7JPAeNByDyrzxX
         JTIg==
X-Gm-Message-State: AOAM530bwkmIc1ipbmu0EUL2DHdv41UfrGAznEruwMC6TaSIX+iLwhV8
	1Dkkn8cPBetQmnGMH3jeOu1Xi0rNoIw=
X-Google-Smtp-Source: ABdhPJz9qjjuoaOSjnOqTlXN2FM7nCc4JpksvOzld7t0pftfE21x8KM0izUzjrmoAIWYbcc494f7mA==
X-Received: by 2002:a17:902:fe11:: with SMTP id g17mr25105177plj.145.1595375162217;
        Tue, 21 Jul 2020 16:46:02 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::6651])
        by smtp.gmail.com with ESMTPSA id br9sm4136441pjb.56.2020.07.21.16.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 16:46:01 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH] network-manager-applet: Add missing dependency on libgudev
Date: Tue, 21 Jul 2020 16:46:00 -0700
Message-Id: <20200721234600.1771825-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../network-manager-applet/network-manager-applet_1.18.0.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.18.0.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.18.0.bb
index 60e4c22050..f2bc24ea95 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.18.0.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.18.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "GTK+ applet for NetworkManager"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "gtk+3 libnma libnotify libsecret networkmanager iso-codes nss"
+DEPENDS = "gtk+3 libnma libnotify libsecret libgudev networkmanager iso-codes nss"
 
 GNOMEBASEBUILDCLASS = "meson"
 inherit features_check gnomebase gsettings gtk-icon-cache gettext
-- 
2.27.0

