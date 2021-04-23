Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.3083.1619138160966575664
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Apr 2021 17:36:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nxwcgYB0;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id w10so34058591pgh.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Apr 2021 17:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ha0ppd1FuLer+aGpoM29ymO0mc11bXcruZ6cOS2UnwE=;
        b=nxwcgYB0iOkp0iFARnztsKw2U2J/kHdsSQFQnj4eskHQOc1gf8ENihRhAgw966PLfZ
         I01Spk2mFJQmhsXH+V9Zz/H/djHyQ7YkCkXUyk1osCnlFClRkLOrMH+2VPA8FBi1AQq4
         picRnLfY0Zpegx7dmEao5tfJ9bEdW0tGoFlnzkAAtxj+gBjRhxBbupfIdaGKIPRRAyQF
         T7MI4/laHhefWIdVSgz2pDVykhjhXMoK+GV2UcVQHoa8ZmhITpq9M/uQCUb/4QuETVY5
         uTL7CVdxZqoSc527OEp8RjqyT8vo8FbHwQcKhIQC5ldXheIhthlJIf8ujyqvPRDvdTLo
         5MMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ha0ppd1FuLer+aGpoM29ymO0mc11bXcruZ6cOS2UnwE=;
        b=Zmf/l03h1fbiBWrfDC4q4F3AFyuNlkaezayznqv4LDthjx0QmigKg7S31bkGFfEeHN
         ocOrH0QmBdXGskbZDSDqY3UpJAzcBgFASSI9j4THmxuIRJkIdJmsg1HhV5kPehK2PekK
         8ceW/3L/Bpu6JNfyn6jWldkcsTOWHuYHbSxPf4OrP4z2K/WRoqLzOVanrgOy7f5o2A8t
         lmNNm+0dE03tOFdBzZRqMe8GZ/qdMU3q5isBRvxf/R/rv82cRrvLyZmOSzQV177xmKbp
         nO54c3mnhGk9iIgaL0eN2l6eWSh0vThIXvh8eJUZORzKPR6TlNwPkSwOoYguyFBoikYt
         wExw==
X-Gm-Message-State: AOAM531PLAY1TfHOuXWSsLl3gRJHdo6I2ZfWlnGCT8QkO/3BZaEwJQ7X
	7iy4sQMYM0UrZ6mts9YX11RHCBbA5zolpg==
X-Google-Smtp-Source: ABdhPJxuvS0lX4HVV6T2O+0xHMznc9vtEssmh9XeKI3ZG/IjxrPP9Ca6njDhAtVKwQRZOjxQI5pxgw==
X-Received: by 2002:a62:1401:0:b029:25a:d41c:fb2e with SMTP id 1-20020a6214010000b029025ad41cfb2emr1404373pfu.51.1619138160278;
        Thu, 22 Apr 2021 17:36:00 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id kk7sm5893923pjb.11.2021.04.22.17.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 17:35:59 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-gnome][PATCH] libchamplain: Require opengl distro feature
Date: Thu, 22 Apr 2021 17:35:53 -0700
Message-Id: <20210423003553.3537524-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It has hard dependency on clutter-gtk-1.0 which needs opengl

Fixes

clutter-gtk-1.0 was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'libchamplain', 'clutter-gtk-1.0']

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.20.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.20.bb b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.20.bb
index 90e5533015..ef9e7b254a 100644
--- a/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.20.bb
+++ b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.20.bb
@@ -5,6 +5,8 @@ DEPENDS = "glib-2.0 gtk+3 gdk-pixbuf clutter-1.0 clutter-gtk-1.0 libsoup-2.4"
 
 inherit meson gobject-introspection
 
+REQUIRED_DISTRO_FEATURES = "opengl"
+
 SRCREV = "145e417f32e507b63c21ad4e915b808a6174099e"
 SRC_URI = "git://github.com/gnome/libchamplain.git"
 
-- 
2.31.1

