Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9DE1B7E3B6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 21:28:24 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id h2so25363524ljk.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 14:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=wvh2beBe3hzxj7BMxaSs2aiFmr74F6H+mO9W2Dm+1Rg=;
	b=CNVU8yug0pQ7TV3N1k01QY0bMHKHuvfS2hpLUiEiZo7RNLfWe9FrLylT8V0NVyKGyt
	v2yROdxFsXaW30n0GYvBE4OPOWeFEDGt4Agr5pCk3VANNQ0eya8JKRyXgWeCAcKbDZpg
	dBLuvRdDyVDz5ZMOt97AYanA5tdVwpcGTvlo9jR+G+2VrWONdMa5LsYyqAK9JEMjeJOz
	1bNt2cjw1QrFyhPshypP/qrgY6fsH2BObVRoBIevouQ/tAAM1QMphbnd2oWNShAdxw/q
	tBsyEdLlTVij5/Y6kFn32pxWuK+FnuMDHP6Dy/hctB9lygrKx67vdTUWSlRaSUmeBkgR
	8Jzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wvh2beBe3hzxj7BMxaSs2aiFmr74F6H+mO9W2Dm+1Rg=;
	b=AszCLtW+NDWxrMHXKfCyWb2zPq+IkB43o366p+e3sAprF42tJrC+2wSzqcag9VOINR
	HpfKSF8ji05UcWHpG7v6gziExssDFKxY2Bj3GKJ0r+ZIQgnjeqV+2cdCwhkuvy27nW3L
	4mf/bJDMG+CBMsvfniE4OPpxZSrxyiJQMrV04ZAUrV6EP1ZnYUMpghhPdjRq5y4X+ecK
	AEs/Tw8jTnDbcXN7o0bMAnkljz87muYfaSSlFu6Ul8M4JmXiZcD7bRk+d/R6jjuBNRfw
	E7Sd72ga+lvtU/gqWqIz2lHCu4l4+vxYpy8gTXI9+etsP+SBnSaRXrtls3wr/RE6AG7d
	TKJw==
X-Gm-Message-State: APjAAAXERWEo4BnWA9eCkwJ5DuFwCmQYGKpVWFcpL5xn16C5ZRiXcKoR
	RtXHtqc0/VF6PcxHj1Puqt5c7c/KVQk=
X-Google-Smtp-Source: APXvYqxrgnZXmpDsbYnsr1L8JjoLsf5vAxwhFOMy6TRTXx2B+69WjukZQce69HUEyXpT06X+6miXWg==
X-Received: by 2002:a2e:9f17:: with SMTP id u23mr771555ljk.241.1568582904566; 
	Sun, 15 Sep 2019 14:28:24 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id c4sm8460600lfm.4.2019.09.15.14.28.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Sep 2019 14:28:23 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Sep 2019 23:28:09 +0200
Message-Id: <20190915212810.27364-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe 1/2] gelg: update to 0.4.16
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Sep 2019 21:28:25 -0000

License checksum was changed because http links in the file were
replaced with https (see @758b21f68438c53496078fb5cf177166f32e603a).

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../gegl/{gegl_0.3.18.bb => gegl_0.4.16.bb}        | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-graphics/gegl/{gegl_0.3.18.bb => gegl_0.4.16.bb} (70%)

diff --git a/meta-oe/recipes-graphics/gegl/gegl_0.3.18.bb b/meta-oe/recipes-graphics/gegl/gegl_0.4.16.bb
similarity index 70%
rename from meta-oe/recipes-graphics/gegl/gegl_0.3.18.bb
rename to meta-oe/recipes-graphics/gegl/gegl_0.4.16.bb
index 0053c0c68..0a8064478 100644
--- a/meta-oe/recipes-graphics/gegl/gegl_0.3.18.bb
+++ b/meta-oe/recipes-graphics/gegl/gegl_0.4.16.bb
@@ -1,11 +1,11 @@
 SUMMARY = "GEGL (Generic Graphics Library) is a graph based image processing framework"
 LICENSE = "LGPL-3.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f1a8bfcbc85304df454b65d378b299c7"
 DEPENDS = "babl librsvg glib-2.0 gtk+ pango cairo expat zlib libpng jpeg virtual/libsdl json-glib intltool-native"
 
 EXTRA_OECONF = "--disable-docs"
 
-inherit distro_features_check gnomebase vala gobject-introspection
+inherit distro_features_check gnomebase vala gobject-introspection gettext
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
@@ -16,16 +16,16 @@ PACKAGECONFIG[lcms] = "--with-lcms,--without-lcms,lcms"
 PACKAGECONFIG[tiff] = "--with-libtiff,--without-libtiff,tiff"
 PACKAGECONFIG[webp] = "--with-webp,--without-webp,webp"
 
-SRC_URI = "http://ftp.gimp.org/pub/${BPN}/0.3/${BP}.tar.bz2 \
+SRC_URI = "http://ftp.gimp.org/pub/${BPN}/0.4/${BP}.tar.bz2 \
            file://pkgconfig.patch "
-SRC_URI[md5sum] = "6e5c6f229261478dc436a38c84405b2a"
-SRC_URI[sha256sum] = "d7858ef26ede136d14e3de188a9e9c0de7707061a9fb96d7d615fab4958491fb"
+SRC_URI[md5sum] = "cb17ac529a882f25f54c0115c63d4027"
+SRC_URI[sha256sum] = "0112df690301d9eb993cc48965fc71b7751c9021a4f4ee08fcae366c326b5e5a"
 
 LDFLAGS += "-lm"
 
 # There are a couple of non-symlink .so files installed into libdir, which need to go into main package
-FILES_${PN}_append = " ${libdir}/gegl-0.3/*.so ${libdir}/gegl-0.3/*.json ${libdir}/libgegl-npd-0.3.so ${libdir}/libgegl-sc-0.3.so"
-FILES_${PN}-dev_append = " ${libdir}/gegl-0.3/*.la ${libdir}/libgegl-0.3.so"
+FILES_${PN}_append = " ${libdir}/gegl-0.4/*.so ${libdir}/gegl-0.4/*.json ${libdir}/libgegl-npd-0.4.so ${libdir}/libgegl-sc-0.4.so"
+FILES_${PN}-dev_append = " ${libdir}/gegl-0.4/*.la ${libdir}/libgegl-0.4.so"
 FILES_${PN}-dev_remove = "${libdir}/lib*.so"
 
 # Fails to build with thumb-1 (qemuarm)
-- 
2.17.1


