Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web11.27897.1599591392820170354
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Sep 2020 11:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TqZTSxRa;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id v196so58269pfc.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Sep 2020 11:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vdZrHqElzNzVupURm1Jc7PlDq1z6PYujCA7S+wdrkdU=;
        b=TqZTSxRaSmAgeD6AKLzPOMFXReyyscvzRV6F5sBFvLODzZGlRyboe72HNpnZYeGtxl
         Cu4yKPCwMsXWJoqHh9r2IEjbwZjOV9UXcB9ot9xd4b2qJRli2NC34E0RTi86TinaLdlz
         rizLL3YBEYcykf93yxuNS8N1ti8F7gGBzQCALvgt36N+UqfiTIUiH7fCKcv/4R9bUm1q
         PzeN4wmQww2zCDT697gME2zvo8vUfru/d86tLrjPewyaXK6dCpkWZfU7YrF9svMJTWth
         nFRnsld9Ly2hjeCqI3GOQq1U8rnMN7HsVPLDQ5+wEzCnbzGxB++N4cn35CpG0jlGu3+F
         ZV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vdZrHqElzNzVupURm1Jc7PlDq1z6PYujCA7S+wdrkdU=;
        b=khMWXkOq0ufiVXBdU0mf6WfE/WlstswCKFvlODWaVCj+qrfUnzGdg76a7Rb7qHrIHO
         2doanviHCc8NnsRBjflLyeZLsETPsylgKrkK4DjkdLdb81ckzODvWtyF1l8iACPA3nCo
         6VUro4n4BIWhqRY1qcRUCu5zPNju8TS+O3d97FCkORNu/fhqt5mTfFX5L4mjeACR+5Lp
         DSOsKiAJeF4w7MPwFO138olm+b//r6vsoL8/ZE3TF7iDXC/3PcrFrM3j1OkVLmrxHfHu
         LBfCVO7W48gIYypnE4RNWlGlnWZ8Al2OQ8ugLMo3VznwZs3G9F6LkeQ4THsoXpUiNKmI
         D1eg==
X-Gm-Message-State: AOAM531EpR7zCP0vShT1Vlb+3bYiLKbMyEDepl5WkzqNJjm3c4YW8iId
	F5jPCHPf+h0S2cbygT3UKFtKdzPlGeEaig==
X-Google-Smtp-Source: ABdhPJzjPQPP5elb2tlmNaeZYVcCA5mFCSiq+uOBW0LcF+3R5aLenV+80LjFw4fZNkdMmAKlsgR58g==
X-Received: by 2002:a17:902:850c:b029:d0:cbe1:e747 with SMTP id bj12-20020a170902850cb02900d0cbe1e747mr414915plb.34.1599591391928;
        Tue, 08 Sep 2020 11:56:31 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::d92c])
        by smtp.gmail.com with ESMTPSA id a10sm145881pfn.219.2020.09.08.11.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 11:56:31 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Madhavan Krishnan <madhavan.krishnan@linaro.org>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] libcamera: Bumped to latest revision and added pkgconfig to enable gstreamer
Date: Tue,  8 Sep 2020 11:56:28 -0700
Message-Id: <20200908185628.1061981-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Madhavan Krishnan <madhavan.krishnan@linaro.org>

Bumped to latest source revision of libcamera, and added packageconfig
to enable the gstreamer during build, and to generate and install the
gstreamer library.

Signed-off-by: Madhavan Krishnan <madhavan.krishnan@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/libcamera/libcamera.bb         | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
index c66c93ec5a..5505626d3e 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
@@ -12,15 +12,20 @@ SRC_URI = " \
         git://linuxtv.org/libcamera.git;protocol=git \
 "
 
-SRCREV = "5f2f9406cebc668f0d69007d1ea59ef3c56ef28c"
+SRCREV = "1e8c91b65695449c5246d17ba7dc439c8058b781"
 
-PV = "202006+git${SRCPV}"
+PV = "202008+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
 DEPENDS = "python3-pyyaml-native udev gnutls boost chrpath-native"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtbase-native', '', d)}"
 
+PACKAGES =+ "${PN}-gst"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[gst] = "-Dgstreamer=enabled,-Dgstreamer=disabled,gstreamer1.0 gstreamer1.0-plugins-base"
+
 RDEPENDS_${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland qt', 'qtwayland', '', d)}"
 
 inherit meson pkgconfig python3native
@@ -44,4 +49,4 @@ do_recalculate_ipa_signatures_package() {
 
 FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
 FILES_${PN} += " ${libdir}/libcamera.so"
-
+FILES_${PN}-gst = "${libdir}/gstreamer-1.0/libgstlibcamera.so"
-- 
2.28.0

