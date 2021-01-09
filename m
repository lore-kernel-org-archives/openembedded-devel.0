Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.4580.1610205107235760461
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Jan 2021 07:11:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oMgTFtds;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id g185so10942369wmf.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 09 Jan 2021 07:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fmGR2I0AsM3OfsUVrvsE9FIzeIvWG072nwbday3bEjc=;
        b=oMgTFtds8ToXwkyLI14NpUMouYJFaMGXuE6AV20vxgzB+/FMf6qUi5FtfhQkBhOTSM
         P18ocNvFh/kZglQiCIIXuOyHeMHSD1C1/vbs/1sFRYQO0ZWsx9DpaSkN4lb+I2n1EHFI
         hXtSYErnUhZ/NDx41aAfrIt9sxtvgQB0Ffui/DHMsq84GoIlrR9w1ii2d0fhpweAzYJ2
         7aD7KsyvAMJfESPXOf+/uTg41cL1UnCSoQ6484vEsmsR9RomCvvP4vYe7kjhQcMXGFxK
         aOrzUyOteijkrLKl16jvSpIAJjyQuXtQveLveH7SqFuhaUafJZn6z9ZJNao/kA+zZXEU
         yyEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fmGR2I0AsM3OfsUVrvsE9FIzeIvWG072nwbday3bEjc=;
        b=YCrH2xe1Udja0hoRupLBp6m/845kSuICMhLs0Xf6tPXsVbcMjoD5a/kt0XMB/1NIZS
         SfTjFdRKOMSBABxcGzBhxufI2/bQ4WEu0cUdwRpSTLaaKUk8VxMsQ9xRrPXRaPraRqla
         r1VlCEbyMGNbY+lYy9NBC/PHBIDSuD0IfJr4hbEo/tPsxeT4dGruT1nWfYD5/ZT7ltLa
         HYE8GuTRSpZAWNVkX7s8RirDXs13Oh1QQ4V8JsUOaEWNyN0461tCAuAhnvFlV1JsOTfd
         YIYy1y4z53hjjGyHbjbdTH88BWXMFAatSY6OYjgCvbDT4/g9puliwR0k2qHvQspoTHcE
         Ae6A==
X-Gm-Message-State: AOAM530xj9xBNgjxNOdTmC/5mI4N5JE+MKwI9Y0WjjRFZ3c/XZGjyP0Z
	b9QFp9sUHAYRSuXfTWABkMLUbmngzezxJA==
X-Google-Smtp-Source: ABdhPJzs+B+YkA3+i39g+yFhYl1uW7F0Qs0Vl8aSbCidyFWFphvr4uZhNnC1ab1Ngj0RzDrHB0JE+A==
X-Received: by 2002:a1c:6746:: with SMTP id b67mr7570614wmc.8.1610205105911;
        Sat, 09 Jan 2021 07:11:45 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f09bb3762d71a5d34ee0918.dip0.t-ipconnect.de. [2003:f0:7f09:bb37:62d7:1a5d:34ee:918])
        by smtp.gmail.com with ESMTPSA id u83sm16673912wmu.12.2021.01.09.07.11.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Jan 2021 07:11:45 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/3] xfce4-screenshooter: replace gtk+ -> gtk+3 in DEPENDS
Date: Sat,  9 Jan 2021 16:11:29 +0100
Message-Id: <20210109151130.417269-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210109151130.417269-1-schnitzeltony@gmail.com>
References: <20210109151130.417269-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../xfce4-screenshooter/xfce4-screenshooter_1.9.8.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.8.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.8.bb
index 9e2497d43..dbd7a0b40 100644
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.8.bb
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://goodies.xfce.org/projects/applications/xfce4-screenshooter"
 SECTION = "x11/application"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d791728a073bc009b4ffaf00b7599855"
-DEPENDS = "xfce4-panel libxfce4util libxfce4ui gdk-pixbuf gtk+ glib-2.0 libsoup-2.4 exo libxfixes xext virtual/libx11"
+DEPENDS = "xfce4-panel libxfce4util libxfce4ui gdk-pixbuf gtk+3 glib-2.0 libsoup-2.4 exo libxfixes xext virtual/libx11"
 
 inherit xfce-app
 
-- 
2.26.2

