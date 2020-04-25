Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.563.1587832016827213048
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Apr 2020 09:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=erdiF2aP;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: max.oss.09@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id x25so14651817wmc.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Apr 2020 09:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jYtIkJzaebn/3pOmOIkdH3yZ1aHWhx6GtS8gycKlha8=;
        b=erdiF2aPjqw6IudAWKLNKbT5gc7EeHfGc5nC5a+CJXZQcPFxa4dy4vy1peRl2pqwOO
         VImZ76PHYJjaVsnERKYz+bxRjb5O6qeNjt+6FO1C63S9gwjckDbH88lDz1DGfWnwh2Zz
         GDp1luBZa1iuhkdOXLoBSvBr+eUraOR1MWiX5K9oz6QS3HB4gqC6u4aMo2Z6H/jCeHAC
         DOyLX1oaXJ0CF8DFszNNg0t5UZ0L9LzoZgQk6bFEMqyauJCQkrhiM3iGeTer+biKK1Da
         rxF7vnAdFOS7X/C0nfT6eg+ii67oGX1BLTDJFgpqE+FdR3GSkJmcjnQp5SovUCi4gmUO
         7Okg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jYtIkJzaebn/3pOmOIkdH3yZ1aHWhx6GtS8gycKlha8=;
        b=EnMGDea0B+S+gEz20ehWI0EYxSYSBzMxl45ef2+wGU0RLv4tkKL2c7P+rLhGTorNR4
         YLLJjomDemI08OmJYMy7qu9zN0OxV82bsOKApp/jcPqymsMoj2DdeJXNK0IBBiUcsgzd
         PkUnB9Ts9wjCjy9+q3L6zH1FmMMwrfz419kqNiBBtdtYkSnrS50wlZ1EN3rXuIycxkUe
         iBn0WtOmKB1StIbOefRFk0zwO8NrrAl0Wm7lbJzKaY5C2xcaVZn4lc0m9kbroYcIRbJ0
         t2O7e+K3Vy/q2NnoLbI1nf+dJBoObfbr/LsZI/BEpI+BUJAlJG7FMWRwjMgshSMeWZ90
         r0qg==
X-Gm-Message-State: AGi0PuZ8e9nMNO6JtglGjn3M60hTCLKUu3geCqPblgsFrhg72/g+F6gq
	VVll4WtmABfG4gkXRTlnaBdtLVWb
X-Google-Smtp-Source: APiQypKo6KgbvS3Oyav4PSkHk/o79HWbgXc/YKecDYT9FuRHPeiWdsqgj5Dg9jL7g7ieTevo96ukpQ==
X-Received: by 2002:a1c:5502:: with SMTP id j2mr17662819wmb.56.1587832015089;
        Sat, 25 Apr 2020 09:26:55 -0700 (PDT)
Return-Path: <max.oss.09@gmail.com>
Received: from linuxdev2.toradex.int (31-10-206-124.static.upc.ch. [31.10.206.124])
        by smtp.gmail.com with ESMTPSA id y9sm7396507wmm.26.2020.04.25.09.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 09:26:54 -0700 (PDT)
From: "Max Krummenacher" <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-devel@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-oe][PATCH 1/2] freerdp: wayland: depend on wayland-native
Date: Sat, 25 Apr 2020 18:25:41 +0200
Message-Id: <20200425162542.3247-1-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

do_configure tests for wayland-scanner and silently drops the wayland
configure option if not found. Adding wayland-native to depends fixes
that.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta-oe/recipes-support/freerdp/freerdp_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/recipes-support/freerdp/freerdp_git.bb
index 373c4979f..6fb9a738a 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
@@ -39,7 +39,7 @@ PACKAGECONFIG ??= " \
 
 X11_DEPS = "virtual/libx11 libxinerama libxext libxcursor libxv libxi libxrender libxfixes libxdamage libxrandr libxkbfile"
 PACKAGECONFIG[x11] = "-DWITH_X11=ON -DWITH_XINERAMA=ON -DWITH_XEXT=ON -DWITH_XCURSOR=ON -DWITH_XV=ON -DWITH_XI=ON -DWITH_XRENDER=ON -DWITH_XFIXES=ON -DWITH_XDAMAGE=ON -DWITH_XRANDR=ON -DWITH_XKBFILE=ON,-DWITH_X11=OFF,${X11_DEPS}"
-PACKAGECONFIG[wayland] = "-DWITH_WAYLAND=ON,-DWITH_WAYLAND=OFF,wayland"
+PACKAGECONFIG[wayland] = "-DWITH_WAYLAND=ON,-DWITH_WAYLAND=OFF,wayland wayland-native"
 PACKAGECONFIG[directfb] = "-DWITH_DIRECTFB=ON,-DWITH_DIRECTFB=OFF,directfb"
 PACKAGECONFIG[pam] = "-DWITH_PAM=ON,-DWITH_PAM=OFF,libpam"
 PACKAGECONFIG[pulseaudio] = "-DWITH_PULSEAUDIO=ON,-DWITH_PULSEAUDIO=OFF,pulseaudio"
-- 
2.20.1

