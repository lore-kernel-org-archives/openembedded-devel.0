Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web12.620.1614811867995848106
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 14:51:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vbKBAgg2;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id b21so17478344pgk.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Mar 2021 14:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4MkzJdJ3gnWqJnCf1Aig/QG3kMFVOuRShNJb5uxGpuU=;
        b=vbKBAgg2nNIHodkasae0pJSIk5gSMCHIyCAMuUIKRBhRr+2zvRlsxD21dF1GzxFPW0
         hgRHgv8+4uKiM2FU+JHBZCsqJ7vzquq/gGHNF1yY0DXvDt2GfI8AnF9KBy5YjgZ5PI9s
         fY8hv+BU3EEogUQnFNsacByvPmq4AkwP8YDL3plNlzmI55q4M7VjLCaGwvWQ0ca6SLY4
         +eLmob1BqkRYO0HQtLbhl3DLzb/+0siMMFyj8D0Spx8Z+/Vt58tL+fbLMsPFqBRgomKE
         Cn6JYUey0+FOGDEMEI3z9hq5aRyZ2IAvA9VO+FYoiAayhzYdpxrW3jJN4TuIUzsjbjm2
         mOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4MkzJdJ3gnWqJnCf1Aig/QG3kMFVOuRShNJb5uxGpuU=;
        b=TFAe2T1dP0s/HDZNyqUJ2tftovHj7VEu153pUvd3ONJPfiaEJteeNiQyFKNuXuAz8F
         zZlaXA4gcA9pXVglHoNr8UhXoraNyspc/2u2yWq/JkFMLqakLRIaR4RtrMFK9PDAQyN6
         aWO42kcsfcEsCWh5Wrz0EpPQE6O+KcBDGRoaYtHBpncWudQ6Ouh73VfAK3Xk4QQAH7zz
         W4RJ7BB6uhio8kUoPTkDaMNiOuxIyfVF/FLMbcBr19DK3EoIBKJXuqmaVGhKT3FALsoQ
         y3um0MNKTXwt3i/28sBR7d0oujZHcZ9Zs4DlfSXwh/ZghbWYWKs+5SDbz5+kvbVuMda9
         YqSQ==
X-Gm-Message-State: AOAM533a3uBa/1Dfdi/H/0a/ZcSj6esfq2hcOjx8vG0GH3evn6XO31rG
	5e1qKv9F69w33X1AAJZzPwud91LOYlM0jA==
X-Google-Smtp-Source: ABdhPJwZje/5GsHYX+I2RgwcKUXc9dGnC7nxEDIQoK4700Dqcd32QfZ7ALair+yAWDha9aVuVg6POQ==
X-Received: by 2002:aa7:973c:0:b029:1ee:193b:6092 with SMTP id k28-20020aa7973c0000b02901ee193b6092mr1031048pfg.59.1614811866880;
        Wed, 03 Mar 2021 14:51:06 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id b6sm23370466pgt.69.2021.03.03.14.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 14:51:06 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-gnome][PATCH 1/2] gimp: Add missing dependencies
Date: Wed,  3 Mar 2021 14:51:00 -0800
Message-Id: <20210303225101.3347910-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Disable checking for updates during runtime

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb
index 070ed1904b..b6135eef57 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb
@@ -5,6 +5,11 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e"
 
 DEPENDS = " \
+    alsa-lib \
+    atk \
+    cairo \
+    fontconfig \
+    freetype \
     gdk-pixbuf-native \
     intltool-native \
     libxslt-native \
@@ -17,6 +22,7 @@ DEPENDS = " \
     mypaint-brushes-1.0 \
     gexiv2 \
     jpeg \
+    libmng \
     libpng \
     libexif \
     tiff \
@@ -44,6 +50,7 @@ SRC_URI[sha256sum] = "2db84b57f3778d80b3466d7c21a21d22e315c7b062de2883cbaaeda9a0
 
 EXTRA_OECONF = "--disable-python \
                 --without-webkit \
+                --disable-check-update \
                 --without-wmf"
 
 EXTRA_OECONF_append_libc-musl_mipsarch = " --disable-vector-icons"
-- 
2.30.1

