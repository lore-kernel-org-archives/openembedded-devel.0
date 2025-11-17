Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 282CECEBF61
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 14:52:14 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11097.1763391130189276067
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 06:52:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KRRCA2Ju;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-789524e6719so14655817b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 06:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763391129; x=1763995929; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/oB7iV6HT2OyVZmTZJL0TSf43U/Viwfv3d63zyftVog=;
        b=KRRCA2JuA7snIGqL9D4oJxYoOIdG03LsRX1N0VKwEMbADw0jOy3W4zFWxhB3LhXulF
         5Z0t+j5mWSZLeHq6bXH8CWcHMpPocdNgKNz3g0DQrbYWRhQB0/+kvVUuJoBtdJG0m0ZK
         tBLrTusbhm5XbgERhbGOxBIhhDlBQONpcmqejPFXp5hJ5YaY7lMscYTWvhZ+AnygzC6a
         2oBkVspwo1JJIjP0wUwpjlatuxMGqbDf5K7RMVOOUtOw7j0dlERGb4gBQICVTayGKRNd
         8xvV/fuSEUU2Bt6ZhMp1hfk8KiBxyN8lYyOIYtCgxlRq/INirTOZ5ov+g2E4ytLVz00i
         faAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763391129; x=1763995929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/oB7iV6HT2OyVZmTZJL0TSf43U/Viwfv3d63zyftVog=;
        b=wJevy9rt9ad0CL4PlSjF/YgESBcNkue7AGtOjobW+RnFa0xZwCl3QSkCt+7/GqQKMO
         3KKJibiqmYIMSdqx2YZbNUnR/1TIeaZ6oLSLeUxzZZrrh9ObP5oPkqEazFCqDTazY3oV
         PiAi+Df6jkHj3QryieIVpWfLHEu2HWCIk+AkUh9TgJHUXKIpTbaBpOSVSO47ZefIqrf2
         pJMwMCHdX/Sr+1kZDRcuYfVcC22HbJ3eevJnvpDlQpRTGcsFbHVkveXlXsncfCZoxpMV
         Gn3f7u/sROwyfJ61qn+fLveOPj7uiEc/AEYtFc3MaziXRXHZZIUWtqZy2XsCUklCsB3M
         /TBg==
X-Gm-Message-State: AOJu0Yxu4bFW7nocfV8n9GC5p7AeYpweEyNHKtDOogT3Q479ZNV4Ijke
	qKH6oiWJYkuYF6aiB+XM2HeSMd9Y7qDOmi7vTPuLNJYDX3yG0vWnAIt5cbA0bHXk
X-Gm-Gg: ASbGncvqGtiJi3EP4vHLQ7OCK0Pp3OTbOnCE8toZdl823pS6SJwBWqUxCzYcisVN6uo
	HXdIaP2CL71v0BFvOlEQIL/6WQnKgY+oZC0OuFgos4AQ32QBpFZyrrb0Squ+Ac0rnZxEM0EoDzS
	mcY/X/rXB35VZML9z18boMua6mRy6HBaRVNKMfGVFrel4kI3+2Q05W4AAJuVnBmv86Ta+dxtOrZ
	j4LicA8XkQOYEQx6KWbv6Amw9QYYTZJx5KqCPZr5EY+/ywLn61KCKK6JnK0pVdX+D+mEIg1FzZu
	Hy8+wAsiqpVSuWqvhljowKKIX8HTaiP7/AiSA7argEzk5z4uU5ysIhOIe1nmn1Sf8KBijIyxYOc
	IqJvNfng5k4B6mIBGMSLA2ZFdjejPlUF8Oui0jpDC1mVq6xGbwaIxxZlNuCyh4rOzqvH7gvl2Fo
	wHq4EF0YhJa3Wm9a7ZjB9n3On8FeyRuErG3A==
X-Google-Smtp-Source: AGHT+IGZVyGnkI91lNNgSXvGgAERAXpurv8kQ2s2ACC2HqR9Zp82Zr42d6loASx5Xml17/Va6KO8iw==
X-Received: by 2002:a05:690c:e3c6:b0:786:980f:e42 with SMTP id 00721157ae682-789295b6512mr127433417b3.15.1763391128775;
        Mon, 17 Nov 2025 06:52:08 -0800 (PST)
Received: from localhost.localdomain (71-208-12-78.ftmy.qwest.net. [71.208.12.78])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78821de2bcesm42904227b3.6.2025.11.17.06.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 06:52:08 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 1/5] orage: upgrade 4.20.1 -> 4.20.2
Date: Mon, 17 Nov 2025 09:51:31 -0500
Message-ID: <20251117145136.132886-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 14:52:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121779

Add a HOMEPAGE while we are here.

Changelog: https://gitlab.xfce.org/apps/orage/-/releases/orage-4.20.2

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-apps/orage/{orage_4.20.1.bb => orage_4.20.2.bb}    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-apps/orage/{orage_4.20.1.bb => orage_4.20.2.bb} (81%)

diff --git a/meta-xfce/recipes-apps/orage/orage_4.20.1.bb b/meta-xfce/recipes-apps/orage/orage_4.20.2.bb
similarity index 81%
rename from meta-xfce/recipes-apps/orage/orage_4.20.1.bb
rename to meta-xfce/recipes-apps/orage/orage_4.20.2.bb
index cc17393504..461e471146 100644
--- a/meta-xfce/recipes-apps/orage/orage_4.20.1.bb
+++ b/meta-xfce/recipes-apps/orage/orage_4.20.2.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Xfce Calender"
+HOMEPAGE = "https://docs.xfce.org/apps/orage/start"
 SECTION = "x11/application"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
@@ -6,7 +7,7 @@ DEPENDS = "gtk+ xfce4-panel libical popt"
 
 inherit xfce-app mime-xdg
 
-SRC_URI[sha256sum] = "7e0331167ba438e494e0dc7fbdf03843fdfa4004910f4d5b113afea77b3eecc0"
+SRC_URI[sha256sum] = "6bfd3da084c2977fb5cee26c8e94bf55e358da8e86dd2a83c6fa9174f24672a1"
 
 PACKAGECONFIG ??= "notify"
 PACKAGECONFIG[notify] = "--enable-libnotify,--disable-libnotify,libnotify"
-- 
2.43.0


