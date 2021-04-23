Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.2882.1619137037596822339
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Apr 2021 17:17:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PzBr07aK;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id n10so13231191plc.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Apr 2021 17:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=darG8bANywm2S3+DldtciyzoPiNULFPh1W8p8mBghas=;
        b=PzBr07aKtIPtH/XNPv9MXOpZhtgV2swMpWG5Rm7fAkugaFBi1dQwLxi+NjeBSvjz3u
         AUFsFiu3SmYZIBe2l0WgkDNO1OsflJ5WZqd5r2eqWPPTAuKzZ9w7LHt7h8uJea5pEyGe
         QNgkAs9wgsx+qjoCoNF8tiGQHcCbmwwFxkyX82jsfI2LppRHGmE79Cf00U/rJChqj7Qd
         b33cQkWqklFxcp8+a/nLDX+zNdir0r7kvlGpl3srKHFTVRhsM5h1nkro5Qmh4oea/njE
         8DNm81iy8JTl5+CUm+mpPXoJq0jsyWcu52yiZ4X35X4iS3/hLkj+qgt/Fka3zT3LhzfD
         2OoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=darG8bANywm2S3+DldtciyzoPiNULFPh1W8p8mBghas=;
        b=BS+qLDcnB77l/DqdvE4pzfNWM0w6y7PJ2CQqC/y57M+pXDEXWzmfA7nAmoToSy+zGC
         +IUaUUZF+/weCZFpJFHcOuG2oD1EHe73hV6cKDp6ToSxeqFCbQ3nuK8HMsMi4flxWkL6
         992fgnGNoeE8ztyD7IVlu+EtHHtdBCWE/i5xLpfPYmg6t8vAuiXKEVB5PJa5wdnjy5wy
         KfKA1A6INFRNeWwXeUpGfiMX7e7fJsiolNQmYjrQxlRzs8VXfeuNowYqqvE97bbx1czX
         i3ep5MUw5KiPZ7D+qcdbIF6KmbTNHeDOP049uYao75L+Fxgl/8lPpan4v8+vCd7yWNVj
         A4Lg==
X-Gm-Message-State: AOAM533oCD3oXgdPo8wC4eKMVhIdZQPXS1Zuwyr7xBxOJoNEpxZI5Go/
	7QMq/lGNToPE6WmDg2GQFA33uLERoCf3NA==
X-Google-Smtp-Source: ABdhPJxg6GiJtkWFjDzNNzXPlYxXeq1EIZZ8GJkdSYUCaNKL2RcDlw+zY3VXs0Wyl3DCztZMZodkNA==
X-Received: by 2002:a17:90a:6396:: with SMTP id f22mr2713009pjj.91.1619137036852;
        Thu, 22 Apr 2021 17:17:16 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id w21sm5965957pjy.21.2021.04.22.17.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 17:17:16 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-gnome][PATCH] gnome-disk-utility: Require polkit in distro features
Date: Thu, 22 Apr 2021 17:17:13 -0700
Message-Id: <20210423001713.3504307-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It has hard dependency on udisks2 which needs polkit suppport

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gnome-disk-utility/gnome-disk-utility_3.36.3.bb            | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_3.36.3.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_3.36.3.bb
index 08fd964721..1045dea25e 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_3.36.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_3.36.3.bb
@@ -18,7 +18,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gtk-icon-cache gettext features_check upstream-version-is-even mime-xdg
 
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 polkit"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 
@@ -31,4 +31,3 @@ FILES_${PN} += " \
     ${datadir}/metainfo \
     ${datadir}/dbus-1 \
 "
-
-- 
2.31.1

