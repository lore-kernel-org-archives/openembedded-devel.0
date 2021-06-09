Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web09.3511.1623212828515157310
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 21:27:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mqsiLLCi;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id c12so17466742pfl.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 21:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bw2OHR2Z+ylIYakpaizQYkYOF78XOhBe7Y+PjG3VS9M=;
        b=mqsiLLCiBP3eCT19dfK5bWqpnhpCcuHQ5ojqb7vwX2FB4r46qNrmT0OqOu303XGDv0
         CINwyvvICujJeJTxcsKScP07bV7CnzU6Nij3O/zyOdn+AYuukHVrsTCfmDjGaZ3TMwR9
         xh6WtMBpdA4vh17Q9QsTW4thMep0+V6u0cKzhT258k+Hlx4k7eX5EFAXIDLKwapVN7fs
         +M/FB+pOx+9hUX9LiH4hB8O26wKcMMRiGhnw20BZdN44k1+tPwm+Shw1AdwwlelAjF21
         glqrGNsGPXl3nSnoPiPjy0gMC8Baw9x71058HEe2cBn0kCY0LHxHy20+NnG5qrQxjlbz
         kxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bw2OHR2Z+ylIYakpaizQYkYOF78XOhBe7Y+PjG3VS9M=;
        b=uDwOkiQtMyUqfqKFScOq8XjNtP2fRN+Wgr1/SOOGkC9muHKidlGnbBZvdWia/r6x6c
         FnDE313ipeeWWJMk5qHRdMZ8YpEMWrOCnjOZUTg1YsqYGeh94LMpaTLocx+BqEgDC+yo
         bBrS2eBgK/g+0Iuj+iFLYls1O0nDJbLx+dTjZ1G720mxzGkTxOQHWkWYEoX6Dg5FFyLC
         GRgB6jCRguRMnpTK5I8lEq44YA4hVQqgq5YcEM0eLnpWvxcgZ6UhT83T5Tk//pO9EQ/V
         8gUvZF9TVNGN/aDcaJB9o9bDpMvCnHKv/ll4/ng651e7Vhw1iRnuGZP8LAgNkXv580j6
         OaHQ==
X-Gm-Message-State: AOAM533cJsDwk3QkG3/CbNF/DnBSk8lh7dEad5Vx67tbUW9hUFkwAvHF
	yBRloAUWH677CDWtjIwVlAL8kJzcnh9qiA==
X-Google-Smtp-Source: ABdhPJztxQqZgBtRrQog9BS7RKAXiMZ4eyypsfv6PeLGIFnG6R25rc44DCj+y2sdUtQA7Xcnk6tsYw==
X-Received: by 2002:a05:6a00:26d8:b029:2ea:1101:8acf with SMTP id p24-20020a056a0026d8b02902ea11018acfmr3347169pfw.67.1623212827481;
        Tue, 08 Jun 2021 21:27:07 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id k25sm12034231pfk.33.2021.06.08.21.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 21:27:07 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-gnome][PATCH] gthumb_3.10.3.bb: Make polkit and GI as required distro features
Date: Tue,  8 Jun 2021 21:27:04 -0700
Message-Id: <20210609042704.823258-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

it depends on colord which needs these features to compile

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/gthumb/gthumb_3.10.3.bb              | 4 +++-
 .../recipes-support/packagegroups/packagegroup-gnome-apps.bb  | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_3.10.3.bb b/meta-gnome/recipes-gnome/gthumb/gthumb_3.10.3.bb
index 94cac89a91..00b1873455 100644
--- a/meta-gnome/recipes-gnome/gthumb/gthumb_3.10.3.bb
+++ b/meta-gnome/recipes-gnome/gthumb/gthumb_3.10.3.bb
@@ -4,6 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 GNOMEBASEBUILDCLASS = "meson"
 
+REQUIRED_DISTRO_FEATURES = "polkit gobject-introspection-data"
+
 DEPENDS = " \
     glib-2.0-native \
     bison-native \
@@ -22,7 +24,7 @@ DEPENDS = " \
     libsecret \
 "
 
-inherit gnomebase gnome-help gsettings itstool mime-xdg
+inherit features_check gnomebase gnome-help gsettings itstool mime-xdg
 
 SRC_URI[archive.sha256sum] = "dab73f77cc2963ebe90112972c301441d228af3003cfef3f8b7300a6d5d3c212"
 
diff --git a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
index 8771cb3685..a45dfdeda2 100644
--- a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
+++ b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 inherit packagegroup features_check
 
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 polkit gobject-introspection-data"
 
 RDEPENDS_${PN} = " \
     evolution-data-server \
-- 
2.32.0

