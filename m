Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.5041.1614439376683323655
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Feb 2021 07:22:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HaiDwZoK;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id s23so7940196pji.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 Feb 2021 07:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KzI8xsDcCyN5tIRCO73QluWNE7ruMwIJKqCCWL4uI88=;
        b=HaiDwZoKVfQw6I6PLTRDMoflDPJn2p1/H8wn12OEYmGBO/NHZlgxqDa3OKX+baxVIq
         7Oihblg3NH66Z0CBa3c0+/gTct5bDti+Yl5zOVHuwpvTV40xQHPIjRpL4OGKHvGsJxvd
         D1YyHuKpYXGoZedP7GM2ayDMZHHNzOzjCqkofuapc53YO1daqDeYrvwpxUMt2DeLOolY
         E8Ka+STEHvHhGRCVWOgJLC6gyl/PqbkBO9sXC805WhTG04Nw4Ys/jGngCg4kv2586i6r
         AW5AZ+5QPMl6wprruxrveW7gAerC9OMabfav9iQ8DH0Oh72E10g0ymtHnLZYtzidKcyB
         SDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KzI8xsDcCyN5tIRCO73QluWNE7ruMwIJKqCCWL4uI88=;
        b=my1nA4BH52xMC37rBYTbY2j5m99IehYGjJW5XIxzrNuo3jcT4jGO5iISozz5+s/m2Z
         2rL6WcMKL8pTae8ZtGhljxS0NIZ0ctlW0z4rpWeze+4k2Dk19cYD69ojHdONzJ6NY5m1
         vLBZoczMTczOHCmyaWiEw8KHeczPi8G9KLVC1dMoPs241rsUlUJ70MN5obiim10akmqJ
         ovTuql9Gx2ZsE4Xu+MZKbwo7vmNZigytAEqyPZoEbzsdcQNLoK5YghQXPybHBIsXVbII
         3GRxMitVVkirxOeBglenjuiuDm8ncTjjlkoNId97wKlbsiMNDPJ2ecluDqphcSynDdDH
         p0QQ==
X-Gm-Message-State: AOAM530rEA0P62gCnCVL/fpSFVq5rI3/7EU3mTTcCuFURM/dexyQYWph
	EdbkUneIcjG7SuKwhZpCd+ZVuyr2oOs1mg==
X-Google-Smtp-Source: ABdhPJzQ6A8Uoa3/tWpYTxEk6BvRSYKpM03jq8Nemje5eDaJnbSf9HsnJmnEbfHuK4o47PSsMSaoKg==
X-Received: by 2002:a17:90a:d516:: with SMTP id t22mr8802282pju.51.1614439375940;
        Sat, 27 Feb 2021 07:22:55 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id u15sm12645393pfm.130.2021.02.27.07.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Feb 2021 07:22:55 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Miartus <adam.miartus@softhows.eu>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/4] libcereal: add dev package that can be included into toolchain sdk
Date: Sat, 27 Feb 2021 07:22:49 -0800
Message-Id: <20210227152250.157722-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210227152250.157722-1-raj.khem@gmail.com>
References: <20210227152250.157722-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Adam Miartus <adam.miartus@softhows.eu>

Signed-off-by: Adam Miartus <adam.miartus@softhows.eu>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libcereal/libcereal_1.3.0.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.3.0.bb b/meta-oe/recipes-support/libcereal/libcereal_1.3.0.bb
index 2f8978c9d0..55fb3ebcfc 100644
--- a/meta-oe/recipes-support/libcereal/libcereal_1.3.0.bb
+++ b/meta-oe/recipes-support/libcereal/libcereal_1.3.0.bb
@@ -17,10 +17,19 @@ SRC_URI = "git://github.com/USCiLab/cereal.git"
 
 S = "${WORKDIR}/git"
 
-inherit cmake
+inherit cmake pkgconfig
 
 EXTRA_OECMAKE = "-DJUST_INSTALL_CEREAL=ON"
 
 ALLOW_EMPTY_${PN} = "1"
 
+RDEPENDS_${PN}-dev = ""
+
+PROVIDES += "${PN}-dev"
+
+FILES_${PN}-dev = " \
+    ${includedir} \
+    ${libdir} \
+"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.1

