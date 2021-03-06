Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web08.8733.1615044099673740084
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Mar 2021 07:21:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=LOAZSf4o;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.179, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f179.google.com with SMTP id a17so8420663ljq.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Mar 2021 07:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kpE2QnJJheHc03T9K6bMIfN5VKgCBQ6cyuvSZAm+Lu8=;
        b=LOAZSf4oxQ8tI3+ScsRLCQ5l9zO4tv5Y/3tLvrx5ClWW52hrFA37xK+3S8t1GyguAA
         Gs5cGPzWnJm+etbozet73fXwX1x8chn3M109QakI6oCsoKazpIxdvij6VUaT17T3qdqf
         n2/k4JvG91jyRKxhTIX1q3Rg28z8DLJqzx0y79D4+WinHatCng5Pgj9hCWaK4lQC4N6h
         nZ2jTszVjaG7jNhxVJk6YCLAqlSX6+9Gqmx4Ue2qz+KfnZaXT6rJ2xp2XBgeOnYZQYTB
         2f2Wxcma8VsIv4qvoQd/XsCdEygt717mCSZuPs+9/oMI9A4zCN026m0dKqRo9LEnje+g
         d4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kpE2QnJJheHc03T9K6bMIfN5VKgCBQ6cyuvSZAm+Lu8=;
        b=Hwvs1e7lonqfZTD8sJuDfpZ377lh7ICodzPnknNPQyDfDIgN2a2Fe2ZdO4Jz03vtkE
         Auuz3yAd/7XmXhPf0YAGZlirZ4DahwFT2Gdorugcy8B6VZqkE6zX/W6lLg+hW04p9NRs
         V+rhZpQWIEh78Qtue7EYXNDaKrIvATe8HN7jnk/5o5qLefhMPdntdALQINhzf7xZx0KR
         V4YQL4zkm30vdOvNKy6/FzX3HSGwO70Sty9UltAjLhdgMJnBUeMMmxrJY3E2Fa2Kopux
         6ptdzzboBsCOk4FVwo++2dxRpzkMSYeScsX4daVq2VfmlAu9gUSJI4vVU81aqsp4ffvc
         f/gg==
X-Gm-Message-State: AOAM533EkPhzlmbkbKKEkCAcMaIxKUb1YyEXB/kcU4dfZPBRTzsQqtR/
	N1DOe/VcjtW8Ky/RVtW15Um39tE+Gd3aEZJp
X-Google-Smtp-Source: ABdhPJx8yI1On3qVs8T7itF+FRY0fR9oqZSqGqiqgSJttaZRFm+ZpSzD5NHqVino1fxMk7lH+gXBog==
X-Received: by 2002:a2e:9855:: with SMTP id e21mr8269810ljj.26.1615044097072;
        Sat, 06 Mar 2021 07:21:37 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id o4sm692530lfg.253.2021.03.06.07.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 07:21:36 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH v2] libnice: update to 0.1.18
Date: Sat,  6 Mar 2021 16:21:31 +0100
Message-Id: <20210306152131.802453-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{libnice_0.1.16.bb => libnice_0.1.18.bb}    | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-support/farsight/{libnice_0.1.16.bb => libnice_0.1.18.bb} (67%)

diff --git a/meta-oe/recipes-support/farsight/libnice_0.1.16.bb b/meta-oe/recipes-support/farsight/libnice_0.1.18.bb
similarity index 67%
rename from meta-oe/recipes-support/farsight/libnice_0.1.16.bb
rename to meta-oe/recipes-support/farsight/libnice_0.1.18.bb
index 7bd6478d4..f3e7b8bac 100644
--- a/meta-oe/recipes-support/farsight/libnice_0.1.16.bb
+++ b/meta-oe/recipes-support/farsight/libnice_0.1.18.bb
@@ -9,18 +9,21 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9c42325015702feda4f4d2f19a55b767 \
 "
 
 SRC_URI = "http://nice.freedesktop.org/releases/libnice-${PV}.tar.gz"
-SRC_URI[md5sum] = "5ad936c43d3c6d33117b2c64982f2fd9"
-SRC_URI[sha256sum] = "06b678066f94dde595a4291588ed27acd085ee73775b8c4e8399e28c01eeefdf"
+SRC_URI[sha256sum] = "5eabd25ba2b54e817699832826269241abaa1cf78f9b240d1435f936569273f4"
 
 DEPENDS = "glib-2.0 gnutls"
 
-PACKAGECONFIG ??= "gstreamer1.0"
-PACKAGECONFIG[gupnp] = "--enable-gupnp,--disable-gupnp,gupnp-igd"
-PACKAGECONFIG[gstreamer1.0] = "--with-gstreamer,--without-gstreamer,gstreamer1.0 gstreamer1.0-plugins-base"
+PACKAGECONFIG[gupnp] = "-Dgupnp=enabled,-Dgupnp=disabled,gupnp"
+PACKAGECONFIG[gstreamer] = "-Dgstreamer=enabled,-Dgstreamer=disabled,gstreamer1.0"
+PACKAGECONFIG[introspection] = "-Dintrospection=enabled,-Dintrospection=disabled,"
 
-inherit autotools pkgconfig gtk-doc gobject-introspection
+EXTRA_OEMESON = "-Dgstreamer=disabled"
 
-EXTRA_OECONF += "--without-gstreamer-0.10"
+GTKDOC_MESON_OPTION = "gtk_doc"
+GTKDOC_MESON_ENABLE_FLAG = "enabled"
+GTKDOC_MESON_DISABLE_FLAG = "disabled"
+
+inherit meson gtk-doc gobject-introspection
 
 FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
 FILES_${PN}-dev += "${libdir}/gstreamer-1.0/*.la"
-- 
2.25.1

