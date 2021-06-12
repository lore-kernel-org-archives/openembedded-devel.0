Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web12.10125.1623528564532257391
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Jun 2021 13:09:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k/9RP7OK;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id my49so9737925ejc.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Jun 2021 13:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6SduHpxfo7FAlRoKfO/qkaoV18jEFEPPcQA1khpln/s=;
        b=k/9RP7OKVCcebEY0JzZ3CJkpA6Y0fWdzUSZu3mDPdXHRIao8voV7o7wENewvnYdpyZ
         GgLHmMkJGTOf/Re0hxnNXKoUmyoldjEe1wh0swpSuYm1Ycnds2Ewqp3Zq3Tft1o9SoKT
         h3VLLKtSIpZRUuaqfSf1w9P8urb9Yv4S/sKqVYqtKb8PRfGZlUmqDpigLvviqJ0sO5ij
         v1+64CICgqWoFM43OHLkRB5eMqkNNH5ddfFzaIz310oa2gxRvDRR71N80biMZDWTnu3S
         ZoDH2h5/EaepPogNN+VWgu4aK6rjLy7xM06NkGA/NeZMe2R0hIzRA+gWnEVO2Au52dtq
         VM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6SduHpxfo7FAlRoKfO/qkaoV18jEFEPPcQA1khpln/s=;
        b=HhQuzanYyfS74aql3954tHKkHkTx4sriyyu2QSYG5Ylh8DQ+GJ1q6Lt9sIUR1rqMC+
         cJv0XMoBAdun6GJZw9I/6Umskfxf+03xv6nQsXgt5LUTbzwPeV0XQ/CiuLhXmELD6OYS
         phVvq89QoAEVR+M51CMeqgi0AtZ2CdVj16H/iGRdv5OZTqzWMu6pXCcHLITW8WCBdQrO
         MRDEzs7gginZD3Hb023SX3LqDhAfd4CCHdqI6w5CZ1Hs4/QF1u2cih+uDcJBiCzf/V99
         mrvw9YOCirklipTEaEWkOai+qZwC8FZhTjSYCRTQnJoKoY/d6FlhWOBloLWMh8zrLmxF
         o99g==
X-Gm-Message-State: AOAM530J5zVH/wCesrsxxUj761JkZAn4sN05Z0Ud2ddoagDd/A9obDc4
	F7/S/xtVdQ6LFBxpD+27g024lQccRz4=
X-Google-Smtp-Source: ABdhPJyQUB2aM1NAYIuDidY9aCXugGRrbFarae89RmlKo8J8uazp6zf7+nQNNCzVJA/7nDDseqIXww==
X-Received: by 2002:a17:906:b190:: with SMTP id w16mr9007961ejy.332.1623528562671;
        Sat, 12 Jun 2021 13:09:22 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id n15sm4331689eds.28.2021.06.12.13.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jun 2021 13:09:22 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] rygel: require gobject-introspection-data in DISTRO_FEATURES
Date: Sat, 12 Jun 2021 22:09:20 +0200
Message-Id: <20210612200920.1389806-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <1687EE4C27574B0C.10009@lists.openembedded.org>
References: <1687EE4C27574B0C.10009@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* introduced in libmediaart-2.0 with:
  https://git.openembedded.org/meta-openembedded/commit/?id=2b90058c346a5a56dced3c1b7413068027a884f1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-connectivity/rygel/rygel_0.38.3.bb   | 5 ++++-
 .../packagegroups/packagegroup-meta-multimedia.bb            | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.38.3.bb b/meta-multimedia/recipes-connectivity/rygel/rygel_0.38.3.bb
index 3fc8450513..01705a8f71 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.38.3.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.38.3.bb
@@ -12,7 +12,10 @@ DEPENDS = "libxml2 glib-2.0 gssdp gupnp gupnp-av gupnp-dlna gstreamer1.0 gstream
 RDEPENDS_${PN} = "gstreamer1.0-plugins-base-playback shared-mime-info"
 RRECOMMENDS_${PN} = "rygel-plugin-media-export"
 
-inherit gnomebase vala gobject-introspection gettext systemd
+inherit gnomebase vala gobject-introspection gettext systemd features_check
+
+# gobject-introspection is mandatory for libmediaart-2.0 and cannot be configured
+REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 
 SRC_URI[archive.md5sum] = "7f95401903a3f855b464d5152b9d4c07"
 SRC_URI[archive.sha256sum] = "08c21a577f7bdad26446a75ffa32778b26842c3b1188165f0b19818559747d00"
diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
index 73b852a4a9..852295b983 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
@@ -85,7 +85,7 @@ RDEPENDS_packagegroup-meta-multimedia-connectivity = "\
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gupnp-tools", "", d)} \
     gupnp \
     libupnp \
-    rygel \
+    ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data", "rygel", "", d)} \
 "
 RDEPENDS_packagegroup-meta-multimedia-dvb = "\
     oscam \
@@ -99,7 +99,7 @@ RDEPENDS_packagegroup-meta-multimedia-mkv = "\
 
 RDEPENDS_packagegroup-meta-multimedia-support = "\
     crossguid \
-    libmediaart-2.0 \
+    ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data", "libmediaart-2.0", "", d)} \
     libmediaart \
     gst-instruments \
     libsrtp \
-- 
2.30.2

