Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web12.22906.1596976521983122660
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Aug 2020 05:35:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cx8BlCLZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id m22so6688942eje.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Aug 2020 05:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Vure1F+B3nSDXOvyTCNV5aDmxdk71iN9xfvuHb3HeJ8=;
        b=cx8BlCLZD9E77/nefURWHPGmACPTPoU2/9NoTV7O2yKExtrVKDa0hjwdGOn3Kyb80V
         DQ/tLiL1Ngs1p8SeiNa0EkB+jw2TwepzK9m9FAzgY1mCzhBHEDo6GMNNJRXK1CyXtaUN
         LcYkUA/e3LHNT80aNKADH+hUF+BudMILwaIixG4Xr1ONFZtus/EIGBbdGn2lRVhUfONr
         54cLx/K0nbTMKvjk//MZGRnQZx+G4lhapLhdwLYwZrb1QhQtZc7fyppbuQfSFFRySbeZ
         V05rwSkb+hbgzVlZMEgW9+ahaL1DEfQ5osxet27Mix7U1/LJCzFRe7lEYwj9MTMf4LU+
         m1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vure1F+B3nSDXOvyTCNV5aDmxdk71iN9xfvuHb3HeJ8=;
        b=GW2KdLsQY+zyRRKMdX4mAX8wMokiO9IPBdyrxVEC7HFLlw7RtDwozM19ItmwQOxg9g
         fnKxYxOgywn17LhZwDxM6PbIQXhImxS4Zre9suXCURkZozZU7zwj1OVE8MPLWyziXCog
         e34cGG146QC8SsVOSQfbkAtsM+agn80l+/AJ5kuBeCk7RMtM8h/mJNqfphvOFN5zKdK+
         TvAUkwNLanqF3AYn1siVQCyq4aqoGAQGDKRoYONIy/XWr/WwR+39VAoipqT2OAvOCVlm
         J+bKp1GZMsfc23hkIz5HYVNHWHFQPo3nAMIqrlNjzxS93qVdHvqz4cGJVfivTYYQYKaZ
         9ZMA==
X-Gm-Message-State: AOAM532AGmZY6+mkXRoJZDd+FCSnOBLw+iVzc/8qlTfY2Sppa7KQ28sW
	IHcB4GWZ8aiefv8gTb6lW3preyuP
X-Google-Smtp-Source: ABdhPJzCzp9hM0Hl3+bdUcjqdWQH11mcmk4R70lBiCeyD302L/RsMrHF4wzdPBshrWeqD4z5cdBIiQ==
X-Received: by 2002:a17:906:289a:: with SMTP id o26mr17089642ejd.309.1596976520271;
        Sun, 09 Aug 2020 05:35:20 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f102180f54bc478636fc7f8.dip0.t-ipconnect.de. [2003:f0:7f10:2180:f54b:c478:636f:c7f8])
        by smtp.gmail.com with ESMTPSA id b24sm10070260edn.33.2020.08.09.05.35.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 05:35:19 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/6] geoclue: upgrade 2.5.3 -> 2.5.6
Date: Sun,  9 Aug 2020 14:35:04 +0200
Message-Id: <20200809123507.267616-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200809123507.267616-1-schnitzeltony@gmail.com>
References: <20200809123507.267616-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While at it:
* remove unnecessary exports
* minor recipe cleanup

Release notes [1]

2.5.6:
* Fix crashes in WiFi handling code.
* Plug a leak.

2.5.5:
* Plug another leak.
* Fix another buffer overflow.
* Fix WiFi-geolocation that got broken in 2.5.4.
* Put freequently used small strings on the stack to avoid excessive memory usage.

2.5.4:
* Plug a leak that becomes pretty huge after a while of running Geoclue.
* Fix a buffer-overflow.

[1] https://gitlab.freedesktop.org/geoclue/geoclue/-/releases

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../geoclue/{geoclue_2.5.3.bb => geoclue_2.5.6.bb}   | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)
 rename meta-oe/recipes-navigation/geoclue/{geoclue_2.5.3.bb => geoclue_2.5.6.bb} (82%)

diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.5.3.bb b/meta-oe/recipes-navigation/geoclue/geoclue_2.5.6.bb
similarity index 82%
rename from meta-oe/recipes-navigation/geoclue/geoclue_2.5.3.bb
rename to meta-oe/recipes-navigation/geoclue/geoclue_2.5.6.bb
index e57e7a720..03a10ce62 100644
--- a/meta-oe/recipes-navigation/geoclue/geoclue_2.5.3.bb
+++ b/meta-oe/recipes-navigation/geoclue/geoclue_2.5.6.bb
@@ -12,17 +12,9 @@ DEPENDS = "glib-2.0 dbus json-glib libsoup-2.4 intltool-native"
 
 inherit meson pkgconfig gtk-doc gobject-introspection vala
 
-SRC_URI = " \
-    https://gitlab.freedesktop.org/geoclue/geoclue/-/archive/${PV}/geoclue-${PV}.tar \
-"
-
-SRC_URI[md5sum] = "6228301ed62b587ebaa0438b97ce66e4"
-SRC_URI[sha256sum] = "3caa5e10190a34c17a9b3a9d1d8a19797ed197f07f36f6e35ce533a379efe155"
+SRC_URI = "https://gitlab.freedesktop.org/geoclue/geoclue/-/archive/${PV}/geoclue-${PV}.tar"
 
-export BUILD_SYS
-export HOST_SYS
-export STAGING_INCDIR
-export STAGING_LIBDIR
+SRC_URI[sha256sum] = "76494f1262fd90faea05116aface7f580b9b50f7c525bc86ccf33409cea95e8d"
 
 # Without this line, package is declared a library and named libgeoclue*
 AUTO_LIBNAME_PKGS = ""
-- 
2.26.2

