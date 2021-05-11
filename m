Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.7022.1620698862577614072
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 May 2021 19:07:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mZYoU52t;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id n205so10215849wmf.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 May 2021 19:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TJsZbhOpJyDzRdBBsYREvh+NoscM1T28021cjoEY9v8=;
        b=mZYoU52tOUShkUHSHA++6wEaVtfY4LIMAtHNzeG2KfZQO7z0HkyLYaRLAkdRXfr296
         Ivz/KNzzYjntrYJWVUYxWyTx5xvPpvZa2nXlt4I9r9Q8EI0cgejJFAGa5s6Ik7OekHki
         h+aj7+AgGkuBPB2zksP1gVmEHDGSuiUzgIhOCfhV6S4M1ln6xkGFtxcnVu+tMSDNztVl
         GBJKesLygAVh685/p+l2iqO7AQ6WBrhqNuefcOD3P/N6G0vS7FV6sKOsCwsqFj1foIZK
         +iqJ5p2eqQC+oIGZVbU3t+8G7oHdS+3UhqrufJiqs1L5rUPD1/qIMG62qasA5zPGdcNE
         eOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TJsZbhOpJyDzRdBBsYREvh+NoscM1T28021cjoEY9v8=;
        b=G7JmwDrUoumRSULEUb1e+CL7pntdsmii2ZwBS9F6WoHtRgssn12LESdQ5ZEjLdOtAn
         HU59h8bs57l+y3AixOFoMDF/8JOIh3OAaGiPUVWaDKZsx/1HXI3L+orFcf3ThhdPC1EB
         2ZEFTBvRbveBR9dyNpEu3Ah/6MRpSa/zjnylOtz87wGLyeIeB90DARvjBejBtQo6symV
         rJD87XhWMDWlNMF/Pz9el1l1kBh3JYpnF5BzivTMUPncF8O6JaB1kKkvIdJHAVtqO8yJ
         BA2XaGtw2zQ2c9Xs77IKlzcHYPfEwDWXJHo5aFKpyyf+PMFumHsSo98uTe6MoRkd2m1e
         QBRw==
X-Gm-Message-State: AOAM532IU1GJyiIDd+fe/ATKSafVEKQbrt8VkuR3PrqILc7Yw2utf3hZ
	hnOxBmk2umYaEgj/Hz67xZeNQE/sOcY=
X-Google-Smtp-Source: ABdhPJxxXqxj2tZ9brS9htsGX0KS8Nxpd2iOEPms5rvXWzkm0M4Pe7+K3CTiFYfjE/20dBs1YTRCqA==
X-Received: by 2002:a05:600c:4ecd:: with SMTP id g13mr29040391wmq.173.1620698861249;
        Mon, 10 May 2021 19:07:41 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f4fac346ac282ef7d435921.dip0.t-ipconnect.de. [2003:f0:7f4f:ac34:6ac2:82ef:7d43:5921])
        by smtp.gmail.com with ESMTPSA id n12sm20145075wmq.29.2021.05.10.19.07.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 19:07:40 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 7/7] poppler: upgrade 21.04.0 -> 21.05.0
Date: Tue, 11 May 2021 04:07:25 +0200
Message-Id: <20210511020725.346160-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511020725.346160-1-schnitzeltony@gmail.com>
References: <20210511020725.346160-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release 21.05.0

core:
 * Fix crashes in malformed files
 * Export SplashFont* symbols used by Scribus
 * Minor code improvements

qt5/qt6:
 * Make sure new signatures are always properly oriented
 * Allow to pass the border width when signing

glib:
 * Enhance find to support multi-line matching

utils:
 * pdftoppm: Fix regression when using single scaleTo. Issue #1062

build system:
 * Allow to disable building manual tests

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../poppler/{poppler_21.04.0.bb => poppler_21.05.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_21.04.0.bb => poppler_21.05.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler_21.04.0.bb b/meta-oe/recipes-support/poppler/poppler_21.05.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_21.04.0.bb
rename to meta-oe/recipes-support/poppler/poppler_21.05.0.bb
index de5f38036..4cfc5bd86 100644
--- a/meta-oe/recipes-support/poppler/poppler_21.04.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_21.05.0.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            "
-SRC_URI[sha256sum] = "5e2219656c6bbd36154133fef2e12b7d0938464518827098b29a10b1697ea79c"
+SRC_URI[sha256sum] = "dafd537b680fad1215bc40fc53d1f38e8449d7c185bc60d5a89e1d26c90dbd8c"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.30.2

