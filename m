Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.11038.1625599092675215209
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jul 2021 12:18:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pCvj9cr1;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: philip.balister@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id j14so10298870qvu.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jul 2021 12:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hyfG2Ns0DFAltJ8wQGu534h+zZ2FZhZb3m5kmd8uN2o=;
        b=pCvj9cr1Ck5c95r49x3/N0yW1a/72pCUl+S+gLwnYNzTGEMOj3DZSd1/YUUAfu/5qk
         b4MAOT5LPGOe8qX6n7LHZxA6yIrOGTS2KC6tI91cV7ugXICgtYafgSR9t5varnbGlh2G
         3vYLXWEsxlVH3IgTujUiSL3915lJX1hu6SWBeddfHXhYVX25GYSatjSGriuzcJe6S54B
         ijYaGDuiGynprSpdgiWZkvQhbBwyIT2eVHoEEbtYgzm2xLeiwMlpSvomJ2l30nzoaWRj
         NXRTK8amfN0ecKdoExTDMV9u3USzQ+f9xgB+jC0a/ToRYCstTWq0XJAGBlUQCHMNlMTm
         8nqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=hyfG2Ns0DFAltJ8wQGu534h+zZ2FZhZb3m5kmd8uN2o=;
        b=kF4a75Sdcu775EQHlWYs9XndagcSiUyIhIS8r7XEg28towJpzjkN5gZa8iTmGZcLuk
         GfqMiIS937EiZ3mGiyOT4Zyt/Ssqg2OCmRu9/EYgyeEaSLAjsBPk4UHCr2fqoVBhMOT6
         /T026aGLUkp89PYxGQZCbUu1cxsSdanaUhgHUdjXmaWSbsXQE5G6d/6cjTuEVhqWJJe1
         X2dMNm+WvzrowxTLxzZryVSFSvIVFaANqhIwJC/lNkH024OkBpuosbinCHunSDTgJmsx
         29ntK410yEbWdGAc/QwDoMpnDWn/OlABCdFPLz3rvPAZXXm+9v+HbHwemaRp1ISUIYvv
         EfVw==
X-Gm-Message-State: AOAM532nCxH6229mWkVx6u8wAw657jWgU0O1WWDAwnCDkYABBIMf9WrR
	j6jL1nTXzfIzs+wlXzCybcds44CnnAU=
X-Google-Smtp-Source: ABdhPJyX5WWnH+xKF1TZBfvxZGezIBsPT0TZt2keos7sflKcRnDwDZRu9WiFV5b8ZFlslIPmYnYHlg==
X-Received: by 2002:a0c:e98b:: with SMTP id z11mr2062999qvn.27.1625599091416;
        Tue, 06 Jul 2021 12:18:11 -0700 (PDT)
Return-Path: <philip.balister@gmail.com>
Received: from lyon.hsd1.va.comcast.net ([2601:5c0:c200:1421:c468:1be0:eb10:978b])
        by smtp.gmail.com with ESMTPSA id w18sm18514qta.10.2021.07.06.12.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 12:18:10 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: "Philip Balister" <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Cc: Philip Balister <philip@balister.org>
Subject: [meta-oe][PATCH] fftw: Update recipe to 3.3.9.
Date: Tue,  6 Jul 2021 15:18:07 -0400
Message-Id: <20210706191807.1619978-1-philip@balister.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

 * Ptests passed for qemux86-64

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-support/fftw/{fftw_3.3.8.bb => fftw_3.3.9.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/fftw/{fftw_3.3.8.bb => fftw_3.3.9.bb} (95%)

diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.8.bb b/meta-oe/recipes-support/fftw/fftw_3.3.9.bb
similarity index 95%
rename from meta-oe/recipes-support/fftw/fftw_3.3.8.bb
rename to meta-oe/recipes-support/fftw/fftw_3.3.9.bb
index de175d629..9979c21b8 100644
--- a/meta-oe/recipes-support/fftw/fftw_3.3.8.bb
+++ b/meta-oe/recipes-support/fftw/fftw_3.3.9.bb
@@ -9,8 +9,7 @@ SRC_URI = " \
     file://install-bench.patch \
     file://run-ptest \
 "
-SRC_URI[md5sum] = "8aac833c943d8e90d51b697b27d4384d"
-SRC_URI[sha256sum] = "6113262f6e92c5bd474f2875fa1b01054c4ad5040f6b0da7c03c98821d9ae303"
+SRC_URI[sha256sum] = "bf2c7ce40b04ae811af714deb512510cc2c17b9ab9d6ddcf49fe4487eea7af3d"
 
 inherit autotools pkgconfig ptest
 
-- 
2.31.1

