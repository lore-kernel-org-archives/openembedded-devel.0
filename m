Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E880CFD377F
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 17:57:34 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51594.1772042252031894043
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 09:57:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a+ktD42r;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439857ec679so2127460f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772042250; x=1772647050; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+QX7euVkI88ZcnKr92tapU6rRDRbADtaDGLCLuetQLE=;
        b=a+ktD42rRiecgriVZMWRpI9A5a/XxhatdK9AfFxqIczMdug8Bcty6IvWY7Bz4MUDID
         y1qHl3Lwnp1sTuyquODXg89TWho+jPW0L+/mnFbPdqifbIwpQczT+jDxXkebxDEaVPu4
         a8rwme3qbzQ1+MES3zh+Q46Jl/WxYkp4ksxF4uwRNayFqFyMdR1YHwRiUr+sDwyJBAvW
         hLgrZibUJJzoj7P0n0mJ9j8q3ZJxxC+R1dmTC9OUBeHf9shuDo7kABdNah+gkDj7ZS+F
         kUchNJYO30aMM1uuOB1ykMFeWVpTbUK9nLaolKbtYEeHM6dz5IDDQ4uHk2AS0QBqAhmD
         FNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772042250; x=1772647050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+QX7euVkI88ZcnKr92tapU6rRDRbADtaDGLCLuetQLE=;
        b=aW4l/m2+SUYjilP+sCgwnogn9fQmR1TOESq5+jWj/3wiuo1RKJXAWeY0gYY9e9JyO9
         x7HXHM/lVO+EwqcMXdcW5RDZ2Ua7B3dUBKxlauxQqhgtPFFyOevGg+/jZel36EPS5oYd
         JcqMYWRLfTK6Pga2JkKTKSfOYLzs2plSdVk43OIJMRmlNw6HwTnGs9De4V4DJkJ6Y2k5
         7JrvbGR8N3qym5sexbK3RCbfK5Ank0M/SStpEWpfHzx3WsEmv7dcfo7MaWzEa1DYxRNl
         cn8AvwmAW4XYl7ZkHLvJJq3QkjMl/oDGK5ySz0YKqyx2GPlSLSIKiNWaVQHGNj6gykXU
         oEBQ==
X-Gm-Message-State: AOJu0Yw0s5Z2Q1voB3zO51sro+2FWCJZ+KHkNGmRO26sbHhh45C2PvNY
	jD3PA9ZGFEFFO3klwfgRzPgXboxMgjH0HvaNkL4ZH0Se3O0xhVhHQF63Ntu0VA==
X-Gm-Gg: ATEYQzzT+QMRinrJuctKGaCib5ZJnNFs/wf2/2OW+hYOOKugTW1zAcpNj+a5YQXLEx8
	PNg/s8spw2LOusr6WLgJFMtc+eZ5OUuf7TjRXmQeYGpYF+yuO04gEDVrdkCTiLf/xeY6v2bKtqK
	kU9tZrQ4gHJPAll5B8NVl093ETYD+lLg/uX4kf4j3XAxt5YbvzoXDoGchf9KirNtRTPXLvpiD3H
	qbVWIh2lkHZRa3/t4q3F+Lotih17hZdzaXwMkRl0jB6K7McYNhJ7EaaMR/AKJjm0pKgSYbqFLiD
	qnZhemsdxEcwyJ+XG0TatzY0CUJiOu6cnxy2H+gfgxYPZaRVJATU1pN1/sk68ryNbe8c6ujvFeD
	obnManB524X01WTtq5ECcyKvi73aYXpo12NGUwg5AK7O4maKdDOhEIlK252WPQ9/vrzOwR84JX0
	bPkaIVS+f2Z0Q6VS4XrBGi
X-Received: by 2002:a05:6000:26c7:b0:439:8913:bae with SMTP id ffacd0b85a97d-4399430575amr2492889f8f.53.1772042250189;
        Wed, 25 Feb 2026 09:57:30 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4398fefa3f8sm5484812f8f.36.2026.02.25.09.57.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 09:57:29 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] vlc: remove broken PACKAGECONFIGs
Date: Wed, 25 Feb 2026 18:57:29 +0100
Message-ID: <20260225175729.318275-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 17:57:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124656

opencv: VLC fails to compile[1] with opencv 4.

freerdp: this version of VLC requires freerdp v1, however
the layer only provides v2 and v3. (For the next major,
currently in-development release, VLC 4, they have migrated to
freerdp2, thought it also just got EOL)

Due to these, remove these PACKAGECONFIGS< and explicitly
disable these features.

[1]: https://code.videolan.org/videolan/vlc/-/issues/22016

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc_3.0.23.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.23.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.23.bb
index d17357b727..6cf4877a17 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.23.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.23.bb
@@ -43,6 +43,8 @@ EXTRA_OECONF = "\
     --without-kde-solid \
     --enable-realrtsp \
     --enable-avcodec \
+    --disable-opencv \
+    --disable-freerdp \
     ac_cv_path_MOC=${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/moc \
     ac_cv_path_RCC=${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/rcc \
     ac_cv_path_UIC=${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/uic \
@@ -66,12 +68,10 @@ PACKAGECONFIG[live555] = "--enable-live555 LIVE555_PREFIX=${STAGING_DIR_HOST}${p
 PACKAGECONFIG[libass] = "--enable-libass,--disable-libass,libass"
 PACKAGECONFIG[postproc] = "--enable-postproc,--disable-postproc,libpostproc"
 PACKAGECONFIG[libva] = "--enable-libva,--disable-libva,libva"
-PACKAGECONFIG[opencv] = "--enable-opencv,--disable-opencv,opencv"
 PACKAGECONFIG[speex] = "--enable-speex,--disable-speex,speex"
 PACKAGECONFIG[gstreamer] = "--enable-gst-decode,--disable-gst-decode,gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
 PACKAGECONFIG[vpx] = "--enable-vpx,--disable-vpx, libvpx"
 PACKAGECONFIG[qt5] = "--enable-qt,--disable-qt, qtbase-native qtx11extras qtsvg"
-PACKAGECONFIG[freerdp] = "--enable-freerdp,--disable-freerdp, freerdp"
 PACKAGECONFIG[dvbpsi] = "--enable-dvbpsi,--disable-dvbpsi, libdvbpsi"
 PACKAGECONFIG[samba] = "--enable-smbclient,--disable-smbclient, samba"
 PACKAGECONFIG[upnp] = "--enable-upnp,--disable-upnp,libupnp"

