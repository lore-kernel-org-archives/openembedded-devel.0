Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.9418.1609946282158090426
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 07:18:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j58AuKDd;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id w1so5406845ejf.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Jan 2021 07:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NSyNSQG0FIIaZoe7q3/OHtd9aXz2PFgD7oEdDDTX4Kc=;
        b=j58AuKDdz10c8O0SlFz0mhFoG6jLeNxcAZICINJs3pJiTJgZfZtTX7U6Li3kTCb93H
         /WsrOo12Y+pRnEOO9c1mTp5cfnDwpd6TOC0bD9LCBeLA54vIm1QXEETeQG7frBTtXu58
         BeGznZsNCJSEkw4em8p28WSQhYsRbh4kKh37WSzHz8UC8wS1hGCiupi4XHJpbhcAIkZn
         AeVUx7YrYLAwzUdicMm89uHqLgjPBHh3B6rIOt8rVyzBjusgX+uw0tVs12kOiBIqKlKY
         8wgfE1Dx9ebRIkfLtCk7EUExN7e7nuFgScKrYB7SHTx0agqBX1TR/aijC26Wc+6A+0R5
         VqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NSyNSQG0FIIaZoe7q3/OHtd9aXz2PFgD7oEdDDTX4Kc=;
        b=RtFC5fw2GyLAFXrrMZhWNqgQqJdhNiXnp3ltaGpnX1uWjAacgzPwThBygg1sTMjkRI
         rKhAdsRlCmJY4Ys0uK9YiD4zXnEHQ//5ztsB4JboZx3IBrAE4HKiocQZVzWMpq5hsB86
         2K+UIJ7vQQIb1M0cjmUntg54HksgHdLd106BvndEEmHak2NUujRKwhyewxALveHYi5X9
         3obxraSi72bBhJsOd0gZ0qBTSEGtFw71GmoJDB8XWEO07zbfNpPxHgW2+QZ0Fl3qqnmu
         vEvSr7mpt7R2+QRLrWuAChoBT8/BX7KOpurLi3wmD7CH9WRK/YdFCy3rAHT3tkJzFA7h
         H+7A==
X-Gm-Message-State: AOAM532+WfnyylExGXQRuAjk/DZ3F4RJph0FYVtrzFLKCAsjlhjMWe6s
	qjwm01G5Y+ZCjztS2OX2kgDPMCjPQZt67A==
X-Google-Smtp-Source: ABdhPJwC7rBl5H0jvG5i64ryzH1rtpBwrTqrhnedNjIwA1UCwItqvAM5uXs6YCVuqEjkuH/WXcaFtg==
X-Received: by 2002:a17:906:7215:: with SMTP id m21mr3156440ejk.248.1609946280762;
        Wed, 06 Jan 2021 07:18:00 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47431850a04677ec24921a.dip0.t-ipconnect.de. [2003:f0:7f47:4318:50a0:4677:ec24:921a])
        by smtp.gmail.com with ESMTPSA id lc18sm1366899ejb.77.2021.01.06.07.17.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 07:17:59 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 24/28] xfce4-embed-plugin: remove for now
Date: Wed,  6 Jan 2021 16:17:13 +0100
Message-Id: <20210106151717.1779543-24-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210106151717.1779543-1-schnitzeltony@gmail.com>
References: <20210106151717.1779543-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* It stopped building for xfce 4.16
* There have been activities on GTK3 port [1] but...
* As soon as a working version is released it will be re-added

[1] https://gitlab.xfce.org/panel-plugins/xfce4-embed-plugin/-/issues/2

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../embed/xfce4-embed-plugin_1.6.0.bb                | 12 ------------
 .../packagegroups/packagegroup-xfce-extended.bb      |  1 -
 2 files changed, 13 deletions(-)
 delete mode 100644 meta-xfce/recipes-panel-plugins/embed/xfce4-embed-plugin_1.6.0.bb

diff --git a/meta-xfce/recipes-panel-plugins/embed/xfce4-embed-plugin_1.6.0.bb b/meta-xfce/recipes-panel-plugins/embed/xfce4-embed-plugin_1.6.0.bb
deleted file mode 100644
index 387b183f1..000000000
--- a/meta-xfce/recipes-panel-plugins/embed/xfce4-embed-plugin_1.6.0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = "A panel plugin that embeds arbitrary windows (or GtkPlug widgets) into the panel."
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-embed-plugin"
-SECTION = "x11/application"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-inherit xfce-panel-plugin
-
-# DEPENDS += "xfconf xorgproto libxtst"
-
-SRC_URI[md5sum] = "6870b116b85e4fa68d1b9ef76bd1d279"
-SRC_URI[sha256sum] = "c767df6360e8194b32bc24823dd000975edba0cafe525c23d7854029359ee228"
diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index f8a4b2f68..c29827cee 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -34,7 +34,6 @@ RRECOMMENDS_${PN} = " \
     xfce4-systemload-plugin \
     xfce4-time-out-plugin \
     xfce4-timer-plugin \
-    xfce4-embed-plugin \
     xfce4-weather-plugin \
     xfce4-fsguard-plugin \
     xfce4-battery-plugin \
-- 
2.26.2

