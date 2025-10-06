Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB76CAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 18:27:40 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.2975.1759775259446070344
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 11:27:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lfedx8be;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b3d80891c6cso984712266b.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 11:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759775258; x=1760380058; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3chSw1LZDQzWzWNFZAzz48zVpgt63wmsqfw0rQ99eSk=;
        b=lfedx8beN9gpiWxu4wei8PUHVr0T2akuL2mA6e1AG74JuBivdXqVbI2QRbXf3c2l63
         VyboHzthE23T3qs9J9S5T07KIVodxZPiQkCQw+nirk6XLgVMkml6oP/h3u0Y6wSF4Kp4
         5ZzfmVdAjYMZhKjrQWx0qPrk0FnRFWpIsIhaUmOntuDIGLCG33x49Yj9sg3+13Nn35Z/
         oBDZJ8ivGArllY6+Ft3a848ZTtiKlKuLO0LfCMaglvSCsyVNK6k+rMo2dfuM8JLsmE3U
         Yv3n+szq2h9FK/lvp4ABkgBrQRa3G65vah5YtmiH/VF3yJiEpdyYgRoBGcYe7qsinL/j
         ruDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759775258; x=1760380058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3chSw1LZDQzWzWNFZAzz48zVpgt63wmsqfw0rQ99eSk=;
        b=s57IqYpYRIcINFVzUDKWnzmvXm+anrrQLbJitbHaSAsdogBgAyBPokI4KAYuSFuXvj
         fnkqXtktEkmNH/pwhRnrVe4CTksE5cyNutRbSzIVgcFmF2kpO4qB2ssc5+K8H9BorkCp
         nCu5gll0LyRgAQyydSvPjAOhEFprq4BDmnyTIZntGTsZ7c3agiysbpT3X1DZngGHKOsq
         hW3H9/CMoxWErJ0i4iImV85cE/5cheOR5YkaU1uetQ0I2ZKZentw0TQ/nMFG2wxd/akq
         JpNWex4ZYxOaU//T3I6t+eyu+9AYWnjheuNVeXPFVwfEelbXhNVBo/2JyOuvqPmEMCWC
         97+w==
X-Gm-Message-State: AOJu0Ywgds2BDsQPJcSHDE9XG9EvsReda3RYRaLquorsJLYfvoDFaxkL
	uhbR6YRYrUNWuXbSY6oTcK+66o2BVsMm9zqrJFT2hca4/PapIjCF12WCAANkbA==
X-Gm-Gg: ASbGncvQW6VJJ5a8t3Vh6sAwxhifPu8NQDxIJWUYe77NRCXltVIWG5bNoIMCYwK+qpB
	igLFs2exzfUzCH0Ve/cdv6rjWxL1WrkFiXJFUDo+eOrDnxekH0z7SR9DZu3ycQWZEUhy8fI8zvm
	UVWL4DpgVNNNweJ0Colf4CdydHZx4tK9PsOWj5ThioevhtsIx4TFEmfE/7iibujjzCHKwCTxpHz
	O43xC833v1GrAYxCWKiT8VrckF4nDCJuuXC1pWp6kCRmPbtw0Xz5LP7FlWevzwkAH54OJw9q2sZ
	Q9ubjyi93bXR1362BNE4bVAe1o7Dwx6DSHRmhETSeW5VTtmSBzfwPfBG6TbtjRg0WWiYzm/wrlv
	E2mV9WI/pL7dn4NrJqdTj6yvwnx+B9V2YHLjQZFyMmP1N8ItOnPXFBuA=
X-Google-Smtp-Source: AGHT+IHCgh+EQ85LKQrUm+Su/QG1t+aYkEceCHeJROT7W7ZyfJ9o8L1nKmbm9o0sZ7b3IZEZqPmabA==
X-Received: by 2002:a17:907:d7ca:b0:b3d:a295:5445 with SMTP id a640c23a62f3a-b4f4116a343mr85299766b.13.1759775257489;
        Mon, 06 Oct 2025 11:27:37 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865e7e8d8sm1208171766b.41.2025.10.06.11.27.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 11:27:36 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] libavif: upgrade 1.0.1 -> 1.3.0
Date: Mon,  6 Oct 2025 20:27:36 +0200
Message-ID: <20251006182736.691429-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 18:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120308

This upgrade contains fixes for CVE-2025-48174 and CVE-2025-48175.

Changelog: https://github.com/AOMediaCodec/libavif/blob/v1.3.0/CHANGELOG.md

Libyuv support is currently disabled, because its dependency (libyuv) is not provided
by neither oe-core nor meta-oe.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-multimedia/libavif/libavif_1.0.1.bb  | 15 ---------------
 .../recipes-multimedia/libavif/libavif_1.3.0.bb  | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 15 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb
 create mode 100644 meta-multimedia/recipes-multimedia/libavif/libavif_1.3.0.bb

diff --git a/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb b/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb
deleted file mode 100644
index 9a82cd86bb..0000000000
--- a/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "This library aims to be a friendly, portable C implementation of the AV1 Image File Format"
-HOMEPAGE = "https://github.com/AOMediaCodec/libavif"
-SECTION = "libs"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c528b75b07425b5c1d2e34de98c397b5"
-
-SRC_URI = "git://github.com/AOMediaCodec/libavif.git;protocol=https;branch=v1.0.x"
-
-SRCREV = "d1c26facaf5a8a97919ceee06814d05d10e25622"
-
-DEPENDS = "dav1d"
-
-inherit cmake
-
-EXTRA_OECMAKE += "-DAVIF_CODEC_DAV1D=ON"
diff --git a/meta-multimedia/recipes-multimedia/libavif/libavif_1.3.0.bb b/meta-multimedia/recipes-multimedia/libavif/libavif_1.3.0.bb
new file mode 100644
index 0000000000..44f5c1819a
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libavif/libavif_1.3.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "This library aims to be a friendly, portable C implementation of the AV1 Image File Format"
+HOMEPAGE = "https://github.com/AOMediaCodec/libavif"
+SECTION = "libs"
+# Most is the code is under BSD-2, but libyuv is under BSD-3, and iccjpeg is under IJG
+LICENSE = "BSD-2-Clause & BSD-3-Clause & IJG"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=51549db0941829faeedcc86efec2f4c0"
+
+SRC_URI = "git://github.com/AOMediaCodec/libavif.git;protocol=https;branch=main;tag=v${PV}"
+
+SRCREV = "1aadfad932c98c069a1204261b1856f81f3bc199"
+
+DEPENDS = "dav1d"
+
+inherit cmake
+
+EXTRA_OECMAKE += "-DAVIF_CODEC_DAV1D=ON -DAVIF_LIBYUV=OFF"

