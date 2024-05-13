Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2309EC25B5F
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 21:02:30 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.5033.1715634142532871950
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 May 2024 14:02:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hLRHi3Pn;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1ecc23e6c9dso31454005ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 May 2024 14:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715634142; x=1716238942; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tcb8JQ1Ftvee7sSDintfkyOPlxa7VXFQ4uPomq8/Cs8=;
        b=hLRHi3PnKNXKI1zKeTC7Iq3m7IrrxmBavMpHBTmLql5o3i5glgKFwNKliWoO4/WJJo
         LRZ/tnQjYKR7WjydZ/do4WLUOEqHqeJDSV+DbBw/ZFiRgl7VGmXV2AjV3Bb/R+e+x47v
         R1Aj+uoE7tdiHtBwolMrdl5uv5dU6o4PUI6HsXg9t51aav7mSDK4kSTk431NaL93ze/g
         ZYofHLwxYsFdCUEvswv2J0cABMYUNkpycjgmg2fqukx7wi4U1y+nCseMwVgPB10bZVkf
         CiFdOCHPz+BloG+SLUfbRsfZlvnosPZruy6unrNqfnRgsU2dQZ/8oZ6MR6Wk4IyNCavT
         5E8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715634142; x=1716238942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tcb8JQ1Ftvee7sSDintfkyOPlxa7VXFQ4uPomq8/Cs8=;
        b=UOEUI0qC/KO7KwLEhG5lh5XTg43vjEViw+02P+Mo/UVr/SeF72V6o50242CPFeh5o0
         b4KKnev9qB8gILSuCJFuiCTMm1WT7UCf+Zt6e8DL5fJl7LdPzqJvZzE5Ip6jCMT+SOiS
         YJmX0kcn2RXcaqeFLxBiVQUOcnbtbygr0hhKHTIymNutKPfBQGTqNTvF7lxwYzgaBHuM
         uRu7Q2JP2BqXuO4KKkGEMvN3bsvAtSUzaRJmgk7Y0aQD/Zr+5EW4f+phTMdAArV0i2UZ
         2F7vkol9iqPjlsxfsafrf+q37SLy5ZuV3HdgQAPOOssIq+ov53ld/qWUyoOoyDmhM2v+
         C0Nw==
X-Gm-Message-State: AOJu0YymIUvoa4YmU9Y/D18S2sHb9M4TOQ9oBJ3KCDvCvPS9hO5TLytu
	GT4JOBjdlLeInltu7QFkE9lZFMRCOs9smkq+HTVQlbdcwvLnW4iXrvX5sTcEoQM=
X-Google-Smtp-Source: AGHT+IFSmn3ttqxpUz0wjhiJJX3ZWd4TTnxVHLMZ8oVd4KWExYTEkA7Ny98DopDpFye2UIEwa344/w==
X-Received: by 2002:a17:902:ea0d:b0:1e4:32b9:c39d with SMTP id d9443c01a7336-1ef43d0a0b1mr135881575ad.13.1715634141403;
        Mon, 13 May 2024 14:02:21 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::6fff])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf316f7sm83678735ad.164.2024.05.13.14.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 14:02:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] orrery: Drop recipe
Date: Mon, 13 May 2024 14:02:18 -0700
Message-ID: <20240513210218.3194402-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 May 2024 21:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110344

This recipe does not compile with gcc-14, looking at its history this
package comes from maemo5 days, There are no direct dependents in
meta-openembedded so I am proposing to remove it. Last commit to this
repo was made 12+ years ago.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |   1 -
 ...instead-of-overriding-in-Makefile.am.patch |  28 --------
 .../0001-orrery-Fix-sprintf-format.patch      |  28 --------
 .../orrery/orrery/orrery.png                  | Bin 19475 -> 0 bytes
 .../orrery/orrery/use.GdkPixbuf.patch         |  61 ------------------
 .../recipes-navigation/orrery/orrery_2.7.bb   |  37 -----------
 6 files changed, 155 deletions(-)
 delete mode 100644 meta-oe/recipes-navigation/orrery/orrery/0001-Append-cflags-instead-of-overriding-in-Makefile.am.patch
 delete mode 100644 meta-oe/recipes-navigation/orrery/orrery/0001-orrery-Fix-sprintf-format.patch
 delete mode 100644 meta-oe/recipes-navigation/orrery/orrery/orrery.png
 delete mode 100644 meta-oe/recipes-navigation/orrery/orrery/use.GdkPixbuf.patch
 delete mode 100644 meta-oe/recipes-navigation/orrery/orrery_2.7.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 7544a9fbfa..c5f8dce979 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -688,7 +688,6 @@ RDEPENDS:packagegroup-meta-oe-multimedia ="\
 RDEPENDS:packagegroup-meta-oe-navigation ="\
     geos \
     ${@bb.utils.contains("DISTRO_FEATURES", "bluz4", "gpsd-machine-conf gpsd", "", d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "orrery", "", d)} \
     geoclue \
     libspatialite \
     proj \
diff --git a/meta-oe/recipes-navigation/orrery/orrery/0001-Append-cflags-instead-of-overriding-in-Makefile.am.patch b/meta-oe/recipes-navigation/orrery/orrery/0001-Append-cflags-instead-of-overriding-in-Makefile.am.patch
deleted file mode 100644
index 829ace09b5..0000000000
--- a/meta-oe/recipes-navigation/orrery/orrery/0001-Append-cflags-instead-of-overriding-in-Makefile.am.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From e13f15205425c67e1101031a33107fa9cd2d65f9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 26 May 2023 10:32:53 -0700
-Subject: [PATCH] Append cflags instead of overriding in Makefile.am
-
-Fixes
-WARNING: orrery-2.7-r0 do_package_qa: QA Issue: File /usr/bin/.debug/orrery in package orrery-dbg contains reference to TMPDIR [buildpaths]
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index b64449f..23637b3 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,4 +1,4 @@
--CFLAGS = -g -O3 -Wall
-+CFLAGS += -g -O3 -Wall
- 
- bin_PROGRAMS = orrery
- orrery_SOURCES = planetInfo.c orrery.c orrery.h phaseConstants.h
--- 
-2.40.1
-
diff --git a/meta-oe/recipes-navigation/orrery/orrery/0001-orrery-Fix-sprintf-format.patch b/meta-oe/recipes-navigation/orrery/orrery/0001-orrery-Fix-sprintf-format.patch
deleted file mode 100644
index 3d5828011a..0000000000
--- a/meta-oe/recipes-navigation/orrery/orrery/0001-orrery-Fix-sprintf-format.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From e600d3c09d2f97a197f86e6987d44d142e7b7cdf Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 27 Jun 2017 21:12:17 -0700
-Subject: [PATCH] orrery: Fix sprintf format
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- orrery.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/orrery.c b/orrery.c
-index e3a1f6d..1b31a9f 100644
---- a/orrery.c
-+++ b/orrery.c
-@@ -3767,7 +3767,7 @@ static void drawOptsScreens(void)
- 		      displayWidth/2 - gdk_string_width(smallFont, scratchString)/2,
- 		      12, scratchString);
-       for (day = 0; day < 7; day++) {
--	sprintf(scratchString, dayName[day]);
-+	sprintf(scratchString, "%s", dayName[day]);
- 	gdk_draw_string(pixmap, smallFont, blueGC,
- 			CAL_DAY_WIDTH/2 + day*CAL_DAY_WIDTH + CAL_LEFT_OFFSET -
- 			gdk_string_width(smallFont, scratchString)/2,
--- 
-2.13.2
-
diff --git a/meta-oe/recipes-navigation/orrery/orrery/orrery.png b/meta-oe/recipes-navigation/orrery/orrery/orrery.png
deleted file mode 100644
index d9865b70ce777d6e4b4c437f73095d2329e222ce..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 19475
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
ScFe&`q`Fg0$0Ox~7W_XxaP++Z

diff --git a/meta-oe/recipes-navigation/orrery/orrery/use.GdkPixbuf.patch b/meta-oe/recipes-navigation/orrery/orrery/use.GdkPixbuf.patch
deleted file mode 100644
index 2abb320d83..0000000000
--- a/meta-oe/recipes-navigation/orrery/orrery/use.GdkPixbuf.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-Upstream-Status: Pending
-
-From: Benjamin Deering
-Subject: orrery crashing X
-Date: Thursday, September 2, 2010 - 5:25 pm
-Link: http://kerneltrap.org/mailarchive/openmoko-community/2010/9/3/13218
-
-diff -uNr orrery.orig//orrery.c orrery/orrery.c
---- orrery.orig//orrery.c	2009-11-30 06:59:44.000000000 +0100
-+++ orrery/orrery.c	2010-11-15 22:33:17.000000000 +0100
-@@ -1238,12 +1238,44 @@
-     }
-     currentEntry = currentEntry->forwardPointer;
-   }
--  if (nDarkGreyPoints > 0)
--    gdk_draw_points(pixmap, darkGreyGC, darkGreyPoints, nDarkGreyPoints);
--  if (nGreyPoints > 0)
--    gdk_draw_points(pixmap, greyGC, greyPoints, nGreyPoints);
--  if (nWhitePoints > 0)
--    gdk_draw_points(pixmap, whiteGC, whitePoints, nWhitePoints);
-+  GdkPixbuf* starDrawingBuf = gdk_pixbuf_get_from_drawable( NULL,
-+                                                            pixmap,
-+                                                            gdk_colormap_get_system()
-+                                                            , 0, 0, 0, 0, displayWidth, displayHeight);
-+  g_assert (gdk_pixbuf_get_bits_per_sample (starDrawingBuf) == 8);
-+  guchar* p;
-+  int rowstride = gdk_pixbuf_get_rowstride (starDrawingBuf);
-+  guchar* pixels = gdk_pixbuf_get_pixels (starDrawingBuf);
-+  int n_channels = gdk_pixbuf_get_n_channels (starDrawingBuf);
-+  GdkGCValues starGCval;
-+  GdkColor starColor;
-+  int pointNum;
-+  gdk_gc_get_values(darkGreyGC, &starGCval);
-+  gdk_colormap_query_color( gdk_gc_get_colormap(darkGreyGC),starGCval.foreground.pixel, &starColor );
-+  for( pointNum = 0; pointNum < nDarkGreyPoints; pointNum++) {
-+    p = pixels + darkGreyPoints[pointNum].y * rowstride + darkGreyPoints[pointNum].x * n_channels;
-+    p[0] = starColor.red & 0xff;
-+    p[1] = starColor.green & 0xff;
-+    p[2] = starColor.blue & 0xff;
-+  }
-+  gdk_gc_get_values(greyGC, &starGCval);
-+  gdk_colormap_query_color( gdk_gc_get_colormap(greyGC), starGCval.foreground.pixel, &starColor );
-+  for( pointNum = 0; pointNum < nGreyPoints; pointNum++) {
-+    p = pixels + greyPoints[pointNum].y * rowstride + greyPoints[pointNum].x * n_channels;
-+    p[0] = starColor.red & 0xff;
-+    p[1] = starColor.green & 0xff;
-+    p[2] = starColor.blue & 0xff;
-+  }
-+  gdk_gc_get_values(whiteGC, &starGCval);
-+  gdk_colormap_query_color( gdk_gc_get_colormap(whiteGC), starGCval.foreground.pixel, &starColor );
-+  for( pointNum = 0; pointNum < nWhitePoints; pointNum++) {
-+    p = pixels + whitePoints[pointNum].y * rowstride + whitePoints[pointNum].x * n_channels;
-+    p[0] = starColor.red & 0xff;
-+    p[1] = starColor.green & 0xff;
-+    p[2] = starColor.blue & 0xff;
-+  }
-+  gdk_draw_pixbuf ( pixmap , NULL , starDrawingBuf,
-+            0, 0, 0, 0, displayWidth, displayHeight, GDK_RGB_DITHER_NORMAL, 0, 0 ) ;
- }
- 
- void makeTimeString(char *string)
diff --git a/meta-oe/recipes-navigation/orrery/orrery_2.7.bb b/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
deleted file mode 100644
index 96a7018de2..0000000000
--- a/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-SUMMARY = "Astronomical application which displays the night sky"
-HOMEPAGE    = "http://projects.openmoko.org/projects/orrery/"
-SECTION = "x11/scientific"
-LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://orrery.c;endline=25;md5=d792bdf2b591972da175aecc38d88cfe"
-DEPENDS = "gtk+"
-
-inherit features_check autotools-brokensep pkgconfig
-
-REQUIRED_DISTRO_FEATURES = "x11"
-
-SRC_URI = "http://projects.openmoko.org/frs/download.php/923/orrery_2.7_clean.tar.gz \
-           file://orrery.png \
-           file://use.GdkPixbuf.patch \
-           file://0001-orrery-Fix-sprintf-format.patch \
-           file://0001-Append-cflags-instead-of-overriding-in-Makefile.am.patch \
-           "
-
-SRC_URI[md5sum]    = "bd62a33e7554ee1030313dfcdefcda8b"
-SRC_URI[sha256sum] = "645166a5e05b2064ab630534a514697fc47b681951e7fe1d635c259cbdf7a5e6"
-
-S = "${WORKDIR}/${BPN}"
-
-do_configure:prepend() {
-    # fix DSO issue with binutils-2.22
-    sed -i 's/ -lrt$/ -lrt -lm/g' ${S}/Makefile.am
-}
-do_install:append() {
-    install -d ${D}${datadir}/orrery
-    cp -R --no-dereference --preserve=mode,links -v ${S}/data/* ${D}${datadir}/orrery
-    chown -R root:root ${D}${datadir}/orrery
-    install -d ${D}${datadir}/icons
-    install -m 0755 ${WORKDIR}/orrery.png ${D}${datadir}/icons
-    rm -rf ${D}${datadir}/orrery/Makefile*
-}
-
-FILES:${PN} += "${datadir}/icons/orrery.png"
-- 
2.45.0


