Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web09.311.1622756354319641192
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jun 2021 14:39:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RLS6HkBK;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id u24so8742767edy.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Jun 2021 14:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0DoTFLuPBX53nv/HEGmzwjc1YbD48/c6/4hSBexkMSA=;
        b=RLS6HkBKRZcl8uYg5+HCgPNW09KclpC2pFoZ7j2Gy5oahh0IbpdMDo5eyoM1p/IJK9
         Aa6i6vdU1kAXpmls617raxRu7nJeFP8g5j0xk4PFmSGfUfe1dVSkArPgoLnS9WSDEfit
         Ld8HLYoN6W9DrfhO+qnzCXuXenuwH/vKvf6GlsaJ+qm5Bmk8qi9SCI8zLOgPKKKr9AZ4
         kIUA/fjkXqzew072/jUFBrq3+/cBxXxiV9EsvBNgvmHcnwNMVOS1LOQSleuoS0hpRF6X
         ar/QzwxDS9BSaXu3Lc26t2cCjTxQsrmxrnj5rCk9QluFYsiBHwelfnPL+VDTpQf6uwIs
         gjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0DoTFLuPBX53nv/HEGmzwjc1YbD48/c6/4hSBexkMSA=;
        b=DmUjy58bC4EietZ5aOhPu1Jq/gw4lISFOSVTCv+dnPkjYSPaUlYliGuD7mJM02GjsL
         P7lUSJEZyoZ5dTFNQhBDP97W0UhXM22X9NIlRpMivsiZ2egaIbmPVrqCHCS2e/C2vj81
         jn2wMTLTqsHxwJj78ngV4Re7psPWqrfK2+KE/eoSvg3I/mpMFNabvjMK95Zh1njKN3Je
         kkwVBJSbMK5VxhcBPPOM38IGI8WExkKsvTdd5BscAkmmolkVYUkJk1vZksQM4kW0MrZ5
         vzO8rKHnVbFpvrV2hkn641c+bY2o8Gi8tMa1tT1zSknyZoR95Wh16rrjUFdiVtH+T2es
         XBJA==
X-Gm-Message-State: AOAM530Y4kSjwmpD8O51tZIibNWbUqzkdZ078BDxr4eYMyHbb5kM/C1b
	ak4vrhPijREBh4bd3WGoeq0QxnmlDfNWFg==
X-Google-Smtp-Source: ABdhPJyiCa4x0jJHo62nm5mWnHtKURltfycXVe111c0NIgu0FASiO8c7DPG5SZH6WUvffXPfVbjYXA==
X-Received: by 2002:aa7:cd19:: with SMTP id b25mr1470803edw.84.1622756352575;
        Thu, 03 Jun 2021 14:39:12 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f11f861d707ea86d7bc33dd.dip0.t-ipconnect.de. [2003:f0:7f11:f861:d707:ea86:d7bc:33dd])
        by smtp.gmail.com with ESMTPSA id n18sm1998492ejx.41.2021.06.03.14.39.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 14:39:12 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] poppler: upgrade 21.06.0 -> 21.06.1
Date: Thu,  3 Jun 2021 23:39:03 +0200
Message-Id: <20210603213903.2526389-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This came in right after 21.06.0 and fixes a regression just introduced:

Release 21.06.1
glib:
 * fix poppler_rectangle_free() regression. Issue #1087

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../poppler/{poppler_21.06.0.bb => poppler_21.06.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_21.06.0.bb => poppler_21.06.1.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler_21.06.0.bb b/meta-oe/recipes-support/poppler/poppler_21.06.1.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_21.06.0.bb
rename to meta-oe/recipes-support/poppler/poppler_21.06.1.bb
index 90fd8f87f..6b6a2a133 100644
--- a/meta-oe/recipes-support/poppler/poppler_21.06.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_21.06.1.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            "
-SRC_URI[sha256sum] = "4b440708eafdf07a1405e06744c66ac54a5af51a0e38ab17a46fbaff47278342"
+SRC_URI[sha256sum] = "86b09e5a02de40081a3916ef8711c5128eaf4b1fc59d5f87d0ec66f04f595db4"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.31.1

