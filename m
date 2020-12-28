Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.41419.1609122858297034452
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Dec 2020 18:34:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=kru1E23n;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id o19so21047142lfo.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Dec 2020 18:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=buTN3uNNMyHOr8gDxCf97Yn2VRH7B0h9FC0HcD3dPRI=;
        b=kru1E23nuPucI8SLXvX15QPSIeTbGJ/MwIlo9lL95Btp2cnZit9BYPpTOyXykFVroE
         eoI6oQM1Sivd613GMm9UQ0795Y6ITST9QMJjZhRsQjdHkSzG5oLze9hA3OkWEljE8wS5
         9WqtdBpab8WEklYhCKd1/U/77lqsm7s0LKuHy6YuxwlMiaeVAT+Dj/KsZGktBW8LYts5
         n2/7GTn+TFTiTxqXtUmiwiQW2+3LGrEIZe+CLRbQDbW9CHc/YJMMyNKYWTsOaJuH8GNt
         mV0F9kk75wLC6GVxRhrYgUR1x5dHNL9q1NT219K2U1/aWwFsN2mrsik4QROljn04gfH1
         Cmrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=buTN3uNNMyHOr8gDxCf97Yn2VRH7B0h9FC0HcD3dPRI=;
        b=bXJzOCzo+xWjKSeLPgpdxweW1wHOk6mDYNWbVofii35KT+Cx/Olw+YegTP7gPyfgTa
         WVwkUfc4upkx1d6fPsZAQfFSXP5XxJEfBeeHGJMrAHPWzJIneNJsdPqw2xF3rCEtrym+
         UheLCx2BF0paITrHSxt+4jQ6U/3IBjK7MaVxwEE51QMtk9t9Z5g1J/zQTF5QhGXtGb4b
         tGuj4rQDmCdAwng9y//e3d0BtJue9Q/c9In39uOqfTNTLfCPKlHKS4uWPf7u+Ytcde4A
         19cWIk/P1pL6/fj/hOddMgZKOiLkX52s53NRTbH7PPbqa/eBu6vpyAYYsyL7jW9//vFs
         uSjg==
X-Gm-Message-State: AOAM531ATdQv62fgImfHPgosey2LwP6C/77+nr/gYCVTCrLrKntMLWjw
	ed0CpzlxCuiaNW7t7zs5sgNnrcEg2sWDybbE
X-Google-Smtp-Source: ABdhPJztLKVYpVPqZ8smaDeedyHPNC05teqwnw/chzfjT6lUjMYvduECIFG0Pm6a2nuTKIwSWTC2Fg==
X-Received: by 2002:a19:f101:: with SMTP id p1mr19711177lfh.54.1609122856237;
        Sun, 27 Dec 2020 18:34:16 -0800 (PST)
Return-Path: <dmitry.baryshkov@linaro.org>
Received: from umbar.lan ([94.25.228.115])
        by smtp.gmail.com with ESMTPSA id t15sm5194248lfl.33.2020.12.27.18.34.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Dec 2020 18:34:15 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 1/8] imlib2: add image manipulation libray from englightenment project
Date: Mon, 28 Dec 2020 05:34:00 +0300
Message-Id: <20201228023407.3498609-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228023407.3498609-1-dmitry.baryshkov@linaro.org>
References: <20201228023407.3498609-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Restore and update old imlib2 recipe from meta-efl.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 +
 meta-oe/recipes-graphics/imlib2/imlib2_git.bb | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/imlib2/imlib2_git.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 5023e495102d..82db3d6788ad 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -453,6 +453,7 @@ RDEPENDS_packagegroup-meta-oe-graphics ="\
     fvwm \
     gtkperf \
     gphoto2 \
+    imlib2 \
     libgphoto2 \
     graphviz \
     gtkwave \
diff --git a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
new file mode 100644
index 000000000000..b44b03ce8e78
--- /dev/null
+++ b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
@@ -0,0 +1,39 @@
+SUMMARY = "A graphic library for file loading, saving, rendering, and manipulation"
+
+HOMEPAGE = "https://sourceforge.net/projects/enlightenment/"
+SECTION = "libs"
+LICENSE = "MIT & BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
+
+DEPENDS = "freetype "
+PROVIDES = "virtual/imlib2"
+PV = "1.7.1"
+SRCREV = "v1.7.1"
+
+inherit autotools pkgconfig lib_package
+
+AUTO_LIBNAME_PKGS = ""
+
+SRC_URI = "git://git.enlightenment.org/legacy/${BPN}.git;protocol=https"
+S = "${WORKDIR}/git"
+
+PACKAGECONFIG ??= "jpeg png zlib ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+
+X11_DEPS = "virtual/libx11 libxext libice"
+PACKAGECONFIG[x11] = "--with-x,--without-x,${X11_DEPS}"
+
+PACKAGECONFIG[gif] = "--with-gif,--without-gif,giflib"
+PACKAGECONFIG[jpeg] = "--with-jpeg,--without-jpeg,jpeg"
+PACKAGECONFIG[png] = "--with-png,--without-png,libpng"
+PACKAGECONFIG[tiff] = "--with-tiff,--without-tiff,tiff"
+PACKAGECONFIG[webp] = "--with-webp,--without-webp,libwebp"
+
+PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2"
+PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
+
+PACKAGECONFIG[id3] = "--with-id3,--without-id3,libid3tag"
+
+PACKAGES =+ "${BPN}-loaders ${BPN}-filters ${BPN}-data"
+FILES_${PN}-data = "${datadir}"
+FILES_imlib2-loaders = "${libdir}/imlib2/loaders/*.so"
+FILES_imlib2-filters = "${libdir}/imlib2/filters/*.so"
-- 
2.29.2

