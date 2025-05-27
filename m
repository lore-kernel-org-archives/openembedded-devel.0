Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 955F3C5AD49
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 15:14:03 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.54474.1748358836496490935
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 May 2025 08:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=aJBelMgq;
 spf=pass (domain: konsulko.com, ip: 209.85.128.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-442eb5d143eso38137395e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 May 2025 08:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1748358835; x=1748963635; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XmCC9fXeYe5Q7frgsNYwCkUsZT6jifYXIoyTj47IAio=;
        b=aJBelMgqC8gRsh3ykYTAjkojFU02d5ijkHGfIrVxhavagaMtvojAcbVzZdGUy0APc5
         cby7XrxuCcIQDcqwLFHVk7LPzG8M5lXnHvApxRq/jnTGifMAfFf/WwX/TEJr5poCgTKt
         Nh6agfJPuUnlGhd1OQ3KOhGl4+JCkZX+WCsaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748358835; x=1748963635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XmCC9fXeYe5Q7frgsNYwCkUsZT6jifYXIoyTj47IAio=;
        b=O8btszrfIoToF19PU23sbxgyUR/JOSO08J6c9DtGqXtYcI9iT6qYJhluKal8tnr+s1
         rVdwwF/KpiXPTW7elC1uOC4Ho/FW/rift4ef6esy8ZnxSeSxiaWzntEqVG7kkg22Rgim
         bXRWt3++CmMph40YSCGRYRVZ8S+uv6A8hirAdelfoPPx3VjErU7pOJUOVNZ4ZG3pZWct
         6onFqgiJGAtrEby9AGkOPsJQgtJH9Phf1gDfAJySyiervPQGrfkO8aO6sULppBiWwAjE
         ebIszobqKft3Vn+Cl7NIV+Z1W88PI7FtwL/fwmp7l97gGbdSvi82SNbaDDI40fs0xbOK
         iWWw==
X-Gm-Message-State: AOJu0YzIJw4R6t2EEEF81CkGR1Rw6mJRIiVg1B9gNolitXr6W0IT7DAn
	XmUdHxmgs6VI8qzBUKy8sX6+SyUF6QaJy/vOpAAGngRgHvm+8exz83OE/B9RZhTJO4gDHRCUD2r
	3EVrl
X-Gm-Gg: ASbGnctbIGVoh+XBFqejBeDzUCl4H7ojiu1GaUdq8/SdW8+SlejgL/d3Kua5W8drTQQ
	dfuhhVq6zXUyv1p/OzqsnxmipfjnvaKN6tFxCRkuILnJhvJyI0sjgWSDbOeDFKIgQFB0NJOQT5J
	WU18ATymb8ibqy930gGiNSCqDIGwBvckIHxs5/lhIx8/qYBlxOCn4The6E/e969TnI9kRQ6h3Yu
	qx3AnuP5+89DPxYJ4QwmIF8odZ5jqq1d0LPON1ewYvkZ6PSoel6uoO/H3rbRvsYiYXpJOEK+t8f
	yZPmJUNj5Z9Y+SiN/LGq7wx1WOpNyOEVh5XxX3O3jXAk8Diz9zJDkPNNyTHF9s93sg==
X-Google-Smtp-Source: AGHT+IGUfG7y/AWF7/+xPZSE3Qhglc1MQxAgRiMBuuBhK3wsOSXj9d81+SYEuFFVsA3XVoA34IIBDg==
X-Received: by 2002:a05:600c:a07:b0:43c:fdbe:4398 with SMTP id 5b1f17b1804b1-44c916071admr119297445e9.6.1748358834637;
        Tue, 27 May 2025 08:13:54 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f18251c7sm272493175e9.3.2025.05.27.08.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 08:13:54 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-multimedia][scarthgap][PATCH 1/2] libheif: Add recipe
Date: Tue, 27 May 2025 18:13:50 +0300
Message-Id: <20250527151351.564987-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 May 2025 15:14:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117637

Backport libheif version 1.19.5 from master to Scarthgap.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../libheif/libheif_1.19.5.bb                 | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb

diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb b/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb
new file mode 100644
index 0000000000..e024ff0f60
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb
@@ -0,0 +1,27 @@
+SUMMARY = "libheif is an ISO/IEC 23008-12:2017 HEIF and AVIF (AV1 Image File Format) file format decoder and encoder"
+HOMEPAGE = "https://github.com/strukturag/libheif"
+LICENSE = "LGPL-3.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f07b2bc152eaee52edbd338825f474d4"
+LICENSE_FLAGS = "commercial"
+
+COMPATIBLE_MACHINE:powerpc64le = "null"
+
+SRC_URI = "git://github.com/strukturag/libheif.git;protocol=https;branch=master"
+
+S = "${WORKDIR}/git"
+SRCREV = "cd95b113d78d0696105a9e678cbd19487ee13d6c"
+
+inherit cmake pkgconfig
+
+DEPENDS += "gdk-pixbuf x265 libde265 tiff zlib libpng libwebp"
+PACKAGECONFIG += "dav1d jpeg jpeg2000 ffmpeg aom openh264"
+PACKAGECONFIG:remove:riscv32 = "openh264"
+PACKAGECONFIG[aom] = "-DWITH_AOM_ENCODER=ON -DWITH_AOM_DECODER=ON,-DWITH_AOM_ENCODER=OFF -DWITH_AOM_DECODER=OFF,aom"
+PACKAGECONFIG[dav1d] = "-DWITH_DAV1D=ON, -DWITH_DAV1D=OFF,dav1d"
+PACKAGECONFIG[svt-av1] = "-DWITH_SvtEnc=ON,-DWITH_SvtEnc=OFF,svt-av1"
+PACKAGECONFIG[jpeg] = "-DWITH_JPEG_DECODER=ON -DWITH_JPEG_ENCODER=ON,-DWITH_JPEG_ENCODER=OFF -DWITH_JPEG_DECODER=OFF,jpeg"
+PACKAGECONFIG[ffmpeg] = "-DWITH_FFMPEG_DECODER=ON,-DWITH_FFMPEG_DECODER=OFF,ffmpeg"
+PACKAGECONFIG[jpeg2000] = "-DWITH_OpenJPEG_ENCODER=ON -DWITH_OpenJPEG_DECODER=ON,-DWITH_OpenJPEG_ENCODER=OFF -DWITH_OpenJPEG_DECODER=OFF,openjpeg"
+PACKAGECONFIG[openh264] = ",,openh264"
+
+FILES:${PN} += "${libdir}/libheif ${datadir}/thumbnailers ${libdir}/gdk-pixbuf*"
-- 
2.39.5


