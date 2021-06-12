Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web08.9909.1623528623766533779
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Jun 2021 13:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MOTYfCnk;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id k25so9720152eja.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Jun 2021 13:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fcx3cPAA6Hdj4d7w3XgM2jbmBW6fhEA7nwi2dXjVkdo=;
        b=MOTYfCnk7kKOG3tQ2VpMOamVPh2cJJWA96FVO5QuTpZUdmAAkDZx3U8rqbnGA4QD1c
         ufflSIAh1TT2qXFvDMUCJGHYSVOn+TsYYj2qfAIG8tBy3zEttonAI610XO+/9VVychOm
         kD+HkLWTez4m0AoBmlq6oJSgjPGAsUyu3NKVDR+DtEU8+uLNWBJPOGZWCeCOlb2FqdsN
         iFzdfAXlLY7mUYEaXlqe867R770Db46bKcTLorFe2hmE1qqpHmnX7xjB8m/L8HecN20q
         xr+y6xtZyWbZNf5ZFWMBtHrO0ENvCWLGf2djyef/7tp6g9of4Z8lDNWtwQ6hBuxzCFtw
         7JPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fcx3cPAA6Hdj4d7w3XgM2jbmBW6fhEA7nwi2dXjVkdo=;
        b=iAP/MlYDvP0DrBQppJSDa6pMfTTPdLTT1CrfSsp/pxpzJ3DJaxC6aSIaiuqnLq/4Pg
         MwxHo9zQRe6346k4oZsEaLq30z7sHS36iDjAzlgxBPx7dL8SvtSXjuR4+NZBNwLWZyMS
         toNY1IsyqgUE9e5LAgXKE1P2/4IAOW6+JQ9i2eKv7SQI5rze/X82apDy0RS50+7aOJZu
         0MIyNooGReHvpJ7VSBWnWTOZe4cULnv33jRVN+IGIyzkS6vB7pRYk9UZN+qsjH5Ezq+X
         f6iFO1zshBodFTFifCJyWIAi7j+Ll5KQyO2YxYF7vlQeYpx69IJ2x8Np2qHwbSor98Dd
         l2QQ==
X-Gm-Message-State: AOAM533pSJbJaRKo2eY4tYqn68mgOswZ+xerUZpsn/iUDpjoiLjuzE9L
	mpdGJOkkauVBiPgZwwjb2+Pvc2Ur5s8=
X-Google-Smtp-Source: ABdhPJz+bChyV3285AK1L9HCPQAyPM9SziA6jEmjhig8K8Z9nbT5hB8FAMT0RmmJRe/dz5OCBfLMUg==
X-Received: by 2002:a17:906:d20b:: with SMTP id w11mr8122439ejz.242.1623528622206;
        Sat, 12 Jun 2021 13:10:22 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id d25sm1066209edu.83.2021.06.12.13.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jun 2021 13:10:21 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCHv2] rygel: require gobject-introspection-data in DISTRO_FEATURES
Date: Sat, 12 Jun 2021 22:10:19 +0200
Message-Id: <20210612201019.1390144-1-Martin.Jansa@gmail.com>
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
index b9f90d2c7f..0601cdd99b 100644
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
     gst-instruments \
     libsrtp \
     srt \
-- 
2.30.2

