Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35DA7CCA470
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 17:24:50 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.1528.1759771488627612956
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 10:24:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TcDRG/i+;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b4539dddd99so717020266b.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 10:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759771487; x=1760376287; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Tmh14aI4FzDux5aV4P4SdkoSoXPLuvVRNOo1NSEZAc=;
        b=TcDRG/i+d9EEy8eafs4J2Uc1MKsUlvF2PXXLu4mEYQGU9xNIAGZyAmaql5ihcCIFe3
         zkx1c22m3eLEyctdhg5v0781ikYoTlhmkvDBIm3LuRIuNDqzo3iJYbe6AM2eLDicpRHN
         obaarUoSFgutmK9eWFOetKL3slkqE/oBk8BYDvnxmbP+i8FzGng7SS7C2dNdq0LyFY7G
         H42GmmlOmLXNc1aYKJcFex2Zbr8vxGf9TtzRNCpvVImDRkROwPFm1KCiy1WlMR4HhA/b
         tBk/vhozWI15jHFh75TGDt0zFB7z+bVm90RT2ICw0Ji9agsm77UgpM1PgSeG4dUC6jj5
         Y8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759771487; x=1760376287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Tmh14aI4FzDux5aV4P4SdkoSoXPLuvVRNOo1NSEZAc=;
        b=h9AkJlhTX0Uv1IM8WEyy9eB6JYJk5Gp98xwslSi15MNtqkEVhhD4QH4agIOc7gJjNK
         tp3Et0eEdcLfT0isuICBNL8FNCHETsSh/6+U2pRgQHt3fD3VQO0zbW96LNI/bZVzB1SR
         hIel9ssHEPflXvyBCwv+gXOwYyqL7jSk72gjyDVAwMeUwyUgxENg7GxebwJ8sh9j/T6l
         LW1Ys8Eh1KEs4pw6zAZ5LGEfr5BVYJRjkbiqX87Ru/9uY4vPJbSkhddu3wciC8Eplojp
         bN11EU3cTnubyoEX9pD/1MQNnYBfnclqSd7MrOvCuszsaOjGtIKJmdnhtdmwAcwJKsKj
         r2ZA==
X-Gm-Message-State: AOJu0YxNQ6Pc29R6tmZMF1HS18sL3vDEvZzuoY5ItC+/1KozA1aYhLmU
	oBch2dvB6MUlxr4dp9Fk1jhg2blLm2vtoHVaLbyZ5MemB3mKWt//UR3Pf9lDZA==
X-Gm-Gg: ASbGncu+tPzNFEUh1srhHRR9oahq5UWa6inLtlmlMHvhTo/cfHNGGS/Nx2kWI/Jbo3q
	NLS7BavfrotrJL1V4WbIHyoDKHsOJrC5jqYJKlZPi0n4lt95TBiE+zMejaZUn9Q1QUWC+rnG2PX
	hrXTviAxNXsLL94YTrP8IaobBRANOzqx+vm4R60tN1EKXwvPkIokTSMJMza6anmqGn+COJsHo+Z
	20qJUHPr/Qz2XbMqDM0WX6WoobpU8/tc1zT/dkUnq7Nyryq6kzU2ljTPUTuHgaqWNBdjUbHzd2J
	9sb3y+Jj2iFMUKZGfwpxFZIltBoN5biu++Nm0HIkdTVmtNhafZCPfWuh+RCqzZgcB+NIcIUPU5I
	KOil3rOajhzX/GdARQ8gi8SLgV+KbuyyrCFWfNbfie9pe
X-Google-Smtp-Source: AGHT+IETk5txbS1i2s7YQNawpiYnuIZ8jUQdJ12j9olHpGN4k3O1U+0lCgAGDGd2SkGkLmHp14Zlzw==
X-Received: by 2002:a17:907:9449:b0:b48:44bc:44e7 with SMTP id a640c23a62f3a-b49c2d56beamr1779750766b.48.1759771486623;
        Mon, 06 Oct 2025 10:24:46 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652a9ffbsm1183934966b.10.2025.10.06.10.24.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 10:24:46 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] imagemagick: upgrade 7.1.1-43 -> 7.1.2-5
Date: Mon,  6 Oct 2025 19:24:45 +0200
Message-ID: <20251006172445.2573936-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 17:24:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120305

This release contains fixes for the following vulnerabilities:
CVE-2025-53014, CVE-2025-53015, CVE-2025-53019, CVE-2025-53101,
CVE-2025-55004, CVE-2025-55005, CVE-2025-55154, CVE-2025-55160,
CVE-2025-55212, CVE-2025-55298, CVE-2025-57803, CVE-2025-57807

Also remove jp2 PACKAGECONFIG: it was superseded by openjpeg
PACKAGECONFIG, which also provides jpeg 2000 support.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{imagemagick_7.1.1-43.bb => imagemagick_7.1.2-5.bb}      | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.1-43.bb => imagemagick_7.1.2-5.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-5.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-5.bb
index 10d2150998..588aeea3a6 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-5.bb
@@ -12,8 +12,8 @@ DEPENDS = "lcms bzip2 jpeg libpng tiff zlib fftw freetype libtool"
 BASE_PV = "${@d.getVar('PV').split('-')[0]}"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>([0-9][\.|_|-]?)+)"
 
-SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https"
-SRCREV = "a2d96f40e707ba54b57e7d98c3277d3ea6611ace"
+SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https;tag=${PV}"
+SRCREV = "4a620c2a89a7481e83cb4a0ff32db0ccbb3afcd2"
 
 
 inherit autotools pkgconfig update-alternatives
@@ -24,7 +24,6 @@ EXTRA_OECONF = "--program-prefix= --program-suffix=.im7 --without-perl --enable-
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} cxx webp xml"
 PACKAGECONFIG[cxx] = "--with-magick-plus-plus,--without-magick-plus-plus"
 PACKAGECONFIG[graphviz] = "--with-gvc,--without-gvc,graphviz"
-PACKAGECONFIG[jp2] = "--with-jp2,,jasper"
 PACKAGECONFIG[lzma] = "--with-lzma,--without-lzma,xz"
 PACKAGECONFIG[openjpeg] = "--with-openjp2,--without-openjp2,openjpeg"
 PACKAGECONFIG[pango] = "--with-pango,--without-pango,pango cairo"

