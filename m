Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.8797.1591356500863110923
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jun 2020 04:28:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bgmjs1ss;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id c35so7190783edf.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Jun 2020 04:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+mPoZMGQhEN8ExzCUPrtEVgu6JsbhUrNUuK+Bxc2vs4=;
        b=bgmjs1ssNQEbJPf+VzcfUnohNlOJzgWkAHZKKHdU8cWViDyO+i2NdotzBMTQ6KGgpb
         YqbrPzTyvOWM5S+5oteJOvBW5jU/9YFwgb4+g3uH39it58M3nXJ4Y9LWxQ+DI2y+S/kr
         +9nwjVlRiqS1ZqmiFk7PCP5XCgeiUoxNA3j/MGwAlVyYeF2A9icmufR35254hLyRr7Lq
         x0xCtiHwMvONd3WWNfs6d0aTS7i9XkwBsQu4zT9wWzh7SEYAfeb3w/Cdp+rWIoLCk7Uv
         Z/t8DE2a7ylBWl3vBV1tghrc32lCcnu06zmH7nduupDRUzQEnzm9Lde4okAV//t6v99y
         QXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+mPoZMGQhEN8ExzCUPrtEVgu6JsbhUrNUuK+Bxc2vs4=;
        b=SG9+fc0ErZzXueZaBUZx0ji+Iek9vdfk/2L1Q9KzU428UU5ubpFp+25ouEuuESaZJk
         QkTpMW+QBPKRGIrFo5awpCWrvT0ahYjYlJTDDhC7mq79JGhKTbkSqE934gKc93kpHiPF
         QutjLB14KcX5osZxtMHECkm5P9aDphNhFinjVP2n08OpJgUrIgVpoC91ijD+I4yO6KM4
         mDgOEq5arrJuP3pBixGkTKc75Nu7h19E91/XvyYppyJ+0qJzj51K74LPfPjw/t/DQr1/
         pj4xm+LuzCaxGkNVG23acuvzQic0vLRqhxMfOleM1HudHT74XuWsjbT9MStKyPxJIszq
         LWhQ==
X-Gm-Message-State: AOAM531BjEuAnZTuzP44mUtwvcRe204fhvNl+LrnLNwTzIUFXC2BoXK5
	sYOqVc1QEXHxk2RidDZNDbMqcncA
X-Google-Smtp-Source: ABdhPJzS9TyWMxl8afcxXbfAbsOmXdm0o8Pesn/ItpRCCLiXKZ8zV0XnBDGPdvq0kkzEGW4ekzTCtQ==
X-Received: by 2002:aa7:d2d9:: with SMTP id k25mr5217041edr.43.1591356498832;
        Fri, 05 Jun 2020 04:28:18 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0816493dd1634773746530.dip0.t-ipconnect.de. [2003:f0:7f08:1649:3dd1:6347:7374:6530])
        by smtp.gmail.com with ESMTPSA id 63sm4391444edm.48.2020.06.05.04.28.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 04:28:18 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/3] poppler: upgrade 0.88.0 -> 0.89.0
Date: Fri,  5 Jun 2020 13:28:07 +0200
Message-Id: <20200605112808.220963-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200605112808.220963-1-schnitzeltony@gmail.com>
References: <20200605112808.220963-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../poppler/{poppler_0.88.0.bb => poppler_0.89.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_0.88.0.bb => poppler_0.89.0.bb} (93%)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.88.0.bb b/meta-oe/recipes-support/poppler/poppler_0.89.0.bb
similarity index 93%
rename from meta-oe/recipes-support/poppler/poppler_0.88.0.bb
rename to meta-oe/recipes-support/poppler/poppler_0.89.0.bb
index d6a27f923..f8b7c075a 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.88.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.89.0.bb
@@ -7,8 +7,8 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            "
-SRC_URI[md5sum] = "d9aafddce4c079c9ebc7405e42ac25ba"
-SRC_URI[sha256sum] = "b4453804e9a5a519e6ceee0ac8f5efc229e3b0bf70419263c239124474d256c7"
+SRC_URI[md5sum] = "92ac57f60ae8c3a1f8bfe01c9530b7b5"
+SRC_URI[sha256sum] = "fba230364537782cc5d43b08d693ef69c36586286349683c7b127156a8ef9b5c"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.26.2

