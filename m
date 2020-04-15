Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.10638.1586938984306123810
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2020 01:23:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SvITZE6N;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id y24so17820834wma.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2020 01:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eOREuNTbJKDzBlWRt1g005j3HEd13t0qTWZYjux6mc0=;
        b=SvITZE6Ne4pL3UE4CRn6K+3LdOXs0ppy9xI6SkyGOrioF1sgyKJhPoB1Z01maUe9l8
         5lNuqa/jrkm+aNyxXFqG7h55eUfjvv+jeEzC1NlXMCTo1bZ0zZ3E6ikyatr1JbrixV3g
         YpXvnk13A0KJUFPrxHnLs2gImcx/HdcgxBCKRAS3J6h3XUJif12R5B3AgFcChBQAyXd/
         RpeMM9WDMHVqQXL80UXwa3MUfRTxGnpybZ3EBRlcps3qdG+0eDcyl+krqFsr6zxZD3wx
         DpbUQR3xqVlaln1AtGxJj/V9wSUrnLYz1n2rYkhjpgveXrXEYGJx9OHePw4MHqxzDn1i
         DlfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eOREuNTbJKDzBlWRt1g005j3HEd13t0qTWZYjux6mc0=;
        b=B5Jx5NF3yp3L8lEaACnocueQ1o0nta8YsLDps4jUaGHqRf4jcDAKVun33D5Ft2QsGL
         kLz4Sg/PjJZTYpkd0aAzMnTjyfI3tuwarq37bMO/HIB7JTXFTeXe4WKEL4iFGnCIhMPy
         0UX+yxrm9rAPgK8vvkUjm0qllFRa0ccwW3piHYuEdUS+3Y4YU75VpsOVhEPweVZDZu2U
         WAOq+wwIhvcnrEgNnam8vXuhKMcVQkzA06uAwWW2pIgUSASlIXodLDjeX5lQ6+sh6Q6F
         rneC3lLuERYoXUNw3PSpmbQJPge0EJy5MPrQB+GMNsAIDhjYJMx3O75eC6LXDm+8vcxL
         VxHQ==
X-Gm-Message-State: AGi0PubOIHA1SrWe6du6VfWbDDII/W+fIwsFMpPoq91GXkuOSLu+QlCz
	3hwH461KgMy6eins6MLzILIJCKEQrNQ=
X-Google-Smtp-Source: APiQypKTjcTkTAZKWtsDbyKPo27hkjc/2dO2qWbJvSyXUSJFKKFWTTmKhdyro6UI403A86V8zmbohg==
X-Received: by 2002:a7b:c74d:: with SMTP id w13mr3844166wmk.36.1586938982579;
        Wed, 15 Apr 2020 01:23:02 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id p5sm24431196wrg.49.2020.04.15.01.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 01:23:01 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] lapack: use git fetcher
Date: Wed, 15 Apr 2020 10:22:59 +0200
Message-Id: <20200415082259.29469-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* fixes:
  ERROR: lapack-3.9.0-r0 do_package_qa: QA Issue: lapack: SRC_URI uses unstable GitHub archives [src-uri-bad]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/lapack/lapack_3.9.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/lapack/lapack_3.9.0.bb b/meta-oe/recipes-devtools/lapack/lapack_3.9.0.bb
index 56c01c533d..62d4df5e09 100644
--- a/meta-oe/recipes-devtools/lapack/lapack_3.9.0.bb
+++ b/meta-oe/recipes-devtools/lapack/lapack_3.9.0.bb
@@ -13,9 +13,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=930f8aa500a47c7dab0f8efb5a1c9a40"
 
 DEPENDS = "libgfortran"
 
-SRC_URI = "https://github.com/Reference-LAPACK/lapack/archive/v${PV}.tar.gz"
-SRC_URI[md5sum] = "0b251e2a8d5f949f99b50dd5e2200ee2"
-SRC_URI[sha256sum] = "106087f1bb5f46afdfba7f569d0cbe23dacb9a07cd24733765a0e89dbe1ad573"
+SRCREV = "6acc99d5f39130be7cec00fb835606042101a970"
+SRC_URI = "git://github.com/Reference-LAPACK/lapack.git;protocol=https"
+S = "${WORKDIR}/git"
 
 EXTRA_OECMAKE = " -DBUILD_SHARED_LIBS=ON "
 OECMAKE_GENERATOR = "Unix Makefiles"
-- 
2.25.1

