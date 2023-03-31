Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B7BEC761A6
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 15:47:39 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.58727.1680277649923317494
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Mar 2023 08:47:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eblemYQn;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id iw3so21610369plb.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 08:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680277649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=btqRW0724c9ZpDYvQ6R981LgDsaecxhw4W2S/Pm8zTU=;
        b=eblemYQnl/eS4YOoCvAy50NjsPMIf8KFpkgyDV2XUGSLkLETPIrhhvXu/l0+sY5ztY
         jooYdybuDDnewD4UkBiwCei93TmitS+GpzuXKCJg0aEa1LlWJ/lK0FmyXVsojwcuQI8q
         r6Yoc6v0MXL3dBxf1I0zKM8t+D7+5dpP4tHcWiOSrB+fwX1ZdAMJOvN6DCwrf8VaAZwt
         TK83hsQNHFoOre+dVYQo57Jd4GBer3520C467VaRCADZXFVpRdhboP3ExfnFwG8Dboql
         mjl5ev1K1s+yvilv69SoJ0dfWt0BslEBCOTWSK43v4gzlIwJ/Na4PXKd/BvXQbI0jpAF
         7F4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680277649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=btqRW0724c9ZpDYvQ6R981LgDsaecxhw4W2S/Pm8zTU=;
        b=HEbDXTBLJJ9dPVgE1tzN/IZCSD21aihlJ8Fwedjcxp6y8yDJCw8qioI+IaEtqkCNt0
         HOIBVzbMGtuTCZMgwmilDQNrLRcVDERthCqqdBSlwoyO9NJN6I53GhLQN+XnFE97vgPB
         FR/Zwx2AXIBxxm+gpaKehDSEM27xF73UgDsiVjEu+weatPqFW6I4rx5YMW0Qn8vh4UM+
         ILrgJLgp+JJ4rc7Aah8HKErDAm4OAgyn86sZZl8Q+5DTwTipPpnQ4IZokMWvwymZ6AH1
         XfHNhXtSLv1KMNlvZ+62CNG8ckvwMrAxOF+D6krZKnQ8w3PYXhb2PlyWlZB5TXdbKO7B
         ubPw==
X-Gm-Message-State: AAQBX9cFfm0oxtxOLaT3OVAuIJndFHUCLZNQyGgjREX/zwndOE52bgdp
	gnp74Kh3rs3yk9+16Af04j3cg+RMQdMoAQ==
X-Google-Smtp-Source: AK7set9epMZ5ABUrt5gi9VaYJyyDvHYZkiXrvIU5triXPGkpVlh/R/R/dZ3m7bhXDN4tp6qtbcCadw==
X-Received: by 2002:a17:90a:31c:b0:23f:ec0f:aab8 with SMTP id 28-20020a17090a031c00b0023fec0faab8mr30527753pje.40.1680277649030;
        Fri, 31 Mar 2023 08:47:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::bed3])
        by smtp.gmail.com with ESMTPSA id u18-20020a17090adb5200b00233d6547000sm1624567pjx.54.2023.03.31.08.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 08:47:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/4] imagemagick: Update to 7.1.1
Date: Fri, 31 Mar 2023 08:47:24 -0700
Message-Id: <20230331154724.1302078-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230331154724.1302078-1-raj.khem@gmail.com>
References: <20230331154724.1302078-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 15:47:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101861

Add a patch to fix build with upcoming autoconf 2.72

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Use-autconf-provided-AC_FUNC_FSEEKO.patch | 42 +++++++++++++++++++
 ...emagick_7.0.10.bb => imagemagick_7.1.1.bb} | 16 ++++---
 2 files changed, 52 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/0001-m4-Use-autconf-provided-AC_FUNC_FSEEKO.patch
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.0.10.bb => imagemagick_7.1.1.bb} (90%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/0001-m4-Use-autconf-provided-AC_FUNC_FSEEKO.patch b/meta-oe/recipes-support/imagemagick/imagemagick/0001-m4-Use-autconf-provided-AC_FUNC_FSEEKO.patch
new file mode 100644
index 0000000000..6b225a10cf
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/0001-m4-Use-autconf-provided-AC_FUNC_FSEEKO.patch
@@ -0,0 +1,42 @@
+From 0912e49d58c2a5f455fabf76ab7dc61cfc44cfb9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 30 Mar 2023 20:50:26 -0700
+Subject: [PATCH] m4: Use autconf provided AC_FUNC_FSEEKO
+
+This helps in building with autoconf 2.72
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ m4/ac_func_fseeko.m4 | 18 +-----------------
+ 1 file changed, 1 insertion(+), 17 deletions(-)
+
+diff --git a/m4/ac_func_fseeko.m4 b/m4/ac_func_fseeko.m4
+index eaeabb978..f9b8859cf 100644
+--- a/m4/ac_func_fseeko.m4
++++ b/m4/ac_func_fseeko.m4
+@@ -53,20 +53,4 @@
+ # --------------
+ AN_FUNCTION([ftello], [AC_FUNC_FSEEKO])
+ AN_FUNCTION([fseeko], [AC_FUNC_FSEEKO])
+-AC_DEFUN([AC_FUNC_FSEEKO],
+-[_AC_SYS_LARGEFILE_MACRO_VALUE(_LARGEFILE_SOURCE, 1,
+-   [ac_cv_sys_largefile_source],
+-   [Define to 1 to make fseeko visible on some hosts (e.g. glibc 2.2).],
+-   [[#include <sys/types.h> /* for off_t */
+-     #include <stdio.h>]],
+-   [[int (*fp) (FILE *, off_t, int) = fseeko;
+-     return fseeko (stdin, 0, 0) && fp (stdin, 0, 0);]])
+-
+-# We used to try defining _XOPEN_SOURCE=500 too, to work around a bug
+-# in glibc 2.1.3, but that breaks too many other things.
+-# If you want fseeko and ftello with glibc, upgrade to a fixed glibc.
+-if test $ac_cv_sys_largefile_source != unknown; then
+-  AC_DEFINE(HAVE_FSEEKO, 1,
+-    [Define to 1 if fseeko (and presumably ftello) exists and is declared.])
+-fi
+-])# AC_FUNC_FSEEKO
++AC_FUNC_FSEEKO
+-- 
+2.40.0
+
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
similarity index 90%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index b6344a381f..07434c0564 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -4,23 +4,27 @@ HOMEPAGE = "https://www.imagemagick.org/"
 DESCRIPTION = "ImageMagick is a collection of tools for displaying, converting, and \
 editing raster and vector image files. It can read and write over 200 image file formats."
 LICENSE = "ImageMagick"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b97c12a9213df1499565d69b92c73dd7 \
-                    file://NOTICE;md5=d8b9d2ccf273687ad12ebd06e5d8478f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ac58ac14f9d9d02cafd2d81ef38fb2cc \
+                    file://NOTICE;md5=bcbf1f1897b40ec8df39700cb560e9ed"
 # FIXME: There are many more checked libraries. All should be added or explicitly disabled to get consistent results.
 DEPENDS = "lcms bzip2 jpeg libpng tiff zlib fftw freetype libtool"
 
 BASE_PV := "${PV}"
-PV .= "-62"
-SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https"
-SRCREV = "35b4991eb0939a327f3489988c366e21068b0178"
+PV .= "-5"
+SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https \
+           file://0001-m4-Use-autconf-provided-AC_FUNC_FSEEKO.patch"
+SRCREV = "2d24be538f286962c355cf422bb525375ac77998"
 
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig update-alternatives
+export ac_cv_sys_file_offset_bits="64"
 
 # xml disabled because it's using xml2-config --prefix to determine prefix which returns just /usr with our libxml2
 # if someone needs xml support then fix it first
-EXTRA_OECONF = "--program-prefix= --program-suffix=.im7 --without-perl --disable-openmp --without-xml --disable-opencl"
+EXTRA_OECONF = "--program-prefix= --program-suffix=.im7 --without-perl \
+                --disable-openmp --without-xml --disable-opencl \
+                --enable-largefile"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[cxx] = "--with-magick-plus-plus,--without-magick-plus-plus"
-- 
2.40.0


