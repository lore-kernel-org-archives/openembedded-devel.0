Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.15922.1621809247493040933
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 May 2021 15:34:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BSWb8yo6;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id b9so3574950ejc.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 May 2021 15:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Z4RtGHlA+jA05pefjCuR0yZDDcfOEPaB6iZ9yDIx7yU=;
        b=BSWb8yo6ZU9MqsXgP5ztbNwQ1X/wvnA0WcG4FI7oTCmU08uzvsosGR2ei1V/IZPThk
         sSEKh1dZHR4DXye3Zv4lHK4NV84tcjp8llJt9ym7s+1iqAknv1MBEDZhk14P4WQBhO1H
         TvzgKNoJpnoLTUmD+Sa3brMSDMC5b7NsWY0cAP6FZctLR+P6wV1VnMUildf1gQ16TukL
         ImG02OMw/a6Kf09Bdcw/9CaWy/XsRkpN48UwM45gXQ6JclBrY9epibDDnkbOxxYky1xi
         Evatxu8EqRP29gAQMqLQ5NzJwJXjl8nOoeC5xSWFl5lJFKt67BN/TYQIDgX8c5liKItC
         D1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z4RtGHlA+jA05pefjCuR0yZDDcfOEPaB6iZ9yDIx7yU=;
        b=XxQ2WkOrAwdJ0JTgisYowh3rEh8v3hOAhbKqqoSlNxt9uyl/7drT+Pl2RoNR9qdnAW
         tocQYT07XkcZAKmz3N0eJERdz2HU+YkO1XwMG27mnlLWdImxJmR5y2bVbi0E4E56A5Ot
         mrcHhQuMXJ69vdvq2EfWf24QzhdcTYJbhXSs73qsCMfeyDJyJAd4An7WLczTcGDsN9k5
         L1zhqks69Dlvo12xQBXYqWm80LB12uMudHGgIydf+irk0QzcwRFPpsnj8+idKirA3Bm4
         GMeP2b8GW8g9Z7d8hvcVquvG/WbOTJRGuromnLtRk2aba/DJd4X+4DsDIeaPNcdRaZDg
         Yf2A==
X-Gm-Message-State: AOAM533BvKr5WKJ6iYS6FKoSQVNN2fRK3D2pOA4OHkzRalcvaa4sQJXy
	2GSltpwkrooamv5mbuL/wIGXNVjg+XM=
X-Google-Smtp-Source: ABdhPJxPMC2kbmHt7XePHpOxFf8Ec9eGsMJfxGR/JfvTmv7fITq1DVRvlrVsKIcetbkVH10XZZ78RA==
X-Received: by 2002:a17:906:40d1:: with SMTP id a17mr20074143ejk.43.1621809246152;
        Sun, 23 May 2021 15:34:06 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f1a3b826a24e63b238b2037.dip0.t-ipconnect.de. [2003:f0:7f1a:3b82:6a24:e63b:238b:2037])
        by smtp.gmail.com with ESMTPSA id t19sm8682032eds.4.2021.05.23.15.34.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 15:34:05 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 6/7] gtkwave: upgrade 3.3.108 -> 3.3.109 / move to gtk3 / tidy up recipe
Date: Mon, 24 May 2021 00:33:52 +0200
Message-Id: <20210523223353.2576671-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210523223353.2576671-1-schnitzeltony@gmail.com>
References: <20210523223353.2576671-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...{gtkwave_3.3.108.bb => gtkwave_3.3.109.bb} | 33 ++++++++++++++-----
 1 file changed, 25 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-graphics/gtkwave/{gtkwave_3.3.108.bb => gtkwave_3.3.109.bb} (47%)

diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.108.bb b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.109.bb
similarity index 47%
rename from meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.108.bb
rename to meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.109.bb
index d9b6886ec..2b572f7e2 100644
--- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.108.bb
+++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.109.bb
@@ -5,19 +5,36 @@ HOMEPAGE = "http://gtkwave.sourceforge.net/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
 
-SRC_URI = "http://gtkwave.sourceforge.net/${BP}.tar.gz"
+SRC_URI = "http://gtkwave.sourceforge.net/gtkwave-gtk3-${PV}.tar.gz"
+SRC_URI[sha256sum] = "35461eccd9b8b4470caa78ab9a8f14ecacbcc9eff63033d8dce58093e786deb7"
+S = "${WORKDIR}/${BPN}-gtk3-${PV}"
 
-SRC_URI[md5sum] = "dd40f09f44d7aed937e63c29b63cd3af"
-SRC_URI[sha256sum] = "ece447340442e7ad029713789552e8392b75dd3808c882ac5193d42fce55eb3b"
+DEPENDS = " \
+    gperf-native \
+    gtk+3 \
+    gdk-pixbuf \
+    tcl \
+    tk \
+    bzip2 \
+    xz \
+    pango \
+    zlib \
+"
 
 inherit pkgconfig autotools gettext texinfo mime mime-xdg
-DEPENDS += "tcl tk gperf-native bzip2 xz pango zlib gtk+ gdk-pixbuf glib-2.0"
-RDEPENDS_${PN} += "tk-lib"
 
-# depends on gtk+ which has this restriction
+# depends on gtk+3 which has this restriction
 inherit features_check
-ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-EXTRA_OECONF = "--with-tcl=${STAGING_BINDIR_CROSS} --with-tk=${STAGING_BINDIR_CROSS} --with-tirpc --disable-mime-update"
+EXTRA_OECONF = " \
+    --enable-gtk3 \
+    --with-tcl=${STAGING_BINDIR_CROSS} \
+    --with-tk=${STAGING_BINDIR_CROSS} \
+    --with-tirpc \
+    --disable-mime-update \
+"
 
 FILES_${PN} = "${bindir} ${datadir}"
+
+RDEPENDS_${PN} += "tk-lib"
-- 
2.31.1

