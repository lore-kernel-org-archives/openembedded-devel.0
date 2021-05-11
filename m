Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.7072.1620698860378197845
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 May 2021 19:07:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sQwUWv++;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id i128so10178871wma.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 May 2021 19:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Ci9Atrywl4iyeOnA9gMdDIw4t2wDBtZ1bwAf+GwYdmc=;
        b=sQwUWv++wbzarVkpFXG0UraFLBhSG2opJbZQKbw1b4o/nn86z7OHtf6fvyKXgRw5B3
         v+eaeQ1IJFj9liNq6N5t8GHhB8aiR3561dVmo9TEw6bn3ROb0nfytQ/lbRBebHufWclp
         2Q2jRUaoW6wPwJivM7mQZwJuabHnxGTInZfRF7bC88DJGVRMd1Za2Eae3mHgAy1ohIEu
         qc1zbPNAEc9s4t8QagJMpkemeMNkOInjvVTwdOSioDzmgl8/vXN7MSU5xFgZV0M43tFV
         EZJ0dygJ0q9xj2sJi2UVVLZ8a/pI5xKXSVEgcb6hH5S66SpYyzD9XPGLNsO8L2DeWozN
         RUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ci9Atrywl4iyeOnA9gMdDIw4t2wDBtZ1bwAf+GwYdmc=;
        b=X1ET9B7vnyLte9S/mG7BiSnGNSFSL8WnmGo9ts4IdY4nEfBv2ylqUes2SH5jCMr+EP
         NuZDuT37hcmdrtMDjn2uZGskEhNgAw0RfWYsQlZ/4EaV5xQVv77ZNPp6MwaKr0ennU73
         GFrTNzJMNpEmKSIpAZ9zkVZjKun6/dapI0nq5fx1w5ky0Kd9kdoSiCkQhHMy3LA6BISb
         bjE78mwnEwkRA9hsLnNskXWR5Inr8HUJPYM1eeou1rrzi21UjHggFI60gd8mt2GtYR6R
         iCBcEKURyOeoyB6gvL8C9tbL6KuQrec3DlLkkCQXen97Z9UH5i9zcL39aJ4CDSesHm+W
         Rzdg==
X-Gm-Message-State: AOAM531m52OsPHDcp4aat668upjPTVogVDVGzQgqyLzSbrNT5fhGk9tk
	wOCMDmoBOBBicbv15WC4MAEjkjm3y78=
X-Google-Smtp-Source: ABdhPJyA1v619xByPW0wvNeZutWiQ9f6CaDCXAd6bn4YkqCt4ofNeuC7Whxu/ECjw9qxvxpsXW257w==
X-Received: by 2002:a1c:bd46:: with SMTP id n67mr2325255wmf.113.1620698858962;
        Mon, 10 May 2021 19:07:38 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f4fac346ac282ef7d435921.dip0.t-ipconnect.de. [2003:f0:7f4f:ac34:6ac2:82ef:7d43:5921])
        by smtp.gmail.com with ESMTPSA id n12sm20145075wmq.29.2021.05.10.19.07.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 19:07:38 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/7] xfce4-panel: upgrade 4.16.2 -> 4.16.3
Date: Tue, 11 May 2021 04:07:22 +0200
Message-Id: <20210511020725.346160-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511020725.346160-1-schnitzeltony@gmail.com>
References: <20210511020725.346160-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 4.16.3
========================
- panel: Change width of default panel-2 to 1% (Fixes #454)
- panel: Fix xfce4-panel-CRITICAL
- panel: Fix xfce4-panel-CRITICAL when already running
- libxfce4panel: Do not destroy context menu if popped up (Fixes #442)
- launcher: Check for menu item initialization
- launcher: Fix garcon-CRITICAL at startup
- systray: Fix GObject-CRITICAL
- systray: Fix Gtk-CRITICAL at startup/shutdown
- systray: Fix libsystray-CRITICAL
- tasklist: Fix Gtk-CRITICAL
- Silent `-Wcast-align` from Clang
- Translation Updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-panel_4.16.2.bb => xfce4-panel_4.16.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.16.2.bb => xfce4-panel_4.16.3.bb} (94%)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.2.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb
similarity index 94%
rename from meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.2.bb
rename to meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb
index 7e54022ff..d478e0ffa 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.2.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb
@@ -8,7 +8,7 @@ inherit xfce gtk-doc gobject-introspection features_check remove-libtool mime-xd
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "8634166e6f14318daec363f7e2371d49b98986f9bce313a7dd1554f30b48b5cf"
+SRC_URI[sha256sum] = "5934eaed8a76da52c29b734ccd79600255420333dd6ebd8fd9f066379af1e092"
 SRC_URI += " \
     file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
     file://0002-use-lxdm-to-replace-dm-tool.patch \
-- 
2.30.2

