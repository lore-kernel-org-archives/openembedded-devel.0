Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web12.8495.1615043503272253061
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Mar 2021 07:11:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=jtYPcT9O;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.169, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f169.google.com with SMTP id u18so8389132ljd.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Mar 2021 07:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AcB3tt85z02O9zVo3VussV84TnzCODZcG7/up1VZOD4=;
        b=jtYPcT9OOYPr/rcIb0d5kK8slANz87ZH0uhrFrwUXYfYexhRcqaZhfIKPRaruS3zIs
         KsnDfSduUg2nkiTmzJcJgQ+ahMSTn1knxVGmzQ1I2TLLXXV4ENCKzI8RpLtxFlgiXEY4
         jh8tEToJXo7qcG+XQmC7QMFxs4neOuYVrIXdg5vZY9oSQlKAON8fjXh9Y3n64r+i/K+5
         DZ+wXPg7Okh5M1+qL4xPxCl27rbKtXM5B+3k8cc1cEKFPv6/AKKb5I5ez6mq5/a2UGPH
         e0IS6iP9z1ypQpFW7Lio5n5tB0gxUYrgYjSPasVS6JpGvNYyPiFbxS5bYHXN591q1CLb
         kxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AcB3tt85z02O9zVo3VussV84TnzCODZcG7/up1VZOD4=;
        b=BhninJFsMOSliRuwj71kS6TeGbfQn2XKcXrkqGyk/VkYZnEZJRiRrTaFsGgixONtqp
         l2kHYchzplX8hVDJ90InI8md5LVbcYhFRjw56HKq6vFfKfHy3aaTF9Froiup8M1MXuW2
         hH1zhyvWVUftsxjPmiqyPXAwlHLrmIk3lnItXJgxyMEE0IY9VBGAMCyPA41LD5NrLXE+
         jl93a53nD8L+udLDDIKhOZ58YFZcDrPsrAtzynl78Rbw1lXHcet3a7HAQZjQnkQwfI6h
         uUrD+zm3kYkkXUaoqW/IuhHuQ/RGzqRr/M64fvEFscjZdkUc23zsXZ6qDDT2+B6yqlNz
         pZ6A==
X-Gm-Message-State: AOAM533x2FipGNiQonOvjePTbLfkPdJAQUNhcWtDa7XQ44FlUCFH13kS
	6QJ5owQKxQtlrruZAfR1Urw4bZGKTuQl3Z4F
X-Google-Smtp-Source: ABdhPJw2Tu/rPDEMCsoCAELWWbWwdrjR8DaBLsmgq6ZD0UFhndgjNitqPu4tYmxm4Ks8Op41TZcXDg==
X-Received: by 2002:a05:651c:118a:: with SMTP id w10mr8227060ljo.431.1615043500970;
        Sat, 06 Mar 2021 07:11:40 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id a1sm728643ljb.76.2021.03.06.07.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 07:11:39 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] libnice: update to 0.1.18
Date: Sat,  6 Mar 2021 16:11:32 +0100
Message-Id: <20210306151132.792352-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{libnice_0.1.16.bb => libnice_0.1.18.bb}     | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-support/farsight/{libnice_0.1.16.bb => libnice_0.1.18.bb} (67%)

diff --git a/meta-oe/recipes-support/farsight/libnice_0.1.16.bb b/meta-oe/recipes-support/farsight/libnice_0.1.18.bb
similarity index 67%
rename from meta-oe/recipes-support/farsight/libnice_0.1.16.bb
rename to meta-oe/recipes-support/farsight/libnice_0.1.18.bb
index 7bd6478d4..f40086964 100644
--- a/meta-oe/recipes-support/farsight/libnice_0.1.16.bb
+++ b/meta-oe/recipes-support/farsight/libnice_0.1.18.bb
@@ -9,18 +9,20 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9c42325015702feda4f4d2f19a55b767 \
 "
 
 SRC_URI = "http://nice.freedesktop.org/releases/libnice-${PV}.tar.gz"
-SRC_URI[md5sum] = "5ad936c43d3c6d33117b2c64982f2fd9"
-SRC_URI[sha256sum] = "06b678066f94dde595a4291588ed27acd085ee73775b8c4e8399e28c01eeefdf"
+SRC_URI[sha256sum] = "5eabd25ba2b54e817699832826269241abaa1cf78f9b240d1435f936569273f4"
 
 DEPENDS = "glib-2.0 gnutls"
 
-PACKAGECONFIG ??= "gstreamer1.0"
-PACKAGECONFIG[gupnp] = "--enable-gupnp,--disable-gupnp,gupnp-igd"
-PACKAGECONFIG[gstreamer1.0] = "--with-gstreamer,--without-gstreamer,gstreamer1.0 gstreamer1.0-plugins-base"
+PACKAGECONFIG ??= "gstreamer"
+PACKAGECONFIG[gupnp] = "-Dgupnp=enabled,-Dgupnp=disabled,gupnp"
+PACKAGECONFIG[gstreamer] = "-Dgstreamer=enabled,-Dgstreamer=disabled,gstreamer1.0"
+PACKAGECONFIG[introspection] = "-Dintrospection=enabled,-Dintrospection=disabled,"
 
-inherit autotools pkgconfig gtk-doc gobject-introspection
+GTKDOC_MESON_OPTION = "gtk_doc"
+GTKDOC_MESON_ENABLE_FLAG = "enabled"
+GTKDOC_MESON_DISABLE_FLAG = "disabled"
 
-EXTRA_OECONF += "--without-gstreamer-0.10"
+inherit meson gtk-doc gobject-introspection
 
 FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
 FILES_${PN}-dev += "${libdir}/gstreamer-1.0/*.la"
-- 
2.25.1

