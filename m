Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 455C3C021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 17:19:46 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.1763.1739467177750782329
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Feb 2025 09:19:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dzObupLJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4394036c0efso7722705e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 09:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739467176; x=1740071976; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=G1YnsdCaZlphWBTYZ9+lSf7n6MPBncAxA9VvaeqOg6s=;
        b=dzObupLJ9oHjY6/v4nUV4Ny6yh4iC7eLvv2gBdSIACaYUCkJOO4EwtJarryGHulXl0
         iI3z4oxZ0IdAv7OPJaKq+2KvNgbMmOMhMeR44DsFJ2ta5g9nUj8t3szk+P6O/YKqIDLl
         TJOgUf10CWsg8VEEAFzWK/3ha3B6zyeBuAwopKHbDmbuRUbTDhLAidaQEJPFe81bel7H
         CrzO8xG07BeQ1SRrCIvXMQoCkHqRMpHzwoUFLJ/T3BWCojll8WO+FVoGzBN02bB7iZvi
         fprrY40m7qw1wLT+r3ePyIzGWI7uI5341OlAp9VIF6MsM3yqvUkUI93t8C2zkIuo2Cqn
         z6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739467176; x=1740071976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G1YnsdCaZlphWBTYZ9+lSf7n6MPBncAxA9VvaeqOg6s=;
        b=SlA8bfzYBKkRsgwrV6sW8pY8nAPrT8w+bQq4vua4YnGXR4gpB0Hz1xPsrMNq3uwa7j
         2SJP56ZkQ1fkiNBGcYi2Hoik0rj6a9pi3Ni8kPFJLiITd1aiPM8gxfBeS/71pTt8u/TD
         EwBgDWXof87Bf5Hq5GJ/QH+RWS+zkOpwam0U4VwN1SqaBgVhbQ62rqraFNgRrnR8npUT
         kaxysTHBUMLJeQl0R1BBCiKIBkFzoe/zpVbr3zgPHJXOXz5VYRXSF8U90+uJVmhonmOV
         Tj4sr1Dbw5xQtio16Xr/bLt7GBmxEBjlZMIUSKs+KrdTeSvXvwQO/JvmkzrpLC2Ybb1t
         LDjw==
X-Gm-Message-State: AOJu0YyUL6jM7+S4TsfhoGHTNLr3+bo478jtOxHMl5mXFGQk1lAt8BJc
	6hanS4xq1kt5NYQ9snPx/6+FpacXI1M3nik/cu8D7Fx+9aw9WTE9MNf5Fw==
X-Gm-Gg: ASbGncsuYzPDq+KZ8dM3U5d/8jDQqEMXVtXrDvp3vSzxnIztGYG9BMOghjYLQb5UHxW
	w1PCQel5j7ydtWlen8CD5cblAat+Ok2YQYTPE1iJDtoAoTVyiIFPEU05M2E6hI45WO2GtZ+P19f
	wBq71wbNobOtFuLrM5Lh6BOVok+XtEqKDVwFphagXERdrfPb2VOAo0LqgoOPCxtIFyGGu+5az16
	qzEyUhx7C+KzfrdDYfBw4zBYuY8qkdyrr99U6HQJCl3+cgkQrEc+vdX0pV4m6IJitISHJHg8Zi6
	GKKRzz+M0yshdq0N4Ym+C8n4OChXtmc=
X-Google-Smtp-Source: AGHT+IH1IeiXcWS+tlJjfQtkVVLeik8EKeAilPo9mG7wL8UNrOYacFZk3KrXUy3Y34wp1vf05XasXw==
X-Received: by 2002:a5d:6d89:0:b0:385:f1f2:13ee with SMTP id ffacd0b85a97d-38dea2ec12dmr9263151f8f.46.1739467175955;
        Thu, 13 Feb 2025 09:19:35 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258fc8b4sm2448051f8f.50.2025.02.13.09.19.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 09:19:35 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH] parole: fix dependency name
Date: Thu, 13 Feb 2025 18:19:34 +0100
Message-ID: <20250213171934.646244-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 17:19:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115467

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-xfce/recipes-multimedia/parole/parole_4.18.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-multimedia/parole/parole_4.18.0.bb b/meta-xfce/recipes-multimedia/parole/parole_4.18.0.bb
index e2c7a012c7..eaa233ceb4 100644
--- a/meta-xfce/recipes-multimedia/parole/parole_4.18.0.bb
+++ b/meta-xfce/recipes-multimedia/parole/parole_4.18.0.bb
@@ -23,7 +23,7 @@ RDEPENDS:${PN} += "gstreamer1.0-plugins-good"
 EXTRA_OECONF = "--disable-gtk-doc DATADIRNAME=share"
 
 PACKAGECONFIG ??= "notify"
-PACKAGECONFIG[clutter] = "--enable-clutter, --disable-clutter, clutter"
+PACKAGECONFIG[clutter] = "--enable-clutter, --disable-clutter, clutter-gtk-1.0"
 PACKAGECONFIG[notify] = "--enable-notify-plugin, --disable-notify-plugin, libnotify"
 
 FILES:${PN} += " \

