Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web11.10059.1586757178032729515
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Apr 2020 22:52:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iwXu66Ht;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id t11so2085320pgg.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Apr 2020 22:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qYWXlPCxrjAO4VDUFmwsEV+ZN8fORKei0k1xg6A8POg=;
        b=iwXu66HtKOEQ/feOPRCtMliYEXa4xatOcYuGA1cLIrrlNIZ/7ESlzdkeT0dh12oPQp
         2qaHAblPQQG+m9/Lmm8dRzvv02HL02Z2LkEh5z37LRlthl0zT9CU9BYgePt84Ff1V06q
         och8D/I2frKmUq+arQKcOYJNiE1xoa8JhlIXQvBKYToigkLdogkQeiy9itkxNR3oRakw
         Yi/Hl70VPRk2M1+mo//E/ofP47Zo3vjoMl340zlpL5XqQjvEK27K5JRwEDXIa9DMzF5v
         GzWk/+GTfC5Dq012Mzw2W8hrxgG9OAvzlbeNZHxO4G2KqCohKMnn+jtjUou8PoWrUe4r
         GXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qYWXlPCxrjAO4VDUFmwsEV+ZN8fORKei0k1xg6A8POg=;
        b=K5GuT1EW0iBmue9AQKoAg+QVAjLZgaj78eX5UJBiToFCLcTVpWl+7XCRPO6wpbglAA
         ug29dSBIymEwW/zM/DFHtN7/hP4SGcJGBDa9QPiyxyuS2rVA1kzHK9RQvBh+J+kKtYdV
         r1oamfI8tsMN7F1MK3G3dTIO+iHiktc/Zea+oK+fAVj6ikshVSdYDh3n7Immhu6uT6cm
         Uy4fsTuoaWuDNMx9gPgnWsHly5KBJxE8cjs2MdYfk+tJSYGK2VDuHDIAgl4J4ukSUKZ6
         vGCwoHuGlbzWxIQFXTY6CRS07gwpTWLsXwjj8PKcnhGlUcy2PSmLc+5At5rnaPxjt9U/
         d5hA==
X-Gm-Message-State: AGi0PuZhewQy4T8gfR99zUV+0eqbd0JsaBoo9bp/0ChmylknWV00B4I7
	0cyYhOBGcRK69LePbNXDAOHORxF8vLk=
X-Google-Smtp-Source: APiQypL9C9EOW3GdHryVhcCrStU0J7FIfHlFTGf44cJY41hprgQLglgCXYZIP3SUglJycFKpkX5qnQ==
X-Received: by 2002:a62:d40b:: with SMTP id a11mr3185246pfh.92.1586757177169;
        Sun, 12 Apr 2020 22:52:57 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::58e0])
        by smtp.gmail.com with ESMTPSA id d8sm8125038pjx.12.2020.04.12.22.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2020 22:52:56 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 2/2] vlc: Upgrade to 3.0.9.2
Date: Sun, 12 Apr 2020 22:52:52 -0700
Message-Id: <20200413055252.1399706-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200413055252.1399706-1-raj.khem@gmail.com>
References: <20200413055252.1399706-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add packageconfig for enabling wayland support

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/vlc/{vlc_3.0.8.bb => vlc_3.0.9.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/vlc/{vlc_3.0.8.bb => vlc_3.0.9.2.bb} (96%)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.8.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
similarity index 96%
rename from meta-multimedia/recipes-multimedia/vlc/vlc_3.0.8.bb
rename to meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
index c15ff9a431..9e41512c3e 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.8.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
@@ -23,8 +23,7 @@ SRC_URI = "http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.tar.xz \
            file://0007-use-vorbisidec.patch \
            file://0008-fix-luaL-checkint.patch \
 "
-SRC_URI[md5sum] = "744442ec0c145453ea1d257914c8072e"
-SRC_URI[sha256sum] = "e0149ef4a20a19b9ecd87309c2d27787ee3f47dfd47c6639644bc1f6fd95bdf6"
+SRC_URI[sha256sum] = "a9bdad293d81cd48516abad8d490d8ab4012964ae541ff19e00021e071e47601"
 
 inherit autotools gettext pkgconfig features_check mime-xdg
 
@@ -88,6 +87,7 @@ PACKAGECONFIG[vnc] = "--enable-vnc,--disable-vnc, libvncserver"
 PACKAGECONFIG[x11] = "--with-x --enable-xcb,--without-x --disable-xcb,  xcb-util-keysyms libxpm libxinerama"
 PACKAGECONFIG[png] = "--enable-png,--disable-png,libpng"
 PACKAGECONFIG[vdpau] = "--enable-vdpau,--disable-vdpau,libvdpau"
+PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,wayland wayland-native"
 
 do_configure_append() {
     sed -i -e s:'${top_builddir_slash}libtool':'${top_builddir_slash}'${TARGET_SYS}-libtool:g ${B}/doltlibtool
-- 
2.26.0

