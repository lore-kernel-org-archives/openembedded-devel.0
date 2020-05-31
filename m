Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web10.18191.1590941793477107587
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:16:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jvN3oK6s;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id q24so3841113pjd.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=pmc4+qPFcRYA9THlWyzqwCiH5wUueUiOihyuROIZf0w=;
        b=jvN3oK6saunvG9CQRwWxnhiESZJVrL6P9PL7zlvmLdF9gcC8Q2yWzpDMK4QzbX6gvr
         5IFtgtupMdhRCWWo/StkpSOdq5hMVDWuYtUHVjOJsU5ddrzNfs6M+2YCXNjKMwwKhTIV
         7M7GVs1yNZWqMJfYaaVJ4rDblkbQc3YIMObWxaOZY6sLH3+tPKkKZRxhb61VtnJYItHz
         dppYqO39KZK/c892y+8LyKXTYqMZ3uh0K3hd48OU79hSghhyL+NJuN0+fKe1V0ED5mQr
         Z61QZr4Y7VB5X18CwZLzyGvCyTEi5O076ltWs7ttP2ovOUXIEwvRKD/qtJJ3UUrWk98C
         Xt+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=pmc4+qPFcRYA9THlWyzqwCiH5wUueUiOihyuROIZf0w=;
        b=jeXcdFLM8rOh8Jg+DkcXMwnlLKBIl4EUOU5/uwoyAf/c+zGLvexEMUujrLRUJiA9Pg
         KoyYujzQQJkSWOMxsrk9OvI9te4JwJrOtCeIABGQx/ZZ4LwsRrr/5vSu9HXYukp3KGsb
         hqrd3S/eawJ0hFdzfz23MzTRn8peo78A4BUBilQgt0Hpgdz/fXv7XkywJhNaScm44lF9
         9CUQ9AH3MYHK/ImP8C8WwJij2E47nzhP5WL95M1msl3JyHO0f4oWl9zgUz1QPI0mQfIl
         c3JAguxD+L55RPpLgsgjCPUx0YmqNsN7Cnnt3ywozk5JNNMMR4WW2aPfoJEaCU58R6OQ
         I5eQ==
X-Gm-Message-State: AOAM531kvP/BswUvXWlNL0oAyyuSWiceBnHOXN0rRbc83wqI8b/WvAbT
	YSYHd/RYXoo6qm4qgtAhgEPiEZpC
X-Google-Smtp-Source: ABdhPJyc/Ahir9Q7regqS1fqw9/v0ofFTtvjPsALwmlSC8rvz0SLZvWmxlzrPNTvUdNeM3+YIyXicA==
X-Received: by 2002:a17:90a:a514:: with SMTP id a20mr18316501pjq.12.1590941792680;
        Sun, 31 May 2020 09:16:32 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.16.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:16:32 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 05/35] thunar: 1.8.12 -> 1.8.14
Date: Sun, 31 May 2020 09:15:52 -0700
Message-Id: <50562881081dd3956630bace773fd2271e800804.1590941674.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590941673.git.akuster808@gmail.com>
References: <cover.1590941673.git.akuster808@gmail.com>

From: Kai Kang <kai.kang@windriver.com>

1.8.14

======
   - Revert "Allow opening of multiple file selections (bug #2487)",
   because it introduced a regression (Not possible any more to DnD
   multiple files in icon/compact view)
   - Translation Updates:
     Portuguese,

1.8.13
======
   - Use tre-view toplevel path of the cursor, if available, in order to
   prevent jumping (Bug #16024)
   - Increase vertical gap between icon and its label slightly (Bug #16041)
   - Fix crash when inserting USB device in tree-view  mode. (Bug #15172)
   - Fix jump to Home when ejecting a currently viewed device (Bug #16504)
   - Allow context menu when editing location in pathbar (Bug #16483)
   - Sort device entries in tree view (Bug #16471)
   - Allow to open multiple files at once (Bug #2487)
   - Fix incorrect pathbar autocomplete (Bug #16267)
   - Avoid unreadable names in detailed view (Bug #16391)
   - Prevent crash when renaming files (Bug #10805)
   - Translation Updates:
     Belarusian, Croatian, Finnish, French, Hebrew, Indonesian, Kazakh,
     Malay, Portuguese, Portuguese (Brazil),

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8174b6ff9a2dad2af6a502db0d4db366e65ba803)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../thunar/{thunar_1.8.12.bb => thunar_1.8.14.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.8.12.bb => thunar_1.8.14.bb} (84%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.8.12.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.8.14.bb
similarity index 84%
rename from meta-xfce/recipes-xfce/thunar/thunar_1.8.12.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_1.8.14.bb
index 0d2befd02e..499c831528 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.8.12.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.8.14.bb
@@ -8,8 +8,8 @@ inherit xfce gobject-introspection features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "bebd2d83ad2ed111b906c99b65fb32ed"
-SRC_URI[sha256sum] = "29295bee0b1f5bfd525e37405e5d32b497ae539b15183dd14e6ca49e252225f8"
+SRC_URI[md5sum] = "24218474191ac4c7e907d5b6fd6f1831"
+SRC_URI[sha256sum] = "8ac57b1f5842d5bd348bbb6dac4714f5ad1f22de651d8ec6a7099ceb19fa219f"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[pcre] = "--enable-pcre,--disable-pcre,libpcre"
-- 
2.17.1

