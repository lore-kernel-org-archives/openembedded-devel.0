Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web09.2071.1630529940533357822
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Sep 2021 13:59:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WUxrpWZp;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id m4so469992pll.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Sep 2021 13:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nl6sNw5FsV3pRPY7Ycg5My+wPvxrO+Gr3BVBwNWqoX4=;
        b=WUxrpWZpNtEOXiFpEnYjjz0m5h1UEdLQsm6ZylNKzwmbT/slk6YReVfEvlPYbyb+f1
         pVid251icWICXTVzXomBsNprTz+y6nt1XQuUsm+8ZZ5d4F60Xk/9y12xSmi+WCPj8D0X
         FnYS8vAdyl92fhnKbEq6xVb0T7O7XVGr57G7C3R55rlf+iY2CnbFeJHlb5pomszOFrNf
         dEWKhm6OvViIC29AksOmDYQdbxJqJxgHmIJLWL6pkvfyNxkAHA7daoMhLaBxS6NJgrUP
         FixrKvcl2tXizrgr91J4hp2wZF2Uih4C+yp7bl/t1SqGkd5HCHT6+HxP5zgcI7P+2bUr
         zFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nl6sNw5FsV3pRPY7Ycg5My+wPvxrO+Gr3BVBwNWqoX4=;
        b=p5AhAp/TiA3t4pgyjeNZcjFAfTbxW45n7MhBufHenEUZcFCkl9greODsx1m/tZY9Jm
         0OlvENs56arohjGT080wX3xOAbdRKlXMraVF7cERG8OltC0RBSx8UP7hm4QDVDMKpuVg
         TCmzinCw08D/3YK4ONSLkQBKQiZtfcFuOgu6wrnppNgYkdSxFaeLnWLhIM3v0Y6bsF6F
         qK/uAkFfj3GRvScSFKEXD6biByJQKgp+eNThFsoE1fo0CaA8qyGpH0od1dAjEF3zay5C
         mv9uQfa1y8O/puGhfGIAQ0ikYSEEK5qUCrYpyy/iAdDz47uSqFqfkuGc9ehezx0c/OXl
         r/SA==
X-Gm-Message-State: AOAM532K67tNFvIdufQCC/uUqjPBTAFpYzWhRb2iFKyeMR5QyirCLeH9
	iUgxI3gUhm4VnIFwq6tGtL7f+ChQf1FOUQ==
X-Google-Smtp-Source: ABdhPJyhCQ5KAZZV7sWnBIowLQJ0Lh04LKQ6YVLCCkrayRb4jcuVMEenbMMsZQvxu5gcE9G7SL9lNg==
X-Received: by 2002:a17:902:6b8c:b0:12d:b95c:30fb with SMTP id p12-20020a1709026b8c00b0012db95c30fbmr1269849plk.81.1630529939769;
        Wed, 01 Sep 2021 13:58:59 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1d09])
        by smtp.gmail.com with ESMTPSA id t15sm554753pgk.13.2021.09.01.13.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 13:58:59 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH v2 1/2] pipewire: Upgrade to 0.3.34
Date: Wed,  1 Sep 2021 13:58:55 -0700
Message-Id: <20210901205856.99727-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable systemd user services as well as they are required for user
pipewire sessions

Turn pw-cat into a packageconfig

Enable systemd-user-service only for systemd

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Move pw-cat to a packageconfig
    Make all systemd enabled features controlled by systemd
    packageconfig

 .../pipewire/{pipewire_0.3.31.bb => pipewire_0.3.34.bb}  | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.31.bb => pipewire_0.3.34.bb} (96%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.31.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.34.bb
similarity index 96%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.31.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.34.bb
index 1c18ba0328..c841ae2050 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.31.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.34.bb
@@ -11,7 +11,7 @@ SECTION = "multimedia"

 DEPENDS = "dbus"

-SRCREV = "c43dabcc96e2e072cdf08e5f094bb677d9017c6b"
+SRCREV = "1924c2c29824955b5e763f1def6967f68e403c7c"
 SRC_URI = "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=master;protocol=https"

 S = "${WORKDIR}/git"
@@ -46,7 +46,6 @@ USERADD_PARAM:${PN} = "--system --home / --no-create-home \
 EXTRA_OEMESON += " \
     -Daudiotestsrc=enabled \
     -Devl=disabled \
-    -Dsystemd-user-service=disabled \
     -Dtests=disabled \
     -Dudevrulesdir=${nonarch_base_libdir}/udev/rules.d/ \
     -Dvideotestsrc=enabled \
@@ -59,7 +58,7 @@ EXTRA_OEMESON += " \
 PACKAGECONFIG ??= "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa systemd', d)} \
-    gstreamer jack v4l2 \
+    gstreamer jack pw-cat v4l2 \
 "

 # "jack" and "pipewire-jack" packageconfigs cannot be both enabled,
@@ -75,7 +74,8 @@ PACKAGECONFIG[gstreamer] = "-Dgstreamer=enabled,-Dgstreamer=disabled,glib-2.0 gs
 PACKAGECONFIG[jack] = "-Djack=enabled,-Djack=disabled,jack,,,pipewire-jack"
 PACKAGECONFIG[sdl2] = "-Dsdl2=enabled,-Dsdl2=disabled,virtual/libsdl2"
 PACKAGECONFIG[sndfile] = "-Dsndfile=enabled,-Dsndfile=disabled,libsndfile1"
-PACKAGECONFIG[systemd] = "-Dsystemd=enabled -Dsystemd-system-service=enabled ,-Dsystemd=disabled -Dsystemd-system-service=disabled,systemd"
+PACKAGECONFIG[systemd] = "-Dsystemd=enabled -Dsystemd-system-service=enabled -Dsystemd-user-service=enabled,-Dsystemd=disabled -Dsystemd-system-service=disabled -Dsystemd-user-service=disabled,systemd"
+PACKAGECONFIG[pw-cat] = "-Dpw-cat=enabled -Dsndfile=enabled,-Dpw-cat=disabled,libsndfile1"
 PACKAGECONFIG[v4l2] = "-Dv4l2=enabled,-Dv4l2=disabled,udev"
 PACKAGECONFIG[pipewire-alsa] = "-Dpipewire-alsa=enabled,-Dpipewire-alsa=disabled,alsa-lib"
 PACKAGECONFIG[pipewire-jack] = "-Dpipewire-jack=enabled -Dlibjack-path=${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=disabled,jack,,,jack"
@@ -250,6 +250,7 @@ FILES:${PN}-media-session = " \
     ${bindir}/pipewire-media-session \
     ${datadir}/pipewire/media-session.d/* \
     ${systemd_system_unitdir}/pipewire-media-session.service \
+    ${systemd_user_unitdir}/pipewire-media-session.service \
 "
 RPROVIDES:${PN}-media-session = "virtual-pipewire-sessionmanager"

--
2.33.0
