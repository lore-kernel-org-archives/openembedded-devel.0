Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.8842.1623133350541110744
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 23:22:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CrqntOkl;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id c5so20122738wrq.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jun 2021 23:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8/JuPgKwIfrkdyxWu2aSZDQPQolgnvDhRddrlK/DQdw=;
        b=CrqntOklEsv7rNzq/Oih/BV120XpziSCMBOaHoKUVR5l60Z1RN2/jCM6ovFGVeWpgo
         s+YABWT/cKVmWqEHfoqs3cTlUy/okcBvSfwyAKzGsG1CQoGK9jxyfpdIq8bZLd3K2TjA
         QIbgVxWkKenqIk8Ea8Lkc/jIqqapX9piIhlb1tpdnIWGHDYGJ+wyV+08MsIfrhyjXvss
         yPR25k5EuqsNKL7RRrwCV0xE0u+iQihyMx+cjjbUa2GurKW8XhGeN2QJ98lRvDZ67vgf
         RkhDHHQARaGtpzQwaDAd4WeyrrwZZkXe52/Tjf4ETtKqw0vlyqTHUXKZWpqWsm4xfS5F
         ejRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8/JuPgKwIfrkdyxWu2aSZDQPQolgnvDhRddrlK/DQdw=;
        b=D1zRTGtwd/hqrgANhuKI6U7YPQ8LJdaoGUVuayQRrIoqx0NJIL7jP10BjAd35+rgV0
         698YCk/q0ttsmZcxH8+4uFegnQkrKT294foDkPRhEHzUl8Oh5iV62yDhmLsqYuE4pHzX
         dfNnnhA07942IqYKXFbckfxtn+B5T+vYCpKay6i3bUQUyC7WyBPBNUZdClrFgjIMELvd
         BPQsINlDHtLo2ZweU3dBttncI3h2uWpaiuvzsq+xluuo7EyD8yDA93NZOiFth7D9L1W4
         5bLk77OKqsoQhuM/i4rP5Tq0OpsrCQZUpCepy0Mn22/9FTMAz9SzteOey3XtTFXLuPeX
         bYDg==
X-Gm-Message-State: AOAM530N/P7+QaTv3RBGO5F7Nvn4+1DN3VMUWUEjq6jpl3Xb7u8TP5dL
	/X0Kvx/vrV9m6gHGhnJc/NE1u4khowyEJQ==
X-Google-Smtp-Source: ABdhPJykZfq6U+gjT3cwPw8COZ4Q6GmtkOnR6iLODAX1XlBedppWk/kubDyO1/VCLioR4UJ2kgQmTw==
X-Received: by 2002:a05:6000:1847:: with SMTP id c7mr20919723wri.368.1623133348725;
        Mon, 07 Jun 2021 23:22:28 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f297e97639a19d79e95f79a.dip0.t-ipconnect.de. [2003:f0:7f29:7e97:639a:19d7:9e95:f79a])
        by smtp.gmail.com with ESMTPSA id f18sm16493969wmj.13.2021.06.07.23.22.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 23:22:28 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/4] gnome-flashback: upgrade 3.36.3 -> 3.40.0
Date: Tue,  8 Jun 2021 08:22:11 +0200
Message-Id: <20210608062212.2887426-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608062212.2887426-1-schnitzeltony@gmail.com>
References: <20210608062212.2887426-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{gnome-flashback_3.36.3.bb => gnome-flashback_3.40.0.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-flashback/{gnome-flashback_3.36.3.bb => gnome-flashback_3.40.0.bb} (83%)

diff --git a/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.36.3.bb b/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.40.0.bb
similarity index 83%
rename from meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.36.3.bb
rename to meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.40.0.bb
index 6dd989415..e6d946cb3 100644
--- a/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.36.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.40.0.bb
@@ -18,8 +18,7 @@ DEPENDS += " \
     gnome-panel \
 "
 
-SRC_URI[archive.md5sum] = "690b0d78c7d9265183ef18387b12fa50"
-SRC_URI[archive.sha256sum] = "2dba9ea40f2da81c22954a8ccc29f8f1fa4ca8395a6bb552506635832751c1a7"
+SRC_URI[archive.sha256sum] = "e03f33100f1982019c2e59bbdcd664549ec5caa0ef2d99e2c0e1272cea08bb3b"
 
 do_install_append() {
     # no oe-layer has compiz -> remove dead session
-- 
2.31.1

