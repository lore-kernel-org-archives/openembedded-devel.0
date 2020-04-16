Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.7342.1587046624208483004
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2020 07:17:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tazlGrK+;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: gregory.vimont@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id z6so5082330wml.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2020 07:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=WdCybblsp93W7+sJnIgJ4+Jo4vYLxkv4AyStTnftVSQ=;
        b=tazlGrK+scX/omMfr9guH9NxG8NXD8P+w7mz4WB78/4PbUxqh2At9Dptn7T0BCMQ0x
         jX83gGzzTr4h+PFmQ3Zu4DnhFhcEftUbWccPbpSRqM3Sjstu8BgWi/OLG4K1FfW3gnP2
         i5Q47fGn1+0nZOtnsq56ILGybsZL9wq/BvZghCIRwqMH5XL3gXkDt98U/2gjLw9NG0oV
         WQWJqJR1j9PY5YF4VQVor5mDtm6FlO+4hx8yDJ8QPoVaykrsKuwWIrZ/od1KXOzJstNg
         cmV7YlRYytnnyz5x6q+RPfpghtK2i7XegyneuI5AowQ8PkbWsRTdMQgHUd9El2Yz1fox
         aLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=WdCybblsp93W7+sJnIgJ4+Jo4vYLxkv4AyStTnftVSQ=;
        b=UAWeOHD4Bii4DewwweP+aj17fvHoEPyo3f6V6B2YR9eOKnTVx5WDzkAy8IfBbSMeaF
         +9hnppbl96O3QkQbE35R/1QW8WI1LNl2riHyyQCZlF4bCjkL3KB9dpAcQXXsdkfjdt2W
         VqKSsTkUhKSkQEAKkp/leYUo/wyEgEme7WyM08PEDmXLGXknE2S8EwOlBCNeZ6HfX+DW
         yreganUEZ57nUqwl2wkZJ/utYMYD2pFVSeWQWgfw6QmNsLiKo1wp+X9BFW+Ip7X5EjW4
         OgLknpUIpS79M8Ix+hNQHSOk+NP9bJ1sAHRQG1LXwZKwNhTQ+obM1Kj61XpSE63iiRSV
         77pA==
X-Gm-Message-State: AGi0Pua2Tw6mFpLEe5M5R9588ivZI+mRz3bzXYc5syojYMDWc+12XFIk
	7HwpUG/+LKNKiEwuw6MXI/hI5qgWRS4=
X-Google-Smtp-Source: APiQypKpAYb6jLO9P01buXvInxOYRG0e1THLpeF+ylQFAAWZamD35djayFRsALlbxu4JwIT9zu4k+Q==
X-Received: by 2002:a1c:3281:: with SMTP id y123mr5100401wmy.30.1587046622555;
        Thu, 16 Apr 2020 07:17:02 -0700 (PDT)
Return-Path: <gregory.vimont@gmail.com>
Received: from ALD-1799-DE.aldebaran.lan (softbank-robotics-gw1.ter4.eqx2.par.cust.as8218.eu. [158.255.112.194])
        by smtp.gmail.com with ESMTPSA id r27sm8640992wra.83.2020.04.16.07.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 07:17:01 -0700 (PDT)
From: "Gregory Vimont" <gregory.vimont@gmail.com>
X-Google-Original-From: Gregory Vimont <gregory.vimont@softbankrobotics.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gregory Vimont <gregory.vimont@softbankrobotics.com>
Subject: [meta-oe][PATCH 1/3] opencv: 4.1.0 -> 4.1.1
Date: Thu, 16 Apr 2020 16:16:54 +0200
Message-Id: <20200416141656.7900-1-gregory.vimont@softbankrobotics.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Gregory Vimont <gregory.vimont@softbankrobotics.com>
---
 .../opencv/{opencv_4.1.0.bb => opencv_4.1.1.bb}             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/opencv/{opencv_4.1.0.bb => opencv_4.1.1.bb} (98%)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb b/meta-oe/recipes-support/opencv/opencv_4.1.1.bb
similarity index 98%
rename from meta-oe/recipes-support/opencv/opencv_4.1.0.bb
rename to meta-oe/recipes-support/opencv/opencv_4.1.1.bb
index d781da600..5074eb2fa 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.1.1.bb
@@ -10,8 +10,8 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 
 DEPENDS = "libtool swig-native bzip2 zlib glib-2.0 libwebp"
 
-SRCREV_opencv = "371bba8f54560b374fbcd47e7e02f015ac4969ad"
-SRCREV_contrib = "2c32791a9c500343568a21ea34bf2daeac2adae7"
+SRCREV_opencv = "ddbd10c0019f3ee5f43b7902d47e7fc4303a6574"
+SRCREV_contrib = "0915b7eaddba3c06d83e201c9a7595e73801f417"
 SRCREV_ipp = "32e315a5b106a7b89dbed51c28f8120a48b368b4"
 SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
 SRCREV_vgg = "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
@@ -51,7 +51,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
            file://0001-carotene-Replace-ipcp-unit-growth-with-ipa-cp-unit-g.patch \
            file://download.patch \
            "
-PV = "4.1.0"
+PV = "4.1.1"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

