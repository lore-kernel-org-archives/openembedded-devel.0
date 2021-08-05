Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web09.5299.1628143352678927359
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Aug 2021 23:02:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tZiIdHsG;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id cl16-20020a17090af690b02901782c35c4ccso3302272pjb.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Aug 2021 23:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KlEnoGM0ApiGCd8uhOZUFvGCRYwvfbWrqFzXp50skRM=;
        b=tZiIdHsGlV4xSkybha4NveERVvsgBBWX0mv0Kiu3ZFzoAMKtmxa5yrN/kXnEA8Ncbr
         D3W02guhSkzaNzwOfjiTmIPd10x27VpCH8xK9NAj0PvqlpS6jSuLgLHN9F7QjOXV7OM1
         ZRDRYCH4Ptz07KKNydR1jEVYYSPNe8Hsctp1RyX4pqF5GvuUFAb8XiiPjKgycpFTVwHo
         777KgVySiD/QkKJtLK2PNDII3DX+h1IP2tdgJep389dYLm98PIV/Pjb+f5C16aLk5jbf
         /V3dm1zSbA1d3V1YbZ1cIAdSTqcukf5sbSjEFd4cg1XhxT2teNLoJ7PZTigjYsYH9OZH
         PxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KlEnoGM0ApiGCd8uhOZUFvGCRYwvfbWrqFzXp50skRM=;
        b=N4cr219Fkz3iIbCebsI9/4pzEY3UcpOHQLXR67CCo8dvrXIjYKnLuKRMBdsHdDEyZR
         lQhApJaQiP7dbtd4JLw4gYYn/HKaPOsHYsQmmrkbtwFpr6zJgVE8WZ8u15f6FNvP6NNF
         NpZ2nwhLW9ht/ag1onYa5vdy8lCZX+A2VBlp2n86TnxqimgEqWf8twSs55sTFE3cv3xO
         BNRsAy4zOr7VwDVoxTCycvwg6y+NWcm/x2KlzjN261JsB06uHTyx3+tijKjUdx4131DI
         w+KJARjq4LRyC2Q9VqbnwAR63cuYyFgGAJL5zR238DNWDNkFV/CX7BFeDY/PbaJ+kfwL
         hI5w==
X-Gm-Message-State: AOAM530OAOOJaCBwfOYfeBRvogJqpS1H6nCVytdqOZfNfse9zUbgesKS
	xz5fSWfPhqvGPn70KWMGWFSWMXaLhlDzPg==
X-Google-Smtp-Source: ABdhPJx0nIqQPhBRJhfse0Yc8+jFrIIVeZBbpSzkAeKt7/qcx1PtAcfHALrKow5zxBAtSpfZ8cB7IQ==
X-Received: by 2002:a63:a902:: with SMTP id u2mr95792pge.123.1628143351762;
        Wed, 04 Aug 2021 23:02:31 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id f4sm6082046pgi.68.2021.08.04.23.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 23:02:31 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] nis: Drop uclibc check in anon python function
Date: Wed,  4 Aug 2021 23:02:29 -0700
Message-Id: <20210805060229.207260-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uclibc is no longer supported

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/nis/nis.inc | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta-networking/recipes-support/nis/nis.inc b/meta-networking/recipes-support/nis/nis.inc
index a968af174f..3ae0f7e95a 100644
--- a/meta-networking/recipes-support/nis/nis.inc
+++ b/meta-networking/recipes-support/nis/nis.inc
@@ -20,12 +20,3 @@ inherit autotools gettext pkgconfig
 do_install() {
     oe_runmake 'DESTDIR=${D}' install-strip
 }
-
-# An attempt to build on uclibc will fail, causing annoyance,
-# so force the package to be skipped here (this will cause a
-# 'nothing provides' error)
-python () {
-    os = d.getVar("TARGET_OS")
-    if os == "linux-uclibc":
-        raise bb.parse.SkipRecipe("NIS functionality requires rpcsvc/yp.h, uClibC does not provide this")
-}
--
2.32.0
