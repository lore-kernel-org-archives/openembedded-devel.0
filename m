Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web12.34118.1595787759698810706
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2020 11:22:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Fy4QLud4;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id x9so6921540plr.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2020 11:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=Nm5RqullcBL9swseb275pCeXTNa4aQxJNL5fv5DrOGA=;
        b=Fy4QLud4qeC56QvzyIRGO6PIW8DsMcXdLxwtJBAHpng+zUj0k5SpL5G5jd/wXYKCkI
         6pY/bqrlQIJiX6Ht9M8ebVMCDAtXOhz2wpyrZGHT7wvJ2/xMGBXjec9zFcURzp2zCzoK
         ttzSDX5BgguKhhd/FW23ZWICgGPaXlk0qpyrYq2DjECy8CXDNq0BfjsZPMlIao+SGDeE
         VAjcnS/SE1nFOUw+HYwnSkFnsYyW1W4raxceYAZpKQHUsuJotnCbdZzM9TwnyrIeX2ep
         GGSt0OzFd1/Djs0lb+bc/FZcbTeVxbl9qew8bQ0I5NBzuBZ3Qc/k3lPSxbDcQyn219wN
         o20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=Nm5RqullcBL9swseb275pCeXTNa4aQxJNL5fv5DrOGA=;
        b=c44CHdlzaps29EZXYi7ZWzVanNEeZFtvR1uUQNE3lWG7cYNf9K85e4QBPz13+o75LZ
         51YU1qUc1PHFgzEpWZe2UiEYR3JTcwV2jDfcfU2c2RgLGBSSnZqkTpgdUWZTSnBgNBq/
         x82tx9ZCz1e+W5d6OFDr9AS5Tf3lFIBGdJ/swzh4qVJDfUqPIp0HEdDpWAKOEw5C26gM
         9xnoD7ShWZRgg1RAbh4NLc7sM3VVD257JEl2CAe/wIbjARAF8qX6li3l2TwJLpcdBPP9
         yq6qemQlB4RoR5HAU3/w/5JeI/yzjRqS9qbljmRjJNPCKRtKx+TTwRmxHqav/FOtuwm5
         SXDg==
X-Gm-Message-State: AOAM530O7oFZW/vAk8HQnxNSGAq3LTUZ61+EPorayv/4IDrl1eM/Ij65
	6qTD+mA8AYkj0Lp18k/E/pi82ySkBDY=
X-Google-Smtp-Source: ABdhPJwAlD1YIxEhEqSRJ9Wn5dYbX5L76aItmsJO2AjqMqGVUKll4LBNpT+EoglO/LSp70biUp2Ckg==
X-Received: by 2002:a17:902:e901:: with SMTP id k1mr16774494pld.130.1595787759084;
        Sun, 26 Jul 2020 11:22:39 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:957c:826:e40f:5fde])
        by smtp.gmail.com with ESMTPSA id 199sm12764589pgc.79.2020.07.26.11.22.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 11:22:38 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] libpeas: this depends on gtk3+ add FEATURE CHECK
Date: Sun, 26 Jul 2020 11:22:36 -0700
Message-Id: <20200726182237.561-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

This has a dependancy on GTK3DISTROFEATURES so add the check

ERROR: Nothing PROVIDES 'gtk+3' (but /.../meta-openembedded/meta-oe/recipes-gnome/libpeas/libpeas_1.25.3.bb, /.../poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.36.1.bb DEPENDS on or otherwise requires it)
gtk+3 was skipped: one of 'wayland x11' needs to be in DISTRO_FEATURES

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-gnome/libpeas/libpeas_1.25.3.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_1.25.3.bb b/meta-oe/recipes-gnome/libpeas/libpeas_1.25.3.bb
index 57419a4275..78314007e3 100644
--- a/meta-oe/recipes-gnome/libpeas/libpeas_1.25.3.bb
+++ b/meta-oe/recipes-gnome/libpeas/libpeas_1.25.3.bb
@@ -8,7 +8,9 @@ DEPENDS = "gtk+3"
 GNOMEBASEBUILDCLASS = "meson"
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-inherit gnomebase gobject-introspection gtk-doc gtk-icon-cache
+inherit gnomebase gobject-introspection gtk-doc gtk-icon-cache features_check
+
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 SRC_URI[archive.md5sum] = "08bfff8f9688cf630dcb0f950617661f"
 SRC_URI[archive.sha256sum] = "1c9bbb29740c29cd6e1dd0c9964722ff08cd5e6f68f1b5c135bc391a6ce97639"
-- 
2.17.1

