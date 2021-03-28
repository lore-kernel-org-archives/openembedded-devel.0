Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web08.4252.1616909936732776031
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Mar 2021 22:38:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZD1X5Oeu;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id bt4so4457594pjb.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 Mar 2021 22:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VkQRInRnAlxoZEGIDZabKLFTf9jc/hYKQrH0jw/cyog=;
        b=ZD1X5OeuM96Ad3R3a57gAE16qf2E32b+77YA+Thi1VMFhFpwc57t7qE+8kjejKfE4W
         9IiDfq7YSwoZIF6PsaAqglHolhRKlkKebjJTWmDAzbd1tXiWXkqQBCA3XOKyYZVd7bY4
         dyUSoPaYhX75w7KyOkTIC8xexF8BTZrTYEgVxt0G+NH5+o0KqInQ0ix53yLUhG5tO1Zd
         CkquFEYLx4Wa9//aZBq2tqT3oXjrBn/xgb3e3T/YDh9va0AWEAXYGQvUaDjlgNFL04LU
         kJVRj0mOV6pZxVA4tUDC8cTepIzILJHnilFybcOjn8+vR5dvgCtfvbaHWIAa2faIQvwI
         BF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VkQRInRnAlxoZEGIDZabKLFTf9jc/hYKQrH0jw/cyog=;
        b=ICOZ2nRxdx8ZSczaHTLNoQnwxusMW3V/cK1x4SGkbBuwSUF+5sEylWZUjJvKrrU27v
         NGCl4uBkhHwNgLZacBUO8zmklcDGFa+5OW6883E0nwpQKAtGX4/RdEmvhPyqQGCriBQ0
         7aJ/n6xCnLw+EZ+/WtZH5onN9EImisCeC8FDVVpI8RSsn3+CAzT2Ixc6ZhrDtPLYUIGj
         9nmGPj78ik7XP+MY2QxFFfnGRV757p30XvGdH+5iZ6dmOsWEiPFAcLhaXMr1lf3uTPC+
         KZ2W0lOLKHa2qHcgGEDB1pJgrGIg3KrARjgOa34BLNH4o6Ei0rgD+wl9bpfpAy0XVrYj
         qjWg==
X-Gm-Message-State: AOAM533HhV8tdaJRUkF04RGuGkQ1LAZrJAbyVTLx3Jvx0rA+89WTc+WQ
	xQEJ3rkzJW++U/t765ooJ5KYIxrUZlkcYw==
X-Google-Smtp-Source: ABdhPJy7gdTCpWBTrAgDke4Z1tQ3B6V4Bw2SJ5wr6iVB3AbDUixHGqsdvSpeHLO/w6MyUrPyYknaYA==
X-Received: by 2002:a17:90a:5d10:: with SMTP id s16mr21126544pji.126.1616909935866;
        Sat, 27 Mar 2021 22:38:55 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ae20])
        by smtp.gmail.com with ESMTPSA id s28sm13982212pfd.155.2021.03.27.22.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 22:38:55 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [meta-gnome][PATCH 1/4] gnome-settings-daemon: Do not generate meson.native
Date: Sat, 27 Mar 2021 22:38:50 -0700
Message-Id: <20210328053853.1287969-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

OE-core now uses native-file instead of environment variables
so its not needed

Fixes
ERROR: Multiple producers for Ninja target "TOPDIR/build/tmpfs/work/armv7vet2hf-neon-yoe-linux-gnueabi/gnome-settings-daemon/3.36.1-r0/meson.native". Please rename your targets.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>
---
 .../gnome-settings-daemon_3.36.1.bb                      | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb
index e14891a236..a532ae7494 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb
@@ -29,15 +29,6 @@ SRC_URI[archive.sha256sum] = "3e33dbd319b562a5ab602dcab6de3ca81b85f8346672e90ec6
 
 UNKNOWN_CONFIGURE_WHITELIST = "introspection"
 
-# allow cross build mixed with build of native tools
-do_write_config_append() {
-    cat >${WORKDIR}/meson.native <<EOF
-[binaries]
-pkgconfig = 'pkg-config-native'
-EOF
-}
-EXTRA_OEMESON = "--native-file ${WORKDIR}/meson.native"
-
 PACKAGECONFIG ??= " \
     cups nm \
     alsa gudev \
-- 
2.31.0

