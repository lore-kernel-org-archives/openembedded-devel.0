Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.919.1632338544788301000
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J/Igixhv;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id on12-20020a17090b1d0c00b001997c60aa29so4378484pjb.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1abG34TCXJDDSVaie723L0RkDzjwZg0ixmq1BIFTFfU=;
        b=J/IgixhvrxY2a+AVD3uaOlGJh3q+qK5q2du2LZoRUAcnrDXmHHKqwJ1G9IA8oqsjJZ
         qoh3qHciPohzP9ElHRyECn1UsAuUkBtFmyKGTCkCuSQ6CX2P+ht8M6+0/ACkjiVTr1im
         IZ66jvsXqHH7k0oF6SxymrsCbgT8UPzwHRRWlHeFlkZ1WA91o5BmS/zGplY1aY+2+vui
         c7ONwr7i+oWTuhQeT6EOsBBeHziNmxjuTwZvkC+sdfawG9sUr+M7h525mWyEX/pcFzWg
         zd+53Vkfj1RCWdKx/zr2pNxOoKFyRoqBHkvv44Kl1YE9m+qe6YbibpNv2H5t3gXn7Q74
         XUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1abG34TCXJDDSVaie723L0RkDzjwZg0ixmq1BIFTFfU=;
        b=uMmfYSeB2XX9L+GAf/4qDQ5W0CHxatgkeGVJMCj8tI56y7owZLjxautrH0kqqHVvoo
         fL1GNiJ7X+Em+wqOJWPUNG6OHOYvDhx6dRJSESnUlcYjmCcazNbxmS0yA+4xw+jV3Flc
         C3x0DICkIFYLb/WIK4+hbYoDXRBVugaTyFRm/XsAwUp5z/AI+rVOuda/Mr6UTcA70b+j
         4BKbzbkJNaWAGcur4n4NU4g8uooM+3+AVb93y0D7vlC73Oor6Oipw9a3jVgY5vPtJeOI
         OxiPvpENafxDq7Fjd+z1i357C/U6AVxC/O2OBHHDWh7Nu4JW+CfUh4bdgs8fRnFi+8wb
         EBkw==
X-Gm-Message-State: AOAM531RxvfqM5IjftcEBwplhn+NbRqCJxw+XuDF6p9D9aS4rPI7OGwk
	C89dzAQYuuPmQ61x/+SkpTWSfJ3gFjD2Sg==
X-Google-Smtp-Source: ABdhPJwSqy0m2XDHD06Yqj0HH0xMmau43yd4lroowrlcch6viogVs01NpD9BGw9yGdGeS6FMBWj4Vw==
X-Received: by 2002:a17:90b:1c08:: with SMTP id oc8mr754719pjb.138.1632338544142;
        Wed, 22 Sep 2021 12:22:24 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:23 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 10/39] dlt-daemon: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:21:44 -0700
Message-Id: <20210922192213.3062719-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
  TOPDIR/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/dlt-daemon/2.18.7-r0/recipe-sysroot-native/usr/share/cmake-3.21/Modules/FindPkgConfig.cmake:70 (find_package_handle_standard_args)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.7.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.7.bb
index 94df015068..6b906a21c3 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.7.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.7.bb
@@ -43,7 +43,7 @@ PACKAGECONFIG[dlt-adaptor] = "-DWITH_DLT_ADAPTOR=ON,-DWITH_DLT_ADAPTOR=OFF,,dlt-
 PACKAGECONFIG[dlt-filetransfer] = "-DWITH_DLT_FILETRANSFER=ON,-DWITH_DLT_FILETRANSFER=OFF"
 PACKAGECONFIG[dlt-console] = "-DWITH_DLT_CONSOLE=ON,-DWITH_DLT_CONSOLE=OFF,,dlt-daemon-systemd"
 
-inherit autotools gettext cmake systemd
+inherit autotools gettext cmake pkgconfig systemd
 
 EXTRA_OECMAKE += "-DWITH_EXTENDED_FILTERING=ON -DSYSTEMD_UNITDIR=${systemd_system_unitdir}"
 
-- 
2.33.0

