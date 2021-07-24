Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web09.8697.1627145999726864997
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Jul 2021 09:59:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RaXc5Bvx;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id m1so6767493pjv.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jul 2021 09:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rRDst6infKBC5/zhorUKNlDLCRHXVdbipeN97OhGH1U=;
        b=RaXc5BvxvJMji/gE8zfoHJplk3w/lVbvgYLrhdqEAWDr+8y3rc6B/7I+dABXASHUDf
         dnM/eCoLa6mrFHdu7Rcbcc5J1yUAJlv4izLN+znYOr90oDlB0oeurzcay1ggZxJd6+yQ
         NRsASvfmjKnYMGkaXMmHwNqH2K91zC8JhtXy2q2uRImFTBlGMF2taxAFwWyviWR6EyCm
         ensYSpHYxravSMVevxaklYkkXNe+s14UTamjv5fUd69VZPsQQ+P2b286IwSLzGUh+yrL
         L6FchRbokcGTPpGrA0IOA5M1tnpN02xeX/4O4oEe7Eegan/BoHstB9G81xVsgAEtSsAt
         VGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rRDst6infKBC5/zhorUKNlDLCRHXVdbipeN97OhGH1U=;
        b=GsAYBnrje4gxDmfGphNXm8MM/0HmzRQ0AM6oI4+ZlLGlFi4PvAsecqAOXGqlwvNv9o
         qiyPLiyulml71x7dVBfs/ISl2TcMP56qrjfZG5MAH1lVjcOQOdWK27fAKtp/iSs7+255
         OKKm/P1uLNgKiZsZhufoO197uwWMMXU3EyaMysOBoQDeIvrwiL5B1clro6p2OIIxso0c
         /N9vJAnWjcLB7D0yDhrT63xzGux7kuFPhIkQGRJjYh1l9cBtnI97MR/EVHAkVWbpP0gi
         cn1V93usbj0IsOeBNZw5AlnPjgDFfvIjjEszf5Ji8X4vtK9xO+yayQk4tDldihUSxQ4A
         S7Lw==
X-Gm-Message-State: AOAM5334IEa6ouIK3m6BLOS8TcvMh6sRi35V269AonuinIPM7EFjSy1T
	d1p0oh8ATA7y3pPJqPaLtxf8/aIIbzP+fg==
X-Google-Smtp-Source: ABdhPJx5Q/06cZ8n4/ekNzQeyyGlhqbD4//10gVeASd0pXPle8vLefWKYGnXKCRjhAerKh7XTXc/YQ==
X-Received: by 2002:a62:b615:0:b029:34a:3920:a7ea with SMTP id j21-20020a62b6150000b029034a3920a7eamr9909980pff.21.1627145998810;
        Sat, 24 Jul 2021 09:59:58 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:734d:6ce:6223:58e4])
        by smtp.gmail.com with ESMTPSA id n22sm37126226pff.57.2021.07.24.09.59.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 09:59:58 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [[meta-webserver][hardknott]] hiawatha: fix url.
Date: Sat, 24 Jul 2021 09:59:57 -0700
Message-Id: <20210724165957.854316-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

files moved under a new dir structure.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-webserver/recipes-httpd/hiawatha/hiawatha_10.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.11.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.11.bb
index 89910841f6..f0be75f5d3 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.11.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.11.bb
@@ -6,7 +6,7 @@ DEPENDS = "libxml2 libxslt virtual/crypt"
 
 SECTION = "net"
 
-SRC_URI = "http://hiawatha-webserver.org/files/${BP}.tar.gz \
+SRC_URI = "http://hiawatha-webserver.org/files/hiawatha-10/${BP}.tar.gz \
            file://hiawatha-init \
            file://hiawatha.service "
 
-- 
2.25.1

