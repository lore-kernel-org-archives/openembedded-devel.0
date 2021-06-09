Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web09.4349.1623220731273339608
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 23:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QJ/hII15;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id k7so36599192ejv.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 23:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=61jxrMQOlo5xZZQyw1GTsp2hWol0WqcpufwbpO7x6oM=;
        b=QJ/hII15ZJbnh2pEhxk3marD5Zh+GkmzA/Tfc3DU5YJYgWyndTahYFk/rQTM1v1j7Y
         tIpsEVbd2UTU/1ZmVolMoEFVSt/jDld008pjlIRvwNYd4qa3Avm7C7ZyKPaNmZAAl1vF
         BRwL0J5+s1uXtTGt4VFKKBmlm9UBke+RX+tETGU1XXPmeDKMeWIHQquE68QCRCt1xNbk
         6X0C/J9ekYcmtZmZ30hPExWonDwklsUtPUJGfBvmVYyYb0Uyck8Tzj+gc99RxWxvYOWe
         8shh7VdvEW7qEGUFrIeEj4buebSSQLWA2apEvAhNTDHM5TNEF5IpyDbFMf71lrYUzN8T
         qp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=61jxrMQOlo5xZZQyw1GTsp2hWol0WqcpufwbpO7x6oM=;
        b=r0iidT/6rYvbMBSxfsyCGc+DZq9J1iiMT7g6HQdrw9LniehgWqgDDlRM4p41ySYtwp
         NZSUkCwKg/eaTKqGZy8OcarV26zYVPyniIXbVIAi7DCqdYxcPBLD9ORWV6J+j4uytMAT
         exMMS016d+v5mo3X9vzh3Z2Akf5disYuT7TK9qIZNB6dOeonGhdRu/gZU8hBJnBau5B/
         xmFHR6bidqZ1ENkku0e8HixR6e6cDh1e2330WhiIC8l6YwSND1UYbsshDo4Y+nDR7VJE
         X6o98Ba8ivIH02SDfwa3Wm+94z2XR23I15zJArf9X04G+QtpNS1mIvsEA7nYyim2fEaH
         mFkw==
X-Gm-Message-State: AOAM533SEaDShanAEssqwg3akNppEpaN5YmI5PxRSHaLOEJPKc0zuR8H
	Ns02WDBip55gnsMvwY2Yn6ZersZIFRWPeA==
X-Google-Smtp-Source: ABdhPJyKNHTaBaUnSqdqn5TNl9DHg8J6rLVe04sEFMtsT69mEZ8t5n0WqLSVm1SDENvA3i2CJHwmhA==
X-Received: by 2002:a17:906:bcd5:: with SMTP id lw21mr26616341ejb.346.1623220729860;
        Tue, 08 Jun 2021 23:38:49 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f297e89b85a8a6897bdbe62.dip0.t-ipconnect.de. [2003:f0:7f29:7e89:b85a:8a68:97bd:be62])
        by smtp.gmail.com with ESMTPSA id o4sm690810edc.94.2021.06.08.23.38.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 23:38:49 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 10/28] gnome-online-accounts: upgrade 3.36.0 -> 3.40.0
Date: Wed,  9 Jun 2021 08:38:13 +0200
Message-Id: <20210609063831.3400611-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609063831.3400611-1-schnitzeltony@gmail.com>
References: <20210609063831.3400611-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...line-accounts_3.36.0.bb => gnome-online-accounts_3.40.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-online-accounts/{gnome-online-accounts_3.36.0.bb => gnome-online-accounts_3.40.0.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.36.0.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.40.0.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.36.0.bb
rename to meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.40.0.bb
index c3142ad9f..4b79fe2aa 100644
--- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.36.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.40.0.bb
@@ -11,8 +11,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.md5sum] = "44a37e1f8d4cac1dca0c41b57b49c2d0"
-SRC_URI[archive.sha256sum] = "1c8f62990833ca41188dbb80c5e99d99b57a62608ca675bbcd37bc2244742f2e"
+SRC_URI[archive.sha256sum] = "585c4f979f6f543b77bfdb4fb01eb18ba25c2aec5b7866c676d929616fb2c3fa"
 
 # backend is required for gnome-control-center
 PACKAGECONFIG = "backend other"
-- 
2.31.1

